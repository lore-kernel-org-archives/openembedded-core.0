Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC188C54E58
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 00:45:44 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.3939.1710809134206503694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 17:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bT/V4ldx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710809134; x=1742345134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lFiEK9stejDg8wS26YS83KHrkw/vc+exX4j/T4pOzjU=;
  b=bT/V4ldxOdSQxlW0L325lDEqcyDKY+PzfO4QsrLlxXvExxhDvVf0Xmd7
   UiL9oMqSxzCeFUuMya7nF49H2g88PDjMaNWeEoGqPCZpSLITEUUvJJEup
   YLRMDMT7HvS78SHT/ZXFn7bSvXpZ5L6mxnVNolbuKNV4T1zcLl7O/ER9k
   4g4wnVt8j8HDt7E/f5fxIhGq4OrSwXwX09Ms30a1T9l0lT/rBpcgsGroj
   tVYQCpHpTasXjx8noZbfpkHaCkbGEblWSeemHn7TR71TrqP7BuZEWk/o1
   DHQxObksQyOd2eLp2xOPC4r1epuO86to4wtWItebBTluvtbQg2OSeHUPZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140263114"
X-IronPort-AV: E=Sophos;i="6.07,135,1708354800"; 
   d="scan'208";a="140263114"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 09:45:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 65E97F2648
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 09:45:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 92D96BF4AB
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 09:45:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 15DE6E2A2D
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 09:45:28 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B6BC1A006C;
	Tue, 19 Mar 2024 08:45:27 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] libbsd: Fix conflict error when enable multlib.
Date: Tue, 19 Mar 2024 08:45:24 +0800
Message-Id: <20240319004524.1270639-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.003
X-TMASE-Result: 10--7.866400-10.000000
X-TMASE-MatchedRID: b3nQ9wmEox3FDHbj0bewebstbCLHbulS96ryTp77YeG4GyTmeN+AbO79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoh2P280ZiGmRnVTWWiNp+v8gX2Xt4pvYkbxet1P447WQnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkj80Za3RRg8NUww6AG/IrQAViIjr++k+4ckx
	P0kRLXNaAd02/NaoE5hhLpsXPmiAM=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 00:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197315

From: Lei Maohui <leimaohui@fujitsu.com>

Error: Transaction test error:
  file /usr/include/bsd/sys/cdefs.h conflicts between attempted installs 
of libbsd-dev-0.12.1-r0.core2_64 and lib32-libbsd-dev-0.12.1-r0.core2_32

The difference of bsd/sys/cdefs.h between libbsd-dev and
lib32-libbsd-dev is as following:

 /* Define the ABI for the current system. */
 -#define LIBBSD_SYS_TIME_BITS 64
 +#define LIBBSD_SYS_TIME_BITS 32
 #define LIBBSD_SYS_HAS_TIME64 1

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-support/libbsd/libbsd_0.12.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.12.1.bb b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
index 161dc6df43..84edd9bafa 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.1.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.1.bb
@@ -40,8 +40,12 @@ SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "d7747f8ec1baa6ff5c096a9dd587c061233dec90da0f1aedd66d830f6db6996a"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig multilib_header
 
 DEPENDS += "libmd"
 
+do_install:append () {
+       oe_multilib_header bsd/sys/cdefs.h
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


