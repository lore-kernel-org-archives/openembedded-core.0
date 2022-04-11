Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2ADC54F64
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.29020.1649680736783249607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UE18d2Hu;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id c6so3065696edn.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ah4Jo4UvjvXQxRYB1Ss/ayCf6JuiS+GvOVZ3kEAYqd8=;
        b=UE18d2HuTMNNPR/jpC9IroIke5dReTYgd2d+nFwgmMPoyhcvyktWi/eREJj4G8HKAR
         ILit27rDRjII5EW2lRajrHqb9IkTsacd5ZIgsO6L3cKclBWAnQ1ChpPULqEoOSWa21TP
         JFGJTXPP4SQPaEY8apwTbcYwc9Keb06jDCrKG7mmkfUA5gxqqtHhwc9i55e7ETy7fC+C
         JNIqAX2nDUkdML+ZlsZOAkZMYFDPP9ewlsL8F/ZNWXyhbXLsx38hq7WNczQnIfiQK6GS
         llW24o/P5B0zPlM92Qee2rge1zY89x9OvwbbCNKxihF0kRMqTaUSPQ1El0IzBMLZAgqn
         vZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ah4Jo4UvjvXQxRYB1Ss/ayCf6JuiS+GvOVZ3kEAYqd8=;
        b=zNNhYT2e5Acsje+dtZbYkEmc8M8Mkwtb52FX/75/SL0d4N3LXKH6R9bngxprtGN3an
         wT52nrh+DIm6wLdPY0KCdKBVIfEm8uOeaeVgdUeVuQZBubgYQ3a7YJLg7SMsRQLxOpf0
         icD9knBiN43XkK61KkQj14prs28pxm5TakptGiREbm4Uzvv2JHLyNvQKy077FHw/X4DH
         gQA4LR5aUR4K5hyE68VL/htuMjWZu01jh/z223kmjobYGB7ceHI3NkNDJluRETxtI2nP
         oXVTAYBFLQlu2L8f+SDrmnAEazVdb1/MR8DQuHjrSc1yYIbluxNRpXC1W8zcLpVmYJQ7
         JrhA==
X-Gm-Message-State: AOAM532ZxErE0A5Ptfb5ONzzT44WIea9r8YIRPLgVhPWDKL2Sys4Sdpl
	OEKx8y7HFo6Xly/fAAi0fM4oNu/vysw=
X-Google-Smtp-Source: 
 ABdhPJyjbo3KLqAn7L1R2T5B5u0pCY4uUqtjhzi2q/sqlgpu6TZAhadlPUVOyfc+M1pKgIdIZNffJw==
X-Received: by 2002:a05:6402:d0a:b0:418:ec3b:2242 with SMTP id
 eb10-20020a0564020d0a00b00418ec3b2242mr33301761edb.229.1649680734821;
        Mon, 11 Apr 2022 05:38:54 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-253.retail.telecomitalia.it. [87.5.19.253])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a50cfce000000b0041cbaba8743sm13373142edk.56.2022.04.11.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 05:38:54 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][PATCH] libarchive: backport patch to fix
 CVE-2022-26280
Date: Mon, 11 Apr 2022 14:38:43 +0200
Message-Id: <20220411123843.3574300-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164220

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../libarchive/CVE-2022-26280.patch           | 31 +++++++++++++++++++
 .../libarchive/libarchive_3.6.0.bb            |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
new file mode 100644
index 0000000000..c322e12274
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
@@ -0,0 +1,31 @@
+From cfaa28168a07ea4a53276b63068f94fce37d6aff Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Thu, 24 Mar 2022 10:35:00 +0100
+Subject: [PATCH] ZIP reader: fix possible out-of-bounds read in
+ zipx_lzma_alone_init()
+
+Fixes #1672
+
+CVE: CVE-2022-26280
+
+Upstream-Status: Backport
+https://github.com/libarchive/libarchive/commit/cfaa28168a07ea4a53276b63068f94fce37d6aff
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
index f078c8ad03..16d6e2af2d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
@@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://CVE-2022-26280.patch"
+
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
-- 
2.32.0


