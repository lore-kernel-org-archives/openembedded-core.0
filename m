Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C781CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 12:43:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.14871.1759927382335361609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 05:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRzE2DIC;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3fa528f127fso747000f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759927381; x=1760532181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcwZshi3MFL9N26w49uUwIt88P1pHT8LnopXiqSmU2g=;
        b=MRzE2DICaDk8173oeZKSctDeQb/YFRJhn7DDvDq7nvWeMDeZ/pphfUBO3p3q4NVZe1
         RIrYM9pp3EPlAZL8mFLfw2Cev9cF+tncPZ/DObIse6zNAHGKI2JN8PdEPtahVFh3zCMf
         shkA9O2T7nmm9d9YPVFXkT7KkgGxaB/xygNWQdwqV9gEDq9ud5r56oQqxnc8xzC8rAm1
         4y+6jT+wDohUj3TBAK2goPjtTZrzc6PPL/0X45gexplmgXtzpTaTzEXHL/Ft2pZs3Azt
         xemfPuTxySi4I/BXvB3QtufAuEHmI+2VTnktNI+ocO548kAHdPEcnJuCb42JWuIS6QvU
         N6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927381; x=1760532181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcwZshi3MFL9N26w49uUwIt88P1pHT8LnopXiqSmU2g=;
        b=f33mrcOtdf3KmwIuddtehj4RpoxjSnIEDWKfyAKQsPjNCXk2whvxmtOy80GunDHVsa
         ovcl8oEtM2scJMu9sl47PGQEkoWqhZ3gO9xC3GJWZmPO2TKURfaYc7P2nMcD8hRWMYff
         xtlumvScThGDYBM7hfDOFSk5wS+U81p817utd17KE5JzPWn3psanGol4fgWtMwDumP00
         0tK+0lp063e7wf5GbLdraCW3IBwGccBlxc5eTA2+4TZSPkpG8qsV6HEn1uMv+Tf9PTz9
         S0UEb4FpMQwu2M0YkgGL40EXDqu98d9+xruVKLRqaKk7khMSHxNdKy9TudZd7g2Cvatf
         GYww==
X-Gm-Message-State: AOJu0Yws5NJSw++OGo/USsHiWMSt1IAGM8H3w4sYvHi7HW7ptDb1YBRB
	kQxJy7G/1vj+sXi2pai+iqNGQpqNZ1Kwr/hMLw3xqhiW2tXsGVkRUOxbrrEnZg==
X-Gm-Gg: ASbGncsPC5uSVrRXjYIWpok78hYaRr1QMopvzymsWAHw2XzM5V/jEn6BD8+qBDqCc+t
	opBev09CH9jAPjpWXn5/6VmEX/zUfisRJSyRbXdoLTFdIJ8CE10SvXdG2QeqaT+dsv3kvUQDa5s
	U3evyBR+gnMwfURNpu+hGezYLKmzeCqWKiwKKWdtJaW/Me+OQWXDW/OhDPUo4kCi/qW8WK6ROct
	srKT3lzoszA5Wwxw4nKf5Bevjpux2x88sa2YPPRQYOVvylPefiUfF0RvOMRMQPM0B+/EEock9rA
	gWNeLi0Z1Nh25cyA3ql7hBn5etkzUxu3fknoidurcohO908Q98xJ8BvNy03fFDjAl1WipzYyneo
	haizITKNryCaAbhbeFemqG6IwoMtyi3j+O4aHkuWpCS4Fyq6SeHtTVvqtJjJQXaz3Ft0XDaekiB
	j2xNar4qiWGn/sLKTVjttFg4hKnsIBnBTWB09QTGZVNkssamOtpfRaDV9deWbs8Tn/VkWzVpW6c
	TqkFYaNOA==
X-Google-Smtp-Source: AGHT+IHftjMqjlmlg5AjCITy+ZuOp+Y2iFT7iwNjvZsfoO8YzMrpAVYdq28tZu7NYxsMhQarhUskoA==
X-Received: by 2002:a05:6000:3108:b0:3f5:3578:e538 with SMTP id ffacd0b85a97d-425829ee04bmr4597834f8f.21.1759927380476;
        Wed, 08 Oct 2025 05:43:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf6c64sm36760755e9.4.2025.10.08.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:42:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/bblayers: maintain compatibility with integrated poky repo
Date: Wed,  8 Oct 2025 14:42:53 +0200
Message-Id: <20251008124253.1636011-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 12:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224578

From: Alexander Kanavin <alex@linutronix.de>

This amends the recently merged commit that assumes the transition
to separate repositories has already happened and re-instatates
support for integrated poky.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 08bc1d1e442..8026e7ed4a4 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -157,7 +157,9 @@ class BitbakeLayers(OESelftestTestCase):
         with open(jsonfile) as f:
             data = json.load(f)
         for s in data['sources']:
-            if s == 'meta-yocto':
+            if s == 'poky':
+                data['sources'][s]['git-remote']['rev'] = '5200799866b92259e855051112520006e1aaaac0'
+            elif s == 'meta-yocto':
                 data['sources'][s]['git-remote']['rev'] = '913bd8ba4dd1d5d2a38261bde985b64a36e36281'
             else:
                 data['sources'][s]['git-remote']['rev'] = '744a2277844ec9a384a9ca7dae2a634d5a0d3590'
-- 
2.39.5


