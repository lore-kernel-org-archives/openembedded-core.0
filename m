Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CCECA0FF0
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 02:41:08 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6011.1756262458392810967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 19:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lY21mNzD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756262459; x=1787798459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c2jAezorpnCy9kwIkeYouA4YQjTRyIklezN303Gyz6s=;
  b=lY21mNzDvvxYphFWTl9Vy8E72WtPbWyhXO2fV+8BvzrGDgOHjsx3WZ6d
   G0UWQ9PjHP7w/usEz414P98CWMc2fxnG0QpTO950Z2YKQiqGCC+KbHG0d
   gMB3R4C7uY+eOtpJSM6Jpuj9+rkM9dIgcbwLx7QNjHQDl8hhDxhvMnRPr
   DxOrZNkMs5QL/Ep4zT+uxs0ZswEVB/l3wbpu5y1ew1ar6gk+hIOMJDNEK
   MknrFp8aSlWYQubRVn9s/kZ4nvjrg7ovJaocH1yaqjH4bGTGzcBZ/05/h
   yOSUWqkjbF0cZ7dJDJAlFMNIztQXU3DiNqpS2CJzASW+Tv2Rs0oMdQxEm
   A==;
X-CSE-ConnectionGUID: 5C0grjjuQvOxQ532K14OTw==
X-CSE-MsgGUID: Ez/Xl6mTSS+413Q1Ck2gBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="210707658"
X-IronPort-AV: E=Sophos;i="6.18,214,1751209200"; 
   d="scan'208";a="210707658"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 11:40:57 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 833021C00096
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:40:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 360CDC000AE
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:40:56 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 17C611803FF0;
	Wed, 27 Aug 2025 02:40:54 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8216D1A0071;
	Wed, 27 Aug 2025 10:40:50 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] readline: backport a patch to fix issue that readline can't work with samba
Date: Wed, 27 Aug 2025 10:40:39 +0800
Message-ID: <20250827024039.1377-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222482

smbclient can't accept input after readline upgrade to 8.3
| root # smbclient //192.168.2.16/test -N
|       Try "help" to get a list of possible commands.
|       smb: \>

similar issue has been reported:
https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00011.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../fix-for-readline-event-hook.patch         | 54 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.3.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch

diff --git a/meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch b/meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch
new file mode 100644
index 0000000000..f3b9d88d15
--- /dev/null
+++ b/meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch
@@ -0,0 +1,54 @@
+From 15970c431517a046099d8294c91d778b1da9b29d Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Fri, 11 Jul 2025 11:51:15 -0400
+Subject: Readline-8.3 patch 1: fix for readline event hook
+
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/?id=15970c431517a046099d8294c91d778b1da9b29d]
+---
+ input.c    | 6 +++++-
+ patchlevel | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/input.c b/input.c
+index e6a39e2..3383edb 100644
+--- a/input.c
++++ b/input.c
+@@ -261,13 +261,16 @@ rl_gather_tyi (void)
+   input = 0;
+   tty = fileno (rl_instream);
+ 
+-  /* Move this up here to give it first shot, but it can't set chars_avail */
++  /* Move this up here to give it first shot, but it can't set chars_avail,
++     so we assume a single character is available. */
+   /* XXX - need rl_chars_available_hook? */
+   if (rl_input_available_hook)
+     {
+       result = (*rl_input_available_hook) ();
+       if (result == 0)
+         result = -1;
++      else
++        chars_avail = 1;
+     }
+ 
+ #if defined (HAVE_PSELECT) || defined (HAVE_SELECT)
+@@ -285,6 +288,7 @@ rl_gather_tyi (void)
+ #endif
+       if (result <= 0)
+ 	return 0;	/* Nothing to read. */
++      result = -1;	/* there is something, so check how many chars below */
+     }
+ #endif
+ 
+diff --git a/patchlevel b/patchlevel
+index d8c9df7..fdf4740 100644
+--- a/patchlevel
++++ b/patchlevel
+@@ -1,3 +1,3 @@
+ # Do not edit -- exists only for use by patch
+ 
+-0
++1
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-core/readline/readline_8.3.bb
index ff5dec6c0a..a2f23eb353 100644
--- a/meta/recipes-core/readline/readline_8.3.bb
+++ b/meta/recipes-core/readline/readline_8.3.bb
@@ -1,6 +1,7 @@
 require readline.inc
 
 SRC_URI += "file://norpath.patch \
+            file://fix-for-readline-event-hook.patch \
             "
 
 SRC_URI[archive.sha256sum] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"
-- 
2.43.0


