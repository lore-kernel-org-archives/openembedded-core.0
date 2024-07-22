Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD7BC3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 18:10:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.25049.1721671836222287291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 11:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZArmlptW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.43, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb576db1c5so2262047a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 11:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721671835; x=1722276635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oy/BO0eayLoytxuL71ZIxBBOR+gdfUKzYRPEcAFQzz4=;
        b=ZArmlptWzaCTHcIN9n1CWDocAYqfABFHWXIp8coI+UafMwdYK4LqpqjbHo4VBsu6xx
         Jybh2wxd+kwrDIT2dT9/vsNTypXEChm6novJtRae7Kw6NmyH9CU4/N7AL+WhtOGoDnM7
         DN/QMX9Pr1nlEu78PtQNn3e6Dfa1GZLvHS8nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721671835; x=1722276635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oy/BO0eayLoytxuL71ZIxBBOR+gdfUKzYRPEcAFQzz4=;
        b=pI3a6/Gd22G+0mt7Y0kyvbAOb4Otm2T2VNW/Ijm9cSaakdHjYMwJSBa0CSd1EO8E/M
         Qcn2XnGXrHIQzAT1K8JZ9bbqXct8vCxAsdE39sF58LnGnzGhliDE0C5pLYM5fRdk7lkQ
         bINEGe1A0RdkoqGvv2VAbtCjuCXbN84YzwwTH4xtyU54+7gWCCV+6ocllqu2/TN05J3E
         6E5AdXmPgfS5eoe1fbmoHU9wNa7OAEdYyyC8l/nEMAisfnUpBl1JXS3PEigtBe83nR0L
         +mNEA2XR/Qa81bVV4SznRyZvgvbwmjnnjBmfF0v+UmM2Jht7atEAEFuXlF8PGjPsceVX
         vSlA==
X-Gm-Message-State: AOJu0Yx5ohn2rh2+m4NzQmVvOOWypTbyVPIaEP/XJvjzCFHcij7VLhEx
	ik+AmYB49NwC5fKURSmwbxCKsLGt5Tt6it6N5QRn/V94tMsVNt4Ji42xcl/MJqKwdtFSxvnjvFf
	lhqBNfg==
X-Google-Smtp-Source: AGHT+IEHCWMzzrDiEifSs5JDa2vA6Fk337JWt/yxFXbRt7CUopYBaGS6YU6BEmRG+B72rooxNPKWiQ==
X-Received: by 2002:a17:90a:db03:b0:2c9:5f45:5d30 with SMTP id 98e67ed59e1d1-2cd27439081mr3680973a91.26.1721671834546;
        Mon, 22 Jul 2024 11:10:34 -0700 (PDT)
Received: from hd-yct-laptop.hsd1.or.comcast.net ([2601:1c2:c181:f910::ef7e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7c76fe7sm7332870a91.33.2024.07.22.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:10:33 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] yocto-uninative: Update to 4.6 for glibc 2.40
Date: Mon, 22 Jul 2024 11:10:04 -0700
Message-ID: <20240722181003.73353-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 18:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202320

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 657c1032f9..a6f7107dfe 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.39"
-UNINATIVE_VERSION = "4.5"
+UNINATIVE_MAXGLIBCVERSION = "2.40"
+UNINATIVE_VERSION = "4.6"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "df2e29e2e6feb187a3499abf3b1322a3b251da819c77a7b19d4fe952351365ab"
-UNINATIVE_CHECKSUM[i686] ?= "8ef3eda53428b484c20157f6ec3c130b03080b3d4b3889067e0e184e05102d35"
-UNINATIVE_CHECKSUM[x86_64] ?= "43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473"
+UNINATIVE_CHECKSUM[aarch64] ?= "c2d36338272eba101580f648dd8dff5352cdb4c1809db7dedf8fc4d7e7df716c"
+UNINATIVE_CHECKSUM[i686] ?= "0041584678109c18deca48fb59eaf14cf725cf024a170ab537b354b63240c504"
+UNINATIVE_CHECKSUM[x86_64] ?= "6bf00154c5a7bc48adbf63fd17684bb87eb07f4814fbb482a3fbd817c1ccf4c5"
-- 
2.45.2


