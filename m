Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE12D3A68A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.1941.1730228416265370390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QtXH2Ud7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso4293203b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228415; x=1730833215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xz+r4bSp8QpgHxQ+StkRLRrzq4zLF8AWZWqTL5kWTI=;
        b=QtXH2Ud7M8g0uRFNw0wDBaAZstOKTIEN1AUHJvny4kVX+MXmLAbCAaU09sY0+HIwqq
         S4UHF6BE74Mhi3DT8xfyYJEP0eb9UwZWhwdsk1sKyFxAJapTwixG/5TMDlpuYXevdqDD
         AypkHpDIUwM0LUkXwnOuOUrUuWJMZ9LEg9YaO6SQMv55fwYQm7z7J/l5TD22Nsz2cJej
         Xh8EcIKpvWM9FxllkO7iCgVo+qRS6/8RQW3Y7F1Bb/qWLcDHutDOzj35xYYFd/uZxa3P
         LnvXaqqzonfwh/nFwyYEJvwmdY/ungz6XgAyZZDIMste8Ich+XtIDZDGX9Spmb26oVEw
         v6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228415; x=1730833215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xz+r4bSp8QpgHxQ+StkRLRrzq4zLF8AWZWqTL5kWTI=;
        b=m4buXsZBj90T4I7ydbDK/ALimKvnBzYcd5Le4bdkdIu0cYIspX9LluvKXViWw8RMAq
         /4RIynp0cDXH+tDnKfwbFcYMtENdjOaR2KMmaHd/EkXFA4UVrY88LCogVPi754Rn2mU/
         7lf0i59Bc0OFSaVzCW8gIque68LVSeVDn3ESkgVErRBchSrFyeJLqr2hsyzLc+SQO5/a
         p5cC27pFsuxL+vw5Q6pmcGnNRLay6JFR8xMe3EKTyCH5a029GMzIfvrNE0tTS9AGiYQ9
         bS5ic3M+UKKz+pHAnDMLW9BeXbPfsAjfhfzThpYf+PRY7vTrNDGo4U8c8CL7ef5VmqMb
         csnA==
X-Gm-Message-State: AOJu0YwiOf3xp0zJL+772lge3TlGY3KwBkz5sn3BDIbdPgsQKZA6aHsw
	+qTn9PAPzLgIEkHnoMoi8apqUiP+MuzNd3Ax46a/m5evBfkUNoAKGt8vBMk2nTEVsc+CWIx+DFw
	F
X-Google-Smtp-Source: AGHT+IGAhZYnn2QI/b4gN5Fd863w106SBflC2qFQPYMBsvbh2ycl0Na6jLVrjivRAPIlAz86M2b4BA==
X-Received: by 2002:a05:6a20:d98:b0:1d9:1858:2f75 with SMTP id adf61e73a8af0-1d9a84b8ca8mr16295749637.38.1730228415336;
        Tue, 29 Oct 2024 12:00:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/19] orc: upgrade 0.4.39 -> 0.4.40
Date: Tue, 29 Oct 2024 11:59:42 -0700
Message-Id: <ec300eadd0ab51583502b833798a6b46956f0f47.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206519

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


