Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EB7F53D72
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:38:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55265.1773679086550604266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 09:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HeqkkJei;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75354e842b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF4NMx1612787
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 16:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=s00+xgsDCf2jCgyMNa333k
	mKvLOZKyiwtnFy145LkTE=; b=HeqkkJeiuHGxyYeyZjfBnkO8HYWW1WktITpz7g
	O5mUzd//GTi+O7l4byTiGk+CrcOPxJcee6O0cTcXd5f4o7G4iY1YS7M45/1nWTjW
	dOznRjO3QW7cV9NNcFseHmQfdL99xAZJ4deBC8UGVqhxpkxA0IruG9v3YOfCRlk9
	tx2FOgIYZyEbzJWqk1uUpNOCmQ2XJ39S4fIqGpsHsiwp3LUSu598PjKz/nPzT0UY
	CjatqZLOcVoCKqq3P5Dr0Jt+6R59a2tOelaVBWDhV3n8a8hLvKGY6i2EIADjmcdL
	Az7UvQIveoLLvu0B/LnvJAkKfashPor2lObT7xtFp/GbeCyg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm6683g3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 16:38:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKlTVmUSkJyXdKhvjIaav+CG2WEP3EbtlrNUawBu0BhZ3MED2A143Xxlp9clwtZ+XXpgu3v/wul0xbp04pjUqSaz8xlEtVIozK1B2C+t/8PlD37OnG4gzuAKx9WFVMdvnG1i7dJfJihSM7UpSXeljf8z/NSzJaR1mw803wmCZc2x7Orm8Xo5BKz+TF4oMW129vSyjq8qZszCuUL6dtSg2SnE0oKHo9NPlqkei1EfSUnY7nHW4SuHxoHAFb5cfalshfNugRWe+ePbt05Pa7XnXp9ipntpqwxcjJixl+qS3rKm9qlk9IvFy0/BG9xtnvcADFa9DYr2pKOL62zkJHTLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s00+xgsDCf2jCgyMNa333kmKvLOZKyiwtnFy145LkTE=;
 b=SKTaB3Fch7sF7v1+368nTjxllVKGIAebF+oNP2/p9Pg7K4Vr95IQR8j+EfA4HO4fNgaEekSFn/+EAQDcX4iZxwoHz85d60QpQGGu9hnIVPah6Qv2FjkwjcQjCvuiJ8F32pnGUOJ76DyHIZWxAHzvoc1p0sWT1z3JsxKlYYhVCmg9huHvnu7l213/o5TZpwFtxAjkJj+CAdThn44eo2M1ogZU+j8pDZ/c5wsNegRuQr33ft5SUm3rmoQ8Z6dVPvs/t8tSFPX+QSlaNKzxj0PV84vu6i2gIFgkD4QsMbo2JpUMlYSZdH41zssfXZX+Q4lIHk6PuOlkPPTbsOaSWUsuqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM3PPF4AE904FD9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 16:38:01 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 16:38:01 +0000
Content-Type: multipart/alternative;
 boundary="------------qRmgQndKaoPr4Egu0NA9ykLi"
Message-ID: <5e33f946-8351-4d22-ab90-fe7488034c2d@windriver.com>
Date: Mon, 16 Mar 2026 12:37:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/5] meta/dummy-sdk-package: Improve SDK dummy
 package handling
