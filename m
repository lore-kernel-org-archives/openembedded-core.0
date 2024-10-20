Return-Path: <diego.santacruz@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D82D3C92A
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 12:59:40 +0000 (UTC)
Received: from ZRAP278CU002.outbound.protection.outlook.com (ZRAP278CU002.outbound.protection.outlook.com [52.101.186.102])
 by mx.groups.io with SMTP id smtpd.web10.24358.1729429174059272437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Oct 2024 05:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=upo1htfW;
 spf=pass (domain: spinetix.com, ip: 52.101.186.102, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga70c5djLb/0F0zTCccnlBXjLlDykPcfkcs9FTQjUoHEQd8Aq1tJSgBqCVdq+XPM53/JAIYwdqSSHfPQHsQpeMPsAx5sk3gg1xkci4sCkqNUyORXdoJ0JebNkalo9h1CAVUpNV6sB2iHBuR8OcTsqyH/3Iu/P3G7AoManJj68KHpEj4P7iI7E5f1ZSrwyfFNI6jcwRgqpuO1T69mQg2xF9BXST8fW4QNMohokHyPe9/xAPos14vJrkJ+u6R2dRjEnR9tDHkUoksFJmOu1GYqpkQEcH7tAZ2iAgeLTJm64aR/9jlwovkXTNEx1SKSqtQxHsDKINbe/ieBrsLveUiTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljyl6zIppxhVMuhMqTnFsyvWL2dUg3KwzTtMUmc+Wp4=;
 b=aiKHvBx8GXk2n50CF1CdxKRhqJiwpbee25gn3GhIimpgCIR9oM4VJ6KYfXoGKKHxsuZFAusYOUd6hmPMXpsFXwgz3ABZ0hr88/FCV+YAAb1phHqMdppUIZj+5kTVibgmrKaDFs+PvnBYh0oXE3OgngfiUkKt5Ji8Us0zGIMw+pxaHiFQ/dkgqXCF6aYzPtZighxBadN8dVBODhZssCFjixZ0TFKKKiDY3Os8WWDFInSbzEgaV0lMvorU3UFTXv73cBajn+Cl/ZxRcMzXKe3h2IHKsabxsS8Xf3SH0aQAWNMZ6j7Ca38Bkyb8jYWVrE+kcpPOvsNIgCWR2bWsnSQF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljyl6zIppxhVMuhMqTnFsyvWL2dUg3KwzTtMUmc+Wp4=;
 b=upo1htfW93mGhrgYpVBVIvCabbj9jG+kTcWMWv7smaZWhYhva3Zu28RCVatMkbp5YofLmqddRs0nUKxv7foWGuwYzxXdAThTyBWvbIxDnaDgrdBk236K8OIleGXlhl38NVs0QgSfjbZWMHprRrRefbCc0/QjFXZpQWtO1KBI0Gc=
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::13)
 by ZR0P278MB0075.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 12:59:29 +0000
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30]) by GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30%2]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 12:59:29 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: gzip segfault with mandb and qemu when building rootfs
Thread-Topic: gzip segfault with mandb and qemu when building rootfs
Thread-Index: Adsi7OGZWcIvyorDRvm6I4ocOYEeXg==
Date: Sun, 20 Oct 2024 12:59:29 +0000
Message-ID: 
 <GV0P278MB0241B5BD9E5305D57A7EBBAC88422@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV0P278MB0241:EE_|ZR0P278MB0075:EE_
