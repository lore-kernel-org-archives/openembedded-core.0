Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7113.1603080240718991158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 21:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=O9FNNYUM;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 0119220B9C34; Sun, 18 Oct 2020 21:03:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0119220B9C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603080240;
	bh=Yv7/uSgOvMrfYQV8r4RT1OOIu6tmkMOK3+sHikGrWBw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O9FNNYUMDHG0WNSxkkOXhjbOyLLgLeOtQhsw0myDE5qwsH2iwTE+mtBwSmmzXxdYJ
	 B4hAmCoNSjpKUzHPiem3a7sJwsR8eoCawLOsd0159ncZv2zVKXlZmLvfoptoeEZEz6
	 Ixf0MXeYlJ8vmCxvPgYPevFUjcodvcX19BujHSaI=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/2] classes/buildhistory: also save recipe info for native recipes
Date: Sun, 18 Oct 2020 21:03:57 -0700
Message-Id: <91068e23807dd135ee2bd5b57d87edd9338e89f5.1603080016.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

If we want to also collect SRC_URI for native recipes we need to ensure
that the code that writes out all of the recipe info is called - there
isn't a do_packagedata for native recipes so we need to piggyback on
do_populate_sysroot instead.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/buildhistory.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7d5e3eb..6d04d8c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -90,8 +90,7 @@ buildhistory_emit_sysroot() {
 python buildhistory_emit_pkghistory() {
     if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
         bb.build.exec_func("buildhistory_emit_sysroot", d)
-
-    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
+    elif not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
         return 0
 
     if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
@@ -229,8 +228,9 @@ python buildhistory_emit_pkghistory() {
                     break
     except IOError as e:
         if e.errno == errno.ENOENT:
-            # Probably a -cross recipe, just ignore
-            return 0
+            if not bb.data.inherits_class('native', d):
+                # Probably a -cross recipe, just ignore
+                return 0
         else:
             raise
 
-- 
1.8.3.1

