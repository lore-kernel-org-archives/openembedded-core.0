Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2029F4642E
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46608.1773653414821206785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u5wpFU2i;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853aec185aso35591945e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653413; x=1774258213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69bGY8sRAnqQnuUUadM0Bx18tFRBTopYNLXt+QOZ0hE=;
        b=u5wpFU2iY2tKOW57yXyx+pRRezP5YfJ7/lH/8XPmXR1Ot3Q/Sbh99OFU/IP+gAxkyU
         BgBo4CRyf5sHivckeC6+kopg2ei+BmWeD++jD/DK5NZToJ+i6xNo9f0MIe+KQjjOqYWq
         wspAh8U7EtPnSfQBG/PVcp66YtgbGB+4uHzsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653413; x=1774258213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69bGY8sRAnqQnuUUadM0Bx18tFRBTopYNLXt+QOZ0hE=;
        b=PG8CGLMaW5E0iq9kA7yosWwooOVxdPSTJVgv426lnCn1uOeVPpnElqSOtjEz8JDSEt
         YcxGHh1w5ms+5AAY1e5FEuxbpPGaF1KkosHTy8wX9riKeTiAIKIhBjg4O8kbbNXWcxi2
         Ach/ot+36wekVcvKGBq1yQv4dv7JW1ZE11EKmaUJL4Ggavt08lFhTj1EQX3NOKiprMQ5
         WI+c3re36TJH1EjYc6v/OW4+vQElMIt4TZfxMRLRSY/INJCDJIrgCONP7Ahj5lE+GEWc
         jS6Cm4sOOwqqdK2feCKHwYQ8UHyUis+fvZe2nIHjVrDAF+/mZsq4lT7pQ5y1DG6axgkI
         MqgQ==
X-Gm-Message-State: AOJu0YwUM1w9eqJ6m4wBhYypco7ZRXZb5RAV/uB1dRPY5lOI6SxPGzIr
	UzmmLm0N7a6LTFcoYdoqyDU2mxQ+c6Us9xQ0MXdsb4aYWyacST+5/kJwPE9jlGg1k5C0Fznu5nY
	j0dML
X-Gm-Gg: ATEYQzwF5Lfi4U9yaI9JJcP3XggdtBbDZraaaa3HuR1/dIQ3qVx/XftVfP+kdoUmgm3
	rfHoiy3ci/lo9BFulpQyN1qPn0iPlpqcsmMTCxMkppGOkXnO5Xt+ttyNzjRnrBR4Nrgx3RpAPfe
	0SiwH1Lm7iu7lOLYjVjzCyeRq1DC0kN1RHpqs1AjPKdOjC6WX73F7nA/bRCUxRQjBCkj3d/qw+/
	5w0LHaGoDdiGu98K1PBQolwrQG8WZ56J3uKVLe1QEAkfA7eJWvsARqAb8IYH1RyCgwyAfovX58g
	7oVjBpUjKSqx7Wc1NZD30pJw8IYqg4rAcftjvx/0abYo/Pd3uf2QrsbpdstDK0xNLq6Q9KsnYHm
	N6ovHWWnl6Usx0U6WkG7BDSB6VcghfhFTtyC5D3iF4/kphb0H7vpkg8VLwvNP0G8JJ8VnXKUh5F
	Sm6JH4iexBZukXm02/SKpNTGoZi0VUXByqsPkaW9or+P8dCAlw/cfbPGIJnU4xy+FyjPS6cmTr7
	aHlKxImPUqAVk82oPPpHGATTfn32I3iwQ==
X-Received: by 2002:a05:600c:8b41:b0:483:c35d:3659 with SMTP id 5b1f17b1804b1-485566fd0d4mr202562395e9.18.1773653412676;
        Mon, 16 Mar 2026 02:30:12 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/17] libcomps: Fix libcomps-native build on GCC14 hosts (e.g. Fedora 41)
Date: Mon, 16 Mar 2026 10:28:35 +0100
Message-ID: <95a25cf11b69c84cc90dd9104ba0c6f96e4459a3.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233238

