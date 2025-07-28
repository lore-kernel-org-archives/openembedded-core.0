Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF52C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 03:21:04 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.73318.1753672854285080926
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 20:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVDvLsRS;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748fe69a7baso3514424b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753672853; x=1754277653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHDNfGas6Ls9agHxWuJvivscnr64g78xpYPcKQaZxKs=;
        b=FVDvLsRSh8oGwds481w6sskR3JRztzTXejFLa4JmbeQ8qBCxMVKxDdG/EDyeLPJ/CP
         nlGJDNaEWfLN54Nz56BcmFoEBbK3HGbfeiwM/Y045L0qhRiJzbopS8Yz/ntT0hQagQeU
         MpO+C/4F9Njr/zVWY0aRgULhqHLtCRkuej/A4vwJd+TH3Lp/AvDmtjZ9VdQgPkl/OsTr
         Z6nHF7+rSEk2/S09fTa5FlAUdNCcu/vVY1JggOzivGXNT4xDI7R6vtMGFO+JLNbqqvFQ
         43k2l2CXIegAMxnhd0rk6+ZkzzWxCfQu8rESlFxHQCmeHtoPuz61Sw6aJntceHB79tx/
         Ve9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753672853; x=1754277653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHDNfGas6Ls9agHxWuJvivscnr64g78xpYPcKQaZxKs=;
        b=oaAnlfKhKWocKj4v2UNQ8R+HEM0yqMeXnt24OkrtHHg7kJNaHtvu1GC/Ou2PAegitj
         Eoedq6T1pbMnNW247Wrg6OYoY08ECvh9269uWkBN+8k5A2A7vG4g6m/mTKwcRGTd5cHl
         gjeIdQ6PWcHJUV2GCXB2evMDjnMR/kRpOqsvUuILsOKAqWxlU0f4MvRwt5zJUw/mU4TV
         KsYpbcIQjCTWLEFMn2ZoLnzUfEZ7Fk30558BDcdu6JbKK4PqZ73QvB2tU9Strj0gEM4K
         oXDQqvHqFDXGGop3L9RFfvwVGd+Lqc1W5Z5hLvw4ICs2IT6x52TEVyL94f8xtCWRh7TX
         JySA==
X-Gm-Message-State: AOJu0YxhJ8J6IBXeyojJ8U4q6eCD2lkY0jsneQy485hIYGXnPmDdCLDK
	zF/gPu2GjlCiCgTEtsQgdol8xRukQSFpMEaXHJknkzvmdjA6iQw2DFwk6wRH2IyCWyM=
X-Gm-Gg: ASbGnctdY7qKHXM+j+mBRyFTbdZgLmACGnkQTrJrjmaknNPXw5IHAlVNbZLCZqzmZR6
	lRBIl3MyQ4LphT/6i1efRiE3MJdQiPsaXVgTI3Fht9Z4KnzbnVVgpnzUyL3uusGpNzuoyxJ7r42
	iAoymEbHniy7sRRqT7g1ciErSJK3+Bh96FtRYX6iELzeGfRO4IXwR0fo06Q/6YSwSFzMbEcu3y0
	FHj5y5YyNLa/0MOE0l7B6KreoxirgOKXDgJ+c2usmGKbSjsiq0dxx9wrl+/h3eZ/77EMJemyuow
	l+7m2bTn3jxAayowVKwWZmPbF4wLjA5zog7wKZiecVE3imQJJlW11C5WmGOwQwn4Fprbug6KiCp
	kYcewWbwU7mSHKQ==
X-Google-Smtp-Source: AGHT+IEBOWEG8qp8Kvp121sVXk/9ZLjM4+1nApmkYnjz9ITL2YVFvgLJMiy/dJ5C2KBUUoWYJj4v2Q==
X-Received: by 2002:a05:6a00:92a3:b0:758:72b9:e5da with SMTP id d2e1a72fcca58-763349b9fa3mr11655989b3a.17.1753672853271;
        Sun, 27 Jul 2025 20:20:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c024c1sm4359785b3a.33.2025.07.27.20.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 20:20:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] spirv-headers,spirv-tools: Update to tip of trunk
Date: Sun, 27 Jul 2025 20:20:41 -0700
Message-ID: <20250728032045.2783514-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728032045.2783514-1-raj.khem@gmail.com>
References: <20250728032045.2783514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 03:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220986

This is needed for compiling SPIRV llvm-translator from llvm 21.1.0 rc1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb | 3 ++-
 meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
index 1da2e74f93b..b1cec77080a 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
+PV .= "+git"
+SRCREV = "de1807b7cfa8e722979d5ab7b7445b258dbc1836"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 319b25b7f43..f66b25c60db 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -7,7 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
+Pv .= "+git"
+SRCREV = "a983ab19d6f91a07a8272767427b6c5208576d08"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"

