Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4BDC25B0F
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 02:49:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.12275.1660531794718131218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WO0bIWaA;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id 13so5333213plo.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=UtJSwq0idVXYviYPawf1agK+eOzmZNGO/GGiGgQectA=;
        b=WO0bIWaA7nFossV4qWO4aa7e/rkut/BQQI8DUlHojRZpUNbqo2FnY2ET0u95XZRdx9
         ID274dlR3QeAk/Its3Fe0PMAcayaeYt9TOm/7TvHYJ5MvScLmsGtZ/QrxwvXDRsyPZz5
         lLu4vsLU4K4PctMtzEIC05XC+fqcKoVVnAPy1pxbxjKeFwJk7mqAZptkQWvWyjXDawHC
         NJrfxS1eiL9aa/rJU9aYE2IoJKekSP2EZ0LM4VeHGA42k9/trmqvolbIUTEfZcDANI34
         IUkJGHYQ9uZqEgraUGVy3atyVcu6bU6dRDWs3PhvBh3+azQmhfQYv+gJey2jlg4JB7Kf
         mRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=UtJSwq0idVXYviYPawf1agK+eOzmZNGO/GGiGgQectA=;
        b=sTmiESaqf58670TQzlfBpCRNfQrC8wohoFXy7dEhFF0B1/65Mt0Hr8GIDmU/oiAcE4
         RydQaejVpgk22vgKpa0fd5bYAJLVtDNVhUZKwNq+LtxfWxfkSTe1jkb5IDbPYKuD8M/Y
         aCkyeVTYy+NrbDmE/IwqkOsCYlzhYUVqHiWyyRgM6QxbbqHcKSjYzjRPy6hNud1aRcaB
         AEhaMVo2Sv3I+P4/ieJezhDoTxVudPcEgVfkaqDvzraf5aAIbz3RbpfOg8/Cqw49XF+Y
         PHDYbWIhvgheabGfbgR1MBeLdmHfp/jxbLt0I7BonLbWsu5J45M152qjP0NJJ5VajMIx
         vXug==
X-Gm-Message-State: ACgBeo2WG2XLVaFNRuiTmGtD01xwncdgrD8tX3xlS2777f37wrmBEfik
	Z4/8hgmPbzhyCo1UR+Wla1r4EKG9Ll6QfA==
X-Google-Smtp-Source: 
 AA6agR6cszRYGFO8rGQuagkcLZiK0o/AALeCjDa1J3NU9xJcXX72es0KYOoXBHEOTDdoHbvmr0MCFA==
X-Received: by 2002:a17:902:988b:b0:16e:cdf5:aaea with SMTP id
 s11-20020a170902988b00b0016ecdf5aaeamr14627822plp.137.1660531793606;
        Sun, 14 Aug 2022 19:49:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b67-20020a62cf46000000b0052e0bc3ca3asm5895816pfg.173.2022.08.14.19.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 19:49:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Paul Eggleton <bluelightning@bluelightning.org>
Subject: [PATCH v2] zlib: Resolve CVE-2022-37434
Date: Sun, 14 Aug 2022 19:49:50 -0700
Message-Id: <20220815024950.1930245-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 02:49:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169348

Backport needed fixes

CVE: CVE-2022-37434

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <bluelightning@bluelightning.org>
---
v2: Patches are needed and backported thusly

 ...etting-a-gzip-header-extra-field-wit.patch | 38 +++++++++++++++++++
 ...processing-bug-that-dereferences-NUL.patch | 36 ++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.12.bb         |  2 +
 3 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
 create mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch

diff --git a/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch b/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
new file mode 100644
index 00000000000..96ab563121c
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
@@ -0,0 +1,38 @@
+From eff308af425b67093bab25f80f1ae950166bece1 Mon Sep 17 00:00:00 2001
+From: Mark Adler <fork@madler.net>
+Date: Sat, 30 Jul 2022 15:51:11 -0700
+Subject: [PATCH] Fix a bug when getting a gzip header extra field with inflate().
+
+If the extra field was larger than the space the user provided with
+inflateGetHeader(), and if multiple calls of inflate() delivered
+the extra header data, then there could be a buffer overflow of the
+provided space. This commit assures that provided space is not
+exceeded.
+
+CVE: CVE-2022-37434
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166be]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index 7be8c63..7a72897 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -763,9 +763,10 @@ int flush;
+                 copy = state->length;
+                 if (copy > have) copy = have;
+                 if (copy) {
++                    len = state->head->extra_len - state->length;
+                     if (state->head != Z_NULL &&
+-                        state->head->extra != Z_NULL) {
+-                        len = state->head->extra_len - state->length;
++                        state->head->extra != Z_NULL &&
++                        len < state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
+-- 
+2.37.2
+
diff --git a/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch b/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch
new file mode 100644
index 00000000000..a0978c5f953
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch
@@ -0,0 +1,36 @@
+From 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d Mon Sep 17 00:00:00 2001
+From: Mark Adler <fork@madler.net>
+Date: Mon, 8 Aug 2022 10:50:09 -0700
+Subject: [PATCH] Fix extra field processing bug that dereferences NULL
+ state->head.
+
+The recent commit to fix a gzip header extra field processing bug
+introduced the new bug fixed here.
+
+CVE: CVE-2022-37434
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ inflate.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index 7a72897..2a3c4fe 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -763,10 +763,10 @@ int flush;
+                 copy = state->length;
+                 if (copy > have) copy = have;
+                 if (copy) {
+-                    len = state->head->extra_len - state->length;
+                     if (state->head != Z_NULL &&
+                         state->head->extra != Z_NULL &&
+-                        len < state->head->extra_max) {
++                        (len = state->head->extra_len - state->length) <
++                            state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
+-- 
+2.37.2
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zlib/zlib_1.2.12.bb
index 77e7a4937fa..b999f13530e 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -12,6 +12,8 @@ SRC_URI = "https://zlib.net/${BP}.tar.xz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
            file://0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch \
+           file://0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch \
+           file://0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.37.2


