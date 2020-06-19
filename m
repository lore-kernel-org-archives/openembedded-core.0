Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web12.1553.1592550946725155456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 00:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: noor_ahsan@mentor.com)
IronPort-SDR: Ximqw5nhUedBBya5Tb+iwbgVgSmlnjfR8bNOTvNwb4zD3Aok3DJVTFpujX0Ta7c5H76LleS/w2
 Wvq40v6UAu/hcCLQsVlTWpXeylnh7cM4MR5G2ObXQivJcgX37uXXthgRQtq/UKD33L2+ku1Yc2
 qpdB1WK1//7Z9eV6cU1O7aaac0XKqmm0kt6VUk4UQA2MnZeHCCG8z0RfCdanCAMGjoDCITsFaa
 1imxpBF6Se9DEVVXqrk5p5W/90XOPICkDS7ugMycs7pY1LX5q7YdjSxeziA1Ykum8taFuOn+mr
 dmo=
X-IronPort-AV: E=Sophos;i="5.75,254,1589270400"; 
   d="scan'208";a="52123777"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 18 Jun 2020 23:15:46 -0800
IronPort-SDR: lwg0EhsUHeY+qvaJ934MQi2Nyza379zYvo/br91UdDGZAzPvYoMvgQ8qyODh3jrKIaS2eJstPG
 55UVsaMSqjbzDBvqZO6xLo4LJe093kkijsfUDRj9bQiEmLsdGlPpnLFE6rGsqDR+YsZ9RdHxtx
 EZE56nIgHmYRDrtscANTxLyMKtybpa/ZLOacpoJ70KxQbw7SqkoZ9N39rVaYlzcq2kvTPnO1rP
 +2k6QJ5BsW/ieAh8sIacowBkPQFVc7bSx2Z2Caf2guIBdZm9Pw4ah3C8mZcBBXF4QH0l2E+WQX
 5wY=
From: "Noor Ahsan" <noor_ahsan@mentor.com>
To: Ming Liu <liu.ming50@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "stefan.agner@toradex.com" <stefan.agner@toradex.com>,
	"max.krummenacher@toradex.com" <max.krummenacher@toradex.com>, Ming Liu
	<ming.liu@toradex.com>
Subject: Re: [OE-core] [PATCH V2] u-boot: support merging .cfg files for UBOOT_CONFIG
Thread-Topic: [OE-core] [PATCH V2] u-boot: support merging .cfg files for
 UBOOT_CONFIG
Thread-Index: AQHWOZ3eKv2iQ+fQG0aOx0dyQ8uMEqjfn0ZQ
Date: Fri, 19 Jun 2020 07:15:41 +0000
Message-ID: <344a06c00c694445ad70c974e5347d5a@svr-ies-mbx-02.mgc.mentorg.com>
References: <20200603115601.13841-1-liu.ming50@gmail.com>
In-Reply-To: <20200603115601.13841-1-liu.ming50@gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can this be ported/merged to dunfell also?

Noor

-----Original Message-----
From: openembedded-core@lists.openembedded.org [mailto:openembedded-core@li=
sts.openembedded.org] On Behalf Of Ming Liu
Sent: Wednesday, June 3, 2020 4:56 PM
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com; max.krummenacher@toradex.com; Ming Liu <ming.=
liu@toradex.com>
Subject: [OE-core] [PATCH V2] u-boot: support merging .cfg files for UBOOT_=
CONFIG

From: Ming Liu <ming.liu@toradex.com>

U-boot recipe supports .cfg files in SRC_URI, but they would be merged to .=
config during do_configure only when UBOOT_MACHINE is set, we should also s=
upport merging .cfg files for UBOOT_CONFIG.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 80f828df52..8cfd25020c 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -77,7 +77,23 @@ def find_cfgs(d):
     return sources_list
=20
 do_configure () {
-    if [ -z "${UBOOT_CONFIG}" ]; then
+    if [ -n "${UBOOT_CONFIG}" ]; then
+        unset i j
+        for config in ${UBOOT_MACHINE}; do
+            i=3D$(expr $i + 1);
+            for type in ${UBOOT_CONFIG}; do
+                j=3D$(expr $j + 1);
+                if [ $j -eq $i ]; then
+                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
+                    merge_config.sh -m -O ${B}/${config} ${B}/${config}/.c=
onfig ${@" ".join(find_cfgs(d))}
+                    oe_runmake -C ${S} O=3D${B}/${config} oldconfig
+                fi
+            done
+            unset j
+        done
+        unset i
+        DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
+    else
         if [ -n "${UBOOT_MACHINE}" ]; then
             oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE}
         else
@@ -85,8 +101,6 @@ do_configure () {
         fi
         merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
         cml1_do_configure
-    else
-        DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
     fi
 }
=20
@@ -114,7 +128,6 @@ do_compile () {
                 j=3D$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
                     oe_runmake -C ${S} O=3D${B}/${config} ${UBOOT_MAKE_TAR=
GET}
                     for binary in ${UBOOT_BINARIES}; do
                         k=3D$(expr $k + 1);
--
2.26.2

