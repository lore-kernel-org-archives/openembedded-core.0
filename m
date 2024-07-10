Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9E8C3DA49
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10244.1720604657021339322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pUR6uNO0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604658; x=1752140658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7xmkJrGrADmREmXnt5ZRIsS7o/ICggTZZjkLp4vMaWo=;
  b=pUR6uNO0an5EawuJ2rBvzyMnhbclpBNaLpypJi28i7yYNdusfUR2WncX
   r3AFSEORgtMKz2qqYIp5hXGLl46okcgXyjm6M0h9vz8JNg0vUbwHDz1Vi
   UqBjCwbV0chIJoi1Iv/B1kUi5+PEVPZ1vPhhmK0ITPE104ix7+8BPJYhR
   UKoK2Tdh5+t/6gg4J3BxaWO/yCv53Su2YtYoi3jsRQiBMHLL1yXO0A6fp
   YG2Y1jKMMLBwaJIQC8QQBdP8GcwcCQA3snAgm6x0EhUkT/+/ZP3Z+U5L9
   SQoKZyP6sQg8+aKtpHd2qEVz7GvTXIFuuvoHGtZc8AxhzHrxpzN8NKUtn
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166585669"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166585669"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 05FE4D4256
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42C31D4C13
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D68B1220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88B1B1A000C;
	Wed, 10 Jul 2024 17:44:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/30] gdbm: upgrade 1.23 -> 1.24
Date: Wed, 10 Jul 2024 17:43:33 +0800
Message-Id: <1720604634-23406-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--3.332800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yTo39wOA02LhpxAd6mi1Ga1YC5LPd7BvbaQt
	HlwwSfPROuzeNmOGKnMoBEe6aSUEdzazDnx5YT+a30kDaWZBE1QdzCEqnjsWC8bl1d1BOPY4qrn
	SNd1n/SQILxoCYZ47qbTgydUvVSSzxEEtnnH5KRc/QdUh6LEl0ME5XPQnBzGXvpLsd+70hTFmeC
	LE2iu14If0Rs99MC8gY3GIfO+7iO2vvxILmKK/HBRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs0+XA
	DuRHrETQy+xl1uBpDimSwOK7tz/PtthUeTJw8L66iodfQSKfd7hHxjF7A1IESkc3DRh+wjvhCM3
	vyQWqMdAMdiojGPdkogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201705

From: Wang Mingyu <wangmy@fujitsu.com>

ptest.patch
refreshed for 1.24.

Changelog:
===========
* New gdbm_load option: --update
* Fix semantics of gdbm_load -r
* Use getline in gdbmtool shell.
* New function: gdbm_load_from_file_ext
* Fix binary dump format for key and/or data of zero size.
* Fix location tracking and recover command in gdbtool.
* Fix possible buffer underflow in gdbmload.
* Ensure any padding bytes in avail_elem structure are filled with 0.
* Improve the documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gdbm/files/ptest.patch          | 12 ++++--------
 .../gdbm/{gdbm_1.23.bb => gdbm_1.24.bb}              |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.23.bb => gdbm_1.24.bb} (94%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index 25fb6bb2f4..989f9524bc 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -1,4 +1,4 @@
-From 8bea84a598b51a7ac7e50aa8f0f20857a9b6b07b Mon Sep 17 00:00:00 2001
+From ed0b5a48c7ce59ea971a10c7e522933cf613841a Mon Sep 17 00:00:00 2001
 From: Josep Puigdemont <josep.puigdemont@enea.com>
 Date: Sun, 4 May 2014 16:02:07 +0200
 Subject: [PATCH] Add install-ptest rules.
@@ -6,14 +6,13 @@ Subject: [PATCH] Add install-ptest rules.
 Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
-
 ---
  Makefile.am       |  5 +++++
  tests/Makefile.am | 12 ++++++++++++
  2 files changed, 17 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 59e2643..5f3ceb0 100644
+index d0b46ea..6c57b11 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -64,3 +64,8 @@ ChangeLog:
@@ -26,10 +25,10 @@ index 59e2643..5f3ceb0 100644
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index fac6826..5dc2091 100644
+index eb071ac..9d14fe8 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -143,3 +143,15 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+@@ -145,3 +145,15 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  t_wordwrap_LDADD = ../tools/libgdbmapp.a
  
  SUBDIRS = gdbmtool
@@ -45,6 +44,3 @@ index fac6826..5dc2091 100644
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +		fi \
 +	done
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gdbm/gdbm_1.23.bb b/meta/recipes-support/gdbm/gdbm_1.24.bb
similarity index 94%
rename from meta/recipes-support/gdbm/gdbm_1.23.bb
rename to meta/recipes-support/gdbm/gdbm_1.24.bb
index a08079741d..88f9fa47cf 100644
--- a/meta/recipes-support/gdbm/gdbm_1.23.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.24.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[sha256sum] = "74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd"
+SRC_URI[sha256sum] = "695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.34.1


