Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Sx8mV-000325-BV
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 05:42:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q733Unq4011546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 20:30:49 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 2 Aug 2012 20:30:49 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2012 11:30:21 +0800
Message-ID: <9ed1d4d30aeac33273968b00c0b5afab059bbc0f.1343964466.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343964466.git.wenzong.fan@windriver.com>
References: <cover.1343964466.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] gdk-pixbuf: fix parallel install issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 03:42:31 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This patch fixes parallel install issue that lib libpixbufloader-png.la
depends on libgdk_pixbuf-2.0.la which will be regenerated during insta-
llation, if libgdk_pixbuf-2.0.la is regenerating and at the same time
libpixbufloader-png.la links it, the error will happen.

Error message is:
* usr/bin/ld: cannot find -lgdk_pixbuf-2.0
* collect2: ld returned 1 exit status

Make an explicit dependency to the libs install targets would fix this
issue.

[YOCTO #2883]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../extending-libinstall-dependencies.patch        |   42 ++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/extending-libinstall-dependencies.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/extending-libinstall-dependencies.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/extending-libinstall-dependencies.patch
new file mode 100644
index 0000000..edbdced
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/extending-libinstall-dependencies.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Pending
+
+This patch fixes parallel install issue that lib libpixbufloader-png.la
+depends on libgdk_pixbuf-2.0.la which will be regenerated during insta-
+llation, if libgdk_pixbuf-2.0.la is regenerating and at the same time
+libpixbufloader-png.la links it, the error will happen.
+
+Error message is:
+* usr/bin/ld: cannot find -lgdk_pixbuf-2.0
+* collect2: ld returned 1 exit status
+
+Make an explicit dependency to the libs install targets would fix this
+issue.
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ gdk-pixbuf/Makefile.am |    1 +
+ libdeps.mk             |    3 +++
+ 2 files changed, 4 insertions(+), 0 deletions(-)
+ create mode 100644 libdeps.mk
+
+diff --git a/gdk-pixbuf/Makefile.am b/gdk-pixbuf/Makefile.am
+index 95a93a8..db44cae 100644
+--- a/gdk-pixbuf/Makefile.am
++++ b/gdk-pixbuf/Makefile.am
+@@ -783,3 +783,4 @@ loaders.cache:
+ endif
+ 
+ -include $(top_srcdir)/git.mk
++-include $(top_srcdir)/libdeps.mk
+diff --git a/libdeps.mk b/libdeps.mk
+new file mode 100644
+index 0000000..d7a10a8
+--- /dev/null
++++ b/libdeps.mk
+@@ -0,0 +1,3 @@
++# Extending dependencies of install-loaderLTLIBRARIES:
++# The $(lib-LTLIBRARIES) is needed by relinking $(loader_LTLIBRARIES)
++install-loaderLTLIBRARIES: install-libLTLIBRARIES
+-- 
+1.7.6.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 8e13115..484fb12 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -15,12 +15,13 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
            file://configure_nm.patch \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
+           file://extending-libinstall-dependencies.patch \
            "
 
 SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
 SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
 
-PR = "r3"
+PR = "r4"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.9.5



