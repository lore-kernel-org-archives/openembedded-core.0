Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83F4C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2124.1743577833712999607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BivZWUkI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so925608f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577831; x=1744182631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNXzztFjL/FTa+Mwq1MOQMLrkapRWFPDSt4yCDMckaU=;
        b=BivZWUkIGKhhVElRnWetyI/+Fg/yU1FNQO8x5PDLDz1w3FEKqhX6dqScYmCLtYBMVf
         A5troLG9YPGPhwXNYWXDoinC1yzMeAjQCNDhhJuhGtZbPGVDP2Sb6dlzLgDGbX3fHgLV
         3pTAN9AjKPHih2BJ6BqFHFjlb5qgsBXTiSRkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577831; x=1744182631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNXzztFjL/FTa+Mwq1MOQMLrkapRWFPDSt4yCDMckaU=;
        b=M/K1UtcxxiDbG8i8MqWaBMuH99S3UmbHrg/W4GshUj9bhK5FdFvTmctj/hRsoenHjD
         3aY0MsgFZAuo6zK2TZ5C1r6U3U8SCqt9GwHqPbfs68YTSisIt3NzD5Y7phTmxVRHQmYR
         aSheyRaFG4VUOiurbL8qXfciOrOTkE3pWLpe4HWNvyOASSq6j2Hj7FRjoywVeMreqQg5
         a1BG2+WO3KkG6aNfRrGPOkGLFvL1nsCHlEVUPKQAKYZekJV4+5f3B7kAc1kzJCTAMPfU
         bAHWsWxPckazU5ElTYw0r73sKE3OYWbobcTeB8cXF3wwqlrCovkzAyPD91gRbIeQnBNr
         EzsQ==
X-Gm-Message-State: AOJu0Yx9Es97iNu/OzAq8DXSkwJl6JxkCemx/w//ayU2edBB2zS1bKVn
	5yQibErZHDGZHG6Tvm5tDndMi4kn10XK30rVcBpb26DHh44/Jp+X2s+HO3tuUl1gBArkpviKdai
	R
X-Gm-Gg: ASbGncvcXHCXqIhiT4YXjvnvD67V2iXalpNNFNqqJV0enfFk5D50nXVJFRzVrbuBbOI
	LKn/Bqd6Du+u7ut7CXOvlZ1BLC2h6AWhCauW7AeOQk+p7iJPIa2ZlQtcJ0mIvcGHOPMOcjEkYbN
	Cil93JWMNnSVqGAklNd/tVoeV4XSBjUeHfPaPLk5FvuX6Qs969CYIPCikh1he6J7owP4SX4YE9Q
	FDXg9O/3DWMjagBbPaE0CcAh3yq+FWIiFP5bakxhJ1Q5emymkzji2/VcGlcsCNUFQMusXSeMSdb
	Q6d/R6VqY6ftXBaaGfMpz1HZ59TDlvBgTFl7mtti4xK32E73qRu/cIIRm4S1ixUhKjIDAvwzCw=
	=
X-Google-Smtp-Source: AGHT+IE5XWnG1mEDV8oeLm3OGs0pQpwThEqnzKyj+a7BR0gJFwxhs9+2jogfsidnb3O3KIaIw9JZBQ==
X-Received: by 2002:a05:6000:1882:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-39c120c8ddfmr13942183f8f.5.1743577831424;
        Wed, 02 Apr 2025 00:10:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/48] btrfs-tools: upgrade 6.13 -> 6.14
Date: Wed,  2 Apr 2025 08:09:34 +0100
Message-ID: <20250402071017.2157620-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214178

Add tag to SRC_URI to verify SRCREV.

Drop patch merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...y-to-specify-where-python-modules-ar.patch |  6 +--
 ...dd-break-to-case-BTRFS_COMPRESS_NONE.patch | 40 -------------------
 ...trfs-tools_6.13.bb => btrfs-tools_6.14.bb} |  5 +--
 3 files changed, 5 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.13.bb => btrfs-tools_6.14.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 59ea5a66dac..2cd66d2722a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 76e635a56c5973671da3a8a2fd4fc32e823bf8c9 Mon Sep 17 00:00:00 2001
+From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 2f8d2fa0..c760e5ae 100644
+index 7e36aa42..edff7d5b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -985,7 +985,7 @@ endif
+@@ -996,7 +996,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
deleted file mode 100644
index 750ba830740..00000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ae0743dea3498429fce144e75c8b5b6eeed6f490 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Tue, 11 Mar 2025 05:24:54 +0000
-Subject: [PATCH] mkfs: add break to case BTRFS_COMPRESS_NONE
-
-when compression null, always through error "lzo support not compiled in"
-
-This bug was imported by following commit:
-----------------------------------------------------
-commit c6d24a363daed6501d13d9125c560387e2d755ca
-Author: Mark Harmstone <maharmstone@fb.com>
-Date:   Thu Dec 12 20:36:55 2024 +0000
-
-     btrfs-progs: mkfs: add lzo to --compress option
-
-     Allow --compress to work with lzo.
-----------------------------------------------------
-
-Upstream-Status: Submitted [https://github.com/kdave/btrfs-progs/pull/967]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- mkfs/rootdir.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mkfs/rootdir.c b/mkfs/rootdir.c
-index 1927394..5f4cfb9 100644
---- a/mkfs/rootdir.c
-+++ b/mkfs/rootdir.c
-@@ -1654,6 +1654,7 @@ int btrfs_mkfs_fill_dir(struct btrfs_trans_handle *trans, const char *source_dir
- 
- 	switch (compression) {
- 	case BTRFS_COMPRESS_NONE:
-+                break;
- 	case BTRFS_COMPRESS_LZO:
- #if !COMPRESSION_LZO
- 		error("lzo support not compiled in");
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
index d73d86ba8ae..cee1fdfd556 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
@@ -15,11 +15,10 @@ LIC_FILES_CHKSUM = " \
 SECTION = "base"
 DEPENDS = "util-linux zlib"
 
-SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tar=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch \
            "
-SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
+SRCREV = "5ad147c9ec00e657393c85b195c9bcc0f4c35a54"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \

