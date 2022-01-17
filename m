Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE943C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 17:32:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.435.1642440765610242895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 09:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JmcsqrQn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso26047598wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 09:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pZ2fMfn/POWHYytChx+i/VMAeOuja0uJsWiwzNK/lE=;
        b=JmcsqrQnyLLKsk458U30orYL9DeO6ztAbtCXbK0pwDkmrqQhPvujmA0KlZOqQMJqii
         6H1nsNuZqyKq8ET7e4Kih7DfNgyvOuU1zr7gLrgbmEqwAEGVxajvx5E8/mZQpJHfhTMU
         BLGsdzmaGBMcrpJxph3FTz6g7F7MGy8z9YYo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pZ2fMfn/POWHYytChx+i/VMAeOuja0uJsWiwzNK/lE=;
        b=MjAHQKvu0Iw6N9+4ITiL59jnDw+xxRWHpWDSUHz4sS1YSHdMWgro1JyoOOl7zqVZG4
         TgkzcbKdhlWciqfKkyrTpfP1r83mMu6evHNuotoVKBkWzvqoNGkXPd7m53i5P8WYKOiS
         TruXlqp1Au4lhq+I/MHiEcEQuKYCjqwxVFv4RBTTXrDKZ5dTDqgt9BFcxAVmR/qeGGkj
         WK8yOm7cCzCY21X/FYiKlGjwb7tYj1RXcs9JLvcEuplDb6vNBPdNeZVVgrvvHd5LhwUC
         OCDHAKWOSvbpGQccmwcphLHB3up/ssO7B2gh3PrPnwc1zcS6qz/gQQv+6aj5KHQhA1N7
         hr+w==
X-Gm-Message-State: AOAM5328RBZJRNhLh2hqRoQtq/GB3lTh8+jHJmkKIxlX7Lu7dfbS63lq
	98+NFprTRZWD4OK5k/Lz+IoQKpQtuBegoQ==
X-Google-Smtp-Source: 
 ABdhPJxizjIE7YUUWXllOP+o8FxX3Md4lfChX93u+I7E2gf4FsZM3bSaPyJoRm4pGuI89Vn4TYpoKg==
X-Received: by 2002:a05:600c:1d9a:: with SMTP id
 p26mr29045246wms.38.1642440764121;
        Mon, 17 Jan 2022 09:32:44 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36])
        by smtp.gmail.com with ESMTPSA id
 m5sm4677881wmq.31.2022.01.17.09.32.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 09:32:43 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Drop unneeded libtool patch, we use cmake
Date: Mon, 17 Jan 2022 17:32:43 +0000
Message-Id: <20220117173243.1862290-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 17:32:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160655

This patch is old. We use cmake for building expat now and libtool isn't even
used. The upstream author asked questions about it and can clearly be dropped
so do so.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../expat/expat/libtool-tag.patch             | 30 -------------------
 meta/recipes-core/expat/expat_2.4.3.bb        |  1 -
 2 files changed, 31 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/libtool-tag.patch

diff --git a/meta/recipes-core/expat/expat/libtool-tag.patch b/meta/recipes-core/expat/expat/libtool-tag.patch
deleted file mode 100644
index 0a0aed23e5d..00000000000
--- a/meta/recipes-core/expat/expat/libtool-tag.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 10342e6b600858b091bc7771e454d9e06af06410 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Nov 2017 18:20:57 +0800
-Subject: [PATCH] Add CC tag to build
-
-Add CC tag to build
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 9560a95..d444bd6 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -319,7 +319,7 @@ LIBCURRENT = @LIBCURRENT@
- LIBOBJS = @LIBOBJS@
- LIBREVISION = @LIBREVISION@
- LIBS = @LIBS@
--LIBTOOL = @LIBTOOL@
-+LIBTOOL = @LIBTOOL@ --tag CC
- LIPO = @LIPO@
- LN_S = @LN_S@
- LTLIBOBJS = @LTLIBOBJS@
--- 
-2.7.4
-
diff --git a/meta/recipes-core/expat/expat_2.4.3.bb b/meta/recipes-core/expat/expat_2.4.3.bb
index 279774af439..cc50f90f70b 100644
--- a/meta/recipes-core/expat/expat_2.4.3.bb
+++ b/meta/recipes-core/expat/expat_2.4.3.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9"
 VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
-           file://libtool-tag.patch \
            file://run-ptest \
            "
 
-- 
2.32.0


