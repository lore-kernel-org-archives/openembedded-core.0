Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B59CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 13:16:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13939.1755609354983601441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 06:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RhP8qpnP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so26033925e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 06:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755609353; x=1756214153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=abmastu76hNsljdeuus3lfhSuu8YYfIKTWLi81fytAk=;
        b=RhP8qpnP1XLIPd+CvDM/ABdDt026FzVBLGTIFQnd6oFGmnLbPQXjpCg+8nYQveYOM5
         x2rjF/bRT464Cib1EYtydi7H+n2lo0uyrQ/8K/ThBjm+bXJsSnD0KTcsa3WB15ME2TtY
         FSn5lQpYh74Z5YmsVZDtsdOnrQBOpe9BBYn4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609353; x=1756214153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abmastu76hNsljdeuus3lfhSuu8YYfIKTWLi81fytAk=;
        b=mrVv16OAl2dPEbhhLtpBwQqb+2XxXp5GncCmB+AgDuV/MVR5HxW/XRxf5mxVNLCnd0
         BBZ/CB1fsgyplDFxNvTPhGRBKSuQVaJFs5w8uSTFMrEBudu3OCYk2lnkksJvpx+l7N6N
         0/Nj32WVH4O3sBYWTA+xkQ/bU22XXs8VlNA/5L29trqQxVbUmCwMiwHPs067ZLsCm448
         oOpNp2PcLlAAQWSUmgMdRRD3u1nMBf8UBveEFcIbE5/s6Xf1mXd4i6kYykfjCHnkBlJI
         yzLuhlKm2lzLaa5AGpNXDqw/WT2auqsvc5fyjSvoapDZl1UP5H2ltuOlkmidujjsxDc6
         NarQ==
X-Gm-Message-State: AOJu0Yyio0+zkB9Hz3Gd9fFote8CeNyvoU1EVRpJV+Uy5Rs3YyIXMy9a
	TlR3iJZJtFNKfJchbPsJ7AF0W4bKuz7rtnj3dkFOHKN6foJ1luOlyPVxiUdab0PA3yfIu0J8Hst
	Hoii3
X-Gm-Gg: ASbGncsSD9DCqn9rGNGB7tbIOhOVNZ+bEUDRFeSYNjQ0KANAy5wzZTee5Q+xLZPnoYl
	7ylwwpH71TCYktbz0mdnd0Yxe8j4SwuXYrfmSFNylukfR4ODVdukFG0895R/rYeOlsNQEEf/oWe
	imbUSNNP4m224B8Id0ulbp6p+1f6shnqtAID8oBCw/luiHH8Qs72fKzsDmIMT2/op4lD5AxSc4o
	AhNj9ev3dP42RMXmQ8OWRsYUHYWpNkHZVPYLvpt+1FZsn/jSpcOeBlK83K9fDRJ93BqDGeX+nbt
	cDXXmkULiUbYYG4xekBPubcNAiE505oN8OzNB10mjT75/kVj/HwOf2/r25L58h1GUFCAct8IWUc
	npDbyoebIlBEf4U9UF+zhh6HkHKl3UbrbGk/umCiExZ9CGW3GmMC8KckW51BzrKNuMoVx9FVI
X-Google-Smtp-Source: AGHT+IGL/EyZndxpzNxitfCX4udNHlmVriVwYzt77XvZ3U0r9NYqLEX/ILsZy4n7n1lU1ZEX+Masmg==
X-Received: by 2002:a05:600c:3149:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-45b43dc66f3mr28047365e9.10.1755609352224;
        Tue, 19 Aug 2025 06:15:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3d5c:7b3b:65dd:ef80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6be103sm229833565e9.2.2025.08.19.06.15.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:15:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] babeltrace: Remove in favour of babeltrace2
Date: Tue, 19 Aug 2025 14:15:48 +0100
Message-ID: <20250819131550.3646165-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222108

This version is deprecated and replaced by babeltrace2. Drop the older version
so we can focus efforts around the newer one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/ptest-packagelists.inc     |  1 -
 .../packagegroup-core-tools-profile.bb        |  2 -
 .../recipes-kernel/lttng/babeltrace/run-ptest |  9 --
 .../recipes-kernel/lttng/babeltrace_1.5.11.bb | 98 -------------------
 .../lttng/lttng-tools_2.14.0.bb               |  2 +-
 7 files changed, 1 insertion(+), 113 deletions(-)
 delete mode 100755 meta/recipes-kernel/lttng/babeltrace/run-ptest
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 20882523c28..07660a02bf8 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -15,7 +15,6 @@ DISTRO_PN_ALIAS:pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS:pn-atk = "Fedora=atk OpenSuSE=atk"
 DISTRO_PN_ALIAS:pn-avahi-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
 DISTRO_PN_ALIAS:pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
-DISTRO_PN_ALIAS:pn-babeltrace = "OSPDT"
 DISTRO_PN_ALIAS:pn-babeltrace2 = "OSPDT"
 DISTRO_PN_ALIAS:pn-bjam = "OpenSuSE=boost-jam Debian=bjam"
 DISTRO_PN_ALIAS:pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0312ae00f67..a875ce8176a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -53,7 +53,6 @@ RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>
 RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi-libnss-mdns = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-babeltrace = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-babeltrace2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-barebox = "Enrico Jörns <yocto@pengutronix.de>"
 RECIPE_MAINTAINER:pn-barebox-tools = "Enrico Jörns <yocto@pengutronix.de>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e3099439f4c..9a7b25a9165 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -7,7 +7,6 @@ PTESTS_FAST = "\
     acl \
     apr-util \
     attr \
