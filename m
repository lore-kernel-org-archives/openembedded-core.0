Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF24C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:06:14 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34551.1787832373251565969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 05:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=QQLFbGFV;
 spf=pass (domain: est.tech, ip: 40.107.162.27, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWz5ijajNbHvd0l9mDcCNb7d46bFQqdf4aAOQTQQgLxzO8bMjsTBcLKwSkK55SgurBR5ctCHHNsYciKCWnM8ctMJKLa06FEq/lIufji/mkNTWx7AhNfgPpASB6W5yMegsM5DvrDrHaPZeHN762u/8rYuqUXV4V8qPbFtbNJMBSiW3maVPV2UeK/gDAZO68Pfi0a25cq2Jnhkp9ZEt2m9a6PaoyMhuGQia5vA+XO72WX5v+kxLaG+OTsA7opbhgdjSBiyi/oPQ40OGx1BNNtJmLJeg5KBY6tXX7gYt4TgEK3Az9B9nKklIWDHygoHslmBGnLqRlrG9Fft0/2f1kG9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zLRzQfZPj6Ypw2q0Xa7BDUPw1vEUcnE3DIY5XHz9DE=;
 b=Fxsd1waMdNz3UOGoo/GhGgWRVdVQZSzRz5UFnuLceA3UyclXXNUY6gS+x5qUgDg5qQ5/dUf3Cnj+oIZsBgSbZ1SExEsFdydG3KNDtLsBVS9y/1wsGoqSO2KqKnQ6CfFKAzE5Sq9s06v0le1OQi4cJ31c7/9ZHpAq0zBR9Y1/DVbAhYTpCIvEgyT9Mv6PVHcWlvPqZsab9TGQ+9strMsIetOQVA4iJogc2C0XMj39UlU5k0GlHioehS2smsKz6EWamTXq8DqmHhd1JO7udXJ+tpfrdPZZDS/kDQnx7L6Gzyfz1yX2BOXQ+xvvlJgs7H9tDDQ4dD3qRMLSA0c6jm3neA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zLRzQfZPj6Ypw2q0Xa7BDUPw1vEUcnE3DIY5XHz9DE=;
 b=QQLFbGFVQgGJp5zYkkUA0j6lyHB0lOVUrgIYLWu9lioMWuyJ36TMGqtTlGKKJCEo65aL3XATeWlYKbKAwffgEKN1dPK5EdfG07Scwyafw81UB7hEDwMvSiNtyrOr581dK/MGlvhiTj3C/JhCob4l5T6QIlfVtqJvMe+ZPQtLEV5u2McpEeEdvNXtBXeAPxgi+4GS1QFHPfzykJBMaFVYEOmV3LNIK7cUICh99rU8LfLTC43eFFGJ606E38bGOXW6+oV8z7J+xGj4Ouiis3V6jtPqF8+yU6aD5X0JMDEtJ/LYZfZOyL0LmCbTvclIafm9kvQpjtyHMYsZ7FpCsbdTKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3565.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 12:06:08 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 12:06:07 +0000
Message-ID: <f7f7ba2e-3630-4020-9b1d-4ed22169ac72@est.tech>
Date: Thu, 27 Aug 2026 14:06:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC v4 1/6] openssl: upgrade 3.5.7 -> 4.0.1
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-2-jaipaul.cheernam@est.tech>
 <CAMKF1srbmfWVAsLs0VFn00e9enhEhYjZQwWj21JQ8w3qiuV9eA@mail.gmail.com>
 <CAMKF1soam_e0bWKgqVUde_nG7iMjVwC9fue+5q2h=DJ=FSVMXQ@mail.gmail.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <CAMKF1soam_e0bWKgqVUde_nG7iMjVwC9fue+5q2h=DJ=FSVMXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3565:EE_
