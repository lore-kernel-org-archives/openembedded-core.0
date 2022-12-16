Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25023C3DA78
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:15 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.14912.1671202688102784109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wSZCUrJ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id o12so2714252pjo.4
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVEQztKBd/b+f9yCeWePJp0wx+xAPsRCh8Ct0icPfPE=;
        b=wSZCUrJ/6fudiyL0Pg56WUOykQHsM0eNthOu18+Uf39mKqwQkLh9umUXjRLehpsMm1
         8Gw4+wmDBecv2xFp4FBxjvHIs3u9b+ewvDmwwUrw3YqFqy91lPu4YliUmFp3J4hTSREX
         u18eZDRMUmq5KfCO63phcwa1OcVpjqbkxVNIKFzcsR3b36SLPyycpxAGq8RFYCNn/JGK
         xouIxueH8oSHcrpFg+okAAQ3E+wL/BfFY0zF4nVP7bNZh9Qg3lFEegaCisA25xWetH11
         fc6Hn7EvWgs3pLp0SlEm5KEpYTu1tzPyk+Gx2uVqIqEGQiuLZATYDX8xe9/LmszGgMwB
         2tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVEQztKBd/b+f9yCeWePJp0wx+xAPsRCh8Ct0icPfPE=;
        b=7zAmJhc+/KdjhUvOrwqv5p0zsq2fV49njinrROGAJ5Xot6ZwHYdXhwU5Bp2N32WIuc
         rXQfkUSwBssbUF/4zQJAv/JNpI1KuYAHOM7eDvIwpiTX6Egi5FXXBy07alCwdclsNCT3
         XjkZD8aLaqghC3k4IgktSeUbvqXa+ow+lgPkwfLZB/7gqq6bn+w9oOLQmq2YlZV6OBSR
         2aUkdhUyjwmFBi4zF4NPZTymKUMwez+/W/UPtSPZQE0qEuaO6keHPkTmNiyV8qgK5i21
         ccFy7NR6XjHdo40ps23+HnWnGcgT47fGZYXe61EtCFugUXQPkU9BQGRw7OeUzi/IJ26H
         Q+Eg==
X-Gm-Message-State: ANoB5plXRXuRImYe091DWtYfuwu0kxD0Vl4Xb/P8Tah7/hcW0NPzcRX9
	pSyRSrvADewfH4h/X0aeEK5VzH1soH/GOi6Ag3s=
X-Google-Smtp-Source: AA0mqf6HJQ/JCjLD1SZOOiowucoG040jC2cg0h56fBs+dGyY7r21pSduUx3gyk6ikIWBzq/58cJM/w==
X-Received: by 2002:a17:90b:2393:b0:219:a292:f6d1 with SMTP id mr19-20020a17090b239300b00219a292f6d1mr34125467pjb.33.1671202687097;
        Fri, 16 Dec 2022 06:58:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/13] libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
Date: Fri, 16 Dec 2022 04:57:43 -1000
Message-Id: <c39fd8264ac623f3cfb26305420b527dd9c4c891.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174748

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2022-36227.patch           | 43 +++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
new file mode 100644
index 0000000000..980a0e884a
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
@@ -0,0 +1,43 @@
+From 6311080bff566fcc5591dadfd78efb41705b717f Mon Sep 17 00:00:00 2001
+From: obiwac <obiwac@gmail.com>
+Date: Fri, 22 Jul 2022 22:41:10 +0200
+Subject: [PATCH] CVE-2022-36227
+
+libarchive: CVE-2022-36227 Handle a `calloc` returning NULL (fixes #1754)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
+CVE: CVE-2022-36227
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com
+---
+ libarchive/archive_write.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index 98a55fb..7fe88b6 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -211,6 +211,10 @@ __archive_write_allocate_filter(struct archive *_a)
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
+@@ -527,6 +531,10 @@ archive_write_open(struct archive *_a, void *client_data,
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index 7d2e7b711b..e0a6174d8b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2021-23177.patch \
            file://CVE-2021-31566-01.patch \
            file://CVE-2021-31566-02.patch \
+           file://CVE-2022-36227.patch \
 "
 
 SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
-- 
2.25.1


