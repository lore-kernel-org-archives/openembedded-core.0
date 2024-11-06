Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0225CD44D6A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:49:57 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.45907.1730900987445835326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mkQitzmG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7eae96e6624so4872333a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900987; x=1731505787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xz+r4bSp8QpgHxQ+StkRLRrzq4zLF8AWZWqTL5kWTI=;
        b=mkQitzmGsnJtxx4HMP+1gKWNRPI17tbtg1wq6GDtGXkJjdwBqSPqC6k+wb820HgYGg
         q6S+yhqOl6MWUUKKNIrTakcnYbTsji7pfxwXJDqZIbPfxW4wkmUnqnXXihsTnnu/E+FT
         K1a1vASFWIDXD7myuOkwhI1XZaVJ99bJQ2F/ebvVQbRe5AwpqgYnh0sAq/nzJ5RVoAF2
         xJlHYh+y2fSlobiDt4OIvR3zbHRMkS3Hzel+cw0izlgG3qTXQNMlUjRzUvKtQ13VPRM0
         /G8yShq4GW970eCP2FvdMBhhUc7Wdd24oNcJ9KtXO91/VNI28/iW1lYcb0jjhAqp01gT
         DMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900987; x=1731505787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xz+r4bSp8QpgHxQ+StkRLRrzq4zLF8AWZWqTL5kWTI=;
        b=q9Sph+vC5JqJ09FxyzEU+5rMnvahgtkL862dz6381DGFKyjQI7hpw8qeejLbQoNI4C
         1o9fVzXd7k0xT4TQDwZAo8DCgIZfMte37t1CCch52ltCZdTKPnBzG3K3TvdkL11XXVRh
         hPwF0KTPyQhcQqspHujifyEs2VdXsbXlVnsK8Tod23kPrpRGDJqDZEw5x8FUZhdNIG19
         q1reQU9iFLXZzXkLbw7+Kp8q9t/UpatEtTPnnhguTLnX/PoB+giFiDWHTwleaLBJR446
         EDYZTVlG6JeYR+YzYHWUKLjuTeFeItOD5LwLWt/k8Ltmm/y8RPoBer+pEWY0GHechi+o
         mIKw==
X-Gm-Message-State: AOJu0Yx+CR5G4pw+kJEJeSsterFYG3kBkQNgoRaqjpYhvEskxfjODpdY
	ioc1cscaF2yNffJrxlv/UZL3UQO5hV07CD2uQSbUd1B7YxdTw4eJjE66ugC/0x39EBrVBHNVWyQ
	7
X-Google-Smtp-Source: AGHT+IEBzmQgDTqeyJakTfJeIuuNK+p3EJSuHs5NBTz5KD0QejLROR7ARphrbrrZWntraw+QjuzcbA==
X-Received: by 2002:a05:6a21:6d9e:b0:1db:f519:1a7e with SMTP id adf61e73a8af0-1dbf5191abamr6411986637.42.1730900986650;
        Wed, 06 Nov 2024 05:49:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 2/7] orc: upgrade 0.4.39 -> 0.4.40
Date: Wed,  6 Nov 2024 05:49:32 -0800
Message-Id: <ad56908d308d6d51e2d0b3f258ea52cfe6bf0375.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730900782.git.steve@sakoman.com>
References: <cover.1730900782.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206775

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Security: Minor follow-up fixes for CVE-2024-40897
- powerpc: fix div255w which still used the inexact substitution
- x86: work around old GCC versions (pre 9.0) having broken xgetbv
  implementations
- x86: consider MSYS2/Cygwin as Windows for ABI purposes only
- x86: handle unnatural and misaligned array pointers
- orccodemem: Assorted memory mapping fixes
- Fix include header use from C++
- Some compatibility fixes for Musl
- ppc: Disable VSX and ISA 2.07 for Apple targets
- ppc: Allow detection of ppc64 in Mac OS
- x86: Fix non-C11 typedefs
- meson: Fix detecting XSAVE on older AppleClang
- x86: try fixing AVX detection again by adding check for XSAVE
- Check return values of malloc() and realloc()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed7e4eb12491968c5f962b7e89d557c2c6d86a33)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/{orc_0.4.39.bb => orc_0.4.40.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.39.bb => orc_0.4.40.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.39.bb b/meta/recipes-devtools/orc/orc_0.4.40.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.39.bb
rename to meta/recipes-devtools/orc/orc_0.4.40.bb
index 320abf536a..e437831cd7 100644
--- a/meta/recipes-devtools/orc/orc_0.4.39.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.40.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
+SRC_URI[sha256sum] = "3fc2bee78dfb7c41fd9605061fc69138db7df007eae2f669a1f56e8bacef74ab"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.34.1


