Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CBEC28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:01:09 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.36543.1741784467888627678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 06:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PjYj4X3H;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec111762bso1308539966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741784466; x=1742389266; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jRo8kq02xFUrLfITsxeIVNanVwZoXr/ZBMOtspQwEY=;
        b=PjYj4X3HqGgloRSZkdnbETzra/EaVcc1t8yuJAOdNxNVnMg3JNkoiS0tBvS30mWi2w
         SzQdtVECMGi/QqYHU1c5772nQlS+Q2hV72E5DtNSZjh+E7PXPb7Cvk9NcbwGIUzyzjEe
         Wl3HmFxdYAfi5+VTS9F61PXhIqmRKMoDgtU7bKpkS78itboN6vUPfhsDO3R37Qo5eWHx
         LSnI4FrnIweYa8jeuV7UR+HAJJIg4jbQDg2KrgW1QDoHHK4ohDZa1pUHEIm+9nmenAx7
         lTusvjmR5SAEmjSRV/BydImlvzHU4cbc9N/L7oYAhm4PlkY67Mzh7YXQs29YOhIX50m7
         HjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784466; x=1742389266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jRo8kq02xFUrLfITsxeIVNanVwZoXr/ZBMOtspQwEY=;
        b=GUTaME45SZwr08+vQqjXY/qpiIDdz0P4nIj6Foo3UiXRw4v9ccJPLW+Efjlke44D0/
         gC1JzIN59ZjbxfZ6XajNKuC2rmTmdoDRtVUso68ZbdvVkIsJnD1CIBxX2zod5zy9LXju
         VEFtRGAxpsd7ldSeNgF24rCEEK/bDxbII/YIVyDdBBtnIKJUUbLxWH2+Wn8nW1hqNwAi
         QveoC5sim8oWwVpR+dx+Cz3z9451WgYJXrLVuXZGydDAFjvJSLby41HEQJsbW3zMx4RH
         EIvushjZjHbeYzV/xGCIr+cmHPCx1UYZ5UoXfyLFisByGy0gy4XO/ngGv/4N8xuOYo4X
         KgIA==
X-Gm-Message-State: AOJu0YwJLYdZ5Yo1gs9RpYsRBQToViswYzR9gVpSyauqNnTF4qaJypFZ
	vndx/XgSdyL7IuDbJaCwyqX+aeeg98ljqC7Aakl0U6j2rOXWgObD
X-Gm-Gg: ASbGnct1mjsxRVTUoxSYWz1uNGgf/XaGkYXXFqFq2YC8LXAL2n9OJDUx/WMUmAAakFV
	6JCpJlLz8ULFROco2LnvtGjhZXQ3mBldUwg3YuAAb7MA4mUAx4/y8WtA5p5PNSJqdWRQsqoWVvW
	wIkibJk59z+MFI+L6/h5m7zsVzrdMln9oY9hdqzirkkx7gn7Yeuw2buaFJIRd433IduPPvTGIfk
	3RfXQXuD1QGEdq0SVq+hdahBhQRohMPyYbr0zGR2Ps+yiMGU+RQhC3ri8QsiocLzHxlRu1Xf3my
	+Xl87Yy/nNbmiWtJskrp6ft7UjJ+oAYuesOxYzzS2kkeiilpOldoJpjtYSv4sAKmmwrAIS21Uq4
	CrQxPLCDFoZw=
X-Google-Smtp-Source: AGHT+IGQGShyJFjfRIRI9K+kE3sr86i2cao/kD2OidrFrZiJ9PLEj+DLAgviIqGkEbYxxnmMmfCAgQ==
X-Received: by 2002:a17:907:1b05:b0:abf:74d6:e2b0 with SMTP id a640c23a62f3a-ac252747c60mr2759557266b.3.1741784464786;
        Wed, 12 Mar 2025 06:01:04 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988b64asm1068306266b.155.2025.03.12.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:01:04 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Mar 2025 13:00:46 +0000
Subject: [PATCH OE-Core 3/4] kmod: Upgrade 33 -> 34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-upgrade-kmod-v1-3-4de94f131b64@gmail.com>
References: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
In-Reply-To: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212653

Migrate to meson from autotools. Drop remnants of ptest support which was
removed in 2015:

  https://git.openembedded.org/openembedded-core/commit/?id=f80d136bdd578468035a88125fa1b84973fd912b

Remove configuration directory/symlink handling which is now done by the meson
build. Fix manpage generation.

kmod 34
=======

