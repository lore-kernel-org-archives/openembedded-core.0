Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C67C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 12:47:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.11289.1738154866537789714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 04:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eiNUNeyz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436345cc17bso48852885e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738154865; x=1738759665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaaMpLqLPeER9sZGHDxQY830Lm9DHWw1oFk62RVMFYw=;
        b=eiNUNeyzz7pMmFWoqNpccz764rbUq9CURwHuBFcgCbLnRvGyJClRi6Uoi6GUtCzOKr
         mOVAmxf3g1KfEhTY9nt490iV82sWDOA28T/6+5OsXJRIIc02aDKu9XX7oAuEwPHqRD0i
         Cr+noDdoScRaSThD6WtVoxfxE1C7X47D9bg/QeeQmjv1x4UByo7uG5LlDjZY89nLQ7FK
         yQKYUD+7sp0CVVpwmmcWs3tzf/rt7P8nweAfoy2aRuvIqsyqct8X/fOO06teBNYBqB9Q
         eUzY3n9V53b3uFcrQmrrGmUxA1jps4zUrxEsY7uGt2Fys05I124k8OfQF0lhjLY/4QZo
         oibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738154865; x=1738759665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaaMpLqLPeER9sZGHDxQY830Lm9DHWw1oFk62RVMFYw=;
        b=Rgq3aRGYSHu7QbrEiPCTIgnWRwZH6OV5Kha8aJzAgNSIhXTvs59n5Gk95av3/lWEAL
         QEJ8Dv/qF3tPPaCgjket3jXghVvmNGSHsFNT+Pw3PqjYvtSM47X1FXTF63SvuZ82td9i
         CB9KWCwYiQDfM+bUl6JMN9UR4AiFi2d4cQB5p3wzU5OheNhFigO7Tiix5gR1OwWSOEJS
         g7Z39tGOCRpV0mECLTrRgy9pSIE4RMH03vV+WTFcsFYmR2D8PP3XSzv5in/fSRy9o8vB
         i2+dmhArkr9W5gdQE65KnlTY9kOx4+mXupTNjIXSUZbRMqSTjx3uDpBCZTzJpBMUD8B3
         treA==
X-Gm-Message-State: AOJu0YyPdP4XwrCdgoV1K/lovcoiAb/gmP4BDETVHcX/zbhcFD5+U+xw
	01494S7JEbjo56VwxswvVbTJ5oXFlMl+uBQwkPDJmPsMADHoxpNMUxqh1A==
X-Gm-Gg: ASbGncsevoJgNYFC0z+BQYDR7h6C1A3zihnAbq2n412zBjRKQyk7Poe4Y/f/oZupSyU
	pwxmZQc4acBb0JU6XjpEKF6IktbJyLLCO1Ke58un0JYd3FJGgIA8J0PoXjfc09B35Z3h74LkqZq
	uL5MPmRZw38Hxki/fJ2dpu8M0cd6BiPpkExQZ9JWZPjiumF/yS7KtSEJOKPyC/ftKkhdM6WHGR0
	GXVtLSXq634grAe8Zx3yJThtISOloV7ikoqWRGR4X9b25i60yay93XTZeJRtBH2u2HfS3VaC/PT
	RpVd96SCrS2VNvGiE9oh/TaMGzCP2zRCZdojJl/DdNR3CA==
X-Google-Smtp-Source: AGHT+IGGXxySXq4x6HK1BykbCuknVyRiUsDpYroWUw1bLD9iTbtwA1JyKZdXLJlWOalSidwsNwGz5g==
X-Received: by 2002:a5d:4aca:0:b0:38c:3fd1:6162 with SMTP id ffacd0b85a97d-38c520af863mr1958826f8f.50.1738154864395;
        Wed, 29 Jan 2025 04:47:44 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3f8asm16620588f8f.86.2025.01.29.04.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:47:44 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v3 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Wed, 29 Jan 2025 13:47:41 +0100
Message-ID: <20250129124741.4115324-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129124741.4115324-1-zboszor@gmail.com>
References: <20250129124741.4115324-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210380

Enable building rpm with rpm-seqouia for the test.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..4df45ba032 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +83,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
-- 
2.48.1


