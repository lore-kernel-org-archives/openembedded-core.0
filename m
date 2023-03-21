Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D47C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:37 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.14674.1679408432607253367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ufDoKdq8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so16472183pjp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJgY76uVaX67/yT2FFnD/h9Ux60rmhaE0fLZjm6/jD4=;
        b=ufDoKdq8BEn46lR9ou8GSF43getYbT8hEkCG5rPCRiYP7pduwJ69aIdKWvnWG9sjCy
         3muHuaWrBTycIl0EjEq/20x4ZUOrEZYGFbktppug9ZBoWF+oC/71qPPD+y89Bwos6kwu
         ORQk9smq7eEJw1cQNLmShX4Yn61j2ZrEFQ3d6iHSTsJ4XA5hRWbNg4wGKqxtKGCsfSB9
         QV8IA0TOTGcnQXRrbUgjmhWYjd8OaFd9XsNy5y9Xds9IO4eGdHD07pgGT8RdRRTt7Skl
         FNJDOMvNMEOF0r7hAEEHuPsqTCs/teb4QRN+sV4jGFVay3BYpRIX1FdNXrYxYtUglXBI
         vJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJgY76uVaX67/yT2FFnD/h9Ux60rmhaE0fLZjm6/jD4=;
        b=hTNHh1WYTL7KeO+Ha+mMlVpqGTl6y5/lItvNpNNCzWHrOBMUHJOurJV0LL8hCst3hH
         9oXMiyOnVAGty5mvVO7xA0HAmgiFgQ/EX3iqbvflZH/VJ7Er1QS7so0C3PdAurvKVv0+
         Vw+W9c+tKWPnM+RcmSJby0gTkyj/AUwgVl9guMDWOU61wteKaJguWmrPu/+IzinwkHcu
         L0X+h7xTskL071pt/PryS4TiME4SmqVwoU9pzgbgTC8jlpzixixRpsQuK4drbJrwskvG
         m2NGI54DGe5HVdBe1+HU3nMhitFT8BYSDACwZqyUMddASLbP++eCnkpQJsuZxgj5QwAP
         /QwA==
X-Gm-Message-State: AO0yUKUmx2uNmfV14lxYphtF7LLxHYtDFjaCahJBKn6MN0npTr1yda4H
	9ppFVxf4y+mdxIUsV1UaYgEO0VTmyMk0CGYTeh0=
X-Google-Smtp-Source: AK7set9a19S83m6k89yGwu33ojKP5/5Zt9GsWDY3GrKXnNX9bcsWwujkWoz/chbw9wmjamMP8kpaEw==
X-Received: by 2002:a05:6a20:be07:b0:d9:d895:29f2 with SMTP id ge7-20020a056a20be0700b000d9d89529f2mr3513163pzb.5.1679408431598;
        Tue, 21 Mar 2023 07:20:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] libarchive: fix CVE-2022-26280
Date: Tue, 21 Mar 2023 04:20:06 -1000
Message-Id: <b23482f9ea1cc930a3d5ecfe5fc465e2f720a949.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178872

From: Andrej Valek <andrej.valek@siemens.com>

Backport fix from https://github.com/libarchive/libarchive/issues/1672

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2022-26280.patch           | 29 +++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
new file mode 100644
index 0000000000..501fcc5848
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
@@ -0,0 +1,29 @@
+From cfaa28168a07ea4a53276b63068f94fce37d6aff Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Thu, 24 Mar 2022 10:35:00 +0100
+Subject: [PATCH] ZIP reader: fix possible out-of-bounds read in
+ zipx_lzma_alone_init()
+
+Fixes #1672
+
+CVE: CVE-2022-26280
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/cfaa28168a07ea4a53276b63068f94fce37d6aff]
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+---
+ libarchive/archive_read_support_format_zip.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_zip.c b/libarchive/archive_read_support_format_zip.c
+index 38ada70b5..9d6c900b2 100644
+--- a/libarchive/archive_read_support_format_zip.c
++++ b/libarchive/archive_read_support_format_zip.c
+@@ -1667,7 +1667,7 @@ zipx_lzma_alone_init(struct archive_read *a, struct zip *zip)
+ 	 */
+ 
+ 	/* Read magic1,magic2,lzma_params from the ZIPX stream. */
+-	if((p = __archive_read_ahead(a, 9, NULL)) == NULL) {
++	if(zip->entry_bytes_remaining < 9 || (p = __archive_read_ahead(a, 9, NULL)) == NULL) {
+ 		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+ 		    "Truncated lzma data");
+ 		return (ARCHIVE_FATAL);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index e0a6174d8b..582787d3f3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2021-23177.patch \
            file://CVE-2021-31566-01.patch \
            file://CVE-2021-31566-02.patch \
+           file://CVE-2022-26280.patch \
            file://CVE-2022-36227.patch \
 "
 
-- 
2.34.1


