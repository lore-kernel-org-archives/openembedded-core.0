Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA13A6BA9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:14:46 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so25509396edr.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ByKoJZ5JTOLWMBv1ktHtJ8gROvwM5DD6ApbL4rhyaqo=;
	b=iBF57ChZc+KodiTLJ1hWd3VQBD0PuK0HBZPogkFsc0/Wr3wEUxIZ0nZ0cyXJy5CCh/
	JAWa4m8mhjC0UyjUYLx/aeXCKZvMx/g63snFV/Ol2C0gXd4RZRTIC2HChOxHSO4dhtye
	PPAkKGglbczDj7uS7M9LrmyG5qDE+bmHxCbIl6Xiz0DU7UdQfnn5Vq5LXNTg5XEmHk7z
	JmeKjH5+HWXpXFkWjBmjqZ3uqJ4SBBXMGoKFdxr2mCohlmYCNzJaTix0slxt8M9cY3Hb
	11xCmzG26ZHlu0NR1KxHRHZLqgMu+/ucMrmAboxKKyIeiNT6Zk9aTNRhwNNxD/BJeoVr
	FUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ByKoJZ5JTOLWMBv1ktHtJ8gROvwM5DD6ApbL4rhyaqo=;
	b=FYsN1qDq9YIB7Ias5jyiQmvsR4b8JfxuKC0/hJQ02/N3OZmnev+uI7CP2EvWiNjSeO
	e6nY6iFyIVID5L6Lut6vNTZ+llsuh4TPzmB4xnNnVY+8A2oxdfFbm9uKE5wjUGRGE+ty
	RM6c8Ie+uYhvsp0XeWzUH7qbOfcH1526weWq7Bere25aaIcVpPq/9LGwUm43DUq46ig4
	oTv0lPWIxmy2R8i2EHuf+YBgTntDC9o1MCTrbtuJwZtgaaT207WQts7u30OYC1aHATCO
	HAvp2l3bdHqMI6yEIe/5oaoGUK0bOAn1WizuDz0j1WLzamvhguhVeAyIxYtqSorUQlN8
	EpEA==
X-Gm-Message-State: APjAAAWMJXbinWvYA9l+T8BxSUI+Rvyv2qSOyLrhOcowYIjswfKLHlGv
	BA9smghdg45wrbkFfENTfmSLR6Xrw60=
X-Google-Smtp-Source: APXvYqy28752ZWxoZg6M4HCnyKnwjUSXFvzPzmXWjuaABB6uo9kX8paSOgylV4NUFJWg4Ulhs9l2xA==
X-Received: by 2002:a50:ad01:: with SMTP id y1mr145560406edc.180.1561446887226;
	Tue, 25 Jun 2019 00:14:47 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4283838edw.94.2019.06.25.00.14.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:14:46 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:14:42 +0200
Message-Id: <20190625071442.5228-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] systemd-bootconf: Make is machine specific
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
X-List-Received-Date: Tue, 25 Jun 2019 07:14:47 -0000
Content-Transfer-Encoding: 8bit

APPEND is usually attached to a machine. This patch avoids multiconfig
errors such as:

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


