Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A27FC87FD1
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:45:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.26651.1753469100483052710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l8TfV5p2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23aeac7d77aso24108685ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469100; x=1754073900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EUzBbuX5jJiyLwh16AZ5V0k/dCAbCosKGG4CIDqINk=;
        b=l8TfV5p2B5v83K6p/QoSKkdm9MlBcWPRFgnzZSzrCjjKdiMUcbLNfHuZ3zBr+oh5HC
         8Rki816bzcEjB7gHUvn9cSuBWq+P3+ImSxrb0vEwhziRdnx4mCIOGN1ytgqtAue0ILf7
         WaktBFKxGVa9cqV+ak+IKRC4k6DaJva76KGG5YhJzuszejjJ3WanZeKDXG4h1rKxRib+
         WQeZSqGgsXlzr73EIO+LF1npLVBlJN6G5v0KohFSmJIA4rHcTrm1O1jUeikRRNoehYXf
         8gkJFQAYTcnb/JnDY/uRYbVD6zNz0EFaUgd+1ahLn7/wqodHQzxfdD85rEC54WJnyOc7
         5zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469100; x=1754073900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EUzBbuX5jJiyLwh16AZ5V0k/dCAbCosKGG4CIDqINk=;
        b=HU7sOqjoZgqurOzp+EgtiAk7mTxwkoTYOxFuZyYKsyvh+8AMYpGwdclu08koEh9PPz
         hvKZadYLXYekrlET07qMlDfqL/ewBHs9rdh/h/NsfCxlFZd8P0m4e0FOWQlf8HyyvSmr
         ILxvDdTrpV1JbwlUavCR7HWQzG7TXN8YZ2GgTnH8eS4+Zqz3ebbLvrO1lmJClbwdiEyM
         e5e0ui+9plE2T99A43AdqDyfNXfpdNV5LO479qYc/Pg0LvXyeIT83I5gjNPWY7aGBJ7x
         rIBJh4CzgRpOzz5iMd5p392j2Ls+ZDxBbPiVod73KWq+8gIxqtRN5Ezk3PuYtJEMqxGi
         k6JQ==
X-Gm-Message-State: AOJu0YwOruD1tPinqbwQhNbQAf5NDzCb1vkN4F5YA8ZHYzL3vbmBxQh9
	PKaxXab9HjlMpBNgk9HKEGhPyBEGu/Jz33B2hsw9HBqK9dOS/C+h2c/AbdBoEivxJY+3AvEJ0DI
	BBkkC
X-Gm-Gg: ASbGnculfb3g9Oj1NAGP5FWDe9U00ywYkqOPN0R0K0mmJ6hrOCqSregPCUvuiE57MaT
	9t2irdfWeasL3pqS3ddW5aWo7pZRJcGwcva0EmzsHmyb1DjUrWSWhVv0ApIlLOcfsivVwINzwrG
	Wgqq9NxyaPIdn2PAiUeDOz2AzFr78YG8+jIHefwkjvwEc3H4qeJGD6D80cdeq+xZ1WtBo6XYDcE
	9akg+eYtYZ+BsZSky+qI3e+mD+5FP3acblmioAb6xtJQXLg50oqrAQPyaBIj1XNCGzdJf4KnoR4
	IHPLoodFs2fhhfU4M1nxhalimPUtOMOutgMxsuGJOGS9k+Lf+HX4BZRAlrmqrTWnk3TWocm+Nzt
	r+TcMcwmP9z38Ag==
X-Google-Smtp-Source: AGHT+IE5jVxK3WT1gRzoEhu0cI9VeXQRzKVp6V+wr+leTy+UEP5Rw8Rtp2gsqBJ6SLLjeDQXjYE/4Q==
X-Received: by 2002:a17:903:3c4d:b0:234:c8f6:1afb with SMTP id d9443c01a7336-23fb2ee8a67mr42578155ad.0.1753469099720;
        Fri, 25 Jul 2025 11:44:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 16/16] mtools: upgrade 4.0.48 -> 4.0.49
Date: Fri, 25 Jul 2025 11:44:30 -0700
Message-ID: <c374e6cfcdd2c8ba17d82ffcfdeb97d21144e2bf.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220932

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


