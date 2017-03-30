Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D2FEA719AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 07:57:51 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so9617973wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0jT7XHhdAM91w8XbOgYgx7CTVvJN6VZKa0T8Ml+SM5w=;
	b=VeZNrSUwyGsww/36BELB9fnKGBRmHISUcy6tR6lQR+5bRbblNGikZoloBrzexABJhL
	ocnCkcXMBAbu9S/Ffhhx6f2HHGIc3F3sdQOhGQCdO4gJECwVK3TIHWqprN+H8FgXdJEN
	4OkRGuoYOn8pLJ/YgQIQqVKABxKz7bAP9EGvJwkWipZEsU7UPldnJ0jz8Ty4MOUTwo6z
	jhCE65sKNV0BPoLA+eHz6IC8P3Bg5lfDT7dz8MPkIqOL8eLw8Rf+MfI9TM0ZM25Iyv6Z
	gaHZ3XwcGhq1vzg/6Fz9Obgu/b8c6y803cea2Vad4eq6iUgDpeeq08ucTB34sgGPMouC
	YTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0jT7XHhdAM91w8XbOgYgx7CTVvJN6VZKa0T8Ml+SM5w=;
	b=Bvfqfl6SSkqeGlMKhfKN73UMUrlCRBPtERcjVNhuc+IMMiGrzI3AyNc46QKRfkI9sb
	yt2AfA72saKVLLwrI9XnBen7GPgZI0VRnAsr/qB9xVBPU+O6rHlNKvtkEuDM+l7pRqIR
	AKJJi0sGE/EM86tnDqGUUXz8dKm6e/f3tuylqiCXWVNr+uc6AvxSDvdfLiufcsuDUWF3
	qJ3SQRgtp4YNEaFmsndSnXpI9GnWj0LujMtfN5qn/AGgiIeYtrEA7oQSN7FyMuyc4xOw
	MjLJ1XCFpjlXokhdq78hZEUgRjrUsJW97Zy5t+GGQGNw9nKRhFmjpF9vQhXYt0gV6qa+
	OqYg==
X-Gm-Message-State: AFeK/H1//q1qnsNYgOz6SF03VbzRQrqHduhbWoPV2V4Wj5wS5Ii83goFMED/aZDtRBfynA==
X-Received: by 10.223.139.221 with SMTP id w29mr4240522wra.18.1490860672286;
	Thu, 30 Mar 2017 00:57:52 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.149]) by smtp.gmail.com with ESMTPSA id
	o196sm11239385wmg.12.2017.03.30.00.57.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 00:57:50 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 09:57:36 +0200
Message-Id: <1490860656-27448-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: define REAL_MULTIMACH_TARGET_SYS/SDKTARGETSYSROOT in bitbake.conf
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
X-List-Received-Date: Thu, 30 Mar 2017 07:57:52 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

REAL_MULTIMACH_TARGET_SYS is being defined and referred in several
recipes, which is redundant and not easy to be overriden, and
SDKTARGETSYSROOT is also defined in two recipes.

So move their definitions to bitbake.conf.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/populate_sdk_base.bbclass     | 6 ------
 meta/classes/toolchain-scripts.bbclass     | 3 ---
 meta/conf/bitbake.conf                     | 2 ++
 meta/recipes-core/meta/meta-environment.bb | 3 ---
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 563582e..fd123f6 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -30,8 +30,6 @@ SDKDEPLOYDIR = "${WORKDIR}/${SDKMACHINE}-deploy-${PN}-populate-sdk"
 
 B_task-populate-sdk = "${SDK_DIR}"
 
-SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
-
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')}"
@@ -41,10 +39,6 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native pixz-native"
 
-# We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
-# could be set to the MACHINE_ARCH
-REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
-
 PID = "${@os.getpid()}"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 260ece9..ecf5c60 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -1,8 +1,5 @@
 inherit toolchain-scripts-base siteinfo kernel-arch
 
-# We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
-# doesn't always match our expectations... but we default to the stock value
-REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
 TARGET_CC_ARCH_append_libc-uclibc = " -muclibc"
 TARGET_CC_ARCH_append_libc-musl = " -mmusl"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 96a9ed9..3f5fbce 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -151,6 +151,7 @@ PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"
 
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 MULTIMACH_HOST_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
+REAL_MULTIMACH_TARGET_SYS ?= "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 ##################################################################
 # Date/time variables.
@@ -400,6 +401,7 @@ SDK_NAME_PREFIX ?= "oecore"
 SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
 SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
+SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 ##################################################################
 # Kernel info.
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 29da121..e7bff7d 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -6,8 +6,6 @@ EXCLUDE_FROM_WORLD = "1"
 
 MODIFYTOS = "0"
 
-REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
-
 inherit toolchain-scripts
 TOOLCHAIN_NEED_CONFIGSITE_CACHE_append = " zlib"
 # Need to expand here before cross-candian changes HOST_ARCH -> SDK_ARCH
@@ -15,7 +13,6 @@ TOOLCHAIN_CONFIGSITE_NOCACHE := "${TOOLCHAIN_CONFIGSITE_NOCACHE}"
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
-SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 inherit cross-canadian
 
-- 
2.7.4


