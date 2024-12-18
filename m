Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF4BE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 16:49:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.110174.1734540553610323497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 08:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ExHblIrl;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so10298329a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 08:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734540552; x=1735145352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLHF/iwg07+xm7K+Qwk2RjZRnCynhz/Nb+mMgh4yKC4=;
        b=ExHblIrl72CAew1kQse766srlpb3RD4W1hB6GR2Pq4+Bec17xTNBteKAStqjXAk8HA
         vTjyUT6JRf/xctNEUoyFlleboCqr9MVR35UtI2zfCojYSHrRa0mdfrBLTxxV7AjHIF3X
         UbaKEvviH6GUvZ4J3oRtrgpAjgPkbgxrOXa29gkEmbyxnnfvgNENcys0ANZJpSrQcBBb
         gIzL45g5goL/ij15fz+FNnKiQJ3rv7rqrEcMj+uKZ6abwDKzpUJeVaxl8CIEZxZpfMAY
         IbfjRviFDNVTa8r8dilHI5rN1dXL0YfpKFWsundfFw3PjgvZ576X6mPfz2jluVEtXIGI
         pgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734540552; x=1735145352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLHF/iwg07+xm7K+Qwk2RjZRnCynhz/Nb+mMgh4yKC4=;
        b=i5/0Y6sy0wyEsde+TXhNU0p+z6kP6YBV+byqKHC7aIcyYIrA97Eytb6/UvoUX1tT9v
         QjRMKmvbRLJTOyVN2LCdkyNqXcaBvB0+rCTejOLAkBP+DoZ37PA21gBEO2ltmiMfLoS2
         WE5CKS/JUWsuKrXOyZQP+IcqdwwYrpg2oEDuGP+QnfBYGa+1E+oSUCpwDdTppHWl6gEQ
         AyxHBUnu+EDgt+BEnZsxWi/jFk+on9zy31b8vHDlg5yWpapZ3PuEk0ByDgIXVhcuaqKV
         dW/3wqYeR4NzyxjQOBs8x2JdYY44QGVIFQMwJqxjTTwTfuVpYz9ef4m3IjqEUV1EXsld
         BFcQ==
X-Gm-Message-State: AOJu0YzyZZOIocZmzwr8xB54PTZUrxCSEYtsp+JJemAGwnLxiy3nZxFi
	A2gaoonk0M1oF4LdomGJ2fdx1kX05pXxMu7kO6v6y0GAaVUFSpG8KxnYpg==
X-Gm-Gg: ASbGncudvx5ofJ/BJ1zRuzed2BELre9lAAYjIBEFPLTlJWt4+IS7PZMzsdcpasnBULF
	R9Zft7KrTs4FwfXEuOm/Iq+NjymX53iUkJjTwkvr4s8qby4R0oSTf0KwIxJ9ZgTMx/JDIlYsIKj
	er671p9Ro0RgueyLaqOx5soUWqJQ3RJ4loIWehWrTENlhoO8GwIrNePHlXc+AwTi6WBfBh70Bjq
	FutUpPSZYHXE+08LPuID70zQiue0xgJ27Zh1bX9SS4vjfhdz/RGdHi7zZApk8GJGYKbiXh1hGwA
	5ACTJaBiPZR62n/N0Q==
X-Google-Smtp-Source: AGHT+IFAVCQXXfLE/P6Ar9ZTfYscFTadWOkrA5onrW371APJ4AYmCu591OqqNOiTmny1m3oo4LD6BA==
X-Received: by 2002:a05:6402:13ce:b0:5d4:5e4:1561 with SMTP id 4fb4d7f45d1cf-5d7ee3cc674mr3416148a12.20.1734540551565;
        Wed, 18 Dec 2024 08:49:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35838sm5499635a12.82.2024.12.18.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:49:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3-cryptography-vectors: correct upstream version check
Date: Wed, 18 Dec 2024 17:49:08 +0100
Message-Id: <20241218164908.2750900-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 16:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208874

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-cryptography-vectors.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 02d10dbfa73..b9b3d5f314b 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -12,6 +12,7 @@ require python3-cryptography-common.inc
 SRC_URI[sha256sum] = "ff6a885265f484e8907277614b73e9c774b01658623ad763dde2858188e486b4"
 
 PYPI_PACKAGE = "cryptography_vectors"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


