Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB79E6B247
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88505.1766436301144965100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NaNsKy5x;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so5334368a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436299; x=1767041099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eh/Mt54+ZSvH8rU4Lmlvid8vUCf8yz5J+X5E1itIa0A=;
        b=NaNsKy5xCYNuL+yH3ETwl2Y8WK77nsbBYaTFl2hYxg1ipwqvc792iWaxpn8N42VSFl
         oIIBJxkbS2iDndMFrlCE7HR1zRJ9jRahvfMs2riHtMxpncqllIJNwni62kcZjqv4+6HJ
         mzITK1fvLOy5dUJy1XRRhUI3eD2X8yivRVWvewi9u+mOkG2NvUIkRTxyT/4WapaICyeK
         bZbixYRaZYiRKHflQVuUXoV+ujSJTae/b0Acbgq46TIWfwHxX74gt073kQ20kMiEbWb2
         LHkoup9eWglE7f4vhWxjfaJUcHx4yS1mEpOqkSB5TWwMuUm+pJsxguQREv4Lx9AZJAtd
         G7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436299; x=1767041099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eh/Mt54+ZSvH8rU4Lmlvid8vUCf8yz5J+X5E1itIa0A=;
        b=qA409aGFrOBfGPaNOKe13plNAXxIwkAxFpLxBEp1mUPt+W7def5KnT2dr7wiFbZY5v
         Ib3ufgVoy4xtMl3LE8GoP/6DLKyY07DjE5x+qBy4BYuJw0F21P7Lt/JUBiraBSxdNIgS
         RH3qXy6jVHFO09OmmQijkPkICt3LEbB5TqPcWxgK+EpiHTYC3TxP9uWyIgtPOrysPf4G
         oEdsyyLkfFAYPYc5swXifHP8ipTfqnwKaBFy5CYps6E9Q3tbbY+p8mOqV1MHj8IuES10
         JAS1ow6DBZ7sK5uZZ32DL6f5tUKRXhNg6WkyVAFrmJLJ6GOto5mxGimghDt2bgF0FIlc
         TRqA==
X-Gm-Message-State: AOJu0Yy62VGH2n3uSRvTR1iHmDLYpfbX/ZCLPZt9ZsI9FOGIiFj5qSYk
	WSFUl7ErBd5J7VHxKztCUw2nbLHyDaFXr6//brwQbISazRcS3GvmgCBkfSatbw==
X-Gm-Gg: AY/fxX7skoPrZHPUvyp4D2rzQuxk+4h3+rN5ceB8TihR6XVQJYK9IKG4vJ/eq/nU4fA
	u50Ay6RdC5y9WJr7rnl8IfK/uNGaBZt680Xg1K4XJ9oFfe8ChJXH+5f27uQBhBmpB3fmhnIwDqE
	TyhIB7UC60vWEVnic4PinDKwMuNEYyH7OwiChvUhg51vrvn06hiWKlkmt81ftXxYUwqpz0jFxhy
	2/vSsnsX3N+tFik5wxry0+RX11IQ4rseviOW9Lo6f9bCdZcWFww+9GkdeFO5EGPi4IuUoVo4s8z
	YpOyFahAgxKM4iakTy52Q+7Ct3eL32DMLFhlM5ldxHAbKJASQho32pbwMWerTIrpA4UXJEYRRue
	XV0xgOuO4uIXYZIYjdxKJ9uITBT4Cg5KilN5SiJ0kPvx1GzhdTkltk99OeK+sXzR9bAJxAtnFBS
	lZr3C5dKD+otziX6Dnmv5vm5tEcKdZKccP+QWVx2Kj2v1R0Fg=
X-Google-Smtp-Source: AGHT+IEoEPa1vwzoF75zbgtkIlKa0rCiy7bHsz7Tl6Y1BFUWPCh0zxwd6qK7+tpAMaMNGdT119klWw==
X-Received: by 2002:a17:907:6d06:b0:b71:854:4e49 with SMTP id a640c23a62f3a-b80371d4462mr1283035766b.56.1766436299249;
        Mon, 22 Dec 2025 12:44:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:44:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/15] util-linux: upgrade 2.41.2 -> 2.41.3
