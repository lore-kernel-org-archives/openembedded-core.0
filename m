Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA7ECCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:22:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45177.1762770119495889142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWGj1djW;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-340e525487eso1872775a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770119; x=1763374919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seGSPMOh/g7dH34AmYZ5c/Qvq8TfifTO0i14ZVdqTeQ=;
        b=eWGj1djWv6+n/QK2wYvrrztuogWbtlkcO+HyUhNsM99KiKhlT/hvevAviY47ZIXoDL
         SwLq3V/s31NLgKKB+0x93GKpn07w9V4AeVggRYlXkn+sbWqLD7KLeMGp/cXOd2Y5NQNf
         43oYY4qoQVujRfLHYBfV4vhxs+XoirZTx5fq1oj6gQYg/xXoEqa536CT5oiuiDaNaUhf
         xz8UP3XpDTtLaTnnf59BRlQBcLTujweLrDlJVAdEFOM0lS65aUvu4ZblpWwNT45i3d83
         yXLte5crzV39Cqg5WlwgUkTh93grAVVwPvq3zGbmHvXXmaHdyYBU1z+71qnPb8KPi3O6
         vefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770119; x=1763374919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=seGSPMOh/g7dH34AmYZ5c/Qvq8TfifTO0i14ZVdqTeQ=;
        b=fxbUZfP5ASHL74HccsU7+7s5q6eahESsJ+sr/D/Pq9V/2E7kliUQPXWiAC0i9VepXb
         fC64WnBrBAYOxUynSXEOur7qEJDcgUdiEJ62kOhW2Mu5wzuQ6FTXDl6SBT8+7lKpAgQO
         4eURvlC5fI0NYJteE00TwaspYYeH+KJX/ZlQ5xEZXcCjjvS9vE7ubS14YoR52AwWE44L
         1cNB5+tlPRHUMOYk3De9bwaOU0pDqQe1onOU8RNRFOQ/VQJUVoYpSuff7ojz9McYWOpj
         KIHVjeE3EhTtSOAxPDlmHlxBjxZH57deUrePDai7rJgc+oXWRO3L0CG/H/8XnORPjGhs
         tCsA==
X-Gm-Message-State: AOJu0YzcYpx7rOGMUZq7+q0EYdbarMMuP5iygz0zSkS4X4A/DO4+uf7O
	/9PzuRvOOR8Rjv55995Mu+poLlZzhJ2W2wdypfyl5HpDcTllCQQzSh3RIePEaw==
X-Gm-Gg: ASbGncvuiyEo48LMR+U7SS+24oNJD6lkOrFoBOTRNvFNexOcWfX7XlzGN3bTpepN1c3
	pzOmfNM3fnsBXJ7vGQjm9R33iK727kbIrHn6CVucblvNHwTOmLn9gTCPIFaAbBHEimwlZb8kvHQ
	ZGzm6l62WHAoXU8EFoIhtNw3WxxXw9L0hdNfrwXaZuhF5rzDR1smKhffbJ0tjYZ0n67FG/jpKPd
	v/+UMelBtkY6P5rvrVwGUnHjqoYGCTnFyM2BMka1EabcYfZJEh4CRvQgRZLuBWH0ITGrE5QGv9s
	NB7HE64uqPC6ac/ZzZpJRM1Fonf9gqfn2umWdbEgU7kBbqpR6jU+mA6a1Cd6LTb7qME6yPIQshL
	/j5PxPwHQiO/1qz8/J9I8QkKK7gPitfyeTMAUztB61nv+4TOXP0hq3pCeKfwZzPLLwgza4p0SbP
	cq/D2aKhBVVUGwT5XvX1MwH/gcGZ4gUuD5QAQ=
X-Google-Smtp-Source: AGHT+IF1BymrsZNvR2GoZsg55SILaOVxmqj044Ux/VQMfbHLU1JvitWSkdeVDa1RhqtSmIRTLeOQ9Q==
X-Received: by 2002:a17:90b:2d48:b0:340:c179:3666 with SMTP id 98e67ed59e1d1-3436cb73c8fmr8012388a91.8.1762770118715;
        Mon, 10 Nov 2025 02:21:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm6999894a91.18.2025.11.10.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:21:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 2/9] wireless-regdb: upgrade 2024.10.07 -> 2025.10.07
Date: Mon, 10 Nov 2025 23:21:40 +1300
Message-ID: <20251110102149.2915435-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
References: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226105

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2024.10.07.bb => wireless-regdb_2025.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.10.07.bb => wireless-regdb_2025.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
index 0e4100fba7..68ae3b0464 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
+SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
 
 inherit bin_package allarch
 

