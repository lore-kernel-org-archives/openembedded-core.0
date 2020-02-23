Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD59608DF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 22:12:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w12so8150472wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XMNoP52rOAOolFeDHdLMxS5lPQIqC04DYFMhimHLgSs=;
	b=hgewWPH65zQElmcs8JBLTx9LRStUGOrgeyYVxQzAk35vsKZM1Y3rbSymj+Ktb9VSU1
	Kp8EcD4LQ2majMcWlxyLNuKc6XalMUTgdXTVtirDDKhNKXLi30pkqdFV+bfiMvx2adVx
	R8PZUmnokuF52QpVP0hNXdkSxglEs3av/kw8x26JKmTM8sEbvnaImojGZx5X+89ykolJ
	/Y97kwL83T5q0DSuwLM8YX0vfWQpvgA/xFuAJ6FwRW1L0eVlDsZQA8u8A37WGhrikBCb
	QAUYgNEgT1kd7AqSC3o66XgflE0DOE65CUPjVHCnd6JOoKg1osajlTZwogXI88EGzTic
	unZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XMNoP52rOAOolFeDHdLMxS5lPQIqC04DYFMhimHLgSs=;
	b=HQFwRQ08tZsXzRs8gOERA47sXOLkV6wtXSkTEU9x7g/zTRNA2xzIbOZoPkkxDrtqI0
	TF4ZAzIvcZDW27n6k2Hro7HLT7LveBnZK3SSw2cm5Yt/z7TKAh9nZl5Rnz2UpLHbp2Ua
	eaT3pHKEWIGs2Rd3vxvPpb9HHm8UOXwnkFOj51c2+6Rt+Ut1rIko+WYAh1fkgXlPJKjP
	3Nvlo1rh3+8Hoytw1CTHm0xaaIc0B8lRZCCvFSX6iI5hyqXJX/pTLnp4EVhPZrKcPV0d
	7wk3nmlWjpV/2B13zykx6wlWdHeFUAgGCseHNewXETx2NzokAck5tR40p+B3BlDjf5qJ
	sMiw==
X-Gm-Message-State: APjAAAUXBqiDsyPcHMaoC/VDT4JULcpnqlz2BVOjQ1+jq3bUDpGmL6hA
	hnYNxsm1j/eC/opxmF9aG5mzTL6A
X-Google-Smtp-Source: APXvYqzSXqbLt1EweySNc8DU+N1i0XQwPvIXfbtUL2ksbBJkRt8+pR5Jg02RqJAJNBDbCuz6NaZ6uA==
X-Received: by 2002:adf:e543:: with SMTP id z3mr60800365wrm.369.1582495924054; 
	Sun, 23 Feb 2020 14:12:04 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	n3sm15939630wmc.27.2020.02.23.14.12.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 14:12:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 23:11:11 +0100
Message-Id: <20200223221111.12560-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] wayland: add ptest
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
X-List-Received-Date: Sun, 23 Feb 2020 22:12:04 -0000
Content-Transfer-Encoding: 8bit

Sadly, meson makes it very difficult to install tests: the test
configuration is written into host-specific binary files, which
can't be transferred to the target. (unlike autotools where
at least everything happens via Makefiles which can be patched
and tweaked via sed and env vars)

So the configuration has to be entirely recreated in shell.
I managed this for wayland, but weston proved too difficult.

I had filed bugs asking upstream to make the tests installable:
https://gitlab.freedesktop.org/wayland/wayland/issues/146
https://gitlab.freedesktop.org/wayland/weston/issues/368

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-graphics/wayland/wayland/run-ptest | 17 +++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.18.0.bb | 14 +++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 6e770853b8..4afac58e3a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -47,6 +47,7 @@ PTESTS_FAST = "\
     quilt-ptest \
     sed-ptest \
     slang-ptest \
+    wayland-ptest \
     zlib-ptest \
 "
 
diff --git a/meta/recipes-graphics/wayland/wayland/run-ptest b/meta/recipes-graphics/wayland/wayland/run-ptest
new file mode 100644
index 0000000000..7e8d9de046
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+export WAYLAND_SCANNER=wayland-scanner
+export TEST_DATA_DIR=tests/data
+export TEST_OUTPUT_DIR=tests/output
+export SED=sed
+export WAYLAND_EGL_LIB=/usr/lib/libwayland-egl.so.1
+export NM=nm
+
+for i in `ls tests/*-test tests/wayland-egl-symbols-check tests/scanner-test.sh`; do
+    $i
+    if [ $? -eq 0 ]; then
+        echo "PASS: $i"
+    else
+        echo "FAIL: $i"
+    fi
+done
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 5dc31163da..00be3aac27 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 DEPENDS = "expat libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://run-ptest \
            file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
@@ -23,7 +24,7 @@ SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-inherit meson pkgconfig
+inherit meson pkgconfig ptest
 
 PACKAGECONFIG ??= "dtd-validation"
 PACKAGECONFIG[dtd-validation] = "-Ddtd_validation=true,-Ddtd_validation=false,libxml2,,"
@@ -39,6 +40,15 @@ do_install_append_class-native() {
       -i ${D}/${datadir}/aclocal/wayland-scanner.m4
 }
 
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/tests/data
+    cp -rf ${B}/tests/*-test ${B}/tests/*-checker ${D}${PTEST_PATH}/tests
+    cp -rf ${B}/tests/*-checker ${D}${PTEST_PATH}
+    cp -rf ${S}/tests/scanner-test.sh ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/data/* ${D}${PTEST_PATH}/tests/data/
+    cp -rf ${S}/egl/wayland-egl-symbols-check ${D}${PTEST_PATH}/tests/
+}
+
 sysroot_stage_all_append_class-target () {
 	rm ${SYSROOT_DESTDIR}/${datadir}/aclocal/wayland-scanner.m4
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
@@ -48,3 +58,5 @@ FILES_${PN} = "${libdir}/*${SOLIBS}"
 FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-ptest += "binutils sed"
-- 
2.25.0


