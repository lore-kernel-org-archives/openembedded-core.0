Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B748FC36013
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.43712.1742834033376785079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gktxDelc;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227aaa82fafso33997195ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834033; x=1743438833; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXZdrQRG8HT5NsHgpQjWuO88dLDjKetpeO1oBDqQh6w=;
        b=gktxDelcStW6RthZ+bvFitSOGATySUwrM7wmCqJiHMpR0WrO6078UgBcIuzlEYQ8jC
         efE1u5Q5M7ExEw5m/5WQofiSYUnRZGggPePYKWY286sVSBvNNpbkm80K7lpXpxVGqd5j
         CyMo5dNRQUxS3CPPjWRavQQuRZ1OGOucoebiMmbMV/MTXRmsd0t8ZZZADn/lGCG/CQ9W
         iK7A3CLTzal709U1PZaoBGsZjteeXhlRULiCFHDCwpefi5b4dfQtSpGJ/zKjGn1j7KVI
         k33g6iB9mc8TNK/LWXl06UC857rHask80J8UbKKwirmbRWKoaaPv6Vsw/3I1+dLaSsIu
         PV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834033; x=1743438833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXZdrQRG8HT5NsHgpQjWuO88dLDjKetpeO1oBDqQh6w=;
        b=BVkZTHvkLbyCTCD7dql7lgSuzFJzq+KbdBjiBgdlHOaHcL7IxZeXjKOaftA+tXANf8
         i3+OXQ/8DVU1Rm32pN+K00RmktKyIhwhbys2kMK/khErVtlEySl6RYgXl9rCUhNQjZGN
         6754ujM2cL5jJV8hJ0Sh2JfaoUAXqxa+oHW68uPJmUpItK53TPHjoZAgr8+FHL4hlUEV
         jdkZ31UxReAkKEkq/0T4kO+NaMncUXlNPFdYAkKt557WROoA8Hw20/WemsjWbGee8OAt
         8fu6K25cGSiHPngayl1xmsGmaUuOa1ZwEpbPnB5T+NyJL1uat9XbUazbk3+tq9FVtf3b
         NOFA==
X-Gm-Message-State: AOJu0YwOyFS2hAeppIonvpIdU600S631sQCyAzfzQh5rKyB4BpTLUaQN
	Z03uL6wNqniwo1Y19KjVGZeo5T82IzJzLD7FpY4gqPshcOglQXdP
X-Gm-Gg: ASbGncv9V35gELOGU8pPz8chUAPviqpoYppGNoW8mNUraNA/y+N45X7yxWUsNMoDyLm
	SPeZvxLeQsYMLUtleGvNWBKw7gjk0PmeA5Zr5GK56KZrb/WOHjLp6kg2EnuITaURU37o5oymG7s
	NiTscT5nSunSQWMXVmW4SvcRC7VUKdxJNXfhoDiLGnKR3F1vhmLVFDldNqZhX4Era8xcwcv3NNn
	BgewPv+W3leTrtzBKcltA+XgcM0zzdofaRCv9GK5DZchFGHe2ixjpNN8p+3FYklsweRCTm5iu0w
	x8KCmuUREOpMJyGqQLGocagxNyEMComp+uC3
X-Google-Smtp-Source: AGHT+IE1fD2NlyWq3idn9+phqFpN5VeR5LB+LghkLc8EpS5lHdylX4xKlkR9BCQraDL9ddjk3zs3pA==
X-Received: by 2002:a05:6a20:2589:b0:1f5:852a:dd8a with SMTP id adf61e73a8af0-1fe4300d7afmr19730491637.28.1742834032529;
        Mon, 24 Mar 2025 09:33:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:32 -0700
Subject: [PATCH 11/21] parted: Fix build with GCC 15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-11-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213543

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...4-PATCH-parted-fix-do_version-declaration.patch | 40 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.6.bb         |  1 +
 2 files changed, 41 insertions(+)

diff --git a/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
new file mode 100644
index 0000000000000000000000000000000000000000..a8ea7ec4f7a3eed324c7c247fa850252d1929554
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
@@ -0,0 +1,40 @@
+From eb6bb2e8dfc78ca1a187d07ea29b23a805c61794 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 12:22:22 +0000
+Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
+
+With gcc 15-20241117 compile fails with the below error, update the
+do_version declaration to match the header in command.h
+
+../../parted/parted.c: In function '_init_commands':
+../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
+ 2469 |         do_version,
+      |         ^~~~~~~~~~
+      |         |
+      |         int (*)(void)
+In file included from ../../parted/parted.c:28:
+../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
+   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
+      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ parted/parted.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parted/parted.c b/parted/parted.c
+index 3abb52f..fc2aeba 100644
+--- a/parted/parted.c
++++ b/parted/parted.c
+@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
+ }
+ 
+ static int
+-do_version ()
++do_version (PedDevice** dev, PedDisk** diskp)
+ {
+     printf ("\n%s\n%s",
+             prog_name,
diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-extended/parted/parted_3.6.bb
index fae35815be97d310631adbf790866a7997539522..6fc2cb3b3aa8794218682a1e292a7488936e63aa 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch \
            file://autoconf-2.73.patch \
+           file://0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch \
            file://run-ptest \
            "
 

-- 
2.49.0


