Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC3B178A6F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:59:15 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id z20-v6so7670945iol.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MEVZbCFN2XAOjEZjKg783QQPyOOu8lfKyhnxzcY1dKg=;
	b=SE6/A4sN46bxCMCj7/Ry3bBC5tgLvQmbOn2YwIgX2ZWJ/mwxC3Wk+rg7X0po5iK7p9
	U+dIpPWbHEMe/S973ia8RQFrUTJHZFqc5y/mE2dX1BOg0TaAdXq5Ai+uAEwADXLmhStJ
	uI+hqMxQekOwFUIVKHCVQS0YQQQIpOjWA9qaB2gZDJ3KJHE2HWarOF7201+WyjAMCMjS
	NXZw2+qsPa4uv+8twKXeE9TfVX1bx6L5oOl4f6WDA4kgmeIFTv4ewrd7NhnpNR4/9oC9
	TEWTWBS4CEShWkGJnN9Sqz4dkFqgtjiRD2S51lQRXaxkVkvOF4u959RkrD3RMc0lCHoM
	fGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MEVZbCFN2XAOjEZjKg783QQPyOOu8lfKyhnxzcY1dKg=;
	b=ORCVd5fLXa7y4ukT8WPHbJyPBkdnCCjL5eeWonHb+JxDNSUGeVaqfiFiVFshESNKNL
	F0ftdalQMUq+UR1XBTVg0Ro6coNkL8Jhux5bWexdwxwgGMJ9Wl+Hw96TDuwvRZSKQ8A9
	i1n5J54v2F4y36U8SnIVFDwG1DHnTvAPd63YFOqI2bLPs6R+/a/Y7GQzt61IYGUbbJW7
	tbrKiniJiLkc715JbizSyxp54cK8t+hueNPm6FkJY0sqldtvPTA+4utaGxK60FsLQfqt
	qqYXP9KFe7IIVrpHFjtWa+s3UxbG9eytZ8Mpiy4RSK2ci+nm5h2wi7j+dNvhEx4Jt2oa
	ETYg==
X-Gm-Message-State: AOUpUlEcMTZFL4Tnt2LHOBh+eWnk7CGvxEqI1lMDr9rcSNpNUwDQzmet
	3ZWEgBDwW2W2cvAnlH+TN1Pw1gGr
X-Google-Smtp-Source: AAOMgpc0G8rjfUTq5nmrOSjlCdYHP69LvmC7Ae69atv6jL+kax6hzSB8yKJWDWECzp8nYEwKUCsWDg==
X-Received: by 2002:a6b:be83:: with SMTP id
	o125-v6mr9130074iof.173.1532019556426; 
	Thu, 19 Jul 2018 09:59:16 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	o143-v6sm3204891itb.42.2018.07.19.09.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jul 2018 09:59:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2018 11:31:02 -0500
Message-Id: <20180719163102.15234-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Fix pylibfdt generation
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
X-List-Received-Date: Thu, 19 Jul 2018 16:59:15 -0000

u-boot attempts to build a Python library called pylibfdt. By default,
u-boot would attempt to use the build host's Python interpreter, which
causes numerous problems, not least of which is that it fails if the
host doesn't have the Python development package installed (complaining
about not being able to find Python.h)

Rectify this situation by including the proper build time dependencies
for pylibfdt and passing the proper arguments to make.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc        | 1 +
 meta/recipes-bsp/u-boot/u-boot_2018.07.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c2bcf998402..6b8604ddbec 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,6 +9,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+EXTRA_OEMAKE += 'PYTHON=nativepython STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
 
 PACKAGECONFIG ??= "openssl"
 # u-boot will compile its own tools during the build, with specific
diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot_2018.07.bb
index 37c21dcaa38..11588a75ed5 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2018.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2018.07.bb
@@ -1,4 +1,4 @@
 require u-boot-common_${PV}.inc
 require u-boot.inc
 
-DEPENDS += "bc-native dtc-native"
+DEPENDS += "bc-native dtc-native swig-native python-native"
-- 
2.17.1


