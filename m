Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB5DCD98F4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5757.1781637409430603918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JLTOt4/g;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ac10e337so33389325e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637408; x=1782242208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkUpxNF00o7OvfyqLIgs33uUMkE2eLK/caTWhitVIlI=;
        b=JLTOt4/g65Qq53QllQ9LejsJOE5EcqF8XQRZf8jUI5EXV44hm9zNOMuzZ4Z/EX+mv1
         VXvCOkYnK75mbMcoAu2X1zYi5455jFxYONsOdZwOd1Awb7vU4frJmdkRlwRp18RNxFKB
         /rUooqUqVzhwbLTeYBJk3pZwb75w5wtaqk9/gnuEmxYUyWMoLUsLl7NbSDA+uX/ZPqve
         KIxOZcpZMyJxcR6OswaiJSrv67w9y6Tn4B/eddg/xQlGiNR0+Gu4IqzD55LIxv9ubFdd
         cUp3N2UjDfe7sO6oDuRnpVQ5PL1PhCOH9dd6qj5XtK4vmKB4/QiLSyICWsrL0tk5MxmW
         phow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637408; x=1782242208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkUpxNF00o7OvfyqLIgs33uUMkE2eLK/caTWhitVIlI=;
        b=LSMw3VHkYsPO9XfYPwLTGN7EtxbC/oEWG4YEj+jnW/WPSp3xSMcj9oNIGJXkVMecYi
         6/K25Vxr8+CroGbsRND7bqc13w4itKhBHZ3fZaYA4xfS+Ca7fTTGyHV5Op9ZJjwApXJw
         fnzTYfW5W+O0cCUvuJxnPTXtOTIVC0sIdAOE6qtVJCVakIuIswh20qFHZh6HsnwbfHy5
         KflzH7eIuhVhlQxJ/pGMYUq2ZE0AAg6RnW9DyaXbpH78nr+9lip+kGintHQDVl4czDzS
         t722G0f9fHFvXA9iQbDmp6kISgIQk326fy9GSBpebV1VlNRskSxDqPUWYOkPMpswF5CG
         odXA==
X-Gm-Message-State: AOJu0Yzbe+A1JO1Go/JMt83DFJR0KRt4xR9Cru3/ooEbVmEPwVL7BDAI
	Tg+tNQTDGmDgFWeWNCEOtesv/Qn/OFRO7TKWBN0e85dyiDRCiPbrRn4VAljx6uPb
X-Gm-Gg: Acq92OG6M6CgUY6OE66/PaOK1+zoRkjvwLYlLq6lHIemseOHxy5vq+66DNjI+tyvo92
	u3WP82HZdMJvp3hLjBRZ/LpEhSEWK0MaTV+MqJnbsm9LSGYE4ZNoDtEk9bpz3qxiV5ikUupkD4E
	VHzvchhz0eMAwllHKu65VH6lbsnhkZabu4J2zLgt6tteckZAVIcOn3jqUvfeirCdpc60nMyIlyA
	8bpf2H1NUPBnH8f5TQP+ISOv9iL4q2JqSpxnF7zako9FPb8Ud2GdsSo+aKUtyGjIYAiMi4tzj5+
	qK/c2sH+zjT4YQmmN93HOT16GMK7liMU20qYcK4tf8QRJoztjZwxfNcN7AlKDaHUOEr1SII4fO+
	pBxj78s1IxtuNc9DvPZf0ZxzOwEFH2ubDQlh6EEtOah6ymJQGyVNC+Mtto9QNTvPjqIaPq2eUhO
	6fL1uK5lRzU4qSr6o8sXkzDsokpub9rv0FglPkqst7hRBkSXPyLDwR3pzV6ObX2AqLEi/8vQ==
X-Received: by 2002:a05:600c:608f:b0:490:c0d8:d517 with SMTP id 5b1f17b1804b1-492333ba2cdmr15644555e9.3.1781637407566;
        Tue, 16 Jun 2026 12:16:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/30] nettle: upgrade 3.10.2 -> 4.0
Date: Tue, 16 Jun 2026 21:16:11 +0200
Message-ID: <20260616191628.2014553-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238940

