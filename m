Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E75C0218D
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 15:42:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.12351.1737819767092029014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 07:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FI3GW2w1;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436a03197b2so20299875e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 07:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737819765; x=1738424565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDU3f3IuqhzMoMKK4yY5eb8zUt7rw2cZZEUA1u9OAs4=;
        b=FI3GW2w1j8DpyDdpgZBUb1UNP0gXGxr3LhxBpGya3TIwbtjmEgmsvTmdNuipXkzE8/
         eVpSjyga5lPlXDCjguabyi3yCLce/iypsvxj8hW2BzWFdO6VhcVCayPd43J3kx1H8p/8
         KdOf9XwsYn2TZUZ94QX/KlxGJA9XDe3ZVO+MMY5yc/95AGXy5GZ/wl6lnSLFHvVHSuP4
         RYgIMuYrESy757WjipRQUCE4nen9Sc3R/14Z+8BWZop96rH/1WmSiurAlcUwfqRhKxNC
         vRmSjTptFSI/Cy9hvyJNBQxqsNp/cALaJv5SlrFVyox5Q7jez0dYEMesq1QUBKDauI0q
         9MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737819765; x=1738424565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDU3f3IuqhzMoMKK4yY5eb8zUt7rw2cZZEUA1u9OAs4=;
        b=PHuIav9w8bDn9i9nEe3/Geho2tdG5KJ6WNFat+VJN354umfD9W3goEOvVreqkGnDIM
         jcZfaGuhY5OXIfHlQftiFqkq3WGt/DJ2V2AGcZeGpf+Uy4RBzT1EKFAqvre8pMYzAKWd
         sA8JLeKsnBnBiM8GLYYQ8MLEHTPqGADwA62L3t5uiOxsxHMe23EDuB3uOMCLOsi/NCpH
         Lz6Elhut5S2D4SEaUIWI+noDFO90qfLrN1SeX8fOU3Tv6XhFs0qMJmhtz/9k58OLTOIq
         opv3Nlv7C2pYEnG3aXYIWgru3Ce5+0fYOTaM0d2C9qONoPJXaMkIEDcDvjUtB7T117f6
         fFzg==
X-Gm-Message-State: AOJu0YyJel8rTNNA5xw42APGpU4edwggl/SoAvvwFeBS7UF0rXuECGRS
	rrwphtrPKnJncJyTj6GjJgHQNnyfoujSDJW34pap6bPeG/0VrnYQ2oTDsxnE
X-Gm-Gg: ASbGncu5fvHCL/VggWWqFsjD+nXObLToDuisYwBcSsk54QqyRxEgAzlORAYTDrXDvHS
	xK8YkHfKiyx+SWcGjfaJVSJdUloJkeuXQkDvPc4cM3cuEFcTHAdYpJ/1oo+M/vTs26hOTP6wvO2
	tT4CiEzUqFaJaD2J6jkFt6n7pDjcbCdYhnVM1b2+7f+mMEFNYmsyBUfL9j8i4ZUJMCBfZQKj+On
	3oGPDEY6ItSVPlzSxHhwQ9F/lF+RCfqaiLGNQqtH0edsOWh9M4Hsub6QQqbd3X2wwcydyIwfo0l
	zc0G/TuV820IMr54llzcCxnDQIgnjg==
X-Google-Smtp-Source: AGHT+IFMfVOefzvBOwjDc86lW6tCD1f49Vl1ypJWYsB6plDHawcFv2IdykoE/3kXbI2wXBPTS8oUoQ==
X-Received: by 2002:a05:600c:46cc:b0:434:a468:4a57 with SMTP id 5b1f17b1804b1-43891436f39mr264488695e9.26.1737819765035;
        Sat, 25 Jan 2025 07:42:45 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4c6fadsm64063345e9.32.2025.01.25.07.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 07:42:44 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [styhead][PATCH 3/3] gnupg: remove obsolete patch
Date: Sat, 25 Jan 2025 15:42:15 +0000
Message-ID: <20250125154215.3316474-4-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125154215.3316474-1-gudni.m.g@gmail.com>
References: <20250125154215.3316474-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 15:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210268

Remove a patch which is already merged in v2.5.1

See for reference:
https://github.com/gpg/gnupg/commit/1d5cfa9b7fd22e1c46eeed5fa9fed2af6f81d34f
https://dev.gnupg.org/T7193

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../0001-fix-compile-failure-with-musl.patch  | 33 -------------------
 meta/recipes-support/gnupg/gnupg_2.5.2.bb     |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
deleted file mode 100644
index ec99f4b10c..0000000000
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 81c222ea179ef73fcae4b50c56342bdad4787a28 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 22 Aug 2024 15:31:16 +0800
-Subject: [PATCH] fix compile failure with musl
-
-```
-../../gnupg-2.5.0/scd/app.c:379:3: error: implicit declaration of function 'write'; did you mean 'fwrite'? [-Wimplicit-function-declaration]
-  379 |   write (card_list_lock.notify_pipe[1], "", 1);
-      |   ^~~~~
-      |   fwrite
-```
-To access the Posix low level file interface such as open, read,
-write and close, should include <unistd.h>.
-
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=1d5cfa9b7fd22e1c46eeed5fa9fed2af6f81d34f]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- scd/app.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/scd/app.c b/scd/app.c
-index ba7bb23..7d41e53 100644
---- a/scd/app.c
-+++ b/scd/app.c
-@@ -24,6 +24,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <npth.h>
-+#include <unistd.h>
- 
- #ifndef HAVE_W32_SYSTEM
- #include <fcntl.h>		/* F_SETFD F_GETFL F_SETFL O_NONBLOCK fcntl(2) */
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.2.bb b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
index 64c63e31ce..8e87382f12 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
@@ -18,7 +18,6 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://0001-fix-compile-failure-with-musl.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.43.0


