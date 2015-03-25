Return-Path: <tylerwhall@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id DF05172B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:36:19 +0000 (UTC)
Received: by ignm3 with SMTP id m3so74934119ign.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0REUIFFw7N/hHCLoHVU6KlMPLXfje3yUOwj2mBoCMuI=;
	b=R9u51nIGth52LrpLmsoYYaigjsA0ztqC/ZsmLSzMMARNIKvClyzjukwbkhvcnjU5Nk
	q7ZkYSzJ849FCHHCQr7abqEYBM7/aDZ1pvmver29tI/wCV7Jh6arlu4lAZM4i57NLW3P
	Xgrm1tUSwBDsadyssvKQryTUOqAe4ZWKBUWbbGiLpzsBqr3AH7tiniozLBDtPFHlhOAl
	8bdUggRQp6UE7NW5l8BsxnF+x5IxRXvm2VL6+O2/Fng1XNW48aC9MxwZDvRr4yP/8Q9i
	AMBM1OeXe5Kwkar6adrGsrjYPYXe3ygcBn1+JxD+2M2UPtCgNxyrHJJPTdeYqBd9LlGG
	zGjg==
X-Received: by 10.50.118.97 with SMTP id kl1mr23935139igb.23.1427304980406;
	Wed, 25 Mar 2015 10:36:20 -0700 (PDT)
Received: from metric.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210])
	by mx.google.com with ESMTPSA id h7sm1614932ioi.5.2015.03.25.10.36.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Mar 2015 10:36:19 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2015 13:35:31 -0400
Message-Id: <1427304931-29872-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1427235430-20299-1-git-send-email-tylerwhall@gmail.com>
References: <1427235430-20299-1-git-send-email-tylerwhall@gmail.com>
Subject: [PATCH v2] uninative-tarball: fix dependency on patchelf
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
X-List-Received-Date: Wed, 25 Mar 2015 17:36:20 -0000

DEPENDS doesn't actually add the dependency on patchelf-native to the
populate_sdk task. SDK_DEPENDS does this, but move the append to after
inheriting the base class so it does not get overwritten.

Without this, uninative-tarball fails to build in a clean workspace on a
system without patchelf.

[Yocto #7467]

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
Acked-by: Randy Witt <randy.e.witt@linux.intel.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 53435f2..62bdde8 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -11,7 +11,6 @@ TOOLCHAIN_HOST_TASK = "\
     "
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS += "patchelf-native"
 
 TOOLCHAIN_OUTPUTNAME ?= "${BUILD_ARCH}-nativesdk-libc"
 
@@ -25,6 +24,8 @@ inherit populate_sdk
 deltask install
 deltask package
 
+SDK_DEPENDS += "patchelf-native"
+
 SDK_PACKAGING_FUNC = ""
 
 fakeroot create_sdk_files() {
-- 
2.3.1


