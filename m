Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C437CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:12:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10682.1760515934109051350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Bgeecx7X;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760515934; x=1792051934;
  h=from:to:subject:date:message-id;
  bh=vAWgpFAUXV8ESs8HxkCtmJG1v7pBDH63/OVJ2hlSPTk=;
  b=Bgeecx7XiQKOZNTJMIecIIwOjSm4TbPLtrghIN+oLMPg1GwJnoWtApgu
   hErbzOwPsK+C0BbNj4jGydyUxTRkFlY1WJkk9LWq/IkhubG7wETVDgjar
   k+rW7SNSTGfsHdGmMbgqd9UcYLBa5OizL7873gp9FYzgbpHXHmv8Crwk0
   ERyPn94RBWXKlRuyg0DcGwsfTqyXkR9IfmuEh1FD22NYGDB6wZA0Q9mSu
   J2EdHAROYs9eEoXI3Ik/74ljUikGG8fDqqHDGY2HUH6CArsSVfg2z7zTb
   BlaLJ2UP5ROQyMPT2vB9NsQgQ2HjahzGE7DB856jwFnB1yTMcuzEWCA8w
   Q==;
X-CSE-ConnectionGUID: 7W8lWekVTZe1ObKJ+Fho3Q==
X-CSE-MsgGUID: Z7db/rBWTHWDTwgRFALmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="216581413"
X-IronPort-AV: E=Sophos;i="6.19,230,1754924400"; 
   d="scan'208";a="216581413"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:12:12 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 73AEF42A335
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:12:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2D05BC01EFF
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:12:12 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4F4FB101C3E1
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:12:10 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kea: fix installation umask to 0022 of meson.
Date: Wed, 15 Oct 2025 16:11:56 +0800
Message-Id: <20251015081156.11738-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224882

The default installation umask of 0027 for Kea-built artifacts, particularly for directories like /usr/lib, results in restrictive permissions (0750, drwxr-x---).This deviates from the common Linux and Yocto standard of 0755 (drwxr-xr-x) for shared library directories.

And it caused package conflicts as following:
Error: Transaction test error:
  file /usr/lib/pkgconfig conflicts between attempted installs of kea-dev-3.0.1-r0.x86_64_v3 and btrfs-tools-dev-6.16-r0.x86_64_v3
  file /usr/lib/pkgconfig conflicts between attempted installs of libgcrypt-dev-1.11.2-r0.x86_64_v3 and kea-dev-3.0.1-r0.x86_64_v3

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...n-Correct-installation-umask-to-0022.patch | 34 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-meson-Correct-installation-umask-to-0022.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-meson-Correct-installation-umask-to-0022.patch b/meta/recipes-connectivity/kea/files/0001-meson-Correct-installation-umask-to-0022.patch
new file mode 100644
index 0000000000..0d68c5823f
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-meson-Correct-installation-umask-to-0022.patch
@@ -0,0 +1,34 @@
+From 4cf8b90e89fd4834afc9710ae98d6541def066d0 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 15 Oct 2025 07:04:59 +0000
+Subject: [PATCH] meson: Correct installation umask to 0022.
+
+The default installation umask of 0027 for Kea-built artifacts, particularly for directories like /usr/lib, results in restrictive permissions (0750, drwxr-x---).This deviates from the common Linux and Yocto standard of 0755 (drwxr-xr-x) for shared library directories.
+
+And it caused package conflicts as following:
+Error: Transaction test error:
+  file /usr/lib/pkgconfig conflicts between attempted installs of kea-dev-3.0.1-r0.x86_64_v3 and btrfs-tools-dev-6.16-r0.x86_64_v3
+  file /usr/lib/pkgconfig conflicts between attempted installs of libgcrypt-dev-1.11.2-r0.x86_64_v3 and kea-dev-3.0.1-r0.x86_64_v3
+
+Upstream-Status: Submitted https://gitlab.isc.org/isc-projects/kea/-/issues/4171
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index f1016e2..af7b864 100644
+--- a/meson.build
++++ b/meson.build
+@@ -26,7 +26,7 @@ project(
+         'b_lundef=false',  # required for clang++ when used with sanitizers and for BSD ld when linking with extern char **environ.
+         'b_pch=false',
+         'b_pie=true',
+-        'install_umask=0027',
++        'install_umask=0022',
+         'warning_level=2',
+     ],
+ )
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index cc34c05093..2d64917e51 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
+           file://0001-meson-Correct-installation-umask-to-0022.patch \
            "
 SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a24c566"
 
-- 
2.43.0


