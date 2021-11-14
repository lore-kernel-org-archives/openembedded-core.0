Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7C6C433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 06:50:43 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.6544.1636872642307591280
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 22:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OPNPrxXI;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id e11so27747844ljo.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 22:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kp8W0EL/Lz9mgBKmHYi276oVGL7J3jRDIn62D0gNJWc=;
        b=OPNPrxXIb94KOB36o6ZKL8KtDn/q4/YV8LibVm6g+MqrvyWnKDaOMzUqxqpku/Txn/
         bMUvlyL6tTekvd4Ye30Lh3GHeg6ZUd6OhUU0BeuhfY6s3wdKOUEFixCFaXB0RYNSFyCK
         yxwhYqoh5O1IpepGlwRBtGvf0FDrTNv8uQQd8pMXorS+ALDyOJmD3YerkjVBt6ay6Msk
         NHpfpd4DuU5CyFDwd45+TB0P+gQvzgKEGivsirlzaWP4hYfTXTSFbZVwdyoWnbcl1LOm
         ChPY3VV0M2yZbcm+pJ1d3S/uN5Q7SiJYhhqEKo9j5OxzvWZV4EKDaANkLcOoywjmGjI8
         aGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kp8W0EL/Lz9mgBKmHYi276oVGL7J3jRDIn62D0gNJWc=;
        b=IokV77LMWNBjysluGQn1vqysHunPHnyj1alTkYFvmFN/CaTMGFXwWZSqQWcPBu29wt
         xPR16IMlPB0Lr6n9113AODYCGqpzlFnTFT7d3OwERzibc8p0VVArQsMKCPOSAY0IL87o
         lgPbiKTcWWsHCtc/TMd91ZWx9PefQoV+OdaWZK1736vQS5AkgEZ87ii0dYpxw79JB+Fl
         Qt2Cs9pxzt0uC+0xGbDlEuBANC95eCi7lX11V4EpnVhE9OzWGtY6COU04Sc+ZCFfrZU8
         zlc3Hq2Cu/FI0sNRp3T7ilXEs+DcYlh/5zug9FsdYQ+Zd8KxiA0GKJDlZncf6yKFlC40
         hyTA==
X-Gm-Message-State: AOAM533XEISFJtUsyJxO2K2YNp2xfQhmhU6vcUD3OGy/61bsbKYV9KJ8
	1c7GQX0zVKsS8eqdRbLq7lamoq/fd/U=
X-Google-Smtp-Source: 
 ABdhPJyjnzZ5b2cWRBGvm/OdiIj7UzecXYVo/yT15mvQGnuJwmGlEke/Wz6urxjJ14srhXLzj7HnDw==
X-Received: by 2002:a05:651c:112e:: with SMTP id
 e14mr27711738ljo.466.1636872640078;
        Sat, 13 Nov 2021 22:50:40 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 l13sm1170636lfh.270.2021.11.13.22.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 22:50:39 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [hardknott][PATCH] mklibs: remove recipes and class
Date: Sun, 14 Nov 2021 07:50:08 +0100
Message-Id: <20211114065008.3899-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 06:50:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158255

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is not enabled or tested by default, and has never been
ported to python 3 upstream[1], which means it doesn't work at all
with plain poky. If you need it, please put it in a separate layer
and/or modernize to work with py3.

https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 908df863b419d1cad7317153101fc827e7e3a354)
---
 meta/classes/image-mklibs.bbclass             |  56 ----------
 meta/conf/distro/include/maintainers.inc      |   1 -
 meta/conf/local.conf.sample                   |   5 +-
 meta/conf/local.conf.sample.extended          |   9 --
 .../mklibs/files/ac_init_fix.patch            |  19 ----
 ...re-on-symbol-provided-by-application.patch | 103 ------------------
 .../mklibs/files/fix_STT_GNU_IFUNC.patch      |  26 -----
 .../mklibs/files/fix_cross_compile.patch      |  81 --------------
 ...U-unique-symbols-as-provided-symbols.patch |  34 ------
 .../mklibs/files/sysrooted-ldso.patch         |  18 ---
 .../mklibs/mklibs-native_0.1.44.bb            |  22 ----
 11 files changed, 1 insertion(+), 373 deletions(-)
 delete mode 100644 meta/classes/image-mklibs.bbclass
 delete mode 100644 meta/recipes-devtools/mklibs/files/ac_init_fix.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
 delete mode 100644 meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
