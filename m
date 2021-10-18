Return-Path: <kekiefer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE68C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 21:10:47 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.419.1634591422320605842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 14:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jOhwRtmV;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: kekiefer@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id q5so17389692pgr.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G/e+sd+Xh1c6idDGCmaK+FJ2Q+kCT0wj4DJRunyYxwY=;
        b=jOhwRtmVobIT7xIhv0Va17Ly4VuLRlYjxMxTt/nsghbSF+1m+zjg0jJg1xqpA11emQ
         dbWc0BxUHMotSvEfGt2VoTuc9uIZ6SNyqttBvmT9eqHk748XCmrRIQLvTSTbDZolbWyR
         M6pZLwclIMLix4DS7c1FwY0v1bfjaGt8YT/Td+cWqx3OXvRmAGQboMCgd+7spswd3Sb1
         ZcE6OK5BU950Nmiv1H8kfFfhARFqA4vwP7rPVMCqXqG3+ip4sc+0fZqCqPdEsTcpxiHm
         3P7MR9TKBm94mMaOaSS+Pc+PVX+uIvsG3XWb7q+wMbTcOre8cOQCVKMTAOrsmGtGbzgy
         t1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G/e+sd+Xh1c6idDGCmaK+FJ2Q+kCT0wj4DJRunyYxwY=;
        b=X6Akxt6PcQqje3lEv9jUtYmvQzsse9lMN9Q/RdAKxVAeEiuNvLTtT38xGj4Rr9tnEq
         GDzKF8ETFJbKH1+RUIGbUAIjtNBFJDLvzci3A6JR9K3IBYjZZzeUrANdPS611e5Qdyb3
         KnrFBwaG5hmuGdgEr4Y5U/Jh7tUIrfq+IBeoatID6rROYUnVy64fsmn2H+hqpGyU/ziU
         U36KDGqgUsbBAeO2tfKZrq635Wv/MrwtY8iqIJfVD44yprHt/QRSvG5IWk2sZ6CMR/QE
         O/4jy61Mp6ASvHG5qO4Jsc08KLpTf1ZPPUANeZ6NA81A0IxU15t7QWoX/mKkzMChPbiD
         T+Kw==
X-Gm-Message-State: AOAM532PoYtuMk1ovKrf9dBmQ1JJKwtjExtloZP8ZoSle7FiNbXOLi8k
	As2tFfImKgEgoY7cLaqM6c26xU/JFSoVIg==
X-Google-Smtp-Source: 
 ABdhPJzbJrv+uiX7LxoRXBV2Qm5dfS6HEvsIcow2vRy6xxaclcxhvr6rbOChg4sZbYE/zjq+ZpD0UQ==
X-Received: by 2002:a62:7a8b:0:b0:44d:47e2:99bf with SMTP id
 v133-20020a627a8b000000b0044d47e299bfmr30277531pfc.64.1634591421632;
        Mon, 18 Oct 2021 14:10:21 -0700 (PDT)
Received: from emorypro.localdomain ([2600:8802:5d00:40:55d8:fae7:2df9:ee0a])
        by smtp.gmail.com with ESMTPSA id
 y13sm14083119pgc.46.2021.10.18.14.10.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 14:10:21 -0700 (PDT)
From: Kurt Kiefer <kekiefer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kurt Kiefer <kurt.kiefer@arthrex.com>
Subject: [meta-oe][PATCH] mozjs: move large static library into staticdev
 package
Date: Mon, 18 Oct 2021 14:10:04 -0700
Message-Id: <20211018211004.11706-1-kekiefer@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 21:10:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157095

From: Kurt Kiefer <kurt.kiefer@arthrex.com>

The libmozjs package was including /usr/lib/libjs_static.ajs, not
required for runtime usage.

Keep this file, but move it to the staticdev package.

Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
---
 .../meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
index 9b9d2cea8..88aeb2dae 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
@@ -62,5 +62,6 @@ do_install:append() {
            -i ${D}${bindir}/js91-config
 }
 
-PACKAGES =+ "lib${BPN}"
+PACKAGES =+ "lib${BPN}-staticdev lib${BPN}"
+FILES:lib${BPN}-staticdev += "${libdir}/libjs_static.ajs"
 FILES:lib${BPN} += "${libdir}/lib*"
-- 
2.29.2


