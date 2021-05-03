Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.2320.1620083814539952745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 16:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cGR0GiAl;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id h127so787581pfe.9
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 16:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pdEohfHzvO0U0kXy317DLUTYAeiQL/oBUHpIK0Vn1Q8=;
        b=cGR0GiAlp27FN7D+eD4nAX01CG20F01RgGtFnRAskPYNW6L6B/nTeeFpAQAD0VnKLx
         JLjyzU61Cm+972GiOdNVKUxH42kRnJ2ETdLNkuBoU8xzlVyIx6FWsrOgZVIZq4a045ON
         iJVHi0jIEL5VmdQkQFWRlLPd+lZ71Wyd+w5tqhCZKv2d0Mm8tTxfWGxz7D7GwlhGq4P1
         bDWMSwCHCYnhRl1QeRIezB69IBwHz2c++1wQW/K7aX4+2peG6bAiSmdiANJ9n2KY1fuK
         vunOAe+FQWhRSDX8cRuGakNnFDbKkuHZpBHcEEELXGyv6WzdiLqGhEWZM6mnkz8PXZSt
         iM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pdEohfHzvO0U0kXy317DLUTYAeiQL/oBUHpIK0Vn1Q8=;
        b=YbHv0tG8+8wubxoZ4UMT0eS/lEXJnFMTGCsHzE1FFxbNImvWJDuMzn2VYRO065rJE7
         BvtdDZFmZSYiE8uO1Zgoyfy98rJH3lMRVBApSGY0siRZiLfkfIF++k+/cTZFsXAsfXH9
         zWSDsH+DgfPuMrbAe/XwOJ4TSeAxgmsZ1bun8PQAVs11Orkf2PqNkqrNNgcuzI7bb5RS
         N/t0EaFYgbOH7pQyzuW02SbcuRuwASsIN7Gj9HKayk49K1nuYDXeaZj8lkbC0xael5Um
         cqoDlqXQVT6ULml8GxudnqvGjyKZOf6AtgVOgsaGHA3RcAwQWOsjjKNVk1leM19h0lTR
         Xy7A==
X-Gm-Message-State: AOAM5327Q7H+IpHQ+3v+8QGq2g7mf01rciptznckvnkhaObwVLjoIJxR
	xdeZrptU10AaRkfcLS0CCiLpD/PLnmkvQQ==
X-Google-Smtp-Source: ABdhPJy1GRm4aYDG9B+ybg3GQJsrWNuWo1q+nf9Iy4U7V7vn10ezCmD5n6PXPSYiqsz7SVwe4R8udg==
X-Received: by 2002:a63:ff25:: with SMTP id k37mr387037pgi.360.1620083813609;
        Mon, 03 May 2021 16:16:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id t9sm800494pgg.6.2021.05.03.16.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 16:16:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Fix reproducibility
Date: Mon,  3 May 2021 16:16:51 -0700
Message-Id: <20210503231651.731010-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ensures that globbing results in same order irrespective of shell in
use

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-C-locale-when-calling-sed-on-glo.patch | 28 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.0.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch b/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
new file mode 100644
index 0000000000..e0a22c5bb3
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
@@ -0,0 +1,28 @@
+From bff7f16f7f41de8df67beb03722f235828ef2249 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 3 May 2021 15:48:19 -0700
+Subject: [PATCH] gen_build_files: Use C locale when calling sed on globbed files
+
+sort order is different based on chosen locale and also default shell
+being bash or dash
+
+This sets the environment variable LC_ALL to the value C, which will
+enforce bytewise sorting, irrespective of the shell
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/gen_build_files.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/scripts/gen_build_files.sh
++++ b/scripts/gen_build_files.sh
+@@ -4,6 +4,8 @@
+ # but users complain that many sed implementations
+ # are misinterpreting --.
+ 
++export LC_ALL=C
++
+ test $# -ge 2 || { echo "Syntax: $0 SRCTREE OBJTREE"; exit 1; }
+ 
+ # cd to objtree
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
index a92fa2fe5f..c334c42000 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rev.cfg \
            file://pgrep.cfg \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
+           file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.31.1

