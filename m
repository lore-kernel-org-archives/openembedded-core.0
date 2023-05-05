Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63E0C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:54 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.30243.1683300038409530588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0QcJI9Ba;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6439b410679so923132b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300053; x=1685892053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgcht4CpFvfu7FODQrU1jrTVV4C7ulIuQRYW+bPRAZE=;
        b=0QcJI9BaP6e4BTBxZIKZohRy7LqE5CsnqhoxHT4deVO14wpv5+XFoCz0BuRj5P0uqk
         t7sEVF8iTN0gHWxZTfhMuA/WcfGnryyUn7lp9BgWt1ZqD468zjooVw+jT55MBpXbOjYW
         nksfZuzXbUzd3A5a4wBqRmo7zi+pAJQ/clEC62xWMM5Z9/Pjc+lDdW2NKXbl/mTzDR5K
         tyvfFT37l6JYDIte9F9SA+gBEe4gFhtHpK9qFyyoBqKQpUOqKtxAJDbg2ubhsDoFwgzO
         7rItP/6V1CJ9PP3y8f4ixivq88UGVkKflWfgi0VW87jc5iog4OQOA9BJ2Gm1X8vEKezn
         gnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300053; x=1685892053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgcht4CpFvfu7FODQrU1jrTVV4C7ulIuQRYW+bPRAZE=;
        b=UY/6LATVfBz890yWdu3OlyyWXi4QPJgM4o1lX9NooSghbsUCfXzAWQkiKm1Prrvmab
         rl/wcNKg5n+Qn1H5/mqmiea4xhBkAtTdB87bbjCXcddP1FK4GZbQbmnAla71OtR7RBrF
         kpdmheY5M5I2BtUExaHUVXKhVeven+zGystI+AeI71doESu6pjjUlgvVVIU6jjXOndk9
         jPElMOUklMabh1okLy1of0BRAyWKA2K7dIq1rco1UT0wGUdiT+1wU/kdUXwx0BcXtIFO
         Jjgb31iXabS/PwC2DLL4nCt3b0JmNkoV5mAyHlmPLrJBFffl96AEPba2QxvZapdOeK1z
         M7Sg==
X-Gm-Message-State: AC+VfDyGpY2kLKW9ImMWEDROKkPhqL3SYoEUIoyOUnKSrTfxEnFT87QB
	k1m8gplCjzhUW2WdohIRmEPU1Ys+rUol0hA5SNs=
X-Google-Smtp-Source: ACHHUZ6jf90FVvLABnjZPy+kmeTDuGExdqK921g4T69ygwFjSDKyVYXFJQ8URwYOLwMVKUIC4HONlg==
X-Received: by 2002:a05:6a00:1415:b0:641:558:8e2e with SMTP id l21-20020a056a00141500b0064105588e2emr2461604pfu.15.1683300052831;
        Fri, 05 May 2023 08:20:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/35] linux-firmware: upgrade 20230210 -> 20230404
Date: Fri,  5 May 2023 05:19:35 -1000
Message-Id: <cd8f678044793c853d6b91c09f542e9a97e170b9.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180944

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


