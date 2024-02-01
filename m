Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DDDC47258
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 03:21:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7592.1706757670074795388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 19:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y7WdsssS;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706757670; x=1738293670;
  h=from:to:cc:subject:date:message-id;
  bh=rinpKs+2p5M2zreyaO5zJ2F8aiDe1FZrFvQES5uST5s=;
  b=Y7WdsssS2XaE0cGq6tpsuvG3mpJ5tEH7ExmG3j3alQWpMxaXWDW+KrFM
   d6UgH+NcfKwpoyClDuwueVK73V8cksiRHpdNdYFApMQYoE5dou5HnTwGn
   aw1x9062mqErYwGREjo6JuH4BN21S1gFryNO0rmnNlR3SuSuk3tc59uJG
   A8eJVG7uV+JJTZsXc0VDhgJZBGObXk6xSx141QHMaOrMEH+czUdUFB+Vn
   ddnpDXZywUAC1RfILKQ7Ces35q45z1gaOdxIYiwXnEPF8z4IeknEdM8eD
   ALG8hPPOIaE9HN8r1u9CuU+QJ8wEEGIe6lctXiw12DMJUH7XIdtmHz98n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="136432264"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="136432264"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:21:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CFCDF2605B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:21:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6515D88AF
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:21:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6980220097E5C
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:21:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0EA7E1A006A;
	Thu,  1 Feb 2024 11:21:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cpio: upgrade 2.14 -> 2.15
Date: Thu,  1 Feb 2024 11:20:22 +0800
Message-Id: <1706757622-11411-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28152.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28152.007
X-TMASE-Result: 10--3.650400-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvn3ZLCt3rRSaUg
	jNaMeaDm4fASVdRdjJTb7nkk9NkeD8kFO7NcbK9eOjf3A4DTYuFMkOX0UoduuWAN6i+va16u0yO
	PBv1B9XYILxoCYZ47qddx/gHSscJz3Nkas/vriw5O5y1KmK5bJRSLgSFq3Tnj9RTVOaR7PgTQK1
	xScp/0+E+9l9kcZ4Fy1llWqL4d4uFMGF0Ua9spp5VRzPxemJL0YjDXdM/x2VPT+1Zj+w66+mqLY
	0630P+jf3JCkbhYRZ89tRxrH3ChDOVHGbcDbAq6FEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzMRYm
	aqN8Kf7AyZ7F3rhcZS5R+yEzZygEyDjX/Y54P5j+ynJAgiqL0Z6IkqHNS3eAc4fvkaLZniZWlFg
	G452bFT548osNJ7j6iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 03:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194551

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix operation of --no-absolute-filenames --make-directories
* Restore access and modification times of symlinks in copy-in
  and copy-pass modes.

0001-configure-Include-needed-header-for-major-minor-macr.patch
revmoed since it's included in 2.15

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cpio/{cpio_2.14.bb => cpio_2.15.bb}       |  3 +-
 ...e-needed-header-for-major-minor-macr.patch | 48 -------------------
 2 files changed, 1 insertion(+), 50 deletions(-)
 rename meta/recipes-extended/cpio/{cpio_2.14.bb => cpio_2.15.bb} (94%)
 delete mode 100644 meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
similarity index 94%
rename from meta/recipes-extended/cpio/cpio_2.14.bb
rename to meta/recipes-extended/cpio/cpio_2.15.bb
index 397bb5d87c..52070f59a2 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -7,12 +7,11 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-           file://0001-configure-Include-needed-header-for-major-minor-macr.patch \
            file://run-ptest \
            file://test.sh \
            "
 
-SRC_URI[sha256sum] = "145a340fd9d55f0b84779a44a12d5f79d77c99663967f8cfa168d7905ca52454"
+SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee4183455499e"
 
 inherit autotools gettext texinfo ptest
 
diff --git a/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch b/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
deleted file mode 100644
index 95ece0bbf3..0000000000
--- a/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8179be21e664cedb2e9d238cc2f6d04965e97275 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Thu, 11 May 2023 10:18:44 +0300
-Subject: [PATCH] configure: Include needed header for major/minor macros
-
-This helps in avoiding the warning about implicit function declaration
-which is elevated as error with newer compilers e.g. clang 16
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index de479e7..c601029 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,8 +43,22 @@ AC_TYPE_UID_T
- AC_CHECK_TYPE(gid_t, int)
- 
- AC_HEADER_DIRENT
--AX_COMPILE_CHECK_RETTYPE([major], [0])
--AX_COMPILE_CHECK_RETTYPE([minor], [0])
-+AX_COMPILE_CHECK_RETTYPE([major], [0], [
-+#include <sys/types.h>
-+#ifdef MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif])
-+AX_COMPILE_CHECK_RETTYPE([minor], [0], [
-+#include <sys/types.h>
-+#ifdef MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif])
- 
- AC_CHECK_FUNCS([fchmod fchown])
- # This is needed for mingw build
--- 
-2.34.1
-
-- 
2.34.1


