Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52182CCA484
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.31062.1654516899677751131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YlY2wJQW;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k16so19568751wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BLnP077TAh9+ef9b1aZgqXVi3HluvSjx4/cMgLkpuTg=;
        b=YlY2wJQWQebUxmbk2ZmUZ7bpl1Cjabv1f7Z0tspoNfFuWYC48LTFwdB63BvNyeKGZe
         B1637pcIQ6XFqhfJxM8nkPqIj4oKveFLLZ75B92w6b1ZUsXpfPI8yCOV+A+1XCgrQTH8
         fXpPIs4A/OhKquzEK2p8JHlp+Dr/U27oAb2dYvU8sV71nZaZJisohBddwsL1mA4DM9FN
         ZeVq/6133OBB0e1jH3f1zPgWQ+O1v9yKSVpPwMwLuP6Woy2gGGMRYhAQV0fWUa67KGei
         cjQXCC/SdVH+txKgsyFqT3esvO3lEUy+pgB6A4scvocKc84kziT6JHA/+uwRLRH1lK68
         omdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLnP077TAh9+ef9b1aZgqXVi3HluvSjx4/cMgLkpuTg=;
        b=SHXf0vJHkXg42Mj/25rMkM7/HcBxmGMyqxwK9W7yw0KquqHNwIzgWRiSklIVDpdgaB
         PNpJBzBYAvahTCpM/6vBdPRiW2+MGWlYxMDlDQ2GWDkCXHevecUCRxLk9m/9YiWCJMbz
         x174RabvQz+/zz853LwPt2fNc2UEAQamMB1lpb6MJDVPf2EkDlkbmgqokM6T8slSk1Z/
         SsY++fA3JwX1in0w+EJTLlyTHRxeCcYrkQvzEZKzQFUK5+wh6CG3SILKYQh+OReNAWHo
         k0VPDYiH3mOy5msD38Z1FVwOHaBGzGiAFv95a5+/mQWQNWJf312KdMTWbKuMVl7YLiaq
         QeHg==
X-Gm-Message-State: AOAM532P25bTT65IfOX3Vx9lACIBwhbn/oyKC1VXu9Zr2YOkvffSq+xn
	fbeHafdnridE4ubvZ/7CnZ/nyb+5kj+CWQ==
X-Google-Smtp-Source: 
 ABdhPJyk1uTdEmebl0uWpHlS4qHQEwLjDCr2ay7pWzS3RUyBlGKJtqVlPsYLoESHQSzDKEd/uGImMw==
X-Received: by 2002:adf:f9ce:0:b0:210:316f:3ab with SMTP id
 w14-20020adff9ce000000b00210316f03abmr21002212wrr.487.1654516898249;
        Mon, 06 Jun 2022 05:01:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/21] llvm: update 14.0.3 -> 14.0.4
Date: Mon,  6 Jun 2022 14:01:14 +0200
Message-Id: <20220606120126.3381438-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166601

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1179ba172f..eb2f01b967 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "7.0%"
 GOVERSION ?= "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "14.0.3"
+LLVMVERSION ?= "14.0.4"
 RUSTVERSION ?= "1.60%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 0b5301cbff..67ed1eab00 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "14.0.3"
+PV = "14.0.4"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "1f9140064dfbfb0bbda8e51306ea51080b2f7aac"
+SRCREV = "29f1039a7285a5c3a9c353d054140bf2556d4c4d"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.30.2


