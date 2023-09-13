Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3763CA551D
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:28:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7598.1694597318764458200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131980587"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131980587"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:28:36 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A83DCD7E2
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:28:34 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A7FE1D88DC
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:28:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C5BD1870F3;
	Wed, 13 Sep 2023 18:28:32 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.3.3 -> 6.5
Date: Wed, 13 Sep 2023 17:28:22 +0800
Message-Id: <1694597302-21193-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10--4.144300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrWfgivgcUPZMyr+EEjz9hsdV/
	0bCnjw/X8MdX6WBaNTTYhqBQAIFb/d3dqzZutlmGsDpn40N9M3n2/fdRbxY1gIwnGKAoIKJL6yZ
	xlKUd8EXSUwWpxUoigAS2kVlHSIV72/zAoTeT8OYSEYfcJF0pRVQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaIxAROjHaAf22gws6g0ewz2F4r8H5YrEqzut6dxL6OwmNftC
	rF2sVs+4vM1YF6AJbb2xnRRfQRo4gtuKBGekqUpnH7sbImOEBRrtfNJY6rluL8ScGwEMsScllMe
	wzdSzmBYkls3Yxt1v7qi2+8l4oThJRz8nO/HyvQCEc+Cn1GRYU2E5LduEZTwl3ypXGQ56m7sfZ9
	V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187558

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* crc32c implementation speedup (3x)
* btrfstune:
   * be more strict about option combinations and refuse changing
     features from incompatible groups
   * metadata_uuid changes fixes
* libbtrfs: fix ABI breakage introduced in 6.3.1, revert struct subvol_info
  and subvol_uuid_search changes
* CI updates
   * pull request build tests enabled
   * published static binaries built with backward compatibility (-march=x86-64)
* other
   * documentation updates
   * new and updated tests
   * experimental feature updates (json, list-chunks, checksum switch)
   * code refactoring
   * remove btrfs-fragments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.bb
index e7a64e8363..984966bbd4 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "bb0ca35245858f17a6ced97aade1dd8d70f9c9d7"
+SRCREV = "f7ecc34555b4793573c9e3fc5f77cc8aab63fcc1"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


