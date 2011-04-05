Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7E8X-0000tt-A1
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:50:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2011 14:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,307,1299484800"; d="scan'208";a="675618563"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2011 14:48:01 -0700
Message-Id: <1581fc4b09a528095719153a87bcce90417b3075.1302039585.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302039585.git.sgw@linux.intel.com>
References: <cover.1302039585.git.sgw@linux.intel.com>
Old-Date: Sat, 2 Apr 2011 16:22:17 +0800
Date: Tue, 05 Apr 2011 14:48:01 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 4/6] LSB_Setup.sh: Add function to install all test packages
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
X-List-Received-Date: Tue, 05 Apr 2011 21:50:09 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add function to  install all of lsb test suite packages instead of installing parts of test packages

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |   50 ++++++++++++++---------
 1 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
index 78c33b3..7ce823e 100644
--- a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
+++ b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
@@ -17,11 +17,38 @@
 
 ##Prepare Steps
 #Steps 0; Confirm the installed LSB Packages
-
+ARCH=`uname -m`
+APP_FILE=`ls /lsb-Application/*.rpm`
 if [ ! -f /opt/lsb/test/manager/bin/dist-checker-start.pl ]
 then
         if [ -d /lsb-dist-testkit ];then
-                cd /lsb-dist-testkit && sh install.sh && cd ../lsb-Application && rpm -ivh *.rpm --nodeps --force
+		if [ ${ARCH} == i686 ];then
+                	echo "i486-suse" >> /etc/rpm/platform
+                	echo "i486-noarch" >> /etc/rpm/platform
+                	echo "i486-pc" >> /etc/rpm/platform
+                	echo "noarch-suse" >> /etc/rpm/platform
+		else
+                	echo "${ARCH}-suse" >> /etc/rpm/platform
+                	echo "${ARCH}-noarch" >> /etc/rpm/platform
+                	echo "${ARCH}-pc" >> /etc/rpm/platform
+                	echo "noarch-suse" >> /etc/rpm/platform
+                fi      
+                cd /lsb-dist-testkit && sh install.sh && cd ../lsb-Application
+                for i in ${APP_FILE}
+                do
+                    echo "$i" |grep -q "apache"
+                    if [ $? -eq 0 ]
+                    then
+                        rpm -ivh $i --noscripts --nodeps --force
+                    else
+                        rpm -ivh $i --nodeps --force
+                    fi
+                done
+                mkdir -p /var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb/snapshots/appbat/tests/
+                mkdir -p  /var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb/app-battery/tests/ 
+		cp expect-tests.tar  test1.pdf  test2.pdf /var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb/app-battery/tests/
+                cp raptor-tests.tar  tcl-tests.tar /var/opt/lsb//test/manager/packages/ftp.linuxfoundation.org/pub/lsb/snapshots/appbat/tests/
+		cd ..
         else 
                 echo "Please install the realted LSB Packages"
                 exit 1
@@ -33,10 +60,6 @@ id tester
 if [ $? -eq  0 ]
 then 
         echo "User tester was existed"
-        echo -n "Deleted tester(yes/no):"
-        read INPUT
-case $INPUT in 
-yes|y)
         sleep 1
         userdel -rf tester
         if [ $? -eq 0 ] || [ $? -eq 6 ]
@@ -45,19 +68,6 @@ yes|y)
        else
                 echo "Fail to delete user tester"
         fi
-        ;;
-no|n)
-        sleep 1
-        echo "There must be deleted User test before ran LSB4 on Target"
-        echo ""
-        exit 1
-        ;;
-*)
-        sleep 1
-        echo "Input ERROR, pls reinput that your expected"
-        echo ""
-        exit 1
-esac
 else 
         echo "There was not User tester"
 fi
@@ -177,7 +187,7 @@ ping -c 5 ftp.linux-foundation.org
 check
 
 #Step 7
-insmod /lib/modules/2.6.37.2-yocto-standard\+/kernel/drivers/block/loop.ko
+insmod /lib/modules/2.6.*/kernel/drivers/block/loop.ko
 if [ $? != 0 ];then
 	echo "Please insmod loop.ko  manully"
 fi
-- 
1.7.1



