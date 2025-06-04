Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74367C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 17:21:54 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.22460.1749057712588125055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 10:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cC17+jmT;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231e8553248so885145ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057712; x=1749662512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBAHw8TV2bsYPKQKYc+Q6G4fC8l2EjOOjOH+Xukg+Xk=;
        b=cC17+jmT4bMjF64FAUFahuiZppMO5VqSsCQCUNBsIU/7b/nDFuFUd3rN3XduA8OQSN
         ZxTxc/LEHlsSjF18xgXvBNFmjOmThcK98GHp7ehKw5J5v92G89/wyF97SPqgQfGitQga
         8VJgOXJ+/1lObsfCSbYTAQKGvRy+cS+AC6fpxmoPu955plY/bcdcWEmV0Rrj6+w22mKO
         6X3DTGM1ywEoqw7tgr1Is2pGhrFzERG4EL/q70m+wmBzE8z4YJQXU6M6994M/WapXk3B
         hIVsnokm4ACUIRZIlmwd5eibOVzMxdL2bgrdDFky5vy29/5QQS+ikSGWvjiQf1D3dD5S
         4UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057712; x=1749662512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBAHw8TV2bsYPKQKYc+Q6G4fC8l2EjOOjOH+Xukg+Xk=;
        b=WVwOq4K3bA+Qo+P7w2HyfgKcvd8BOod5SmmVTpOkCtOcANg/hZIEiYr1fjmP1HKcrF
         UC4jRcYCKI0e3sfOwUnhfwvpQbMHaDF3AEivKj25lmBr6ipHpvw5ew+1uAsJT9AYh5o0
         WVSbsQQxYqaWkS2YUTsA9ILEmQ4JfW3j0xpUAjnMVVvjzwI6TwZuy0rNQr/lobBmmL+y
         iE7hMEk9cxhmqmkcsl1Jh0N47EgweZO/xO4lb3wpVJYD3KwaVG1V3znEdujmh0r/WYbl
         GjCpTiVfU6iZWfnEKZxQblaFimoishWGq0jS7lHo2CBlH/GrAFj6KE+rTEOkYXMAKIm6
         J2OQ==
X-Gm-Message-State: AOJu0Yz1Km2nTfph6JGE0wRMKX0mycYX+rBMr0T2crNF/l+GyeQBtMan
	1b6e/0QLz4WN1DO7V2XcZ4eYKRathXxS5ux5cKKXcOpHJQaFsvnWKzaOy9DNF7xk
X-Gm-Gg: ASbGncsfu81QreVNyLql4XpMpcT8f7h2mez1ZWNlOz/a1RM+Ra5CEzCblrR4sgmAxlM
	ucL7PYJpON1OxsTQCQvPQrVPdDT6Fpz4eRQxkH4B3t22UJ2ZmWLKCgE+v/iG/AoKTSrVOIaqO38
	cg4Nr1CXKtJ/Tg+BWUoaIYFm35OCkvkjJtZArfDZR9lgm20I0lYgYeglJJGj2cnqIvkzZ8uBk7C
	51T+gcvzKZsY51YMkBjVwq8LNvnflnIHTIorG8J6ZrzBJHMRpsbgKd32AmZ/CQXKJaTh9LxYOPS
	QK3yPkGU+cZgfPRVTfl3O6UtMvYbGGIfgUmjk/eflw==
X-Google-Smtp-Source: AGHT+IHb7khJbHi4zi0pMRmUen/6HXPm1F8BmBjxSIe+LAtD5vlHmCcHeUqK2ZsLxe0899VOLk7Vrg==
X-Received: by 2002:a17:903:8c5:b0:224:10a2:cae7 with SMTP id d9443c01a7336-235e1205a43mr56627135ad.40.1749057711607;
        Wed, 04 Jun 2025 10:21:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14c9asm106130325ad.231.2025.06.04.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:21:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] m4: Adjust ptest dependencies
Date: Wed,  4 Jun 2025 10:21:48 -0700
Message-ID: <20250604172148.3469654-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 17:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217961

This ensures the dependencies match across musl and glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Do not drop iso-8859-1 locales/gconv

 meta/recipes-devtools/m4/m4-1.4.20.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools/m4/m4-1.4.20.inc
index 0640395050a..a31335f173e 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -49,9 +49,9 @@ do_install_ptest:append:libc-glibc() {
                        -e  "s;LOCALE_FR_UTF8='none';LOCALE_FR_UTF8='fr_FR.utf8';g" ${D}${PTEST_PATH}/tests/Makefile
 }
 
-RDEPENDS:${PN}-ptest += "make coreutils diffutils bash"
+RDEPENDS:${PN}-ptest += "make coreutils diffutils bash locale-base-fr-fr"
+
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
-     locale-base-fr-fr \
      locale-base-fr-fr.iso-8859-1 \
      glibc-gconv-iso8859-1 \
 "

