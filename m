Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09673C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 04:09:35 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.106])
 by mx.groups.io with SMTP id smtpd.web10.28742.1658981368680377968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 21:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1
 header.b=Rk05Eqpj;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.5.106,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbBuxyctrCaNS2HF+QKHUmhiBqz8Yaqao1LljJE22RAOQ+4FWLa+NamZE4A0HF8eEC0afs5yXdgOcJWQol/tFEzlA3tpWXXjjMrxVh+zXx6hBOhCuyRDEK9JBY/3yQ6akVDNSsl/WVvziwc+FYyXihqacj0s5gtq/sjsM6YZJ6yKPjNjiIVkBsiY5+muo+EEadrdcpKSSyiFBFX4AgbG/vLUNJ0rIWo3/2gJ/sW01v1PlZVaJob00UFUY0zLiKkHXcyBSuCqMhycABwZorL5hHITK8DiG5a9Gr9H/kXWTSQW52/gzEz8WZFt+geZm6EVUelkTf0uAx3Ptap9P42BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0Od62B6VsDpyBXnnaf838PJzDLuWQCW77pk0Jxh4Yo=;
 b=bR5pLptjKP3BIhZqusuum7/MgqzJJEXWghVhW0c3POFbDCObF8Qg45DVNyGx+3LDjz+x1HVWasvYovY+Ic+QcZhpdEcot9j7EpSV1eLcuiwpwWh4sXxJEAzSEIP2cSqLDeJz0L3Wwr6x511YeJWYn51FQFdpgJmLcPnNf9CTYNrwWncLZUE3qshze3uUWWialBxPcvAcqNMRfneRH/sVQHhcbmgj2OBnB4sWN4h2SFHGPgwXlv39ZC6AzLXCBVhOGAVOOn1LVCyXfm92kzNTXeGtuIE29UwSRFyjnqU6JZb66b10tRShWhtr5tghqRw+eUcIkzWz7CsQ+8qjm4/zIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0Od62B6VsDpyBXnnaf838PJzDLuWQCW77pk0Jxh4Yo=;
 b=Rk05EqpjW8G2eLPVipvfbtTBgMztAI90TF0OjMuCyomRJC6yV9sXYTXfGpYeqhttgeJOiNPkTOqIq1j6Ewt6U1BL64gvIjEPQEe5E9rzNN5CrSdwWcsarc6rkhvEcUzbrv1LRKdXwGkZKe42n+zhyiTKF7akCZfkNdbf7NDsPj8=
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com (2603:10a6:6:54::31) by
 DB6PR0601MB2118.eurprd06.prod.outlook.com (2603:10a6:4:48::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.20; Thu, 28 Jul 2022 04:09:24 +0000
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b]) by DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 04:09:24 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] classes: rootfs-postcommands:
 autologin root on serial-getty
Thread-Topic: [OE-core] [meta-oe][PATCH v2] classes: rootfs-postcommands:
 autologin root on serial-getty
Thread-Index: AQHYoNORkHKiMbN5n02NMEOl2h/iza2SWgiAgADSgzM=
Date: Thu, 28 Jul 2022 04:09:23 +0000
Message-ID: 
 <DB6PR06MB40083CBE1C51803775D55256BC969@DB6PR06MB4008.eurprd06.prod.outlook.com>
References: <20220726093906.619035-1-johannes.schneider@leica-geosystems.com>
 <1D505589-2A1C-4E82-B219-80354DAAAD37@arm.com>
