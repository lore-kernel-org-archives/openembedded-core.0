Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A79FC36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.7179.1742420545233270039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USsjKrCL;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22438c356c8so648715ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420544; x=1743025344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj4ZxCeusCJ3SPzLhtDIrUk3aRrSCgkaXac09n9L0Q8=;
        b=USsjKrCLY34WJ5RspHjZJuDuUwN9vQA0f9LHt5N2alwjvofM2IF8vuG7dCbeKoj9om
         daP9T8kjKUT4wAigZDaqtBv6gK21/HHbHDIQGeLq9XZRBEL58jq5hXOg0kdOVgeaVXLo
         okwgUEdttQo3JftZZob/LI2a6klmJiOuO/vpNICM37G5gbysLK2IEP5g4ESYjkiqp6a2
         ba+6ZpR62t0sZCnfBNrrEfoxRFSnT4WEcxdesNV73yQy5MKURbKnN5B+T6K9SCD4SNqf
         v4oCRjYJL0hNBrWpqpyVzMGnOiMZkYPvG4wSho07AUrNxtGhKW056SY0JQlFkmrvI+lJ
         3G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420544; x=1743025344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj4ZxCeusCJ3SPzLhtDIrUk3aRrSCgkaXac09n9L0Q8=;
        b=YZ/JIvAjpazKy0BIc6xLPEa0N0JmV7dR0h6SXBs9e8UJkGvgkS0UZDqX3IdHlPtmAF
         Fdbkw4Bv4XC7v0tUqIAk4htl4S9nxONBJ4erdfpvR8rZymu0yl7vpPVlFdr9VlP1kb9J
         7DsEvmQShwIbAObNHOY/SVxbla9X2gBD0CRoQO8T3R4czXLg1l4bLDiJW0bCF+vm/nAc
         /DdpK0XhHPPcx+S6bfVtUJmcL208iOxNeyUDUJEzrfbsFZiFca/hjZrFosLkzNB6YwRh
         DtGE8HqI8yyv9jmT+OdicOx73vO7pNgCDIe1s16ULFsv2cvxVyu3ekPkXzMIFx5D4PIt
         UUhg==
X-Gm-Message-State: AOJu0YywCCuxt9jHQh6dapWOtnyVBGZdtMpoI1DnfzYhmxa7gzDUb+Lr
	Cp3PlPaA8P5ACCYXCwJDp57RjGcBnANAul/fgYHkt2sBQQ8IMHXGnVZ6DuoL
X-Gm-Gg: ASbGncvXy9y4TdT/MdyrAhah2adxMTJXARdyASAZsYOOHMNOipUPXnOmil2G3yX4x7U
	qQ61NeTtkCknocUwWdZhNoFTtmamJF7nYClwVdS1fGZT/J3cVVxIMWcaZsbRhuaJlAdMzaQala7
	JF95OKWfEFWECARBRGbgpbPuufaY0llx+Xl7x26PPK1z+J9kCRKpYbmFvKJ61dPYZiQiM9NwRfH
	gV7aE3E7gFfXNgXD+f9JbfW42u7CoWc8RDx211mrD82zsvIOcTwShR3kni+0Y02Qqx4WAEMqWA/
	6n+CZOQqJY6wjs4t4TBZmbZoA6/2k4LKf3eh
X-Google-Smtp-Source: AGHT+IHIX9PrKP4r6Zfg+vbNzBYMfJLKPsofLfq54wGMb9BbXBp0mqFRld6PgqgGSs2ngD9E7e9S0w==
X-Received: by 2002:a05:6a00:4b04:b0:736:532b:7c10 with SMTP id d2e1a72fcca58-7377aa4df65mr1202126b3a.21.1742420544270;
        Wed, 19 Mar 2025 14:42:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 8/9] man-db: Add missing rdep for col utility
Date: Wed, 19 Mar 2025 14:42:11 -0700
Message-ID: <20250319214213.2505249-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213363

man utility calls col utility internally when formatting is asked for
therefore it expects col to be in rootfs otherwise silently errors with
retcode 3 meaning 'file not found' in this case its due to col not being
found, other distros eg. gets this via bsdextrautils dependency

libssh2 ptest mansyntax.sh fails due to this error, which now works

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2178239bb60..a6ac82e6628 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -13,8 +13,9 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
           "
 SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd zlib"
 RDEPENDS:${PN} += "base-passwd"
+RDEPENDS:${PN}:append:libc-glibc = " util-linux-col"
 PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
@@ -23,6 +24,10 @@ USE_NLS:libc-musl = "no"
 inherit gettext pkgconfig autotools systemd
 
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"
+
+# util-linux col is deprecated and only builds for glibc
+EXTRA_OECONF:append:libc-musl = " --with-col=''"
+
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2"

