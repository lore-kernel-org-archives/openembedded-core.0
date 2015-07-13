Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CBE267391D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 00:23:52 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZERXD-000771-51 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jul 2015 17:23:51 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.233]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0224.002; Mon, 13 Jul 2015 01:23:50 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] initrdscripts: handle mmc device as
	installer	medium
Thread-Index: AQHQuIiun4HuWapzNkiovXmFWMSudp3Yky9k
Date: Mon, 13 Jul 2015 00:23:49 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28FAB5F98D@EU-MBX-02.mgc.mentorg.com>
References: <1436255017-950-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1436255017-950-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
Subject: Re: [PATCH] initrdscripts: handle mmc device as installer	medium
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
X-List-Received-Date: Mon, 13 Jul 2015 00:23:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi folks,=0A=
=0A=
Any objections on the below patch?=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Tuesday, July 07, 2015 12:43 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] initrdscripts: handle mmc device as installer   =
     medium=0A=
=0A=
Platforms which have the capability of using the MMC as an=0A=
installer medium will present the same MMC device as an=0A=
installation candidate. This happens because the MMC=0A=
devices appear as mmcblk<X> and the current script strips=0A=
up the <X> which is needed to identify an MMC device=0A=
uniqely.=0A=
This patch now updates the way device identifier stripping=0A=
is done and handles the exclusion of installer device from=0A=
installation candidates more generically.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 .../initrdscripts/files/init-install-efi.sh          | 20 ++++++++++++++++=
----=0A=
 .../recipes-core/initrdscripts/files/init-install.sh | 20 ++++++++++++++++=
----=0A=
 2 files changed, 32 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/me=
ta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
index 14939ac..f339b30 100644=0A=
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
@@ -18,7 +18,14 @@ swap_ratio=3D5=0A=
 hdnamelist=3D""=0A=
 live_dev_name=3D`cat /proc/mounts | grep ${1%/} | awk '{print $1}'`=0A=
 live_dev_name=3D${live_dev_name#\/dev/}=0A=
-live_dev_name=3D${live_dev_name%%[0-9]*}=0A=
+# Only strip the digit identifier if the device is not an mmc=0A=
+case $live_dev_name in=0A=
+    mmcblk*)=0A=
+    ;;=0A=
+    *)=0A=
+        live_dev_name=3D${live_dev_name%%[0-9]*}=0A=
+    ;;=0A=
+esac=0A=
=0A=
 echo "Searching for hard drives ..."=0A=
=0A=
@@ -36,9 +43,14 @@ for device in `ls /sys/block/`; do=0A=
         *)=0A=
             # skip the device LiveOS is on=0A=
             # Add valid hard drive name to the list=0A=
-            if [ $device !=3D $live_dev_name -a -e /dev/$device ]; then=0A=
-                hdnamelist=3D"$hdnamelist $device"=0A=
-            fi=0A=
+            case $device in=0A=
+                $live_dev_name*)=0A=
+                # skip the device we are running from=0A=
+                ;;=0A=
+                *)=0A=
+                    hdnamelist=3D"$hdnamelist $device"=0A=
+                ;;=0A=
+            esac=0A=
             ;;=0A=
     esac=0A=
 done=0A=
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/r=
ecipes-core/initrdscripts/files/init-install.sh=0A=
index 7fccdde..f9e9768 100644=0A=
--- a/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
@@ -17,7 +17,14 @@ swap_ratio=3D5=0A=
 hdnamelist=3D""=0A=
 live_dev_name=3D`cat /proc/mounts | grep ${1%/} | awk '{print $1}'`=0A=
 live_dev_name=3D${live_dev_name#\/dev/}=0A=
-live_dev_name=3D${live_dev_name%%[0-9]*}=0A=
+# Only strip the digit identifier if the device is not an mmc=0A=
+case $live_dev_name in=0A=
+    mmcblk*)=0A=
+    ;;=0A=
+    *)=0A=
+        live_dev_name=3D${live_dev_name%%[0-9]*}=0A=
+    ;;=0A=
+esac=0A=
=0A=
 echo "Searching for hard drives ..."=0A=
=0A=
@@ -35,9 +42,14 @@ for device in `ls /sys/block/`; do=0A=
         *)=0A=
             # skip the device LiveOS is on=0A=
             # Add valid hard drive name to the list=0A=
-            if [ $device !=3D $live_dev_name -a -e /dev/$device ]; then=0A=
-                hdnamelist=3D"$hdnamelist $device"=0A=
-            fi=0A=
+            case $device in=0A=
+                $live_dev_name*)=0A=
+                # skip the device we are running from=0A=
+                ;;=0A=
+                *)=0A=
+                    hdnamelist=3D"$hdnamelist $device"=0A=
+                ;;=0A=
+            esac=0A=
             ;;=0A=
     esac=0A=
 done=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

