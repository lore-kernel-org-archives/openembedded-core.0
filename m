Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBEDC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:51 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.12365.1641927770378582847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LrOjsI7I;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so7071986pja.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F+bIrLjlR+wIVxK/k4JzjU1SdleRY9gHiUEdxG8buJw=;
        b=LrOjsI7IdT4zcS6hOK6r+bVD0P96POHcTJp6W64pWpqpZ0gxDNArqS567LRh0dxGxT
         efzjS6qKhye4sDiiybpc+kY0Tc/Y78QTdMSlFeO+PQSvkz/0cGO13JyvtkHHrunreUtS
         Af7HhN//ZolJ+sMVp3sOwFosw2J+7OHbMKytPHn8/knzKgR5CjK8akNvSmbXzEH4popu
         j7z6nmAeuvDTBx4K4RbW6WU1lIfOUkdKZdNOikfInt3OJXEtnR3XRf3k1lKNKpHdfTJV
         FgGJzV6YxidUOcAY/H6D9T11ok5dOPsOd76v1oXiwBvcNnYHdW5hNQDHnrfVC4Mhpvao
         q0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F+bIrLjlR+wIVxK/k4JzjU1SdleRY9gHiUEdxG8buJw=;
        b=Q5fplb/pVH23oHx2+Es2bmseczj8C2IpU//zn0mzBG+ggS7jhLWpW0EvLocZZ/gsN8
         406q/v4J7rgKwPXQaNHUAg79As/fr/5X0sSQ/0gnRAOnvP1v2tBK+vSZO6wES7rYMKbz
         A1tk2sVacqliQ3ici79o4GpoHG1jLCnDjPCJo4p8nZZl6i02J2356OEJnkArGgnuGaGC
         psBiCa3LiU1SQWheaVtzMghF2bwOFz999j+Kfs7nZkvj3/kopHj8podIv04WofNaxoBR
         OnPTrNWXaD5IcqZWbPc0/IGliQuAIKhXDDX18NSMbUoaGKf2O84VwS2YcGZcTO2qWhLT
         nvQw==
X-Gm-Message-State: AOAM532sxr23SxS+dH63pSuck3y9NY1Tj7LDq2fdparFiuPpR9XS7M09
	WOxcHF+whOAnoZ9dPuuiFVrKv5wjrAs=
X-Google-Smtp-Source: 
 ABdhPJyvBMezuAhyUD0UATlU6dKaDiNunx+XPmH/qW4VEhzl0tNNzMk+8VmkVbHfP74Htli6i7ArkA==
X-Received: by 2002:a63:b509:: with SMTP id y9mr5233028pge.31.1641927769582;
        Tue, 11 Jan 2022 11:02:49 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 16/22] python3-setuptools: do not depend on distutils
Date: Tue, 11 Jan 2022 11:01:25 -0800
Message-Id: 
 <e05e60a272cab07a533a57ae3f146320d1d5e73f.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160452

No longer depend on python3-distutils, current versions of setuptools
vendor as _distutils.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-setuptools_59.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 878fa084045..33ca928c3e5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-compile \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-json \
-- 
2.30.2


