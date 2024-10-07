Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52ABCFB444
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.44009.1728266123349472361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fsHFFCRB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20bc2970df5so28641225ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266122; x=1728870922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aa737yV08+zfv79b89idqmMZ9jyb89QV6sZWfz/H8XY=;
        b=fsHFFCRBSbjpt2lx2qIzjvhEbjmNd1fgKF5Gpl4uGQWv/YsWDl3igq13QWH5MrWw/Z
         twT/DFZGynYhSf2pTpZVAnb5XSplKVPY1c9nhtnTXgPZ2do7Kk2M8nUKV6faA870BaTx
         2cr9HvwoVQgfzhABLkYNdVeZu63h3smTnAypDeerSFpPMGwTSksyJMWrT7sp0JaTf6JR
         Dty1fXRlDGRePdWdJyvFauV2xdjL2TcubQhgltrAxL3l1uKN4ac8T3zUFb1BvZtMkH03
         WQYuEmLquiJC8i9MLTgcF94MfHXXYvM9vFvlaWiqJgO6ULQLPCMnIvW3tBYT42f0YjCL
         3+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266122; x=1728870922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aa737yV08+zfv79b89idqmMZ9jyb89QV6sZWfz/H8XY=;
        b=dpC5tvRotxmfadmnbGnJczQ0kjCcR98lpB6DJcyFuooE77byUO0mwnuE1wlVQ+V+7q
         ShHFglZyyYeZ5tTShoZjZ/H1jS24KYzuX398aRgU1svhafl2TUKKAmdfnE8ZbrXvFAA5
         agacmx1HZ0UQ8a0WacoNjCJNn/78SDy1fQNOR1wxU3F8mFdsLCdZxEMCQe0oBTEhCM37
         T9ucc4eqbnCP3GmthjAlR15MHXHDgdwkEPMqFF6K32uqtlqQdmBRmJ52Lm5GJEeM3R0K
         r/PYKjmjKHK6SGT93l9ScP/6hhuq4fDS0b2ZvwzhEAR5HCSZaHSNvU9CpLkpmOV1SnC4
         axaA==
X-Gm-Message-State: AOJu0Yz05JAOY5ii7cyq21GSkO1EC2MxI5UcQuOy/awMrw/8SQ0BDHeY
	Fu3aNH1ctYSfFLvcGe2I6CHi1p1YkD4iAuxPNamK3Vg8//FXcdkyZT7FFR2MDx6FJ/Kuxa6gX4U
	LqEY=
X-Google-Smtp-Source: AGHT+IEV+8LdhmfJV0vGsGNWx3/9iSvLXCO3gUeF9uypbj1ObO5srhwiFJSY5TYBOtW+wu2Ns3PFGg==
X-Received: by 2002:a17:90b:1047:b0:2c2:5f25:5490 with SMTP id 98e67ed59e1d1-2e1e636c80emr11373238a91.34.1728266122306;
        Sun, 06 Oct 2024 18:55:22 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] cryptodev: upgrade 1.13 -> 1.14
Date: Sun,  6 Oct 2024 18:55:01 -0700
Message-Id: <749f297f5d94fc97a5ade8f7cb0321d7286b2521.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205256

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Disable-installing-header-file-provided-by-another-p.patch
0001-tests-Makefile-do-not-use-Werror.patch
removed since they're included in 1.14

Changelog:
===========
* Fix compilation issues after API changes in several Linux kernels
* Split install targets to help package maintainers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Acked-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-linux_1.13.bb => cryptodev-linux_1.14.bb} |  0
 ...odule_1.13.bb => cryptodev-module_1.14.bb} |  3 ---
 ...-tests_1.13.bb => cryptodev-tests_1.14.bb} |  4 ---
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  4 +--
 ...ng-header-file-provided-by-another-p.patch | 25 -------------------
 ...001-tests-Makefile-do-not-use-Werror.patch | 25 -------------------
 6 files changed, 2 insertions(+), 59 deletions(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.13.bb => cryptodev-linux_1.14.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.13.bb => cryptodev-module_1.14.bb} (74%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.13.bb => cryptodev-tests_1.14.bb} (74%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
similarity index 74%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
index 5192cf03ed..6fb75675bb 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
@@ -7,9 +7,6 @@ inherit module
 # Header file provided by a separate package
 DEPENDS += "cryptodev-linux"
 
-SRC_URI += "file://0001-Disable-installing-header-file-provided-by-another-p.patch \
-           "
-
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
 
 RCONFLICTS:${PN} = "ocf-linux"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
similarity index 74%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
index 458ad8ecf2..f6a286e1b7 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
@@ -4,10 +4,6 @@ SUMMARY = "A test suite for /dev/crypto device driver"
 
 DEPENDS += "openssl"
 
-SRC_URI += " \
-           file://0001-tests-Makefile-do-not-use-Werror.patch \
-           "
-
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
 
 do_compile() {
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 64a9c2926b..8d0aad4a01 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
-PV = "1.13+git${SRCPV}"
+SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
+PV = "1.14"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
deleted file mode 100644
index c7fdef4da4..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 66d85d3f26e21cf7c38b27de0dcc42376f5d853e Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 6 Apr 2014 19:51:39 -0400
-Subject: [PATCH] Disable installing header file provided by another package
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
-Upstream-Status: Inappropriate [ OE specific ]
-
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index d83aee6..c8d8ae5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,7 +36,6 @@ install: modules_install
- 
- modules_install:
- 	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
--	install -m 644 -D crypto/cryptodev.h $(DESTDIR)/$(includedir)/crypto/cryptodev.h
- 
- install_tests: tests
- 	$(MAKE) -C tests install DESTDIR=$(PREFIX)
diff --git a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch b/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
deleted file mode 100644
index 3285548a57..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 47438e53e1156db0916c0f4683a24fe4d82152f2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 10 Sep 2021 10:44:42 +0200
-Subject: [PATCH] tests/Makefile: do not use -Werror
-
-Otherwise, openssl 3 deprecation warnings become errors.
-Reported at https://github.com/cryptodev-linux/cryptodev-linux/issues/67
-
-Upstream-Status: Inappropriate [upstream needs to update the code]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- tests/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index 2fb7a9a..e94f80e 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -1,4 +1,4 @@
--CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall -Werror
-+CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall
- 
- comp_progs := cipher_comp hash_comp hmac_comp
- 
-- 
2.34.1


