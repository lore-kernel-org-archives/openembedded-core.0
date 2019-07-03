Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 109A07E68A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 16:33:05 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id k8so2679704edr.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FuFN/RkBJkh9t0FlYrkZVxlnluf2AQajAjWdzZln8Yo=;
	b=MRoxg4MGkPkRToggkO/sXYpwCFhCPezvzi6leDKjgsJp0VtyFASJjsdVzQN5XXPB2I
	fGOqgYKTgCDTN4UwRhpvTmgIvHPb+yd1KcUjS1v7qA7iSW8KPngJKdJGJGp5ZbOwPH/c
	QNWUaPQKs7wNJITV8NSQCFlKfJaQvEpaMQumy5ESE9yHoe5rWJS9qpjO6fyb2l7rNExI
	JAoFz96GIMgFvXlDwXKOVG52rYs8/bu3QMFvwSa1KLq+XUnPXxAclmlys5lfS2KcHmX7
	2pVf48Hp3KkEIcFNhybC8LOM9s6Z3163BtcRNGK7KVk1CO7Dhs0ez8HveXAisMkPWWHZ
	O7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=FuFN/RkBJkh9t0FlYrkZVxlnluf2AQajAjWdzZln8Yo=;
	b=BQGJawgVE+CPwNuV+ct+CBo1L12iMeTO9Zxh7VmXIlxQThlYli5L1zX2Xb5Fg0SSBl
	YPKiky9hb11cJtndLl29CkvRYeIEs3TdxfZuot0WZU3E9rdi6anMIhgj9SwBiw/fcmWN
	9kK8A8wDH0vOZ7MtjrW5Z5i/icfMjSxy24M9px1jY1w06vT4tS2wmNKOBOfAGqAheq8f
	8fXndOa59cJsbStfkBXbFBS4vsY6X2gka+S3dMOy8EUdFDnpNfEMNmrAM2DGL5ty8S8i
	Vfpda/LXpQPTzbncdzlVwBLPEIhWrRCpmai3Fn4FW49OSV0tq7jyMe4Nx1r6tXk7iOeS
	IApQ==
X-Gm-Message-State: APjAAAXm1K09ImMEqMKtfQOLr2sgGimPD+XhX3Jj4+SCEKApyThaqf14
	8ZR44tNnouHfocyA2s/eK/BM7fu9MyY=
X-Google-Smtp-Source: APXvYqxt4oearknDoODyD9Xyh7tzv1rikmfONep/Uh0XhFvnBL0rE2fG0A5yPLdMx5X6Wm8h+XrqdA==
X-Received: by 2002:a50:a5ec:: with SMTP id b41mr42377994edc.52.1562171586414; 
	Wed, 03 Jul 2019 09:33:06 -0700 (PDT)
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
	by smtp.gmail.com with ESMTPSA id h10sm846014ede.93.2019.07.03.09.33.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 09:33:05 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed,  3 Jul 2019 18:33:03 +0200
Message-Id: <20190703163303.5397-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v2] systemd-bootconf: Make is machine specific
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
X-List-Received-Date: Wed, 03 Jul 2019 16:33:06 -0000
Content-Transfer-Encoding: 8bit

Recipe makes use of the variable APPEND:

do_configure[vardeps] += "APPEND"

APPEND is usually linked to a to a machine and not to a
cpu architecture, as it describe things like the location
of the main serial port or tty.

Therefore the recipe should be MACHINE_ARCH.

This patch avoids multiconfig errors such as:

| NOTE: Direct dependencies are ['multiconfig:qt5022:/workdir/repo/poky/meta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot', 'multiconfig:qt5022:virtual:native:/workdir/repo/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot', 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtools/gcc/gcc-cross_8.3.bb:do_populate_sysroot', 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'pseudo-native', 'quilt-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'linux-libc-headers', 'libtool-native', 'texinfo-dummy-native', 'libmpc-native', 'flex-native', 'automake-native', 'zlib-native', 'mpfr-native', 'gmp-native', 'binutils-cross-x86_64', 'xz-native', 'autoconf-native', 'gnu-config-native', 'gettext-minimal-native', 'm4-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| install: cannot stat 'loader.conf': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at /workdir/build/tmp/work/bobcat-poky-linux/systemd-bootconf/1.00-r0/temp/log.do_install.737)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Failed
ERROR: Task (multiconfig:qt5022:/workdir/repo/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
index e9c2466456..d13b8c518f 100644
--- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -3,6 +3,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 SUMMARY = "Basic systemd-boot configuration files"
 
 RPROVIDES_${PN} += "virtual/systemd-bootconf"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit systemd-boot-cfg
 
-- 
2.20.1


