Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id AF7F27ED5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:06:45 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c81so864803pfc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=QwODM4tQFs+bF5yEhuF4SUkeJ/nk7HUM7usBvgpZ31U=;
	b=fN2NjBckOr4d74dqWIL7GrEQqL3XfuQIhhkPkFKmjPjUuXpYPo/XwhZApJApPRmSGe
	fECyT3TIa5QR16qedjWC0SpUO8Umv8YYekvmqfb+W5H3ECi+bA7rWYCM0n7uHxoPHqXT
	JTCI8L3G26psH6u/UfDm6pk2W+Go+XiJuPfx+uilL54NjAO8rwSmVDzp+/Y/s0yYDHCc
	waViQldEpXAA0GsOCv260sZFZiKoUZ6bsjU/Fgg9iZStDsLbuIhjukgO/hykp3HF4yyD
	WZOa/xVeLhSLIlQ8Jc1sH+89DnLfpVfMqCmigjUx2uviW9mm6NMwsRGbIvElFL0bbOBv
	i+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=QwODM4tQFs+bF5yEhuF4SUkeJ/nk7HUM7usBvgpZ31U=;
	b=ju/iILNXl87DCjpCGKglWVpa/l/NkTpni7c6liHXrjd/g1R+tu4qczUjceleLGQLON
	0eWHLz2ItVS9Ggesqojd/E/APHQLXDShNblz9W0GBLwHTYbxknLLUphpfR6/lgRZ73LX
	D1VvNfkaRgvReAnfLMauhvjNKoyJ1FIAEVs92khFXYaGJmYgztd3RW9AqENwvnC9I5bY
	1ZRtKra9x+5VdcO7ViJ7/tU7WYOpLyGIfsxYcDMDwuesiVKroOj7Zq6dBiZXDoKG/sGW
	8m/YrdNBPERW4szf6a6QiMYqhtfyk7sH4WIR81mVLgRgv1XSTTzwwV4J8IPevqkPbSpW
	//2Q==
X-Gm-Message-State: APjAAAXKAePJJ6s094e8Ut7Rplv8OK2pIbrkXr9M5hOQU1emn66LvTEf
	9z6QPL9y9DxwwdQ0K+ofgnH286YaWaE=
X-Google-Smtp-Source: APXvYqxEgZJWpphSCeSYdpNZWsmIIu9qH5OK/3hCLSpVfGfu6A6FkMyNIuUaBY41lPaIlHSSyZukIw==
X-Received: by 2002:aa7:93cc:: with SMTP id y12mr2547161pff.246.1566968806749; 
	Tue, 27 Aug 2019 22:06:46 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	131sm1017287pge.37.2019.08.27.22.06.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:06:46 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-1-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/11] binutils: Add do_check task for executing binutils test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 05:06:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Create the do_check task to the binutils-cross include. This task can be
used to execute the binutils test suite for the cross target binutils.
By default this executes all the check targets of the binutils Makefile,
this can however be changed by setting MAKE_CHECK_TARGETS to the desired
test suite target (e.g. check-gas).

The binutils test suites do not require any target execution, as such
the check target can be run without QEMU or a target device. However
since the binutils tests do rely on a C compiler there is dependence on
both gcc and libc in order to run the tests.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 02ec891606..76eb453f0e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -36,3 +36,31 @@ do_install () {
 	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64 || :
 	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${prefix} || :
 }
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+MAKE_CHECK_TARGETS ??= "check-binutils check-gas check-gold check-ld check-libiberty"
+
+python () {
+    # crosssdk deps have different virtual targets
+    if bb.data.inherits_class('crosssdk', d):
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}gcc-crosssdk:do_populate_sysroot")
+        d.appendVarFlag("do_check", "depends", " virtual/nativesdk-${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+    else:
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}gcc:do_populate_sysroot")
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+}
+
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+do_check[dirs] = "${B}"
+do_check[nostamp] = "1"
+do_check() {
+    # need to inject CC and CXX as the target CC and CXX with sysroot
+    oe_runmake -i ${MAKE_CHECK_TARGETS} \
+        RUNTESTFLAGS=" \
+            CC='${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}' \
+            CXX='${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}' \
+            "
+}
+addtask check after do_compile
+
---
2.23.0.rc1

