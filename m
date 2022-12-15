Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04FEC3DA6D
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:46:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.128335.1671093951750537163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LW0KhTLN;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so2042137pjj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPxHdua0NCXLGPjPRFpVEkpTULMf+Jqj8dDqQJlJ484=;
        b=LW0KhTLNR2Gm1qrhNgnjSz75CuH5I3+WWc+j5t81+TjLWLeNqpwFIhqpe8GeikfSyb
         GdtpJ38yz9MQrW3H6WLoREMvMyTb7ig9jIgl+cdz8diUNY+g4RPZxLNouQpS6Bowcit7
         R9hhqc9a06O76OvizvtBS0o2Ja4ncoyQQEsvuIZoenM79+8muLzLD2A+Sm/gPhiv1KQT
         tujYGG0543aYpoqeW1CmqIQkJXZdxOs2yaTCTaK3h1aeAJe+uqeuG2C9tb2Tgz7zwpz3
         XeDIFxnRQllS6EXTSTCc5wrwDvzgk0jlzkQKatZ0Izb2zsxGvA506WY7vQEVXXmSBy6E
         I2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPxHdua0NCXLGPjPRFpVEkpTULMf+Jqj8dDqQJlJ484=;
        b=4h/vHjk8z+mTNlx/QKKEuVSClHjwFFtn3W5FGLVzsrRCzmG3n2JWmjAXIs/78S2HfM
         I9FH5xJ9ytcCnr7RBCtrieNezs+PFzVtsQm/GKfb+GzegM6SOmbg7kFs4e9VRo4hdWoZ
         xOjSH42DhDq3/ZIPCU4a6mLxu8y3rUgAOGA0KLETFu9JLa3+VWgGYdD1Bk/HeG3xM17W
         2FniKOB20OpqWEy6SP6ZVwp4NjkgN7VlTn/NDMjX+GyT767mkuLjrr78lMOY06yfNxns
         xKFj4ZKOuud5n0FODh3Vw8Pape8DlmieN+747zLphrQL4EWc5vI4cT2BqjwQgvKyLvod
         9t+g==
X-Gm-Message-State: ANoB5pnIr+/OvXsd2wEUDRfBYuDS/jzZGFXcMH8gEe8Ot5sZfT1zchzS
	leS/hs8Sz0NS9FTauVX4DoS2ePSVn4Y=
X-Google-Smtp-Source: AA0mqf5MaNZ/ctixYGi0wBhG0gRuML3qMpykz5poxRmFNNOCIX2mpjc4HAvgTGBWD/q0F4QLYCGO2w==
X-Received: by 2002:a17:902:684c:b0:189:5f5c:da1d with SMTP id f12-20020a170902684c00b001895f5cda1dmr29126957pln.18.1671093950945;
        Thu, 15 Dec 2022 00:45:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 04/11] acpid: Fix largefile enabled build
Date: Thu, 15 Dec 2022 00:45:39 -0800
Message-Id: <20221215084546.125368-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174566

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/acpid/acpid.inc              |  3 +-
 .../acpid/0001-Replace-stat64-with-stat.patch | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/acpid/acpid/0001-Replace-stat64-with-stat.patch

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 98910bab29..7b2f1c71c5 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -13,7 +13,8 @@ LICENSE = "GPL-2.0-or-later"
 SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
            file://init \
            file://acpid.service \
-          "
+           file://0001-Replace-stat64-with-stat.patch \
+           "
 
 CVE_PRODUCT = "acpid2"
 
diff --git a/meta/recipes-bsp/acpid/acpid/0001-Replace-stat64-with-stat.patch b/meta/recipes-bsp/acpid/acpid/0001-Replace-stat64-with-stat.patch
new file mode 100644
index 0000000000..10abfc8388
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid/0001-Replace-stat64-with-stat.patch
@@ -0,0 +1,31 @@
+From 4b729235a9e96f120feee7e3746818aad0f3b924 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Dec 2022 15:04:30 -0800
+Subject: [PATCH] Replace stat64 with stat
+
+It already checks for largefile support in configure.ac via
+AC_SYS_LARGEFILE macro, which will ensure that 64bit elements
+are correctly setup for stat APIs on platforms needing large
+file support.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/acpid2/code/merge-requests/5/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sock.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sock.c b/sock.c
+index 9e04501..3121fb7 100644
+--- a/sock.c
++++ b/sock.c
+@@ -54,8 +54,8 @@ int non_root_clients;
+ static int
+ isfdtype(int fd, int fdtype)
+ {
+-	struct stat64 st;
+-	if (fstat64(fd, &st) != 0)
++	struct stat st;
++	if (fstat(fd, &st) != 0)
+ 		return -1;
+ 	return ((st.st_mode & S_IFMT) == (mode_t)fdtype);
+ }
-- 
2.39.0


