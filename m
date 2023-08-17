Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD60C531DF
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:02:47 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.2216.1692298965195840587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=S9fnBlr8;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76d7fcb2c62so8198885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692298964; x=1692903764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdQxtb5Bha0Hd38j+ItfPV0YNUM6FH/VAT4RZ4+eUUA=;
        b=S9fnBlr8bqpPAAmxDdXnWjP4UdQJVCbdYZloW3rdUQw775SWOpOKFBXksFiIGDLBmu
         IO4oW8LByMadeKU2tPGopOoeJoBITxJumLwMXx8ZzJY0h0QCFgGK0SxAjaZi+7sTBnSc
         v2DwkzjRB7qPGq3xmYY2O3VbvUHiM290RNN14KXCHaNwncmizB25fmhg5l3SeKgCYxBf
         FRQGywKw5vvvLfWoD5B50YrP1x/JjzenJ1Ihkyht6dsizkQzkWWYKkPIu/5FrB+VI7TP
         S22m8eThmw9O6nYP/D4VpYLu9qClDFMBLbbm0EccHWmuhGN7E15PTvF0Lu2gXeMcK6T6
         71mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298964; x=1692903764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdQxtb5Bha0Hd38j+ItfPV0YNUM6FH/VAT4RZ4+eUUA=;
        b=WBUa6qN45c7ZHeKRqFagE6ZaAD2UOHA/yJf8aA/GHBBn2Umrmv/EadkW2XFtQQpL8a
         cobWmM6tHz/c2+UCjZM7NMok0MPE7YREnOgVVj9jfJmrTXywJY/xQzJVNs4SaR5zgUa1
         F10wcPwr22emYYuOvxeLzzRzN/+8eDKg+XiwSMCpMq5M/LPIBH44lsvVIQgl30OQYxDy
         lVoiG7X5qC1l1SiOZpljWLAA7iwKkV4pTUjZO6eoThXrYQ61/Wc7UNUdniZty+JmqxzL
         VFq3xsmYDf6/oP0CNk1dz2B182Q3xfznvqDblG28UuzMlHf3MvOlFbmicYRwEIgRrK/x
         IFFA==
X-Gm-Message-State: AOJu0Yy6Pb7u1b4hgLIpTiZN61NNricxBKM7XqzAAHtHhKzNrQs30b7H
	8ZtBf97ewrFfKChAlbcRbKfpXNC28RnYu1pYsbo=
X-Google-Smtp-Source: AGHT+IFftoFWm5XzhVErQlkImKw3FUrLv8K7zpJa1Jk1xa7GTExmMm5mmTqcjYsR9fIEign0Hepn3g==
X-Received: by 2002:a05:620a:4611:b0:765:ac1b:9218 with SMTP id br17-20020a05620a461100b00765ac1b9218mr4787608qkb.22.1692298963878;
        Thu, 17 Aug 2023 12:02:43 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k17-20020a0cf291000000b0063d47a29e6fsm80998qvl.55.2023.08.17.12.02.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:02:43 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/5] python3-dtc: upgrade 1.6.1 -> 1.7.0
Date: Thu, 17 Aug 2023 15:02:38 -0400
Message-ID: <20230817190241.2302457-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817190241.2302457-1-tgamblin@baylibre.com>
References: <20230817190241.2302457-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186335

Changelog: https://kernel.googlesource.com/pub/scm/utils/dtc/dtc/+log/039a99414e778332d8f9c04cbd3072e1dcc62798

Remove custom PV from the recipe since the relevant functionality is in
1.7.0:

[tgamblin@megalith dtc]$ git tag --contains c001fc01a43e7a06447c06ea3d50bd60641322b8
v1.7.0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-dtc_1.6.1.bb => python3-dtc_1.7.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dtc_1.6.1.bb => python3-dtc_1.7.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb b/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-dtc_1.6.1.bb
rename to meta/recipes-devtools/python/python3-dtc_1.7.0.bb
index a868bd0109..85e48d4694 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
@@ -14,9 +14,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
 
-SRCREV = "c001fc01a43e7a06447c06ea3d50bd60641322b8"
+SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
-PV = "1.6.1+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
-- 
2.41.0