Date: Mon, 22 Dec 2025 21:44:20 +0100
Message-ID: <20251222204455.2284529-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228427

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...inux-libuuid_2.41.2.bb => util-linux-libuuid_2.41.3.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                | 2 +-
 ...d-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch | 7 ++-----
 ...ts-ts-kill-decode-avoid-using-shell-built-in-kill.patch | 7 ++-----
 ...kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch | 7 ++-----
 .../util-linux/util-linux/avoid_parallel_tests.patch       | 4 ++--
 .../util-linux/util-linux/configure-sbindir.patch          | 4 ++--
 .../util-linux/display_testname_for_subtest.patch          | 2 +-
 meta/recipes-core/util-linux/util-linux/ptest.patch        | 2 +-
 .../{util-linux_2.41.2.bb => util-linux_2.41.3.bb}         | 0
 10 files changed, 13 insertions(+), 22 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.2.bb => util-linux-libuuid_2.41.3.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.41.2.bb => util-linux_2.41.3.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c29011ad61..7280d48787 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            "
 
-SRC_URI[sha256sum] = "6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e"
+SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
index e3f9112192..ff596ff9d6 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
@@ -1,4 +1,4 @@
-From b3a1d92a9078fada31b2cf64b802edd616026766 Mon Sep 17 00:00:00 2001
+From 855dbea3e6b3c7ed9ba11eff38f888cc4b7678c8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 26 May 2025 15:24:16 +0800
 Subject: [PATCH] lsfd/mkfds-foreign-sockets: skip when lacking sock_diag
@@ -19,7 +19,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/ts/lsfd/mkfds-foreign-sockets b/tests/ts/lsfd/mkfds-foreign-sockets
-index cd94da799..76138a7a6 100755
+index cd94da7..76138a7 100755
 --- a/tests/ts/lsfd/mkfds-foreign-sockets
 +++ b/tests/ts/lsfd/mkfds-foreign-sockets
 @@ -30,6 +30,8 @@ ts_skip_nonroot
@@ -31,6 +31,3 @@ index cd94da799..76138a7a6 100755
  declare -A tcase
  tcase[NAME]="state=connected"
  tcase[SOCK.NETNS]=
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
index dece0e94b7..72daf7f8e4 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
@@ -1,4 +1,4 @@
-From d2eeccf36542d506b660641a07a44f3976772897 Mon Sep 17 00:00:00 2001
+From 514ff160e37c0cca5eee79892a6b65516a92de34 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 15 May 2025 16:44:33 +0800
 Subject: [PATCH] tests/ts/kill/decode: avoid using shell built-in kill command
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 03bc25ff6..57149899e 100755
+index 03bc25f..5714989 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -18,6 +18,11 @@ TS_DESC="decode functions"
@@ -31,6 +31,3 @@ index 03bc25ff6..57149899e 100755
  ts_skip_qemu_user
  
  ts_check_test_command "$TS_CMD_KILL"
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
index f4e2f9e745..ecd8d18213 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
@@ -1,4 +1,4 @@
-From c5d5e8873029d170fcab38a6fbd5d5a355574b9f Mon Sep 17 00:00:00 2001
+From 75c10a9edefc1597f708043e5561c2ff87305bf0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jun 2025 16:27:19 +0800
 Subject: [PATCH] ts/kill/decode: use RTMIN from 'kill -L' instead of
@@ -28,7 +28,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 57149899e..524b4e5e2 100755
+index 5714989..524b4e5 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -53,14 +53,19 @@ ACK=
@@ -53,6 +53,3 @@ index 57149899e..524b4e5e2 100755
  		else
  		    cat
  		fi
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index fe92afbc53..19c113febf 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 43030388e831642d36cb7b9d4b63755e9696714a Mon Sep 17 00:00:00 2001
+From 1f55d079887f0ef7857819e9c8a1def8180c69d4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 43a23a5..4a84531 100644
+index f664d12..8d9efaa 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index ebb32a6845..31d00f7983 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 378998bf82e3b6ff46569077b29f95e72b734681 Mon Sep 17 00:00:00 2001
+From d521ca39a781873882b52ee52f46294596f41848 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a5d9102..43a23a5 100644
+index d32b11d..f664d12 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index fa4ae02bc3..1c9e0ce4f2 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 728c2abd889d225535008c3e7a1eef4b8a0aeea2 Mon Sep 17 00:00:00 2001
+From 05b495cbe9ffa7b45d9a383610aa95e31f2ab1e3 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ad23001cfa..1763c47da0 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 18bf6aded9b2a75185ae4b23a41cd2e4322c5e31 Mon Sep 17 00:00:00 2001
+From 4c0e374ba6c64d07da8acba5476cf8638c54820d Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.2.bb b/meta/recipes-core/util-linux/util-linux_2.41.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.3.bb
-- 
2.47.3


