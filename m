Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B719C54735
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.9394.1724319341108086945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gSMZDdzs;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so795440a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319339; x=1724924139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez/Jdaw12O8c7dxHST/0hOwV1jOhl4dtpA2CDuNbk1g=;
        b=gSMZDdzs+NQR3058REWmaO4VlbXjtvy7W3TjX/bg7LWnJWrBV19VCz4nw0THTjDvgw
         q9I2/kDZjrgJY5d4J8MgILNpqSUk24JuCCBMEtWAUNisM/CPGQf8022jKnol+rfhQWar
         jKsKgrI+l8s3fhM8aQhlS5n1D3hDNIw5Ts30TweHpLPYIj8QnsbPhnHNvUebTO983hLc
         aXDAjUfTWaaz32LUFN95W0HL6jkdWF7b8O7w3zqriA3e9NT/bf/KRPdxOFT1Gz3LIHWc
         1xU8Ny8/vTTEYwGKu8UGRSrbpsGveDhI2qVXn64nPg3Aa38QPj5WwIs95lbK+RntqsC8
         USug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319339; x=1724924139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ez/Jdaw12O8c7dxHST/0hOwV1jOhl4dtpA2CDuNbk1g=;
        b=syjN2pWy/bCjm+L3xEGyKwY/+BMe99wo7WmQ64pO/ophVyq3i6gMj1wmBGcdQM8454
         2H5yINNPPDgxwp2p2BcD9tcPq/k3DQFKGJNTZnuaSEuWdGXA2m5pc47BWJ9k8pYSXENv
         5CuhngME1hwfWI7nyckuGMcvGV3ix2p5pydq1fTPEiPpOsOEtZYleuWXRAXqDkZCPIXB
         JVYGQ2plILLUTDWXFMGj0/T9cSP//M8YwGrueHVfMxHkayuwTrJZ2W6hCROtD/egjE/v
         GCWnyJkY23+XD7sqHU0x4RJmXHVCvJ8OXgFN4Jp/xk1O2mRJRw20DdnhDjxexhcRZuMT
         PBQw==
X-Gm-Message-State: AOJu0YwVj9pA4BTpDj16KIoJ/me88f2NwyTs/Z0hCt8IAYizSCj72ghP
	+uyU0Qsk6637IP89Hevoln2HQKGE07J0rtIuw7YWXtnWRcbPqA9/5RcfXw==
X-Google-Smtp-Source: AGHT+IGW2vsvo335l83QB80aHaQsLzMASVdLOl3bSxCpXqsuocun+DJmAtM6ICFk+HRp+UYnxPIitA==
X-Received: by 2002:a05:6402:448e:b0:5a2:8bef:c370 with SMTP id 4fb4d7f45d1cf-5c0791feae3mr705949a12.15.1724319339215;
        Thu, 22 Aug 2024 02:35:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/32] nghttp2: upgrade 1.62.0 -> 1.62.1
Date: Thu, 22 Aug 2024 11:35:11 +0200
Message-Id: <20240822093521.36790-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203637

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nghttp2/{nghttp2_1.62.0.bb => nghttp2_1.62.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.62.0.bb => nghttp2_1.62.1.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
index 5a820d8cd5a..8ab6b17feb3 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "26798308fa0a12dabdb7ba8c77f74383019d3a0f1f36d25958b836af22474958"
+SRC_URI[sha256sum] = "2345d4dc136fda28ce243e0bb21f2e7e8ef6293d62c799abbf6f633a6887af72"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.39.2


