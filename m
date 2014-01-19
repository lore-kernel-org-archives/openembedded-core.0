Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 713346DB6F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 15:23:40 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so2204714eek.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 07:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to;
	bh=x/pyrVO4MGY+SCJu9qOBz7gjhl68kc1q1fe/Y5yQ5bA=;
	b=GubfPGzZ1Kg6Q51INQbuW7rP1oFM7Q3WIb/9tQw3DS/n6Cz32IjNUqHGRjTo2c4yPq
	e6Do93p7ZdSN5uUKOy1fMCpTxzae/RKRew6n+MmZ+RpwjLcE2DqrLzD40MAFFU/jfnpx
	RPeyFNcgX/Y9wpTiRgjlImCvPeKlL4J1SuxCEFN+ZtbveWGiKdDlCjm2uFXve774C++5
	qjTFGmHB8Ur7m9fxUEUU+WGKQWjdW7xEc/q0WMPsf/c1H0oWHlFxdJ0OJ/1lfsiDeX/q
	uGydyhXlDUV7oMZ+v+ok1o06kS/a5xS9eDgTjt+jonoiVJEKlx2t+dlLZzuAl5r6YN7l
	/flg==
X-Received: by 10.14.122.5 with SMTP id s5mr13022171eeh.28.1390145020676;
	Sun, 19 Jan 2014 07:23:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x45sm44439034eee.3.2014.01.19.07.23.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 07:23:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2014 16:23:35 +0100
Message-Id: <6b2c74bfb8b8a787273dc0a2f75ddc91573d1c8b.1390144972.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1390142552.2467.48.camel@e130.pbcl.net>
Subject: [PATCHv2 3/5] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
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
X-List-Received-Date: Sun, 19 Jan 2014 15:23:40 -0000

* when package contains some files matching "^.*\.so", but in directory
  not default linker search paths (e.g. /opt/package/bundled-lib/libfoo.so)
  don't register it as libfoo provider, because it's possible that there
  is different package providing libfoo.so in ${libdir} and that would
  be better shlib provider for other packages to depend on
* recipes providing libs intentionally in some other directory can
  define own SHLIBSSEARCHDIRS value

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9b511a6..a9e32f2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1322,6 +1322,9 @@ python package_do_filedeps() {
 SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs"
 SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs"
 
+# default search path when searching for shlibs provided by package
+SHLIBSSEARCHDIRS ?= "${baselib} ${libdir}"
+
 python package_do_shlibs() {
     import re, pipes
 
@@ -1332,6 +1335,20 @@ python package_do_shlibs() {
 
     lib_re = re.compile("^.*\.so")
     libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
+    
+    shlibs_search_dirs = d.getVar('SHLIBSSEARCHDIRS', True)
+    shlibs_search_dirs_re_txt = ""
+    for dir in shlibs_search_dirs.split(' '):
+        # strip leading and trailing slash, it's added in regexp
+        if dir.endswith("/"):
+            dir = dir[:-1]
+        if dir.startswith("/"):
+            dir = dir[1:]
+        if shlibs_search_dirs_re_txt:
+            shlibs_search_dirs_re_txt += "|"
+        shlibs_search_dirs_re_txt += "(^.*/%s/.*$)" % dir
+    shlibs_search_dirs_re = re.compile(shlibs_search_dirs_re_txt)
+    bb.debug(2, "will use following RE to search for provides sonames %s" % shlibs_search_dirs_re_txt)
 
     packages = d.getVar('PACKAGES', True)
     targetos = d.getVar('TARGET_OS', True)
@@ -1390,9 +1407,12 @@ python package_do_shlibs() {
             if m:
                 this_soname = m.group(1)
                 if not this_soname in sonames:
-                    # if library is private (only used by package) then do not build shlib for it
-                    if not private_libs or -1 == private_libs.find(this_soname):
-                        sonames.append(this_soname)
+                    if shlibs_search_dirs_re.match(file):
+                        # if library is private (only used by package) then do not build shlib for it
+                        if not private_libs or -1 == private_libs.find(this_soname):
+                            sonames.append(this_soname)
+                    else:
+                        bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
                 if snap_symlinks and (os.path.basename(file) != this_soname):
-- 
1.8.5.2


