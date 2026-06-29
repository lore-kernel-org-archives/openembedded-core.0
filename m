Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22290C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38590.1782742833620007593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BFcPC+KB;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so211292f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742832; x=1783347632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bPYCRu1Ec0lavrNgNrjyY+2sML1XSYu6EzSs3pv8VE=;
        b=BFcPC+KBqjWHOFqcgwKBPjBnFbD6isbcTpJtQ4fZ9RQmt0j/RgYQBwpsQPG1j6ah/4
         MNXkgTWwTgpQZWAF2m/bFBhJQpZF+ZB+LhizTv+I61HqH7qf2h3kpopFURjqm4nynhsY
         pznYCv7Pla4ZVtDZXxkmKwP+6KM92b6qTOKo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742832; x=1783347632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8bPYCRu1Ec0lavrNgNrjyY+2sML1XSYu6EzSs3pv8VE=;
        b=fJvn/D/xEGFwYuNGtrh3TEPXdaSlaw716TuY5ErLXJzw5XcjQRhvu5Az2cMRA1eJsX
         rYmRflFjdYOR9w3jVlkugQRu2hSM7FQNamBiymgQI/uw16V6+4K68qsqY4RbuQLuXvaM
         DYKOLJp0WcVj6ejubbthCKb4GWWU+lWHGKZxc8+gVJdShm8GDBKDEEehNXSyI3q5c1rS
         rCPgtuVZjtb0bYMGVM4X8hISprZozdOrR0khHI+KFYviIup6blqa17DZ6h4hO4WJsonJ
         zv6cBTzgGZriWxcQrLw96/bd4vrIr/i6+U1yhpnqoeuPxfPGjd1FUe12XKHifWgDefC9
         5rJQ==
X-Gm-Message-State: AOJu0YyrZqorjtyg6qRONN4eD4IWyqJRo4axiSz+Y8gZItJ6WdwYm03B
	BYer92gzjAnP7uuIbvSxNACdbIGHnSwFpGYpRzzcimX46eo/7hF3tJRMjS//TjzDUBtDqaAbmgj
	Yi8GoAfo=
X-Gm-Gg: AfdE7ckVD5qCH9S0OLfA9vFEmg4350kCAofL6bfjSLPtUfQ3QIFw6+iJwm5hPhn5KYL
	IoMYfA+KQbbmZlbd33CAMqoaMTbYOgd64qIHG3cFme8NffbRl1Bn/jYic4AxrtDjpfaY0++jTwt
	7TYYHlprqsrlfvUJIdbhDWRdAOQjXG0S5riUbMtA9xRMIXP0XvWa3fye9xfGBgI6DQa4evcAROp
	Vx5OazYayh65SAkDu50Nj3M7pYoUtXsfYBKjO3aCYFzDGPFB2UnzCSkl+0Vwyeg57SvslmN9ERy
	zwPxgXRBOzl8kZ4GlvRu8+/UN9LIbwSVc1QYEKntAxgE1kCzoEYBTijWRhYY8immW38jfmcDSsX
	A4F2S+bOjD2fKiyyuy6Saak+2nvwlDaq6YEflaFZm9wKF1L6W8ZcihrvRjsFJsrmSWrFcTltAJ8
	uE9533o83vCK8/GAP8c7/kpehx92v3ao9g519DzDDegFCxWdRvcdENUKJeYGY0TDRpu9VONi2s1
	77Bje1LrG28J1bI6LQ4+1k=
X-Received: by 2002:a5d:4565:0:b0:463:e582:a4a4 with SMTP id ffacd0b85a97d-46fb6bf30ecmr13549369f8f.10.1782742831809;
        Mon, 29 Jun 2026 07:20:31 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/19] binutils: Fix for CVE-2025-69648 and CVE-2025-69646
Date: Mon, 29 Jun 2026 16:19:53 +0200
Message-ID: <cbf2b04bd793a114d8ea5f59476274a9edfbcff3.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239796

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
existing patch already fixes the issue associated with both CVEs.

Rename the patch and update the CVE tag to reference both identifiers.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc                | 2 +-
 ...CVE-2025-69648.patch => CVE-2025-69646_CVE-2025-69648.patch} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{CVE-2025-69648.patch => CVE-2025-69646_CVE-2025-69648.patch} (99%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 7e83f72632f..342229af26a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -73,6 +73,6 @@ SRC_URI = "\
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69644-CVE-2025-69647.patch \
-     file://CVE-2025-69648.patch \
+     file://CVE-2025-69646_CVE-2025-69648.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-69648.patch
similarity index 99%
rename from meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
rename to meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-69648.patch
index e04d7ed6c21..b02b5e05317 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-69648.patch
@@ -19,7 +19,7 @@ length field.
 	(display_debug_ranges): Check display_debug_rnglists_unit_header
 	return status.  Stop output on error.
 
-CVE: CVE-2025-69648
+CVE: CVE-2025-69646 CVE-2025-69648
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
 
 (cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)

