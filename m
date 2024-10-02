Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597DCCF6D32
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.6956.1727874800123522669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v04eb+2K;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7179069d029so4811024b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874799; x=1728479599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hs6o60UF+hsj3F2rJ4elDv0iX/0FkuT1XOktEplydZ8=;
        b=v04eb+2KevZVBxNvBDbYXAfDmzF5IJwLhA9y8+u4rPwNDQFRVnmEdXtaH32AdMWdIA
         sx3f6qeFsYi6rL9T5y/XIbViBgQ1kQRwu0CNgpmi3yny8KIue3IJHiCHY3eU1ZuTNQ0V
         Vkg7Ph7HTUaXcTuLTzACeVQasQ5Id3I2QtNTpLOX7Ihi07qERGw34KdE8E8zInkLqIMb
         KXARmOkDFGZ3Q0oTDYAQCH68ggw7hBD9tl1CaN7Qy+seECjVMNx9mo4vIcAUnk+b/fP4
         zoaKhvafv+gdsi7K+mUtox1RZ/a8AN3cb1X+cp+L+kMBMhiVj4iS71V/IJnw4PTwu+9P
         QyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874799; x=1728479599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs6o60UF+hsj3F2rJ4elDv0iX/0FkuT1XOktEplydZ8=;
        b=uXXOVXMyX43WU8rDhBHy6ymekKpch69OY9rFu2jiDwSyHgMVZE3ApbUU5v8MiOvWc4
         3ANhNehuNsNeNOKEDqiD7DDu865NGdi06AOqNXqLDETTj0Bg/jeQwe+PrU6BGMcjVzcI
         rMdvpjmur3ckYUQPbS6ZtRFFlnSOX2WiI8Ka6t0bqMo4XBBm0YGHL7AE+RY5dMFP3F4B
         rj6gohReDIQYjjkF1EqhxoxLoyNh8rLY/Oug/YJQ+2FzLQ8eLu6uaAg7AZwpBOa6oo+O
         pKLMHPIvWBDU5GdNXz7FN6tEkY8bagntJxPBT/dxosj8MuYZWhWkecqJcBxHG3isOaJt
         roAQ==
X-Gm-Message-State: AOJu0YzvxcFer/TkuFPN8cSVoXh5ed+L7Ik1W8h/dFMXf6XyHcwaY63c
	0OCS2x57+NFGHxrnqlKHZkiNxOQXBy/e4w3/Alq2T1j95MPE5b5R4ns4ioteQQ41UXpgQk5Gous
	AHHM=
X-Google-Smtp-Source: AGHT+IFXCBqjQyB/aCN2O0S5qlNnhZbqgXAaKX8hTHFRZoyfgYZOaf2s/37pJ5oRRr2kPxVxCF7//w==
X-Received: by 2002:a05:6a00:1812:b0:718:dd1e:de1a with SMTP id d2e1a72fcca58-71dc5d6ee67mr4994554b3a.28.1727874799338;
        Wed, 02 Oct 2024 06:13:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/16] bintuils: stable 2.38 branch update
Date: Wed,  2 Oct 2024 06:12:49 -0700
Message-Id: <98517fbc5bbddbe8608b41a7771eb7d90d7860a7.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205193

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commit on binutils-2.38 stable branch are updated.
4d71e17a9fd libctf: fix ref leak of names of newly-inserted non-root-visible types

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 4a8831b534..032e67a213 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "ea5fe5d01e5a182ee7a0eddb54a702109a9f5931"
+SRCREV ?= "4d71e17a9fd8d319359ded891eb3034a2325d4c0"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


