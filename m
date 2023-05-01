Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1432DC77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 10:34:38 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.90523.1682937268206945848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 03:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XYfqJtju;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50bc34b98edso1906503a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682937266; x=1685529266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzRcG7E5m4dORhXLF1D49gz+VjFT8FW32oOwqGrdYC0=;
        b=XYfqJtjuvJlcF//WnDvsehbWQdCSo6pkjNQE/Hq5JxJr3Al/7rKQ6WtIVNg+wiWNB9
         TpnfQzI+V43GrBuS4JvdxFN9OQKBfrCbfvj4Omvp/Hcsu0YXDFAY1Qm7xrHpprJ6Po7+
         /B+ZfmKwc7L3/dYOOPGUbZ2/9RGrzm+xCatchMKEXhgfEnmRzhB9J5qyW+b8xE/S5vmr
         P8Ung2iFlZ5AkuIMkrmg40Q7EuJ69Qht4ddW5XvqidocVSEjytQH+PaypwPIZ5VqwqN8
         d+UCzyuAl8Ddjj8K9SJKQ8b3VSJLHX6nlncaTrG0m15X5gFc2qj9PIFJrpjz8k347Jyy
         jXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682937266; x=1685529266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzRcG7E5m4dORhXLF1D49gz+VjFT8FW32oOwqGrdYC0=;
        b=How3n02v1GUq5ZEe5VkL4oU5gC1HXQ0GDEVlZbDwiEoB1h3CxdOb8HOxxtpFkoXbwP
         6yxPeXq/2nsB6WrI47hBaTwsNrbafQoEQ69i19ddg0KZyDvXx14eUh6MsZHEmGsWmkyf
         VipafCXbQSY1EPNQRGu304+pnOYbe2cIr2NKcPcg3Zm4w3z01MNAhe84n+M7KC0ZWU4w
         Ik94dodQ9uAfsu6Yzibq/XD16l8Xw1ST2wY31VVKoLlyA0/P+XH0cMRRwxKEGGQt8k0l
         eEQl62VEgnjLnL1Sj/XmFekV4XiLtRzkGQ9u5Zk3NIpFLJiCcpHWmeEBObzsP58w0XXK
         couw==
X-Gm-Message-State: AC+VfDxVg00K527g2bQai2ki1QoMei4tGyrYRVrEyariNpFAjEtL5rXm
	JO+qGb3DqR4s5XGiwyaMoWvAONmLwsY=
X-Google-Smtp-Source: ACHHUZ4Pu6Mv/+D18etzyLg7nwaCPCU1CxI8SNkPXXaIgRo0COFMykfXSYDE9HffeQfnu/ykF5VQeA==
X-Received: by 2002:a17:907:960a:b0:94f:7d24:9c02 with SMTP id gb10-20020a170907960a00b0094f7d249c02mr12544505ejc.26.1682937266455;
        Mon, 01 May 2023 03:34:26 -0700 (PDT)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id ho17-20020a1709070e9100b0094edfbd475csm14362113ejc.127.2023.05.01.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 03:34:25 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] cryptodev: upgrade to 1.13
Date: Mon,  1 May 2023 12:34:12 +0200
Message-Id: <20230501103412.1151195-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 10:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180585

Upgrade cryptodev to new release 1.13. This resoves the Kernel build
issues for 6.3.y, where Crypto API has been updated, see [1].

Refresh all layer patches with `devtool` to resolve hunks.

Link: [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=255e48eb17684157336bd6dd98d22c1b2d9e3f43
Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...-linux_1.12.bb => cryptodev-linux_1.13.bb} |  0
 ...odule_1.12.bb => cryptodev-module_1.13.bb} |  0
 ...-tests_1.12.bb => cryptodev-tests_1.13.bb} |  0
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  2 +-
 ...and-install-rules-for-cryptodev-test.patch | 38 +++++++++----------
 ...ng-header-file-provided-by-another-p.patch | 11 +++---
 ...001-tests-Makefile-do-not-use-Werror.patch |  3 +-
 7 files changed, 28 insertions(+), 26 deletions(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.12.bb => cryptodev-linux_1.13.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.12.bb => cryptodev-module_1.13.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.12.bb => cryptodev-tests_1.13.bb} (100%)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index ef342a157c..61c688f1d0 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
