Return-Path: <hprajapati@mvista.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA85CC6B00
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 04:11:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8637.1775103081813709126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 21:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CIAXnLSi;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ab39b111b9so1579475ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 21:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775103081; x=1775707881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dg3lvzrlyPvlcoNy0udjTWrQBhIM6cqzoEdLlQm89bw=;
        b=CIAXnLSiRfS2gsAfr8myMtHdUPfQBzzYsvf2Fyp2P5I214mLgZa6Wx5OmhCmewlCkL
         LTL7KJfsUTwCHIRwwZSgm99pGbWcyYr67mQ7ZL+ryzuU42BmoVVMG89BJUOHInPH2Wea
         LbRRzFDWXQ6h2DkbGYKMEEXjDm/nwctPPTwXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775103081; x=1775707881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg3lvzrlyPvlcoNy0udjTWrQBhIM6cqzoEdLlQm89bw=;
        b=Gj9i3UAbsiGVoxRq2KEhUk/9aDxSJGNplNYLmvuSe7YZHEeCOC+8xZe09NY+oOHVuj
         lb6RUeNwUw2Z0zhNkj7gEFmnuD2KhVyetrcn4iOwhzSnW9LLxserTVb5hJn/PuYs/RzI
         LnK7iuORnTH4puegF8GQ+tFSOtvr59lH6z+bG+Ss7vcaWqOltaPhI5xYJRtyDRW8/ufe
         XHEW+C4EGI5byyTX4DEK7BVqPYMdw66VG2O7xGyhH0Q3GZsS1Sw4znBeWfgv3Bgikg9G
         cXBwB0rvC25vKJ3qB88HYiYGIvM7/wFIIccz2BmrTKDNjr3qU1nEDxu2cf80Yl3Ls0MO
         KBFg==
X-Gm-Message-State: AOJu0YzpIjYxg9g8uZ/EOxoydofU0k1RbE7BfMfvtdW3XD82Kmpj/2mw
	j+SGs0aYvJJ792EOqffg7yYn6CjVSEocHdgX3n6yJEx5PFs6vfP+h69lx8Pg7gb+PDu01Me24iD
	nngGzW70=
X-Gm-Gg: ATEYQzzcDOM8PK8NqubxgERkS/r9Y06HLpExKihWJqoJPeEkmZd1xpuTdsg5bbTCZRM
	xMKHMCAebbmeu2QaHTx5DvwaM9ernTLsUji7PA6K7umWrVTwybEq9olrD8uorecdSnqsDMF9NoI
	XW531j4IUnWqifvTUxhCi0fx7J9JjeobkjfMTgOU929WxRUqDE9kF9P6RO120fMDa44+8oPPzoG
	WYxGNMMtB0InwqmnCZAES6MbGjlaSjd6FpSFSEQa9ZN4NnDhuTGUGlJJKeijgThZ2gJiHHpV237
	VuAc0q5/k+4lzZlX5i3KFDjEqooN0IZnmxWCYDsDXX+gOXU5Ajv8l8JyoAgBxsf2PKfOV06e8Jp
	dW7ilz9u+eX0v7pJZPmK8XGM4hAFVOQC1FX5EzUd8t21BMkZAws3KhrcjtGDQvg9YejEmiHhWOg
	XZG9JQ2tZSZFLmF4i4aFp+QoObgMA89eLlxj0=
X-Received: by 2002:a17:903:4b24:b0:2ae:ba5f:3ac3 with SMTP id d9443c01a7336-2b269ab2c51mr57341485ad.2.1775103080974;
        Wed, 01 Apr 2026 21:11:20 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497c117sm11923305ad.40.2026.04.01.21.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 21:11:20 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: Fix CVE-2026-33412
Date: Thu,  2 Apr 2026 09:41:13 +0530
Message-ID: <20260402041114.69320-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 04:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234471

Pick patch from [1] also mentioned in NVD report with [2]
[1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-33412.patch            | 61 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/recipes-support/vim/files/CVE-2026-33412.patch
new file mode 100644
index 0000000000..62daa308b5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
@@ -0,0 +1,61 @@
+From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
+From: pyllyukko <pyllyukko@maimed.org>
+Date: Thu, 19 Mar 2026 19:58:05 +0000
+Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline in
+ glob()
+
+Problem:  The glob() function on Unix-like systems does not escape
+          newline characters when expanding wildcards. A maliciously
+          crafted string containing '\n' can be used as a command
+          separator to execute arbitrary shell commands via
+          mch_expand_wildcards(). This depends on the user's 'shell'
+          setting.
+Solution: Add the newline character ('\n') to the SHELL_SPECIAL
+          definition to ensure it is properly escaped before being
+          passed to the shell (pyllyukko).
+
+closes: #19746
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
+
+Signed-off-by: pyllyukko <pyllyukko@maimed.org>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-33412
+Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/os_unix.c | 2 +-
+ src/version.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/os_unix.c b/src/os_unix.c
+index cf195e62e1..d767956b1a 100644
+--- a/src/os_unix.c
++++ b/src/os_unix.c
+@@ -7106,7 +7106,7 @@ mch_expandpath(
+ # define SEEK_END 2
+ #endif
+ 
+-#define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
+ 
+     int
+ mch_expand_wildcards(
+diff --git a/src/version.c b/src/version.c
+index 4f3912aedd..712a3e637c 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1684,
+ /**/
+     1683,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 289f31be70..fc9b4db055 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


