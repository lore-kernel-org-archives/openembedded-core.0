Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC04CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:29:13 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.7860.1755120549800965684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oyYDoUKs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b47175587c1so127953a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755120549; x=1755725349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYqNTkjTLKS85lyfSsdQhv9wBcIBmAL31KE9rKBNOIA=;
        b=oyYDoUKseMcW0o4npf5NQCy8bwFVwLDEWM0bOvL32F+ij5kaZ5AfqnW9uwNVgfvOUZ
         Bi55I5WdmRHzoMV/8ofpDORKqDUrMylxEpzYtIqUV3g6cOCV7lJtVQ/IbRWcYZFXtCJE
         L+Y8HcqZWVsWRUPgmhJEh0O27fUj9/Lq/pY28OtVq8XzKjD9+UOL+zMPfsFnZv9pwsST
         nepDkZQhN0Lp7/Wag9i3W0BzVYpzJ75bq4OcVXC9hiwij3yok9iFQmuJpD0bmE/4jrDL
         e0xJBHIXzsHGmh0R37tikoo/BdvI6k9/ivBkugkbcutriGIkInWSnsK8jCMf2VYqrvug
         akqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120549; x=1755725349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYqNTkjTLKS85lyfSsdQhv9wBcIBmAL31KE9rKBNOIA=;
        b=ojawIHekPSy9hePwOa28QAW68K8xLDmuIy8rg6BmoZx3XNdHmdVNFWbKYvcS7vNnFa
         k54QSylZSDL09wYJUPBWiUBNZ4SCsexTQkrFyZ4vaYaYVbYEkK59LP0ILg5mRLuXEZs9
         1mT0VM4a7h4fUQsskfS9isuV2rjHxJ4XtB1Sxh/u0zIgUzVmX7Juu9iBlajxdRI2Q4bP
         F2U+EkfFhL9JOuULKitXoPpNYwNuLEE7eXCJLf+w9gYLQt9TYlWROAbJg4wS0KIxDmzC
         oD63fM0IWD+6vz67ziEk1DuvijAk/+5V5nJWjRhJvbMBPsXO7/dW3hAKocWLxTnHPE9t
         vygQ==
X-Gm-Message-State: AOJu0YyjJbWkYbIgyPh8EyCXrNucVkmj4OqWyAJhc2bYF7t9JTTtZegg
	koQP4zJ05UwVJPcZjxUiH3969DdPEqbp2roqgcZN3jkuqDCYTIee0NT8DK2g82WC3BOMXpFV6O2
	9Xf5C
X-Gm-Gg: ASbGncuONIIJhG+LuSJ8vYrKsDMCsliNGZOP2p99IZ6zaogqQluMTAfLq/iLUUBYxCH
	s3HIlSWKxcqw1KM/GZM3aNDu4/D/Tj86DCzFrOC9hU7mIGMx+LI9z8LiYkR8IVHHqaPJeLBQ/B5
	ST+oybYcdb7WGAD752b5k1EQHOFYRWIcQIh6X9viM4QlUa1D23Yror74gRD4k90cC3sOcDHtfzr
	5up6of8K7ayTp9HKBanlPda0SPEpOgBd49NsMrEnVzrFUXZ1NcKwNMGettl4aiUJ/7GVM8fPfJA
	4AA9Atee/+VTDRV4+cX6voNFqCfzbGjAlkcHAk8qCh8UUSd6pCIhCBfgM7zeAMbos5zdS2biz/U
	TM6MiorAjNm9ucw==
X-Google-Smtp-Source: AGHT+IGuYFB4EwWDYyoVxwBcfNfR99n6OvZn8Rpd3rGxZaWyiPTd59qCAKO9Gk4kngIvIjedpGHa2w==
X-Received: by 2002:a17:902:da2d:b0:243:3fe:42bd with SMTP id d9443c01a7336-244584afb66mr8180425ad.9.1755120549017;
        Wed, 13 Aug 2025 14:29:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:38b9:9a51:8a43:9529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm336178545ad.114.2025.08.13.14.29.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:29:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] go-helloworld: fix license
Date: Wed, 13 Aug 2025 14:28:49 -0700
Message-ID: <3d1c037a7cb7858a4e3c33a94f5d343a81aac5f7.1755102550.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755102550.git.steve@sakoman.com>
References: <cover.1755102550.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221839

From: Quentin Schulz <quentin.schulz@cherry.de>

The example repo doesn't seem to have ever been under MIT to begin with
but rather Apache-2.0.

The license file exists in the sources, so use that one instead of
taking it from the OE-Core license directory.

License-Update: Incorrect license is now proper

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 0055b32d60..5a9d138b9c 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "This is a simple example recipe that cross-compiles a Go program.
 SECTION = "examples"
 HOMEPAGE = "https://golang.org/"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
 SRCREV = "787a929d5a0dfb8bbfcdd2c4a62e0fd89466113f"
-- 
2.43.0


