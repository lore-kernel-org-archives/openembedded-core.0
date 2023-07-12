Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2585EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 10:54:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web10.4455.1689159265948750118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 03:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.21.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5NnBeN5r0hZXWGPd/7BIRTUo+j97GT7WN3b9dvTUgxqkDa90Pg7gtlAmaM9/VLFRTKtfTrGJTXyMyE4ueDkuCsl75WwCjea9R3Q3CSn7EjuopE0jJNITUbJhFyo3bQTklZ/BXh5URPpbCYNpHNHImgu+Zw67YNEticD6+jJV2il1HTmQwmhmlOp9jD1YBreA0p3XbOREVMpfZPu613KDMT49rU3e0A+LxoxnlAyD/IiuJSGDaYXty5a9QoyaQGotEQBZXpf7BFMfKCTAwrzUpjoE0hKn/6Zz1Dp9FwF8/GpZcSO3n37Lp5b40e5OGFGboIYvpuMUsUtqfVsmIdXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0sf+hmb13Ibs/UQo7u+gNQvtV4IHaHh/UI7SYNHz3Y=;
 b=H21oljdcXZgdjqgB6resHgmMX+0LAvqj+tQJJVPnUBqSh6Qsbgtp/8kblnmZbOAy1NUIunERZlq2KsWtLQqE4qU07CGDRPRoi+BIeQ86P7Ylz2X/Esqk2c1eldIyB/5x5Bit4dmuB2kTSE0KiqFNQok3kzlyXR7lcMx2vmczouRo+6VW5qKikYAYsUJcLgehJiD0ObIpsGnk/oypRoCkw3IJ6FNhalEkS34V1jLtE5s/KlZJfqP73b2b6Qv1Kths5LrgYkQCdp91bi53c+K5cq9h2/MON56HxBNjtuB0dL2vfm5UpuedvN+7uaDPQKH+PBkvdBUUjOiJZFOhvfuJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0sf+hmb13Ibs/UQo7u+gNQvtV4IHaHh/UI7SYNHz3Y=;
 b=szuBP6ldYtaxbf2AKHOSCVjoPNpt/c6I+IkJ2oHZYY60doaVfqL0ab1EShDr4BXoO2zSn1Bewlsns4hOitQp/86qATKj3IQMvyYjBlPTnL2Xk3FDYUmUep7p4JHbM8R0Hk5QfE8fPc1wIKtKkBkq3lyFjf64b7Ea27g7gARJ7vk=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 10:54:22 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 10:54:21 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v2 3/3] package.bbclass: add support for ACLs and
 xattr
Thread-Topic: [OE-Core][PATCH v2 3/3] package.bbclass: add support for ACLs
 and xattr
Thread-Index: AQHZtE97rZ/LG08I6Uyn6Nr9n+F7N6+18N6AgAAEsl0=
Date: Wed, 12 Jul 2023 10:54:21 +0000
Message-ID: 
 <VI1PR04MB5373C99107FC23A39EEC79369136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230711232819.2212134-1-p.lobacz@welotec.com>
 <20230711232819.2212134-3-p.lobacz@welotec.com>
 <2CDF761B-DEFB-44FD-8933-AD47A9821F96@arm.com>