X-MS-Office365-Filtering-Correlation-Id: a49adab3-3263-47c8-3cae-08df043393b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2DNjZ92/dgOzAAqPLjVFG+CxQ+9nvw+oKXlLYVACZuuaPKBjI3Cu5KURYHUiBZXMUNdgjVVYZs8M8wVRs0Fmbj2Jsbi4SPrTdDqQyfF4bro/q1UbolKG+h3IEpovjFVwLfCr++tnTPdsyYinE9WsugewDg43psjCddvVEU+JOQ+nYfOBo8sLTTHC2ageBVqrv6kmYcQEatke/iacwDWe2pFbaMPlVuUsfOdmHJsOEAjEMhjHS2PFbko9brsGCLDXiDvP9OXHI50/AB3Fv8KgnYY3+714xu2R2tx8b3UFdtX6Tn87Lk5wlW1cFzj2K533IAk72lL4Ytr083KXeCutmaEzCgY4rpZ8aTnkmUxIqZL6Y3tLImTSgWwe8dYNJrX+gmnvMpTUo5uiKx060a7nD1J3NMXbba5FLmmgvgfHYZGJJMrZ4k1AJWPy+RxBzOG5afEoQWQ24001IeajAI+buLnSd28P7/BmTSjdIgdG3rx4jevSzbxauheCQ0+GR5AUHQ3TCzb4GXcNzXsTwp0kqqszlVmvTvh4Zfn7YH9qfwXOpUhV0zHU2lvZ5/mODa+gN8+i9u4E8Ly2enAIjtWarqgC4IE9Xi2UJsliJGwpOWJbstxAuLDYXRwbRw3zaZbd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r6eQJgMD8HEUX40+YoF0VhgZG2j+K7RVGOw1LI0sKknvCO6KyzPz/B7h23hu?=
 =?us-ascii?Q?I8Q6FWle+XUPV/7OisrJf6UTmzUPczzD6IKvEpO2u/D9RXuXw+0S4Wvr81ba?=
 =?us-ascii?Q?FISgoGoFJsgYW/yYGVBFkmXIBDxnyzWfQHWQm2JC5gl1oHQBrv2GnZXjC+TR?=
 =?us-ascii?Q?ewF5YhrTI12Alh3dahfs26eB8YRibsG/C6mk3ude0ruvFgFszxVXnZIgct+U?=
 =?us-ascii?Q?bj8gWe/BVu6XkTgISDj2U8NghgWafyKCSQjLIDvTm4SUxMPeKEYp9ZXnPnR4?=
 =?us-ascii?Q?KO+MeY4R1h4Iwf7H+j4dawcIDfP18OtQXR+J25P0Tg5EbVdWAoVtiZnDZD6r?=
 =?us-ascii?Q?VWUCZdncFMSSrbZgsp0EVbIngsIDD6rPm9/GjdEjeRxhuUQ9JJRUxR1FjSvR?=
 =?us-ascii?Q?RxZIsRJubtQ7GuXw3oeR9Fjc8hHncYtpnX+YWoDxMNj6ivDPPM730mppGLXs?=
 =?us-ascii?Q?MHT/T5wH3B7SEvN9Yipf74ED8OdCrMFO9QPXqfkGAZf5AppDXvfs0zfYowkj?=
 =?us-ascii?Q?uj2cO549D8KEESPBAppcwdCxqjtlaJ9jW0Ua4154mPJXh+aUQADegeonHVj5?=
 =?us-ascii?Q?L/sPmV+l8j6NjdRaK3dag8wI0rFigACfXn+j9iIy4JGrlgVtFfT1zONnp8lf?=
 =?us-ascii?Q?2F320ppL0o8PHvnBre+nij6bpuW4IYGao7dIsMwUhFh7PGAIlP+McLJXZxFJ?=
 =?us-ascii?Q?zJpI9A9T16BGiP4N6pmIYSACN5u+NilCb3w0KY2Hfs/ojVesanZ43tBPnPTo?=
 =?us-ascii?Q?aXSIfxYEGgotreu7zPorSZJzlmqj0JHtlr6oQZj32DRDobwREH2UASwUO4t0?=
 =?us-ascii?Q?8EeCrc4m9JpqQrKw7upwmdvIkFwF5d3SySYo/kYSjkjARXrHDDc6IF9Pagao?=
 =?us-ascii?Q?71B/qUxOv0KEdtt1TOdLSq3twK3TE+bbQwlosfGKJ899KcRzIBZFZxpucSaw?=
 =?us-ascii?Q?JVkseAvZnpWZO4n74e6gtqPUvKcb8j3k1TrG8RetphEyX+46d+kNjSwV0y/k?=
 =?us-ascii?Q?j6Kxzbv6f7Xo7A2j4QLiDHvxBZhkCsC6Cp2ItRvPVTX8GytriAv3niUP9JNj?=
 =?us-ascii?Q?GxImgJiGYSh36kr0we+iddNKfq8bcfN7zz2UMMC8KaLSo4ET+YPs3uOKtvmH?=
 =?us-ascii?Q?IdCBqLcXDcuSetR+mW+23GDtVlYXgWMroZXb8D+SEJrQg2AC6Upgc5M9bIY8?=
 =?us-ascii?Q?qE37MmskxfdnH2c2DP8dZ8+A8YCaAwnoQR6e/CYF2hJBRMGn/tidYhW/H71o?=
 =?us-ascii?Q?SqGuV6FyNIC/TRRKo4erCvyZF7xv5WL5CaOC1vwZqmuaUwK3x5YV7V4szN0M?=
 =?us-ascii?Q?RV2OvDjl03AL5ER0H0kPIw+ZwDLI1eZia3QegGS95j4kmBW8xXwI2avPbvJt?=
 =?us-ascii?Q?xEUY74ME8J79BV123CDGb6M5pTdgLsU0rhimwrS792+7h17m4MSgUum9QPGW?=
 =?us-ascii?Q?IObzSZGxgW/jfPxlf174wJo3MdxJMbOdiBP9gDRQwsvoeNFqiT5T5XZBX7Ek?=
 =?us-ascii?Q?bAoWPphdurEGe6TNMOHTSyOPavF/S6GA8SC28pf8v0K9EPHhtZaU4Iz/tYct?=
 =?us-ascii?Q?OjIqSlQdLsWTzsykjHeQYztIdj5jX28PrSHrWvyDY12ypvNet3AEz/5pfQ/v?=
 =?us-ascii?Q?DAJInKMkp3xFoGXlFmh4GKbPAo36zmnLH7z6wsWTd7aVBBuCXQ7VS1Hb5h9Y?=
 =?us-ascii?Q?6XUf+kxbGfEbSgsOrDz6vQ5F8pABKe3TgIxoLZpgQhfONgM09XOydQShSYTy?=
 =?us-ascii?Q?mwj0yHwByQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a49adab3-3263-47c8-3cae-08df043393b2
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 12:06:07.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rw4Chu4DdB+EYeNWewKfYS1GbQUut4ipWqx1CJdxEm2C+6NBLh0//rgof5C106Sdz7lrIg7D30B4FSTdNmuVvK2/Ks7vjeI2t4VaqPmja10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 12:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244481


