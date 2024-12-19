Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FC3E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 08:42:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.125768.1734597729120582698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 00:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cdYEZR5I;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734597729; x=1766133729;
  h=from:to:cc:subject:date:message-id;
  bh=qB8Dm+tkao8sHLr60Dl195UudtpBY4kwALJy+H2qzlM=;
  b=cdYEZR5IQ74mwe6uIMIaJxrNs29SV34n++CP1nPGjBVs8B4VHzgUQ4mT
   uBLz1ujZsuWElukFRWczdmzQlinqMdd/DRR4d8msgCV0rsEZuT0FYiUF1
   ozUKXcJP8rhKaG5fCZkiurvMo6sbuLrM+vuKXAp670ZGMm9YMKu0Y8hK9
   fVTBEOrLs4C3nocCXSlEV5pvZFwslEpJdwNOFOea6L6BjcPB2DQoZF0Dq
   LF2ttvd7gHsUWSaDnPBxpzXLkdfoBPesvZZ+Uy6dYr7eMotMUADfx8e4j
   7PfrWfESRWfAN6ybBthyTSawOXxWeJndif916G7mIBpF15vMxtPbSgaCV
   g==;
X-CSE-ConnectionGUID: BoG+cT1hSMSzBJyJGN0hhg==
X-CSE-MsgGUID: KqeFZAgOQZy3LcUDZMGZoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="163186569"
X-IronPort-AV: E=Sophos;i="6.12,247,1728918000"; 
   d="scan'208";a="163186569"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 17:42:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 852B0E8520
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 17:42:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DE94CFAAD
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 17:42:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D20486AB43
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 17:42:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7ADD01A0071;
	Thu, 19 Dec 2024 16:42:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] nfs-utils: Fix const qualifier error
Date: Thu, 19 Dec 2024 16:41:53 +0800
Message-Id: <1734597713-2663-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28868.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28868.006
X-TMASE-Result: 10-2.222300-10.000000
X-TMASE-MatchedRID: 5VG9tYkx4U/gy771S93geAPZZctd3P4BTfK5j0EZbytXGTbsQqHbknU3
	oKSu0J1x28kKXD7bCdnGKIf6hBf7VaGGOyqBK41vCtzGvPCy/m42ZWOmuJUS2bgbJOZ434Bs1as
	UUCqp+8fnzD9l6LaU3aS6UDs/n0a6vVpRaxGNmveeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDmJiOIwtqq1XrTrrSD4PjLXvCndDKUiEryPqmGoXOS4COCAeqoSSyuIGL5kvBxRIlCjIC
	+58Mgf8LCkUqvc5r24HU6HlBchUzIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 08:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208898

From: Wang Mingyu <wangmy@cn.fujitsu.com>

error with clang:
file.c:200:8: error: assigning to 'char *' from 'const char *'
discards qualifiers
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
|   200 |                 base = pathname;
|       |                      ^ ~~~~~~~~

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-Fix-const-qualifier-error.patch      | 35 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.8.2.bb              |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-error.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-error.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-error.patch
new file mode 100644
index 0000000000..8fc327e7aa
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-error.patch
@@ -0,0 +1,35 @@
+From a21344466e4c315d6d7098920819983f2d15573b Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Thu, 19 Dec 2024 06:18:59 +0000
+Subject: [PATCH] Fix const qualifier error
+
+Fixes clang error
+file.c:200:8: error: assigning to 'char *' from 'const char *'
+discards qualifiers
+[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+|   200 |                 base = pathname;
+|       |                      ^ ~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ support/nsm/file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/support/nsm/file.c b/support/nsm/file.c
+index de122b0..2733210 100644
+--- a/support/nsm/file.c
++++ b/support/nsm/file.c
+@@ -197,7 +197,7 @@ nsm_make_temp_pathname(const char *pathname)
+ 
+ 	base = strrchr(pathname, '/');
+ 	if (base == NULL)
+-		base = pathname;
++		base = (char*)(&pathname);
+ 	else
+ 		base++;
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 543c68f7f5..45821b98e8 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
+           file://0001-Fix-const-qualifier-error.patch \
            "
 
 SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
-- 
2.43.0


