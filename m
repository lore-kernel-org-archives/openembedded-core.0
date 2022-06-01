Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82659C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 11:08:35 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.6061.1654081705355691334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 04:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BNl5xTGc;
 spf=pass (domain: linaro.org, ip: 209.85.167.50,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id j10so2107238lfe.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UUWd8rOWqb81NcxYp17fcPZqUvaSNeji96cwDYQ3qzg=;
        b=BNl5xTGcYqHOZkLIRPeqTHS7T5xBXr97KCF/9rluVpb8ytImQAnvD6/IE3j62aecFn
         EVTbGD+NVfMvADsVufv9UcQjvDn9iFDmNATCIZvBA4I+roE77+bjV5nTZGWlvv/PU95s
         0vkFT4lwtmlfOS9wb9C2oQ7nAfi8QaK5BdH0/3FW6HTt01I/A0v7xwP7Hpzr0lW+mInv
         qNGleu05wvHGa/bQMjIXD/lZ4egEZR+u07O6SUy5MoDpFYvMjaptAP4TiGg8cvQXjft3
         y5EDdE5Y1x2xjQEiNtaDehJNFktDT2OZilfdnMRKkY4B1WEIaHm79WsMGckzbBeHpf6o
         +7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UUWd8rOWqb81NcxYp17fcPZqUvaSNeji96cwDYQ3qzg=;
        b=VGv44jxADg1P+HmzRi9tbGaQ5tezuFPhLg/YEl3urpIAB3/8/keLt6Yb34lXWl0isS
         yfCiKftUqO/GS+73Oqdxbh6/Dw6Tr/0na/STTGEJw7auHjLYNjxJRnrZPzV6D3Lh3I00
         gV9h1/LyXT3az+BODGrHoK62+kX5dT3IJXu71SZsncq3aDwf4c6l1cpw+Ynw8HTh+qkz
         GAGI+sIYtXjBF+eCjUIDyIgj2jQA0h8GOGoqqmKw0EEoGjhl7ysBg8krrzD/YWvvSc4V
         +OFrHee4jueOi5Z1VVLwPQ0Enq1oTB8+GkmWK2XlGbarSoaIs8LllUEBN3edxMciW7bH
         8U/g==
X-Gm-Message-State: AOAM532HwIiL4LAiv6lBOVDl2I63g18yXH7WcTZEJKfmRp2aBjbwvMBL
	WoFL83jJXPbUYQclCvO6hFqikgnbHWxURg==
X-Google-Smtp-Source: 
 ABdhPJyt0N++Frfl+4iHcVlN1HjdrDg6icwGShU+FAzK/a0AClk18DSmMgUNqEePQutVO2d5p5ii1Q==
X-Received: by 2002:a05:6512:2309:b0:478:b60b:5cf9 with SMTP id
 o9-20020a056512230900b00478b60b5cf9mr21767561lfu.143.1654081702933;
        Wed, 01 Jun 2022 04:08:22 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a2e98c7000000b00253b5bb829esm258591ljj.98.2022.06.01.04.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 04:08:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org
Subject: [PATCH] linux-firmware: add support for building snapshots
Date: Wed,  1 Jun 2022 14:08:16 +0300
Message-Id: <20220601110816.3224662-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 11:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166374

In some cases it is useful to be able to test the snapshot of
linux-firmware (e.g. to test if the updated firmware works on the
particular hardware). Allow building the linux-firmware snapshots.

To switch to the most recent branch, add the following lines to the
local.conf file:

PREFERRED_VERSION_linux-firmware = "1:20220509+git%"
SRCREV:class-devupstream = "${AUTOREV}"
WHENCE_CHKSUM:class-devupstream:pn-linux-firmware = "4288aad55d189fa225d492526b8406d5"

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20220509.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 6e328e57260a..10a7036a1938 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -69,6 +69,7 @@ LICENSE = "\
     & WHENCE \
 "
 
+WHENCE_CHKSUM = "d3eb82686904888f8bbbe8d865371404"
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
@@ -132,7 +133,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d3eb82686904888f8bbbe8d865371404 \
+                    file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -208,6 +209,11 @@ SRC_URI = "\
   file://0001-Makefile-replace-mkdir-by-install.patch \
 "
 
+BBCLASSEXTEND = "devupstream:target"
+SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=https;branch=main"
+# Pin this to the 20220509 release, override this in local.conf
+SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
+
 SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
 
 inherit allarch
-- 
2.30.2


