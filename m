Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FA0C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 16:45:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2065.1787589949862189197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 09:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U5zueIBR;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc61541f8cso1042965ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787589949; x=1788194749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEa4nIuszFeoSjj/AeKm+z8+LpUHXOREp0+8ZZHOZNM=;
        b=U5zueIBRVoC7Fw8FATo0PMglQZo0Ker5DZYpUJtHxilSXHCdJnQyqAbsTB3lCZ8nu6
         1eFNrSe3pe/L/zMTrAPubGhJ0/kbs1W69927bgF7qjkNvfMf4D+SrzmIW3d5CVAw6Qs2
         e7tFPBvn+ccvVzn23ZNamPmNzja3FwXJO42nb8w8Qba5YgJ5C9QAJFXwyb0gi+qeb+IC
         1cZKtdszRTbYOV2d2yiXqAWCZHTXmn4eFkuNc4yL7zNWiz6WlcxfSQpd8fNkg+WglO+K
         5l6pRicmWApxqkeUNZ6OAKNX/KB3b56VhQqBO3R21bayyYiheKKxw84PzWupHMoHwefR
         6Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589949; x=1788194749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEa4nIuszFeoSjj/AeKm+z8+LpUHXOREp0+8ZZHOZNM=;
        b=W1FhoeeAI0ecI/jY9sUQgsm8eFitCsMux51ll9/RwQkr+d1NqSWetrSBnH+pTvf6Oa
         hPJXBP8gyfJfP7zZZGTF6fvbzB1Q1w5zKQEedle0jVKf8hLlrBQg6D7o7Xukv5QruFzC
         QsFeasQ6/tdmPncJVKLQ0PPrXq+tdxCE0VKc8xnfbFSlYw4csqIBGFjyVWYVunu89X/r
         R5s03xEMFchMcR+046ziTHDAhfppcc0wSARVaOxh5IhIl4XhBwmmN6xJk7Lb5UO2eynJ
         AictnuBv4ov6udn9rE8dbr0eGjcqt+AKrxTcV9xQwO7p2q9UVb/GxTMsK2kWdNOtX8N/
         V2dQ==
X-Gm-Message-State: AFuF++nKYhY3ncL5eyDwMLnBs5IOcrcyTSZEeajhcnE9jHO1IqNB27d3
	m4P1ASraoeW22sxraYwVoBmSHVuN2hmvWfb4NSLFCUj1jHW7FCO/wox1n0nChw==
X-Gm-Gg: AR+sD10Ia99pRtqBfXNdX6Iuwu1j+2+adLDiHYZLJ0d8FjRYIMfQ5m3U8KqY8hy8sDh
	AtWFwdV3T4XrC5BTL0Rvc9dUFnHyP/C89Rj20bpKEqGiXHMnXTWZftzhqdGACYIs1F5IzHo1n8W
	bSDTAblyrp2mOTgQdzS72oV0vBtCfXviBztRqzW/UwUS4MNVsok26ysvDNRkqFgZhbFvV4j87Z3
	3cSmpl+KRsIWoEXvk5Hxk940um9ovLTuNOZLzF2EBnKSXD/HkbsOBX5OYogypfkWh43HGZrFVzX
	mRtYy/+WMeAUOiQUPXywEw+IDC1cemuXqWln++35b4m9XiNL+firViFpLc5p3RC5FUF+hJPtUhZ
	k41B7DHKH/9ZOMpj6C5aERQX4HWrBHmUV352/BDv/b3c9BAH688HUGrdGDCeGfdjFg/kRt7oktr
	igVsoPKe0ud/XOAfmqfkPxKFDK5EvqrVPWFl43oEY58amTJYKKJTRO3DkMGZp/MEfsAzcvvlNOT
	3stIVv+LGOfPya84jAclTc=
X-Received: by 2002:a17:90a:da84:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-3964595f81bmr747715a91.7.1787589949008;
        Mon, 24 Aug 2026 09:45:49 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm41861615eec.30.2026.08.24.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:45:48 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 3/4] python3-git: upgrade 3.1.58 -> 3.1.59
Date: Mon, 24 Aug 2026 22:15:26 +0530
Message-ID: <20260824164527.296576-3-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824164527.296576-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260824164527.296576-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 16:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244141

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

- https://gitpython.readthedocs.io/en/3.1.59/changes.html
- https://github.com/gitpython-developers/GitPython/releases/tag/3.1.59
- https://github.com/gitpython-developers/GitPython/compare/3.1.58...3.1.59

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 .../python/{python3-git_3.1.58.bb => python3-git_3.1.59.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.58.bb => python3-git_3.1.59.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.58.bb b/meta/recipes-devtools/python/python3-git_3.1.59.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.58.bb
rename to meta/recipes-devtools/python/python3-git_3.1.59.bb
index 82c8076a97..92e5977789 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.58.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.59.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "621416df10ef3fd0e19fabf9172ddeed0fa704d353d04f194eec56a625a95b22"
+SRC_URI[sha256sum] = "0a1475cfdc38a5bfba1a3e9a4a9da52a39749ecec322b772915c019f94e5b7e4"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.43.0


