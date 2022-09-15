Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076C6C6FA82
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 20:45:36 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.15426.1663274727505058996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D7GvRGZ6;
 spf=pass (domain: linaro.org, ip: 209.85.167.45,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id f9so31568255lfr.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=mmVANkbblZTO1ac1JV4er+9GGVFyHPpyyCX+CTB4sOI=;
        b=D7GvRGZ6A+/0FNpNdRxXn+SMTQQqbD65DQdebVZZR+5Zxmv1/u/xwYiPd7Ffa4MkmO
         RY4j9phgrFGETRFmmtUUHz3yuHtzKKUi8M95Wr/6wQ/6hk0motpv+8bI3ZMHNG+7Px4U
         1MPLAwRjq7dvoNlcduH6Pf0HGiIFZ7mqiEeECaGze6RqBQK+NQb9lFWkUAHxEeYlfHDw
         scM/8xdrTjMT99NBJETOVJI3c0oSCZhsJYZU8qYDndgr9Rgbg2AR2ZKYedXk8kxQx0hM
         RXxdAT6MXUGXEU0GUNv5dInmcAHLd1ASLrxuG24WJIAIVHv6enzGZp6xisKEVrTPs/Wq
         sD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=mmVANkbblZTO1ac1JV4er+9GGVFyHPpyyCX+CTB4sOI=;
        b=iP4CpbZnZPPuA4qQpocLlQjLINHybiqTM1RVtgZW+ejQbwGRaFJnX3wuExWOdFk2XI
         kk+DNm+7I6eO3rILSzZzfAyO8aFOqbvpRiajNdWU114mL4EUTetO918JOTeVOSawGEzZ
         0GQvxf/oZxNoey/0Zig3T84RIREQ9xUuPXgqOIVnHbTUEk7YLWmGMGGreFy4gwlg/W2I
         BjFcpCc/pmi7eSNwakPgGP/s7f2hx9iOZ6dd2huuEua8Dkclds6pCKwzAO6pFBYMAaOX
         frIq5vT7CNuj+CVvBpbgur2A9qu3Swn2s9xo5dmiKPU0GUbC9/c5pJdDWcRa4gpby/O9
         FjWg==
X-Gm-Message-State: ACrzQf3sZzDES6cjyk5vkenM3wSbXlwfBkvjXOdpJ1z/AalqSLzyfnJZ
	wEN1Eqw3JMYA34F44dfBGUNp79Qy9/8npA==
X-Google-Smtp-Source: 
 AMsMyM4wOXUuTNrYLabYoGJiC2rI9xjXLGamhvctKFbZALlqboRaFPh/YLSEl2F8eM6boBAnzp0puA==
X-Received: by 2002:a19:5e01:0:b0:492:c03a:aa8e with SMTP id
 s1-20020a195e01000000b00492c03aaa8emr582405lfb.139.1663274725363;
        Thu, 15 Sep 2022 13:45:25 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 c1-20020a196541000000b0048a9b197863sm3108246lfj.235.2022.09.15.13.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:45:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH 1/2] linux-firmware: upgrade 20220708 -> 20220913
Date: Thu, 15 Sep 2022 23:45:22 +0300
Message-Id: <20220915204523.2407692-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 20:45:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170772

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20220708.bb => linux-firmware_20220913.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220708.bb => linux-firmware_20220913.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 91c32e49d645..5a953fd0e234 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "def08711eb23ba967fb7e1f8cff66178"
+WHENCE_CHKSUM  = "98ecc3d3223df7ebdc23b0ec56aafb20"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "0abec827a035c82bdcabdf82aa37ded247bc682ef05861bd409ea6f477bab81d"
+SRC_URI[sha256sum] = "26fd00f2d8e96c4af6f44269a6b893eb857253044f75ad28ef6706a2250cd8e9"
 
 inherit allarch
 
-- 
2.30.2


