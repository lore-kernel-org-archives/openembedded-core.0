Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7C3C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:34:01 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.928.1748446439747536230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PRpejvdS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742b614581dso4312918b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446439; x=1749051239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir38TpFMxMaLSjboIDQRYE77t5en0Gb6e1Il7qjc6BM=;
        b=PRpejvdSG57rpH6H0sSGSJyEPL2NsmzM12Gg5lAr5rdjLZ1AVnKM2k91KNMq3/ZDdc
         qWL/Mhs1i7jMNBLhDvw6qcRkAQuHuPO/phNX7DW67f3hAU5f6thX57sdJwMhb+lGorSY
         8yJMB0qlqkaAcDs4mbznegDkWMu7Iost9P6DSjlA8OsgJDWuFeTGc4bgK/7V7pZ+g1jC
         Wra7UNMwnlfxRuRSkgeyAl6KKgtYJQJ+8T8vmczQ1Bzg+dyIA/5n1yiKpcOoqaUtb3I+
         SVd0iauhEO+VYyCrHVocCl47C/hjebWWqAgrvlRULnRaYpxSTs7nOVFmZSzqy+5EKvNq
         hJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446439; x=1749051239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir38TpFMxMaLSjboIDQRYE77t5en0Gb6e1Il7qjc6BM=;
        b=Yag7e0D1PPDG2GcE9oW+eM7j/KPv1Zdnne1mLlr/kZ2wTDPmzMp/Uz9kCWBIiZ3HNV
         ZLCkvCUlsoRjp1R4M1k2GFUYXsL7UizYynb0hD82byLpGxDVEydhqlQQxhH2MsNihtog
         iJh2fhcuxGy9bfhjrHgANYmgN4phqZQTWLTlXhCiX5kCxdv/l9v1l21pcSh6DosyGfmK
         9CoJ2rmf5Y/y1lXS1cgF85JNd7k5OE/Eg2cmXqu+7Fg87YgxCPuMCPirOKluESMgKeJ4
         D2vY/p1XlRKGTTO9U/mrjQMx8ZP+WBiHBmF8Z6IPB0dRiJaI2tKCNo2516Ph6Quwy5+3
         Vr4Q==
X-Gm-Message-State: AOJu0YyjL6bjuIPXLZmX2LSUzZo01VvJpzwIKvfxlkdG6VDyQpEzLRhs
	qGkfoO+x3e2NgeqzAki+VjmPDUfL+i2vmgpRZ7IyWgdIzD5Br5gOBdGtn0bKBG3t/38yDBqMMKb
	TI8xn
X-Gm-Gg: ASbGncsUK3uPlKRptxnwL9kPLKoKUSeolZQq7ZkkLOPX2eYe9CMdE7SWFcqNnNOEegA
	y+OoH1In9v4CVh2xlEqKINk3DqaPVd6LpFtxmDPSfHTJXptDyJfKBcRUgmNpVDy5eVsYWCIiMBN
	aZHyQcRmBJM4Oy+MaUTTh2klaLzDqMUWnpuTFfJieMLgn5FqZ5Bz13zgykktCLTDsgGFwQga6Sa
	CNbM4ViF8C14dBH3nNG3uhUoxUm3Dc38RxiipZzDgi5VkQCeAdHbpzSyr/uIegaU8pa/aCRhntd
	0I6U3w1qpehOBl5JGtZdSwd0TP9AZBlWtRHzWRAF7CE7QkDHqGtkEw==
X-Google-Smtp-Source: AGHT+IEgE8B7LcJKkNKTAcL1Z1Fjh8NJN2+m+tH/I8O2BzFhRkCB58BUdCOt1FD3BzA+4pvAAVzsWQ==
X-Received: by 2002:a05:6a00:21c6:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-745fe06456bmr21599157b3a.15.1748446438842;
        Wed, 28 May 2025 08:33:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/14] epiphany: upgrade 48.0 -> 48.3
Date: Wed, 28 May 2025 08:33:20 -0700
Message-ID: <fb8f221f92da60f4e1ae14e39fb3a577ff7bdb33.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix crash when opening downloaded file
- Fix crash when opening incognito window
- Fix Crash when trying to select download location
- Fix Crash in escape_csv_field() when exporting passwords
- Fix Adding WhatsApp as a web app crashes
- Fix Pressing Escape key in addressbar resets the cursor to beginning of
  the widget
- Fix Epiphay shouldn't show the privacy dialog in incognito mode
- Fix (CVE-2025-3839) Require user interaction before opening URL in
  external application
- Fix Code cleanup
- Fix window: fix crash when force closing window without session
- Fix Several fixes for password export
- Fix Remove Granite support from Tech Preview and Canary
- Fix find-toolbar: fix crash on load-changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: 2c60159fffd76b5dbe75bf7d6758e5f78b166714)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../epiphany/{epiphany_48.0.bb => epiphany_48.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.0.bb => epiphany_48.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.0.bb b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.3.bb
index 9eff56df3a..74a17be5a5 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "c9d1f6dffbad03b0916436901c770da302879ca60a636d2b72b25b142ec05f80"
+SRC_URI[archive.sha256sum] = "da2953e7e2b73bf7473c0a33979104d79362795295eaa0a2a38ea188537daf13"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.43.0


