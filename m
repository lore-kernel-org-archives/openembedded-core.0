Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BBAC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:57:03 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.17])
 by mx.groups.io with SMTP id smtpd.web10.12655.1745603817675406147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=P3ZZOT4W;
 spf=pass (domain: ericsson.com, ip: 52.101.69.17, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTWhpEvag4w5bza7A64+vkURpvhmEM8lOj+wl0P8Gbgr34we8mpH8QnSApOqcbimTFCRXjbhaq0nz9OD3HszrSu2stF3HLdJAKaSJmPZTvCfi7EW5MGL+aQaWPEJDXIa+dKS/ARet73AsltjnT8qPqk8YxyOpF1zCzF7Vc92CkxO+A3+yE4lL8IoC5y21Ng3uTa+ntclT9VqRsPFJ2w9f6Mp24VPsVaREKjKoiP/39dmGSPBfonKtaGGbvKCA+pgCRt7pWBwqMfa3HOfv0Y/8wzGpPFBLtH16pGuwUiYkULFo7RWg/w0r2wi9FGyy4Nz7SeDO+LoiLYibAZfuRXw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSfZyAMQyr27GKrk2fhlp1d7TSar53n2OE/oxcGJklg=;
 b=Ozm3akgXDXGdnThdvZ9rN110YeiYhqRh6Ty6WYDrmHV5bb2wlWRpjW+L0TYzS1zTs8Ef9KJU8nF2VpWQTgsM7+tKrP7mr/EvB1C7D2LImSANacAuQpiGEBLzMSzKt17jx6xQHherpVEcr34NKtQGgMt70KOrI4ZKn421DXobzZ3cEDd4cyLymWihd+RF8t0+oW+e1vbpQLElkAlI2U5Kcp55XvMjXwCrVilBs+raNMLRvyBSnWnCkt9nzBWM3OJciES2T3+mpYWQX+5BDxr//rfYBk4U7pk9x4ncbwL9R7701zlak8koJqemDj1IVczNe4RGCaG1opD5YR8XZF/Ajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSfZyAMQyr27GKrk2fhlp1d7TSar53n2OE/oxcGJklg=;
 b=P3ZZOT4WZslOPW8RrYBsjMfdtapROmil9efkIy1zkp+1tvBgVdxGL8c/nCPl0Wiy9lz5B/2vs7osoJ9Y86Kd+tNSOlZhIZUSQ89lrJjHofXotzYJkplc+wpPgsOBc1z96ovYz/Aln2XGSmwXbHnkT4Sjp5nVummS5yRo1f0kK6qu7Ax3aCIlLCyouLKuEes1AzK769jtbDX5niAzE40rt0sroadzb6xyWcmxkeKyZUudwi0c+7355iQLsIqJPHzG5hk8td/d600z4PXWhKfIdkDL0r0qu3UULyBfhs44l2N9s6IBZzXjsYIX5OQYBRo64U/wrAN4wy5cRsIlmr1hwQ==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by AS1PR07MB8902.eurprd07.prod.outlook.com (2603:10a6:20b:47e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 17:56:53 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%3]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 17:56:53 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs from
 linuxkernelcve
Thread-Topic: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs from
 linuxkernelcve
Thread-Index: AQHbqf3fzbEFZlFx/024VFzROWZjXrO0vCgAgAAFnBQ=
Date: Fri, 25 Apr 2025 17:56:53 +0000
Message-ID: 
 <PR3PR07MB666699CF5B19ED62EBB7794C8A842@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250410094837.897013-1-daniel.turull@ericsson.com>
 <20250410094837.897013-2-daniel.turull@ericsson.com>
 <AS1PR10MB5697D593B86BB2D24CCC620CFD842@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697D593B86BB2D24CCC620CFD842@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|AS1PR07MB8902:EE_
x-ms-office365-filtering-correlation-id: c13edd0f-7f77-414d-262e-08dd84228fdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?8ZvSoRdz0O5P47vIk2buCZG1bofRfK7DkAzt2TwjJej2y2t7at+bmu4Q?=
 =?Windows-1252?Q?4f4pV4jhR0zcvWVVpLDEXtz1k+I9JEtcSxiIqcAmm26WsyWY1JjeDA18?=
 =?Windows-1252?Q?5gHyVTb33dOQ4dDVKHH6qi6ZWIO8Xxp//hiFBDonFAAeQ+yjz8W+4m0v?=
 =?Windows-1252?Q?wVw4FkkW+LfUC+NAcOd86wRrISG6RGYB8rmDv3zQKMbDqe0RKLcs7k+x?=
 =?Windows-1252?Q?Pi1dIJycoT8D0Lv7NGiJx2j34AgnXoQ+FCT2EATWeZ5/+oBFOS0paXkh?=
 =?Windows-1252?Q?zcgCm94J7TOdbSXNDa6OpsXRdad/XmRlWpTLKVnrjZbKjrHB8AtLbPHj?=
 =?Windows-1252?Q?/RUrPY94LpE5RJ8E4dYpv4uRqhOmvZc8pe3OMEak0BYTW8b9igYnirZ5?=
 =?Windows-1252?Q?80TgiaByXHT6isiAJoei4WRdtitgwMe2kNQzr1LMGEt8YqwC0iz9xhPH?=
 =?Windows-1252?Q?pRbGLQ8ha/goxolChLLMT0cgWqiRkjXmtlbvY6ddXAeB7W0kh52hNmFj?=
 =?Windows-1252?Q?pI9DCAYXAdsBgjqlZejSNUrtKsLLizr9uZ7OxBvghC/z6JX4O5j4atX4?=
 =?Windows-1252?Q?jF9PlOkG/bJQMqafQvCJEEchDLGk7ZQ/gGAdam+kiGa45RVCbZur2+Df?=
 =?Windows-1252?Q?9ZJFeFm+ZZJ9b8LYxiWTZ4RxiK1DfiPXD0D3Dk84S4MwZifF7/Wh3ru9?=
 =?Windows-1252?Q?fZ6UhLOK7c6qnJcvd3RHA/qcEhua7wqaqXNJ6LWv8hwK3JaPOcUPOEEo?=
 =?Windows-1252?Q?YN1rYXE3rhjCtQetLhj6N+dp+FYGaiFlA+DTGjh0idrRV2kGXOj4xGQD?=
 =?Windows-1252?Q?paGKsUh2c4yv9BdKWTrP5uH+c5ql1nC7ZdyePLlLS22yRsMRYhb3c4gV?=
 =?Windows-1252?Q?ef8WcO2Z3JfBWXq9UE2SAq3eVQVQVPmv6jeIuECIhc1XISsKB9nb9ate?=
 =?Windows-1252?Q?CO+h7Q/u7pSbaROQOncK69B8FaTqlreCsieam2Z9DAvFuZzuBgbdbvtX?=
 =?Windows-1252?Q?gB6r4JFvwBSUHFl0fmaQ132tS/9gyEwuX+0i2Qw0qIqBHvYeA5Jsm3rE?=
 =?Windows-1252?Q?z+KHb4Kv6Hqb8AnMmDVnEakfQrsBdsGTKldbYolaK1hanfnIUZlyno5k?=
 =?Windows-1252?Q?6oSSCsoBgSvrKT6gfKOf3JTIkLnwYUauAZAIX7DvBzwsS+D2Oo1IbBz+?=
 =?Windows-1252?Q?tY1rY8qqaZzEMbsuViCf9gGmtO8xAWgp//A3K6TuK5zhd/42q8ZuA/BS?=
 =?Windows-1252?Q?3rFuTbocqDFX5OdhQ+pfiTOBPm7f6pCiKJ6+a5jMOg9gTht9u71Ieh22?=
 =?Windows-1252?Q?o6hGlslQiFYFq+5bEAyLJ4xABlCe+SG4weo46Gq4ulQXkSsDp7o7Vwvg?=
 =?Windows-1252?Q?yyp9KF4ZxkbCgUn8ugedh9Fh7jSM+M5jQj4EMRQ20Ufmrv4/bAzOdC43?=
 =?Windows-1252?Q?1Da9KeE4MkNlWBFZHeKsVbiwvX9v6QbZ3CaSeoBaRN5W7xcyTWolmJma?=
 =?Windows-1252?Q?5DilgTVU5WpJlC1SIDyFaASCh0OXWEUT0LCXpKcyovZ6EVQ2rDKnfN8u?=
 =?Windows-1252?Q?nBPzu9vZElj+JhHdo1eEY0CBAHGqQomMGxfxY2Ma3h9PxqWT7f2TaZiR?=
 =?Windows-1252?Q?p54=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?33S3zxwMDEpMs947bwn0fNBnI9r/t2k4zxRarB8lt58CfkQpAlka89cl?=
 =?Windows-1252?Q?1qjj2lhcIyE9s35fI9G/AdUZbzDmMcilJXueuO1dVzzgAjoOxYkSaZRf?=
 =?Windows-1252?Q?M3XCnVLslU5DVs9XKyHJjX9rjM66BYxnC+cwAvdn57VvWlKnn2ZQKuFd?=
 =?Windows-1252?Q?tXpWTwhSNc9LM6StXY9spxs0FpEt6cSTrlKFAnUJOJs5n8QotOnhhvHl?=
 =?Windows-1252?Q?msaBF5MFhx3Z1VeQe3MsZPdUA9/2zzRdVrBqRsk1qXlV1kLmQqIBQhkC?=
 =?Windows-1252?Q?Vl1+MRvMNQgkz0f75N54U1v7Bed+TVN8aRCiM6zxDayWXJLXoBcU2CzU?=
 =?Windows-1252?Q?oL8OWJUbPuntznc6QJzGQau9FkOuxOcaIW1jNdGuJ/QI3YMsTZkDh/gn?=
 =?Windows-1252?Q?Fi1QguIMLctouMgLkuUw1tA5g7D4uLi+xw0xqAUI58Mnun8hUpc9DrC2?=
 =?Windows-1252?Q?GznXjSyC3DQrFU/fSj7/bdNKLrA1IVzSyBHMHbFkzPWkf8S5m530pyzw?=
 =?Windows-1252?Q?OVZVU6RStviT82PQdE+JLlyKscvupBY9oLAxYzh8rPjYs2ViYeHgytXk?=
 =?Windows-1252?Q?aqgeY5cP3Yn2cLHCJ7XbiLuNC83FUKfd3lkHF2AlrHR6/ZBaVuaeAwxj?=
 =?Windows-1252?Q?09DNpuQHhg2FmqwG+l/RibhSpQ4GgM0/dvfpm4R9UOvwRBd/Baxyt7RM?=
 =?Windows-1252?Q?JJXHFJvdDX86fAmbjdswPDGQU1XwzCk5OpzWTHZbnjEzc9mjgqeNRXiL?=
 =?Windows-1252?Q?DCAtEfRqisJNVJxWStfmKlSA9iFc2lh+P+Ey1YF+3SXap0oz6hq7GNyi?=
 =?Windows-1252?Q?S3anaEZNmmfHOj+8V4hNqZMVfKq3OyzP+iDSw1QgNHNsrm0V9y2TRkCq?=
 =?Windows-1252?Q?ruGBEv8720AcYRsgquo+qlvlv0aaojfsLwzZykILUy8MmETBsv6gixpz?=
 =?Windows-1252?Q?N5JndkIwIe83s8DYz/6UiGO3BSSubeEqZMwOvIPEchz3gU7dmggWSPZZ?=
 =?Windows-1252?Q?ej9MkF5N+9AyZ/fLXUflVg9zRWtU//eyTVBUTgbniC5kGNAC586ZbkW4?=
 =?Windows-1252?Q?FUtjTIf4dL5ftxL0TK23ymaGI9Ii33KmTsouP5f8WywgpXeEt8Gg72j7?=
 =?Windows-1252?Q?jgB/Td1bO1iVbA3u5bJlZLjHZGFq4xptVGj8b8TFVqVIrMFixhM/Q1AA?=
 =?Windows-1252?Q?MRcXUl43VjmpmWnebykIMJfmziXfZEi9qn3TOo0ydRVXskMsIGmK20q2?=
 =?Windows-1252?Q?FtSgpIzHQvVeZ/XXXsJl8RtGZnt73KZTwzWct9M5l7m8YkBuxTRl5ihe?=
 =?Windows-1252?Q?HQaJokJYhVgouvKpuha3CipzfmmUZhUzpMUZmofLBVh6NSc6mshr2OtB?=
 =?Windows-1252?Q?pHoSqL+YJ+W41ziTfE5u88AtdXm/vZuUFBOw8BywWvx1Jx4FvKwYLFrr?=
 =?Windows-1252?Q?6dXgbJoJjJNHffr9ErFdu1Gg4Tx5X8ZmCwWTb3L/8G7csgeHjLDzqTPP?=
 =?Windows-1252?Q?+YZuBQi1zfgv5Vj1t9qTOXgn6af1yhJ2mfbSAKRQHbqI1phE9FwuylsF?=
 =?Windows-1252?Q?fMUbOQZqL1dV+if9bWt7SOLY11B0oNiXZzMc1Is7NCwHOk7VeMyYjqbE?=
 =?Windows-1252?Q?7XArxewkB1r8KyJ57JAKKLvUr/3fY16eyyJK4m0cduFix3UbAn8uH8Lq?=
 =?Windows-1252?Q?yNyHfQJx+JXyA/3Shrw6YrM30onmkLcez3znjhrrN8pXf0OmSMDWibuN?=
 =?Windows-1252?Q?ZHa37PlIIwa49C4m1FE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PR3PR07MB666699CF5B19ED62EBB7794C8A842PR3PR07MB6666eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13edd0f-7f77-414d-262e-08dd84228fdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 17:56:53.3684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLZVP5/32fqbnEAh9QzlIWMyi3sgWj2Uqnz0D478cd6n2pr607aROMCVZlTIyt8ooJjr1HPr/J5L49GLFRrkS9Oi8NLhqo/BPk8UmdaDXkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215494

--_000_PR3PR07MB666699CF5B19ED62EBB7794C8A842PR3PR07MB6666eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
I=92ll send a fix for this on Monday with the actual version where it was f=
ixed. I used the data from the old file.

Have a nice weekend

Daniel
________________________________
From: Marko, Peter <Peter.Marko@siemens.com>
Sent: Friday, April 25, 2025 7:32 PM
To: Daniel Turull <daniel.turull@ericsson.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>; bruce.ashfield@gm=
ail.com <bruce.ashfield@gmail.com>
Subject: RE: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs fro=
m linuxkernelcve



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Daniel Turull via
> lists.openembedded.org
> Sent: Thursday, April 10, 2025 11:49
> To: openembedded-core@lists.openembedded.org; bruce.ashfield@gmail.com
> Cc: Daniel Turull <daniel.turull@ericsson.com>
> Subject: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs from
> linuxkernelcve
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Execute new script generate-cve-exclusions.py
> ./generate-cve-exclusions.py ~/cvelistV5/ 6.12.19 > cve-exclusion_6.12.in=
c
>
> After using the database from CVEproject, some old
> CVEs did not have correct metadata, therefore moving missing ones
> from old cve-exclusions_6.12.inc into cve-exclusion.inc
>
> Comparing output from cve_check before and after, two CVEs are removed:
> CVE-2023-52904 and CVE-2024-38381
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/recipes-kernel/linux/cve-exclusion.inc   |  118 +
>  .../linux/cve-exclusion_6.12.inc              | 9194 +++++++++++------
>  2 files changed, 5980 insertions(+), 3332 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-
> kernel/linux/cve-exclusion.inc
> index 7857633943..5f96a81bdd 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -32,3 +32,121 @@ CVE_STATUS[CVE-2020-11935] =3D "not-applicable-
> config: Issue only affects aufs, wh
>  CVE_STATUS[CVE-2023-23005] =3D "disputed: There are no realistic cases \
>  in which a user can cause the alloc_memory_type error case to be reached=
. \
>  See: https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3D1208844%23c2&data=3D05%7C02%7Cdani=
el.turull%40ericsson.com%7C3e64365c747649c3157d08dd841f36b2%7C92e84cebfbfd4=
7abbe52080c6b87953f%7C0%7C0%7C638811991792203998%7CUnknown%7CTWFpbGZsb3d8ey=
JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsI=
ldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dsj3iCWza3Xa6ewHl%2Bf%2BUh4crSuSRHdH1iS=
FvRIOv72Y%3D&reserved=3D0"<https://bugzilla.suse.com/show_bug.cgi?id=3D1208=
844#c2>
> +
> +# Old CVES taken before using new data from kernel CNA
> +
> +CVE_STATUS[CVE-2014-8171] =3D "fixed-version: Fixed from version 3.12rc1=
"
> +
> +CVE_STATUS[CVE-2017-1000255] =3D "fixed-version: Fixed from version 4.14=
rc5"
> +
> +CVE_STATUS[CVE-2018-10840] =3D "fixed-version: Fixed from version 4.18rc=
1"
> +
> +CVE_STATUS[CVE-2018-10876] =3D "fixed-version: Fixed from version 4.18rc=
4"
> +
> +CVE_STATUS[CVE-2018-10882] =3D "fixed-version: Fixed from version 4.18rc=
4"
> +
> +CVE_STATUS[CVE-2018-10902] =3D "fixed-version: Fixed from version 4.18rc=
6"
> +
> +CVE_STATUS[CVE-2018-14625] =3D "fixed-version: Fixed from version 4.20rc=
6"
> +
> +CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed from version 5.6rc1"
> +
> +CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed from version 5.0rc6"
> +
> +CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed from version 5.1rc4"
> +
> +CVE_STATUS[CVE-2020-10742] =3D "fixed-version: Fixed from version 3.16rc=
1"
> +
> +CVE_STATUS[CVE-2020-16119] =3D "fixed-version: Fixed from version 5.15rc=
2"
> +
> +CVE_STATUS[CVE-2020-1749] =3D "fixed-version: Fixed from version 5.5rc1"
> +
> +CVE_STATUS[CVE-2020-25672] =3D "fixed-version: Fixed from version 5.12rc=
7"
> +
> +CVE_STATUS[CVE-2020-27815] =3D "fixed-version: Fixed from version 5.11rc=
1"
> +
> +CVE_STATUS[CVE-2020-8834] =3D "fixed-version: Fixed from version 4.18rc1=
"
> +
> +CVE_STATUS[CVE-2021-20194] =3D "fixed-version: Fixed from version 5.10rc=
1"
> +
> +CVE_STATUS[CVE-2021-20265] =3D "fixed-version: Fixed from version 4.5rc3=
"
> +
> +CVE_STATUS[CVE-2021-3564] =3D "fixed-version: Fixed from version 5.13rc5=
"
> +
> +CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed from version 5.15rc1=
"
> +
> +CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed from version 5.15rc1=
"
> +
> +CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed from version 5.8rc1"
> +
> +CVE_STATUS[CVE-2022-0286] =3D "fixed-version: Fixed from version 5.14rc2=
"
> +
> +CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed from version 5.19rc7=
"
> +
> +CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed from version 6.0"
> +
> +CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed from version 5.12rc1=
"
> +
> +CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed from version 6.0rc5"
> +
> +CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3534] =3D "fixed-version: Fixed from version 6.2rc1"
> +
> +CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed from version 6.1rc4"
> +
> +CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed from version 5.19rc1=
"
> +
> +CVE_STATUS[CVE-2022-36402] =3D "fixed-version: Fixed from version 6.5"
> +
> +CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed from version 6.1rc4=
"
> +
> +CVE_STATUS[CVE-2022-4382] =3D "fixed-version: Fixed from version 6.2rc5"
> +
> +CVE_STATUS[CVE-2023-1073] =3D "fixed-version: Fixed from version 6.2rc5"
> +
> +CVE_STATUS[CVE-2023-1074] =3D "fixed-version: Fixed from version 6.2rc6"
> +
> +CVE_STATUS[CVE-2023-1075] =3D "fixed-version: Fixed from version 6.2rc7"
> +
> +CVE_STATUS[CVE-2023-1076] =3D "fixed-version: Fixed from version 6.3rc1"
> +
> +CVE_STATUS[CVE-2023-2898] =3D "fixed-version: Fixed from version 6.5rc1"
> +
> +CVE_STATUS[CVE-2023-3772] =3D "fixed-version: Fixed from version 6.5rc7"
> +
> +CVE_STATUS[CVE-2023-3773] =3D "fixed-version: Fixed from version 6.5rc7"
> +
> +CVE_STATUS[CVE-2023-4155] =3D "fixed-version: Fixed from version 6.5rc6"
> +
> +CVE_STATUS[CVE-2023-6176] =3D "fixed-version: Fixed from version 6.6rc2"
> +
> +CVE_STATUS[CVE-2023-6270] =3D "cpe-stable-backport: Backported in 6.6.23=
"
> +
> +CVE_STATUS[CVE-2023-6610] =3D "cpe-stable-backport: Backported in 6.6.13=
"
> +
> +CVE_STATUS[CVE-2023-6679] =3D "fixed-version: only affects 6.7rc1 onward=
s"
> +
> +CVE_STATUS[CVE-2023-7042] =3D "cpe-stable-backport: Backported in 6.6.23=
"
> +
> +CVE_STATUS[CVE-2024-0193] =3D "cpe-stable-backport: Backported in 6.6.10=
"

