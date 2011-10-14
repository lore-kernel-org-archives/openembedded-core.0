Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUL-0002Sz-T4
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540441"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:02 -0700
Message-Id: <976960466935652cea6d900ff5e0360ee7243b06.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/28] lsb: Change link of ${baselib} to lib64 for 64bits system
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:22 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Binaries of lsb test suite need ld-linux.so* in /lib64.
for example:
Target$ ./lsbcmdchk
-sh: ./lsbcmdchk: No such file or directory
Target$ strings lsbcmdchk | grep "ld-"
/lib64/ld-lsb-x86-64.so.3

"lsbcmdchk" from lsb test suite is a binary program.
A new modification to lsb_1.4.bb caused that binaries from lsb test suite can't run
because binaries of lsb test suite need ld-linux.so* in /lib64.
But the link is changed due to adding multilib. I changed this link again.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index d472012..5df08b8 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "LSB support for Poky Linux"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
@@ -69,7 +69,7 @@ do_install_append(){
        install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
        if [ "${TARGET_ARCH}" == "x86_64" ];then
 	       cd ${D}
-	       ln -sf ${baselib} lib
+	       ln -sf ${baselib} lib64
 	       cd ${D}/${baselib}
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
@@ -82,7 +82,7 @@ do_install_append(){
  
        if [ "${TARGET_ARCH}" == "powerpc64" ];then
   	       cd ${D}
-	       ln -sf ${baselib} lib
+	       ln -sf ${baselib} lib64
                cd ${D}/${baselib}
                ln -sf ld64.so.1 ld-lsb-ppc64.so.2
                ln -sf ld64.so.1 ld-lsb-ppc64.so.3
-- 
1.7.6.2



