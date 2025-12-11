Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DF4D41C27
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 11:41:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7412.1765453273982083150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 03:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N+wqlwNf;
 spf=pass (domain: cherry.de, ip: 40.107.162.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN2c8+8zPpT6MjzM1n7D3wx9eeg5TbOe8AFk23Y2iy/lBLETLQSoAzJ/gfrIBj8FXma4oPXCkNSW8TPq5F9BqFhQCGE6IPNgueHr1B/fs7vk9mb8VcGVN5fnUr/a4S7nKgf0JL2OjtGAZAGUndkvmXsPU6bIzALpU5ZGqK0YViOgtS6NFPtQSfDKBu8I0w5ZJ5RVriLmn1x64nxd75C5jtqsFwhhLzP2J3Ne3kpK1gAaQLYjgpoSn/znHGLPc7ljvM71OnjJvrO3/b4uCHHE2Jw7B4+bVCqIbKbm32lyDDBusErbntAK3Ay7/RQ4HS9Gg8ZCMaJOJyT2JidTb4SpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0thxUITNbl6q8u5atalw+IKhYXBpPLcySbWv7nQ8ShU=;
 b=rNAfKduxaoBpiudfAcxTA9brBAn8pn+YM3mar1XUF/sXCm8SrE9wR+eOfNUi5GKDm1Vnaq/Sws9VBKaMWGx5ICga9lBQaXjAXbznwy0qMT7xvVFCRlOmy4BuTbqsr8m0FdvqWx95hSlXvSUvDTmnXFA/kJJ59rh7RlxzR0qbeTspJ93GfiBvOZFIdx7coIxnAWWy1inuPh5tyf4XMcodPiEoWlMqOkqZLD693RCnZ+Nk94W1jDJNcciovXt/ibAQJHXfm55vCTft+DknXv7t0G4COma2rdUE+Zl4F/PekHtmXym2KO3UYtU5Rze0CAG4mIVXNeVun6/Qflybkz2Duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0thxUITNbl6q8u5atalw+IKhYXBpPLcySbWv7nQ8ShU=;
 b=N+wqlwNfEl7oIlr+igOxNoj9cJSzbHVTSpC8uOcN0LVVGk6KwFBAVJ0akzuLoWUMTwoEhl2JLgiDotcBvMh5dm/XFdLWS9QmZiFDs4tCNzzZe9z+t6UCwoxxSdVOCeTD/HCllw6878SPV3a3JKuDYrPKoGOd0MuuxUdroFGIIIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11857.eurprd04.prod.outlook.com (2603:10a6:10:61c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 11:41:10 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:41:10 +0000
Message-ID: <f0ec787e-a488-482c-91a8-9ce69727808a@cherry.de>
Date: Thu, 11 Dec 2025 12:40:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/4] mesa: fix drivers sorting order
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0184.eurprd09.prod.outlook.com
 (2603:10a6:800:120::38) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11857:EE_
X-MS-Office365-Filtering-Correlation-Id: 696c7d4e-66ca-4ab9-9b8b-08de38aa2e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUJwRHVMMlpvNkI5U2ZlYVV0S2J1WFc0ZENpQlhIcld4ZEdQU3J6bHRhUEt2?=
 =?utf-8?B?QkIxMWcvNnlObmI1ejB3T3VpRFVzOWxQQ09OWDJyUXF1cXdwSnQ4MTRZU0hi?=
 =?utf-8?B?T1dXMUtkU3dHYTdUYmU2Q3FEOGdLaFFDZk9UVDUrSXRBaGxXajdGNE51MGc4?=
 =?utf-8?B?L1pRTmdyN1NwelFKT1BYZW1GZGFzOVpSRkF0RVRnYlBScm1IZ2VOY3ZtSEps?=
 =?utf-8?B?UjRRN1VSMDhCczdvOHhKMlRLVHNPUUJQVGVQQWxuc3V4UVZMa1hHL2dhcHR0?=
 =?utf-8?B?d3BmSFF4c3lmQmF3L2FNTHpWYnRZT0tWOVU0VkhGOXB6RGlSTHFEbThqamZL?=
 =?utf-8?B?czJYdkxCMnViNFFkVk1OSW5NdWRVQlVRT1BnMFNiN3VqU2xWWFl0Qk8rSTJV?=
 =?utf-8?B?eldiTStGNEZkbmN6cHdvWXByZURiNmRmUnBWalhwVG5nckhDWEtvZSt1TEFh?=
 =?utf-8?B?cGg3TXlSOVpkb3R5YS90R1ZVRW1XWlcyempLZ0NkM2NWRGpUblFvRmVoclZ2?=
 =?utf-8?B?WCtzVmlsaEpzZzRCMjZZSmN3R0xhTEIweDJPWmpCSFJIVWtyQWYva0MwSGhH?=
 =?utf-8?B?SWwrQzdFU3N0UjY4MUNBQWFadGQyQU1EYlJqM1FjOTB4d2NiOHdpVlRBSjh5?=
 =?utf-8?B?T0dZbUxtZ2llQ04zaGNQMlROYUVFTUxKL2VPL2UxaUVXa3F4WGhPdlZMNEJD?=
 =?utf-8?B?ZXRseGlCZXc0VjYxSld4dWVMc25Fd3J3VGNSWlpoMksvRzRUZmIrMXpvZmdS?=
 =?utf-8?B?RTVUekZWN1BRa0VFSXNaV1ROY1dsLytBZEdkdE8xYlV4RWFNcXA5L21hbFlH?=
 =?utf-8?B?b21QNitFVGM5bHpiOTZ1TkIyWUIwVW1LcnpSYTVpbitIOWJyUDZMSGZIWXZX?=
 =?utf-8?B?VWFYTkJLNU1oaml0dkh6djQzT1N5MDYxbCtMMVNHZTRnS1BCSzBmOTY3alkw?=
 =?utf-8?B?QlN2a0pjTm5KbXNtS2txUFprbUk0bkRIWm1WNTA0OGg2RzRjUWhValhuUkVy?=
 =?utf-8?B?R3ozazNFQ0hFc0N2TWVHVG5kcmx2dVhBQk95ODJzTEdGSUxjKzBXTmlYT1R6?=
 =?utf-8?B?Y1c4RDdqcG9tcWVveGN0Yk9rQXp5b1FXdndnQU5LNGluWlQvcis0NjlJa21W?=
 =?utf-8?B?Mlk3NXpTYnh6M05NR2xmWTZpTy9BSklFNmwrZ3hHd2NqbXJ4YTE5Nm1LQk9Z?=
 =?utf-8?B?RTk1WXFaYm0wVmRrb3M4RDhtNjhQZG8xUEF5NExQcEc0TVp3STZvVDhpb21K?=
 =?utf-8?B?U2pCQnR2SFRqalhqTVh2b2FCSEU5UjVIN3JMSDE3N0labnlCcU4xZERNdFpo?=
 =?utf-8?B?VTZtZ0htSG9Dc01lTjZMa1EyRGRTVUNsVzBCbXNxUzM5TDUreGs3ZE1PTG9j?=
 =?utf-8?B?YlB2OFZlMVZFQmlIOFYvOTdmUFZiZU1BNXplRURUSFZ1dlkxOTVCWXhsSmk0?=
 =?utf-8?B?YnJFN1dYRmRTaFl6ekRVYTRzaXVNZk5LYkJrRE1Md2lKNllOdjF6Kzg2cmN0?=
 =?utf-8?B?elpiODEwN05QM3laYkJtMmp6Z1N1c1M3MklyY21ic1RRTTVKd2pwZVhITEkw?=
 =?utf-8?B?Tm02eEdYcXpuOXZMck9yOUZUNDFrcDNtWDVNZ3lpN29HSmw2TTlYU1dRaVNH?=
 =?utf-8?B?Y3gvY3lneGtxTHFFeDlUNDJpUTUva2tXb25Bd29ua0szazBmOERTVnlWT2RY?=
 =?utf-8?B?REFGaGUvTThhell1M1lnUWRmenBDZ1VBYUZFUjVXNmFUY0NCc1Q0Z2kyMXY2?=
 =?utf-8?B?TjAyYkZGWVByNWpzUk1OM2MycWVHaE4rbTRxR0xVcXg0aWZPWlJJVk00YXZj?=
 =?utf-8?B?Rm5EdlVadkxmc2RON05KZkdrWHVhdWVpcDJRa20vWW9BaFdmb0xyc2RkRlNY?=
 =?utf-8?B?djJsd1VuMkhlc2lmUFB1anRkNXVwSWppOVYwTW01eGdwUTNnckYxeEhqQUoy?=
 =?utf-8?Q?UVp9hx1GYnsmNlSAo3/SA5T0OziRnKtr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djVHakdIS2Z6Qm9wbEV0M3lZUDdoVWNoMlFkYWNoSGpiQnV4anJvdmI3Zm5O?=
 =?utf-8?B?WVgwSEY5c245OTgxTWEyUHFEWkE2M1pLWDdEMnJ0cFordlg2MXhXZ2hIWkxu?=
 =?utf-8?B?ejZlcXRXbUFteFFYdk0zS1JtZEN4T0hlWlp5akt0a1pUSDlNSjN0bVZNeEhh?=
 =?utf-8?B?ejdQck5jK1RhbDZoeUdZKzJyeHZ2ZHRFUjNTWEV6T01WMnRwcjA0cmNjR3Fs?=
 =?utf-8?B?K0t1Qk43U3pkT3N2ajBYQUJqaFlHMUhWRXpsa2ZhU051T0gvOUNwV3dGS1Fj?=
 =?utf-8?B?NUFFSEdaOHB4eHg3SUVRMExONVV4dS8vY3Bwa2hETDZpblNTSlVPd2IvUGxo?=
 =?utf-8?B?b3dLVWVuYjlZNUg1YmVQNzJwcHVJYmRzeWxSY2g4T2graElYa1B6bS9BVmxP?=
 =?utf-8?B?Z3Q5Q0JFQ1RnRk9aNFVpaityY2ZtODROMTY0Zlc5N2ZCeUtWRXpWVVh6bzMx?=
 =?utf-8?B?ZTNOam1pOGZJUldaZE1vYXgxQUxBdWdidkZpZzZ5R0R2UFU3YnBuZTB3VlFL?=
 =?utf-8?B?c3l2S1lkRm1PU0gybUUraU5iSnhVUlBPaS9kYlRIM0RsS0w5SmUxR1FaRVRL?=
 =?utf-8?B?VnpHQWRXdmRzVkRaWkVKdDMrZ3AvczJrb1YyZkZGTU9RS2NDck04SkFIZjdJ?=
 =?utf-8?B?VENrTnNwc0RTVXRWZXlrSHJXYXBoUFJaU3hwVmZjRWRuR1liaDZNQytIb0xX?=
 =?utf-8?B?Z3oxSEQ4b2toaHZMZ0hxSVg1YngydklUZC9qenlwbTByOGN5R0FHUldEamMr?=
 =?utf-8?B?bWhWUm1xdmdyUklyNVVRVisxYis4cUpPQ1dPbXVickhrcTNIbUtzZjg1YlRT?=
 =?utf-8?B?Z2dLbFZkSkRqelpaVUxpZXJHcHZGN3pXeEYweXZ0Yk1oUGR0bTBRQkQwMmM4?=
 =?utf-8?B?ejZtejJORDhMM1UyRjNpRXdHWnlmSXRFYXFZcVB6MjFhZnZ1TEJiWFR0TUlX?=
 =?utf-8?B?Z1hOOEpaWHIyWjVRUXRySS9kMUlDSTJNUXR6c2MwbHRmN1NrRXNPNmVaRWI4?=
 =?utf-8?B?aTQyT0E0RWtaLzlSUWN5NFVSc0RJUlFUc2V1dzlKVVNvTmlNUUZ5NnYxSDFp?=
 =?utf-8?B?SWVHbGRHMEl3WFNOZGVUNHFEQWdCdHBacjJJT1ErdjlmVHg5RzlWaWc5eFlW?=
 =?utf-8?B?V2VmR1FkelVZY25MV0NjU3NWMW9KV0p5SkZ0YkdUTkZsUmQvK3JUb2IzWHpG?=
 =?utf-8?B?V21VWUtNdzNxVUZoTlVIK1VWUEJyU2pJaTZhNXgzOW1NZHpETEpMUWRCQlpi?=
 =?utf-8?B?VjEzQjVwcVEwM0pZNEM3bXJ0WmtacXNMUVpCWERqa2FjMnNhTHJQL09QcVVO?=
 =?utf-8?B?eHZrU1VxTEluQ3V0RnNnSWhkNVhucHptbUtabE1zYjkvd0JTQWhIb1QveVdN?=
 =?utf-8?B?YStCc21NQmZqdXFQUGo0TXprM0ZKdFNEQldPa3lsWmt0QVNpY0RDTE5jQ1l3?=
 =?utf-8?B?Nis5YW8yUXFUeFNQWDFmSCs3V1FsQmY4Ris5N3FRZytGbk42V3pGbTczcG1G?=
 =?utf-8?B?MVN3SXM2eWdsRVRnT1RoSVZ5b21peXM2d2RlS0JpOFRCUkNjRFk3UEdmWHdv?=
 =?utf-8?B?Y3l1TXN2QzY3b3p5bG1jZEtYR0I0ek1RclFBZm13RVlzZVVXMXhhUE95V3dF?=
 =?utf-8?B?MzEwby9ESk9CSmxCN2ZVbEFaMXpidmduNlk2SXcvbkRsTHFxMVJCUVVURExM?=
 =?utf-8?B?Y0RuQ0EybjVrbDZyaFhRUXBhSWFLTmkrbWlLb0RQZDZncC8xSEpuSFp0Rjc0?=
 =?utf-8?B?MkkwYjhwbVVRQkF3UnhiYXR2U1E3WlhRNHNEL1gvZkdxWExHRkFURStvcmJa?=
 =?utf-8?B?OVFBYmN2UEY4ckYzOUg1Wk1OdVcwd0YwRkJaamY5Q2RCOEpoNWptSkRXZHlM?=
 =?utf-8?B?VzM0Nk1ndDdEbSt4MnYrV3V4bWszQWdmSmViL0RKZDF6VjhTaUdzSFpyRlhR?=
 =?utf-8?B?NU1OdVduSTJzZGg0YkJQS3V2bDkwdXBQV3dWaTlKSlBRTWc1Yk16MWRZYW9p?=
 =?utf-8?B?bHFTSzVGa1NoVFNBRnR1S0JQRE5YNjBiczlxU1Fnck81dVEwQUdGQ2JzWEVy?=
 =?utf-8?B?a0hEdlJnNGtKRzV6MXVSMXUrWDZ2TmdId2YyMzd0TzlSTmNFNitqWHZBOEdI?=
 =?utf-8?B?elNXOXQyazZVS2w3NFA2Mjk5VlJZWHhjdmtHdHhUMTRZWlFvcThTdWhqMHZW?=
 =?utf-8?Q?qT2f4xH/qg7claPP2lmOIvc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 696c7d4e-66ca-4ab9-9b8b-08de38aa2e24
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:41:10.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tnDDMKpOclHQXgS4/LVTVfF7P/NI0Ve3sOOT7Jo0yy8sns3EhyxhD0YSa5ZYvEq9sApPUxjk+9wl57GtO1km/clm4/wTQusAiWE+fD5Dc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227523

Hi Dmitry,

On 12/10/25 6:58 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Fix few issues that were left unnoticed or breaking sorting order.
> 
> Fixes: 64108679ada8 ("mesa: sort out driver lists")

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

