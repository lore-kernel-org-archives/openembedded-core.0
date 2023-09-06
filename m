Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68414EB8FC7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:52 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.7471.1694004524833577668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ozQKn0oN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-269304c135aso2535465a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004524; x=1694609324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuySdMYXD3bxekEucAQ9gqAvKWUolmqMEB7eH5A5ejs=;
        b=ozQKn0oNnu/2COFBwvnCgK6egnYDYtogCRyQdTJMS6QghKIHz+eyRAiLRWHRB5y4xQ
         22CD2VyzByCU1bU+kmAUzLOjG4Z1a7Ispj/ZVrKLw8e6KvNXN+kh5GZ669EGAYmLJCj0
         ei3/bQWHCudglPZjA4mAwHi6DSU06A4UMwr8lbssiymIlSU1Po00pXL/DO+UmNfNgf/V
         6mRXv2rZcOPiLdDnqHVPw10hx0KO7eqyqjlgPivrdxdrlNb5valPZnWa4LufxJERj+BH
         NJjbcGruHvoP5KVaOQdXhBx4fEy1AcacrO6FXTFF/+d9Jl0A4jUJlEff+6ybLH+fuN9e
         /A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004524; x=1694609324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuySdMYXD3bxekEucAQ9gqAvKWUolmqMEB7eH5A5ejs=;
        b=aVa8Xh7THUxlVU1HS5S3okRhgc6dWVhCjLjR8i1XwW83ccFXMbQLsvzM29JjudyOIE
         ukU5n/rItFMMHhU19atoW6ozsDxJA4xswbA+7L28GxZ4G4p0reRNWOwHnU5JKddJiCkB
         Y2RnZbnLzguW2xxaZm/9wg/58Y5spu8DUTcuqYLbOzjQDMWy+dR3lQ8nf0SBtpBJIJD/
         0C337WBdc3hR9QZxPst8eRgpfpWD/xTu4gfCOHJggkXido04Dlx0NfnpREiW2auDcwiA
         pGYdoI916aFp/oJntg873xFEpoEPf6dLrkvYzqO3+2+hOm5Ju+fsIXKH0WwGlFLwuTSl
         zxCw==
X-Gm-Message-State: AOJu0Ywszp4AFPdm6g1XZAw2iarYMaO8I0JIZ8EQTI2DSy53eSAZOfMK
	d3W70BW6UHYer04aA5P6ubU4DV2vYMlaE1OpseA=
X-Google-Smtp-Source: AGHT+IHf5BHlRjSl2zQk7hoiS9KlrmSBJMQ4gEzuqRDZ7sn/lsVLYXNRKA5uG2pYtz3jvMGfZdHAeQ==
X-Received: by 2002:a17:90a:784e:b0:268:1e51:3496 with SMTP id y14-20020a17090a784e00b002681e513496mr15267238pjl.21.1694004523947;
        Wed, 06 Sep 2023 05:48:43 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/14] libssh2: fix CVE-2020-22218
Date: Wed,  6 Sep 2023 02:48:15 -1000
Message-Id: <a0b41511766130883e93b5b8a07801a836beeb67.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187304

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


