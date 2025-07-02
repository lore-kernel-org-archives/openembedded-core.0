Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE24C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.15030.1751425964217363150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sv9XXIUI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748f5a4a423so2488130b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425963; x=1752030763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ey/lA1EqT6Ivs56Gmt5QrxBGsk5pLpxzUsCx7m1ZnCk=;
        b=sv9XXIUIICoyhSGwA/k9qH0UUo/lAlVk0VnLO9+hnXalChz+Bzc3vD8rCJ6WF8hTzo
         9srJiMvBceq9toUeUhossHZ7fbZq5dCL4HW7YXvbvIbpqruEJMxO9leQcmjMhMc5pOPZ
         B7lMrRcCC5/IDXIe8dxBVoLllLsuX1sQXz8EIDsh9+HF8bKee/WOuSViJK6Uq8uJTAs2
         w63q6fCeYo3m2IeEvYuHk1Q/pFdJy/SSzNFxXsWbpXIfYfMDIRVPp2JDDZFgRrJ7TgR4
         takClYkPvpFbaqhMT8S/Fy0oePXIuF+AhQ14fIgCZnR1bgBshk3G5v+DI/YhWURns2EO
         4qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425963; x=1752030763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey/lA1EqT6Ivs56Gmt5QrxBGsk5pLpxzUsCx7m1ZnCk=;
        b=PoE0Z8NfHNG5ZKXIKH3zWYYGSytb+iupw+AB6/A2spj8+mHo3ftJSz4bfOxPQmjYfa
         9sK4Gur/oJKaW9EC0E7ktDRsP+U1kIIP1OyCVG341W//sEGDWStzfCvHHIzTXpG3owe+
         RXuc/wpMbTDUvuCENBh9Q+ecLPro8f0TLlINybYM3EQWH+Wss0yTqXTP1ypq9qRxN2Iw
         L2fr2dUeGgjvyXZrM9+bK6gEgnaSQ5hrLNG6Oa0yE1Jh8YoyDQO1bztT+AA5Ohzq/wcA
         r3aLCSdCeq0uBLPNdV82anXRf+urANnkkv8k8Z5XCxfXo0jqn2w0urhYJRUUlG6LwgCa
         R4cw==
X-Gm-Message-State: AOJu0YyPm68MnOIgClTv9xUze+Wx6T5FUsWL8b03jZilZ9fhz7NZs7UZ
	DCH8UjwVdSyICKpT4758l+eNjwwJG2cmhvY/u9nMaIYNlfR4yMvzG7Pxw/boMIY7MmCk0z3sqgc
	gHUOv
X-Gm-Gg: ASbGncv9YUm5D1rhNWPCan8KCN2PmjxiPykmH0yVtLSeGEnBsDY+88KRgklgKMzZi5m
	9PAHKAJZSs6eKA5SmnCPA3lYYfTMCWzj5MEFuvGVnZYH+1n3Nt9q0wtQ5GYcekVMxT8xU3zCl75
	T1hJnPQYcA8gLrKyTZBAaRskQ3kmV4esuCi3SOYlgVdFlU0Kk9Mv97CaxkQoXP2gdKMgumOxyWC
	lSKCbc9vdGqeRrp3slInNqtzMF6e8xEiMkYYTFwM1muQpCFrJScQgj3QTf8zp2utwUeudPYwCCa
	3JwVJ4cK9j8b/uD+eFeVkn4LAuBhWP63BxgpVSmhLK0KC0i+uD8YUkjidLvJgTVs
X-Google-Smtp-Source: AGHT+IE4SIYTrjU3usgkghbJmSjoQnPnI/h/Nb5HHGXveAbtdFIkwhf+qYRn0MBrXJJIo51+mEL0HQ==
X-Received: by 2002:a05:6a00:3c94:b0:740:aa31:fe66 with SMTP id d2e1a72fcca58-74b50ff6458mr2042176b3a.4.1751425962483;
        Tue, 01 Jul 2025 20:12:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/19] linux: cve-exclusions: Fix false negatives
Date: Tue,  1 Jul 2025 20:11:57 -0700
Message-ID: <562f5def8b16ddf23d841ce01419879b7a3aeb2b.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219766

From: Niko Mauno <niko.mauno@vaisala.com>

