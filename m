Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D072C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:31:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.9772.1738146702055656735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 02:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YP6FhTCc;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeef97ff02so1104347166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738146700; x=1738751500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfpTQBUYRv0QWN5YhS7I+WGRbrDRDgkgKalzWJwsGpY=;
        b=YP6FhTCcLXRCtnQ7wNvhqqPG4ESua8vyznmzkHlERWdQBmzBF6DSsZYilJape8YSjd
         ZGF+6jqrhs4idp2a3YOFUXX2ewUropiQc5ZHOYbuWIpvswWQlsHlGZ76yyDR36ok0Xwg
         vXBorYmXSsuwFw/SZCvmlenhLYb8GUeKgqhg8KrLVsQXqA7Tb+kG7H5l3876KfvRFeFV
         ep0/wuVnDJ5I1A874LJY+yaegWKOnJ9XEsQkoZ+EBouUbm6xDoamdDtdn6fypD2DYyiH
         MAr8tWombb2V8GGPj/B+m8oeu2dx6FUt5q1U5U2bQ4sv7AF1kXou8zn//MF1LPxqFMQX
         gVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738146700; x=1738751500;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfpTQBUYRv0QWN5YhS7I+WGRbrDRDgkgKalzWJwsGpY=;
        b=sqzcfjTbASmzU8bFnGWg9sgQZUyB8R0atTqzDSo5ZmkpKYwhq8accXWmbASHlNGc9I
         cFT03gMygbowqLtbtSKtQDExsec+AzsROBQDay8/HesXYTZb6N38YAVzwvufD7V0x2Ac
         oueS8zBPo67zrDLJSYp49RuItj9wJSBHGPnG/4CCdyW3nnFzl5pHRFcQNeOmzdpyrOue
         CYkqg1rfrXlLQ8a2jkeP4jUrJxOUguEmoZKtRyUuUROOPgSPH25tCGydHIRjACXc9Kbo
         bWIBz5uwBae97/dq2pieEg/QO0nR/tFI+TNiw4tqubylX/uhaP3enMRDsIvuxPUDoZaH
         Xc3A==
X-Gm-Message-State: AOJu0YzRvoFDwafF3+orooy05/Hejxymyc2X8Ypee4hXL1SS9LDhKDe4
	ioyqKJZkIpaUTlP4pW+A7er83KdZbgrRXkPIBiFVIB5mJIVHjae8eQHEiw==
X-Gm-Gg: ASbGnctF9mBxkvM+lC48zuzgFMwPINWCmJFexPWSmI9GUnhx2E6mkYhZ+TU2wG6+LLO
	iHFoeZKFE22QyqUd2f0TBOy/SGvEfRDz4RMYdYfdbOkLwLkfi+i3iDFNCVFk5U3EAln1Fx/lJLd
	I8ADQUELycc+6fprrz3oclyEPBY/IroBpjrajm/GOZkQRCdwOXkSSe8Ga5i67dfexkvjgcp7Kvb
	UT3x8CwCGdtgmHJLuRg7KirIfKfjFIBec0n5Og4NWDMJRGZRmRG8oh3ZauRly/YpvVUE4uemjQE
	+lGjxo3Uru7QpA6wT+Zhp1hz3ZRvU8PQ
X-Google-Smtp-Source: AGHT+IE1icyN7FJPICgEq39ZoLAQ3ySmUlbk7b3HW7WemJ4qPP+LDRyCiUpjnS81H8i6I4+VZRWErg==
X-Received: by 2002:a17:907:1c1d:b0:aae:b259:ef5e with SMTP id a640c23a62f3a-ab6cfba9d90mr256922566b.0.1738146698692;
        Wed, 29 Jan 2025 02:31:38 -0800 (PST)
Received: from nac45008.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbf43sm941662566b.154.2025.01.29.02.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:31:38 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH] webp: update SRC_URI to use https
Date: Wed, 29 Jan 2025 11:31:16 +0100
Message-Id: <20250129103115.3712961-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.5
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210363

From: Jermain Horsman <jermain.horsman@nedap.com>

As the certificate is for *.storage.googleapis.com, update the
URL to reflect this.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-multimedia/webp/libwebp_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.5.0.bb b/meta/recipes-multimedia/webp/libwebp_1.5.0.bb
index 1ca564f678..39fe947eea 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.5.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.5.0.bb
@@ -13,7 +13,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
-SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
+SRC_URI = "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/${BP}.tar.gz"
 SRC_URI[sha256sum] = "7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
-- 
2.39.5


