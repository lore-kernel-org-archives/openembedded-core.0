Return-Path: <B40290@freescale.com>
X-Greylist: delayed 850 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Mar 2015 02:21:02 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0129.outbound.protection.outlook.com [207.46.100.129])
	by mail.openembedded.org (Postfix) with ESMTP id 4937873913
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 02:21:02 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.118.15; Mon, 16 Mar 2015 02:06:51 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0118.009; Mon, 16 Mar 2015 02:06:51 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v4]  u-boot.inc: fix rename image error
Thread-Index: AQHQW99rlo7+MttW20+UqNwNJBpZj50eY+5Q
Date: Mon, 16 Mar 2015 02:06:51 +0000
Message-ID: <BY2PR03MB44188D83F5FD6ACC590001884020@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1426066820-19627-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1426066820-19627-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.158.241.86]
authentication-results: freescale.com; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(377454003)(50986999)(2501003)(122556002)(19580395003)(19580405001)(450100001)(40100003)(54356999)(33656002)(76176999)(2900100001)(74316001)(66066001)(2950100001)(92566002)(102836002)(62966003)(77156002)(46102003)(76576001)(2656002)(77096005)(106116001)(86362001)(99286002)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BY2PR03MB4412B704EFB9F782D44E9B184020@BY2PR03MB441.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BY2PR03MB441; BCL:0;
	PCL:0; RULEID:; SRVR:BY2PR03MB441; 
x-forefront-prvs: 05177D47DC
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2015 02:06:51.5485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB441
Subject: Re: [PATCH v4] u-boot.inc: fix rename image error
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
X-List-Received-Date: Mon, 16 Mar 2015 02:21:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pings.

-----Original Message-----
From: Chunrong Guo [mailto:B40290@freescale.com]=20
Sent: Wednesday, March 11, 2015 5:40 PM
To: openembedded-core@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH v4] u-boot.inc: fix rename image error

  Resolve mismatch between U-Boot configs and uboot image name.
  The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
  and repeat compile or install so we need to check if ${type} match ${conf=
ig} .

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 85 ++++++++++++++++------------------=
----
 1 file changed, 35 insertions(+), 50 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 6bdc86a..9b52971 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -66,20 +66,17 @@ do_compile () {
     if [ "x${UBOOT_CONFIG}" !=3D "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x =3D "in"x ]
+            i=3D`expr $i + 1`;
+            for type  in ${UBOOT_CONFIG}; do
+                j=3D`expr $j + 1`;
+                if [ $j -eq $i ]
                 then
-                    continue
-                fi
-                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}" ]
-                then
-                    break
-                else
                     oe_runmake O=3D${config} ${config}
                     oe_runmake O=3D${config} ${UBOOT_MAKE_TARGET}
                     cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-b=
oot-${type}.${UBOOT_SUFFIX}
                 fi
             done
+            unset  j
         done
     else
         oe_runmake ${UBOOT_MACHINE}
@@ -92,20 +89,17 @@ do_install () {
     if [ "x${UBOOT_CONFIG}" !=3D "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x =3D "in"x ]
-                then
-                    continue
-                fi
-                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}" ]
+            i=3D`expr $i + 1`;
+            for type in ${UBOOT_CONFIG}; do
+                j=3D`expr $j + 1`;
+                if [ $j -eq $i ]
                 then
-                    break
-                else
                     install -d ${D}/boot
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} =
${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOO=
T_BINARY}
                 fi
             done
+            unset  j
         done
     else
         install -d ${D}/boot
@@ -123,20 +117,17 @@ do_install () {
         if [ "x${UBOOT_CONFIG}" !=3D "x" ]  =20
         then
             for config in ${UBOOT_MACHINE}; do
-                for type in in ${UBOOT_CONFIG}; do
-                     if [ "${type}"x =3D "in"x ]
-                     then
-                         continue
-                     fi
-                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}" ]
-                     then
-                         break
-                     else
+                i=3D`expr $i + 1`;
+                for type in ${UBOOT_CONFIG}; do
+                    j=3D`expr $j + 1`;
+                    if [ $j -eq $i ]
+                    then
                          install ${S}/${config}/${SPL_BINARY} ${D}/boot/${=
SPL_IMAGE}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINAR=
Y}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINAR=
Y}
-                     fi
+                    fi
                 done
+                unset  j
             done
         else
             install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE} @@ -157,15 +=
148,11 @@ do_deploy () {
     if [ "x${UBOOT_CONFIG}" !=3D "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x =3D "in"x ] =20
+            i=3D`expr $i + 1`;
+            for type in ${UBOOT_CONFIG}; do
+                j=3D`expr $j + 1`;
+                if [ $j -eq $i ]
                 then
-                    continue
-                fi
-                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}" ]
-                then=20
-                    break
-                else
                     install -d ${DEPLOYDIR}
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} =
${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
@@ -173,6 +160,7 @@ do_deploy () {
                     ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
                 fi=20
             done=20
+            unset  j
         done
     else
         install -d ${DEPLOYDIR}
@@ -190,23 +178,20 @@ do_deploy () {
          if [ "x${UBOOT_CONFIG}" !=3D "x" ]  =20
          then
              for config in ${UBOOT_MACHINE}; do
-                 for type in in ${UBOOT_CONFIG}; do
-                      if [ "${type}"x =3D "in"x ]
-                      then
-                          continue
-                      fi
-                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}" ]
-                      then
-                          break
-                      else
-                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR=
}/${SPL_IMAGE}-${type}
-                          rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${=
SPL_SYMLINK}-${type}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_B=
INARY}-${type}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_B=
INARY}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_S=
YMLINK}-${type}
-                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_S=
YMLINK}
-                      fi
+                 i=3D`expr $i + 1`;
+                 for type in ${UBOOT_CONFIG}; do
+                     j=3D`expr $j + 1`;
+                     if [ $j -eq $i ]
+                     then
+                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}=
/${SPL_IMAGE}-${type}
+                         rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${S=
PL_SYMLINK}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BI=
NARY}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BI=
NARY}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SY=
MLINK}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SY=
MLINK}
+                     fi
                  done
+                 unset  j
              done
          else
              install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
--
1.9.2


