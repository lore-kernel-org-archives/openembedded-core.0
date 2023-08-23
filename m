Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64997EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.13061.1692801396020738932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=H7CEPde6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bda9207132so45360585ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801395; x=1693406195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq3WBsMJG8Vc+G/Xd6rulbFdBFM8N2w4jmXb9X9Iolw=;
        b=H7CEPde6C7VHjktg/T7AfUs8pgKahtW9yOKaX1YUw+6pO3OpsYpiEGKShJ8Ic89phC
         4Lx1hZDx1z50doUUw0xNdKj8GZdNeSWmLCzpPdAcJEa+TUmhZ+GHzfjtVhbMJgiHdUHr
         daiCgxpThs6Pe+Lp4Xj8mpsirNcAmTXwmnjCCkaI5gIypRa1ysfuBav5ckrbqFDbbUYV
         ahdKhQUicDPii3xDsmZ8S99CgvGiEtjf9uz27TToLhYwMiZWVsUDjo901OVSE85ep1T3
         BoSTu2iFMhm+1rbiHP0HHloXqaNRf11zGeP17NlrYVnbaErV0qSHCb33NmP0vy3rM4JK
         TT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801395; x=1693406195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zq3WBsMJG8Vc+G/Xd6rulbFdBFM8N2w4jmXb9X9Iolw=;
        b=cuJjhOvGGuk9ZxBhAWCsuo+J7MbX7AUNBPNSbM+luPyO+yzOlVDBe3bilVyWCFIhBs
         YyScCXEwkEGT1bWKzXhKfFGtP1kQKNbeE88TfjVcwScFz6VAeuwWeW3AypFefNQ39XSV
         isa9Np82Ri+sSzf7k3KUdfHY1uZR9GXupYbBl+QGTMqhG1UV9tDbKwn7BjS3r+JQ0y7U
         uxXK6NOE3TaiWMWi5+r1ODCFz4JmQPx8AXGmLimj1PVQRswRjq2In/JsdmdGAvAw1zOp
         AZEQIbfQKOeoPpHoYNVNGdwwEd0iy/p5lGBeiGa1zDIohKSnkKTU1BizK6828jPl0xvO
         bTrw==
X-Gm-Message-State: AOJu0YzjdZz1rgLIM93hLxZvuWB9P1SAgXAM0ud+MA6hJ4TaIiJZeKZp
	KhVMAf1wXEqR/EL8+p3vHl1I2TS+E21PZLk1ZXU=
X-Google-Smtp-Source: AGHT+IGnvBCHI/rjsHxrsBjLogUtAUJvrNwxQo6ByLEv2zSvzUQASIl91zA8+zg0NZKvcNY03lDNXg==
X-Received: by 2002:a17:902:7588:b0:1a9:b8c3:c2c2 with SMTP id j8-20020a170902758800b001a9b8c3c2c2mr10860362pll.37.1692801395067;
        Wed, 23 Aug 2023 07:36:35 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/36] linux-firmware: upgrade 20230515 -> 20230625
Date: Wed, 23 Aug 2023 04:35:38 -1000
Message-Id: <dee368268941015384f206656e180de4791a4f10.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186589

From: Trevor Gamblin <tgamblin@baylibre.com>

WHENCE checksum changed because of updated version lists and removal of
information for the RTL8188EU driver.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 986f8ca9d4c2c22d368f69e65b2ab76d661edca0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230515.bb => linux-firmware_20230625.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index d304b75c5f..9e3196d5bd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
+WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
+SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
 
 inherit allarch
 
-- 
2.34.1