deleted file mode 100644
index 68e11d4365..0000000000
--- a/meta/classes/image-mklibs.bbclass
+++ /dev/null
@@ -1,56 +0,0 @@
-do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
-
-IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
-
-inherit linuxloader
-
-mklibs_optimize_image_doit() {
-	rm -rf ${WORKDIR}/mklibs
-	mkdir -p ${WORKDIR}/mklibs/dest
-	cd ${IMAGE_ROOTFS}
-	du -bs > ${WORKDIR}/mklibs/du.before.mklibs.txt
-
-	# Build a list of dynamically linked executable ELF files.
-	# Omit libc/libpthread as a special case because it has an interpreter
-	# but is primarily what we intend to strip down.
-	for i in `find . -type f -executable ! -name 'libc-*' ! -name 'libpthread-*'`; do
-		file $i | grep -q ELF || continue
-		${HOST_PREFIX}readelf -l $i | grep -q INTERP || continue
-		echo $i
-	done > ${WORKDIR}/mklibs/executables.list
-
-	dynamic_loader=${@get_linuxloader(d)}
-
-	mklibs -v \
-		--ldlib ${dynamic_loader} \
-		--libdir ${baselib} \
-		--sysroot ${PKG_CONFIG_SYSROOT_DIR} \
-		--gcc-options "--sysroot=${PKG_CONFIG_SYSROOT_DIR}" \
-		--root ${IMAGE_ROOTFS} \
-		--target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
-		-d ${WORKDIR}/mklibs/dest \
-		`cat ${WORKDIR}/mklibs/executables.list`
-
-	cd ${WORKDIR}/mklibs/dest
-	for i in *
-	do
-		cp $i `find ${IMAGE_ROOTFS} -name $i`
-	done
-
-	cd ${IMAGE_ROOTFS}
-	du -bs > ${WORKDIR}/mklibs/du.after.mklibs.txt
-
-	echo rootfs size before mklibs optimization: `cat ${WORKDIR}/mklibs/du.before.mklibs.txt`
-	echo rootfs size after mklibs optimization: `cat ${WORKDIR}/mklibs/du.after.mklibs.txt`
-}
-
-mklibs_optimize_image() {
-	for img in ${MKLIBS_OPTIMIZED_IMAGES}
-	do
-		if [ "${img}" = "${PN}" ] || [ "${img}" = "all" ]
-		then
-			mklibs_optimize_image_doit
-			break
-		fi
-	done
-}
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5d453a6fcd..543c6438f5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -502,7 +502,6 @@ RECIPE_MAINTAINER_pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-mini-x-session = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-minicom = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-mmc-utils = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 870509cf1f..07b3d13951 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -126,11 +126,8 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 # enable extra features. Some available options which can be included in this variable
 # are:
 #   - 'buildstats' collect build statistics
-#   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
-# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
-# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+USER_CLASSES ?= "buildstats image-prelink"
 
 
 #
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 785a1e59df..6585ae710a 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -120,15 +120,6 @@
 #
 # TCMODE ?= "external-sourcery"
 
-# mklibs library size optimization is more useful to smaller images,
-# and less useful for bigger images. Also mklibs library optimization
-# can break the ABI compatibility, so should not be applied to the
-# images which are to be extended or upgraded later.
-#This enabled mklibs library size optimization just for the specified image.
-#MKLIBS_OPTIMIZED_IMAGES ?= "core-image-minimal"
-#This enable mklibs library size optimization will be for all the images.
-#MKLIBS_OPTIMIZED_IMAGES ?= "all"
-
 # This value is currently used by pseudo to determine if the recipe should
 # build both the 32-bit and 64-bit wrapper libraries on a 64-bit build system.
 #
diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch b/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
deleted file mode 100644
index 422af10420..0000000000
--- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Get the version of mklibs by simpler means. The MKLIBS_VERSION string in the 
-configure.ac file is replaced with real version string by the 
-do_configure_prepend() function from the recipe .bb file.
-
-Upstream-Status: Inappropriate [configuration]
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/24
-
-Index: mklibs/configure.ac
-===================================================================
---- mklibs.orig/configure.ac	2010-02-21 17:34:56.000000000 -0800
-+++ mklibs/configure.ac	2011-01-24 18:52:19.943242079 -0800
-@@ -1,4 +1,4 @@
--AC_INIT([mklibs],m4_esyscmd(dpkg-parsechangelog | perl -ne 'print $1 if m/^Version: (.*)$/;'))
-+AC_INIT([mklibs], MKLIBS_VERSION)
- AM_INIT_AUTOMAKE([foreign no-define])
- AC_CONFIG_HEADERS([config.h])
- AM_MAINTAINER_MODE
diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
deleted file mode 100644
index 17d9af4de4..0000000000
--- a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 2001
-From: Yuanjie Huang <yuanjie.huang@windriver.com>
-Date: Fri, 17 Apr 2015 14:48:20 +0800
-Subject: [PATCH 4/6] avoid failure on symbol provided by application
-
-Upstream-Status: Pending
-
-Undefined symbols in a library can be provided by the application
-that links to the library, such as `logsink' in libmultipath.so.0.
-This fix checks the type of object in which the symbol is needed
-and the existence of the symbol in application, when a symbol
-cannot be provided by libraries. It prevents false alarm on absence
-of symbols.
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
-
----
- src/mklibs | 28 ++++++++++++++++++++++++----
- 1 file changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/src/mklibs b/src/mklibs
-index a3533c0..66b7a09 100755
---- a/src/mklibs
-+++ b/src/mklibs
-@@ -133,9 +133,9 @@ class Symbol(object):
-         return '@'.join(ret)
- 
- class UndefinedSymbol(Symbol):
--    def __init__(self, name, weak, version, library):
-+    def __init__(self, name, weak, version, library, object):
-         super(UndefinedSymbol, self).__init__(name, version, library)
--        self.weak, self.library = weak, library
-+        self.weak, self.library, self.object = weak, library, object
- 
- def symbol_is_blacklisted(name):
-     # The ARM Embedded ABI spec states symbols under this namespace as
-@@ -152,6 +152,11 @@ def undefined_symbols(obj):
- 
-     output = command("mklibs-readelf", "--print-symbols-undefined", obj)
- 
-+    if len(obj) > len(dest_path) and obj[:len(dest_path)] == dest_path:
-+        object = obj[len(dest_path) + 1:-len('-so-stripped')]
-+    else:
-+        object = obj
-+
-     result = []
-     for line in output:
-         name, weak_string, version_string, library_string = line.split()[:4]
-@@ -171,7 +176,7 @@ def undefined_symbols(obj):
-         if library_string.lower() != 'none':
-             library = library_string
- 
--        result.append(UndefinedSymbol(name, weak, version, library))
-+        result.append(UndefinedSymbol(name, weak, version, library, object))
- 
-     return result
- 
-@@ -498,12 +503,13 @@ while 1:
-                      and re.search("^ps_", str(symbol)))
-                 and not (re.search("ld-linux.so.3$", str(symbol)))
-                 and not (re.search("^__gnu_local_gp", str(symbol)))):
--                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s" % (symbol, symbol.weak))
-+                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s, for %s" % (symbol, symbol.weak, obj))
-                 needed_symbols[str(symbol)] = symbol
-         libraries.update(library_depends(obj))
- 
-     # calculate what symbols are present in small_libs and available_libs
-     present_symbols = {}
-+    present_symbol_progs = {}
-     checked_libs = small_libs
-     checked_libs.extend(available_libs)
-     checked_libs.append(sysroot + ldlib)
-@@ -513,6 +519,12 @@ while 1:
-             names = symbol.base_names()
-             for name in names:
-                 present_symbols[name] = symbol
-+            if not so_pattern.match(lib):
-+                debug(DEBUG_SPAM, "present_symbol_progs adding %s, from executable %s" % (' '.join(names), lib))
-+                for name in names:
-+                    progs = present_symbol_progs.get(name, set())
-+                    progs.add(lib)
-+                    present_symbol_progs[name] = progs
- 
-     # are we finished?
-     num_unresolved = 0
-@@ -568,6 +580,14 @@ while 1:
-     for name in needed_symbols:
-         if not name in symbol_provider:
-             if not needed_symbols[name].weak:
-+                # WORKAROUND: Undefined symbols in a library can be provided by the application
-+                # that links to the library. So if the object which requires the symbol is a library
-+                # and some application can provide the symbol, the undefined symbol is skipped.
-+                symbol = needed_symbols[name]
-+                if so_pattern.match(symbol.object) and present_symbol_progs.get(name, None):
-+                    debug(DEBUG_SPAM, "symbol %s in library %s is provided by executable %s" \
-+                          % (name, symbol.object, ' '.join(present_symbol_progs[name])))
-+                    continue
-                 raise Exception("No library provides non-weak %s" % name)
-         else:
-             lib = symbol_provider[name]
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
deleted file mode 100644
index d27a48916d..0000000000
--- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn't
-define STT_GNU_IFUNC, so we have to define it ourselves.
-
-Upstream-Status: Inappropriate [other] - old release specific, maybe removable
-
--- Dexuan Cui (dexuan.cui@intel.com) Feb 16, 2011.
-
-diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
-index 2444c39..56d93f8 100644
---- a/src/mklibs-readelf/main.cpp
-+++ b/src/mklibs-readelf/main.cpp
-@@ -6,6 +6,14 @@
- #include <vector>
- 
- #include <elf.h>
-+/*
-+ * The /usr/include/elf.h in some distributions(like Ubuntu 9.04) doesn't
-+ * define the macro. We need to define it here.
-+ */
-+#ifndef STT_GNU_IFUNC
-+#define STT_GNU_IFUNC   10              /* Symbol is indirect code object */
-+#endif
-+
- #include <getopt.h>
- 
- #include "elf.hpp"
diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
deleted file mode 100644
index 13e4606b80..0000000000
--- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Remove dependency on dpkg
-
-Upstream-Status: Submitted
-
-Asking the host OS whether it supports multiarch is not useful
-in a cross-compilation environment, or if the user has specified
-a libdir explicitly. So this patch, based on the work of Mentor
-Graphics, removes mklibs's dependency on dpkg package.
-
-Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
- src/mklibs | 30 +++++++++++++++++++-----------
- 1 file changed, 19 insertions(+), 11 deletions(-)
-
-diff --git a/src/mklibs b/src/mklibs
-index d9b784b..c5614ea 100755
---- a/src/mklibs
-+++ b/src/mklibs
-@@ -261,6 +261,11 @@ def extract_soname(so_file):
-     return ""
- 
- def multiarch(paths):
-+    # Asking the host OS whether it supports multiarch is not useful
-+    # in a cross-compilation environment, or if the user has specified
-+    # a libdir explicitly.
-+    if sysroot != "" or libdir != "":
-+        return paths
-     devnull = open('/dev/null', 'w')
-     dpkg_architecture = subprocess.Popen(
-         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
-@@ -340,7 +345,7 @@ lib_path = []
- dest_path = "DEST"
- ldlib = "LDLIB"
- include_default_lib_path = "yes"
--default_lib_path = multiarch(["/lib/", "/usr/lib/", "/usr/X11R6/lib/"])
-+default_lib_path = ["/lib/", "/usr/lib/", "/usr/X11R6/lib/"]
- libc_extras_dir = "/usr/lib/libc_pic"
- libc_extras_dir_default = True
- libdir = "lib"
-@@ -386,7 +391,7 @@ for opt, arg in optlist:
-     elif opt == "--libdir":
-         libdir = arg
-     elif opt in ("--help", "-h"):
--	usage(0)
-+        usage(0)
-         sys.exit(0)
-     elif opt in ("--version", "-V"):
-         version(vers)
-@@ -395,6 +400,7 @@ for opt, arg in optlist:
-         print "WARNING: unknown option: " + opt + "\targ: " + arg
- 
- if include_default_lib_path == "yes":
-+    default_lib_path = multiarch(default_lib_path)
-     lib_path.extend([a.replace("/lib/", "/" + libdir + "/") for a in default_lib_path])
- 
- if libc_extras_dir_default:
-@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
- ld_full_path = "../" + ldlib
- ld_file = find_lib(ld_file_name)
- 
--if ld_path_name != "/lib":
--    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
--        os.remove(dest_path + "/" + ld_file_name)
-+#if ld_path_name != "/lib":
-+#    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
-+#        os.remove(dest_path + "/" + ld_file_name)
- 
--if not os.path.exists(dest_path + "/../" + ld_path_name):
--    os.mkdir(dest_path + "/../" + ld_path_name)
-+#if not os.path.exists(dest_path + "/../" + ld_path_name):
-+#    os.mkdir(dest_path + "/../" + ld_path_name)
- 
--if not os.access(dest_path + "/" + ld_full_path, os.F_OK):
--    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " + ld_full_path)
-+if not os.access(dest_path + "/" + ld_file_name, os.F_OK):
-+    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " + ld_file_name)
-     command(target + "objcopy", "--strip-unneeded -R .note -R .comment",
--            ld_file, dest_path + "/" + ld_full_path)
-+            ld_file, dest_path + "/" + ld_file_name)
- 
--os.chmod(dest_path + "/" + ld_full_path, 0755)
-+os.chmod(dest_path + "/" + ld_file_name, 0755)
diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
deleted file mode 100644
index bc56593e6a..0000000000
--- a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001
-From: Yuanjie Huang <yuanjie.huang@windriver.com>
-Date: Wed, 15 Apr 2015 14:00:06 +0800
-Subject: [PATCH] Show GNU unique symbols as provided symbols
-
-Upstream-Status: Submitted
-
-GNU Unique symbol is a GNU extension employed by new version of GCC
-by default. Even Standard C++ library in GCC 4.9 provides some symbols,
-such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead
-of ELF standard weak binding.
-This patch adds support of this new binding type to mklibs-readelf.
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- src/mklibs-readelf/main.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
-index 56d93f8..0134530 100644
---- a/src/mklibs-readelf/main.cpp
-+++ b/src/mklibs-readelf/main.cpp
-@@ -88,7 +88,7 @@ static void process_symbols_provided (const Elf::section_type<Elf::section_type_
-     uint8_t type = symbol->get_type ();
-     const std::string &name = symbol->get_name_string ();
- 
--    if (bind != STB_GLOBAL && bind != STB_WEAK)
-+    if (bind != STB_GLOBAL && bind != STB_WEAK && bind != STB_GNU_UNIQUE)
-       continue;
-     if (shndx == SHN_UNDEF || shndx == SHN_ABS)
-       continue;
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
deleted file mode 100644
index 75500a029a..0000000000
--- a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-In cross builds we will have to respect sysroot
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: mklibs-0.1.39/src/mklibs
-===================================================================
---- mklibs-0.1.39.orig/src/mklibs	2014-03-01 18:25:36.000000000 +0000
-+++ mklibs-0.1.39/src/mklibs	2014-10-19 00:51:46.813534596 +0000
-@@ -495,7 +495,7 @@
-     present_symbols = {}
-     checked_libs = small_libs
-     checked_libs.extend(available_libs)
--    checked_libs.append(ldlib)
-+    checked_libs.append(sysroot + ldlib)
-     for lib in checked_libs:
-         for symbol in provided_symbols(lib):
-             debug(DEBUG_SPAM, "present_symbols adding %s" % symbol)
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
deleted file mode 100644
index 1784af1f4c..0000000000
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Shared library optimisation tool"
-DESCRIPTION = "mklibs produces cut-down shared libraries that contain only the routines required by a particular set of executables."
-HOMEPAGE = "https://launchpad.net/mklibs"
-SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
-	file://ac_init_fix.patch\
-	file://fix_STT_GNU_IFUNC.patch\
-	file://sysrooted-ldso.patch \
-	file://avoid-failure-on-symbol-provided-by-application.patch \
-	file://show-GNU-unique-symbols-as-provided-symbols.patch \
-	file://fix_cross_compile.patch \
-"
-
-SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
-SRC_URI[sha256sum] = "3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b238ccb9b49d84722066c2"
-
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
-
-inherit autotools gettext native

