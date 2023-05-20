Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A02C7EE2A
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.13617.1684598725657960300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vBsId9oS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64d3bc502ddso1800862b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598725; x=1687190725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMI+8xApQ/erQjMlY7+TX7pb7/HLZYq9lvk8mn5jk9Q=;
        b=vBsId9oSd8UMl6LmeO4qEvLmi5wO8axBxy3BMCnvvXaB8iF2da1GtfzUMHK0kYLhiJ
         bHharlwP8U1Jbk5ou8bO9VaPlRTDejwOt/vOA0J5FNCOJdHG8gnem+GlEWXlYaiLd8lb
         Yjj++UzOYeG/z/SJqsGXMmcYL8BQlrcZaYpb6auTTbx/GuPWsUFRagve2uv39sd0mS6k
         7wsXp1hRPUag0LCRwILdnGP1STm3hj6A9AkvwAZJd3SBUbubrkxIaPE8iSL8VaP2Zdf+
         R8lo4nUzoOf6OkA1RsnkTygJob/VXLuMvJ8sbyUjrUzEburd/hqexi7G6Wc277AJejgU
         NnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598725; x=1687190725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMI+8xApQ/erQjMlY7+TX7pb7/HLZYq9lvk8mn5jk9Q=;
        b=LikDG3B6A8+F2DwIhzF4kZHj/kIPQk3lqJ2z+s2Ek5tSvTuwj6WntA7fFPsYX1Fefm
         1hqU+fI7uSgjlILJIrOc9UF8mH+GiBosQPmlWceyhTUwFmrPWRblG28ERWenwwMazFhx
         eUWYWwOvyIqu1OGye93KKlbpzA5A3NcI/Y1KuqemuFLteMdfQ9qX5JmabV9tueg+2nnC
         CiBTnIhZx/BP2mtr7ZZccSA3sv9JT1HXPKB+L2MsJrIifeFRDNEJuzNMLNpnwolxKDgD
         aSqEsBkYztL/FXySrUTFjVHFjVZV0ZBCC2rrkJeFj6JRC5HvdeE8vNuzYoaUVqm7wp0F
         a5EQ==
X-Gm-Message-State: AC+VfDybtoniOOJNVkIYEkrIyiSlj5j0QuzAtWw6LroeA2o80sicYQY5
	j14lwJOHaroDmaN+ohFzXA5wR3H+oxlfzAPshgc=
X-Google-Smtp-Source: ACHHUZ7pelvGT5NZhKB3bZfBIq5l8+LzelIH5T27K3t2s8jJlVL9IQxtXSJ+uA8SapRAEOKrXOcNCQ==
X-Received: by 2002:a05:6a00:190f:b0:64d:4a94:1a60 with SMTP id y15-20020a056a00190f00b0064d4a941a60mr2437693pfi.18.1684598724778;
        Sat, 20 May 2023 09:05:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] linux-firmware: upgrade 20230210 -> 20230404
Date: Sat, 20 May 2023 06:05:01 -1000
Message-Id: <0a6a31e24414e156e005ef1d6a72ff668d83796a.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181568

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

The LICENCE.qat_firmware license file was updated to reflect Intel
licensing (it removed a term regarding patent licenses).

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit fd43b59ab32e2115fcda7ad63d3a5ccc2683c7d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20230210.bb => linux-firmware_20230404.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230210.bb => linux-firmware_20230404.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
index fb1ea61906..9ac70b2a3a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
@@ -108,7 +108,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
                     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
                     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
-                    file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+                    file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4 \
                     file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
                     file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
                     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "aadb3cccbde1e53fc244a409e9bd5a22"
+WHENCE_CHKSUM  = "0782deea054d4b1b7f10c92c3a245da4"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "6e3d9e8d52cffc4ec0dbe8533a8445328e0524a20f159a5b61c2706f983ce38a"
+SRC_URI[sha256sum] = "c3f9ad2bb5311cce2490f37a8052f836703d6936aabd840246b6576f1f71f607"
 
 inherit allarch
 
-- 
2.34.1