In-Reply-To: <2CDF761B-DEFB-44FD-8933-AD47A9821F96@arm.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PA4PR04MB9366:EE_
x-ms-office365-filtering-correlation-id: 86b13e49-e9e0-423e-d033-08db82c65955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oPBVxY6A98JLHyVQ+awlBCFRXmwcGqeXjw8wCJVxIQOn0iYpc/RQFR0zKfAFl8fS/qmWDAL1PF7eDtvPsQ+MbbZxz+t1GOr93u5yUI/YS1BAU7uMQ8XZVATZ1hJMEVbuLH/ZCuhC+QXJjWOEL9r6BxdAthCWgA6wz3VDqLkggCJSzQeQZopWfB+zwbxQiRdBSKwQDlfXu6SiMlGRuAE788Gse3fS4B7+H02Wuds9SGuh7bCnJhdur/0VnJNKlPr2PeEATicBI7vgxRmvintauSDmTGVFFY+yY88Cmrp/SA8Mg3UVFVbM2IWeNyXnxjyqBpK6YYQdVyoYToay/OgRQNZ/4recqGT2TFug+4jHFPHHPs54JzfKw7XbHHN9KOza4+AV1S5SnrLH4yIaZUGifGYs34uQWj1K9B5xyISJ2aD062bUF7ru2Xf85KW8OiH2MvhhzjeTCju0Sw1ZQQKLj2PO5mk3n0zVkSEYRCa2w3VazDs9GLxJqfRYl58/k8q4y8PSj+MWoG4ky88YTVSFrSWQTTuWPqE+9f9G7uipmVRUzh3JrQ28Z0X0tfDxKXfPBXyIMNyJ2fNc+5HKf0DZWeTttgOelpvrekUkc1NjYZQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39840400004)(396003)(346002)(451199021)(38100700002)(38070700005)(86362001)(55016003)(7696005)(71200400001)(66946007)(76116006)(91956017)(33656002)(166002)(122000001)(53546011)(26005)(186003)(9686003)(6506007)(52536014)(5660300002)(66476007)(45080400002)(4326008)(66446008)(2906002)(8936002)(8676002)(66556008)(41300700001)(478600001)(66574015)(6916009)(64756008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?zDQrYTV0qFDxaeaVXGxKjmCsZQ6gXVRVa9ZrbxUUk8kdw1dZJLUMBjoC?=
 =?windows-1250?Q?6MklK8m2mpgWEAJqAgoQcggbnbxR7Kk3cfBID+v0sFbGV4fMmeg/OKKk?=
 =?windows-1250?Q?IrF+P4vMj7Lnime0PUL/8hQ66TgD1QAFozuOGwtjey2RptJ/RQRX9hKT?=
 =?windows-1250?Q?db+8xzI/VDhTJ44FVvvMbZa1Xpe+sU4G847gUYr0Oj2v4r93pZ++PsNg?=
 =?windows-1250?Q?OPvmxpirzVyzIQbSmEsWk0rM7fgdJWwFS1wE6FV53TARqkxNELGrqQ/T?=
 =?windows-1250?Q?VwxzUnrG/Q2Qt8wg/2YoF5JZ9qB7YLx33VOv+uf/LH1twiwSFR8yCijn?=
 =?windows-1250?Q?T3R4aTLr7bN1+ImCPSeD+kevBc1tAfocxG8J/jHRp5bcTZ698mxUs5jr?=
 =?windows-1250?Q?i4x5mJzEmw91GmoHgWnnawnliBODl1f3e6Exw84brngHZpBLrLc/ZevQ?=
 =?windows-1250?Q?LCQuWwbPRi4JUehJ/ckQ8yFXoxl6Xr26zunl3kSehI2Ct5SECxXhfNmw?=
 =?windows-1250?Q?lQ4Jgy77sQoCCQzhejXtAsnN7OtrS/ao0qWeT4JQ9nMlpkq6VorxnMU5?=
 =?windows-1250?Q?EceaXUnK0claz4d6jgIC5jF9VlplHf+A03stIFZHFLMWNBTuUQwdrfuE?=
 =?windows-1250?Q?JbVqRAyWAE71PvGF02dO6At4j3yIYpT9ukaMTKoUUTAe7GlsxEjc5c7t?=
 =?windows-1250?Q?wINTx77D5FRjwK9KWlxVAKQRS6cCA75NijQJeqw1UIh/O2XE/zzB7m4u?=
 =?windows-1250?Q?u/dP+4+f4G8JEcIjGFJFGoeIneXoJT3vWUT8wze1SghRAcxwNUK+4G8L?=
 =?windows-1250?Q?BePLHJpTGYK69ZwLjUXt2ZdnROcpc8w924ct6tPKmVSxnbhp5uh3zy36?=
 =?windows-1250?Q?U/A5ekGjDqkX08kWGXMHdW2rgYWm2VO6c4xqEMhgreOb4NcmL4UGI7An?=
 =?windows-1250?Q?nxDOVEn1//X9A75bbgOQPB/H/wb1QjcCGuvtTnaFE+f6/V8d8JgO5D5I?=
 =?windows-1250?Q?ccvWCkt8KJghs54V0HjxJtW40Vnegyv216Gdb6CT06ZEHnkZqZG6QgAA?=
 =?windows-1250?Q?U0HdbmdwFpy54jptnXgaAXTEXvpjHlfSph9SJhdLOLd6Oj12NxxX7ruK?=
 =?windows-1250?Q?N+HSWMqA5bTXWbMKGt5ibyKxKhQR+NeaRXGxepAgZ51hcEVQYKz6jBbx?=
 =?windows-1250?Q?h1XmJeqqs3rKa+EhGKKXuFZE61zpS2jRjws4zjqxTUZKQulvuG4n62rK?=
 =?windows-1250?Q?UVHx3dU7CYoDvmQY433lBfTs2vZJO0hGxdppWYEx+8Gt1Mlco+ZRTNkD?=
 =?windows-1250?Q?C7lkRq9/bDmzgu+VIytoyH9nrGFjLWsOYMuonS2F1XAvqzD1GHhqTO1l?=
 =?windows-1250?Q?Z2wiDpLLZ5YodO6ehFx2Zfbr/iyxtlzmXStSDlMBSCFMq+HuCXvYbZht?=
 =?windows-1250?Q?3k+QTj/XSnBw59sTYtsiFxcYWz2mPJhZaEYq5NCY6Dr/idKYQjI/9Jw8?=
 =?windows-1250?Q?Ud2aJzr1AKHkG0Gmgm2PLAyR+9vYWblGudrmiQQNzsMFez2k3+CkOr4o?=
 =?windows-1250?Q?J8cnOYN6c5DquPDKOWXiygSotkR/guePQjhn24G0jAm1w9CU+wUigojG?=
 =?windows-1250?Q?QkfPs8u20M3gp5Ch06xZ5bG97oEjGQoGi6NKgV9KQ8M7KWrwzhbrfcEN?=
 =?windows-1250?Q?LzBfCBCx+TfCvh9jagBj38LoXCdteLSvQOyiENVOj807mC5vNlQ5uw?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373C99107FC23A39EEC79369136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b13e49-e9e0-423e-d033-08db82c65955
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 10:54:21.6791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSi4csYhlRkQDcKPl8SGFFB3zhfBqPLlO8tLBcojdBbNCJHj0opKA2GaATziuVzlbL9qvRRK7z2t1/kkahMtwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184176

--_000_VI1PR04MB5373C99107FC23A39EEC79369136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Hmmmm actually no, we can always pass these params to tar.

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: Wednesday, July 12, 2023 12:36:41 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v2 3/3] package.bbclass: add support for ACLs an=
d xattr

