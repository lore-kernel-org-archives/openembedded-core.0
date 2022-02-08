Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C25CC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 22:53:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.19032.1644360795802876725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B5BePUqG;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso3437212pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+vLNxDEEeBUwdQ/9ZxZMREHZHAiQVLbHBXYVpT6MvBs=;
        b=B5BePUqGfNNU4f7eD8CM86tcuEqfii2jr1JUOyAjyZfN5upMR0J9AVkfdLdWWzdRd9
         dBbJTYPG+XWgrsY45x/AdhJzlrMzqc0n2K9dXfi0tj/35fE1YZe5NBWJfICr2clqJMUp
         MKsJ/rMqH5Dca1NpPIkuR/KtSezR5MXAa2aPQn2tQDQyZmlD5VmoFYsn7C4owxhXRAaj
         taW4cxCPrC0ALzYI26xJH0l5inqpDRd7ikIBx64i8foAiwuZknG7TJ+EfXsnEqO5QxJq
         nlNT6GcWcBg4sgY46s7aZY3uZwZff4IVB+3Ab3VOWR6t+YC9cXyO78+WUnNRK5taXkWX
         YGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+vLNxDEEeBUwdQ/9ZxZMREHZHAiQVLbHBXYVpT6MvBs=;
        b=VBpmfsUhHVoSG9IJJZwKnG4CA0bIYDh+VH5x4da1SFp1Hs7TxPga+W60472z1WhMMf
         lnf43VgpO9+Y+uuHrcOpILFA0DpHAukh2418ca3zLirvxyCmPHzT5DLv2prGNFoPL8bs
         KWiM63/lxmZh3AOaGznO8k47wR/wKw7k9aE0HJzeh/eJYi/AGQejJ8Z0FSbWvtu5vmX9
         azUI4hslzIfcH43ttSBmRb55zmh9VZ1vxY/lyIemG58mbClJ7uu0nJMLn502Y+OYuJTk
         eD+apFcmtR2Tvw3Gds/0JCFVQW3yityNOmHElMx+o9WmRQWM2nxDPFYqWlUQMyDJvWAZ
         6frA==
X-Gm-Message-State: AOAM5306mF/WFHEExVdmBYlmCcSQ65bTabSLpbtp9O7c61BE1kV81lBo
	aLjjlIHpMItxte+btY1Vh1JMKNhd8RAvFw==
X-Google-Smtp-Source: 
 ABdhPJyZIn33bJUxO+7GHpIiLv4jv2lfVnxlsRKScVvJ/Oq1mUvvhKuFCAHQqf6kCP+NGCdEZrukiQ==
X-Received: by 2002:a17:902:f60a:: with SMTP id
 n10mr6998000plg.1.1644360793861;
        Tue, 08 Feb 2022 14:53:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 nm15sm1781228pjb.17.2022.02.08.14.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 14:53:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
Date: Tue,  8 Feb 2022 14:53:08 -0800
Message-Id: <20220208225310.1685131-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 22:53:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161531

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Package /usr/bin/ld.so in a separate package

