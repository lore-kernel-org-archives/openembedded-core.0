Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41664CA1013
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 10:46:18 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.16631.1757241975301504790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 03:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=kZpxMnu/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1328017-2025090710460911e6638777000207ad-dkpncg@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025090710460911e6638777000207ad
        for <openembedded-core@lists.openembedded.org>;
        Sun, 07 Sep 2025 12:46:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KopreZlQG1K1OC3YJ+jXSQ+0Vm5T42FnBc//pC5RtXE=;
 b=kZpxMnu/PBrBhpNKuqYc6zphxGA70xLQU2Essl3eNWkIg8J/0uBgjY+ZqKB1CD/qZPTT6u
 D4FzW3K11b4Hf8t8AEIhVEac1gorFA87uCf+WGt8hMXtA5px2I0detgkLnmbxj7eHGFnXtcy
 8xzH1ZCfocOq25DS8Z0XtwWU2CXqAvOBkaCukX+Ps9jbRr9/PudVsseTx6wUAycq8ARTZZPJ
 vN4EUVGmodPY+Sq5AnACqIvsoC11LycF6lwCqZoEbBXGD1VzFC1bCZLjGOn9N2nBZ5ulxN8W
 8rsKLUOswOE57kAYFrecFYR8mCvE3fpvt0POGARmCpwZ1BkJ/H/glzww==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] connman: avoid hiding implementation-reserved symbols in version scripts
Date: Sun,  7 Sep 2025 12:45:28 +0200
Message-Id: <20250907104528.2828-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 10:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223047

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

This commit adds a patch to ConnMan that modifies the version scripts
(src/connman.ver and vpn/vpn.ver) to avoid hiding implementation-reserved
symbols (such as _IO_stdin_used). Previously, using 'local: *;' in the
version script caused glibc's libio to misdetect the libc version,
resulting in a crash when printing to stdout (e.g., running 'connmand
--help') on PowerPC.

The new patch changes 'local: *;' to 'local: [!_]*;', following the
recommendation in glibc bug 17908
(https://sourceware.org/bugzilla/show_bug.cgi?id=17908). This ensures
that symbols starting with an underscore are not hidden, allowing libio
to correctly detect the libc version and preventing the crash.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 ...d-hiding-implementation-reserved-sym.patch | 50 +++++++++++++++++++
 .../connman/connman_1.45.bb                   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100755 meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
new file mode 100755
index 0000000000..5a4d9b72a5
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
@@ -0,0 +1,50 @@
+From eac489c872c775c88bbd85b4cec6c1d47ad9e6a6 Mon Sep 17 00:00:00 2001
+From: Peter Tatrai <peter.tatrai.ext@siemens.com>
+Date: Sun, 7 Sep 2025 09:25:20 +0200
+Subject: [PATCH] connman, vpn: avoid hiding implementation-reserved symbols
+
+When using 'local: *;' in the version script, all symbols, including those
+reserved for the implementation (such as _IO_stdin_used), are hidden. This
+causes glibc's libio to misdetect the libc version, leading to a crash when
+glibc prints to stdout (e.g., with connmand --help) on PowerPC.
+
+Change 'local: *;' to 'local: [!_]*;' to avoid hiding symbols starting with an
+underscore, as recommended in glibc bug 17908
+(https://sourceware.org/bugzilla/show_bug.cgi?id=17908). This ensures libio can
+correctly detect the libc version and prevents the crash.
+
+Reference: https://sourceware.org/bugzilla/show_bug.cgi?id=17908
+
+Upstream-Status: Submitted [connman@lists.linux.dev]
+
+Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
+---
+ src/connman.ver | 2 +-
+ vpn/vpn.ver     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/connman.ver b/src/connman.ver
+index 03a0eec..b75e90d 100644
+--- a/src/connman.ver
++++ b/src/connman.ver
+@@ -3,5 +3,5 @@
+ 		connman_*;
+ 		g_dbus_*;
+ 	local:
+-		*;
++		[!_]*;
+ };
+diff --git a/vpn/vpn.ver b/vpn/vpn.ver
+index b887706..5cad344 100644
+--- a/vpn/vpn.ver
++++ b/vpn/vpn.ver
+@@ -4,5 +4,5 @@
+ 		vpn_*;
+ 		g_dbus_*;
+ 	local:
+-		*;
++		[!_]*;
+ };
+-- 
+2.47.2
+
diff --git a/meta/recipes-connectivity/connman/connman_1.45.bb b/meta/recipes-connectivity/connman/connman_1.45.bb
index cfc6114712..2bdd547ba6 100644
--- a/meta/recipes-connectivity/connman/connman_1.45.bb
+++ b/meta/recipes-connectivity/connman/connman_1.45.bb
@@ -20,6 +20,7 @@ DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
+           file://0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
-- 
2.47.2


