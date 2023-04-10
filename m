Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B98C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 11:29:29 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.41568.1681126161353298030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 04:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GKhhqW0G;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id h12so1063996lfj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681126159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HN1Q3vq1QraH2ZqbqqlDDrwiD80EB8ekCeZLACnbye0=;
        b=GKhhqW0GTFf2RlWgp6e0zUj+Rl6EOQzftzrLTHaBY5HIlE+8Z8hxRlaJmWIE7qV2Qz
         3rVmTZny/KLfRnwZmBm9eYL4JFt5MkrEaXsCxyWRdIhydvy/pa2n5Tlu0GHnW4muVv6r
         6CABMr7GhEmqur6Wo1cJvzSE4wJ6uqFBdLW5U2K1TJj8/wBy0i6dvttXF7p3olXEY3z8
         T6kNXpWm8VaoYYbreDFtJpaV26O4X8LsknO+BE6JN8hddwPkbVPgW4UdK0/wixMxgD3P
         6/r2B01G6GsIygS5SkKiePc3IgCuJv5EmDVMKOXmGY2fi0tMvE7ctvd1cSwtN83XWX0c
         WyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681126159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN1Q3vq1QraH2ZqbqqlDDrwiD80EB8ekCeZLACnbye0=;
        b=mw13/8O153ka2qwZMgp+VE/WzIV0QWKtYCR9Q/ErouzOSpGieFh0EkuHsYaR7M3NAC
         V6EOT0FJmPvqqS25xjGKMMfbrtAylApJ8MunWpJtFdBjmgoBqjauJlHqQLc9Gpiq+p0V
         pRdWerN+L8x1D6TF+hPdNvnKnNI+kjsBOTG/zjd2CTZTpdpEWtLYC3of9NIaJ0ylwmwf
         vnHpGBWr0zbMS+/17CJ8tCGhRYGcuzsPnLOSLsW4o18CgVN5td+EZzmVd9zXrjacpBAe
         rNTlvOt1wMuusKPrOkWIGtdKmtaGKEJUZHRfAZraTnsLFKAgyQXQIOzowh8F2PUxI+f6
         kGtA==
X-Gm-Message-State: AAQBX9c4g/SbLjFU4iqia1ipAMTNbWC1DalIRYuONEMQanWpTZDBj9DE
	Tbl7TFTSk6bihJD6UAsMkp1Pw62IcqkM+JBIV58=
X-Google-Smtp-Source: AKy350bAkt7oekLeTDsBiYwudbMd+8P768R+l94Ab9nhjLlmKTJsc20GUkRuCGfDYrC2NHxJmN+anQ==
X-Received: by 2002:a19:ad08:0:b0:4dd:b479:1c9b with SMTP id t8-20020a19ad08000000b004ddb4791c9bmr1498545lfc.26.1681126158924;
        Mon, 10 Apr 2023 04:29:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f6-20020ac25326000000b004b40c1f1c70sm2069065lfh.212.2023.04.10.04.29.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 04:29:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: upgrade 20230210 -> 20230404
Date: Mon, 10 Apr 2023 14:29:14 +0300
Message-Id: <20230410112914.3201608-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 11:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179886

The LICENCE.qat_firmware license file was updated to reflect Intel
licensing (it removed a term regarding patent licenses).

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...inux-firmware_20230210.bb => linux-firmware_20230404.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230210.bb => linux-firmware_20230404.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
index bf5d4f54e64e..7412c022ba97 100644
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
2.30.2


