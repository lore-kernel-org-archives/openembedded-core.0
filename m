Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web11.10268.1593783568423598815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: noor_ahsan@mentor.com)
IronPort-SDR: Qx/CP1jm/UXOB3WtOsTTiC1YP64bh8WFMM7E7a9wS3SXDQF/h6NNMBmUjS7dBD3CrZd0QuQ/JQ
 Zj5e8j0m04TTL+I7uxb6VEM7xrqPpbVuAyzsvNGBVQZ9PaPdzvmNXznTd4Zdjm6XcxJHTWMSwM
 FGb1NG62CPVsCOQFzYmBC7VGPKQkF9Kn56J5rHoNa1nxFgTE084rb4d1kEsHT4XMeficV4zdc1
 6ODHO5VuGlrPm5oTN//lL85UNfq4N5gGcCefEEWPsFboXmoLexp+SNkjVUaL6UgJtJ9i31W7GK
 Q7Q=
X-IronPort-AV: E=Sophos;i="5.75,308,1589270400"; 
   d="scan'208";a="52715651"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 03 Jul 2020 05:39:27 -0800
IronPort-SDR: 1EOaPskqmHYHDThkhjRLq8IbqubnW5T9JOS/QPqnp7MYtGAXZEda15/9FBJL02ECLkwhiz2oIQ
 WpHjcRL4iEsk2WxrQp5weWjWxtDEjpTTR5oQPo2JdeeUgNnvlmb6r9Pl5hAeJSyzJLwOn9NmEp
 qkgXwBtDdeR06Cp+pH06o1awPDU3XGiDDLBQ1hoxqRx15vlfPcjcwJNDvYXFlK2yN3uPvjt1rR
 9GTH4u6r0rrV0MNj2H8eL82Furaa4ie9qpCBQEK/Xw94TcEFmQqKAIIDUGe7JaO/t4o+krzJju
 aUg=
From: "Noor Ahsan" <noor_ahsan@mentor.com>
To: "Hussain, Ahsan" <Ahsan_Hussain@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] u-boot: support merging .cfg files for UBOOT_CONFIG
Thread-Topic: [OE-core] [dunfell][PATCH 1/2] u-boot: support merging .cfg
 files for UBOOT_CONFIG
Thread-Index: AQHWTfYIi7/ynizb/02sXhkFXesGEqj14qsw
Date: Fri, 3 Jul 2020 13:39:22 +0000
Message-ID: <43478b9e0d2e46da87bb23e97c124cbb@svr-ies-mbx-02.mgc.mentorg.com>
References: <cover.1593420599.git.ahsan_hussain@mentor.com>
 <63967d5c25d4235fe0d80ec0399463e26d087faf.1593420599.git.ahsan_hussain@mentor.com>
In-Reply-To: <63967d5c25d4235fe0d80ec0399463e26d087faf.1593420599.git.ahsan_hussain@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Can you merge this on Dunfell,

Noor

-----Original Message-----
From: openembedded-core@lists.openembedded.org [mailto:openembedded-core@li=
sts.openembedded.org] On Behalf Of Hussain, Ahsan
Sent: Monday, June 29, 2020 2:16 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [dunfell][PATCH 1/2] u-boot: support merging .cfg files =
for UBOOT_CONFIG

From: Ming Liu <ming.liu@toradex.com>

U-boot recipe supports .cfg files in SRC_URI, but they would be merged to .=
config during do_configure only when UBOOT_MACHINE is set, we should also s=
upport merging .cfg files for UBOOT_CONFIG.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Ming Liu <ming.liu@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.25.1

