Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QqGMo-00015z-46
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 05:19:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2011 20:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,335,1309762800"; d="scan'208";a="35476431"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2011 20:14:35 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 11:22:51 +0800
Message-Id: <0cd89db93d0ae7fad4b1f4f07fa9b371415f5a58.1312773154.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1312773154.git.lei.mei@intel.com>
References: <cover.1312773154.git.lei.mei@intel.com>
In-Reply-To: <cover.1312773154.git.lei.mei@intel.com>
References: <cover.1312773154.git.lei.mei@intel.com>
Subject: [PATCH 1/1] lsb: Fix hard code libdir issue for multilib
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
X-List-Received-Date: Mon, 08 Aug 2011 03:19:05 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index 2b38232..d472012 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -21,7 +21,7 @@ S = ${WORKDIR}/lsb-release-${PV}
 do_install(){
 	oe_runmake install prefix=${D}  mandir=${D}/man/ DESTDIR=${D} 
 	mkdir -p ${D}/bin
-	mkdir -p ${D}/lib
+	mkdir -p ${D}/${baselib}
 	mkdir -p ${D}/etc/lsb-release.d
 	echo -n "LSB_VERSION=\"core-4.1-noarch:" > ${D}/etc/lsb-release
 	
@@ -61,34 +61,34 @@ do_install(){
 
 do_install_append(){
        install -d ${D}/etc/core-lsb
-       install -d ${D}/lib/lsb
+       install -d ${D}/${baselib}/lsb
        for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
        do
            install -m 0755 ${WORKDIR}/${i} ${D}/etc/core-lsb
        done
-       install -m 0755 ${WORKDIR}/init-functions ${D}/lib/lsb
+       install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
        if [ "${TARGET_ARCH}" == "x86_64" ];then
 	       cd ${D}
-	       ln -sf lib lib64
-	       cd ${D}/lib
+	       ln -sf ${baselib} lib
+	       cd ${D}/${baselib}
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
        fi
        if [ "${TARGET_ARCH}" == "i586" ];then
-	       cd ${D}/lib
+	       cd ${D}/${baselib}
                ln -sf ld-linux.so.2 ld-lsb.so.2
                ln -sf ld-linux.so.2 ld-lsb.so.3
        fi
  
        if [ "${TARGET_ARCH}" == "powerpc64" ];then
   	       cd ${D}
-	       ln -sf lib lib64
-               cd ${D}/lib
+	       ln -sf ${baselib} lib
+               cd ${D}/${baselib}
                ln -sf ld64.so.1 ld-lsb-ppc64.so.2
                ln -sf ld64.so.1 ld-lsb-ppc64.so.3
        fi
        if [ "${TARGET_ARCH}" == "powerpc" ];then
-	       cd ${D}/lib
+	       cd ${D}/${baselib}
                ln -sf ld.so.1 ld-lsb-ppc32.so.2
                ln -sf ld.so.1 ld-lsb-ppc32.so.3
        fi	
-- 
1.7.0.4



