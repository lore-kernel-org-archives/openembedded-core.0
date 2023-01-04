Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B34EC63797
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9379.1672830371113999238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkXplsLn;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id w1so20448853wrt.8
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4fI6MNnEsiNCgzojvXC45a01AKXWrd2Cn7Pcne0mCA=;
        b=FkXplsLnbPgwrvutQhllX7oQKuDD35uSQf4/gp1r42W2TJnvqoNhSchx0Ej9dLt4dt
         q1c5ZTzZZRWjGegAqhFdwvhZ+0QJlvGn+GPtjNQs2YzVxXXVbg7+1aZ2wk0ERqyrG500
         gEZgYzlS6XL/KjIeMADq53H93/VfkiK7I2ca7yHkNuqhhdo3+BoRStoRkJIJfxwUlqtn
         Kg8GXwh3a5KjeJlRSowWIMhgTT+kRIPJ6mrRK/+Ft63Us+XCODLSd47r493DqCtD1r35
         PecI0WJZ6fyKmv4NgQVNAyBoi1frSnrSrm/qDay124w8OWyI45tqgtOtXnBN4XGGfYTH
         69Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4fI6MNnEsiNCgzojvXC45a01AKXWrd2Cn7Pcne0mCA=;
        b=oD3lGYQRrX8coI/O7n+Qo3zkeGEDLFfb4ynE0sUmCtMp4v4PA0UsgjcR9rEz6fd7ap
         3Y3YPwt0bYWAG+Ibqeb7K9e7GfWDiCF3nRcF6UlsicV/9Gnct80jUPOw9cuJGLT5gWPE
         B+Qm2G1Y8RHoE0YVSzLYRETRDYKIsIQiF7dYkFlBSAh0m2g1e+PsvjMpglyUJSKuXKm/
         NJGUqEuDjEM+zVckRz1sQbasrvfahw2k3tBNNA9ihaUjHUn08aIWiLo56yPxhPrQdCzQ
         mdj+NMPBm6OWs8m+Pb+eNpShuqzdR02eE06Zwi7NWu1iblmOhbzZhdOWM1L+WeWAYKCc
         KoyQ==
X-Gm-Message-State: AFqh2kqC7ShHI1Io9vgkf9MwSkFCcPbpOmuHf/5qerbhKYrJuN0Mn2jh
	dT7iMOc4fOHJRnpARZ0/wLTNr+9X5l0=
X-Google-Smtp-Source: AMrXdXsaOSB4rcDxRVnV2SqWhm1hcrF/tcNiVQLKrLo8ybFW2NjMFy16xLoHJWmAYw36Gzh2fIQrSA==
X-Received: by 2002:adf:f1c9:0:b0:271:808e:ad8b with SMTP id z9-20020adff1c9000000b00271808ead8bmr26872251wro.34.1672830406974;
        Wed, 04 Jan 2023 03:06:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 71/77] repo: upgrade 2.29.9 -> 2.31
Date: Wed,  4 Jan 2023 12:05:42 +0100
Message-Id: <20230104110548.2537259-71-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175456

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/repo/{repo_2.29.9.bb => repo_2.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.29.9.bb => repo_2.31.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.29.9.bb b/meta/recipes-devtools/repo/repo_2.31.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.29.9.bb
rename to meta/recipes-devtools/repo/repo_2.31.bb
index a5a5c5ce87..27bb5d163e 100644
--- a/meta/recipes-devtools/repo/repo_2.29.9.bb
+++ b/meta/recipes-devtools/repo/repo_2.31.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "47020ba249c39783a66c0031fd9200caecfbbdc8"
+SRCREV = "a621254b263664efa308a645214d3d140e068676"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.30.2


