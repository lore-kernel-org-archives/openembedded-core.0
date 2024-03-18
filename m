Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60739C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:48:14 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.41610.1710762492853663728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 04:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l5Xz4TBi;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a46ce2bd562so54446766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710762491; x=1711367291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+P+x9SHwD0pDELTp1HtO98HX6kIb6bY5KfDKOcipa8=;
        b=l5Xz4TBiJwZRn1YbMdtOLIcrO7DJzNClCkZO5EGbmxoHB5LHcyJqiaT2Ksab0SGxtR
         Vx2a1Kw7THhNwzB5/rawv+lk+CY1NVbAQn0Fsk1Nb45jLy521x1lAYEwvcI0wMqwa1D3
         fCBocO1VCXaNayPBRXKcvda/MHxdghvR9/K+qFUBN9NZr84ENqzS2YtXbpiTWdHgl50D
         sEwwSuuHLgKuqayrL7sIcmKWvfgHYy+O1SHcP4NSU7lRwcaiIl08Hy312xcHV4CVURh4
         kWifHemAi7FEa282u1u/Pac+mwmx9TCpb7rICO12Kfds8AZYKRuckpfOBFZiTCah3t+w
         x7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710762491; x=1711367291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+P+x9SHwD0pDELTp1HtO98HX6kIb6bY5KfDKOcipa8=;
        b=PUNrOOZ5aMdN3jDiAfPKqXiZk90Ty/FpsmxUBtgGohodtZsju/3vZkFQXtZ0YYPako
         pLSB8z1yMAik+/BkUUdPNwpTN7y9n3ahaBADOXM6rIBw2cjU1Uv7NijcC/nrqLW1Sr7p
         nB8OqEnrtXzkHdjj1SLyf/mJ1t2MtbEJhwZ8BXegjATjuCRCEsgRYgLjrS9omzI7aCJg
         bgV1R1kPerU1ZT2ufTd70duT6cqdUd/e2FC+U1iePRBkclbrkU/M4i68M2+Pn38Y8pHb
         BQoOgbQkFz+rWvGGUO4Eac5oyVdzYPYHo8f9LSHA+XnfD99MeZj/pR2mZCPUayRqgmCQ
         Eo3Q==
X-Gm-Message-State: AOJu0YwQ17B4OzefCaaa5C5059DRj9BaJinAzWiStzPtLcr3qEBxQmjd
	BGzlsc5KFkOFVsMkMjTyeJ1yl0Ue4vAFp3eGWc3nGqndOVTCIorAujRQGEki
X-Google-Smtp-Source: AGHT+IEhr4SK3Ztts1PQJ6SAUMVzsm1P5UfF0QUWNElYKvDqv5T+obnHXaPGLsi8EGiPojjSJx8DqA==
X-Received: by 2002:a17:906:ce5b:b0:a46:65fc:b0e0 with SMTP id se27-20020a170906ce5b00b00a4665fcb0e0mr7817151ejb.26.1710762490948;
        Mon, 18 Mar 2024 04:48:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id dk4-20020a170907940400b00a46ab207f68sm2360106ejc.134.2024.03.18.04.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 04:48:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3: correct upstream version check
Date: Mon, 18 Mar 2024 12:48:06 +0100
Message-Id: <20240318114806.3133095-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 11:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197305

This only needs removal of the custom setting (which no longer produces a webpage suitable for parsing the version out),
as the default SRC_URI is 'tarballs in versioned directoroies' setup, which the version checker is able to handle.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3_3.12.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.12.2.bb b/meta/recipes-devtools/python/python3_3.12.2.bb
index 61991cd8e9e..f837f05af4d 100644
--- a/meta/recipes-devtools/python/python3_3.12.2.bb
+++ b/meta/recipes-devtools/python/python3_3.12.2.bb
@@ -41,7 +41,6 @@ SRC_URI[sha256sum] = "be28112dac813d2053545c14bf13a16401a21877f1a69eb6ea5d84c4a0
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
 
 CVE_PRODUCT = "python cpython"
 
-- 
2.39.2


