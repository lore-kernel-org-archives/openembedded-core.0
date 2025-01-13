Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF9AC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:08:06 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.88])
 by mx.groups.io with SMTP id smtpd.web11.17600.1736777276894774706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lUtNXli2;
 spf=pass (domain: cherry.de, ip: 40.107.247.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdxWxg8voR3NNGqmvpkw2+JlwGy+P5H1Q6dRVZaXpVFBeXWd63e7IpZ+WsC7MJ4kUXNZGfMTfRYUZA0L28rc/VI8yr3TEaqC4dXXqtG81JSiiAVOYty930aVKCAp1V06r09FrHJ6hiH2JHRFMoquAwXU/Bv+VQnVLmIg5msGWPa+Ru3bdGKX39A+JLJ+5t6G0DBQFMEWEg/rBtFWeO7CL1Xqo5dEzFgV/JsuaRKSdJfi25i6UN2ogq37bkmuNH9aBG6QkxZ9YlpCap8RSq1eoTnz1nlWO2IegNm2lmEjAE7EzB3L3XX230ASx+y5FYU62EtjnqJTqE9t6qi14Zacew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft2HvTBXAak7GYpIGmJtSpO6najjrzZkC+h4foTgEdE=;
 b=I198zk5Uv0DGpO5SKNXQxw503s/CkQeYlU0/kcLWdB7ZSIMbxTWhMMMRM1liEfqhaTcW/TTHXszxnrvAlLl8FfFKGlffEWkCduIDhCRrN1y7GIVJWIrwC+ILHEpOdbKVK0dH53TJbxLqxQyaOOMO4dkdCJehCbBT+spKdurnd2FXX2wpAaWHAVMxBxo5BeTbJ512Xe6AIz9ckAP1e2lgOEpPg0J9JVXqSKhOWCRc8IaE1ZWwXvWun9UmrVeV7mi3nb/Qqk7clsahc+X6T+lt0ejaPe5wW5B32fozfknXkMDlF7xSp+BCqaJUsSE2KWa1bZlliFEI272btqV5AByWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft2HvTBXAak7GYpIGmJtSpO6najjrzZkC+h4foTgEdE=;
 b=lUtNXli2qEMun8aVzaksM3k63UD/9tx5tD9i7mmbxXJJyYQGYszylRfo7N8gL0AWXERjewyhcSJZINJIFHVU7hWFm9MRidPBDrvn//2jHbSJgBvu5agr2J3N7uO0eRqg/hJCj9eMWhdiE7ZTfGg3lvyR8b8zgRE6q8uGPMHSjvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10775.eurprd04.prod.outlook.com (2603:10a6:150:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:07:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 14:07:51 +0000
Message-ID: <c80fe68f-2045-47c0-a2e8-076f23afcb3c@cherry.de>
Date: Mon, 13 Jan 2025 15:07:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] lib/oe/package: Add debug_frame support
To: othacehe@gnu.org, openembedded-core@lists.openembedded.org
References: <20250108073921.15856-1-othacehe@gnu.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250108073921.15856-1-othacehe@gnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10775:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c8d328-05b6-402b-b06b-08dd33dbaaa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eDJEREhZZFlza3BxTW8xVis3ZVJhU0Y2WUI2ZUNFaXgzMjNKczVwRCs0cVVZ?=
 =?utf-8?B?V1NXd09lMVpxYVZPWkxDdVJSem1vWXVxVTQyUW9EL2pEUzBhVi9NM1JoQnpz?=
 =?utf-8?B?N2NGNFRYMjZZUVYxNjFYdXpFcWFHaFdoSUZOWXhiWjAyV1Q2VzZXZk1aS1Rz?=
 =?utf-8?B?Wkw1V2IwenVLVkxuZElKN3gwQnpGNTJsNEZ5RElrdExlMm1SRXpucUtKYk9E?=
 =?utf-8?B?Z3ZtT01LMDlkY0lBTDZVdjdSYzRKMmJZWkZVSUZQOHVwSTJNejlnU1kvUWtW?=
 =?utf-8?B?c0t0NGlwTnlkMjkraW9LaVdoUkRZTUFUUzJLeWFpaldDUnplU0lyM2o3Wkw4?=
 =?utf-8?B?VlhrVkxpbVJLQTZaM1BPVEdPc3JNa1NEcENiNjc0Mk1Ec3B1L3pybVZUZlZR?=
 =?utf-8?B?T2k1VXV1RDQxSlJDSWFVL1dlMFYwaXA2dkRIMDJRNkppUU1BM0NVbCtOVGl5?=
 =?utf-8?B?d3lwb2t4NjVyU2VZdnYwNVlaenQ0eDNpZVRIV3JVcHkxNC8yWmRoZnRub0Rt?=
 =?utf-8?B?OEp4NEZyejQyYk9IcEZyZnA5UmVucktKa25tSS94MitRZlhHOU84VjhCSzRP?=
 =?utf-8?B?cGlFMUUvdUw3cFlWU0JiUUJyLytGZTJjSkxvUmNQL2V5WEhvU2xQZ2V1cVF1?=
 =?utf-8?B?V0RoclIvb3pHZjV6dEF5SW1ET2thN204dTJVVm0wY0o0TndZRjc4K2xpODk0?=
 =?utf-8?B?NmpxSkJ4dE1ldU5EWnFrSW5oZVNQMmk2YUptUmtnSkNtWFdrbC81OVMyeklW?=
 =?utf-8?B?N0tNRzlNS1NiVEZ6ckN0Z1RBc2tTT1lFdHJ5S2k0NDFLU3EyUnZ1NGlOdG1G?=
 =?utf-8?B?cjVITmZNRUNlcmQ4R3VJZWMraVp5a0U3ZU9rL0pKUDZIT2Q3QXVDQ3dZd3dI?=
 =?utf-8?B?UkpEWTV0aHFCVVRyWFVkRERJK05wcVVoRks2OWphODQxaFZXNmJoWDc2Y29G?=
 =?utf-8?B?eHJtaDBlbXBmdjQzMHdkRmxYZFVjSCt6OWhKR0s4dDBXa0hXcjhreU0xcitz?=
 =?utf-8?B?TzQ4WnNncS9QM253eEFPWEZVVGlueXJOUEx1bmhvUGJoc2NOeTNqQ1hyTVNZ?=
 =?utf-8?B?VXhWQVFuSHBISkdWSW5iejdNaDc1UXhyNmtTY2RmaUNYeDFzMnBGNmp1T3I0?=
 =?utf-8?B?eFNrSmlVTmtnYmN1QmhMTnJaZG5FUEhoaGxzbUxPUmNyYnFzcTVzTUxXN2hu?=
 =?utf-8?B?SU82NFA2N08wSGF6REdlQzN2M0c0M1dTbXlIa1NyR2NrWGRFUkpWVW14SGds?=
 =?utf-8?B?OUt6Mm50dkNzZ1lmUDU3MytISjhsd2JwRkQ3RUJxR0E1SkZIamp5UjNtVjRK?=
 =?utf-8?B?WEkwbjVWVVlXb1dwVlN4Wm1vZUtvRDZ1cmwrVjZIOEVSMmI0V0tCUEdtZXZn?=
 =?utf-8?B?UUJOK1FtYTlSaFRZcTFPZEM0RmVOSk1USVFsamRwOVRIUG8vT3llcmE2bDBF?=
 =?utf-8?B?dDVlcWdkZlNFa2Nyd08zSFl1MzVlcG0rbnRLSFd5aHBZSTFPVkVDZWd5S214?=
 =?utf-8?B?YlZmaVo1Q2tqYVkxcEU5L3M5U214a1dZT3FOVU5JTWJZWnQ5ZXVRUHlRTkt4?=
 =?utf-8?B?WFdGL1lmbXZSQ2NGOTBoa0NENXBZV3pSRTdQc3pKVGdRZkZrR1czWkFGZnVv?=
 =?utf-8?B?N0lPeTR6R0xsaXJTSm12dlp6RFNMVE9yVC9yNHdzRENSTGFzTSt0T3FROFRC?=
 =?utf-8?B?TTYyZ2lPRFVOMTU4SGhTaEd2WmdjQnlDOXpxSU1QUmRid1p3d2FmblBIejMv?=
 =?utf-8?B?b1FCb2d0T0RaekE2NzFIMy9nTnl3bzVPdEZ3ZGI5aXNsSnAyVW9WMnR5aStQ?=
 =?utf-8?B?NjA1MEV6MWZMcGVFN2krdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3VhbHBENGQwbkhOVzNjMm84ZVlSNS9lRGs4NXFhUXMrR2N2aVdmVlRDQlRr?=
 =?utf-8?B?UFhGeGVLRXV4KzdaZFV1ZHdOOUJ3ZzNuTHRrOElQRjNFZGZFUi9UQm4vUlA0?=
 =?utf-8?B?clRoY2MyMVpKdjZqZFVpdURESFBQSXo2TS80YXM5WG9lczhrWFh0REs2cUVz?=
 =?utf-8?B?TjR0eml2dGhNcDRJNmMzRkM5eVcvQnAzb0s1MXpVdjlpaCtKS0pkZTdCcDli?=
 =?utf-8?B?MlNobkU5aXRoU09hek5uOGdSRk5XWnhzeXpuRkVQbFNrcTF0dUViK09VNmda?=
 =?utf-8?B?aC9EaVlxVHYrVU5weE0xZHU5TXdNdGY0TFN2L2N0OWw5MUt3Zk0ycDlQblNn?=
 =?utf-8?B?M1QzQzBFQ2wvbjQ3Yno5d2VPV1NESzV4WUZPTUtHYldPczExb3pibDhxMWhJ?=
 =?utf-8?B?OGZwL24rdWZVb0dJeVRkL2VLb2dUQ000M2pORktPb1l2U0tXdk9QdHE0T24y?=
 =?utf-8?B?aFR4bGNlR1UxbFFLY3FiTXRKdXMvaXpxbXJvZUhJcUZERDM5OVk3MVVTNENW?=
 =?utf-8?B?SjlWQVNxTlQ4MkgwTlZSSjdLeTBBdjJiNmJQTldrT0hjbUNPVEZBNWVqQ0Y2?=
 =?utf-8?B?eWVsZ2Y4ZVFtQmpHQTI1NFl5ZnRMcnZFY1dHV1VPbXNWTkhZQXNZRDNNdks5?=
 =?utf-8?B?V2JlbThTa0hpQjJmck5UQWxrUzRaeUQ1T21uaDRocXdhK3pyZ09QanVZc2dI?=
 =?utf-8?B?NFNSK09aZDFPUkQxWDBPSDArcWpxQld2RGFwSGxYaDdBR0NJaWFSUGhaNG4x?=
 =?utf-8?B?TW1MUVpBYkg0SFErbC9aZlhuMzdVVlNtalJ0NkNTVUFqcDc3Y25sYlRTOVJY?=
 =?utf-8?B?c1lMNSswRERZNU8xUE1yVEkwdGJnYlFrdVNkdy9CWG9YMy9BejN6cnNIbFFI?=
 =?utf-8?B?ZjBiT2pCenNnUjFpWk5SM1VSdmhHT3hSeXVXdzdMTTNuWEtKOGgzUTB2TVBO?=
 =?utf-8?B?ZzhYYmZJNElDc3hNMVh4L25RaUxEMDFZWk9qVUJjdXBBaHpST3dGWSs2VXcv?=
 =?utf-8?B?alpTRkV0N1k4RnpTemh2em5NNGxGVEtCbnVSWDNyMFVqUEdMUGwvWEtkZk1h?=
 =?utf-8?B?ak4yZ05FeXoxRStMc0dYVlpUQzV5eDE5VUZiUndta2NWQmFIcncySUR2a3dZ?=
 =?utf-8?B?Q0djYVBkK3VkaENuRTg4cjU4RDZNbHVnejFLYWhHQ3hFdC9rWTRkbHhaOHRi?=
 =?utf-8?B?NEVKdE1xOXdCbjZvZmV4QmZSZmJvZDkxcWhqTlJIZ0RZYmNseFlBK0dnUVNR?=
 =?utf-8?B?bzNFbUJWRG4xbjMyZVF4OENKVlc2WEZTelk3NkVmMUtOVllzKzFWbk8wbWJC?=
 =?utf-8?B?aVhXWk9uOTlCQ0J4TGQxNGJob2tRMnc2S0hyOWxJbnhQSXFFbUNFRERpZXFP?=
 =?utf-8?B?R2RCcjd5SkgwNllsVUtDVXY2N0R1Qyt1SFo3TGE3cUsxYUhUblFjei9KdVpD?=
 =?utf-8?B?OVE3S3dNZ2VNVEg5ald6NGN3NlNoL1RXcXdqL2RnaUhwS3R6NTc2RTdkNm1k?=
 =?utf-8?B?UXBObnA5eHlOMEx0Y09vQkRjMUF0Ui9OYlNPOFZxRDc0SW5GbSswaVpPbXJQ?=
 =?utf-8?B?eVVlekxFbVhuckdMZjRrdlVSaXRhbHFkZWd5ekhKR1YwSHN5VWhsbk9Zdmd3?=
 =?utf-8?B?ak9TSXV6UzZqUzNVb1FYYUw2N282b2dha3VsRFNYWTFtbFRJNWZNS0RYbHg0?=
 =?utf-8?B?Zkozd1U5ZTRqbitZWDk1WXI4Nm9OZ2huaWNtSzU5SEcrWEVtWXM2U2hoWFNy?=
 =?utf-8?B?cnZqZjFacnRuWG5YOVJhR2R4bm82aWZqWjdEWHk4Zm9kTDBPSUpyMHQrYjc0?=
 =?utf-8?B?cUR2T2NTbzNqTFNiZVhsWmRqOW1ENVNreU1YZzdaY2t5OWF4RWszbnUwb2RJ?=
 =?utf-8?B?RWpOSlhudUFrQTdZZGpGL3FzS2VZZXJHOE1OWDVseW9jeVROWGlnM2NnWVI1?=
 =?utf-8?B?N1A3VzZ5RFhTcTJ1b1hRVVJ6R0pGZ0RuRmhLMThnMWk2a2Q2ME54L1J0TTVs?=
 =?utf-8?B?eUhIT0d6SVF0MWc5UFc2ZGNVYktJZGFJUG9YT1VERm1seTV3WEQ4ek91cER1?=
 =?utf-8?B?NHpEUzFZVXVKRU91U2ZiRnhobTZTK2t4NmppelhZbzM2QjdIcjVpQ3pWaWpF?=
 =?utf-8?B?TG16NWFwS0RZSkxzWUxKcEJWT0NtRG1RbEtEMnUranJXVmhnWUdqb1FRUERm?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c8d328-05b6-402b-b06b-08dd33dbaaa3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:07:51.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVLAVNlAbLmuN9lmrPKgV2AMahRhvBgx5gRsx9Cv8EfAuyb6Ro5KCbBCMb6V6lcnvVeWPFajbJNrDlB0MPxSdTGq/WepcMo2idzOZhlyhoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10775
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209726

