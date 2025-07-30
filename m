Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCAAC87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.47073.1753910966115018218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KOg/rPfn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24031a3e05cso1729225ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910965; x=1754515765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3FVpE2pjseWyLmp3UsQNo/FJqaOI3rWH0mhs5/t3Sk=;
        b=KOg/rPfnauxzftv4KLGp3a8biN0XuY9wio/F5rWwWhngb8UFZdVGWCYRioZbh9pfZ+
         wKZcKM2gtgtFDzHtIZd7V22GeCkOylyN8zFz5Cb6/rRvFgBaQJ9cRKDDUMEyZfmIRZyR
         Ex/5nrJOVXSOrezlT2RaHIu4qOf4j+5A0fivXFeC3c5WBpfEOgXQFf3lYvMcs7pP2zW1
         ONtuhm+JwPuUMuSBDMhvFX2JtQPyAkAaLDV0hlCaVWXqIsXRLqCeBJeBSoPf8HckBGT1
         KjaWnAsp84jCMO5AbW6eCOGxAdPCKkS7dA/Q5baoDICFsSrgtzltHojxFVTxsiwDKqKA
         b8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910965; x=1754515765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3FVpE2pjseWyLmp3UsQNo/FJqaOI3rWH0mhs5/t3Sk=;
        b=EZj6/2QQSBb3wS11RHGtqISLx3xzBwPmY+vN7eKpa8lQ33Av6NgMcDGYbrXzEPZTW+
         iIWmQ3Q+FnztljamZUWHqNV8JKPBvIN0NNdKR2uTJorKj8hc71CFrriG+S2SijV3nw4u
         pcx+hi1WbpyuNFgIQHhbDVb/00JjkKO4ZqgJjrSgsAPJOjJwxcKRKdNEZARZ2XX2nw9Q
         suuvB/10GijU3Kp4EHT9+GPHp0UNnWK448sqP3ryBuXWkPE7+lZsHlxdEcSUmdnEQ1J0
         l7+mxymS/Ncf6MBj4l2BU268JxXLnhYbVp9VGIxO2deudoIqOcd7i9qPrZKsOoJlpSq7
         H7XQ==
X-Gm-Message-State: AOJu0Yw1ma/kGDTnx+55B2l0pcAZWxhdPqcAtbMoEfRnUO650fG2PELF
	wX7IknGDmEVMOyICTaPp+MV1MVMkLODwZCXqlprSIxpCaWN/o5kK9uEMyT0JX9j2Jg6OqdveL+4
	4csYJ
X-Gm-Gg: ASbGnctCg8aizWurVN4gX/I1eldCHCDdXp1y7YysXFT8bwHFqCjy/s49YkslJEoaVpA
	/2Iu3N//ebJvlKCLHfqvxwJPYyA/N3oIGsi6G7y17/TC435sG2bqb7Iot5/gu6YmVVLkCchm1IX
	InyH3a3K4waiSNk1KeXAPbjxxUTqZ0lLG7obfeXPcPxDITHVdfCGTaFSrYqKpuwwjvzLjezYjHg
	yypIGTTd0EIB4f6ot2hJIIk1Dz0/WESQVU3HqX6PztAvU/FmY5fwJvaQrsmgiKpdYLtpvcwsQ4s
	DqCEF3wHlxM1l2wXRXdCtZQ6cCyLrGo63/2hiTzD2m/9gcjE4EVaF8a0MGlHuS6P577KEYyVDit
	+KxpMrb3XlaWDy2rmoHMtN9A=
X-Google-Smtp-Source: AGHT+IFEkwz/9V5Ojp4HeTtpO2qLMk6/h9WQA20epp0MKQOH86mOueVk2N0shqAwanP3AJwqRRxrJw==
X-Received: by 2002:a17:902:f68a:b0:240:9d6:4554 with SMTP id d9443c01a7336-24063d8c05amr135415165ad.21.1753910965381;
        Wed, 30 Jul 2025 14:29:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] glibc: fix CVE-2025-8058
Date: Wed, 30 Jul 2025 14:29:00 -0700
Message-ID: <c2b63f171719e2b1c12ba049cbe776adf9e0244b.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221168

From: Peter Marko <peter.marko@siemens.com>

This is a single commit bump containing only CVE fix
$ git log --oneline cff1042cceec3502269947e96cf7023451af22f3..b027d5b145f1b2908f370bdb96dfe40180d0fcb6
b027d5b145 posix: Fix double-free after allocation failure in regcomp (bug 33185)

Test results didn't change except newly added test succeeding.
(tst-regcomp-bracket-free)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 6ee9fc7a0b..89e532fd67 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "cff1042cceec3502269947e96cf7023451af22f3"
+SRCREV_glibc ?= "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index c87eb76f41..ff6c8f3b43 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,7 +18,7 @@ easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
-    CVE-2025-4802 CVE-2025-5702"
+    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.43.0