-    babeltrace \
     babeltrace2 \
     bc \
     bluez5 \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 54915e4f0c3..9c09f5ab443 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -35,7 +35,6 @@ LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS:arc = ""
 LTTNGTOOLS:riscv32 = ""
 
-BABELTRACE = "babeltrace"
 BABELTRACE2 = "babeltrace2"
 
 # valgrind does not work on the following configurations/architectures
@@ -59,7 +58,6 @@ VALGRIND:loongarch64 = ""
 RDEPENDS:${PN} = "\
     ${PROFILETOOLS} \
     ${LTTNGTOOLS} \
-    ${BABELTRACE} \
     ${BABELTRACE2} \
     ${SYSTEMTAP} \
     ${VALGRIND} \
diff --git a/meta/recipes-kernel/lttng/babeltrace/run-ptest b/meta/recipes-kernel/lttng/babeltrace/run-ptest
deleted file mode 100755
index f4b7ce11e20..00000000000
--- a/meta/recipes-kernel/lttng/babeltrace/run-ptest
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-# use target=recheck if you want to recheck failing tests
-[ "$target" = "" ] && target=check
-
-# Without --ignore-exit, the tap harness causes any FAILs within a
-# test plan to raise ERRORs; this is just noise.
-makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=$PWD top_builddir=$PWD"
-
-exec make -C tests -k -s $makeargs $target 2>/dev/null
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
deleted file mode 100644
index 8ec80167a0d..00000000000
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY = "Babeltrace - Trace Format Babel Tower"
-DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
-HOMEPAGE = "http://babeltrace.org/"
-BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
-
-DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
-
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5;protocol=https \
-	   file://run-ptest \
-	  "
-SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>1(\.\d+)+)$"
-
-inherit autotools pkgconfig ptest
-
-EXTRA_OECONF = "--disable-debug-info"
-
-ASNEEDED = ""
-
-RDEPENDS:${PN}-ptest += "bash gawk make"
-
-addtask do_patch_ptest_path after do_patch before do_configure
-do_patch_ptest_path () {
-    for f in $(grep -l -r abs_top_srcdir ${S}/tests); do
-	sed -i 's:\@abs_top_srcdir\@:${PTEST_PATH}:' ${f}
-    done
-
-    for f in $(grep -l -r abs_top_builddir ${S}/tests); do
-	sed -i 's:\@abs_top_builddir\@:${PTEST_PATH}:' ${f}
-    done
-    for f in $(grep -l -r GREP ${S}/tests); do
-	sed -i 's:\@GREP\@:grep:' ${f}
-    done
-
-    for f in $(grep -l -r SED ${S}/tests); do
-	sed -i 's:\@SED\@:sed:' ${f}
-    done
-}
-
-do_compile_ptest () {
-    make -C tests all
-}
-
-do_install_ptest () {
-    # Copy required files from source directory
-    for f in config/tap-driver.sh config/test-driver; do
-	install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
-    done
-    install -d "$f" "${D}${PTEST_PATH}/tests/ctf-traces/"
-    cp -a ${S}/tests/ctf-traces/* ${D}${PTEST_PATH}/tests/ctf-traces/
-
-    # Copy the tests directory tree and the executables and
-    # Makefiles found within.
-    install -D "${B}/tests/Makefile" "${D}${PTEST_PATH}/tests/"
-    for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P ') ; do
-	install -d "${D}${PTEST_PATH}/tests/$d"
-	find "${B}/tests/$d" -maxdepth 1 -executable -type f \
-	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +
-	test -r "${B}/tests/$d/Makefile" && \
-	    install -t "${D}${PTEST_PATH}/tests/$d" "${B}/tests/$d/Makefile"
-	find "${B}/tests/$d" -maxdepth 1 -name *.sh \
-	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
-    done
-
-    for d in $(find "${B}/tests" -type d -name .libs -printf '%P ') ; do
-	for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
-	    cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
-	done
-    done
-
-    install -D ${B}/formats/ctf/metadata/.libs/ctf-parser-test \
-	    ${D}${PTEST_PATH}/formats/ctf/metadata/ctf-parser-test
-
-    # Prevent attempts to update Makefiles during test runs, and
-    # silence "Making check in $SUBDIR" messages.
-    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
-	 sed -i \
-	 -e '/Makefile:/,/^$/d' \
-	 -e '/$(check_SCRIPTS)/s/^/#/' \
-	 -e '/%: %.in/,/^$/d' \
-	 -e '/echo "Making $$target in $$subdir"; \\/d' \
-	 -e 's/^srcdir = \(.*\)/srcdir = ./' \
-	 -e 's/^builddir = \(.*\)/builddir = ./' \
-	 -e 's/^all-am:.*/all-am:/' \
-	 {} +
-
-    # Remove path to babeltrace.
-    for f in $(grep -l -r "^BABELTRACE_BIN" ${D}${PTEST_PATH}); do
-	sed -i 's:^BABELTRACE_BIN.*:BABELTRACE_BIN=/usr/bin/babeltrace:' ${f}
-    done
-    for f in $(grep -l -r "^BTBIN" ${D}${PTEST_PATH}); do
-	sed -i 's:^BTBIN.*:BTBIN=/usr/bin/babeltrace:' ${f}
-    done
-}
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index a3faf1e758c..b3383accd9a 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -15,7 +15,7 @@ include lttng-platforms.inc
 DEPENDS = "liburcu popt libxml2 util-linux bison-native babeltrace2"
 RDEPENDS:${PN} = "libgcc"
 RRECOMMENDS:${PN} += "${LTTNGMODULES}"
-RDEPENDS:${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils"
+RDEPENDS:${PN}-ptest += "make perl bash gawk procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long

