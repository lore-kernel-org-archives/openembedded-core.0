Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862EAD59D9D
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.36000.1732584617971786418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NM/11P2o;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584618; x=1764120618;
  h=from:to:cc:subject:date:message-id;
  bh=N3Kfv1NOUuxX4QT8CwboSH8WuZeGvwwds0Vom4EzqlU=;
  b=NM/11P2oFu9Z446Ky4iR1p2p2eH4R4r+14bbtTkF4BSO7G7v642NHUPJ
   bU+mQvMv0CEIgfR6is0+ezpnyQ4D+gm6pinzH+6YqQo1BPahkI/l7tvnO
   eE+0sswn5/fX8xGVf4pu4RvhdH52Hv6z2u5FMglDL6NBoe4zlILz/zF79
   RpexrCfP/999N9A1UDbbwz1IIDNXS89zQtdp7z2kl+u693eYf9u2ozp9s
   Pd3+IN5D2DGd0lerCWuaEW1HZPrLA7JvQ1sc573amvPB4QnkkkMD8lWIh
   0xV/r3N9YbHYf1goEBlft6ZARI7nVHGLU5WiDz7EZYZBxBU703w9Xhm+r
   A==;
X-CSE-ConnectionGUID: G8BaJ1whSj+rzZnOOTK2pg==
X-CSE-MsgGUID: 2WFUkLrlQbeuvT9bbnA3Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="180811750"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="180811750"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 02B59E8525
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BE7AD506C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2311E2007B73D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A12441A006C;
	Tue, 26 Nov 2024 09:30:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/16] dnf: upgrade 4.21.1 -> 4.22.0
Date: Tue, 26 Nov 2024 09:29:47 +0800
Message-Id: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.003
X-TMASE-Result: 10--13.376600-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yTo39wOA02LhpxAd6mi1Ga3lJkaUfULls4kf
	nWnmAf+luUyUby5jcYvcQej87rOHWdJX5e6Thzb2KL7Hv3JYI6xezmeoa8MJ8/ZqmYjn42vP6o5
	I451FHlrh2Y2P4WCZifUKxjSPa6XdkMTwDwEyZfMIoUOTWQl7EgRryDXHx6oXDed/BxnuiN/CKy
	chs7yHQ93O0mPHmUouedu/gVuQyeBaQiLka9EcSrnHu4BcYSmt1cuIRwt/4MjAuQ0xDMaXkBR9C
	CnoYWqGAwr1d1MD+njjJ/omXf9o5FgEuvtGmjsLfOaYwP8dcX4Qtuqs6BbPJyxMw0FMkBlZV1dX
	xFnzSPc6hUOcTonr9IAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7GtHguSH+RU9HZEszpcUq6VuSGN
	smH2aItTEiWa+QKvXa1O+twXU0xA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207809

From: Wang Mingyu <wangmy@fujitsu.com>

0005-Do-not-prepend-installroot-to-logdir.patch
refreshed for 4.22.0

Changelog:
=============
- doc: Naming of source and debug repos
- Fix /var/cache/dnf and /etc/yum packaging
- Allow --installroot on read-only bootc system
- spec: If DNF5 obsoletes DNF, do not build dnf and yum packages
- Print rpm unpack errors to the user (RhBug:2312906)
- package: remote_location() takes basedir into account
- spec: If DNF5 obsoletes DNF, do not build dnf-automatic
- Allow --downloadonly on read-only bootc system
- Add kernel-core to reboot_needed list
- Update need_reboot for dnf-automatic
- doc: Example send_error_messages in /etc/dnf/automatic.conf
- automatic: Check availability of config file
- Updated conf_ref to reflect change in fastestmirror behavior
- doc: Fix display issue of a code snippet

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.21.1.bb => dnf_4.22.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.21.1.bb => dnf_4.22.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a85e6e3b03..a1c58d6563 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From a8bf39b4ecdbdfd6e6934ca046239f683a9e08e1 Mon Sep 17 00:00:00 2001
+From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index 0eda2c8c..488a0662 100644
+index d3844df3..ac080f79 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -952,7 +952,7 @@ class Cli(object):
+@@ -954,7 +954,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf_4.21.1.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.21.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.22.0.bb
index 09bdbd88a8..3f94dfc9a5 100644
--- a/meta/recipes-devtools/dnf/dnf_4.21.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "9717c055b5ce94eba8c7144e6e4fea6ab6c97f6f"
+SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


