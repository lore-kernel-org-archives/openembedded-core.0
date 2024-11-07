Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EF9D5AE57
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:11 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.64152.1730950688335144365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xkdpy2Ku;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e467c3996so337992b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950687; x=1731555487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xz+r4bSp8QpgHxQ+StkRLRrzq4zLF8AWZWqTL5kWTI=;
        b=xkdpy2Ku2U3u0q12wRfuTdPIZCps6lGxlxamG58HtiDFXqK8QqBvfivPTf4pMxef7J
         B1ME/FANua2HVsp1JO9yXbjTogBg5FZPQkdhS0jUR4DI+eLyj288NqJmzx9Oe6K6v5nV
         hn4WgzsvSEEjZU6PKouzewOXoddhttOatWYwGbLwsgz2O/58Mq0JsZLBq1fCKFQEr/7f
         qn961neQXOAXA8KxxFpnKp/4usMQWTeeyFbDKcYF5EXBUGKDUvPoNZecPepGIpbRsvUy
         N1euB0g4WZMrxyLE/6TCxrMQqufUv3k9Ekp9GKXgNmol9LDT4Qo4QHlWD2Jx+DGa/pMY
         R+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950687; x=1731555487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xz+r4bSp8QpgHxQ+StkRLRrzq4zLF8AWZWqTL5kWTI=;
        b=AKxaeWCXxupxOnY07p3weYk/UxcVkrqmtHE0qsl7HOuAJWcKRictpudlRy5fVCQx8A
         Ua7eB5SQjQERg9B05fgmTteqBR1CNHVPTg2S2OWdqYeYxHuzT4OY6HshdbOxP7Ypufy6
         IjU1k+MFfM+8ooltNtgVvqSt+LlF/7dNNFQfN14K3Bslc/p3gYe2C4aSahsH/6tAjW6O
         dDdIRlVEBLqlcVR/bveR20r7BSmp+76nB6jk6kX/ZOyS4S4ELq6wClRvGPd54dfHPBnB
         U9KjaZMhROljIC8jAw6kSTYsbBXpOJFoUGjAptP7uhPD7PbDL6ccqwg6WzuJGciHObfo
         agrQ==
X-Gm-Message-State: AOJu0YwwF4Fz8Svd9erMl8lIO9SEUEh61BYnYiXaY5EAuWEahS7jeGP6
	q2MBSZ4qPneEaygzieayik7NE+LWuOP2Kn5mKIrzuAeKKrI2w85ls/0ulaA72NydDPLKXNrY9Hx
	M
X-Google-Smtp-Source: AGHT+IFaLGJ8X4QnZb821XSY6OdMERt/g636TYnkdVfDogC9ljw17qSJ63Yme0MJv5bxSGVc2bMAHw==
X-Received: by 2002:a05:6a00:608a:b0:71e:5d1d:1aa7 with SMTP id d2e1a72fcca58-72063028f86mr41913568b3a.17.1730950687491;
        Wed, 06 Nov 2024 19:38:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/10] orc: upgrade 0.4.39 -> 0.4.40
Date: Wed,  6 Nov 2024 19:37:44 -0800
Message-Id: <a11152a65f27521ec9a546b4dd3c16d04bbd9db4.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206822

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


