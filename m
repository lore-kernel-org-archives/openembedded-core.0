Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAF9C78854
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 14:30:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.62])
 by mx.groups.io with SMTP id smtpd.web11.19419.1726842634903767687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 07:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=t4pLTcUo;
 spf=pass (domain: outlook.com, ip: 40.92.89.62, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmSRBikcUhH+FJyOvgO03FFydZD38HIn5H2lp2uTLAGxHF85dRHogW6zcIMTYK4UwkX6tKSH6wGUHkdZg017TNHNVX8OOelanuse+Uf7tMigyAoz4xk9vhUGuuo4Ja0X3Fl+OcE7ZyEOaBw6a9QGXM05EyCFAmuzBK/tI8rKDIUq9IuqqWOlpAcI+wmsO3K80uqlP+yzRf/6oEPCEvBv0j4F8r6mDlpuREfmg2T7tRa8NIo+0UsDzs2S4W/f0bFT/Mgyi/bpnFdZfyrfx0Rbk8cVgynOslRIERGU6EaMkrLNeqk74wtgtUWYjYhi+X1Y/JtKq0w2D/3nxY2aIyRPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u73u7avf4h4zKsx4reVqLstZxYuBpNfvIon6hz2A5/E=;
 b=Sp7nQ64rBUYPBhlKTX9gfK17w8T1hn9pD9uGZCFPfNwecU8jQJackVUwsQfdoi0Ozc9FyVZoyWmoag0YWIWEJQN2f4u/RCly53usjlV6OI7gYC8dGiBHIUYaQ6xM0pYk3r0NBAQMkSH5m/AEicSM1TJIpPElQ9yO7p+242TAW38geW3Wk/XiZ/rxvea9vu8zMB0O+IPwAzUIIqvFA/R1ir1JAaw6RprJhojB0ARQzykQXEi++oO+xrwp2WDj06EnIk/WHGOoa9/BJL0sYVwWD4lJx1V/fmwo8GI9LBZr59KjpWoWsTe2Ez0b/VEosy4IW++XPx1ffpUWW9yRukHGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u73u7avf4h4zKsx4reVqLstZxYuBpNfvIon6hz2A5/E=;
 b=t4pLTcUoTOIspE/R90aTnORcUVNm15+daIs4P2u+1WkqwDOtnmePqRbKx1FqAhUsycBpSw7K+c2xoDkMj3HfV9CJCh6BwgSSy2Cl3zAvZCLa64UR1eMspdBQiCGxkMvMx3/aySdA5lwJ+HDHOit/AVIj1VqvKMb7jiTIbvRApDz96PbBjeAKngB5dnGn1h3yXJOpyvbGeaextypDCwsVVfYvFv64/MRsFE23DMZuIBzmKV3kYrNWmNfJOcO/CbGebH7eMylcWFxKQqFBi5KljDkDHyow6UQFYlfNI1OfwrQdN+aKYxErfD8dpRq/PA+myvNaQLdIzdoVjtzeAmIKSQ==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by DU2PR07MB8064.eurprd07.prod.outlook.com (2603:10a6:10:23b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 14:30:32 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%6]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 14:30:31 +0000
Message-ID: 
 <GV1PR07MB9120F113BECCDD2540ED5333A86C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Fri, 20 Sep 2024 16:30:31 +0200
User-Agent: Mozilla Thunderbird
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Language: en-US
Cc: "steve@sakoman.com" <steve@sakoman.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Subject: [scarthgap, kirkstone] backport request
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::19) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: 
 <5d1cf7e0-023a-47f8-a1f8-0d8ec0e2096b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|DU2PR07MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: ff323167-bba7-4e8a-d88b-08dcd980c80c
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|5072599009|7092599003|15080799006|461199028|19110799003|6090799003|1602099012|10035399004|4302099013|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 
	Nf87RQ3pc6djJd5a7F2khfsIt1+MeVpyhac/PUQmW/Z2GPCg/YlbI2xT7ZMasU96CEAF5M/RJcKc4HRYnFhCERRlIrkkuWb2V7fxN3KJsUDW3OKlaFU4C6voGqbZ3dQ/C/Lt2wskBrC/aanDbCFPlf42dqONOp261J+YJl7I12wZkQMYDQNhbyNWncSLafQ2+gr7NprAfl4dzD2+g7ynR4hthcm8ZZ169yBuOVX0MNheZCP2kL6e03A7dGuW3bWa6tzf0HGjyiTK178QetmwiqUVt8cDRoxJujh7vJIU2RFZnf7PtS/7E2bojZ1aifcVMnGhFFxnqVolYnTRjcfiEBvpV2fSs/N93wbRmJU5BSJJKl0j22szSrMwf1p4Jxwz8NqUTY0Iu7108XbjCbNqTts5YeeEDGFjb9uVNj6MZs9H7PJNOcA7fWqQfPBhiRUDG/F13+yxaXqur++R49A9pHzxgjtXIFz1jJPP4LzCiNRdx/lw0T04n94KR4l9CuclNisOpSDmoxir1dogwF5Flsw3oE5RUfwXgSO7mhue7Y8gfROKl4TjoCJpn9RMn2KjYhHtRmZRaAYHG6/CwJOlJPHLCGucSGz/2tym3q3py4oN5KoqunqXm4enYhROc4mCkgrOrq3B/74U3biHAz2n3hg7IMsMUWlwWfPODvpXuAbaG2o/dQvzi0wewBITzm1usBOecB8Nwye1YPgndAD9W+85TOohFN1p2ybNErUkex5uXM3MfW9d/fqEFarf1pHtBL1qkg0B7Fsatj1RYnHCVDuqk4GY1uloquLMVNsXCFtLUhIxYb/fawZaq3WJ1ydfclhmg+TAsR8McHHQJwKB6iOi59ezFNgcAP6yGT7u9TDE3o3dYpQ703CVpwn/FC6Y0lduzzTR590o8IFZG8LDhA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3BkekRsYU5wSTB3aHpFYndlVWNoRHhDN2FPK3dZQmtoU2xXNkpVZThTeC9I?=
 =?utf-8?B?b2tuNGdnNURIMFhIeXEvZ0E4QVBOYmtTZHRJazhnbnh3V1FnOWdBODJydHYw?=
 =?utf-8?B?eFlQU0FHL3pkSDIyK0pyZTBMbEZxNDIvYXBGa2JnQUtnY0lPUXZiRDAxdkI2?=
 =?utf-8?B?VFJTT0VyRkZrQUNJdmpTUEt3QlcxVnFGdlV2L2Z5Rm96Z01rZG9pMFJCeTN6?=
 =?utf-8?B?U25kM0J3RGZlemxpUzJDRFd4Qk1CbW9NZFZpOGptMTZETFRKamY5dnA2bkJK?=
 =?utf-8?B?Z0Y5cTFTTmVXTXUvTndkNEo2QzhQaGtmd0M0YWluNTZhZHhQZVJZeG53b3Rm?=
 =?utf-8?B?angwQ3gwL3Y3MjN6aVQvNjlOL2pDcnBvTGJ1VzJENFJUSW1HWUMxSk9DUE1P?=
 =?utf-8?B?cnhZTnQ1QnJ5Z3Q4S2prajVWandnSkhVY3d2UkpXSnN2WGZZTHdpQXhSY3hj?=
 =?utf-8?B?V05xaTN4ZFVyQ01aSk53ajQyUmttajFKdUhlZTZTM2x4VXY4SUc5eVlhT0lQ?=
 =?utf-8?B?dXlZNk4xdFIweUY0bzdwR2RBUkRnaE0rMzh4VzI3K3FTcFhVenpzaWt1ZEd2?=
 =?utf-8?B?UWtiN3k0RDc1Tjh4V2FXNWZnaXZzNURURGFDaEw0d05oYzhwZElhZkIwb2xk?=
 =?utf-8?B?aTFVOVlyZURlUGNEbXYxVDMrZEpVK1pYd1JsdzRrZlI2aUlpcUlyc1JmVDZr?=
 =?utf-8?B?U0tUbW92NGZyb0Z1VFVkM2xRQVRTWHFURlpsQU9neGp5Z1NLMUc3bWI4N296?=
 =?utf-8?B?QTNVSGlsTUV6WnViQzRZOVBVS1F6RmxjbDVBQnE2SUExbGsyUmxRalllR0RB?=
 =?utf-8?B?ZUw3bGp1K0w3M3hRM3lPQUNPTEdqU2JsdUd1MUNpaFVERG8vTWg2bjE0R05y?=
 =?utf-8?B?emRTV0NqVU1WZlJYalhlcGdEZTNaN2x5Vk1pTlZqWlU0VW1lS0owSnVjWEN0?=
 =?utf-8?B?a1NSVFprTlZuaXAxTU9PM0dNdkZjVXNsekZqTWJXcVR3V1J5VERRQ1Z1cHdz?=
 =?utf-8?B?WWpJVnVCc1pLQ2oyY1BoeDFKTzQrcDdqenpGY2Y3b21BVWVCMjZ2ODdNUzIy?=
 =?utf-8?B?QlAzM1U2dzBURTBPcG1tMDZDRjZIRGJtSFZrZndXRlozRm5lTmtMSjFzN1Vt?=
 =?utf-8?B?b203TVltSDJGNEQyMjgxbzdsSm1kRzRRaTMya0M0TkZrT1EvbFdYcktXQWJF?=
 =?utf-8?B?bXJKeW9kWEdBN0FDVjFqWi9VeXZ1Yy82dThBV0paS00vdk5kNEJ5TTRGakUz?=
 =?utf-8?B?MTRidk8yWFg3aHNET0o4V010VUNXTkZwUlVqUGJrY01PSEFlWXNUaFVkL1dI?=
 =?utf-8?B?R3czWG42azZvbHNpbmtWWmE3WGd2TUdZcTY0UWlSZXB4bkw4Q09SNlJEYWIw?=
 =?utf-8?B?SWRkWUphNHo1Tnh3OG1CQXBOa05wS21GQjZRRlRZQWVuZmkyYSthK1p5SHli?=
 =?utf-8?B?R1RoeXBOZXJFTy9PRFRITjYwSWRzNGIwSDBFWUQxTkwxbklkOUlVMmZTSGZr?=
 =?utf-8?B?UHM3L01sbFk5eThrU0hQTDVVTWJNUFg5WGpvUnhwYU1LSHJVWkxLb005ZXlz?=
 =?utf-8?B?c3pDU1dWc2dRZ3h6WEt1NHlPQUhybWs5emQzS1VNSnV0UHJxb3ZyQ2tiY0dv?=
 =?utf-8?B?YjdRMC9BcUIrNEtLdFUyblRMRTZJZjNYSk5YZ1l3R0dOSmQ4RzlpUkdrMHA4?=
 =?utf-8?B?ZWEwNzJVcmxUSm02SCs5RzdCSWRSaUFCbjE5aE5VZzdpVVIzL3FUNGpEODdS?=
 =?utf-8?Q?HeF2tLllVoxcYqp9WI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff323167-bba7-4e8a-d88b-08dcd980c80c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 14:30:31.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 14:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204757

Hi,


could you please backport the following commits to scarthgap and kirkstone

runqemu: keep generating tap devices -- 
https://git.yoctoproject.org/poky/commit/?id=c9a999940069623b95e8300fead4838de9edccb8
testimage: fallback for empty IMAGE_LINK_NAME -- 
https://git.yoctoproject.org/poky/commit/?id=309d1bd9357e91934dce1e8fe415cf945a264be8
testexport: fallback for empty IMAGE_LINK_NAME -- 
https://git.yoctoproject.org/poky/commit/?id=2de2968b8c142589a6fad47b9a82771ab7e5c0ab

in the next batches of scarthgap and kirkstone.
All of them fix long standing issues in runqemu, testimnage and testexport

Thanks in advance

