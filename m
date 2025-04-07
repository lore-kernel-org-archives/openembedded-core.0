Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927D6C369A5
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:41:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.42764.1744018860344558280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BvaFw0O5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso41155685e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018859; x=1744623659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gGWe4sCI3RDpOybIzU75od5ugtAqNB9nmPh8VLZuXU=;
        b=BvaFw0O5FuhiRswmeZUchHxVhiZt+lE3NqA67yKvtUi8/W3n6xwZSYjcZs8RNQ2EeJ
         ec6TjrFBr7ApBXSNX/xxLP/8iYfrFgPeegzM1ivgLpvPmaclzz9S2ammpywF7ic10Bka
         ae2wzxjQxHhINJqkkHzXFra1nIrmgcHzK3/6UmjAXzp3W2C7pFi2VHQfHRgo3UgiHzw4
         LddT7CxIA8g9EbVqIQHmRY0GLqxwD65WY72g1La5yrQsINhaFOTtu0S+4ntqaiMjBjBW
         hYnmLP4OLzmExmuAYnyId9d/NjCAvkiZOf/XjEDC2F+AGuhup6X35GirqvEYtaMmspRO
         nsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018859; x=1744623659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gGWe4sCI3RDpOybIzU75od5ugtAqNB9nmPh8VLZuXU=;
        b=DpXdOLjqXlzDcC6qofa6MEtx3uiEgDYkVGDl3qeInyvdf5wNtLAOnFmmPkFmmyJvAY
         A/Vzh1lQZ3Wzh0k0kIc61fGabwDMurrkEJjE9zEgwb8rp+Q3picxfMVuDY54fCYmmWHW
         Pf7Fm5NOUQe4kVflRGPeQkYc5jNDBlo5dDn5aWJ56JvXkPOqde+Y9F+G2139e8++5EPr
         6w/zbKr0wobDFTTaj7f3t7p6cuOWblhgTaMirrhm3UPfgGvqGexx7Srn7n69eRSuZglD
         AGdCUkv2yeglAAE7LqH1f2/82GkH73iA2091ZDoNhjrHC0kzsm8ex3TR9lHJ/6i+bCAd
         /CDg==
X-Gm-Message-State: AOJu0Yw9NGMoIs8NVqRS5P9nXjoEn1MI9qDP9nVfUxCDpyLHXtvwF7lG
	sgFWk96hphLTZxIFZ1QzrFU8QqiPKmTzzsb7q0mCR1Rt0nCG9hxHK0pBzA==
X-Gm-Gg: ASbGncuduvPgdZxISuv1cKFJr+elWe3+kE2/cdR7R0meoAwtYf4iSM9WQv9YE0tpxtz
	ZOAJ0g5shM5oqSMaIhWcJhawBt+WyESUuCJzeSM8t0uOBK0Bbb61H1JRi17yPFylhrZrQYWO7Ac
	A9FDCt3T/49Lk7z78HdWKyI2Z64ji/1kTchxf88SC/Dc1DWAfpSLz3oN951IYIcPcqIv4JRobSV
	zlKssmyzbX5AVkgd2KFq1BG++fOTIfF14crS1l6q0p4eabNK8pC4QfwgoB0DtsIeDmcsm0s5Ek8
	Vpa5kvEPHOA7wbWDB7/boYyGHaCuymSxNh19ndittf5UqlotXg/JG4VQmevbU5yBiITTemOGEdW
	DB4SHug==
X-Google-Smtp-Source: AGHT+IGzSte2mMKfW5zeuHnhzXCV5YgxcJfF+UADwZRAiTh91Ndj5o9UDJ+woJe5VMXDduMti9jfPw==
X-Received: by 2002:a05:600c:b93:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43ed0c944efmr118101485e9.15.1744018858472;
        Mon, 07 Apr 2025 02:40:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/18] gst-devtools: submit 0001-connect-has-a-different-signature-on-musl.patch upstream
Date: Mon,  7 Apr 2025 11:40:41 +0200
Message-Id: <20250407094045.753021-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214423

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index d7a3e2057ae..aeb296aa967 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -8,7 +8,7 @@ API has a different signature, this patch fixes this so it can compile
 on musl, the functionality should remain same as it is immediately
 typcasted to struct sockaddr_in* type inside the function before use
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8767]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.39.5


