Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25EBCD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 13:11:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36083.1779369118602703341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 06:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=MUGOuf3S;
 spf=pass (domain: cherry.de, ip: 52.101.70.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yG0G3ngit0T2FMJGEeDulnGLzTLg3FzzbZeeERMFaZJGHEn+Z4oGUcKMElrL3uTkour3QjgsVruR4UuISdbNTc4QAR54XNv90DNj6uQGcbsnDQD/YbiDoOXM09TwIGDyObCdH0TLwa6kcoGiYAPrN1dBwFUV26HOZlyw5ihBog5N/t8+bhPJOeSAGP7C6yAxdnvkNW1V5PdelK3qoDT7QVySRgdrm2Q2qgBWKS519mqwEJKu1ZRWh3S73Q5g1Msel1kq/UVkx0TGKOmoJRl/8jY2Mn5Wt2sIS0/+M5xHeO0++DYQC1adDAUKazJGELj2DAMKPDu6k1u9zEV6/hFkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlERozvHxJlmCYOBt1Q5yGwh7zL6Cub0xizut2j703c=;
 b=JY1PudI5LXuDfql8lJGklQeaQmGKEObL77koLMyLqRSpX5Z3xpO6mTUzFSome5COicJr4oxJSokeuGf4HGtIWQeEmbGQEBClE/Tv2GIOSWEsfTWbk/uwfIlcCcK2I210M2I4/m6fDNYVzFpB8fcdp8EUFQQTYJj2B6j5XjY5WUJonHlswBuqo9mEIbCsTxkTcImeSzEeOgs6GLVk/fEkTofZQhjoExRUl9vRMQZZO1/DsSYASzsmcth7qAqnWwnBZ7Iqx0qyS6Ox+moXw8jDelYdjKlMec8ymCDnkKG0WSVVtbMzTqTHOTL8A/yLe3gXyoVpt6NrhZhHIgtU2ZqKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlERozvHxJlmCYOBt1Q5yGwh7zL6Cub0xizut2j703c=;
 b=MUGOuf3SBD08OXDunNVLLfoECZUAGYgZfyAqadqxXXNbIuBwNKnoApintBSKr3pQtIZyGU3NNAPk9EdqhcJ6qnHlY2oylKA32elNEw9ImOph8hlNhU2+YBA3f3+FFlgRSxfa754qvyWbrvw3ACygGeaA+ZDoDJmfjRvKnW09Gp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB11586.eurprd04.prod.outlook.com (2603:10a6:150:2c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 13:11:52 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 13:11:52 +0000
Message-ID: <8d5e89dc-2a62-40d5-bece-298d6d251565@cherry.de>
Date: Thu, 21 May 2026 15:11:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 5/5] base.bbclass: introduce
 prune_source_tree function
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, Ross.Burton@arm.com,
 alex.kanavin@gmail.com, paul@pbarker.dev, richard.purdie@linuxfoundation.org
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
 <20260521125828.718050-6-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260521125828.718050-6-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB11586:EE_
X-MS-Office365-Filtering-Correlation-Id: c0576dab-d594-4b13-f38c-08deb73a85d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|56012099003|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	SYuyKz2xxbovewalP87xFYlPDg1cVZEp1eBahYLQjIt0jssynFX0rothvEh7mUKv/EESaV2lo1TQ5JM0JC1fy9q7ecQ+hY9M/SiSuVpDvGw4RaZP4CWGynGTS5ujDDYm6uYU4cP7N35vMG5fqsqHApPcYinmy22sJHCgp9Ea3tP6GLBM3nRfhfZxDx2iba6n4EpzkYQklAX2fyEDzjTF0B7pNKKuK+pwgCk0hYCTEdD7PkvWnS2zz/7cECd/BzhkdtW0g8YahehXN0G+IkdYrlnOcdbYbNtwMB4bKAlvncpOHlxB8moZWjIUjt5A7DjlnFTxx32hVc8gaxhhixDHE5os25pJfGZ0nr+JFnJjUD8jkfQ3y+DxqdTwcN05WvXCnNP3yuV07T9AWvUCHE1wniDnxFQfz7oswvK/4c1NCjvbide/4iLKYGTNwcim4F1QBwt2ALI+CaHAZgRpuMMxxPbC5ldKJNq5x0cD7awDCNLVE6a929+TC5J5PeQ5XQ+PVfGnNEmGLMKJxKp+iXaJvI33QGxhNeTCctA/naaFIGky0xjP5IZCUP0tLIgEGBTJ5K3b0ZrUNYewZ/1ICRWIF0PNypMORoiHkOX/05dn/4XWcehyzaGyprWtc2U9MOOWnLe1gypj2o2IGgqcwsfJzuho5SkQ2dz3tLmSgsWSKeLA29CI9+oJXjEJ4GL23j/P
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(56012099003)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dH1eEN3FeJmrJg/GEmE35G0trUC59aJqZe5xk6ELxKRbaLSAu1GBKZ2a75aO?=
 =?us-ascii?Q?JMulN/SV/Kwf/ttTZGTMSppsStwID37nxmykT1rSlAr/ArzQTRpvBoYlCw+t?=
 =?us-ascii?Q?rWWNBXx4trfW/yKVOpydITEMXhpWxvYk5uKTTSoKEpsKQr3v94EROGlNlVMw?=
 =?us-ascii?Q?Bm23RK4et7jZpgIsW3Jp0rs1xETwFSOX/oymuF7oCHN367d4C7fC5Fv4Gi0l?=
 =?us-ascii?Q?6Eyeoa5DaO8J3hniSOdCU/Nh24d/nywQUwjpDZ7pFkRkX6bkAi1cMk6eIu1f?=
 =?us-ascii?Q?t9osFXm1Hay/USWeJeNU0b2u0bNf2O8YIeq8UsxKFoA+JsPAHTAOhMktxtC2?=
 =?us-ascii?Q?U1Fu1UUMB7aTOF8TsHknSVs8miz7V7dibT2m2mLyYCRrD3pb5l0/5Lr92nFS?=
 =?us-ascii?Q?WtuV9Zu3ECEQy62/fNEvUi8Pz8/0s2Erzcg7h9yWOFh2oOrzfFSuoqVoxBQ8?=
 =?us-ascii?Q?4paOyv9JRas9VhTEv8/iptQDWqTNNHK1En6WFih32EytLZijkLOv3MrpL+a3?=
 =?us-ascii?Q?UJ9Poe+ezaBhBLSsKpLUoEwnYSGHXf9f34YxN/LG3f3Tj+XrXwAedhmm6P/z?=
 =?us-ascii?Q?cSgaSHiV0ad7TdC+ATCsolGWlWP615xV77bFnb1QnPAGW0nU+BT726+j0VlN?=
 =?us-ascii?Q?GTLe1eUY4Rxn67UKCzLLiIQlmpfZcMC69jUGa6GPVxm+FSi7WS7MAANf1q4S?=
 =?us-ascii?Q?IboNRpF10nXuzhyxoMst3C6Wlgij8ltxS2SXt5XX4DGjMyGYPWqge7eh56Hr?=
 =?us-ascii?Q?G68Uv2+SxgWN6K40EcaZGr+rd2I5rJrctO9ZJwouIj5OC16aHCv5z8Nw2pE1?=
 =?us-ascii?Q?Ke1eRXFFkQ1o7jEHH6bxpKFzvSBNPfjNPc5dm2IDmwSzuc/IG4/0ZLKKiYUY?=
 =?us-ascii?Q?EygKFQ9qn/5nYVvjA60FGNwHwv+lcraXS6oX5QoGmzHS141cs/Xjhp6xeeQ7?=
 =?us-ascii?Q?CzH6a6ZuOaA1VMDal3Knx4CM0XWSDCLYgnIaDw/pLTkc6PacW5JpTVo6++jk?=
 =?us-ascii?Q?TDaDyvOCz1zHurs7DUY/RENvLg49m9BqYhaSJrMM64geKs9xUKpH/mdArcXR?=
 =?us-ascii?Q?SoxJbeQgGDhavH5jyyYUMnTXhN5wDwlJlvjMDX993GE3z6OpXwlbJlgL1heb?=
 =?us-ascii?Q?X4qW/Ms9HNmvo6L6FzBYBOTR00Kbd6zEpz7owVmHF4koXH/KRyyPCqQxZLc+?=
 =?us-ascii?Q?6C7dSeb1TZvtvWgHfktyBuuaXGUDntGUHytHfD03ISQ5GH0+BltxokBjNh/I?=
 =?us-ascii?Q?5oUNt/dqxFMlOJ+qYYqh51L47a9Iqszq3SsDVxwEsGHsf6POlVREtJMv4adP?=
 =?us-ascii?Q?grbovfQxWkHrNCcyFumA4lQOKUA06PhSTE0OYdT6JEGlGGMSbqKiAbklknrU?=
 =?us-ascii?Q?srkWebKtjIWEnALdIv8+gsjMvjoWysfWGlg8HQJ5JmjPRqUoK4w7Si3cIvdE?=
 =?us-ascii?Q?LLSTKSeL6p6WypNQfRH/BqyDnIytm3xexGHbr7svEy+ykEI3JrwVlowuLJ9g?=
 =?us-ascii?Q?kIJfmwKDdFmzGfPUjqTJVClnXTr0VgRU4KgSzpvUJ9+w0wH+8HwGdDCBeWvS?=
 =?us-ascii?Q?pEGfYsDWzX2k+PCp09sMedFFlOPx5MhxEl/0PgoBJGG1lNHFsvjRCwDikA23?=
 =?us-ascii?Q?ShgW93+J4GtYfMfGRxVUXCZ6aU2xsE5mLJ5n+ghAYbCzQObrnUrzmr/u2aHW?=
 =?us-ascii?Q?PaxhPyjgus/4OxOCRxyAxmWFQxldDOa3E/uNoz0hW8R2JKsgLI3Jr/Q373zc?=
 =?us-ascii?Q?DAlEGfWQ9Q=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c0576dab-d594-4b13-f38c-08deb73a85d2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:11:52.0701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: af+WGw8vm/76NGLC46U6VBikvqMD32lUDTqbxCTgnfR97uWs/v36cWO5fLqTlObE3a+75Hdfmq9gccVsxQa2iOEnybmHJmxGhXPkWIbtlpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 13:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237513

Hi Jo=C3=A3o,

On 5/21/26 2:58 PM, Joao Marcos Costa via lists.openembedded.org wrote:
> Add a helper function to be executed after do_unpack, if PRUNE_KEEP_PATHS
> is defined.
>=20
> This variable is a list (space-separated) of paths that should be kept,
> while the others will be pruned. They can be directory names and
> filenames, but globbing is not supported as of now.
>=20
> prune_source_tree() is not a task on its own, of course. It belongs in
> do_unpack's 'postfuncs' list, and also in do_unpack_and_patch
> (archiver.bbclass): this ensures the archived sources (patched or
> configured) will also be pruned.
>=20
> As a concrete example, add PRUNE_KEEP_PATHS to vim-xxd so that vim's
> sources are deleted and only xxd sources are kept.
>=20

Have you tried the ;subpath=3Dsrc/xxd argument in SRC_URI for the git fetch=
er?

I don't think we care about xxd being removed from vim recipe, but we do=20
not want non-xxd in vim-xxd, so only checking out src/xxd should be=20
enough hopefully?

Cheers,
Quentin

