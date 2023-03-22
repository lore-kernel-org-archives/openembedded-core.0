Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A75C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 02:20:50 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.33424.1679451645239611479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 19:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BQRgW32/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679451643; i=@fujitsu.com;
	bh=fdmgC8cys5pdE3eGrEwazjnUwC/9Q7H2k6VsRgs93eo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BQRgW32/CrB1MHSwh+IMBfJhGmPPyIToQDkFXLTeodXGRHTYx2jenUbIdtB3J4rCd
	 450HDipHqoVFSyhPEeYiWkv3m/LdURzZ3QOSOx9ReIiizx7MbitCN6ES+aXqwJn3Ms
	 bSEwahwtAmKVzep2LwYRjgAJD2C4LYgDsUvANWKvTBhMhknQ0+xqRhaShGvsZf9j33
	 dhPWfPy0n6MlCGJZXEEUfLgrPWrhk/ie4Ta7U3mdsOE5/nBF0CdI2yWJpP5VV0XuwU
	 c7kMqLrJDzJwi1l82bRBOtobvOdbg4PPJQYyaIe57uGlkKvWJwloN/edEbXU78TlwG
	 cXK8abjwtYOsQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORpPsrVSr
  FYN0BcYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP/mtvMBe9EKl5+b2JrYLwt1MXIxSEk8IBR
  ouPiNjYI5zKTRN+EZSwQzh5GidMn5jB3MXJysAlISdy4/x+oioNDREBP4uo/UZAws4CKxIvfP
  ewgtrBAsMStty/BylkEVCXaJ61gBbF5BZwkfr1ZzwZiSwgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8YIaoUZSYfbmZBcKukGicfogJwlaTuHpuE/MERv5ZSNpnIWlfwMi0itG0OLWoLLVI10wvqSg
  zPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAUU4rVf+1gnNn3
  V+8QoyQHk5Ior2W4VIoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7iJKCcYFFqempFWmYOMC5g0
  hIcPEoivP9EgdK8xQWJucWZ6RCpU4zGHGsbDuxl5ujc33WAWYglLz8vVUqcNwlkiwBIaUZpHt
  wgWLxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuzsFaApPZl4J3L5XQKcwAZ0SN0MC5JS
  SRISUVAPT8g/u94SvWS+RWmp1ZWlBbyCb77zyUyocr4Qk98XGBrxhvanj1Z2bsUY/avKfw99P
  Hg+uMPkQr9OR9pxPas7sk67838LidVt5LS63bOnImJnLvnG+aeyTH1dXVC/iCZ3wt7ln3jvpB
  5VmF39Gacp8WnBJ4Ueu7otm05nGEskl31adl06sfDUlXss9Wz3I7sGek9f0iy7Xls/7/Mz7aQ
  R3t6itjmPfyn0iYdY/ZSP7q1MYFu+ueTn/a1qw9H6F+Y5xRscklqW9Unx142gV0+bfLfobvdZ
  1Nx7zuf38/WGdR/Naz83/7L2LKaxhE7vRgu6XMtvO356ekvutsbr8yZOUUK/q7+nJX1M5Swvz
  +kuVWIozEg21mIuKEwEa029qUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-571.messagelabs.com!1679451642!665026!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1714 invoked from network); 22 Mar 2023 02:20:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Mar 2023 02:20:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1CC751B7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:20:42 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 11ADC1AE
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:20:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 22 Mar 2023 02:20:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V3] xcb-proto: Fix install conflict when enable multilib.
Date: Wed, 22 Mar 2023 10:20:26 +0800
Message-ID: <1679451626-10625-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178904

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/pkgconfig/xcb-proto.pc conflicts between attempted installs of lib32-xcb-proto-dev-1.15.2-r0.armv7ahf_neon and xcb-proto-dev-1.15.2-r0.cortexa57

The differences between the two files are as follows:
@@ -2,7 +2,7 @@
 exec_prefix=/usr
 datarootdir=${prefix}/share
 datadir=/usr/share
-libdir=/usr/lib64
+libdir=/usr/lib
 xcbincludedir=${pc_sysrootdir}${datadir}/xcb
 PYTHON_PREFIX=${prefix}
 pythondir=${pc_sysrootdir}${libdir}/python3.11/site-packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nstall-conflict-when-enable-multilib.patch | 27 +++++++++++++++++++
 .../xorg-proto/xcb-proto_1.15.2.bb            |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
new file mode 100644
index 0000000000..c263a22792
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
@@ -0,0 +1,27 @@
+From fc28149b6b198042c8d29e0931415adad7ed3231 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 16 Mar 2023 08:03:47 +0000
+Subject: [PATCH] Fix install conflict when enable multilib.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8b57a83..580f5bc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ SUBDIRS = src xcbgen
+ 
+-pkgconfigdir = $(datarootdir)/pkgconfig
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = xcb-proto.pc
+ 
+ EXTRA_DIST=doc xcb-proto.pc.in autogen.sh README.md
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 4e4472a9c1..e60e7958a7 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
 
 SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz \
            file://0001-xcb-proto.pc.in-reinstate-libdir.patch \
+           file://0001-Fix-install-conflict-when-enable-multilib.patch \
            "
 SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
 
-- 
2.34.1


