Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7E7E6ADCD
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87795.1766434095956467655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehiXBY0D;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so607075466b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434094; x=1767038894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD/0L1nr0jiE9+pqqUBvfBDI3g8koncD4C35CP1sH48=;
        b=ehiXBY0D1cFg+ee77GH9BXxgH1jPcMoTEr6E7OB0A/DO6l/FXLB3agTqi2yy9syOvI
         jqTEAaF16piC3bknpR2oTPyxgIK9I4AgxlhvNwWjAwEsRZEt8XABcctCtl73ayoIAwI3
         SiIGOXQy6ONR6ZsRABsMPRLcWlORwXppUL7poovN0M9etvOn4nJKioQW291DvIN6MVDO
         Qyqm4WO8qzWBbArMG28GDVkCcYIi4T+Aej47ZUtehvVUewCSXT3T8fY22jkhaeRI3isA
         8JNg4EvSpDBqoiXTMFf+ixhk3jYYJO0ExM6JCtZccAzlCJG87CckkLl79GKL9R4y6Wbg
         cJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434094; x=1767038894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oD/0L1nr0jiE9+pqqUBvfBDI3g8koncD4C35CP1sH48=;
        b=sM2SZoSOBNjXmljSOcdZSXD4toEcXrouV1mdxn9J5WbrT9j4RF2LoMDQgYnJRd7hrz
         ZKh6F9oViMCmI7MEENFmv0Dwhxqf498+BAeMV6W/xOa80Wj7jHlTpdOIREp9sdscH6la
         bD4yJ6a360GRAUe7Tq+MXUV6pHAX2qzHIH8VajAdbOSFpleioN5kNIXYEGIpgjk5p32z
         gicjhH0LUdu3+PezDkfjc+G07wfRE3j7Wk3UZ4YEnXpzMmRSj0CiFJ+yR6B7cnmQ97SE
         Vhv6JspMsMo1+pMJhF9fOB4C2gKHDnhZEbpIwap/34ZJXoahRS+dO7R14zfkhtgB8yYt
         OhSg==
X-Gm-Message-State: AOJu0Yz6eEScse0xPJKpaa6m/RgIWT3nwoCtUtGUc5cDjMjhztO85VmZ
	ZfAiQ5Gq4rEqLWgc+/bd1oT9kdL0Exys6/MHz5+AL+PCpU9NQe93qOw8dz9FRw==
X-Gm-Gg: AY/fxX7rAsUm7F3GFTxhuXQRUazccKmqgvFiwTqlGuZcT4i8xZKrKzWWu4llqyM+7w9
	sGDVy2uwTp1CjBZLHZHtrenUgB9TfxwfbWbgnS5OTaTpVBoBPnq955YWdeq+kjRdicKI1REs+/6
	ZLfF/AizDQqx1+VM2bqeFdQFlvZk/L0Yeh9QRfsXDuxc//d9thGiNzuaE0CmbnCDE5fdM0+dHxt
	ijFs2rmUIiBU5nrMtwHfQcVbzqawy3uTm7YWZL2kYiYVGGN97Xgo4jB9AP1l8gZhaMZ+/JMYnO/
	cXKTc92/4XUN+NQkLN4wknjQKtvzS4NJ/o9LR7e2M+XgGC5GCKG5SBmpi+rxafRUimIgwPvXnu3
	IPzI9ktzP+6DuF6c82tNaISaB5tDwPRgvahkFcVyUvIdetk0AmSAqCeYUBdf2DN1Bfrfl47+T2D
	yMmfX3GTVGDM6ylQxupipPnrI7HeASGszDFO/BGhrClrMrOAQ=
X-Google-Smtp-Source: AGHT+IEsahEcc9LpN68+SIuFktGdcWM/RjdXnBy/fLFPhHSRXoMffq2eWawNwsiaTmF7dTW2Huiadg==
X-Received: by 2002:a17:907:948d:b0:b7a:1bde:1224 with SMTP id a640c23a62f3a-b80371e921fmr1262343066b.65.1766434094170;
        Mon, 22 Dec 2025 12:08:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 040/114] libtraceevent: upgrade 1.8.4 -> 1.8.6
Date: Mon, 22 Dec 2025 21:06:22 +0100
Message-ID: <20251222200739.2278706-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228365

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libtraceevent_1.8.4.bb => libtraceevent_1.8.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.4.bb => libtraceevent_1.8.6.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
index 75762e4def..deddb60f63 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "bd47bd544c9ebc9f44bd88c2b2f2049230741058"
+SRCREV = "98c217427183f66f09f4a27300ad87d71814c38f"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
-- 
2.47.3