- Improvements

	- Drop pre-built .ko modules from git - distros/packages will need the
	  linux-headers to be able to run the testsuite. There was limited use
	  of the feature, while linters complained about "source-not-included"
	  or "source-contains-prebuilt-binary".

	- Switch build system to meson: autotools is still supported but slated
	  for removal on next release. This is the transition release to help
	  distros and integrators to move to the new build system. Default options
	  target distros while developers can use the build-dev.ini configuration
	  file.

	- Allow to load decompression libraries on demand: liblzma.so, libz.so
	  and libzstd.so can now be loaded on demand, only when there is
	  such a need. For use during early boot for loading modules, if
	  configured well it means none of these libraries are loaded: the
	  module loading logic via finit_module() will just hand over to kernel
	  the open file descriptor and kernel will use its own decompress routine.

	  If kernel doesn't handle decompression or if the module is compressed
	  with a different algorithm than the one configured in the kernel,
	  libkmod can still open the module by dynamically loading the
	  correspondent library.

	  Tools inspecting the module contents, like modinfo, will load that
	  single decompression library instead all of them.

	  For distros building with meson it's possible to choose the behavior
	  per library. Examples: a) -Ddlopen=all uses dlopen behavior for all
	  the libraries; b) -Ddlopen=xz, will make only xz to be dlopen'ed
	  while other enabled libraries will be linked in at build time.

	  The use of dlopen is annotated in the ELF file by using the ELF
	  Package Metadata spec as documented in
	  https://systemd.io/ELF_PACKAGE_METADATA/. Example:

	  $ dlopen-notes.py libkmod.so
	  # build/libkmod.so
	  [
	    {
	      "feature": "xz",
	      "description": "Support for uncompressing xz-compressed modules",
	      "priority": "recommended",
	      "soname": [
	        "liblzma.so.5"
	      ]
	    }
	  ]

	- Add -m / --moduledir to depmod to override in runtime the module
	  directory that was already possible to set on build time. Document
	  the interaction between the dir options: base, module and output.

	- Better error propagation in libkmod for its internal APIs and libc
	  functions up to the callers.

	- Improve libkmod API documentation by adding new sections, documenting
	  functions previously missing, rewording existing ones, adding version
	  information, cross-referencing, etc.

	- Remove deprecated arguments for depmod: --unresolved-error, --quiet,
	  --root and --map.

	- Remove deprecated arguments for rmmod: -w.

	- Remove deprecated arguments for insmod: -p and -s.

	- Add --syslog and --force for insmod to normalize it with other tools.

	- Add bash, fish and zsh shell-completion for insmod, rmmod and lsmod.

	- Remove depmod_module_directory_override from .pc as the kernel side
	  is not making use of it and will likely not need it.

	- Improve builtin module listing and retrieving information from its
	  modinfo index which reduces the amount of needed syscalls by 90%.

	- Improve zstd decompression by using streaming bufferless mode which
	  reduces the amount of syscalls by 65%.

	- Increase use of pread while parsing ELF and indexes in order to reduce
	  syscalls and improve performance.

	- Improve module sorting in depmod to speedup the use of the
	  modules.order index and support duplicate lines in it.

	- Avoid misaligned memory access while reading module signature in
	  libkmod.

	- Add more documentation for contributing to kmod. New developers are
	  welcome to look at the new README.md and CONTRIBUTING.md files for
	  information on process, coding style, build/installation, etc.

	- Overhaul man pages with multiple clarifications, section rewrites and
	  additional documentation.

	- Drop --with-rootlibdir as it's seldom used and was partially broken.

	- Drop strndupa() and alloca() for increased libc compatibility.

	- Better handling of LFS for increased compatibility with libc.

	- Protect kmod_get_dirname() and kmod_new() against NULL argument.

	- Normalize --version / --help output across all tools.

	- Always include log priority in messages, even when building with debug.

	- Optimize index reading by lazily reading nodes on demand, reducing
	  FILE overhead and reducing code duplication wrt FILE vs mmap
	  implementations, etc.

	- Switch index to pre-order to improve performance in both read and
	  write, meaning faster lookup and faster depmod. Some examples:
	  a) traversing all indexes via configuration dump shows a 9%
	  improvement on Raspberry Pi 2. b) writing the indexes takes 90% less
	  lseek() calls, leading to a performance gain of 13%.

	- Make symlink install locations more similar to what distros are
	  using: by default it installs the kmod binary as bin/kmod and the
	  symlinks are located in e.g. `sbin/depmod -> ../bin/kmod`. Changing
	  the sbin location is sufficient to move the symlinks to the
	  appropriate place, so distros using `--sbin /usr/bin` will have them
	  installed in that directory. This avoids distros having to remove the
	  symlink and add the symlinks by themselves. (meson only)

	- Install configuration directories,
	  /{etc,usr/lib}/{depmod,modprobe}.d/ as part of installation, matching
	  what several distros do during packaging. (meson only)

