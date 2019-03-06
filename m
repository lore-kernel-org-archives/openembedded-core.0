Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id D2AB97C66D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:32:38 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id v2so10424157ith.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G5zxgLz09wAnFNESJx8isCr86Va/ToGc6843m7E3mX0=;
	b=VkkxCVq9N+XbPCOP90DiuePAk9Q4zAswlxqq/l1KmjRyqahfqhkjYK8ns5Km2MGNPX
	GxrPKPxMvlHc6jN4CwhQFhu66E0I7gfNgzJLYnmLMHCM3vafF9NsrJTscfEimCncZWwu
	xFbhPnusYIbgIdfvGVizTHpOzJ1K0i9Zsu/aXHQI68X3zGxdrHMZZBfk0BDRStLDwe7T
	TwT1tFfpuWi6+mOavY8vhwbrFfYan0VLj1Huzcp5Hqm8pMDO0DG79Z4+cu+YDvtU9Px/
	mM2NKM7F5+91ZD5rbkazH/TKLTauXcYBzDKRS0bpd8uG939Aaj+pK9fT72xk8lSedvLf
	1smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G5zxgLz09wAnFNESJx8isCr86Va/ToGc6843m7E3mX0=;
	b=GeSYORQrwPBhKrISqOJ6ya/QkmAQrQX5z+LC7zk2pay6rvHEsS7qhsZk8vrcsiydvo
	vmv4mKpgAzIQnVKp16yl5lF2nUWyMKGO/xJSZfqYdCi4Ondw/T/MDE6ZP+kNSwrbFnu9
	yjjJ/EPFCsbc+w0PWPb3DEFWbepRtoA1LF4hGNgR+8NCfhnV9nlBlyTaF+7cF4aiEJJQ
	p+dd+cP9X9OBeBuglfWiwJxvrIGDUOlF1v//QWdBzg5fkpCwXIcZyhdDXFS6pnuMrokt
	TiGj59QFciGwT1LB0ySbJrjPM+b3t0p6dc4ljRcxlUc8Pr5fMj7tdi+A9y3d1tZ8OG0d
	2NSg==
X-Gm-Message-State: APjAAAUs/8gkG5k9UsSsB6ZFMlRMV00dqYLLpA7DmxRR9UxND4ra/aI4
	xrcVqr26N1eH0Tb1mXfJPKPt7gyK
X-Google-Smtp-Source: APXvYqzFi5XW7v0b1vKcudE/U/iakthwpI0h5fk8O9kR/wExWvDCliKxcKc8SupYX5W4B3v3wH30WA==
X-Received: by 2002:a24:2946:: with SMTP id p67mr2604168itp.114.1551889959304; 
	Wed, 06 Mar 2019 08:32:39 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id q17sm804159ior.71.2019.03.06.08.32.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Mar 2019 08:32:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 10:32:30 -0600
Message-Id: <20190306163230.26042-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190305024514.14753-1-JPEWhacker@gmail.com>
References: <20190305024514.14753-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] Add source package to ${PACKAGES}
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
X-List-Received-Date: Wed, 06 Mar 2019 16:32:39 -0000
Content-Transfer-Encoding: 8bit

Permanently adds the -src source package to ${PACKAGES} instead of
relying on creating it dynamically at packaging time. The source package
is now defined in bitbake.conf, just like -dev and -dbg packages.

For compatibility, the -src package is still added dynamically if it was
missing, since some recipes have a tendency to completely override
PACKAGES and do so without manually adding back the -src package.

This allows RDEPENDS on the -src packages, which wasn't previously
possible.

