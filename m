Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9DAC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 19:03:47 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.68])
 by mx.groups.io with SMTP id smtpd.web12.1387.1654715017687122946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 12:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=MKGACvjx;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: agilent.com, ip: 40.107.244.68,
 mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4c/70myzo9o1hHRatJ89XmTMh6PwmS/njqedLN7TtOYzgI0YDbwpVMxLkDXFDJHRhbL2GvHtpJnFYX1RidMIRKDiImzUdlsInPGQbhZxuqZLI0gyMJ8m6olMpJFPN8cePGtveclycg5wOZHSwGgdLOZUG2VU3HUb7Gq9NCpBAW11IwQ0rgC3okUi6hyMttcm7v7s/IYEsomky3FTvxTpAklDBRA5RRRSzw67vt4pJpsDzzjALUfCfTAUXOwCd3Bn12DRxYslFbGlSo0V8dE2pk+QSqOYw1uNNwdPURNJk47RMpQjK1LfcOZoplNshcy4+fRG1uB/NMQ82rHTuXutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UW8Xk5IlEiZ5Ciz96vb2em2SzLBulXAVf0sPFhcRbdg=;
 b=oYjwVpDMRK8gq3cCdvmGjcftM5XchqrZGG6UKGY4VhY1msy8bXYMdtjrFNsHj+oZWEbv6NziOIJi64eLvkxSiPDdopQP4rVP6SiBooejsbfR4y4L+vSiUxEKJ0bAT2gC1QZ0qtns+T1zhuQsmvvwjXmcqa/nQXG0MAFM19BaG9RduntUSk7u8ytJ5oDlqJ+erZpoxgikxp1AgWQQ3JzxxTExS1v9y+/iyEQcqO5hieGeYgbbnMgJR8zZZi+AyqpRIWXNZcFlIwjF4dDIVMr/TEH4OZON/BODh1EwbN3vs+XMUslSIM230zTW6zT9S3HXFsTiTfJcBFQZZtsiXcNu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW8Xk5IlEiZ5Ciz96vb2em2SzLBulXAVf0sPFhcRbdg=;
 b=MKGACvjxpSpvkSY8XUPCV0PDdusOuHpuQ1/LThtsY70VC8i6EkNf20AjpyZM+SiunqCrqaMdieHi//e+3AgoG8UK3xclGrqAJhk73eWy9lTDmUUV8bFTbFecKf31aceBA0r0t/F3RXSJx9E8VC8dwLttYX/srNvFSHKDdWoqf9dTdfw2TICr/mLv708famHxdVBT28GxMV25tXlppW8D30nF8DR3xLt+2B/6jGfZWbgKZbUdWDGcyuu/IZs5row+f3Y724ap1p/OLBZaD0JyIoVh6NaUL4GsD0Alr+t5bs+cm0KXfHrNtY76tczK9ap7duCenl0nG2d1KdIYDlx3yQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DM6PR12MB3241.namprd12.prod.outlook.com (2603:10b6:5:186::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Wed, 8 Jun 2022 19:03:35 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::7db6:3628:91df:cad3]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::7db6:3628:91df:cad3%8]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 19:03:35 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] How to use devicetree.bbclass?
Thread-Topic: [OE-core] How to use devicetree.bbclass?
Thread-Index: Adh7SztOnSa/Oc7uS5K+Ag6Q3y6TcwAE5OqAAAKxYcA=
Date: Wed, 8 Jun 2022 19:03:34 +0000
Message-ID: 
 <DM8PR12MB543030ED4EBC51CE622A41578BA49@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <16F6AEAD4EA350FD.31089@lists.openembedded.org>
 <16F6B60FD253F3FE.12817@lists.openembedded.org>