ld.so is a new tool which is added as a symlink to original dynamic
linker so make it available with same name across architectures which is
useful to leveral features like  --preload, --audit, and --list-diagnostics
more accessible to end users

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.34.bb => cross-localedef-native_2.35.bb} |  16 +-
 meta/recipes-core/glibc/glibc-common.inc      |   2 +-
 ...bc-locale_2.34.bb => glibc-locale_2.35.bb} |   0
 ...bc-mtrace_2.34.bb => glibc-mtrace_2.35.bb} |   0
 meta/recipes-core/glibc/glibc-package.inc     |   4 +-
 ...-scripts_2.34.bb => glibc-scripts_2.35.bb} |   0
 ...libc-tests_2.34.bb => glibc-tests_2.35.bb} |   0
 ...tsuite_2.34.bb => glibc-testsuite_2.35.bb} |   0
 meta/recipes-core/glibc/glibc-version.inc     |   8 +-
 .../glibc/glibc/0001-CVE-2021-38604.patch     |  43 ---
 .../glibc/glibc/0001-CVE-2021-3998.patch      | 282 --------------
 .../glibc/glibc/0001-CVE-2021-3999.patch      |  36 --
 .../glibc/glibc/0001-CVE-2022-23218.patch     | 178 ---------
 .../glibc/glibc/0001-CVE-2022-23219.patch     |  55 ---
 ...d-failed-in-unprivileged-process-BZ-.patch |  79 ----
 ...dd-hardlink-resolver-from-util-linux.patch |   2 +-
 .../glibc/glibc/0002-CVE-2021-38604.patch     | 150 --------
 .../glibc/glibc/0002-CVE-2021-3998.patch      | 138 -------
 .../glibc/glibc/0002-CVE-2021-3999.patch      | 357 ------------------
 .../glibc/glibc/0002-CVE-2022-23218.patch     | 126 -------
 .../glibc/glibc/0002-CVE-2022-23219.patch     |  89 -----
 ...-fix-ups-hardlink-to-make-it-compile.patch |   2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |   8 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |   6 +-
 ...Raise-the-size-of-arrays-containing-.patch |  18 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  14 +-
 ...Make-relocatable-install-for-locales.patch |  16 +-
 ...Fall-back-to-faccessat-on-faccess2-r.patch |   2 +-
 ...he-path-sets-wrong-config-variables.patch} |   2 +-
 ...s-building-and-testing-instructions.patch} |   2 +-
 ...libc-Help-bootstrap-cross-toolchain.patch} |   8 +-
 ...glibc-Resolve-__fpscr_values-on-SH4.patch} |   2 +-
 ...ort-cross-locale-generation-support.patch} |  66 ++--
 ...archive-uses-a-hard-coded-locale-pa.patch} |  10 +-
 ...ybe-uninitialized-errors-with-Os-BZ.patch} |   6 +-
 ...E_KNOWN_INTERPRETER_NAMES-to-known-.patch} |   6 +-
 ...-the-header-between-arm-and-aarch64.patch} |  19 +-
 ...o-not-ask-compiler-for-finding-arch.patch} |   2 +-
 ...-printf-builtin-in-nscd-init-script.patch} |  47 ++-
 ...gure.ac-Set-libc_cv_rootsbindir-onl.patch} |  16 +-
 ...ll-interpreter-overridable-in-tzsel.patch} |  11 +-
 ...it-no-lines-in-bison-generated-files.patch |  31 --
 .../glibc/glibc/CVE-2021-43396.patch          | 184 ---------
 .../glibc/{glibc_2.34.bb => glibc_2.35.bb}    |  39 +-
 45 files changed, 172 insertions(+), 1912 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.34.bb => cross-localedef-native_2.35.bb} (76%)
 rename meta/recipes-core/glibc/{glibc-locale_2.34.bb => glibc-locale_2.35.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.34.bb => glibc-mtrace_2.35.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.34.bb => glibc-scripts_2.35.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-tests_2.34.bb => glibc-tests_2.35.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.34.bb => glibc-testsuite_2.35.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
 rename meta/recipes-core/glibc/glibc/{0016-yes-within-the-path-sets-wrong-config-variables.patch => 0009-yes-within-the-path-sets-wrong-config-variables.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0019-eglibc-Cross-building-and-testing-instructions.patch => 0010-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0020-eglibc-Help-bootstrap-cross-toolchain.patch => 0011-eglibc-Help-bootstrap-cross-toolchain.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0021-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0012-eglibc-Resolve-__fpscr_values-on-SH4.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0022-eglibc-Forward-port-cross-locale-generation-support.patch => 0013-eglibc-Forward-port-cross-locale-generation-support.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch => 0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch => 0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch => 0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch} (82%)
 rename meta/recipes-core/glibc/glibc/{0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch => 0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch} (78%)
 rename meta/recipes-core/glibc/glibc/{0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch => 0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0018-Remove-bash-dependency-for-nscd-init-script.patch => 0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch} (52%)
 rename meta/recipes-core/glibc/glibc/{0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch} (61%)
 rename meta/recipes-core/glibc/glibc/{0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch => 0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch} (86%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-43396.patch
 rename meta/recipes-core/glibc/{glibc_2.34.bb => glibc_2.35.bb} (73%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 372f8fe59a0..adaa11e0f8f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "11.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.37%"
 GDBVERSION ?= "11.%"
-GLIBCVERSION ?= "2.34"
+GLIBCVERSION ?= "2.35"
 LINUXLIBCVERSION ?= "5.16%"
 QEMUVERSION ?= "6.2%"
 GOVERSION ?= "1.17%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb b/meta/recipes-core/glibc/cross-localedef-native_2.35.bb
similarity index 76%
rename from meta/recipes-core/glibc/cross-localedef-native_2.34.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.35.bb
index c37814ee24e..893d3764592 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.35.bb
@@ -25,14 +25,14 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
            \
-           file://0018-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0019-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch \
-"
+           file://0010-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0011-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           "
 # Makes for a rather long rev (22 characters), but...
 #
 SRCREV_FORMAT = "glibc_localedef"
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index f695cd6a4af..098ebbc932d 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.34"
+PV = "2.35"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.34.bb b/meta/recipes-core/glibc/glibc-locale_2.35.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.34.bb
rename to meta/recipes-core/glibc/glibc-locale_2.35.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.34.bb b/meta/recipes-core/glibc/glibc-mtrace_2.35.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.34.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.35.bb
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 54e2a08906a..ca9d6e0531e 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libmemusage malloc-debug libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd ldso tzcode glibc-thread-db ${PN}-pic libmemusage malloc-debug libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES:${PN} = "eglibc rtld(GNU_HASH)"
@@ -23,12 +23,14 @@ ARCH_DYNAMIC_LOADER:aarch64 = "ld-linux-${TARGET_ARCH}.so.1"
 libc_baselibs:append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
 INSANE_SKIP:${PN}:append:aarch64 = " libdir"
 INSANE_SKIP:${PN}-dev += "staticdev"
+INSANE_SKIP:ldso:append = " dev-so"
 
 FILES:${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
 RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 FILES:ldconfig = "${base_sbindir}/ldconfig"
 FILES:ldd = "${bindir}/ldd"
 FILES:libsegfault = "${base_libdir}/libSegFault*"
+FILES:ldso = "${bindir}/ld.so"
 FILES:libmemusage = "${base_libdir}/libmemusage.so"
 FILES:malloc-debug = "${base_libdir}/libc_malloc_debug.so.0"
 FILES:libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so ${localstatedir}/db/Makefile ${localstatedir}/db/makedbs.sh"
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.34.bb b/meta/recipes-core/glibc/glibc-scripts_2.35.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.34.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.35.bb
diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-tests_2.34.bb
rename to meta/recipes-core/glibc/glibc-tests_2.35.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.34.bb b/meta/recipes-core/glibc/glibc-testsuite_2.35.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.34.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.35.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 281df7ecda8..080e905b6e1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
-SRCBRANCH ?= "release/2.34/master"
-PV = "2.34"
-SRCREV_glibc ?= "ae37d06c7d127817ba43850f0f898b793d42aea7"
-SRCREV_localedef ?= "95c0221703ad970a52445e9eaf91c4aff35eebef"
+SRCBRANCH ?= "release/2.35/master"
+PV = "2.35"
+SRCREV_glibc ?= "24962427071fa532c3c48c918e9d64d719cc8a6c"
+SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
deleted file mode 100644
index 1e94049004e..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b805aebd42364fe696e417808a700fdb9800c9e8 Mon Sep 17 00:00:00 2001
-From: Nikita Popov <npv1310@gmail.com>
-Date: Mon, 9 Aug 2021 20:17:34 +0530
-Subject: [PATCH] librt: fix NULL pointer dereference (bug 28213)
-
-Helper thread frees copied attribute on NOTIFY_REMOVED message
-received from the OS kernel.  Unfortunately, it fails to check whether
-copied attribute actually exists (data.attr != NULL).  This worked
-earlier because free() checks passed pointer before actually
-attempting to release corresponding memory.  But
-__pthread_attr_destroy assumes pointer is not NULL.
-
-So passing NULL pointer to __pthread_attr_destroy will result in
-segmentation fault.  This scenario is possible if
-notification->sigev_notify_attributes == NULL (which means default
-thread attributes should be used).
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=b805aebd42364fe696e417808a700fdb9800c9e8]
-CVE: CVE-2021-38604
-
-Signed-off-by: Nikita Popov <npv1310@gmail.com>
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
----
- sysdeps/unix/sysv/linux/mq_notify.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
-index 9799dcdaa4..eccae2e4c6 100644
---- a/sysdeps/unix/sysv/linux/mq_notify.c
-+++ b/sysdeps/unix/sysv/linux/mq_notify.c
-@@ -131,7 +131,7 @@ helper_thread (void *arg)
- 	       to wait until it is done with it.  */
- 	    (void) __pthread_barrier_wait (&notify_barrier);
- 	}
--      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
-+      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED && data.attr != NULL)
- 	{
- 	  /* The only state we keep is the copy of the thread attributes.  */
- 	  __pthread_attr_destroy (data.attr);
--- 
-2.31.1
-
diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
deleted file mode 100644
index c6bd5916e32..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
+++ /dev/null
@@ -1,282 +0,0 @@
-From fb7bff12e81c677a6622f724edd4d4987dd9d971 Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Date: Tue, 18 Jan 2022 13:29:36 +0530
-Subject: [PATCH] support: Add helpers to create paths longer than PATH_MAX
-
-Add new helpers support_create_and_chdir_toolong_temp_directory and
-support_chdir_toolong_temp_directory to create and descend into
-directory trees longer than PATH_MAX.
-
-Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
-Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=062ff490c1467059f6cd64bb9c3d85f6cc6cf97a]
-CVE: CVE-2021-3998
-
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- support/temp_file.c | 159 +++++++++++++++++++++++++++++++++++++++++---
- support/temp_file.h |   9 +++
- 2 files changed, 159 insertions(+), 9 deletions(-)
-
-diff --git a/support/temp_file.c b/support/temp_file.c
-index e7bb8aadb9..e41128c2d4 100644
---- a/support/temp_file.c
-+++ b/support/temp_file.c
-@@ -1,5 +1,6 @@
- /* Temporary file handling for tests.
-    Copyright (C) 1998-2021 Free Software Foundation, Inc.
-+   Copyright The GNU Tools Authors.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -20,15 +21,17 @@
-    some 32-bit platforms. */
- #define _FILE_OFFSET_BITS 64
- 
-+#include <support/check.h>
- #include <support/temp_file.h>
- #include <support/temp_file-internal.h>
- #include <support/support.h>
- 
-+#include <errno.h>
- #include <paths.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <unistd.h>
-+#include <xunistd.h>
- 
- /* List of temporary files.  */
- static struct temp_name_list
-@@ -36,14 +39,20 @@ static struct temp_name_list
-   struct temp_name_list *next;
-   char *name;
-   pid_t owner;
-+  bool toolong;
- } *temp_name_list;
- 
- /* Location of the temporary files.  Set by the test skeleton via
-    support_set_test_dir.  The string is not be freed.  */
- static const char *test_dir = _PATH_TMP;
- 
--void
--add_temp_file (const char *name)
-+/* Name of subdirectories in a too long temporary directory tree.  */
-+static char toolong_subdir[NAME_MAX + 1];
-+static bool toolong_initialized;
-+static size_t toolong_path_max;
-+
-+static void
-+add_temp_file_internal (const char *name, bool toolong)
- {
-   struct temp_name_list *newp
-     = (struct temp_name_list *) xcalloc (sizeof (*newp), 1);
-@@ -53,12 +62,19 @@ add_temp_file (const char *name)
-       newp->name = newname;
-       newp->next = temp_name_list;
-       newp->owner = getpid ();
-+      newp->toolong = toolong;
-       temp_name_list = newp;
-     }
-   else
-     free (newp);
- }
- 
-+void
-+add_temp_file (const char *name)
-+{
-+  add_temp_file_internal (name, false);
-+}
-+
- int
- create_temp_file_in_dir (const char *base, const char *dir, char **filename)
- {
-@@ -90,8 +106,8 @@ create_temp_file (const char *base, char
-   return create_temp_file_in_dir (base, test_dir, filename);
- }
- 
--char *
--support_create_temp_directory (const char *base)
-+static char *
-+create_temp_directory_internal (const char *base, bool toolong)
- {
-   char *path = xasprintf ("%s/%sXXXXXX", test_dir, base);
-   if (mkdtemp (path) == NULL)
-@@ -99,16 +115,132 @@ support_create_temp_directory (const cha
-       printf ("error: mkdtemp (\"%s\"): %m", path);
-       exit (1);
-     }
--  add_temp_file (path);
-+  add_temp_file_internal (path, toolong);
-   return path;
- }
- 
--/* Helper functions called by the test skeleton follow.  */
-+char *
-+support_create_temp_directory (const char *base)
-+{
-+  return create_temp_directory_internal (base, false);
-+}
-+
-+static void
-+ensure_toolong_initialized (void)
-+{
-+  if (!toolong_initialized)
-+    FAIL_EXIT1 ("uninitialized toolong directory tree\n");
-+}
-+
-+static void
-+initialize_toolong (const char *base)
-+{
-+  long name_max = pathconf (base, _PC_NAME_MAX);
-+  name_max = (name_max < 0 ? 64
-+	      : (name_max < sizeof (toolong_subdir) ? name_max
-+		 : sizeof (toolong_subdir) - 1));
-+
-+  long path_max = pathconf (base, _PC_PATH_MAX);
-+  path_max = (path_max < 0 ? 1024
-+	      : path_max <= PTRDIFF_MAX ? path_max : PTRDIFF_MAX);
-+
-+  /* Sanity check to ensure that the test does not create temporary directories
-+     in different filesystems because this API doesn't support it.  */
-+  if (toolong_initialized)
-+    {
-+      if (name_max != strlen (toolong_subdir))
-+	FAIL_UNSUPPORTED ("name_max: Temporary directories in different"
-+			  " filesystems not supported yet\n");
-+      if (path_max != toolong_path_max)
-+	FAIL_UNSUPPORTED ("path_max: Temporary directories in different"
-+			  " filesystems not supported yet\n");
-+      return;
-+    }
-+
-+  toolong_path_max = path_max;
-+
-+  size_t len = name_max;
-+  memset (toolong_subdir, 'X', len);
-+  toolong_initialized = true;
-+}
-+
-+char *
-+support_create_and_chdir_toolong_temp_directory (const char *basename)
-+{
-+  char *base = create_temp_directory_internal (basename, true);
-+  xchdir (base);
-+
-+  initialize_toolong (base);
-+
-+  size_t sz = strlen (toolong_subdir);
-+
-+  /* Create directories and descend into them so that the final path is larger
-+     than PATH_MAX.  */
-+  for (size_t i = 0; i <= toolong_path_max / sz; i++)
-+    {
-+      int ret = mkdir (toolong_subdir, S_IRWXU);
-+      if (ret != 0 && errno == ENAMETOOLONG)
-+	FAIL_UNSUPPORTED ("Filesystem does not support creating too long "
-+			  "directory trees\n");
-+      else if (ret != 0)
-+	FAIL_EXIT1 ("Failed to create directory tree: %m\n");
-+      xchdir (toolong_subdir);
-+    }
-+  return base;
-+}
- 
- void
--support_set_test_dir (const char *path)
-+support_chdir_toolong_temp_directory (const char *base)
- {
--  test_dir = path;
-+  ensure_toolong_initialized ();
-+
-+  xchdir (base);
-+
-+  size_t sz = strlen (toolong_subdir);
-+  for (size_t i = 0; i <= toolong_path_max / sz; i++)
-+    xchdir (toolong_subdir);
-+}
-+
-+/* Helper functions called by the test skeleton follow.  */
-+
-+static void
-+remove_toolong_subdirs (const char *base)
-+{
-+  ensure_toolong_initialized ();
-+
-+  if (chdir (base) != 0)
-+    {
-+      printf ("warning: toolong cleanup base failed: chdir (\"%s\"): %m\n",
-+	      base);
-+      return;
-+    }
-+
-+  /* Descend.  */
-+  int levels = 0;
-+  size_t sz = strlen (toolong_subdir);
-+  for (levels = 0; levels <= toolong_path_max / sz; levels++)
-+    if (chdir (toolong_subdir) != 0)
-+      {
-+	printf ("warning: toolong cleanup failed: chdir (\"%s\"): %m\n",
-+		toolong_subdir);
-+	break;
-+      }
-+
-+  /* Ascend and remove.  */
-+  while (--levels >= 0)
-+    {
-+      if (chdir ("..") != 0)
-+	{
-+	  printf ("warning: toolong cleanup failed: chdir (\"..\"): %m\n");
-+	  return;
-+	}
-+      if (remove (toolong_subdir) != 0)
-+	{
-+	  printf ("warning: could not remove subdirectory: %s: %m\n",
-+		  toolong_subdir);
-+	  return;
-+	}
-+    }
- }
- 
- void
-@@ -123,6 +255,9 @@ support_delete_temp_files (void)
- 	 around, to prevent PID reuse.)  */
-       if (temp_name_list->owner == pid)
- 	{
-+	  if (temp_name_list->toolong)
-+	    remove_toolong_subdirs (temp_name_list->name);
-+
- 	  if (remove (temp_name_list->name) != 0)
- 	    printf ("warning: could not remove temporary file: %s: %m\n",
- 		    temp_name_list->name);
-@@ -147,3 +282,9 @@ support_print_temp_files (FILE *f)
-       fprintf (f, ")\n");
-     }
- }
-+
-+void
-+support_set_test_dir (const char *path)
-+{
-+  test_dir = path;
-+}
-diff --git a/support/temp_file.h b/support/temp_file.h
-index 50a443abe4..8459ddda72 100644
---- a/support/temp_file.h
-+++ b/support/temp_file.h
-@@ -44,6 +44,15 @@ int create_temp_file_in_dir (const char
-    returns.  The caller should free this string.  */
- char *support_create_temp_directory (const char *base);
- 
-+/* Create a temporary directory tree that is longer than PATH_MAX and schedule
-+   it for deletion.  BASENAME is used as a prefix for the unique directory
-+   name, which the function returns.  The caller should free this string.  */
-+char *support_create_and_chdir_toolong_temp_directory (const char *basename);
-+
-+/* Change into the innermost directory of the directory tree BASE, which was
-+   created using support_create_and_chdir_toolong_temp_directory.  */
-+void support_chdir_toolong_temp_directory (const char *base);
-+
- __END_DECLS
- 
- #endif /* SUPPORT_TEMP_FILE_H */
diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch
deleted file mode 100644
index 64749390b57..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8c8a71c85f2ed5cc90d08d82ce645513fc907cb6 Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Date: Mon, 24 Jan 2022 10:57:09 +0530
-Subject: [PATCH] tst-realpath-toolong: Fix hurd build
-
-Define PATH_MAX to a constant if it isn't already defined, like in hurd.
-
-Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-(cherry picked from commit 976db046bc3a3738f69255ae00b0a09b8e77fd9c)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=8c8a71c85f2ed5cc90d08d82ce645513fc907cb6]
-CVE: CVE-2021-3999
-
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- stdlib/tst-realpath-toolong.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/stdlib/tst-realpath-toolong.c b/stdlib/tst-realpath-toolong.c
-index 8bed772460..4388890294 100644
---- a/stdlib/tst-realpath-toolong.c
-+++ b/stdlib/tst-realpath-toolong.c
-@@ -29,6 +29,10 @@
- 
- #define BASENAME "tst-realpath-toolong."
- 
-+#ifndef PATH_MAX
-+# define PATH_MAX 1024
-+#endif
-+
- int
- do_test (void)
- {
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
deleted file mode 100644
index 4eb1fb7fbed..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From e368b12f6c16b6888dda99ba641e999b9c9643c8 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Jan 2022 10:21:34 +0100
-Subject: [PATCH] socket: Add the __sockaddr_un_set function
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=e368b12f6c16b6888dda99ba641e999b9c9643c8]
-CVE: CVE-2022-23219
-
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- include/sys/un.h             | 12 +++++++
- socket/Makefile              |  6 +++-
- socket/sockaddr_un_set.c     | 41 ++++++++++++++++++++++++
- socket/tst-sockaddr_un_set.c | 62 ++++++++++++++++++++++++++++++++++++
- 4 files changed, 120 insertions(+), 1 deletion(-)
- create mode 100644 socket/sockaddr_un_set.c
- create mode 100644 socket/tst-sockaddr_un_set.c
-
-diff --git a/include/sys/un.h b/include/sys/un.h
-index bdbee99980..152afd9fc7 100644
---- a/include/sys/un.h
-+++ b/include/sys/un.h
-@@ -1 +1,13 @@
- #include <socket/sys/un.h>
-+
-+#ifndef _ISOMAC
-+
-+/* Set ADDR->sun_family to AF_UNIX and ADDR->sun_path to PATHNAME.
-+   Return 0 on success or -1 on failure (due to overlong PATHNAME).
-+   The caller should always use sizeof (struct sockaddr_un) as the
-+   socket address length, disregaring the length of PATHNAME.
-+   Only concrete (non-abstract) pathnames are supported.  */
-+int __sockaddr_un_set (struct sockaddr_un *addr, const char *pathname)
-+  attribute_hidden;
-+
-+#endif /* _ISOMAC */
-diff --git a/socket/Makefile b/socket/Makefile
-index 39333e10ca..156eec6c85 100644
---- a/socket/Makefile
-+++ b/socket/Makefile
-@@ -29,13 +29,17 @@ headers	:= sys/socket.h sys/un.h bits/sockaddr.h bits/socket.h \
- routines := accept bind connect getpeername getsockname getsockopt	\
- 	    listen recv recvfrom recvmsg send sendmsg sendto		\
- 	    setsockopt shutdown socket socketpair isfdtype opensock	\
--	    sockatmark accept4 recvmmsg sendmmsg
-+	    sockatmark accept4 recvmmsg sendmmsg sockaddr_un_set
- 
- tests := \
-   tst-accept4 \
-   tst-sockopt \
-   # tests
- 
-+tests-internal := \
-+  tst-sockaddr_un_set \
-+  # tests-internal
-+
- tests-time64 := \
-   tst-sockopt-time64 \
-   # tests
-diff --git a/socket/sockaddr_un_set.c b/socket/sockaddr_un_set.c
-new file mode 100644
-index 0000000000..0bd40dc34e
---- /dev/null
-+++ b/socket/sockaddr_un_set.c
-@@ -0,0 +1,41 @@
-+/* Set the sun_path member of struct sockaddr_un.
-+   Copyright (C) 2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <string.h>
-+#include <sys/socket.h>
-+#include <sys/un.h>
-+
-+int
-+__sockaddr_un_set (struct sockaddr_un *addr, const char *pathname)
-+{
-+  size_t name_length = strlen (pathname);
-+
-+  /* The kernel supports names of exactly sizeof (addr->sun_path)
-+     bytes, without a null terminator, but userspace does not; see the
-+     SUN_LEN macro.  */
-+  if (name_length >= sizeof (addr->sun_path))
-+    {
-+      __set_errno (EINVAL);     /* Error code used by the kernel.  */
-+      return -1;
-+    }
-+
-+  addr->sun_family = AF_UNIX;
-+  memcpy (addr->sun_path, pathname, name_length + 1);
-+  return 0;
-+}
-diff --git a/socket/tst-sockaddr_un_set.c b/socket/tst-sockaddr_un_set.c
-new file mode 100644
-index 0000000000..29c2a81afd
---- /dev/null
-+++ b/socket/tst-sockaddr_un_set.c
-@@ -0,0 +1,62 @@
-+/* Test the __sockaddr_un_set function.
-+   Copyright (C) 2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+/* Re-compile the function because the version in libc is not
-+   exported.  */
-+#include "sockaddr_un_set.c"
-+
-+#include <support/check.h>
-+
-+static int
-+do_test (void)
-+{
-+  struct sockaddr_un sun;
-+
-+  memset (&sun, 0xcc, sizeof (sun));
-+  __sockaddr_un_set (&sun, "");
-+  TEST_COMPARE (sun.sun_family, AF_UNIX);
-+  TEST_COMPARE (__sockaddr_un_set (&sun, ""), 0);
-+
-+  memset (&sun, 0xcc, sizeof (sun));
-+  TEST_COMPARE (__sockaddr_un_set (&sun, "/example"), 0);
-+  TEST_COMPARE_STRING (sun.sun_path, "/example");
-+
-+  {
-+    char pathname[108];         /* Length of sun_path (ABI constant).  */
-+    memset (pathname, 'x', sizeof (pathname));
-+    pathname[sizeof (pathname) - 1] = '\0';
-+    memset (&sun, 0xcc, sizeof (sun));
-+    TEST_COMPARE (__sockaddr_un_set (&sun, pathname), 0);
-+    TEST_COMPARE (sun.sun_family, AF_UNIX);
-+    TEST_COMPARE_STRING (sun.sun_path, pathname);
-+  }
-+
-+  {
-+    char pathname[109];
-+    memset (pathname, 'x', sizeof (pathname));
-+    pathname[sizeof (pathname) - 1] = '\0';
-+    memset (&sun, 0xcc, sizeof (sun));
-+    errno = 0;
-+    TEST_COMPARE (__sockaddr_un_set (&sun, pathname), -1);
-+    TEST_COMPARE (errno, EINVAL);
-+  }
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
deleted file mode 100644
index 261c2909db6..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 226b46770c82899b555986583294b049c6ec9b40 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Jan 2022 10:21:34 +0100
-Subject: [PATCH] CVE-2022-23219: Buffer overflow in sunrpc clnt_create for
- "unix" (bug 22542)
-
-Processing an overlong pathname in the sunrpc clnt_create function
-results in a stack-based buffer overflow.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=226b46770c82899b555986583294b049c6ec9b40]
-CVE: CVE-2022-23219
-
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- NEWS              |  4 +++-
- sunrpc/clnt_gen.c | 10 +++++++---
- 2 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index ddd95a8329..38a9ddb2cf 100644
---- a/NEWS
-+++ b/NEWS
-@@ -206,6 +206,10 @@ Security related changes:
-   CVE-2022-23218: Passing an overlong file name to the svcunix_create
-   legacy function could result in a stack-based buffer overflow.
- 
-+  CVE-2022-23219: Passing an overlong file name to the clnt_create
-+  legacy function could result in a stack-based buffer overflow when
-+  using the "unix" protocol.  Reported by Martin Sebor.
-+
- The following bugs are resolved with this release:
- 
-   [4737] libc: fork is not async-signal-safe
-diff --git a/sunrpc/clnt_gen.c b/sunrpc/clnt_gen.c
-index 13ced8994e..b44357cd88 100644
---- a/sunrpc/clnt_gen.c
-+++ b/sunrpc/clnt_gen.c
-@@ -57,9 +57,13 @@ clnt_create (const char *hostname, u_lon
- 
-   if (strcmp (proto, "unix") == 0)
-     {
--      memset ((char *)&sun, 0, sizeof (sun));
--      sun.sun_family = AF_UNIX;
--      strcpy (sun.sun_path, hostname);
-+      if (__sockaddr_un_set (&sun, hostname) < 0)
-+	{
-+	  struct rpc_createerr *ce = &get_rpc_createerr ();
-+	  ce->cf_stat = RPC_SYSTEMERROR;
-+	  ce->cf_error.re_errno = errno;
-+	  return NULL;
-+	}
-       sock = RPC_ANYSOCK;
-       client = clntunix_create (&sun, prog, vers, &sock, 0, 0);
-       if (client == NULL)
diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
deleted file mode 100644
index 3283dd7ad8a..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sun, 29 Aug 2021 20:49:16 +0800
-Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
-
-Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clone3]
-applied, start a unprivileged container (docker run without --privileged),
-it creates a thread failed in container.
-
-In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
-__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
-
-As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
-CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
-was specified by an unprivileged process (process without CAP_SYS_ADMIN)
-
-[1] https://man7.org/linux/man-pages/man2/clone3.2.html
-
-So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
-fix the issue. Here are the test steps:
-
-1) Prepare test code
-cat > conftest.c <<ENDOF
- #include <pthread.h>
- #include <stdio.h>
-
-int check_me = 0;
-void* func(void* data) {check_me = 42; printf("start thread: check_me %d\n", check_me); return &check_me;}
-int main()
-{
-  pthread_t t;
-  void *ret;
-  pthread_create (&t, 0, func, 0);
-  pthread_join (t, &ret);
-  printf("check_me %d, p %p\n", check_me, &ret);
-  return (check_me != 42 || ret != &check_me);
-}
-
-ENDOF
-
-2) Compile
-gcc -o conftest -pthread conftest.c
-
-3) Start a container with glibc 2.34 installed
-[skip details]
-docker run -it <container-image-name> bash
-
-4) Run conftest without this patch
-$ ./conftest
-check_me 0, p 0x7ffd91ccd400
-
-5) Run conftest with this patch
-$ ./conftest
-start thread: check_me 42
-check_me 42, p 0x7ffe253c6f20
-
-Upstream-Status: Submitted [libc-alpha@sourceware.org]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
-index 979f7880be..97101994e8 100644
---- a/sysdeps/unix/sysv/linux/clone-internal.c
-+++ b/sysdeps/unix/sysv/linux/clone-internal.c
-@@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
-   /* Try clone3 first.  */
-   int saved_errno = errno;
-   ret = __clone3 (cl_args, sizeof (*cl_args), func, arg);
--  if (ret != -1 || errno != ENOSYS)
-+  if (ret != -1 || (errno != ENOSYS && errno != EPERM))
-     return ret;
- 
-   /* NB: Restore errno since errno may be checked against non-zero
--- 
-2.30.2
-
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index 3ff485b1e3b..546fe582149 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From d34ba0833cd811f8869a6262044af55f9e7b59d8 Mon Sep 17 00:00:00 2001
+From 8778429a3345bb5c0361332cf5103f394717a396 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
deleted file mode 100644
index 9f71fecddbc..00000000000
--- a/meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 4cc79c217744743077bf7a0ec5e0a4318f1e6641 Mon Sep 17 00:00:00 2001
-From: Nikita Popov <npv1310@gmail.com>
-Date: Thu, 12 Aug 2021 16:09:50 +0530
-Subject: [PATCH] librt: add test (bug 28213)
-
-This test implements following logic:
-1) Create POSIX message queue.
-   Register a notification with mq_notify (using NULL attributes).
-   Then immediately unregister the notification with mq_notify.
-   Helper thread in a vulnerable version of glibc
-   should cause NULL pointer dereference after these steps.
-2) Once again, register the same notification.
-   Try to send a dummy message.
-   Test is considered successfulif the dummy message
-   is successfully received by the callback function.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=4cc79c217744743077bf7a0ec5e0a4318f1e6641]
-CVE: CVE-2021-38604
-
-Signed-off-by: Nikita Popov <npv1310@gmail.com>
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
----
- rt/Makefile      |   1 +
- rt/tst-bz28213.c | 101 +++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 102 insertions(+)
- create mode 100644 rt/tst-bz28213.c
-
-diff --git a/rt/Makefile b/rt/Makefile
-index 113cea03a5..910e775995 100644
---- a/rt/Makefile
-+++ b/rt/Makefile
-@@ -74,6 +74,7 @@ tests := tst-shm tst-timer tst-timer2 \
- 	 tst-aio7 tst-aio8 tst-aio9 tst-aio10 \
- 	 tst-mqueue1 tst-mqueue2 tst-mqueue3 tst-mqueue4 \
- 	 tst-mqueue5 tst-mqueue6 tst-mqueue7 tst-mqueue8 tst-mqueue9 \
-+	 tst-bz28213 \
- 	 tst-timer3 tst-timer4 tst-timer5 \
- 	 tst-cpuclock2 tst-cputimer1 tst-cputimer2 tst-cputimer3 \
- 	 tst-shm-cancel \
-diff --git a/rt/tst-bz28213.c b/rt/tst-bz28213.c
-new file mode 100644
-index 0000000000..0c096b5a0a
---- /dev/null
-+++ b/rt/tst-bz28213.c
-@@ -0,0 +1,101 @@
-+/* Bug 28213: test for NULL pointer dereference in mq_notify.
-+   Copyright (C) The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
-+#include <unistd.h>
-+#include <mqueue.h>
-+#include <signal.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <support/check.h>
-+
-+static mqd_t m = -1;
-+static const char msg[] = "hello";
-+
-+static void
-+check_bz28213_cb (union sigval sv)
-+{
-+  char buf[sizeof (msg)];
-+
-+  (void) sv;
-+
-+  TEST_VERIFY_EXIT ((size_t) mq_receive (m, buf, sizeof (buf), NULL)
-+		    == sizeof (buf));
-+  TEST_VERIFY_EXIT (memcmp (buf, msg, sizeof (buf)) == 0);
-+
-+  exit (0);
-+}
-+
-+static void
-+check_bz28213 (void)
-+{
-+  struct sigevent sev;
-+
-+  memset (&sev, '\0', sizeof (sev));
-+  sev.sigev_notify = SIGEV_THREAD;
-+  sev.sigev_notify_function = check_bz28213_cb;
-+
-+  /* Step 1: Register & unregister notifier.
-+     Helper thread should receive NOTIFY_REMOVED notification.
-+     In a vulnerable version of glibc, NULL pointer dereference follows. */
-+  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
-+  TEST_VERIFY_EXIT (mq_notify (m, NULL) == 0);
-+
-+  /* Step 2: Once again, register notification.
-+     Try to send one message.
-+     Test is considered successful, if the callback does exit (0). */
-+  TEST_VERIFY_EXIT (mq_notify (m, &sev) == 0);
-+  TEST_VERIFY_EXIT (mq_send (m, msg, sizeof (msg), 1) == 0);
-+
-+  /* Wait... */
-+  pause ();
-+}
-+
-+static int
-+do_test (void)
-+{
-+  static const char m_name[] = "/bz28213_queue";
-+  struct mq_attr m_attr;
-+
-+  memset (&m_attr, '\0', sizeof (m_attr));
-+  m_attr.mq_maxmsg = 1;
-+  m_attr.mq_msgsize = sizeof (msg);
-+
-+  m = mq_open (m_name,
-+               O_RDWR | O_CREAT | O_EXCL,
-+               0600,
-+               &m_attr);
-+
-+  if (m < 0)
-+    {
-+      if (errno == ENOSYS)
-+        FAIL_UNSUPPORTED ("POSIX message queues are not implemented\n");
-+      FAIL_EXIT1 ("Failed to create POSIX message queue: %m\n");
-+    }
-+
-+  TEST_VERIFY_EXIT (mq_unlink (m_name) == 0);
-+
-+  check_bz28213 ();
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
--- 
-2.31.1
-
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
deleted file mode 100644
index 0a4c34452d1..00000000000
--- a/meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From f7a79879c0b2bef0dadd6caaaeeb0d26423e04e5 Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Date: Thu, 13 Jan 2022 11:28:36 +0530
-Subject: [PATCH] realpath: Set errno to ENAMETOOLONG for result larger than
- PATH_MAX [BZ #28770]
-
-realpath returns an allocated string when the result exceeds PATH_MAX,
-which is unexpected when its second argument is not NULL.  This results
-in the second argument (resolved) being uninitialized and also results
-in a memory leak since the caller expects resolved to be the same as the
-returned value.
-
-Return NULL and set errno to ENAMETOOLONG if the result exceeds
-PATH_MAX.  This fixes [BZ #28770], which is CVE-2021-3998.
-
-Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
-Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-(cherry picked from commit ee8d5e33adb284601c00c94687bc907e10aec9bb)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f7a79879c0b2bef0dadd6caaaeeb0d26423e04e5]
-CVE: CVE-2021-3998
-
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- NEWS                          |  4 +++
- stdlib/Makefile               |  1 +
- stdlib/canonicalize.c         | 12 +++++++--
- stdlib/tst-realpath-toolong.c | 49 +++++++++++++++++++++++++++++++++++
- 4 files changed, 64 insertions(+), 2 deletions(-)
- create mode 100644 stdlib/tst-realpath-toolong.c
-
-diff --git a/NEWS b/NEWS
-index 7e773bd005..b4f81c2668 100644
---- a/NEWS
-+++ b/NEWS
-@@ -210,6 +210,10 @@ Security related changes:
-   legacy function could result in a stack-based buffer overflow when
-   using the "unix" protocol.  Reported by Martin Sebor.
- 
-+  CVE-2021-3998: Passing a path longer than PATH_MAX to the realpath
-+  function could result in a memory leak and potential access of
-+  uninitialized memory.  Reported by Qualys.
-+
- The following bugs are resolved with this release:
- 
-   [4737] libc: fork is not async-signal-safe
-diff --git a/stdlib/canonicalize.c b/stdlib/canonicalize.c
-index 698f9ede25..7a23a51b3a 100644
---- a/stdlib/canonicalize.c
-+++ b/stdlib/canonicalize.c
-@@ -400,8 +400,16 @@ realpath_stk (const char *name, char *re
- 
- error:
-   *dest++ = '\0';
--  if (resolved != NULL && dest - rname <= get_path_max ())
--    rname = strcpy (resolved, rname);
-+  if (resolved != NULL)
-+    {
-+      if (dest - rname <= get_path_max ())
-+	rname = strcpy (resolved, rname);
-+      else
-+	{
-+	  failed = true;
-+	  __set_errno (ENAMETOOLONG);
-+	}
-+    }
- 
- error_nomem:
-   scratch_buffer_free (&extra_buffer);
-diff --git a/stdlib/Makefile b/stdlib/Makefile
-index 9bb5c221e8..a4ac30d1f6 100644
---- a/stdlib/Makefile
-+++ b/stdlib/Makefile
-@@ -88,7 +88,8 @@ tests		:= tst-strtol tst-strtod testmb t
- 		   tst-swapcontext1 tst-setcontext4 tst-setcontext5 \
- 		   tst-setcontext6 tst-setcontext7 tst-setcontext8 \
- 		   tst-setcontext9 tst-bz20544 tst-canon-bz26341 \
--		   tst-realpath
-+		   tst-realpath \
-+		   tst-realpath-toolong
- 
- tests-internal	:= tst-strtod1i tst-strtod3 tst-strtod4 tst-strtod5i \
- 		   tst-tls-atexit tst-tls-atexit-nodelete
-diff --git a/stdlib/tst-realpath-toolong.c b/stdlib/tst-realpath-toolong.c
-new file mode 100644
-index 0000000000..8bed772460
---- /dev/null
-+++ b/stdlib/tst-realpath-toolong.c
-@@ -0,0 +1,49 @@
-+/* Verify that realpath returns NULL with ENAMETOOLONG if the result exceeds
-+   NAME_MAX.
-+   Copyright The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <limits.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <unistd.h>
-+#include <support/check.h>
-+#include <support/temp_file.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+
-+#define BASENAME "tst-realpath-toolong."
-+
-+int
-+do_test (void)
-+{
-+  char *base = support_create_and_chdir_toolong_temp_directory (BASENAME);
-+
-+  char buf[PATH_MAX + 1];
-+  const char *res = realpath (".", buf);
-+
-+  /* canonicalize.c states that if the real path is >= PATH_MAX, then
-+     realpath returns NULL and sets ENAMETOOLONG.  */
-+  TEST_VERIFY (res == NULL);
-+  TEST_VERIFY (errno == ENAMETOOLONG);
-+
-+  free (base);
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch
deleted file mode 100644
index ef3a504fdfb..00000000000
--- a/meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch
+++ /dev/null
@@ -1,357 +0,0 @@
-From 472e799a5f2102bc0c3206dbd5a801765fceb39c Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Date: Fri, 21 Jan 2022 23:32:56 +0530
-Subject: [PATCH] getcwd: Set errno to ERANGE for size == 1 (CVE-2021-3999)
-
-No valid path returned by getcwd would fit into 1 byte, so reject the
-size early and return NULL with errno set to ERANGE.  This change is
-prompted by CVE-2021-3999, which describes a single byte buffer
-underflow and overflow when all of the following conditions are met:
-
-- The buffer size (i.e. the second argument of getcwd) is 1 byte
-- The current working directory is too long
-- '/' is also mounted on the current working directory
-
-Sequence of events:
-
-- In sysdeps/unix/sysv/linux/getcwd.c, the syscall returns ENAMETOOLONG
-  because the linux kernel checks for name length before it checks
-  buffer size
-
-- The code falls back to the generic getcwd in sysdeps/posix
-
-- In the generic func, the buf[0] is set to '\0' on line 250
-
-- this while loop on line 262 is bypassed:
-
-    while (!(thisdev == rootdev && thisino == rootino))
-
-  since the rootfs (/) is bind mounted onto the directory and the flow
-  goes on to line 449, where it puts a '/' in the byte before the
-  buffer.
-
-- Finally on line 458, it moves 2 bytes (the underflowed byte and the
-  '\0') to the buf[0] and buf[1], resulting in a 1 byte buffer overflow.
-
-- buf is returned on line 469 and errno is not set.
-
-This resolves BZ #28769.
-
-Reviewed-by: Andreas Schwab <schwab@linux-m68k.org>
-Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
-Signed-off-by: Qualys Security Advisory <qsa@qualys.com>
-Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-(cherry picked from commit 23e0e8f5f1fb5ed150253d986ecccdc90c2dcd5e)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=472e799a5f2102bc0c3206dbd5a801765fceb39c]
-CVE: CVE-2021-3999
-
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- NEWS                                          |   6 +
- sysdeps/posix/getcwd.c                        |   7 +
- sysdeps/unix/sysv/linux/Makefile              |   7 +-
- .../unix/sysv/linux/tst-getcwd-smallbuff.c    | 241 ++++++++++++++++++
- 4 files changed, 260 insertions(+), 1 deletion(-)
- create mode 100644 sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c
-
-diff --git a/NEWS b/NEWS
-index b4f81c2668..8d7467d2c1 100644
---- a/NEWS
-+++ b/NEWS
-@@ -214,6 +214,12 @@ Security related changes:
-   function could result in a memory leak and potential access of
-   uninitialized memory.  Reported by Qualys.
- 
-+  CVE-2021-3999: Passing a buffer of size exactly 1 byte to the getcwd
-+  function may result in an off-by-one buffer underflow and overflow
-+  when the current working directory is longer than PATH_MAX and also
-+  corresponds to the / directory through an unprivileged mount
-+  namespace.  Reported by Qualys.
-+
- The following bugs are resolved with this release:
- 
-   [4737] libc: fork is not async-signal-safe
-diff --git a/sysdeps/posix/getcwd.c b/sysdeps/posix/getcwd.c
-index 13680026ff..b6984a382c 100644
---- a/sysdeps/posix/getcwd.c
-+++ b/sysdeps/posix/getcwd.c
-@@ -187,6 +187,13 @@ __getcwd_generic (char *buf, size_t size
-   size_t allocated = size;
-   size_t used;
- 
-+  /* A size of 1 byte is never useful.  */
-+  if (allocated == 1)
-+    {
-+      __set_errno (ERANGE);
-+      return NULL;
-+    }
-+
- #if HAVE_MINIMALLY_WORKING_GETCWD
-   /* If AT_FDCWD is not defined, the algorithm below is O(N**2) and
-      this is much slower than the system getcwd (at least on
-diff --git a/sysdeps/unix/sysv/linux/Makefile b/sysdeps/unix/sysv/linux/Makefile
-index 76ad06361c..9380d3848d 100644
---- a/sysdeps/unix/sysv/linux/Makefile
-+++ b/sysdeps/unix/sysv/linux/Makefile
-@@ -331,7 +331,12 @@ sysdep_routines += xstatconv internal_st
- 
- sysdep_headers += bits/fcntl-linux.h
- 
--tests += tst-fallocate tst-fallocate64 tst-o_path-locks
-+tests += \
-+  tst-fallocate \
-+  tst-fallocate64 \
-+  tst-getcwd-smallbuff \
-+  tst-o_path-locks \
-+# tests
- endif
- 
- ifeq ($(subdir),elf)
-diff --git a/sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c b/sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c
-new file mode 100644
-index 0000000000..d460d6e766
---- /dev/null
-+++ b/sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c
-@@ -0,0 +1,241 @@
-+/* Verify that getcwd returns ERANGE for size 1 byte and does not underflow
-+   buffer when the CWD is too long and is also a mount target of /.  See bug
-+   #28769 or CVE-2021-3999 for more context.
-+   Copyright The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <fcntl.h>
-+#include <intprops.h>
-+#include <limits.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <sys/mount.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
-+#include <sys/wait.h>
-+
-+#include <sys/socket.h>
-+#include <sys/un.h>
-+#include <support/check.h>
-+#include <support/temp_file.h>
-+#include <support/xsched.h>
-+#include <support/xunistd.h>
-+
-+static char *base;
-+#define BASENAME "tst-getcwd-smallbuff"
-+#define MOUNT_NAME "mpoint"
-+static int sockfd[2];
-+
-+static void
-+do_cleanup (void)
-+{
-+  support_chdir_toolong_temp_directory (base);
-+  TEST_VERIFY_EXIT (rmdir (MOUNT_NAME) == 0);
-+  free (base);
-+}
-+
-+static void
-+send_fd (const int sock, const int fd)
-+{
-+  struct msghdr msg = {0};
-+  union
-+    {
-+      struct cmsghdr hdr;
-+      char buf[CMSG_SPACE (sizeof (int))];
-+    } cmsgbuf = {0};
-+  struct cmsghdr *cmsg;
-+  struct iovec vec;
-+  char ch = 'A';
-+  ssize_t n;
-+
-+  msg.msg_control = &cmsgbuf.buf;
-+  msg.msg_controllen = sizeof (cmsgbuf.buf);
-+
-+  cmsg = CMSG_FIRSTHDR (&msg);
-+  cmsg->cmsg_len = CMSG_LEN (sizeof (int));
-+  cmsg->cmsg_level = SOL_SOCKET;
-+  cmsg->cmsg_type = SCM_RIGHTS;
-+  memcpy (CMSG_DATA (cmsg), &fd, sizeof (fd));
-+
-+  vec.iov_base = &ch;
-+  vec.iov_len = 1;
-+  msg.msg_iov = &vec;
-+  msg.msg_iovlen = 1;
-+
-+  while ((n = sendmsg (sock, &msg, 0)) == -1 && errno == EINTR);
-+
-+  TEST_VERIFY_EXIT (n == 1);
-+}
-+
-+static int
-+recv_fd (const int sock)
-+{
-+  struct msghdr msg = {0};
-+  union
-+    {
-+      struct cmsghdr hdr;
-+      char buf[CMSG_SPACE(sizeof(int))];
-+    } cmsgbuf = {0};
-+  struct cmsghdr *cmsg;
-+  struct iovec vec;
-+  ssize_t n;
-+  char ch = '\0';
-+  int fd = -1;
-+
-+  vec.iov_base = &ch;
-+  vec.iov_len = 1;
-+  msg.msg_iov = &vec;
-+  msg.msg_iovlen = 1;
-+
-+  msg.msg_control = &cmsgbuf.buf;
-+  msg.msg_controllen = sizeof (cmsgbuf.buf);
-+
-+  while ((n = recvmsg (sock, &msg, 0)) == -1 && errno == EINTR);
-+  if (n != 1 || ch != 'A')
-+    return -1;
-+
-+  cmsg = CMSG_FIRSTHDR (&msg);
-+  if (cmsg == NULL)
-+    return -1;
-+  if (cmsg->cmsg_type != SCM_RIGHTS)
-+    return -1;
-+  memcpy (&fd, CMSG_DATA (cmsg), sizeof (fd));
-+  if (fd < 0)
-+    return -1;
-+  return fd;
-+}
-+
-+static int
-+child_func (void * const arg)
-+{
-+  xclose (sockfd[0]);
-+  const int sock = sockfd[1];
-+  char ch;
-+
-+  TEST_VERIFY_EXIT (read (sock, &ch, 1) == 1);
-+  TEST_VERIFY_EXIT (ch == '1');
-+
-+  if (mount ("/", MOUNT_NAME, NULL, MS_BIND | MS_REC, NULL))
-+    FAIL_EXIT1 ("mount failed: %m\n");
-+  const int fd = xopen ("mpoint",
-+			O_RDONLY | O_PATH | O_DIRECTORY | O_NOFOLLOW, 0);
-+
-+  send_fd (sock, fd);
-+  xclose (fd);
-+
-+  TEST_VERIFY_EXIT (read (sock, &ch, 1) == 1);
-+  TEST_VERIFY_EXIT (ch == 'a');
-+
-+  xclose (sock);
-+  return 0;
-+}
-+
-+static void
-+update_map (char * const mapping, const char * const map_file)
-+{
-+  const size_t map_len = strlen (mapping);
-+
-+  const int fd = xopen (map_file, O_WRONLY, 0);
-+  xwrite (fd, mapping, map_len);
-+  xclose (fd);
-+}
-+
-+static void
-+proc_setgroups_write (const long child_pid, const char * const str)
-+{
-+  const size_t str_len = strlen(str);
-+
-+  char setgroups_path[sizeof ("/proc//setgroups") + INT_STRLEN_BOUND (long)];
-+
-+  snprintf (setgroups_path, sizeof (setgroups_path),
-+	    "/proc/%ld/setgroups", child_pid);
-+
-+  const int fd = open (setgroups_path, O_WRONLY);
-+
-+  if (fd < 0)
-+    {
-+      TEST_VERIFY_EXIT (errno == ENOENT);
-+      FAIL_UNSUPPORTED ("/proc/%ld/setgroups not found\n", child_pid);
-+    }
-+
-+  xwrite (fd, str, str_len);
-+  xclose(fd);
-+}
-+
-+static char child_stack[1024 * 1024];
-+
-+int
-+do_test (void)
-+{
-+  base = support_create_and_chdir_toolong_temp_directory (BASENAME);
-+
-+  xmkdir (MOUNT_NAME, S_IRWXU);
-+  atexit (do_cleanup);
-+
-+  TEST_VERIFY_EXIT (socketpair (AF_UNIX, SOCK_STREAM, 0, sockfd) == 0);
-+  pid_t child_pid = xclone (child_func, NULL, child_stack,
-+			    sizeof (child_stack),
-+			    CLONE_NEWUSER | CLONE_NEWNS | SIGCHLD);
-+
-+  xclose (sockfd[1]);
-+  const int sock = sockfd[0];
-+
-+  char map_path[sizeof ("/proc//uid_map") + INT_STRLEN_BOUND (long)];
-+  char map_buf[sizeof ("0  1") + INT_STRLEN_BOUND (long)];
-+
-+  snprintf (map_path, sizeof (map_path), "/proc/%ld/uid_map",
-+	    (long) child_pid);
-+  snprintf (map_buf, sizeof (map_buf), "0 %ld 1", (long) getuid());
-+  update_map (map_buf, map_path);
-+
-+  proc_setgroups_write ((long) child_pid, "deny");
-+  snprintf (map_path, sizeof (map_path), "/proc/%ld/gid_map",
-+	    (long) child_pid);
-+  snprintf (map_buf, sizeof (map_buf), "0 %ld 1", (long) getgid());
-+  update_map (map_buf, map_path);
-+
-+  TEST_VERIFY_EXIT (send (sock, "1", 1, MSG_NOSIGNAL) == 1);
-+  const int fd = recv_fd (sock);
-+  TEST_VERIFY_EXIT (fd >= 0);
-+  TEST_VERIFY_EXIT (fchdir (fd) == 0);
-+
-+  static char buf[2 * 10 + 1];
-+  memset (buf, 'A', sizeof (buf));
-+
-+  /* Finally, call getcwd and check if it resulted in a buffer underflow.  */
-+  char * cwd = getcwd (buf + sizeof (buf) / 2, 1);
-+  TEST_VERIFY (cwd == NULL);
-+  TEST_VERIFY (errno == ERANGE);
-+
-+  for (int i = 0; i < sizeof (buf); i++)
-+    if (buf[i] != 'A')
-+      {
-+	printf ("buf[%d] = %02x\n", i, (unsigned int) buf[i]);
-+	support_record_failure ();
-+      }
-+
-+  TEST_VERIFY_EXIT (send (sock, "a", 1, MSG_NOSIGNAL) == 1);
-+  xclose (sock);
-+  TEST_VERIFY_EXIT (xwaitpid (child_pid, NULL, 0) == child_pid);
-+
-+  return 0;
-+}
-+
-+#define CLEANUP_HANDLER do_cleanup
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
deleted file mode 100644
index 00fb3266c6b..00000000000
--- a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From f545ad4928fa1f27a3075265182b38a4f939a5f7 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Jan 2022 10:21:34 +0100
-Subject: [PATCH] CVE-2022-23218: Buffer overflow in sunrpc svcunix_create (bug
- 28768)
-
-The sunrpc function svcunix_create suffers from a stack-based buffer
-overflow with overlong pathname arguments.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f545ad4928fa1f27a3075265182b38a4f939a5f7]
-CVE: CVE-2022-23218
-
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- NEWS                  |  3 +++
- sunrpc/Makefile       |  2 +-
- sunrpc/svc_unix.c     | 11 ++++-------
- sunrpc/tst-bug28768.c | 42 ++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 50 insertions(+), 8 deletions(-)
- create mode 100644 sunrpc/tst-bug28768.c
-
-diff --git a/NEWS b/NEWS
-index 38a9ddb2cf..38802f0673 100644
---- a/NEWS
-+++ b/NEWS
-@@ -203,6 +203,9 @@ Security related changes:
-   parameter number when processing the expansion resulting in a crash.
-   Reported by Philippe Antoine.
- 
-+  CVE-2022-23218: Passing an overlong file name to the svcunix_create
-+  legacy function could result in a stack-based buffer overflow.
-+
- The following bugs are resolved with this release:
- 
-   [4737] libc: fork is not async-signal-safe
-diff --git a/sunrpc/Makefile b/sunrpc/Makefile
-index 183ef3dc55..a79a7195fc 100644
---- a/sunrpc/Makefile
-+++ b/sunrpc/Makefile
-@@ -65,7 +65,7 @@ shared-only-routines = $(routines)
- endif
- 
- tests = tst-xdrmem tst-xdrmem2 test-rpcent tst-udp-error tst-udp-timeout \
--  tst-udp-nonblocking
-+  tst-udp-nonblocking tst-bug28768
- xtests := tst-getmyaddr
- 
- ifeq ($(have-thread-library),yes)
-diff --git a/sunrpc/svc_unix.c b/sunrpc/svc_unix.c
-index f2280b4c49..67177a2e78 100644
---- a/sunrpc/svc_unix.c
-+++ b/sunrpc/svc_unix.c
-@@ -154,7 +154,10 @@ svcunix_create (int sock, u_int sendsize
-   SVCXPRT *xprt;
-   struct unix_rendezvous *r;
-   struct sockaddr_un addr;
--  socklen_t len = sizeof (struct sockaddr_in);
-+  socklen_t len = sizeof (addr);
-+
-+  if (__sockaddr_un_set (&addr, path) < 0)
-+    return NULL;
- 
-   if (sock == RPC_ANYSOCK)
-     {
-@@ -165,12 +168,6 @@ svcunix_create (int sock, u_int sendsize
- 	}
-       madesock = TRUE;
-     }
--  memset (&addr, '\0', sizeof (addr));
--  addr.sun_family = AF_UNIX;
--  len = strlen (path) + 1;
--  memcpy (addr.sun_path, path, len);
--  len += sizeof (addr.sun_family);
--
-   __bind (sock, (struct sockaddr *) &addr, len);
- 
-   if (__getsockname (sock, (struct sockaddr *) &addr, &len) != 0
-diff --git a/sunrpc/tst-bug28768.c b/sunrpc/tst-bug28768.c
-new file mode 100644
-index 0000000000..35a4b7b0b3
---- /dev/null
-+++ b/sunrpc/tst-bug28768.c
-@@ -0,0 +1,42 @@
-+/* Test to verify that long path is rejected by svcunix_create (bug 28768).
-+   Copyright (C) 2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <rpc/svc.h>
-+#include <shlib-compat.h>
-+#include <string.h>
-+#include <support/check.h>
-+
-+/* svcunix_create does not have a default version in linkobj/libc.so.  */
-+compat_symbol_reference (libc, svcunix_create, svcunix_create, GLIBC_2_1);
-+
-+static int
-+do_test (void)
-+{
-+  char pathname[109];
-+  memset (pathname, 'x', sizeof (pathname));
-+  pathname[sizeof (pathname) - 1] = '\0';
-+
-+  errno = 0;
-+  TEST_VERIFY (svcunix_create (RPC_ANYSOCK, 4096, 4096, pathname) == NULL);
-+  TEST_COMPARE (errno, EINVAL);
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
deleted file mode 100644
index 6779e9afdf0..00000000000
--- a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From ef972a4c50014a16132b5c75571cfb6b30bef136 Mon Sep 17 00:00:00 2001
-From: Martin Sebor <msebor@redhat.com>
-Date: Mon, 17 Jan 2022 10:21:34 +0100
-Subject: [PATCH] sunrpc: Test case for clnt_create "unix" buffer overflow (bug
- 22542)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ef972a4c50014a16132b5c75571cfb6b30bef136]
-CVE: CVE-2022-23219
-
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- sunrpc/Makefile       |  5 ++++-
- sunrpc/tst-bug22542.c | 44 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 48 insertions(+), 1 deletion(-)
- create mode 100644 sunrpc/tst-bug22542.c
-
-diff --git a/sunrpc/Makefile b/sunrpc/Makefile
-index 9a31fe48b9..183ef3dc55 100644
---- a/sunrpc/Makefile
-+++ b/sunrpc/Makefile
-@@ -65,7 +65,7 @@ shared-only-routines = $(routines)
- endif
- 
- tests = tst-xdrmem tst-xdrmem2 test-rpcent tst-udp-error tst-udp-timeout \
--  tst-udp-nonblocking tst-bug28768
-+  tst-udp-nonblocking tst-bug22542 tst-bug28768
- xtests := tst-getmyaddr
- 
- ifeq ($(have-thread-library),yes)
-@@ -110,6 +110,8 @@ $(objpfx)tst-udp-nonblocking: $(common-o
- $(objpfx)tst-udp-garbage: \
-   $(common-objpfx)linkobj/libc.so $(shared-thread-library)
- 
-+$(objpfx)tst-bug22542: $(common-objpfx)linkobj/libc.so
-+
- else # !have-GLIBC_2.31
- 
- routines = $(routines-for-nss)
-diff --git a/sunrpc/tst-bug22542.c b/sunrpc/tst-bug22542.c
-new file mode 100644
-index 0000000000..d6cd79787b
---- /dev/null
-+++ b/sunrpc/tst-bug22542.c
-@@ -0,0 +1,44 @@
-+/* Test to verify that overlong hostname is rejected by clnt_create
-+   and doesn't cause a buffer overflow (bug  22542).
-+
-+   Copyright (C) 2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <rpc/clnt.h>
-+#include <string.h>
-+#include <support/check.h>
-+#include <sys/socket.h>
-+#include <sys/un.h>
-+
-+static int
-+do_test (void)
-+{
-+  /* Create an arbitrary hostname that's longer than fits in sun_path.  */
-+  char name [sizeof ((struct sockaddr_un*)0)->sun_path * 2];
-+  memset (name, 'x', sizeof name - 1);
-+  name [sizeof name - 1] = '\0';
-+
-+  errno = 0;
-+  CLIENT *clnt = clnt_create (name, 0, 0, "unix");
-+
-+  TEST_VERIFY (clnt == NULL);
-+  TEST_COMPARE (errno, EINVAL);
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 2445aa56b34..94a05cf954d 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From d7bb36a9a27e5e4c3be6378493b41286513750e9 Mon Sep 17 00:00:00 2001
+From 87a69126d97bb8d5d52e34e451b4a7076efd6bed Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 210cc1076c4..9a605078b93 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From 776a53db6afba8a7ff4412aba88b0679227877f9 Mon Sep 17 00:00:00 2001
+From 752b0d32fc96728ee624dbd62bf23e034d8d2aed Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index a08df001af..d09daf9e41 100644
+index 721593135e..39c4657fa2 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2196,6 +2196,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2208,6 +2208,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -48,7 +48,7 @@ index a08df001af..d09daf9e41 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2254,14 +2262,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2266,14 +2274,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 010b816e113..da288d6ccfc 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From df18bae1eeee55ecb9db36d13fe67c58355682eb Mon Sep 17 00:00:00 2001
+From 2f7407697f2a905fedb98037152e7830f73bc6c6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index d09daf9e41..2c6270e2a7 100644
+index 39c4657fa2..daa3af6c51 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1892,7 +1892,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1904,7 +1904,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index bf9f3e36cac..14bcaf3ef9e 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 6af8ce8eceed86addbc188f773a2d36d83ee4042 Mon Sep 17 00:00:00 2001
+From 88a31cd08801df53249963f3b26c7dbcee6ae2f8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -41,10 +41,10 @@ index 2b8da8650d..3d9787bda4 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 2c6270e2a7..23018d2f7e 100644
+index daa3af6c51..e323952993 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -115,8 +115,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
+@@ -117,8 +117,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
     gen-trusted-dirs.awk.  */
  #include "trusted-dirs.h"
  
@@ -98,10 +98,10 @@ index 91966702ca..dc86c20e83 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 1037e8d0cf..ffdac84952 100644
+index 101d56ac8e..33debef60a 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -177,6 +177,9 @@ static struct argp argp =
+@@ -176,6 +176,9 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -112,10 +112,10 @@ index 1037e8d0cf..ffdac84952 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index fbbd60b446..fce9940f80 100644
+index 4b09e84b0d..56d93ff616 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -185,6 +185,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -193,6 +193,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
@@ -124,10 +124,10 @@ index fbbd60b446..fce9940f80 100644
  static void
  audit_list_init (struct audit_list *list)
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index 62bee28769..67b60dc88c 100644
+index 077082af66..46b6152455 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
-@@ -36,7 +36,7 @@
+@@ -35,7 +35,7 @@
  #include <gconv_parseconfdir.h>
  
  /* This is the default path where we look for module lists.  */
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 3a37f7af722..493b2daad37 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From b30f380cd88ae181a4a6a3a4784206ffe3ccd19b Mon Sep 17 00:00:00 2001
+From a1fbd7ef1da02f334ff72c52cb11116164649067 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
@@ -13,14 +13,14 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/x86/atomic-machine.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ sysdeps/x86/atomic-machine.h | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-machine.h
-index 695222e4fa..9d39bfdbd5 100644
+index 2692d94a92..9d39bfdbd5 100644
 --- a/sysdeps/x86/atomic-machine.h
 +++ b/sysdeps/x86/atomic-machine.h
-@@ -52,15 +52,14 @@ typedef uintmax_t uatomic_max_t;
+@@ -52,19 +52,14 @@ typedef uintmax_t uatomic_max_t;
  #define LOCK_PREFIX "lock;"
  
  #define USE_ATOMIC_COMPILER_BUILTINS	1
@@ -33,6 +33,10 @@ index 695222e4fa..9d39bfdbd5 100644
  # define BR_CONSTRAINT			"q"
  # define IBR_CONSTRAINT			"iq"
  #else
+-/* Since the Pentium, i386 CPUs have supported 64-bit atomics, but the
+-   i386 psABI supplement provides only 4-byte alignment for uint64_t
+-   inside structs, so it is currently not possible to use 64-bit
+-   atomics on this platform.  */
 -# define __HAVE_64B_ATOMICS		0
  # define SP_REG				"esp"
  # define SEG_REG			"gs"
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index d763178f213..b40d2bdef69 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From 24bffe9c2645cd6542e29cb57786dc703cced07b Mon Sep 17 00:00:00 2001
+From bf1603b3d73f64de777be00f7e55f2cfef596102 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index ab09122b0c..f42cc75780 100644
+index 5986373edd..856ba9afc0 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
-@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
+@@ -55,7 +55,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
     which are somehow addressed.  */
  struct loaded_l10nfile *_nl_locale_file_list[__LC_LAST];
  
@@ -31,7 +31,7 @@ index ab09122b0c..f42cc75780 100644
  
  /* Checks if the name is actually present, that is, not NULL and not
     empty.  */
-@@ -166,7 +166,7 @@ _nl_find_locale (const char *locale_path, size_t locale_path_len,
+@@ -165,7 +165,7 @@ _nl_find_locale (const char *locale_path, size_t locale_path_len,
  
        /* Nothing in the archive.  Set the default path to search below.  */
        locale_path = _nl_default_locale_path;
@@ -67,10 +67,10 @@ index b3d4da0185..22f9dc1140 100644
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
 diff --git a/locale/programs/locale.c b/locale/programs/locale.c
-index ca0a95be99..6b98895203 100644
+index e9275d6b83..a9109155e5 100644
 --- a/locale/programs/locale.c
 +++ b/locale/programs/locale.c
-@@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b)
+@@ -631,6 +631,7 @@ nameentcmp (const void *a, const void *b)
  		  ((const struct nameent *) b)->name);
  }
  
@@ -78,7 +78,7 @@ index ca0a95be99..6b98895203 100644
  
  static int
  write_archive_locales (void **all_datap, char *linebuf)
-@@ -645,7 +646,7 @@ write_archive_locales (void **all_datap, char *linebuf)
+@@ -644,7 +645,7 @@ write_archive_locales (void **all_datap, char *linebuf)
    int fd, ret = 0;
    uint32_t cnt;
  
@@ -87,7 +87,7 @@ index ca0a95be99..6b98895203 100644
    if (fd < 0)
      return 0;
  
-@@ -700,8 +701,8 @@ write_archive_locales (void **all_datap, char *linebuf)
+@@ -699,8 +700,8 @@ write_archive_locales (void **all_datap, char *linebuf)
  	  if (cnt)
  	    putchar_unlocked ('\n');
  
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index f4fc1d68c42..a47dd5331a5 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From 2761400989bcbf11e10bc85f90c3a2ba1305c4ae Mon Sep 17 00:00:00 2001
+From 78b2e81940561069faf7698931a033784f794e40 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
diff --git a/meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
rename to meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
index f7e7f1cd104..77644a2ee31 100644
--- a/meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From 7be3e82b66394a7b242e56c6fc609e858b8e2436 Mon Sep 17 00:00:00 2001
+From f6e96a95212bc1fef57b9594a7dddc0c20639873 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0019-eglibc-Cross-building-and-testing-instructions.patch
rename to meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
index 8fb9182d980..295fa315d89 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From db9674ffc6583a508da1a3cb044c3ccf3febaea1 Mon Sep 17 00:00:00 2001
+From d6300e80c7c010fa7ca33e36e826151558cec498 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
rename to meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
index 9b76cfd3b84..9e00da894db 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 7856684f76c100155cad11b5b236fb31234b6e28 Mon Sep 17 00:00:00 2001
+From 1c8044544d2cbdc529910a3ed6eba4b0ce7ae549 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index f98d5a9e67..c36d04da0f 100644
+index a49870d3d1..81673d7645 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
@@ -52,7 +52,7 @@ index f98d5a9e67..c36d04da0f 100644
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -415,6 +424,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
+@@ -420,6 +429,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -69,7 +69,7 @@ index f98d5a9e67..c36d04da0f 100644
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -441,6 +460,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
+@@ -446,6 +465,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
rename to meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 74c8c10661f..03c81bfbd77 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From 111ab95a85314d1e70fb159a14250354cc69d899 Mon Sep 17 00:00:00 2001
+From e5999ffd1b8690c2902a6406c07f51023a6bf7ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
similarity index 90%
rename from meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
rename to meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
index a9ff8e92eae..48bb062e09a 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From 4e5de801a39d66b8bd93d09f5912dcbe5db4ef04 Mon Sep 17 00:00:00 2001
+From 99ae3189430eaa5472b2117e5a999109a6ca9251 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -148,10 +148,10 @@ index 4841bfd05d..ffcba1fd79 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index b6406b775d..bfa4adba9c 100644
+index 06a5203334..84b3ff4166 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
-@@ -349,7 +349,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
+@@ -352,7 +352,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
      }
    if (wcs != NULL)
      {
@@ -160,7 +160,7 @@ index b6406b775d..bfa4adba9c 100644
        uint32_t zero = 0;
        /* Handle <U0000> as a single character.  */
        if (nwcs == 0)
-@@ -1775,8 +1775,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
+@@ -1783,8 +1783,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
  
  	      if ((*eptr)->nwcs == runp->nwcs)
  		{
@@ -170,7 +170,7 @@ index b6406b775d..bfa4adba9c 100644
  
  		  if (c == 0)
  		    {
-@@ -2003,9 +2002,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
+@@ -2011,9 +2010,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
  	     one consecutive entry.  */
  	  if (runp->wcnext != NULL
  	      && runp->nwcs == runp->wcnext->nwcs
@@ -183,7 +183,7 @@ index b6406b775d..bfa4adba9c 100644
  	      && (runp->wcs[runp->nwcs - 1]
  		  == runp->wcnext->wcs[runp->nwcs - 1] + 1))
  	    {
-@@ -2029,9 +2028,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
+@@ -2037,9 +2036,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
  		runp = runp->wcnext;
  	      while (runp->wcnext != NULL
  		     && runp->nwcs == runp->wcnext->nwcs
@@ -197,10 +197,10 @@ index b6406b775d..bfa4adba9c 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index 2fb579bbbf..d0be99581c 100644
+index 07b64ac5a1..70b49ab733 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
-@@ -915,7 +915,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
+@@ -914,7 +914,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
    allocate_arrays (ctype, charmap, ctype->repertoire);
  
    default_missing_len = (ctype->default_missing
@@ -209,7 +209,7 @@ index 2fb579bbbf..d0be99581c 100644
  			 : 0);
  
    init_locale_data (&file, nelems);
-@@ -1927,7 +1927,7 @@ read_translit_entry (struct linereader *ldfile, struct locale_ctype_t *ctype,
+@@ -1926,7 +1926,7 @@ read_translit_entry (struct linereader *ldfile, struct locale_ctype_t *ctype,
  	    ignore = 1;
  	  else
  	    /* This value is usable.  */
@@ -218,7 +218,7 @@ index 2fb579bbbf..d0be99581c 100644
  
  	  first = 0;
  	}
-@@ -2461,8 +2461,8 @@ with character code range values one must use the absolute ellipsis `...'"));
+@@ -2460,8 +2460,8 @@ with character code range values one must use the absolute ellipsis `...'"));
  	    }
  
  	handle_tok_digit:
@@ -229,7 +229,7 @@ index 2fb579bbbf..d0be99581c 100644
  	  handle_digits = 1;
  	  goto read_charclass;
  
-@@ -3904,8 +3904,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3903,8 +3903,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  
  	  while (idx < number)
  	    {
@@ -239,7 +239,7 @@ index 2fb579bbbf..d0be99581c 100644
  	      if (res == 0)
  		{
  		  replace = 1;
-@@ -3942,11 +3941,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3941,11 +3940,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
        for (size_t cnt = 0; cnt < number; ++cnt)
  	{
  	  struct translit_to_t *srunp;
@@ -253,7 +253,7 @@ index 2fb579bbbf..d0be99581c 100644
  	      srunp = srunp->next;
  	    }
  	  /* Plus one for the extra NUL character marking the end of
-@@ -3970,18 +3969,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3969,18 +3968,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  	  ctype->translit_from_idx[cnt] = from_len;
  	  ctype->translit_to_idx[cnt] = to_len;
  
@@ -279,10 +279,10 @@ index 2fb579bbbf..d0be99581c 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index dcd2a2386d..6814740325 100644
+index e6f320d2b3..c6631ad101 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
-@@ -220,8 +220,10 @@ No definition for %s category found"), "LC_TIME");
+@@ -219,8 +219,10 @@ No definition for %s category found"), "LC_TIME");
  	}
        else
  	{
@@ -294,7 +294,7 @@ index dcd2a2386d..6814740325 100644
  	}
      }
  
-@@ -231,7 +233,7 @@ No definition for %s category found"), "LC_TIME");
+@@ -230,7 +232,7 @@ No definition for %s category found"), "LC_TIME");
        const int days_per_month[12] = { 31, 29, 31, 30, 31, 30,
  				       31, 31, 30, 31 ,30, 31 };
        size_t idx;
@@ -303,7 +303,7 @@ index dcd2a2386d..6814740325 100644
  
        time->era_entries =
  	(struct era_data *) xmalloc (time->num_era
-@@ -457,18 +459,18 @@ No definition for %s category found"), "LC_TIME");
+@@ -456,18 +458,18 @@ No definition for %s category found"), "LC_TIME");
  	    }
  
  	  /* Now generate the wide character name and format.  */
@@ -329,7 +329,7 @@ index dcd2a2386d..6814740325 100644
  		}
  	      else
  		time->era_entries[idx].wname =
-@@ -527,7 +529,16 @@ No definition for %s category found"), "LC_TIME");
+@@ -526,7 +528,16 @@ No definition for %s category found"), "LC_TIME");
    if (time->date_fmt == NULL)
      time->date_fmt = "%a %b %e %H:%M:%S %Z %Y";
    if (time->wdate_fmt == NULL)
@@ -348,10 +348,10 @@ index dcd2a2386d..6814740325 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index 96d3ab66db..3af379d2c3 100644
+index a1f22b28ed..cbd3b40ceb 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
-@@ -595,7 +595,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
+@@ -594,7 +594,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
  {
    int return_widestr = lr->return_widestr;
    char *buf;
@@ -361,10 +361,10 @@ index 96d3ab66db..3af379d2c3 100644
    size_t bufmax = 56;
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index 832c8fd1fc..fe689b3ae1 100644
+index f0da25e9e5..5d9e01cda2 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
-@@ -109,6 +109,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
+@@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
  #define OPT_NO_WARN 402
  #define OPT_WARN 403
  #define OPT_NO_HARD_LINKS 404
@@ -372,7 +372,7 @@ index 832c8fd1fc..fe689b3ae1 100644
  
  /* Definitions of arguments for argp functions.  */
  static const struct argp_option options[] =
-@@ -153,6 +154,8 @@ static const struct argp_option options[] =
+@@ -152,6 +153,8 @@ static const struct argp_option options[] =
      N_("Generate little-endian output") },
    { "big-endian", OPT_BIG_ENDIAN, NULL, 0,
      N_("Generate big-endian output") },
@@ -381,7 +381,7 @@ index 832c8fd1fc..fe689b3ae1 100644
    { NULL, 0, NULL, 0, NULL }
  };
  
-@@ -243,12 +246,14 @@ main (int argc, char *argv[])
+@@ -242,12 +245,14 @@ main (int argc, char *argv[])
       ctype locale.  (P1003.2 4.35.5.2)  */
    setlocale (LC_CTYPE, "POSIX");
  
@@ -396,7 +396,7 @@ index 832c8fd1fc..fe689b3ae1 100644
  
    /* Process charmap file.  */
    charmap = charmap_read (charmap_file, verbose, 1, be_quiet, 1);
-@@ -400,6 +405,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
+@@ -399,6 +404,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
        /* Do not hard link to other locales.  */
        hard_links = false;
        break;
@@ -407,10 +407,10 @@ index 832c8fd1fc..fe689b3ae1 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index 0f1affa1d4..7d86fae801 100644
+index 1427b518a9..dafa84a20b 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
-@@ -544,6 +544,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
+@@ -543,6 +543,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
     machine running localedef.  */
  bool swap_endianness_p;
  
@@ -420,7 +420,7 @@ index 0f1affa1d4..7d86fae801 100644
  /* When called outside a start_locale_structure/end_locale_structure
     or start_locale_prelude/end_locale_prelude block, record that the
     next byte in FILE's obstack will be the first byte of a new element.
-@@ -621,7 +624,7 @@ add_locale_string (struct locale_file *file, const char *string)
+@@ -620,7 +623,7 @@ add_locale_string (struct locale_file *file, const char *string)
  void
  add_locale_wstring (struct locale_file *file, const uint32_t *string)
  {
@@ -430,10 +430,10 @@ index 0f1affa1d4..7d86fae801 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index c986d599ec..222a779176 100644
+index cbc20fe88d..ae88e6d0af 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
-@@ -71,6 +71,8 @@ extern void write_all_categories (struct localedef_t *definitions,
+@@ -70,6 +70,8 @@ extern void write_all_categories (struct localedef_t *definitions,
  
  extern bool swap_endianness_p;
  
@@ -442,7 +442,7 @@ index c986d599ec..222a779176 100644
  /* Change the output to be big-endian if BIG_ENDIAN is true and
     little-endian otherwise.  */
  static inline void
-@@ -89,7 +91,8 @@ maybe_swap_uint32 (uint32_t value)
+@@ -88,7 +90,8 @@ maybe_swap_uint32 (uint32_t value)
  }
  
  /* Likewise, but munge an array of N uint32_ts starting at ARRAY.  */
@@ -452,7 +452,7 @@ index c986d599ec..222a779176 100644
  maybe_swap_uint32_array (uint32_t *array, size_t n)
  {
    if (swap_endianness_p)
-@@ -99,7 +102,8 @@ maybe_swap_uint32_array (uint32_t *array, size_t n)
+@@ -98,7 +101,8 @@ maybe_swap_uint32_array (uint32_t *array, size_t n)
  
  /* Like maybe_swap_uint32_array, but the array of N elements is at
     the end of OBSTACK's current object.  */
@@ -462,7 +462,7 @@ index c986d599ec..222a779176 100644
  maybe_swap_uint32_obstack (struct obstack *obstack, size_t n)
  {
    maybe_swap_uint32_array ((uint32_t *) obstack_next_free (obstack) - n, n);
-@@ -276,4 +280,55 @@ extern void identification_output (struct localedef_t *locale,
+@@ -275,4 +279,55 @@ extern void identification_output (struct localedef_t *locale,
  				   const struct charmap_t *charmap,
  				   const char *output_path);
  
diff --git a/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
similarity index 90%
rename from meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
rename to meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 50c2e147357..eae1ee89074 100644
--- a/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From 13bc0e53cc91e102472d532f28b3d44c30d291fc Mon Sep 17 00:00:00 2001
+From 32c2e23ad29f63f57f544daf1a59259147cd1008 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index f38e835c52..8d8f8699b2 100644
+index 477499bd40..fe7b5ff60c 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
-@@ -340,12 +340,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
+@@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
    struct namehashent *oldnamehashtab;
    struct locarhandle new_ah;
    size_t prefix_len = output_prefix ? strlen (output_prefix) : 0;
@@ -51,7 +51,7 @@ index f38e835c52..8d8f8699b2 100644
    strcpy (stpcpy (fname, archivefname), ".XXXXXX");
  
    /* Not all of the old file has to be mapped.  Change this now this
-@@ -569,10 +581,13 @@ open_archive (struct locarhandle *ah, bool readonly)
+@@ -568,10 +580,13 @@ open_archive (struct locarhandle *ah, bool readonly)
    /* If ah has a non-NULL fname open that otherwise open the default.  */
    if (archivefname == NULL)
      {
@@ -69,7 +69,7 @@ index f38e835c52..8d8f8699b2 100644
      }
  
    while (1)
-@@ -585,7 +600,7 @@ open_archive (struct locarhandle *ah, bool readonly)
+@@ -584,7 +599,7 @@ open_archive (struct locarhandle *ah, bool readonly)
  	     the default locale archive we ignore the failure and
  	     list an empty archive, otherwise we print an error
  	     and exit.  */
diff --git a/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
rename to meta/recipes-core/glibc/glibc/0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
index 2bfa2aaa069..4e51036ce58 100644
--- a/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ b/meta/recipes-core/glibc/glibc/0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -1,4 +1,4 @@
-From 3190ada9ecaec915794886a608221655c120f90c Mon Sep 17 00:00:00 2001
+From c59bc6eb421ad3310c43951a11d2561bbf34e95e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Mon, 17 Dec 2018 21:36:18 +0000
 Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
@@ -33,10 +33,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/locale/weight.h b/locale/weight.h
-index 723e1fefda..f5798d379a 100644
+index 076529c0ba..2ac83657f7 100644
 --- a/locale/weight.h
 +++ b/locale/weight.h
-@@ -28,7 +28,14 @@ findidx (const int32_t *table,
+@@ -27,7 +27,14 @@ findidx (const int32_t *table,
  	 const unsigned char *extra,
  	 const unsigned char **cpp, size_t len)
  {
diff --git a/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
similarity index 82%
rename from meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
rename to meta/recipes-core/glibc/glibc/0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 8042caaeae9..77a2bab87db 100644
--- a/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,4 +1,4 @@
-From 5d201a75918a0e181ee6206f701901fdb91baf81 Mon Sep 17 00:00:00 2001
+From 9f4fcec5662bfa6f8aa6a36dda6f4c05f6e30e51 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
 Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/elf/readlib.c b/elf/readlib.c
-index 7383c23249..e97ea9449d 100644
+index 64b20d7804..50318158fb 100644
 --- a/elf/readlib.c
 +++ b/elf/readlib.c
-@@ -51,6 +51,7 @@ static struct known_names interpreters[] =
+@@ -49,6 +49,7 @@ static struct known_names interpreters[] =
  #ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
    SYSDEP_KNOWN_INTERPRETER_NAMES
  #endif
diff --git a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
similarity index 78%
rename from meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
rename to meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index ece792509ee..63f7749ecbd 100644
--- a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,7 +1,7 @@
-From baba3c6021340a9070b734f931a15cea4cfe6c31 Mon Sep 17 00:00:00 2001
+From 4d6bce6b106d9d9a629aadba74d74cd8a500ccbf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
-Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
+Subject: [PATCH 18/24] wordsize.h: Unify the header between arm and aarch64
 
 This helps OE multilibs to not sythesize this header which causes all
 kind of recursions and other issues since wordsize is fundamental header
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  copy sysdeps/{aarch64 => arm}/bits/wordsize.h (80%)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 91da566b74..9a754514b3 100644
+index 4635431f0e..5ef0ed21f3 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
 @@ -17,12 +17,16 @@
@@ -43,9 +43,17 @@ diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
 similarity index 80%
 copy from sysdeps/aarch64/bits/wordsize.h
 copy to sysdeps/arm/bits/wordsize.h
-index 91da566b74..34fcdef1f1 100644
+index 4635431f0e..34fcdef1f1 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
+@@ -1,6 +1,6 @@
+ /* Determine the wordsize from the preprocessor defines.
+ 
+-   Copyright (C) 2016-2022 Free Software Foundation, Inc.
++   Copyright (C) 2016-2020 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
 @@ -17,12 +17,16 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
@@ -65,3 +73,6 @@ index 91da566b74..34fcdef1f1 100644
  #endif
  
  #define __WORDSIZE_TIME64_COMPAT32	0
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
rename to meta/recipes-core/glibc/glibc/0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index 22df820aedf..4313c6860fc 100644
--- a/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From 60aa53f547911163b42a1c436d695a15c87f34ee Mon Sep 17 00:00:00 2001
+From eb44466ec976d800bb697b10775efa28f22ec216 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
diff --git a/meta/recipes-core/glibc/glibc/0018-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
similarity index 52%
rename from meta/recipes-core/glibc/glibc/0018-Remove-bash-dependency-for-nscd-init-script.patch
rename to meta/recipes-core/glibc/glibc/0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index 23296da61d6..42c498bbc88 100644
--- a/meta/recipes-core/glibc/glibc/0018-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,21 +1,22 @@
-From 412d33bbfe42a10a9b1f62afcc73fe121a0363b0 Mon Sep 17 00:00:00 2001
+From 77fbd98f551d5b2cd338aa7f524e5ed980edb65e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH] Remove bash dependency for nscd init script
+Subject: [PATCH] Replace echo with printf builtin in nscd init script
 
-The nscd init script uses #! /bin/bash but only really uses one bashism
-(translated strings), so remove them and switch the shell to #!/bin/sh.
+The nscd init script calls for #! /bin/bash interpreter
+since it uses bash specific extentions namely (translated strings)
+and echo -n command, replace echo with printf and
+switch the shell interpreter to #!/bin/sh.
 
-Upstream-Status: Pending
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20211209203557.1318333-1-raj.khem@gmail.com/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- nscd/nscd.init | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
+ nscd/nscd.init | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/nscd/nscd.init b/nscd/nscd.init
-index a882da7d8b..b02986ec15 100644
+index a882da7d8b..857b541381 100644
 --- a/nscd/nscd.init
 +++ b/nscd/nscd.init
 @@ -1,4 +1,4 @@
@@ -24,25 +25,27 @@ index a882da7d8b..b02986ec15 100644
  #
  # nscd:		Starts the Name Switch Cache Daemon
  #
-@@ -49,7 +49,7 @@ prog=nscd
+@@ -49,16 +49,16 @@ prog=nscd
  start () {
      [ -d /var/run/nscd ] || mkdir /var/run/nscd
      [ -d /var/db/nscd ] || mkdir /var/db/nscd
 -    echo -n $"Starting $prog: "
-+    echo -n "Starting $prog: "
++    printf "Starting $prog: "
      daemon /usr/sbin/nscd
      RETVAL=$?
-     echo
-@@ -58,7 +58,7 @@ start () {
+-    echo
++    printf "\n"
+     [ $RETVAL -eq 0 ] && touch /var/lock/subsys/nscd
+     return $RETVAL
  }
  
  stop () {
 -    echo -n $"Stopping $prog: "
-+    echo -n "Stopping $prog: "
++    printf "Stopping $prog: "
      /usr/sbin/nscd -K
      RETVAL=$?
      if [ $RETVAL -eq 0 ]; then
-@@ -67,9 +67,9 @@ stop () {
+@@ -67,11 +67,11 @@ stop () {
  	# a non-privileged user
  	rm -f /var/run/nscd/nscd.pid
  	rm -f /var/run/nscd/socket
@@ -52,21 +55,25 @@ index a882da7d8b..b02986ec15 100644
 -       	failure $"$prog shutdown"
 +	failure "$prog shutdown"
      fi
-     echo
+-    echo
++    printf "\n"
      return $RETVAL
+ }
+ 
 @@ -103,13 +103,13 @@ case "$1" in
  	RETVAL=$?
  	;;
      force-reload | reload)
 -    	echo -n $"Reloading $prog: "
-+	echo -n "Reloading $prog: "
++	printf "Reloading $prog: "
  	killproc /usr/sbin/nscd -HUP
  	RETVAL=$?
- 	echo
+-	echo
++	printf "\n"
  	;;
      *)
 -	echo $"Usage: $0 {start|stop|status|restart|reload|condrestart}"
-+	echo "Usage: $0 {start|stop|status|restart|reload|condrestart}"
++	printf "Usage: $0 {start|stop|status|restart|reload|condrestart}\n"
  	RETVAL=1
  	;;
  esac
diff --git a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
similarity index 61%
rename from meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
rename to meta/recipes-core/glibc/glibc/0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index 1b99af7110d..5ac9d6d3a13 100644
--- a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,11 +1,11 @@
-From b4613f814ba7ba5db95d18116172f81a83ac8f5b Mon Sep 17 00:00:00 2001
+From 5d1384d86fc44404ca32c6fda2d46ec357337c91 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
- $libc_cv_rootsbindir
+Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its empty
 
-Upstream-Status: Pending
+This ensures that it can be set in build environment
 
+Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20211209203557.1318333-2-raj.khem@gmail.com/]
 Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/gnu/configure b/sysdeps/gnu/configure
-index c15d1087e8..37cc983f2a 100644
+index c15d1087e8..d30d6e37ae 100644
 --- a/sysdeps/gnu/configure
 +++ b/sysdeps/gnu/configure
 @@ -32,6 +32,6 @@ case "$prefix" in
@@ -22,11 +22,11 @@ index c15d1087e8..37cc983f2a 100644
      libc_cv_localstatedir=$localstatedir
     fi
 -  libc_cv_rootsbindir=/sbin
-+  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
++  libc_cv_rootsbindir=${libc_cv_rootsbindir:=/sbin}
    ;;
  esac
 diff --git a/sysdeps/gnu/configure.ac b/sysdeps/gnu/configure.ac
-index 634fe4de2a..3db1697f4f 100644
+index 634fe4de2a..492112e0fd 100644
 --- a/sysdeps/gnu/configure.ac
 +++ b/sysdeps/gnu/configure.ac
 @@ -21,6 +21,6 @@ case "$prefix" in
@@ -34,6 +34,6 @@ index 634fe4de2a..3db1697f4f 100644
      libc_cv_localstatedir=$localstatedir
     fi
 -  libc_cv_rootsbindir=/sbin
-+  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
++  libc_cv_rootsbindir=${libc_cv_rootsbindir:=/sbin}
    ;;
  esac
diff --git a/meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch b/meta/recipes-core/glibc/glibc/0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
similarity index 86%
rename from meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch
rename to meta/recipes-core/glibc/glibc/0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index 0480c47b498..e5e6ceba60c 100644
--- a/meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch
+++ b/meta/recipes-core/glibc/glibc/0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,7 +1,7 @@
-From 76d170fbbfd07b26a0288212201e5d15558db36f Mon Sep 17 00:00:00 2001
+From c0f251c58655e3377fe1c67a026c21ef68d2abcf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
-Subject: [PATCH] Make shell interpreter overridable in tzselect.ksh
+Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
 
 define new macro called KSHELL which can be used to define default shell
 use Bash by default
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index 3fa2f13003..a1ea5d5571 100644
+index 775bf12b65..7b9a8f0a94 100644
 --- a/Makeconfig
 +++ b/Makeconfig
-@@ -292,6 +292,15 @@ ifndef sysincludedir
+@@ -293,6 +293,15 @@ ifndef sysincludedir
  sysincludedir = /usr/include
  endif
  
@@ -45,6 +45,3 @@ index c624a189b3..dc8f5277de 100644
  	    < $< > $@.new
  	chmod 555 $@.new
  	mv -f $@.new $@
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
deleted file mode 100644
index 998db39b47c..00000000000
--- a/meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 99ab34278a6ebec134267412b4f619f43e278dea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Aug 2018 09:44:00 -0700
-Subject: [PATCH] intl: Emit no lines in bison generated files
-
-Improve reproducibility:
-Do not put any #line preprocessor commands in bison generated files.
-These lines contain absolute paths containing file locations on
-the host build machine.
-
-Upstream-Status: Pending
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- intl/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/intl/Makefile b/intl/Makefile
-index 93478d87e8..b27a7935eb 100644
---- a/intl/Makefile
-+++ b/intl/Makefile
-@@ -155,7 +155,7 @@ $(objpfx)tst-gettext6.out: $(objpfx)tst-gettext.out
- 
- CPPFLAGS += -D'LOCALEDIR="$(localedir)"' \
- 	    -D'LOCALE_ALIAS_PATH="$(localedir)"'
--BISONFLAGS = --yacc --name-prefix=__gettext --output
-+BISONFLAGS = --yacc --no-lines --name-prefix=__gettext --output
- 
- $(inst_localedir)/locale.alias: locale.alias $(+force)
- 	$(do-install)
diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-43396.patch b/meta/recipes-core/glibc/glibc/CVE-2021-43396.patch
deleted file mode 100644
index ebea5efd347..00000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2021-43396.patch
+++ /dev/null
@@ -1,184 +0,0 @@
-From ff012870b2c02a62598c04daa1e54632e020fd7d Mon Sep 17 00:00:00 2001
-From: Nikita Popov <npv1310@gmail.com>
-Date: Tue, 2 Nov 2021 13:21:42 +0500
-Subject: [PATCH] gconv: Do not emit spurious NUL character in ISO-2022-JP-3
- (bug 28524)
-
-Bugfix 27256 has introduced another issue:
-In conversion from ISO-2022-JP-3 encoding, it is possible
-to force iconv to emit extra NUL character on internal state reset.
-To do this, it is sufficient to feed iconv with escape sequence
-which switches active character set.
-The simplified check 'data->__statep->__count != ASCII_set'
-introduced by the aforementioned bugfix picks that case and
-behaves as if '\0' character has been queued thus emitting it.
-
-To eliminate this issue, these steps are taken:
-* Restore original condition
-'(data->__statep->__count & ~7) != ASCII_set'.
-It is necessary since bits 0-2 may contain
-number of buffered input characters.
-* Check that queued character is not NUL.
-Similar step is taken for main conversion loop.
-
-Bundled test case follows following logic:
-* Try to convert ISO-2022-JP-3 escape sequence
-switching active character set
-* Reset internal state by providing NULL as input buffer
-* Ensure that nothing has been converted.
-
-Signed-off-by: Nikita Popov <npv1310@gmail.com>
-
-CVE: CVE-2021-43396
-Upstream-Status: Backport [ff012870b2c02a62598c04daa1e54632e020fd7d]
----
- iconvdata/Makefile        |  5 +++-
- iconvdata/bug-iconv15.c   | 60 +++++++++++++++++++++++++++++++++++++++
- iconvdata/iso-2022-jp-3.c | 28 ++++++++++++------
- 3 files changed, 84 insertions(+), 9 deletions(-)
- create mode 100644 iconvdata/bug-iconv15.c
-
-Index: git/iconvdata/Makefile
-===================================================================
---- git.orig/iconvdata/Makefile
-+++ git/iconvdata/Makefile
-@@ -1,4 +1,5 @@
- # Copyright (C) 1997-2021 Free Software Foundation, Inc.
-+# Copyright (C) The GNU Toolchain Authors.
- # This file is part of the GNU C Library.
- 
- # The GNU C Library is free software; you can redistribute it and/or
-@@ -74,7 +75,7 @@ ifeq (yes,$(build-shared))
- tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
- 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
- 	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
--	bug-iconv13 bug-iconv14
-+	bug-iconv13 bug-iconv14 bug-iconv15
- ifeq ($(have-thread-library),yes)
- tests += bug-iconv3
- endif
-@@ -327,6 +328,8 @@ $(objpfx)bug-iconv12.out: $(addprefix $(
- 			  $(addprefix $(objpfx),$(modules.so))
- $(objpfx)bug-iconv14.out: $(addprefix $(objpfx), $(gconv-modules)) \
- 			  $(addprefix $(objpfx),$(modules.so))
-+$(objpfx)bug-iconv15.out: $(addprefix $(objpfx), $(gconv-modules)) \
-+			  $(addprefix $(objpfx),$(modules.so))
- 
- $(objpfx)iconv-test.out: run-iconv-test.sh \
- 			 $(addprefix $(objpfx), $(gconv-modules)) \
-Index: git/iconvdata/bug-iconv15.c
-===================================================================
---- /dev/null
-+++ git/iconvdata/bug-iconv15.c
-@@ -0,0 +1,60 @@
-+/* Bug 28524: Conversion from ISO-2022-JP-3 with iconv
-+   may emit spurious NUL character on state reset.
-+   Copyright (C) The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <stddef.h>
-+#include <iconv.h>
-+#include <support/check.h>
-+
-+static int
-+do_test (void)
-+{
-+  char in[] = "\x1b(I";
-+  char *inbuf = in;
-+  size_t inleft = sizeof (in) - 1;
-+  char out[1];
-+  char *outbuf = out;
-+  size_t outleft = sizeof (out);
-+  iconv_t cd;
-+
-+  cd = iconv_open ("UTF8", "ISO-2022-JP-3");
-+  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
-+
-+  /* First call to iconv should alter internal state.
-+     Now, JISX0201_Kana_set is selected and
-+     state value != ASCII_set.  */
-+  TEST_VERIFY (iconv (cd, &inbuf, &inleft, &outbuf, &outleft) != (size_t) -1);
-+
-+  /* No bytes should have been added to
-+     the output buffer at this point.  */
-+  TEST_VERIFY (outbuf == out);
-+  TEST_VERIFY (outleft == sizeof (out));
-+
-+  /* Second call shall emit spurious NUL character in unpatched glibc.  */
-+  TEST_VERIFY (iconv (cd, NULL, NULL, &outbuf, &outleft) != (size_t) -1);
-+
-+  /* No characters are expected to be produced.  */
-+  TEST_VERIFY (outbuf == out);
-+  TEST_VERIFY (outleft == sizeof (out));
-+
-+  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
-Index: git/iconvdata/iso-2022-jp-3.c
-===================================================================
---- git.orig/iconvdata/iso-2022-jp-3.c
-+++ git/iconvdata/iso-2022-jp-3.c
-@@ -1,5 +1,6 @@
- /* Conversion module for ISO-2022-JP-3.
-    Copyright (C) 1998-2021 Free Software Foundation, Inc.
-+   Copyright (C) The GNU Toolchain Authors.
-    This file is part of the GNU C Library.
-    Contributed by Ulrich Drepper <drepper@cygnus.com>, 1998,
-    and Bruno Haible <bruno@clisp.org>, 2002.
-@@ -81,20 +82,31 @@ enum
-    the output state to the initial state.  This has to be done during the
-    flushing.  */
- #define EMIT_SHIFT_TO_INIT \
--  if (data->__statep->__count != ASCII_set)			      \
-+  if ((data->__statep->__count & ~7) != ASCII_set)			      \
-     {									      \
-       if (FROM_DIRECTION)						      \
- 	{								      \
--	  if (__glibc_likely (outbuf + 4 <= outend))			      \
-+	  uint32_t ch = data->__statep->__count >> 6;			      \
-+									      \
-+	  if (__glibc_unlikely (ch != 0))				      \
- 	    {								      \
--	      /* Write out the last character.  */			      \
--	      *((uint32_t *) outbuf) = data->__statep->__count >> 6;	      \
--	      outbuf += sizeof (uint32_t);				      \
--	      data->__statep->__count = ASCII_set;			\
-+	      if (__glibc_likely (outbuf + 4 <= outend))		      \
-+		{							      \
-+		  /* Write out the last character.  */			      \
-+		  put32u (outbuf, ch);					      \
-+		  outbuf += 4;						      \
-+		  data->__statep->__count &= 7;				      \
-+		  data->__statep->__count |= ASCII_set;			      \
-+		}							      \
-+	      else							      \
-+		/* We don't have enough room in the output buffer.  */	      \
-+		status = __GCONV_FULL_OUTPUT;				      \
- 	    }								      \
- 	  else								      \
--	    /* We don't have enough room in the output buffer.  */	      \
--	    status = __GCONV_FULL_OUTPUT;				      \
-+	    {								      \
-+	      data->__statep->__count &= 7;				      \
-+	      data->__statep->__count |= ASCII_set;			      \
-+	    }								      \
- 	}								      \
-       else								      \
- 	{								      \
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.35.bb
similarity index 73%
rename from meta/recipes-core/glibc/glibc_2.34.bb
rename to meta/recipes-core/glibc/glibc_2.35.bb
index 67464d6ce0c..2903a4001fd 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -34,32 +34,19 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://makedbs.sh \
            \
            ${NATIVESDKFIXES} \
-           file://0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
-           file://0016-yes-within-the-path-sets-wrong-config-variables.patch \
-           file://0018-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0019-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0026-intl-Emit-no-lines-in-bison-generated-files.patch \
-           file://0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
-           file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
-           file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
-           file://0001-CVE-2021-38604.patch \
-           file://0002-CVE-2021-38604.patch \
-           file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://CVE-2021-43396.patch \
-           file://0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch \
-           file://0001-CVE-2022-23218.patch \
-           file://0002-CVE-2022-23218.patch \
-           file://0001-CVE-2022-23219.patch \
-           file://0002-CVE-2022-23219.patch \
-           file://0001-CVE-2021-3998.patch \
-           file://0002-CVE-2021-3998.patch \
-           file://0001-CVE-2021-3999.patch \
-           file://0002-CVE-2021-3999.patch \
+           file://0009-yes-within-the-path-sets-wrong-config-variables.patch \
+           file://0010-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0011-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
+           file://0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
+           file://0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
+           file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.35.1