To: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org,
        Joshua Watt
 <JPEWhacker@gmail.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
 <189CAC32AB5A06DA.1508127@lists.openembedded.org>
 <189CACDC59FF3062.2629287@lists.openembedded.org>
 <e116990c00b33a1bf02da5b45707f3b48a5cc9f9.camel@linuxfoundation.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <e116990c00b33a1bf02da5b45707f3b48a5cc9f9.camel@linuxfoundation.org>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM3PPF4AE904FD9:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a59879-ea2c-4672-16b2-08de837a6340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|8096899003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Es2Rulo5N/B/9Ai9ix1URII3ppTEdl9y5gvyTKafDd9GcA+GX8apff3CivejnxwiwO1ET6/7cSv1T/Kra5VA7x3VbQ0fCUUdm8WnbkeIf3dsIYB3l3sGvmi9YCk1Z2q+OMayHCdTYIErKMMDNDg6Od0G+FwEdGTXdLqFSykObq7jS02p3lzZidg3+Mre90SAm10ne6LERmUMsaDynXa6XOWoOiLEDALDkCeBTJULpx+px3StQfJpzDXDPR0slXxdzhA/qClU6PSSXwU+8CFd4oSxte1kDzzTiE84ypc7TtzxkCbBXSVxc5Mi9Y5gicKPWfU0ddd1BPIKwJpOesUVCr8MDP7f7TSqeyfPGsOMcAieovPChQgNQDR549ICFCeaw1GpfrBAcH8Bar1X4AXU73fh8tkjWs7PiYFecnRqE3DBQmSiegKkKPPJ0c0Uu8bUrOKjyk5pQsb/CWuw5NG/eZxcQapn2qxxwY7Vp7GEfvNMTkchWsmAamCP0qrvfQS18gVwMZvIRoelQ5ZUC/ZbcATf/OAAkhwg6D3X84zVoUm8ZlCB2PI5wy9VRW7Fp/U2EzpkXUUKHTGASTWOaLuSJSxf1ssQonwW4Mf81uvWXHryPLx6Pg2p+1nWlXj0ZYv8nf/ceeGtkXOoI3MI1WwW1MRNnI3X3vWI+t3+OgPRvfUGFINzp5iUNz0B9TMsv8K2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(8096899003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3B5TjFKRUpJTU5nV3J4TG9QWlhrQ1RXVEVtODU1ZjZTRnRyQjRBVzJja0gr?=
 =?utf-8?B?SFg3ZzRjUHNnL1VodjBOU2NBYXF2VmdnZHJQdFhYMzd0aEdSNmlrNFhSMHMr?=
 =?utf-8?B?YlVTajRuMmo3V0JMYUZidE9pcWVPY3piWEZKblJReDhSSXgvYnQ0U2pORnRF?=
 =?utf-8?B?WkhySHN5NjVJampGdEtjN1lIQ1c5MVI2cnY0c0loS2RYUjE3RmpZUnFtSW8z?=
 =?utf-8?B?VlIxd04vTnk3b2dqYnU5QUZTcSttZkxkcUVCaGY2MW5Sd0hjQ3grbG5saVdi?=
 =?utf-8?B?L0E2cjVadVJLOGxGZ3NMVnRraGlrNjlmOTNqN0JUSTEzbk5rNUc3S3NqWisw?=
 =?utf-8?B?bVVsQ204c0ZyQUFaZmhzWllsYlZ4STVjRGxzT2pPU3JjcU1LR1l5cWRNaUMz?=
 =?utf-8?B?M0pTZlM5Z1Rib1NmSEpTbjJ4QTRCNUJ2VkltbXpEMzB3TGZqVnRoemZubHVU?=
 =?utf-8?B?ZXRqeGR1K2x6b0NVYW5wbkNjVGl2RVV2ZjZzMmJUazBucjNEeHlrL3BUOGtF?=
 =?utf-8?B?cmpkeGhHSHU0bis0eENxZi9QbUc3eTVRNW81dG1CZ3QxVSs4ZlAwSTVNUm9K?=
 =?utf-8?B?a2F0RDgyK050OHZ2WEsrYnJoZEN2di9nUU93UEg5T3gxV0MrdXBYR3BvYlp1?=
 =?utf-8?B?L2RhL3JxYUE0NU8zN3BRZ3hnTGliZlo3WUZRSzAzaWtSWVBvNE5DSTRLTTFl?=
 =?utf-8?B?eWoxaUhZOW1UN0N4N0owSHphSFJOMkh3TWhlWkwrL0lzZVM3WTlnZXRseUJL?=
 =?utf-8?B?N0Fkc0xkcU9xenZqYUwvVnEzUHp6S0dFZldUUGMySEQzcmptby8yRG9pVGh4?=
 =?utf-8?B?bUNRam5rSGNESFNnVTN0SGNNR0lpelZyU0syMXNKdVYveG94R2ZwdXFxUUkv?=
 =?utf-8?B?M3pRSlZyZitRNjF0NGxPTXQzbTUyTERuV3hmS2dtV1hHd0hQVzlZZldvME1m?=
 =?utf-8?B?cllOYS9tdi9ueEtTTTRXaTNpUTJxTEpEd0pKNVNZQXZ3UlZRdURxMmNuV05i?=
 =?utf-8?B?djkxSVJZYlFPSjVYVW5ZcGxTVGJEOE9BNVlTL1AzSTA1TGkxcG1rKzZVRUFw?=
 =?utf-8?B?UVNFMDZRQmQ0MW1UUnFNcEk0NTdqYUFEemcvbFcxUlJvSElqVThQd2Y0MXZE?=
 =?utf-8?B?SVlwYXdDWUd6Rm8xQ1oyaFYyUGx5R09POXJTUEhqTU40b2hBTisvM2pYUS8v?=
 =?utf-8?B?eWU2bUx5bFN0RVFPM3N0c2ZCZVdFVlF5dXM3d0hBTkVoZjdjNVF6aTJNcWhn?=
 =?utf-8?B?NnVHTmNhc2JwWlBIcHd3cmw0c2tXRnRrYXpocFU3ZFdRY1Q1eU11a1AzSHJD?=
 =?utf-8?B?dnliVVl1L20yNXJaN0tNdzJSTWlyVmEwS09hUGNlRm5uN3FER2U3QnpVQzBv?=
 =?utf-8?B?SlE4VWdJUHU2aTh3MXNmczFHSHMrQlZTSjNPUVNjQ1hTOUZMd3Rka1QyNVl4?=
 =?utf-8?B?RUZ6NDhNNW9xNllKUy9yK25IYlJ1NFdZWDFMQTJaeHB0T2pTRitTWk9QU3NZ?=
 =?utf-8?B?VkgyZWRWVVVyekhPN3h0UENwQ3IrYXlQWU5MOGRvd2UxcFE0TDQ5Rm5oVVVZ?=
 =?utf-8?B?WCtuTVlpQVFHOTVOSnQyQjlhQkovQUpNeGs4MjdzTi9IS1g3VWVjdnpnOFk0?=
 =?utf-8?B?UHI4c2tOeFhCRVYrbWdJRy9kV1dBUm5Nb1NuaXFUWnVzUGFaMGNKSlVRS3dW?=
 =?utf-8?B?RWJsSWxBYkxIUnJOUlhaVUoyS2xONEx6aUxXWk1XczJSdWxkblhTNSs4Q1I0?=
 =?utf-8?B?aFl2d0wxUFBSaWZmRElEOWIzTTM1bWhxOHdlTjdUbU1MTWc3bHVEaHhDT2tq?=
 =?utf-8?B?NTNZRjJXbllWbkpCSkk3U2NhZllPRkpuNEVncExiSGIrcmhpNi8yNkNvSHFZ?=
 =?utf-8?B?UURFTkV3N0JiMEtMeDY5M0ZkZHA1dVZkMWwrZlZ5ODNtSVNkRFN0ZTN1ckQ2?=
 =?utf-8?B?WmtTWVBid0dKcWtnK1dNSkU4K3ZrV0tkZmtVL24rMVpGWXFpSEwrdE5ONXBi?=
 =?utf-8?B?NENQVDhTQ0dqejZ2TDg0VzMxZTFmZVRyU05ibTdhY1dacUxXd1JRYnUrRkd0?=
 =?utf-8?B?bE5tVk1LUHpjR0p0UVVSUm9lcDFQV2plR3hZSmlJZU9rVFVLTFI1OW5DZlZp?=
 =?utf-8?B?Z2wyd2c2dzYxa2NvQk5UQTFXaTdvRmo5UUNpS1N4endoZTBNTHBvYStOeDQz?=
 =?utf-8?B?ZXBTLzVvL2haeEJiNEd4WDZybkQ2ckIyTnl5bzc3MCtsWllhYnQxcFVtbFI0?=
 =?utf-8?B?dkcyTkpYaEFpMEJjYyswVXRpMzJkR09LUVBJRkFNWklITW9WVWE0bHZYUC8x?=
 =?utf-8?B?dHh5VHZYM2E5K291QmppS3hZaU9qbEMxMDlDUTVOZ0NnaXJiQnNUKzRvSVQr?=
 =?utf-8?Q?abGgn9pyuKMSbxPk=3D?=
X-Exchange-RoutingPolicyChecked: 
	ODugxJXhlYh93DYvP0UYH84xN6695ggZrRaj44ABE+oRuYMb0DDjXymNoyQ6jz/+PCOK11XuLlR62yRMM5nzWLvC+oQU4KOZEiR7KQOJ7+00jY6Qm0J8Ebb2/HbvWZYIVPHLafCiv+TQtvXOAkCP6dWutbqUrDXs/p4Z366YrcIDB1eT/kLsEMRHtl+/5cH7xiT1Cc4MgjC6gRKil1by8hnBxInrNRo5caibCqQ4lH+vu2aWISwndk2Cys1zN+RBMKSl90+xGQ4QQWg0mkkr+zvmdaMoIjcPwuR1A2ei1ihc/QzT90tluZayyBrzkIrXd+5t0HroVCj0BXzW8viqsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a59879-ea2c-4672-16b2-08de837a6340
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:38:01.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYH/iAB9vAiz8a2o7kosQTRSllu2ISpLMt9SkpuWPJa368OGKm5tUJHg3AeU1U9uIhaSqSU84U6p3PMfTcDdwxC4F2UP5zSwVZ2LFSI1ewY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4AE904FD9
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: now8uThExCRIRaMYFmOga-o4HpBecT9f
X-Proofpoint-GUID: RifYhej7DhW_VNkCyAkZJpOm-zsOxIdo
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69b831ed cx=c_pps
 a=NYwhZoOBzU3e7w62/nBhxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=K6dRQiD1HIPrUSulxbYA:9 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8
 a=LL9Wc6CO4YGtWTw6kxoA:9 a=HLbyzLMI_TyQFI8t:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEyNiBTYWx0ZWRfX8y9GLVwoBXV4
 uM+Ax9r7PczSRBgS682a3SZAZsXP7WfLgJmgXQWQfntRMXuL8dyge3oRjgyUzT8Xfs7Jz60imMW
 r6g9t/PCaoR6+vRwZ4S4V/9VWbIl5b0NAtD51FeQuwXisFI6+IpLu0zyBLyyQAAwfKPBxIb29lB
 pEC3YnMX+5hl1VJSM7gO+lRg69Gy3TGELgZ0r2n/HzRCIeSLsdcIAhFO0AUsE+4MlzAsomlnX1v
 dEwoeX03W0T+HtiARleWFmsOCPQTV7W+GaZ4ebTiWqmT/kY8Nnr2mX+yu1qPbIh3Kwv2m8sVlhj
 DzmWBAS6wwUwq2JFAvi3INn3laxOU6V1y0qt5XZBtR7vVl5xIAW8Ktt4GEK935S8acgOjbTFd6p
 03Zx/gASbt6/X74BEkLw203Ikl7+5frcfl0LZYu/KPdR6O/HMTHcCiUTcSH/OcA/LxX2Wbb7ab8
 pG7ZxBSZRJ5dpGc5ZdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 16:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233259

--------------qRmgQndKaoPr4Egu0NA9ykLi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-03-14 6:28 a.m., Richard Purdie via lists.openembedded.org wrote:
> On Sat, 2026-03-14 at 10:00 +0000, Richard Purdie via lists.openembedded.org wrote:
>> Options could be:
>>
>> a) move the recipe to core and add another entry to
>> sstate.bbclass/sstatesig.py . That doesn't help it anyone else does
>> this
>>
>> b) Create some layer.conf variables which allow these to be
>> defined/added generically. That would need careful manipulation of the
>> hash variable dependencies to stop things rebuilding like crazy.
> Having said this all out loud, b) is the only realistic option so I've
> just sent a patch which does that. I don't like it but it is the least
> worst option I can see right now.
>
> Cheers,
>
> Richard


