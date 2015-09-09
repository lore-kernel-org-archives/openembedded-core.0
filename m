Return-Path: <nathan@nathanrossi.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id DBE0B73243
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 09:34:19 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so5359654pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 02:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/7PUUziO026t8prtD+0RvWayubR4DPluH+tVPFPPkeA=;
	b=icih2oi8mYRZ1FD+8AlfX6WjE+ENI92ytXjVNhsMTKqINDY5VaEZyuKfKukzxrSlqp
	rr3ppHMM2DpAsckJo2a/D7NCimPhZy028NJLUSkV9z94sOZCDCLVCwmdQBm9LupMl8FA
	weKLwwc2SmSky/+zrqlgXP/StT+w54Ff1WuY7FibDCoymopYQRpC2nHZYr56XDDrVSBG
	fTKMCRnYho5Are8zLh9BWfXPh+qsnDWYzwTWAkrVmWL7hR+oiOcwbCxEhlGgbMFgjyv8
	fgFpOokrzZEws0jIQ70FzAjGg68x15AklSRTXKbFlAppdq+STwJkRN1JgMQ4MsRUPHgK
	wVXQ==
X-Gm-Message-State: ALoCoQnfRBLKy4JAQjetPjnxyOyQUyVHxOClbdn48eP0PR9+WkwTCzwGHJAiTt8JQJe2JV8P+Heb
X-Received: by 10.66.122.97 with SMTP id lr1mr58964635pab.76.1441791259542;
	Wed, 09 Sep 2015 02:34:19 -0700 (PDT)
Received: from nathanbox.home.gateway ([103.26.61.212])
	by smtp.gmail.com with ESMTPSA id
	de9sm4247146pdb.70.2015.09.09.02.34.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 02:34:18 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 19:34:01 +1000
Message-Id: <1441791241-29328-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Wed, 09 Sep 2015 09:34:20 -0000

U-Boot will compile its own tools during the build, with specific
configurations (aka when CONFIG_FIT_SIGNATURE is enabled) the host tools
require openssl. This patch adds openssl-native as a dependency and also
adds the complete CC flags (as done in u-boot-mkimage) for the HOSTCC
variable that U-Boot uses when compiling the host tools.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Note: Only a few different board configurations use CONFIG_FIT_SIGNATURE,
for 2015.07 this includes "ids8313", "am335x_boneback_vboot" as well as all the
Xilinx Zynq boards.
---
 meta/recipes-bsp/u-boot/u-boot.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 990ddb1..51f5423 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -16,6 +16,12 @@ inherit uboot-config deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 
+# u-boot will compile its own tools during the build, with specific
+# configurations (aka when CONFIG_FIT_SIGNATURE is enabled) or when compiling
+# just the tools, openssl is needed as a HOST dependency.
+DEPENDS += "openssl-native"
+EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.
-- 
2.5.1


