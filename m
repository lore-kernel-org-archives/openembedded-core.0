Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559CAC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.11492.1634657707244193116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GWEfC79d;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id p21so12447270wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VoNxR6OmzQciTE4+40Msq1cZqKtVSqQ3VuL7lFANqnk=;
        b=GWEfC79dzOYKnGE2696cywjFJ5wlJT7ozHuWsLkSUCPFdhPhW2eCoS/plIhFrf1ybr
         YM937/ILhS4GhvKgoE+66AQvPAHUDAG5pZA26ONsbmYgZfWREp9WrZCsP2JrznKxMXkz
         QgFbadN54hgvI9f/mIowg+o5NOsyzpG2FEEzTQhAyZb7raeyeBGZ5CQuMRiVLRcyagCA
         g4Nd6Eo+yT/CE+hfyl2MZLyyBpGDLVTNUle1HxvRng14NEAVImwndWO+Q5+YLXuKALb8
         fQaTe+VyEzmgj+Y+HThnai4psbAFM8VKSFB1DADCu30hauKTck6BiWwHq/cwP4CQdjF9
         llYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VoNxR6OmzQciTE4+40Msq1cZqKtVSqQ3VuL7lFANqnk=;
        b=7EKwacdS+XAmv95B02vUmkEmi5q7R/eNlkXumq8F1RM4gBf7Vb4ZXQ+Gqy700hLGJ9
         yu4UoStxJQuYDSDK9LPRd7Yl2JT3kt+Ve7eFSyUe1zC9PuuTId/2/hSzg+ArG/fpQ/vB
         HNfDo9X9CY8UlnEKwGaeaEdtRAmZ2rbgtkjU5NvK+qRQ/OLGek4T9wnLw90oVEwEFZT0
         /VVCYzfkXq0Tpma0/TURB6LqgT/zHoosEZyhyE6ek3c/UOiFsjH1vK7dew+jqJ5zHIse
         zb3NdD0d2i7v6jJpgbN2CskfaVILI0weDzCi0A1Sf/xfgGDrXjhSSPvttibzyks90gDj
         yBAg==
X-Gm-Message-State: AOAM533BUfdNQHNbkSbvKKSqIpjST0qcOzTyo9tBUjcUd09FGziKvNZa
	Ly0PhSEjv3RGQnClWq6IgwPEoI6BLVU=
X-Google-Smtp-Source: 
 ABdhPJxPBv7gec5mhEaM6co9mNQOamhAKXaI6kAjuBvLbguryP8kalbrKFOidg1DEmikxPn91p5pgg==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr6829952wma.174.1634657705904;
        Tue, 19 Oct 2021 08:35:05 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 59/65] libatomic-ops: upgrade 7.6.10 -> 7.6.12
Date: Tue, 19 Oct 2021 17:34:13 +0200
Message-Id: <20211019153419.3319802-59-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157178

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libatomic-ops_7.6.10.bb => libatomic-ops_7.6.12.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.10.bb => libatomic-ops_7.6.12.bb} (85%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
similarity index 85%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
index 74afe9c92f..d7aecc706c 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
-SRC_URI[md5sum] = "90a78a84d9c28ce11f331c25289bfbd0"
-SRC_URI[sha256sum] = "587edf60817f56daf1e1ab38a4b3c729b8e846ff67b4f62a6157183708f099af"
+SRC_URI[sha256sum] = "f0ab566e25fce08b560e1feab6a3db01db4a38e5bc687804334ef3920c549f3e"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.20.1


