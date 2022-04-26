Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA255C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 13:27:27 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.6436.1650979640251248583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YzBnan2T;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id m23so11120682ljc.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9CwFpHJxi72IgmtIXttASpNuyfCQRdT3gKGJUBzYDHc=;
        b=YzBnan2TpAF7GAlVv1vpusr6WAp8epQ8dcvDOA65DzcJewQ4KsXJrG1Fbn/a0vuJUp
         D3+8zLIFg0W7XQvcQ1I02v6D+DoQY1U/ybk52QLxnjiwh0wrRxLmQ5PzOv+itS2gN9jD
         m5hWhItRfKMdqw7g07Gin5SZOXtO6x2z6nbrodEjqJmQJIEXYhqEEsTNwTyTlI7N8ZD6
         Z7lI3nQBkU28E8a14gXujsEBljjDYQ7i5yoZxVfN0lyIyprA4kKloXC18xdtITLfjs2H
         seFgSIU6uE9zQBdOXpRyXiWqdBD5+EJRrT7xyd5N9nNjxyQIaFxYdcTrGnPP6txxEQbA
         3veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9CwFpHJxi72IgmtIXttASpNuyfCQRdT3gKGJUBzYDHc=;
        b=GmCIsC9lfTgKZ1GCvtNMxQt/QjgWESDLRDHFvO79SYKTjcRnjYBxkC4XaujRSB21Tj
         qRjYtI4/SU7fjPKa/E4RxD5Z1a4hkSx00K+ylBwJtJ5PR8nOKXVxJA1Dl2rNE0PfznJ+
         mg6hxdWgD7T19sQOhxgQHeGI90oO/JjZslcRptW23sDKyx74mMliV47/S4TIyh6O94uY
         tjzUFPRnowMdM+AsEj7pllTSRMSRlLdc5nSjA9Y4YFk3YfSQosF75UyvK6kNS2MS/o0M
         b1RZVqKwHcg7Xs0uHnWRvI0SiTuYOZyH9FllCf+TrbKap5tsQKIQOpqpLjjVzwz3WG0A
         U/UQ==
X-Gm-Message-State: AOAM533O892vvTinQqVdfyyo1cAkm98ZQsN4JACFvAfVznEzg8DlbDj6
	TM6kiJG+eVLHGONGOD9jGQkqNbqTEuPcTw==
X-Google-Smtp-Source: 
 ABdhPJwL/zH8Eyx4BxD+3BgVdmFQCXdmzhyqZVbgD3BLwhn8Evy4Qp4wjo4ek6p1sVdQrjIJ+W95pw==
X-Received: by 2002:a2e:b88c:0:b0:24e:f647:ea2a with SMTP id
 r12-20020a2eb88c000000b0024ef647ea2amr12873897ljp.247.1650979638338;
        Tue, 26 Apr 2022 06:27:18 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 k5-20020a196f05000000b00472035deb89sm883170lfc.1.2022.04.26.06.27.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 06:27:17 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] zlib: Add patch to fix building icedtea7-native from
 meta-java
Date: Tue, 26 Apr 2022 15:26:57 +0200
Message-Id: <20220426132657.988726-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 13:27:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164875

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 ...t-inputs-provided-to-the-CRC-functio.patch | 53 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.12.bb         |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch

diff --git a/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch b/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
new file mode 100644
index 0000000000..6bd36d56d2
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
@@ -0,0 +1,53 @@
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
 

