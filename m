Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8ACEB64DA
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:07 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.330.1688831763960806822
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sh4ddVxy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-553ad54d3c6so2046927a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831763; x=1691423763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCZ72GolJw3Obw0hpj20chb0js/rd5DSnAZbKKVkd3Y=;
        b=sh4ddVxybBRjEXOcLCZEXT3dS+eNWiJntZXhdbRZwfqPR1BJ5M6pfRIgP9koJwXlUy
         +0ngYA1vfokjn9LWaeYlJosKZ3KiwaRQzI4qnqL5QiajJtNzbsAmr12G+YyarmsvEbpg
         tFr5ugGOhYBHFColD391l3kiSYxoObWA6+Ft5+cLCEpWvoZYEl0dUGaW8jut833JNzEO
         x3iEbAGckE1CdB2KdhKv6QOt1VLjxe7E97hoI8xALwVhs40XRfhCpYGbxPrQ6OgXfTBx
         +kkYZa0R6+J8Y+Vt0KNglImq9KnD+y7Lz8GKAM7zSaukh8yR08nVWEZs2/qr5qMjB6qB
         cf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831763; x=1691423763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCZ72GolJw3Obw0hpj20chb0js/rd5DSnAZbKKVkd3Y=;
        b=gs/4BIFAKKrDMZwas4CV5VNgEszr1gVTh1Jt86SM5PrVFvN6a1INPbfPC+7rY8tgRn
         RVmGNLJun4QZi4yHK6N3QSo5MEr+lSsE7ZP5JOXY5IpH7yDFa4LHlI/SGgKjrgZJJnlk
         0sOG97AcDuG4run8iDhavH6qHo/CgjVZzY67wUZZkMEiTMzYAIhggECS+f1xnDHM4v+X
         R0fr+5cBIomM8h/x2K0C2ohX6aC+lMVIsf9t7Tra5KJLuLo9XDo7pKDBntlXfvNtSEDZ
         vbipXA33gfbHpPSi/4M1oo7WhNhHclBu9fwaw3/+fK1/cZHZTrQ/htpp/hr9QzOXAB/j
         P71g==
X-Gm-Message-State: ABy/qLZtRAU5FJ3EjlWEM2yx2rJgSKJ9nUdYlcToNEXdcc5vU/20tRQx
	ArKmXB/n+48JyGL2eY2BBRYfo/ulEpKiE4fdanw=
X-Google-Smtp-Source: APBJJlEE3FayM9DiCwk977hmvV3L7QfrSFH5NbtNzKm8N0GmTBTb4NUxv4P1et4H3MecFeBLigyK/g==
X-Received: by 2002:a17:90a:5898:b0:262:f029:6946 with SMTP id j24-20020a17090a589800b00262f0296946mr5790654pji.9.1688831762836;
        Sat, 08 Jul 2023 08:56:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/17] sysstat: fix CVE-2023-33204
Date: Sat,  8 Jul 2023 05:55:36 -1000
Message-Id: <c6bc5cfbed71b65753e50aee5a640934e754858a.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184022

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patch from debian to fix CVE-2023-33204
http://security.debian.org/debian-security/pool/updates/main/s/sysstat/sysstat_12.0.3-2+deb10u2.debian.tar.xz

upstream patch:
https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 46 +++++++++++++++++++
 .../sysstat/sysstat_12.2.1.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..9a27945a8b
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,46 @@
+Origin: https://github.com/opencontainers/runc/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0
+Reviewed-by: Sylvain Beucler <beuc@debian.org>
+Last-Update: 2023-02-18
+
+From 954ff2e2673cef48f0ed44668c466eab041db387 Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@cloudlinux.com>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+CVE: CVE-2023-33204
+Upstream-Status: Backport [ upstream: https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0 
+debian: http://security.debian.org/debian-security/pool/updates/main/s/sysstat/sysstat_12.0.3-2+deb10u2.debian.tar.xz ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+---
+ common.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+Index: sysstat-12.0.3/common.c
+===================================================================
+--- sysstat-12.0.3.orig/common.c
++++ sysstat-12.0.3/common.c
+@@ -1449,15 +1449,16 @@ int parse_values(char *strargv, unsigned
+  */
+ void check_overflow(size_t val1, size_t val2, size_t val3)
+ {
+-	if ((unsigned long long) val1 *
+-	    (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
++	    (((unsigned long long) UINT_MAX / (unsigned long long) val1 <
++	      (unsigned long long) val2) ||
++	     ((unsigned long long) UINT_MAX / ((unsigned long long) val1 * (unsigned long long) val2) <
++	      (unsigned long long) val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__,
+-			(unsigned long long) val1 * (unsigned long long) val2 *	(unsigned long long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+-	exit(4);
++		exit(4);
+ 	}
+ }
+ 
diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
index 2c0d5c8136..ac7b898db9 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
             file://CVE-2022-39377.patch \
+            file://CVE-2023-33204.patch \
            "
 
 SRC_URI[md5sum] = "9dfff5fac24e35bd92fb7896debf2ffb"
-- 
2.34.1


