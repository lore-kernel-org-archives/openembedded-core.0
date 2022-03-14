Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B9FC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.3674.1647299845039314615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g7zhMV7s;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u10so26399877wra.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3zelySiFPadyhR8nptsUDDy10EHV9ixS2B8EYnu/90=;
        b=g7zhMV7sy+qBCElN8DbBGH0ZwwVX1kx1dPaxXKmtkE8nTvdjf6/sHHZmpT+SkWR3iF
         puSErjvFUxAfVANmopahLy+RmqqDvOtejT6Jmdzxa50IOPADSHn7f24kwUAWGVo35SxB
         uzllIueyoj9cq0r8PR9rL/FFUzSOo8zGFH9mFs5BUHpzk2MfL8wXojatHLiI6ytQJ5Hj
         o1GFXMws2tt56uydtlFMXHYTtFPJhh049br5XwhQ4to9wO5VET32kUCfXaAd3hhVPGDr
         LLpSA8m1KOjXGuD6zrNWs/BuZUw0jaH87tpG6+WAFYecmjuMdeJXDU4H1GyVd9lRvOzC
         hKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3zelySiFPadyhR8nptsUDDy10EHV9ixS2B8EYnu/90=;
        b=olFvRtu4Z6L+e4rBQ757JwvcjD7TN1Uo/xbKzrPrwTwDQSq4WLHiHFKzbTB2BL5MXt
         WFDk0XbJEyYAftSCvR7D6/p/pn407Wj0s3LKS+VKL83QMFcC+Tjc/vyNsloX5xn2VE9Y
         uo/wFy3LTRhPcDSjkuLOayIFQfbwNq8IyeYJJnCaGqweo8lHL7uklBwncJbQCDYFt24j
         tFoYKXsrBJjnYHT9mdO+M4GNR+xkBLEiRN5J4zbCKLl1f63IK1DYMyicDVV9mM2FohjE
         4J6VTwy/q0z+EVTqW71fq0Y3wJ5FYHrf6uNGuNHJp0Vp1BfUnmOFK11qxB16hLUw271m
         Lfqg==
X-Gm-Message-State: AOAM531A6QabMpfuGrspKMehS5HVN9pdfphAEl2iFRLLLLt8/UcMUlJ7
	n2DiGBtxhDR3T+fTBbJWcp2dwZoUVlQ=
X-Google-Smtp-Source: 
 ABdhPJyfw1S2Nv8h5VsD6KMQ3LBhHQ36+a/uiBpwXmqzVDhwT35LLIh+cyaFHiE5JXFJQetAel/+LQ==
X-Received: by 2002:adf:eb4d:0:b0:1ed:c1f7:a951 with SMTP id
 u13-20020adfeb4d000000b001edc1f7a951mr17418736wrn.454.1647299843231;
        Mon, 14 Mar 2022 16:17:23 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:22 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 01/11] gstreamer1.0: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:02 +0000
Message-Id: <20220314231712.296796-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163205

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0_1.20.0.bb => gstreamer1.0_1.20.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.0.bb => gstreamer1.0_1.20.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
index a8954e0eba..81b94928d9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7"
+SRC_URI[sha256sum] = "de094a404a3ad8f4977829ea87edf695a4da0b5c8f613ebe54ab414bac89f031"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.35.1


