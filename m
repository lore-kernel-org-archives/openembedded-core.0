Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
 by mx.groups.io with SMTP id smtpd.web12.30298.1629983770065930341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 194.138.37.39, mailfrom: andrej.valek@siemens.com)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 17QDG7jV029570
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 15:16:08 +0200
Received: from md3hr6tc.ad001.com ([167.87.72.226])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 17QDG7Lb004628;
	Thu, 26 Aug 2021 15:16:07 +0200
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v2] vim: add option to disable NLS support
Date: Thu, 26 Aug 2021 15:15:49 +0200
Message-Id: <20210826131549.2349482-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823101205.29267-1-andrej.valek@siemens.com>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Some distributions with UTF-8 locale have problem when National Language
Support is enabled. Add there an option to disable it.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/vim/vim.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 17d1c24a7c..860fd24863 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -54,11 +54,12 @@ do_compile() {
     autotools_do_compile
 }
 
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny selinux, elfutils, nls
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
+    nls \
 "
 
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
@@ -67,6 +68,7 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
 PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
+PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 
 EXTRA_OECONF = " \
     --disable-gpm \
-- 
2.31.1

