Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEF0CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 10:42:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.10104.1757328127513313943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 03:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=F0zIH3Ef;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1328017-202509081042013800d7c510000207fb-mduxxp@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202509081042013800d7c510000207fb
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Sep 2025 12:42:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZZ43oYjwyaIRDOjgUUHl+wF1hIB5IFxOAgmoCVfzfYY=;
 b=F0zIH3Ef3WfoEf49rS+Kg6ZAIB+DpZtZD9hr+KCighY2OpkhuA/wLbSUJOGhntMvsy/mbX
 V5oHgAY6n3q9a9YSoh8ar/Go6T27EUyF6zWRd/Ypbw04ZzdUquCRrZC6Z4WXQmgqTJlsV71v
 rYJoNtF8fDUBfbEgRYS79Lj++eIwv+W9YgsGtJvUuGgTHxeXjagUPor/tvLpbVcJsPLjnChp
 l8RMKwkA1CnpFD+piSCJXNFCaR3pMksOqEt8gK17MyWKU3LCGS60LOVoMN6R+yxyb/ULT0OQ
 3G8Pt1QK7g3MFi0V+ng+Jl/XCFxtTuqhV90o6LEL+OCIOV0YJVDNoC+A==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH v2] connman: avoid hiding implementation-reserved symbols in version scripts
Date: Mon,  8 Sep 2025 12:41:57 +0200
Message-Id: <20250908104157.1296-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 10:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223064

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
index 0000000000..3b7b5a096e
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
+Upstream-Status: Submitted [https://lore.kernel.org/connman/20250907081844.1558-1-peter.tatrai.ext@siemens.com/]
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


