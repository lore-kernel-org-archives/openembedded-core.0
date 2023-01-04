Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8E0C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:31:03 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.14930.1672846256829828403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KcXLmd0D;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id i15so49119005edf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlyPfoJ0ebnOPSbUNcliL7nknwfJSNyycZO62R1m1u0=;
        b=KcXLmd0DPrdsuo78ljsqWWWhZjPuJmQlzOV2lBtLh3bP5QXVX1JHNhxdSMRU/YN10z
         4nQgL/NPQ7vusT+SYXxZQi8UIa82X9Nl07TlJ+Zt0q9cn2OZhuTDJpvV3VE2edLt3/S7
         hRyNC9Da7JSNfqQ3ywvtTdWX3wvghYfQptfUMaXss0UvQCPx9rCPYM5gUQiQt1dkdIfm
         /nKipU3zxT7VdU0IQziaku816E6R2a8KyDnxe+tqjxDuEyDaR5MV0L7SjBE8IuoTeV7J
         M4joX+qV9fI14PFQ6pExKlSPjTuUWsw2FkGlVFpXEMfoqUGOJ9BWDxqfCfsRCLAnZRd7
         2AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlyPfoJ0ebnOPSbUNcliL7nknwfJSNyycZO62R1m1u0=;
        b=vs/Fv7gsyMb77VM5Ny645H0tFwpKGMWRnwVRjgRP4farEK74wma+fc3HbrfiVkkgCp
         0P4v0Zci3SNqJfKBEczF+Z4dLy4WW20bRG2bDRtZSVoc6/bOgOw0eBeo9JjVhQNUDvI2
         3O+PfLxqMlJluDUv8URyPrS7tkNomxAx9AFJCzkT53vihqecdGKSU1G54ID/42etN5X8
         spp9nLqIN0kP5/kaV5vfTG4PVdTyzfYvDe5M7JdLV5UPlaHo6IECZv9yg3YmNa+UNeRq
         3oELMRBoZUMyIzqOyTu/TmnSa9gDrsY9d2TbWiLqBUr1cxniL/X1tNLx8aRAvpActMbq
         1kxA==
X-Gm-Message-State: AFqh2kr0Ol/Vz8/L136Xw3L52qr0J4ah9y8B0Whi9t2S9Y4ORTGfdEZs
	AzdO5Gz2h/LPuSHp2wuhkqnU8XYFg/M=
X-Google-Smtp-Source: AMrXdXvRahjYXNO6Ja+Fka2Gek2Kv5QJ2NwdrJ7y5Of4vODJ26OV7MknPT2Qx4BKp8yRw+KBDRhI7w==
X-Received: by 2002:a50:fe94:0:b0:48e:a9a1:c584 with SMTP id d20-20020a50fe94000000b0048ea9a1c584mr6449260edt.35.1672846255018;
        Wed, 04 Jan 2023 07:30:55 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g11-20020a056402180b00b0046bb7503d9asm14879219edy.24.2023.01.04.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:30:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][kirkstone] systemd: backport another change from v252 to fix build with CVE-2022-45873.patch
Date: Wed,  4 Jan 2023 16:30:47 +0100
Message-Id: <20230104153047.773088-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175488

* CVE-2022-45873.patch was backported from systemd/main, but it doesn't
  build without another change from v252 when elfutils PACKAGECONFIG is
  enabled.

* fixes:
  | ../git/src/shared/elf-util.c: In function 'parse_elf_object':
  | ../git/src/shared/elf-util.c:792:27: error: void value not ignored as it ought to be
  |   792 |                         r = json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
  |       |                           ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.39.0


