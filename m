Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED34D3748F
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:32:15 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.48947.1729171929650495910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G6mtgZX4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cdb889222so9928555ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729171929; x=1729776729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ib0aAHZXUa1vN+shC3DJ6hXoWZZQaO9WqAYrrtyXnjA=;
        b=G6mtgZX4bHejTkiU4KQSVsdjaglIhiqm/aU1koWypfUn+xr63NrGYlpJDxpwydIB4K
         xY4GkIxHd/PLOkojGFiFl0ClKqMd8MmQwsX/87nzjjGjpKmCh98hZ9N3SsGj/y+oJO+/
         IBl2ZhtiT78DKGBgbCogklx4p1JgnZeOTU2LkchNK6IGOJNs1X7pW9ODZ404IYW6N9B8
         1zAgzugdkjDRGzyCdOm2sVdYiow/XsfhqQzqJ5GDeZ9OIj779ecwx8oMh5utsTuTzEor
         p28nX2jpyjSmjEYFfk9jzIAccJYQmWvksAUXLGDgMNdW8cHBd/VGPh2zFoc4ELzLZoiG
         n2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171929; x=1729776729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib0aAHZXUa1vN+shC3DJ6hXoWZZQaO9WqAYrrtyXnjA=;
        b=frg+Tb0yViNQYpqj+E+QxFDHDM+eT294IyPdUwYpBvniHxVeplqMOJlyOMrFTlQnpo
         vcXx639Vb1Eok2HrbOFGKbYoIJQumiWXu25Zts+X4Z8mcc8bcWZbHdbEa88yETLSXPMO
         jJbb5fX8Sz+G/ZKOLnzDi6IFF/BRmfVZq9LlzvIyUMXrwBR3LD2khJjaQK9ESErY8+BZ
         cgI5A6SAgGquivsHVqmpkpbaLcpQWp3pzBR+jKdD+Cd3afMS4cL7wbBcaE501WfwdrOb
         894VliUSYOI6pklx/RtZMO/nn5tB5Y4G0nFAnVJJWURCzfAjtdefya8iXR+cSJirZlZp
         n+cw==
X-Gm-Message-State: AOJu0YwwBz17BkBcJyNDwIRwfoZjMrQiWWC0M0hFlgo6FiPFWiQ58hXQ
	RvY3QprCR+U0ET2icFGeL/LT4HilVYcpltjFM3iuPFYe7JwsdpZI517Uk3JWqpChRSq8SZTKS1G
	y
X-Google-Smtp-Source: AGHT+IEEKCT4E5M7LR6P7HOp+NpiUFniTyJvFbK2DRX7TY3bjPlnDxkAS+NKYhqnpfk18Umgfoc/EQ==
X-Received: by 2002:a17:902:744b:b0:20b:9998:e2f4 with SMTP id d9443c01a7336-20ca16d2dbfmr198742335ad.61.1729171928926;
        Thu, 17 Oct 2024 06:32:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b093sm44161595ad.254.2024.10.17.06.32.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 06:32:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] linux-firmware: upgrade 20240220 -> 20240909
Date: Thu, 17 Oct 2024 06:31:55 -0700
Message-Id: <2f82404cde671d2898d82483cc1fff693d7720e3.1729170868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729170868.git.steve@sakoman.com>
References: <cover.1729170868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206023

From: Macpaul Lin <macpaul.lin@mediatek.com>

License-Update: additional files

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ux-firmware_20240220.bb => linux-firmware_20240909.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240220.bb => linux-firmware_20240909.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
index 425b351dc1..4790434ed9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
@@ -78,7 +78,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
+                    file://LICENSE.amdgpu;md5=1433dfea38c97a2e563a248a863dcb94 \
                     file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
@@ -135,7 +135,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
-                    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
+                    file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
@@ -147,7 +147,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "a344e6c28970fc7daafa81c10247aeb6"
+WHENCE_CHKSUM  = "6ae5ffd807c84809977286ad0b37acdb"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -231,7 +231,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
+SRC_URI[sha256sum] = "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671"
 
 inherit allarch
 
-- 
2.34.1


