Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85FDC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 11:13:04 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.89])
 by mx.groups.io with SMTP id smtpd.web11.10534.1747393979552492946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 04:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jMk7yIhI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jMk7yIhI;
 spf=pass (domain: arm.com, ip: 40.107.104.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rRGKL8dnoYaPL5Y9APFbgTuIKasYghjrBi01Zx4gVvItiXWEyRlg8E/d6GzpvNKD12/y0apDBZRr/jqYZ1WGFsa0u9ztV+VDTdRL5e7DIt+tQHAaB0Q6FQ8fW1ULUo1dW3rE5ydurqbhrkEmFMkd8WhJ1HZ/4f1rAjApCcIwvR4AgSxHWx5+eiL4eDzLf5NcUa0zqD9W7MzzSZKNlabE6u41gUDK4ylTuFEk/r9LiQ30sJWl/DxN8amrgXU453iYfGjyKoddoN5D63IGKurlmMkgiiZvc7Wc9Rb3X6+bWJms8mtYlTOoz7V+aN82PH8yqlBbaZ+RYfDv81f6GePHrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCaB5cwVfYx8pE/v5NQYNTvZ7LG9vXG+5CXaE234cBE=;
 b=cPEfqDDnPL1nQvC1PCxPFpOg89bSaaivl4mrD+srd/DorEDNRUzWF6nX3j0+AoWVH+aiUBKYsjTPXGbV82YJ+yT8U7YP6VYXJnbhakSVcke9A+YsO8fgJ35NeXckrIhL1VAySpWkoq1p7abc37j63Rqmhm8wwEvXES+SkB/G8+qoMj0tiQqc0WU+orSbvuxdzORtIS2iwSYaBv18+L1sGI9goqBp9pkrtQTt+a3uw1J2Bcw1A//+Q2qFvRahPQn1vfOhu/Qg3/Kiy/NmKpHMK6XpCuonziHZGB7FKyBvWyciM0HV2dL3A9o33XKDuEi+9bqp8n8Z7CynP/rOJIKJcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCaB5cwVfYx8pE/v5NQYNTvZ7LG9vXG+5CXaE234cBE=;
 b=jMk7yIhIXKfPPIHkNLSauXifjP4QlSoANfW6U0QTvK/xbj8B4P90KqSo3MLxw+qhIomfZ/LkdqzbpPwf5LZg17zA7a70YEMueLBxitG3vQiTDigQZy3vYx+m5pEFzvZR7vec4WCkAMX2WQtQ/gZQS2uCIWhgYYruaPF3Q6svRwk=
Received: from AM0PR10CA0085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::38)
 by AM8PR08MB5843.eurprd08.prod.outlook.com (2603:10a6:20b:1df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 11:12:54 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:208:15:cafe::d9) by AM0PR10CA0085.outlook.office365.com
 (2603:10a6:208:15::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.19 via Frontend Transport; Fri,
 16 May 2025 11:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 11:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmg6GrjL6vdfqrx748sU1ikcNGn9pmTN36MU79QU1gi9N8KIFKSbzIbz7gFdtDvbZ4NVkbtxvlksrDpiVVN5k6AvyRy5+EBbN4njraY/2ExdWIAuH1TvyPcQHhiwUYp7bVnRMM7r7enqyhsd99nNyjQIkXrz55pGLM/HwJbRnGw39BPVm2++L9LjW3hntdFewBZrBZMCTYdlfwdcUCBBk6qWrp8pg0XndtqRDhWOZ8QcJezDM+k2Rdml5Go84esYGfFP2p9Reou4iFc3vC1V/6K5Sxy9aiWvQdr94ZNOoMfOofEla4vzgsDy66o1AG4FeLY+rsIRPJrD8XdqRQVlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCaB5cwVfYx8pE/v5NQYNTvZ7LG9vXG+5CXaE234cBE=;
 b=SxjKQ2+5McEqZUCcgOMt8C8Kl2O+5as/vCSLZOsWJ0P9tVXXK0JNZsHmfPsjuyuMjHqX6dw3PwOxjPgW2mEshrAgwzHS8LWFBb0fWhYb9H9oI/y3fjwpl1V7qw4/OCCnZcJS3PLubje8kFY73uWSzvkmRU1wo+YKN//FocwlWqIosjA4tP50X2isfmGBYxiTcUKXgq7Dix8YE8jJPaRO8dHGxdcIKuWauvLthIW5Sy/lRsssDAmGMwvq3AxMl0OwbPxG/fHNwxjMAbf2A1H1hp1YZ1INJxqZFapbTrqLykpxnpjxHAKT+B3Ez1gJIn4cKRbfDDrjWvG+53mhL/nOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCaB5cwVfYx8pE/v5NQYNTvZ7LG9vXG+5CXaE234cBE=;
 b=jMk7yIhIXKfPPIHkNLSauXifjP4QlSoANfW6U0QTvK/xbj8B4P90KqSo3MLxw+qhIomfZ/LkdqzbpPwf5LZg17zA7a70YEMueLBxitG3vQiTDigQZy3vYx+m5pEFzvZR7vec4WCkAMX2WQtQ/gZQS2uCIWhgYYruaPF3Q6svRwk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6163.eurprd08.prod.outlook.com (2603:10a6:20b:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 11:12:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 11:12:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 03/23] oe/sdk: fix empty SDK manifests
Thread-Topic: [OE-core] [PATCH 03/23] oe/sdk: fix empty SDK manifests
Thread-Index: AQHbwYfHK5cEgtfPeUWI2+4BcF1kbrPOvJUAgAZnG4A=
Date: Fri, 16 May 2025 11:12:23 +0000
Message-ID: <6812AABF-0AB3-4444-B10D-DFB4B52BD3E9@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
 <20250510084400.269726-3-ross.burton@arm.com>
 <CANNYZj9mF8ZHeayOCm5UqTG8Q8daGSABr5mvGc0ZkPAM4x_A6g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9mF8ZHeayOCm5UqTG8Q8daGSABr5mvGc0ZkPAM4x_A6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6163:EE_|AMS0EPF000001AD:EE_|AM8PR08MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: f781db08-663f-4d28-d592-08dd946a9b35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RnFqK1o4RkR1TDMxbUZNd0pzdkIwbjhxRXRBQWZNUi95RXJBZURGWnNxSjVs?=
 =?utf-8?B?bnhjc3NuY0FnRFYyd2JuQ04vcGNhMkR5YUtZL1htaXFack5ueis5Q1VueGtY?=
 =?utf-8?B?OUpMYXg0OWxZeWxWT3g5Wm9YR2thNzFEMHdpRUh1QTJzbWg1V25rQ2xwUTBs?=
 =?utf-8?B?NFR4V3VpT3psSC9QSEtxcWxsQXZnUkhCTFgyRjdOMSsrcWYyRS9MSU5NeUEx?=
 =?utf-8?B?WWxtR2tOUDFvMEkyTFpmSkxaNHlpMGsxK0RISlFMeHcrdmtmK0piSFRYUG9u?=
 =?utf-8?B?eUd3QU41dVgyYnIwZTZ3MzNlY0dTbENSZWlXc0ZIc0hFZUJuNHVHSUxtMk1Z?=
 =?utf-8?B?OFY2ZVVKR24zdHN4bXBia0tHRDVmOFBGNnc4MUZnWjM3UkF4QXJRZngyOXlv?=
 =?utf-8?B?aHZqYTU5SndIbTc4OVk2Ni9FaWZPVFBFTWtsWkxxQ0t1cWtsVUtDZjBYUW50?=
 =?utf-8?B?TS95UWZNVk1wRm9mVURpd1ZGOXM1a2hXTE9TaFNqcGJZTmtrL2dLa2RjMExB?=
 =?utf-8?B?R0F6T0VPQnV3YjQwVGFvdFQ1VWs4WEhYbTZuRWk1L1NUV1MrNWFab1AyQytO?=
 =?utf-8?B?UENyS2xrTThoby9nRCtsTWM2RkdoNGFJWFVucWM2anhaZlFEOUloRXc3ZzNj?=
 =?utf-8?B?SHRuVjA2Qjgwem9tYlhwWk9kd3kyMjU3VVRnckU3TitpUlEwZXpnSGx1dXNv?=
 =?utf-8?B?OW5wTUlWSnF5R1dwNHJrc1l0WFc0OTRnTkIxYnlrcU1kUTE0MTlET0V4TUVw?=
 =?utf-8?B?eDBJdlBlUkZURUJmMzN3aElaQ3B1ZWQ5QUFaUEdYNjIyK2tsQjFjLzRZK0hU?=
 =?utf-8?B?ZmVlczhkZnlSem13RnlBbW52QlJYbzdjYzRZQjJLcFVUS2tPWVRDblVlSjlx?=
 =?utf-8?B?VCt0RDVOZGdkNjBmaXoyZitrY0xMSVloOXNuL004bXRpQWRYYnArc0RKSFFx?=
 =?utf-8?B?SitRaEc5eDRFdE5KOHc4SWJVWFVpcjhvVU5QTzlzeDNESWpsVVRGcHdnWE5P?=
 =?utf-8?B?S2ZhTGh4VEc5ZllCVm5mSVZJODRNTlFDayswbjc2ZVhSeC9HeHZRNlJUSnVS?=
 =?utf-8?B?d1p6R0YwdmtsMnBTbXV0bmE2TXNCd05STWZEZm01TmNZYUZNZDVPZUd0a0I5?=
 =?utf-8?B?UW15M2FGcllkdkJOMTBiQ2NmaTZpNmFtSko2YWd1RWVXNFdtZkJ5ZGVOM2lU?=
 =?utf-8?B?bVFPQnVkWW0vaWtjUVI3Z2dyTzBJRVhMYVlJYmYvWUVOUXdvbXI0S2R1bkRL?=
 =?utf-8?B?UVV6V2JoTmdhaGwyMWtzbHhBQXhLTmhWVGM3Zlp6K2RBNE9jZ1lQVzhnV1cz?=
 =?utf-8?B?RDZXNzMvcTFoZ0ZrM0lqMGxCcDhhY3pMcHZXdEszeXdFd1ZiZnZEVnpJZFFt?=
 =?utf-8?B?aEJyRElERG4yRWIxeThPVE4xK0VxaS95Sm9uYmtoL0NWUXpDdnk1ZEpoMGRp?=
 =?utf-8?B?ZXF6Z29JWVF4aHZjQmhEaWNtRkZLNm1wbktjRVJtSXlCR2YxUEFNUXlzOXIx?=
 =?utf-8?B?VXdHdUJpWCszaVh2cnpXdHhUK2YrT2lObVhXbmg1Z2FpMVI5UVVONzJLNU4z?=
 =?utf-8?B?eitCVTVjNDh5VFN4OUVtQnRzcVVvVzkwb0hscmw0bnNRZ1YvWUNmUTgwakl3?=
 =?utf-8?B?bnVyajFLaE1zS3hlT2d3cWFySWhkdnNJQkdYbGIyUWIrV2phTnErK1FrZFYx?=
 =?utf-8?B?RHB5TGptTUM5WkRyUHN2UkNLZVRQL3l0cXV0NGtaeTI3WTVSSENLLzErclFy?=
 =?utf-8?B?ZFBlc1BHZy83VTNKM1NlVG5xMmh0endwS3VLUUlzYSttaGpGQTd2RDExWXJQ?=
 =?utf-8?B?RkJqTFRGcllkNERsTlpLRTZiZTZxdzB4NG9POWhFTDEvWjlXN0toUVhNZmdR?=
 =?utf-8?B?eVBRU2o0SUpVRi8zVG1Fb0h6NFNDUlNJZnZWVnBEcHo4bi9aNVI2clJwQ2Fu?=
 =?utf-8?B?NnNvTG5zYUJxVko3Y01ja3IyNDhaU29wakRnZTNXZlpTYjdMcStLVll6Vkth?=
 =?utf-8?B?L0RiTlNIMlpRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3A6880BBD1ACE49A10A0A9E8A3F5AFB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6163
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de02ad5d-031f-4839-ac99-08dd946a886b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDNadFN6OENuNWJRMWdpWWc5NFBzbFU2dzNmZjQ3c1NMb3BjbFovZ2hOSkIy?=
 =?utf-8?B?QTFJNFVaUTY1Tzk1dE9jckk4dVBYQkVRbjZHKzVkcVU2SXNiQWFNTmY4aXBa?=
 =?utf-8?B?alNQZzNVSUVaejY3cndwUkFhV1RGbG9TYWNTWU0vMjRIejRzbGdGWjBNTGxZ?=
 =?utf-8?B?WXZWcm1JMUptbko2cGpnRWNrSU1xdU41Yk1UeWtpQXlPUEdxZEFPRmVvSldZ?=
 =?utf-8?B?N25vK0hwNHZhbitnUGZJNWpHRHA5bjdUNFNWdkp4VkFVNXloakVhV2pNVWlW?=
 =?utf-8?B?ZUhoNWRvbWpVMWNiQ2hhZmNNdlE4dnlld3JESkdJa3lIbDUvNWE4V0ZVUEt4?=
 =?utf-8?B?U0xZZWZpK0FJL2ZzbGhiZnVWQWhLN0NIclRIbkdhM3F6b0d6QUJvbytQU0FB?=
 =?utf-8?B?TEJ3cUdJd1g3czQzcVp1aytCNitKY0hDQ2lHK0ViaHlFWTBtNmVwSnBicmNj?=
 =?utf-8?B?dlB4K3Flc1FBTndmWkZpOXg3MGd1U3IxNTB6UkUremd6TGRJR1cvUHp3WlFH?=
 =?utf-8?B?UW51OFVScnJNWGg1ZnIvekl4SDAvanJtMVpNdzNKd1FYOVZRYmJ4Sk9PQ1BV?=
 =?utf-8?B?NUVKeThnME1CNEJOME85eEdUK1hBc2xMVzRFQ1BONGhFenVSWjZQbkxOYVor?=
 =?utf-8?B?SHRuaHozZXo1dnpWWHdqQ21kcmZXWEZHWGVrUlA1MDNCSkpyTEpyeFoxczh6?=
 =?utf-8?B?UEt3cy9XUDZZL1VBczc3ZVpNY1psME0xVDBqMU81RkRkVFg4ZGJLbWJtYXcr?=
 =?utf-8?B?bk90SW9FaWprTFQ3N2RiOHRUNHo1VzI3Z0V3RHV6Vjd1eCs3ZzFYd21ISHZF?=
 =?utf-8?B?cng4RDRqWTdwelFWbXNxTDZPTFVHTzh5a013T3NERGEzdndReGhtM3RVNS9x?=
 =?utf-8?B?ODl4L0w3Y0RQUW1EUDQ0L3h1ZCtSZmlwbGhDNW1TYXNHbUluWXpIcDZQa2RJ?=
 =?utf-8?B?R0tlYmxmeGxqdHRiTFpIVERZbVdrRHNjMVc3cWxKSUJLTjlRQmU0QUVqUklH?=
 =?utf-8?B?VHhFTS9pSUVzdWFxVTFGVFRGMW9ma1NscTMrMWtnUi9WQ3JnR1pEM2VXWnJG?=
 =?utf-8?B?aUVvZGFLSnN3SHBHVzZqVEgyK2ZXNmhZNkNsRzl5Nmt1YmJ4QWJxclpjYjE1?=
 =?utf-8?B?ZjVOb1M2YU1ZcG11ZHZOdzB5dXJmbTZqMjFVOVpjaFZ4ZEdveks0MzRQandR?=
 =?utf-8?B?ZG81MlNCektJcUNLNmJKU1ZvbXE3blJRWC9Ldmd6MERGN2JEUW1sL04rMXhr?=
 =?utf-8?B?cENhYVdrUjcwZHVva0dNSy95dWpnamR6Tk55L3VvOCsydEswVWZSU3M0ajgz?=
 =?utf-8?B?UWovaWJPVEsyTytBUGhCZm5XbjdGTGxsdVVEOGd0bjNGYlVYdHF5cUtyMGtS?=
 =?utf-8?B?R2xveDcyeWtmN2djZHhoMFhIWWd1bjE5bHFLYVBQdjdzWDhOVkFIY2lZblhi?=
 =?utf-8?B?Um5SQmM1S1pJTDFrcTRIc0Nzc2dmYXpZeGZXV1NSK09PbFZMakllYTlyWXVO?=
 =?utf-8?B?dEVpZUUrb3I1VFRLd1BqUFNZNFhlSS85R3gxcTloZGt1dkRlYm01R3E5QXdM?=
 =?utf-8?B?RlR2THpPQVgycWNzdE5jQnJENjMzekUyb1RLUTQ5bkF2Q0tXRUFMUlg3TGFX?=
 =?utf-8?B?SS9hWEVkYVRwQk1SY3FTejhjam5MenpwSWIrQitSNXBWSkkxemN6WElpU3Fv?=
 =?utf-8?B?RkZTN0NkelNpRjdWejlTeGpUNFFWN2xHWGR0Nk9nQ1Zpb0FCYVpNbmtkdWFv?=
 =?utf-8?B?Um1HNWI3Q0Irb1hwZzBTRXdUUlllajlEMGI5NzArT29zY1I2ZDVNQ2dENUNO?=
 =?utf-8?B?dVQ4cWw5QVlHVzZEV05DRGlvN0FwWGFTT3dGT0xoVUdSTjF5cVQ3cVYzeS9u?=
 =?utf-8?B?TGRIczVBTnhnU2hHK0tKdmZPWFdyc2c0TnRkZ3QwTDNLaURxU3dhbUFTclZr?=
 =?utf-8?B?WW8vUWpEM3diUWZwTkhsbWVkS25TL1o2ZjVQYkZBemVJWnBIU2Z1YXp5VEFh?=
 =?utf-8?B?Kzd5YklISkh2c3dBSjJtQkVoWnN6TjJLMWJLd0R2VWcyNXA3TFYySWw2Nmlw?=
 =?utf-8?Q?G4SiYC?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 11:12:54.7555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f781db08-663f-4d28-d592-08dd946a9b35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 11:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216746

DQoNCj4gT24gMTIgTWF5IDIwMjUsIGF0IDEwOjI1LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBNZXJjeSBtZS4gSG93IGRvIHdlIHN0aWxs
IGhhdmUgc29ydC1vZi1mdW5jdGlvbmFsIFNES3MgaW4gWW9jdG8/DQo+IA0KPiBUaGVyZSdzIG9u
ZSBtb3JlIHBsYWNlIHdoZXJlIFNESyB0ZXN0cyBhcmUgcnVuOg0KPiB0ZXN0X21ldGFfaWRlX2Nh
bl9ydW5fc2RrX3Rlc3RzKCkgc2VsZnRlc3QNCj4gKGluIG1ldGEvbGliL29lcWEvc2VsZnRlc3Qv
Y2FzZXMvbWV0YV9pZGUucHkpDQo+IA0KPiBDYW4geW91IGNvbmZpcm0gdGhhdCBpdCBzdGlsbCBw
YXNzZXMgYW5kIHJ1bnMgYSByZWFzb25hYmxlIHNldCBvZiBTREsNCj4gdGVzdHMgd2l0aCB5b3Vy
IHBhdGNoc2V0Pw0KDQpUaGUgQUIgZGlkbuKAmXQgZmFpbCwgYnV0IGZvciByZWZlcmVuY2U6DQoN
CjIwMjUtMDUtMTYgMTI6MDQ6MzIsMzE5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gUkVTVUxUUzoN
CjIwMjUtMDUtMTYgMTI6MDQ6MzIsMzE5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gUkVTVUxUUyAt
IG1ldGFfaWRlLk1ldGFJREUudGVzdF9tZXRhX2lkZV9jYW5fYnVpbGRfY3Bpb19wcm9qZWN0OiBQ
QVNTRUQgKDUzLjM5cykNCjIwMjUtMDUtMTYgMTI6MDQ6MzIsMzIwIC0gb2Utc2VsZnRlc3QgLSBJ
TkZPIC0gUkVTVUxUUyAtIG1ldGFfaWRlLk1ldGFJREUudGVzdF9tZXRhX2lkZV9jYW5fY29tcGls
ZV9jX3Byb2dyYW06IFBBU1NFRCAoMC4yNXMpDQoyMDI1LTA1LTE2IDEyOjA0OjMyLDMyMCAtIG9l
LXNlbGZ0ZXN0IC0gSU5GTyAtIFJFU1VMVFMgLSBtZXRhX2lkZS5NZXRhSURFLnRlc3RfbWV0YV9p
ZGVfY2FuX3J1bl9zZGtfdGVzdHM6IFBBU1NFRCAoNTM5LjM5cykNCjIwMjUtMDUtMTYgMTI6MDQ6
MzIsMzIwIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gUkVTVUxUUyAtIG1ldGFfaWRlLk1ldGFJREUu
dGVzdF9tZXRhX2lkZV9oYWRfaW5zdGFsbGVkX21ldGFfaWRlX3N1cHBvcnQ6IFBBU1NFRCAoMC4w
MXMpDQoyMDI1LTA1LTE2IDEyOjA0OjMyLDMyMSAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIFNVTU1B
Ulk6DQoyMDI1LTA1LTE2IDEyOjA0OjMyLDMyMSAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIG9lLXNl
bGZ0ZXN0ICgpIC0gUmFuIDQgdGVzdHMgaW4gMTI3Mi43NzVzDQoyMDI1LTA1LTE2IDEyOjA0OjMy
LDMyMSAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIG9lLXNlbGZ0ZXN0IC0gT0sgLSBBbGwgcmVxdWly
ZWQgdGVzdHMgcGFzc2VkIChzdWNjZXNzZXM9NCwgc2tpcHBlZD0wLCBmYWlsdXJlcz0wLCBlcnJv
cnM9MCkNCg0KUm9zcw==

