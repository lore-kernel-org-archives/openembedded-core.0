Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2803DD24473
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 05:23:18 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.4837.1728624197310610349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 22:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NU9TR5A8;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso1319310a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 22:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1728624196; x=1729228996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EatyhJbwQth9YISicmXfO1FyRCwa2Zc4JL8XW70ASlQ=;
        b=NU9TR5A8GZkweKtDO6bl2pNO6A/wdnE7F1UztPtZYXlXVC/ExYgwyoWjZ1oewMnWS7
         GhfUTCofGExbxNDcKN6NLi4LH7Wi4q6mT51nlxovtvaFfEvez13T+sXGVyFh/PAQMfgR
         k+rFjBFp5HPywUh/yHi/0SKZgICpOiPmSXF8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728624196; x=1729228996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EatyhJbwQth9YISicmXfO1FyRCwa2Zc4JL8XW70ASlQ=;
        b=afYOg33OvDMS3YWC6KWJ4pXzCtidZB/9pYFpfFj5M+nkEeptX1ivud4i4KLDFT8pwQ
         lw/xGlmknX7RLtBmRkQjEbqx6hrCi9QJUBiCt387SHw8ERz8tG/lkoQkzfvAOLL2Yr0m
         j6Q2ZUGfHvA/mnQ1Se+xr4Yv0mlfU3nSEvDIO82Q+QeEUBgWcXKBTaAm1ADGnn7qvWjA
         3kglQlkaRBJ/bYf1pWVzGixbwdotQ4OLOT5pyNYTaa23QjCduK/tE4jUCZqYHe3XgpnH
         xxTFf00YV1RSGpwGsgQlHWEc2gCtcFcNYQt3hgHaI1oYDCmsApC5nwTM80piIovP5Owi
         KcZg==
X-Gm-Message-State: AOJu0YxV1boGPJyeRekPHpnTTA79w0W4QVLsQQeOIgEMnli5kjM0rOZE
	hK9hJIieJ2DTdVpOZM2HlqrU7cqAj5eNUIMAMzCQ0321NPhtEwzhiWNgYpKwKoIMra4dznBwBX3
	v
X-Google-Smtp-Source: AGHT+IGeKypSMua1ZYtdfDhr2wWKQNL/jrccKmF/+wspWQiwB5WMvPpaK8I3+ECaW0mQ5K+LOW+O+Q==
X-Received: by 2002:a05:6a21:9d91:b0:1d6:e635:5c5e with SMTP id adf61e73a8af0-1d8bcf06e02mr2358859637.9.1728624196298;
        Thu, 10 Oct 2024 22:23:16 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9e95d8sm1910236b3a.42.2024.10.10.22.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 22:23:15 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libarchive: fix CVE-2024-48957 & CVE-2024-48958
Date: Fri, 11 Oct 2024 10:53:08 +0530
Message-Id: <20241011052308.69072-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205655

Backport fixes for:

* CVE-2024-48957 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b
* CVE-2024-48958 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libarchive/CVE-2024-48957.patch           | 36 +++++++++++++++++
 .../libarchive/CVE-2024-48958.patch           | 40 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  5 ++-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
new file mode 100644
index 0000000000..98877cf72c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
@@ -0,0 +1,36 @@
+From 3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:53:19 +0900
+Subject: [PATCH] fix: OOB in rar audio filter (#2149)
+
+This patch ensures that `src` won't move ahead of `dst`, so `src` will
+not OOB. Similar situation like in a1cb648.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b]
+CVE: CVE-2024-48957
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 79669a8..95a91dc 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3714,6 +3714,13 @@ execute_filter_audio(struct rar_filter *filter, struct rar_virtual_machine *vm)
+     memset(&state, 0, sizeof(state));
+     for (j = i; j < length; j += numchannels)
+     {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
++
+       int8_t delta = (int8_t)*src++;
+       uint8_t predbyte, byte;
+       int prederror;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
new file mode 100644
index 0000000000..de266e9d95
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
@@ -0,0 +1,40 @@
+From a1cb648d52f5b6d3f31184d9b6a7cbca628459b7 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:50:22 +0900
+Subject: [PATCH] fix: OOB in rar delta filter (#2148)
+
+Ensure that `src` won't move ahead of `dst`, so `src` will not OOB.
+Since `dst` won't move in this function, and we are only increasing `src`
+position, this check should be enough. It should be safe to early return
+because this function does not allocate resources.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7]
+CVE: CVE-2024-48958
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_rar.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 95a91dc..4fc6626 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3612,7 +3612,15 @@ execute_filter_delta(struct rar_filter *filter, struct rar_virtual_machine *vm)
+   {
+     uint8_t lastbyte = 0;
+     for (idx = i; idx < length; idx += numchannels)
++    {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
+       lastbyte = dst[idx] = lastbyte - *src++;
++    }
+   }
+ 
+   filter->filteredblockaddress = length;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index da85764116..6e406611f9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -30,7 +30,10 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
-SRC_URI += "file://configurehack.patch"
+SRC_URI += "file://configurehack.patch \
+            file://CVE-2024-48957.patch \
+            file://CVE-2024-48958.patch \
+	"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
-- 
2.25.1


