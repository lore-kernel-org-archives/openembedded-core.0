Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0184.outbound.protection.outlook.com [207.46.163.184])
	by mail.openembedded.org (Postfix) with ESMTP id 1C07765CFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 07:42:11 +0000 (UTC)
Received: from DM2PR03MB399.namprd03.prod.outlook.com (10.141.84.148) by
	DM2PR03MB397.namprd03.prod.outlook.com (10.141.84.139) with Microsoft
	SMTP Server (TLS) id 15.0.921.12; Fri, 18 Apr 2014 07:42:09 +0000
Received: from DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) by
	DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) with mapi id
	15.00.0921.000; Fri, 18 Apr 2014 07:42:09 +0000
From: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Vali Cobelea
	<valentin.cobelea@enea.com>
Thread-Topic: JAVA build problem with latest poky + meta-fsl-ppc + meta-java
Thread-Index: Ac9a2a7cGbLvXtnORD+pwKuneHPiAA==
Date: Fri, 18 Apr 2014 07:42:08 +0000
Message-ID: <37e02f2913a24f80b793f961d9600f60@DM2PR03MB399.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.50]
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(189002)(199002)(53754006)(79102001)(33646001)(92566001)(20776003)(83072002)(85852003)(77982001)(15202345003)(74502001)(74662001)(80022001)(66066001)(31966008)(15975445006)(81342001)(50986999)(86362001)(81542001)(87936001)(99286001)(2656002)(19580395003)(80976001)(46102001)(74316001)(77096999)(54356999)(99396002)(76482001)(4396001)(76576001)(83322001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB397;
	H:DM2PR03MB399.namprd03.prod.outlook.com;
	FPR:FEDA70D5.2F379411.31D66944.D8CB52A0.20237; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "White.Weng@freescale.com" <White.Weng@freescale.com>,
	Richard Schmitt <richard.schmitt@freescale.com>
Subject: JAVA build problem with latest poky + meta-fsl-ppc + meta-java
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
X-List-Received-Date: Fri, 18 Apr 2014 07:42:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,=20

When I try to use latest poky + meta-fsl-ppc + meta-java to build java-test=
-image for e6500 target, the compilesteptwo step of openjdk-6-jre failed as=
 following:
| GENERATING /home/jenkins/poky/build_b4860qds_release/tmp/work/ppce6500-fs=
l-linux/openjdk-6-jre/6b27-1.12.5-r22.2/icedtea6-1.12.5/build/generated.bui=
ld/sun/awt/X11/generator/sizes.32
| Unable to find CPU definition

According to the investigation, the compilesteptwo step of openjdk-6-jre la=
unches qemu for e6500 target, seems like the qemu source provided by poky d=
oesn't support e6500 emulation, so above "Unable to find CPU definition" er=
ror appears. Java can be built correctly before below two commits are merge=
d.=20
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/conf/bitbake.con=
f?h=3Ddaisy&id=3D18bbfc4cf32b3ed564f93efef16a391c5a3ae50f
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/conf/machine/inc=
lude/tune-ppce6500.inc?h=3Ddaisy&id=3D888ceb12522e19e30759acc67336f010b63ad=
864

IMHO, following are three possible ways to solve the issue=20
1. Reverse above two commits until qemu supports ppce6500 targets=20
2. Use the cpu parameter to something that QEMU supports and is similar to =
e6500 (e,g, e500mc) until ppce6500 is supported by qemu=20
3. Use FSL qemu source for qemu-native build when machine is ppce6500 targe=
ts, we are verifying this way.=20

Any comment on the problem, and any better solution for this issue?


Best Regards,

Zhenhua

