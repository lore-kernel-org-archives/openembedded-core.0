Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1FEEB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.7507.1686734999349219483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EKL8Qfz4;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9786fc23505so72695666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734998; x=1689326998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/pxb8AnNsKXxr2v5hMhkdemY9FErycqb+InE6/ZycI=;
        b=EKL8Qfz4VjDCYsXQo+mwq2dbXc92iPXyztKGY3wGfgqlsFXO8woKWZ2wc8MhkZcdHE
         L0aAUn/UU/XRhEAISBgd9x9qAXHwS4WmIE4PrK78mTYw3bJT4sEygmybflR7b1OXjohh
         VHMxFl4+wKCc3BN7rCwOCA5qGVEKWR+68LkWLcJWkPEi1P4x2j4y+X3pXFAdxbIjYf/N
         QnX2ZipRg0a1K6chUVBZJm5m9ma4SS/cIP5E8TRfmLvfk/Kwl9UtWzAwwBBr2h2gs/Rx
         c1SHu942uUIitJ17HMKlNZL4+K1VyYWFneyzSTpD6Ndcq7UJvwxJQNZpeXydcEglt9YB
         WB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734998; x=1689326998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/pxb8AnNsKXxr2v5hMhkdemY9FErycqb+InE6/ZycI=;
        b=L8jaJjFHxewhPPI8E+wQyQrPMpTuw0a606K5VPoBotQqsWinWV5IFNN5qXpzuy49ac
         OX/j/8fDWO9kaxguz+mFF2GrDQo+ZMj+sHnj3D556YaxQUt+ohcSanIfQyqWyQhGA6Ew
         wn60j1fXGKXIBPz7ElGDyuY7DQCqkRD+/iYeeK9AvgR9vvpurEx94ZuzowVAPr8afiwM
         XifVSsNLU96u91DpUSGUFRxwKX34AIi1x0stHeo658FdiMLt5jSGPc+3mBrBvuH08j2Z
         LjYyvg0pvMmiJNtYPf4aHGuZeeZ23nd7wSSqRquieYWUeQvPMfBu+p86qGs2v8D7M57j
         reHg==
X-Gm-Message-State: AC+VfDy0b+oe/iAIbwaoNmd2AE53XT63h9WrRKLU1052wmzU89D+rbrm
	3djYSO2P9tdONRpFfOYMo358UYdmVzk=
X-Google-Smtp-Source: ACHHUZ55Y2uEuQSHPGVNQilRxRfXNn9mafxrtkFYpNC1XY2OlZAcZBCdZDq1OlGwJ9jH23tRZqapZw==
X-Received: by 2002:a17:907:a02:b0:94f:7edf:8fa1 with SMTP id bb2-20020a1709070a0200b0094f7edf8fa1mr15248509ejc.32.1686734997560;
        Wed, 14 Jun 2023 02:29:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 55/55] zstd: upgrade 1.5.4 -> 1.5.5
Date: Wed, 14 Jun 2023 11:29:18 +0200
Message-Id: <20230614092918.4065570-55-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182800

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/zstd/{zstd_1.5.4.bb => zstd_1.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.4.bb => zstd_1.5.5.bb} (96%)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.4.bb b/meta/recipes-extended/zstd/zstd_1.5.5.bb
similarity index 96%
rename from meta/recipes-extended/zstd/zstd_1.5.4.bb
rename to meta/recipes-extended/zstd/zstd_1.5.5.bb
index c2e96225e44..487465b6c70 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.4.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
 
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
 
-SRCREV = "945f27758c0fd67b636103a38dbf050266c6b90a"
+SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.30.2


