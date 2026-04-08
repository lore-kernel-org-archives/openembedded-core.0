Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86101FD5F77
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 04:47:51 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.99156.1775623661659164774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 21:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L+4c3rim;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c54c68db4dso11447705eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775623661; x=1776228461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnYlbXjiYPJUx9Oe9qTZhdVj3WdSo4hlOFUR+OZAJkQ=;
        b=L+4c3rimaDF5+Ynhz8rXTEW2HE+PlQGiwivOhTwy4FshbY9Lw6N+2BxBPaPc3E4PDa
         EJlrLNHtthoK8rGMyqcZOo1A1TMq08tysDYBT86VzUFUtP8ApFOLfN9QSUdRj5QayUpQ
         fxrx0Mv3HdBeTYres42WWUwlshXKFJN9T4umWhKv/m/L/FbqvbhjrAVyUq24AABG4/QJ
         JkmPUiZxD1I7y35+dlxdU51zREx39ud7KqYdFso5QDpeymoogblo0+tJCDDtZolDL3Bi
         BQ6CykdE2imuQ5Hq6aS1KcjGMGyqq5+A8akbQl0wRQhf21azecsY01rC5UiLB8Dzt7vT
         QeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775623661; x=1776228461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnYlbXjiYPJUx9Oe9qTZhdVj3WdSo4hlOFUR+OZAJkQ=;
        b=Vq62GMqhmkpP9vkWOjXJxM9iFqp2ljNFP1vv2Hn2fguOFW2d2j/WDxFg6DwmELuHoW
         ImGSkc6GK42D8aCLXUHjXsKbEgqNYw/k6TGE5ULu70vpHO6aip7c6f5qoDDfih7umlJO
         fBpv6rYdZAMpGprO2RUeKwa4eV08iPhL6b8pEum/u9lB2ul1khTivQ0fM0IQm2ZHEOCh
         jekJQcNb4GZ8zr2vzhqJNTTm0hEHHas61rvGiqFskVAgBXlT+Mz9AxOq0U5fB7AyO5CV
         FGun3z7tlUZIhTRerM3dtHshILzxJvNI+rEfsVAWM6KV6KUFt8tNFTfU37nmq+fDvhqr
         6eXg==
X-Gm-Message-State: AOJu0Yyv3faqrgmQBG/zJkig9lm87uIP+PCRSYQUb8wdOl9YQvRt9yha
	fp9zV2KP66AoZLyASQqhQ0RSaKQh16zyZ1RKddTaBGN21pnYGyg14pq7no+wvRoH
X-Gm-Gg: AeBDiesA2J2j0oqltkf5Nc0wr9+IVfyAxA42/ttzeCKJ4gHnPIfQI12rOj4CW7XAl4g
	dIbKqAkfFhNElNkmOEzDryTVMYBco8hNiu9p1vY5od71DkkX/QZhBPIUzwveunIWP8bunkUqdNI
	XvLjXJxRaxxeJ+j5I80dd1b4gehrZc53pL0QxhEoWtZ9joCNSJWKPqws5uJaB8l6dnQ0Gy7enmV
	LZrZ5inhsCl0nvAEKrxOe8ls1FORMmb1IVgSbAFVqQXFQvDVYJIU1Iy6n3mzNSDh6j33hvgV43K
	C0pP0AWf8nYXTt9jCr4gB4Q6UEgOKjZmgoZgzLG/0VHKKE4Mi1ULyCm/HpTNiEUHAhx+m11nN45
	WWEyBHk0mV2X4mbweFyT1YI56HRpaojP3VmNJ0kWc4k9rxL4aTQOYnOIAomkAtHiOopkTIVvfS7
	SWGy8qcjIbOeenE18fIonnd6aCOB2qLtUzt2eZpPgaWM0tziWfRsURYKasnR7O+nwvz5EPji1dL
	Vywp/xkaBM66TiiJGDdEFq+w3xH97QxYiO7S+aCYTUNH7dnD9wOmS7uuCXm
X-Received: by 2002:a05:7301:2b05:b0:2d2:c60d:4fc2 with SMTP id 5a478bee46e88-2d2c60d58dcmr1170613eec.4.1775623660652;
        Tue, 07 Apr 2026 21:47:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc6e17e0bdsm15917980eec.31.2026.04.07.21.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 21:47:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] db: Pin to use C99 std
Date: Tue,  7 Apr 2026 21:47:37 -0700
Message-ID: <20260408044737.696968-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 04:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234805

GCC-15 has switched to using C23 by default, we have been selectively
disabling warnings as errors to get by, however with autoconf 2.72 adding
-std=gnu23 it now gets enabled for every compiler and clang-22 is more
obidient and has dropped support for K&R C completely. db5 code has a lot
of K&R C prototypes and it starts to fail vigorously. We can not keep
working around with out uplifting sources to be compliant with newer C
standard like C23.

Therefore pin the cflags to use C99 standard as this package expects.

Drop the code to disable warnings as errors selectively.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 8d2af1f5dc..f6205ec125 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -71,7 +71,11 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
 # configure.
 CONFIG_SITE = ""
 
+CFLAGS += "-std=gnu99"
+
 oe_runconf:prepend() {
+	export CFLAGS="${CFLAGS}"
+
 	. ${S}/dist/RELEASE
 	# Edit version information we couldn't pre-compute.
 	sed -i -e "s/__EDIT_DB_VERSION_FAMILY__/$DB_VERSION_FAMILY/g" \
@@ -115,8 +119,3 @@ INSANE_SKIP:${PN} = "dev-so"
 INSANE_SKIP:${PN}-cxx = "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
-
-# many configure tests are failing with gcc-14
-# -Wno-error=incompatible-pointer-types needed for gcc-15
-CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
-BUILD_CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"

