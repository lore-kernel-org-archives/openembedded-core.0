Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1127CC77B7C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:34 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.8232.1750515811386959890
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ac56rl7k;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-879d2e419b9so2293410a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515811; x=1751120611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrL2gvFDOwpwCV2Vj2vRq4QmH7GvL6hTHhvl0nF8ZGs=;
        b=Ac56rl7ksYUP5ZCnrXd56/xnjLmh8ZKg6IgbGwpvFEuvpXUP9ongRtx4wwV9Wi+TlA
         G73Bui5CHehEzjMtx12GmgX1F3ZcBHl39vf1kvYUHnqvDrlqLN2hbPZ53k98mwFFYYby
         mx0CDo/C/oh2EciUHQiPaudn0UeMHL+lAvjLT9iexowaaoBavfPToWeQX8PL7uI+myUE
         APrUk86d3WWzIPrW4nB7muNUxmcySSx1Glqmg8BBrJRXcDN1GA8XbJ3tF9CWxqCGwxMB
         jvdJTzBmYNxNB6mEDqIGLyUXgv7GAgYy2FnPzUMCqan006zvZzdcZFnqPZcE12M15cxS
         QKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515811; x=1751120611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrL2gvFDOwpwCV2Vj2vRq4QmH7GvL6hTHhvl0nF8ZGs=;
        b=CtUC1KKCTxDWGIB0wdZVM0vMrtV0VkYUeD9sx32an2U4eB6hmCJZ3VJi8bWP+n+WpT
         pQNUAQ4lsHJHKqL0UbzX3SNWleOdNAbFKafb3cgZwrrHkwrdJ2XNG0KsEd6G9XGvcIHj
         Y8l0bj1CszqBqNCx5GNicLzxeBCzKOPzEkJ6c60PD7gwTMRad2BKyskf+YjJQFv9d/Yk
         44g+O8EvEehzNm0YGDfSARse8EtXzJ5SeqQ4J1bGOM4dCR3T4yn9abhx9Z8mH9dYjgA1
         xTKTFIqZI2Vu8nmaHkGqM0g8eV6O4mA7t+RQr1m5NrKQCWdxJA926n95Ah2N+1qfefx0
         gKRw==
X-Gm-Message-State: AOJu0YxCWIUh7J/PlGjXLS0+8WrGXl1mpDKo0mU71etTrbCncOlksHQz
	ginMhy8wsGyAQ5P9d3W8HLNOVkXznfkJYGyOpGhIOegzW0rkPTwc5zFZnOiK8Gba7avhJkcRyFz
	dni2X
X-Gm-Gg: ASbGncskSq6tUhCG/87JokiXOnB8VsWUmcIZl2NgjP2P0qGeaU+AFSscvl1NcBkRpvW
	jyFolJM2h8QV19I2+w0Mo1dCfQh4NGZiD3EO0uNlD6qxL7bGBAQaFqrTK4NucEbxrMkKGYIgX8k
	dD2H6XvhVFgma2rLJaT6uaph/royNSa1R1aiiG6oiQg/1wJx995eGGkVZ2ziTqctEyXw4qmcDp1
	CqByVftMEeTMygxlnY6hvbEov/yXcIGG5sZFU6WCCBtrZK2AvIXoshHAMhAGd48QbyV7CcePdc0
	oOz/ex9C3xzLLWUFuJ8hfuXDafgWKSs+TtbqZTOg6ou+Nzf7tvAPfEMc2//RuZQQ
X-Google-Smtp-Source: AGHT+IFpNFl0Ewq22FUu0UBzwO51GlIXTLUNXWAEJ32KiN5oJd9ZnWLraTRVWnAnQoSEuCWPJ016Zw==
X-Received: by 2002:a17:90b:1f92:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-3159d8da519mr10022166a91.29.1750515810577;
        Sat, 21 Jun 2025 07:23:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 4/7] bind: upgrade 9.20.7 -> 9.20.8
Date: Sat, 21 Jun 2025 07:23:14 -0700
Message-ID: <6d89ccb56d8fbc844973166b0534630bfa5204ed.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750515680.git.steve@sakoman.com>
References: <cover.1750515680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219162

From: Wang Mingyu <wangmy@fujitsu.com>

(From OE-Core rev: 670cb507b9125c152aa08702520f2d220c207c71)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.20.7.bb => bind_9.20.8.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.7.bb => bind_9.20.8.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.7.bb b/meta/recipes-connectivity/bind/bind_9.20.8.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.7.bb
rename to meta/recipes-connectivity/bind/bind_9.20.8.bb
index b4202f1a59..864daed97e 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "43323c8d22d2144282c37b4060ec11e98c24835e225688876fad08ba7b95dca6"
+SRC_URI[sha256sum] = "3004d99c476beab49a986c2d49f902e2cd7766c9ab18b261e8b353cabf3a04b5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


