Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC868C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 14:55:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10286.1786805739946893746
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 07:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=h4LktKbL;
 spf=pass (domain: est.tech, ip: 40.107.162.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNdC0jnyGapivty0s0RtuvC/jZkXLReWVapSQ42fHJ0aIYcjCyr8xNTiV0DjjkQVzkub/kpWov42bzh8IgRU8kaLCZGOhLn8+0wHI3UHs57TENOhAuJ+of4/TobbGTM2UxequHjR7lLVGLUYwE9qnOSIrtLMKxM6Ov1uQ9GkkuIyLbmlDFrG20613RVB+nvdWdAi82c/E4GpthzBY8qQXwZBS2py7CgL1G61u3J8udLJ5tC8/Bh36gVW7xmeD3jaXnWph76xGpsRS2xDi49PJYE4vGhMG4edyzQJpS5dBdChgzG6wT6M0wvVJ5WVPaO99WkrfD2p6nEHa5hjMhp8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42Sg2+ieMev7V9DJT7by7e9zNAj7VZAv59qlnVIOZlI=;
 b=FP2H9/jdknHt9uEa2FwNDB1+l9lV079Iwp8acWL5T2HaJwvCpHk+xo/01S/xr1wmFM1bSjW1qVqRrLRloYZNbEsXka48x/XpE/d6l6+UZ1t96eqQhBbhudZpKmxt6Tg1a0h5FMLVLCL49HPCmSy/zXWLvO8fktmrtz2GZrD9p4EVzwE9UqDKGqPtTCk1mAgRY5QEQWFE3PJWlaYFXA1ekzyGbBFz7YbVKQD3zo9D3p4uZIHotiLHEDv5ZrTKY7o6NFn7qcku7f32eYg3SgfJ8ycSMc+j7RH6VnvTgWyQZbDotv15qWPejKnW5SAIG/y/3k3OoRUAWvstS9gBo+m/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42Sg2+ieMev7V9DJT7by7e9zNAj7VZAv59qlnVIOZlI=;
 b=h4LktKbLUiwYTHuuuANCQop+9sMTIFfqquximsejqG/qQ3wFKjqxz0lhd15CdtZ2fcXB+XT1qjIjqec0qKviB5uA7GGn4K6dEoaBHIyyCNP5fczFwCF2Rc+s3dQ8qRBq/O+gAIsWqtpM6VChBvmRSdEai6pm48QR7cpASz93pYndCjD5FbWzITMO+yo9mx+8iFTsiYIan1lZKyU3z2QM/CLGKvJ27T/0z22cZwbr17Yroz/FBlMLOGwLqXTaxY0eUowa0NGxZN3FoLI6zsbbqwnWkfMRX9XRdpYSwNzmo1UH/6ij68LuaLUsDApmKX5xbI5DK2iJOAhqafZ0eEga3w==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0920.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:163::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.7; Sat, 15 Aug
 2026 14:55:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Sat, 15 Aug 2026
 14:55:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/5] meta: fix trailing whitespace across
 classes, conf and recipes
Thread-Topic: [OE-core] [PATCH 0/5] meta: fix trailing whitespace across
 classes, conf and recipes
Thread-Index: AQHdK1g5g954oQ0FZ0O51b8DGn8brbaeslMAgAAsoQCAAFaM6w==
Date: Sat, 15 Aug 2026 14:55:34 +0000
Message-ID: 
 <DU7PPF66507B2D71E051BB1DD167C94E860F3D92@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
	 <DKPBS41I2VXL.13RDKB81EOENQ@bootlin.com>
 <e74690c49e74e845426781e4bcaf2d78da537d69.camel@linuxfoundation.org>
In-Reply-To: 
 <e74690c49e74e845426781e4bcaf2d78da537d69.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0920:EE_
