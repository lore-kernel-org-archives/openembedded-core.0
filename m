Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B02C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 12:15:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13956.1738239338953024250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 04:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41258a3d49=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UCE9YV005354
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:15:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enwhamuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:15:37 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UCFbbe008236
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:15:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enwhamua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 12:15:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfb7naprYecTXnSmpTOiZT596HItuMvAWKxecyBKNNpYxb2Kse0JQMWjfP5kfFvUGb2GXcY1ucxS69nKDjhKdwa1AM5gk6S+P8KQ7OLnZ3ADkQM8Sjg5TqpYi3RXl8gx8pnd/Bgm2bDpqG/ud4gIJiv/c76Al8yuzZfNjkveZYRqdRjK+N08wYqr7pily/QDIH/EOaFXDrptehCIZ76YhUFNheePrwAePq+vA+LwCoDDF2Bbsp52XDHvty+EjRfEwsxgiEBqmSytQFopg068lyk6nHqKxU7d3fuoJ8Evg3rSIunU9xTCIaies6uH72cnKGNi8U+PGKXWkNeW87QQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVoVCpq/CTDbEYP+8q4Dkvmp2pBg+BjxbkV4pkTGl9w=;
 b=qvLNzjNbbhdoNNqa8AngFN7c6qURzN0oxdO2od9XRQswRy+1ZunGkTA2/6/FlDx9Aw3kiTzUoKcevQprJoIzHLkrsfenx4XbbFV116g/nUVP2QTIUFg5oC4rHYtHGmhJdXPM1MOkr6wUIdCyPqYqQFaZMeAWuR2sj7GBAs+sEP8N905oBdPnaGKyk+8L5LBZAi9OT7w3xQXlo2J/tqudcVDJQexsmW8WktJCL2CugWi0oJyYywMgrOtkGeudo2x84yA9+HrC8J546iKwOfMAkerws76cE0sF9y8d0ZclLm8j0e9p7ObK4awkXzjYCUNiHmW7NRG8aFdVRSpoEYjpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 12:15:34 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 12:15:33 +0000
Content-Type: multipart/alternative;
 boundary="------------EP4vf8czx0cYxszp5DB7q0dA"
