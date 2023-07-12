Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2AAEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:27:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web10.4922.1689161212854395109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.20.65, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uby9JtRWsjbf2ZfUZohyl5i+9X0d5aB4tRTsmWrPc/BvXDBs4/leQiMzK9WnSjenYw7JUcuxPtvHYwJYWhSCfq3cFkAlmus8D72/qQXTzPovGr29vEcSWMF07Dof8Oet4YpHVKNyeP034e+w3yai3SzSdrIMiqm9Xa97uogLJmdy1xyu7RjIsjjR5NChzSmSSa3uH7BJRNWHeccjFZxc3G8Xf1VxM0qJxN2K7LW1Ui4s2dWTsqjKtJ8lstPRSgGKDylYlrY8/VSUnyqeaG1GyM2fMdDAy0tmqdSqOjTTYEBSypsmq8hY9RTfSmPp6J5hVu5G3AeYjxxqCT3Tq0kRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1YVlwuyy5+M+S3yBQRNv+wruuBXm4bQO/7zhoB7NUc=;
 b=KOEL5XdxdR5O75pOOiExB7VbkO+6ziFbjsfJotiMMCdzujJRUMGGAk5mVQLy4m7zwVWOEScUnC2d7x+CfWpXI+v2I6uPYM5hSeq/d6XOZk/hQcJ0cZfN3AZm/xnVVwhISxBttyhDI1OPvlVMzJrAsOT1FHUBeGq3RLUV3ypwKT5RlxjvQ7KBUlNBaT+5yVeN3Qjubb1PbRshW3DvW0U/h4/nxIsiYpUWCC2UjX6voMvumpyUacAue/MQ9lc3+OWrNaoBLQCfQkONP0/gsSg723yYk3J4iyphDxp/avdjf7VWyWJWKARbo07POQE7pNuD8GaPdZCKBs/ruHbBZPN8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1YVlwuyy5+M+S3yBQRNv+wruuBXm4bQO/7zhoB7NUc=;
 b=sFydqQ3R8RHjWu5GgBUF8yfYal2mcKr2bTUrgAxYW/OQ81aYJKwghRtEudkUckl8z9Twwy6Ew+stCCMjrXVNjoDcJqKXoZpSzla+Ps2pG58AMyTkS/OLngPYon8zrBm33yfOWYDqn0Ka0joLa6zCG1JRiTEd3FjMzqTnr8UDOZQ=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 12 Jul
 2023 11:26:49 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:26:49 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH 3/3] package.bbclass: add support for ACLs and
 xattr
Thread-Topic: [OE-Core][PATCH 3/3] package.bbclass: add support for ACLs and
 xattr
Thread-Index: AQHZsxUzvLjGkkOezUObWDkpaBioe6+y4gsAgAMep+k=
Date: Wed, 12 Jul 2023 11:26:49 +0000
Message-ID: 
 <VI1PR04MB5373AA5BC86A0E2FF3D965DE9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <20230710095800.2033309-3-p.lobacz@welotec.com>
 <2442D390-FAE0-45EE-8095-F5F5367121B4@arm.com>
