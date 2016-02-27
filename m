Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCC97748E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 05:53:23 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id wz1so6781618obc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N9yrlCOCWldHglF+Y/TiN0vhioTPyynWc2NGdRunDCE=;
	b=LpN8jSf1ktrx8BI46h/ECRCUSLNm2QvtzL1sp4oESLTjT5dvmZFth36hVo2WKROJC9
	SBa908GfoWBkDovI9wnPsDm0X4hhKuXbuf+3/TT9W+1UuOsn5RbkzZNHf3dZmPrpGO87
	YKSzaiGJvncNdlEm8mrvtLW7mbOlgVEmGj/G3O7ywqNVk062aJQJb8SHlZNtvc0mQLmZ
	6JPWAJQxAls9J3SlLJSIhl2QdHQ6bTxwOVsxyWvsTlKzELLiX/pFq/mw50QlzkOnIzMt
	qdvPpz/W/5HnlTTHsoQQREqTilVafghQ7adXHxVE7U0cxbOakv+t2rJl3EAmkd8oSGbK
	9BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N9yrlCOCWldHglF+Y/TiN0vhioTPyynWc2NGdRunDCE=;
	b=lSyx8HxooYVf0r0ft4dQkuYIcejffyA1lpDBsKhjMYe0RgDYpebe1MsivrvrHnQiEU
	1If8LuRuHnVJGr9x4df6IeGnReDGFshIF3kvk8p5TRxapAn9xFjOn5PxEc5Vy3OJ0jYk
	nSEPKrbCwko7Cq7Q2qmhZSAhisxJJlBe+PizMu5D+OuYwf1KdnXHHYOB6ha1vuUZMbaf
	N4kwHld677E1CuFY5zuF3s6gVCigpY1BgEYZs6OojGDxLQmJnYsWEND5FwRuCVCFlntP
	vYRRBLLLADjnQi/m3pBFAiHmh8NqVBx/rUVWHot4XJg74JRHeGgq+4dX9SBn6AcGh64S
	nWHA==
X-Gm-Message-State: AD7BkJJLaY2Hol8BO3+2v/FL1vih3XkTIJ1lAyUFJhAAVCwu1QK13WVF1j9Fi3KMULZVlw==
X-Received: by 10.182.226.165 with SMTP id rt5mr3944023obc.51.1456552404672;
	Fri, 26 Feb 2016 21:53:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cd5sm10867528oec.15.2016.02.26.21.53.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 21:53:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 21:53:07 -0800
Message-Id: <1456552387-10564-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
References: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] native.bbclass: poison TARGET_CFLAGS etc for native builds
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
X-List-Received-Date: Sat, 27 Feb 2016 05:53:24 -0000

TARGET_* FLAGS are never passed to the native toolchain. However,
they are exported so their values affect the checksum of every task.

Replace with fixed values to both avoid any unnecessary rebuilding
of native packages when target flags are changed (as before) and now
also to poison any accidental use of target flags with the native
toolchain.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/native.bbclass | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index f67ef00..34c08b2 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -26,10 +26,18 @@ TARGET_PREFIX = "${BUILD_PREFIX}"
 TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
 TARGET_LD_ARCH = "${BUILD_LD_ARCH}"
 TARGET_AS_ARCH = "${BUILD_AS_ARCH}"
-TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
-TARGET_CFLAGS = "${BUILD_CFLAGS}"
-TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
-TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
+
+# TARGET_* FLAGS are never passed to the native toolchain. However, they are
+# exported so their values affect the checksum of every task. Replace with fixed
+# values to both avoid any unnecessary rebuilding of native packages when target
+# flags are changed and to poison any accidental use of target flags with the
+# native toolchain.
+TARGET_CPPFLAGS = "--target-cppflag-never-passed-to-the-native-toolchain"
+TARGET_CFLAGS = "--target-cflag-never-passed-to-the-native-toolchain"
+TARGET_CXXFLAGS = "--target-cxxflag-never-passed-to-the-native-toolchain"
+TARGET_LDFLAGS = "--target-ldflag-never-passed-to-the-native-toolchain"
+
+# Hardcoding is OK since native always implies x86 or x86-64.
 TARGET_FPU = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
-- 
1.9.1


