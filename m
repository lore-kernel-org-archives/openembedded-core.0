Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631FFC25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 22:20:47 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.10184.1660515641285300432
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H6M2aYNh;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id k14so5383786pfh.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=7x2xT+WGWMVRrbUlb+Ur5A/wXjhGK4il64ZrTSPSMr4=;
        b=H6M2aYNhXZLYEtAU+W8R/J+Ekl6a/o6ocWubC78lEiTfR0deZKJTzy9UzNUvn+mt89
         u37sEJaSSCdvaXTZkTCFvKUvIluFPoflhTWYffwgp1M0L2NVDwUjPCIFLznf2LfqSLJw
         cm9AHNtfEcHf1Tv9N6YMJAQtpga97REShUxjkliIHm7pND+SR5jjeHCW1vkpM5+yKghw
         yfApEXTOJ9qupsSyaL20LtuToNA/RWwXMYM9iYbUu0/ncGGdUMpFeoTqU1c4ca5U0WG8
         lDYsbXjabRakS94KnCNpmHnnTQBY+il4TSWXOYapUm3xdtlwR+b3FFkTlN5mM2TDN8WF
         ohfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=7x2xT+WGWMVRrbUlb+Ur5A/wXjhGK4il64ZrTSPSMr4=;
        b=ZgjKBGljCgKUOLZ8eWlHBI+2W73s7CuxFA8Ak3Xu8GYH8923pH3N8yZxArs0RHBYeU
         8Yn4OT45TWXKQCTdKvAVQnPIVJX5YYshxQjdkq0gepHWOSAyiX8soyEz+30YhQBCfjuR
         EdvHWRrYe8JkERQaVSbEWgJyYiaC6irfoKnOs6IjMs+qeOyJ/VFCX8gGbDYLo51S9xgV
         lXcaIPu28G2DImbPIi5lfrELbM1X35QnGSlrhZ1SOCZUZOT61R0S5IAwST2uScN2Sx1j
         JQOa+TIlhkQfq7FKdG2pdXRaRrrb0A7a1becCjHKq1RGUPQcxarsiGdr6Wi5O0nOlC2+
         9ZqQ==
X-Gm-Message-State: ACgBeo1H9qHOgsQ5BY8s8PpWsXe1dbX5EyiAjK0HCHi8EzmmbhCF5r9j
	vXPCh9xAwX4v+gfYTWxT3FjFCEzdfHV/rQ==
X-Google-Smtp-Source: 
 AA6agR7iEEwchxpOYrkdyRuLPS489oHNcC9O73OzfXyg+CEPoUxMR5Su1/3Dv4lKlRA2zeQdy0RVOg==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:630e with SMTP id
 b12-20020a056a00114c00b005282c7a630emr13510147pfm.86.1660515640238;
        Sun, 14 Aug 2022 15:20:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a170902d58f00b0016d8b0dfd61sm5819502plh.178.2022.08.14.15.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 15:20:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 01/10] json-c: Fix function prototypes
Date: Sun, 14 Aug 2022 15:20:28 -0700
Message-Id: <20220814222037.283943-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 22:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169328

This is flagged with clang 15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../json-c/0001-Fix-build-with-clang-15.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.16.bb   |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
new file mode 100644
index 00000000000..215f4d829a2
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
@@ -0,0 +1,34 @@
+From 0145b575ac1fe6a77e00d639864f26fc91ceb12f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Aug 2022 20:37:03 -0700
+Subject: [PATCH] Fix build with clang-15+
+
+Fixes
+json_util.c:63:35: error: a function declaration without a prototype is deprecated in all versions of C [-We
+rror,-Wstrict-prototypes]
+const char *json_util_get_last_err()
+                                  ^
+                                   void
+
+Upstream-Status: Backport [https://github.com/json-c/json-c/pull/783]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ json_util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json_util.c b/json_util.c
+index 952770a..83d9c68 100644
+--- a/json_util.c
++++ b/json_util.c
+@@ -60,7 +60,7 @@ static int _json_object_to_fd(int fd, struct json_object *obj, int flags, const
+ 
+ static char _last_err[256] = "";
+ 
+-const char *json_util_get_last_err()
++const char *json_util_get_last_err(void)
+ {
+ 	if (_last_err[0] == '\0')
+ 		return NULL;
+-- 
+2.37.2
+
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-devtools/json-c/json-c_0.16.bb
index 50431081bba..3aba41dfcf6 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = " \
     https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+    file://0001-Fix-build-with-clang-15.patch \
     file://run-ptest \
 "
-
 SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
-- 
2.37.2


