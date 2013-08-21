Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4D66B915
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:14:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Aug 2013 16:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,930,1367996400"; d="scan'208";a="285060192"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2013 16:14:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: kai.kang@windriver.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:14:34 -0700
Message-Id: <1377126875-9856-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
References: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/4] libsdl: Backport xData32 patch for x11 update
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
X-List-Received-Date: Wed, 21 Aug 2013 23:14:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch  | 19 +++++++++++++++++++
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb         |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch

diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
new file mode 100644
index 0000000..f98b927
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
@@ -0,0 +1,19 @@
+libX11-1.5.99.901 has changed prototype of _XData32
+
+Upstream-Status: Backport
+<http://bugzilla.libsdl.org/show_bug.cgi?id=1769>
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+diff -r b6b2829cd7ef src/video/x11/SDL_x11sym.h
+--- a/src/video/x11/SDL_x11sym.h	Wed Feb 27 15:20:31 2013 -0800
++++ b/src/video/x11/SDL_x11sym.h	Wed Mar 27 16:07:23 2013 +0100
+@@ -165,7 +165,7 @@
+  */
+ #ifdef LONG64
+ SDL_X11_MODULE(IO_32BIT)
+-SDL_X11_SYM(int,_XData32,(Display *dpy,register long *data,unsigned len),(dpy,data,len),return)
++SDL_X11_SYM(int,_XData32,(Display *dpy,register _Xconst long *data,unsigned len),(dpy,data,len),return)
+ SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,len),)
+ #endif
+
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 1bee364..4209f37 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -22,7 +22,8 @@ PR = "r2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
-       "
+           file://libsdl-1.2.15-xdata32.patch \
+          "
 
 S = "${WORKDIR}/SDL-${PV}"
 
-- 
1.8.3.1


