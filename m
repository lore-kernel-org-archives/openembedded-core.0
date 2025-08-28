Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDA9C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 10:45:54 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.17809.1756377951996137276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 03:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=QhuwrRIG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1328017-20250828104541e99d11bfe30002074b-02bjny@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250828104541e99d11bfe30002074b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 28 Aug 2025 12:45:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dI6ol3tAsJNOaszZZ5M3y2YQtp4er+CgjZ6czXBSVOs=;
 b=QhuwrRIGmI24dvTs5Z0Jev9+lEmbVdIJFpDoaBGqal3KthssdT4/BCBbjJoRqGb+m/pLty
 ZL3E1ql9FKQBXIVNA7p0HgOziOsOE8adyEppGoWDznX8FVTnmC3VK0fcYpIEMPunIRLLjL8g
 JnbLjmwfUMiHfirmGeHH/pATw2zvr3cKHLVJ2zS/fMAp7w3zHYqyE8ZAgqid1zLE+pHitthT
 AjVYokVNomS38/Yj9BoJWTnMVeZLdALn+579P40kPZXPR1z5EzGdQI06NQPyY3iRn5xy0E5c
 XV8WAeZfK1/XTwOUp9a6/gxfUC5LE7o3NuB4WJCumei65sotuBBGuJ+Q==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] connman: Revert removal of no-version-scripts patch
Date: Thu, 28 Aug 2025 12:40:47 +0200
Message-ID: <20250828104401.3627-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222558

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

This commit restores the no-version-scripts.patch for ConnMan,
which was removed in the commit (5c269ba9a396832af3f8139ecaa0cfd9f7d4d1b5)
as part of cleaning up gold and MIPS binutils workarounds.

The removal of this patch caused runtime crashes (segfaults)
on the powerpc target due to symbol visibility issues with glib
and stdio. Re-adding the patch resolves these crashes by disabling
version scripts in the linker flags.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 .../connman/connman/no-version-scripts.patch  | 48 +++++++++++++++++++
 .../connman/connman_1.45.bb                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/no-version-scripts.patch

diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
new file mode 100644
index 0000000000..c96ab311e5
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
@@ -0,0 +1,48 @@
+From 67f37aafcc8ef5d2eb006387e7bec21f74518727 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 Aug 2016 12:12:02 +0100
+Subject: [PATCH] connman: disable version-scripts to fix crashes at startup
+
+With binutils 2.27 on at least PowerPC, connmand will crash on `connmand --help`.
+This appears to be due to the symbol visibilty scripts hiding symbols that stdio
+looks up at runtime, resulting in it segfaulting.
+
+This certainly appears to be a bug in binutils 2.27 although the problem has
+been known about for some time:
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=17908
+
+As the version scripts are only used to hide symbols from plugins we can safely
+remove the scripts to work around the problem until binutils is fixed.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
+---
+ Makefile.am | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3dc3bb5..3be5ccb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -143,8 +143,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+ 			@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
+ 			-lresolv -ldl -lrt
+ 
+-src_connmand_LDFLAGS = -Wl,--export-dynamic \
+-				-Wl,--version-script=$(srcdir)/src/connman.ver
++src_connmand_LDFLAGS = -Wl,--export-dynamic
+ 
+ src_connmand_wait_online_SOURCES = src/connmand-wait-online.c
+ 
+@@ -187,8 +186,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+ 				@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
+ 				-lresolv -ldl
+ 
+-vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic \
+-				-Wl,--version-script=$(srcdir)/vpn/vpn.ver
++vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic
+ endif
+ 
+ BUILT_SOURCES = $(local_headers) src/builtin.h $(service_files) \
diff --git a/meta/recipes-connectivity/connman/connman_1.45.bb b/meta/recipes-connectivity/connman/connman_1.45.bb
index cfc6114712..85f14eb80e 100644
--- a/meta/recipes-connectivity/connman/connman_1.45.bb
+++ b/meta/recipes-connectivity/connman/connman_1.45.bb
@@ -20,6 +20,7 @@ DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
+           file://no-version-scripts.patch \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
-- 
2.47.2


