Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.14848.1598518842331299424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ieVwH51j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id f7so4599536wrw.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFgBWLF7YcHb+kQN2yM3jtG3HdUQ+IxWXs4r8tB8u2c=;
        b=ieVwH51jmdHz0jhXZl45eWj1RYzYxALDCjtzhkWnqecEPDcFV8RCitQD/8lDoDB1DS
         XdMA3QRL2w0GvY+VoK7uWCR/Hnsc0Id2B0og4gXDv4XGqliQhaeuH29t9ddp7lwL+pJ9
         qHEzdhIsx9VaCI5OkgBTN8LtmU361p9SXEcvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFgBWLF7YcHb+kQN2yM3jtG3HdUQ+IxWXs4r8tB8u2c=;
        b=pBejfcaA/Xpje7yMkiuF9ZeyPeESqSOsJ4p+LHkwNPQGa13IHAB4nMK+e9LVXEURSp
         /rLyw3QAXUkTtIdlCmRCKaTdfpIR5ZA13GYUmQ9CSnUWpMfnXkVRCc0LwfKBTfGBpbNV
         ynANmNQAYLwUpgd//e6mRjEeiwKbj1JvuzhOWV6+PeHAeSkBx37NOjYPrWkjSweaRZZD
         +eIDZdFTEe8AhRJ+bK4Dq14DDmOR1Q+PabO5VrL8Y2KJYEQ8KfbwvaXy1Sl4/HDU2P5W
         z62NKt5SlD/Yws+cP9BBbFYTLjmbiofNVxo7k5LuH+Uxu+jO+V/RHanJnqqf4aXCnn6P
         xhiw==
X-Gm-Message-State: AOAM533LJJMAiT/h5FoRgNHRUOCOErX2CKKl8bM49X49Ml17TKmzSTrx
	NpXHLIqxk683eFlPDbRmTIusdcRQWniZaXcT
X-Google-Smtp-Source: ABdhPJyTJPymh4Y4EO4+B4liV+Bgnz7mfI/FGetMhlCu/IrofRuVrzppqGSewf2hEWO08fS4ir52oA==
X-Received: by 2002:adf:ffc1:: with SMTP id x1mr19746984wrs.54.1598518839852;
        Thu, 27 Aug 2020 02:00:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id e18sm4126437wrx.50.2020.08.27.02.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:00:39 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lttng: Move platform logic to dedicated inc file
Date: Thu, 27 Aug 2020 10:00:37 +0100
Message-Id: <20200827090037.1510819-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some platforms support kernel tracing, some support userspace tracing.
This change:

* Moves the knowledge/config to one place in an inc file
* Allows lttng-tools to build without lttng-modules
* Hence enables tools+ust for riscv64
* Has the packagegroup just depend on lttng-tools which will pull in
  ust/modules as needed

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroup-core-tools-profile.bb          | 11 -----------
 .../lttng/lttng-modules_2.12.2.bb               |  2 +-
 meta/recipes-kernel/lttng/lttng-platforms.inc   | 17 +++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb |  8 +++++---
 meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb   |  2 ++
 5 files changed, 25 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-platforms.inc

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 608e406f834..17b1391a476 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -35,17 +35,8 @@ SYSTEMTAP_libc-musl = ""
 SYSTEMTAP_nios2 = ""
 SYSTEMTAP_riscv64 = ""
 
-# lttng-ust uses sched_getcpu() which is not there on for some platforms.
-LTTNGUST = "lttng-ust"
-LTTNGUST_arc = ""
-
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_arc = ""
-LTTNGTOOLS_riscv64 = ""
-
-LTTNGMODULES = "lttng-modules"
-LTTNGMODULES_arc = ""
-LTTNGMODULES_riscv64 = ""
 
 BABELTRACE = "babeltrace"
 BABELTRACE2 = "babeltrace2"
@@ -69,9 +60,7 @@ VALGRIND_linux-gnun32 = ""
 
 RDEPENDS_${PN} = "\
     ${PROFILETOOLS} \
-    ${LTTNGUST} \
     ${LTTNGTOOLS} \
-    ${LTTNGMODULES} \
     ${BABELTRACE} \
     ${BABELTRACE2} \
     ${SYSTEMTAP} \
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
index b9b36430019..c2fc65e019e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 
 inherit module
 
-COMPATIBLE_HOST_riscv64 = "null"
+include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
new file mode 100644
index 00000000000..aa8220bbb44
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
@@ -0,0 +1,17 @@
+#
+# Whether the platform supports kernel tracing
+#
+LTTNGMODULES = "lttng-modules"
+LTTNGMODULES_arc = ""
+LTTNGMODULES_riscv64 = ""
+
+COMPATIBLE_HOST_riscv64_pn-lttng-modules = "null"
+COMPATIBLE_HOST_arc_pn-lttng-modules = "null"
+
+# Whether the platform supports userspace tracing
+# lttng-ust uses sched_getcpu() which is not there on for some platforms.
+LTTNGUST = "lttng-ust"
+LTTNGUST_arc = ""
+
+COMPATIBLE_HOST_arc_pn-lttng-ust = "null"
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
index 0614e867136..f7e6ec2cba3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
@@ -9,9 +9,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
                     file://LICENSES/GPL-2.0;md5=e68f69a54b44ba526ad7cb963e18fbce \
                     file://LICENSES/LGPL-2.1;md5=9920968d0f2ff585ce61fae30344dd95"
 
+include lttng-platforms.inc
+
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules sed python3-core"
+RRECOMMENDS_${PN} += "${LTTNGMODULES}"
+RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
@@ -21,12 +24,11 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
-PACKAGECONFIG ??= "lttng-ust"
+PACKAGECONFIG ??= "${LTTNGUST}"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
-PACKAGECONFIG_remove_arc = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-do-not-strip-a-helper-library.patch \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
index ad544d1b4a2..67a4307c7bb 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
@@ -15,6 +15,8 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
 
 inherit autotools lib_package manpages python3native
 
+include lttng-platforms.inc
+
 EXTRA_OECONF = "--disable-numa"
 
 DEPENDS = "liburcu util-linux"
-- 
2.25.1

