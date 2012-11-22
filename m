Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TbNdG-0005UQ-2Z
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 04:39:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAM3PB1v007574
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 19:25:12 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 19:25:09 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Nov 2012 11:25:45 +0800
Message-ID: <92f9312fc5981d8e9e05d2c263cfea44e5ac58df.1353553773.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1353553772.git.kai.kang@windriver.com>
References: <cover.1353553772.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] lsbsetup: drop it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 03:39:18 -0000
Content-Type: text/plain

lsbsetup provides script LSB_Setup.sh to setup LSB test on image. But
script LSB_Test.sh provided by lsbtest replaces its function now. So
drop lsbsetup.

lsbsetup links /etc/localtime to HongKong zoneinfo file to make LSB
wcsftime test case pass(Yocto 1079). But the test case PASS without
this link, so remove the link.

Other 2 links are moved to packages lsb.

[Yocto 3278]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |  230 -----------------------
 meta/recipes-extended/lsb/lsbsetup_1.0.bb       |   26 ---
 2 files changed, 0 insertions(+), 256 deletions(-)
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup_1.0.bb

diff --git a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
deleted file mode 100644
index aec1858..0000000
--- a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
+++ /dev/null
@@ -1,230 +0,0 @@
-#!/bin/bash
-
-# Copyright (C) 2010-2011 Wind River Systems, Inc.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-##Prepare Steps
-# Confirm the installed LSB Packages
-ARCH=`uname -m`
-APP_FILE=`ls /lsb-Application/*.rpm`
-if [ ! -f /opt/lsb/test/manager/bin/dist-checker-start.pl ]
-then
-        if [ -d /lsb-dist-testkit ];then
-		if [ ${ARCH} == i686 ];then
-                	echo "i486-suse" >> /etc/rpm/platform
-                	echo "i486-noarch" >> /etc/rpm/platform
-                	echo "i486-pc" >> /etc/rpm/platform
-                	echo "noarch-suse" >> /etc/rpm/platform
-		else
-                	echo "${ARCH}-suse" >> /etc/rpm/platform
-                	echo "${ARCH}-noarch" >> /etc/rpm/platform
-                	echo "${ARCH}-pc" >> /etc/rpm/platform
-                	echo "noarch-suse" >> /etc/rpm/platform
-                fi      
-                cd /lsb-dist-testkit && sh install.sh && cd ../lsb-Application
-                for i in ${APP_FILE}
-                do
-                    echo "$i" |grep -q "apache"
-                    if [ $? -eq 0 ]
-                    then
-                        rpm -ivh $i --noscripts --nodeps --force
-                    else
-                        rpm -ivh $i --nodeps --force
-                    fi
-                done
-                mkdir -p /var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb/snapshots/appbat/tests/
-                mkdir -p  /var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb/app-battery/tests/ 
-		cp expect-tests.tar  test1.pdf  test2.pdf /var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb/app-battery/tests/
-                cp raptor-tests.tar  tcl-tests.tar /var/opt/lsb//test/manager/packages/ftp.linuxfoundation.org/pub/lsb/snapshots/appbat/tests/
-		cd ..
-        else 
-                echo "Please install the realted LSB Packages"
-                exit 1
-        fi
-fi
-
-# Deleted existed user tester
-id tester
-if [ $? -eq  0 ]
-then 
-        echo "User tester was existed"
-        sleep 1
-        userdel -rf tester
-        if [ $? -eq 0 ] || [ $? -eq 6 ]
-        then
-                echo "Success to delete user tester"
-       else
-                echo "Fail to delete user tester"
-        fi
-else 
-        echo "There was not User tester"
-fi
-
-##Funs
-check ()
-{
-if [ $? -eq 0 ]
-then
-        echo "PASS"
-else 
-        echo "FAIL"
-        exit 1
-fi
-}
-
-###Start 
-# Add tester group
-echo ""
-echo "---------------------------------"
-echo "Step 1:Add Group tester"
-groupadd tester
-check
-
-
-# Add User tester 
-echo ""
-echo "---------------------------------"
-echo "Step 2:Add User tester"
-useradd -g tester tester
-check 
-
-echo "Check the tester user"
-id tester
-check 
-
-# Stop Boa server
-#echo ""
-#echo "---------------------------------"
-#echo "Step 3:Stop BOA server"
-#/etc/init.d/boa stop
-#check
-
-# Create Dirnames file for RPM
-echo ""
-echo "---------------------------------"
-echo "Step 4:Create the Dirnames on target"
-
-mkdir -pv /etc/rpm/sysinfo 
-
-cat > /etc/rpm/sysinfo/Dirnames << EOF
-/etc/opt/lsb
-/home/tet/LSB.tools
-/opt/lsb-tet3-lite/lib/ksh
-/opt/lsb-tet3-lite/lib/perl
-/opt/lsb-tet3-lite/lib/posix_sh
-/opt/lsb-tet3-lite/lib/tet3
-/opt/lsb-tet3-lite/lib/xpg3sh
-/opt/lsb/appbat/lib/python2.4/site-packages/qm
-/opt/lsb/appbat/lib/python2.4/site-packages/qm/external
-/opt/lsb/appbat/lib/python2.4/site-packages/qm/external/DocumentTemplate
-/opt/lsb/appbat/lib/python2.4/site-packages/qm/test
-/opt/lsb/appbat/lib/python2.4/site-packages/qm/test/classes
-/opt/lsb/appbat/lib/python2.4/site-packages/qm/test/web
-/opt/lsb/test/doc
-/opt/lsb/test/lib
-/opt/lsb/test/qm/diagnostics
-/opt/lsb/test/qm/doc
-/opt/lsb/test/qm/doc/test/html
-/opt/lsb/test/qm/doc/test/print
-/opt/lsb/test/qm/dtml
-/opt/lsb/test/qm/dtml/test
-/opt/lsb/test/qm/messages/test
-/opt/lsb/test/qm/tutorial/test/tdb
-/opt/lsb/test/qm/tutorial/test/tdb/QMTest
-/opt/lsb/test/qm/web
-/opt/lsb/test/qm/web/images
-/opt/lsb/test/qm/web/stylesheets
-/opt/lsb/test/qm/xml
-/opt/lsb/test/share
-/usr/share/doc/lsb-runtime-test
-/var/opt/lsb
-/opt/lsb/test/desktop
-/opt/lsb/test/desktop/fontconfig
-/opt/lsb/test/desktop/freetype
-/opt/lsb/test/desktop/gtkvts
-/opt/lsb/test/desktop/libpng
-/opt/lsb/test/desktop/qt3
-/opt/lsb/test/desktop/xft
-/opt/lsb/test/desktop/xml
-/opt/lsb/test/desktop/xrender
-
-
-EOF
-
-if [ -f /etc/rpm/sysinfo/Dirnames ]
-then
-        echo "Success to creat Dirnames file"
-else 
-        echo "Fail to creat Dirnames file"
-fi
-
-# ldconfig 
-echo ""
-echo "---------------------------------"
-echo "Step 5:"
-ldconfig -v
-check;
-
-
-# Insmod look.ko
-insmod /lib/modules/2.6.*/kernel/drivers/block/loop.ko
-if [ $? != 0 ];then
-	echo "Please insmod loop.ko  manully"
-fi
-# Start lsb 
-echo ""
-if [ -f /opt/lsb/test/manager/bin/dist-checker-start.pl ];then
-        /opt/lsb/test/manager/bin/dist-checker-start.pl
-fi
-
-# Get ip address for target platform
-addr=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}'|sed s/[[:space:]][[:space:]]Bcast//g`
-echo -e "you should input ${addr}:8888 on your browser"
-
-# Workaround to add part of locales for LSB test
-localedef -i ja_JP -f EUC-JP ja_JP.eucjp
-localedef -i en_US -f ISO-8859-15  en_US.ISO-8859-15
-localedef -i en_US -f ISO-8859-1  en_US.ISO-8859-1
-localedef -i en_US -f ISO-8859-1 en_US
-localedef -i de_DE -f UTF-8  de_DE.UTF-8
-localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
-localedef -i en_US -f UTF-8 en_US.UTF-8
-localedef -i se_NO -f UTF-8 se_NO.UTF-8
-localedef -i de_DE -f ISO-8859-1 de_DE
-localedef -i de_DE -f ISO-8859-15 de_DE.ISO-8859-15
-localedef -i en_US -f ISO-8859-1 en_US.ISO8859-1
-localedef -i fr_FR -f ISO-8859-1 fr_FR
-localedef -i it_IT -f ISO-8859-1 it_IT
-localedef -i es_MX  -f ISO-8859-1 es_MX
-localedef -i en_HK -f ISO-8859-1 en_HK
-localedef -i en_PH -f ISO-8859-1 en_PH
-localedef -i ta_IN -f UTF-8 ta_IN
-
-# Resolve localhost 
-LOCALHOST=`hostname`
-if ! `grep -F -q "$LOCALHOST" /etc/hosts`; then
-    echo "127.0.0.1 $LOCALHOST" >> /etc/hosts
-fi
-
-# Start avahi-daemon                                      
-/etc/init.d/avahi-daemon start                           
-ln -s /etc/init.d/avahi-daemon /etc/rc5.d/S88avahi-daemon 
-
-# Done
-echo "Done!!"
-
-###End
-
-
diff --git a/meta/recipes-extended/lsb/lsbsetup_1.0.bb b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
deleted file mode 100644
index 2792d51..0000000
--- a/meta/recipes-extended/lsb/lsbsetup_1.0.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "auto-setup environment for lsb test"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-PR = "r4"
-
-LIC_FILES_CHKSUM = "file://LSB_Setup.sh;beginline=3;endline=16;md5=97451c7c0786ce5bbe9ac58042945583"
-
-SRC_URI = "file://LSB_Setup.sh"
-
-S = "${WORKDIR}"
-
-do_install() {
-    # Only install file if it has a contents
-    install -d ${D}${bindir}
-    install -d ${D}/${sysconfdir}
-    install -m 0755 ${S}/LSB_Setup.sh ${D}${bindir}
-    install -d  ${D}/${libdir}/lsb
-    ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
-    ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
-    ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
-    ln -sf ${datadir}/zoneinfo/Asia/Hong_Kong ${D}${sysconfdir}/localtime
-}
-
-FILES_${PN} += "${libdir}/lsb \
-               ${libdir}/* \
-               "
-- 
1.7.5.4