x-ms-office365-filtering-correlation-id: ed6c4fc8-9fbb-4a9f-d8ae-08dcf10708de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ZO9ikw60xP+iSpOTTgdjqdp9bcscD9Rn6g6quWz4Ywg5mxn3czBzVVaEQMoK?=
 =?us-ascii?Q?yzDbAI8XIJNSQpdVusLRotPpNTBFa04c0GpRGMmONGStF4r38MpcF150h68u?=
 =?us-ascii?Q?hHLm72HQferIvFItB5PRR5HCoj/Qv09WRdOsUYrr0ETUHrXphYQIKkDkUIeN?=
 =?us-ascii?Q?q/PUamJ9M5FQ2Bl9W3Aq20F0J9xZzp7Y65tk5lOnW86eTH8Nu6TME01nMBHr?=
 =?us-ascii?Q?hFBaTWd+hG5mf3lWjnCrXMBbRbCmeEuyQrrZCZEp3ZhZMVeneZfS4HukjX2S?=
 =?us-ascii?Q?4A7/j6/c/3756pdEo35nAZI0QonI3GaJqWxAL4dBeTFbG/Fn9x3eYkvUleWl?=
 =?us-ascii?Q?4Dbxe2DeQTvj/No45FfRgFJQ6+W5wgw4Al9T5bOE+3jiKEWyEBWvP+DW4kFT?=
 =?us-ascii?Q?JRraUdgHslFY0QkbwRhZ2QOlfnfCmn07E5PGlT0u4K0FWolqXG1s24wzUqsb?=
 =?us-ascii?Q?2LggAIUWW+TEyC2vXjGVZjaNgKrlkiI5+7XWkO92dbhbcysnf8bqujmSYEJz?=
 =?us-ascii?Q?45dTw+igQrjUu8l36pFIO0ydRSjK4E4ZswI49TwHHuNS/whv8KuzrDQY2ak5?=
 =?us-ascii?Q?0SRfiWJmOBWMv7yE5mevZtEnjXBL9RN6mRJSGG/RVOJnf0hsg3G07ntbti49?=
 =?us-ascii?Q?B4Ydnqtqc4PWFLSPl7w+MAoPa1tGBJ3iK5219r9ndfJk4+NIxyLG4PaNIbeJ?=
 =?us-ascii?Q?Py/lij3WS+AXpBVI64WtGtW6s5ujiRCdDRslKrA2iVLFkb5cpYJX7Yfz3+a4?=
 =?us-ascii?Q?WxeoJPS89ioOr03gGlkr0K/DHsiaSm6SO3poIk1FCjg3PgL9O9aVKSuVRNtQ?=
 =?us-ascii?Q?FXsS8n7Fyi2SaT6gF1O/fbgrDzxpErcAInGE54vUnn5mNXZ1vVQrkuv+m9KG?=
 =?us-ascii?Q?OvrHAGvLutZrFF5YJuz4+lkH6CnNAytWOaiBAYPjFn2lvl6GB2dkmUjMJR+h?=
 =?us-ascii?Q?6diSOLx2Cub3SpuWov0HinjcP12Vt5dlnLuufIWzBJoYOuBqOXiZ1BqClJzu?=
 =?us-ascii?Q?Zv7RtYKhx6oEyd5k4pc6z0bR1JZ5XcLlgDkY7L1RhOC6LFsKrsQUjwBem2j3?=
 =?us-ascii?Q?e7Wp2vhSI05vJ4Gtm5GlEgSoP0NBgZaDqhS0mDqO8LfaEd83EfnNo3pg32ko?=
 =?us-ascii?Q?RtUgr25G2LZxlOux3jic9M2xqSu+biI8fp9ud2u6NtQNAGSJHPdaGTivQ8h+?=
 =?us-ascii?Q?BEHlF0y3zBEfNp0GaXCDCnipQnzBEITMYjHrdyIexfRDXW3QjH3MO4F1Sqfq?=
 =?us-ascii?Q?jkRs48vJk5pCRc4Gp6ZaqbRDUnuqvZTTTCk2orN5VzyT9lYWD06Cb/0HKgE4?=
 =?us-ascii?Q?NZ/QKfi+Ff6Md781NXU/2o9b?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(8096899003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pDMnEDrGAavsSgpmKq63iPYqLchOigc03r/Sc06FEJac1GFtai/1d10x50KN?=
 =?us-ascii?Q?u68gAP4BASk0kQH4Cg4GJIxINIv3KHqDnFdi/bui+YX0OUWxSALttSXr6k5R?=
 =?us-ascii?Q?6yYyMSBKsvZjAI0EtEEInzQjr1Miz3nbgItupX5UYbSbouexDBkZqqf4n/K1?=
 =?us-ascii?Q?PzwAkKW1QGdv1iBdAHuijww1RbLZD+LXpnKZUzEFwixJzPHt1Xsf6iWhXBTr?=
 =?us-ascii?Q?ubRm83GIF9wjU5gCZyfAv77MewwPnhUsxvB6EtEzCSAD+wyMWWsu3IG3tliz?=
 =?us-ascii?Q?S9jkcZrAqoU7NSB52Qj7ZKapcCQQ29JudLsp51zIUJB4dfXgdMHrC6nvQMJC?=
 =?us-ascii?Q?mI+NHLO86VM17uf0HaPf53bEG0GEbdYtAInKkScpvNwEV3C10x8pymzbzvqA?=
 =?us-ascii?Q?6mlBWUaabXyD3GtO+W7fRh4fl4FvE3MNL2leSSlD20cbmX9D2DtmPSaQ8FAh?=
 =?us-ascii?Q?yD/4mILQP1PZPUKi0xmwU9JOJ1dyiduLo5CtOAr5M/r8k4k+J761g48W8mGr?=
 =?us-ascii?Q?fzmqz0qYKCkPm+CrH0sS9NapuTp92FmJuQfpVediCSP+qPSnScD+inyAArJl?=
 =?us-ascii?Q?GjMPAl4Q9z63D/ZGSWW+GHgIfZ3PUvPJEc87WikKdjoqaB5S/msS1SHDgY5L?=
 =?us-ascii?Q?0O45C5QifHk6b0QFZghrQ0hrKjGqVa7m7/9XdF0Cds8dFX8UOFdDAyt1zvYa?=
 =?us-ascii?Q?5+rG7xHj+Dnp+G8oHUTevWJh92yx3bNfwOuMwvf5opqodOiSxm3TUHuvhhZ0?=
 =?us-ascii?Q?v2sXH4h64ShvnaHX1+CPmTHZcAptiq8JNMATON/aHpfe96T/rLYgHhi+e/yC?=
 =?us-ascii?Q?kKjMKj+lZ2I2KXIse7CgRU9yAyczk7PkYjDqklXOO1G2e78uvOJW4JKNlvnb?=
 =?us-ascii?Q?BqHRPLjej3v9XcdwFE8kAfxytef/1IQ0PVulfTfQPiVywTS1izbG3ILTOnJD?=
 =?us-ascii?Q?jssfYq/tiO0bV8EgOBpQioGlfS48D3ddzno6F+at2gIXFGEAvpGQGiDGT5rD?=
 =?us-ascii?Q?oUXqVBreoPjYo/heO5FaDYLwb3a8SJVzg4ifm3vJGH4cVSVvY+0e5hPshLf2?=
 =?us-ascii?Q?VGZivCG9tpgmI21ptUxawiKvAuvgh9Oxb3KpVqD1urNP1ixdttwq6P6R+/8G?=
 =?us-ascii?Q?18Nsqem+1vlXbvkYTpfXU9Q5zTXb8zytz4NtucATiuextcsA0see1xfoWCrP?=
 =?us-ascii?Q?kFFrbamn0+NzqG357vlNUa709TqGxvs6lUEni9QVFq8INfTDJbX7nNohq9UT?=
 =?us-ascii?Q?fB+KFGh1u6F0b+FY9nYz9H9MnIaJA7914AvcetA6iFRlil/1JaN7SAAzh17z?=
 =?us-ascii?Q?nDDX3tPh1kA/W9rKxkUhmqoAmI4LbZUHu5UIQ5syvO5o6MxQLrMTzVOtUqUk?=
 =?us-ascii?Q?F8C+WZsucB0GOAbVUCMdelOSrj5yYLhJHntUoz5Fk5fBIgB05QSND+IsTZTX?=
 =?us-ascii?Q?RJzjzeMZF5PkNTx9NeuZ4anmBBKkbwvW/SiztAMot0txqqDQIWBXO7y9CAdi?=
 =?us-ascii?Q?k4xPR2bT0yJTsAfJOiGRqRL8m7yaJ0Kr/tORaDitlYuK2lH2/faPBbXwGmdV?=
 =?us-ascii?Q?wJOQM3tUMKRHeRTuaP6UVyA7QHRgxrHyQ5vUJ0rlO06dqS3kLUPkgsr7fAq5?=
 =?us-ascii?Q?3Qhj03qG0NQKaBJ8CMYUesEh2lUp3Ls+FD6HdHHG8xenLe3C9pUnFKsTrMUv?=
 =?us-ascii?Q?GiwWtw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_GV0P278MB0241B5BD9E5305D57A7EBBAC88422GV0P278MB0241CHEP_"
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6c4fc8-9fbb-4a9f-d8ae-08dcf10708de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2024 12:59:29.5413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDD9/q3eP6cOa1Bw+WTmi9LqwFEPLzEAbeLeFbgav3L0XwUrN5GTGcw8hEBZQAo6MaQtut4QD10ltMpPcqh3PJzGNQzPjfvgbe+klUw/0/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 12:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206094

--_000_GV0P278MB0241B5BD9E5305D57A7EBBAC88422GV0P278MB0241CHEP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there,

We noticed many gzip segfault errors on our build machine when doing either=
 do_rootfs or do_populate_sdk for images on which the man pages are enabled=
.

We traced this to mandb, run from the postinst script injected by manpages.=
bbclass, which invokes gzip to scan compressed manpages.

Our diagnostic is that mandb is executed via qemuwrapper with LD_LIBRARY_PA=
TH set to the rootfs lib dirs, which is expected since mandb is from the ro=
otfs. However, PATH is not set to the rootfs bin dirs, but instead to the v=
arious sysroots and wrapper paths, so it is gzip from recipe-sysroot-native=
 that is executed, using ld-linux from the rootfs. But it turns out that th=
e ld-linux and libs from rootfs are incompatible with those of recipe-sysro=
ot-native, which results in a segfault in ld-linux.

I fixed this in our builds by simply adding -E PATH=3D$D${bindir}:$D${base_=
bindir} to the qemuwrapper command line in scripts/postinst-intercepts/upda=
te_mandb. However, I do wonder if the correct fix would not be in qemu.bbcl=
ass to systematically set that option for any qemuwrapper invocation, as th=
e problem can potentially affect any tool executed via qemuwrapper that spa=
wns or execs some other executable using PATH to locate it.

We encountered this on kirkstone, but our local kirkstone branch has this c=
ommit backported: https://git.openembedded.org/openembedded-core/commit/?id=
=3Dfbd8a57aa307bfda70a08cb78af3c97f05c39a3a Hence the modification of scrip=
ts/postinst-intercepts/update_mandb and not manpages.bbclass

The problem does not occur when building images for machines which are not =
x86-64 based, since the build host and target architectures are not compati=
ble. Note also that the segfault is gone with the above mentioned fix, but =
gzip does not run successfully since /bin/gzip from the rootfs is an absolu=
te symlink to the active alternative (e.g., /bin/gzip.gzip), which does not=
 exist on the build host, but that is another problem, at least the segfaul=
t is gone.

Would fixing qemu.bbclass make sense? If yes, how extensive should that be?=
 For instance, explicitly passing the right dirs for PATH to qemu_wrapper_c=
mdline, like it is done for LD_LIBRARY_PATH? Or just implicitly setting it =
in qemu_wrapper_cmdline?

Sincerely,

Diego

--
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


--_000_GV0P278MB0241B5BD9E5305D57A7EBBAC88422GV0P278MB0241CHEP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi there,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We noticed many gzip segfault errors on our build ma=
chine when doing either do_rootfs or do_populate_sdk for images on which th=
e man pages are enabled.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We traced this to mandb, run from the postinst scrip=
t injected by manpages.bbclass, which invokes gzip to scan compressed manpa=
ges.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our diagnostic is that mandb is executed via qemuwra=
pper with LD_LIBRARY_PATH set to the rootfs lib dirs, which is expected sin=
ce mandb is from the rootfs. However, PATH is not set to the rootfs bin dir=
s, but instead to the various sysroots
 and wrapper paths, so it is gzip from recipe-sysroot-native that is execut=
ed, using ld-linux from the rootfs. But it turns out that the ld-linux and =
libs from rootfs are incompatible with those of recipe-sysroot-native, whic=
h results in a segfault in ld-linux.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I fixed this in our builds by simply adding -E PATH=
=3D$D${bindir}:$D${base_bindir} to the qemuwrapper command line in scripts/=
postinst-intercepts/update_mandb. However, I do wonder if the correct fix w=
ould not be in qemu.bbclass to systematically
 set that option for any qemuwrapper invocation, as the problem can potenti=
ally affect any tool executed via qemuwrapper that spawns or execs some oth=
er executable using PATH to locate it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We encountered this on kirkstone, but our local kirk=
stone branch has this commit backported:
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dfbd8=
a57aa307bfda70a08cb78af3c97f05c39a3a">
https://git.openembedded.org/openembedded-core/commit/?id=3Dfbd8a57aa307bfd=
a70a08cb78af3c97f05c39a3a</a> Hence the modification of scripts/postinst-in=
tercepts/update_mandb and not manpages.bbclass<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The problem does not occur when building images for =
machines which are not x86-64 based, since the build host and target archit=
ectures are not compatible. Note also that the segfault is gone with the ab=
ove mentioned fix, but gzip does not
 run successfully since /bin/gzip from the rootfs is an absolute symlink to=
 the active alternative (e.g., /bin/gzip.gzip), which does not exist on the=
 build host, but that is another problem, at least the segfault is gone.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Would fixing qemu.bbclass make sense? If yes, how ex=
tensive should that be? For instance, explicitly passing the right dirs for=
 PATH to qemu_wrapper_cmdline, like it is done for LD_LIBRARY_PATH? Or just=
 implicitly setting it in qemu_wrapper_cmdline?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sincerely,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Diego<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<div>
<div name=3D"divtagdefaultwrapper">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-=
serif">--
<br>
<b>Diego Santa Cruz, PhD<br>
</b><span style=3D"color:gray">Technology Architect<br>
spinetix.com</span></span><span style=3D"font-size:12.0pt;font-family:&quot=
;Times New Roman&quot;,serif;color:gray"><o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_GV0P278MB0241B5BD9E5305D57A7EBBAC88422GV0P278MB0241CHEP_--