Message-ID: <62e9fb45-4a60-4121-abef-28c426238031@windriver.com>
Date: Thu, 30 Jan 2025 17:45:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemuriscv: Enable Sv39 memory address scheme by
 default
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        Khem Raj <raj.khem@gmail.com>, Sundeep.Kokkonda@windriver.com,
        "Hao, Kexin" <Kexin.Hao@windriver.com>,
        "He, Zhe" <Zhe.He@windriver.com>, Trevor Woerner <twoerner@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Alistair Francis <alistair23@gmail.com>
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
 <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
 <CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com>
 <a52736b6-71d1-4301-a602-096808a60209@windriver.com>
 <9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com>
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA0PR11MB4624:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f4da4c-7169-416c-cba9-08dd4127cbee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXJxSElIOFhGckxVek1qWjB0UC9JS0wwdW1SdWx5VTZTZWZaRTZ1c1djeGEv?=
 =?utf-8?B?VS90SjU5WXRONUI3N05YcEpkS0RJZzRDc1dZQ0VZMGNnQkFKRGRXQWlnOGty?=
 =?utf-8?B?SDFOMFNmM0Ira1VMUGxLWFM5d2p5bkNRUlk1ZFZUbDkvbkxmaXVaVktmV09F?=
 =?utf-8?B?M1lKbFRnVGxBYmZhVVBnYWFKYlRKazNDd1Zzc0IvdTlXZVNvWW91RTNKU3NX?=
 =?utf-8?B?THlicGt4QzB0dk1xbDVnNVZNQm5GZmM4SjhmS3hYT2hxRWlhRGNDbDFGWmp0?=
 =?utf-8?B?MDd4VFJUUjMzUmtEM0pKTGhwWVF3NEttTExIalNtTjJ1eGVWZGsrak9yd015?=
 =?utf-8?B?UGJPN1ZNL25ZdDQyZnM3WlNSUk9PMUJQVk9DT1ZPYjh0ZVhxbEprcjVrKzV6?=
 =?utf-8?B?QUEyYjJyZ096QTlKUU9rcHNNRGlkTXIvUkUrdlIwMFlqajVKS2p6cytIbnJQ?=
 =?utf-8?B?dFpPaFhCNiszcC9aQ0JQUTRsWDJZM0djb1ByaGthdlhIZXRCRTJNMjZlOFVL?=
 =?utf-8?B?Y1JNdjcvYWVKRytrcTZncUNwcVd3MmFJM2JUY1Y0NjZCMGFJaXpVUExqeDJH?=
 =?utf-8?B?YjRkTllVUVhZV0VvTzhmOFdncjdUZTdYS3Zyc2VFek02NlNxWXJKWFIvNFJy?=
 =?utf-8?B?QTgza1JaOG9RS0IyUnVSbCs2WnVNcEZRUC9VcnZtRUdXWTRUaTBVUXpvZWxK?=
 =?utf-8?B?alVpa2FXK2ttR3Q2QjY0YnE0YnRmMVJkUUNwMTBhd25QSzU3VEtsVitsMWZr?=
 =?utf-8?B?SVo1eFV4Mys1dHVIcEFwWnFMYUx2bHhtaWR1OEUzcytnNmtmNjAwSWZiOVBZ?=
 =?utf-8?B?V3pYQm8xMGdNYkx6T0NyS1ROQWF6VUdXSDJkbjdralJMZEs1VnQ4RGN2M3Zl?=
 =?utf-8?B?cXBOUWdMdWNWUktUTktqSlkyKzVMNm9ob0Q4d2hRQnIzcUZFU2lJelhZekJP?=
 =?utf-8?B?cGEzSXdSSWxRRkVnQzdVWWRkVTlNb0RTV3Zma0lhelM3V3JmZTE4NlZJWi9v?=
 =?utf-8?B?dUtTYlhlYjFSYjJXcTJDdnhtOU1FQXZpRXhNZ1ZTQm5JTjhwVDNDTkYxVjJY?=
 =?utf-8?B?MGc4WWRwVVdYNFJsTWZUa3pUWVVRY0tDT1k2V0tjU1VaRzMyRmN3a0pQOFo4?=
 =?utf-8?B?STFFS3FjVXczeWFraXZnN3VudnBrT0Y4ZDFSaW1pT2FKMWp3cjJXei9ZT1hK?=
 =?utf-8?B?RDl1MUYwazh4VE1YdXlMVVQwZklmdXhwSzRYVk9hZFBNT3lsOE9iZUFmWHlk?=
 =?utf-8?B?YjVsR0lsdGNOZy95aU1oNXUzRHJaUTZVT0Y1S0NlS1lmTzV3ckh1MnZpS1Jj?=
 =?utf-8?B?OHBWSTUxR2MzU0ZCQlJLYzROOXIvZ3BDWUFTVitaOWZGeDZLSm15QXpwSSt2?=
 =?utf-8?B?S1daZ29sc05SVFd6QndOQVFXcG1hc2lINHFtekI5SHI5UXBWREI4N3kxM0M2?=
 =?utf-8?B?NmI2cU1NTlQrK0xnTUVLTkgrbGN4MlkwOG9sQXlxSFZpdnBHV0NnT29kQjlv?=
 =?utf-8?B?ZDU3SGN6MUsrSXgzSmYwZ0VXK2o2VlZDc1pXcGE2c1hQa3IreU1DbjcvSzB1?=
 =?utf-8?B?OVJGR0F4WUM1VGJXNUlyV1VzdDdxRitrTUVLMnkra3hvQWZ2aWhNN1ArOE5R?=
 =?utf-8?B?NEpmWUVFSVNWOVpvaHF4dFJEOWZ4RjFnL3lvRGxiMkZNNzFNZ3lpWG9aRmFy?=
 =?utf-8?B?eUFxQVdIbjBURHNtcHpKWGxXMFJHcUl0eG9xWkZFbU9Jek1NZlVOcGlZWHJE?=
 =?utf-8?B?WnlJekF2QStvc09SaTl5ZU9UM281T1hmM1RJVDZhR1EvMy9KWDQ4a05WSXEw?=
 =?utf-8?B?enhibUhOUTI1cnR5U3FDMVRyNDkvRFVFSU9VOEFqZlJNRzZSR1ZFaGpZMmh6?=
 =?utf-8?B?NEpkWDQyZ3pkakRpMHYzY254d0RMNDlQNjlJSXhvbHZvN1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU1uWElQSnBDUU94RllIRlJWQ3ZVNVIxNVYwRTNVUXRITmhMb002RmpxWXF3?=
 =?utf-8?B?OExTaUFQSFNGYUdSTUlLMnQ1SDc4aDY1b09pc3AyZE9DdXVpOERyYk5lNmh0?=
 =?utf-8?B?bUFJWFErNzJzeVFpc1NFdWc4QmFLVEZaeW96Q0xRQndYYmZqQ2Y1bGlIdzV1?=
 =?utf-8?B?TUF3SDJQeXZ0VkRmQnR3WUxoYit2YnZmeFEvZlZadXY5MUNYYStOcTJaU0Ur?=
 =?utf-8?B?T1RiZW5XbG5MaERROEUrS2NOZ1hwWElsdm5ibUtFc1RMUUR4emlrUk1jN2Nt?=
 =?utf-8?B?REMxeVNHUklIdjRwSXFSV0pZYjFrS2F3MmRGQkk1Qk5aU1plRStFWEFPczJS?=
 =?utf-8?B?K1RZM1haRFBrWWlCSEJ2cjJrMmtwQVdVWHlVUHZLNG8zTVdWT1k0Q0dhMC9Y?=
 =?utf-8?B?VTBIS1lZV3M1dFdMSkpIcnhUYjkwb2lFTnMyY1J5RVZWdUdkcDhobHordUVO?=
 =?utf-8?B?Rnp1TGlnU2MwRGdnQVNBb2dnaWIxTTdtUHBvODNBN3JSczRFeUcyQnlUTXdm?=
 =?utf-8?B?bEtjZm1UbDRXMWhWQmpka2N2Mzk0bTRaeTR3cFZrblZuTER3WGlkckMvL0wv?=
 =?utf-8?B?aCszM21oN0ZXTUtPT0Z0akY1bWlvU0JXMDN3R1NWT3pIRHczK1NhQmJ0bDhO?=
 =?utf-8?B?Kzkxa3I2M2VLL3lEWFh1NlhiY0JXdVFVYW9ZaERVT1Y3bWJrWkkxNUJ2N1Zh?=
 =?utf-8?B?SmRER3R1eVhJMi94aytRUlZwb2RTQk5jUUVwdlNqRmd5a1F3Q1cwZzFaRVkr?=
 =?utf-8?B?VUFyamMyT24vanpUTS9jLzVRQUhPejkzSk5nS1R3eUx2Y2VQcGlsVVJSbHJq?=
 =?utf-8?B?QWRiZzVEOUR6LzVnQVcyQzduUys3c28rMjdPcmw4TTdKdWwzdkI0Uzc2N1Ry?=
 =?utf-8?B?Sm9EcXN1WTF4TW96RW9wMlk0bGJyK3l2Sk5SQW1UZnUvVk5mOXltVkJnb2dy?=
 =?utf-8?B?UVI4VDdwN2RQK0Y0bnFZWTJBRmxYcEtzM01vdWZ6VnRkUVIrRmlYd0ZzN0tu?=
 =?utf-8?B?dTFDbDNOVkFsSk1kbmphYngvbHVlSnM1b2RJK3Z0VlRuaHpYQUJlQmpGVGxj?=
 =?utf-8?B?Z29aL3VsUlpYQkpqaEdmNVBIckZyZit0ek9ZbHFSRXdnZmhaOEdxNUtITmtQ?=
 =?utf-8?B?MFVyd0tlMTNlQ0JBY1htTU4vODVLZXJ3OUNqT1NONXhRNzVMNUxSWitIRTk4?=
 =?utf-8?B?a2FjOTNpQS9qQW1zZjR0NTRZTnQzVVNqRmVBYXRtOUt4WmEraWVoRitnWGVD?=
 =?utf-8?B?cVZFMTVHQ0k1ZUd4Y2EwSktUYkkzVWpRUmxZUTZCL2ZNS1NtOEZNaklhZ0Zo?=
 =?utf-8?B?SlltUGt5K0EySWRPbzhLN2NSL0szY3pGZWtjSkozeDB5eWRESjhsd1BHNUVl?=
 =?utf-8?B?cm1xc0JnSlUxRXRqMi81UWtMeG5odXkrL2lybkQ5VTFOKzgvbHVGQWVjSWZz?=
 =?utf-8?B?MXExc3BTalZaV2h1WGd1VEVXbWJPTDBMSHFjdjVDUTgwTFkwVjV1dHA4VHls?=
 =?utf-8?B?dGhabzhyTWNCVlRJbkZiZTNmeVdqZGR6djBhM2wvbmVpRElMdUIrODd5cGxJ?=
 =?utf-8?B?S3Q4TFlZNElsMGd5SHZYdXlneGhzdmRaa2pLMHB6M3BYWW9uTXFGWDhiVDh1?=
 =?utf-8?B?eGd1Ykx1TEdDbndmZjlTb1ZmZERTUlpRa2ZMR0xuVTcrQ0xnRVVXc29XV25n?=
 =?utf-8?B?K2hUSFc4dGdieWxRNDZGaTRUbWRVVU0vWUZpTlhDZ1hRMERGeFZ6SFlrdWNX?=
 =?utf-8?B?MnBZbzhEVFl3bVIyRjJSaFlHWlVNR29HcHBtTjhOU1gyL2Z6SHNDY3plaGt5?=
 =?utf-8?B?c1FXd25laGlxV2EvL1JwdzFMMGpTUDVpOS80RVBOdVF0ZjcwTkJvQXM0WWZx?=
 =?utf-8?B?MjBwcHByYk8rMVBocUxLV2drVDFHL1UxaHpKVDRuZUlDNlR0S1granNTM3M1?=
 =?utf-8?B?dVQ3WFJOOGtPRlJBVmFoRXpycVlRR3NCdnFhcW10clhFVUxHZzZybEwrT3N3?=
 =?utf-8?B?N2VzV1o1cG5JTEtDK0k2ZVNUL2R1WmhpWHBlQWc4WFFuZk1SOG1NUEVId0E4?=
 =?utf-8?B?OWcyT2Q5Y1VPQUJTaWw2NVc0TEw0aXJHbW5QOFBYTVc2MTAwTklBRVN5SnBZ?=
 =?utf-8?B?bE5mTmlCYjFkbGdXWmlYVkRwdVorRUZMMGpSbmw2TEQzQmRjT2xpbmlLdDlQ?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f4da4c-7169-416c-cba9-08dd4127cbee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 12:15:33.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkZw2F0iWzAZee1tRfdbqWX5VJlGSlpoo9ZRnrsRLtYoXSAAIfTnIiW6LQ9PllOdKn8nI6SShotrlNCiJB/E1ZtafbrHFgtno1Hhdxnokdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
