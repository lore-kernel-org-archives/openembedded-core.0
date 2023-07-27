Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2813C04A94
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.8988.1690468600171252739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kHnLjEmh;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-977e0fbd742so136086466b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468598; x=1691073398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV/3tQrktEWIJowjes6XNX3Mmhqg3mgnjJ8r+ZXncJE=;
        b=kHnLjEmhp4AkpNsidR34veFjCvMkF8ThymhaJNAD7VSUz8chChIIo4uQuvq6KydJLy
         9IPE83hqyunt7UND9KBsPUkxnR7UlX1zSW/7yRNjmNEz1iCZmUvrinYI9/Lsgy0rhjqa
         Q4gnjHjk3fkMWhoEA/YMY2OszFSCPtAtIE0n9QPUW+Ol06k4Qvxqp5mhQtfu5AGXtvUT
         Os9b7uaMVzmu/KoC+kdpcvDyxbZS7X9BsDfYueJZHsR/+HxZphqY/P6Dm99vrNG99YFv
         Fj+Y3+3vynKTunqtm81/QcElh6haj6XBcZdcQwDgp4DoQsjbwVb6Sx+ntq1x5Ntdzxbv
         EwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468598; x=1691073398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aV/3tQrktEWIJowjes6XNX3Mmhqg3mgnjJ8r+ZXncJE=;
        b=gQlLAQTuR/oldcklZkt6Jewta9rj4FBLUtDurXvUf3PzqYrUf/0Zm+2x5xbJVy/5UM
         kXubhb/AK/8r1h/dwQmmNk3Tgw7JCb3SDVFtwLbzzte+cfMS3IermTFzgVdIkv28cHo7
         4+esEyVqz4MpmC7MxmNHk0OlmC1Y3fwnTKpxu3sKJe2RFmH5b5M8t4Y+rhsRTN31wkuh
         plGq58B0dDdJvx+i3/1whQ6k7KBbgI9ALhFqpJiUxxyW6vedU5D9EXFQgDQtE0RXm+KR
         WOTrOKs0H60VXtZJ9d5xtcmYyeo3JOA9BO4sCBDexu5ijTX8uCrTtbPMtIH9JIDVenD2
         mgaw==
X-Gm-Message-State: ABy/qLZZqKm0QTu6snZyZ5LPy/zHwjIFr0oT8Dkbem+VQg1orkLE7lEl
	WlimBLiXzz0oMorKlfr9PWeMspHw5lQ=
X-Google-Smtp-Source: APBJJlHN58yBZT32YfWZlnGYNqM418phzpmReVKmPxB7iqagfG8oVwo+vx7q4hrKI2hxr5029G4wPw==
X-Received: by 2002:a17:906:29a:b0:992:a838:a564 with SMTP id 26-20020a170906029a00b00992a838a564mr2060898ejf.28.1690468598492;
        Thu, 27 Jul 2023 07:36:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/21] sudo: update 1.9.13p3 -> 1.9.14p2
Date: Thu, 27 Jul 2023 16:36:21 +0200
Message-Id: <20230727143627.3718496-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184955

License-update: file removed upstream

Drop patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...me.c-correctly-include-header-for-ou.patch | 25 -------------------
 meta/recipes-extended/sudo/sudo.inc           |  5 ++--
 .../{sudo_1.9.13p3.bb => sudo_1.9.14p2.bb}    |  3 +--
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.13p3.bb => sudo_1.9.14p2.bb} (92%)

diff --git a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
deleted file mode 100644
index f63ed553bef..00000000000
--- a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f993c5c88faacc43971899aae2168ffb3e34dc80 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 24 Sep 2021 13:36:24 +0200
-Subject: [PATCH] lib/util/mksigname.c: correctly include header for out of
- tree builds
-
-Upstream-Status: Submitted [https://github.com/sudo-project/sudo/pull/123]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/util/mksigname.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/util/mksigname.c b/lib/util/mksigname.c
-index de8b1ad..0a69e7e 100644
---- a/lib/util/mksigname.c
-+++ b/lib/util/mksigname.c
-@@ -36,7 +36,7 @@ main(int argc, char *argv[])
- {
-     unsigned int i;
- 
--#include "mksigname.h"
-+#include "lib/util/mksigname.h"
- 
-     printf("const char *const sudo_sys_signame[] = {\n");
-     for (i = 0; i < nitems(sudo_sys_signame); i++) {
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index bedf713d2ce..feb1cf35a75 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
-                    file://lib/util/getcwd.c;beginline=2;endline=27;md5=50f8d9667750e18dea4e84a935c12009 \
                     file://lib/util/glob.c;beginline=2;endline=31;md5=2852f68687544e3eb8a0a61665506f0e \
                     file://lib/util/snprintf.c;beginline=3;endline=33;md5=b70df6179969e38fcf68da91b53b8029 \
                     file://include/sudo_queue.h;beginline=2;endline=27;md5=ad578e9664d17a010b63e4bc0576ee8d \
@@ -31,12 +30,12 @@ EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 EXTRA_OECONF:append:libc-musl = " --disable-hardening "
 
 do_compile:prepend () {
-       # Remove build host references from sudo_usage.h
+       # Remove build host references from config.h
        sed -i  \
            -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,--build=${BUILD_SYS},,g' \
            -e 's,--host=${HOST_SYS},,g' \
-           ${B}/src/sudo_usage.h
+           ${B}/config.h
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
diff --git a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb b/meta/recipes-extended/sudo/sudo_1.9.14p2.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.9.13p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.14p2.bb
index 2e11739470f..fa7939171f9 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.14p2.bb
@@ -3,12 +3,11 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
-           file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
+SRC_URI[sha256sum] = "15f6308db0ed4265ec929f2c61e2e13492e551750c203ee001d1fcd8104c9514"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.30.2