The last 5 entries here are wrong.
CVEs in kernel 6.12 cannot be ignored based on statement about 6.6.x branch=
.

Peter

--_000_PR3PR07MB666699CF5B19ED62EBB7794C8A842PR3PR07MB6666eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div dir=3D"ltr">Hi,</div>
<div dir=3D"ltr">I=92ll send a fix for this on Monday with the actual versi=
on where it was fixed. I used the data from the old file.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Have a&nbsp;nice weekend</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Daniel</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif;"><b>From:</b>&nbsp;Marko, Peter &lt;Peter.Marko@siemens.com&gt;=
<br>
<b>Sent:</b>&nbsp;Friday, April 25, 2025 7:32 PM<br>
<b>To:</b>&nbsp;Daniel Turull &lt;daniel.turull@ericsson.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;; bruce.ashfield@gmail.com &lt;bruce.ashfield@gmail.com&gt;<br>
<b>Subject:</b>&nbsp;RE: [OE-core] [PATCH 2/2] cve-exclusions: update with =
all CVEs from linuxkernelcve</span>
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-<br>
&gt; core@lists.openembedded.org&gt; On Behalf Of Daniel Turull via<br>
&gt; lists.openembedded.org<br>
&gt; Sent: Thursday, April 10, 2025 11:49<br>
&gt; To: openembedded-core@lists.openembedded.org; bruce.ashfield@gmail.com=
<br>
&gt; Cc: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; Subject: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs fr=
om<br>
&gt; linuxkernelcve<br>
&gt;<br>
&gt; From: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt;<br>
&gt; Execute new script generate-cve-exclusions.py<br>
&gt; ./generate-cve-exclusions.py ~/cvelistV5/ 6.12.19 &gt; cve-exclusion_6=
.12.inc<br>
&gt;<br>
&gt; After using the database from CVEproject, some old<br>
&gt; CVEs did not have correct metadata, therefore moving missing ones<br>
&gt; from old cve-exclusions_6.12.inc into cve-exclusion.inc<br>
&gt;<br>
&gt; Comparing output from cve_check before and after, two CVEs are removed=
:<br>
&gt; CVE-2023-52904 and CVE-2024-38381<br>
&gt;<br>
&gt; Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-kernel/linux/cve-exclusion.inc&nbsp;&nbsp; |&nbsp; =
118 +<br>
&gt;&nbsp; .../linux/cve-exclusion_6.12.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9194 +++++++++++------<br>
&gt;&nbsp; 2 files changed, 5980 insertions(+), 3332 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipe=
s-<br>
&gt; kernel/linux/cve-exclusion.inc<br>
&gt; index 7857633943..5f96a81bdd 100644<br>
&gt; --- a/meta/recipes-kernel/linux/cve-exclusion.inc<br>
&gt; +++ b/meta/recipes-kernel/linux/cve-exclusion.inc<br>
&gt; @@ -32,3 +32,121 @@ CVE_STATUS[CVE-2020-11935] =3D &quot;not-applicabl=
e-<br>
&gt; config: Issue only affects aufs, wh<br>
&gt;&nbsp; CVE_STATUS[CVE-2023-23005] =3D &quot;disputed: There are no real=
istic cases \<br>
&gt;&nbsp; in which a user can cause the alloc_memory_type error case to be=
 reached. \<br>
