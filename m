Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DDEEE14D6
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 09:24:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9075.1694078640831177827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 02:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OVMSl5+5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7614a94eb0=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3879KFDF023431
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 02:24:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=g1KDt7FOMPeDus5w2p
	yGD9GpdvAP8RFlZX1X8+4HERw=; b=OVMSl5+5rEbDiFWPeLZE7UMljvaUN6t7pe
	zhaz/P+IEpLdzXHWHo4rG/a8JqdudbYLdkMLYtaL5BU4/Ir7L0q+nPHfTKnAwbUV
	UURoWGIb2jnhmg4WsOmqnblwBt+gyvvW9tAK2erE9ObNBW/AVr+6TTiQVV1b+36P
	F+HdkRSH8lOzSI8YK4viPc/0FhXK4iD4jl5ucNpu0zOt+DKIr4yXuWfBYyGYl8xY
	K+xc/WRdJ8zgE3Xw2LGvKmccRk9efjMsY7H0RWVFRZRKEXJ3Tz3UVHxl2JpeGPV/
	LybtrvHzGz8B8yBjG82Bt9xVsC8V4SUIK2capRVf4/JKP/dASthA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg44nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 02:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P594+YRMgaIhjsm7puCay6PXP5CTvb9u2Yap4uYe9w6RefKUVqoEkAdAfsz5l3OlHJJeCRsN979v+RvvtL2PRE31CZGZoDkFRIUdR/umpUlG+9Um9nXSmTBoV+DAwy+bB8yZi/ztFyU5EmAOUx1zyBy1aq0HeuhQdaN1pG5WOQNIjLAIM81pp0znbKyR9N0R04saoDRqWzvWoH5jwYej/Z0812jWHyNiM4OT1ydmTQ5mzmz4Tt/3swl+2tjcl0cF3uRR2fe0m7TzdktuxzPpcymKyoM5TlVFJPCu2MC0IJe4sX5Gbhy/xNbQ8m8dwT4NWu6NEbtU/4RFF615xnCsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1KDt7FOMPeDus5w2pyGD9GpdvAP8RFlZX1X8+4HERw=;
 b=l5IesZd4r56CBqXrG8y8ernHsjGR3Zz8jIVuRFOBLOb2TVuODq6iFKdwY8IVW/quEGJZ2dSu3vOveygZ1LGQvCHQl2OVhkeHrjPALgdmILnEe4gJ0CgLK5N9T6hscyMRz0gBs5nh5WC0X4GBR+Ejy2vf/TW0o0GKOnYzAaPkd2k8qkPCFRdMXzepBiYLZGkF//IBpZywxvl79VnmOHaydCZRa++TYfE5/y4kDRk0go8mF3vpr56+i6h2k/TbmGZ1Ffr/oxmo6ipcNWfvW2/4HnnC/KUHbldxX2fXt+pbgDugbaewza6b9TzNwnpHeB42OCyy+AaVM58MKNnLHo1k6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 09:23:55 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 09:23:54 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1592 ->
 9.0.1664
Thread-Topic: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1592
 -> 9.0.1664
Thread-Index: AQHZ0ajBYJyuv48Vq0e9uKvUdCfLkLAPNn91
Date: Thu, 7 Sep 2023 09:23:54 +0000
Message-ID: 
 <MW4PR11MB58227E52A9722B86C4CDB6D484EEA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <177C6ACE09C6DF4F.3047@lists.openembedded.org>
