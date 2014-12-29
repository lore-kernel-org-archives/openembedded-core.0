Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51FEB725F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 05:47:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBT5lhAI014318
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 28 Dec 2014 21:47:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Dec 2014 21:47:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 29 Dec 2014 13:47:25 +0800
Message-ID: <aa521c741e12e43aad83ef8254ffb1e40d30aec8.1419823474.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419823473.git.hongxu.jia@windriver.com>
References: <cover.1419823473.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] qt4-embedded: support c++0x stand for directfb
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
X-List-Received-Date: Mon, 29 Dec 2014 05:47:44 -0000
Content-Type: text/plain

While directfd upgrade to 1.7.6, it always includes directfb++ utils
when C++ is used and set c++0x as c++ standard.
(In git://git.directfb.org/git/directfb/core/DirectFB.git
commit b444bcae3197be9faf883460dcc239ef757d5922, and commit
522beeb76f2a8d2dee30d928d2a5955bd06cf25c)

The directfd in qt4-embedded is c++, and there was a build failure:
...
| qdirectfbwindowsurface.cpp:336:69: error: in C++98 'rect' must be
initialized by constructor, not by '{...}'
|      const DFBRectangle rect = { r.x(), r.y(), r.width(), r.height() };
...

The g++ used c++98 as default c++ standard, we should
explicitly set c++0x for directfd in qt4-embedded.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...figure-support-c-0x-standard-for-directfd.patch | 40 ++++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded.inc               |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-standard-for-directfd.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-standard-for-directfd.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-standard-for-directfd.patch
new file mode 100644
index 0000000..f3face5
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-standard-for-directfd.patch
@@ -0,0 +1,40 @@
+configure: support c++0x standard for directfd
+
+While directfd upgrade to 1.7.6, it always includes directfb++ utils
+when C++ is used and set c++0x as c++ standard.
+(In git://git.directfb.org/git/directfb/core/DirectFB.git
+commit b444bcae3197be9faf883460dcc239ef757d5922, and commit
+522beeb76f2a8d2dee30d928d2a5955bd06cf25c)
+
+The directfd in qt4 is c++, and there was a build failure:
+...
+| qdirectfbwindowsurface.cpp:336:69: error: in C++98 'rect' must be
+initialized by constructor, not by '{...}'
+|      const DFBRectangle rect = { r.x(), r.y(), r.width(), r.height() };
+...
+
+The g++ used c++98 as default c++ standard, we should
+explicitly set c++0x for directfd in qt4.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure b/configure
+index 5724bd6..ecc2f8b 100755
+--- a/configure
++++ b/configure
+@@ -6656,6 +6656,7 @@ if [ "$PLATFORM_QWS" = "yes" ]; then
+        if [ "${screen}" = "directfb" ] && [ "${CFG_CONFIGURE_EXIT_ON_ERROR}" = "yes" ]; then
+            if test -n "$PKG_CONFIG" && "$PKG_CONFIG" --exists directfb 2>/dev/null; then
+                QT_CFLAGS_DIRECTFB=`$PKG_CONFIG --cflags directfb 2>/dev/null`
++               QT_CFLAGS_DIRECTFB="$QT_CFLAGS_DIRECTFB -std=c++0x"
+                QT_LIBS_DIRECTFB=`$PKG_CONFIG --libs directfb 2>/dev/null`
+            elif directfb-config --version >/dev/null 2>&1; then
+                QT_CFLAGS_DIRECTFB=`directfb-config --cflags 2>/dev/null`
+-- 
+1.9.1
+
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index e87de4b..ef5cf2c 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -9,7 +9,9 @@ QT4EDEPENDS = ""
 QT_BASE_LIB  ?= "libqt-embedded"
 
 # Set necessary variables in the profile
-SRC_URI += "file://qte.sh"
+SRC_URI += "file://qte.sh \
+            file://0033-configure-support-c-0x-standard-for-directfd.patch \
+"
 
 QT_EMBEDDED_FLAGS ?= " \
     -embedded $QT_ARCH \
-- 
1.9.1


