Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFF5C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 09:05:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.26728.1660727113789070276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 02:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=L3VOnmZj;
 spf=pass (domain: mvista.com, ip: 209.85.210.173,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id a22so10968971pfg.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=CaFTfXhsTnExbvWubvQTLQu+MuxbTgi7sygh2pQaKtc=;
        b=L3VOnmZjHx9b4ztwQoLGI++3wIv3wOZKZCAM3QoiQcp0UKWVpdmZg/N/qfvILlsI2L
         EqamH63MlyoCQ7UdMnCXfg/zw55UDl3N8P/bOhaaN9K4FuZeKzVtz7sY5AGPl7yWkPpi
         HFcb4F3atCJ3z4TkYkq0SjI6t0B6G3Ut/E9po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=CaFTfXhsTnExbvWubvQTLQu+MuxbTgi7sygh2pQaKtc=;
        b=kyoBf3KVopFsAgKNxOReaROdKp0A/Q5O/U9F/JzeXn8COP6kDBg2y2KTUPvumLjMsd
         RSXNRLc3SFXZoeUcfd6Zf4Jj1OdV+CaUFm1P3wjV4K8wINpDzWmgU73jDmHRKZjCQsZq
         4N0RB8rW4eCqwRteeZaZchQ+eyFCd+SUstDy/211rBIWwNKPh0njjJeSnk0Mb+GCqBcr
         l8VQN1uKo34Zkdd1khoneUmFXuKyMzos46wrwOMfuM85KgGBM1YvmE5tEIMYf2NHgJ5q
         3Z60YFAJG9AssAwizDqOJ31FsdNZuFP+JLEOJut7mjDt/8WBnPgetEV8s+UV+paCnZ2Y
         8z8g==
X-Gm-Message-State: ACgBeo0yhWARs9D1MA3Iif4ZXQeKceBix8dnUbJSjZIeB2+xsDpV/iUy
	ez51x8Kaab9L75LOd5lFxQn1RW2KJ4rGWw==
X-Google-Smtp-Source: 
 AA6agR4LNiVgqKAjS6XlMfAppO8q0yzY/S+WrvGqFdoeA+7kUahk+udFwMrURRrGB7Svwvd0VvQ2KQ==
X-Received: by 2002:a05:6a00:1813:b0:52d:cccf:e443 with SMTP id
 y19-20020a056a00181300b0052dcccfe443mr24774211pfa.81.1660727113010;
        Wed, 17 Aug 2022 02:05:13 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.165])
        by smtp.gmail.com with ESMTPSA id
 b16-20020a17090a011000b001f260b1954bsm1019369pjb.13.2022.08.17.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 02:05:12 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 14:35:07 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] zlib: CVE-2022-37434 a heap-based buffer over-read
Date: Wed, 17 Aug 2022 14:35:05 +0530
Message-Id: <20220817090505.2004881-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 09:05:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169474

Source: https://github.com/madler/zlib
MR: 120531
Type: Security Fix
Disposition: Backport from https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
ChangeID: 364c17d74213c64fe40b9b37ee78aa172ff93acf
Description:
          CVE-2022-37434 zlib: a heap-based buffer over-read or buffer overflow in inflate in inflate.c via a large gzip header extra field.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../zlib/zlib/CVE-2022-37434.patch            | 44 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
new file mode 100644
index 0000000000..d29e6e0f1f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
@@ -0,0 +1,44 @@
+From 8617d83d6939754ae3a04fc2d22daa18eeea2a43 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 17 Aug 2022 10:15:57 +0530
+Subject: [PATCH] CVE-2022-37434
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d]
+CVE: CVE-2022-37434
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Fix a bug when getting a gzip header extra field with inflate().
+
+If the extra field was larger than the space the user provided with
+inflateGetHeader(), and if multiple calls of inflate() delivered
+the extra header data, then there could be a buffer overflow of the
+provided space. This commit assures that provided space is not
+exceeded.
+
+ Fix extra field processing bug that dereferences NULL state->head.
+
+The recent commit to fix a gzip header extra field processing bug
+introduced the new bug fixed here.
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index ac333e8..cd01857 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -759,8 +759,9 @@ int flush;
+                 if (copy > have) copy = have;
+                 if (copy) {
+                     if (state->head != Z_NULL &&
+-                        state->head->extra != Z_NULL) {
+-                        len = state->head->extra_len - state->length;
++                        state->head->extra != Z_NULL &&
++                        (len = state->head->extra_len - state->length) <
++                            state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index bc42cd64e9..e2fbc12bd8 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://ldflags-tests.patch \
            file://CVE-2018-25032.patch \
            file://run-ptest \
+	    file://CVE-2022-37434.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.25.1