&gt;&nbsp; See: <a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3D1208=
844#c2">https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3D1208844%23c2&amp;data=3D05%7C02%7C=
daniel.turull%40ericsson.com%7C3e64365c747649c3157d08dd841f36b2%7C92e84cebf=
bfd47abbe52080c6b87953f%7C0%7C0%7C638811991792203998%7CUnknown%7CTWFpbGZsb3=
d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb=
CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dsj3iCWza3Xa6ewHl%2Bf%2BUh4crSu=
SRHdH1iSFvRIOv72Y%3D&amp;reserved=3D0&quot;</a><br>
&gt; +<br>
&gt; +# Old CVES taken before using new data from kernel CNA<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2014-8171] =3D &quot;fixed-version: Fixed from version=
 3.12rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2017-1000255] =3D &quot;fixed-version: Fixed from vers=
ion 4.14rc5&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2018-10840] =3D &quot;fixed-version: Fixed from versio=
n 4.18rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2018-10876] =3D &quot;fixed-version: Fixed from versio=
n 4.18rc4&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2018-10882] =3D &quot;fixed-version: Fixed from versio=
n 4.18rc4&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2018-10902] =3D &quot;fixed-version: Fixed from versio=
n 4.18rc6&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2018-14625] =3D &quot;fixed-version: Fixed from versio=
n 4.20rc6&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2019-3016] =3D &quot;fixed-version: Fixed from version=
 5.6rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2019-3819] =3D &quot;fixed-version: Fixed from version=
 5.0rc6&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2019-3887] =3D &quot;fixed-version: Fixed from version=
 5.1rc4&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2020-10742] =3D &quot;fixed-version: Fixed from versio=
