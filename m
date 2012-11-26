Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TcvKf-00057p-Ql
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 10:50:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAQ9aJWw026907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 01:36:19 -0800 (PST)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 26 Nov 2012 01:36:17 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Nov 2012 17:36:32 +0800
Message-ID: <a530860b0ad79ae553563108eabb8dd042ac46a7.1353582422.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353582422.git.Qi.Chen@windriver.com>
References: <cover.1353582422.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/4] pth: add pkgconfig support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 09:50:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add pkgconfig support for pth

[YOCTO# 2453]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../pth/files/pth-add-pkgconfig-support.patch      |   44 ++++++++++++++++++++
 meta/recipes-support/pth/pth_2.0.7.bb              |   12 ++++--
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch

diff --git a/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch b/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
new file mode 100644
index 0000000..b92c977
--- /dev/null
+++ b/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: configure.ac
+==========================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -656,6 +657,13 @@ pth_acmac.h dnl
+ chmod +rx pthread-config
+ chmod +rx pth-config
+ )dnl
++
++PTH_VERSION=`echo $PTH_VERSION_STR | cut -d' ' -f1`
++AC_SUBST(PTH_VERSION)
++
++AC_CONFIG_FILES([pth.pc])
++AC_OUTPUT
++
+ if test ".$enable_pthread" = .no; then
+     rm -f pthread-config
+     rm -f pthread.h
+
+Index: pth.pc.in
+=========================================================
+--- /dev/null
++++ b/pth.pc.in
+@@ -0,0 +1,16 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++bindir=@bindir@
++mandir=@mandir@
++datadir=@datadir@
++acdir=@datadir@/aclocal
++
++Name: pth
++Description: GNU Portable Threads
++Requires:
++Version: @PTH_VERSION@
++Libs: -L${libdir} -lpth
++Libs.private: 
++Cflags: -I${includedir}
diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 83a03b3..e1119c3 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/pth/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=12;endline=15;md5=a48af114a80c222cafd37f24370a77b1"
-PR = "r2"
+PR = "r3"
 
 python __anonymous () {
     import re
@@ -13,16 +13,22 @@ python __anonymous () {
 }
 
 SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz \
-          "
+          file://pth-add-pkgconfig-support.patch"
 
 SRC_URI[md5sum] = "9cb4a25331a4c4db866a31cbe507c793"
 SRC_URI[sha256sum] = "72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232"
 
 PARALLEL_MAKE=""
 
-inherit autotools binconfig
+inherit autotools binconfig pkgconfig
 
 do_configure() {
 	gnu-configize
+	autoconf
 	oe_runconf
 }
+
+do_install_append() {
+	install -d ${D}/${libdir}/pkgconfig
+	install -m 0644 ${S}/pth.pc ${D}/${libdir}/pkgconfig/
+}
-- 
1.7.9.5



