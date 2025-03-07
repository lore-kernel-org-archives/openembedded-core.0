Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545BCC28B28
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 21:50:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.105.1741384221567209114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 13:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aCjDaRfS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22356471820so39569985ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741384221; x=1741989021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU11L5Bon5V6WxJh0GHOIQjjRzFi0b0t+TzGR1sEcGs=;
        b=aCjDaRfSZlmFAoC7TEXXZ5J+FUqW5F7lRY4CthRrn5wNF7trjZKyNL4tX88dFGcJ89
         C+50ZlJ7ipUcC/5ZyBdtqsIO/OrZkQ7IwEfeJKcxEHUBjeX7LQcL4MRKZv9S7Nhf5pwj
         LePgatRJKGST4Syb0foEsiTG+566r3oraM8tcnE2T4kVZv3nTAi9mQhG74AbNigWfMdI
         QqL5hSCiEz8TZF8nvgBuOdweUjyaZsY7bMmoTQVSPGCXZNB3GKfuqMriTVx7ZAw+MySB
         gtxUH4e5rCZw93MVbLCSGO+pGmLT1uTvEdPS36jo0tB60Jly3+EirNiUL45ddxKDjelW
         OgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741384221; x=1741989021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU11L5Bon5V6WxJh0GHOIQjjRzFi0b0t+TzGR1sEcGs=;
        b=mk2FOZxZPTxd0VqgxJeUwpymvlS8ztoKNMHCTOy+esrpi+14zSr8gBgB3Bsj/FAgGm
         /Fyt3Eh70xjQ8Wqoxb6deHHBDFPOQzRRwa6YE7RxWghEPIA5E2rnw8daYn8AhM9CLBj+
         ztSGkBJxoFdDaha7lZ/EwVyjhdqi6dEZo2K+flqlhR7fCiRS4Z+/z/2ieXgoRVne6rFP
         9wyfnD8tki7Sb4qkP+nmOW3egtk+ggg1IAS51n5Ckew3tL2iobeQwSvED+Ikm87McGJk
         TH+Lczk+zDp1iHXvoi/8RNGnxTk4FB23FsLxvy/1pGYzaJX4CAL5g5ti3xYg1j+3qm4U
         tSvQ==
X-Gm-Message-State: AOJu0YyrzrKQOImOTxFyMrbL6Q0qhRepuzrPYQmKu7azCq1UyEa0kvtN
	M9fNPsVbZcTsvPwZTA+NXwh11ueCPhsglhIeKtAkFOjpgxEoU2hf5O4fATkr6DP95KNFkm5Se50
	Z
X-Gm-Gg: ASbGncssTHhGq6YRGtKaZsxdcyMHp31VFg9wD8ZgmNv3ZzLZuXGAU5HgtbVViTJawai
	2isUciJj8F8eeEtsqLxLZIecGNzHguQXONJpWHbYBwNVV2XCscit3uB0RdTqt9Q5kBh6mo7gxzG
	1evLYcKGckeXDvtUizJSX01Wee+9N7lCvFappw/uqOYWsOMYOGr8U/uctqXfjOt6X9b9U3KJwFb
	FSPbWqlr8eYwCrQJbR7Tc3BvfzUTRVDNkcfjWEVmdvP0M346eV/i81NpVcvY+ptG1wdx/G+650n
	I0rxL9p9EL/G4wIhd6iSGjuGmI6By3ANrVoz
X-Google-Smtp-Source: AGHT+IGUPyKJh5HEwpaismEJm3BCGml4MfRYEKp3Wz0UDDTr2hquQHvhVaySE8CK2v/tO0AwL0zdvQ==
X-Received: by 2002:a17:902:e810:b0:223:402b:cce2 with SMTP id d9443c01a7336-22428bdb74bmr83899955ad.33.1741384220780;
        Fri, 07 Mar 2025 13:50:20 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa8a86sm35008645ad.240.2025.03.07.13.50.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 13:50:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/3] tzcode-native: Fix compiler setting from 2023d version
Date: Fri,  7 Mar 2025 13:50:11 -0800
Message-ID: <c297d2cd8d28463adca5158c9895f1492754d569.1741384034.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741384034.git.steve@sakoman.com>
References: <cover.1741384034.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 21:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212470

From: Alessio Cascone <alessio.cascone@vimar.com>

Starting from 2023d version, tzcode makefile does not use anymore "cc"
variable for C compiler, due to Makefile refactoring.
Replacing "cc" with "CC" fixes the issue.

Signed-off-by: Alessio Cascone <alessio.cascone@vimar.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3cdfca5ef84ed2054faef9abddef3aeed930e17)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/tzcode-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index d0b23a9d80..dc9f076377 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -4,7 +4,7 @@ SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
 inherit native
 
-EXTRA_OEMAKE += "cc='${CC}'"
+EXTRA_OEMAKE += "CC='${CC}'"
 
 do_install () {
         install -d ${D}${bindir}/
-- 
2.43.0