On 12 Jul 2023, at 00:28, Piotr =A3obacz via lists.openembedded.org <p.loba=
cz=3Dwelotec.com@lists.openembedded.org> wrote:
> -    # Preserve sparse files and hard links
> -    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -x=
f - -C %s' % (dest, dvar)
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
>     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT=
)

This is still changing the behaviour for rpm packages if ipkg is enabled, w=
hich sounds like a wonderful way to introduce subtle bugs that are hard to =
find.

Is there a problem with always passing =97acls =97xatttrs to tar at this st=
ep?

Ross

--_000_VI1PR04MB5373C99107FC23A39EEC79369136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div>
<div>
<div dir=3D"ltr">Hmmmm actually no, we can always pass these params to tar.=
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Ross Burton &lt;Ross.Bu=
rton@arm.com&gt;<br>
<b>Wys=B3ane:</b> Wednesday, July 12, 2023 12:36:41 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v2 3/3] package.bbclass: add support for =
ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 12 Jul 2023, at 00:28, Piotr =A3obacz via lists=
.openembedded.org &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt; wro=
te:<br>
&gt; -&nbsp;&nbsp;&nbsp; # Preserve sparse files and hard links<br>
&gt; -&nbsp;&nbsp;&nbsp; cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %=
s -p -S . | tar -xf - -C %s' % (dest, dvar)<br>
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
&gt;&nbsp;&nbsp;&nbsp;&nbsp; subprocess.check_output(cmd, shell=3DTrue, std=
err=3Dsubprocess.STDOUT)<br>
<br>
This is still changing the behaviour for rpm packages if ipkg is enabled, w=
hich sounds like a wonderful way to introduce subtle bugs that are hard to =
find.<br>
<br>
Is there a problem with always passing =97acls =97xatttrs to tar at this st=
ep?<br>
<br>
Ross</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373C99107FC23A39EEC79369136AVI1PR04MB5373eurp_--

