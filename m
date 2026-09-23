Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A265DC98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:54:15 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.285.1790175248156166304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=u2R44LFg;
 spf=pass (domain: siemens.com, ip: 40.107.130.32, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gfn1Ad+MnKJR/jKapOlFNF4UJeqCerHFBtBkLeAN76amMcR5u/yez4TgFjaPZg5aZaboANGvZXbJAPY6qKYx4+ZLwI1NNOnAaj0C81/eYf4qsjJQpxicw4+DWlE0HKebAiGbxDN0518aH2WzKZnmD37AHIkErWk3MkU/sDbqD15A+lj1Ug/2dRI8Wbt7JsLWqtIjOwoHtvcezjNLMw7btVTtxqhAZoOQHMyiQia8kt8hiuXUicmIcKKtrnciFCdeLfUnu4rLTcAFpagNUCqOgtrAECTTGyItpiOy4uXeHkwmPAsc+J7XcVa+FPV49oCQbR3VgeP7cQxg/uTrjiqloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESURE92VTk8OuCf+11x0PqTd+DYN3n4Qvk9KLlPsWQg=;
 b=xH/78u6nnARgKfkJMdiae/LDUQgE2PHZz6UyRTK+mv15epicjpExxzToBWQaE6C6Z2Lo6QboLzgi1EpJXMtngLNqq9lsB7AVtq61g/L8j3ymB7q+7oIqlVRLu76gnGgWoz9yagGVN8tcq0rf+MVLn65E/B1D6ZRKB4QK/9GGVsqu6zFYDhIrE8kpNAar9ZCcsyDCk9l3ERW+Vdu5+4cZYPqH+X5az74KitG+SpLmFBET3I+GyCF2qckpitb54//l+t/YLLsd6m9vHY0k9bdJK7PdcPIIlNipR6N81h2tEPC/p+TP4ZMUfitAslb8JzLniRFr+7ndog9H+Ckh4HPHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESURE92VTk8OuCf+11x0PqTd+DYN3n4Qvk9KLlPsWQg=;
 b=u2R44LFgpuiMgfSk7DQI/IKsRhg9ngelsgS1FRYXm0e0tDUy8L7YRlPtoYJsLVXi8i9bo+3zSS3b68bDbUjdTu3SrYOrFETqwdFrx/Mh69OgKJrznhJ9JtLp62xBIUPXIhwtFQcvNwR8Za1wzpHg1lSBwg7sfEfMs8BQ/Ioa03TLxCG+PBXo93qMEWV0p146m8FJ3402Za7AY5n0h3wQq2VVHspAsxF+6NMHuKHEhi4+JHgZs74xJ1z780d5gLu0Vhm6fEOYr8w0TAosojbxZ9ddHToL7QIiJJi1tIQYzyKyQNY10fM52iwkfNTs15EOXzZIYASaSvamHlqs1BOT7A==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AS2PR10MB7885.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:54:01 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:54:01 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Topic: native libstdc++ and uninative
Thread-Topic: Topic: native libstdc++ and uninative
Thread-Index: Ad1LakgeZcGn4IMERMacG3ZXIP6Elw==
Date: Wed, 23 Sep 2026 14:54:01 +0000
Message-ID: 
 <AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8c855cb8-d99d-42e5-b771-b5d1a1c1d5f1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-23T14:37:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AS2PR10MB7885:EE_
x-ms-office365-filtering-correlation-id: 13bf02dc-ad43-4443-eb9c-08df19828137
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|6133799003|10067099003|18002099003|55112099003|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 Bt1ykMdf2FolbM2H62vgyRzokknOqjgrWWyg64VYTZOcbcaWPCaGhXglix+twwjTXuJC0ZDWLODCNGiGOsSeOFdqt4EjqV9TMC4fWy2b4IAGP2er1FmbygCQHtPx64KZAmWyhbbtHIJKvsGIiUWlwTOkjaaxuaql4xTd6haZmDo/meKIp8KnG/X1aw3H8LGboeG6WZkTY5cHjKdbPZIi7a4+ueCjFiJ+wWFHgw1o9WE6fot6ck8mEweft2S9dXVecRgKy2jmMYziFFr8lcM0nXpD00XypwL3PlmkuPj9EAILWlpFqeMGH5zGyuX0emky8yrA+18mBjI9lVvYq2+kK6h6HQAD6a8ODBxOpOLy5BmcP4TJ7dOC58CzV5HVvU1O1kR217lY+1GPo/6hm8UxyCwYq2qDbCNnHK+Z+dNVnpD5ugjTz+e9DmnyoIoECFauYocowe++5/xMXFboR+uRIjN1TBz0Hi8pJCCc09X9oVnGeT2kdfVu5TFjZ/8pXK9w7H8uEAbQ56kJKvEfzc0k4mh4QPs89fI5TL569dBAY66A03XECdtXwbArUuYeeMVFvZs1+2mH/KsA+04tLvJlQU9E5LH0Kmhu6LUYF/20a3Jmr1QmqzJJew8ZbMso0kM+zDDhKP1SoqvhKTqLWMogkoi212PcCcmfYCiEC/itFw1Uc3nGOZtil5ineNjaTt9VQDEWUpSQ6vsWC/MNUtvCCj2SrgqkAvdG3BC0DcQ9bBQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003)(55112099003)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?34l60OHGK73+jpRwP9fxpygQoSglxy4DsHKoz+UwiALDpZ69ZTCrvQkdwDbK?=
 =?us-ascii?Q?gtvhK+C3fR5672vys3qGvRKBIwjVMXSWCJ8JpzE/UND9pcwDvblQPPKQLYrD?=
 =?us-ascii?Q?lf7Iu9+V/0CemCdku8mwweB1n4eyoQznR4Hefgdwdq4SOU/1TEBqefFxriPf?=
 =?us-ascii?Q?K7+XC0nj80Y/t5cU13dr5UBmk6LyAWcsvClH47aNIKLyEsiJZ+zVqrV3f1aF?=
 =?us-ascii?Q?HoJJDlMBSmViuXzBKnQ1dxrK1NEj4hx4VcuVnfSHWbWHOuKXJKN9YG4cFi+J?=
 =?us-ascii?Q?LMWfUSR57btdAG20XOdEEz9Sg0FRv4OzrU1jcAKQXQhnHWiM8yYDP8YSsDi8?=
 =?us-ascii?Q?k1wI99sNJzKWn/0VABfI+UwUOS5D7bLg5ijCyAbM0rdKne0KTaEpRE9uONLV?=
 =?us-ascii?Q?I+iFjdanYKLJgvYt5wRSDqqKIFXs/dGncYmiyPuTqvxG6ftJpPQQzF+HkV8h?=
 =?us-ascii?Q?O+C6+q+a4rboHqoFx/quLRvUerizIu7xkwxq1IkZm63DPFbFtEgjIJ9b1Cb0?=
 =?us-ascii?Q?M5eeHDbEt3qpfZx0NzKoxvXM8Ezz2HfIyGqP3aFs6vProoIa1tgW+Ns89sDv?=
 =?us-ascii?Q?BjTjSNH9OYMLX7xj7Ygxm9Y0Iie2oSzWOjX1rrYqtxzr76t4aunaxWGQ5TjW?=
 =?us-ascii?Q?PPNYRRGEeUBHrn+1eRTTM1BCtMeoFzhpHUfuepTCWA69aOllQu6IcmKOvowP?=
 =?us-ascii?Q?rvWzdvhwW3XvqWTcmKaXIe7QLvjh3XwMhU+Wow6+7tHrf7HpXA2P9HeRRK9U?=
 =?us-ascii?Q?f/VkkOLiRSoSxew6/kdZtgqGiRWZkgJ7h4MNa0jqVaC7GBuf1jo4e2DwgjnF?=
 =?us-ascii?Q?PMk10WA4KpBHYGx56/mEfrBmanxYY0/LDfmk2f6B9Lp09ZvcfA8Ff4wLr12S?=
 =?us-ascii?Q?D3nj+qBYdjSnijMWlGcTD7vbQkMOIJ+gzKS8h9eDq2IdaS+Lmd4HdFTT2Y2F?=
 =?us-ascii?Q?0ih/Ujo8pfwoXz2e8ePlJmcZa7woh2wjJHR4Om3vHDwtFlMa/KRtWJ35TTiT?=
 =?us-ascii?Q?mvsC3fMh0NJzquVowq8/GY31e26Wcbsyqt+IMh60OIk8izcipMNnW4dLr8Q3?=
 =?us-ascii?Q?w+gOZnVwuXCgpWUZTtw5pJsGb0UCdaryaYkwjUMOqxeONgROFO4lzun9wGi8?=
 =?us-ascii?Q?IduCLWaB5rX3WzCT3GLeBfoiHAycFYophtaSasDjWr40myErRpPQJo7U1a7Z?=
 =?us-ascii?Q?UsIpOFrHBRLs4eGNoABNUspYXPVhQhnknzItxm1HndkNQRr6YQUjritcGWb+?=
 =?us-ascii?Q?hZ3mXyRUvMs8ZWRr/YPDkaGenSguMmaPWMgUna700uxwimZzUHrdzVXeTPXS?=
 =?us-ascii?Q?gjZIE6URhzIbBDUWtMnXm/AHYaWVc2KR1uxsaMwRn0yKKhamsKltSvui5B34?=
 =?us-ascii?Q?Z239mY91BQCSDWboXMfP9R7nbKd6BvkzgAHHrkv/wzW9vTzCi5ASYmv9m4Mo?=
 =?us-ascii?Q?lt0o+7zfJMPp/sDGwn7mHhZxold8urZWR47vsjol/7gAKFb/LptfHfnig+pm?=
 =?us-ascii?Q?s3CsGwzjIYXp52voMXAzKKB6ywlSENT47bWMsp2Nir3uDSaXunLkXVihFLPg?=
 =?us-ascii?Q?du8omrerelAwnul7A367PkHYXo3ucuIRDm7nvBm4qMdf/28nC29/yqCF0ufc?=
 =?us-ascii?Q?75bewSNtczUp3YrdVPyRUJgvx/167VzTfRNAAAe7jnH4O04osyajsKJEjrf/?=
 =?us-ascii?Q?F4vx/GQI/brStoJqn6tX1gnLss5Y0LcXta8YaieisTqQxwTLaoqII0EcoWMi?=
 =?us-ascii?Q?0dwVsDZs8A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR10MB5073C8A330EA6849DA8DE457FD822AS8PR10MB5073EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bf02dc-ad43-4443-eb9c-08df19828137
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 14:54:01.3763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s5EelyLp4zFqTsFBmaTuTJBCs0pRGUCcSyJMx26y1J0EcnIPR97vyU1bbuj/K0VBBEFDC7KtDIwTOX0lroZDtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7885
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246529