From: Alexander Kanavin <alex@linutronix.de>

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../Add-target-to-only-build-tests-not-run-them.patch  | 10 +++++-----
 ...check-header-files-of-openssl-only-if-enable_.patch |  6 +++---
 .../nettle/{nettle_3.10.2.bb => nettle_4.0.bb}         | 10 +++++++---
 3 files changed, 15 insertions(+), 11 deletions(-)
 rename meta/recipes-support/nettle/{nettle_3.10.2.bb => nettle_4.0.bb} (85%)

diff --git a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
index ee3e74c43b..7e1d26b125 100644
--- a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
+++ b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
@@ -1,4 +1,4 @@
-From 3ea3eaf5bda21529fc8a8da3d8b07ebc3875ba7e Mon Sep 17 00:00:00 2001
+From 232da891d3468acfeb80eaf6fa1fad9454242ed6 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 2 Aug 2024 09:48:43 -0400
 Subject: [PATCH] Makefile.in: Add target to only build tests (not run them)
@@ -21,10 +21,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 71ad761..0f239f4 100644
+index 9399985..4d4046e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -53,6 +53,9 @@ clean distclean mostlyclean maintainer-clean tags:
+@@ -56,6 +56,9 @@ clean distclean mostlyclean maintainer-clean tags:
  	  echo "Making $@ in $$d" ; (cd $$d && $(MAKE) $@); done
  	$(MAKE) $@-here
  
@@ -35,10 +35,10 @@ index 71ad761..0f239f4 100644
  	true
  
 diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
-index 0699fa0..8ac9983 100644
+index b2f0518..c93b9b6 100644
 --- a/testsuite/Makefile.in
 +++ b/testsuite/Makefile.in
-@@ -137,6 +137,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../non-nettle.$(OBJEXT) \
+@@ -144,6 +144,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../non-nettle.$(OBJEXT) \
  # data.
  VALGRIND = valgrind --error-exitcode=1 --leak-check=full --show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
  
diff --git a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
index 89b5c7bec4..f4c77506f3 100644
--- a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
+++ b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
@@ -1,4 +1,4 @@
-From ec2ca7e505e6bfe1fff2a7d6e6bb39b60b93e19a Mon Sep 17 00:00:00 2001
+From 009724a1811298d11183d7432e1a82b92c95e083 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Fri, 9 Dec 2016 15:23:17 +0800
 Subject: [PATCH] nettle: check header files of openssl only if
@@ -23,10 +23,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7c003bb..779f7ff 100644
+index af017d8..9294e24 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -197,9 +197,11 @@ AC_TYPE_SIZE_T
+@@ -177,9 +177,11 @@ AC_TYPE_SIZE_T
  AC_CHECK_SIZEOF(long)
  AC_CHECK_SIZEOF(size_t)
  
diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb b/meta/recipes-support/nettle/nettle_4.0.bb
similarity index 85%
rename from meta/recipes-support/nettle/nettle_3.10.2.bb
rename to meta/recipes-support/nettle/nettle_4.0.bb
index 7b7be5f594..c66677c08a 100644
--- a/meta/recipes-support/nettle/nettle_3.10.2.bb
+++ b/meta/recipes-support/nettle/nettle_4.0.bb
@@ -7,10 +7,11 @@ context-independent set of cryptographic algorithms"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
-                    file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
+                    file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
+                    "
 
 DEPENDS += "gmp"
 
@@ -20,7 +21,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
-SRC_URI[sha256sum] = "fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5"
+SRC_URI[sha256sum] = "3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -43,6 +44,9 @@ do_install_ptest() {
         install -d ${D}${PTEST_PATH}/testsuite/
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
         install ${S}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
+        install ${S}/testsuite/*.ref ${D}${PTEST_PATH}/testsuite/
+        install ${S}/testsuite/*.sig ${D}${PTEST_PATH}/testsuite/
+        install ${S}/testsuite/*.msg ${D}${PTEST_PATH}/testsuite/
         install ${S}/testsuite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/
         install ${S}/testsuite/sc-valgrind.sh ${D}${PTEST_PATH}/testsuite/
 
-- 
2.47.3


