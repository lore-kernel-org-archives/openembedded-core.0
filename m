Return-Path: <Lauren.Post@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0117.outbound.protection.outlook.com [157.56.111.117])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFE66A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 13:23:51 +0000 (UTC)
Received: from CY1PR0301MB0698.namprd03.prod.outlook.com (25.160.159.140) by
	CY1PR0301MB0682.namprd03.prod.outlook.com (25.160.158.152) with
	Microsoft
	SMTP Server (TLS) id 15.0.1049.19; Tue, 14 Oct 2014 13:23:53 +0000
Received: from CY1PR0301MB0700.namprd03.prod.outlook.com (25.160.159.142) by
	CY1PR0301MB0698.namprd03.prod.outlook.com (25.160.159.140) with
	Microsoft
	SMTP Server (TLS) id 15.0.1049.19; Tue, 14 Oct 2014 13:23:51 +0000
Received: from CY1PR0301MB0700.namprd03.prod.outlook.com ([25.160.159.142]) by
	CY1PR0301MB0700.namprd03.prod.outlook.com ([25.160.159.142]) with
	mapi id 15.00.1049.012; Tue, 14 Oct 2014 13:23:51 +0000
From: Lauren Post <Lauren.Post@freescale.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] package.bbclass: Reverse runtime symlinks
	should	be tied to package generation
Thread-Index: AQHP4K86tO1k73uIB0u0hXhga0Umf5wuN6ag
Date: Tue, 14 Oct 2014 13:23:50 +0000
Message-ID: <aae9562924c34959bdc266d1bbfbfd81@CY1PR0301MB0700.namprd03.prod.outlook.com>
References: <1412522062-31211-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1412522062-31211-1-git-send-email-otavio@ossystems.com.br>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.88.168.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0698;UriScan:;
x-forefront-prvs: 03648EFF89
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(189002)(13464003)(199003)(85852003)(50986999)(19580395003)(54356999)(86362001)(31966008)(76482002)(19580405001)(76176999)(92566001)(4396001)(101416001)(21056001)(15202345003)(15975445006)(87936001)(2656002)(85306004)(95666004)(108616004)(99286002)(106356001)(106116001)(74316001)(77096002)(80022003)(46102003)(120916001)(40100003)(105586002)(97736003)(107886001)(33646002)(107046002)(64706001)(76576001)(122556002)(99396003)(20776003)(66066001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0698;
	H:CY1PR0301MB0700.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0682;
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] package.bbclass: Reverse runtime symlinks should	be tied to package generation
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
X-List-Received-Date: Tue, 14 Oct 2014 13:23:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch is breaking our imx6slevk builds which do not support gles2.    =
I can build slevk on its own but not after another machine that supports gl=
es.  I get an error with the runtime-reverse pkgdata for imx6slevk looking =
for gles2 which is not provided on this machine.
	imx6slevk/pkgdata/runtime-reverse/libgles2-mx6

Without this patch they work fine building after other imx machines that do=
 support gles2 before building imx6slevk.

I know Otavio needs this for mx53 but it needs more work for inclusion with=
 machines that do not support gles2.

Lauren

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Sunday, October 05, 2014 10:14 AM
To: OpenEmbedded Core Mailing List
Cc: Otavio Salvador
Subject: [OE-core] [PATCH] package.bbclass: Reverse runtime symlinks should=
 be tied to package generation

In case a package is not generated (is empty and does not has allow empty f=
lag set) the package data regarding reverse runtime dependency shouldn't be=
 done.

This were causing a false-positive in the meta-fsl-arm layer, when building=
 mesa, as:

,----[ Error during build of MX53 in meta-fsl-arm ]
| ERROR: The recipe mesa is trying to install files into a shared area =20
| when those files already exist. Those files and their manifest =20
| location are:
|    /.../build/build/tmp/sysroots/imx53qsb/pkgdata/runtime-reverse/libopen=
vg-dev
|    Matched in manifest-imx53qsb-amd-gpu-x11-bin-mx51.packagedata
| Please verify which recipe should provide the above files.
`----

Fixes [YOCTO: #6795]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/package.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass in=
dex a877d28..f17c8d5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1241,10 +1241,6 @@ python emit_pkgdata() {
         sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
         sf.close()
=20
-        # Symlinks needed for reverse lookups (from the final package name=
)
-        subdata_sym =3D pkgdatadir + "/runtime-reverse/%s" % pkgval
-        oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
-       =20
         # Symlinks needed for rprovides lookup
         if rprov:
             for p in rprov.strip().split():
@@ -1259,6 +1255,10 @@ python emit_pkgdata() {
         os.chdir(root)
         g =3D glob('*')
         if g or allow_empty =3D=3D "1":
+            # Symlinks needed for reverse lookups (from the final package =
name)
+            subdata_sym =3D pkgdatadir + "/runtime-reverse/%s" % pkgval
+            oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
+
             packagedfile =3D pkgdatadir + '/runtime/%s.packaged' % pkg
             open(packagedfile, 'w').close()
=20
--
2.1.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

