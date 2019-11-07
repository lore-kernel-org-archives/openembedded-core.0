Return-Path: <workjagadeesh@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8546004D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 14:59:50 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p24so2831393pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 06:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=21yvZ8PrnDs3owE7o6bFsun376idQn/ysQCyMYXGomw=;
	b=hV4w7enZCK6E0K9ISXYRnI8i82wNVUsH3ZZNknPQgkPc0N22Xb/7DOM6RhpEsS6yps
	gdLKjGyzafZAm9a0zVkLdsgOAjjKjD1OcQWxO23xayGcsFb+4/JSAFYytB+Ub/e9j6Eu
	pG6x1gYjYE5hD61bic9Wy+WIAYwiqx7PZEUmV9FwokSxmiIe1iD0Ukq850KR6kOuXJw+
	SJpf0LGr1EuanXPpHpHY3QcU1KyiV+QovfBQ7RNrMG/czL8xs1H+tt9EVoud60FcgRLI
	z9NKmSZWNuB0+K5P8qW3DuM1X1iNiuAWU7Dm1NEJ/gQxSFZw2we0gLH+SQevEtVcR1pD
	DqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=21yvZ8PrnDs3owE7o6bFsun376idQn/ysQCyMYXGomw=;
	b=aORYT75ZgB/WyGGI8FOE515nUhFb99+K9/ndvIU3r9ux4s/XS155yJmk2XCPJ9AQOY
	YFkn0DvK8oRN/BcbvqZ9mp1YKbCd9t5olle6Vit3fX+D7yO5zavrHkahrAdJgYjrrEba
	f+7TDjeTXipZ6DOJZxoh1kbFG6tW1PFOmErP1lmh4mIggN1I5IWN8wvdK6tjQekLPjTy
	FOCjFqCU5pabsv9p6pNUsSjHKSZxH2fNOhbPwxlCLpO1TVQj+pJM98ov0/DKzGXUwCoc
	m62Cy6Slqe0sXp5MdkTEkYhp3QpAyaVMyAm9jyQGJ8I6rpZMFgNeolGsxR9naYIjcTbY
	G3zQ==
X-Gm-Message-State: APjAAAXRpe3/5keMjomeO/Fe9LVR1p7msZVlN+fbQMdOOSI0ppREZW4X
	5tujvQ1uf31vAvWwnGvpFwWsBsEP
X-Google-Smtp-Source: APXvYqztL4HqS15vm8hfNDrdnVt5A0rVkTpnFjaWvye2nRDlVqaKqNNT5ALlmORR7USxVN5EBfgmXQ==
X-Received: by 2002:a63:8c07:: with SMTP id m7mr5051300pgd.317.1573138791186; 
	Thu, 07 Nov 2019 06:59:51 -0800 (PST)
Received: from localhost.localdomain ([14.142.183.94])
	by smtp.gmail.com with ESMTPSA id
	r28sm3118432pfl.37.2019.11.07.06.59.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 06:59:50 -0800 (PST)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 20:27:50 +0530
Message-Id: <20191107145750.21934-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] tune-cortexa32: Fix libgcc-initial build issue for cortex-a32
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
X-List-Received-Date: Thu, 07 Nov 2019 14:59:50 -0000

When we try to build images for machine which is tuned for
cortex-a32, then libgcc-initial recipe fails to build with
below error message.

-- snip --
configure:3529: aarch64-poky-linux-gcc  -mcpu=cortex-a32+crc -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0/recipe-sysroot -o conftest  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0=/usr/src/debug/libgcc-initial/9.2.0-r0                      -fdebug-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0=/usr/src/debug/libgcc-initial/9.2.0-r0                      -fdebug-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0/recipe-sysroot=                      -fdebug-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0/recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now conftest.c  >&5
aarch64-poky-linux-gcc: fatal error: unknown value 'cortex-a32+crc' for '-mcpu'
-- snip --

- Replacing TUNE_FEATURES from aarch64 to armv8a will solve the above
build issue.
- Changed BASE_LIB to 'lib', as cortex-a32 is a 32bit ARMv8a architecture.

The sample machine config file (qemuarma32.conf) used to reproduce
the error looks like:

-- snip --

require conf/machine/include/tune-cortexa32.inc
require conf/machine/include/qemu.inc

KERNEL_IMAGETYPE = "Image"

SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"

KMACHINE_qemuarma32 = "qemuarm64"
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 meta/conf/machine/include/tune-cortexa32.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index 9c948f1766..3ab1addd91 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -10,9 +10,9 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH_tune-cortexa32             = "cortexa32"
 ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "aarch64 cortexa32 crc"
-TUNE_FEATURES_tune-cortexa32-crypto   = "aarch64 cortexa32 crc crypto"
+TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
+TUNE_FEATURES_tune-cortexa32-crypto   = "armv8a cortexa32 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
-BASE_LIB_tune-cortexa32               = "lib64"
-BASE_LIB_tune-cortexa32-crypto        = "lib64"
+BASE_LIB_tune-cortexa32               = "lib"
+BASE_LIB_tune-cortexa32-crypto        = "lib"
-- 
2.17.1


