Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RFjQu-0008NX-Ie
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 11:24:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9H9IhGG012727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 02:18:43 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 17 Oct 2011 02:18:43 -0700
Message-ID: <9b6df8992d50fe277f28786dec2a13c75d09ad95.1318843077.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1318843077.git.xiaofeng.yan@windriver.com>
References: <cover.1318843077.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 17 Oct 2011 16:57:19 +0800
Date: Mon, 17 Oct 2011 17:24:34 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lsb: Change link of ${baselib} to lib64 for 64bits system
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
X-List-Received-Date: Mon, 17 Oct 2011 09:24:33 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Correct two faults:

1 Binaries of lsb test suite need ld-linux.so* in /lib64.
for example:
Target$ ./lsbcmdchk
-sh: ./lsbcmdchk: No such file or directory
Target$ strings lsbcmdchk | grep "ld-"
/lib64/ld-lsb-x86-64.so.3

"lsbcmdchk" from lsb test suite is a binary program.
A new modification to lsb_1.4.bb caused that binaries from lsb test suite can't run
because binaries of lsb test suite need ld-linux.so* in /lib64.
But the link is changed due to adding multilib. I changed this link again.

2 correct mandir
Waring will appear when running task task do_populate_sysroot

NOTE: package lsb-1.4-r2: task do_populate_sysroot: Succeeded
WARNING: For recipe lsb, the following files were installed but not shipped in any package:
WARNING:   /{datadir}/man/man1/lsb_release.1.gz

I changed mandir=${D}/man to mandir=${D}/${datadir}/man

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index d472012..7cecdf2 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "LSB support for Poky Linux"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fd
 S = ${WORKDIR}/lsb-release-${PV}
 
 do_install(){
-	oe_runmake install prefix=${D}  mandir=${D}/man/ DESTDIR=${D} 
+	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D} 
 	mkdir -p ${D}/bin
 	mkdir -p ${D}/${baselib}
 	mkdir -p ${D}/etc/lsb-release.d
@@ -69,7 +69,9 @@ do_install_append(){
        install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
        if [ "${TARGET_ARCH}" == "x86_64" ];then
 	       cd ${D}
-	       ln -sf ${baselib} lib
+               if [ "${baselib}" != "lib64" ]; then
+                   ln -sf ${baselib} lib64
+               fi
 	       cd ${D}/${baselib}
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
@@ -82,7 +84,9 @@ do_install_append(){
  
        if [ "${TARGET_ARCH}" == "powerpc64" ];then
   	       cd ${D}
-	       ln -sf ${baselib} lib
+               if [ "${baselib}" != "lib64" ]; then
+                   ln -sf ${baselib} lib64
+               fi
                cd ${D}/${baselib}
                ln -sf ld64.so.1 ld-lsb-ppc64.so.2
                ln -sf ld64.so.1 ld-lsb-ppc64.so.3
-- 
1.7.0.4



