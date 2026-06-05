Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B0ACD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 10:07:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5171.1780654068050765061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 03:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AOTHTbLk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780654069; x=1812190069;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k9lfcsQJhnbruLYxP4y9VEcFh411ASuqJAXyP3vZP1k=;
  b=AOTHTbLk3q7AXeNUXjHORT1pasYRo0KVsSza2mvHdwmPz2pTVOQTo4YK
   ARpMaQsbGzEKKZMUKu3LzITMHqvT6cF3jQro/IMUgPGHWlkQZelnGdOuk
   IySMpKf8AQjkbDYdROi5od0h6dik79+SxkDWfXy9tm0kbE18XaIfE74Vp
   gwl671ZUWd1eMPdtMYA3412kh8tKVzckeasWKztdLnIJP81/VmYFeykqJ
   QaTTE9YQUpfdaCBObon9i7fDkC6LUIrWE5yHYJxhfagnh4KEss1zgt5hC
   k9qy2IT+J5/aL++6oWM0tpoD78Yw2qsU0YUAx7uJF2qI6BfrdaPb63IXR
   A==;
X-CSE-ConnectionGUID: hr+WEu0MTaanC7u7E/m87g==
X-CSE-MsgGUID: kF7Sifn3T6yAT7w6a0KJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="243096957"
X-IronPort-AV: E=Sophos;i="6.24,188,1774278000"; 
   d="scan'208";a="243096957"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 19:07:47 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 64C99C00404
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 10:07:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1909418591EC
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 10:07:46 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 58C922000A84
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 10:07:44 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim
Date: Fri,  5 Jun 2026 18:07:35 +0800
Message-ID: <20260605100736.13413-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 10:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238158

When vim-tiny was used in image, it lacks defaults.vim file which will cause following error
root@qemux86-64:~# vi
E1187: Failed to source defaults.vim
Press ENTER or type command to continue

So add a new patch to fix this issue.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...e_defaults-when-Vim-is-invoked-as-vi.patch | 61 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  3 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/0001-skip-source_defaults-when-Vim-is-invoked-as-vi.patch

diff --git a/meta/recipes-support/vim/files/0001-skip-source_defaults-when-Vim-is-invoked-as-vi.patch b/meta/recipes-support/vim/files/0001-skip-source_defaults-when-Vim-is-invoked-as-vi.patch
new file mode 100644
index 0000000000..7e7bfe0a6d
--- /dev/null
+++ b/meta/recipes-support/vim/files/0001-skip-source_defaults-when-Vim-is-invoked-as-vi.patch
@@ -0,0 +1,61 @@
+From 7dad45f751d4adbee480005a5546b32a97fdbfb2 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+Date: Fri, 5 Jun 2026 09:34:18 +0000
+Subject:[PATCH] Skip sourcing defaults.vim when Vim is invoked as
+ vi
+
+This is used only in the vim-tiny package to skip "source_defaults" error
+ E1187: Failed to source defaults.vim
+Press ENTER or type command to continue
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+---
+ src/main.c    | 7 +++++++
+ src/structs.h | 4 ++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index d4019ff51e..685fae2a02 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -2059,6 +2059,10 @@ parse_command_name(mparm_T *parmp)
+     }
+     else if (STRNICMP(initstr, "vim", 3) == 0)
+ 	initstr += 3;
++#ifdef TINY_VIMRC
++    else if (STRNICMP(initstr, "vi", 2) == 0)
++       parmp->vi_mode = TRUE;
++#endif
+ 
+     // Catch "[r][g]vimdiff" and "[r][g]viewdiff".
+     if (STRICMP(initstr, "diff") == 0)
+@@ -3426,6 +3430,9 @@ source_startup_scripts(mparm_T *parmp)
+ # ifdef USR_EXRC_FILE2
+ 		&& do_source((char_u *)USR_EXRC_FILE2, FALSE,
+ 						       DOSO_NONE, NULL) == FAIL
++#endif
++#if defined(TINY_VIMRC)
++                && !parmp->vi_mode
+ # endif
+ 		&& !has_dash_c_arg)
+ 	    {
+diff --git a/src/structs.h b/src/structs.h
+index 955b9f1001..09a0f7f7a8 100644
+--- a/src/structs.h
++++ b/src/structs.h
+@@ -4874,6 +4874,10 @@ typedef struct
+ #ifdef FEAT_DIFF
+     int		diff_mode;		// start with 'diff' set
+ #endif
++#ifdef TINY_VIMRC
++    int         vi_mode;                /* started as "vi" */
++#endif
++
+ } mparm_T;
+ 
+ /*
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b00b2602ed..1af8a1d6a1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'tiny', 'file://0001-skip-source_defaults-when-Vim-is-invoked-as-vi.patch', '', d)} \
            "
 
 PV .= ".0569"
@@ -32,6 +33,8 @@ inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
 
 CLEANBROKEN = "1"
 
+CFLAGS:append = " ${@bb.utils.contains('PACKAGECONFIG', 'tiny', '-DTINY_VIMRC', '', d)}"
+
 # vim configure.in contains functions which got 'dropped' by autotools.bbclass
 do_configure () {
     cd src
-- 
2.43.0


