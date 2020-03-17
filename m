Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9811360B33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 18:32:07 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 37so12180621pgm.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 11:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sFmx5nnmYZSFyPZOf1b+5VjS3Mcc9DtmIKCbS2my+uA=;
	b=WX3Bei3KBmRUNg+AVw4qMoBeXYQyOmsNX0RHU4JEJt4yZRDSNu4f1B1yBtNqLsgCwm
	djoXvNzgfDGEzlh5Rpzuf1jhxq6eawiC2Ne/sNbAVHscPrSr10aDrfX9lpkn3RCwZjd5
	/Z87VDbsgE1dRu9O1ppPM6VOJSgsBz0aDp10dMvHNv6DalRFs4yr27Zpyij/R5eIe7Tb
	dbTvzY+x7z/m4BO9Of6cIYyyluKc4xTjHKRaPAFvkPoCPwXPakHsVDVivQAG83QLTOAx
	qKJHYjElLYNiuleZDkcsu/Io8srTWhundXUA1BdVs9lExgSqVXUyxg50WG38YAFoH1B4
	EjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sFmx5nnmYZSFyPZOf1b+5VjS3Mcc9DtmIKCbS2my+uA=;
	b=agQUCKeIPn16TWTA/MBc54HdWghOkCssBxq1HaABO56KQCAHrM/w+zwVxBXAHRqRiN
	KJ+22G2aL5Wr44IIpkZNrZm2+nji8OLPZULUqvj2IhAlg0XLdfKOaP2I7ZJgNce4UYZi
	+q+95WaIr8+m2zcM504tvaLPoD1UJSMgsyyXs/G6fHUiGesvh1Dm/z7BtjMs5eFXwFrE
	X9AirfFQiXbXkwdHLXrcEuiOhFFGApmH1J3fsN82t10rSBdCVQeuIZ5crfh9MZxFwIdY
	9JfVV2Z+ZKwSx+WyP+Yq0zj7yVCvyNNb1rUVmxrZF38GeQg9mYiS+8pp2mUw+24PUdIM
	yRyg==
X-Gm-Message-State: ANhLgQ3Imt+Ickm023Q47OoRv3qqU3NOIGEIJxwpoK0OWwFpTjVogROr
	kVovlTCa5HVDxysBYoE3ZIP5iz0Sop0=
X-Google-Smtp-Source: ADFU+vu8HqQcnVAGKtjxoeAwOsraz/Mc5MgfgQqqwTNtJyy1cDWrpHlOUV5gd/qUcQxd9N9F2spAwA==
X-Received: by 2002:a62:2b90:: with SMTP id r138mr115535pfr.102.1584469927848; 
	Tue, 17 Mar 2020 11:32:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id f3sm3383092pgg.46.2020.03.17.11.32.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 11:32:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 11:32:20 -0700
Message-Id: <20200317183220.774083-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] libucontext: Fix multilib build
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
X-List-Received-Date: Tue, 17 Mar 2020 18:32:07 -0000
Content-Transfer-Encoding: 8bit

libdir is hardcoded to /lib which is not going to work in multilib
scene, patch makefile to add a variable to override the libdir from env

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Makefile-Add-LIBDIR-variable.patch   | 46 +++++++++++++++++++
 meta/recipes-core/musl/libucontext_git.bb     |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch

diff --git a/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch b/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
new file mode 100644
index 0000000000..4f91c8f189
--- /dev/null
+++ b/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
@@ -0,0 +1,46 @@
+From 9bc3cedba54708c40c4a853b240c46e69f87de3c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Mar 2020 10:04:40 -0700
+Subject: [PATCH] Makefile: Add LIBDIR variable
+
+This ensures that it can be installed into custom location and also
+
+Upstream-Status: Submitted
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,5 @@
+ ARCH := $(shell uname -m)
+-
++LIBDIR := /lib
+ CFLAGS = -ggdb3 -O2 -Wall -Iarch/${ARCH}
+ 
+ LIBUCONTEXT_C_SRC = $(wildcard arch/${ARCH}/*.c)
+@@ -10,8 +10,8 @@ LIBUCONTEXT_SOVERSION = 0
+ LIBUCONTEXT_NAME = libucontext.so
+ LIBUCONTEXT_STATIC_NAME = libucontext.a
+ LIBUCONTEXT_SONAME = libucontext.so.${LIBUCONTEXT_SOVERSION}
+-LIBUCONTEXT_PATH = /lib/${LIBUCONTEXT_SONAME}
+-LIBUCONTEXT_STATIC_PATH = /lib/${LIBUCONTEXT_STATIC_NAME}
++LIBUCONTEXT_PATH = ${LIBDIR}/${LIBUCONTEXT_SONAME}
++LIBUCONTEXT_STATIC_PATH = ${LIBDIR}/${LIBUCONTEXT_STATIC_NAME}
+ 
+ all: ${LIBUCONTEXT_SONAME} ${LIBUCONTEXT_STATIC_NAME}
+ 
+@@ -36,9 +36,9 @@ clean:
+ 		${LIBUCONTEXT_OBJ} test_libucontext
+ 
+ install: all
+-	install -D -m755 ${LIBUCONTEXT_NAME} ${DESTDIR}/${LIBUCONTEXT_PATH}
+-	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}/${LIBUCONTEXT_STATIC_PATH}
+-	ln -sf ${LIBUCONTEXT_SONAME} ${DESTDIR}/lib/${LIBUCONTEXT_NAME}
++	install -D -m755 ${LIBUCONTEXT_NAME} ${DESTDIR}${LIBUCONTEXT_PATH}
++	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}${LIBUCONTEXT_STATIC_PATH}
++	ln -sf ${LIBUCONTEXT_SONAME} ${DESTDIR}${LIBDIR}/${LIBUCONTEXT_NAME}
+ 
+ check: test_libucontext ${LIBUCONTEXT_SONAME}
+ 	env LD_LIBRARY_PATH=$(shell pwd) ./test_libucontext
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 72e15aa9a4..92cb703b0b 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -12,6 +12,7 @@ PV = "0.1.3+${SRCPV}"
 SRCREV = "e6b4d7516dae9b200e94fcfcb9ebc9331389655f"
 SRC_URI = "git://code.foxkit.us/adelie/libucontext.git;protocol=https \
            file://0001-pass-LDFLAGS-to-link-step.patch \
+           file://0001-Makefile-Add-LIBDIR-variable.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -51,7 +52,7 @@ export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
 
 CFLAGS += "-Iarch/${ARCH}"
 
-EXTRA_OEMAKE = "CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}' LIBDIR='${base_libdir}'"
 
 do_compile() {
     oe_runmake ARCH=${ARCH}
-- 
2.25.1


