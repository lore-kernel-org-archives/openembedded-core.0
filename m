Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D49A747B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 15:19:21 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y55so9993331wry.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wec9N5qcAvslsh1B6me9MuYUC1jqot5w+GBz5kJYKko=;
	b=pSGGn9NZrxOx3iWH2CBfMChtBMn8XFmmFivLSs+6yB1LOfESifHACzErALgidt/gbS
	ldXETCwL6cyH9tSFdtlHxVy1OiJHHf6J5J2r4z7MW8v+yuKA2ERqm5uaANjzaVxTlp/j
	i/h8DY7ae9Kg1TLg5o50I2uwvyAGfnii00zg7j91eY9a2QztJ0Hc+3ZRsOibKDgBZh3t
	o2aWn8UsL/Is0iGI27k0EA2NaWFXHS30MKnRjVlYbCU4xy5iXOzbCdRCk+DHFlZBgF/K
	u6O4s7AOjAD7+wLu2FJ4NYWIGvepfXvrZ0NuUVoEjsC/iCk3tfYehvPqipkLWBz9adNi
	TtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wec9N5qcAvslsh1B6me9MuYUC1jqot5w+GBz5kJYKko=;
	b=SMDtAro3kLrsTVrqc/r22F7tC6lqkJs7GjlYmgR3bDo5/E2VX6eNGDQ9tNU4ilIPA1
	xmMoH93JCJSO6C1Xm0gM7RpeFtxW8QBAh7gBMd7NGy7YNhNou9YFIS/EcHLl/hiuNQQK
	CEj4lRX/I+ntrh1liI8ha7EEvy1bNr9cfLqBGr/icDjy/4TGoJMRaJV+MAUPNJxI58Uz
	UpIiWYfW9cPG+Aean2VM9Yqw6wuF+remlihZb+HYm6+1b/LEDexBxwITd3P1OMsKYpx/
	YlPFO+jtX9y72/nTV3JlnIy16KlXQIk1xnhp1VSQDBe9mPBnP7uf5/f0Mnf6u8YiJAq1
	RQNw==
X-Gm-Message-State: AElRT7EqiwB+kpSqtijK4HrX2DzVOwSqNiVKcR5NseGH0+AJKNHjO3Se
	DPtC7KnWMssQZPgWEOk4K/Fc5Eqr
X-Google-Smtp-Source: AIpwx49gUGFmC/bu2qP6x/xckvQaeriNnsQ/y67VnWLy7qzoHvpy6+4uuTcbf7UuHVbro0RkRFL0xQ==
X-Received: by 10.223.176.237 with SMTP id j42mr27602088wra.25.1523287162192; 
	Mon, 09 Apr 2018 08:19:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z16sm846810wrc.70.2018.04.09.08.19.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 08:19:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 16:19:19 +0100
Message-Id: <20180409151919.9133-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] populate_sdk_base: use xz -T instead of pixz
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
X-List-Received-Date: Mon, 09 Apr 2018 15:19:22 -0000

xz has native support for threaded compression now and SDK creation was the only
part of oe-core which is using pixz instead of xz.

Not only does this remove pixz-native from the SDK dependencies, but in my
limited testing xz -T0 is slightly faster and produces smaller archives than
pixz for the same input.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 77ec8aaec27..79984d7914f 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -46,7 +46,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
+SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
 SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
@@ -225,7 +225,7 @@ fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDKDEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 fakeroot create_shar() {
-- 
2.11.0