In-Reply-To: <1D505589-2A1C-4E82-B219-80354DAAAD37@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3fc293f-c46e-42b7-83d6-08da704ef49f
x-ms-traffictypediagnostic: DB6PR0601MB2118:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5xTjD9tc/k3RHr3TOEEs5vCHatf0lHD2Q/MxKv5/IJpG2F3zUKlnUYIy1TLvBMK5pye89vLN5sAWkP/OSvc8pDBWKJcskoQoL/i3ZVTYAqhsMExbpAsoB/T8126AOXdAvRioumAYzP4cj+TzT9auizyEdzoD+wejfRInxFN5IPSsGNHeO/JNrFMmZmUAfXzguBKs8UmkmTGF6z3YEWvoA6+KMRkah7SCil0IOjuGek204eayja+alXgGMBShC5/QHfUhCtPC2/kGd/Kb6yEufywqGV56boije4FR3esHxs9u1WN2XO5niNZDlUYT/XucuRzj6wAdNRFI96u9LQP47sjBGwVvldsbCgWEIPy4avOwgAxaVtl0jmKNU7XCoV1I3qAxdzADl8Kb6DioQBQu+Z3XNW5Zy3WofSTzM4Z1qg75L2CKd1dh3UuMmqRLymju6dlhFTxIWuSmUG3v+6h7+HHYkLXtyNZFtr/IG7plIpjIOGak+mG8jYCswo7axTqglMs5WVlkG7MSxOhVDuZH8nwF/8mq86Gv6zcj297GsG/LH5kBnFNVXZDmy+P8xhD2k4stTS4xaMWlq/dgT0uiCy6A3n7aXN7qdMpbe6p3LRKzYUShFxMG4MBATC35AHp3gRxCOjLAyD80owdOi6oJpXhDm6Yq7B2mC4zK6ZIqqWR4XMjMVjqDHWgbu8KIaNiazq3lCQHfa37jW6DO//sDUexGHf9ah1/shptco5vFnJiK21OUAwxnBYK18n4dddy+jNZPguEmJvdr5XyCjdU2YjNdVZ6C9TIXEC3D/sBB0rMInCk4ol602zWZe4b9Xk+9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR06MB4008.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(26005)(8676002)(33656002)(53546011)(9686003)(966005)(6916009)(166002)(66446008)(4326008)(186003)(66556008)(66946007)(6506007)(7696005)(91956017)(64756008)(66476007)(86362001)(19627405001)(55016003)(8936002)(83380400001)(41300700001)(2906002)(38100700002)(38070700005)(52536014)(316002)(122000001)(5660300002)(478600001)(45080400002)(76116006)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?VuTvuoH4DFYAA/p5ZEMdHK+Kj6UZc1Q7p2hEX1tQk5zzRvNBQAlXJIye?=
 =?Windows-1252?Q?Ey3cSdFMSaMsZojlr+/d5UtDAFcZ5VFqWpfVsbQZmOGHk1l684WoiD0n?=
 =?Windows-1252?Q?3i9IidqsQIlYro6N+1Ar7xksI0yv2U+cq1SXkVRPQObfhYnBBhMh43g4?=
 =?Windows-1252?Q?WryCFDe/iKc6AiwsbjG2NVV+u03eDAyRvYMiCPokS8LZDmawr/x+pJdc?=
 =?Windows-1252?Q?wR5yfdM7q6F5BD9VFtaLq8IlUZLOlwRffDUDg28nrpjdOXf7X+6TbY7X?=
 =?Windows-1252?Q?Zs7V2TpxdQb7JBOUddSF7ohM4ebmAFuYdzNam1popN/NdULM0msFXefu?=
 =?Windows-1252?Q?isZuAvWP5uK+ZuNoF8Zl157B69LM0WKH8jH0R9vtGtNaytqknWMqbwZH?=
 =?Windows-1252?Q?O5SkEVuoYevw0g/szuSRDquSpfEirTH46+KJJ4OUxIPgD8Mm/AJf2BlL?=
 =?Windows-1252?Q?biMGToacbed9ff8QUEjq56OAGJ/MPPmklQURCt1JSpZT0fGFG27Vnph1?=
 =?Windows-1252?Q?CcIMtuom5Lj5qIEYRSKA1cUMERBGOBT3zknTCl8auBVBt4qk3gc8gk9g?=
 =?Windows-1252?Q?PKW9yEm0RYBHIkclC4dWlEzS55o8uhs8BfmFgdnfOS7ev+x3UzCMEllC?=
 =?Windows-1252?Q?X7IJykgQN6tQ+vuvhdXfLT7eHxB82AIlbFNbIqHTf/vOaFng9bxLnAlo?=
 =?Windows-1252?Q?MLdQkIArmDtE+J2UDXQZw9ctDe83xYM+tOwLGwuCfrrdJFVUWhlRwRle?=
 =?Windows-1252?Q?h9a7Pz6eeqqPo05etR4kFqiAhf4/s8/fml/54ofKeY1T+L+aDgByrzR8?=
 =?Windows-1252?Q?YAzcS/TeuZJBdnvKWqDnsYYDSaFEJjIcazhwcC71diTY5NjkJRrEHIgz?=
 =?Windows-1252?Q?RTV9F/duLGWxVX86h+4aCOUoHpAPar8I88IDgBjXMQyaF92+4aGMCvXC?=
 =?Windows-1252?Q?XNfUhVVs3AsAQnFVz2HIHpoo0Mt1npe7jgnhjxTb+I4Z83CkCPYlYrb2?=
 =?Windows-1252?Q?yeza3TZRDasOFqhyQ/Q1t4XLqXknurYntcKA8TATOaSr5aSkx5qYWmLR?=
 =?Windows-1252?Q?j6tWVeq75ClMwCK2bC5G9cKotd3VYo/03EYNiB6FwyTfuDpe/6T5BCiL?=
 =?Windows-1252?Q?WOFK+10UL4vey0Wdnti2WApOYc0Y4VeGlXIO8GRvBNHUNqroj1Z498y6?=
 =?Windows-1252?Q?HBDL/S3NDIHe0FRZ9J7BHm6g3Y+ogeAqgbYls415l/sbgRJlhPdwo66T?=
 =?Windows-1252?Q?zdkg+0Ch7+mfc72QWKkmu9bpeylM+upRgG4eOmIlJAdzQt9JW0LMh7Aj?=
 =?Windows-1252?Q?PAy7k1P4bz+7WxTNnII3940F4DMUGf51Ww89CEEoB2zkuN2fvAeYdXtZ?=
 =?Windows-1252?Q?ADZSQZz30qAqAL0Qhi70nwtKDAiVpOPylTT0e6FnFX9aWCqJoOx1H2ME?=
 =?Windows-1252?Q?1u/dYMKRuzrKKG4xiYlQ1RWDvzdz6oIvfx/XV/Qr0R2AyldFJCVjupaz?=
 =?Windows-1252?Q?RRtR8E4TlGKs7A7eNQpo/NZMtuz9BdDag0L1XAitnRUxvrfubQhm/daF?=
 =?Windows-1252?Q?PuaOfADumSjtyVifggi+fyBMFl+FqGxirxYQP07W3IwbnpAEzCEQde+z?=
 =?Windows-1252?Q?j74ip3O25cAsx8pDSNkoCv+buJZFGo9sd8IalsRqmcgsJztyJY3TYF0M?=
 =?Windows-1252?Q?NAp1b5SuDYeEJe1gtAwskK3K4E6bJ3aG+iJ0EcDqcigUi4IURcU/876X?=
 =?Windows-1252?Q?mEx5VdmCkduP/svx1So=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB6PR06MB40083CBE1C51803775D55256BC969DB6PR06MB4008eurp_"
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR06MB4008.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3fc293f-c46e-42b7-83d6-08da704ef49f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 04:09:23.9888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xCg6ZNWLMcDecm5etN5j/jGmG7uUtN2po33lfE3uyv75l/RcPlJPqtkgV5uwNQ1rvVYJ6oXVFfJuEUOX+Fb61udpYTeY0rXW6qMsVDy5KxFGIUa9VKiMICf/V2vXnbVC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 04:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168592

