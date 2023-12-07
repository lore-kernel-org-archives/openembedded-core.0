Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB29C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:14:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.107156.1701990831597318382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PhugnSWK;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so11495575ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701990831; x=1702595631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKmgboExTACzl+VEc5YWJcp+l2q5Ax4zahEE19h6AQ0=;
        b=PhugnSWK0/bdE4NNmLGX9meAoFO+tgAuCqko4+dfd891PIave4wjJDY/H6o/9C4O8l
         AmkDfA9vUeALaGD3m0tdFBnuzSJpRdVyW9ifuhRHj8SdONqBUg9zfLbGS7MeC6L7U10s
         mVwbCeFZdpkObtm4FR39wi2Kz6Cr+r0fAIychgLe9wjiQmcwTSKPPNJYNTFvd/bZG37s
         Cx2/+dHRtWg1WQvc1pJ0h83PrAOMpmzgqd0MlFirLObJWfeDpd8RM7gR8JairU5NMocE
         sSEUGWX3Tg/XJRjN47WGk1LbhyYkGjm6mL7C6PE5bSQ7qbd+fcrme46GTMKMU19erz1v
         roYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701990831; x=1702595631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKmgboExTACzl+VEc5YWJcp+l2q5Ax4zahEE19h6AQ0=;
        b=qBkMceA15E6vWFv/qPzzPriASFRPQoNadbVCeaXkBPpyybSs2DN/rh0PhOBDM/lxPJ
         l43Jd+3VMiQ4eppf+DFmFtwTcPl7lJOaUI9NAe/bJNmNymBmboAS1JOjOKHZJI3Gr8Gy
         bL69rZr4O6wUHNOC2HEeZnsGcbt954PVPn+zp1Y5HUAFv/nv4wuiderSJxc4htji/f5v
         4XBUOf24VgzxMDgaaqxd+wr+sHLzcm3u3EMPgxYt/L5jSAr6XFEuM5ld6WZwjOhArZyJ
         kH5raMuJyiE18FJFGuI4FdPz94knM6vD2O7urLuYreVYLjPtgaLXUcDfIW8AQ1Zd4APN
         BFEQ==
X-Gm-Message-State: AOJu0YxZPK6ZCAQuBBQ2cFa+yMxBdsfaFHYxAxbfYAZhA0ENH5RuqKEL
	ccEEUZ1WWqkiXmpxj6KBZq39uj6+WRs=
X-Google-Smtp-Source: AGHT+IG28W3j1zN7TWUlixKxlR1AlJ6Wo01muQ6u6H54e1vfyH+eBJqav6rniCpUqyGmIlx5g8HGbw==
X-Received: by 2002:a17:902:c946:b0:1d0:c4af:4628 with SMTP id i6-20020a170902c94600b001d0c4af4628mr3633749pla.70.1701990830649;
        Thu, 07 Dec 2023 15:13:50 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001d0696e9237sm349695pls.118.2023.12.07.15.13.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:13:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] python3-setuptools-rust: BBCLASSEXTEND + nativesdk
Date: Thu,  7 Dec 2023 15:13:18 -0800
Message-Id: <7450c0715e58e76f391ed2dee2ed7aeb4e7a307c.1701989368.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701989368.git.tim.orling@konsulko.com>
References: <cover.1701989368.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 23:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191982

We would like to build python3-maturin for nativesdk use
and nativesdk-python3-setuptools-rust is a dependency.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
index db5c6c449c3..a91ee23ca0c 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
@@ -33,4 +33,4 @@ RDEPENDS:${PN} += " \
     python3-wheel \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


