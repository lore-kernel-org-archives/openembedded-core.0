Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6AFC98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:45:44 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64.1790174737030098039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LYEJq4MF;
 spf=pass (domain: est.tech, ip: 40.107.130.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsmYJMTpt5Wi3Cp8wIatL8ZbyG1a3ofAGu93K93SutGxls1xpmxmcTjItwHbeF8jO24e+EAQUIbpZKN5pXhBDIPGOfwGMUv49vQ/j5BdWQyy8xaQrkR+30bhljUC11mwbIz/6vzjliYhbJblHhFVKknLOUMMGG/5KmA1pgrsfrqYnuRB7475VNB3nSJGGoVcc3jgdxBactTHIr2h2BQBSy7GRCtn2noyYEPrf32QGuHZQEMJJOJeSvR1KWLNQ53LBm9Lyb2UbuffKCkTS1Km0WChsi2IH3jQY+EUZXhOjCaZLLVelOCUOxn0xqJ7azM290vhAvvsxUTQ9iR+E7cZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgtGXBo2VxNCXMGej2LfwcNPBwVF1AirBwRNzRxRZss=;
 b=ABkzfDX7WtYFZ4PvkWruGyxlf0ud2VuqI2ySDeYHKfXCBTx+YRBXj/C7iqqXXedIKvV2U5l43TqIZBAc6AQmw3xAs/ur+NCYcqJStixy8M0sv9gDKhkQ5KXM4UwGlJOeImj2cKzZ51Un/jc2xXEKahfN66dm+3Xa7eKZnoSmjX1as0cCxNU8M8QWNjAMdUsUuXZX/fC+8+yhbFlGHl+YzA+16Ui033QJlEPSREEBQ+VryrGIyc3l0TgyuWW6+p9fJpDVyC680YvDZWc4VL2pPoapodjqsdf1peE8Bdkxc16CmSjePk/EvC4klkdeXaC0VQvdbL/upTZYmDNOJBWIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgtGXBo2VxNCXMGej2LfwcNPBwVF1AirBwRNzRxRZss=;
 b=LYEJq4MF0Za3Fb3Yqb7Swn83tAINcIZLMfH9RjntxqFh2+dA4k+obJm7bPVhhv9WgS+Nhe41RykHAFPr59HO71QHybzUZUYMN5oojlwgVfRc419gHDF7MidX2IywScbnPB6mQ79Fuk7FQOo9vV0qnGRU03yzlSAU/ic/Vp+sB/SgwplfnLLm2yjCzMwlESZzbxk8bTbl02fpIZOXkMB31oyraejPd3lFGkIL5zKYPM32UozEm107E8P/3Xy0f83kdZpiNYSPlGvhwf67ISyrXPG592neHLk3UyEITXApx6ziZVaxxI3jdQG3XCpmmhfkeA1R2qV2gE5S2inqWwJO+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU2PPFB830855DA.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 14:45:32 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:45:32 +0000
Message-ID: <80903375-4d05-45ce-aa22-4694a94df558@est.tech>
Date: Wed, 23 Sep 2026 16:45:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-2-jaipaul.cheernam@est.tech>
 <E355EDBB-60D0-49E6-9F2A-3042130D2906@arm.com>
 <A7D15C6E-0CAE-42BC-ACBB-1A64BD97E5D7@arm.com>
 <4C4AEC9E-FE47-4605-84BB-24324BF79BC4@arm.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <4C4AEC9E-FE47-4605-84BB-24324BF79BC4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU2PPFB830855DA:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b58585-2098-4a43-eb99-08df1981519b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	j0KrKpDXDSOvlCK2kVs1HiKREDXghykW01PaN7kB4UoC5C1QUFkR3xvVQ32RA4qmdbkMnU9y/NBLW8L8Wgx6suBWuUbWf+ANl+KklGK9GsbKS30Z8kOhs3ejq/Az0Ik1+c1v7LSakwvYQGEdnXHyT5jAcm4a95i5T6JKR2e/Dlr+a+tFdN9MUETcFo0sb99Zw4hw0mcy6OjSFjcMjbuexioiAQavAR4pJqJMMiai32S4P9dJguU/4eL+TfRGGeYLwaFQ6fDBaPBFMJgXDy/3ze1MBRO8JHPc4IJop0IEJUra2nPZJ4yTWYe+s4Sc+qUCSO2T1WCn0D9J4KcgeaQl/Ey+fN4z0Fi2nBLstckroRZy0GnG6EVSEseYfnJtbwaGqXDXroplXSKBW+oMA3Pmv/K9CjfEPNV1nrkogoTth6CJc6N6WpFNJ0yyICvcO15Xx7YPabvevyoCj7E+xgVFpSbkJlewetpxB3+raQ40FFz1k1BAgEUia9s1QpxqJuRxHgTTJJYG46yd80Op3pGn3b/ANWXPPNeDnOEgmeRbbaASN5/ofaf6oqEHLZKmMdALXQOM418fLISlrhGHo6WeuA5LJHdGgjTPfLsHiNuXEu+iVchLfzZq1ahXr6NOKf3/YxDT6J2ncGJXKYSV2P6bHUtRvGsao1lGQ7y1Jnb1Bd8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w3bQXQtCwYHKzVKSz8tPVGbdyd2eWQ84mt4/RSeHN+8j7Gh01yW+cVhJKv5F?=
 =?us-ascii?Q?FNbHUVJtrSp/Pk1mhazeE72p7+iyDiuNNws+4gN8GXJrxQkKw03qodH+bu7Y?=
 =?us-ascii?Q?Q2J2TmmGYIp8U4dqylCjsWou9l+gDbR+QS7GZzWeVq7OYbovmodVCBIjmfLJ?=
 =?us-ascii?Q?At9TONA/bj9FMyOs0b5BEBbiHdMPbaj1Vzl+BVa29gHwqdwjmgBr2zSJ18Q+?=
 =?us-ascii?Q?LClIhSzVtHUmgoXRH1CTlKC4Kh3d+SqZMnE0UfhpW2Bi1r54u3No7b0Z3IKD?=
 =?us-ascii?Q?dQC8Kpp8VJFN0YApVLI+dn4Cp9ntDHlqXN4FvflqnGlFpGvgSToMLU6p6812?=
 =?us-ascii?Q?9Flp+92E5gwmcauVdzs215kOr988K+qf+h2qjqXpYmaWKXQCJxfle9HOOGMu?=
 =?us-ascii?Q?i7BmrvkOmu00shVB562gv4njjQzKactg/b6o4XYoivG94+FDrpa3Mi8XOuXu?=
 =?us-ascii?Q?h0xVHfvdId5/GsHCnsuk3cHq9meCbXTze5dGWEpEWlu3gfwEaL40Y7xBUh2X?=
 =?us-ascii?Q?d0bcvGwUAeFTPeE7hlo9FR93GwXeDKJ262ntRfS8aTqRTNOgpqhEZf/psksE?=
 =?us-ascii?Q?crxo/FbMFAFAi1gXVwo87NJHJz6Lv8gfUrfjIAwYOo2kPvl+oIEYTHXkHaPJ?=
 =?us-ascii?Q?bnQALPgZaZhAcWxm6YkJHL+lZywWJHNYfGa2hPXp3yuI7xvEW5uUfzj+DFxx?=
 =?us-ascii?Q?2f+2zqjfe/MKXDAcfiHbBIdrdr2EJp7YGyKcYzQJFgqQYuwsqq3LMD+VSFHE?=
 =?us-ascii?Q?StjXeN/LZU41u1vDsqtWWW6TX7OrDXoa+5ekMFUo0EsHywmaGsPtTv6Fjpdh?=
 =?us-ascii?Q?TfOIUSXJklHWNQZZ2EE1kc1a7OCAGtVyhWVPrwgSXCmf2hElJPOgHm5G6OdA?=
 =?us-ascii?Q?Gl1R5l8fDDDz17s6gWvAzUqIFDgBKrYljucjc5w4qK9ZSPu8qVdKIW1gixPd?=
 =?us-ascii?Q?F4fKdxYQHyshIbFjc4aXJC+YY8mXyeC49PqVXtQ86pmetAzqsqHwbsVCmpIF?=
 =?us-ascii?Q?9e1uuKynppZQXp7Zcc3hLNZB5QSiTHXOEOKVtdc+LP+Wz6SE5emRNPzh2YCu?=
 =?us-ascii?Q?g+lzet/dAKR5S0EGqtwROgT5ViDZ8bSiS8l3bVdFz7UfbjQFRY4UpcVpSrgt?=
 =?us-ascii?Q?xKUuHk/ET0z8MBauAsDyWbl/D7rLycIfCbdM2c4ivLU3cnH1X/pvQhPpsAkv?=
 =?us-ascii?Q?8hsIuV5mqULs6IClH102lPi9abrDrHdtOIyDRmx+GENxeD0OhGk3/0u6Ilv1?=
 =?us-ascii?Q?/B/VjU7FBF98urvlI+AhJHjFVR3C1kUbC8Yl+qumNGCfszyT0u4yv4kvCt6J?=
 =?us-ascii?Q?qQwSCiqX3I6KTGFeSRzkXpSEK8pJbvCtv6pUOvAfpHiRTyEEqjBB1vJTC3O0?=
 =?us-ascii?Q?a6HRSGRAdRySEqyF959/VFdnNyrvbHLyVbjQLN60rwtL6zo7gSVmz2n/b1f8?=
 =?us-ascii?Q?i7PAEauhDwGPCEVeyM3BpfHNT4tdwSAiOWemTVWxZY79NBdMi/hqXQqHp4xT?=
 =?us-ascii?Q?wzJlHfsdlOyR9mUaq0vrAqYOMg33HTDwNmrPltl5bmFMMrpBV663OFj5AQhB?=
 =?us-ascii?Q?99K6O0aXEq6/IFkSCqy0lM9q0JplHsAMJcEMZkY0SLEDvGo2SleWuc8vInSI?=
 =?us-ascii?Q?D5h5KFAYtCTDW309QQifBcinQdTCvoSPORks4OGIYoGqSaLp19+jD35iSHG/?=
 =?us-ascii?Q?aEozeXHMbAZUG5U3ym1S/p0Q9ai+vHwy3H9wn3j9QbQquVxsqNseg4Qi6gyZ?=
 =?us-ascii?Q?y9G1AoG0uYTsLwdNSnVq7IXCAY9xmxpmxD95mMdhOfYJaLcLoSji8aql3wZw?=
X-MS-Exchange-AntiSpam-MessageData-1: kTb9wFeBA14Ruvk1Uzs4aV3KcgRUZXJ/bmo=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b58585-2098-4a43-eb99-08df1981519b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:45:32.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6i+I7TY09V9y7J/SkeCiR8FJqwx9nIDfuCGrX5nJO2VQyNksiwPt7alceHZbtgolWYyPE1d75Lf6mj1bWWt0Qc3roDTFtgG3MicT0cIUrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFB830855DA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246528


On 2026-09-23 16:42, Ross Burton wrote:
> The code used to populate the server uses a major of 40 to change the log=
ic.  I=E2=80=99ve just sent a patch replicating that behaviour, linking to =
the upstream code.

Hi Ross,

If your new patch covers all usecases, please drop mine .

//Jaipaul


