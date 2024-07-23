Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFD1C3DA70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.43670.1721740411631114984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JRWlcIN3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d265e5278so1260867b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740411; x=1722345211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJRMjMws3cPvBtgvGi1PnJpl8bEzQy62NuUVFxHvU/Q=;
        b=JRWlcIN3k1R4fxNJ0dr1hG+BsUrvKdWETGW4FXYRym8yNGTvZF6eq8hBlu9f2JSKhA
         fdNvApK55pJ8NB7RZgWiZhQnssg7gy+06hF8WStv1hH25i4HCzPrt+0KFis4Au16JzUC
         4G5tsUh9tZFCAQmgmlY/luwSzm9IOTvq9avYR6MWEqcWV8ImLYCmZgeJdxJy8gQhi36b
         HoYjz1VVuJXPZISN5dh7MndRGb0N95w/8XEtbtxtco6iCLbd3UKdj73KicExhd6PyAZZ
         /2X+sYHLKiOD3v7eaE+rafe9h0o+BV1TB6LPkuqRvOe2nH4WXmn7LS+YNPVWiYi35j/E
         6u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740411; x=1722345211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJRMjMws3cPvBtgvGi1PnJpl8bEzQy62NuUVFxHvU/Q=;
        b=KEdnNe9fLDktnF0vJrZI7WB8Tc2EXMIObbbFclvRYNiiPVeHYvwH3PQptAGrxwGA5O
         dYH0Zb2m1ZiQGVrVIKoZiGq4HEeOoJ6qV/8oHgIucAAlP/zysg8DViuqXWOoCOvBw0UZ
         XV0nk3fY9p5fMFeMghG6ilEyZhzDRUVIKvYHt9YinUz1zRWZcZBy/iFuZL5nrRFqSAwx
         go+kJ/aSKgZe9rWBGoquLJT4l8iG2zFSnH5zYTFb5wsGoQjj1FuaH6SMv5cF8UIlzfw1
         ONaSjWjrxBOfe1MykWGwwgYhXEZhqJMjYUWNDCiryupwF285DQ5s9J+Gkzr1DB1eKe8J
         o3Yg==
X-Gm-Message-State: AOJu0Yz+NAkxaSCwgPsbvBtWWzy3EZsBiDMEs0z0aQBtCIy6h9cEpQMb
	SZDRbfnt7UYXBvGnrPOhXoFld4kD/YhKGB3sI3Nkc9TBoep/tAml1rDWUkcuWndPFS4yN00bCAZ
	BgC4=
X-Google-Smtp-Source: AGHT+IE+NNCUD/GTsedSGgrT6UADXj8fVwR0Ze5XjAZ0+I56f+rRnKIuGot3AuRuwX9v698kcHcY5g==
X-Received: by 2002:a17:90a:460d:b0:2cc:f293:90a1 with SMTP id 98e67ed59e1d1-2cd1606b633mr7531403a91.25.1721740410736;
        Tue, 23 Jul 2024 06:13:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/17] pseudo: Update to pull in python 3.12+ fix
Date: Tue, 23 Jul 2024 06:13:03 -0700
Message-Id: <4643fd6a90627ebec73ed7342f7e0b62e67b5f21.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202349

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in a fix which avoids syntax warnings with python 3.12.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51aa0217e595939f15bd3ffd7625907aef142c05)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c70b509233..5f32b3777a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0d292df61aeb886ae8ca33d9edc3b6d0ff5c0f0f"
+SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.34.1


