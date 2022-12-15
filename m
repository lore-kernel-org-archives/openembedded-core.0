Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18576C3DA7A
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:14 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.143548.1671132064789602923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PNfz1LKY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id n4so24557plp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYHOS5ZZQSYfg1eKw4DU6lBQwMLhJysXt/a/Ue5mJYU=;
        b=PNfz1LKYVszQGPOZswSOW/v/x7Z3CIq9bmp9a5EOImDQMw6hybj8B2EjZ/yefsZnsM
         4OaDTIUhvxsBJTaC657wwiekWl6VUVwMnNzIA+AyayvmrLzAuseip/pmm5KjJ54TupAs
         CvFB9gnXAqeF4+lBJCL6Ju8CmlCnLLUE0ztX8Z3EzlIr5h1kPNwzBgpL3EJ4Qf+0jpQM
         NPlbirM1KdRcIyF6ionLVP18oUUcVybTVh+LoXgdFhqrzLhOBfYEEEiRcf4pMwYqImd2
         47PsAT2LW8AGxV3ipPWD4hEMI0QojBKa7rLRvLig4bCfTxoVThiLVkEYdGEzPpRsbwsa
         flkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYHOS5ZZQSYfg1eKw4DU6lBQwMLhJysXt/a/Ue5mJYU=;
        b=58R+StPAhLitf703YDOmgbLrAsiE3yHX00bbrJwEFIAch6FOtfS4bE+pr3Du003UlF
         CgpyU8CZ072/voG8ki1GnPiCKS2ftt7TJEGA0/LjxuSHHydshoky6f8S+Ezlco3O0gY6
         SpzY7fV2Yhr2kGvrXTeRLWt8gpuDvYY5wy6lEFsfZlMKccrX6lE2buymq/mPgEMgQbih
         0cyvAZ1VUHYNHurIZhBFYre0K/eyAfHC5kukdkXWigERlJfQOUV6CcT7AZ/tokzuft5d
         X1IaQcDv5Vd1VQJODl0Pi+nmUMO5t46cn0r08TWdRvgLWN1/Ef1ewmflj4fBvMdz1cOO
         t7pA==
X-Gm-Message-State: ANoB5pmYX1UC90IxokXdogDFvH5RfTHMjzip2evP1e16prLeM8E7tlcY
	yEUGjTcV0F65VJU5TSRH7kF0SMKgxycHuWKfseM=
X-Google-Smtp-Source: AA0mqf6hrc2JvPWRaEixvYukwXsI5ghaghk2EbhGph2hbck+0QCgbKuLEL06+JPR1lxMF2Yfgkg7xA==
X-Received: by 2002:a17:902:e80c:b0:18a:4493:5db6 with SMTP id u12-20020a170902e80c00b0018a44935db6mr43628144plg.41.1671132063848;
        Thu, 15 Dec 2022 11:21:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/30] libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
Date: Thu, 15 Dec 2022 09:20:25 -1000
Message-Id: <a6e4e67cf8f2e98cc2cc3f5c66722a35cc0dda46.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174593

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2022-36227.patch           | 42 +++++++++++++++++++
 .../libarchive/libarchive_3.6.1.bb            |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
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
index 24d7918bf9..79e13e514f 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -34,7 +34,8 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch \
-           "
+           file://CVE-2022-36227.patch \
+	   "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
-- 
2.25.1


