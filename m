Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 98AA560962
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:13:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J1DSif021884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:13:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 18 May 2015 18:13:28 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 09:08:12 +0800
Message-ID: <e2402c26a050c4bb6387b3ee235aad25572124e3.1431997609.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431997609.git.kai.kang@windriver.com>
References: <cover.1431997609.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 2/4] alsa-tools: upgrade to version 1.0.29
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
X-List-Received-Date: Tue, 19 May 2015 01:13:30 -0000
Content-Type: text/plain

Upgrade alsa-tools from verion 1.0.28 to 1.0.29.

* update autotools.patch
* add file gitcompile which exists in git repo but missing in release
  tar ball for sub-directory hdajacksensetest

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools/autotools.patch     |  4 ++--
 .../alsa/alsa-tools/gitcompile_hdajacksensetest             | 13 +++++++++++++
 .../alsa/{alsa-tools_1.0.28.bb => alsa-tools_1.0.29.bb}     | 10 +++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)
 create mode 100755 meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.28.bb => alsa-tools_1.0.29.bb} (82%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
index 5aec84c..59391d6 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -20,13 +20,13 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
 --- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
 +++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
 @@ -1,8 +1,8 @@
- VERSION = 1.0.27
+ VERSION = 1.0.29
  TOP = .
 -SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
 +SUBDIRS = as10k1 envy24control \
  	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
 +	  us428control usx2yloader vxloader echomixer \
- 	  hwmixvolume hdajackretask hda-verb
+ 	  hwmixvolume hdajackretask hda-verb hdajacksensetest
  
  all:
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest b/meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
new file mode 100755
index 0000000..58328bd
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+aclocal $ACLOCAL_FLAGS || exit 1
+automake --foreign --add-missing || exit 1
+autoconf || exit 1
+export CFLAGS='-O2 -Wall -pipe -g'
+echo "CFLAGS=$CFLAGS"
+echo "./configure $@"
+./configure $@ || exit 1
+unset CFLAGS
+if [ -z "$GITCOMPILE_NO_MAKE" ]; then
+  make || exit 1
+fi
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
similarity index 82%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
index d684225..9133012 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
@@ -11,10 +11,12 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            file://autotools.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', \
-                                'file://makefile_no_gtk.patch', d)}"
+                                'file://makefile_no_gtk.patch', d)} \
+           file://gitcompile_hdajacksensetest \
+          "
 
-SRC_URI[md5sum] = "e6c929175d8ee729c06d49b51439bad6"
-SRC_URI[sha256sum] = "76e59711c6d0f39cbddce83ce1ed8da00bad112fee021f94fa990d8685cc3761"
+SRC_URI[md5sum] = "f339a3cd24f748c9d007bdff0e98775b"
+SRC_URI[sha256sum] = "94abf0ab5a73f0710c70d4fb3dc1003af5bae2d2ed721d59d245b41ad0f2fbd1"
 
 inherit autotools-brokensep pkgconfig
 
@@ -32,6 +34,8 @@ do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case
     export AUTOMAKE_DIR="$(automake --print-libdir)"
     export ACLOCAL_FLAGS="--system-acdir=${ACLOCALDIR}/"
+
+    cp ${WORKDIR}/gitcompile_hdajacksensetest ${S}/hdajacksensetest/gitcompile
 }
 
 FILES_${PN} += "${datadir}/ld10k1"
-- 
1.9.1


