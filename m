Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC74C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.40950.1684291495323129481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d7dmy/vx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-24dec03ad8fso295337a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291496; x=1686883496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SGoQa6rJWN6+6RvCZmBAyYbous7H9ogVxg7AKlUlss=;
        b=d7dmy/vxnWXjP8Da2mK3KsAfYwz2qdVTtwBKzQglgxUgPKOxI7y1xyxduU2fXp1Taw
         YU2ne7NvLrvRg61ihNSFhZfN3/XcSFGwsG6mHxKPYMxCwgnRuf3Bcwhw6+LYDOS6bjUo
         yw4IXmJUGVkAWnAYQoQLE3jBn5g3/Y/oBFtxJUgM/y89LqSxQ6SVBkIZ3NZQOhj1RhHe
         gaz0cAY/KQ6Ar9NGkiknLB9ac9ieziibegqhPgshQhvoPX8eaX6uTCWPARNpybBZ2z0d
         YrCwmo1mAkZgZ7WVdU+0Dcm6QZajksfbuLyjsv+q3CGJaR5X4pr2EDWj9XeCzj1nZvlP
         Bq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291496; x=1686883496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SGoQa6rJWN6+6RvCZmBAyYbous7H9ogVxg7AKlUlss=;
        b=ag877j8PudQ9r9JqdNecn9wmAA/FKSEn+QF0GSn2KMPLtdIvf7zU7042o1iiNbvH1O
         WX4D6Ha5KOIAixNKgHnmhNQxmU1MSDhUuEiz5zVvEsIvEXAQdG2rJuY9zTxTUXMsB9Za
         W5SBRtGNLlL7POWvHu6ZCPgeFXwiMIEagBOegIHO+OcdiS3oqNTnGijREs9MeSi7goTj
         8DwX1M2+VN8O6xYJJxfKWMIPT/b+onlKeXXZT/8zqN+ClBFIyRido0zmCr3VBOa62VEE
         IPXkjo5cIijXWG3QZcIR8/htfSAMIWgac8mWb9bUfAGMWAGm21wYMdCkoCR90q+dmIcu
         B4Yw==
X-Gm-Message-State: AC+VfDyJg3Efo0h0dJZFdzMXE4aw4GjtpEz7ryFMO5o2CGpAOK2v4jD/
	4R2itB5jdcZGNZcN2xsgO5a5TAL1QXf6FIk2Xys=
X-Google-Smtp-Source: ACHHUZ5B8uFf7rTFTZ8aFwhaQZrXk73vE+xpZ36VJfoH17lW2x1enO9kfiZlnw99n/nY6CEMP7bdvA==
X-Received: by 2002:a17:903:1248:b0:1ab:224b:d1fc with SMTP id u8-20020a170903124800b001ab224bd1fcmr53659964plh.41.1684291496162;
        Tue, 16 May 2023 19:44:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/13] quilt: Fix merge.test race condition
Date: Tue, 16 May 2023 16:44:29 -1000
Message-Id: <3be4c38b370fec42a569cb2cd22315efc860227b.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181435

From: Khem Raj <raj.khem@gmail.com>

This is consistently seen with musl and grep from busybox
Therefore backport a patch from upstream to fix it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 511bcd965af658e6bb0c61d9f2adb1af75af773b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 ...t-Fix-a-race-condition-in-merge.test.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index c93c38b83c..3374f4dfbf 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -13,6 +13,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://0001-tests-Allow-different-output-from-mv.patch \
         file://fix-grep-3.8.patch \
         file://faildiff-order.patch \
+        file://0001-test-Fix-a-race-condition-in-merge.test.patch \
 "
 
 SRC_URI:append:class-target = " file://gnu_patch_test_fix_target.patch"
diff --git a/meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch b/meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch
new file mode 100644
index 0000000000..01d4c8befc
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch
@@ -0,0 +1,48 @@
+From c1ce964f3e9312100a60f03c1e1fdd601e1911f2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C4=90o=C3=A0n=20Tr=E1=BA=A7n=20C=C3=B4ng=20Danh?=
+ <congdanhqx@gmail.com>
+Date: Tue, 28 Feb 2023 18:45:15 +0100
+Subject: [PATCH] test: Fix a race condition in merge.test
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Just like commit 4dfe7f9, (test: Fix a race condition, 2023-01-20),
+this fix a test race when stdout and stderr in any order.
+
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/quilt.git/commit/?id=c1ce964f3e9312100a60f03c1e1fdd601e1911f2]
+Signed-off-by: Đoàn Trần Công Danh <congdanhqx@gmail.com>
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+---
+ test/merge.test | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/test/merge.test b/test/merge.test
+index c64b33d..2e67d4f 100644
+--- a/test/merge.test
++++ b/test/merge.test
+@@ -39,8 +39,9 @@ Test the patch merging functionality of `quilt diff'.
+ 	> Applying patch %{P}c.diff
+ 	> Now at patch %{P}c.diff
+ 
+-	$ quilt diff -P b.diff | grep -v "^\\(---\\|+++\\)"
++	$ quilt diff -P b.diff >/dev/null
+ 	> Warning: more recent patches modify files in patch %{P}b.diff
++	$ quilt diff -P b.diff 2>/dev/null | grep -v "^\\(---\\|+++\\)"
+ 	>~ Index: [^/]+/abc\.txt
+ 	> ===================================================================
+ 	> @@ -1,3 +1,3 @@
+@@ -49,8 +50,9 @@ Test the patch merging functionality of `quilt diff'.
+ 	> +b+
+ 	>  c
+ 
+-	$ quilt diff --combine a.diff -P b.diff | grep -v "^\\(---\\|+++\\)"
++	$ quilt diff --combine a.diff -P b.diff >/dev/null
+ 	> Warning: more recent patches modify files in patch %{P}b.diff
++	$ quilt diff --combine a.diff -P b.diff 2>/dev/null | grep -v "^\\(---\\|+++\\)"
+ 	>~ Index: [^/]+/abc\.txt
+ 	> ===================================================================
+ 	> @@ -1,3 +1,3 @@
+-- 
+2.40.0
+
-- 
2.34.1


