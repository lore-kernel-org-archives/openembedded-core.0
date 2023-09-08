Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949A4EE7FF8
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:17 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.39460.1694180832360629657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mEcM3Sb4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so1801811b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180831; x=1694785631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuySdMYXD3bxekEucAQ9gqAvKWUolmqMEB7eH5A5ejs=;
        b=mEcM3Sb4M8iQgO1FGYCU76YaRBC+WvUmgUDYvYiZsCbM5Iwe7FLaQWEmjwDL0yRF8N
         XD47ajir7DH/xTyNlrhLUPGVU24su1PhtUiHzRmvoHgLxew0AyzWBQt5aOHB8EZXEgkz
         Gc7lb41tVLzCRrdUWCdCq/olf6COawNpBPzXWAqP822O69dDCisDuo4xEBOC90QBo5I/
         6gwVWYKVZWneARE1r50dx1+Axp/7QGNIvuVfJtqIeACcQWereXvU++9vZwuykPBW4REj
         ASWzb/fbThsIgvI5vYsJXTVOsnuy+wZoCrMrfX9bgKG0upULcNE48roHn7UKFDpbJI7m
         ZahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180831; x=1694785631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuySdMYXD3bxekEucAQ9gqAvKWUolmqMEB7eH5A5ejs=;
        b=o/ExaynjeZgcrZu/tSmbZe9ilMPOJ1UjSlVjkfxXCSa03aYOEnKWUrTQIbV+8/kEZs
         gkqTDQtHtvekjd2wUXRGkpnwwCvZJo7tVbC/2ogRx3IKJZtCe1D4S/DApcY4O49VzFSL
         bHIvkuSalfY9a9giO4rOl1MfZK87r+shqrVvhvI60J40jD8AZHnpf+ukPJctbFhl44DP
         TjZ3cOylaRe2DiCILHl/Vp/YJWShkbr/75BWgSShnPbrlgevTgHVtYA4SxMvlvdsStiQ
         hPKZwaWvQSes2y3Pqd9tiu80a/+GDNVnDOCvm5vgJMZdsJ0BWVBNmFKvnahawM5f8PC+
         vLqw==
X-Gm-Message-State: AOJu0YxeEZS4/jXaDHeItsV6m0h/OsZeHeogK1P25P86BXTSjtVM5HT9
	dZ9xGtT36w2VIst9xyFJ/oWgl8qj84mH4cjyLMo=
X-Google-Smtp-Source: AGHT+IHWERRW3CJNkaz3q8CbRaKY404sAl1+q9O74lXv931/ZmaETQRKj3VRAn/1084FcuMw2vrxeA==
X-Received: by 2002:a05:6a00:24cf:b0:68a:4568:29a with SMTP id d15-20020a056a0024cf00b0068a4568029amr2537444pfv.29.1694180831406;
        Fri, 08 Sep 2023 06:47:11 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 1/9] libssh2: fix CVE-2020-22218
Date: Fri,  8 Sep 2023 03:46:52 -1000
Message-Id: <ff2288cd466c46c4e2cac24498b260037dba5071.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187423

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libssh2/libssh2/CVE-2020-22218.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.10.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch b/meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch
new file mode 100644
index 0000000000..066233fcae
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch
@@ -0,0 +1,34 @@
+CVE:  CVE-2020-22218
+Upstream-Status: Backport [ https://github.com/libssh2/libssh2/commit/642eec48ff3adfdb7a9e562b6d7fc865d1733f45 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 642eec48ff3adfdb7a9e562b6d7fc865d1733f45 Mon Sep 17 00:00:00 2001
+From: lutianxiong <lutianxiong@huawei.com>
+Date: Fri, 29 May 2020 01:25:40 +0800
+Subject: [PATCH] transport.c: fix use-of-uninitialized-value (#476)
+
+file:transport.c
+
+notes:
+return error if malloc(0)
+
+credit:
+lutianxiong
+---
+ src/transport.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index 96fca6b8cc..adf96c2437 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -472,7 +472,7 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session)
+             /* Get a packet handle put data into. We get one to
+                hold all data, including padding and MAC. */
+             p->payload = LIBSSH2_ALLOC(session, total_num);
+-            if(!p->payload) {
++            if(total_num == 0 || !p->payload) {
+                 return LIBSSH2_ERROR_ALLOC;
+             }
+             p->total_num = total_num;
diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
index d5513373b0..8483a292c2 100644
--- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://fix-ssh2-test.patch \
            file://run-ptest \
+           file://CVE-2020-22218.patch \
            "
 
 SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
-- 
2.34.1