Amend the generate-cve-exclusions.py checking logic in part of the code
responsible for iterating the "affected" defaultStatus part of the JSON
structure in order to mitigate occurrences of false negatives in the
generated output, as well as occurrences of wrong reason for negative
result in case where the reason is actually that the checked kernel
version is in backport fix scope.

In tandem we regenerate the content of cve-exclusion_6.12.inc using
https://github.com/CVEProject/cvelistV5.git repository main branch at
git hash b20d0043711588b6409ae3118bc0510ab888c316 to keep the content
in sync with the script.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1a5939535d67b9c0e6d8c2729cff9749a0ebaae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 70 +++++++++----------
 .../linux/generate-cve-exclusions.py          |  4 +-
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 49d8bfcf0c..c03ad19a3d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-24 07:35:37.850677+00:00 for version 6.12.27
+# Generated at 2025-05-24 12:02:58.590640+00:00 for version 6.12.27
 
 python check_kernel_cve_status_version() {
     this_version = "6.12.27"
@@ -11234,7 +11234,7 @@ CVE_STATUS[CVE-2024-57975] = "cpe-stable-backport: Backported in 6.12.13"
 
 CVE_STATUS[CVE-2024-57977] = "cpe-stable-backport: Backported in 6.12.13"
 
-CVE_STATUS[CVE-2024-57978] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2024-57978] = "cpe-stable-backport: Backported in 6.12.13"
 
 CVE_STATUS[CVE-2024-57979] = "cpe-stable-backport: Backported in 6.12.13"
 
@@ -11296,7 +11296,7 @@ CVE_STATUS[CVE-2024-58007] = "cpe-stable-backport: Backported in 6.12.14"
 
 CVE_STATUS[CVE-2024-58008] = "cpe-stable-backport: Backported in 6.12.14"
 
-CVE_STATUS[CVE-2024-58009] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2024-58009] = "cpe-stable-backport: Backported in 6.12.14"
 
 CVE_STATUS[CVE-2024-58010] = "cpe-stable-backport: Backported in 6.12.14"
 
@@ -11542,7 +11542,7 @@ CVE_STATUS[CVE-2025-21685] = "cpe-stable-backport: Backported in 6.12.11"
 
 CVE_STATUS[CVE-2025-21687] = "cpe-stable-backport: Backported in 6.12.12"
 
-CVE_STATUS[CVE-2025-21688] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21688] = "cpe-stable-backport: Backported in 6.12.12"
 
 CVE_STATUS[CVE-2025-21689] = "cpe-stable-backport: Backported in 6.12.12"
 
@@ -11570,7 +11570,7 @@ CVE_STATUS[CVE-2025-21701] = "cpe-stable-backport: Backported in 6.12.13"
 
 CVE_STATUS[CVE-2025-21702] = "cpe-stable-backport: Backported in 6.12.14"
 
-CVE_STATUS[CVE-2025-21703] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21703] = "cpe-stable-backport: Backported in 6.12.14"
 
 CVE_STATUS[CVE-2025-21704] = "cpe-stable-backport: Backported in 6.12.16"
 
@@ -11784,7 +11784,7 @@ CVE_STATUS[CVE-2025-21811] = "cpe-stable-backport: Backported in 6.12.13"
 
 CVE_STATUS[CVE-2025-21812] = "cpe-stable-backport: Backported in 6.12.13"
 
-CVE_STATUS[CVE-2025-21813] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21813] = "cpe-stable-backport: Backported in 6.12.14"
 
 CVE_STATUS[CVE-2025-21814] = "cpe-stable-backport: Backported in 6.12.14"
 
@@ -11794,7 +11794,7 @@ CVE_STATUS[CVE-2025-21816] = "cpe-stable-backport: Backported in 6.12.14"
 
 # CVE-2025-21817 needs backporting (fixed from 6.14)
 
-CVE_STATUS[CVE-2025-21819] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21819] = "cpe-stable-backport: Backported in 6.12.14"
 
 CVE_STATUS[CVE-2025-21820] = "cpe-stable-backport: Backported in 6.12.14"
 
@@ -11884,7 +11884,7 @@ CVE_STATUS[CVE-2025-21863] = "cpe-stable-backport: Backported in 6.12.17"
 
 CVE_STATUS[CVE-2025-21864] = "cpe-stable-backport: Backported in 6.12.17"
 
