Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD03C7114A
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 20:59:48 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.7311.1749848383034097169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 13:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YeEmyHLv;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so5687423a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749848381; x=1750453181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+PGvdMg/bT5ZPZ5yaPy5f7Sp0Ckm2LjGGuLQmEJ+W0=;
        b=YeEmyHLvsWt0tIwDrvObSNUyjsMkHda3c+cqmjsUG6/pIRsdnSsOYsaeINnjjZ+mRc
         /4m941BEZGEIWiNE1DZ6j7bVI0+oOOcQVhm2UZv0R+02oo3fHAf9jlSv4echSUeaBc+4
         hz1qaTQeC+wIpgXqBMtZE8BYydBDeWDyngfIguceSRy8fhvbvLdaDDPwRrwIe+xaAoww
         LkJdWqBUS2aVAUq3A7m+eCy9Jh6xtQ9YlWpgs+oTqjxKepf6DlndQ4jPAsJbDepxaa0j
         DBAz1UuLcNJywViGBd8/l+dyROY70MFocoXbkbRNC0D4pgocymUNAwZjR+kDvW8H2VvA
         YD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848381; x=1750453181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+PGvdMg/bT5ZPZ5yaPy5f7Sp0Ckm2LjGGuLQmEJ+W0=;
        b=ttiwHXeE4v2e+eebss42zGZqOSagSuzNFFwCnQdqUBmZYtBBaVa06FLtjePuXt0XLo
         N7cKyzNe4A4d6g3PH5FqdOKMdv0NiGIX8A41TBlpChWWMks92KFPr6F9it9exD+hiOBz
         wAMkBAPZ83VKeRwzJ57wSAR8iqg+hPEydccB1+Z8jWHCAq9Q8vYOs+iJsaLxNu92r1Hi
         wEir6xt5vdzP8kbr2oMVCjqQglnsWIBhkufUn7uxSeMvxDf5POerE1zhALuf0T/CFxkQ
         ljgw7qqmC1npH26jul0QrEzUvHhQb4mC0n2a6Ks1fQYdRjqy3GBsuiQekhLLZccJaGy/
         roBA==
X-Gm-Message-State: AOJu0YzXJkyLqLUBjgvvdvkHd6TVQafX4AIT5t5O3b1Tnk4tC3JcP5bm
	3cB2WbWzFBDyb6enV9P2ZMPazFobNK1ID8PVzg7k3XPiQkgVcjOV+67aePAK/g==
X-Gm-Gg: ASbGncu/1vZ7jp13TEha03kgdLJQZUipVVund7orOpwzq7phewc5gdfZYF9v/2qkSvE
	K+s0rL+ZiysFoQD6CrrnpQVNBHdilQpgzK1Q9kZN24iYwL5jMz0nJw8oTQqdsHHne8m0137sa6+
	zBGdPR+8YlL2m6vXekx+fW/6dtXSIFTQBUmPw8y+Q89RuD2EylMK+TGG7Mt4RKYcHYWqpTy9hol
	n3V0GZUaMKP8shicCMA7LQAlEH9Its2zi7Q0x4e0GU9CuYU9OVNyR/E3znD/f/H+mvbomgS/TEJ
	qOihp5ftZ2OY+q31wqsfWNAuu4SDhXig9VTnK/5+GlPzpZFy42GQ7PzwDaJZHw==
X-Google-Smtp-Source: AGHT+IFAS/psfcHUOQ7vAOWduNwh8AWFwaiilnazHNDk6nOoQ33oRvgvQN+vXUUr4MiqiUTDF40yNQ==
X-Received: by 2002:a17:907:7216:b0:ade:4295:a814 with SMTP id a640c23a62f3a-adfad53f2e2mr56075366b.53.1749848381311;
        Fri, 13 Jun 2025 13:59:41 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:5c5e:8cd0:a3f7:8c84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159377sm185097566b.9.2025.06.13.13.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:59:40 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 5.2.1
Date: Fri, 13 Jun 2025 22:59:33 +0200
Message-ID: <20250613205934.332435-3-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613205934.332435-1-an010@live.com>
References: <20250613205934.332435-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 20:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218628

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.1 release of the 5.2.1 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6750ffcbcc..aa23942858 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2'
-DEFAULT_INSTALLER_VERSION = '5.2'
+DEFAULT_RELEASE = 'yocto-5.2.1'
+DEFAULT_INSTALLER_VERSION = '5.2.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


