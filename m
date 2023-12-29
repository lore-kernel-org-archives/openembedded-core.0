Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFDBC47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.151499.1703864714707789551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LqNm7XsH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d480c6342dso16484935ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864714; x=1704469514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6EVGNdP4CC9Ny5BHEVGPQvX+J8SdLHvuE7MXDnfCUE=;
        b=LqNm7XsHrY6hXvE2jHPibw6pJroT5yamGM2CkiOBjY1MwGJv2SJghYkgK/FX9jLY9q
         UHK+S6OISwUP2bjUdUgOY/Gvid3itMas7NeJDJMzvpam44V+KRRF/fFVNI//09AjkOk/
         kO9L1MbOdYj8Z5+p4XOms4LiLT0+a/xw8/iDpHPL8/45rB+KPpx7G8YX5ySoA/ISp4Pl
         Eqkd7iZj2V8cHHfcMTIo9wWlYqEWttLX8tC7S/opUHZjND3H6oAhjDA8boAoQ8f11LU2
         TcBMbJJoBLvS5dhoL0OJ6X3d2wZ1YomYan2o7QWhkzGwqxh5KaQCeOLkEYNvEZo6cKNq
         CihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864714; x=1704469514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6EVGNdP4CC9Ny5BHEVGPQvX+J8SdLHvuE7MXDnfCUE=;
        b=gnK0TOaWPsNVdV6VjP0OvYiKuSA/eHyZ0aZ9dvHRFM9N/2HDPd/zqGr+d8HfzEI6Vw
         kk0xHEakrly4kEMeEolX2NTZoxrnpsfZhFAOSMKF6mMS59ZDZ6CGfaE4u54uO1p44NiP
         MpjP5b7agSUxhA/w/Pd6jh4wobbfwuA5ZL80S4axxTU+tQIXtTULaxKUyLe2z3Mr1BXM
         fwS1p5bCue/AJBjpZk3qR1T6xxwa+XcXSFudeAAyAHbRwejWR6uIWLMhPaaCtosVKRVq
         8kWDWHARJRneh6G/jibJXT9WKqqakX3sgljVsduwQ14vpMAKAAs8uOmhGbIoNVgR62+l
         qxnA==
X-Gm-Message-State: AOJu0YzisrutFvovCuZbmmdTqud9aOAyAuVgJv0vXEVBMpLR44v0s/CB
	YlYZFdiVs7yWkxzBAJn1nLdpYyAQ4Tc1yWHAGuHeYjVtya1r6Q==
X-Google-Smtp-Source: AGHT+IF5OXhKGNdnPHRuUAnmNxRut4C4XCKVwRQJ5iP3PZkDTx03JZfDeEh3kBPwALzw2dNV+w/rng==
X-Received: by 2002:a17:902:6547:b0:1d4:1f06:f4e0 with SMTP id d7-20020a170902654700b001d41f06f4e0mr10319447pln.137.1703864713861;
        Fri, 29 Dec 2023 07:45:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/41] linux-yocto: update CVE exclusions
Date: Fri, 29 Dec 2023 05:44:20 -1000
Message-Id: <d705c4071d0f829ad3348af9899e6a3a4ea3fa48.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193023

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4cfc4187ac90a4504b93a01ff6333d14928728a8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 4 ++--
 meta/recipes-kernel/linux/cve-exclusion_6.5.inc | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 650b83a900..bf23742d70 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-05 13:22:34.961692+00:00 for version 6.1.65
+# Generated at 2023-12-18 14:15:17.069657+00:00 for version 6.1.65
 
 python check_kernel_cve_status_version() {
     this_version = "6.1.65"
@@ -5126,7 +5126,7 @@ CVE_STATUS[CVE-2023-5633] = "fixed-version: only affects 6.2 onwards"
 
 CVE_STATUS[CVE-2023-6111] = "fixed-version: only affects 6.6rc3 onwards"
 
-# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.1.65"
 
 CVE_STATUS[CVE-2023-6176] = "cpe-stable-backport: Backported in 6.1.54"
 
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
index 046c3f95c3..7711bcb4d6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-05 13:22:43.339114+00:00 for version 6.5.13
+# Generated at 2023-12-18 14:15:23.952852+00:00 for version 6.5.13
 
 python check_kernel_cve_status_version() {
     this_version = "6.5.13"
-- 
2.34.1