n 3.16rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2020-16119] =3D &quot;fixed-version: Fixed from versio=
n 5.15rc2&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2020-1749] =3D &quot;fixed-version: Fixed from version=
 5.5rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2020-25672] =3D &quot;fixed-version: Fixed from versio=
n 5.12rc7&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2020-27815] =3D &quot;fixed-version: Fixed from versio=
n 5.11rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2020-8834] =3D &quot;fixed-version: Fixed from version=
 4.18rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2021-20194] =3D &quot;fixed-version: Fixed from versio=
n 5.10rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2021-20265] =3D &quot;fixed-version: Fixed from versio=
n 4.5rc3&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2021-3564] =3D &quot;fixed-version: Fixed from version=
 5.13rc5&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2021-3669] =3D &quot;fixed-version: Fixed from version=
 5.15rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2021-3759] =3D &quot;fixed-version: Fixed from version=
 5.15rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2021-4218] =3D &quot;fixed-version: Fixed from version=
 5.8rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-0286] =3D &quot;fixed-version: Fixed from version=
 5.14rc2&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-1462] =3D &quot;fixed-version: Fixed from version=
 5.19rc7&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-2308] =3D &quot;fixed-version: Fixed from version=
 6.0&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-2327] =3D &quot;fixed-version: Fixed from version=
 5.12rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-2663] =3D &quot;fixed-version: Fixed from version=
 6.0rc5&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-2785] =3D &quot;fixed-version: Fixed from version=
 6.0rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3435] =3D &quot;fixed-version: Fixed from version=
 6.1rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3523] =3D &quot;fixed-version: Fixed from version=
 6.1rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3534] =3D &quot;fixed-version: Fixed from version=
 6.2rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3566] =3D &quot;fixed-version: Fixed from version=
 6.1rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3567] =3D &quot;fixed-version: Fixed from version=
 6.1rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3619] =3D &quot;fixed-version: Fixed from version=
 6.1rc4&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3621] =3D &quot;fixed-version: Fixed from version=
 6.1rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3624] =3D &quot;fixed-version: Fixed from version=
 6.0rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3629] =3D &quot;fixed-version: Fixed from version=
 6.0rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3630] =3D &quot;fixed-version: Fixed from version=
 6.0rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3633] =3D &quot;fixed-version: Fixed from version=
 6.0rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3636] =3D &quot;fixed-version: Fixed from version=
 5.19rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-36402] =3D &quot;fixed-version: Fixed from versio=
