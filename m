Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616DCC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:35:39 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2560.1753385729417381628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gI+bn/o3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso1388906a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753385729; x=1753990529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EUzBbuX5jJiyLwh16AZ5V0k/dCAbCosKGG4CIDqINk=;
        b=gI+bn/o32OsJ6f9S9kyW1Y3G/0kBD0/YHHW3bdWhaj5TjtnvxN2pUnaVQ1/HN2zUsR
         SmVtVq56RjEPRuoMXn4nUzt3mX/a0n3MDfzBpz/Y+EVJbmouTzJLaizanoDICV5fMkc5
         I9h5/bmNf3ew4aHKfbYWw5SMHQV0wt5apciB1ZMhZiTAParjJ8y2i7udovLEUH1ErCwF
         DHxk+nOmFU0ZuUo7ecM6IBsPX9gU2r4qGuKZaAQ9cIljeLannfSIWtjt8LcTmLMQ37R8
         XR7xwQyotz8RYFn1UuX91z0AtZVYmS+1vH6k5v6qKWIsmIM1IeZI2CIhSCdBl/8WVk77
         iB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385729; x=1753990529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EUzBbuX5jJiyLwh16AZ5V0k/dCAbCosKGG4CIDqINk=;
        b=MM3vNVoTTp5HculASPFf/AGjqTS1rcJOCLDsXr3UXS9HT0qF22gLL70iuMANwhHAkI
         +09jb0iYptNTjL7iGON2MAT4Pj3MYuqNmBqkXqTuQx07kVRYlFVLmhaMewhkC1bRdBFS
         7DHPLxHVdjenSkbmzxGpY4p/H6W59i0uoM9RgaDBPAsZFW9O24wAmByeNZBgGQmGX3SQ
         o9j83uHS/0nVt0QYWVf6r9sZaAJ4pwRCIsvTLQcGmssvKtz4CTBt5iz6FyEMNzNcxkHI
         PBy/YJuWGXsu2rzLvaTxIgqJbYDOBabQsJwOno1cIwWP5KqL2Yh4BMuJ9pNLZdfbBOyk
         Smcg==
X-Gm-Message-State: AOJu0Yz1sfM418oiHOTh7hwjU3yvw5IxhWZJQZFb+RasLgSQx8osHJKm
	OfL71GrS2ySdHxKyMZDUxFyNRq0hQrzwJuzEg+z6Q5pF9Mq/ex72A3nFNKgvsn2OkbR1CVVX6oM
	u/eFq
X-Gm-Gg: ASbGnctKOGn+gd8ygUCxqLZCCS7I6ApwE/keQnLCCBnTadeKxlbPp8XkPSn/bQUvca2
	MoHqBLAAiBVm4Ns276UndyAGL+2GPkfzXh6IFbfinkTYLRersbRS3NrTbcmXi6o33ZPdDuInENX
	klZi/NKsEwIigcMYCFEGy92jB0PucsWZoq3NL5gBw+KlvHP0I3WRB1AOxyQwlxE/24Etg6OU4ju
	5Be+ROORhxmjxvR26AL14zWzqgxhi0SumxzQTwbqeFZZX2IfGSql+TCKC31th/z36x0gxepaY+k
	BL2w/JHKCaqPXEL75Y4I23nIjy9Ac8x7RCg+EXIkTDO2/UDFkSBsx7uL7F4kD6zkA0ifK0DJoA4
	0l91omcUk/wqf
X-Google-Smtp-Source: AGHT+IH9RA2BdHiSkKbVLu9jFjYjNh29uTZLYqYLTaPI/t/26M5a823WVUlFC/rkLVoGNV+Pp+5Ozw==
X-Received: by 2002:a17:90b:47:b0:314:2840:8b21 with SMTP id 98e67ed59e1d1-31e507fe4femr10175565a91.32.1753385728581;
        Thu, 24 Jul 2025 12:35:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66267fa4sm1978524a91.5.2025.07.24.12.35.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:35:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 5/6] mtools: upgrade 4.0.48 -> 4.0.49
Date: Thu, 24 Jul 2025 12:35:09 -0700
Message-ID: <e4e5738597567b574b18f2ffdf60e2b41951c42a.1753385563.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753385563.git.steve@sakoman.com>
References: <cover.1753385563.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220864

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

New version includes check for overlong file names, see [1].

[1] https://lists.gnu.org/archive/html/info-mtools/2025-06/msg00005.html

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

(From OE-Core rev: 044c2bceefcc12262cb2421e8f1da5f6c2ed9f72)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.48.bb b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.48.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.49.bb
index 646735f3b3..294b2f37b2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.48.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
+SRC_URI[sha256sum] = "6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f46f66a871ffc9f"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.43.0