[YOCTO #13203]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 28 +++++++++++++++-------------
 meta/conf/bitbake.conf       | 11 ++++++++++-
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 749c7d9ea14..4c0a8595363 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1128,7 +1128,7 @@ python populate_packages () {
     workdir = d.getVar('WORKDIR')
     outdir = d.getVar('DEPLOY_DIR')
     dvar = d.getVar('PKGD')
-    packages = d.getVar('PACKAGES')
+    packages = d.getVar('PACKAGES').split()
     pn = d.getVar('PN')
 
     bb.utils.mkdirhier(outdir)
@@ -1138,32 +1138,34 @@ python populate_packages () {
 
     split_source_package = (d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg')
 
-    # If debug-with-srcpkg mode is enabled then the src package is added
-    # into the package list and the source directory as its main content
+    # If debug-with-srcpkg mode is enabled then add the source package if it
+    # doesn't exist and add the source file contents to the source package.
     if split_source_package:
         src_package_name = ('%s-src' % d.getVar('PN'))
-        packages += (' ' + src_package_name)
+        if not src_package_name in packages:
+            packages.append(src_package_name)
         d.setVar('FILES_%s' % src_package_name, '/usr/src/debug')
 
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastructure
     package_dict = {}
 
-    for i, pkg in enumerate(packages.split()):
+    for i, pkg in enumerate(packages):
         if pkg in package_dict:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
             package_qa_handle_error("packages-list", msg, d)
-        # If debug-with-srcpkg mode is enabled then the src package will have
-        # priority over dbg package when assigning the files.
-        # This allows src package to include source files and remove them from dbg.
-        elif split_source_package and pkg.endswith("-src"):
+        # Ensure the source package gets the chance to pick up the source files
+        # before the debug package by ordering it first in PACKAGES. Whether it
+        # actually picks up any source files is controlled by
+        # PACKAGE_DEBUG_SPLIT_STYLE.
+        elif pkg.endswith("-src"):
             package_dict[pkg] = (10, i)
         elif autodebug and pkg.endswith("-dbg"):
             package_dict[pkg] = (30, i)
         else:
             package_dict[pkg] = (50, i)
-    package_list = sorted(package_dict.keys(), key=package_dict.get)
-    d.setVar('PACKAGES', ' '.join(package_list))
+    packages = sorted(package_dict.keys(), key=package_dict.get)
+    d.setVar('PACKAGES', ' '.join(packages))
     pkgdest = d.getVar('PKGDEST')
 
     seen = []
@@ -1181,7 +1183,7 @@ python populate_packages () {
             if "/.debug/" in path or path.endswith("/.debug"):
                 debug.append(path)
 
-    for pkg in package_list:
+    for pkg in packages:
         root = os.path.join(pkgdest, pkg)
         bb.utils.mkdirhier(root)
 
@@ -1252,7 +1254,7 @@ python populate_packages () {
 
     # Handle LICENSE_EXCLUSION
     package_list = []
-    for pkg in packages.split():
+    for pkg in packages:
         if d.getVar('LICENSE_EXCLUSION-' + pkg):
             msg = "%s has an incompatible license. Excluding from packaging." % pkg
             package_qa_handle_error("incompatible-license", msg, d)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f1540a0acf7..8fc4e9bc1a8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -237,6 +237,10 @@ DESCRIPTION ?= "${SUMMARY}."
 #SUMMARY_${PN} ?= "${SUMMARY}"
 #DESCRIPTION_${PN} ?= "${DESCRIPTION}"
 
+SUMMARY_${PN}-src ?= "${SUMMARY} - Source files"
+DESCRIPTION_${PN}-src ?= "${DESCRIPTION}  \
+This package contains sources for debugging purposes."
+
 SUMMARY_${PN}-dbg ?= "${SUMMARY} - Debugging files"
 DESCRIPTION_${PN}-dbg ?= "${DESCRIPTION}  \
 This package contains ELF symbols and related sources for debugging purposes."
@@ -285,7 +289,7 @@ SOLIBSDEV_darwin = ".dylibbroken"
 PACKAGE_DEBUG_SPLIT_STYLE ?= "debug-with-srcpkg"
 
 PACKAGE_BEFORE_PN ?= ""
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
+PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
 FILES = ""
 
@@ -324,6 +328,11 @@ FILES_${PN}-dbg = "/usr/lib/debug /usr/src/debug"
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
+# The files list for source packages are dynamically set based on
+# PACKAGE_DEBUG_SPLIT_STYLE
+FILES_${PN}-src = ""
+SECTION_${PN}-src = "devel"
+
 FILES_${PN}-locale = "${datadir}/locale"
 
 # File manifest
-- 
2.20.1


