Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A0EC43217
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11594.1634657685800917898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KyMpk+Ai;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id o24so5061568wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V2w4gxGh1qYyz4T9omkHLvgcpYMprZ3eesBhhhgp8oM=;
        b=KyMpk+Ai8TNyr48YKrVkeElkI8hZe9u0y9+jpp2nR9bNI47sR5xHs0h5ZhmzmULveP
         Omjq2ZXlxwFSwGQLbnx+Aj62FEm7xrLMFXoT33UVVpdA9YSWZSvNOBAot0kxflFXqKfd
         M4s9dyeFTPV632OQrrWAuWkkYuhProFoe86iyp2Dh8KT1gQcexND12aCesYnScscLuVb
         IPQJdnJOlUbnteiD3jmWlb1v5Xkhign+FtqtBp9ANjnlKoGeLMpxwhFd9TXyp0kb67nN
         Zb97uV+xh3a5qXkw+WtdPj57EPTe1ce5wdykX93RNb5dAiAh4KoQ96sLkgDKYE/U1ahr
         HE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2w4gxGh1qYyz4T9omkHLvgcpYMprZ3eesBhhhgp8oM=;
        b=VqTV6sDwNifHYDNj1RyMk1uQcp+lS5b8CWmfLMVouQ1MlIlXwWyJ4PCWYAauO2XgCM
         4LqN3GVutDoYjekhqIGn0kF7NIbQNNYeF1AFDIvF5xDMPgHa0olS5adICYRaBCDQNAVT
         +bHdoqvCF2SN4JTO2UG4W9FmHX8PyZHVGHIQAC5+pUKbq40VdcVnFNeRN5AjjaGR7+hZ
         BgnIicpgapwG906+1achBFoA7A4p3FuwMdxcAkuwUy4Kb3lkUzDqIxQd//kjjk3ll1Sb
         ptbUIcE/ggv/9nbn2J2ZFY+DzU2z4NuIVbfUAEAHVUFPmdvfaSarHyzlV0mOK6TN3bEI
         kfGQ==
X-Gm-Message-State: AOAM533Q1a0yN1L9LJ89nnCewtGXKfTb0pMqL7j/FJibyI2CA8hH8FnO
	p/vdKrMZnxclfQd5ndmIiDDdj39fRgE=
X-Google-Smtp-Source: 
 ABdhPJxqYf7sRdbkAl8HDNen+VaS2vPRmcBhq+/stdlORVHvpVnGAjtI1LQ0E03EWB6HkRZ/0KI+tA==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr6849078wmq.63.1634657684459;
        Tue, 19 Oct 2021 08:34:44 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/65] ccache: upgrade 4.4 -> 4.4.2
Date: Tue, 19 Oct 2021 17:33:43 +0200
Message-Id: <20211019153419.3319802-29-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157148

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: formatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ccache/{ccache_4.4.bb => ccache_4.4.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.4.bb => ccache_4.4.2.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.4.bb b/meta/recipes-devtools/ccache/ccache_4.4.2.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.4.bb
rename to meta/recipes-devtools/ccache/ccache_4.4.2.bb
index 203be8c92d..dd0ad642b2 100644
--- a/meta/recipes-devtools/ccache/ccache_4.4.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.4.2.bb
@@ -7,12 +7,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=73963d63171ecbdf2d25274de67c68c5"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=985be6d06a50f60a9893a19a6d2550b8"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "61a993d62216aff35722a8d0e8ffef9b677fc3f6accd8944ffc2a6db98fb3142"
+SRC_URI[sha256sum] = "357a2ac55497b39ad6885c14b00cda6cf21d1851c6290f4288e62972665de417"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.20.1


