Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.37535.1628865167446843939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=K9++p4KD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id a5so12217279plh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pR5oW3bfewpu19K7rieXId6HjdrxdBgXGj7JTx9OTjo=;
        b=K9++p4KDV+awMv5qWYP676kKs84ATyaMK5SyGLC1VzzACjyUfsc6MGiXJralBoRaux
         NILRnvyU7hCftc5czCBi3xTI1kfQ4N/DlgWDG2S8CRZXCMqpDcuEJVt8nf4DrodF8IOD
         t2EA23i5qtp4r3T41hTUsB6/wQZJ0+V3NwolbvtTdQa3u9c8hZBcAJwRSwWHf7LCLujE
         PNKZwG3y+FYPlqs4lD84C2EwD/J2nEsCkb9UHwwVJvi8F4hTQZCftSJz4fvL41IkTcM/
         LNjF3M6peqfFoqAAfMx49RMl/NNtoKbt0MWFTy5i6VNXPMzc19G1QOOfTN5PD1fTg5ay
         fYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pR5oW3bfewpu19K7rieXId6HjdrxdBgXGj7JTx9OTjo=;
        b=EljqnycI+wFYK7gH2I7WAKJVPJ7PNyPhRWPc5IovcfuHx2nLAhcnGkjkboDUnfOhPO
         nIerWNilazmOT3VZJUo0CpVbSW4a/RPZ8nyg8yb7crRtt/aJ3PCvBnk9aOe4xO2hZtGT
         iqsmZOAYto8M00VspJ6rfJxSBEMnpUvARJ1z2japJzeeDPqWPiuKlcB/ZxD7KebXGuRm
         BVHjft0EFXNYF1l9xIlcRF/SlBPy9EHFH/KIBQhrnzggeMIwvUUsKlA6CCRNDRNwUkuv
         /IObGWDxq6qp9ZVm5q0jcCJojqqvf6rsuAzd7op3hqhjVhbz0qtp6ZT1QF+RvvnYy9qQ
         VPjw==
X-Gm-Message-State: AOAM5327g1T7NtEfu9WVcEFfkqCqZ6Cj0bojP//wnDNEfVz1JWqcsTGr
	zHKqKU73TRFMwMNXZDE4abScXKS41zP6NfCo
X-Google-Smtp-Source: ABdhPJx50hw59lDsiJQhU1PH0OZfPLgWsFtFOzs4SiZUw0N3eSrGwMdCXNobWI/XAaCPR9xZYY4o7g==
X-Received: by 2002:a62:2c51:0:b029:329:932b:9484 with SMTP id s78-20020a622c510000b0290329932b9484mr2654873pfs.13.1628865166601;
        Fri, 13 Aug 2021 07:32:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/17] e2fsprogs: ensure small images have 256-byte inodes
Date: Fri, 13 Aug 2021 04:29:57 -1000
Message-Id: <bfd621782d7f31ad6a4fa13b6f4995a26fa380b2.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

e2fsprogs calls filesystems larger than 3MB but smaller than 512MB
"small", which has some implications:

- blocksize 1024 instead of 4096
- inode_ratio 4096 instead of 16384
- inode_size 128 instead of 256

The outcome of the inode size dropping to 128 bytes is that they cannot
store 64-bit timestamps, so are not Y2038-safe.

A previous attempt to solve this problem[1] changed some of the canned
wic files to pass -T default to mkfs.ext4, but this only covered wic
images and not traditional images.  Also, actually small filesystems,
for example a core-image-minimal, will happily be tens of megabytes and
with the "default" options will result in an image which runs out of
blocks before it runs out of space:

mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system

Considering that many OpenEmbedded images are in fact "small", being
2038-safe is worth the marginal increase is disk usage.  This patch
alters the small configuration in native builds so that it also has
256-byte inodes.  Target is unchanged so that standard behaviour is
maintained outside of the build.

This is actually the same underlying patch that Mathieu Dubois-Briand
sent in April, but the wic change in [1] was accepted instead. I believe
that is the wrong approach and this approach covers more cases.

[ YOCTO #14478 ]

[1] openembedded-core eecbe62
[2] https://lists.openembedded.org/g/openembedded-core/message/150298

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ab0ae83a24ee99e69f8ac54256b253a122aef8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../e2fsprogs/big-inodes-for-small-fs.patch   | 22 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.4.bb             |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
new file mode 100644
index 0000000000..caeb560d32
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
@@ -0,0 +1,22 @@
+Ensure "small" file systems also have the default inode size (256 bytes) so that
+can store 64-bit timestamps and work past 2038.
+
+The "small" type is any size >3MB and <512MB, which covers a lot of relatively
+small filesystems built by OE, especially when they're sized to fit the contents
+and expand to the storage on boot.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
+index 01e35cf8..29f41dc0 100644
+--- a/misc/mke2fs.conf.in
++++ b/misc/mke2fs.conf.in
+@@ -16,7 +16,6 @@
+ 	}
+ 	small = {
+ 		blocksize = 1024
+-		inode_size = 128
+ 		inode_ratio = 4096
+ 	}
+ 	floppy = {
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
index 439928e433..2eae9cd892 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
+                                file://big-inodes-for-small-fs.patch \
 "
 
 SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
-- 
2.25.1

