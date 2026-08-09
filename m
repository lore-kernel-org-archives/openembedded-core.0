Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3E7C5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:27:29 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19088.1786318039254052868
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XD9ESWQ0;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso11943675ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786318039; x=1786922839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGWeE5BGhcQN+FDqvH3SQReU9gVCeRm4r0mYOu8Q0mM=;
        b=XD9ESWQ0rnb0uWb+asXx7Rjr0wFDB9H9DnNolw/oUrS5PXdxJdyPMJuVovyO1Dokut
         euv0Xuw7yJ3e3El7DXuLM8arz/iNosoIoPycloc5JAJgci13MMiAGOcO0ucAdXsb8Rxq
         ZOUHGpijlK3pQ3Dnga7RS1C1TMwM6if+s5PbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786318039; x=1786922839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGWeE5BGhcQN+FDqvH3SQReU9gVCeRm4r0mYOu8Q0mM=;
        b=P3WZmbY4K0s1U5u/hCr/vkmZkYKbnNzSZBj13fhS8zuowcfTSfe+pCfMiGCKBsxl9U
         J6ARTc7QDQ4dQdiygSTbM9H3QCdf/R2f4GKXBw+pa9W34Y1BQF4D1T7kuTxIAZANXn6n
         mEL69o3/6RPcZ+VAuLSN0GSkDFAoD2adkZ/Mte841ClXiNp+U6AGUmGibHqUI7Muop/J
         1QaGOlSDsFlBFjFTwMCUcCeB+vTe8vCNaVj/Nrc+2FYQ7V2qYEwJo0ju1C4s1BXFBhBb
         DkQMZf4Pf4tqdDzRTBhkXOu1O69S3uOvI0F8XP+N5Bl2XeAW29fwo+UwTRKvJcpiBC4E
         /9+g==
X-Gm-Message-State: AOJu0YyokrKsDCu+abjQ8YHv6bb9fV4B2Tgc2xDGDuXJBIyUskZye+fa
	7uAsurzZBa+TlqcdkEfON9wevMxqmgUACMckhgOZFIdi3mvm4JhEZ3GUZWALk/pysY1wwYHJ7mG
	R/yBM
X-Gm-Gg: AR+sD12oPoad7zbVAN+RiRVfyUkMK/CO6wgEf+Q0wsptoYjzJPzLTT9c8twQQBwgPPn
	BGLc6zJWmO23Nbxws6hFt4lO3kEZI56QG1fbLwFHtwLQFnieozshW8kcgW/ZSoWlw01ZwzaHMha
	x7CYsaNw4g8XzfzBVvyaeMXRgJfLlmEZSjowN5uCL7MMl3GeSUif4U9K+ddt1pM7xgz6PbzMJua
	T5x1uTZEVNL1YcVouWSB3l0Yscdq+6cT2fcYsJc3rqxpel5nNj3GM5oAal+7izt2epv94bqfnH3
	h3QfpuTNiNO/LT6YlBAlqh0qB3KWjHQ3VhGY5JgAVoiSvH0ndLT3Vx0QR52AX/3o4mBP/WZQR5m
	hDyPrJRMi0J2eVLHo40oC+Yglm47qNK+aTU8kmJdHsJxCyYeVGqzbJUuj9Urmy3XTJGvcL48SIt
	ZdFZw0gjfidsz+p8oHAOScHJLTK/85o/aPgdSYxgBpgIj6V6RnYOxt7IhPANxkGExvTdIdRQRrY
	fC++A==
X-Received: by 2002:a17:902:f612:b0:2d2:a982:a388 with SMTP id d9443c01a7336-2d2b2eb169fmr184024025ad.15.1786318038565;
        Sun, 09 Aug 2026 16:27:18 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccae6f8sm26373605ad.1.2026.08.09.16.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:27:17 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 4/5] python3-click: fix CVE_PRODUCT
Date: Sun,  9 Aug 2026 16:26:49 -0700
Message-ID: <20260809232649.368812-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243086

From: Tim Orling <tim.orling@konsulko.com>

Fix " vs ' in DESCRIPTION

Recipe (PV): python3-click (8.4.2)
Before -> After python:click -> palletsprojects:click
Newly caught: CVE-2026-7246 (command injection in click.edit())
Status: patched (fixed 8.3.3)

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-click_8.4.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-click_8.4.2.bb b/meta/recipes-devtools/python/python3-click_8.4.2.bb
index b13bdc9285..0578a0421e 100644
--- a/meta/recipes-devtools/python/python3-click_8.4.2.bb
+++ b/meta/recipes-devtools/python/python3-click_8.4.2.bb
@@ -1,8 +1,8 @@
 SUMMARY = "A simple wrapper around optparse for powerful command line utilities."
 DESCRIPTION = "\
 Click is a Python package for creating beautiful command line interfaces \
-in a composable way with as little code as necessary. It's the "Command \
-Line Interface Creation Kit". It's highly configurable but comes with \
+in a composable way with as little code as necessary. It is the 'Command \
+Line Interface Creation Kit'. It is highly configurable but comes with \
 sensible defaults out of the box."
 HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c491
 
 inherit pypi python_flit_core ptest-python-pytest
 
+CVE_PRODUCT = "palletsprojects:click"
+
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-terminal \
-- 
2.47.3