Hi Mathieu,

On 1/8/25 8:39 AM, Mathieu Othacehe via lists.openembedded.org wrote:
> [You don't often get email from othacehe=gnu.org@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On ARMv7, the .ARM.extab and .ARM.exidx unwinding sections are not providing
> support to get full backtraces on C++ exceptions:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117941
> 
> In addition to those unwinding sections, GCC is providing unwinding
> instructions in DWARF format for ARMv7 binaries under the .debug_frame
> section.
> 
> By instructing 'strip' not to remove the .debug_frame section, one can use
> libunwind on the .debug_frame section to get full backtraces on C++
> exceptions:
> 
> Unexpected exception caught!
> Backtrace:
>    0x4b0c7d: unexpected_handler() + 0x1b
>    0xb6dded55: __cxxabiv1::__terminate(void (*)()) + 0x3
>    0xb6ddedb7: std::terminate() + 0x9
>    0xb6ddf023: __cxa_rethrow + 0x2d
>    0x4b0c61: uncaught_function() + 0x7
>    0x4b0c9f: main + 0x11
>    0xb6c317c7: __libc_start_call_main + 0x41
>    0xb6c31871: __libc_start_main + 0x5f
>    0x4b0901: _start + 0x27
> 
> Add a 'PACKAGE_KEEP_DEBUG_FRAME' variable to keep the .debug_frame section
> around. By using libunwind + minidebuginfo, that provides a way for ARMv7
> Yocto users to get full backtraces on C++ exceptions, on target.
> 

Would be nice to document this variable in the yocto-docs 
(https://git.yoctoproject.org/yocto-docs/). Would you mind sending us a 
patch once this lands (or if there's a v2, maybe alongside or at the 
same time?)? That would be for the variable glossary at the very least. 
Thanks!

> Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
> ---
>   meta/classes-global/staging.bbclass |  4 +++-
>   meta/classes-recipe/kernel.bbclass  |  2 +-
>   meta/lib/oe/package.py              | 22 ++++++++++++----------
>   3 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
> index c2213ffa2b..d9ccf32a73 100644
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -91,10 +91,12 @@ python sysroot_strip () {
>       base_libdir = d.getVar("base_libdir")
>       qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP:' + pn) or "").split()
>       strip_cmd = d.getVar("STRIP")
> +    keep_debug_frame = (d.getVar('PACKAGE_KEEP_DEBUG_FRAME') == '1')

Could be

bb.utils.to_boolean(d.getVar('PACKAGE_KEEP_DEBUG_FRAME'), False)

to convey we're expecting a boolean here (though that would also allow 
y, yes, true, and n, no, false, and fail if it doesn't match any of the 
previous (or 1 or 0)). I suppose that's fine here.

> 
>       max_process = oe.utils.get_bb_number_threads(d)
>       oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process,
> -                           qa_already_stripped=qa_already_stripped)
> +                           qa_already_stripped=qa_already_stripped,
> +                           keep_debug_frame=keep_debug_frame)
>   }
> 
>   do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index a7c4bf0ef4..b052b71be7 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -770,7 +770,7 @@ python do_strip() {
>       if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
>           kernel_image_stripped = kernel_image + ".stripped"
>           shutil.copy2(kernel_image, kernel_image_stripped)
> -        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
> +        oe.package.runstrip((kernel_image_stripped, 8, strip), False, extra_sections)
>           bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
>               extra_sections)
>   }
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 1af10b7eb0..561df35313 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -18,7 +18,7 @@ import shutil
> 
>   import oe.cachedpath
> 
> -def runstrip(arg):
> +def runstrip(arg, keep_debug_frame=False, extra_strip_sections=''):
>       # Function to strip a single file, called from split_and_strip_files below
>       # A working 'file' (one which works on the target architecture)
>       #
> @@ -27,12 +27,7 @@ def runstrip(arg):
>       # 4 - executable
>       # 8 - shared library
>       # 16 - kernel module
> -
> -    if len(arg) == 3:
> -        (file, elftype, strip) = arg
> -        extra_strip_sections = ''
> -    else:
> -        (file, elftype, strip, extra_strip_sections) = arg
> +    (file, elftype, strip) = arg
> 
>       newmode = None
>       if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> @@ -44,6 +39,7 @@ def runstrip(arg):
>       skip_strip = False
>       # kernel module
>       if elftype & 16:
> +        keep_debug_frame = False
>           if is_kernel_module_signed(file):
>               bb.debug(1, "Skip strip on signed module %s" % file)
>               skip_strip = True
> @@ -60,6 +56,9 @@ def runstrip(arg):
>               for section in extra_strip_sections.split():
>                   stripcmd.extend(["--remove-section=" + section])
> 
> +    if keep_debug_frame:
> +        stripcmd.extend(["--keep-section=.debug_frame"])
> +

thought: would there be a use-case for keeping other sections?

Therefore, instead of having multiple PACKAGE_KEEP_xxx variables, should 
we have PACKAGE_KEEP_SECTION = ".debug_frame"?

Cannot bring more to the discussion as that's outside of my knowledge 
base :)

Cheers,
Quentin