From: Yoann Congal <yoann.congal@smile.fr>

This version of libcomps does wrong pointer assignment, and on GCC14
hosts (e.g. Fedora 41), this fails to build with:
| build/tmp-glibc/work/x86_64-linux/libcomps-native/0.1.18-r0/git/libcomps/tests/check_parse.c:588:11: error: assignment to ‘COMPS_DocGroup *’ from incompatible pointer type ‘COMPS_DocCategory *’ [-Wincompatible-pointer-types]
|   588 |         g = (COMPS_DocCategory*)it->comps_obj;

Backport a patch making the assignment correct.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...orrect-variable-for-category-and-env.patch | 48 +++++++++++++++++++
 .../libcomps/libcomps_0.1.18.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Fix-build-use-correct-variable-for-category-and-env.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Fix-build-use-correct-variable-for-category-and-env.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Fix-build-use-correct-variable-for-category-and-env.patch
new file mode 100644
index 00000000000..6d243064452
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Fix-build-use-correct-variable-for-category-and-env.patch
@@ -0,0 +1,48 @@
+From adcf4aaca08ea712af4b4e886931fd8ed59c7bf7 Mon Sep 17 00:00:00 2001
+From: Aleš Matěj <amatej@redhat.com>
+Date: Tue, 2 Jan 2024 08:32:55 +0100
+Subject: [PATCH] Fix build: use correct variable for category and env
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+- error: assignment to ‘COMPS_DocGroup *’ from incompatible pointer type ‘COMPS_DocCategory *’
+- error: assignment to ‘COMPS_DocGroup *’ from incompatible pointer type ‘COMPS_DocEnv *’
+
+For: https://fedoraproject.org/wiki/Changes/PortingToModernC
+(https://fedoraproject.org/wiki/Toolchain/PortingToModernC)
+(https://gitlab.com/fweimer-rh/fedora-modernc-logs/-/blob/main/logs/l/libcomps.log)
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/libcomps/commit/a71bce7e62990550a57688e51b14eb82d6de196b]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ libcomps/tests/check_parse.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libcomps/tests/check_parse.c b/libcomps/tests/check_parse.c
+index e5935e1..689cb98 100644
+--- a/libcomps/tests/check_parse.c
++++ b/libcomps/tests/check_parse.c
+@@ -585,8 +585,8 @@ START_TEST(test_arch)
+     list = comps_doc_categories(doc2);
+     ck_assert(list->len == 2);
+     for (it = list->first, x=0; it != NULL; it = it->next, x++) {
+-        g = (COMPS_DocCategory*)it->comps_obj;
+-        str = (COMPS_Str*)comps_doccategory_get_id(g);
++        c = (COMPS_DocCategory*)it->comps_obj;
++        str = (COMPS_Str*)comps_doccategory_get_id(c);
+         ck_assert_msg(strcmp(str->val, cats[0][x]) == 0, "%s != %s",
+                       str->val, cats[0][x]);
+         COMPS_OBJECT_DESTROY(str);
+@@ -605,8 +605,8 @@ START_TEST(test_arch)
+     list = comps_doc_environments(doc2);
+     ck_assert(list->len == 2);
+     for (it = list->first, x=0; it != NULL; it = it->next, x++) {
+-        g = (COMPS_DocEnv*)it->comps_obj;
+-        str = (COMPS_Str*)comps_docenv_get_id(g);
++        e = (COMPS_DocEnv*)it->comps_obj;
++        str = (COMPS_Str*)comps_docenv_get_id(e);
+         ck_assert_msg(strcmp(str->val, envs[0][x]) == 0, "%s != %s",
+                       str->val, envs[0][x]);
+         COMPS_OBJECT_DESTROY(str);
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index dd0a1f8f952..db6f3179626 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0001-Fix-build-use-correct-variable-for-category-and-env.patch \
            "
 
 SRCREV = "dee4ae37f7818709802de28c4d16fa823bd83ae2"

