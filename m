Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74A6D1F9B6
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:30 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.4745.1729018285020878108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vOry8dkL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso3678151a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018284; x=1729623084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwyr2+NzoqCcbw/eg/fHvFsf2/f5sJGfUR0fMbhz0ig=;
        b=vOry8dkL0z9N11sIZjdzw4RWyKjcqO/3mkxAhSt10nPzL5ud+wBkjWshHVf3wCfLos
         o7Kv4r1/uy0iwobj3EZFUStjxXMT0gCmpSXZstIqXerf4zJk5goOgp+041+lA4TqRclJ
         ee5WEmZzNnDdB/gLeeIUUEEOJiVCaRw9YcvBh/U2vIXHvqFD9BaJjpZOFrNfYX885zQt
         0/3Q4Tc/v0bxCSm8SbcVQ/HdysmOfEdyBWokgc1iPIfe8IHR9D7sfmKqfg+vC1Nn1+1H
         RmPWJeNPcB9IvO10jaGwrDXP02vTpTFRtn0/MmDCrocbjfvn/QMnOFP7pvjlvqatn4T9
         iIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018284; x=1729623084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwyr2+NzoqCcbw/eg/fHvFsf2/f5sJGfUR0fMbhz0ig=;
        b=GZb4E0r69pnEKtKdP/8FaWDRWkbTKSfAEle1ZPNyYXxdQhT9w/TOkw5rc8yXQwu1w+
         Hk8p37KNXAwlPALGx260H/+Oh93vOgfH5sB2H3vH6iT2GhGhhQ3n5d4aCXyil8c/Oy04
         L9HxkLVTQdqCKK9QGS+PRfkARI+J1YfOw64EGx2R1PM8aO48VxCe5OrwACcFn0waVEk/
         VoLiih4NNCKvG7My1WhdaamkGqTWMC66wxrIUaqz0xqygmUxsBjCymCPC9gbLbCwvZW6
         UMl3oA0XfJ2X4BvxdSmFkpzaHm2+z94X7vkH9RPFK+8Q6k14um755FNo4ffhYtHl3UMn
         ntPg==
X-Gm-Message-State: AOJu0YxFHTiimRNCRqxV/r7GtVwNPIuf1p7eX4tOiLKvHjHqkH8bM57+
	/sI5sATOTmML7brk9AxtBHFZJeA/+1yuFMqQrxGfOtYwpeY+XFTuzTJvFF40Nc5WOtpW061YTEy
	h
X-Google-Smtp-Source: AGHT+IGS6/shqVQzziX4DUiIuHNqkxvyUF18QkwONxTdDPaMPNsEjIkyH9Nn3oKxKLe/t3LqHTMUAA==
X-Received: by 2002:a05:6a20:4387:b0:1d6:fd8c:fa16 with SMTP id adf61e73a8af0-1d8c96ba661mr16549574637.46.1729018284272;
        Tue, 15 Oct 2024 11:51:24 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/18] uboot-sign: fix counters in do_uboot_assemble_fitimage
Date: Tue, 15 Oct 2024 11:50:50 -0700
Message-Id: <7f81c38e91563d6d77621a3bfcb155cd226c9b74.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205937

From: Paul Gerber <paul.gerber@ew.tq-group.com>

Without unsetting `j` and `k` for each `UBOOT_MACHINE`, `j` and `k`
are incremented in the same frequency as `i` and therefore `$j -eq $i`
and `$k -eq $i` is always true for the first `type` from `UBOOT_CONFIG`
and the first `binary` from `UBOOT_BINARIES`.

Signed-off-by: Paul Gerber <paul.gerber@ew.tq-group.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3aef55c7ceb654b0012f20618bfd6ead1ef578b6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index c8e097f2f2..3e5f5dcf66 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -356,8 +356,9 @@ do_uboot_assemble_fitimage() {
 	fi
 
 	if [ -n "${UBOOT_CONFIG}" ]; then
-		unset i j k
+		unset i
 		for config in ${UBOOT_MACHINE}; do
+			unset j k
 			i=$(expr $i + 1);
 			for type in ${UBOOT_CONFIG}; do
 				j=$(expr $j + 1);
-- 
2.34.1