n 6.5&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-3646] =3D &quot;fixed-version: Fixed from version=
 6.1rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-42895] =3D &quot;fixed-version: Fixed from versio=
n 6.1rc4&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2022-4382] =3D &quot;fixed-version: Fixed from version=
 6.2rc5&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-1073] =3D &quot;fixed-version: Fixed from version=
 6.2rc5&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-1074] =3D &quot;fixed-version: Fixed from version=
 6.2rc6&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-1075] =3D &quot;fixed-version: Fixed from version=
 6.2rc7&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-1076] =3D &quot;fixed-version: Fixed from version=
 6.3rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-2898] =3D &quot;fixed-version: Fixed from version=
 6.5rc1&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-3772] =3D &quot;fixed-version: Fixed from version=
 6.5rc7&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-3773] =3D &quot;fixed-version: Fixed from version=
 6.5rc7&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-4155] =3D &quot;fixed-version: Fixed from version=
 6.5rc6&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-6176] =3D &quot;fixed-version: Fixed from version=
 6.6rc2&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-6270] =3D &quot;cpe-stable-backport: Backported i=
n 6.6.23&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-6610] =3D &quot;cpe-stable-backport: Backported i=
n 6.6.13&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-6679] =3D &quot;fixed-version: only affects 6.7rc=
1 onwards&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2023-7042] =3D &quot;cpe-stable-backport: Backported i=
n 6.6.23&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2024-0193] =3D &quot;cpe-stable-backport: Backported i=
n 6.6.10&quot;<br>
<br>
The last 5 entries here are wrong.<br>
CVEs in kernel 6.12 cannot be ignored based on statement about 6.6.x branch=
.<br>
<br>
Peter<br>
</div>
</div>
</div>
</body>
</html>

--_000_PR3PR07MB666699CF5B19ED62EBB7794C8A842PR3PR07MB6666eurp_--

