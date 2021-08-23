Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web09.21798.1629713577280697946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 03:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17NACsFF023512
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 12:12:54 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.34])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 17NACreM010194;
	Mon, 23 Aug 2021 12:12:54 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B9B31950A87;
	Mon, 23 Aug 2021 12:12:51 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] vim: add option to disable NLS support
Date: Mon, 23 Aug 2021 12:12:05 +0200
Message-Id: <20210823101205.29267-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

- Some distributions with UTF-8 locale have problem when National Language
 Support is enabled. Add there an option to disable it.
- refresh options based on configure.ac

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/vim/vim.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 17d1c24a7c..7cc47884f2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -54,19 +54,21 @@ do_compile() {
     autotools_do_compile
 }
 
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny, selinux, elfutils, nls
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
+    nls \
 "
 
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
+PACKAGECONFIG[acl] = "enable_acl="yes",--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
+PACKAGECONFIG[selinux] = "enable_selinux="yes",--disable-selinux,libselinux,"
 PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
+PACKAGECONFIG[nls] = "enable_nls="yes",--disable-nls,,"
 
 EXTRA_OECONF = " \
     --disable-gpm \
-- 
2.11.0

