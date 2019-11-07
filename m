Return-Path: <workjagadeesh@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id A32AE60720
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:04:50 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j12so1137286plt.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=svz/fBqMsI5nvq5V8XVMCJQUOuiS9tr+m+2IJyIfdWI=;
	b=Do2DfMFVZNGHuu8BbAeaKV9e+qkf3DR9VczWXkpsQSLWyn5+m07ZVVZFotSZu13ej3
	CQTnTNbsRM4Epq7feCoUGsQd/2UaVgGb623vPXKsSYc0+LNuhAbQitwL/EgNDGcwnYT0
	Z4bj37irqT9wxCg94OVE9nWLRBgcUaAGJWaVSBKkZp4E/K5o46leUqFX/W/saF6JoEDK
	W/C/n6RdZAbDVZgzcLz+3Ge6xUXsV4IfMgYk4ysyLegudRKiA1ovEyjRPwP97UC5ciKC
	JCDXOvSBamJOw69paJRsEK6h4DvrJh9AhFpZT03ROuXUKGtoizGvVjm+xb5sUrLfk7zK
	pIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=svz/fBqMsI5nvq5V8XVMCJQUOuiS9tr+m+2IJyIfdWI=;
	b=ksQFJlb/4QVY9tzi2mnQnzvzW/1AbGdCH2gjH1JAikIJnSBzUAZUMQPVZgpTXdWIf8
	b2/NfAng42HkN8syGEyPyu5i9p5+feSIsW/jngc66Kz+3wTIVWgYmpPdePGYjYbejJzj
	lmLbh13OuRNZm/YxXrVWLX5WqNspoQQtpz+9MxuEco49VelqXRQ1uANxj3FvtQZON+EB
	+1xSE+7uYj87zyInQn7T2Wd8A+pOH2bdl9gDZ2g6mHWP9X0B4cTzphdUe0/JwgUiDHER
	0c2v46Sf4FmPLYNXYTgEHZPOByNwtJWKIIAwSXicAJ7AE0g5SDPeTZq/QxEtvbxIjNd4
	EgCw==
X-Gm-Message-State: APjAAAVR7c6QqZwyvNAKQSfBWm1dImG/uxucNR7nHVMnjHUmH2e8oScr
	8lHjSpVwm3Vt2qCrbjhkC+I6R3dP
X-Google-Smtp-Source: APXvYqwxJPpAfBEnh5NeGLgDaWcywiUxUEa41HwOv4TGnjmtnmah6lpeTU3qA9eFuXTCU8GUl2laqA==
X-Received: by 2002:a17:902:5acd:: with SMTP id
	g13mr3130434plm.242.1573124691419; 
	Thu, 07 Nov 2019 03:04:51 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.42])
	by smtp.gmail.com with ESMTPSA id z5sm2052300pgi.19.2019.11.07.03.04.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:04:50 -0800 (PST)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 16:33:12 +0530
Message-Id: <20191107110312.5346-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.18.1
Subject: [PATCH] Fix libgcc-initial build issue for cortex-a32
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
X-List-Received-Date: Thu, 07 Nov 2019 11:04:50 -0000

When we try to build images for machine which is tuned for
cortex-a32, then libgcc-initial recipe fails to build with
below error message.

-- snip --
configure:3529: aarch64-poky-linux-gcc  -mcpu=cortex-a32+crc -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0/recipe-sysroot -o conftest  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0=/usr/src/debug/libgcc-initial/9.2.0-r0 -fdebug-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0=/usr/src/debug/libgcc-initial/9.2.0-r0 -fdebug-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0/recipe-sysroot= -fdebug-prefix-map=.../tmp/work/aarch64-poky-linux/libgcc-initial/9.2.0-r0/recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now conftest.c  >&5
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
2.23.0


