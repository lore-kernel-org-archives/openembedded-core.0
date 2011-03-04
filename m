Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvawB-0006K0-MW
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:45:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2011 11:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="716309921"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2011 11:42:18 -0800
Message-Id: <fc87e45c24eaee29dc3f803eca4f8e303cc582cb.1299267630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299267630.git.sgw@linux.intel.com>
References: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 18:42:17 +0800
Date: Fri, 04 Mar 2011 11:42:17 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 11/13] creat-lsb-image: Add some functions for creating a appropriate image to make lsb test
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
X-List-Received-Date: Fri, 04 Mar 2011 19:45:20 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add all pakcages from LSB Test Suite from linux foundation web.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/creat-lsb-image |  148 ++++++++++++++++++++++++++++-------------------
 1 files changed, 88 insertions(+), 60 deletions(-)

diff --git a/scripts/creat-lsb-image b/scripts/creat-lsb-image
index 71d9215..3802e2f 100755
--- a/scripts/creat-lsb-image
+++ b/scripts/creat-lsb-image
@@ -19,8 +19,9 @@
 red='\E[31;40m'
 green='\E[32;40m'
 USER=`whoami`
-MACHINE=$1
-IMAGE_PATH=../build/tmp/deploy/images/
+ARCH=$1
+MACHINE_ARCH=` bitbake -e | grep ^MACHINE_ARCH | cut -d '=' -f2 | cut -d '"' -f2`
+IMAGE_PATH=` bitbake -e | grep ^POKYBASE | cut -d '=' -f2 | cut -d '"' -f2`/build/tmp/deploy/images/
 
 
 ECHO()
@@ -39,9 +40,9 @@ exit_check()
 usage()
 {
     ECHO "${red}usage:you should input one of the next commmands according to detailed target platform:"
-    ECHO "creat-lsb-image qemux86"
-    ECHO "creat-lsb-image qemux86-64"
-    ECHO "creat-lsb-image qemuppc"
+    ECHO "creat-lsb-image x86"
+    ECHO "creat-lsb-image x86_64"
+    ECHO "creat-lsb-image ppc32"
 }
 
 #There should be a patameter to get machine type
@@ -59,68 +60,90 @@ ECHO "Enter directory $IMAGE_PATH"
 cd $IMAGE_PATH
 
 #get architecture
-case $MACHINE in
-    qemux86)
-        ARCH=ia32
-        PN=`find . -name poky-image-lsb-${MACHINE}\*.rootfs.tar.bz2 -type f | awk -F- 'BEGIN{ max=0;} {if( NR!=0 && $5>max ) max=$5 }END{ printf "%d" ,max ;}'`
-        if [ "XPN" == "X" ];then
-            ECHO "${red}Don't find lsb image on platform, Please run \"poky-image-lsb\" to generate lsb image"
-            exit 1
-        fi
-    ;;
-    qemux86-64)
-        ARCH=x86_64
-        PN=`find . -nam! e poky-image-lsb-${MACHINE}\*.rootfs.tar.bz2 -type f | awk -F- 'BEGIN{ max=0; } {if( NR!=0 && $6>max ) max=$6 }END{ printf "%d" ,max ;}'`
-        if [ "X${PN}" == "X" ];then
-            ECHO "${red}Don't find lsb image on platform, Please run \"poky-image-lsb\" to generate lsb image"
-            exit 1
-        fi
-    ;;
-    qemuppc)
-        ARCH=ppc32
-        PN=`find . -name poky-image-lsb-${MACHINE}\*.rootfs.tar.bz2 -type f | awk -F- 'BEGIN{ max=0;} {if( NR!=0 && $5>max ) max=$5 }END{ printf "%d" ,max ;}'`
-        if [ "XPN" == "X" ];then
-            ECHO "${red}Don't find lsb image on platform, Please run \"poky-image-lsb\" to generate lsb image"
-		fi
-    ;;
-    *)
-        ECHO "${red}Don't support lsb test for platform ${MACHINE}"
-        exit 1
-esac
+PN=`find . -name poky-image-lsb-${MACHINE_ARCH}\*.rootfs.tar.bz2 -type f | awk -F- 'BEGIN{ max=0;} {if( NR!=0 && $5>max ) max=$5 }END{ printf "%d" ,max ;}'`
+if [ "XPN" == "X" ];then
+   ECHO "${red}Don't find lsb image on platform, Please run \"poky-image-lsb\" to generate lsb image"
+   exit 1
+fi
 
 if [ $PN -eq 0 ];then