X-Proofpoint-GUID: pLJMnufq3WHCGJhCH61ENfD4g0Z_5uQ1
X-Authority-Analysis: v=2.4 cv=fMfD3Yae c=1 sm=1 tr=0 ts=679b6d69 cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=OF5RfYJ1b8ma6yft5BoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ZI_kpK4k3-7dwA8hoDQA:9 a=qNOSjLcRCh7S9btb:21 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ylBPwj-ltjVTmn4bGE0HHkNcp18Zn1HN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501300095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210441

--------------EP4vf8czx0cYxszp5DB7q0dA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50UCE9YV005354


On 30-01-2025 00:58, Randy MacLeod wrote:
>
>
> Thanks for duplicating and explaining your testing. I noticed your=20
> test email after I had replied
> to the main thread because you didn't CC me on the testing email. Oops=20
> ... on both our parts.
>
> Anyway, this started out being about just GCC ASan but if you're=20
> changing qemu's config,
> you'll have to build that emulator and use it a bit before sending in=20
> v2.=C2=A0 Perhaps run the full
> GCC test suite and say openssl's ptests. The rest of the ptest will=20
> likely be run as part of the YP AB
> testing.
>
>
I tested openssl ptest and the results are positive.
The full GCC test suite is still running as it takes long time to be=20
completed.
I would send a V2 after that.
>
>
>>>> Did you find out why sv39 isn't the default for qemu?
>>> QEMU defaults to the max supported SATP mode. I'm not sure there is a
>>> specific reason, that's just what we have always done since we allowe=
d
>>> a user to specify the SATP mode.
>> Supporting to the above comments, here is the commit that allows=20
>> users to specify the SATP mode
>>
>> https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c316105=
481640
>>
>> It seems that Risc-V has multiple sizes for addressable memory and=20
>> Linux probes for the machine's support at startup.
>> Thus, the reason would be to give the flexibility to users to set it=20
>> rather than having a fixed default SATP mode.
>> The authors/reviewers of the commit can put more light on this topic.
>>
>>>> If not, please check the git history and it there isn't an answer th=
ere, ask one of the qemu developers
>>>> who work on risc-v. It would be nice to have a sentence about that i=
n the commit log.
>>>>
>>>> Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
>>> I think defaulting to a profile (RVA22S64) would be the way to go,
>>> that will also enable a known set of extensions.
>>>
>>> Alistair
>>>
>>>>     https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b=
9870d22a8814
>>>>
>>>> I'm only asking because it seems like it might be a good fit for us =
and I noticed it when
>>>> searching the qemu commit logs looking for sv39.
>> I added=C2=A0 "-cpu rv64,sv39=3Dtrue" options for risc-v by default as=
=20
>> mentioned in the bug requirements.
>>
>> The support for RVA22S64 looks good to have=C2=A0 provided that it doe=
sn't=20
>> break other risc-v builds/tests being done in Yocto.
>> Following commit adds the RVA22S64 profile and corresponding=20
>> extensions in qemu.
>> https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425=
de550c
>>
>> <https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b5842=
5de550c>I=20
>> also tested with passing /"QB_CPU =3D "-cpu rv64i, rva22s64=3Dtrue"" /=
in=20
>> /qemuriscv.inc/ file and asan works with that as well.
>
>
> Good.
>
>
>
>> I will send a V2 with setting "rva22s64" profile for risc-v 64 only=20
>> as follows:
>>
>> */QB_CPU:riscv64 ?=3D "-cpu rv64, rva22s64=3Dtrue"/
>> *
>
>
> Using the weak operator "?=3D" to allow overrides seems like a good=20
> choice at least for now.
>
> Do you really need both
> =C2=A0=C2=A0 "-cpu rv64, rva22s64=3Dtrue"
> rather than just:
>
> =C2=A0=C2=A0 "-cpu rva22s64"
>
> ?
>
> Remember, I don't know much about the qemu internals so maybe this is=20
> obvious to you.
>
Thanks for the suggestion. "-cpu rva22s64" does work.
Even I am new to the qemu internals.


