Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFED8D5B143
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2925.1765620151566501470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZYKKzviK;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a07fac8aa1so9330175ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620151; x=1766224951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7Fd9Ol3Ys1gbwsKPsIH/3f6WxUxiAW710NGCaoFULk=;
        b=ZYKKzviKQhJ7SS6jpMdsCl1kwqYd7ITDwx7NlplNnAYtiKUkleKFSDRUFfLrZRdNzb
         BXI4jQLY9szD/XNdYRzwRj9u4jtuFuPcQJhyyBcDeo0tmo50Bi0naSAB5Ocbsf8u7xC9
         Bk3W5CNppD2YHKqqN/nbjgu0/FtIxObZxiDMBgw8PDBVKiJHUICjHTo9jkBVRhXvSx7H
         WEWY3Xqa3EnbFhQbcH+cqZgBUqzHxofAdznUOg9lDf3T3k/RH+D/AGNlYjFKSTwWNi8Z
         1Qo3n5vbkvQKhe8RwmPRNTxPSEvO6N1WzRKRz2YobwVCUJgwGU8NKaLlvECQM4FALKfb
         lJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620151; x=1766224951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q7Fd9Ol3Ys1gbwsKPsIH/3f6WxUxiAW710NGCaoFULk=;
        b=Ad8cXG66sNdhN3yd+LRQ7gZv3v+ZiRyhf7XkQKgfBaFtelYD3JsxSdXLwSEeXUulAU
         fkbe8e/gyQ1iLZEu7AY0OY/wcOAec+HKue6jhiI4AGSi4U5TIvrKZeAsGrUcME7fSYYP
         R18R88wsMBvnu4OGpYRvmINGXzuun/i/WOhFhgmAIYOJMlaorUf1OHxvngbPTVNTyy+t
         zOtmNIeMoj13tmQ1PspJzl5zY97/8/diX5SmrmDtzl970FWGIAUhfkzL5oScqkuM9O7z
         xG6ZddKObIfzlMzQOj9uslH/LiXka1XlyXbVzxIc8qryhjDVZSS/GWqsmIcKBVN2ST9s
         s2Hw==
X-Gm-Message-State: AOJu0YwFXEZyElsnE+0de5u9chru99JkUeuV9rUv/O5m/L+u67W6CMgs
	OWo/GJjdYVSZ0H6cMY599tp+082DiuoPuYPBzRpBlmHjjynAfPY+PMo7odCxCqwU
X-Gm-Gg: AY/fxX5OJXaT4+3KlGdlZ4TbLFeoPySK8slTzXbmC79sdU4oZW8o8uWoITQhii2X2Yn
	LsQvQ4X9tD4LOi6WYLwOJE3N64VEE/WHg/frN+fjX0vMLoSPFKMZlVy4dyYlohJakPgVXn4FsQ1
	sp74JA9tIkJIiuXCyyXmCyDEV2uAfXFmfH3t00yORceDPILYoreJgJoD2406ucSLdgjCYexa3Ah
	nsGap9yYs4058jeqHNSAT8DTvwxvX1hoKN8uMq47/wsArI7WTZ3HOm4puRvMDkZwFmYHY94GQ5+
	Op8xquKEq/Be8CIJBxgEK6xV7urYwymfgGYz1V6dSuH3CMn9XIDCMM41PswI+NWpTQdlHcfbyJh
	LOsNInYmX5h6vNzQOMgxt9DGHxSWve9HIPixVorX15y2dch30M2SkHjiiIq/6AMsqNBfFEAC5++
	VJwfNmjkou+EKYYk6l4FBpSDbUOrhVaEk3ZQ8=
X-Google-Smtp-Source: AGHT+IE01wH7X71n9/SMO2ZVtXWtVLIUjqBFMrVlgqfpiKhMhVm0WMkWZEfr/4md5YpMHtB5cv5t4Q==
X-Received: by 2002:a17:902:c950:b0:2a0:971d:12ad with SMTP id d9443c01a7336-2a0971d143fmr14619145ad.31.1765620150736;
        Sat, 13 Dec 2025 02:02:30 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][PATCH 61/67] mobile-broadband-provider-info: upgrade 20250613 -> 20251101
Date: Sat, 13 Dec 2025 15:29:25 +0530
Message-ID: <20251213095931.2571498-61-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227679

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99e2dea3d4328f2aaa6e6e29f5bf4aa38b64b274)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...o_20250613.bb => mobile-broadband-provider-info_20251101.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20250613.bb => mobile-broadband-provider-info_20251101.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
index 72663c7e0a..441732afe7 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "2a1b409491a531aedcf3eb3ba907929d96bd181a"
+SRCREV = "18cb97517d9c831e1d2ec057e62d04fd3665e10f"
 
 inherit meson
 

