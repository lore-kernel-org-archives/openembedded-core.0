Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD1FD617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:24:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6O9bn000968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:24:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:24:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:24:03 -0700
Message-ID: <3f41c438896f5208d307d8d8969edd15e6c1e74f.1408342506.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342506.git.liezhi.yang@windriver.com>
References: <cover.1408342506.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] libtool: add bash to RDEPENDS_libtool
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
X-List-Received-Date: Mon, 18 Aug 2014 06:24:09 -0000
Content-Type: text/plain

* Set CONFIG_SHELL="/bin/bash"
* Add bash to RDEPENDS_libtool

We had already set CONFIG_SHELL="/bin/bash" for libtool-native,
libtool-cross and nativesdk-libtool, now also set for target libtool, if
we don't set this, libtool would use /bin/sh, /bin/bash, /bin/ksh or
/bin/sh5 according to the host, and the build is undetermined, this
patch can fix the problem, libtool is a development tool, rdepends on
bash should not cause toubles (for example, the size of the image)

Have tried to set CONFIG_SHELL="/bin/sh" (/bin/sh -> dash), but there is
still a few bashsim in the output libtool.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    2 ++
 .../libtool/libtool-cross_2.4.2.bb                 |    2 --
 .../libtool/libtool-native_2.4.2.bb                |    2 --
 meta/recipes-devtools/libtool/libtool_2.4.2.bb     |    2 ++
 .../libtool/nativesdk-libtool_2.4.2.bb             |    2 --
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 9c50d46..0f1964b 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -49,3 +49,5 @@ FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
 FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
 FILES_libltdl-staticdev = "${libdir}/libltdl.a"
 FILES_libltdl-dbg = "${libdir}/.debug/"
+
+export CONFIG_SHELL="/bin/bash"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
index 72fad37..34aae0b 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
@@ -39,5 +39,3 @@ libtoolcross_sysroot_preprocess () {
 }
 
 SSTATE_SCAN_FILES += "libtoolize *-libtool"
-
-export CONFIG_SHELL="/bin/bash"
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
index f1051d8..f03859e 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
@@ -21,5 +21,3 @@ do_install () {
 	install -d ${D}${bindir}/
 	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
 }
-
-export CONFIG_SHELL="/bin/bash"
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.2.bb b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
index a2eb4ea..d3f9428 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
@@ -2,6 +2,8 @@ require libtool-${PV}.inc
 
 PR = "${INC_PR}.0"
 
+RDEPENDS_${PN} += "bash"
+
 #
 # We want the results of libtool-cross preserved - don't stage anything ourselves.
 #
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
index fff15e9..7b5c97a 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
@@ -31,5 +31,3 @@ libtoolnativesdk_sysroot_preprocess () {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 	install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${bindir_crossscripts}/${HOST_SYS}-libtool
 }
-
-export CONFIG_SHELL="/bin/bash"
-- 
1.7.9.5


