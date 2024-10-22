Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3EBCDD0E6
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 20:17:32 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.3886.1729628247125158917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 13:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=DiG+OPcY;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4608e389407so69453161cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729628245; x=1730233045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mkIGHtHadNz029cEE+/8t06mIDCGpBaVLUcas0/dWfU=;
        b=DiG+OPcYlmnDzzoLLvEP6DaW2eR8YEMSCQMEE0XGuAFthsbd+U9lbk8LKB+kg2Iiac
         sQ4wg6vsAUqbNE77p0wovz0xTcMZDTe87p2SFaHnmvRPPu3g/LrHI0HO3gwAxG2Tv+TJ
         OlCjCUWJbc4qH3H2Q6iqu9TSJ04+gvDZgmvqbum7kz0PdJo9mIzJOxPJZkngANhzPXQH
         Kvkr5g3w9PFC59/iVQubJRKBVnhPuENGr81WDtiyMRmpARN+H8Lg0k9nD9NG8tJV5Yhw
         +3tZALSEGW2mQ/um0NoIZTWRV3k3gDaYs6q/IhxDc19SRQ7uVCzboEqfCuYgTe2x6SmM
         Bo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729628245; x=1730233045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkIGHtHadNz029cEE+/8t06mIDCGpBaVLUcas0/dWfU=;
        b=qconMBBdAu8ftejNcO91rRT/WBacIrVP+fUWyWwKtLWsqDtfNN3GzkvWNhR2NwEed9
         NQBg8u7u3Zprj2Y1xlr5SCV0rHGuGal88EMMmJ1SV38ZPJGDk3AtvwuaDduNuoZe7m88
         RQDFUjej8AfF+xao0gt9hu19gRuajlit+S8MhSx9u2B+sUy8rC4TWutf2iC4/kCErsmZ
         7N64suVTDND3h+mTjUMsNrT4mi1fVoMvsqJJQgABs6XZ5Jsx53JWhRXwA8uSkb03DzKS
         zXIGdzkS4h5T4m9EtnqmdvEjO7syPGhbv1mPu2ot/d7uEW85pCM1qi4M5O2VD6L6hW2K
         DUFg==
X-Gm-Message-State: AOJu0YzZEu4BqAexdya7BONAvf/ZBttpxgAKfcKoE+ZlM8ooydQ1zDAN
	BIegYDnBjGJ0sJ/QrvvqhHth9ylCWVn7Iw2hW9FD0E0EprgXZFNGXVisjOE7wYgcl/33QI9Akfk
	s
X-Google-Smtp-Source: AGHT+IGJuHx/uh4tHl4nDQXfLZag8K9UfvEr6Dd0QRRDIK3e4yC+oH7+PHMRnNS/l2Z8r6bBejt0Iw==
X-Received: by 2002:a05:622a:1e15:b0:460:a82a:39a8 with SMTP id d75a77b69052e-461145b7447mr2768411cf.13.1729628245522;
        Tue, 22 Oct 2024 13:17:25 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3d6db76sm33320421cf.59.2024.10.22.13.17.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:17:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] libgit2: upgrade 1.8.1 -> 1.8.2
Date: Tue, 22 Oct 2024 16:17:23 -0400
Message-Id: <20241022201724.893111-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 20:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206176

Changelog (https://github.com/libgit2/libgit2/releases/tag/v1.8.2):

- This release reverts a const-correctness change introduced in
v1.8.0 for the git_commit_create functions. We now retain the
const-behavior for the commits arguments from prior to v1.8.0.

This change was meant to resolve compatibility issues with bindings
and downstream users.

What's Changed

New features
- Introduce a stricter debugging allocator for testing by ethomson in #6811

Bug fixes
- Fix constness issue introduced in #6716 by ethomson in #6829

Build and CI improvements
- README: add experimental builds to ci table by ethomson in #6816

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../libgit2/{libgit2_1.8.1.bb => libgit2_1.8.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.8.1.bb => libgit2_1.8.2.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.8.1.bb b/meta/recipes-support/libgit2/libgit2_1.8.2.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.8.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.8.2.bb
index 618a4ea6ea2..b0f13a26d3c 100644
--- a/meta/recipes-support/libgit2/libgit2_1.8.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.8.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
-SRCREV = "36f7e21ad757a3dacc58cf7944329da6bc1d6e96"
+SRCREV = "4ce872a0fd5f40fc4282befd9b72e9ddebd22d02"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


