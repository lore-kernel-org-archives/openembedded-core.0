Return-Path: <jim.wilson.gcc@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A78C4167B
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 01:44:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.4077.1637027058637282665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 17:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CNCLU2oK;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: jim.wilson.gcc@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id c4so16644972pfj.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 17:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aSX8i1WUMGZdeqHfBxzGpjSz8j0y1396zCaZYUbhYgU=;
        b=CNCLU2oKroDoZucKL7FcQO29RgBYztUzI7FFWzGhQxcL8jS+kuuxByXY8IWqzCUs18
         0UG/D+wyYO1JRg3q5jeoy4LVczekPlEtsjHx3x22HOAN8N3ILwbWvdBHFnTyZ312ret9
         e4ufrSg6mvpxkV1VlIp9DTj2HDitvt9tRzLhd+2lli5S688Fv5ZHArD2pkKJOmJVup5G
         iNr5q84IKru2FRwkJqFdamGULokHZxz8vHfimDvAsgyPs8Sssovl/FnIuKNONdy6mzhz
         urH7Wk8uCTrNr5tFwEaGPX8eGSc3CQdI//+nKXfdp4+Kqdi6BOtIRccBE9vcyp6Jlah0
         J8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aSX8i1WUMGZdeqHfBxzGpjSz8j0y1396zCaZYUbhYgU=;
        b=bZ1LDa+wyoI/QIqdIrYz5ZHk986+Tb1YV1/+aZly5C2cbWrq8h6qKG5kgCtc7xiUvh
         4K0/sAHreRvB2BWPmKIsUj6G7semUMxAkPH00Flhm5RnL2dKh2tNKlrLf251UhBj9Fox
         yuxr6ktK08oeDxFoQ6+UykzjVNxuE8trw3nJV00PBaiPQNNTn3hMQ4KjtQaZui4gmsQg
         Crh479teznbtGc3Vs2Cgn1QvCt0lF30tBpG2SmCSoVbClCASNSdGHSqjneL1q/c7Cmns
         gCTHlvApqXGECT9YfmJZStEbmGyNE1Wzk/QAVkGOPNN0g7QVv9+B4gO0w0aZXh9g245M
         Zcsw==
X-Gm-Message-State: AOAM531aB3VNorSto5xk7mqkIs/f93+Ea1rb9g6+MJwVtGpGwbXTKBPr
	ZL5M9fxMitpT77TTiXjIPSHcQoDhnpX6IQ==
X-Google-Smtp-Source: 
 ABdhPJxf+LskhJSFnRP19H3Aeo5EmG2R6aJtH2HrDM4Atypi5yizO6ftjW1N6IyQ9M++QLvc22whuw==
X-Received: by 2002:a05:6a00:1242:b0:44c:2025:29e3 with SMTP id
 u2-20020a056a00124200b0044c202529e3mr37860241pfi.59.1637027057761;
        Mon, 15 Nov 2021 17:44:17 -0800 (PST)
Received: from bree.hsd1.ca.comcast.net
 ([2601:646:c180:b150:28aa:23e0:8daf:ff49])
        by smtp.googlemail.com with ESMTPSA id
 17sm12756465pgw.1.2021.11.15.17.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 17:44:17 -0800 (PST)
From: Jim Wilson <jim.wilson.gcc@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jim Wilson <jim.wilson.gcc@gmail.com>
Subject: [PATCH] gdb-common: Add --with-liblzma-prefix in xz PACKAGECONFIG.
Date: Mon, 15 Nov 2021 17:44:13 -0800
Message-Id: <20211116014413.419573-1-jim.wilson.gcc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 01:44:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158320

This fixes an arch linux gdb configure error with liblzma installed.

Without the --with-liblzma-prefix option, when configuring the target
gdb, gdb configure may find the native liblzma (on a non-multiarch
system) and try to use it, which gives a configure error.  We already
use --with-libexpat-prefix for expat, we just need to do the same for
liblzma.

This was reported here:
https://github.com/sifive/meta-sifive/issues/34
https://github.com/sifive/freedom-u-sdk/issues/148

Signed-off-by: Jim Wilson <jim.wilson.gcc@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index f3ab3544da..925b0c2f80 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -37,7 +37,7 @@ PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 # ncurses is already a hard DEPENDS, but would be added here if it weren't
 PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
-PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[xz] = "--with-lzma --with-liblzma-prefix=${STAGING_DIR_HOST},--without-lzma,xz"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
 
 GDBPROPREFIX = "--program-prefix=''"
-- 
2.25.1


