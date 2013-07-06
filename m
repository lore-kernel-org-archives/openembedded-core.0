Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id B4DE96B0D5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:13:04 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so2146052eak.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Qz/ydWInp9CBTXZucQY+5PMNTtl+xuwgsX4zYEcW9VM=;
	b=yBXoGVzmUeDo95qmVifU/iQsYJXDuc/BR7YQhlULtqJcPk7w2HrTijUsFM23GWbqIn
	VS7ZMI0RzCJMK6Ulb1+e41/LGyIKoOMSTUlkZM6b0IErNp5+tUyYEr+/tfR/wGp02T1j
	icaezVZrEsQ5U2iqkm1HdxYbWpfSvFgW4CimJDHXi53HJQ547rixOEVBB/HIrLCV4UKH
	A5erO6RADg5aMa/VGLmQJ5rXjSD0rjNt8FAMKSWK2ux90/uzMlIa8E/VbvcUSDdWpVE0
	HeTkUUno7Qp+tQirD+TQhv+sL4IWlTTnl0XxWrrQ/SdWEakcOmNfJmNqBlzHeIcG7cSY
	eYrA==
X-Received: by 10.14.173.70 with SMTP id u46mr18065492eel.92.1373152385502;
	Sat, 06 Jul 2013 16:13:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm27755772eeh.11.2013.07.06.16.13.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:13:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jul 2013 01:13:06 +0200
Message-Id: <1373152387-19393-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 3/4] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
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
X-List-Received-Date: Sat, 06 Jul 2013 23:13:05 -0000

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
index 6c3ca56..3713fd3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1307,6 +1307,9 @@ SHLIBSDIRS = "${@getshlibsdirs(d)}"
 SHLIBSDIR = "${TMPDIR}/pkgdata/${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/shlibs"
 SHLIBSWORKDIR = "${PKGDESTWORK}/shlibs"
 
+# default search path when searching for shlibs provided by package
+SHLIBSSEARCHDIRS ?= "${baselib} ${libdir}"
+
 python package_do_shlibs() {
     import re, pipes
 
@@ -1317,6 +1320,20 @@ python package_do_shlibs() {
 
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
@@ -1375,9 +1392,12 @@ python package_do_shlibs() {
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
1.8.2.1


