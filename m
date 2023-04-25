Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3CFC6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 05:27:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.72391.1682400465713857639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 22:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B/SU1PqB;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a67bcde3a7so57844975ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 22:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682400465; x=1684992465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MX22Kwe3ZK0eCGkl4C/V8ugQkozQ3qNsqFDP/u1vpbs=;
        b=B/SU1PqBAPsa7M8EezasfgTNI5GsMgMPfkH3UtgSQxAlxSUVAoJJjG6tz7B/voJG0U
         j0/6hTMoxrHgiWYkFSTNWdBQrJKnixUKdkt0ch+HCVhxDj9jSZo/72EKkli1fijbHL7S
         LwBKW1qsfZx2u26XkUkQOPzllrzK7F42Fvida/kLYve+rwDBLUA2rU/VtQwF3rPFYqZ0
         16z1zeYLRGcLr9X8G2Ul25kEni5GRvfIf3U8OTZqoDZX+AKvOMuws3DLggUYM4473l8E
         ZVziZdY6Bex9fkkvfc0vJSMwwckFzclM7NI4LYbDPwE52jWEh+roBCp2do4YjfGcWYCG
         g8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682400465; x=1684992465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX22Kwe3ZK0eCGkl4C/V8ugQkozQ3qNsqFDP/u1vpbs=;
        b=hMs0LvxtovAdmFV2Y8vY1riaGSWQa6+zNG6fAVpf96djErGS7eVuqOGmKJksFSXinV
         sXZsMpSHT8LyrYY3E8mLephbkS7oqUfpvhoHZPuRVZo7i9JUk8Bopy9aPzcOgcUbqt8S
         CsvpEa3I8iNANzcNJkww3k6snraPvRdGY8swOH4/4SWav947d3H+C773TAjmrZjlVgwS
         /Z/BBzU4QQC6GIRBhG7hYgVRZHwqPwzS6nvYkhsNGhzc5CeEABpArRApkh/Y9HgtWOLn
         +GWDVUErr0jbEaIouiMh35LAMiBOJ0UKfpLmwQVGPnunfImkAuFa0y/OJmNhaHOGL8y0
         g1jg==
X-Gm-Message-State: AAQBX9e27u3lMsQRLGNIDJkkY2zPVbV4yk50dJ/5PCVGXLIRiq4I6FKe
	rfxhfB93GmrSE40jEPISvjI+2tp2KphIeg==
X-Google-Smtp-Source: AKy350ZA82ZwyLgXVm0e7F4W/yfL81DsQmtvBvDqMm35r8NkapPk+d5lHcGkX1RHn3BGItHt8QHOAA==
X-Received: by 2002:a17:902:ec8b:b0:1a6:9079:2bb3 with SMTP id x11-20020a170902ec8b00b001a690792bb3mr19382723plg.33.1682400464633;
        Mon, 24 Apr 2023 22:27:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5002])
        by smtp.gmail.com with ESMTPSA id jj21-20020a170903049500b001a69e002c7esm7378068plb.178.2023.04.24.22.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 22:27:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] quilt: Fix merge.test race condition
Date: Mon, 24 Apr 2023 22:27:41 -0700
Message-Id: <20230425052741.809185-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 05:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180371

This is consistently seen with musl and grep from busybox
Therefore backport a patch from upstream to fix it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.40.0


