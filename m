Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5ABC77B7E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:51 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.76.1685068171447257329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nsFgh0YU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53f04fdd77dso112928a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068187; x=1687660187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsJ4Gd0blhwham31+ZCp/xbohAuic8e+NQa6aOXN/mI=;
        b=nsFgh0YUYD9WXOBTSd5NIgatm7qP9lZqqHtL20iW+uSB/eh+he5jNrD//otOcrXZEJ
         JWM2+Q1+cgOI1b0gsJMVOJWJ0r5T1g1JMg486HU34bCYZrRZu55h29dD0qKJaY8f8LMj
         Wf7xqh60IoI1idaCVonDoh2XXsucAELYuXVgMLZX+4WHSPenEYQir560RW3jXUXYmeDb
         2J48fzL9GTSWlzdVyjjmQ1FFQ00AVRzEHC+8MsME3QUB7aBTRv4izpZGt/4cHnB1SfiF
         Hxc00BwT1KfdBMsS2JqVPPLPag5ea7XlOocjCVuETPN2F9UP6WkWFSIXO6u+MIq61yfW
         A1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068187; x=1687660187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsJ4Gd0blhwham31+ZCp/xbohAuic8e+NQa6aOXN/mI=;
        b=ERQ+IAk892AAgatAt2S4PGQTCzRxaWRKeYvl7HczQEQj3scGX2AB3xPFT8pr2dkeVb
         MrB4Paot2iPqHw/hTx218nSq9H3aRXtUk1I/KVSA+k7dQbNTJEE2DGxvzKQZxn/rBv2B
         RRsk8xW3A+uiuoNR9e0rrUl3RBdciaJblLVakh+9ifDsV2F89SPNy663m72HUYWubc9L
         wm1PwsaMexM+6hG3K9+9+YOnBIvh1QlCz5vUaC0rlrOOw1ed8YT7DnTan7cKEdv4GdWP
         TzwWs02zFukX2NS1BT8iMKDoPWZZinuRnIw5IeTeR/HmQ2juC/J2ZpOO/AAVIHt3BUqt
         Xc5g==
X-Gm-Message-State: AC+VfDxzXADz7MkIvuDKyCKkiCAJU5F8CEDU2CmGHqyakswz+Qp6tpuY
	u2O5MY2YQ9eG6RxZ6akceiCrBIDJFLWU0W8/x0I=
X-Google-Smtp-Source: ACHHUZ4DHr6r8a0Td6SrIfshfsGYZSwL4OuNQruRTBkG3BOJe6V9AQGQE+3v8GTByI/AUOnsHjyEzA==
X-Received: by 2002:a17:902:e5cc:b0:1ae:2c87:f771 with SMTP id u12-20020a170902e5cc00b001ae2c87f771mr898975plf.20.1685068186868;
        Thu, 25 May 2023 19:29:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/21] quilt: Fix merge.test race condition
Date: Thu, 25 May 2023 16:29:02 -1000
Message-Id: <769290794fc23894211c56b1878a73634fd20283.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181746

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
index fce81016d8..72deb24915 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -14,6 +14,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
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


