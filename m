Return-Path: <Kai.Kang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8526B66B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:58:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7D9wAlE009042
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2013 05:58:11 -0400 (EDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 13 Aug 2013 02:58:09 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 13 Aug 2013 17:57:49 +0800
Message-ID: <73b29b279c8979a5673dc601cd70aae35ac012b0.1376387750.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376387750.git.kai.kang@windriver.com>
References: <cover.1376387750.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] dpkg: fix include header caused compile error
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
X-List-Received-Date: Tue, 13 Aug 2013 09:58:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Build dpkg-native on Fedora 19, it fails with:

/usr/include/c++/4.8.1/cstdlib: In function ‘long long int std::abs(long long int)’:
/usr/include/c++/4.8.1/cstdlib:174:20: error: declaration of C function ‘long long int std::abs(long long int)’ conflicts with
   abs(long long __x) { return __builtin_llabs (__x); }
                    ^
/usr/include/c++/4.8.1/cstdlib:166:3: error: previous declaration ‘long int std::abs(long int)’ here
   abs(long __i) { return __builtin_labs(__i); }
   ^

That because header cstdlib is included in a 'extern "C"' block that gcc
4.8 doesn't support. Fix it by move the header file out of the 'extern "C"'
block.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../dpkg/dpkg/fix-abs-redefine.patch               | 40 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.1.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch b/meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch
new file mode 100644
index 0000000..e73311c
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Pending
+
+dpkg defines:
+#define DPKG_BEGIN_DECLS	extern "C" {
+
+That makes header cstdlib included in a extern "C" block which is not supported
+by gcc 4.8. It fails on Fedora 19:
+
+/usr/include/c++/4.8.1/cstdlib: In function ‘long long int std::abs(long long int)’:
+/usr/include/c++/4.8.1/cstdlib:174:20: error: declaration of C function ‘long long int std::abs(long long int)’ conflicts with
+   abs(long long __x) { return __builtin_llabs (__x); }
+                    ^
+/usr/include/c++/4.8.1/cstdlib:166:3: error: previous declaration ‘long int std::abs(long int)’ here
+   abs(long __i) { return __builtin_labs(__i); }
+   ^
+
+Move include gettext.h out of the extern "C" block to fix this issue.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+--- dpkg-1.17.1/lib/dpkg/i18n.h.orig	2013-08-13 17:31:28.870935573 +0800
++++ dpkg-1.17.1/lib/dpkg/i18n.h	2013-08-13 17:31:37.893065249 +0800
+@@ -23,8 +23,6 @@
+ 
+ #include <dpkg/macros.h>
+ 
+-DPKG_BEGIN_DECLS
+-
+ /**
+  * @defgroup i18n Internationalization support
+  * @ingroup dpkg-internal
+@@ -33,6 +31,8 @@
+ 
+ #include <gettext.h>
+ 
++DPKG_BEGIN_DECLS
++
+ /* We need to include this because pgettext() uses LC_MESSAGES, but libintl.h
+  * which gets pulled by gettext.h only includes it if building optimized. */
+ #include <locale.h>
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
index 9ac2aa7..01027a0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://noman.patch \
             file://preinst.patch \
             file://fix-timestamps.patch \
             file://remove-tar-no-timestamp.patch \
+            file://fix-abs-redefine.patch \
            "
 
 SRC_URI[md5sum] = "ece3ae87a099158c17bde95c0036c575"
-- 
1.8.1.2


