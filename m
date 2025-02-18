Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C20C021A9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.14677.1739864482512578509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZeEY1cpE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864482; x=1771400482;
  h=from:to:cc:subject:date:message-id;
  bh=JaJnNl34fTRjJ1u1af7uRm3oz7izY6F5dYcXkAWLqMg=;
  b=ZeEY1cpE/MOabmcvhrYt+ZxYF+N1Pwt+CXc3hAbEIg520EWpeYPu1DrA
   D6qyBYMT+6xC1gtEH8cbL25Pmxz+/BR5ACmXvAE2p5eyEvfu58XQPwt+m
   vPHhGbRm6acnWDaDooVm38ct+lUEd2fVawsQacsRO6hEcWC+Yyi8TgEZJ
   RslLo5plP5A0AyXgROtYo85HSfsdYRVTyBPMn+1AQHD3TC80covE5Tqx+
   cNJ6Htfn4EB3f9HM7UIFgzaMPzZGnFcx4qXtVepR2SFZBIRR/GuuqsFvN
   5xGhbUab42eXVkZrgDOltvI0GuuhbbRSJeX3PMAMKh0rw/30Cmz8esmVP
   w==;
X-CSE-ConnectionGUID: HrmD0VC4R/aF+kImLcVm0Q==
X-CSE-MsgGUID: k4yQUikNRQCx4ok1z5jU8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190373884"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190373884"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BCD01E8529
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FC5ED50AF
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED6E31A000B;
	Tue, 18 Feb 2025 15:41:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/32] btrfs-tools: upgrade 6.12 -> 6.13
Date: Tue, 18 Feb 2025 15:39:04 +0800
Message-Id: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211564

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* mkfs:
  * new option to enable compression
  * updated summary (subvolumes, compression)
  * completely remove option --leafsize, deprecated long ago
* btrfstune: add option to remove squota
* scrub:
  * start: new option --limit to set the bandwidth limit for the duration of the run
  * status: fix printing of Rate unit suffix (SI/IEC)
* qgroup clean-stale: check if quotas are enabled before starting filesystem sync()
* print builtin features and options in --version output (mkfs, convert, image, btrfstune)
* build:
  * Botan minimum version is now 3.x
  * target to build compile_commands.json (for LSP)
* other:
  * a bit more optimized crc32c code
  * sync some headers from kernel code
  * command help updates and fixes
  * build warning fixes
  * error message updates
  * cleanups and refactoring
  * updated tests
  * lots of documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.12.bb => btrfs-tools_6.13.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.12.bb => btrfs-tools_6.13.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 59ea5a66da..49011e55a5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 76e635a56c5973671da3a8a2fd4fc32e823bf8c9 Mon Sep 17 00:00:00 2001
+From 4f876f0b0612598c22173f68593a8a05056be3c3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 2f8d2fa0..c760e5ae 100644
+index 7e36aa42..edff7d5b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -985,7 +985,7 @@ endif
+@@ -996,7 +996,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
index 3c0bb81f75..895002010c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "85ca0a6d60c14eefda509970a26616ff16115612"
+SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.43.0


