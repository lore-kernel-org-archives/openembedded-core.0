Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790DDC7EE26
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.2953.1683671582331890821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=E08H9FM9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-643b7b8f8ceso2903979b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671581; x=1686263581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgcht4CpFvfu7FODQrU1jrTVV4C7ulIuQRYW+bPRAZE=;
        b=E08H9FM9jBL9mgcdMAMw7pGieUu582ue1wSY8N1VVhxlb5cXFEneb0KTZC5weHXYJH
         +haCc1bED7wlvxAwwPL/ln40F1wrWTq9oJc+Hy9ei/oRwGE8dhXcjcVxsSReHl5rrhlN
         j42Ev2CnE6rG01vucKNXnrSCT1vcjgBvOyZutTTGgRxA2YFPQeF5bwXxa27fhua4xwYc
         VyJf0gSo3iNZD6sRo4smwEO1V0ubR+9xkORKUk0Ba5W8E+0JPyrEcOoXUyCa3Zkew/Pf
         +m46mDMDftB5wJABELSzQu8FI6DTCZhE2aYfa3EpwldYml/fnk4l0K0EeWklX2xOf3rD
         lPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671581; x=1686263581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgcht4CpFvfu7FODQrU1jrTVV4C7ulIuQRYW+bPRAZE=;
        b=IS4QuO8jb7sHLuh2R9VnNDlxduAToO/pJm4YrQDUIk5mDpv2tMs2Ece2FfsdjmbcQF
         vgL6FdSKO0wNtBrjejaJOpchsT9r8QsDOdlkOU8nlIXV8E5rDnpmp7rHZVlEUnPjjn+Y
         up++RflIcOeP0OMv2u/KcwAdQ+YuikDHf45JjzILAt2X6a3N7R5uZN1VonZLICfLHXMG
         xlkQ+ri25RusSoPMS5XwPYTBPOFHc5ZpW2wyUJl5ObbEhRhkCS/J8ZFJMH0MPEpUEK8s
         Y4ncDXOiMqetA0sY6909o2xniYbbpDA6nDutqhD7XKM8KicufqnjgHkzpJ7JNwp68gvq
         3agA==
X-Gm-Message-State: AC+VfDwE1nDD6bJjQtOrh3c3SV/NIyJA4LpNN+QoN7d/nnll+JcL79T0
	/5TOlK/3xZxtpL5YOyjkx3udrcazg3uqB5GB+B4=
X-Google-Smtp-Source: ACHHUZ5G/EEmBrZpSARGGEyceGNRlXqIMGboyKAmsInZkgvGHhOTP24D3esrnBuIeTnE5O1RLVigEw==
X-Received: by 2002:a05:6a00:a19:b0:625:efa4:4c01 with SMTP id p25-20020a056a000a1900b00625efa44c01mr20098525pfh.3.1683671581403;
        Tue, 09 May 2023 15:33:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] linux-firmware: upgrade 20230210 -> 20230404
Date: Tue,  9 May 2023 12:32:34 -1000
Message-Id: <27b0b1c349467617285db3a09b77c03558e5adbb.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181093

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
index bf5d4f54e6..7412c022ba 100644
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