In-Reply-To: <2442D390-FAE0-45EE-8095-F5F5367121B4@arm.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM9PR04MB8827:EE_
x-ms-office365-filtering-correlation-id: 7ec7c9be-9dfd-44b2-1623-08db82cae24e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yH5uP6rIeZUBYqeXlRLPHEf9Dsy+nZAzAG/a4LV8+m+NFrASo2SyNwLZu0xZBxoAfMCGDHoC62vpTnPLH71jvVlOPpw8v2+H/BqC2EGoFh6UeF4lNUniaGMyY6MIzBRrSu0/FyGxeVwTXM2NaCXjSkUET515jk7BJAzO+YEj/W5W9jOCtgzEj1RJT99ufcf0/L56KNKfoecoqw8DladFgNgFwfh7HqXbu9PE7kBWDbBqapPqytozUZEkRCQ8YK9l7puX8VGZ6d50IiW5jBvvhpDULh7jkWN13U/qksGZdbgHjzHq51KwlB1kbBbkbpVn2YbrCaUukxKVEZAzusj+3ZkVNOncjav5MTNeUcFW48aUMIhXGe1GVkgrRz5jB/KLqAVFtcyAocdQ1z90hx5lURBiFmFEt5Gx2jooFksUYBydycmmefd3ZN95U4BFvjzE0oe3Xy72uXou6AwECkB0dfz+17a+XoWT6YLsPreEGXuNZwEMbGOwwsQGJB8q1u+6zox0LftrUgfldIOCKgiRGXBiTxMFwAalh/NQehgjf2zukgaVHIkALUdl02pbkGZztffaF9VtD/R38VEuDsqerl2PSKlLpyEVl88JldAjjIYQsSAp5ycOZpzt3dKfLgvw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39840400004)(136003)(396003)(366004)(451199021)(19627405001)(5660300002)(8676002)(8936002)(52536014)(2906002)(316002)(41300700001)(38100700002)(122000001)(55016003)(6916009)(64756008)(76116006)(66946007)(91956017)(66446008)(66556008)(66476007)(86362001)(53546011)(26005)(4326008)(186003)(33656002)(478600001)(6506007)(9686003)(71200400001)(38070700005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?tU7Re5g2CZEWJt837q8mwn2GvJQGkqHwmk+c+f0sh3phy4QJ3tCkatvZ?=
 =?windows-1250?Q?8Sx2lYcm4t2al/D6RaVaSxtaKmaljPE32hduvSjhYQ3BC/eCWOo8idtZ?=
 =?windows-1250?Q?5tsnN6whIx1eHbEQ7X1fpKo9aQGkaMEpKcs86UXSYt4unNvYW9mDcWGc?=
 =?windows-1250?Q?D4kXeI8yTCam/oPLwSckOC5GfvUijH26zf7Zb8q1qyWBIbOxZjCN3hBn?=
 =?windows-1250?Q?dSabfhBdkb/YyORs9sfaKlnsZ3XufW66r2P8lFWWAzvTJw33oZfE3gmG?=
 =?windows-1250?Q?rLNuBlfU1vNYmQkBZabbXJSBZHC8VN5YkiNG3AZQflIc760Sc4SmBwrw?=
 =?windows-1250?Q?I5bKDFC9gE12Lfh6ygZCMVyC1BbAl/Y4hdHZ9aoh7ddcZPMRvR0jw1bq?=
 =?windows-1250?Q?VYZn5C3oJAss3yxSA2g1B+G2BJMVfVVoEd8ZQ/yOYrEiXF8U52EG/2gE?=
 =?windows-1250?Q?iCbZUhV4W096vtBp5B6cKvZR+zDRM0kmPA2RkuoaXfo/0F6WudZxWu/h?=
 =?windows-1250?Q?RAaK/IPYL7WweZwbJaq/HYDxstB0KcbIjdF/qepF3Dew3FqMMC6KDSj8?=
 =?windows-1250?Q?wfRzgm9n1tAh0pyiC9mznDZ+Et3QoYekrzV7tdUGGhFw8T0+Dr8Xunfe?=
 =?windows-1250?Q?zTHFVrtblAsNm/T/Ym5nzKYx4A7xTYE86DnKi8tMFGpqYol0nMH39E6R?=
 =?windows-1250?Q?l7gjh5O6idUvFQqTJ/yvbZTYOS0741ZnBqztzYMNpyxKaBDMJ1B1ZGQG?=
 =?windows-1250?Q?PbqrElqNf4nIvadvyAVjAKN9GTYhh1hu5UelPzfnlxC7yYYufpeVhots?=
 =?windows-1250?Q?7yslaRj5SbrKRN5EUOiNhSLBzJhrUZc/R+ZOJN66uY/SRGp75/3+lnbm?=
 =?windows-1250?Q?MmpRsiEw7n5TWzN/N1y8fPQijlYaKndHHTLHrDeaNcIHYmqlIeXBXbQf?=
 =?windows-1250?Q?RtummQ75Rl+4VjZ3lhE5gxPqzr4ehfrc2ZQlLbtAvkcrd2f+IqcOUtzs?=
 =?windows-1250?Q?Q8CMu3v+993kULsSfpetkbbqKTsDOjckZejc8EjqY3JBGHXBl2w+pWPJ?=
 =?windows-1250?Q?fwQ6Sqdl76yBafuH6P9HUOuoNdFjB0OPG66WQyuhDN3ZTAER2eBaX9DA?=
 =?windows-1250?Q?RYP87H73Nde9nXJEkfzB4Er03fPuBUPwoanwNWQJtySGSkjfVNAQxbTE?=
 =?windows-1250?Q?p2wrfCLNewyAZKIayGdzGJwa+98Xbn1KiaggOP34z8CnZ45doIhWmH7d?=
 =?windows-1250?Q?zGDKBl1Y7MLPF1P8qpGYRdNkPzv0nIsP92CkaokhdP2gFL1PgKiAT9XK?=
 =?windows-1250?Q?5jBJ0i+OQZ083Y7xjxVDsT6fHrp/0TvMyQwxwq5aIyDSJ5Xd4kQg80cp?=
 =?windows-1250?Q?lx7/MqCPkJCm/ZaRIvbMHkMR9U5NTm5QjcNLp9Y4zIyfy0XTCo0lqge1?=
 =?windows-1250?Q?UZl3rHYDeFQVG1Iccvb/LsZVdx9UjOufEHYat3ajsnapHvJw9LUlsslO?=
 =?windows-1250?Q?QE5mJ6NDf3yGyQ18Mh24iSuBAbuC85MGcYwPtUC4F2C8R09I8o31w9B/?=
 =?windows-1250?Q?j1QxfrQSolcsUa4mYVreTlVPuiiPPy1BE/B2BmDxpsRDs0MeAHx81UH8?=
 =?windows-1250?Q?4dadxPzgPq7oMVQAK/UgrM3P16T54dGPBGsILp2/OuXFcbgZjr1fDbLm?=
 =?windows-1250?Q?kdRFAw/EQTZtbHbTvZcqgpNX20/VY1wm?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373AA5BC86A0E2FF3D965DE9136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec7c9be-9dfd-44b2-1623-08db82cae24e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 11:26:49.4414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zncvqBNSKNOuKnZKszDLzdRdooxiZdq2tsrOaq3lCSJdKzIyvDLXsEr9IWYQ0e4hrVd7U5gk+4iPWAUwNR0New==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184183

--_000_VI1PR04MB5373AA5BC86A0E2FF3D965DE9136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

I have removed this check as you are absolutelly right. Besides in future I=
 suspect that we will have also support for ACLs and xattrs in both debs an=
d rpms as well.

Thx
Piotr
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: poniedzia=B3ek, 10 lipca 2023 13:46
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH 3/3] package.bbclass: add support for ACLs and x=
attr

