Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RtDBZ-0007Of-It
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 08:03:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q136tq5W026759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 22:55:55 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 2 Feb 2012 22:55:52 -0800
Message-ID: <0aeb1dfebc810b08e80dbd0ca12ddde15a6b17b4.1328250226.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1328250226.git.xiaofeng.yan@windriver.com>
References: <cover.1328250226.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 3 Feb 2012 14:20:14 +0800
Date: Fri, 3 Feb 2012 14:39:46 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] LSB_Setup.sh: Add locale resources and startup script avahi-daemon
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
X-List-Received-Date: Fri, 03 Feb 2012 07:03:54 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The purpose of adding locale resources is to resolve bug 1954 because missing locale resources
cause many failures.

The purpose of adding startup script avahi-daemon is to resolve bug 1907. The detailed description
is as follows:
No daemon progress "avahi-daemon" when system starting up.
Function "gethostbyaddr" will search file "/var/run/avahi-daemon/socket" but there is no
this file which is created by avahi-daemon.

[YOCTO #1907 #1954]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |   50 +++++++++++++---------
 1 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
index 10d8fb8..aec1858 100644
--- a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
+++ b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
@@ -16,7 +16,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
 ##Prepare Steps
-#Steps 0; Confirm the installed LSB Packages
+# Confirm the installed LSB Packages
 ARCH=`uname -m`
 APP_FILE=`ls /lsb-Application/*.rpm`
 if [ ! -f /opt/lsb/test/manager/bin/dist-checker-start.pl ]
@@ -55,7 +55,7 @@ then
         fi
 fi
 
-#Steps 1; Deleted existed user tester
+# Deleted existed user tester
 id tester
 if [ $? -eq  0 ]
 then 
@@ -85,7 +85,7 @@ fi
 }
 
 ###Start 
-#Step 1:Add tester group
+# Add tester group
 echo ""
 echo "---------------------------------"
 echo "Step 1:Add Group tester"
@@ -93,7 +93,7 @@ groupadd tester
 check
 
 
-#Step 2:Add User tester 
+# Add User tester 
 echo ""
 echo "---------------------------------"
 echo "Step 2:Add User tester"
@@ -104,14 +104,14 @@ echo "Check the tester user"
 id tester
 check 
 
-#Step 3;Stop Boa server
+# Stop Boa server
 #echo ""
 #echo "---------------------------------"
 #echo "Step 3:Stop BOA server"
 #/etc/init.d/boa stop
 #check
 
-#Step 4:Create Dirnames file for RPM
+# Create Dirnames file for RPM
 echo ""
 echo "---------------------------------"
 echo "Step 4:Create the Dirnames on target"
@@ -170,53 +170,61 @@ else
         echo "Fail to creat Dirnames file"
 fi
 
-#Step 5;
+# ldconfig 
 echo ""
 echo "---------------------------------"
 echo "Step 5:"
 ldconfig -v
 check;
 
-#Step 6;
-echo ""
-echo "---------------------------------"
-echo "Step 6:Check with link to ftp.linux-foundation.org"
-echo "140.211.169.59 ftp.linux-foundation.org ftp.linuxfoundation.org" >> /etc/hosts
-
-ping -c 5 ftp.linux-foundation.org
-check
 
-#Step 7
+# Insmod look.ko
 insmod /lib/modules/2.6.*/kernel/drivers/block/loop.ko
 if [ $? != 0 ];then
 	echo "Please insmod loop.ko  manully"
 fi
-#Step 8
+# Start lsb 
 echo ""
 if [ -f /opt/lsb/test/manager/bin/dist-checker-start.pl ];then
         /opt/lsb/test/manager/bin/dist-checker-start.pl
 fi
 
-#Step 9 get ip address for target platform
+# Get ip address for target platform
 addr=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}'|sed s/[[:space:]][[:space:]]Bcast//g`
 echo -e "you should input ${addr}:8888 on your browser"
 
-#workaround to add part of locales for LSB test
+# Workaround to add part of locales for LSB test
 localedef -i ja_JP -f EUC-JP ja_JP.eucjp
 localedef -i en_US -f ISO-8859-15  en_US.ISO-8859-15
+localedef -i en_US -f ISO-8859-1  en_US.ISO-8859-1
+localedef -i en_US -f ISO-8859-1 en_US
+localedef -i de_DE -f UTF-8  de_DE.UTF-8
+localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
 localedef -i en_US -f UTF-8 en_US.UTF-8
 localedef -i se_NO -f UTF-8 se_NO.UTF-8
 localedef -i de_DE -f ISO-8859-1 de_DE
+localedef -i de_DE -f ISO-8859-15 de_DE.ISO-8859-15
 localedef -i en_US -f ISO-8859-1 en_US.ISO8859-1
 localedef -i fr_FR -f ISO-8859-1 fr_FR
+localedef -i it_IT -f ISO-8859-1 it_IT
+localedef -i es_MX  -f ISO-8859-1 es_MX
+localedef -i en_HK -f ISO-8859-1 en_HK
+localedef -i en_PH -f ISO-8859-1 en_PH
+localedef -i ta_IN -f UTF-8 ta_IN
 
-#resolve localhost 
+# Resolve localhost 
 LOCALHOST=`hostname`
 if ! `grep -F -q "$LOCALHOST" /etc/hosts`; then
     echo "127.0.0.1 $LOCALHOST" >> /etc/hosts
 fi
 
-#Step 10
+# Start avahi-daemon                                      
+/etc/init.d/avahi-daemon start                           
+ln -s /etc/init.d/avahi-daemon /etc/rc5.d/S88avahi-daemon 
+
+# Done
 echo "Done!!"
 
 ###End
+
+
-- 
1.7.0.4



