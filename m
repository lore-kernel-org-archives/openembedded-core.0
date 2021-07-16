Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494708"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494708"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075593"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 28/28] xserver-xorg: Fix builds without glx
Date: Fri, 16 Jul 2021 10:42:26 +0800
Message-Id: <e458c15627e7b27392d158cbb9417f66424aa7d5.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wadim Egorov <w.egorov@phytec.de>

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...nd-Makefile.am-fix-build-without-glx.patch | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch
new file mode 100644
index 0000000000..4c9cb0ebb2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch
@@ -0,0 +1,46 @@
+From 836f93de99b35050d78d61d3654f7c5655184144 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 19 Apr 2019 10:19:50 +0200
+Subject: [PATCH] hw/xwayland/Makefile.am: fix build without glx
+
+Commit d8ec33fe0542141aed1d9016d2ecaf52da944b4b added libglxvnd.la to
+Xwayland_LDFLAGS but GLX can be disabled through --disable-glx.
+In this case, build fails on:
+
+make[3]: *** No rule to make target '../../glx/libglxvnd.la', needed by 'Xwayland'.  Stop.
+make[3]: *** Waiting for unfinished jobs....
+
+Fixes:
+ - http://autobuild.buildroot.org/results/397f8098c57fc6c88aa12dc8d35ebb1b933d52ef
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/836f93de99b35050d78d61d3654f7c5655184144]
+Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
+---
+ hw/xwayland/Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xwayland/Makefile.am b/hw/xwayland/Makefile.am
+index bc1cb8506..502879e2a 100644
+--- a/hw/xwayland/Makefile.am
++++ b/hw/xwayland/Makefile.am
+@@ -21,10 +21,14 @@ Xwayland_SOURCES =				\
+ 	$(top_srcdir)/Xi/stubs.c		\
+ 	$(top_srcdir)/mi/miinitext.c
+ 
++if GLX
++GLXVND_LIB = $(top_builddir)/glx/libglxvnd.la
++endif
++
+ Xwayland_LDADD =				\
+ 	$(glamor_lib)				\
+ 	$(XWAYLAND_LIBS)			\
+-	$(top_builddir)/glx/libglxvnd.la	\
++	$(GLXVND_LIB)				\
+ 	$(XWAYLAND_SYS_LIBS)			\
+ 	$(top_builddir)/Xext/libXvidmode.la	\
+ 	$(XSERVER_SYS_LIBS)
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index 755a762a73..e0551fa999 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            file://CVE-2021-3472.patch \
+           file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.31.1

