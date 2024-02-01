Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C02C47258
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 03:22:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.7530.1706757741443196620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 19:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gg16VQgJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706757741; x=1738293741;
  h=from:to:cc:subject:date:message-id;
  bh=TRTQ3lLj8tWrWFnybdC2/bbIZ1kGvFsKfi5ddYkiIeI=;
  b=Gg16VQgJgW3oMMR8aYu8W6yah7ck0kVrM4FcBb3dfJKm+nsEp+3zZ15s
   mJpOrlwlEX7B1KOs5Ue7H+77guZ96Iz3GJOCv/J+r2knI91l6cQWm7f7L
   +ev0Eq1uuPoDykJ6gYhym3D1fZ7x1/0K+FPZk9tDQn8J6+Ba57Va50Oqc
   bh4hx6VxiQUnRXzq/gRmPKWAmwQLS64CN4Tcfhep6RZ1nVNL1csG1lCfQ
   KUaBzF4k0KJhf4qiu8Mh0IwTX2MEaX9OSfc9jy5cL5x8oMBGx3vO/9uDi
   fosdIYcklYrgBL8m5xmicRed0MVSP2hciRo8f5PyqIrqhLCSgU+9hQDaq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147464036"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147464036"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:22:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 727DE100DA4
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:22:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADAB6D52C9
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:22:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39DD66BF57
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:22:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CDC6C1A006A;
	Thu,  1 Feb 2024 11:22:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ethtool: upgrade 6.6 -> 6.7
Date: Thu,  1 Feb 2024 11:21:31 +0800
Message-Id: <1706757691-11448-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--4.638500-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yTyjd/AizytBnJdsOLB4zv79wRnyxuPjhD2L
	HhcNaAJX1jypNY0wtaZm+aOW8GYORAkY/bkiYgIgA9lly13c/gEQhNjZQYyI3AfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmizCsOCBxDp3XHsEljqux9nTvH5O5/sxwMaHvr9sOkYStriQ
	2CcCf65W3e3fjtgy6aRXEJavFm0TBdInhzedP5BysIuzCLc2mNrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KradYnfQpn4pmm0epR91QFrrSLkB+zyFQsvUWIQoDcEtpWFeV
	vSaDWF/FdQ/mKk/eZBZJzfzSsn1TlL2lGdPzhobzRalXqcCRYR0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 03:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194552

From: Wang Mingyu <wangmy@fujitsu.com>

avoid_parallel_tests.patch
refreshed for 6.7

Changelog:
===========
* Feature: support for setting TCP data split
* Fix: fix new gcc14 warning
* Fix: fix SFF-8472 transceiver module identification (-m)
* Misc: code cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.6.bb => ethtool_6.7.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.6.bb => ethtool_6.7.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 409c8de685..69df8632f2 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 0c77437267601d40d7ce9efd87eb4b82a5675d2f Mon Sep 17 00:00:00 2001
+From 758fde7186730ee331a0ee6149276cd412766ee0 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,10 +15,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 11efb99..b5ce018 100644
+index c871558..8ea1eaa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.5, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.7, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.6.bb b/meta/recipes-extended/ethtool/ethtool_6.7.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.6.bb
rename to meta/recipes-extended/ethtool/ethtool_6.7.bb
index ab824356c2..33df0e0e80 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.6.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "d4cdb4f7498781fb516e2b3d0eadab28691da3fd3e3445954e82d745de95fb96"
+SRC_URI[sha256sum] = "ace0e95a03b38208af4ebacb415244568ace44c5d5a279ea434844f900179c75"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.34.1


