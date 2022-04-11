Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED75C55187
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.28821.1649680831508043728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DJgkdtCq;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 21so5019139edv.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rtoL1LWcglsj/zqJwRNZ26H6wd5xGfMUcNGxEd7Su7s=;
        b=DJgkdtCq+6YiPeItq9gr2Oc/HJQe+muRLU9N8WwGQ372GcU2kb0R15tq0hMUMmGshm
         USJhuQNUn3cSnOTKWniM+7rogenK4OFYyUOSsVV5TNsCAFe6xpNuqKCnZvObsMll1IxD
         RRVqGYGSqkxNiTT2uPDxN9u47iTRw59k0OiLGqE9r+vRJhm3Wj5uhvt2RMIC8XbdYsQT
         qrA2DHEBnAI/a79qT/JctsUhmJo/xa4nMZTB1RnA2vA/WEARWLBm9bRpzTPBEH3gteBC
         YGnRrRcMnF+YlriGxcR/V5Ls86vrniR8gUBlzuy9u0SNt1OW2tBbI1hTflqfl/PAxEv0
         hG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rtoL1LWcglsj/zqJwRNZ26H6wd5xGfMUcNGxEd7Su7s=;
        b=k3sHLXgrE9B5i69Oy9yJF3u7h5kyKTDJk9s8w+py2qn26Hhy3+SlhUvwcn/TkkmePM
         bVvPu4ATs64cPTcYEYIUNKkvTm7WuwSqxOf/apI4sFlzVKaiU03hwi1J+PtNNbCmYnRU
         ylKe/OL080dmeOcd9o/9D9UHDYTikB4Lmd1fYzgUXa121PDWNQwmnqOLFjlYOfWbmC8b
         sqD6bFe/n2wTYb1KKl7Fjs1IQgu8BvvtdrtnAdlflTJ3NVisYJJrEtZr8Gq7wcpDDkjF
         EsvtX0DjasC54HZUHwBkoPLJLGixrwhxP4D8mvaNBrWFYq2ygS0DcI0qZeuRn+D+hAx2
         r6lA==
X-Gm-Message-State: AOAM530y/q208cerhEwi7n4R9LqOTDvBC45yj9aPdgd+BPjHd2bNMVw0
	pdE+DNsqftAeOtAe5NZ0o6RNc0+p/tM=
X-Google-Smtp-Source: 
 ABdhPJwZjiHPDWXDzj5ExO++g6PMllwffa7XlBZNuDSjsn5C1ZvW9FTZQ+CJ6dwluM2pLH6RJF7rtA==
X-Received: by 2002:a05:6402:4248:b0:419:4583:eaa2 with SMTP id
 g8-20020a056402424800b004194583eaa2mr33071500edb.376.1649680829492;
        Mon, 11 Apr 2022 05:40:29 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-253.retail.telecomitalia.it. [87.5.19.253])
        by smtp.gmail.com with ESMTPSA id
 n27-20020a1709062bdb00b006da975173bfsm12101003ejg.170.2022.04.11.05.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 05:40:29 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [oe-core][master][PATCH v2] libarchive: backport patch to fix
 CVE-2022-26280
Date: Mon, 11 Apr 2022 14:40:24 +0200
Message-Id: <20220411124024.3574402-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164221

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Update v2:
    Change title from [meta-oe] to [oe-core]
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