In-Reply-To: <16F6B60FD253F3FE.12817@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f89e315b-e22e-4b43-cd3a-08da49819678
x-ms-traffictypediagnostic: DM6PR12MB3241:EE_
x-microsoft-antispam-prvs: 
 <DM6PR12MB3241F1A79E65B423878271578BA49@DM6PR12MB3241.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6jXdlgMFn9UxLe5tLninofFC3lf3kzzMmV4Xo4laYb74zIS4QTmjvtmcpwieVGIxcS02ah62FQEF30wEvkhMN4358QzlMNQ26e58NMLdJddLgfupcp8CaSfN+ce9twErQtJ5aAEMfA6j2xypjvcsAJzpcxlkN5mWSFbjwD3333Va5Uqq9kH7GKP6yd7l/nIufqD1C1UW8GTCmyiPSuWMhbPyzvEVCVWd+CJfge1ls5wkLYtnfhFcUSg71n/MAooBydKZikzVqrycwCoZ8gPZQ60qyfaeAZC8SRLQDW2LW3+zIBZL9eNkANWD/itl7Nm8tK8TN/PVL9s6574r4sSoBV+ns6pLASZRGK14bZMuiF9O4UcX+Ss2Qiom+ugBqQWXtdKjevMHsJIv1RaGuwlS5JHXSXYurM4RcH9kwTdqIs4ezcTJKt3mkYDUm08q35gc6pGmKjXV+QD+5AJuHTjazHLk3U3JE5B53Qx23l7bHI3igst+ofX957Yz+eqHf4yxz5QSBkPzQWH5/qPYGkiNv/SGYsWngMWW+jVg4t/J/tAOJq2Wbp2gc/IHuveSKhOQDcTzIS38qAtuHKpyhxTRUBBo+BZVjKmXBailXptVBdPEWaJxHJE293yRZ3grnwud+cqyCwiyuoIEvm4qg2IKl8NKsf48LhPiD2wfr7XEXPaNSmThTmbghXy614eJs2iauE+0ANOz7QLfLA9yxhV8sw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(29502001)(83380400001)(508600001)(966005)(71200400001)(316002)(2906002)(33656002)(86362001)(6916009)(38070700005)(9686003)(26005)(52536014)(122000001)(7696005)(6506007)(55016003)(38100700002)(186003)(30864003)(76116006)(8936002)(66476007)(66446008)(64756008)(66556008)(5660300002)(8676002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?eYGHqYU83ZK6vwnZIYNAC65n0aYjFhFPT6fk89piURhcBO0aNg2nJvE6pEs0?=
 =?us-ascii?Q?uNFFVxysPVuZBrPXWOYnDuoPS3ahOj83+ph8g5FumdiLgm1GxME4dau99jCo?=
 =?us-ascii?Q?aZB+rg7XXyY++GqLobCXKroeVX59BJdRNPJTKfKrYJMA8o3XH984oCBT4oxS?=
 =?us-ascii?Q?5nowQVjgAHv3AyPiUUO/aN55J6FD4LhWpRzVU+6zDpdtms/U00634KUrNZTo?=
 =?us-ascii?Q?UzPVQwc72kPfifNYjWF7Y+NXaabebn5fP8Fv2b4dZqkN7+8e98q2QwTQqSue?=
 =?us-ascii?Q?UMJiISHmQjDZ9NjLJo2FGxKeocGcI/1LJKr65S9ToqLDufxHFjBxTL7dYtyS?=
 =?us-ascii?Q?ObniHHI0ygZrIFHXmYNA5HYsY1u1dvfkDhrMG5KvK28CE6hM+4xck7CzcetK?=
 =?us-ascii?Q?argU53kWu+YLbZUVT7JBjqDHNIwwOUaWRe+Rb01fZ0gs/NR5Ko0lSBJMZOh1?=
 =?us-ascii?Q?RbtkLDq6JzBQ+eHiXQcGZEnAh9+n52G0Byy9FKD3LDcdbVC6c8iIEHCk/3bx?=
 =?us-ascii?Q?lRRIequNdbW7sLoVt0rJJ1b3D/myFgmjlWq4TPCaphCgqYGuGZOL8xLEJtUe?=
 =?us-ascii?Q?6EFuGl9g1PRod+aWvFfSKAt0w2wF3eBpRpnXLadM+IOHS50lgjZVw7xCZ9u0?=
 =?us-ascii?Q?6O1A+fa5KyTpVUkf2IjBpDl10h9D8fcfaew/SiMPOoisKcciK957Pknxv/si?=
 =?us-ascii?Q?/tjwkX0GX+074VoSTfRjE/lpvHMzW6Wix54NW81Qsru/8efnepnLcDpSZN48?=
 =?us-ascii?Q?lwS3Eg/vLm84bj7g0vne7brbgN2qVhpR02/+4Ev1zFQz5SuTYbGGVDd3Oub6?=
 =?us-ascii?Q?VXwxcRbw8ZkeA5pLFCV/b/OviA7tF+Iv8uxUOoI2BGEAMfcBdEvM+IfHemyx?=
 =?us-ascii?Q?QgyKjCrfCUJZfs4XrihGjjkQYq1em9QRegBKgGOStHvk0ZgRLswvG4RXwLz4?=
 =?us-ascii?Q?ZJd9IXgsQ4B8kZxbVDQ0mt7eBwbcQBXMQpu/9q0TRiAz9ItTgae98E7BsoFS?=
 =?us-ascii?Q?KP+9zoPEFw04N00y0z0S48xMM2C4Y7ZYPb/SrtMTMU8ntqAQovobUZJKH0oX?=
 =?us-ascii?Q?kZQKWx7IDHVcKxWw9Ba3kwDdRNPs2nni2LPDEq2XI3Jv6QngJVVW0nrnnV2g?=
 =?us-ascii?Q?J7AT+L7zAomUAGT76ZSScy9BXk2IuYEW8+TAM0pEWZcznY/tBgf5AdKEBDUO?=
 =?us-ascii?Q?eNmPS7hGZXCHcC8cDZLNr6bigWYnBcVs7ltNi8b/ztOn8U8NX9TMvfYr01b7?=
 =?us-ascii?Q?b5LhHLGX60O85QQk40iNf/29HsotdtdGF37zNZxwJpRGvyi0rKcjg1NIxEqS?=
 =?us-ascii?Q?fOwcxYCHOibM8XT0s2zA8cYruDHa4H9JbDmbgFCTTRZZ2kLy2nuVd14dZpn1?=
 =?us-ascii?Q?Ohnlt41bLnPe6eykf55gm7ael1CwTF4ZzhKbysBWs6kWvwz/TJEUKYypz8GO?=
 =?us-ascii?Q?Mzdmi+rWlQrNm0VZx8pqsJ86TaCQpm9pyiGaWP8u0twCL7Aglr/XhbFLt4oi?=
 =?us-ascii?Q?GEn7bqdXkTpJbj10yUSHPMESB2c/gSKrd0hp1F2gad+2mMGSa3CqS/9AFAw0?=
 =?us-ascii?Q?48DsnUYnnokD1arnc1d1qtAJ95Y4DSOiBwEob17H1wbCCn6fVcFGFeso9Iei?=
 =?us-ascii?Q?ZvnuOymux4PjXP/SoIYKVe3lk4IpQNAgGgNuBo+UFiuWHqypqi7YNITGlTq6?=
 =?us-ascii?Q?tpJNLFVDN0rFKxvo+/KPjB+tUY+ln+VBz0CKp3FXNNV+m7+N4/CPqSQeziws?=
 =?us-ascii?Q?mJqZe42e8w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB543030ED4EBC51CE622A41578BA49DM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f89e315b-e22e-4b43-cd3a-08da49819678
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 19:03:34.9829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 0PrxVS4Ney0g5EBmfWmkyoXPNfNdNDUd4v0JrjpUCS8TiHcN0s7E8VWAtMmf5bDwxc31VmMXTITE/8wEh1AlQPNkYBg3Fkcncp5cm94pr0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 19:03:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166755

--_000_DM8PR12MB543030ED4EBC51CE622A41578BA49DM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We're using honister. We have a recipe that generates a device tree using d=
evicetree.bbclass. It doesn't do anything special:

    SRC_URI =3D file://system-top.dts
    DT_INCLUDE:append =3D " ${THISDIR}/files"
    COMPATIBLE_MACHINE:zynq =3D "zynq"
    inherit devicetree


It's unclear to me how this is actually supposed to work, however. There ar=
e no examples of using the class in poky or meta-openembedded that I can fi=
nd.

What I'm leaning towards now is creating a bbappend for the kernel recipe t=
hat just installs the generated device tree into arch/arm/boot/dts. But if =
anyone has a better way I'd be glad to hear it.

I've done a little more experimenting and I think I understand now. Please =
someone correct me if I'm wrong.

If you want an in-tree (kernel source tree, that is) device tree, you set K=
ERNEL_DEVICETREE. AFAICT the device tree doesn't actually get baked into th=
e kernel. Rather, it is exported alongside the kernel to be picked up by a =
fitImage, for example.

If you want an out-of-tree device tree, you can write a recipe that inherit=
s devicetree.bbclass (if you want to use the device tree compiler), or I su=
ppose you could write a recipe that just deploys a pre-built .dtb in a simi=
lar way to how devicetree.bbclass does. Either way, you *don't* set KERNEL_=
DEVICETREE. Then the fitimage process will pick up the .dtb.

In my case, I'm creating a fitimage without an initramfs. It's just the ker=
nel and dtb. This is done by adding this to my MACHINE conf:

KERNEL_CLASSES +=3D "kernel-fitimage"
KERNEL_IMAGETYPES +=3D "fitImage"

You also need to tell the kernel-fitimage.bbclass where to get the dtb from=
, which is done somewhat indirectly by setting a preferred provider:

PREFERRED_PROVIDER_virtual/dtb =3D "my-device-tree"



Thanks,
Chris


--_000_DM8PR12MB543030ED4EBC51CE622A41578BA49DM8PR12MB5430namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>We&#8217;re using honister. We have a recipe that generates a device t=
ree using devicetree.bbclass. It doesn&#8217;t do anything special:</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp; SRC_URI =3D <a href=3D"file://system-top.dts"><font=
 color=3D"#0563C1"><u>file://system-top.dts</u></font></a></div>
<div>&nbsp;&nbsp;&nbsp; DT_INCLUDE:append =3D &quot; ${THISDIR}/files&quot;=
</div>
<div>&nbsp;&nbsp;&nbsp; COMPATIBLE_MACHINE:zynq =3D &quot;zynq&quot;</div>
<div>&nbsp;&nbsp;&nbsp; inherit devicetree</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>It&#8217;s unclear to me how this is actually supposed to work, howeve=
r. There are no examples of using the class in poky or meta-openembedded th=
at I can find.</div>
<div><br>

What I&#8217;m leaning towards now is creating a bbappend for the kernel re=
cipe that just installs the generated device tree into arch/arm/boot/dts. B=
ut if anyone has a better way I&#8217;d be glad to hear it.</div>
<div>&nbsp;</div>
<div><font face=3D"Calibri">I&#8217;ve done a little more experimenting and=
 I think I understand now. Please someone correct me if I&#8217;m wrong.</f=
ont></div>
<div><font face=3D"Calibri">&nbsp;</font></div>
<div><font face=3D"Calibri">If you want an in-tree (kernel source tree, tha=
t is) device tree, you set KERNEL_DEVICETREE. AFAICT the device tree doesn&=
#8217;t actually get baked into the kernel. Rather, it is exported alongsid=
e the kernel to be picked up by a fitImage,
for example. </font></div>
<div><font face=3D"Calibri">&nbsp;</font></div>
<div><font face=3D"Calibri">If you want an out-of-tree device tree, you can=
 write a recipe that inherits devicetree.bbclass (if you want to use the de=
vice tree compiler), or I suppose you could write a recipe that just deploy=
s a pre-built .dtb in a similar way
to how devicetree.bbclass does. Either way, you *don&#8217;t* set KERNEL_DE=
VICETREE. Then the fitimage process will pick up the .dtb.</font></div>
<div>&nbsp;</div>
<div><font face=3D"Calibri">In my case, I&#8217;m creating a fitimage witho=
ut an initramfs. It&#8217;s just the kernel and dtb. This is done by adding=
 this to my MACHINE conf:</font></div>
<div><font face=3D"Calibri">&nbsp;</font></div>
<div><font face=3D"Calibri">KERNEL_CLASSES +=3D &quot;kernel-fitimage&quot;=
</font></div>
<div><font face=3D"Calibri">KERNEL_IMAGETYPES +=3D &quot;fitImage&quot;</fo=
nt></div>
<div>&nbsp;</div>
<div><font face=3D"Calibri">You also need to tell the kernel-fitimage.bbcla=
ss where to get the dtb from, which is done somewhat indirectly by setting =
a preferred provider:</font></div>
<div><font face=3D"Calibri">&nbsp;</font></div>
<div><font face=3D"Calibri">PREFERRED_PROVIDER_virtual/dtb =3D &quot;my-dev=
ice-tree&quot;</font></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><font face=3D"Calibri">Thanks,</font></div>
<div><font face=3D"Calibri">Chris</font></div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_DM8PR12MB543030ED4EBC51CE622A41578BA49DM8PR12MB5430namp_--

