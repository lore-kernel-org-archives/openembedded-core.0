Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CB8C79FBB
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:22:37 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1860.1788988947541681337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=QVKdj1UF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-664519-20260909212223368f2827a6000207bc-wkbok_@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260909212223368f2827a6000207bc
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:22:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MVLkx6xr90s+rJ/b6QjQxcvkWm5Xz1IYL5zJdji21as=;
 b=QVKdj1UF1zHa8OtFopNQpNEqET19Z8YVaaSLhR8jPKtWpm/b3sV06vb+/XMC8ft/6tUZFY
 5gQ6YOqUQwo3q5DrBgQZIY7Erar6jpCx5H8eFfIxS+7hp8iNEHiqfFf3TuNXoA17pvTvRH0E
 glUv8LMGWZ8JR9mcjCkIWOwV5cOUVq6yqaGqzm25NGI4EfmQK48zzVe9btYc/QpfENCNJCnE
 v0bjwiyJRpD+uTQ6bT4izxRIvOCF5E+G7q6lFydpmhWBcRi31lj8dJXhAEpsmLtsb8l6KUMa
 eQfIAqkP5Wc/BILOvk/AXPGAz/VJhSWVfaTlhaLRpRHo+o2E8MUfp7yQ==;
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] sstate: allow marking a cached object as in use without touching mtime
Date: Wed,  9 Sep 2026 23:22:05 +0200
Message-Id: <20260909212205.50713-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245500

Every access to an object in the sstate cache is recorded with a plain
touch, which writes both the modification time and the access time.

Add SSTATE_ATIME_UPDATE_AFTER. When it is set, the modification time is no
longer written, and the access time is refreshed only once the existing
one is at least that many seconds old.

This reduces the number of write cycles a build causes on the cache, which
matters most where many build servers share one sstate cache: each of them
would otherwise refresh the access time of every object it looks at.

With mtime and atime kept apart, a cache can also be measured for reuse
and age.

When the variable is unset the behaviour is unchanged.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Reviewed-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-global/sstate.bbclass | 59 ++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index b2fa93650a..2141b50881 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -699,19 +699,11 @@ def sstate_package(ss, d):
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
+        sstate_touch(siginfo, d.getVar("SSTATE_ATIME_UPDATE_AFTER"))
 
     return
 
-sstate_package[vardepsexclude] += "SSTATE_SIG_KEY SSTATE_PKG"
+sstate_package[vardepsexclude] += "SSTATE_SIG_KEY SSTATE_PKG SSTATE_ATIME_UPDATE_AFTER"
 
 def pstaging_fetch(sstatefetch, d):
     import bb.fetch
@@ -799,10 +791,15 @@ python sstate_create_and_sign_package () {
     from pathlib import Path
     import errno
 
+    update_after = d.getVar("SSTATE_ATIME_UPDATE_AFTER")
+
     # Best effort touch
     def touch(file):
         try:
-            file.touch()
+            if file.exists():
+                sstate_touch(file, update_after)
+            else:
+                file.touch()
         except:
             pass
 
@@ -933,16 +930,44 @@ sstate_unpack_package () {
 
 	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
 
+	touch_opts=""
+	if [ -n "${SSTATE_ATIME_UPDATE_AFTER}" ]; then
+		# the files below are installed together, so decide once for all of them
+		cutoff=$(date -d "-${SSTATE_ATIME_UPDATE_AFTER} seconds" +%s 2>/dev/null || echo 0)
+		atime=$(stat -c %X ${SSTATE_PKG} 2>/dev/null || echo 0)
+		if [ "$cutoff" -gt 0 ] && [ "$atime" -gt "$cutoff" ]; then
+			return 0
+		fi
+		touch_opts="-a"
+	fi
+
 	# Update both any file and any symlink pointing to the file for sigs as well as the file
 	for file in ${SSTATE_PKG} ${SSTATE_PKG}.sig ${SSTATE_PKG}.siginfo
 	do
-		[ ! -e $file ] || touch $file 2>/dev/null || true
-		[ ! -e $file ] || touch --no-dereference $file 2>/dev/null || true
+		[ ! -e $file ] || touch $touch_opts $file 2>/dev/null || true
+		[ ! -e $file ] || touch $touch_opts --no-dereference $file 2>/dev/null || true
 	done
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
+def sstate_touch(path, minage):
+    # Without minage the modification time is reset along with the access time.
+    # With it, only the access time is refreshed, and only once the existing one
+    # is at least minage seconds old.
+    import time
+    if not minage:
+        oe.utils.touch(path)
+        return
+    try:
+        stat_info = os.stat(path)
+        now = time.time()
+        if now - stat_info.st_atime < float(minage):
+            return
+        os.utime(path, (now, stat_info.st_mtime))
+    except OSError:
+        pass
+
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     import itertools
 
@@ -973,15 +998,17 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         spec, extrapath, tname = getpathcomponents(tid, d)
         return extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d)
 
+    update_after = d.getVar("SSTATE_ATIME_UPDATE_AFTER")
+
     for tid in sq_data['hash']:
 
         sstatefile = d.expand("${SSTATE_DIR}/" + getsstatefile(tid, siginfo, d))
 
         if os.path.exists(sstatefile):
-            oe.utils.touch(sstatefile)
+            sstate_touch(sstatefile, update_after)
             for ext in ['.sig', '.siginfo']:
                 if os.path.exists(sstatefile + ext):
-                    oe.utils.touch(sstatefile + ext)
+                    sstate_touch(sstatefile + ext, update_after)
             found.add(tid)
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
         else:
@@ -1223,7 +1250,7 @@ python sstate_eventhandler() {
         if not os.path.exists(siginfo):
             bb.siggen.dump_this_task(siginfo, d)
         else:
-            oe.utils.touch(siginfo)
+            sstate_touch(siginfo, d.getVar("SSTATE_ATIME_UPDATE_AFTER"))
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
-- 
2.34.1


