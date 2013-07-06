Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 471086B090
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:15:50 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e52so2055494eek.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ilU4R6vFFDFvu+GREQKtCk9uaWiLqzTIdslliJgkizI=;
	b=lKg8D1bmZyZSs0ildGPsXopVXK5U6ULX82P3DRmPGfJvbDpow0JPCrmBzGN9BQa18M
	zOxhNv36IgNzs6aOGrRszm/zGtG353fpWy5sbg/0YngoClpiFAEEp5N0YNR2kt6KL02V
	YcxnFtu8JaSZV7Wcbahh5+RolzQ3ZmH0AsN4wORvF1o5c9ca5pZnvQn3jJBqOLFaGXNe
	jsorrl+F52T1IOoQU9OO1LGzE7p0lpMNK+q9yV5kGtQWpVbXWjgyOfOy3RhGVdIR1T7g
	kprtlfS/sYCtdMl5Q62ALx3z7gXOaYsAvSzrxYy5FxSRPSEdmv1foIQ19tWDvraBpNFM
	ImHw==
X-Received: by 10.15.36.72 with SMTP id h48mr12689139eev.33.1373152550418;
	Sat, 06 Jul 2013 16:15:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm27886577eeu.2.2013.07.06.16.15.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:15:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jul 2013 01:15:54 +0200
Message-Id: <1373152554-22840-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130706230840.GE3288@jama>
References: <20130706230840.GE3288@jama>
Subject: [RFC][PATCH] SHLIBSSEARCHDIRS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Jul 2013 23:15:51 -0000

---
 meta/classes/package.bbclass | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3f2deca..55035b5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1322,11 +1322,18 @@ python package_do_shlibs() {
     libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
     
     shlibs_search_dirs = d.getVar('SHLIBSSEARCHDIRS', True)
-    for dir in shlibs_search_dirs:
+    shlibs_search_dirs_re_txt = ""
+    for dir in shlibs_search_dirs.split(' '):
+        # strip leading and trailing slash, it's added in regexp
+        if dir.endswith("/"):
+            dir = dir[:-1]
+        if dir.startswith("/"):
+            dir = dir[1:]
         if shlibs_search_dirs_re:
-            shlibs_search_dirs_re += "\|"
-        shlibs_search_dirs_re += "\(^.*\/%s\/.*$\)" % dir
-    bb.debug(2, "will use following RE to search for provides sonames %s" % shlibs_search_dirs)
+            shlibs_search_dirs_re_txt += "\|"
+        shlibs_search_dirs_re_txt += "\(^.*/%s/.*$\)" % dir
+    shlibs_search_dirs_re = re.compile(shlibs_search_dirs_re_txt)
+    bb.debug(2, "will use following RE to search for provides sonames %s" % shlibs_search_dirs_re_txt)
 
     packages = d.getVar('PACKAGES', True)
     targetos = d.getVar('TARGET_OS', True)
@@ -1389,7 +1396,7 @@ python package_do_shlibs() {
                         if not private_libs or -1 == private_libs.find(this_soname):
                             sonames.append(this_soname)
                     else:
-                        bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, file, shlibs_search_dirs))
+                        bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
                 if snap_symlinks and (os.path.basename(file) != this_soname):
-- 
1.8.2.1


