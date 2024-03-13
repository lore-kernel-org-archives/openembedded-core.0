Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEEDC54E74
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.10641.1710313764854466666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lxCfNotO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313765; x=1741849765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BtzIVC+XvScmKducOXu7QyEOorkSkW4FtVeN0EnDKRQ=;
  b=lxCfNotOZzbn4+xXzxMKB99XynNrLJ9Vt3/XROnYYP6JZnXMXribAo6Y
   TwWf4u5JS1wdYXhyH0Sp8VefBjwxsDjsMld8a7Z8t4OwEXk+scZ/Ddm9R
   Z2VryvboWvb0DF885BHIZix0MAlWNJ+niBeA/p1emI9B+tQi0ll29FDqv
   ivo2/Zi+e9NewLi0/NFZKQhErnrGneYBL85I0yZpaV6D9bN7yEvPSv0M/
   fN/K0ogO/bHcySYqBxyHfdnLqFPW/uK9lRPxMLasgSsgKL3jXLeEcdajM
   vtttwjzdqVZafKlsTgAzXqD5RE/bZduM+vi+AFVA2c3Fh4b1ufA9Fw+N1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131486867"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131486867"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E601F2540
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A91A15706
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B3EF21BD41
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBF011A006D;
	Wed, 13 Mar 2024 15:09:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/36] psmisc: upgrade 23.6 -> 23.7
Date: Wed, 13 Mar 2024 15:08:16 +0800
Message-Id: <1710313714-12541-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-5.931900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yb9A3Bl1/DcVnJdsOLB4zv79wRnyxuPjhKY5
	dnsUjCmHD/OFpcSAvwsCq+OnLtFaiiDhJglWIMN0HWRJEfGP5nkbbhhV65kaY+R58RNqTCQy2d8
	mtRIRsUMkw8PwVHl/nwXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjdcfU63y8xPBER9
	9WH+m5DjeWrdgSBjomYWn2p9yKOL1O8fMZwaqIgp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyKsQd
	9qPXhnJll7mmZVNybHbp2Pp2Ahdcptq4fcG7B0pDpXU7usutCBpMqrseZY4VsXcxelmLZA/tHVw
	+QwhaHFAXIi25yb/MPX/v0y1H+1iYShUeKGP5Mo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197020

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
refreshed for 23.7

Changelog:
===========
* build-sys: Make disable-statx work
* fuser: Fallback to stat() if no statx() Debian 1030747
* fuser: silently ignore EACCES when scanning proc directories
* killall: small formatting fixes Debian
* pstree: Do not assume root PID
* pslog: include config.h
* misc: Update gettext to 0.21

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 6 +++---
 .../psmisc/{psmisc_23.6.bb => psmisc_23.7.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.6.bb => psmisc_23.7.bb} (85%)

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
index ca13bdbd15..01335bdf40 100644
--- a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
@@ -1,4 +1,4 @@
-From 115fcf1daff18aa2f2e130d63704f04031878db0 Mon Sep 17 00:00:00 2001
+From 338d2d46d1c20ebadf317938af98d0532a62f8d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 24 Mar 2016 15:46:14 +0000
 Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
@@ -13,7 +13,7 @@ Upstream-Status: Pending
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/src/peekfd.c b/src/peekfd.c
-index 5aa990a..7e8e3fc 100644
+index 36dff04..2b4b1dc 100644
 --- a/src/peekfd.c
 +++ b/src/peekfd.c
 @@ -30,8 +30,11 @@
@@ -28,7 +28,7 @@ index 5aa990a..7e8e3fc 100644
  #include <getopt.h>
  #include <ctype.h>
  #include <dirent.h>
-@@ -266,11 +269,11 @@ int main(int argc, char **argv)
+@@ -341,11 +344,11 @@ int main(int argc, char **argv)
  		if (WIFSTOPPED(status)) {
  #ifdef PPC
  			struct pt_regs regs;
diff --git a/meta/recipes-extended/psmisc/psmisc_23.6.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
similarity index 85%
rename from meta/recipes-extended/psmisc/psmisc_23.6.bb
rename to meta/recipes-extended/psmisc/psmisc_23.7.bb
index 2e55ad00bd..ea272cd92d 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.6.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "3098e641dc1ddb210186f53464255670b480377b"
+SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
 S = "${WORKDIR}/git"
-- 
2.34.1


