Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0130.outbound.protection.outlook.com [157.56.111.130])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3A8728D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 08:16:20 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB443.namprd03.prod.outlook.com (10.141.141.152) with Microsoft
	SMTP Server (TLS) id 15.1.31.17; Fri, 19 Dec 2014 08:16:18 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0031.000; Fri, 19 Dec 2014 08:16:18 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v4 1/2] uboot-config.bbclass: Allow multiple
	U-Boot config for machine
Thread-Index: AQHQFPMhs5x/zZli0UScfjgQ834zIJyWnjDg
Date: Fri, 19 Dec 2014 08:16:17 +0000
Message-ID: <BY2PR03MB441C2C0DAAF2B2ABB084113846B0@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1418268755-19969-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1418268755-19969-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.52]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=B40290@freescale.com; 
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB443;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB443;
x-forefront-prvs: 0430FA5CB7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(189002)(13464003)(199003)(102836002)(77096005)(2656002)(87936001)(68736005)(19580405001)(2900100001)(2950100001)(120916001)(99396003)(77156002)(31966008)(450100001)(62966003)(122556002)(40100003)(20776003)(99286002)(64706001)(21056001)(107046002)(86362001)(92566001)(66066001)(106116001)(106356001)(105586002)(97736003)(4396001)(54606007)(46102003)(19580395003)(50986999)(76176999)(33656002)(54356999)(54206007)(101416001)(76576001)(74316001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB443;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v4 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Fri, 19 Dec 2014 08:16:22 -0000
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
Subject: [OE-core][PATCH v4 1/2] uboot-config.bbclass: Allow multiple U-Boo=
t config for machine

  This adds support to build multiple U-Boot configs for a machine; this
  is useful when we have support for different media boots which require
  different U-Boot configuration (e.g: eMMC and NAND).

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/uboot-config.bbclass | 37 ++++++++++++++---------------------=
--
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.=
bbclass
index b467659..cb061af 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -31,28 +31,19 @@ python () {
         return
=20
     ubootconfig =3D (d.getVar('UBOOT_CONFIG', True) or "").split()
-    if len(ubootconfig) > 1:
-        raise bb.parse.SkipPackage('You can only have a single default for=
 UBOOT_CONFIG.')
+    if len(ubootconfig) > 0:
+        for config in ubootconfig:
+            for f, v in ubootconfigflags.items():
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


