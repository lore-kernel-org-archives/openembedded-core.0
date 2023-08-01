Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB70C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:48 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7589.1690875701097257492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105999759"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105999759"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55465C3F8B
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:36 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97232D3F16
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B69372FC8177;
	Tue,  1 Aug 2023 16:41:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.3.1 -> 6.3.3
Date: Tue,  1 Aug 2023 15:41:11 +0800
Message-Id: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--7.455100-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrWfgivgcUPZO/UKSk38cGDFYM
	JR3dIrh25CrGkOXhyr1mUrki4v6wBPZvQ8qteppiCtzGvPCy/m5rTWaGefu3pPlXhf/rkPBvZlj
	9F1etQo1rH8Lyh8qmya/fBmhkJqZptR3ZHtcq+feHmRpBdG9H18WaYx0jCOsOXL3alrQqMpKxbR
	QneVNyR9CQaPiFU4JxDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixtj3+F
	LaZeZ/u59thHEq0AZ3zteLMLyOs0TsE6PWVyEksngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiTLQjAIT5BKX6bD62R4NcxKwNQl8ZVwFV0fPqCyhhYWXH7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185194

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * mkfs: option -R deprecated, options unified in -O (-R still works)
 * mkfs: fix potential race with udev leading to EBUSY due to repeatedly
   opened file descriptors
 * block-group-tree is out of experimental mode
    * available as 'mkfs.btrfs -O block-group-tree'
    * btrfstune can do in-place conversion to/from (use with care)
 * balance: fix recognizing old and new syntax
 * subvol snapshot: specific error if a failure is caused by an active swapfile
 * tree-stats: rephrase warning when run on a mounted filesystem
 * completion: 'filesystem du' also completes files
 * check: fix docs, help text and warning that --force + --repair works on a
   mounted filesystem
 * build: fix static build when static libudev is available
 * documentation:
    * more updates from wiki, developer docs, changelogs
    * reformatting
    * updates and fixes
 * other:
    * test updates and fixes
    * CI cleanups and old files removed
    * integration with Github actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.3.1.bb => btrfs-tools_6.3.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.1.bb => btrfs-tools_6.3.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
index 0bdf48ded2..e7a64e8363 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "9d2c8c364a6b8df4b1a47ad384cd75fd4ba53e12"
+SRCREV = "bb0ca35245858f17a6ced97aade1dd8d70f9c9d7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