x-ms-office365-filtering-correlation-id: baf2dc38-73ad-4ab1-51e7-08defadd42ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|8096899003|13003099007|38070700021|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 OZy9ulZgygWPLYACFq6x4LAdwTCTn4QDpxK3GKkU7D/jMlqxYmH2Drs/OR0kGUtEi8Y3PIboTXo9UWUFzuMyEE/BkoQnTC1g3samLZ1fQIpir2gp2Eya7v1BeOr718rvbA6xfr3/wwlXWKxaCtHWWCkGna8Pja72VTnTQjrntf291ZIUgcBcNui2zazFCSCboNuO9R508FB62/d8H9xA6BB9lK2nylK9/yJfHk3sx1vc9Ig+ymWQcaVUCDqBBGBQyrj87qieztFpZmeVwFzUPim6t3rOLWFTFmT73Xs4U6wGdys24lqz3oKajjjD5rFK1qfOJkrlqNpw7re6XIGcb9xRlzdF9sG5fUgq38w1RFOzvHmAxZHoonvMV0M1tpP6AQKlSSlf3gMtSCU13C48CQ/4REx7C7Pd4eW/W9jRUoazw62Td4jsjiTBfHP8QJb1wndjgEq3OqVId7U0GxZO7JUJ5t+3e/PsqYfJkENnk5EilQc9Y+Tj7RSKmAQcCksIX0cRE7ixlqALTpNPcJ3xeoPPeA0nlTm09GU7SQLMHuzDlal6CMTXrGDVJYzYm40EhjUdGjF6ImL4bxzyraL93/mE9uDmKfhRA04zgmt1K4ZN4ZMDFcffO/1D3X7HRat5JJbk91xT2k+Ym4LutSqkAnVAZk1nCTp5MBefKJ2x6I0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(8096899003)(13003099007)(38070700021)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?g48rxvch5DaBaAZZ8bRwzxoJPMQ4CTbI09v53TuNByLYwdpBrcfCLE5Nn+t3?=
 =?us-ascii?Q?djS4fvln7ErpFak7dbfbhCEFwFf2yIfTKugMeSGgeYU3A01XGbeuj/5dRJ/i?=
 =?us-ascii?Q?bNUeWwD1PKyNwVWuV0gEANXuyHQkg+/d8+Cg4pC/Cou+LZAGQseZRXiP5ofu?=
 =?us-ascii?Q?eP0Mnxyira2zcn7riSvyvK95OCBIIuh7tEOeek+PBFmsV3XRFADoKjlKVqyU?=
 =?us-ascii?Q?r5fAlDKktgT17DM7jUun8GtQG8OeRlPBw1F+UU5zYVkSia/4OgfcZMuEXaki?=
 =?us-ascii?Q?iprtDYR8F4AHdfI95L9LueX/kp064S3Ft1h+1Ay9HzUc8GRPzaEijS0RAjKm?=
 =?us-ascii?Q?ycGzQs06kJqp5R4yEtiFhMKt7Rg/+X9HV+LhPIc6pHQOwF7QREM3d7dF1cru?=
 =?us-ascii?Q?J309acdDJtgeoCeoYyZ/pJ0GSj0ord1mcckfp66/LqrnCnwYiNW1r6q7AGGq?=
 =?us-ascii?Q?VMb0S4xRVh5N3EQu8uV8HhyQnAFffLV3AZGVgB+6NWcY/kYCxCV80OJ9fIoz?=
 =?us-ascii?Q?haRPEcAXm2p9sSKShmiKDv1h4T7m/A+XcFJyW8ggbwsCQ0TPdOW6LZDcDx6j?=
 =?us-ascii?Q?OuY9DG5xQNgQTaLVucIJB6jiNW4jBTCgILE6SemU+Tdtu5nCqiiMFEE+slG/?=
 =?us-ascii?Q?FYGUa0+Z23WaZy2YDLxRusvxkIaW1ugNRJvj2vebMHUH4PPx6Nj7KqG7M8+c?=
 =?us-ascii?Q?WUxPNIlINgeLQxAf5qmvjuonE4nW4etvMkpykWyvmYSSP4v/0GBQo8V4dd9Y?=
 =?us-ascii?Q?++Slxkk5/SUGZvbzUs+qNi9/FXJlUC53CsqJYa0hIiI31oruW/1u0Z5dS/82?=
 =?us-ascii?Q?N//+pX/w6HOo25V9fcYbgRIeBq7oKkLUxpcA1bIjnua/Gd6pwSp9QlgoSmPW?=
 =?us-ascii?Q?F/xsqNL1LeV6x/W8aSW3g+TddsnrQBpuh9g7zNQusYoukb+s0EvE86PKJXsI?=
 =?us-ascii?Q?9bKX3b9yiMy9Lb7rLFON2+BostyO4/nn0TTQ7Rdw36oWV2qz+Rc++GKYtAwI?=
 =?us-ascii?Q?HYpM9th7Ob4l3vuXQxkM8vnHr2bO2AfFx/Tso/wHruqHjz7lW9yl3d2+kmVW?=
 =?us-ascii?Q?tf+iKx9yiNWOoSV9soS/spmRcwNYusiq3ckbCbJAtxVGeXUWYeLECjdMCZpo?=
 =?us-ascii?Q?4zkDPpCHENTCXPspQfqC+8iM63GRN5yiN5UzFGV40ZSoazUWS6VALKaqm99w?=
 =?us-ascii?Q?YDcFm8sSsAYX3GavUnFJqPyz2npvp2q/qwu85M3hiuoRJ/xcLnlstvQG/707?=
 =?us-ascii?Q?FCQsxn0sfMvQhMsLjYw94kZ6QsIWGWC4e3yaiEp+YtJ9iL04PQDNvWTg6bzm?=
 =?us-ascii?Q?nkNG7cClaQVMVWRfPNAIiCAIROecBwEWpIfOP6DIrsJs16AyPa+4LMU7sITL?=
 =?us-ascii?Q?seRQMJwSOZgGyqhP9LenMa1eMR1sY2ysebxZ9K4en3zXAybtX7eyRVTelO4x?=
 =?us-ascii?Q?/qu16PqafTWd+mnLhs3iUEMR782iKNSb5yxGyWWNhluDJL2eKaRis/kc3DO7?=
 =?us-ascii?Q?MJwOsw8xAE1t3bMV5syRmy/yjMUvmkKPmwLhZ2vmCWK4Q/ooWdt7nFDHSwkj?=
 =?us-ascii?Q?fLgg1GvQLyDzGUglFiCmOEIh+Iex0v6tRYuUxi5RcU+48d6wETCxWk2sc0fQ?=
 =?us-ascii?Q?ba974J/GNKXIniPhHh5Gyu8LX1sYEUS1tgS0d1idrSdKNhnrGl7WQ/S4OyjH?=
 =?us-ascii?Q?GF9rDxzU11vIrLOI6EbLymdX1Yz9thT42Pj+85loEL6+hd+9Yq7XPAWSUu3D?=
 =?us-ascii?Q?daQKEt4kWA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D71E051BB1DD167C94E860F3D92DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: baf2dc38-73ad-4ab1-51e7-08defadd42ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2026 14:55:34.8012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qKzlQyDJ8E3/pmv0xiA+lPjTjt/exvMvm0ZG48Q6Fyfrj4+XPa3Ya0UFr+fFseTUxeHI9YYYZN/wUoxwELV6Ye1nJq1P4spXBON2bJ6bOI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 14:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243494

