Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.5092.1623919772156466601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 01:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pk0LfOJN;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id g20so8617089ejt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7WhUvmvBywG90drql6hzvHzfRugwNjnNasxBThOESM=;
        b=pk0LfOJNRqmzIZ9zo+ffUJIadEc9mrRHTgZUNxPvDBPy6z4dQPJQXsaGB2EcYdyopk
         Y1M7jXfFTu6QrLYtf0jm3Auo7UN+MraMVCYik5Sbu43Dghvc8vw6ONPTyMwV4vxJg6v1
         DMc0Ggm7hDUjQFgBIW1cEFvbvBl+xuwQUw8KpcIDhhBEiLy2UaMyip5cJznVtZf2w3Vy
         6zNUqtvjKIrILOYOZeJKQ8I7Ap6K2GNYIe61o2zYRga8oFyi3f5XoZQD/1DeWQhAAZX3
         0cd0c7BtdPVRZwlVk1wgoz89ObhwNTNpPfpecq7mz9mLxVxa6LM5N8UbvfmLKj1eX5X4
         HMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7WhUvmvBywG90drql6hzvHzfRugwNjnNasxBThOESM=;
        b=nGlZbgGScOMz+KB1ChPsjBZTB2zwrBM22kOCNrOYJo/kyN5iWIV+jgQmRAKchWcr2M
         hSPGh/L54ZfjF0FpxiSCmp1M0Ll5mAgOzgLXE704Pt/pJGp3jd/2evT2EjCLHW4Fazkd
         OD0qb7jRUe38K6wd44nKbt+65Smf18cEiZ+pxpUROcIOqT8ei2M8m7WCiWpnvhXuw836
         6V3qJAHRvtBBw0QN0i9ii+vt9/sXEvd/oOLbkUW9WCNYTqapKDlX2tl6dllL+1kmLqt2
         nGBN5omAvcsRskM1PK+3rLTyQtmrLbuKTsTu0fJIpX2EOQ7/PQ1bbQRlQGDj89lP7aLh
         Fexw==
X-Gm-Message-State: AOAM531amQfbAq5DW6NggPFSZl2exTUfW2BDtUUKCfGUiPErR6zvznJ6
	8CQwe5SzA2gE6n9PHlhL0qhRCePc6gcofw==
X-Google-Smtp-Source: ABdhPJxzLbjP4nGrdXap0YFRV5+kec5CvG67JTnjLmK1zrdY689NXBtLeqZzrC6ZFCpretkwxwNN/A==
X-Received: by 2002:a17:906:fcaa:: with SMTP id qw10mr4016191ejb.233.1623919770420;
        Thu, 17 Jun 2021 01:49:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id bn7sm3391333ejb.111.2021.06.17.01.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 01:49:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] util-linux: backport a patch to address mkswap hangs
Date: Thu, 17 Jun 2021 10:49:24 +0200
Message-Id: <20210617084924.1794989-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...74160b96498d672e3652827aa7e6d7f3a120.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6a7a6a968f..9d7d8a23aa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,5 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://8a3a74160b96498d672e3652827aa7e6d7f3a120.patch \
            "
 SRC_URI[sha256sum] = "bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5"
diff --git a/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch b/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
new file mode 100644
index 0000000000..a5bb00ab65
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
@@ -0,0 +1,29 @@
+From 8a3a74160b96498d672e3652827aa7e6d7f3a120 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 15 Jun 2021 12:04:43 +0200
+Subject: [PATCH] mkswap: fix holes detection (infinite loop and/or
+ stack-buffer-underflow)
+
+Reported-by: Brian Lane <bcl@redhat.com>
+Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=1971877
+Fix: https://github.com/karelzak/util-linux/issues/1348
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ disk-utils/mkswap.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/disk-utils/mkswap.c b/disk-utils/mkswap.c
+index 27374fd72..c45a3a317 100644
+--- a/disk-utils/mkswap.c
++++ b/disk-utils/mkswap.c
+@@ -267,6 +267,8 @@ static void check_extents(struct mkswap_control *ctl)
+ 			return;
+ 
+ 		n = fiemap->fm_mapped_extents;
++		if (n == 0)
++			break;
+ 
+ 		for (i = 0; i < n; i++) {
+ 			struct fiemap_extent *e = &fiemap->fm_extents[i];
-- 
2.31.1