- Bug fixes

	- Fix testsuite using when using configurable module dir.

	- Fix typos on documentation and source code.

	- Fix out of bound access in multiple places when using long paths,
	  synthetic huge files, or handling memory allocation errors, or
	  inconsistent variable types, particularly on 32b builds.

	- Fix internal array APIs, with better error checking: improve execution on
	  very memory-constrained scenarios or very long paths.

	- Fix absolute path handling in depmod.

	- Fix libkmod memory leaks on error handling when getting builtin
	  module list.

	- Do not crash on invalid modules.builtin.modinfo file.

	- Fix link with lld resulting in empty testsuite.

	- Fix testsuite build/execution with musl.

- Others

	- Adopt clang-format and editorconfig for coding style and setup CI
	  action to keep the codebase consistent.

	- Adopt codespell in CI.

	- Adopt CodeQL integration in CI.

	- Adopt Codecov in CI.

	- Adopt SPDX copyright and license identifiers throughout the project.

	- Add more distros to CI, 32b builds, clang as compiler and lld as
	  linker.

	- Add support for clang sanitizers and squelch warnings.

	- Add tests for builtin modules from modinfo index file.

	- Multiple testsuite refactors and fixes to make it simpler to write tests.

	- Add CI coverage for docs

	- Improve strbuf implementation with more error checks and generalize
	  it to cover the role of scratchbuf. This allows to remove the
	  scratchbuf implementation.

	- Use common array and strbuf code in depmod to remove duplication.

	- Add abstraction and use more compiler builtins for addition and
	  multiplication with overflow checking.

	- Normalize use of C attributes throughout the project.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 ------------
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch      | 30 ------------
 meta/recipes-kernel/kmod/kmod/run-ptest            |  5 --
 .../kmod/{kmod_33.bb => kmod_34.1.bb}              | 57 +++++++++-------------
 4 files changed, 22 insertions(+), 100 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
deleted file mode 100644
index 6db4fa7e97e55ea0d9e34c8caa35357ff2052adb..0000000000000000000000000000000000000000
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7a22abf188e5b688080bb1321a77588474114339 Mon Sep 17 00:00:00 2001
-From: Tudor Florea <tudor.florea@enea.com>
-Date: Fri, 6 Sep 2013 21:11:57 +0000
-Subject: [PATCH] kmod: avoid parallel-tests
-
-Avoid parallel-tests as it remove
-buildtest-TESTS and runtest-TESTS targets required by ptest.
-In automake 1.13.4 parallel-tests is assumed by defauls.
-In order to have buildtest-TESTS and runtest-TESTS targets
-serial-tests is now required
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Inappropriate (disable feature incompatible with ptest)
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2f1c525..7056aae 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
- AC_SYS_LARGEFILE
- AC_PREFIX_DEFAULT([/usr])
- AM_MAINTAINER_MODE([enable])
--AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
-+AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
- AM_SILENT_RULES([yes])
- LT_INIT([disable-static pic-only])
- 
diff --git a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
deleted file mode 100644
index 91d622b8c7b04a34b875efb8c2579614bdb90668..0000000000000000000000000000000000000000
--- a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 90fb7bb85002cde39de3b3d2e2481933390832af Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 8 Dec 2023 22:35:45 +0000
-Subject: [PATCH] configure: set docdir in GTK_DOC_CHECK
-
-By passing --docdir in the GTK_DOC_CHECK arguments (to match
-autogen.sh) autoreconf will work out of the box.
-
-Without this autoreconf fails due to the documentation not being in
-./docs, the default location.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-modules/20231208224511.1363066-1-ross.burton@arm.com/T/#u]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7056aae..d53a20c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -236,7 +236,7 @@ AS_IF([test "x$enable_coverage" = "xyes"], [
- AM_CONDITIONAL([ENABLE_COVERAGE], [test "x$enable_coverage" = "xyes"])
- 
- m4_ifdef([GTK_DOC_CHECK], [
--GTK_DOC_CHECK([1.14],[--flavour no-tmpl-flat])
-+GTK_DOC_CHECK([1.14],[--flavour no-tmpl-flat --docdir libkmod/docs])
- ], [
- AM_CONDITIONAL([ENABLE_GTK_DOC], false)])
- 
diff --git a/meta/recipes-kernel/kmod/kmod/run-ptest b/meta/recipes-kernel/kmod/kmod/run-ptest
deleted file mode 100755
index 598dd2cb5fbad194a135e5d06601847e00df1586..0000000000000000000000000000000000000000
--- a/meta/recipes-kernel/kmod/kmod/run-ptest
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-touch testsuite/stamp-rootfs
-tar xf testmodule.tar
-make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
-find testsuite -name *.ko -exec rm -f {} \;
diff --git a/meta/recipes-kernel/kmod/kmod_33.bb b/meta/recipes-kernel/kmod/kmod_34.1.bb
similarity index 58%
rename from meta/recipes-kernel/kmod/kmod_33.bb
rename to meta/recipes-kernel/kmod/kmod_34.1.bb
index 15f42766f3b5e484a8f0519fc037b32fa62a4754..daa9327f712e5a68a3e7f6058b22b313a6733ce9 100644
--- a/meta/recipes-kernel/kmod/kmod_33.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.1.bb
@@ -13,28 +13,27 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tools/COPYING;md5=751419260aa954499f7abaabaa882bbe \
                    "
