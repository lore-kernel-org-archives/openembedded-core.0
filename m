Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412D1C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:26:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.3941.1667831172712098839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QUDWMojY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso7242889wmp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqAYLv+SF1gpIoqgOrztwecyWDcgO+GHeMhjthGFr2c=;
        b=QUDWMojYyAby9gE117XJdTI+rw0y82tO2Ym1ZI7CUf3BBngRENhqJrG8Thr02zeeru
         jBEczqy7PBF5pubOLPoyZULAATtNSzm9kxNt6krI1Vf0wEEW8xhZn0BO0LPN1IXeNQSC
         MbZcg2EH2w5dq4dAk5tiSEQ7dLxKmUb2RBBqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JqAYLv+SF1gpIoqgOrztwecyWDcgO+GHeMhjthGFr2c=;
        b=5KMpOgOCH5y1LzbsmJ2PGz1HAXqBM16x0j1/+i6t/10joasp3Nhmp6vYJ+bEIMMxki
         Xh6DbNPVAQ+NWovKBloxVaTV06k+Wu4ULX6YK4PnMu3TNLeCiQWzemNKxLKolkluizRg
         pWxOWiUAmL8J5/V4TGnaABm+np3euvDqZFInEIO9hGeiDsNPQwKbjHlkSqahhIFZttIP
         iKNf5VWIKlesPlMMSzn46OEW9PC9cgJBoFF7TURCXrq9y0FNkZoC/YtGo2xhujEDYzlh
         YsNKXRwqPa65pyZHoV+vo4CpaUXBNiOTjxumiuCvH+uk3mi5qOksMPACEr52q9d7T5HG
         2GiA==
X-Gm-Message-State: ACrzQf21PgKC1ptxGEiJxSwPJy/+wGt70MH8wKRKnikNaHb1gRbYw3pV
	eaUPczgf5YLlSUmIhkL/iWIFwHwMaD7tfA==
X-Google-Smtp-Source: AMsMyM5MjMbJeWY81kGoekif1LyL3sLlwKSIPXCLk66XQT/2JvoDDFGGKbQXJlsBLB7bpRU6pBsJ1w==
X-Received: by 2002:a05:600c:4586:b0:3c6:fbb0:bf5a with SMTP id r6-20020a05600c458600b003c6fbb0bf5amr44452189wmo.47.1667831170710;
        Mon, 07 Nov 2022 06:26:10 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5b94:fd41:9ce0:fad])
        by smtp.gmail.com with ESMTPSA id h17-20020adff191000000b00236488f62d6sm7396198wro.79.2022.11.07.06.26.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:26:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-source: Ensure deploy_date_epoch sstate hash doesn't change
Date: Mon,  7 Nov 2022 14:26:09 +0000
Message-Id: <20221107142609.1509126-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172848

Currently if you switch machines, gcc-source do_deploy_source_date_epoch
would reun-run as the stamps are tune specific. This hasn't caused much
of an issue until now however if we fix the gcc recipes to reuse the
timestamp from this task, it does then create problems.

Copy code from allarch to ensire this task hash doesn't change between
machines/tunes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index bf33a4b31ff..265bcf4bef5 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -17,6 +17,13 @@ STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
+TARGET_ARCH = "allarch"
+TARGET_AS_ARCH = "none"
+TARGET_CC_ARCH = "none"
+TARGET_LD_ARCH = "none"
+TARGET_OS = "linux"
+baselib = "lib"
+PACKAGE_ARCH = "all"
 
 B = "${WORKDIR}/build"
 
-- 
2.34.1