+SRCREV = "795f5fda1485d447cdbad342e8304be317d4f7e8"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
index 84fd27e681..8c40e62389 100644
--- a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
+++ b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
@@ -1,4 +1,4 @@
-From 1980a8f4779a955e73285e7a0d86549b69bea5c8 Mon Sep 17 00:00:00 2001
+From 3ba8ba9410464d0986bc6cc5ddb1819745af1eb2 Mon Sep 17 00:00:00 2001
 From: Yu Zongchun <b40527@freescale.com>
 Date: Sun, 28 Apr 2013 14:39:22 +0800
 Subject: [PATCH] Add the compile and install rules for cryptodev tests folder
@@ -10,27 +10,27 @@ Signed-off-by: Yu Zongchun <b40527@freescale.com>
 Upstream-Status: Pending
 
 ---
- Makefile       |    6 ++++++
- tests/Makefile |    8 ++++++++
- 2 files changed, 14 insertions(+), 0 deletions(-)
+ Makefile       | 6 ++++++
+ tests/Makefile | 8 ++++++++
+ 2 files changed, 14 insertions(+)
 
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -35,6 +35,9 @@ modules_install:
- 	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
- 	install -m 644 -D crypto/cryptodev.h $(DESTDIR)/$(includedir)/crypto/cryptodev.h
+diff --git a/Makefile b/Makefile
+index d83aee6..3a750a1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -41,6 +41,9 @@ modules_install:
+ install_tests: tests
+ 	$(MAKE) -C tests install DESTDIR=$(PREFIX)
  
 +install_tests:
 +	make -C tests install DESTDIR=$(PREFIX)
 +
  clean:
  	$(MAKE) $(KERNEL_MAKE_OPTS) clean
- 	rm -f $(hostprogs) *~
-@@ -43,6 +46,9 @@ clean:
- check:
- 	CFLAGS=$(CRYPTODEV_CFLAGS) KERNEL_DIR=$(KERNEL_DIR) $(MAKE) -C tests check
+ 	CFLAGS=$(CRYPTODEV_CFLAGS) KERNEL_DIR=$(KERNEL_DIR) $(MAKE) -C tests clean
+@@ -54,6 +57,9 @@ tests:
+ 
+ .PHONY: install modules_install tests install_tests
  
 +testprogs:
 +	KERNEL_DIR=$(KERNEL_DIR) make -C tests testprogs
@@ -38,10 +38,10 @@ Index: git/Makefile
  CPOPTS =
  ifneq ($(SHOW_TYPES),)
  CPOPTS += --show-types
-Index: git/tests/Makefile
-===================================================================
---- git.orig/tests/Makefile
-+++ git/tests/Makefile
+diff --git a/tests/Makefile b/tests/Makefile
+index 2502f32..2fb7a9a 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
 @@ -23,6 +23,12 @@ bindir = $(execprefix)/bin
  
  all: $(hostprogs)
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
index 885b5823e4..c7fdef4da4 100644
--- a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
+++ b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
@@ -1,4 +1,4 @@
-From 8a884f55bd1527baa82fab68c186ba546273860c Mon Sep 17 00:00:00 2001
+From 66d85d3f26e21cf7c38b27de0dcc42376f5d853e Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Sun, 6 Apr 2014 19:51:39 -0400
 Subject: [PATCH] Disable installing header file provided by another package
@@ -6,19 +6,20 @@ Subject: [PATCH] Disable installing header file provided by another package
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 
 Upstream-Status: Inappropriate [ OE specific ]
+
 ---
  Makefile | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 5a080e0..bf02396 100644
+index d83aee6..c8d8ae5 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -33,7 +33,6 @@ install: modules_install
+@@ -36,7 +36,6 @@ install: modules_install
  
  modules_install:
  	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
 -	install -m 644 -D crypto/cryptodev.h $(DESTDIR)/$(includedir)/crypto/cryptodev.h
  
- clean:
- 	$(MAKE) $(KERNEL_MAKE_OPTS) clean
+ install_tests: tests
+ 	$(MAKE) -C tests install DESTDIR=$(PREFIX)
diff --git a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch b/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
index 347a4aef0f..3285548a57 100644
--- a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
+++ b/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From e2c2895d52761ddc6384a31364236dd13f677c34 Mon Sep 17 00:00:00 2001
+From 47438e53e1156db0916c0f4683a24fe4d82152f2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 10:44:42 +0200
 Subject: [PATCH] tests/Makefile: do not use -Werror
@@ -8,6 +8,7 @@ Reported at https://github.com/cryptodev-linux/cryptodev-linux/issues/67
 
 Upstream-Status: Inappropriate [upstream needs to update the code]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  tests/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.25.1


