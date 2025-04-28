Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F42CC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 06:01:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.41564.1745820028176032903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 23:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=vjJV7zgt;
 spf=pass (domain: ericsson.com, ip: 40.107.20.46, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfwIYv7O2/4qgwatrk2HnCxHbm2ZNdqU/nItXXK30lHvps8mdm7kUUn0xcJuuhV9o2mbbsqpeCmg6SYfWLENWtiEb7Rt95X6n4FUcDPV2sQlhanIUpnp7MU4FNBUOuN//icrrKSmGgZN7vy4BqImO7IuuQHRj9CCD9tekAgiiaiTSw79fqISFZxKUXDZd6PtQCdW0+PpZYUle9xPF5Lfw1WD/W2eytv3nJMM3YQscMVuWI0i3xlwu/LBelVKgohCvEzHRbouNTOP7JwaQ/+NqCb6iFAQQlkb3hd1Sglyx18+7stondL75ZC9KtBPmP99gNYPRiYrJt6XN5KwQSPh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V603Q7Dkzwv4+MRgytv9C56ra0VAaga6KhecsOjaujE=;
 b=SDQTexUmixIvl6S6IXMNE5932hLcHxx3ZEdmCrzCc0FGbfBDObmJtKWgmHMyF5ud+d1MYC1VGiFyymCjtabyb1Y8o3peA5jpLELrXxKUi79fit18jd3Dqn++aueVJrUJOkgOMgM6yVzi/TpBBO52olWLSZGE7x3ylzuOmnST0ADgcAkCCYtw0yP/ZExn0o4o6oN/TKw1rd6Ahyc6Wc9lClRYzZ851TPK3CXADCCHrEj7ofznaiT3Cl3+T9EGO5XNIT990VXiLR2MSZg/czXO+V8R1vPBQpX+HML49Bv1cKrWkRmxEZbEw8xXuOQjO7pLEkEE9NdLLVd/qNxqw6ODBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V603Q7Dkzwv4+MRgytv9C56ra0VAaga6KhecsOjaujE=;
 b=vjJV7zgtZgk6eSj1GuBCK7bYRlFX/Yv+vVz4XPOW3VfyWBDK+U4yqDSym3TuWf+HeoVBG1bdAOJVNi4mBfpnj99QSkMfeXLxMZiVrlrwar5o5UFh+zkYRy/FpprjtcbIlwq92LTGJb6lhszhiXVzDdsUmL/AbxFOpCoALI052moXt3WtQBRPaIg7+hhzFlzAMFKSoqq/TWZjmWOYjwjcw/jSXm+YvDCNRJOZxu6kP+hWaQY2M/m5Eq/0pLQ+0FyGs6y13M0oJ73cccymfAPQ6fvs9a46ISUFdWyIgQKgIV+oXsei6kuhf7NL4QthuHw2q9NCqmGYE0nSBcCZ3aj6sw==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by AM8PR07MB8312.eurprd07.prod.outlook.com (2603:10a6:20b:32b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:00:24 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%3]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 06:00:24 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: RE: [OE-core] [PATCH 1/2] linux/generate-cve-exclusions: use data
 from CVEProject
Thread-Topic: [OE-core] [PATCH 1/2] linux/generate-cve-exclusions: use data
 from CVEProject
Thread-Index: AQHbqf3fiC4HOlxFJ02DQ+Tqzr/zorO1v/0AgAB+HbA=
Date: Mon, 28 Apr 2025 06:00:00 +0000
Message-ID: 
 <PR3PR07MB6666ABA95030DF34F6DC0A208A872@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250410094837.897013-1-daniel.turull@ericsson.com>
 <854aacf4-7278-4af6-9ab2-7f0c4ed68504@gmail.com>
In-Reply-To: <854aacf4-7278-4af6-9ab2-7f0c4ed68504@gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|AM8PR07MB8312:EE_
x-ms-office365-filtering-correlation-id: ad784ff8-6381-453b-220a-08dd8619f785
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|10070799003|8096899003|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cX+52zP5XDPZZIx71QwJ5Xbtg5DxkpLaSDHzd65g2GfutkD/FwIOHfq/qdV/?=
 =?us-ascii?Q?tKrGYVKJr88AExTIB72UGMuiBW5xMwaL7uI1L388reNG1XzNLcANTczEJSoN?=
 =?us-ascii?Q?6836N2Wl4CKRZn6CetW5lWaE5mygf+pQyaEkUAOi6PT6h5MTWjwdnVggszbB?=
 =?us-ascii?Q?DLddKhuZK0Gk2IUM2sZ40a55J+Z98rxm/s5j5cmk3UhYtQydLxIWa1GCve1x?=
 =?us-ascii?Q?1sHFJNaL/yYXrWxTdSw7/FqgzfV3ScD0+v59TQ++STVarl03UlCtiSMahJFv?=
 =?us-ascii?Q?ahKeJgHusuoTIweJbe9FbuX8JwW6bLgEWWDbwsOXLJOs1JqWgT/N4tph0qJ/?=
 =?us-ascii?Q?em8MFuh501hMuumX5j8tZgaTDSU7HxvnjrMqUD1BZb3OFoK7TWMY4IZ6sm65?=
 =?us-ascii?Q?P++fkL9eZaWs7uw76Xnrg01dG826SrcoQXhWcteCl9XPebZiUxTX8xwofuLy?=
 =?us-ascii?Q?PxbXL78/femB4OhxB3QQFKDf3/7XJw89Qd8f7cnbkP4W+tHBAWquwLQ28yKc?=
 =?us-ascii?Q?xm7kx3mxaLQrNs2e69XcTr9DEeNDMOxrddFa8noaoktUnPFszV/H/VyyeBg4?=
 =?us-ascii?Q?SATC5SSBsFUOzdGoGE7fQnbyJAgdHOYV8Iwd3OO4t/g11Yd5Xmjh0OUAD22X?=
 =?us-ascii?Q?1WF0p0V2lGZJhyOHBBm9F8Cjcie+cL4NyOIy6GUxOs+493tceRE7/78KEC6n?=
 =?us-ascii?Q?2e/u90Z832gjFI2MsT24mmvyocgYVJtOW48g0p+lyberqLWAA/aZXPJbBc5s?=
 =?us-ascii?Q?cgTQCDmYDVV3I/xq9W9tousQFBkG2Ntk+sR6LMnfXD+rYK6sI8gdO0Ty4VXC?=
 =?us-ascii?Q?F3JYbD7xodc6wvuQQFL//Feu7qKE+WRnMXUJjOpXthAQ6OvUO8RBGje609vW?=
 =?us-ascii?Q?mCknW2MEtMAZ3wlwTr9cJVIvoTjRMSeCYzrs013GCc9NUhEdUUUP2Ze/Yjm4?=
 =?us-ascii?Q?ufdMbtr15Nhb8L8i/SDVOI5dhSS6wfkPElDLBW59UfF0MGqiupuqluVsTj7a?=
 =?us-ascii?Q?JphaeQsuwCTnWPg9onm0njMfuwQvUY2OkIiVis5L+q8AgmmliO/UPHKqS1LN?=
 =?us-ascii?Q?hEtpmj/I4zBaGqTmDzalhiR6d9vVbWVnhYi9+jl8lPjfv53UQLHZ6G9uECR8?=
 =?us-ascii?Q?9gzHqRdEAxiFvGusOvsyZqtTGPrjKG/R41aWD3YxHCbz3AUnM5+n7y8+qnwY?=
 =?us-ascii?Q?oiOQ1eGNaMUiZP6oGjRGgvrGiGTqIo/eHbWzditcGipSvdciwY4RSoTsxbH0?=
 =?us-ascii?Q?iJWi0PJtzKCuYRFJUfuvTdc9mKs0ziLWHEaNyO5U6Ef6urmcjwI60j4HNT86?=
 =?us-ascii?Q?bXIew5bNHz6HdKWX/7ykRLMzuI5DS8YXPrNAdkLiKKy84SBj5j+KVrPFnO36?=
 =?us-ascii?Q?0LXFiH7THsUlgauOM3pU4N2/1rb2f/s1qu+HJ+cGXJmvCD9WzE7Rr5sDP/04?=
 =?us-ascii?Q?2UPFgEn1klHQJQ2SESh820tLu6si4Fp8/Qg2z8ZoYYZiz9P7kLUm0QLclEpj?=
 =?us-ascii?Q?Ro0lPyNIP01UcCk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(10070799003)(8096899003)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BGqUs0qRTWMZyZdV6rJixQbFlCdmY1JbjLgtkHerXadsD5Go27qZ8h9sxLxt?=
 =?us-ascii?Q?tHwr3V4yN9DKlDRMLg9mkpNP6JgjDNexdfvVvdFdTjVPXjB2hkGlGRkyR436?=
 =?us-ascii?Q?Y9vt824LVP60PgIcMjqe0f927ndx7jTZbOv+VklqncZTRxaQvVbJf71yDKwt?=
 =?us-ascii?Q?pqBnLvTYSe886nqkVt02GUfa3pRqdWKSJyxFf/SOnLsPy/LCg8VVsikgOdbV?=
 =?us-ascii?Q?4+4AKaNghln4HOg/HFoLUxDKXo8bjRxLEKeVZJpbmDAvZB3q4i/dZ5BnOkMF?=
 =?us-ascii?Q?m8LCmzuV/zoR3Yl69aFb1uUUMncRZmS9X70H+QnZ6aDm2dkERwJAymSinPYS?=
 =?us-ascii?Q?W1bl8pUf41QUtJD0dSe6wVs5FO9xwD8ZetwFJDFbYooMrY3RBhyzWnR3XrFO?=
 =?us-ascii?Q?PQnI/YcwrFnHu/J/esRITq5GvE82XVHtLJk7oY9DidrvuV0Q3RlpLQT2IFPQ?=
 =?us-ascii?Q?5KoLbXqvokYeDsHSu/48qqdY4Fi4N4Z0Sx43rnb1+1QpKCkCSfE7hDepgSK2?=
 =?us-ascii?Q?M+0kKCXc+8ybIgvGdNPhX+C1o4XGzTkvysa9nqa1Ge/H3Ryy+Nwo1J7ojJ1H?=
 =?us-ascii?Q?hcYvnJxz0/pCmtoZrtmd3Xdu47sJDOvf9vHLADuXQT9aJhGRk1D8cswva7cA?=
 =?us-ascii?Q?gu9fBiKeuW0l0MUNHrrL9gVH7rnMmxXWyC8eNZ3l6KZJH5jLHurWuF2H1fbb?=
 =?us-ascii?Q?QK1Ai6xC1au7QMpuguRvRHIx1s1B881E3hJGKnags4UllthPQ1WpS9piI+yn?=
 =?us-ascii?Q?CP+ijScI8DCR6hVn7fKWIasXF9RfqTq3V5A6C2iVt8/Uv2Jifr8MGILw70eS?=
 =?us-ascii?Q?fnQ6xwPCr3eTaCWNhIU23m5ut7Ejg/HDQTEcOD+7uwIZNjzeOSoBT0U0bYLH?=
 =?us-ascii?Q?nFCs4ofODJUJGLlAmRQH1Xmqwk9StgwWN3wRe+WpGMAdTUPx1Cze1ASrv94q?=
 =?us-ascii?Q?urpuNk7Dos/3LkuwcRGIbWSzkx2FxbAcudRMZOGzy5XSzPYljEXnp/4ZkkG1?=
 =?us-ascii?Q?MMXIAXnN7LF15Tjgi1TggIFbH3xT9+HI6fY8X5KZ+r5WoML+Bz9ETwLIgvq5?=
 =?us-ascii?Q?bFrtLF6OVfd2s5XphLwNumDv/+lmkIeluQoxJCSMVbLUcCD96MlLKz6ED/Fs?=
 =?us-ascii?Q?mXwqGPA8kO0Q9nbTNcb73bhh8aGA4nv4vOEkRNfKaSjg+6rwaCRIr3NQ3Dwx?=
 =?us-ascii?Q?+y44ULZIszSJoDoXUioZGkk0jIG1rSYeJh06D2UDLLuX819W704RzdpZNiBE?=
 =?us-ascii?Q?L1g8DO7M7Y0ikLECEPsYvgw+S4bHZJq5jn/zD2sBLWHkcbHN17iumOPSDEgd?=
 =?us-ascii?Q?UfAZQjue7xoOI7Egmpw9pwx9E7EkMorTJgC70XdhPeD13isZzDr9RPKxjmSO?=
 =?us-ascii?Q?X/L1QR1IDcomRjSg9jltNIwGrTSEc/dx/4Qc4auFnFUcDw2RDHzEibOuxdNc?=
 =?us-ascii?Q?LKT/tSCD+ia4C5jRm5XV5X1WPYtGMqgs0rzd5d6cqOCXLGbpRT6hbtjIwcBd?=
 =?us-ascii?Q?J+q52GNvWJI0A260IcsoraxyohPJ7iQySInlLp+D1Am3awXiUWa1o5uuVSIH?=
 =?us-ascii?Q?zn+PwIwZBEMI/Q4UxBrB/iSXdb0M0bizkR4Q1XkqLITxi6YSP/2Bdpmca3Hm?=
 =?us-ascii?Q?luWDUPJAELMvZQ3eqa0GbnkrD2TMx58EIl1YPn3084CHwYUKzFSkkpooOJ77?=
 =?us-ascii?Q?QVsptw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PR3PR07MB6666ABA95030DF34F6DC0A208A872PR3PR07MB6666eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad784ff8-6381-453b-220a-08dd8619f785
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 06:00:24.0883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNa+MB5fgRa0KZ7PTjAOWuAULga4Emo1Xzg+aSpd4r2G/29S4jq6dQgctRUj+LqT67rRX8z8Rt/JlswVr3WXNQITo0Axv1mej7rWsPpFMyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8312
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 06:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215577

--_000_PR3PR07MB6666ABA95030DF34F6DC0A208A872PR3PR07MB6666eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I think is a data problem in the CVE information. From what I saw most of t=
he CVEs by the kernel CNA has "original_commit_for_fix"
Probably they will be a handful of CVE that will need manual intervention, =
or involve more parsing to resolve where the commit is in the kernel.
Or we could assume that if there is no original commit for fix, but there i=
s a major version that is unaffected, then we can assume that is fixed.

In this particular case for CVE-2024-46700 will be from 6.11

                    "versions": [
                        {
                            "version": "6.11",
                            "status": "affected"
                        },
                        {
                            "version": "0",
                            "lessThan": "6.11",
                            "status": "unaffected",
                            "versionType": "semver"
                        },
                        {
                            "version": "6.10.8",
                            "lessThanOrEqual": "6.10.*",
                            "status": "unaffected",
                            "versionType": "semver"
                        }

Best regards,
Daniel

-----Original Message-----
From: Gyorgy Sarvari <skandigraun@gmail.com>
Sent: Saturday, 26 April 2025 11:03
To: Daniel Turull <daniel.turull@ericsson.com>; openembedded-core@lists.ope=
nembedded.org; bruce.ashfield@gmail.com
Subject: Re: [OE-core] [PATCH 1/2] linux/generate-cve-exclusions: use data =
from CVEProject

[You don't often get email from skandigraun@gmail.com. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]

On 4/10/25 11:48, Daniel Turull via lists.openembedded.org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> The old script was relying on linuxkernelcves.com that was archived in
> May 2024 when kernel.org became a CNA.
>
> The new script reads CVE json files from the datadir that can be
> either from the official kernel.org CNA [1] or CVEProject [2]
>
> [1]
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit<h=
ttps://git/>.
> kernel.org%2Fpub%2Fscm%2Flinux%2Fsecurity%2Fvulns.git&data=3D05%7C02%7Cd
> aniel.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84
> cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782452012%7CUnknown%7CT
> WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI
> sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dc7iGjBRYMLeRXh84w
> 9NdryRbcuBhawJ6rb6GE%2B8QIxA%3D&reserved=3D0
> [2]
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith<=
https://gith/>
> ub.com%2FCVEProject%2FcvelistV5&data=3D05%7C02%7Cdaniel.turull%40ericsso
> n.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84cebfbfd47abbe52080c6b8
> 7953f%7C0%7C0%7C638812549782472181%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1
> hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUI
> joyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DXl98xn%2BkPpf2PlhbFAsaZ0a4o%2BB22ZGpfZG
> n0xCjs0A%3D&reserved=3D0
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../linux/generate-cve-exclusions.py          | 116 +++++++++++++-----
>  1 file changed, 85 insertions(+), 31 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py
> b/meta/recipes-kernel/linux/generate-cve-exclusions.py
> index aa9195aab4..82fb4264e3 100755
> --- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
> +++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
> @@ -1,7 +1,7 @@
>  #! /usr/bin/env python3
>
>  # Generate granular CVE status metadata for a specific version of the
> kernel -# using data from linuxkernelcves.com.
> +# using json data from cvelistV5 or vulns repository
>  #
>  # SPDX-License-Identifier: GPL-2.0-only
>
> @@ -9,7 +9,8 @@ import argparse
>  import datetime
>  import json
>  import pathlib
> -import re
> +import os
> +import glob
>
>  from packaging.version import Version
>
> @@ -25,22 +26,75 @@ def parse_version(s):
>          return Version(s)
>      return None
>
> +def get_fixed_versions(cve_info, base_version):
> +    '''
> +    Get fixed versionss
> +    '''
> +    first_affected =3D None
> +    fixed =3D None
> +    fixed_backport =3D None
> +    next_version =3D Version(str(base_version) + ".5000")
> +    for affected in cve_info["containers"]["cna"]["affected"]:
> +        # In case the CVE info is not complete, it might not have defaul=
t status and therefore
> +        # we don't know the status of this CVE.
> +        if not "defaultStatus" in affected:
> +            return first_affected, fixed, fixed_backport
> +        if affected["defaultStatus"] =3D=3D "affected":
> +            for version in affected["versions"]:
> +                v =3D Version(version["version"])
> +                if v =3D=3D 0:
> +                    #Skiping non-affected
> +                    continue
> +                if version["status"] =3D=3D "affected" and not first_aff=
ected:
> +                    first_affected =3D v
> +                elif (version["status"] =3D=3D "unaffected" and
> +                    version['versionType'] =3D=3D "original_commit_for_f=
ix"):
> +                    fixed =3D v
Is this part, the universally true? E.g. CVE-2024-46700 has been fixed sinc=
e 6.10.8, but the generated list indicates that there is no solution for it=
. Looking at the raw data, it lists the fix, but without the "original_comm=
it_for_fix" versionType. Is this a data problem, or a parsing one?
> +                elif base_version < v and v < next_version:
> +                    fixed_backport =3D v
> +        elif affected["defaultStatus"] =3D=3D "unaffected":
> +            # Only specific versions are affected. We care only about ou=
r base version
> +            if "versions" not in affected:
> +                continue
> +            for version in affected["versions"]:
> +                if "versionType" not in version:
> +                    continue
> +                if version["versionType"] =3D=3D "git":
> +                    continue
> +                v =3D Version(version["version"])
> +                # in case it is not in our base version
> +                less_than =3D Version(version["lessThan"])
> +
> +                if not first_affected:
> +                    first_affected =3D v
> +                    fixed =3D less_than
> +                if base_version < v and v < next_version:
> +                    first_affected =3D v
> +                    fixed =3D less_than
> +                    fixed_backport =3D less_than
> +
> +    return first_affected, fixed, fixed_backport
> +
> +def is_linux_cve(cve_info):
> +    '''Return true is the CVE belongs to Linux'''
> +    if not "affected" in cve_info["containers"]["cna"]:
> +        return False
> +    for affected in cve_info["containers"]["cna"]["affected"]:
> +        if not "product" in affected:
> +            return False
> +        if affected["product"] =3D=3D "Linux" and affected["vendor"] =3D=
=3D "Linux":
> +            return True
> +    return False
>
>  def main(argp=3DNone):
>      parser =3D argparse.ArgumentParser()
> -    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to =
a clone of https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgithub.com%2Fnluedtke%2Flinux_kernel_cves&data=3D05%7C02%7Cdaniel.turul=
l%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84cebfbfd47abbe520=
80c6b87953f%7C0%7C0%7C638812549782484768%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU=
1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyf=
Q%3D%3D%7C0%7C%7C%7C&sdata=3D0r9Baryo71lokma3ZdKM3aDGeOBnUsiyydC3S3y8FbI%3D=
&reserved=3D0")<https://github.com/nluedtke/linux_kernel_cves>
> +    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to =
a
> + clone of
> + https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi<=
https://gi/>
> + thub.com%2FCVEProject%2FcvelistV5&data=3D05%7C02%7Cdaniel.turull%40eri
> + csson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84cebfbfd47abbe520
> + 80c6b87953f%7C0%7C0%7C638812549782496794%7CUnknown%7CTWFpbGZsb3d8eyJ
> + FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
> + pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Ddy6LRJujWanl9uh%2F%2FMhjXAY
> + ujxHTSIyFHcd8HF%2FLgws%3D&reserved=3D0 or
> + https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi<=
https://gi/>
> + t.kernel.org%2Fpub%2Fscm%2Flinux%2Fsecurity%2Fvulns.git&data=3D05%7C02
> + %7Cdaniel.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7
> + C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782508741%7CUnk
> + nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO
> + iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DYgCHu
> + oq6QdQICOtN5Qjk3ItN6rV7gXamVKpXog%2BlLUA%3D&reserved=3D0")
>      parser.add_argument("version", type=3DVersion, help=3D"Kernel versio=
n
> number to generate data for, such as 6.1.38")
>
>      args =3D parser.parse_args(argp)
>      datadir =3D args.datadir
>      version =3D args.version
> -    base_version =3D f"{version.major}.{version.minor}"
> -
> -    with open(datadir / "data" / "kernel_cves.json", "r") as f:
> -        cve_data =3D json.load(f)
> -
> -    with open(datadir / "data" / "stream_fixes.json", "r") as f:
> -        stream_data =3D json.load(f)
> +    base_version =3D Version(f"{version.major}.{version.minor}")
>
>      print(f"""
>  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> @@ -55,17 +109,23 @@ python check_kernel_cve_status_version() {{
> do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
>  """)
>
> -    for cve, data in cve_data.items():
> -        if "affected_versions" not in data:
> -            print(f"# Skipping {cve}, no affected_versions")
> -            print()
> -            continue
> +    # Loop though all CVES and check if they are kernel related, newer t=
han 2015
> +    pattern =3D os.path.join(datadir, '**', "CVE-20*.json")
>
> -        affected =3D data["affected_versions"]
> -        first_affected, fixed =3D re.search(r"(.+) to (.+)", affected).g=
roups()
> -        first_affected =3D parse_version(first_affected)
> -        fixed =3D parse_version(fixed)
> +    files =3D glob.glob(pattern, recursive=3DTrue)
> +    for cve_file in sorted(files):
> +        # Get CVE Id
> +        cve =3D cve_file[cve_file.rfind("/")+1:cve_file.rfind(".json")]
> +        # We process from 2015 data, old request are not properly format=
ed
> +        year =3D cve.split("-")[1]
> +        if int(year) < 2015:
> +            continue
> +        with open(cve_file, 'r', encoding=3D'utf-8') as json_file:
> +            cve_info =3D json.load(json_file)
>
> +        if not is_linux_cve(cve_info):
> +            continue
> +        first_affected, fixed, backport_ver =3D
> + get_fixed_versions(cve_info, base_version)
>          if not fixed:
>              print(f"# {cve} has no known resolution")
>          elif first_affected and version < first_affected:
> @@ -75,19 +135,13 @@ do_cve_check[prefuncs] +=3D "check_kernel_cve_status=
_version"
>                  f'CVE_STATUS[{cve}] =3D "fixed-version: Fixed from versi=
on {fixed}"'
>              )
>          else:
> -            if cve in stream_data:
> -                backport_data =3D stream_data[cve]
> -                if base_version in backport_data:
> -                    backport_ver =3D Version(backport_data[base_version]=
["fixed_version"])
> -                    if backport_ver <=3D version:
> -                        print(
> -                            f'CVE_STATUS[{cve}] =3D "cpe-stable-backport=
: Backported in {backport_ver}"'
> -                        )
> -                    else:
> -                        # TODO print a note that the kernel needs bumpin=
g
> -                        print(f"# {cve} needs backporting (fixed from {b=
ackport_ver})")
> +            if backport_ver:
> +                if backport_ver <=3D version:
> +                    print(
> +                        f'CVE_STATUS[{cve}] =3D "cpe-stable-backport: Ba=
ckported in {backport_ver}"'
> +                    )
>                  else:
> -                    print(f"# {cve} needs backporting (fixed from {fixed=
})")
> +                    print(f"# {cve} needs backporting (fixed from
> + {backport_ver})")
>              else:
>                  print(f"# {cve} needs backporting (fixed from
> {fixed})")
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214634):
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist<=
https://list/>
> s.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F214634&data=3D05%
> 7C02%7Cdaniel.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099
> %7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782520520%7CUnk
> nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DN%2FajC%2
> BwaxgTyd5D2DAbsA182aWoqI0dlEF96UKH6cE0%3D&reserved=3D0
> Mute This Topic:
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist<=
https://list/>
> s.openembedded.org%2Fmt%2F112188268%2F6084445&data=3D05%7C02%7Cdaniel.tu
> rull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84cebfbfd4
> 7abbe52080c6b87953f%7C0%7C0%7C638812549782532455%7CUnknown%7CTWFpbGZsb
> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjo
> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dx03Wd8taSus7Zj8PBuFrIYuQz
> rF2WIvYlpN%2F9nPoouo%3D&reserved=3D0
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist<=
https://list/>
> s.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C02%7Cdani
> el.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84ceb
> fbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782544122%7CUnknown%7CTWFp
> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk
> FOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxlzCTPsysHzP%2FD8Qas
> qif1ZEedwv5Rpwvy7jkZhLBPA%3D&reserved=3D0 [skandigraun@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_PR3PR07MB6666ABA95030DF34F6DC0A208A872PR3PR07MB6666eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Hi,<br>
I think is a data problem in the CVE information. From what I saw most of t=
he CVEs by the kernel CNA has &quot;original_commit_for_fix&quot;<br>
Probably they will be a handful of CVE that will need manual intervention, =
or involve more parsing to resolve where the commit is in the kernel.<br>
Or we could assume that if there is no original commit for fix, but there i=
s a major version that is unaffected, then we can assume that is fixed.<br>
<br>
In this particular case for CVE-2024-46700 will be from 6.11<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;versions&quot;: [<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;version&quot;: &quot;6.11&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;status&quot;: &quot;affected&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;version&quot;: &quot;0&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;lessThan&quot;: &quot;6.11&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;status&quot;: &quot;unaffected&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;versionType&quot;: &quot;semver&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;version&quot;: &quot;6.10.8&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;lessThanOrEqual&quot;: &quot;6.10.*&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;status&quot;: &quot;unaffected&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;versionType&quot;: &quot;semver&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Best regards,<br>
Daniel<br>
<br>
-----Original Message-----<br>
From: Gyorgy Sarvari &lt;skandigraun@gmail.com&gt;<br>
Sent: Saturday, 26 April 2025 11:03<br>
To: Daniel Turull &lt;daniel.turull@ericsson.com&gt;; openembedded-core@lis=
ts.openembedded.org; bruce.ashfield@gmail.com<br>
Subject: Re: [OE-core] [PATCH 1/2] linux/generate-cve-exclusions: use data =
from CVEProject<br>
<br>
[You don't often get email from skandigraun@gmail.com. Learn why this is im=
portant at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a>&nbsp;]<br>
<br>
On 4/10/25 11:48, Daniel Turull via lists.openembedded.org wrote:<br>
&gt; From: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt;<br>
&gt; The old script was relying on linuxkernelcves.com that was archived in=
<br>
&gt; May 2024 when kernel.org became a CNA.<br>
&gt;<br>
&gt; The new script reads CVE json files from the datadir that can be<br>
&gt; either from the official kernel.org CNA [1] or CVEProject [2]<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"https://git/">https://eur02.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgit</a>.<br>
&gt; kernel.org%2Fpub%2Fscm%2Flinux%2Fsecurity%2Fvulns.git&amp;data=3D05%7C=
02%7Cd<br>
&gt; aniel.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84=
<br>
&gt; cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782452012%7CUnknown%7CT=
<br>
&gt; WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI=
<br>
&gt; sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dc7iGjBRYMLe=
RXh84w<br>
&gt; 9NdryRbcuBhawJ6rb6GE%2B8QIxA%3D&amp;reserved=3D0<br>
&gt; [2]<br>
&gt; <a href=3D"https://gith/">https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fgith</a><br>
&gt; ub.com%2FCVEProject%2FcvelistV5&amp;data=3D05%7C02%7Cdaniel.turull%40e=
ricsso<br>
&gt; n.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84cebfbfd47abbe52080c6b8=
<br>
&gt; 7953f%7C0%7C0%7C638812549782472181%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1=
<br>
&gt; hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUI=
<br>
&gt; joyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DXl98xn%2BkPpf2PlhbFAsaZ0a4o%2BB22=
ZGpfZG<br>
&gt; n0xCjs0A%3D&amp;reserved=3D0<br>
&gt;<br>
&gt; Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../linux/generate-cve-exclusions.py&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 116 +++++++++++++-----<br>
&gt;&nbsp; 1 file changed, 85 insertions(+), 31 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py<br>
&gt; b/meta/recipes-kernel/linux/generate-cve-exclusions.py<br>
&gt; index aa9195aab4..82fb4264e3 100755<br>
&gt; --- a/meta/recipes-kernel/linux/generate-cve-exclusions.py<br>
&gt; +++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;&nbsp; #! /usr/bin/env python3<br>
&gt;<br>
&gt;&nbsp; # Generate granular CVE status metadata for a specific version o=
f the<br>
&gt; kernel -# using data from linuxkernelcves.com.<br>
&gt; +# using json data from cvelistV5 or vulns repository<br>
&gt;&nbsp; #<br>
&gt;&nbsp; # SPDX-License-Identifier: GPL-2.0-only<br>
&gt;<br>
&gt; @@ -9,7 +9,8 @@ import argparse<br>
&gt;&nbsp; import datetime<br>
&gt;&nbsp; import json<br>
&gt;&nbsp; import pathlib<br>
&gt; -import re<br>
&gt; +import os<br>
&gt; +import glob<br>
&gt;<br>
&gt;&nbsp; from packaging.version import Version<br>
&gt;<br>
&gt; @@ -25,22 +26,75 @@ def parse_version(s):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Version(s=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return None<br>
&gt;<br>
&gt; +def get_fixed_versions(cve_info, base_version):<br>
&gt; +&nbsp;&nbsp;&nbsp; '''<br>
&gt; +&nbsp;&nbsp;&nbsp; Get fixed versionss<br>
&gt; +&nbsp;&nbsp;&nbsp; '''<br>
&gt; +&nbsp;&nbsp;&nbsp; first_affected =3D None<br>
&gt; +&nbsp;&nbsp;&nbsp; fixed =3D None<br>
&gt; +&nbsp;&nbsp;&nbsp; fixed_backport =3D None<br>
&gt; +&nbsp;&nbsp;&nbsp; next_version =3D Version(str(base_version) + &quot=
;.5000&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp; for affected in cve_info[&quot;containers&quot;][&=
quot;cna&quot;][&quot;affected&quot;]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # In case the CVE info is =
not complete, it might not have default status and therefore<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # we don't know the status=
 of this CVE.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not &quot;defaultStatus=
&quot; in affected:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn first_affected, fixed, fixed_backport<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if affected[&quot;defaultS=
tatus&quot;] =3D=3D &quot;affected&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r version in affected[&quot;versions&quot;]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; v =3D Version(version[&quot;version&quot;])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if v =3D=3D 0:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #Skiping non-affected<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if version[&quot;status&quot;] =3D=3D &quot;affected&=
quot; and not first_affected:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_affected =3D v<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; elif (version[&quot;status&quot;] =3D=3D &quot;unaffe=
cted&quot; and<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version['versionType'] =3D=3D=
 &quot;original_commit_for_fix&quot;):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed =3D v<br>
Is this part, the universally true? E.g. CVE-2024-46700 has been fixed sinc=
e 6.10.8, but the generated list indicates that there is no solution for it=
. Looking at the raw data, it lists the fix, but without the &quot;original=
_commit_for_fix&quot; versionType. Is this
 a data problem, or a parsing one?<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; elif base_version &lt; v and v &lt; next_version:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed_backport =3D v<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif affected[&quot;defaul=
tStatus&quot;] =3D=3D &quot;unaffected&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
Only specific versions are affected. We care only about our base version<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 &quot;versions&quot; not in affected:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; continue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r version in affected[&quot;versions&quot;]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if &quot;versionType&quot; not in version:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if version[&quot;versionType&quot;] =3D=3D &quot;git&=
quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; v =3D Version(version[&quot;version&quot;])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # in case it is not in our base version<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; less_than =3D Version(version[&quot;lessThan&quot;])<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if not first_affected:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_affected =3D v<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed =3D less_than<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if base_version &lt; v and v &lt; next_version:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_affected =3D v<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed =3D less_than<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed_backport =3D less_than<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return first_affected, fixed, fixed_backport<br>
&gt; +<br>
&gt; +def is_linux_cve(cve_info):<br>
&gt; +&nbsp;&nbsp;&nbsp; '''Return true is the CVE belongs to Linux'''<br>
&gt; +&nbsp;&nbsp;&nbsp; if not &quot;affected&quot; in cve_info[&quot;cont=
ainers&quot;][&quot;cna&quot;]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return False<br>
&gt; +&nbsp;&nbsp;&nbsp; for affected in cve_info[&quot;containers&quot;][&=
quot;cna&quot;][&quot;affected&quot;]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not &quot;product&quot;=
 in affected:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn False<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if affected[&quot;product&=
quot;] =3D=3D &quot;Linux&quot; and affected[&quot;vendor&quot;] =3D=3D &qu=
ot;Linux&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn True<br>
&gt; +&nbsp;&nbsp;&nbsp; return False<br>
&gt;<br>
&gt;&nbsp; def main(argp=3DNone):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser =3D argparse.ArgumentParser()<br>
&gt; -&nbsp;&nbsp;&nbsp; parser.add_argument(&quot;datadir&quot;, type=3Dpa=
thlib.Path, help=3D&quot;Path to a clone of
<a href=3D"https://github.com/nluedtke/linux_kernel_cves">https://eur02.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnluedtke%2F=
linux_kernel_cves&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7Cd67bf=
63bfe764e1b689208dd84a12099%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63=
8812549782484768%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLj=
AuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp=
;sdata=3D0r9Baryo71lokma3ZdKM3aDGeOBnUsiyydC3S3y8FbI%3D&amp;reserved=3D0&qu=
ot;)</a><br>
&gt; +&nbsp;&nbsp;&nbsp; parser.add_argument(&quot;datadir&quot;, type=3Dpa=
thlib.Path, help=3D&quot;Path to a<br>
&gt; + clone of<br>
&gt; + <a href=3D"https://gi/">https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fgi</a><br>
&gt; + thub.com%2FCVEProject%2FcvelistV5&amp;data=3D05%7C02%7Cdaniel.turull=
%40eri<br>
&gt; + csson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84cebfbfd47abbe520=
<br>
&gt; + 80c6b87953f%7C0%7C0%7C638812549782496794%7CUnknown%7CTWFpbGZsb3d8eyJ=
<br>
&gt; + FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF=
<br>
&gt; + pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Ddy6LRJujWanl9uh%2F%2F=
MhjXAY<br>
&gt; + ujxHTSIyFHcd8HF%2FLgws%3D&amp;reserved=3D0 or<br>
&gt; + <a href=3D"https://gi/">https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fgi</a><br>
&gt; + t.kernel.org%2Fpub%2Fscm%2Flinux%2Fsecurity%2Fvulns.git&amp;data=3D0=
5%7C02<br>
&gt; + %7Cdaniel.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7=
<br>
&gt; + C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782508741%7CUnk=
<br>
&gt; + nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO=
<br>
&gt; + iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=
=3DYgCHu<br>
&gt; + oq6QdQICOtN5Qjk3ItN6rV7gXamVKpXog%2BlLUA%3D&amp;reserved=3D0&quot;)<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser.add_argument(&quot;version&quot;,=
 type=3DVersion, help=3D&quot;Kernel version<br>
&gt; number to generate data for, such as 6.1.38&quot;)<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args =3D parser.parse_args(argp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; datadir =3D args.datadir<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version =3D args.version<br>
&gt; -&nbsp;&nbsp;&nbsp; base_version =3D f&quot;{version.major}.{version.m=
inor}&quot;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp; with open(datadir / &quot;data&quot; / &quot;kerne=
l_cves.json&quot;, &quot;r&quot;) as f:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data =3D json.load(f)<=
br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp; with open(datadir / &quot;data&quot; / &quot;strea=
m_fixes.json&quot;, &quot;r&quot;) as f:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stream_data =3D json.load(=
f)<br>
&gt; +&nbsp;&nbsp;&nbsp; base_version =3D Version(f&quot;{version.major}.{v=
ersion.minor}&quot;)<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(f&quot;&quot;&quot;<br>
&gt;&nbsp; # Auto-generated CVE metadata, DO NOT EDIT BY HAND.<br>
&gt; @@ -55,17 +109,23 @@ python check_kernel_cve_status_version() {{&nbsp;=
<br>
&gt; do_cve_check[prefuncs] +=3D &quot;check_kernel_cve_status_version&quot=
;<br>
&gt;&nbsp; &quot;&quot;&quot;)<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp; for cve, data in cve_data.items():<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;affected_versions=
&quot; not in data:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr=
int(f&quot;# Skipping {cve}, no affected_versions&quot;)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr=
int()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
ntinue<br>
&gt; +&nbsp;&nbsp;&nbsp; # Loop though all CVES and check if they are kerne=
l related, newer than 2015<br>
&gt; +&nbsp;&nbsp;&nbsp; pattern =3D os.path.join(datadir, '**', &quot;CVE-=
20*.json&quot;)<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; affected =3D data[&quot;af=
fected_versions&quot;]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_affected, fixed =3D =
re.search(r&quot;(.+) to (.+)&quot;, affected).groups()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_affected =3D parse_v=
ersion(first_affected)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed =3D parse_version(fi=
xed)<br>
&gt; +&nbsp;&nbsp;&nbsp; files =3D glob.glob(pattern, recursive=3DTrue)<br>
&gt; +&nbsp;&nbsp;&nbsp; for cve_file in sorted(files):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Get CVE Id<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve =3D cve_file[cve_file.=
rfind(&quot;/&quot;)+1:cve_file.rfind(&quot;.json&quot;)]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # We process from 2015 dat=
a, old request are not properly formated<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; year =3D cve.split(&quot;-=
&quot;)[1]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if int(year) &lt; 2015:<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
ntinue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(cve_file, 'r', e=
ncoding=3D'utf-8') as json_file:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_info =3D json.load(json_file)<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not is_linux_cve(cve_in=
fo):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
ntinue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_affected, fixed, bac=
kport_ver =3D<br>
&gt; + get_fixed_versions(cve_info, base_version)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not fixed:<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; print(f&quot;# {cve} has no known resolution&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif first_affec=
ted and version &lt; first_affected:<br>
&gt; @@ -75,19 +135,13 @@ do_cve_check[prefuncs] +=3D &quot;check_kernel_cv=
e_status_version&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f'CVE_STATUS[{cve}] =3D &quot;fixed-version=
: Fixed from version {fixed}&quot;'<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; )<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 cve in stream_data:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; backport_data =3D stream_data[cve]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if base_version in backport_data:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backport_ver =3D Version(back=
port_data[base_version][&quot;fixed_version&quot;])<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if backport_ver &lt;=3D versi=
on:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print=
(<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; f'CVE_STATUS[{cve}] =3D &quot;cpe-stable-backport: Backp=
orted in {backport_ver}&quot;'<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # TOD=
O print a note that the kernel needs bumping<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print=
(f&quot;# {cve} needs backporting (fixed from {backport_ver})&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 backport_ver:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if backport_ver &lt;=3D version:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f'CVE=
_STATUS[{cve}] =3D &quot;cpe-stable-backport: Backported in {backport_ver}&=
quot;'<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(f&quot;# {cve} needs ba=
ckporting (fixed from {fixed})&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(f&quot;# {cve} needs ba=
ckporting (fixed from<br>
&gt; + {backport_ver})&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; else:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(f&quot;# {cve} needs backporting (fix=
ed from<br>
&gt; {fixed})&quot;)<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#214634):<br>
&gt; <a href=3D"https://list/">https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flist</a><br>
&gt; s.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F214634&amp;data=
=3D05%<br>
&gt; 7C02%7Cdaniel.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099=
<br>
&gt; %7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782520520%7CUnk=
<br>
&gt; nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ=
<br>
&gt; XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DN%2=
FajC%2<br>
&gt; BwaxgTyd5D2DAbsA182aWoqI0dlEF96UKH6cE0%3D&amp;reserved=3D0<br>
&gt; Mute This Topic:<br>
&gt; <a href=3D"https://list/">https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flist</a><br>
&gt; s.openembedded.org%2Fmt%2F112188268%2F6084445&amp;data=3D05%7C02%7Cdan=
iel.tu<br>
&gt; rull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84cebfbfd4=
<br>
&gt; 7abbe52080c6b87953f%7C0%7C0%7C638812549782532455%7CUnknown%7CTWFpbGZsb=
<br>
&gt; 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjo=
<br>
&gt; iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dx03Wd8taSus7Zj8PBuF=
rIYuQz<br>
&gt; rF2WIvYlpN%2F9nPoouo%3D&amp;reserved=3D0<br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://list/">https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flist</a><br>
&gt; s.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C02%=
7Cdani<br>
&gt; el.turull%40ericsson.com%7Cd67bf63bfe764e1b689208dd84a12099%7C92e84ceb=
<br>
&gt; fbfd47abbe52080c6b87953f%7C0%7C0%7C638812549782544122%7CUnknown%7CTWFp=
<br>
&gt; bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk=
<br>
&gt; FOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DxlzCTPsysHzP%2=
FD8Qas<br>
&gt; qif1ZEedwv5Rpwvy7jkZhLBPA%3D&amp;reserved=3D0 [skandigraun@gmail.com]<=
br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</body>
</html>

--_000_PR3PR07MB6666ABA95030DF34F6DC0A208A872PR3PR07MB6666eurp_--

