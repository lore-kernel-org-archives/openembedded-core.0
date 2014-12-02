Return-Path: <B40290@freescale.com>
X-Greylist: delayed 907 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Dec 2014 04:05:17 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0132.outbound.protection.outlook.com [157.56.111.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB6F72200
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 04:05:17 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB444.namprd03.prod.outlook.com (10.141.141.154) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Tue, 2 Dec 2014 03:50:26 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0026.003; Tue, 2 Dec 2014 03:50:26 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2 1/2] uboot-config.bbclass: Allow multiple
	U-Boot config for machine
Thread-Index: AQHQB6bq08DqnO8hA0C9AEVaE2KgsZx7tt/Q
Date: Tue, 2 Dec 2014 03:50:26 +0000
Message-ID: <BY2PR03MB441E1542D0395E6BAFE4571847A0@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1416806658-15685-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1416806658-15685-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.52]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB444;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB444;
x-forefront-prvs: 0413C9F1ED
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(199003)(13464003)(189002)(92566001)(46102003)(106356001)(74316001)(105586002)(106116001)(107046002)(95666004)(99286002)(31966008)(92726001)(99396003)(4396001)(120916001)(101416001)(97736003)(21056001)(87936001)(19580405001)(2656002)(33656002)(86362001)(54606007)(76176999)(50986999)(54356999)(40100003)(19580395003)(54206007)(122556002)(20776003)(64706001)(450100001)(76576001)(68736005)(66066001)(62966003)(77156002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB444;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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

Ping.

-----Original Message-----
From: Chunrong Guo [mailto:B40290@freescale.com]=20
Sent: Monday, November 24, 2014 1:24 PM
To: openembedded-core@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH v2 1/2] uboot-config.bbclass: Allow multiple U-Boo=
t config for machine

   This adds support to build multiple U-Boot configs for a machine; this
   is useful when we have support for different media boots which require
   different U-Boot configuration (e.g: eMMC and NAND).

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/uboot-config.bbclass | 42 +++++++++++++++--------------------=
----
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.=
bbclass
index 8ac1b71..f70ca88 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -31,31 +31,21 @@ python () {
         return
=20
     ubootconfig =3D (d.getVar('UBOOT_CONFIG', True) or "").split()
-    if len(ubootconfig) > 1:
-        raise bb.parse.SkipPackage('You can only have a single default for=
 UBOOT_CONFIG.')
+    if len(ubootconfig) > 0:
+        for config in ubootconfig:
+            for f, v in ubootconfigflags.items():
+                if f =3D=3D 'defaultval':
+                    continue
+                if config =3D=3D f:=20
+                    items =3D v.split(',')
+                    if items[0] and len(items) > 2:
+                        raise bb.parse.SkipPackage('Only config,images can=
 be specified!')
+                    d.appendVar('UBOOT_MACHINE', ' ' + items[0])
+                    # IMAGE_FSTYPES appending
+                    if len(items) > 1 and items[1]:
+                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % i=
tems[1])
+                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+                    break
     elif len(ubootconfig) =3D=3D 0:
-        raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG=
.')
-    ubootconfig =3D ubootconfig[0]
-
-    for f, v in ubootconfigflags.items():
-        if f =3D=3D 'defaultval':
-            continue
-
-        items =3D v.split(',')
-        if items[0] and len(items) > 2:
-            raise bb.parse.SkipPackage('Only config,images can be specifie=
d!')
-
-        if ubootconfig =3D=3D f:
-            bb.debug(1, "Setting UBOOT_MACHINE to %s." % items[0])
-            d.setVar('UBOOT_MACHINE', items[0])
-
-            # IMAGE_FSTYPES appending
-            if len(items) > 1 and items[1]:
-                bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
-                d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
-
-            # Go out as we found a match!
-            break
-    else:
-        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ub=
ootconfig)
+       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.=
')
 }
--=20
1.9.2


