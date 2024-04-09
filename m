Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7FCCD128A
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 23:12:04 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.133])
 by mx.groups.io with SMTP id smtpd.web11.153248.1712704316560088779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 16:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=FYYoty5b;
 spf=pass (domain: axis.com, ip: 40.107.20.133, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfRWJKaPtqVWTFLwFVxy7rzFy8iJYXo4Ayr7y8ui24IwdfFzJG7tXuv525L9ti6P5wUCO63OzbAqwuQQlf60cd6XQVpr/mI2Qa9EZj9V76V+gA90UVHQnDjADHQwsUy+04Vdg0g50oakvXGeWr//hQTXtNrDHUHyt5FX85DkrGYgiQZ0EnfWbfa6PbY7oiSB74PXOHjkIElJeKOJ06f1zgjMpFsb470skRQ+R99+gc2vEiDaS/Wd56h+TtVjOjNbo7G3fhKOpLWK127RmVHr0aAkDh2d9K2UczaQEd5QytliJ0AIOZ2A5QFU0eOTDAtsq17aqtPUCD6e8BHG1/7sEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uS3TIuTOnHRNyW1Ufv2n9UQtVYPIc3gJrNWNyJRj0g=;
 b=KrtWFg86Jv6sHajyU1VHphkRsVgzCiv609Qd08O+VlJxqVISaxE812F+GxVDY7Gd94e83I6sdM1yPbeVnmmN1rDnd5J79oGwuq9/ZLMTVL9j27NDAz9WTv1e3usSuGamJtwJRYrXjgQg2PnXjoPRZK3Z4P13Yc3ch+lYS4r/s2QJLZ9v9Cl5dPjCWyONPTMRc75zAPX4iv/9PYMTcJzYekh025qBaXGi5FSCoJu7Mj/jInRl/DenK0JurG3loa6+4lN+AOmEma/n4PHUT95cYCVQdaUZMdVkwphrUSpdaFRw6vy5zSXA+vr4gKuj0ZgIw1et4wqBHEwA0UVv6Tgyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uS3TIuTOnHRNyW1Ufv2n9UQtVYPIc3gJrNWNyJRj0g=;
 b=FYYoty5bguchZ+Ur3I71Ga9fq+7ByoR3S2ygjNAe9mGk/M+69B1+4st/6NCCjXejvwgDsbY3/Ekb/pSvkf4joff4Rrhfqu0fb/lABzxjU4KwNlYOrOrfit7lJ0SuGH7kLGT5xqS6oe3LI+w++gYoMR503dQaFgn3ecm81f0h95Q=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM9PR02MB7267.eurprd02.prod.outlook.com (2603:10a6:20b:3e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 23:11:53 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 23:11:53 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Julien Stephan <jstephan@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] devtool: standard: throws appropriate error if
 source is in detached HEAD
Thread-Topic: [OE-core] [PATCH] devtool: standard: throws appropriate error if
 source is in detached HEAD
Thread-Index: AQHaik48EzGPU+J1SkqdWv6B7ZJwOrFgjTsQ
Date: Tue, 9 Apr 2024 23:11:53 +0000
Message-ID: 
 <DB5PR02MB10213B28D971EC428E142F18FEF072@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240409071905.3625142-1-jstephan@baylibre.com>
In-Reply-To: <20240409071905.3625142-1-jstephan@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM9PR02MB7267:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 F359E5Vdy2qrtwLUe41d6DvHJ2T4eZz502QwFOASb4xGqYgaiD9q2ygLZBI0NZRB/CsnW74+YGwC/oWkOiRk1VJ4UT2lX3+Jzdj9jaVAq5TRIieQH6G510UGlP/gVMMYwzo32uhWdgbUKNDvhCOmVQQLdI1bd3PX9A7GIZqYYIfcoB1Hc773Roap44MBgEaIZAbzL0oya6bKkdCSsgnfuwXrt4qyhYPQDxgFJGB3bDPIjTwrQnLhyrhAQ17/l0SsHDZkPkhYwExqep03lsznA4mO4egWbaI+UpyDVuRb6M1+Zw1bRjV1RHfEbo0fuuKA6RN/ujpstF3iHxqda9v2GZVGgYrVdh9rFCESTKcHmLjh+SupK+FdxsOdBaTul8zUSp+VDFhcG9phjZZRrTLP9OwNGgykhDBrbDi+23WmBH8NCe+jcyEw3Jh/elUqAgahV1Drk3su5v0tfRIZp3OlyVe5LBPQjKmy0/N1/RrnbqUPLItEIFrQXUMF7wokqRb4JAX7HRy/RJOYwpkhfk5mdEYFy+iVirBT/xUPd61TQopA5q3Lu45YaqT4cJ7R09BjtPp8wYweDVGoyaj2NUxlpz6qybOIy7QkN5j8eBbsda8dUgfS9x0l/ifMWM8jh81R7ZylgznsTIr3hAlQxHyluw6pBMLIsbAm68LATg+Y3Ik=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XnTVHizKqRas1gaM+ri/STW34CaGuhQxfj7DNgZmbc0L2jHodEbttmdzNVi4?=
 =?us-ascii?Q?8ftik3HCTt/XnPyOVKHnlCiFasKQys8GSLc2gavsPM6gI9fx5VBBh9IwHPfc?=
 =?us-ascii?Q?z5/x0sf87jHIEXFV9x9px/pDLbBDKnqzhzvWdBoAPQwmBop17AOmfUgNVju1?=
 =?us-ascii?Q?aYxvsRcMe7xjLGCWer6+ZcYlv6RtKljRjSRYJ1kgztVIRVJmJYhsjF/QdLrO?=
 =?us-ascii?Q?+pVyBxCuzuz2wk1gqvf3+4pR1wjU/BV15RFzc6ebskEhRUS0a6WRqlJxVGqH?=
 =?us-ascii?Q?yu8QAovfgOs6pxj4G6/8pA5G99uZnjXN295wEwYxLsmnD1xbM+kUpRRw7BSU?=
 =?us-ascii?Q?rPEz/t5YLTyVwq3skwANw9Fj2Jscf9SPuHIqL7JO5QYzrSfC54ma2dioQzSu?=
 =?us-ascii?Q?qsZLgQK45cER6K8Dn4Yl3t6izaTMzie+7k5oay+bLw27vYESkYyeSW/EeWks?=
 =?us-ascii?Q?Po/rZmP+Egvx6rKMege4AAyciCCWCesreICYCw4IPP5xPdfGB0B56cvuB7Xk?=
 =?us-ascii?Q?vb+kbjkaB2N1rbYN/Gp9icRYRbNf/jCVl1IPNyeFtJdiiri7ynlrRuXXzrMW?=
 =?us-ascii?Q?GngnCGbyWNtMljFHg2t4YarYlkz5ptLgUMDk0yjCUgFdabhsK0zycH921u82?=
 =?us-ascii?Q?XF1f9n37GwCi7vppytt3lhIOs6U61qnyIZ96AL92K3YyAPKN3R/MteZUrmr4?=
 =?us-ascii?Q?bn/J7Chb21U9/mCf6LIlArANuYr363UkuxJdRFOE8CPWLJEs31fWxbBkuDsZ?=
 =?us-ascii?Q?ICp+VKddmgnNBvMDJCF1vVlVCAa3O3gJuHpD2g/QkD8uJA50OWrh39O81yvF?=
 =?us-ascii?Q?PKEwFFB5SCbTxgTmewOgelUOGgBfKgEaeFeXKS/KgzJuPDfOJ7XPJY/rbOjr?=
 =?us-ascii?Q?igVKDthDUT0KygjMWpAGM4m1HWxNy9sP0QScbhoyplV3p8ZhVlJ3jysSCLbI?=
 =?us-ascii?Q?hT66Vno2UPeoHG9z+/ne9Xv5t8xJll+MSj3zmt4mnykLpFdGS+xB1TAGbEZv?=
 =?us-ascii?Q?n6flp2F/mWGVPrcEgG+LhPaieVHiPaMuf9KyE38op8iCMnIQlczYNhm+E5ot?=
 =?us-ascii?Q?ro0t31ug2Y54hHGlTZBjynchxF6r9MniK+clhkM7UWxIxdZ3F062pzBUsRVJ?=
 =?us-ascii?Q?5FsNGZaXIw0ctCbAgoQDB9ERj4LE9RE7/Rz7jCikZWkjtlgOw15iXOBfukLo?=
 =?us-ascii?Q?6zhjCtqm3U134DoRRy+eiIjciYbwr4rGybXH4dtaTF27Mpr8CNW/IGS12Ut6?=
 =?us-ascii?Q?LLcrb20ZUw38WiU3wzebIGMV1Yj4AMZh4/PRXgTLWEhqGuFGZpkvj8As0+hl?=
 =?us-ascii?Q?/+N7tXn9IlwS7Z/4gLmEkzdaSH9ZSn1pVxTkvlARBtkuCBcFO8kJxof2PDP9?=
 =?us-ascii?Q?tzfusoeCad5p9ZdEShDZJmKAI5uVTOKbk00Tej/elJ3zBz9rXN+QcBXgaLaC?=
 =?us-ascii?Q?rZznWCcnbmeHZIMi4aEeF6G05ILXYaJDcz2qcYG/uRbxOgpiF+uq9siDVKHH?=
 =?us-ascii?Q?8U6he6qT61ljJJAFVaqzPKde55ws8FJ3WXksM6SIkOmwJeroaPTd24Q9VH/7?=
 =?us-ascii?Q?Vs6xGGllUasGV/jUDE8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe5f8d3-77cb-42b8-13f2-08dc58ea71bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 23:11:53.3610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WeKVsmD6KQRrG/CMmDuhwiCttcyjA4h05fpW6/PYi0PfEERoROCVu7aTOuzGpaNi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7267
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 23:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198071

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Julien Stephan
> Sent: den 9 april 2024 09:19
> To: openembedded-core@lists.openembedded.org
> Cc: Julien Stephan <jstephan@baylibre.com>
> Subject: [OE-core] [PATCH] devtool: standard: throws appropriate error if=
 source is in detached HEAD
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
> ---
>  scripts/lib/devtool/standard.py | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 7972b4f8223..7f32b0999a4 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1885,6 +1885,8 @@ def _update_recipe(recipename, workspace, rd, mode,=
 appendlayerdir, wildcard_ver
>          for line in stdout.splitlines():
>              branchname =3D line[2:]
>              if line.startswith('* '):
> +                if 'HEAD' in line:
> +                    raise DevtoolError('Detached HEAD - please check out=
 the main branch in source tree first')

Using "main branch" here might lead to confusion since it is unclear=20
if the error is referring to an actual "main" branch, which not all=20
repositories have, or to whatever branch is primarily used.
Additionally, when using devtool, the branch is typically "devtool".=20

I would change it to:

                    raise DevtoolError('Detached HEAD - please check out a =
branch, e.g., "devtool"')

>                  startbranch =3D branchname
>              if branchname.startswith(override_branch_prefix):
>                  override_branches.append(branchname)
> --
> 2.44.0

//Peter


