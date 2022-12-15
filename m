Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D20C46467
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.143584.1671132101947158083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=huorPpT8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso132674pjh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLXxDYotwqHhu0FyTQ1vk9U9Zoo3Ydq+X625oUi7juY=;
        b=huorPpT8PaW5SOHo2YfUw60kPm7slqgG1dAglRvMyyIaqb+ujcgpjL8AtJgYgoZDiJ
         9ekaZozY5IkfgPCLz7+di+hb31YJqOgNI480Vn+6A81hb34npz2p5qFwAKFRY/U1cwe6
         WoECA8AKOGtlsKVCHVhVLyaH5NPnon5vbseFm9KlJbeaq9lrRNAHtBA736XBf7FfGUB1
         7NCMcpAmHlWE2BCjGijTKvyuLCV2y8tyVDXzzGphK7zbL3MnGBEFQOEIdSbQ/ayzQWjM
         HwY/zsG9D/y5d8DAx1K5hDYIxM1gJEvcQtGmAtLr0Uz2T+M7vGelbsPWKocLX5dxMmsQ
         mzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLXxDYotwqHhu0FyTQ1vk9U9Zoo3Ydq+X625oUi7juY=;
        b=eFozFllu+82AfJ65IeKKczpAi9pCd045qQ2Ome4a48cLBFIG8a747N7xJRyY5DuGjF
         01gzpEwSJ6c3O8B/byVSwFK30BPUp6+xCMK6RCsg3od3DHwIAmdRWs/TS6aSQodJfdbk
         M4PczztktRuOkq6X34qEyfULXymyyNHS9mwYa4dXV2+ABCiWdtNqQRh13w1RtbhPf3tb
         iyFwDDcC0kzbs6zMScqTSKJFX/PTlBKp+RYp0mjzbSPY+G/PMAOIMjIkZ12kYqpUkLpt
         ny0TqTyCOXBJUTa7EWcvaMWLmRh13HPZFrRZeGOVlhlnEL2U1dU0lVBv1KZE9PYrgg8z
         lGbQ==
X-Gm-Message-State: ANoB5pnRE+5ltavN1nXsE7WnrIPbKJNvG8E24uVK6PGMxKJ3Ck9KH+6B
	Mah9dNGrZvxtwivF19UbXKqfmMxDJhjlcftqUdI=
X-Google-Smtp-Source: AA0mqf7zFYS71cBuYK+bHFaGA9GUdgOXLnfPaXQ7aPX+VpVJEOnw+1AfZexltLU0P1v3j0M6vSKoug==
X-Received: by 2002:a17:903:31ce:b0:189:aa5c:7f7f with SMTP id v14-20020a17090331ce00b00189aa5c7f7fmr28949813ple.63.1671132100973;
        Thu, 15 Dec 2022 11:21:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/30] kernel.bbclass: remove empty module directories to prevent QA issues
Date: Thu, 15 Dec 2022 09:20:47 -1000
Message-Id: <f65e3db99b4f85eae73adb3a2699ecb29d06450f.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174615

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, allyesconfig test runs for x86_64 fail with:
ERROR: linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0 do_package:
QA Issue: linux-yocto: Files/directories were installed but not shipped in any
package:
  /lib/modules/5.19.17/kernel/drivers/nvdimm

With CONFIG_NVDIMM_TEST_BUILD=m, an empty nvdimm directory is created during
modules_install, which triggers the QA issue.

Extend kernel_do_install() to also remove inner empty directories that might
get created by modules_install.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7120b09a33af4c9a18063c0f2e51fb598697e39c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3f6b40907f..553e17bb4e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -450,8 +450,8 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
-		# If the kernel/ directory is empty remove it to prevent QA issues
-		rmdir --ignore-fail-on-non-empty "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
+		# Remove empty module directories to prevent QA issues
+		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
-- 
2.25.1