In-Reply-To: <177C6ACE09C6DF4F.3047@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|IA1PR11MB6243:EE_
x-ms-office365-filtering-correlation-id: 982a167c-a2aa-4ed3-75a9-08dbaf8427de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a+YZjZpcEXyjhoXqZonq1nUzeWuWvVa5WhfvGXw+egBVdqYYB4iEo4sdb37vfcBI6fxlunG/48jBUsQyWCSN8mOn0jNHW4U4DdP3AryGD+DWk3AU0vyl9/qIZj5r+seLr2wZvSFKbCBkeq59FDUXkXgSbjCmRXjD4ZMkyIS5ClpGrjGjqOXSTIyq8+xOvLTSYbpmjEwi1l/3pUwxjR0C2rF4+PsxQPS+Yew1SNG7cilDJC93GA49bMP1pMkV7CBZliUeuV6DKgFNh0OB+5Qr3OCWDw7qiaeSrLJe+gcMVX+hXyqoIYQp7tawxBZ2ztB13ow6n8xxULcjRZQCqT0sUw3jdvsdpInaFTzmL2IJPHTGpSRJfKMc2fnqvGpqlpG3yCkYhhXHOhXtnXttqUWOCnV4P9WfuApBhT1Bqv2PjTdz+osBJovn6s9bFpyOZcQ7kSW7994R+moWi4uOjQXSP6rmyjunxJE7f1iqFGb+Vs2cvbb1aVopOvh7kgJbBkx7/9vG8a0xKc2Af/gmgog86Mq6V9Ol/kdE/oxBEVQrQnm4d6J082y8CR8w23cln1oeAu+GcS5FMTlSOm12e/ZuJnIEBJFEhPWKE2h6h7Eisjk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39850400004)(136003)(376002)(1800799009)(451199024)(186009)(9686003)(6506007)(7696005)(71200400001)(966005)(41300700001)(83380400001)(107886003)(26005)(110136005)(2906002)(316002)(66476007)(66556008)(64756008)(66946007)(66446008)(52536014)(91956017)(76116006)(4326008)(5660300002)(8936002)(8676002)(478600001)(33656002)(38100700002)(86362001)(55016003)(166002)(38070700005)(122000001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n48/Mg8q/CZ5t17t/kZSsmsDCD/i+U8ueXh+mtu9T6ahL012u159p8+/F0PU?=
 =?us-ascii?Q?aP1+uFChKehhW7jH7Usim2BIR/v7mDd+lC84rP+GLsKQqozAG8b2cXM5GPaf?=
 =?us-ascii?Q?oRLn2AvY9hQDNDJZu9RrS/wbUhtUeMsTkzClaE6TrA1Dwxn4S2CE/7glaTyB?=
 =?us-ascii?Q?ZpuwbBhm1f+EzdD1I3unEKJ8TqYbW4pT9Jv0lSewHxATZd9BjBoFGECxO6jp?=
 =?us-ascii?Q?8VjDDB5zL9aKEv32Zas/IYjKpFGK7F7HJjCEqSO2soWS63/Ekf9mct6ImdXP?=
 =?us-ascii?Q?26XfDDKxh4C/Ng/XThqyNjEz0RjecmgG+Ba2Zj7g/141pTPlVUMQcOms/5pp?=
 =?us-ascii?Q?/0rx4V8AZDweSEIhe6acOf/cDBh6UkVfOLkAKQGENSs6uvWxY78WiDCra1Lb?=
 =?us-ascii?Q?/s/Pbl2UN8ahtk80j72suApSTXzreyHT795HNpZhmACzvlO3fk2LinfIZNdU?=
 =?us-ascii?Q?w5OIN3c4fm1kWjp8AIygwAZAPQV0lmcDHEYpyXCHcr7MTggMxmV3rMalexJp?=
 =?us-ascii?Q?kmwZVDSE8wITxR1k6vELutHP+XTjmHs+E2BPj6TYF0JRKoB+xiug1l/NiV/m?=
 =?us-ascii?Q?rVbdsBGzuAkp0qurmSqnobs5j0sQnf/Fofds/6alsNn07jgGe2xyJoSagO2N?=
 =?us-ascii?Q?tgEDi1kEpRkhswjAipzmqcSRj5MX5bNzKmxHxpUjk/YYeliBrjqgnikxuxV1?=
 =?us-ascii?Q?vtgB2fkrQbyrV+6GIDY9BADldTfPCHuPIv7Lq5T9FZ8E/EZjR6GcxwQeGX5T?=
 =?us-ascii?Q?Xk3u1d9x3oEiOoJ2gboUGGTyhtroJPcCE7lcEaHX+SxfMVZ2Op3VBw+Yzzt0?=
 =?us-ascii?Q?YxDfJ3TmdbBwqrVCgbfTOooiZrMV8E6Jqmq1VtPuo/u0exy0pt1kzyLKYUco?=
 =?us-ascii?Q?pzZvNbvfzzT771/Y1gP+rgWRZEfMaRiMoJe65agoMNO1k7CjGNV0gDHtDblE?=
 =?us-ascii?Q?v3sFEjXcHye6lm4XnBaJ4FJOHW8CzGu3V4fg42LamOCpK/f1kfj/P3BE93bf?=
 =?us-ascii?Q?7FgtgZs7x3YM10lihCe9ohnP3dlI3+T4g+ZpkjsMfF5qtPs/0sZOGTWXow3j?=
 =?us-ascii?Q?ab4PtYCKHvJjdhlqEJB2wKaFdtZ/lcamxLSQ5IBInk35rnoFLdJjBHTSQj9y?=
 =?us-ascii?Q?/pkOZ3gZpXyp53AWQluQYusw3pnG3fweYhKO+2bfR7T2ihRm7N3DiBD0i1yS?=
 =?us-ascii?Q?cgAkpnwfo0CgTpDD5aa+QO/7ZLTZ/UvoVghio4gn+X0E2mpepB9yJ48Nbmn5?=
 =?us-ascii?Q?Xdc6tCv29sIwIADjtKvYNQathiGhvSIkGeI3R4mT89MJFNavAi6GXZBb7aVt?=
 =?us-ascii?Q?XBImcR2iYPxn59l/d4SlCb9GZE+bvk2cxuATxvlVwSp0vb3dD/zobaG1+zmj?=
 =?us-ascii?Q?fZ0gANKqMSOY4ClDuLyZkrahPSaWWvFyP5gzDZM0y+ZBSwcRskuO0AGhAiH3?=
 =?us-ascii?Q?Fn8+Ej9zTKZ8n53OxlfBqRU1x3GNlkF5B5cTlxuXdhWQEM0ydIMwFnTQDzDi?=
 =?us-ascii?Q?HF8VBrl/QPPGHMzTxfQwpcj8r5RAqDu3kcihKNFqh5wk3O//+dOT5/+3az2w?=
 =?us-ascii?Q?/UV7f73OJVDTq/A+DXmKj00At1kNW/AobMAd/Ltp/TMgEOWJE2ckTsBHia4V?=
 =?us-ascii?Q?rQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58227E52A9722B86C4CDB6D484EEAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982a167c-a2aa-4ed3-75a9-08dbaf8427de
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 09:23:54.2042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sx3OgaYBLa29HdiO4eA2AtyDlwFEhLDcJc1JwDDxyh4r5SFI+wDSEUUP1f6yGO7VE+n7ARzLAS3FF41VY5uvvWQprIOxrQfM3o9bVbNTdXna1pNJo84zC3mEUpVQz4kr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
X-Proofpoint-ORIG-GUID: PTiohpUxLtrF3KN994_q8Nf28_7rNCp2
X-Proofpoint-GUID: PTiohpUxLtrF3KN994_q8Nf28_7rNCp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=707 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 09:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187368

--_000_MW4PR11MB58227E52A9722B86C4CDB6D484EEAMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder,

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: 18 August 2023 13:19
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1592 -> =
9.0.1664

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-3896
8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling wi=
th 'smoothscroll' set

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc
index 33ae0d8079..9a7b7650a7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster=
;protocol=3Dhttps \
            file://no-path-adjust.patch \
            "

-PV .=3D ".1592"
-SRCREV =3D "29b4c513b11deb37f0e0538df53d195f602fa42c"
+PV .=3D ".1664"
+SRCREV =3D "8154e642aa476e1a5d3de66c34e8289845b2b797"

 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN =3D "1"
--
2.40.0


--_000_MW4PR11MB58227E52A9722B86C4CDB6D484EEAMW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reminder,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 18 August 2023 13:19<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1=
592 -&gt; 9.0.1664</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Fixes:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-3896">https://nvd.nist=
.gov/vuln/detail/CVE-2023-3896</a><br>
8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling wi=
th 'smoothscroll' set<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;meta/recipes-support/vim/vim.inc | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index 33ae0d8079..9a7b7650a7 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -19,8 +19,8 @@ SRC_URI =3D &quot;git://github.com/vim/vim.git;branch=3Dm=
aster;protocol=3Dhttps \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://no-path-adjust.patch">file://no-path-adjust.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
-PV .=3D &quot;.1592&quot;<br>
-SRCREV =3D &quot;29b4c513b11deb37f0e0538df53d195f602fa42c&quot;<br>
+PV .=3D &quot;.1664&quot;<br>
+SRCREV =3D &quot;8154e642aa476e1a5d3de66c34e8289845b2b797&quot;<br>
&nbsp;<br>
&nbsp;# Remove when 8.3 is out<br>
&nbsp;UPSTREAM_VERSION_UNKNOWN =3D &quot;1&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58227E52A9722B86C4CDB6D484EEAMW4PR11MB5822namp_--

