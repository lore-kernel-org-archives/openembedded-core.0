Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CE0CD98F6
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 06:32:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37291.1782109967935196803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 23:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Eimei3h+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782109970; x=1813645970;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mwcgiM5E+UaqNnCn7IkRyvuHoB8eEQ5tt1LGFzg9aIs=;
  b=Eimei3h++t2prxIQKLEHrRve4ng7fTEj7HsZJzIm5tqq8usaplo6a+hN
   Q3Wvod6aj8R/5kuSGrCp4mm6aXrMCSA8vGVu6ClUNYkHrA8rPED6rkOYL
   0z1L/uAQg3OGdy8AsqZXkikI4VLV42hN6e5BV9wwZ8HvXBDkG8w9qKd8T
   n8mDOl6Pp9yZQN0rYqLhsAJOLD9jRJs6QCItWL62fx/rH6ZDysXrvka2M
   omV/VaIKHrrwL4Zi4ofhF5MLrjXvCKYINakK0P2IFZU00ikcBGZUfbx46
   AqJzHVA24Lv1lcMrwIkmZSyrRMGoqiU0Zk2cF4jZeyAmOT5570XzXTyVA
   A==;
X-CSE-ConnectionGUID: ff6HV+3IQj+i2VNO/pMATA==
X-CSE-MsgGUID: Z55iIfIpSmqDxkpBRqt8xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="244825956"
X-IronPort-AV: E=Sophos;i="6.24,218,1774278000"; 
   d="scan'208";a="244825956"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:32:47 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BA2161002BA2
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:32:44 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 747198D29EE
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:32:44 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D4DA410000BE
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:32:42 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] vim-tiny: bugfix for lack of defaults.vim
Date: Mon, 22 Jun 2026 14:32:18 +0800
Message-ID: <20260622063219.663-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239269

When vim-tiny was used in image, it lacks defaults.vim file which will cause following error
root@qemux86-64:~# vi
E1187: Failed to source defaults.vim
Press ENTER or type command to continue

So add a new patch to fix this issue.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...faults.vim-when-Vim-is-invoked-as-vi.patch | 53 +++++++++++++++++++
 meta/recipes-support/vim/vim-tiny_9.2.bb      |  2 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/0001-Skip-sourcing-defaults.vim-when-Vim-is-invoked-as-vi.patch

diff --git a/meta/recipes-support/vim/files/0001-Skip-sourcing-defaults.vim-when-Vim-is-invoked-as-vi.patch b/meta/recipes-support/vim/files/0001-Skip-sourcing-defaults.vim-when-Vim-is-invoked-as-vi.patch
new file mode 100644
index 0000000000..e1d240e7d8
--- /dev/null
+++ b/meta/recipes-support/vim/files/0001-Skip-sourcing-defaults.vim-when-Vim-is-invoked-as-vi.patch
@@ -0,0 +1,53 @@
+From 3360bfc9074130155996f7aaab2b2a6c33a62b11 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+Date: Mon, 22 Jun 2026 10:59:18 +0900
+Subject: [PATCH] Skip sourcing defaults.vim when Vim is invoked as vi
+
+This is used only in the vim-tiny package to skip "source_defaults" error
+ E1187: Failed to source defaults.vim
+Press ENTER or type command to continue
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+---
+ src/main.c    | 3 +++
+ src/structs.h | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index d2fe22ebe5..e7ac4bd1e2 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -2065,6 +2065,8 @@ parse_command_name(mparm_T *parmp)
+     }
+     else if (STRNICMP(initstr, "vim", 3) == 0)
+ 	initstr += 3;
++    else if (STRNICMP(initstr, "vi", 2) == 0)
++        parmp->vi_mode = TRUE;
+ 
+     // Catch "[r][g]vimdiff" and "[r][g]viewdiff".
+     if (STRICMP(initstr, "diff") == 0)
+@@ -3433,6 +3435,7 @@ source_startup_scripts(mparm_T *parmp)
+ 		&& do_source((char_u *)USR_EXRC_FILE2, FALSE,
+ 						       DOSO_NONE, NULL) == FAIL
+ # endif
++		&& !parmp->vi_mode
+ 		&& !has_dash_c_arg)
+ 	    {
+ 		// When no .vimrc file was found: source defaults.vim.
+diff --git a/src/structs.h b/src/structs.h
+index 8cb9b3f91d..96da090f4d 100644
+--- a/src/structs.h
++++ b/src/structs.h
+@@ -4913,6 +4913,7 @@ typedef struct
+ #ifdef FEAT_DIFF
+     int		diff_mode;		// start with 'diff' set
+ #endif
++    int         vi_mode;                /* started as "vi" */
+ } mparm_T;
+ 
+ /*
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-support/vim/vim-tiny_9.2.bb
index e4c26d23f6..658f627d7d 100644
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb
@@ -2,6 +2,8 @@ require vim.inc
 
 SUMMARY += " (with tiny features)"
 
+SRC_URI += "file://0001-Skip-sourcing-defaults.vim-when-Vim-is-invoked-as-vi.patch"
+
 PACKAGECONFIG += "tiny"
 
 do_install() {
-- 
2.43.0