-inherit autotools bash-completion gtk-doc pkgconfig update-alternatives
+inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives
 
-SRCREV = "e193aeb99a04fb4b63ce47eb2c7f119db59446a0"
-
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
+SRC_URI = "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.tar.xz \
            file://depmod-search.conf \
-           file://avoid_parallel_tests.patch \
-           file://gtkdocdir.patch \
            "
+SRC_URI[sha256sum] = "125957c9125fc5db1bd6a2641a1c9a6a0b500882fb8ccf7fb6483fcae5309b17"
 
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF += "--enable-tools"
+EXTRA_OEMESON += "\
+    -Ddistconfdir=${nonarch_base_libdir} \
+    -Dtools=true \
+"
+#-Dmoduledir=${nonarch_base_libdir}/modules
 
 PACKAGECONFIG ??= "zlib xz openssl"
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, scdoc-native"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
-PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
-PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
-PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[debug] = "-Ddebug-messages=true,-Ddebug-messages=false"
+PACKAGECONFIG[logging] = " -Dlogging=true,-Dlogging=false"
+PACKAGECONFIG[manpages] = "-Dmanpages=true,-Dmanpages=false,scdoc-native"
+PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
+PACKAGECONFIG[xz] = "-Dxz=enabled,-Dxz=disabled,xz"
+PACKAGECONFIG[zlib] = "-Dzlib=enabled,-Dzlib=disabled,zlib"
+PACKAGECONFIG[zstd] = "-Dzstd=enabled,-Dzstd=disabled,zstd"
 
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES:${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
@@ -44,24 +43,7 @@ RREPLACES:${PN} += "module-init-tools-insmod-static module-init-tools-depmod mod
 # to force user to remove old module-init-tools and replace them with kmod variants
 RCONFLICTS:libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 
-# autotools set prefix to /usr, however we want them in /bin and /sbin
-EXTRA_OECONF += "--bindir=${base_bindir} --sbindir=${base_sbindir}"
-
 do_install:append () {
-        install -dm755 ${D}${base_bindir}
-        install -dm755 ${D}${base_sbindir}
-        # add symlinks to kmod
-        [ -e ${D}${base_bindir}/lsmod ] || ln -rs ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
-        for tool in insmod rmmod depmod modinfo modprobe; do
-                rm -f ${D}${base_bindir}/${tool}
-                ln -rs ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
-        done
-        # configuration directories
-        install -dm755 ${D}${nonarch_base_libdir}/depmod.d
-        install -dm755 ${D}${nonarch_base_libdir}/modprobe.d
-        install -dm755 ${D}${sysconfdir}/depmod.d
-        install -dm755 ${D}${sysconfdir}/modprobe.d
-
         # install depmod.d file for search/ dir
         install -Dm644 "${UNPACKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
 
@@ -69,6 +51,11 @@ do_install:append () {
         echo "exclude .debug" > ${D}${nonarch_base_libdir}/depmod.d/exclude.conf
 }
 
+PACKAGES += "${PN}-fish-completion ${PN}-zsh-completion"
+
+FILES:${PN}-fish-completion = "${datadir}/fish"
+FILES:${PN}-zsh-completion = "${datadir}/zsh"
+
 ALTERNATIVE_PRIORITY = "70"
 
 ALTERNATIVE:kmod = "insmod modprobe rmmod modinfo bin-lsmod lsmod depmod"
@@ -78,9 +65,9 @@ ALTERNATIVE_LINK_NAME[insmod] = "${base_sbindir}/insmod"
 ALTERNATIVE_LINK_NAME[modprobe] = "${base_sbindir}/modprobe"
 ALTERNATIVE_LINK_NAME[rmmod] = "${base_sbindir}/rmmod"
 ALTERNATIVE_LINK_NAME[modinfo] = "${base_sbindir}/modinfo"
-ALTERNATIVE_LINK_NAME[bin-lsmod] = "${base_bindir}/lsmod"
+ALTERNATIVE_LINK_NAME[bin-lsmod] = "${base_sbindir}/lsmod"
 ALTERNATIVE_LINK_NAME[lsmod] = "${base_sbindir}/lsmod"
-ALTERNATIVE_TARGET[lsmod] = "${base_bindir}/lsmod.${BPN}"
+ALTERNATIVE_TARGET[lsmod] = "${base_sbindir}/lsmod.${BPN}"
 
 PACKAGES =+ "libkmod"
 FILES:libkmod = "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${SOLIBS}"

-- 
2.25.1