--_000_AS8PR10MB5073C8A330EA6849DA8DE457FD822AS8PR10MB5073EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Yocto toolchain experts,

we have come across a problem with C++ native libraries and sstate-cache re=
use on different host distros under uninative.

Our scenario:
For generation of sstate-cache, we're using only x86-64 Debian machines, ea=
ch Yocto branch on a fixed version.
For example for wrynose we use Debian 13.
However, the clients can have a different host distro (different Debian rel=
ease or even Ubuntu or Fedora).
I think this is how Yocto uninative sstate-cache is intended to be used.

The problem is following:
GCC version is different between different Host distros, especially libstdc=
++ from newer GCC has more symbols than from older GCC.
So when re-using a native c++ library generated on Debian-13, Debian-12 lik=
er can report failures.
Concrete case we experienced is linking against googletest-native and missi=
ng symbol __cxa_call_terminate (introduced in GCC 14) on Debian 12 (GCC 12.=
2.0).

We don't want to go away from uninative as that would force us to produce s=
eparate sstate-cache for each host distro and explode storage size and buil=
d times.

Has anyone else come across this problem?
What would be the recommended way to solve this?

Could libstdc++ be included in uninative?
Would that work with all the different GCC versions in all supported host d=
istros?

Or some magical compiler option we could use to disable usage of some newer=
 symbols?

