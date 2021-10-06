Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBFFC4332F
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 14:36:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.12842.1633530979006160718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 07:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QgJI2txE;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bkylerussell@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id cv2so2020569qvb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riz1w7/V/Eqkh8Y5lndPSbmVxd6v9NdC3MajnJCF6co=;
        b=QgJI2txEVPTMkBtSccb3HlTb7MDjlK0cdNnNcwp5KNLSHwbolWBlAUDWMOJzx5AZYW
         h5Wa2Kj11xAtjoP7X04Q0irQxsfhKJ173WwMt8kJ/TWi8GfUVuvKmC7ZQuNKHSP7Nnj/
         nSTUmfYDN9XV+Z6T8oHAT3DnV9//tMX2SmXbdTHN0h3Rwn8JBBQdZRRzS6H6DJww+ay1
         mhQ5URR3A658plnJWyJUYlC1636a8QeXrwHAE/liYevqKZu3jpmFs3YBpZDkHY6FVzYs
         6lXsEnLskik0Roo76KGDzX5UTDcKi9DDikho2glHU5rv5iN9g/1lj+RZZ41a9eloeu7I
         IYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riz1w7/V/Eqkh8Y5lndPSbmVxd6v9NdC3MajnJCF6co=;
        b=SfOZ46T5DQNlPkKWl4bP/nThU8Bxg7PMUd69Kxod3WCheovvEHp8l+FYAfWIY6X50r
         AJFhUg1+0G/nhQLHRpA08OnaqHTKDWbIfCF+aZxF+EwgnE0IZaw2MFR9dSb9/pXC5hWj
         8K3vd++ldxMkn/Rpvq0tTbeWs1Gvqyq2XzT2dD0kuxrtpYPtijANO0JpdtOT4L1GLpSY
         xh4ZhFSdcgYnDTlu5fdX95lq/QX42C5Lc3+Kwf8DUJjclgiZXsIBZsDh0HYrTbefXTgv
         AojwJdt3Aoob2m+NJVozannQU09Kwg5LN/cOfnfrDkFG1ixvH2ED09r0xnR6TMMbB8f+
         md0A==
X-Gm-Message-State: AOAM533+IMi0+jHDRRtnUagLuKQfQc6/69ofKlbZMBmCXro7fBs1BcnL
	CP/xa+CS9+454sLINXN76qcby3tm71k=
X-Google-Smtp-Source: 
 ABdhPJyL/5NKDeNwOCK32AvfxsqLAagSEnfa7ye6uHvQzgBEOv1cFPmid3La8jOJ8Ztgw9e73EXvbw==
X-Received: by 2002:a0c:c18e:: with SMTP id n14mr33915420qvh.60.1633530977947;
        Wed, 06 Oct 2021 07:36:17 -0700 (PDT)
Received: from poirot.file.core.windows.net (cpe-24-26-62-248.mi.res.rr.com.
 [24.26.62.248])
        by smtp.gmail.com with ESMTPSA id
 x10sm14023341qta.75.2021.10.06.07.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 07:36:17 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Steven Walter <swalter@lexmark.com>,
	Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] cairo: use ${PN} in package name
Date: Wed,  6 Oct 2021 10:36:06 -0400
Message-Id: <20211006143606.55529-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 14:36:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156695

From: Steven Walter <swalter@lexmark.com>

Without this, bitbake complains that the license for cairo-gobject is
incorrect, because the license is set using ${PN}

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index d76d935c30..b5d4b7eb22 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -77,17 +77,17 @@ do_install:append () {
 		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
 }
 
-PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
+PACKAGES =+ "${PN}-gobject ${PN}-script-interpreter ${PN}-perf-utils"
 
-SUMMARY:cairo-gobject = "The Cairo library GObject wrapper library"
-DESCRIPTION:cairo-gobject = "A GObject wrapper library for the Cairo API."
+SUMMARY:${PN}-gobject = "The Cairo library GObject wrapper library"
+DESCRIPTION:${PN}-gobject = "A GObject wrapper library for the Cairo API."
 
-SUMMARY:cairo-script-interpreter = "The Cairo library script interpreter"
-DESCRIPTION:cairo-script-interpreter = "The Cairo script interpreter implements \
+SUMMARY:${PN}-script-interpreter = "The Cairo library script interpreter"
+DESCRIPTION:${PN}-script-interpreter = "The Cairo script interpreter implements \
 CairoScript.  CairoScript is used by tracing utilities to enable the ability \
 to replay rendering."
 
-DESCRIPTION:cairo-perf-utils = "The Cairo library performance utilities"
+DESCRIPTION:${PN}-perf-utils = "The Cairo library performance utilities"
 
 FILES:${PN} = "${libdir}/libcairo.so.*"
 FILES:${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
-- 
2.25.1


