Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FC4C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:53 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.49409.1710951045091354002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VAYV9dhW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1def59b537cso36887015ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951044; x=1711555844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+61++8/DbpA29NeIN/CHD8dNg2X0pdyC6t+QXhi1ih4=;
        b=VAYV9dhWlzb7dRM3G9cnG/t5fLYCX/j5bQfndJLtbOt6swUkBEVsg1A/plosjnN7rE
         4/Om8dhS30b8ORrmigzyaZThsuWeU9mwasEg+bEwvwIerLBMguE69c+oge/ZnrZEjCIu
         sF5KJ+oVTqzZUPwHJR9ijBAE9Fy6jMDoloj6E+dkYCchSX8hea2/oiMgE8xW24odAkOa
         VvDbtqNo5/eKDFYHYXLKPT8ttxX+Vc8udeNtCvdR1OsSyIPJgrHinymOagdgd+lG9T0D
         adpxD1f1rwcdx44ADWsFDeKyuo4pGJrK0gHxbLo+VZwbu8Ad3yMgZdAbXIvrGOEd5dQi
         1p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951044; x=1711555844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+61++8/DbpA29NeIN/CHD8dNg2X0pdyC6t+QXhi1ih4=;
        b=qwBzKCZ6e4x0fJ46Oo/my58Ii2LvBKeJrICxvEMxB4JKoZl8JebbMAtJBjFIfnE5wD
         76EMZpglIXHq41tBooLXp2mgehG5x+oR/KHYc5cbbO+fMLlMyPORvvhxjw+66qiRidce
         OcrTgdzrZ65llVmb59V1ckn4AZ2ACvu5oMmqZpqcIAOXjORPAtuHtZzLGq/PNpuRvYX6
         T8a1pTtho9NM3KOzdW1f9//tborXACH8/ElVdpW4Ca2OMDWClqw/zY9+TThTv5QpwxVp
         P3PHry99afpsRKUDatAOrqMqpo5fOVnihQwr+YCS7hTfFSE0O2Nct7iLCL5c+zB/66S1
         E52A==
X-Gm-Message-State: AOJu0YzqRa06h6cltvniOHbvI9wdoYmwK7MquuzmjvSLKSQ55lvVD/aG
	0zu/gbQxvb2GidPwvZq6jDlHMMDrjHsLH6FJ/Wl+2kBmkCu7QJULXqJR65dYChOozCNI04Uunmz
	g8J4=
X-Google-Smtp-Source: AGHT+IGkpnESVuxY9+dwDaC0pS2VBKaChQ6QameqstZB0/YHdqUC9/d6NiLdTqVwr5dwzEIc3Rl3FA==
X-Received: by 2002:a17:902:e802:b0:1dd:9984:29d3 with SMTP id u2-20020a170902e80200b001dd998429d3mr21472199plg.32.1710951044156;
        Wed, 20 Mar 2024 09:10:44 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] linux-firmware: upgrade 20231211 -> 20240220
Date: Wed, 20 Mar 2024 06:09:50 -1000
Message-Id: <e5956d94ba9fa5b5b2f6bfda8e533bc8c6d4c59f.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197383

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit add81ef0299ea5260f9bdc59ffc8f5cc0e74276f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20231211.bb => linux-firmware_20240220.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb => linux-firmware_20240220.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
index 48e83cb34b..425b351dc1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
@@ -89,7 +89,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
-                    file://LICENSE.cirrus;md5=bb18d943382abf8e8232a9407bfdafe0 \
+                    file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
                     file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
@@ -147,7 +147,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
+WHENCE_CHKSUM  = "a344e6c28970fc7daafa81c10247aeb6"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -231,7 +231,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
+SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
 
 inherit allarch
 
-- 
2.34.1


