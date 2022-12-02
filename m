Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0877C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 09:43:40 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.71361.1669974213185394891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 01:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=c17lV11p;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id k79so4412469pfd.7
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 01:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aH90CLpr83Q6D9dQeG/Ut4F7OVMQju2H8Niue1uSUyc=;
        b=c17lV11pMMKTTVd2CwNUF/nxz8ZtsS0+Ltqid0IN26cGEne0ACmF4gZPbpui9X0z9O
         eKBrZ1UQwOSfiVEb/jtUdf3Zy7DpSmxo5H9onQaC5Ei1Vn79crLedMaltgHY5U83yhFu
         8ZDuzqbjD0EnBx7T/yPkeeKXlnIqRijud+/oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aH90CLpr83Q6D9dQeG/Ut4F7OVMQju2H8Niue1uSUyc=;
        b=vHGhDM2/8XTx5A6d8zT145tlDpa+pbUg/QDppy7PZrlq0IXk/RNELdN55YtbLc3DB+
         U4d2XEBJwYaKcGu3v5stvVzYqulZ23a0Y1xHVdMxMN7NNMcnKu4IwIyAfw7kLtI6risT
         n6OEcNIVgMWjh8/iSyqqWvaaQ9nIm3E9E87LqoauFnUC0DuxUEmm97vJA7pWIXHuzNfy
         CgTiWK/ozRUgJM7R3PNnf+rx5Jk1yPq5iueTfDoouwnK8JScb+KqgLrx7C84/4DrRevd
         9uEI6+/0CLmN4mzOJ8XhN2EyIZEw6TgjrCBKVefrLiBe68UveisiSnZCPnUV2kLIPi8m
         jAIw==
X-Gm-Message-State: ANoB5pltg5kbq/VhUhfoIa11TE6T/fe7drVKnejs2Gzm6+qzkVUYFty6
	wOPuuvJhOmcoUrAvNwOELOQARClY+fdR4EHH
X-Google-Smtp-Source: AA0mqf7YpqABonm5RwzF9BUu2mzPjjtoTPhabeJlYtJyGPheScKXVdYSaPGw0RnjUKCquIMrzQl97g==
X-Received: by 2002:a63:4d49:0:b0:46f:5bd0:492f with SMTP id n9-20020a634d49000000b0046f5bd0492fmr62079257pgl.186.1669974212440;
        Fri, 02 Dec 2022 01:43:32 -0800 (PST)
Received: from MVIN00024 ([157.32.77.104])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090341cb00b00187033cac81sm5176205ple.145.2022.12.02.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 01:43:32 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 02 Dec 2022 15:11:11 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH v2] libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
Date: Fri,  2 Dec 2022 15:11:09 +0530
Message-Id: <20221202094109.7158-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 09:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174230

Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libarchive/CVE-2022-36227.patch           | 42 +++++++++++++++++++
 .../libarchive/libarchive_3.6.1.bb            |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
new file mode 100644
index 0000000000..d0d143710c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
@@ -0,0 +1,42 @@
+From b5332ed6d59ba5113a0a2c67fd82b69fcd5cde68 Mon Sep 17 00:00:00 2001
+From: obiwac <obiwac@gmail.com>
+Date: Fri, 22 Jul 2022 22:41:10 +0200
+Subject: [PATCH] libarchive: CVE-2022-36227 Handle a `calloc` returning NULL
+ (fixes #1754)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
+CVE: CVE-2022-36227
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com
+---
+ libarchive/archive_write.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index 66592e8..27626b5 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
+ 	struct archive_write_filter *f;
+ 
+ 	f = calloc(1, sizeof(*f));
++
++	if (f == NULL)
++		return (NULL);
++
+ 	f->archive = _a;
+ 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
+ 	if (a->filter_first == NULL)
+@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
+ 	a->client_data = client_data;
+ 
+ 	client_filter = __archive_write_allocate_filter(_a);
++
++	if (client_filter == NULL)
++		return (ARCHIVE_FATAL);
++
+ 	client_filter->open = archive_write_client_open;
+ 	client_filter->write = archive_write_client_write;
+ 	client_filter->close = archive_write_client_close;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
index c795b41628..df9df5e0a6 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://CVE-2022-36227.patch \
+	   "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
-- 
2.25.1


