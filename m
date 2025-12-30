Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A00EE49AD
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71742.1767125562980140846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=emsK3+EV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0834769f0so101048485ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125562; x=1767730362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DaiMt37Z2jXduj0BCIkxG7lfdIzLNXIG29GayoiZ5E=;
        b=emsK3+EVXj2jNNxpmcA+oV7ei61ejVWIb+UCZy5rbjaqIYDK/ZKbXIykwXZ0RF0jhx
         Cql8QVMTUhhgB9lb1wBlYjujPwZ6VJDMv5CzQkZE8ToQfXc/DmmgxRFFChtYVuS0eI1O
         uWx6nTk47sdvtz8HFAST2nDv5fDTPjr3G1nrZI8xpY0KeKnJC7Im+umqLzXIQwVjTpQF
         EFsv6zRBbQQ47pTRM0vWHD5pMbKfZFo8csjjpBXda2qqN5tKMdI8CvjWeIaTMuQj7SGL
         BXNRy7gvoK697w2wunrQJEjZ2yKdzSoxoVENr4yoMxDr4OnvoQO6IJEKgPo2jPAAv9fW
         eQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125562; x=1767730362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DaiMt37Z2jXduj0BCIkxG7lfdIzLNXIG29GayoiZ5E=;
        b=XLHzMFAoCeYyXnpSsT8GA82WO6iXxYGUAbRqowWO+fgS0uZH6aoQX8FXwQSe4J2e+7
         X9dLc6SovkYp+uUNJFCMFGtQb7pVp9nzely58FeLSfqK1Zs7S+AmWG8uG/AOegInacpV
         V8GRlysg5JZjGIPeY3ibXtB0AEzUwCiF6cxkU3iPtikeOW5VMeYkl7Jvvz/D14FY3gmy
         sBfiPddiX9XE0JbQn4fXaQDtetHnJh3CjDBk2lVoTzQNXC+dZZM9Xi1Ncup2vVR8nd8A
         WuJGGcwtalCcUWZaRo1bANx928JMMoGcwuiaG6Qlv7mmQFRFfX2Sv1e0IE1ErFJ2sxFd
         TYsA==
X-Gm-Message-State: AOJu0Yx7zqMtG64/7mSuS/8bGeX7IanMiFCid7qOMg6vuD/oTFtZQsug
	EkTxyqT0t5b7KPvvQGa92NzFZzlaJ7CPMhZN+yauLu6AgMFpRMlzWTDT8+GDWsTLuwV+hksIvUo
	91uru
X-Gm-Gg: AY/fxX6xK2VjJ1xgcya/mbEH8b/gPynjSNslIAkKxSL2iRviUY6/8yjNTgGPQpLJD9S
	TpjzrwoqP58u5TYxnZxyi/0bNjlhwiiIwMFWCqyiq3HLwDuci7iEptCM4Zu3r2QBZo8u2RfvL0l
	q5W8tSKh9ykyGcppQDec3esZcg99ZUmUaoOkpDYajfYXqhIPewScTrbUnT30vOnd+xMg7I5fJkx
	Ue+q9gNchiLCM2ckFWhhwI5MXUoJBhJaXEKqyURviE89ms5HAANC5Py5dVfdtnn++x5E+qsLx3K
	s7U+WsOmVzFToDVdUx4YYrX93unogjRIIXq15S03TrvaLTfepbOurNQSinuNtFJOS0SzV6zPlfl
	d+H86pwNQKAdiEWJxfgMD7FogPY9qT3rOBXq9LodjK5Uc1sNTfSRhhccUQb+IrnxIIXS3zxuCYd
	B9WQ==
X-Google-Smtp-Source: AGHT+IHGZRoh8ke6YNQ2Ymcn37M1Bnbp4iWCg7UyIZKUY6R0lGOYNQ2jB86MDnT7BwXF7yQVquLhIA==
X-Received: by 2002:a17:902:cece:b0:295:6c26:933b with SMTP id d9443c01a7336-2a2f2205155mr324796665ad.1.1767125562239;
        Tue, 30 Dec 2025 12:12:42 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 21/29] enchant2: upgrade 2.8.12 -> 2.8.14
Date: Tue, 30 Dec 2025 12:11:51 -0800
Message-ID: <7d6e4313562b529f092483dbdb8868ae91a9ea00.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228713

From: Gyorgy Sarvari <skandigraun@gmail.com>

Release notes:
2.8.14:
This release fixes a test failure in the previous release, and improves
enchant(1)’s word division algorithm, so that it only considers words that
contain at least one letter. (Words may contain characters that aren’t
letters, but Enchant was for example considering “1900” to be a word, which
is probably not helpful.)

2.8.13:
This release fixes a bug in the word division algorithm of enchant(1)
introduced in 2.8.4, which itself was attempting to fix bugs introduced in
the previous release. This could have caused a crash, but it seems we were
saved by careful bounds checking in GLib. Instead, it merely meant that
characters not valid at the end of a word were not removed as they should be
before spell-checking.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03477472cfc0417241486a3d04441ebb95f087e5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 .../enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb} (91%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c3174cbb7..cf36c519ce 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,7 +170,7 @@ RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ell = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-enchant2 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-enchant2 = "Gyorgy Sarvari <skandigraun@gmail.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/enchant/enchant2_2.8.12.bb b/meta/recipes-support/enchant/enchant2_2.8.14.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.12.bb
rename to meta/recipes-support/enchant/enchant2_2.8.14.bb
index 84f0156bca..4f8f2cf7f8 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.12.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.14.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "20e5fab2ca0f95ba9d1ef5052fe5b028e3e1d66d4cdea6b9adfcbd3e524c2a09"
+SRC_URI[sha256sum] = "d04588769399ff7140fa214b9731e6fc6eda9bb2e75df9f67263717710bb4c4b"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.43.0