-CVE_STATUS[CVE-2025-21865] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21865] = "cpe-stable-backport: Backported in 6.12.17"
 
 CVE_STATUS[CVE-2025-21866] = "cpe-stable-backport: Backported in 6.12.17"
 
@@ -11958,7 +11958,7 @@ CVE_STATUS[CVE-2025-21900] = "cpe-stable-backport: Backported in 6.12.18"
 
 CVE_STATUS[CVE-2025-21901] = "cpe-stable-backport: Backported in 6.12.18"
 
-CVE_STATUS[CVE-2025-21902] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-21902] = "cpe-stable-backport: Backported in 6.12.19"
 
 CVE_STATUS[CVE-2025-21903] = "cpe-stable-backport: Backported in 6.12.19"
 
@@ -12212,11 +12212,11 @@ CVE_STATUS[CVE-2025-22027] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22028] = "cpe-stable-backport: Backported in 6.12.23"
 
-CVE_STATUS[CVE-2025-22030] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22030] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22031] = "fixed-version: only affects 6.13 onwards"
 
-CVE_STATUS[CVE-2025-22032] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22032] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22033] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12246,9 +12246,9 @@ CVE_STATUS[CVE-2025-22045] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22046] = "cpe-stable-backport: Backported in 6.12.23"
 
-CVE_STATUS[CVE-2025-22047] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22047] = "cpe-stable-backport: Backported in 6.12.23"
 
-CVE_STATUS[CVE-2025-22048] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22048] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22049] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12300,13 +12300,13 @@ CVE_STATUS[CVE-2025-22072] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22073] = "cpe-stable-backport: Backported in 6.12.23"
 
-CVE_STATUS[CVE-2025-22074] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-22074] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22075] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22076] = "cpe-stable-backport: Backported in 6.12.23"
 
-CVE_STATUS[CVE-2025-22077] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22077] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-22078] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12338,7 +12338,7 @@ CVE_STATUS[CVE-2025-22091] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22092] = "fixed-version: only affects 6.13 onwards"
 
-CVE_STATUS[CVE-2025-22093] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22093] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22094] = "fixed-version: only affects 6.13 onwards"
 
@@ -12392,7 +12392,7 @@ CVE_STATUS[CVE-2025-22118] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-22119] = "fixed-version: only affects 6.14 onwards"
 
-CVE_STATUS[CVE-2025-22120] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-22120] = "cpe-stable-backport: Backported in 6.12.26"
 
 # CVE-2025-22121 needs backporting (fixed from 6.15rc1)
 
@@ -12506,7 +12506,7 @@ CVE_STATUS[CVE-2025-37750] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37751] = "fixed-version: only affects 6.14 onwards"
 
-CVE_STATUS[CVE-2025-37752] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37752] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37753] = "fixed-version: only affects 6.15rc1 onwards"
 
@@ -12522,7 +12522,7 @@ CVE_STATUS[CVE-2025-37758] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37759] = "cpe-stable-backport: Backported in 6.12.24"
 
-CVE_STATUS[CVE-2025-37760] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37760] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37761] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12570,7 +12570,7 @@ CVE_STATUS[CVE-2025-37782] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37783] = "fixed-version: only affects 6.14 onwards"
 
-CVE_STATUS[CVE-2025-37784] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37784] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37785] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12620,15 +12620,15 @@ CVE_STATUS[CVE-2025-37809] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37810] = "cpe-stable-backport: Backported in 6.12.26"
 
-CVE_STATUS[CVE-2025-37811] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37811] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37812] = "cpe-stable-backport: Backported in 6.12.26"
 
-CVE_STATUS[CVE-2025-37813] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37813] = "cpe-stable-backport: Backported in 6.12.26"
 
-CVE_STATUS[CVE-2025-37814] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37814] = "cpe-stable-backport: Backported in 6.12.26"
 
-CVE_STATUS[CVE-2025-37815] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-37815] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37816] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12686,7 +12686,7 @@ CVE_STATUS[CVE-2025-37843] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37844] = "cpe-stable-backport: Backported in 6.12.24"
 
