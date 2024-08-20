Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6DEC5321D
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.12771.1724136730186083990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AkF3+tjR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136730; x=1755672730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sDdq9VoWfq5B/P/yQ0W/EfCeW3XA8EdmvJ0hAsB64CY=;
  b=AkF3+tjRDDdHd8vqXqewdJjV9tTgvVHbUcJBXXLtjPSbTYW+O3xj79P/
   VmMQraGoEO0+p9bqb3FLAA9zK+9b8eA/MOTILOJGZ1FrFKrVGNHCZs/VF
   YN1vc2BmkgksuPbBGxGL/vnnm0wRFgcSmcEPbpr0OGKNMXdN1EX6s9mqX
   d180AF9/ZnPjcBo8XS1hp256D2uzRs9uGWxpyUflcwEAgS6Hfk/FvnK6/
   9JWHxPCaB/T0QVLHknQek3pjXPKJoQk3YRFB3NCJLpe4YhEH9t16QnY2M
   Jow+9BNhsG0SXKWKXTCippobU6mzTQkjFg7PuVlZrbar6VG3WFnjNdB+Z
   w==;
X-CSE-ConnectionGUID: F4qvU1igSHea5E1CSxCI/A==
X-CSE-MsgGUID: kyI3sDVuQ52VO8LYOvUu2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="149964400"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="149964400"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 98BC7DB3C7
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CF3BDCFA5C
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 55A33216F4F
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F40771A0002;
	Tue, 20 Aug 2024 14:52:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/24] btrfs-tools: upgrade 6.9.2 -> 6.10.1
Date: Tue, 20 Aug 2024 14:51:21 +0800
Message-Id: <1724136703-20023-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--2.182400-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yaoXHZz/dXlxnJdsOLB4zv79wRnyxuPjhEVa
	8miri4IoA/oe4NwFf2pR3GqIooUDOIA/V6M07Uuxl5lQMzKmF9KCMN25048Eejxr78aOiICq6mZ
	4kLE9qrwNUccATRyd1L7WJXAROV+GjyK/VqbtGFywOmfjQ30zeUyQ5fRSh265YA3qL69rXq7TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDZVRzPxemJL0QAKUX1R86jQLORpVxeu9s6PFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4PExmMzPfDZvjZHcjbWX1p3xzgiC8XF2BuF+FeZ73fWhp+6W
	UtOKZDCMwnjouB50y8UvxJRkWL1dsipkQ5aeJqE1WeQwVEnNyb9bwmGBONx2S7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203524

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
refreshed for 6.10.1

Changelog:
==========
* mkfs: rework --rootdir traversal, skip hardlinks and create new
  inodes instead, also warn about them, this did not work as expected and will be
  fixed in the future
* receive: search in older trees for UUIDs when detecting clone sources
* libbtrfsutil: bindings available at https://pypi.org/project/btrfsutil
* libbtrfs:
  * patchlevel version update 0.1.4
  * cleanup in headers, removed unused definitions, no functional changes
  * don't ship list.h and rbtree.h
* other:
  * documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.9.2.bb => btrfs-tools_6.10.1.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.9.2.bb => btrfs-tools_6.10.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index ef431cd69a..fbd1b05a7f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 3b9b9b6ac033b44b3864abb1296fce1e19a2b622 Mon Sep 17 00:00:00 2001
+From cb7f8a6c3538ee3086d15c4d2c9f2a2f4f38db3b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 82dfb1b4..4968989a 100644
+index 2f8d2fa0..c760e5ae 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -984,7 +984,7 @@ endif
+@@ -985,7 +985,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb
index 9f5586490d..f37272d7ab 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "b0e5ef4cf7c8b473119e0d487a26b96058e8f80d"
+SRCREV = "a00c2b25474b5306ef29a790adb5fd5afbaba9a2"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


