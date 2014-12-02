Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0136.outbound.protection.outlook.com [157.56.110.136])
	by mail.openembedded.org (Postfix) with ESMTP id B07FE72221
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 04:05:17 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB272.namprd03.prod.outlook.com (10.242.37.24) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Tue, 2 Dec 2014 03:50:09 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Tue, 2 Dec 2014 03:50:07 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0026.003; Tue, 2 Dec 2014 03:50:07 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2 2/2] u-boot.inc : add compile multiple u-boot
	feature
Thread-Index: AQHQB6b0IJ6vGTt3Ek28I66XY+bafZx7tr+A
Date: Tue, 2 Dec 2014 03:50:06 +0000
Message-ID: <BY2PR03MB441BB9D559D643A287472FB847A0@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1416806674-15725-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1416806674-15725-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.52]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;UriScan:;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-forefront-prvs: 0413C9F1ED
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(13464003)(189002)(377454003)(54606007)(76176999)(50986999)(54356999)(19580395003)(19580405001)(74316001)(40100003)(97736003)(68736005)(76576001)(99396003)(46102003)(122556002)(450100001)(2656002)(87936001)(77156002)(31966008)(62966003)(64706001)(66066001)(120916001)(20776003)(101416001)(54206007)(107046002)(106356001)(105586002)(106116001)(95666004)(99286002)(21056001)(33656002)(86362001)(92566001)(92726001)(4396001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB272;
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Tue, 02 Dec 2014 04:05:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping .

-----Original Message-----
From: Chunrong Guo [mailto:B40290@freescale.com]=20
Sent: Monday, November 24, 2014 1:25 PM
To: openembedded-core@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH v2 2/2] u-boot.inc : add compile multiple u-boot f=
eature

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 56 +++++++++++++++++++++-------------=
----
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index c695b73..bd76241 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -63,25 +63,32 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
=20
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake ${UBOOT_MAKE_TARGET}
+    for type in ${UBOOT_MACHINE}; do
+        oe_runmake O=3D${type} ${type}
+        oe_runmake O=3D${type} ${UBOOT_MAKE_TARGET}
+        cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.bin
+    done
+
 }
=20
 do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    for type in ${UBOOT_MACHINE}; do
+        install -d ${D}/boot
+        install ${S}/${type}/u-boot-${type}.bin ${D}/boot/u-boot-${type}.b=
in
+    done
=20
     if [ -e ${WORKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
         install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.c=
onfig
     fi
=20
-    if [ "x${SPL_BINARY}" !=3D "x" ]
-    then
-        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
-    fi
+    for type in ${UBOOT_MACHINE}; do
+        if [ "x${SPL_BINARY}" !=3D "x" ] && [ -d "${S}/${type}/${SPL_BINAR=
Y}"]
+        then
+            install ${S}/${type}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        fi
+    done
=20
     if [ "x${UBOOT_ENV}" !=3D "x" ]
     then
@@ -93,21 +100,20 @@ do_install () {
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
-    then
-        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-    fi
+    for type in ${UBOOT_MACHINE}; do
+        install -d ${DEPLOYDIR}
+        install ${S}/${type}/u-boot-${type}.bin ${DEPLOYDIR}/u-boot-${type=
}.bin
+    done
+   =20
+    for type in ${UBOOT_MACHINE}; do
+        if [ "x${SPL_BINARY}" !=3D "x" ] && [ -d "${S}/${type}/${SPL_BINAR=
Y}"]
+        then
+            install ${S}/${type}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+            rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
+            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
+            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+        fi
+    done
=20
     if [ "x${UBOOT_ENV}" !=3D "x" ]
     then
--=20
1.9.2