Regards,
Yash
>
> ../Randy
>
>
>

--------------EP4vf8czx0cYxszp5DB7q0dA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-01-2025 00:58, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com">
      
      <p><br>
      </p>
      <p>Thanks for duplicating and explaining your testing. I noticed
        your test email after I had replied<br>
        to the main thread because you didn't CC me on the testing
        email. Oops ... on both our parts.</p>
      <p>Anyway, this started out being about just GCC ASan but if
        you're changing qemu's config,<br>
        you'll have to build that emulator and use it a bit before
        sending in v2.&nbsp; Perhaps run the full<br>
        GCC test suite and say openssl's ptests. The rest of the ptest
        will likely be run as part of the YP AB<br>
        testing.</p>
      <p><br>
      </p>
    </blockquote>
    I tested openssl ptest and the results are positive.<br>
    The full GCC test suite is still running as it takes long time to be
    completed.<br>
    I would send a V2 after that.<br>
    <blockquote type="cite" cite="mid:9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com">
      <p> </p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:a52736b6-71d1-4301-a602-096808a60209@windriver.com">
        <p> </p>
        <blockquote type="cite" cite="mid:CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Did you find out why sv39 isn't the default for qemu?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">QEMU defaults to the max supported SATP mode. I'm not sure there is a
specific reason, that's just what we have always done since we allowed
a user to specify the SATP mode.</pre>
        </blockquote>
        Supporting to the above comments, here is the commit that allows
        users to specify the SATP mode<br>
        <p><a href="https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c316105481640" class="moz-txt-link-freetext" moz-do-not-send="true">https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c316105481640<br>
          </a></p>
        <p>It seems that Risc-V has multiple sizes for addressable
          memory and Linux probes for the machine's support at startup.<br>
          Thus, the reason would be to give the flexibility to users to
          set it rather than having a fixed default SATP mode.<br>
          The authors/reviewers of the commit can put more light on this
          topic.<span style="white-space: pre-wrap">
