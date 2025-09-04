Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8F5CA1017
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 05:12:47 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.32417.1756962765026099352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 22:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+L1BSRZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso461988a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756962764; x=1757567564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A3ry7BZPGMGz/h0BAdp6DYF39NpEpvV6IUaFW++J0A=;
        b=H+L1BSRZp/4P2ord658daV2gD4Ge0zVKi8Ozyg0HNYQy7qZS/XBdarHDsQCToAizKZ
         Xb7sZf/owhBTonbbOIOY2xjNe4sYobinfIKkyXyctnLykm74v9Af5XZhqvYUrpi3x2V6
         oRNTjvRQomM0T0/7pQzG0G4NTgKbkqM4feywD3gQNpjkinJ7CG+YeRgVr+LpOaOTefYr
         CQl9omyFmQ38gJjQJ8/F+45lwJNyrM0jhdTX0zYZdP77py3ZG2AYF9+Yy6C76lbYYJZa
         nQOUxowuXaTM4AYzcUtiSurZj6vq9kZyBv1518lxKlXvl08/4ElYeb7EU/zJTzgpAaqQ
         9Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756962764; x=1757567564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A3ry7BZPGMGz/h0BAdp6DYF39NpEpvV6IUaFW++J0A=;
        b=nMNxP2Lv/cz3GqNV2ob3n1FM/kNIGkkwokpHUPj1ckjP2lbSa2nS3njAG0eAKr2+yz
         obTdemMSRrInFxYVE3x3l3hOlDICZgJDmUfdFkpNuWdTYN6WqPxQtWggevsCuglQ6/PL
         gm2PRn2audCmRLsazmW0QOAiQ+aVwA1g0j/8YCVPsVKd4rUFHpHeXyQqjx6kHZEHO8SA
         f2E7PdiGLJtZ9iDQJap8sIn/ZXF78r+ISgR73y41iASKsSQS6pTt2V/BokUDb04RbRKz
         82BNTkEMOj2Ouu/lA9+Qvu2vNcK87gCyZolWG4ZjZXwHNkeJCck4ADhZD9nXDGFNjTw5
         xWGQ==
X-Gm-Message-State: AOJu0YxQv3tGEKd/qDcfBaCAAkaoP5S3YGb+75BAtAPLX+i6AMohsz5i
	ofCoqbZZKSgeKWXKzKit6GQY2nWf23ypIl4c5/Tx1yvNq3WdaoosdaGtt+5jMzr5
X-Gm-Gg: ASbGncv/cW/IRJZsg+NlpG9kl+qeYFA7Ip+r3obPuAl5qgs5DUas5A80hdaQ+wPY1Vl
	a5+FhX5xjMKEYb1qsmsydqU+C0gmHbuxvnf/cSd578sECL6Fp8QqDMVYkSV4XCogUi2q2gNRMRE
	svl6nQNFQNYukRnJM+n24qQ2WtGuQ5TW0pZ2gLhYYW6UTkVVY0HsdfUROGfwck1tYYicpMxgXr+
	oRE5PZMEAewspW5xbcVcSr73YEMLVGy+Ma68BxX85IL79OL9mVcQnBeAA5IxYWrdVt7gwcF0Tan
	+8EGGTOU+XVP95tWA2gTicKlcZJW9WHxDSehleKFtnkyJWC9+kiX9w6+n3LR7/YICC8ndJ919pZ
	9GK9AjoCN0m8wj9RVdOf8N2mHD5O+2hIrxhkgZezHdxfyK7uGt0+lsd3PXVpuGdQ41cqbAhNZJ3
	h9f6H5wRE6X+f3+e5EctCXl0kBdrdFVvYX+eUjuijpX6ERaxo0rhM=
X-Google-Smtp-Source: AGHT+IFBPR5NxZ3afmGHDVd2vNnrTXvFk14xWqm7Ab2uLGOEDyY/lXIoKlnF/rbabEMULsxX30Xfaw==
X-Received: by 2002:a17:90b:268f:b0:32b:988d:56c6 with SMTP id 98e67ed59e1d1-32b988d596dmr623232a91.11.1756962764013;
        Wed, 03 Sep 2025 22:12:44 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0736ba7sm15731755a12.12.2025.09.03.22.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:12:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] grub,grub-efi: Always use BFD linker with clang
Date: Wed,  3 Sep 2025 22:12:39 -0700
Message-ID: <20250904051239.796948-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904051239.796948-1-raj.khem@gmail.com>
References: <20250904051239.796948-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222896

LLD 21+ is erroring on text address being lower than the default
segment address for binaries. Erroring during configure e.g.

cannot link at address 0x2000

With LLD 21, -Ttext,<addr> only moves the .text section
it does not change the image base and LLD 21 errors out
if any section VMA is below the image base and the segment (image)
base still defaults to 0x400000 when using LLD, hence the error

LLD support in Grub needs to be done properly, it will need
to adjust how linker options are constructed in configure. We
default to use BFD linker always when using clang for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ffa04e415d3..dd1587acd6e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -71,6 +71,7 @@ CFLAGS:remove = "-O2"
 # CFLAGS += -mno-mmx -mno-sse
 # So also remove -mfpmath=sse from TUNE_CCARGS
 TUNE_CCARGS:remove = "-mfpmath=sse"
+TUNE_CCARGS:append:toolchain-clang = " -fuse-ld=bfd -Wno-error=unused-command-line-argument"
 
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \

