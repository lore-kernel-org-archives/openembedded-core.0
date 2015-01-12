Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0117.outbound.protection.outlook.com [157.56.111.117])
	by mail.openembedded.org (Postfix) with ESMTP id 1714372498
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 08:35:23 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.53.17; Mon, 12 Jan 2015 08:20:51 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0053.000; Mon, 12 Jan 2015 08:20:51 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v4 2/2]  u-boot.inc : add compile multiple
	u-boot feature
Thread-Index: AQHQFPMtvsEq0OwIZ0SaX4976YqKWpy8V2PA
Date: Mon, 12 Jan 2015 08:20:50 +0000
Message-ID: <BY2PR03MB441F9A06C9DA2EA7ACA524C84430@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1418268775-20010-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1418268775-20010-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.52]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=B40290@freescale.com; 
x-dmarcaction-test: None
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:BY2PR03MB441;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-forefront-prvs: 0454444834
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(377454003)(13464003)(106356001)(106116001)(50986999)(97736003)(33656002)(54206007)(46102003)(122556002)(54356999)(76176999)(40100003)(19580395003)(19580405001)(77156002)(450100001)(76576001)(74316001)(101416001)(105586002)(64706001)(99286002)(66066001)(86362001)(77096005)(2950100001)(102836002)(68736005)(2900100001)(87936001)(2656002)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2015 08:20:50.8202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB441
Subject: Re: [PATCH v4 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Mon, 12 Jan 2015 08:35:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Ping.

-----Original Message-----
From: Chunrong Guo [mailto:B40290@freescale.com]=20
Sent: Thursday, December 11, 2014 11:33 AM
To: openembedded-core@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH v4 2/2] u-boot.inc : add compile multiple u-boot f=
eature

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 150 +++++++++++++++++++++++++++++++--=
----
 1 file changed, 129 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index c695b73..58725fa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -62,15 +62,56 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
+   =20
+    if [ "x${UBOOT_CONFIG}" !=3D "x" ]
+    then
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x =3D "in"x ]
+                then
+                    continue
+                fi
+                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then
+                    break
+                else
+                    oe_runmake O=3D${config} ${config}
+                    oe_runmake O=3D${config} ${UBOOT_MAKE_TARGET}
+                    cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-b=
oot-${type}.${UBOOT_SUFFIX}
+                fi
+            done
+        done
+    else
+        oe_runmake ${UBOOT_MACHINE}
+        oe_runmake ${UBOOT_MAKE_TARGET}
+    fi
=20
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake ${UBOOT_MAKE_TARGET}
 }
=20
 do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    if [ "x${UBOOT_CONFIG}" !=3D "x" ]
+    then
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x =3D "in"x ]
+                then
+                    continue
+                fi
+                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then
+                    break
+                else
+                    install -d ${D}/boot
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} =
${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOO=
T_BINARY}
+                fi
+            done
+        done
+    else
+        install -d ${D}/boot
+        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    fi
=20
     if [ -e ${WORKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
@@ -79,8 +120,28 @@ do_install () {
=20
     if [ "x${SPL_BINARY}" !=3D "x" ]
     then
-        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        if [ "x${UBOOT_CONFIG}" !=3D "x" ]  =20
+        then
+            for config in ${UBOOT_MACHINE}; do
+                for type in in ${UBOOT_CONFIG}; do
+                     if [ "${type}"x =3D "in"x ]
+                     then
+                         continue
+                     fi
+                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}"]
+                     then
+                         break
+                     else
+                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${=
SPL_IMAGE}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINAR=
Y}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINAR=
Y}
+                     fi
+                done
+            done
+        else
+            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        fi
     fi
=20
     if [ "x${UBOOT_ENV}" !=3D "x" ]
@@ -93,21 +154,68 @@ do_install () {
 FILES_${PN} =3D "/boot ${sysconfdir}"
=20
 do_deploy () {
-    install -d ${DEPLOYDIR}
-    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-
-    cd ${DEPLOYDIR}
-    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
-    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
-
-    if [ "x${SPL_BINARY}" !=3D "x" ]
+    if [ "x${UBOOT_CONFIG}" !=3D "x" ]
     then
-        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-    fi
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x =3D "in"x ] =20
+                then
+                    continue
+                fi
+                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then=20
+                    break
+                else
+                    install -d ${DEPLOYDIR}
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} =
${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
+                    cd ${DEPLOYDIR}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+                fi=20
+            done=20
+        done
+    else
+        install -d ${DEPLOYDIR}
+        install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        cd ${DEPLOYDIR}
+        rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+   fi
+   =20
+
+
+     if [ "x${SPL_BINARY}" !=3D "x" ]
+     then
+         if [ "x${UBOOT_CONFIG}" !=3D "x" ]  =20
+         then
+             for config in ${UBOOT_MACHINE}; do
+                 for type in in ${UBOOT_CONFIG}; do
+                      if [ "${type}"x =3D "in"x ]
+                      then
+                          continue
+                      fi
+                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}"]
+                      then
+                          break
+                      else
+                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR=
}/${SPL_IMAGE}-${type}
+                          rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${=
SPL_SYMLINK}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_B=
INARY}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_B=
INARY}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_S=
YMLINK}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_S=
YMLINK}
+                      fi
+                 done
+             done
+         else
+             install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+             rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
+             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
+             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+         fi
+     fi
+
=20
     if [ "x${UBOOT_ENV}" !=3D "x" ]
     then
--=20
1.9.2


