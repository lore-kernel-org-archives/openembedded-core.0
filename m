Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7855DC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:10:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.108047.1673367045948547282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SwKQmjLR;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so17034488pjj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 08:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zD+vyBFLa7X1AfhHHQJmoEEkXiVjmiSmsba0ANLGxPc=;
        b=SwKQmjLRSOixZh6zStBcaku9SJBVZlPZ6QeKA1mIh9TC/kIjltHkwLijW1YtVgp9qO
         nJ1UVOaZe25HFTItYovSg+2uTjUs1U4pSEOMjc2ZZk7x9bHSWO7P4qKbCa/P5aEyABKd
         TPhel6q1OgrCce+8QNqCXt8H6tvX0vEjk/gW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zD+vyBFLa7X1AfhHHQJmoEEkXiVjmiSmsba0ANLGxPc=;
        b=lEJxG4fk8fRCEm89Kiiam1Q4zfnUcvsG92j0L1hQ7p4/yqkT+tANdR9Z25ILaZjEuP
         B7h9prbhC1zfjBZ2zzjumlUoeQOpd9BROj+mfHDrj4BjFZTSsAmqU+HTQWZCjWFrXK/A
         8/S31LgZeh2q0zHQXs+cy4Heuc+ZYLc8MxbKLyavleHLjKoPE0QDo0ds8Eko/JZqirqe
         i10zzpQuAEw8VS2dki3aai+DNdDXv0WaUEPXSaJQc3YRGZis/mwsFxUIOArFyIq/MgTu
         29zxURABjJcFR1Gz5W5ZhPgHKUIgMHHLL75v5jXg0ytJgKr7r3ZEaxPUZVEOTHeG7f00
         VSMA==
X-Gm-Message-State: AFqh2krAHE+Kz9/S1xTPguQaClW/an1bXarIt4XugIQ39lZ4nyD0ojt8
	4pK5wPnqWvGsXwEc8xmb4TPZKeqlEBkl58x5
X-Google-Smtp-Source: AMrXdXv5Kkua35Mjo01qkLlvTomyN1mq+MzMDFet7zt9rULAjAZCPvRcW7oK8A0iRRwMGdG5HgbRxg==
X-Received: by 2002:a17:902:e5cd:b0:192:9140:ee76 with SMTP id u13-20020a170902e5cd00b001929140ee76mr69160139plf.37.1673367044747;
        Tue, 10 Jan 2023 08:10:44 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.80.103])
        by smtp.gmail.com with ESMTPSA id o9-20020a170902d4c900b00192cf87ed25sm8360361plg.35.2023.01.10.08.10.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 08:10:44 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 10 Jan 2023 21:40:38 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] vim: Backport fix for CVE-2023-0049
Date: Tue, 10 Jan 2023 21:40:16 +0530
Message-Id: <20230110161016.28885-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 16:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175718

Upstream-Status: Backport from 'https://github.com/vim/vim/commit/7b17eb4b063a234376c1ec909ee293e42cff290c'
CVE: CVE-2023-0049

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../vim/files/CVE-2023-0049.patch             | 62 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2023-0049.patch

diff --git a/meta/recipes-support/vim/files/CVE-2023-0049.patch b/meta/recipes-support/vim/files/CVE-2023-0049.patch
new file mode 100644
index 00000000000..d8155f5fabb
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2023-0049.patch
@@ -0,0 +1,62 @@
+From 7b17eb4b063a234376c1ec909ee293e42cff290c Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Wed, 4 Jan 2023 14:31:49 +0000
+Subject: [PATCH] patch 9.0.1143: invalid memory access with bad 'statusline'
+ value
+
+Problem:    Invalid memory access with bad 'statusline' value.
+Solution:   Avoid going over the NUL at the end.
+
+Upstream-Status: Backport from 'https://github.com/vim/vim/commit/7b17eb4b063a234376c1ec909ee293e42cff290c'
+CVE: CVE-2023-0049
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ src/buffer.c                    | 2 ++
+ src/testdir/test_statusline.vim | 7 +++++++
+ src/version.c                   | 2 ++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/src/buffer.c b/src/buffer.c
+index 98568987894e..40168226160c 100644
+--- a/src/buffer.c
++++ b/src/buffer.c
+@@ -4617,6 +4617,8 @@ build_stl_str_hl(
+ #endif
+ 	if (vim_strchr(STL_ALL, *s) == NULL)
+ 	{
++	    if (*s == NUL)  // can happen with "%0"
++		break;
+ 	    s++;
+ 	    continue;
+ 	}
+diff --git a/src/testdir/test_statusline.vim b/src/testdir/test_statusline.vim
+index a829597655bf..23613bfed37b 100644
+--- a/src/testdir/test_statusline.vim
++++ b/src/testdir/test_statusline.vim
+@@ -440,6 +440,13 @@ func Test_statusline()
+   set splitbelow&
+ endfunc
+ 
++func Test_statusline_trailing_percent_zero()
++  " this was causing illegal memory access
++  set laststatus=2 stl=%!%0
++  call assert_fails('redraw', 'E15: Invalid expression: "%0"')
++  set laststatus& stl&
++endfunc
++
+ func Test_statusline_visual()
+   func CallWordcount()
+     call wordcount()
+diff --git a/src/version.c b/src/version.c
+index df02bb87b87d..4ccbd537abe3 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -695,6 +695,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1143,
+ /**/
+     1142,
+ /**/
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d86841efaa8..81c07bfefa8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+	   file://CVE-2023-0049.patch \
            "
 
 PV .= ".0947"
-- 
2.35.5


