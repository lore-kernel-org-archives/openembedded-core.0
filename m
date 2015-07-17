Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 89BF665CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 06:37:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98551947"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jul 2015 14:41:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6H6a3wt030780
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:36:03 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 17 Jul 2015 14:37:49 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jul 2015 14:37:41 +0800
Message-ID: <1437115061-1635-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH] gtk+: Fix bug in gtk-demo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2015 06:37:58 -0000
Content-Type: text/plain

Modify gtkrc.c,otherwise the input-methods can not be enabled in gtk-demo.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch | 30 ++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.28.bb            |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch b/meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch
new file mode 100644
index 0000000..59a707c
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch
@@ -0,0 +1,30 @@
+From 3080e6d55f12b5ba453723f295653c1696c4ad44 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Wed, 15 Jul 2015 20:05:05 +0900
+Subject: [PATCH] gtkrc.c: Bug fix
+
+Modify gtkrc.c, otherwise the input-methods can not be enabled in gtk-demo.
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ gtk/gtkrc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gtk/gtkrc.c b/gtk/gtkrc.c
+index 50b2563..4e6b618 100644
+--- a/gtk/gtkrc.c
++++ b/gtk/gtkrc.c
+@@ -450,7 +450,7 @@ gtk_rc_get_im_module_file (void)
+       if (im_module_file)
+ 	result = g_strdup (im_module_file);
+       else
+-        result = gtk_rc_make_default_dir ("immodules.cache");
++        result = g_build_filename (GTK_SYSCONFDIR, "gtk-2.0", "gtk.immodules", NULL);
+     }
+ 
+   return result;
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
index e343773..9576670 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://toggle-font.diff;striplevel=0 \
            file://doc-fixes.patch \
            file://strict-prototypes.patch \
+           file://gtkrc.c-Bug-fix.patch \
 	  "
 
 SRC_URI[md5sum] = "bfacf87b2ea67e4e5c7866a9003e6526"
-- 
1.8.4.2


