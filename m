Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EA3C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.14786.1682671712881810121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SkKovSWK;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso62600015e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671711; x=1685263711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qMzxeLtJNRqgP38a0zIVcK7sRkcU+Z3xfTHpoEh21c=;
        b=SkKovSWKLrK2WtsutxvTH3CATgdWLMRCmcudW24xNihJLLFmC2f3KbO8rBWS4/2yvV
         NmtycZr4Xsv+Bq8WV7R1zf36y3i9dpZ5a8ukI3FT0dkhaigcb/4YblFNKrLo/DO5Es8J
         o/qSc+Zt0/6r88s5A7okiVdVV+RRC48reSvor+I8Fl7SNhof2B4pnc2Dp3Y9+vc7K3Pm
         tAj5t29eZrScmQRU/L0Liv1GbVJQbpH/bupOggcB7acQQi/ArwMbmiGAp2j9XE9UjHN5
         PVw4t0avDzXOH2G56qiLhB/k/D/BceTbeLZtHzicMP1R5Wx8Bb9trq2afNh7ARdTGrE/
         Acag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671711; x=1685263711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qMzxeLtJNRqgP38a0zIVcK7sRkcU+Z3xfTHpoEh21c=;
        b=YSlvfpZyMkkZ4Y3z98I9zndyJIRedlWGsronMJDbPkOnHSP7MMhW0DDFuFk8V0D0hi
         W35RDGKkw4NT8h5JXppVhgS0hMH1achVkbKJ00bOCwQykAo4TYEnskT3cnjheHIe6jHZ
         ldhn5+NcbdXp3uNVeKybrjlVObDMlSzi2Qh/IV1F+G/g6sG0Gmln9uz7KUyCmAG6gpAH
         cxB1NfSsusbyTqe/RDHNBdCbTkXd7HqGeshtjC6X9i1Aghy4JAlOY0vfoguC5rbwsA/G
         01GT/osznSDF1RoRoX6H4Djon7WYmOLIJLKAftOl7YmtfS3i0FdfVHX2g3ae40qFQOEN
         /8Hw==
X-Gm-Message-State: AC+VfDwf671naKDLiCG1HQSQDRy/L5X6+7Ri0EywAZQSRf2Sj/uDD8cY
	OT+dV6yNrz8ANbb1tD63eZzr4ZP1IzU=
X-Google-Smtp-Source: ACHHUZ5UmVqOSUFvPuAINwH0KuxSfXUArAKcKnT1oMW2tQPdaudhDJu7NM2LyJqdFnyMz+DhXrdFmA==
X-Received: by 2002:a5d:6986:0:b0:2ee:d53b:d9ef with SMTP id g6-20020a5d6986000000b002eed53bd9efmr3316911wru.55.1682671711315;
        Fri, 28 Apr 2023 01:48:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 08/11] oeqa/sdk/assimp: run only when zlib is in the SDK
Date: Fri, 28 Apr 2023 10:43:49 +0200
Message-Id: <20230428084352.836515-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180519

Otherwise assimp will silently fall back to a vendored copy of zlib
which will fail with -D_TIME_BITS=64 due to https://github.com/madler/zlib/pull/764

This was exposed by multilib mips core-image-minimal SDKs, where the default
64 bit sysroot has zlib, but 32 bit sysroot does not.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index aa6541c6f6d..e4c5c730037 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -22,6 +22,9 @@ class BuildAssimp(OESDKTestCase):
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
+        if not (self.tc.hasTargetPackage("zlib", multilib=True) or \
+                self.tc.hasTargetPackage("libz1", multilib=True)):
+            raise unittest.SkipTest("Assimp test needs zlib in the SDK")
 
     def test_assimp(self):
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
-- 
2.30.2