--_000_DU7PPF66507B2D71E051BB1DD167C94E860F3D92DU7PPF66507B2D7_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Richard ..


Regards,
Jaipaul
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Saturday, August 15, 2026 11:45 AM
To: mathieu.dubois-briand@bootlin.com <mathieu.dubois-briand@bootlin.com>; =
Jaipaul Cheernam <jaipaul.cheernam@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/5] meta: fix trailing whitespace across cla=
sses, conf and recipes

On Sat, 2026-08-15 at 09:05 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Thu Aug 13, 2026 at 9:16 PM CEST, Jaipaul Cheernam wrote:
> > Fix all trailing whitespace warnings reported by bitbake during parsing=
.
> > These were flagged on the Yocto autobuilder:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4405
> >
> > 53 files fixed across 5 patches, split by category:
> > - classes-global (7 files)
> > - classes-recipe (11 files)
> > - classes (2 files)
> > - conf (2 files)
> > - recipes (31 files)
>
> It looks like you missed some of these:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4480/s=
teps/22/logs/warnings
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4402/st=
eps/14/logs/warnings

I merged the whitespace tweaks and went ahead and fixed the above too.

Cheers,

Richard

--_000_DU7PPF66507B2D71E051BB1DD167C94E860F3D92DU7PPF66507B2D7_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Thanks Richard ..&nbsp;</div>
<div><br>
</div>
<div><br>
</div>
<div id=3D"editor-signature">
<div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Regards,</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Jaipaul</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Saturday, August 15, 2026 11:45 AM<br>
<b>To:</b> mathieu.dubois-briand@bootlin.com &lt;mathieu.dubois-briand@boot=
lin.com&gt;; Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;; openembedd=
ed-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org=
&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH 0/5] meta: fix trailing whitespace acr=
oss classes, conf and recipes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sat, 2026-08-15 at 09:05 +0200, Mathieu Dubois-=
Briand via lists.openembedded.org wrote:<br>
&gt; On Thu Aug 13, 2026 at 9:16 PM CEST, Jaipaul Cheernam wrote:<br>
&gt; &gt; Fix all trailing whitespace warnings reported by bitbake during p=
arsing.<br>
&gt; &gt; These were flagged on the Yocto autobuilder:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/4/builds/4405">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4405</a><=
br>
&gt; &gt; <br>
&gt; &gt; 53 files fixed across 5 patches, split by category:<br>
&gt; &gt; - classes-global (7 files)<br>
&gt; &gt; - classes-recipe (11 files)<br>
&gt; &gt; - classes (2 files)<br>
&gt; &gt; - conf (2 files)<br>
&gt; &gt; - recipes (31 files)<br>
&gt; <br>
&gt; It looks like you missed some of these:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29=
/builds/4480/steps/22/logs/warnings">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4480/ste=
ps/22/logs/warnings</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/=
builds/4402/steps/14/logs/warnings">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/4402/step=
s/14/logs/warnings</a><br>
<br>
I merged the whitespace tweaks and went ahead and fixed the above too.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_DU7PPF66507B2D71E051BB1DD167C94E860F3D92DU7PPF66507B2D7_--

