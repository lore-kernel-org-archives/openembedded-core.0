Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B9ED1266D
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 08:51:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10512.1764751908843360701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 00:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTEEZ87w;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477aa218f20so44696195e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764751907; x=1765356707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RkEAaej4pVAOMMOddDUSpFkjEDHhDSedbiu1sMSFv8=;
        b=iTEEZ87wmEFsqeTJvOPATC0qAi/qMxryZMj22v8DGlUGzquhciXA0fkv/wiqV16CLw
         RcvzjxoHCgKWMVW3wC1gtLiaZIACK2IFxIqyKUoiKvGEZ+Ech1LWuwtKjssnaV+ohqAl
         gQvxUMya4PRG1DNeBLyvlZx80uPEMWRjBitUG+rNNlMc3V5n7fjLhUDuSlahLBRizOj3
         7gS0Wunz+cQAShO4+WVtpeoL3mJtfVWfNlB8bsYFLaeik0gJQMWNYO5Kmnyo2wsvbQxu
         UZQG4dZb909CgjkQJwS8W6HFJ3s3tMpLw8z7Yevw/XV2HnEONZy7gfX/75Tmk1/0BM9G
         B+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764751907; x=1765356707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RkEAaej4pVAOMMOddDUSpFkjEDHhDSedbiu1sMSFv8=;
        b=Reb/5Lc0e+m4opF3mo+UbngXYhbG6mjnqdtYOO5JT+ZxmXFjNUOVn8z3aBs7tc4b4D
         0eCqcL3trxwLoqfEJ9uhKXEsR0H+IIavRjFBDZi3OfzFhFORCc/fHOkiBmj4Js+LepFF
         nkUJJIQ5Eqzark9dgbEnRMtCT38qAmud7p5AQAor3cPGpX2up7TgtkCN7DwyxCF5qV99
         TbSZCsvFF+pk1slK6OBaRp3VbbRltDjGOXzKbDphsWzNBL+QWiFTV9L8/ruhUuXUbhdA
         7QVHqkJ6Y9sUDeIBIyscaxtSLi/pg0wNqBatl7oRusF24OestNnfUArkqC8JJcEAhvCK
         wslg==
X-Gm-Message-State: AOJu0YwjRytgWe8R8ch6wO5RbVWfHk+Vs8AqXp35CNFc0X7L3yC48a14
	AuYjrlwZo1wMQY+qv66Yrx/MFG8W0vgwAM8TR0dpj8UrTYkE3mBt69xeJy9t4w==
X-Gm-Gg: ASbGncvZ3EAZQxk9Ju3M5zGDTZjt++kmAU7IX07ATcbn1kXFOyovJpWQyk+LvJpzlaZ
	r6PIlXJdq15Nfe67Dffxbk1PMXKblZpwOn+g4kcTlAz1C0p8YpX25RwqPZo4UdQDFtboiCJTlqI
	cm94Z7q40Xn1iKjlnZYAyex0m2tRyR7QkJGvNxl3caO/tKPn+ttoIiKzpDdbj8diy60e/5Un0KE
	xB1KplKIZ7aiXZmed89Nn8etM52aYxjUJbOcJT7WbReyQBz04Qz7wqgBZgUcdtoJE0fd1jsnWaT
	9JKenHX7Vv6TYBGp6MI7LpANAcnXzh+uVd9Jl8tIcVCtccZdO9jgBYdQTFGniVrwEEuxC8EPPry
	bP+ex6svL4BXs4gSdxaHJJso+1ycKYz3NfYFkIj7qBSnT3jj1LJZwaRLz8FdFb2fkOLcIZKqEoJ
	CxEnHcFCYx27Zzh8USuxQ=
X-Google-Smtp-Source: AGHT+IESAn8oo0iTHU/Ifehj6WuDezmQYq3DnHZHNYal39n8o/gl5NO4TKz4k2w+nOXiOrqdy7rdrQ==
X-Received: by 2002:a05:600c:154e:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-4792aedde78mr15129785e9.7.1764751906600;
        Wed, 03 Dec 2025 00:51:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79ed9asm34825895e9.6.2025.12.03.00.51.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:51:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] enchant2: upgrade 2.8.12 -> 2.8.14
Date: Wed,  3 Dec 2025 09:51:45 +0100
Message-ID: <20251203085145.3796782-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 08:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227209

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
---
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 .../enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb} (91%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bc58b2312b..4a6f1ff6c2 100644
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
 