-	ECHO "${red}Can't ${MACHINE} rootfs.tar.gz,Please run poky-image-lsb to get lsb image"
+	ECHO "${red}Can't ${MACHINE_ARCH} rootfs.tar.gz,Please run poky-image-lsb to get lsb image"
 	exit 1
 fi
+#set varible ARCH
+if [ ${ARCH} == x86 ];then
+	T_ARCH=ia32
+    P_ARCH=i486
+elif [ ${ARCH} == x86_64 ];then
+	T_ARCH=ia64
+    P_ARCH=ia64
+else
+	P_ARCH=ppc
+	T_ARCH=${ARCH}
+fi
 
+#umount lsbtmp 
+if [ -d lsbtmp ];then
+	sudo umount lsbtmp
+fi
+ 
 #download lsb test suite
-if [ ! -f lsb-dist-testkit-4.0.2-1.${ARCH}.tar.gz ];then
+mkdir -p lsb-test-suite-${MACHINE_ARCH} 
+if [ -d lsb-test-suite-${MACHINE_ARCH} ];then
+	cd lsb-test-suite-${MACHINE_ARCH}
 	ECHO "Download lsb test suite, it could take some time..."
-    wget -c -t 5  http://ftp.linuxfoundation.org/pub/lsb/bundles/released-4.0.0/dist-testkit/lsb-dist-testkit-4.0.2-1.${ARCH}.tar.gz
+    wget -c -t 5  http://ftp.linuxfoundation.org/pub/lsb/bundles/released-4.1.0/dist-testkit/lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz
+    exit_check
+	ECHO "Download lsb-xdg-utils-4.0.0-2.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/lsbdev/released-4.1.0/binary/${T_ARCH}/lsb-xdg-utils-4.0.0-2.${P_ARCH}.rpm
+    exit_check
+	ECHO "Downlocad lsb-apache-2.2.8-2.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-apache-2.2.14-3.lsb4.${P_ARCH}.rpm
+    exit_check
+	ECHO "Downlocad lsb-tcl-8.5.1-2.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-tcl-8.5.7-6.lsb4.${P_ARCH}.rpm
+    exit_check
+	ECHO "Downlocad lsb-expect-5.43.0-7.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-expect-5.43.0-11.lsb4.${P_ARCH}.rpm 
+    exit_check
+	ECHO "Downlocad lsb-groff-1.19.2-4.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-groff-1.20.1-5.lsb4.${P_ARCH}.rpm  
+    exit_check
+	ECHO "Downlocad lsb-raptor-1.4.16-2.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-raptor-1.4.19-3.lsb4.${P_ARCH}.rpm 
+    exit_check
+	ECHO "Downlocad lsb-xpdf-1.01-7.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-xpdf-1.01-10.lsb4.${P_ARCH}.rpm
+    exit_check
+	ECHO "Downlocad lsb-samba-3.0.28a-3.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-samba-3.4.3-5.lsb4.${P_ARCH}.rpm 
+    exit_check
+	ECHO "Downlocad lsb-rsync-3.0.0-2.lsb4.${P_ARCH}.rpm"
+	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-rsync-3.0.6-3.lsb4.${P_ARCH}.rpm
     exit_check
 else
-	ECHO "Find lsb test suite for ${MACHINE}"
+	ECHO "Can't find lsb test suite for ${MACHINE_ARCH}"
+fi
+cd ..
+if [ -L poky-image-lsb-${MACHINE_ARCH}.ext3 ];then
+    /bin/rm poky-image-lsb-${MACHINE_ARCH}.ext3
+    exit_check
 fi
-
-#if [ -L poky-image-lsb-${MACHINE}.ext3 ];then
-#    /bin/rm poky-image-lsb-${MACHINE}.ext3
-#    exit_check
-#fi
 
 #creat lsb image
-if [ -f poky-image-lsb-${MACHINE}-test.ext3 ];then
+if [ -f poky-image-lsb-${MACHINE_ARCH}-test.ext3 ];then
 	if [ -d lsbtmp ];then
     	sudo umount lsbtmp
 	fi
 	ECHO "Remove old lsb image..."
