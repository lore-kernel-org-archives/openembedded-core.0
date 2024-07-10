Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92F2C41513
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10243.1720604653804884260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LJPi9Wma;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604653; x=1752140653;
  h=from:to:cc:subject:date:message-id;
  bh=vO31bYoiOzXkVXcAW8RuobtnGhsppsskE7NdqXLUYK8=;
  b=LJPi9Wma99p8s8fmacQgm2fxcBy98/mCfEPKZNZhCrIgN3tGKHa0s2d9
   8qQ9R2wJJekF8/wPK5QxeweXDa6gUtllx96j/foQOFeRAurB7Y5p6wGqU
   uCQq6azvaDe620BO0RHV6Aork4fJW5TzQyoR86Vv3abWOwFPouFbkh9iO
   c4TdwCD9hXwngKfoMq8AoHfYbphvLiXiW2sqcs6jByQEjGkpcdxBUYbE6
   bmNXL9tx5dNpJbgCBq6ufMwPKNMPZGPnlK4Enf9gS6IrTV6r2q/JWewG1
   98VAKRERWo1ZtKVsenZxoafiO3dsp2CBdA+d+WyIw9x5tn8Sb7Pj0Gymt
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="153920534"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="153920534"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 84AB1D994D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D3ABCD96A2
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F12B220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0F2441A0002;
	Wed, 10 Jul 2024 17:44:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/30] base-passwd: upgrade 3.6.3 -> 3.6.4
Date: Wed, 10 Jul 2024 17:43:25 +0800
Message-Id: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--1.787400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yaoXHZz/dXlxjIW07F8rFN8xkLdkW7C5qkKJ
	Pvbg1+THKqrQ7lLcMnwpguJMvLG1b39JXYBaBfzu/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQFH0
	IKehhaob4fnMMOzRLaopB8fOwwjt1wwlfdSm9NBFrzsINdopFUgRryDXHx6oXzBJbr5NtyCz4Xs
	MTa9+ofuLzNWBegCW2wgn7iDBesS0nRE+fI6etkt+/KnGlYMWQxiKQ25aq8pZapI+XLO59WBk6s
	sB9Gj6cdSEEvmnW/2p3I0NZHMXLFYl3hvGi3d+Pnj7Yko/Yq0Pc/yz3DF57NEu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201697

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-a-shutdown-group.patch
0005-Add-kvm-group.patch
refreshed for 3.6.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../base-passwd/base-passwd/0001-Add-a-shutdown-group.patch | 6 +++---
 .../base-passwd/base-passwd/0005-Add-kvm-group.patch        | 6 +++---
 .../{base-passwd_3.6.3.bb => base-passwd_3.6.4.bb}          | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.3.bb => base-passwd_3.6.4.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index e50efc9623..33b0b5820d 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 8f3ace87df3aaad85946c22cae240532ea3e73b8 Mon Sep 17 00:00:00 2001
+From 49371dfc984ac895d658d01108e8bf58675ce8c9 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
@@ -14,10 +14,10 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index ad1dd2d..1b5e2fb 100644
+index 3e7bf1c..72108a8 100644
 --- a/group.master
 +++ b/group.master
-@@ -35,5 +35,6 @@ sasl:*:45:
+@@ -34,5 +34,6 @@ sasl:*:45:
  plugdev:*:46:
  staff:*:50:
  games:*:60:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 72e6ee333c..0101637e9e 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 6cf19461fb31d7a7a3010629aae9aab49c26a01b Mon Sep 17 00:00:00 2001
+From 74fc91ee809bc902f79144ee2277fa3e368c30d0 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
@@ -10,10 +10,10 @@ Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index cea9d60..5b62284 100644
+index 7d794b2..7fdd8bf 100644
 --- a/group.master
 +++ b/group.master
-@@ -34,6 +34,7 @@ utmp:*:43:
+@@ -33,6 +33,7 @@ utmp:*:43:
  video:*:44:
  sasl:*:45:
  plugdev:*:46:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
index bf50b01fd5..df4889f220 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "83575327d8318a419caf2d543341215c046044073d1afec2acc0ac4d8095ff39"
+SRC_URI[sha256sum] = "4b5232c5910932215b87bbde6f3c6c9a97021fe7902bd837b1ede8cc0be84a65"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.34.1


