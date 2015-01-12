Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0136.outbound.protection.outlook.com [157.56.111.136])
	by mail.openembedded.org (Postfix) with ESMTP id 35E027162E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 08:35:10 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB442.namprd03.prod.outlook.com (10.141.141.145) with Microsoft
	SMTP Server (TLS) id 15.1.53.17; Mon, 12 Jan 2015 08:21:02 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0053.000; Mon, 12 Jan 2015 08:21:02 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v4 1/2] uboot-config.bbclass: Allow multiple
	U-Boot config for machine
Thread-Index: AQHQFPMhs5x/zZli0UScfjgQ834zIJy8V3Xw
Date: Mon, 12 Jan 2015 08:21:02 +0000
Message-ID: <BY2PR03MB4412C070917B6E7A3B499F284430@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1418268755-19969-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1418268755-19969-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.52]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=B40290@freescale.com; 
x-dmarcaction-test: None
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:BY2PR03MB442;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB442;
x-forefront-prvs: 0454444834
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(377454003)(13464003)(189002)(74316001)(106116001)(40100003)(122556002)(19580395003)(19580405001)(76576001)(97736003)(105586002)(54206007)(86362001)(2656002)(87936001)(106356001)(99286002)(102836002)(54356999)(50986999)(450100001)(77156002)(33656002)(2950100001)(2900100001)(64706001)(46102003)(66066001)(101416001)(76176999)(77096005)(68736005)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB442;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2015 08:21:02.4611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB442
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
X-List-Received-Date: Mon, 12 Jan 2015 08:35:22 -0000
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


