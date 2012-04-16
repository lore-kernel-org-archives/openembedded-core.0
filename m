Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJnmC-00083H-TC
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 17:23:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GFEAcA024057
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 08:14:10 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Apr 2012 08:14:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 23:14:59 +0800
Message-ID: <23138099c77cd3dc6af309c81ef52da03a9ad004.1334589214.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334589214.git.liezhi.yang@windriver.com>
References: <cover.1334589214.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemu-nativesdk: can't find libcurl.so.4
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
X-List-Received-Date: Mon, 16 Apr 2012 15:23:37 -0000
Content-Type: text/plain

There is an error when build meta-toolchain-sdk on Ubuntu 10.10:

| Installing NATIVESDK packages
| Processing task-sdk-host-nativesdk...
| Processing task-cross-canadian-mips...
| error: Failed dependencies:
|       libcurl.so.4 is needed by qemu-nativesdk-0.15.1-r5.i686
NOTE: package meta-toolchain-gmae-1.0-r7: task do_populate_sdk: Failed
ERROR: Task 21 (/buildarea2/lyang1/poky/meta/recipes-core/meta/meta-toolchain-gmae.bb, do_populate_sdk) failed with exit code '1'

This is because the curl-native generates libcurl.so.4, but
curl-nativesdk generates libcurl.so.5, qemu-nativesdk needs libcurl.so,
but its DEPENDS doesn't have curl-nativesdk, so it links the one from
curl-native, this is incorrect. Fix its DEPENDS, let it depend on
curl-nativesdk will fix the problem.

[YOCTO #2305]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc       |    4 ++--
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb    |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8dee060..1754629 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -57,8 +57,8 @@ do_install () {
 	install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
 }
 
-DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native"
-DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk glib-2.0-nativesdk \
+DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native curl-native"
+DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk glib-2.0-nativesdk curl-nativesdk \
                                ${@base_contains('DISTRO_FEATURES', 'x11', 'qemugl-nativesdk', '', d)}"
 RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
 EXTRA_OECONF_virtclass-nativesdk += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls"
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 05ea5f8..789b72b 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r5"
+PR = "r6"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index bcec9bb..6d5e250 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 PV = "0.14.0"
-PR = "r3"
+PR = "r4"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-git/"
 FILESDIR = "${WORKDIR}"
-- 
1.7.1



