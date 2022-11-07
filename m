Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C0EC41535
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.4338.1667832935935443460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=km4llv3v;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so9798255wmb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHXHi2fMhRbAlliTGGhm49MxqCGqfUwnG560gRol2j4=;
        b=km4llv3vTVvdjMr1fKp07tdYYM3d5xd/QH8DcD4CdFVyEKIR/DY8Qi5nuQE/D7VSYQ
         VkLTwu1dWUxBdZKDsynoIx8zjZlO1zMiqOrca4FCPvkAHs5lF/h5yKoVoAYEOa8GgEuJ
         c1yzYB1SXH8LkkVoRSUxlEkaxX1wbFyji2IvQ4/qj5V3QBmcUJHa2EZ5SFDcPhRq0MUV
         u/AQ8ns9qtepRbUsBzc1CFLx8GlSBG0n/Rro5EzC6v3bQ79bor5iu7yzhxEbWwKqT2vD
         4t9mEjC6REWqoO4SRumxjb8PLSgscp6PNQTTWZSjwoXxP6MaTJ7Oh4Or2uTGZ7411FoU
         pLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHXHi2fMhRbAlliTGGhm49MxqCGqfUwnG560gRol2j4=;
        b=qsWWUN5gcEg/miJXB7+lc8evfKB+VpRQjaH4NS45YFFA2yfpDJBUYWPEMxKaZrTGWV
         oC+Z/hyoas2CwBoqkwf37RedijSYCrRLoMTEgKa/B7KUWJKJR1S2rwRnhGvvxcZqZ+LE
         0dW6rQSVg4jqCvNbmBp8ZgiehUfNjRknZUqCNIVn7uILxxst9eZmzybd9KNYCoh1zpQ1
         6wB6RIc11PMirHtLt3VjBiWaHlQiziAC1K0T5w1HCXJuSjzeTw2M++ljpm3Kg/VZMgY1
         fpo6f8qdBEroOPw8g7EfUDpqi12MzjWJ0abhxkrLkYt+drK4wFCKDQdBn9uDWXJnBgJ9
         QuUQ==
X-Gm-Message-State: ACrzQf0Ea9Oydriou5+lj8ZXoFuaTqcwd4fomzXIRL9mFUs48id632x3
	Io0s+dXjUsPA3xqMU/+TbNU9qBFZR+k=
X-Google-Smtp-Source: AMsMyM6GRWCDIWXlo+KvSba8qsv10Xmlv+1K0SH6+3IzPU14zL15bm8VSFvauLOm5Ai+KSnGZihz2g==
X-Received: by 2002:a05:600c:5d3:b0:3cf:6ca4:b615 with SMTP id p19-20020a05600c05d300b003cf6ca4b615mr30080745wmd.185.1667832934423;
        Mon, 07 Nov 2022 06:55:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/48] taglib: upgrade 1.12 -> 1.13
Date: Mon,  7 Nov 2022 15:54:41 +0100
Message-Id: <20221107145508.1051404-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172872

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/taglib/{taglib_1.12.bb => taglib_1.13.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.12.bb => taglib_1.13.bb} (92%)

diff --git a/meta/recipes-support/taglib/taglib_1.12.bb b/meta/recipes-support/taglib/taglib_1.13.bb
similarity index 92%
rename from meta/recipes-support/taglib/taglib_1.12.bb
rename to meta/recipes-support/taglib/taglib_1.13.bb
index e6e3ef07ad..6560bc3660 100644
--- a/meta/recipes-support/taglib/taglib_1.12.bb
+++ b/meta/recipes-support/taglib/taglib_1.13.bb
@@ -11,8 +11,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "4313ed2671234e029b7af8f97c84e9af"
-SRC_URI[sha256sum] = "7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703"
+SRC_URI[sha256sum] = "58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 
-- 
2.30.2


