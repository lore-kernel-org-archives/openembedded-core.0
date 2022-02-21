Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E871C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:43 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.4697.1645478681977886005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m3x0l6n2;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so387855pjw.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O4M3Qa81q8z0kK/AtZPDLcKAwQmhkBMXMmkq3NthEPA=;
        b=m3x0l6n20ezHw57yPlw78ImiZ3mN+GtRdgu+7K1wdjbD1OuoqM9hLbH5CC+OOYJu2Y
         bCp0pIfSwvjTtqJr04/SuQzOqBMOlj4Ce9tRe7JMAF9ytZzgFCxsYbWx9Loas8KR5r3I
         /vOxth0fb0guGWl0ot68BM2KBBBY3Jazm1jdg+hcD82UXtNZ1bl7u5D2w1sxSR2wa/rC
         jvZZldvATWo33U9isKgss9QxuyWZjuDcKxStDypstywgpSHPHAklXi7mPlUVSlQmwIYu
         qSynInC3nspD9bO94cJep0pRwz0BO68x74NYL2ZqZy+k0XU5zSJKeFRfl2IFXUKofaEU
         40pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O4M3Qa81q8z0kK/AtZPDLcKAwQmhkBMXMmkq3NthEPA=;
        b=tlyxbBnl2uCOOrDTcu5lCIsgAtBbHA4pfJg5jzRWc6to89iA2KrXsWGC12WJG7jcCY
         eIFRWnzMVytHFdpGyFW3LZwkS0Grb0hQzDfZR/cd0TRJ0dD72Wj9guIV0X5Ecizm9Uhp
         H0wevG0hd0pfAjD+zTWSr4LVgK+o0fN5U6yMDEC4RRFp4k/BqZztab2r83Ahoq7sp+fg
         nPpZwPA9vtV+klx0PKW+KDVhlCHhd8zHxSe3pUw6Fys7UO1Nf/AR7SJmUHnD8uqNwpyM
         QNOyBNsfQBca4z6y3hgTZscJDNLBIx6kkqtes/aZmTpyi58bIj4GtTrPR3PsQZN/lyRC
         4GBA==
X-Gm-Message-State: AOAM533WPmdHa3yDEgRt8bS1yyseFGSkFWotCO5+OEVdqJVamxfmSDpv
	PzKCvcIU+bOD5NcgQHMm0g4sfvtYz3/VEg==
X-Google-Smtp-Source: 
 ABdhPJzD2DIMpF+AuSOQV21LSFaqAcCy6Ix9v7nB32YvM+mSByi10A7auJ59aMLdtgBAxiQ2LI46tQ==
X-Received: by 2002:a17:902:e943:b0:14f:4a2b:203 with SMTP id
 b3-20020a170902e94300b0014f4a2b0203mr20573632pll.113.1645478681135;
        Mon, 21 Feb 2022 13:24:41 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:40 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 24/32] python3-magic: set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:39 -0800
Message-Id: 
 <06cb365711d587f590a7aec63f9089fb8dfd284f.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162100

The wheel built by bdist_wheel has the name "python_magic-*.whl" so set
PIP_INSTALL_PACKAGE accordingly.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-magic_0.4.25.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.25.bb b/meta/recipes-devtools/python/python3-magic_0.4.25.bb
index efc8b6daaaf..bd46b294ae9 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.25.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.25.bb
@@ -8,6 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61495c152d794e6be5799a9edca149e3"
 
 PYPI_PACKAGE = "python-magic"
+PIP_INSTALL_PACKAGE = "python_magic"
 
 inherit pypi setuptools3
 
-- 
2.30.2


