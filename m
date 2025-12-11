Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44447D41C23
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 11:27:02 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7205.1765452415300690676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 03:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Fhe0Yk6o;
 spf=pass (domain: cherry.de, ip: 40.107.162.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckwRxfq8a28GQ/FmmpuTGKffzjOg1k332DoATeFjgOb5NihFkS/2n+Nd/YI1P9adE2RGJ2vDTtt68E5ZSid0e6vh2j7GVaDSqh2JrbLTQdXmJjdBJONtHbz8mwSbS+cRKwyTODkMx5JEBF75HV0ZYW/pwiIAmGMs+CwADo9uWIaI/5EkPdmXE1/4blH1zidUqob15yxdV1E1nUjcLmHyjyZMx0IFJuQZmVYxRNjGMkysxx0kJM804ROyuZ2ArfxiIAq1FRqnDRFW06HEdamDf3qTNmTd441QFpwfxbyCEhlCxsvL/VpDXnfY6wgCHlibh8FkK1+l+p0MJshAbKBoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjGXhgEw2o14qo7MY2O3avtvHkYPePcOSJR9jJC3sXo=;
 b=WN2pHCr5kPNk1SZF9ITzE7uZtRspwBKBX+NA1TFpw6l37kg5SxE9Y8PipoKRA2CwTjmJCWOX2hNpuoKplmAG2kmvqTE1JtRLzJxloeLcw2IO3aXZPt/xrlfLFTukibA3c2EM+r4qupYQ3gRcNEDrHrFyX96s0TLAZhWmYDFg5GnEHF+cMoOgrHjSE8htdJptkswPI/ILMU05MBxh2Socdb/XZlG1+604hfy7bEXNKO9mqB2B10bMatI1vRkt8Qdvi/LIAkTTfAKOmVFp1RhU6olGXOsXGhUHBbRoWs5SbEYY2+t8Kxw/ir+PrBUeHfZmrhFlClXzuafBHLpLMfmXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjGXhgEw2o14qo7MY2O3avtvHkYPePcOSJR9jJC3sXo=;
 b=Fhe0Yk6oFp2oO4jGp28xqdTXPw59d5FN6dE98ycKYbdLolBvO5Iin6+vvpbGLNA/pEj+8AeOj0rN2sJr7vh9hrV0Ak7LjyGAg0iMl1aMG1BvCvKqp4VNPLV55DLtHnAlitlOcua4eRDs13xYKKlI0yHcInOy4NaCf3wndPiHifI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10701.eurprd04.prod.outlook.com (2603:10a6:150:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 11:26:49 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:26:49 +0000
Message-ID: <2afd21ea-e12b-4caa-9aff-0a23b426612b@cherry.de>
Date: Thu, 11 Dec 2025 12:26:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] libtoml: new recipe
To: adam.duskett@amarulasolutions.com,
 openembedded-core@lists.openembedded.org
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
 <20251210110340.3631065-2-adam.duskett@amarulasolutions.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251210110340.3631065-2-adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10701:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d4509f-e5f2-44fb-8df4-08de38a82d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0oyaVNIdWZRVlBiNW94UXc0UkQzU01jNitNdFliUzV6c29tVWhDT2lvSHY3?=
 =?utf-8?B?QytHeWlqYitmZVBHRHBOSzNPa0lFd09JMXRRYTJYa1c1cVZ0L04xVDJneVg5?=
 =?utf-8?B?ZERna3M4ZFN1dlB0RjgrZUpZTmMxSFZzNlB1UjcveHkrbjJETnNoUGxDM0lW?=
 =?utf-8?B?QVdNRml5YmFsK0FwdnlOZlJRaDh5dWZXbFErKzdyVFRIcXgwakdYejF5T2VN?=
 =?utf-8?B?NzFsTVJtR0NTd2JFbENFQVQ1V3dYc2p2ZWZqbEtvc0RuNDdUYVd0K1VpL1Fm?=
 =?utf-8?B?VFZRTEVJdStCZXkxRlB4OUtEdkVkczQzejNzTmZaSUQ5Qi9JUlppNFIrU2Uw?=
 =?utf-8?B?M1hVazFxMkc2V1lBb0xQbGczeTNCZzBKL2VULzREQXBXYldvWHUrM3Mwb0pF?=
 =?utf-8?B?Z0Jxei9oVVRnTzUwdnMyNUgyNkpCakp0RENBZHNXV0k0SWRNYkxraEp1NzRs?=
 =?utf-8?B?czhmYWpuV0x1OVlLS2swNm5ZSnVzRWNzdFgrUHJ3UjByNWlVWFR5UWFpdFlZ?=
 =?utf-8?B?VFhVdjJrekpWN2JuWDc2SW8wWmxmZnlscVd2RVhPVkltU1FYQTRSRGRSZFpI?=
 =?utf-8?B?RHhESi9uWXZBSkF1UjRzbWdMQzlPZlFtQUhMVjZWb1MwaktRMHFxVG9jVTdw?=
 =?utf-8?B?L0RtaE1keGFWRXBGQ2kwRmtuMDE4eGUzckFocnBLdXBvaG9qVDBsZER5L1do?=
 =?utf-8?B?T0xvNk5jbmtIZjBCNUdndmsrcVFQOERhZWlHVTQxTERpOVR2R3EramM4TlZE?=
 =?utf-8?B?RGxJV3hGQXN6NU9YeU16WVFMT1pLZnZSYlZhOGtOYUx4VElHYTZhZVFPVVlu?=
 =?utf-8?B?SDIydnZJamxLSW44clVnUDVheVRKaGYwcmxnQjFERjRvUW5oYWUyUTNDYyt2?=
 =?utf-8?B?Y0RaeWpNVzl0UGs2aUJRTjNyc253N0R2cExKdCsxVzlLSmF1MS9mcVlPakpr?=
 =?utf-8?B?UGF1OENXTE5XSWdtWVJybEFMOTNKMysrMm5EVmlvWHo1ZUlyWm5YN3BkL0Vk?=
 =?utf-8?B?aSsrMHV1dEVtMmJYT3I5eVB0MWRGUktNdTMwWk4rR3dsRkN6Lysxcm52Ukgz?=
 =?utf-8?B?MzUyOGNWdHY5M3BEWEdEdnF4Y0gwZlhlSXZDd2FSTkFrN0NFYkhURzN6ZE91?=
 =?utf-8?B?eTRqbjBBOXFqZjVhdkNvbDZqZk82UitJdHBFT1BueHV2MDVCbDEyYlc3OFJx?=
 =?utf-8?B?MisvQnoyaExJMTVIcEUvMUtrWEFYQzh3cEZUTnhZampFR1cwMzZkZXo3bnMw?=
 =?utf-8?B?MmNuTVZtYWUxZUlyU3N5ZnB5ckZKOER0UHp2RWVKVnNYVTFybHdQcnBoMk4y?=
 =?utf-8?B?NEU0Q2d4SENyRkRzL21UWXc2MTUxTHFZTkltSklLam01eXFTd0taY2w1U05u?=
 =?utf-8?B?TzlJZHF5YkZzcVdyTTVoZXRmYk1aSjVOTDVETldqM2JBSEc2MkdJeGpRNU4x?=
 =?utf-8?B?T1lvSlZ6RDAxZDhiN0lHY0hwcTBUZ2NkN243LzFHRHR1SThRTXl6bG9YVHN5?=
 =?utf-8?B?bVZONytmSDJpYnNCTVAwMWI1V3ZVUm1PdGZIblcrUCtWcW1WOWRHUjZ2akdq?=
 =?utf-8?B?R0xpZGY4U1dGNkFLMFRmd3ZGQkxjcGsvdGRRdGh2bkZtaXpQSm1rUVExSGZ5?=
 =?utf-8?B?bHcxSTNTQTYxYktHTWV0aW1UM0lSc1Q0clVzTTdIdjNpNEx2THl3cmw1b29v?=
 =?utf-8?B?MThYWHFvK0tjVjZhYjJaSzlrb3pLSERYMzJPZ2ZDaStlcGtYVVVSNTFFT01v?=
 =?utf-8?B?UU54bDRWQjFRSXRtTWtpdTNudzhnTm9mMWpoUWVCc0hnYTdqaHBMMUF4RHZF?=
 =?utf-8?B?THltU3VBd2hvN1o5NUZrNWFmd2IxVnJlMmE1Z0Z6eUVZbmtxTVc4R1ZkNE82?=
 =?utf-8?B?YkRDZkhOdWxRVDhCemEwSjJHbXdTak1aNmp1M1U3a3k2YnIxQk1ON2ZlMlBm?=
 =?utf-8?B?V3VJVkxtL1ZrN1ZWSmhxRjJ5ZG9zUjlGL2UwRDA3U0RiYm52dzhEaGpmWkVN?=
 =?utf-8?B?R3BKOGpiUE9nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGZpTFJZWDEwV3JiYmoyWVkwTUdjS0NLQnRPTlpvMVIwWWU2cnFjVHBNWC9v?=
 =?utf-8?B?VEE5T0EzV0dtUGJwMTcxb3VqakphZFhyRGF6LytMOGJmdnZRcGxMNjBsMEdY?=
 =?utf-8?B?cUNaT3hkbEFnNFV3NGtqR2l1cTBGcnc1MHFkS3BUbUJ6VUZOcTFMdnV0Tjll?=
 =?utf-8?B?RHNjRGZycC9XRWJvVlJ6MjdhTlNiRk81Tk9qejdYKzI3bTRLNDdVeTkraWpF?=
 =?utf-8?B?WHVZWmxCaU5xdnlwUDF4cml1ZC82RlAzeFhtYlFjM3JGQWJKTmdDNlNQQlg2?=
 =?utf-8?B?Wm8wUkhHR2Z5RTNTNnFvV1g2R0tBOTJWQ3hHcTlhaEE3elVpZ0VjVVZhOVRm?=
 =?utf-8?B?bjNVNkl6Yk9iZzQ4UGk3dTRRTFhmWFVnZ1lqb3pOOTlwckJaa0plcEJwZTFJ?=
 =?utf-8?B?NU9aSmcwOTRIeG41QXQvb1VBeHdEQW5xdzJLRlNRSGlaSVRqTFJXT1NJcjh3?=
 =?utf-8?B?Z3JDZDRLMXg0cDI1ZkJkaWZzM1ZKOWkwOHllVFVHMG55MzdIY2wwRlFqaGVG?=
 =?utf-8?B?a3dBaXJGajdvK2ZhSFg1azBtZTBoaVNoeGgzcE9UdmQ5NUFad3o0eFAvUVN0?=
 =?utf-8?B?MjJnT2lld3l1UXJQc1dBR3hKWmZ4NFdHK3dUeVVKUHVUSDdadDFYeCtHWWov?=
 =?utf-8?B?VGNzbW9qeTg2NndRd29lQllQMXhCbVlGYlAyTGNnaktRZEE5ZDlHeTVCRmhR?=
 =?utf-8?B?KzZCWm5MOFVQaURBQWQ0RVJOK3lReVp6dE5ZQ0FnbElHSkpzVWRQSFEwYkNw?=
 =?utf-8?B?TGxJY204RlB1eDgwRSt6UHlnNXNwbU1IQXBTd1ZIMDhvL2tpb2tiMERvNlJR?=
 =?utf-8?B?bEQ2bjRkcWJTaHp6VVIyY29WRzY2N2xoaDRENE45UFpiZkR1VWthejUrS3Np?=
 =?utf-8?B?NFZybGN5S2lDRUw4UVhaY0RtU1BhbVQ5dmcvRjV6a3lkcjFOQ0YyNzI4Vnh4?=
 =?utf-8?B?MVZ2NDhGR2FKYzBWLytaUyt4cWVEdG1UZEVTRXZ4dnlLbWY5aGJYSFpwajBr?=
 =?utf-8?B?UmdyZTM1VXpiQU5FM1BTRk1ubWVhdGxMWnBrWVBrOWhJbS9pWlluUkRFS05h?=
 =?utf-8?B?T2VLRkxiNTBOK1ZndTVjY04vT090T1Z0MlZRMm1wOWwzZG5VRXNNeVAxa2V3?=
 =?utf-8?B?UStQNnBlYmI1SGd1TmZTNFZ5WW5mNG1sN1BTWTUza3FIV1VjSklGazRrZkNY?=
 =?utf-8?B?dmRub2FyR3ZVVW1GL29Mczg5aEN2UitRaHNsdm5hcjdGU3NSWjd6bHhrV0w3?=
 =?utf-8?B?c3l2N0c1bFN0RG4xeXArOHpuKzhNS0E2UVpXUlBiSU5HSXdWbWN5QzQ2UnF0?=
 =?utf-8?B?dVRsOUVwczZ1VGt2MmNvSExhYkZFTlRsUzVKY2gvVHFudUFoY2RRQjhqdTBM?=
 =?utf-8?B?c1ZZS3dzN0FaRDNoTUpZck0vOVRqQmRrSE1STVRJUXo5c3h2eCs0SnNlcUFj?=
 =?utf-8?B?ay9NejJ0N2ZRWDV0ajY0eWxiNVhOcGo5WkJ5Q3JDeTA2bFhvRi9CaGZ5ZUpV?=
 =?utf-8?B?TVIrSE9JbHRXWmp4SjVhaVM1VUNpMVpQM0lzNzVMMTBCTVBydGo0aGZDbERD?=
 =?utf-8?B?by9zQmlDRXBEWDB0RTdnWTZ5bTZkdnE4dGM3UGVwRFY3VEZBWWtlZHQ3Y05L?=
 =?utf-8?B?UkxJaFE5RmFpUU9NY05HNGhFaVdNS2FmOUNOVGwwcWNNd3BGYVFlYk9sUFJZ?=
 =?utf-8?B?RG9WRHhhcUVxalU2WXBKUGdWRGFJQ2dPa1VTS2o1dHhGTjJ1N1JyNTdiUXFI?=
 =?utf-8?B?T2pyNitQZGJTdmg3K3pybklwUFF0WDhkMEFmQTN4aU8wc2dkL2s0L3N4bEI0?=
 =?utf-8?B?VWV5TDNrdTREbHorYTN6U1loTld0VmlheHJBc1ppTjdsa2VnVnExMm9zZ3lG?=
 =?utf-8?B?SGkvcTdqK3ZmU3IzV244UXUwUDZCdmVSY0R5bjduOUNhdGYzbzYrTnl1a2dl?=
 =?utf-8?B?Qkp4RmgxWTdaS0ZzaGpCYWUzRDNUZ080T0gwVnJqWkdyUGNwNU12dHhhSFZp?=
 =?utf-8?B?cmtxaXV2VG13cDdSVWlsN3BGa2F2OU5EQTJQV3FNM21qUmhvRkxDZnlWSjhj?=
 =?utf-8?B?OHdkN3BWbkNlUVUzT04rYjJSQlJxSGM2L1hBKy9qUTlienNNYzRDYSs3NHZv?=
 =?utf-8?B?RnBPbGFncUtTcGlFNGpibHkrc2dmaXpWdmxMOU9ZNzhXeS9obkFtcDlaR3o3?=
 =?utf-8?Q?ZmLYVArEZLWS0iE2Dr+yYAA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d4509f-e5f2-44fb-8df4-08de38a82d08
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:26:49.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/yHt0V6vMflhtAaCcepc7KNEXT3koEO+NNKe+/4og6Pl5pbSQHxyEO/X+8ssyTcCfBipxfpCmngZUGPuE+8g2xKNL/a9UvPSc8qZPYEWik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10701
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227521

Hi Adam,

On 12/10/25 12:03 PM, Adam Duskett via lists.openembedded.org wrote:
> [You don't often get email from adam.duskett=amarulasolutions.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> DNF5 requires libtoml. As such, copy libtoml from
> meta-openembedded to openembedded-core.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
>   .../libtoml11/files/run-ptest                 | 12 +++++
>   .../libtoml11/libtoml11_4.4.0.bb              | 40 ++++++++++++++++
>   3 files changed, 98 insertions(+)
>   create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
>   create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
>   create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> 
> diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
> new file mode 100644
> index 0000000000..c8c9922d55
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
> @@ -0,0 +1,46 @@
> +From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 7 Mar 2025 11:35:46 -0800
> +Subject: [PATCH] Remove whitespace in operator""
> +
> +Clang 20+ errors about this whitespace.
> +
> +Fixes
> +include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_toml' preceded by whitespace in a literal operator declaration is deprecated [-Werror,-Wdeprecated-literal-operator]
> +|    22 | ::toml::value operator"" _toml(const char* str, std::size_t len);
> +|       |               ~~~~~~~~~~~^~~~~
> +|       |               operator""_toml
> +
> +Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285]

This is now merged, so should be a backport. Please don't simply 
rephrase, but also check that the content is the same as merged (or 
simply do a proper backport).

Since you're importing verbatim, a good idea could be to have a 
follow-up patch that changes that.

(Thanks Khem for sending the patch upstream!).

Cheers,
Quentin

