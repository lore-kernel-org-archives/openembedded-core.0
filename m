Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E94C25B10
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11780.1713948176774387245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cGsVZAIJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948178; x=1745484178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rUB8vn0IN/mrBGZY/pLEDrMLKpSLIAOxedJ1SCwku3o=;
  b=cGsVZAIJTFtyzT5rBYzxuCNM4myaTeZKCBqhdwo6A9YELCoVdg7eSVf4
   K84dh6SQbetJROchH7MhkCHW3o3vVSAYCcPnM3sVd2UYfkfKJgaFYwWsX
   wwbsjg3ApCIj3szZ67qsVpx8SJZQw3zwfghxDisB7+YiFDHyJYnCJhV1d
   uFB5Gge86c+8S/Wr/TunGF+ks/n5zJeB9FZS3DS9lufwMj6FQ5ur1WgsL
   VYB6VCrHPOcfA+kv/tjjtQ8PZbRgVCeeu6cwRg6QNxp5czcXMTCwUx/uW
   g6+D08pvUGAuCb9M++RAGD5FgYNYkLy/6NmVpoF7FYJS91PaojknrJcCd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144151918"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144151918"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D175C53C7
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 76F7B9E181
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07C7F202CE131
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A6A3C1A000A;
	Wed, 24 Apr 2024 16:42:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/38] libarchive: upgrade 3.7.2 -> 3.7.3
Date: Wed, 24 Apr 2024 16:42:01 +0800
Message-Id: <1713948152-13501-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--0.231300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyt5s9kBup6GIar
	Zvf3RiBbBEleHrOyiTexMbpbeWfnwiqQO0zIUpyn5TBV9C2UM3EbbhhV65kaY8v8BP3RkorX2d8
	mtRIRsUMkw8PwVHl/nwXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZ1EZ/lznv4UWxbR
	QneVNyR43BSgam0lwXC6Kd+BnbGsdze/DZgIzfL02xVQmDwU6mBPY4SegK3jypHpQYuqy67p6ba
	/D5x6cp4vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpnH7sbImOEBRgHpfU0re9ajhYpvlgrcpIUcqF
	0n5y8gbFFJNOQA5Ol4a941kqQy3pJxKOcLz2b9+H+NQf+LQMVucpViApss98qFNPmjIHfkHsfZ9
	V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198652

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-PCRE2 support
-add trailing letter b to bsdtar(1) substitute pattern
-add support for long options "--group" and "--owner" to tar(1)
-Fix possible vulnerability in tar error reporting introduced in f27c173
-ISO9660: preserve the natural order of links
-rar5: fix decoding unicode filenames on Windows
-rar5: fix infinite loop if during rar5 decompression the last block produced no data
-xz filter: fix incorrect eof at the end of an lzip member
-zip: fix end-of-data marker processing when decompressing zip archives
-multiple bsdunzip(1) fixes
-filetime truncation fix on Windows

configurehack.patch
refreshed for 3.7.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libarchive/libarchive/configurehack.patch | 20 ++++++++++++-------
 ...ibarchive_3.7.2.bb => libarchive_3.7.3.bb} |  2 +-
 2 files changed, 14 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.2.bb => libarchive_3.7.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.patch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
index f3989d99eb..45fddd9147 100644
--- a/meta/recipes-extended/libarchive/libarchive/configurehack.patch
+++ b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
@@ -2,12 +2,15 @@ To work with autoconf 2.73, tweak the macro ordering in configure.in.
 
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure.ac | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
 
-Index: libarchive-3.6.2/configure.ac
-===================================================================
---- libarchive-3.6.2.orig/configure.ac
-+++ libarchive-3.6.2/configure.ac
-@@ -357,6 +357,19 @@ if test "x$with_bz2lib" != "xno"; then
+diff --git a/configure.ac b/configure.ac
+index 503bb75..e3101da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -414,6 +414,19 @@ if test "x$with_bz2lib" != "xno"; then
    esac
  fi
  
@@ -27,9 +30,9 @@ Index: libarchive-3.6.2/configure.ac
  AC_ARG_WITH([libb2],
    AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 through libb2]))
  
-@@ -558,19 +571,6 @@ LDFLAGS=$save_LDFLAGS
+@@ -678,19 +691,6 @@ fi
  
- AC_SUBST(GC_SECTIONS)
+ AC_SUBST(DEAD_CODE_REMOVAL)
  
 -# Checks for typedefs, structures, and compiler characteristics.
 -AC_C_CONST
@@ -47,3 +50,6 @@ Index: libarchive-3.6.2/configure.ac
  # Check for tm_gmtoff in struct tm
  AC_CHECK_MEMBERS([struct tm.tm_gmtoff, struct tm.__tm_gmtoff],,,
  [
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb b/meta/recipes-extended/libarchive/libarchive_3.7.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.3.bb
index 91f521fa4d..bea91b6e97 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.3.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "df404eb7222cf30b4f8f93828677890a2986b66ff8bf39dac32a804e96ddf104"
+SRC_URI[sha256sum] = "f27a97bc22ceb996e72502df47dc19f99f9a0f09181ae909f09f3c9eb17b67e2"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.34.1