--_000_DB6PR06MB40083CBE1C51803775D55256BC969DB6PR06MB4008eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

good question, haven't had a sysvinit system in ages... so no easy "let's t=
est it on this platform" :-s
do you happen to have one?


should the patch include a warning to sysvinit users like "not supported" "=
config switch only applies to systemd" ... suggestions? (-:

the only sysvinit+getty reference i see in the code is ./meta/recipes-core/=
sysvinit/sysvinit-inittab/start_getty
which relies on a symlinked getty - possibly provided by busybox or others?

regards
________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Wednesday, July 27, 2022 17:30
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] classes: rootfs-postcommands: au=
tologin root on serial-getty

[You don't often get email from ross.burton@arm.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification ]

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


> +serial_autologin_root () {
> +     if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.serv=
ice ]; then
> +             sed -i '/^\s*ExecStart\b/ s/getty /&--autologin root /' \
> +                     "${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-ge=
tty@.service"
> +     fi
> +}

What about images using sysvinit?

Ross

--_000_DB6PR06MB40083CBE1C51803775D55256BC969DB6PR06MB4008eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
good question, haven't had a sysvinit system in ages... so no easy &quot;le=
t's test it on this platform&quot; :-s</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
do you happen to have one?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
should the patch include a warning to sysvinit users like &quot;not support=
ed&quot; &quot;config switch only applies to systemd&quot; ... suggestions?=
 (-:<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
the only sysvinit+getty reference i see in the code is ./meta/recipes-core/=
sysvinit/sysvinit-inittab/start_getty</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
which relies on a symlinked getty - possibly provided by busybox or others?=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
regards<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Wednesday, July 27, 2022 17:30<br>
<b>To:</b> SCHNEIDER Johannes &lt;johannes.schneider@leica-geosystems.com&g=
t;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta-oe][PATCH v2] classes: rootfs-postcomma=
nds: autologin root on serial-getty</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from ross.burton@arm.co=
m. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.<br>
<br>
<br>
&gt; +serial_autologin_root () {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if [ -e ${IMAGE_ROOTFS}${systemd_system_unit=
dir}/serial-getty@.service ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; sed -i '/^\s*ExecStart\b/ s/getty /&amp;--autologin root /' \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;${IMAGE_ROOTFS}${=
systemd_system_unitdir}/serial-getty@.service&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; +}<br>
<br>
What about images using sysvinit?<br>
<br>
Ross<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB6PR06MB40083CBE1C51803775D55256BC969DB6PR06MB4008eurp_--

