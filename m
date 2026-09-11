Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CE3C79FA1
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 07:19:22 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34248.1789111157637123283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 00:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=eu+AyAeL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-664519-2026091107013730bd690f01000207cb-_qt9hm@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026091107013730bd690f01000207cb
        for <openembedded-core@lists.openembedded.org>;
        Fri, 11 Sep 2026 09:19:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KaUMPPE3BldJLqQssWE9YVg3FFmnSrlZpGMco6bMZfk=;
 b=eu+AyAeLCPUjHAYw7y8f0NUJAqTTBD53X4Fki++Nh9OGxSSoL0l7ajCagcgMgWxQjrunUW
 I2GBuFPqz7N6mqn/AuyA36qSZZaRnYPOTofe/tLnAHHK3CFMjzEobq+o3T2yLs8c3vh2r54n
 u3TglXLaz7zZ77JLOTZUH5qEySpNue/J+jvh9HQW595kZXZgoBIS28fNRZVRTpwADCh00ps6
 hwu7UinuJDD0sgWv7WQz+IM5k60bidJCe6HOoSx1fm+p8RB/hyb0lknfy9dvCX71pY8Okw9K
 Tc8+0OLiGW8WHtVlMuuRkcnvirFMOZifdK8lWWwpPCCcTwZl+FYrGxDg==;
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: zhanxusheng@xiaomi.com,
	adrian.freihofer@siemens.com,
	peter.marko@siemens.com,
	Michael Haener <michael.haener@siemens.com>
Subject: [PATCH v3] sstate: fix access to a cached object rewriting its modification time
Date: Fri, 11 Sep 2026 09:01:21 +0200
Message-Id: <20260911070121.39436-1-michael.haener@siemens.com>
In-Reply-To: <20260910211821.48424-1-michael.haener@siemens.com>
References: <20260910211821.48424-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245617

Marking an object in the sstate cache as in use is done with a plain
touch, which writes the modification time along with the access time.
Every build that merely reads an object therefore makes it look newly
created.

scripts/sstate-cache-management.py --remove-duplicated keeps the entry
with the newest modification time. As every use rewrites it, building an
older configuration last keeps its object and removes the newer one.

Refresh only the access time and leave the modification time alone. The
modification time then tells when an object was created, the access time
when it was last used.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Reviewed-by: Peter Marko <peter.marko@siemens.com>
---
v3 (after review by Zhan Xusheng):
- restored the original error handling: PermissionError and EROFS are
  ignored, everything else propagates as before
- use os.utime(ns=...) to round trip the modification time exactly
- replaced the vague motivation with the concrete effect on
  sstate-cache-management.py --remove-duplicated

v2:
- dropped SSTATE_ATIME_UPDATE_AFTER, refreshing only the access time is now
  unconditional
- renamed the helper to sstate_touch_atime()
- reduced the scope to the timestamp fix

 meta/classes-global/sstate.bbclass | 39 ++++++++++++++++++------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index b2fa93650a..76544eb954 100644
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
 
@@ -936,13 +931,27 @@ sstate_unpack_package () {
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
+    import errno
+    import time
+    try:
+        stat_info = os.stat(path)
+        # nanoseconds avoid shifting the modification time through float rounding
+        os.utime(path, ns=(time.time_ns(), stat_info.st_mtime_ns))
+    except PermissionError:
+        pass
+    except OSError as e:
+        # Handle read-only file systems gracefully
+        if e.errno != errno.EROFS:
+            raise e
+
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     import itertools
 
@@ -978,10 +987,10 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
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
@@ -1223,7 +1232,7 @@ python sstate_eventhandler() {
         if not os.path.exists(siginfo):
             bb.siggen.dump_this_task(siginfo, d)
         else:
-            oe.utils.touch(siginfo)
+            sstate_touch_atime(siginfo)
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
-- 
2.34.1