</span></p>
        <blockquote type="cite" cite="mid:CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">If not, please check the git history and it there isn't an answer there, ask one of the qemu developers
who work on risc-v. It would be nice to have a sentence about that in the commit log.

Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I think defaulting to a profile (RVA22S64) would be the way to go,
that will also enable a known set of extensions.

Alistair

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">   <a class="moz-txt-link-freetext" href="https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d22a8814" moz-do-not-send="true">https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d22a8814</a>

I'm only asking because it seems like it might be a good fit for us and I noticed it when
searching the qemu commit logs looking for sv39.</pre>
          </blockquote>
        </blockquote>
        I added&nbsp; &quot;-cpu rv64,sv39=true&quot; options for risc-v by default as
        mentioned in the bug requirements.<br>
        <br>
        The support for RVA22S64 looks good to have&nbsp; provided that it
        doesn't break other risc-v builds/tests being done in Yocto.<br>
        Following commit adds the RVA22S64 profile and corresponding
        extensions in qemu.<br>
        <a href="https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425de550c" moz-do-not-send="true">https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425de550c<br>
          <br>
        </a>I also tested with passing <i>&quot;QB_CPU = &quot;-cpu rv64i,
          rva22s64=true&quot;&quot;&nbsp; </i>in <i>qemuriscv.inc</i> file and asan
        works with that as well.<br>
      </blockquote>
      <p><br>
      </p>
      <p>Good.&nbsp;</p>
      <br>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:a52736b6-71d1-4301-a602-096808a60209@windriver.com">I
        will send a V2 with setting &quot;rva22s64&quot; profile for risc-v 64
        only as follows:<br>
        <br>
        <b><i>QB_CPU:riscv64 ?= &quot;-cpu rv64, rva22s64=true&quot;</i><br>
        </b></blockquote>
      <p><br>
      </p>
      <p>Using the weak operator &quot;?=&quot; to allow overrides seems like a
        good choice at least for now.<br>
      </p>
      <p>Do you really need both <br>
        &nbsp;&nbsp; &quot;-cpu rv64, rva22s64=true&quot;<br>
        rather than just:<br>
      </p>
      <p>&nbsp;&nbsp; &quot;-cpu rva22s64&quot; <br>
      </p>
      <p>?<br>
      </p>
      <p>Remember, I don't know much about the qemu internals so maybe
        this is obvious to you.<br>
      </p>
    </blockquote>
    Thanks for the suggestion. &quot;-cpu rva22s64&quot; does work. <br>
    Even I am new to the qemu internals.<br>
    <br>
    <br>
    Regards,<br>
    Yash<br>
    <blockquote type="cite" cite="mid:9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com">
      <p> </p>
      <p>../Randy</p>
      <p><br>
      </p>
      <p><br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------EP4vf8czx0cYxszp5DB7q0dA--