I know that we could use buildtools tarball, however that's against the ide=
a of running Yocto natively.
It's also a step very easy to be forgotten during build setup unless there =
is some magical qa check for that.
And for application developers it's yet another Yocto obstacle and argument=
 against developing with Yocto.

Best Regards,
  Peter


--_000_AS8PR10MB5073C8A330EA6849DA8DE457FD822AS8PR10MB5073EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Dear Yocto toolchain experts,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">we have come across a problem with C++ native librari=
es and sstate-cache reuse on different host distros under uninative.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Our scenario:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">For generation of sstate-cache, we're using only x86-=
64 Debian machines, each Yocto branch on a fixed version.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">For example for wrynose we use Debian 13.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">However, the clients can have a different host distro=
 (different Debian release or even Ubuntu or Fedora).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">I think this is how Yocto uninative sstate-cache is i=
ntended to be used.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">The problem is following:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">GCC version is different between different Host distr=
os, especially libstdc++ from newer GCC has more symbols than from older GC=
C.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">So when re-using a native c++ library generated on De=
bian-13, Debian-12 liker can report failures.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Concrete case we experienced is linking against googl=
etest-native and missing symbol __cxa_call_terminate (introduced in GCC 14)=
 on Debian 12 (GCC 12.2.0).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">We don't want to go away from uninative as that would=
 force us to produce separate sstate-cache for each host distro and explode=
 storage size and build times.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Has anyone else come across this problem?<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">What would be the recommended way to solve this?<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Could libstdc++ be included in uninative?<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Would that work with all the different GCC versions i=
n all supported host distros?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Or some magical compiler option we could use to disab=
le usage of some newer symbols?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">I know that we could use buildtools tarball, however =
that's against the idea of running Yocto natively.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">It's also a step very easy to be forgotten during bui=
ld setup unless there is some magical qa check for that.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">And for application developers it's yet another Yocto=
 obstacle and argument against developing with Yocto.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Best Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&nbsp; Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_AS8PR10MB5073C8A330EA6849DA8DE457FD822AS8PR10MB5073EURP_--