On 10 Jul 2023, at 10:58, Piotr =A3obacz via lists.openembedded.org <p.loba=
cz=3Dwelotec.com@lists.openembedded.org> wrote:
> +    # Preserve sparse files, hard links, ACLs and extended attributes
> +    acl =3D ''
> +    xattr =3D ''
> +    # TODO: for the moment only ipk packages are supporting ACLs and ext=
ended attributes
> +    if bb.utils.contains('PACKAGE_CLASSES', 'package_ipk', True, False, =
d):
> +        acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', ''=
, d)
> +        xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattr=
s', '', d)
> +    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-on=
ly -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'

Is there much of a hit if we always tell tar to always preserve the acl/xat=
tr information, instead of changing behaviour based on whether ipkg is enab=
led?  I don=92t like how enabling ipkgs changes the tar command that is als=
o used to build the rpms.

Ross


--_000_VI1PR04MB5373AA5BC86A0E2FF3D965DE9136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I have removed this check as you are absolutelly right. Besides in future I=
 suspect that we will have also support for ACLs and xattrs in both debs an=
d rpms as well.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thx</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Ross Burton &lt;Ross.Bu=
rton@arm.com&gt;<br>
<b>Wys=B3ane:</b> poniedzia=B3ek, 10 lipca 2023 13:46<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 3/3] package.bbclass: add support for ACL=
s and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 10 Jul 2023, at 10:58, Piotr =A3obacz via lists=
.openembedded.org &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt; wro=
te:<br>
&gt; +&nbsp;&nbsp;&nbsp; # Preserve sparse files, hard links, ACLs and exte=
nded attributes<br>
&gt; +&nbsp;&nbsp;&nbsp; acl =3D ''<br>
&gt; +&nbsp;&nbsp;&nbsp; xattr =3D ''<br>
&gt; +&nbsp;&nbsp;&nbsp; # TODO: for the moment only ipk packages are suppo=
rting ACLs and extended attributes<br>
&gt; +&nbsp;&nbsp;&nbsp; if bb.utils.contains('PACKAGE_CLASSES', 'package_i=
pk', True, False, d):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl =3D bb.utils.contains(=
'DISTRO_FEATURES', 'acl', '--acls', '', d)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xattr =3D bb.utils.contain=
s('DISTRO_FEATURES', 'xattr', '--xattrs', '', d)<br>
&gt; +&nbsp;&nbsp;&nbsp; cmd =3D f'tar {acl} {xattr} --numeric-owner --excl=
ude=3D./sysroot-only -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {=
dvar}'<br>
<br>
Is there much of a hit if we always tell tar to always preserve the acl/xat=
tr information, instead of changing behaviour based on whether ipkg is enab=
led?&nbsp; I don=92t like how enabling ipkgs changes the tar command that i=
s also used to build the rpms.<br>
<br>
Ross<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373AA5BC86A0E2FF3D965DE9136AVI1PR04MB5373eurp_--

