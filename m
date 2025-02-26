Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36A4C18E7C
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 02:54:47 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.2612.1740538485754701275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 18:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rHI/AsWD;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-471f686642cso55986041cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 18:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740538484; x=1741143284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95ZEnKjEzMpjjxenhNTTATUAGCNAWj4DY4I0e/TqX4s=;
        b=rHI/AsWDkmaaOlUOc6aVS+0iHH0SgCfBuOh15IXA/3ydR1iwSKEt6sBQoY2yLCMPym
         Qt95/z/47WPMYt6Sh5dlLqPHkugZLJcbDSRSkBfj6U8RD377kTpTdXAmLnlubG84Ntsp
         gjoODFCrJXpFoXJtk8QG7RSHLbbAYBDYq2llW7pod9PENs6i0ddH2FP9xbXnMsTRySmr
         SBuf0iCoUq0LFHdIUkwH/vXO0ouXRQSv3r8g6H8kcB7C+qSLW76pNN8Q3kLDCme/jL0I
         3bEdIFuLV1JzcRJDskzX0aI+rrQSO8YFhJlhMHnenZ1wBtblDLHehCMmDL5fKhit4m15
         rcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538484; x=1741143284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95ZEnKjEzMpjjxenhNTTATUAGCNAWj4DY4I0e/TqX4s=;
        b=ucmMifcnJ4G1WUAIpu2XZf2qmEaAkVAZ1FrgmQGzQMxgJknDfIGPS1VHFtwGsKdF13
         q1kRUd5jV+E8H09RBU2aXw5ut9OrZX/kiH3bQN70ATIFvK3qrnFmiOO0coridK3x+d0E
         YA03ppZMcYXENHjhXQ1eED7G0SBcxb7eVcsY9U9sK4zLIyI26PcvC/RlhAyIwIMikEyz
         zftzZSzXyomgu/iFwlxomeCaexmsep7tzMv581L2sqxNoh5vZ9sJat1VSyROBKzJ8K4g
         1huXMr63utBeTDwfW8YA2sbgknYBivgkPUyYBB4XGKKlgfkrwiypYv/OEK3MzfPcpdtz
         Mgew==
X-Gm-Message-State: AOJu0Yygb3rdUrQekH5dyaCDTwZdfy7l6ZM5xhGy4WPKUBawFU70y7xG
	EgI3Qawe/lw/uT3DmSI5c69gTXx6WAieyoX5zzEQq1wkV3hpbkXiKdEJeS2RjJyl8jXtKd+Fhfp
	i
X-Gm-Gg: ASbGncuWXnUmJWov53AnkSMe7Mvu+JASm5aAtNTGgFt1c3o8FpI1NapXwRJPiOdDqEP
	VR7PfxanC00mYa/1TlxZ9J+7fXFMGlvPKXfCp0o/piLXxsB+/7+GDiqNGHbUQdzl2iox1avwM4f
	ztW6NMJ0uBgzlAIXciexrUWJquv8qrvl06BETR/HNrRhF+ti9viSLMLb7InJU4Sm2sKf0R0ysf6
	FM9RoS19muE8MmbsKXpls7ayt6t7oHqiPMG9r5Nyj3nGlPvplTrPtGZxmeEjYxbzkJW66pAxFI+
	/eLmIQoOo/H2fz0iBG6A1X+6O4w+u37sZ7DTibJa9CORm7PDtr3MIw/CfDvW9A==
X-Google-Smtp-Source: AGHT+IFqWSfmZnt9E2hDX7NIdulaUxKP38NzISOZ2CdVYGffsR/rEQ6/cXrdWqjRfkKBYJYLjk7+Hg==
X-Received: by 2002:a05:622a:241:b0:472:61:64e with SMTP id d75a77b69052e-4722485ed27mr258991111cf.27.1740538483556;
        Tue, 25 Feb 2025 18:54:43 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47377e1541asm18197471cf.19.2025.02.25.18.54.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:54:42 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] python3-sphinx: upgrade 8.1.3 -> 8.2.1
Date: Tue, 25 Feb 2025 21:54:36 -0500
Message-Id: <20250226025437.2042320-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226025437.2042320-1-tgamblin@baylibre.com>
References: <20250226025437.2042320-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 02:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211940

Changelog: https://www.sphinx-doc.org/en/master/changes/8.2.html

License-Update: Update copyright year

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-sphinx_8.1.3.bb => python3-sphinx_8.2.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.1.3.bb => python3-sphinx_8.2.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb b/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
index 38cceb068a8..e22ab817e7e 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4ab44940eeb9c0ec044da326d904a683"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "43c1911eecb0d3e161ad78611bc905d1ad0e523e4ddc202a58a821773dc4c927"
+SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
 
 inherit python_flit_core pypi
 
-- 
2.39.5


