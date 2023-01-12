Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E87C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.45236.1673490806146226232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rzzM/+LS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id jn22so18769138plb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZi47jHK2O4SnJpGFWocns5R/B9IhyPRx7dDn1oBYFg=;
        b=rzzM/+LSSnujS4AuRtr34jiNDzSx1sdXnTe/MZGyQ80Pgc+DLeQ40n1CDxAanuXRO3
         jXYLZxkwTNekw0jMMJLXIQYMkVY/zpZfUppEBK3qHMmMg538+pDTS5JTW85pWPN+5jBM
         glvRmv/7X9xtnsjcI8PeD1rLhgoKVJ2xko42sWzwSqA0izDlbgeoL91MVZZ561CgxylQ
         T4T5L+QfmEtg/gS/m+/k3CcEgejHYV1SQhdZpFWHxOV7pyir548V+a9y0J6O2pYcxiIY
         XE/uYYaW03HcsVidsCBuH+ZJIVkd487doNCkgzfaznay033oSXiXJEvjjP3ezaoctcVw
         KxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZi47jHK2O4SnJpGFWocns5R/B9IhyPRx7dDn1oBYFg=;
        b=SqceSbfGm3GanSxrt+3ZilNpRlmeh190BoyAbpQyIgyc9ca2fpAQ3damNLLrm+GyDM
         QLJMYcjtRt5Nxf13aJTRQ0SUSpFfXMC3KGM/smMZsA/Zr/bMgw33KoAJVF1i7StXxH5D
         FsjZbBR1RsSiHgi8rTyeIuDWauYF+p0Xvhf5dpvJzsIvfJu/FV9Xg9h54IHs5jcVs13r
         /5NW1VHUAVyC8A3Pgr9Kv2BwTtdlqh+fMtZZN8dGg+MN7z7NiZIeRIwO/DX1GBGyHhtO
         K4u2KAnrRqTROnP1kk3xQpXflOizYtwVrWXUcoew47OjWnhZcJ1JJXGc/eP8nnah8GpY
         VSDQ==
X-Gm-Message-State: AFqh2kp4HGfckQkGIFGK+RaiYQ7GnSEdefOagMZamrOREhw6wqZGlZDA
	QVBAomYIhVuqcT4gd+x0nwTI8x860mQkECvr78g=
X-Google-Smtp-Source: AMrXdXspI1/WAFyZCbp/PqYPnh4+pmYjQn08z7yzwaniebbawxqrXZJJ2JCvu16df5Wn2bPlasMFlg==
X-Received: by 2002:a17:902:e951:b0:193:2ed4:561a with SMTP id b17-20020a170902e95100b001932ed4561amr14224451pll.38.1673490805096;
        Wed, 11 Jan 2023 18:33:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/11] systemd: backport another change from v252 to fix build with CVE-2022-45873.patch
Date: Wed, 11 Jan 2023 16:33:03 -1000
Message-Id: <cc1f2993c274c16fa56dd020b18e526afdd9daf4.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175775

From: Martin Jansa <martin.jansa@gmail.com>

* CVE-2022-45873.patch was backported from systemd/main, but it doesn't
  build without another change from v252 when elfutils PACKAGECONFIG is
  enabled.

* fixes:
  | ../git/src/shared/elf-util.c: In function 'parse_elf_object':
  | ../git/src/shared/elf-util.c:792:27: error: void value not ignored as it ought to be
  |   792 |                         r = json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
  |       |                           ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...w-json_variant_dump-to-return-an-err.patch | 60 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch b/meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
new file mode 100644
index 0000000000..b23b735507
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
@@ -0,0 +1,60 @@
+From 25492154b42f68a48752a7f61eaf1fb61e454e52 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 18 Oct 2022 18:09:06 +0200
+Subject: [PATCH] shared/json: allow json_variant_dump() to return an error
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/7922ead507e0d83e4ec72a8cbd2b67194766e58c]
+
+Needed to fix CVE-2022-45873.patch backported from systemd/main,
+otherwise it fails to build with:
+
+| ../git/src/shared/elf-util.c: In function 'parse_elf_object':
+| ../git/src/shared/elf-util.c:792:27: error: void value not ignored as it ought to be
+|   792 |                         r = json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
+|       |                           ^
+
+Signed-off-by: Martin Jansa <martin2.jansa@lgepartner.com>
+---
+ src/shared/json.c | 7 ++++---
+ src/shared/json.h | 2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/shared/json.c b/src/shared/json.c
+index dff95eda26..81c05efe22 100644
+--- a/src/shared/json.c
++++ b/src/shared/json.c
+@@ -1792,9 +1792,9 @@ int json_variant_format(JsonVariant *v, JsonFormatFlags flags, char **ret) {
+         return (int) sz - 1;
+ }
+ 
+-void json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix) {
++int json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix) {
+         if (!v)
+-                return;
++                return 0;
+ 
+         if (!f)
+                 f = stdout;
+@@ -1820,7 +1820,8 @@ void json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const cha
+                 fputc('\n', f); /* In case of SSE add a second newline */
+ 
+         if (flags & JSON_FORMAT_FLUSH)
+-                fflush(f);
++                return fflush_and_check(f);
++        return 0;
+ }
+ 
+ int json_variant_filter(JsonVariant **v, char **to_remove) {
+diff --git a/src/shared/json.h b/src/shared/json.h
+index 8760354b66..c712700763 100644
+--- a/src/shared/json.h
++++ b/src/shared/json.h
+@@ -187,7 +187,7 @@ typedef enum JsonFormatFlags {
+ } JsonFormatFlags;
+ 
+ int json_variant_format(JsonVariant *v, JsonFormatFlags flags, char **ret);
+-void json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix);
++int json_variant_dump(JsonVariant *v, JsonFormatFlags flags, FILE *f, const char *prefix);
+ 
+ int json_variant_filter(JsonVariant **v, char **to_remove);
+ 
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index acca49c3cb..7df7bca4cc 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            file://CVE-2022-3821.patch \
            file://CVE-2022-45873.patch \
+           file://0001-shared-json-allow-json_variant_dump-to-return-an-err.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


