Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B17C41513
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.15475.1720960788788799290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WKboEnva;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fb1c918860so31584095ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960788; x=1721565588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40O2HQx3gEHP3oJLLpCoFI/jkDpgDMQLhO7tz2IXa10=;
        b=WKboEnvai+ljO0stOBApIVWez6utjkxbg09rehFom9uPlDHQv8RRTxvsehwBr3AHaZ
         gZXMk6sK4PqvzYRbmL0XM0F1jdVnKxzMkHCFqVVMQOhhuldQIws5qCUIlht8pOi5Z1Z8
         Gdo4ts+JjS1Mf9jxa3eggf/+gFVvZf0ak1Gh2kNXgWdOJkqpfCwqtBzPtWzvo2T5F8lR
         yhH0czpQ4vec0jeo9UEgYd2McInsQSsyouPPLogcix+IRbpgrw7tr47hlf3cqX/SONTx
         N0e01wEfkitkGVb65P4JGWCTeG8B80jheNYD1HsC06TWFg68eLNxt2vto5+nlIx9tPs+
         ewvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960788; x=1721565588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40O2HQx3gEHP3oJLLpCoFI/jkDpgDMQLhO7tz2IXa10=;
        b=QTE0940l9ExKN3XQVq1or+dUUZV5ZJ4v99OS6CUhu2CAeCJrQITeGHoPJ9X4+dZrF9
         USoljM5H/Q0YAqOR+yadKy32jNNhwQ+HmzeRBUyC+KpYRUE14qLRj4RPqQM9hkyn733d
         AEtUjtK6f+U7QHkAha0+Ks+dOkTbrW//nNnt9Q5R6x9chYItmhPmlDhjbDC/ZzC8XAyV
         0kX3ZQN22gHFpcaflN0KpfBVjz6YlOUaBk22YmwsVcaGoi7ex/gjKsYt4NIBO9Chi96b
         aso8FeeaGIDAfDOOCsmZ1+ukxXmK4y64hhc6VGHhbyRD0DIbMl87Nw+INndpfezub+XL
         UWmQ==
X-Gm-Message-State: AOJu0YzZf+vS9K9e9g5gJnZbb7nQad1oGp/mbisZ1rcHdKX/yNus6I/q
	VpdkWvHz0/+h5zYKmKul69oGeCuXQKQftrXz/8py3JbWfHOPph5fTMUMtESdLAfGU2QKXhj1AQx
	lcpM=
X-Google-Smtp-Source: AGHT+IFImgRdrrLCQcwkCtZ2oYuu5rvU9GuruXf1pLHjYhs0uNcsWU+qVS3S5UHULbUK2cM1IqAAxg==
X-Received: by 2002:a17:902:d2c1:b0:1fb:8e29:621f with SMTP id d9443c01a7336-1fc0b532784mr60393975ad.16.1720960788123;
        Sun, 14 Jul 2024 05:39:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/27] perl: submit the rest of determinism.patch upstream
Date: Sun, 14 Jul 2024 05:38:52 -0700
Message-Id: <35675cd8104151d23b2a64cd5093939fa3d2b8ea.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201882

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c00500618fa50eeb5e3e956e1fb5f4af562c1a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/files/determinism.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index aa85ccef10..f2b1111552 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -8,9 +8,9 @@ b) Sort the order of the module lists from configure_mods.sh since otherwise
    the result isn't the same leading to makefile differences.
    Reported upstream: https://github.com/arsv/perl-cross/issues/88
 
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst 
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
    there for good measure)
-   This needs to go to upstream perl (not done)
+   Submitted to upstream perl: https://github.com/dankogai/p5-encode/pull/179
 
 d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
    and "" with dash
@@ -18,7 +18,7 @@ d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with
 
 RP 2020/2/7
 
-Upstream-Status: Pending [75% submitted]
+Upstream-Status: Submitted [see links above]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
 Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
-- 
2.34.1


