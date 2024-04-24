Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA20EC19F4F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11780.1713948176774387245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gLropOmf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948180; x=1745484180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Fzs4VURil2e6Ei/PP9/9Grk2qfSscCC3PP5yxFAhZA0=;
  b=gLropOmfZVphmKRmp/9ImFTYLtanaEIlhQdIQX7rLgbjiInQjI6ugl2J
   8BF+/pFkQIcgEEFpRUX4Ixm1+5p6gpOc7pOnSlTnhNM2XUGob/+niIw7t
   p6GrF+Jr1mmKDDgkb8lMpH+BKD5MbYe4d8oyjVoVOwpSOTw3kCW4tKSJv
   Mtd6je6WSMMCuYmbaZmfed+ZiEVEB0G3xla1QFCjFOQ0pg2eHj8pWGWGx
   y6Uw4saTolpRgZXyZOqv/bjOHBCQMwyNiReDooRjIjEflUGr4l/vZandf
   RUVOQOUlqKqWJRWdBZlbViako8XgsDPzZSvrXTZEUn04rHaF0qqu+NIDP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144151920"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144151920"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4AB0C2AA1
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0275632470
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 82CC51EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2BE731A000A;
	Wed, 24 Apr 2024 16:42:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/38] libcap-ng: upgrade 0.8.4 -> 0.8.5
Date: Wed, 24 Apr 2024 16:42:02 +0800
Message-Id: <1713948152-13501-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--6.711500-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrGEfoClqBl86KS8s/FMqmOBMk
	lSLBVB3RxX6YtSj8yqSeiDAFW6UJG3AhOzvD0jznOjf3A4DTYuFMkOX0UoduuToUdFbHYUaw7v0
	MlFSLfmnmyE8VIo655KYppTu5ktrmk6cJ+nF8ms7EtKyL0UoBPcE5XPQnBzGXR/IzlV+CMbbT0P
	pHDbMis/GreLFhOYYLmPp2K47b6clhaj10i6TXQMYv//yaWh0DRTJDocd0f0n1FNU5pHs+BEFvX
	wCiRuxT+63nkWSx/S0OdJ5y5E1cRPKZUMHzJkSUb056mCmF00Z9LQinZ4QefIWH8POvJNOWM6se
	g7X1Wbb3FLeZXNZS4PExmMzPfDZvKb/WYA82YMYqeY4YODTtVhlYJSWTnWVMsRsMixRUDmyFFax
	v2Ib6NZfsbjKtKPmbLapCTx8mEP1xvJLTs1FHC310ySR5cSygS7+RMq/2CK6rA4c7UV2fQpvi2P
	QO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198653

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Remove python global exception handler since it's deprecated
- Make the utilities link against just built libraries
- Remove unused macro in cap-ng.h

fix-issues-with-swig-4-2.patch
removed since it's included in 0.8.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../files/fix-issues-with-swig-4-2.patch      | 32 -------------------
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  6 ++--
 ...{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} |  0
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch b/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
deleted file mode 100644
index fb424fe725..0000000000
--- a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 355eada2d20886287cffc16e304087dd6f66ae37 Mon Sep 17 00:00:00 2001
-From: Steve Grubb <ausearch.1@gmail.com>
-Date: Thu, 4 Jan 2024 15:06:29 -0500
-Subject: [PATCH] Remove python global exception handler since its deprecated
-
-Upstream-Status: Backport [https://github.com/stevegrubb/libcap-ng/commit/30453b6553948cd05c438f9f509013e3bb84f25b]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- bindings/src/capng_swig.i | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/bindings/src/capng_swig.i b/bindings/src/capng_swig.i
-index fcdaf18..fa85e13 100644
---- a/bindings/src/capng_swig.i
-+++ b/bindings/src/capng_swig.i
-@@ -30,13 +30,6 @@
- 
- %varargs(16, signed capability = 0) capng_updatev;
- 
--%except(python) {
--  $action
--  if (result < 0) {
--    PyErr_SetFromErrno(PyExc_OSError);
--    return NULL;
--  }
--}
- #endif
- 
- %define __signed__
--- 
-2.43.2
-
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 845b7c2f0a..875337b954 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,11 +7,9 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
-           file://fix-issues-with-swig-4-2.patch \
-           "
+SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
+SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
-- 
2.34.1


