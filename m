Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E1CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:36:24 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8011.1790936092315211807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=NYLmIUK3;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.225.141, mailfrom: jennifer.chukwu@amarulasolutions.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so6267735e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790936090; x=1791540890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aaB92IP0Ir4r3PZ/T+ofZwfgjFM5LJVpcAdnAPbLjOw=;
        b=NYLmIUK35AVD1QFi06HkLtlJ/9+cHMWRgY+tGWx+MuttH6Ml0ZBnYxC59zZGkmt1Bu
         NF5e1f2res1eI2xdK49OnYnw8fG64asK8gFCPd2hFH2Hbw8EhxOzpo3/Olxa37J5f5oi
         JIidyCAh6+MlrSuc5yHTFYoxtiv8u/aP8JqWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936090; x=1791540890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaB92IP0Ir4r3PZ/T+ofZwfgjFM5LJVpcAdnAPbLjOw=;
        b=uJCaDwCJ//XUq+svjP8ecKgz8J+lxKWAywUsGkIpN9JPtkGMtYXkcWbEk/QD0IoQ98
         Rre6lu//AZUHYcZ4ZyaMe76Z5ziGer1Y4RPqDBY64c0X7FNrS1VR0EODXgOtGVoPPogm
         99XSelQqXOJHyNN07E6yjQNBT5NOzPSvztWaL1dQaSJFtSzrqtwx5cdfoBVGYbIO5cou
         Evyr+LBNoNb+SVey7PhTH/Xqjv94JSvLE+3dRBhapgGhjX3A+adJwFAlTU/dfufllIXw
         YiHV6v5V9SuSslNzdy9Yz098bWX8lWskM00dwqYYMnEJLok+C3Wx4SYa1/938vM98ljG
         nhCQ==
X-Gm-Message-State: AFuF++kCT/1LvmQwbOnOHILLtwVu/hOK8BBb7k8pWeCK9Z8Q7hwpceFh
	o2SWxT1q4mASp2iTyua5fNPoq/D1VuakdvRzFwzR6NHvv9ziuMYYsBJLtReLiIYQtt7AadcSqKC
	mRdCKZBI=
X-Gm-Gg: AYBFou2MSfwslMBtb6PqooHBKQKPSBh/yRd4NcDUTdDgNKAhCtTeBIG1lh4yvxERyIZ
	d4sZsuT2W2RdXPfwqDhPHseaagdmPTxyUrA3uRY0L84lDG+39vPrM8/OcFH8PvQRG6w2xlA7v+c
	FjWmPhEAoIBFUYu6c7cRjOsaaK73CsEqS2DTv1k0kRJuP9isfNFW1NIa1rksZQCdRo9h7dgar4W
	fU0snN9uWo/5/P9PriIE6n7RZUym3SvwMJyS2MPmA4jwbVYyN/Qahxamgct3YJpo6OACtgBSo8k
	2UOkIznaBp8Xc/VzYn45/vRQWgicDTL0UC5UGHyE1WE5PZasyiOgP/5Hn6SY1+H7JHanXVOBCic
	ggQWboXtznhQu6VOsAU9uaTmwW/4+vAVlNo07NNKRiy4qp2nesaALMTVZORNcNCZEosUNfLlt3f
	3Dbm1dGYGqFeZ+CbCXgrtqt8RembPhsq3OwQXtBOgO+ttms8rA0Y80ItDx7zjD1Sgr9Yf6yXcVd
	WI6ahaa7VV8j915fRxlfu4TzRIR3yeDUO5iZoHBMSSnxSraH+m8
X-Received: by 2002:a05:600c:8b82:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4a027566388mr40128105e9.6.1790936090424;
        Fri, 02 Oct 2026 03:14:50 -0700 (PDT)
Received: from jennifer-chukwu.amarulasolutions.com ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm79276845e9.8.2026.10.02.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:14:49 -0700 (PDT)
From: jennifer.chukwu@amarulasolutions.com
To: openembedded-core@lists.openembedded.org
Cc: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
Subject: [PATCH] patchelf: upgrade 0.19.1 -> 0.19.2
Date: Fri,  2 Oct 2026 12:14:41 +0200
Message-ID: <20261002101441.1943643-1-jennifer.chukwu@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247101

A bug fix release for rewriting executables after stripping.

- Fix executable corruption when patching again after strip removes padding
  between load segments, as seen when bootstrapping GHC (#593, #667).
  Rewritten sections and program headers now use the address mapping
  of the load segment covering the ELF header.
- Avoid allocating an unnecessary extra page when growing executable
  sections, while keeping split load segments from overlapping after page alignment (#667).

Signed-off-by: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
index 741c1e6612..a69f3b9d75 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master;tag=${PV}"
-SRCREV = "7688b17c18d16f67fa8d5a82a2404c2e3a18648d"
+SRCREV = "382d8bc12db9e720515da49d9c272ef4a622c3c0"
 
-PV = "0.19.1"
+PV = "0.19.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
-- 
2.43.0