-	/bin/rm poky-image-lsb-${MACHINE}-test.ext3
+	/bin/rm poky-image-lsb-${MACHINE_ARCH}-test.ext3
 fi	
-ECHO "creat a big ext3 file for lsb image with 3G..."
-dd if=/dev/zero of=poky-image-lsb-${MACHINE}-test.ext3 bs=1M count=3000
+ECHO "creat a big ext3 file for lsb image with 5G..."
+dd if=/dev/zero of=poky-image-lsb-${MACHINE_ARCH}-test.ext3 bs=1M count=5000
 exit_check
 ECHO "Format ext3 image,please input \"y\""
-mkfs.ext3 poky-image-lsb-${MACHINE}-test.ext3
-tune2fs -j  poky-image-lsb-${MACHINE}-test.ext3
+mkfs.ext3 poky-image-lsb-${MACHINE_ARCH}-test.ext3
+tune2fs -j  poky-image-lsb-${MACHINE_ARCH}-test.ext3
 
 
 ECHO "get a lsb image with lsb test suite"
@@ -130,41 +153,46 @@ fi
 
 
 #install file system and lsb test suite to lsb image
-sudo mount -o loop poky-image-lsb-${MACHINE}-test.ext3 lsbtmp
+sudo mount -o loop poky-image-lsb-${MACHINE_ARCH}-test.ext3 lsbtmp
 exit_check
 
 ECHO "  ->Install file system..."
-sudo tar jxf poky-image-lsb-${MACHINE}-${PN}.rootfs.tar.bz2 -C lsbtmp
+sudo tar jxf poky-image-lsb-${MACHINE_ARCH}-${PN}.rootfs.tar.bz2 -C lsbtmp
 exit_check
 
 ECHO "  ->Install lsb test suite..."
-sudo tar zxf lsb-dist-testkit-4.0.2-1.${ARCH}.tar.gz -C lsbtmp
+cd lsb-test-suite-${MACHINE_ARCH}
+sudo tar zxf lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz -C ../lsbtmp
+exit_check
+sudo mkdir ../lsbtmp/lsb-Application
+sudo cp *.rpm ../lsbtmp/lsb-Application
 exit_check
+cd ..
 
-if [ -f modules-*-${MACHINE}.tgz ];then
+if [ -f modules-*-${MACHINE_ARCH}.tgz ];then
 ECHO "  ->Install moules of driver..."	
-	sudo tar zxf modules-*-${MACHINE}.tgz -C lsbtmp/
+	sudo tar zxf modules-*-${MACHINE_ARCH}.tgz -C lsbtmp/
 fi
 
 
-#mount lsbtmp
+#unmount lsbtmp
 sudo umount lsbtmp
 exit_check
 sudo rm -rf lsbtmp
 
 #change file attribute
-sudo chown ${USER}:${USER} poky-image-lsb-${MACHINE}-test.ext3 
+sudo chown ${USER}:${USER} poky-image-lsb-${MACHINE_ARCH}-test.ext3 
 exit_check
-sudo chmod 755 poky-image-lsb-${MACHINE}-test.ext3
+sudo chmod 755 poky-image-lsb-${MACHINE_ARCH}-test.ext3
 exit_check
 
 #set up link
-if [ -L poky-image-lsb-${MACHINE}.ext3 ];then
+if [ -L poky-image-lsb-${MACHINE_ARCH}.ext3 ];then
 ECHO "Set up link"
-    /bin/rm poky-image-lsb-${MACHINE}.ext3
+    /bin/rm poky-image-lsb-${MACHINE_ARCH}.ext3
     exit_check
 fi
-ln -s poky-image-lsb-${MACHINE}-test.ext3 poky-image-lsb-${MACHINE}.ext3
+ln -s poky-image-lsb-${MACHINE_ARCH}-test.ext3 poky-image-lsb-${MACHINE_ARCH}.ext3
 
-ECHO "LSB test environment is set successfully, Please run \"poky-qemu ${MACHINE}\" to start up lsb-image"
+ECHO "LSB test environment is set successfully, Please run this image on platform ${MACHINE_ARCH}"
 
-- 
1.7.1.1