Notes from patch review meeting:


Joshua said that he'd write a test based on the native-sstate being 
machine independent.
Here the sdk dummy packages should be independent of SDK machine.

Is that right Joshua? Want a YP BZ ?

../Randy


>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233083):https://lists.openembedded.org/g/openembedded-core/message/233083
> Mute This Topic:https://lists.openembedded.org/mt/118311680/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------qRmgQndKaoPr4Egu0NA9ykLi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-03-14 6:28 a.m., Richard Purdie
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:e116990c00b33a1bf02da5b45707f3b48a5cc9f9.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Sat, 2026-03-14 at 10:00 +0000, Richard Purdie via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Options could be:

a) move the recipe to core and add another entry to
sstate.bbclass/sstatesig.py . That doesn't help it anyone else does
this

b) Create some layer.conf variables which allow these to be
defined/added generically. That would need careful manipulation of the
hash variable dependencies to stop things rebuilding like crazy.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Having said this all out loud, b) is the only realistic option so I've
just sent a patch which does that. I don't like it but it is the least
worst option I can see right now.

Cheers,

Richard</pre>
    </blockquote>
    <p><br>
      Notes from patch review meeting:</p>
    <p><br>
    </p>
    <p>Joshua said that he'd write a test based on the native-sstate
      being machine independent.<br>
      Here the sdk dummy packages should be independent of SDK machine.<br>
      <br>
      Is that right Joshua? Want a YP BZ ?<br>
      <br>
      ../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:e116990c00b33a1bf02da5b45707f3b48a5cc9f9.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#233083): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/233083">https://lists.openembedded.org/g/openembedded-core/message/233083</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118311680/3616765">https://lists.openembedded.org/mt/118311680/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------qRmgQndKaoPr4Egu0NA9ykLi--

