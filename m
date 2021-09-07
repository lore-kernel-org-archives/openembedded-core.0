Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.32582.1630998136647915212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207344515"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="207344515"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="537804521"
Received: from tengjieg-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.164])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/11] vim: add option to disable NLS support
Date: Tue,  7 Sep 2021 15:02:02 +0800
Message-Id: <79aef159411df59f4bbdb3d3dcc87be9a7b5010e.1630997270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630997270.git.anuj.mittal@intel.com>
References: <cover.1630997270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrej Valek <andrej.valek@siemens.com>

- Some distributions with UTF-8 locale have problem when National Language
Support is enabled. Add there an option to disable it.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da630d6d81a396c3e1635fbd7b8103df47ed2732)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 878d0f18ae..6fe8fb90db 100644
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

