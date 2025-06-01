Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7814C5B555
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:50 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.37014.1748816805954317109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l8i3kXvH;
 spf=pass (domain: konsulko.com, ip: 209.85.216.66, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so2603797a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816805; x=1749421605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qubK8HYrm1bFU2n+/Gj1AIK64oFlSdvzHygJjcp+u7M=;
        b=l8i3kXvHmBL2NoSiKpdOONLM9mDf2cl4IwFf6rbNWEbZI4HAmBBnLnbVjM0wfraW7P
         SB57KC4JbcVskGN37WkcWAkvRI+xUnMKBov1ymaWUuaSvIjLfF7w44sl3KeII4ZOFw69
         rM4jTHPaplsR1fCV34HknpleaxYbNotvD4CnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816805; x=1749421605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qubK8HYrm1bFU2n+/Gj1AIK64oFlSdvzHygJjcp+u7M=;
        b=q/bwx4LB4RB5436pQeQpzG9bQCv7XofO+oZMO0nxI+Es07DGH2YZG8El7ZBsUuLwNw
         29Px1suyQ7GuKmeL5FTnB8KEoI1T7s/ejO7l4y9iU++zinkPsLdr+I3skJeH4z36huMu
         tekSmVTwWLdHYrlK5bmM+rHcDboKfUE2XePx6O3Y0rROpi2LALPPLcXAXYavB7ciHNxE
         4Evxb5SCdf6tPCIqUwPP5X8cWiVYbYiJVgTyW8PmEeVyxQdkYfiPYOngVKKshRNukmLp
         liOiAl4/bByDMkk8D/qPWQQnk1/xDvS8Lc35fBdC8xzwQ4id5CW388npQy1j+zjJRsvm
         8Z/w==
X-Gm-Message-State: AOJu0YwYg9jPSbZJtRF6TUPpeK8BIyl80xSlSINGsh66KdDy3HzZcRRl
	47i/uFXaUyWgui1PZzNLN1q9fJV+JwvJZVzZjE1KjJJTVUhJ/doFtn76adLIBLokpOg43/jrTnT
	cBI5ibAf9NvNu
X-Gm-Gg: ASbGnctwM1+DTZNdLZkVNTw8giEQ3AvDLVtYm9FjQUs4uvbwfxPxIaB0tnodKroyDPQ
	rfrfnxxNOWzM9FR2vm3+EUyfl1SIG9GeIH2kULGCdvFSKXqTePwlYfo22idIpx4Cg6mGTtl//BF
	0WHtgPHST7lBrn+Z2P5avQNi4ar/vyHjXTIiunoQ3yAv4jZBQAHn1Zv0uc+6Ylco6U9NnibXp/L
	Qz2CXWX0bV4h2DU8TQaydGMNB0Z26aRhWLk24Wfxq5oumFPHc5nJEtG77m/AzTIWd7ht7m2o2Kk
	xbauiuULx1L2nooZv9wYOr/Cq9mo7fr+Zw4XpiXIqHOf4dvWa6oFR4PfXYt6UTW7O68EWMfAkZ7
	rpzj1It08ie+fPo6wCC5MQUZ7yg==
X-Google-Smtp-Source: AGHT+IH4tk3Cz4CAc6RY4lI1aQxMW/fVjpe5ujDn0v/ZMWqJWaMgYEKeE5bZEZyeZRcmpLV1q3ow8Q==
X-Received: by 2002:a17:90b:35c3:b0:312:1b53:5e98 with SMTP id 98e67ed59e1d1-3125049b92bmr12024560a91.34.1748816805035;
        Sun, 01 Jun 2025 15:26:45 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3d2834sm4455113a91.43.2025.06.01.15.26.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:44 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] python3-snowballstemmer: upgrade 2.2.0 -> 3.0.1
Date: Sun,  1 Jun 2025 15:26:21 -0700
Message-ID: <a9f5afa4452f8d0d8b248e568dfa3bb578fe0249.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748816484.git.tim.orling@konsulko.com>
References: <cover.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217686

From: Tim Orling <tim.orling@konsulko.com>

* Change to setuptools.build_meta PEP-517 backend

Comparing changes since 2.2.0:
https://github.com/snowballstem/snowball/compare/v2.2.0...v3.0.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...wballstemmer_2.2.0.bb => python3-snowballstemmer_3.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-snowballstemmer_2.2.0.bb => python3-snowballstemmer_3.0.1.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb b/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
rename to meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
index ff120a3fc48..37cfbce7dcd 100644
--- a/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
@@ -4,10 +4,10 @@ HOMEPAGE = "https://github.com/snowballstem/snowball"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
 
-SRC_URI[sha256sum] = "09b16deb8547d3412ad7b590689584cd0fe25ec8db3be37788be3810cbf19cb1"
+SRC_URI[sha256sum] = "6d5eeeec8e9f84d4d56b847692bacf79bc2c8e90c7f80ca4444ff8b6f2e52895"
 
 PYPI_PACKAGE = "snowballstemmer"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


