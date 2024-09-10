Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B61EDE981
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 00:52:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.11901.1725929522291519159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 17:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+2zQVIB;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-718e11e4186so205524b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 17:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725929521; x=1726534321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ew7dEPHePbuhx4/xyCoWdt0B8/OvxUPkFcbtP4gdROk=;
        b=V+2zQVIBcBzOF48BoZ/+VLgIgA0rfKYFqJ++Y4vqc9c1z8D/sDTQNz2V6zGOl+Xpln
         K1P2PfoOmUALZl2vLVdjTW48j1HRmBiv9/42yHjcj/r8bWhqJ/2+zHs2gk18y+TFLlZ6
         EwWEjSICErqU+DrF9XxH+TgLR1crKBDrn78pzVBHg2TppjK9+NrlQN3ZY+MBSfDkR1S2
         7GAjoleELlwIQLDhoiiZ6zYamKglA71rQOsz8gHhe1vSwkCe1NRfyPtQJT5Qp9kIFVUz
         JrKV3hP3hDgDoBrn6D2na5rtM0PQYa4qEupp7U7QEoq8kRDFTa3C+lEOJtDtpokkIlrE
         vnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725929521; x=1726534321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ew7dEPHePbuhx4/xyCoWdt0B8/OvxUPkFcbtP4gdROk=;
        b=L4kWoEtvLv1q9Cpb7Zi08vE1P8xpzgcIwt2nLTR6n1icQJ+y0XBmw3+IlPiWUfX98w
         po6dW4OH76qlPvG42YNfGb/5M9x0t+eexX4pm9JLxl91ZUWtJ60Yrn/XjUZ8p9tYwPt6
         OCM1cC4z+8mW1VHIyWwvpsamE0BH97jLEpFL4vCR4rH59jq23Wl2FktByTXh2YAQsrKm
         HuAFkxbnTWXXQlMw6djeifey250rRKOhCE3RG44RNr/Jf0aL6A+2yS9GB8l3h0elJmfv
         Utxjk2dmguK1VEoSveFKr6T8Dcvf533x6mxfxXJVGIzcH5ecRr8YAmZDyUy1+ja94Ri+
         u4JQ==
X-Gm-Message-State: AOJu0YwakCqJnoIjf5Mw6TrvgA7NQY+QWlbe2JDgg9/7t8yA/8iUx5Vc
	obWuMJDFsm+oj/OVGniIAJee5B2WTRvyVBVJSonHp3Wc+prhIY29wTnMsk3+
X-Google-Smtp-Source: AGHT+IHZjYKndjJCyW+D43uKs9X06PqR15GbqJHEXF5d54dqbdMJbTbfDOBUwNV6KyQkrdvAEBDbgQ==
X-Received: by 2002:a05:6a21:39a:b0:1cf:2b11:bcb0 with SMTP id adf61e73a8af0-1cf2b11bea4mr11756927637.35.1725929521246;
        Mon, 09 Sep 2024 17:52:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4cdb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8255dc167sm3906586a12.71.2024.09.09.17.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 17:52:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vulkan-samples: Disable on 32bit ARM
Date: Mon,  9 Sep 2024 17:51:58 -0700
Message-ID: <20240910005158.1797671-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 00:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204328

vulkan-samples depend on atsc module and this module
only supports x86_64/arm64 as it seems, Neon support check does
not do a good job of detecting 64bit arm + neon to enable it
and it gets enabled for 32bit arm and it uses 64bit neon ISA
ending in build errors e.g.

astc/Source/astcenc_vecmathlib_neon_4.h:420:16: error: 'vaddvq_u32' was not declared in this scope; did you mean 'vaddq_u32'?

if upstream fixes the build for arm we can re-enable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 93d4cdfdd9e..e1a2d13cdff 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -37,3 +37,5 @@ EXTRA_OECMAKE += "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON"
 EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
 
 COMPATIBLE_HOST:x86 = "null"
+COMPATIBLE_HOST:arm = "null"
+COMPATIBLE_HOST:armv7ve = "null"