On 2026-08-23 08:57, Khem Raj wrote:
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8474313/raw_inl=
ine
 =C2=A0Tested bitbake world -k with OpenSSL 4.0.1 upgrade across
 =C2=A0 meta-oe, meta-networking, meta-python, meta-perl, meta-multimedia,
 =C2=A0 meta-xfce, meta-initramfs, meta-filesystems.

 =C2=A0 22 recipes fixed =E2=80=94 patches provided, all with upstream refe=
rences.

 =C2=A0 13 recipes still broken:

 =C2=A0 ENGINE API removed (needs Provider API rewrite):

 =C2=A0 - imx-cst =E2=80=94 NXP proprietary, no public upstream
 =C2=A0 - extract-cert =E2=80=94 needs Provider API migration

 =C2=A0 Dead/unmaintained upstream:

 =C2=A0 - wvstreams/wvdial =E2=80=94 archived 2018, dial-up modem dialer
 =C2=A0 - ntp (classic) =E2=80=94 EOL 2023, recommend chrony
 =C2=A0 - loudmouth =E2=80=94 last activity 2019

 =C2=A0 No upstream fix available:

 =C2=A0 - ldns =E2=80=94 heavy deprecated API usage (issue #243 open since =
2024)
 =C2=A0 - unbound =E2=80=94 upstream PR #1437 attempted, closed
 =C2=A0 - softhsm =E2=80=94 upstream PR #882 in progress
 =C2=A0 - ipmiutil =E2=80=94 no upstream fix found
 =C2=A0 - synergy =E2=80=94 TLS methods removed, repo archived
 =C2=A0 - spdm-emu =E2=80=94 depends on libspdm abstraction


 =C2=A0 - mercurial =E2=80=94 Python 3.14 + OpenSSL 4.0 reports TLS 1.2 as=
=20
unavailable (upstream CPython limitation, only Python 3.15 officially=20
supports OpenSSL 4.0)

https://bugzilla.redhat.com/show_bug.cgi?id=3D2494735

https://github.com/python/cpython/issues/152709


 =C2=A0 3 upstream PRs submitted by us: ntopng (merged), thrift, snort3

