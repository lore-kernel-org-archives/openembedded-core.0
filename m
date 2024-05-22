Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00589C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 04:40:17 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.2503.1716352814413266914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 21:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YNRwGPmN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.180, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c9b74043b1so2862364b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 21:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716352812; x=1716957612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1uOneFjebmRnu9Cb6pK5R3wKIzpUz9a34VoVk+AaArQ=;
        b=YNRwGPmNhg+MoXo2KIZPhfAb3cJzs1nDd/4zyUPLK2oFO2mHuZwwOSIILHMDxbmWIx
         Uk576KJTkrJOl6ZZFEyxxo/kdBVxqK+LoGrKX/yT7zekoO2Bcjdym3I69Fa4Uw3tbwuH
         oauDhJqG6zUnaSKs7qKeVBfZUJPeApP6zJlm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716352812; x=1716957612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uOneFjebmRnu9Cb6pK5R3wKIzpUz9a34VoVk+AaArQ=;
        b=cvpRwaD5au50QP3EpFckQmYYwyk2+tZ5IapezF0wMhztlBItanKdecBSk5f2BoHsyo
         keoBLCXCuUuFLxQvNdmRoS6hpGDe2q8d9jYfv5Qnj+7YHZr6u+RjxyBbjeK7qU+tEgul
         tIk3ORa5QPZoPzXelEs/INrny4IgIkNRXjTacJIG0gqu+qusIknYesy8LmQ93KxPSOS6
         pCyOVkYYweATfPrnF0dHyIBERWVnzxcjzj+WmpawoY3yp2AIweu/e9C7cpjYgvMSzHk5
         dKjBaOK5pPzwXhQ1nz929asOpXT/Xp6vM9Qxh8QtPu4ZcgAUc5Cxm54a80dNNPiq8/Dc
         byOQ==
X-Gm-Message-State: AOJu0Yw+3POT6KxiloLSIlx0O2hg37vZbY+djFnEru/op5tNSpiKFXse
	KSEUwbVQ/DD8Cfg1WxvRqr96IuvZ2P++lGWLUNueaUqlXSFRIsRwQ5JBKd2tWsWWq9HpEazvICp
	I
X-Google-Smtp-Source: AGHT+IFG1egiHmX5N9xGNytVhzc4GPdwLoZAKmqmtA6KGTzur/M+lPcadhuJvZX58eU/w6PNxNDL3w==
X-Received: by 2002:aca:2815:0:b0:3c9:d067:1de8 with SMTP id 5614622812f47-3cdb3f585bcmr936559b6e.31.1716352812609;
        Tue, 21 May 2024 21:40:12 -0700 (PDT)
Received: from hd-yct-laptop.pdx.yoctoproject.org ([97.115.187.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f694647472sm7824282b3a.199.2024.05.21.21.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 21:40:11 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] yocto-uninative: Update to 4.5 for gcc 14
Date: Tue, 21 May 2024 21:39:30 -0700
Message-ID: <20240522043929.26731-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 04:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199682

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 4ac66fd506..657c1032f9 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.39"
-UNINATIVE_VERSION = "4.4"
+UNINATIVE_VERSION = "4.5"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b61876130f494f75092f21086b4a64ea5fb064045769bf1d32e9cb6af17ea8ec"
-UNINATIVE_CHECKSUM[i686] ?= "9f28627828f0082cc0344eede4d9a861a9a064bfa8f36e072e46212f0fe45fcc"
-UNINATIVE_CHECKSUM[x86_64] ?= "d81c54284be2bb886931fc87281d58177a2cd381cf99d1981f8923039a72a302"
+UNINATIVE_CHECKSUM[aarch64] ?= "df2e29e2e6feb187a3499abf3b1322a3b251da819c77a7b19d4fe952351365ab"
+UNINATIVE_CHECKSUM[i686] ?= "8ef3eda53428b484c20157f6ec3c130b03080b3d4b3889067e0e184e05102d35"
+UNINATIVE_CHECKSUM[x86_64] ?= "43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473"
-- 
2.45.1


