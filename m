Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 090D578CC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 17:19:24 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id v26-v6so13698650iog.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hI+LfOvKfGBkXjuUYPKM9OaXBRage2qL2bH+fWD3nZ4=;
	b=eJbjbDyZXgxrel6Olfuax0RLQWZmD4Igh+4pf9DLWD14hFapJ7zoHFND+KnkJ1dH7+
	GoPBrulB+GgMETPitUAN0M4wFww2CcftUmeMcR4gE6ivJJHC6q4a9mWBrHRmaEu3Sqdr
	JPz4dcCYMV1t7Dz99HHCxfyzCplHDdPfsXtBtr9JxGVAPE3pOwBiENDyR2LHlfwuvmnl
	f8ehkzHyJWUSSyeIOYZ/Jo6X8nmvRsipvoz9DGsIWtyrfXmlNN7yJGGkLIfozDlaArQ6
	j0/DWlhfR9xvGsbCYmvbEN7qry4i0n5qlCnisroRfBmXDiq3SDhkfgt3Rn2zlY++5sGw
	t2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hI+LfOvKfGBkXjuUYPKM9OaXBRage2qL2bH+fWD3nZ4=;
	b=OI2HTzL05yFJIU9jczkTALx7bngUAQkbzmz0HiYCoVnkCawqDL5TXmwUgG9vM2JE2r
	oPXGSloL8zdBeJr/pe5amMW9NCpahS6NYAvJutL+8Rs5WfW0hocoxRXc2PT+KCe9V5Wv
	ISpx3/3pp5C14WpioDd5WFZeTP5QeaCG97xtJzyAtOAcBXOgwegShWMb1Ae7g8OTfNr1
	94jjCvyXB8QLnvgaS6QkO5hWknbTY1plMTHFr1JnjvvBG/NbqMBHBtebMajHwK3IkmPk
	evFdKP1AvCHJ/+YiguDNY5zi3MrdLTqiU0r7UwKs/tUuVvPDQrvVY/LfdqFIC2cVdGDC
	qbJw==
X-Gm-Message-State: AOUpUlG426EWEC+rhFdksQfM+XEmWNHJj3hZe89z0eWZxskrnIQ0X/4S
	ggCPrHCCUCOlkqADXIM7Vp65vU7J
X-Google-Smtp-Source: AAOMgpdMjejoO8KCSsNqH4uuBWUQmGxCctQTwTyQokzn87gWKW1Y+yiHjFf15b/xWxKA86qEx4na2g==
X-Received: by 2002:a6b:de05:: with SMTP id v5-v6mr542805iog.121.1533057565903;
	Tue, 31 Jul 2018 10:19:25 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	p70-v6sm1913705itb.3.2018.07.31.10.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 31 Jul 2018 10:19:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2018 12:19:13 -0500
Message-Id: <20180731171913.5202-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180719163102.15234-1-JPEWhacker@gmail.com>
References: <20180719163102.15234-1-JPEWhacker@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] u-boot: Fix pylibfdt generation
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
X-List-Received-Date: Tue, 31 Jul 2018 17:19:25 -0000

u-boot attempts to build a Python library called pylibfdt. By default,
u-boot would attempt to use the build host's Python interpreter, which
causes numerous problems, not least of which is that it fails if the
host doesn't have the Python development package installed (complaining
about not being able to find Python.h)

Rectify this situation by including the proper build time dependencies
for pylibfdt and passing the proper arguments to make.

[YOCTO #12867]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c2bcf998402..95c2f4db14d 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -7,8 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit uboot-config uboot-extlinux-config uboot-sign deploy
 
+DEPENDS += "swig-native python-native"
+
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+EXTRA_OEMAKE += 'PYTHON=nativepython STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
 
 PACKAGECONFIG ??= "openssl"
 # u-boot will compile its own tools during the build, with specific
-- 
2.17.1


