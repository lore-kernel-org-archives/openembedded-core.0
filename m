Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20F5C6EBA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9h0Wi024449
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:00 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:42:40 +0800
Message-ID: <b67a3e41eb613d97170958cdbf5a2007c400e083.1395996041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996041.git.hongxu.jia@windriver.com>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/6] wayland-native: disable unused macro checks to fix build issue on Centos5.x
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:01 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

We only build wayland-native for the scanner, so disable the bits we
don't actually need. This avoid build issue on older distro such as
Centos 5.x:
| error: 'O_CLOEXEC' undeclared (first use in this function)
| error: sys/timerfd.h: No such file or directory
| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
| error: 'TFD_CLOEXEC' undeclared (first use in this function)
| error: 'SFD_CLOEXEC' undeclared (first use in this function)

Signed-off-by: Ting Liu <b28495@freescale.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...disable-macro-checks-not-used-for-scanner.patch | 50 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.4.0.bb     |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch

diff --git a/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
new file mode 100644
index 0000000..bf499bb
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
@@ -0,0 +1,50 @@
+disable macro checks not used for scanner
+
+We only build wayland-native for the scanner, so disable the bits we don't
+actually need. This avoid build issue on older distro such as Centos 5.x:
+| error: 'O_CLOEXEC' undeclared (first use in this function)
+| error: sys/timerfd.h: No such file or directory
+| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
+| error: 'TFD_CLOEXEC' undeclared (first use in this function)
+| error: 'SFD_CLOEXEC' undeclared (first use in this function)
+
+Upstream-Status: Pending
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ configure.ac | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,16 +41,16 @@ AC_SUBST(GCC_CFLAGS)
+ 
+ AC_CHECK_FUNCS([accept4 mkostemp])
+ 
+-AC_CHECK_DECL(SFD_CLOEXEC,[],
+-	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
+-	      [[#include <sys/signalfd.h>]])
+-AC_CHECK_DECL(TFD_CLOEXEC,[],
+-	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
+-	      [[#include <sys/timerfd.h>]])
+-AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+-	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
+-	      [[#include <time.h>]])
+-AC_CHECK_HEADERS([execinfo.h])
++##AC_CHECK_DECL(SFD_CLOEXEC,[],
++#	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
++#	      [[#include <sys/signalfd.h>]])
++#AC_CHECK_DECL(TFD_CLOEXEC,[],
++#	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
++#	      [[#include <sys/timerfd.h>]])
++#AC_CHECK_DECL(CLOCK_MONOTONIC,[],
++#	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
++#	      [[#include <time.h>]])
++#AC_CHECK_HEADERS([execinfo.h])
+ 
+ AC_ARG_ENABLE([scanner],
+               [AC_HELP_STRING([--disable-scanner],
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.4.0.bb b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
index 604b7f4..9f6419d 100644
--- a/meta/recipes-graphics/wayland/wayland_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "332cf9191837be12638a29265ed7cf46"
 SRC_URI[sha256sum] = "18f33b9f15b4c8b662fb1968e7636e7926b419dfc48de8a164b3a3d7095c5a58"
 
-SRC_URI_append_class-native = " file://just-scanner.patch"
+SRC_URI_append_class-native = " file://just-scanner.patch \
+    file://disable-macro-checks-not-used-for-scanner.patch \
+    "
 EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
 
 inherit autotools pkgconfig
-- 
1.8.1.2


