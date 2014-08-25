Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E2E1C6AC7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 18:57:33 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so20419563pdi.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 11:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=um6LALNLGVc39+vBWZcaqfInfmhpbNZBe471kSTzuOE=;
	b=bR+ndytjsj996kdO1l0rOlL5fE/4FAzpTbfyg2njqKgRHl4kdzVlQMVI4mYAceF4Yz
	Fmtr/9bLnvWsBGxiY45KKF71XORwfhg+QDcQh+2NlowAAwrJbuVZxBpPA123s6TOh3qi
	UOQA4WBDcp57qkp+4/4HwG49yO9qwC/clutsg3F7lu67EDxAVpFd5W8J6X/Y0q9S0kyv
	hvaUJ188n0EfowT8/IvDyFiwR5VAamBtt966oOCb/Hx6+A4W4bPRn5UA90+LL0JiAMQJ
	uwMopamjW0HPA1jJ9pvAkmmDKaWAkjm8smSQaZ8Uvimwqs8EL88pLrZ1dbfFOZyNmnzU
	jSlA==
X-Received: by 10.70.37.67 with SMTP id w3mr30941881pdj.107.1408993054956;
	Mon, 25 Aug 2014 11:57:34 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id dq9sm815399pdb.70.2014.08.25.11.57.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 11:57:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 12:01:17 -0700
Message-Id: <0e3c53a4d84fa2a3c5e6b53697b953fab59a71bc.1408993148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1408993148.git.raj.khem@gmail.com>
References: <cover.1408993148.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] native/nativesdk: Clear MACHINEOVERRIDES
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
X-List-Received-Date: Mon, 25 Aug 2014 18:57:34 -0000

In cases where we override variables e.g PACKAGE_ARCH
conditionally and use a MACHINEOVERRIDE to qualify the
override like

PACKAGE_ARCH_<MACHINE> = "some target PACKAGE_ARCH"

This would also be effective if this recipe is
BBEXTENDED to native or nativesdk which is undesired
This particular issue will cause wrong sysroot to be
used for nativesdk case since PACKAGE_ARCH would have
been modified and eventually changing value of
STAGING_DIR_TARGET which we use as --sysroot option
to cross and cross-canadian built SDK gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/native.bbclass    |    1 +
 meta/classes/nativesdk.bbclass |    1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 9dec318..adebb97 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -109,6 +109,7 @@ PKG_CONFIG_SYSROOT_DIR = ""
 # we dont want libc-uclibc or libc-glibc to kick in for native recipes
 LIBCOVERRIDE = ""
 CLASSOVERRIDE = "class-native"
+MACHINEOVERRIDES = ""
 
 PATH_prepend = "${COREBASE}/scripts/native-intercept:"
 
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 37c9f79..5e78116 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -8,6 +8,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 CLASSOVERRIDE = "class-nativesdk"
+MACHINEOVERRIDES = ""
 
 #
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
-- 
1.7.10.4


