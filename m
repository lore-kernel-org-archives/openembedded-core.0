Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E66E7719A
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.18138.1735998144529714704
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iGvi/gQL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21619108a6bso170872085ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998144; x=1736602944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et22wq0conCYKjEtj1MdWbQX3kkOU50wn6i88q7b/A4=;
        b=iGvi/gQLWuj54YF8jSX+RqRtBtCtAAu6EHqY7gL3jM9NOBNJzZRy6cV2NJTXqtnESt
         9aaK59ULkcHegToqtes8b7TnRuv5FGBMYKkmTgX7wcSgkGH1ONV9wOmG1dXUZM8Qhv9/
         RsPgt4UKRcfbPIHuDiCdzDmgrB4KIGKQJfVGfwJTD56+ZcdQS11zg8TkfNsoxjpQdYEQ
         wi6cswarn5Dc6jH67+wJ3vkYC9J5NBzqZWl3x2vHLs9JKzPBGslBVm3qIq9UrirSzjRx
         blJmdA7Fs4lgnhqeosgZ09V1ZnNs+1A10kDf9WRuk8YmPgoplNLDf2m/OALXJekQi5xr
         TNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998144; x=1736602944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et22wq0conCYKjEtj1MdWbQX3kkOU50wn6i88q7b/A4=;
        b=ckQsB5A3wkabRANsjSnnsoqykjwEOX/MoniVBdnflXbqt9fYzDYbZyZTPowwbMG2a1
         GrxmW1qsRXKQ8g/bhMRGa2rxX2zMf1aDduzV/nbATcyJqSeyabyddoiWsO3KUGjvR4Gp
         2P20pO5uGBOMbLBpW3wzbaPyou3D1kW4tOjgUSbGWw3oFKoFpUGlVNEfht7l1hHTfJ7Q
         5AX1Wzs0qT66ZH5vwhupNZdYPRGJk42uynbWf7aRKa2mfiuhj1HSRICgTbWi+zJHVFNk
         bywRxP1txySHOQhTJrUmIq3BjqgVMYgaEiwW4EqtuTXOTLrCTwChLl8g4HQLXyQa0UgZ
         fMCw==
X-Gm-Message-State: AOJu0YyPLqQiyp3cAOTZk0TraZ1eZl+dNYdv1zw66k6y2PFRi+D29h/X
	M9N4+42vdCsJBjcpy9jLKdGO9RqZw65l/QW8TWvkBj6rRXSBZ5vR29cqhzuUENcd/L6xYPEHrst
	c
X-Gm-Gg: ASbGncuyCX5Tf5CKmReo/LfuluVNjECtDPAFLoSucjD9DMu+r/Be/Ra1PB6AIfp/w5K
	CPbZaXufqeQg+jUUOKBRJq3Vcjm41nbpMPGhdpoNXo16B57FSd5cBc33988pSjH6Bul6wHgiJOl
	19yeJthd926UWyiwwHaSPVK3/KzGL58Rf+XMwHTp3b2GU7KiVIq2nZ3xLOG8CsPej4EYRoZj2Ol
	HjQ9qG+CHDrkDOraeCgMReWyzkeZ0ZzCXdZOWxb299h4w==
X-Google-Smtp-Source: AGHT+IH8/vfSyAbe0vkv7DULUEkiVNiiSB3becKxLN6B+nTmrHUMuAozU0qbgiMtxlYQ8bUAcunC6Q==
X-Received: by 2002:a05:6a00:4ac5:b0:725:b12e:604c with SMTP id d2e1a72fcca58-72abdd3c467mr71734663b3a.4.1735998143887;
        Sat, 04 Jan 2025 05:42:23 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/25] gstreamer1.0: ignore CVEs fixed in plugins recipes
Date: Sat,  4 Jan 2025 05:41:40 -0800
Message-ID: <5c582778954a05f102e292a0516b73b010d289a0.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209385

From: Peter Marko <peter.marko@siemens.com>

These were fixed in previous commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0_1.22.12.bb               | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index e5a820e1ad..3f28459e2d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -74,4 +74,17 @@ CVE_PRODUCT = "gstreamer"
 
 CVE_STATUS[CVE-2024-0444] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_BASE"
+CVE_STATUS_PLUGINS_BASE = "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
+CVE_STATUS_PLUGINS_BASE[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-base"
+
+CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_GOOD"
+CVE_STATUS_PLUGINS_GOOD = " \
+    CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
+    CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
+    CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+"
+CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-good"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.43.0