-CVE_STATUS[CVE-2025-37845] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37845] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37846] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12732,13 +12732,13 @@ CVE_STATUS[CVE-2025-37866] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-37867] = "cpe-stable-backport: Backported in 6.12.25"
 
-CVE_STATUS[CVE-2025-37868] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-37868] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37869] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37870] = "cpe-stable-backport: Backported in 6.12.25"
 
-CVE_STATUS[CVE-2025-37871] = "fixed-version: only affects 6.15rc1 onwards"
+CVE_STATUS[CVE-2025-37871] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37872] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12786,7 +12786,7 @@ CVE_STATUS[CVE-2025-37893] = "cpe-stable-backport: Backported in 6.12.23"
 
 # CVE-2025-37894 needs backporting (fixed from 6.12.28)
 
-CVE_STATUS[CVE-2025-37895] = "fixed-version: only affects 6.13 onwards"
+# CVE-2025-37895 needs backporting (fixed from 6.12.28)
 
 CVE_STATUS[CVE-2025-37896] = "fixed-version: only affects 6.14 onwards"
 
@@ -12854,7 +12854,7 @@ CVE_STATUS[CVE-2025-37904] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-37928 needs backporting (fixed from 6.12.28)
 
-CVE_STATUS[CVE-2025-37929] = "fixed-version: only affects 6.15rc1 onwards"
+# CVE-2025-37929 needs backporting (fixed from 6.12.28)
 
 # CVE-2025-37930 needs backporting (fixed from 6.12.28)
 
@@ -12902,7 +12902,7 @@ CVE_STATUS[CVE-2025-37950] = "fixed-version: only affects 6.14 onwards"
 
 # CVE-2025-37952 needs backporting (fixed from 6.12.29)
 
-CVE_STATUS[CVE-2025-37953] = "fixed-version: only affects 6.15rc2 onwards"
+# CVE-2025-37953 needs backporting (fixed from 6.12.29)
 
 # CVE-2025-37954 needs backporting (fixed from 6.12.29)
 
@@ -12920,13 +12920,13 @@ CVE_STATUS[CVE-2025-37953] = "fixed-version: only affects 6.15rc2 onwards"
 
 # CVE-2025-37961 needs backporting (fixed from 6.12.29)
 
-CVE_STATUS[CVE-2025-37962] = "fixed-version: only affects 6.15rc1 onwards"
+# CVE-2025-37962 needs backporting (fixed from 6.12.29)
 
 # CVE-2025-37963 needs backporting (fixed from 6.12.29)
 
-CVE_STATUS[CVE-2025-37964] = "fixed-version: only affects 6.14 onwards"
+# CVE-2025-37964 needs backporting (fixed from 6.12.29)
 
-CVE_STATUS[CVE-2025-37965] = "fixed-version: only affects 6.15rc2 onwards"
+# CVE-2025-37965 needs backporting (fixed from 6.12.29)
 
 CVE_STATUS[CVE-2025-37966] = "fixed-version: only affects 6.13 onwards"
 
@@ -12944,7 +12944,7 @@ CVE_STATUS[CVE-2025-37966] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-37973 needs backporting (fixed from 6.12.29)
 
-CVE_STATUS[CVE-2025-37974] = "fixed-version: only affects 6.13 onwards"
+# CVE-2025-37974 needs backporting (fixed from 6.12.29)
 
 CVE_STATUS[CVE-2025-37975] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12998,7 +12998,7 @@ CVE_STATUS[CVE-2025-39688] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-39728] = "cpe-stable-backport: Backported in 6.12.23"
 
-CVE_STATUS[CVE-2025-39735] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2025-39735] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-39755] = "fixed-version: only affects 6.13 onwards"
 
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index 302ec8ebc9..ea59c15a01 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -42,9 +42,11 @@ def get_fixed_versions(cve_info, base_version):
         if affected["defaultStatus"] == "affected":
             for version in affected["versions"]:
                 v = Version(version["version"])
-                if v == 0:
+                if v == Version('0'):
                     #Skiping non-affected
                     continue
+                if version["status"] == "unaffected" and first_affected and v < first_affected:
+                    first_affected = Version(f"{v.major}.{v.minor}")
                 if version["status"] == "affected" and not first_affected:
                     first_affected = v
                 elif (version["status"] == "unaffected" and
-- 
2.43.0


