Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46EAC3DA52
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10247.1720604662823746588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n8oeFxXJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604663; x=1752140663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jqEkV0Q+fBAooMqbnMlSsIgt67uR6Neqw5OOUGZR2Co=;
  b=n8oeFxXJW9FW2XU0s+897wAs+MASXRo5BEvXvSdxZDWwMnkqMzKBJ0/6
   pFwPbD0Aeu7trJ7U5zeii7yWvWzGuFo0mSonVHOoLs9EdvMk+W8hpi/Pj
   a08eCFZ4/9ajsZWOIL8oSXoN0dtY9BJVjnqGuFBlrUsIaz6xF+e1G2nsw
   9xaefAPdHFP1vFtYFyUY4WUIjruGTd9iypOOndgwgmdY0PSpPhRhQ5W1C
   LpOthmZT+b6VJ+tkLumS0IEb3FyJBbvrwY7H4J6lxi53WCklmXsrWLjTE
   uUr1vNPRTTn109WurhuRper+lQSM8PF9PuQ9tSoWY8t+mpM91i7Cjr8Gx
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="168420921"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="168420921"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB2D4C68E4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1EACE99A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D2DE2005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B6681A0002;
	Wed, 10 Jul 2024 17:44:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/30] opkg-utils: upgrade 0.6.3 -> 0.7.0
Date: Wed, 10 Jul 2024 17:43:44 +0800
Message-Id: <1720604634-23406-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--5.398400-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yRIRh9wkXSlFG3SoAWcU42XL/AT90ZKK19nf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ9o7nBvaGi9B9GvnaLY1JSyz8d6zvo5NkHO1oaQ51CuNUnF0DMXqXvtT1r
	rN8sUDVs/QaanmX1Mmb6Qp7Gultn9wyAmzxb7Z054CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyKsQd
	9qPXhnJ82OrqygNZyZFki2za4/lxahzHcCYCHFcriNRDUKqXcdYXRU7hK+FHA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201717

From: Wang Mingyu <wangmy@fujitsu.com>

0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch
removed since it's included in 0.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-numeric-owner-parameter-overzealou.patch | 34 -------------------
 ...pkg-utils_0.6.3.bb => opkg-utils_0.7.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.6.3.bb => opkg-utils_0.7.0.bb} (94%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch
deleted file mode 100644
index 0cdeb9574a..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 19c2c6a14c8760c3595f5dc6cc89cde85fbdbac1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
-Date: Tue, 9 Jan 2024 09:20:55 +0100
-Subject: [PATCH] opkg-build: remove `--numeric-owner` parameter overzealously
- added
-
-In some corner cases this parameter has been added overzealously.
-All discussion on this topic can be read in here:
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=15334
-
-Upstream-Status: Backport [https://git.yoctoproject.org/opkg-utils/commit/?id=68a969f0e867ace0d94faf8ebe7c7bb67f59d386]
-
-Signed-off-by: Alex Stewart <alex.stewart@ni.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- opkg-build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/opkg-build b/opkg-build
-index 6edd938..0582958 100755
---- a/opkg-build
-+++ b/opkg-build
-@@ -337,7 +337,7 @@ export LANG=C
- export LC_ALL=C
- ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
- ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | sort > $tmp_dir/file_list )
--( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --numeric-owner --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
-+( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
- ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
- rm $tmp_dir/file_list
- rm $tmp_dir/control_list
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
similarity index 94%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
index e138bc24af..44958b442e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
@@ -9,9 +9,8 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            file://0001-update-alternatives-correctly-match-priority.patch \
-           file://0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch \
            "
-SRCREV = "589880d01969eb9af1e66120e731d43193504718"
+SRCREV = "68a969f0e867ace0d94faf8ebe7c7bb67f59d386"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


