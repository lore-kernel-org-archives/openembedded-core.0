Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489F1CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 11:23:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.90])
 by mx.groups.io with SMTP id smtpd.web10.163273.1712748212418787572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 04:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=eorbDdGv;
 spf=pass (domain: axis.com, ip: 40.107.22.90, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBjtWu2Q2H1iAbB2/Bx/XcnX3pd5zVEAo37k+ROn0Sh2hEeX+SaFMlbxb+CpLkcN+aPvaFi6RiL5SEx3jiYesHQmLDHpwZZs2s+UIqZxGeCo2n/IXHyiusIlCDzkkbVpWUZ/avReEawU6tYcjKSaPQuvNayiDgrw+lZoGAnacIs03IlHdgCVeH+f35wYL2j9VcJCiqWsMRziUAuXAyQtWk0i+OwLvqoGNsZ8Ift827CzfgPLVaOF2Izbj8FIF7dZ8FuT/ykZx9C1WgRJERUTXBLCxZsvSSpxsav0zkpr8Q/NZ5jFy+wXGXVhD1O7aC/BC2YuOGZfXSzwqPJKTImIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX3F5bvq6sMSsJcpRTUFEcCMpXCZLRdT1mjRJOUPmZ8=;
 b=jA21CsBKBK/JDb0KF8qzjWbFhnCjLGdolR0HvDopAN0U7qvgRqd1u4MxKItJV+7hCJlJoEW3h3oNEkot+z69ySe6Q+7rYzym6SzIdjRBfOznLDxLN1x3qaOhQqrUnqXLkhJkBNkOuqlI9JDlSRfqpB+bd8lWurstFBlYB5kucSJrU8f/sPaZ3XD0L6RxdwFCPcZcJblW2qIP3IDh30siiSk/P5C668RCDFv+k99O/CbkFEpogrDTllEMeXBkEXN6E2g7zHc0l9ttPKlf5f8whu2VSngb+JJpHzwum6HWgqLxfjn4+83cUjXvTMLQg+ZAEWwd0pTbuP+1DIUmE66LHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX3F5bvq6sMSsJcpRTUFEcCMpXCZLRdT1mjRJOUPmZ8=;
 b=eorbDdGvcTqZ+7TvBzlK0gUMrreeEkdSy+O1SUz1BP5RKB2QiZ3IIk1EojoNw5UGdl33nyH+qzTS0tqacy24TF+uIXG894u90GiYEFWpo1XF1pq9w+LMtXpOBZ3vspdKD2drAE+3/8/T5REhgFp/kr0SL314b/c1WMT0NB9RZDc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB6747.eurprd02.prod.outlook.com (2603:10a6:10:1fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 11:23:28 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 11:23:28 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Julien Stephan <jstephan@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] devtool: standard: throws appropriate error
 if source is in detached HEAD
Thread-Topic: [OE-core] [PATCH v2] devtool: standard: throws appropriate error
 if source is in detached HEAD
Thread-Index: AQHaixWuvw2wWyX+vEOR7XV+mDP+S7FhXA6w
Date: Wed, 10 Apr 2024 11:23:28 +0000
Message-ID: 
 <DB5PR02MB10213986BBAF0B3810EB72AB2EF062@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240410070647.3783683-1-jstephan@baylibre.com>
In-Reply-To: <20240410070647.3783683-1-jstephan@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB6747:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9kOvMpdrCSE+y2f73lKYKK+esJcFOhDBbdgHpIQFo53I7qaPtVu3RVMwnRQhIwthvjZ0wHclzPKbSAMdx6GfbLpLnAUk9fl3iLoOIu6cTb32FRCMtyYcEx0Xedaj1hXETi/+6fUJWMbOf6FHc9l8aPyBF7QaEtkqOtbBnmSd81b1GQpWF7jo+Dw3sAN/p8jyXBxTYpwzKPPiTwRm5D0RuyejDB2kKo3eapBtttPnEExCcFiqrysNdvjtY9LE3x32P8uMhk5HUaHEqElNlM3oZaFn1RfBOW4oyfcr95zSLdYoQfafn3L1renM+z2QXyypewnX/D1Byj2o+wvBhThFSSRb4JHzGkohp5Gykc7wuwvmQDAoO6aBrJdxOdNBVQnnt8nhzxlbYVLIdTmFqiJ7Du1ytPrFaHao6tWQgkT+FlcnvDrOBA+Detcm87K0CbE3wJ8fW97KsiRrMI1Ij/YjrqfKIfE3f+yYlsvejspSX2qGSOzRqCWIaJuRGGNB2KzFkdsFlDZyXSZXyuHrEzGW1G1n/gSgGhc448++oD0AthjNK5osfosJ8j5ZAlOHXToVQdhSKN69aO3DPaN1wDjimbPcHcbkCYZVbP3hJ9AQ2glr7ywCMhEHQS1wzGSbrR9OkpiUSV511BNY9qP95IxBsfzLCl5TYEwCoWJN797vD44=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XNdOaYLN3YEoBHpRIfbD7i1/bEvvaOpooFkMNbWRyI6jGdlMNNFAyxaSiQj0?=
 =?us-ascii?Q?MfgONpwp6mhdDb1Gkj/KIqBp4EPX+1IdC1mpjShe1H0ymlvWkViwmyW+rhPH?=
 =?us-ascii?Q?3p1b0WJV43DO1gd+B/yyGExjfUDZm+jJUNuAuKFDOCirMaqT8LZJvHra5KuN?=
 =?us-ascii?Q?iXkH9m2/TX7brd0VA4mRh3ioKnqJQlXKlCosdeDCn8ibUFMUyMW2d3sODYS+?=
 =?us-ascii?Q?Inzc5QeTIKqM9doNK4nZVfzuSyOzTjArsTIItGFtSq66Y1YVNdjwLlPDD2aM?=
 =?us-ascii?Q?ZoBDV6XhHJ8/9mV064yye3C8DMFvjVh6ti7er9BvOk9eb+LTRYoOKiN9zsjW?=
 =?us-ascii?Q?34EjIpE+P0AZ4Turuda8tLxsOaHGVix6NXRuhvnB0bnB2O2EJMdKykiZTQe+?=
 =?us-ascii?Q?Y+M2/OMenOSB3fQtd/bMQ0fOCRGTihaQX/HV5NFys0LbIpV7JjP1x6SG8PQ0?=
 =?us-ascii?Q?BV15mwhLo5ydemyBPgye5S1EcW0JihMm0M9fvWR4B0i4qE+iY8YpUa8WMOfu?=
 =?us-ascii?Q?0nzGTC/p3y7s0UkPNW7iFpgwlnNwdN/ZY660J7RyVm1WLchg9sEJ1hIE9AUy?=
 =?us-ascii?Q?+r6yhILJnUB/zoLkXiW5whKwYs9/9z/lzs1PO9yVj7nEmxqD+U5rdPYxqrc0?=
 =?us-ascii?Q?+Uyakg53dAZRfGWHvuqHkQeWodg93583jJyo3ENaF7RSp31tN6h+alslMkDx?=
 =?us-ascii?Q?9g7E5fK2r11AynqYionhrYIyywRxB9OXAu4PoHK1aL9OecfhE1Ws79xq8ek8?=
 =?us-ascii?Q?yxu/WU+kjaWOtoBfoTz8U/0uTeoZai0AG0gL5efOVkuDctaXU42mNl8EOLPH?=
 =?us-ascii?Q?cJN151uUe82bGO4OIg0GhdlymMqTjtsysV0aBoS64rRUJ5lKwKN1NKmPpDpG?=
 =?us-ascii?Q?Q+Cu9yI0tKP70N+HKG+iLAArXMejSdYhTm38PILKz4P+jmba9BWLksZAnKZ3?=
 =?us-ascii?Q?+inSZMp5AiZWd23gXd9HPzpq6Vs6Iv6ORoe6wjN+Q0rRAOIVK2jgdVyltb1o?=
 =?us-ascii?Q?DaV72g2tanN6xnSchXGjmG8NiR++vvQgqiAsPmGSZHwqTSXy1RrYxHwt+H+c?=
 =?us-ascii?Q?Yehu2YtVrHeNiNx0gCK14+rP9fS6SHAVS6RgJHfav0COz4FNpfPuCIqniDT/?=
 =?us-ascii?Q?7Ai81psHRV4GuwnwT0HsJXXqQX+NC9jAC1Y3xal7Ukpcvm8Y+07YGkywazUC?=
 =?us-ascii?Q?aDq9dyrnQYtHdIKTmfLdUnrUaJRTDPFwXeGum7LOGqa7ipHjWbHxVCZZI5Kh?=
 =?us-ascii?Q?+ycepLXQPC55lOREGQvjvSJRWxA5vCfvQjNashgzqPLhamFh8bgfA1ytfFqh?=
 =?us-ascii?Q?xfgJjLIWJcQv2bFNvuIQUxQTzJ3YTcA/JdoP9vXaNF7VLxQ+gf0oMReDbpPb?=
 =?us-ascii?Q?QSooWJEhlq9lLGM5Aq+vnKErR4MPayaNcNLGOFNmiIBdxmU91NMEuoBDLP5H?=
 =?us-ascii?Q?/HEC2kgd76QpHIlORMRBuhvlQlASWUjGkRuBDDogGpbhV2KF5cIQ0vo53KNr?=
 =?us-ascii?Q?TQT5fs5JrP4SVvgOPTBAVxN6jsuXijtiw7bTU3qjPQ+WfZFA/Q79Ln0H8uQn?=
 =?us-ascii?Q?vUcRr5ACmw0UjX6oxKw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9632e2af-6eb2-41a5-ff7e-08dc5950a579
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 11:23:28.8106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0yNXO1MEDv+lvQbUgBGXDQG7HK80Snl84XQus3gwIJQ30O403Honv8A4eXqlpVAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198089

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Julien Stephan
> Sent: den 10 april 2024 09:07
> To: openembedded-core@lists.openembedded.org
> Cc: Julien Stephan <jstephan@baylibre.com>
> Subject: [OE-core] [PATCH v2] devtool: standard: throws appropriate error=
 if source is in detached HEAD
>=20
> If source is in detached HEAD, we get the following error when using
> detvool finish command:
>=20
>     [...]
>     File "<...>/poky/scripts/lib/devtool/standard.py", line 1938, in _upd=
ate_recipe
>       bb.process.run('git checkout %s' % startbranch, cwd=3Dsrctree)
>     File "<...>/poky/bitbake/lib/bb/process.py", line 189, in run
>       raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
>   bb.process.ExecutionError: Execution of 'git checkout (HEAD detached at=
 9bbf87e)' failed with exit code 2:
>   /bin/sh: -c: line 1: syntax error near unexpected token `('
>   /bin/sh: -c: line 1: `git checkout (HEAD detached at 9bbf87e)'
>=20
> Check this and throws an appropriate error in this case
>=20
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>=20
> ---
>=20
> Changes in v2:
>=20
> - update error message to avoid confusion with a potentially non
>   existing "main" branch

As you noted in an earlier mail, the same error message is used some=20
lines later. Please change that one too.

> ---
>  scripts/lib/devtool/standard.py | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 2c174927ddb..51e5794a0a7 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1888,6 +1888,8 @@ def _update_recipe(recipename, workspace, rd, mode,
> appendlayerdir, wildcard_ver
>          for line in stdout.splitlines():
>              branchname =3D line[2:]
>              if line.startswith('* '):
> +                if 'HEAD' in line:
> +                    raise DevtoolError('Detached HEAD - please check out=
 a branch, e.g., "devtool"')
>                  startbranch =3D branchname
>              if branchname.startswith(override_branch_prefix):
>                  override_branches.append(branchname)
> --
> 2.44.0

//Peter


