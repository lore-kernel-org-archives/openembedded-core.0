Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA565C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:20:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.2561.1651004413566472076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 13:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g4+7VY4m;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 16so8337803lju.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUJCempm07JGMbY+wV47KktWoYiYL6ps0u1mBrZ5MGI=;
        b=g4+7VY4m1Iyx+huwmJFmF6aQLk4JDUDZcaUh9Q/XdWKGFUewyC/jU8QgCq8NoQKpZ2
         lzs+sv4FRSd7xWSht+e/rzUCxpA6gvihlLBYtzcKzDikKfzH/+DaBI+IdOpgQ4gs6BgM
         vZUP3gdtTMn04I9nmfDf4zpliTORYaELwyfARvCVgzHUdJZp/JRUaRm7Vo0Z4hL9waeT
         iMtC1TLXQp2ES6fKvOU2G4znZM6Pv5tGirwzkSjdlgzmjCdh0EKC8CQkHX7InW5KCVpD
         gYA5kzIquXPeF0Fsi3oguxmUowLGuF0TOw1G6z+G/GYX5GOFetgNkxYSp3g8r992Nhu5
         KLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUJCempm07JGMbY+wV47KktWoYiYL6ps0u1mBrZ5MGI=;
        b=00IvtPLRc/uiq1ytMufisxQ9gh+hxIIHFUp6oAGCedi/Wmlv0sq7p2jiCyipBfXA0B
         fHG+4FkSouTpqqHFEi6/KV555bwp0pVk0SM8O4h+7bJqg7hxdR7uIOiW5x9bK7IbLebh
         Dg07FLaAQKLbwKCowWMK28dR3d7FDkJfA/OrcPjivle2AHLd4cW3H0Tem9xHmYC2cktJ
         GLY6Oy2KB4W5kaTZZbInUog+NHtLACqC3NAt4bakH1x831kPwIUzGeqnTXeRiiTK70ls
         xFGzeoS9FelGOiOB78RX9XSMGgZc63fas5G+07aIWPvvJ65cJ9HyCQVRfbsz/DYZ6aX7
         GdTw==
X-Gm-Message-State: AOAM530gL0ULqmNlzHcd38dLQ+LM4+17RtjviAaWNmzH7eM0y35pa51o
	5wcsHFY2o6Mbo1KQLZPTlGwtbr7Sfs4=
X-Google-Smtp-Source: 
 ABdhPJzA3tR+dTFdgXymnVG6iu0o/SxDKJjjs3DRkaqkAY0TdbQYxS6gS9L54eviUVp9WE64TdeNTQ==
X-Received: by 2002:a05:651c:1791:b0:24b:1797:53b1 with SMTP id
 bn17-20020a05651c179100b0024b179753b1mr16105868ljb.269.1651004411538;
        Tue, 26 Apr 2022 13:20:11 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 f11-20020ac2498b000000b0047223ff0224sm122551lfl.169.2022.04.26.13.20.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:20:10 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] zlib: Add patch to fix building icedtea7-native from
 meta-java
Date: Tue, 26 Apr 2022 22:19:52 +0200
Message-Id: <20220426201952.3867-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 20:20:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164882

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
Changes in v2:
* Add SoB tag in patch

 ...t-inputs-provided-to-the-CRC-functio.patch | 54 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.12.bb         |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch

diff --git a/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch b/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
new file mode 100644
index 0000000000..ad5e59de04
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
@@ -0,0 +1,54 @@
+From ec3df00224d4b396e2ac6586ab5d25f673caa4c2 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Wed, 30 Mar 2022 11:14:53 -0700
+Subject: [PATCH] Correct incorrect inputs provided to the CRC functions.
+
+The previous releases of zlib were not sensitive to incorrect CRC
+inputs with bits set above the low 32. This commit restores that
+behavior, so that applications with such bugs will continue to
+operate as before.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ec3df00224d4b396e2ac6586ab5d25f673caa4c2]
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+---
+ crc32.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index a1bdce5..451887b 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -630,7 +630,7 @@ unsigned long ZEXPORT crc32_z(crc, buf, len)
+ #endif /* DYNAMIC_CRC_TABLE */
+ 
+     /* Pre-condition the CRC */
+-    crc ^= 0xffffffff;
++    crc = (~crc) & 0xffffffff;
+ 
+     /* Compute the CRC up to a word boundary. */
+     while (len && ((z_size_t)buf & 7) != 0) {
+@@ -749,7 +749,7 @@ unsigned long ZEXPORT crc32_z(crc, buf, len)
+ #endif /* DYNAMIC_CRC_TABLE */
+ 
+     /* Pre-condition the CRC */
+-    crc ^= 0xffffffff;
++    crc = (~crc) & 0xffffffff;
+ 
+ #ifdef W
+ 
+@@ -1077,7 +1077,7 @@ uLong ZEXPORT crc32_combine64(crc1, crc2, len2)
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+-    return multmodp(x2nmodp(len2, 3), crc1) ^ crc2;
++    return multmodp(x2nmodp(len2, 3), crc1) ^ (crc2 & 0xffffffff);
+ }
+ 
+ /* ========================================================================= */
+@@ -1112,5 +1112,5 @@ uLong crc32_combine_op(crc1, crc2, op)
+     uLong crc2;
+     uLong op;
+ {
+-    return multmodp(op, crc1) ^ crc2;
++    return multmodp(op, crc1) ^ (crc2 & 0xffffffff);
+ }
diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zlib/zlib_1.2.12.bb
index 95e873584b..e921703137 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://zlib.net/${BP}.tar.xz \
            file://ldflags-tests.patch \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 

