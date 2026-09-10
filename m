Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93542C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 21:18:41 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25589.1789075112780888906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 14:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=Tzwsiyqf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-664519-20260910211828a153fa9f1e00020792-a9cx99@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260910211828a153fa9f1e00020792
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Sep 2026 23:18:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jyIHgiy1dvV+zMVYvoOigtZzRTAsrFZmtICQEWvnD38=;
 b=Tzwsiyqf+at29QA4AsnZ1m6VD01PlDpQVR3kWmVvYcveKg7eMTMCePS86rPOMYCCdPKv5+
 BTPUDfZ976vcmuOrMJpltQlL/NWO1TRk9FnMy6hV1ltnH1cOqNNjfnmF4WWxGCF7ATAnelyn
 ykvKDVR3Gl4hoqM0cX3BLycZcD1ovpYK9nHIFmaFTdJbM8comwjRRhJu7Mf3piHI/Twc1BDm
 YRSzfJgMs/b6ZF4fdP30Emv44mOohRV3ftpI2/Fg5qHqftvB9tTeuoc0DMmH1l3fiiuqwDDb
 4CvC8BTBqVYlye1FTyXJaOhii/IFTYpB/rpSbjhAeN7gllq6U/0fmefg==;
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] sstate: fix access to a cached object rewriting its modification time
Date: Thu, 10 Sep 2026 23:18:21 +0200
Message-Id: <20260910211821.48424-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 21:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245602

Marking an object in the sstate cache as in use is done with a plain
touch, which writes the modification time along with the access time.
Every build that merely reads an object therefore makes it look newly
created, so its age can no longer be told from the cache itself.

Refresh only the access time and leave the modification time alone. The
modification time then tells when an object was created, the access time
when it was last used.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Reviewed-by: Peter Marko <peter.marko@siemens.com>
---
v2:
- dropped SSTATE_ATIME_UPDATE_AFTER, refreshing only the access time is now
  unconditional
- renamed the helper to sstate_touch_atime()
- reduced the scope to the timestamp fix

 meta/classes-global/sstate.bbclass | 34 +++++++++++++++++-------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index b2fa93650a..921b83d888 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -699,15 +699,7 @@ def sstate_package(ss, d):
     if not os.path.exists(siginfo):
         bb.siggen.dump_this_task(siginfo, d)
     else:
-        try:
-            os.utime(siginfo, None)
-        except PermissionError:
-            pass
-        except OSError as e:
-            # Handle read-only file systems gracefully
-            import errno
-            if e.errno != errno.EROFS:
-                raise e
+        sstate_touch_atime(siginfo)
 
     return
 
@@ -802,7 +794,10 @@ python sstate_create_and_sign_package () {
     # Best effort touch
     def touch(file):
         try:
-            file.touch()
+            if file.exists():
+                sstate_touch_atime(file)
+            else:
+                file.touch()
         except:
             pass
 
@@ -936,13 +931,22 @@ sstate_unpack_package () {
 	# Update both any file and any symlink pointing to the file for sigs as well as the file
 	for file in ${SSTATE_PKG} ${SSTATE_PKG}.sig ${SSTATE_PKG}.siginfo
 	do
-		[ ! -e $file ] || touch $file 2>/dev/null || true
-		[ ! -e $file ] || touch --no-dereference $file 2>/dev/null || true
+		[ ! -e $file ] || touch -a $file 2>/dev/null || true
+		[ ! -e $file ] || touch -a --no-dereference $file 2>/dev/null || true
 	done
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
+def sstate_touch_atime(path):
+    # Refresh the access time and leave the modification time alone.
+    import time
+    try:
+        stat_info = os.stat(path)
+        os.utime(path, (time.time(), stat_info.st_mtime))
+    except OSError:
+        pass
+
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     import itertools
 
@@ -978,10 +982,10 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         sstatefile = d.expand("${SSTATE_DIR}/" + getsstatefile(tid, siginfo, d))
 
         if os.path.exists(sstatefile):
-            oe.utils.touch(sstatefile)
+            sstate_touch_atime(sstatefile)
             for ext in ['.sig', '.siginfo']:
                 if os.path.exists(sstatefile + ext):
-                    oe.utils.touch(sstatefile + ext)
+                    sstate_touch_atime(sstatefile + ext)
             found.add(tid)
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
         else:
@@ -1223,7 +1227,7 @@ python sstate_eventhandler() {
         if not os.path.exists(siginfo):
             bb.siggen.dump_this_task(siginfo, d)
         else:
-            oe.utils.touch(siginfo)
+            sstate_touch_atime(siginfo)
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
-- 
2.34.1


