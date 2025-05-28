Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A08C5B552
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.935.1748446428780398590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ChnL3qk9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3345017b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446428; x=1749051228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVm/JwBWSjW9+d5IRuaz3HlPtnWm6B0i2IP6Dc7Ka4w=;
        b=ChnL3qk9N+zZ4/7Jl7JS2vac9wVINoH2a9aXe+QHfLXDMKLf1HEglw5QzqWjNlItFb
         Wotlps+tUAJ+8HuRNvgvtq4TIblCMmkH4StR4OoR9VxGju8iUoTY0HpeuMZhdGJyw6gC
         JcZGlTbOztIE8lPNPMtGZZHLYX+y30YWuybpqlHhsMtLzwrfNh7mAfPPscRS5gKXFZQe
         0DR8p+EyVbI+ZxYlM9UGHhHZ8k6Xi0JbVqIocM5V5tRYBaxONhGLGAC959I7tTeaHpoe
         TLcx8j5i2allt/eYmnjv04teqARhHWRbc+b43r676GIt3KgZuvQWdAtYu4/UOIU8RbzW
         6PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446428; x=1749051228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVm/JwBWSjW9+d5IRuaz3HlPtnWm6B0i2IP6Dc7Ka4w=;
        b=e8TK6y1L1+HDzopyDVOZi62atX5DX5RsdRcvBtoYsUHcBnLNyKWl2SDdjyUeIqzWS7
         2oiqE/QlFGHJ0HsZwkQdzmOwlSj0xGXFkxJ1BA5lJfO7l7k/OxP9PrYDdgDgP2w91ISO
         EfWBNOLlV6s9ahAkJ5sGl+ypoc43IPnJS9I8kahFOpR7FeXb2TM1xOLq/bLfcWtmYZSt
         A5WwCY0h07f23jDPO9YYiLkoe2qCdk+2d1nRZ65b6aQz4WXULoRWmWkwkeSZfFmmK/VV
         7oZpD4vN7XMLsYSeVREOoBl/LWcWecxKTfqZzGPqri88LgdnBmqVuzZAn0v0DlnhswPT
         mG5Q==
X-Gm-Message-State: AOJu0Yzs+ue7yx5sXve6NaBrFK3RuGGlWMO4iMzM0haCBic8DIW4FtmN
	3OpAgNbU87Ctgkbh2wPQbZtiPRcCqejlTZ+jt8IIZsjQNikqwM7xlrii4M94Plmei1xeU3TFhmA
	0V29P
X-Gm-Gg: ASbGncv6HVRjQU2RJUTTqeioeCSn7ecPZxkHk9iZlTIwuKHcRa7nM/RMtal+Fbf33IA
	9B9crN5HYTlroqD8ZzeL7QsD3Dlls7HL3o9fZnpCtrk1GyJB7qSBN0p2A6O5GdOox9pYCWDaAvH
	enDKjcQcIKzpBbGZSEukxR5PJvdv4Jaq9r3nmjYc9DzIb6D6X1t0PeJEM+njhNa5LwqMy/wlBnn
	ZqA3V8Jv0YxI8s6AaN3C5Q7QC1rhKNS6I9GVch6Ga6RgKuy5qdJIYko1DsERPPYvCtI1Dt1ZonA
	pCe5SeMzz7qqKPDneMgHVlaAoUYGSGGlq1MV+qKGEBFfJcuKImHunA==
X-Google-Smtp-Source: AGHT+IEDcRsHH0dXA77CgGtIP5xz3gMpZ6DTWjbJOORnODWsQizgGc/Gi287MGqBv+HH9VMjeVZtbA==
X-Received: by 2002:aa7:88cd:0:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-746b40bdb7dmr3446602b3a.15.1748446428028;
        Wed, 28 May 2025 08:33:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/14] binutils: drop obsolete CVE_STATUS
Date: Wed, 28 May 2025 08:33:15 -0700
Message-ID: <a0ffc4e44ba5e06eccf6d87fb16898454efcb1b2.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217370

From: Peter Marko <peter.marko@siemens.com>

NVD has CVE-2023-25584 listed as < 2.40, so we don't need to ignore it
for version 2.44 anymore.

(From OE-Core rev: eaf80096f96e5bebed53076c1dfe7e35e539f383)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 7a19aa31d5..41071fada1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -18,8 +18,6 @@ SRCBRANCH ?= "binutils-2_44-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
-
 SRCREV ?= "819d713b6340ed3657e00ad0bc8d5f2b73094a0f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
-- 
2.43.0


