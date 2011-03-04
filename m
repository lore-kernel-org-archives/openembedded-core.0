Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pvauh-0005oo-9G
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:43:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2011 11:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="893924648"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2011 11:42:12 -0800
Message-Id: <aa60f178d9f6b4ebdf03bbfcf2b46e94bf4e78d3.1299267630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299267630.git.sgw@linux.intel.com>
References: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 19:04:16 +0800
Date: Fri, 04 Mar 2011 11:42:11 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 03/13] LSB_Setup.sh:Install LSB Test Suite and set lsb test environment
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
X-List-Received-Date: Fri, 04 Mar 2011 19:43:55 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Perfect some funtions for lsb test in yocto 1.0

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
index 4bf7686..78c33b3 100644
--- a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
+++ b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
@@ -21,7 +21,7 @@
 if [ ! -f /opt/lsb/test/manager/bin/dist-checker-start.pl ]
 then
         if [ -d /lsb-dist-testkit ];then
-                cd /lsb-dist-testkit && sh install.sh
+                cd /lsb-dist-testkit && sh install.sh && cd ../lsb-Application && rpm -ivh *.rpm --nodeps --force
         else 
                 echo "Please install the realted LSB Packages"
                 exit 1
@@ -42,7 +42,7 @@ yes|y)
         if [ $? -eq 0 ] || [ $? -eq 6 ]
         then
                 echo "Success to delete user tester"
-        else
+       else
                 echo "Fail to delete user tester"
         fi
         ;;
@@ -177,21 +177,21 @@ ping -c 5 ftp.linux-foundation.org
 check
 
 #Step 7
-if [ -f /lib/modules/*-wr-standard/kernel/drivers/block/loop.ko ];then
-	inmod /lib/modules/*-wr-standard/kernel/drivers/block/loop.ko
+insmod /lib/modules/2.6.37.2-yocto-standard\+/kernel/drivers/block/loop.ko
+if [ $? != 0 ];then
+	echo "Please insmod loop.ko  manully"
 fi
-
 #Step 8
 echo ""
 if [ -f /opt/lsb/test/manager/bin/dist-checker-start.pl ];then
-        ./opt/lsb/test/manager/bin/dist-checker-start.pl
+        /opt/lsb/test/manager/bin/dist-checker-start.pl
 fi
 
-
 #Step 9 get ip address for target platform
-addr=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}'|sed s/[[:space:]]Bcast//g`
-echo -e "you should input ${addr}:8888 on your browse"
-#Step 8
+addr=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}'|sed s/[[:space:]][[:space:]]Bcast//g`
+echo -e "you should input ${addr}:8888 on your browser"
+
+#Step 10
 echo "Done!!"
 
 ###End
-- 
1.7.1.1



