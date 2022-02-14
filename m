Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC4BC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 17:12:45 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.51])
 by mx.groups.io with SMTP id smtpd.web11.36846.1644858762146436272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 09:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=yN5DNzaL;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.51,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEVuMJ7BxGWoiMwYHLKuMbBCymxrWN9eQqU7eCNmX13FIucyP2AxTC6sFKyeSNqmd+5yzs7/lr4m6fb0Gb49gL1E91Aa1dtVFrVjSWetnmyXyGU8eXrxxZ7v69sU4w62oT4IJs9/+C98LghDPsWZd1qgfy3tVzS/E0/0sGLQ5oHtMPxmzpWmqYZIjjeMRMFfTzuiA1V5AJe+GFWgAuevlrKwIe3KgGXsA8jWfu+p/s65XlJaZoEiJUI9Lz+QrbeXs1x70tMnYhU9JXoc1CewCT50USYUm7cVHkaZWMjQc7rJgwJ0bLTLiLXGGa8E0cHsMv2SzNkf9etkXpZisLe1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFCIu4Oh/ghQAD54/WmYDOn9Tw99COGAAg2AX/60veI=;
 b=TBKPdXBqJ5EvmKLd+80A1hYYniOJMcxo/GbcU2s2QNMGH0KvNdmaljJjJyDc24nHUYZzptJr3fKXGzGRKtQZUMRx2QRktQ0mlhI0Iqa11B6F9LWosOn8G9DO7wl3acA+O4ic+2X9fV81cz8A2RD7DqpVIBo7frkwlh4DEN8DCZHC4VoTInHGi4eKKe9KWL9chd9Z54OSfLRtT+H00tdHxM2ARKAr1SlWd4hzL/Ze8PS870/TZFpr3i36ueP8c95lUucF0ZgL9kkYTteUN9XGSwNRtBhMMqMJ0bcolzFslTHyGEmcPNfSTOt8KNs2mrEkT1LW7kpZh09OlF1qFH1T0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFCIu4Oh/ghQAD54/WmYDOn9Tw99COGAAg2AX/60veI=;
 b=yN5DNzaLrEt8JL3uziFcOj1eBte8csmIBfeRIxWw79OxWsI4UjmaOy78spZUCCPc4V5f0yZ9fTp56goId82c5lDyE3nE0mMRKesfT4Fgm3Rwgfl+DuzGLSMZsbQI/3O0bGY3A7YlMeFXa56O2+QAJWiX//qz1vFv1+y249ti9Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM4PR08MB2770.eurprd08.prod.outlook.com (2603:10a6:205:d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Mon, 14 Feb
 2022 17:12:38 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 17:12:38 +0000
Message-ID: <942dc513-53b0-b774-f26f-088d46a758ec@weidmueller.com>
Date: Mon, 14 Feb 2022 18:12:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [OE-core] [PATCH v2 5/5] selftest: wic: Disable graphic of qemu
 to support WSL
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220214154521.26905-5-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj8scA0wBen_qmXQEb1yD_hx806xGynxBwyJzqbyQCL-9A@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj8scA0wBen_qmXQEb1yD_hx806xGynxBwyJzqbyQCL-9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0271.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50c7fc4e-4925-4634-ba94-08d9efdd3390
X-MS-TrafficTypeDiagnostic: AM4PR08MB2770:EE_
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB27704AA3999243AAD79B1F35D7339@AM4PR08MB2770.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bKwSd+gZa5yqig9s3gOndReACQ2GrNLvff0JEdUCnN8eU1GDzk1kwdKBMKjF1afwFdvSrs50z+ixITkMidKdIhs2eMDB3XLkx95wp/Cyex0FJWdC3VpavDOKKD20nSq5eKo1RhO7kD5yF2oCEV3FbH+16R5zFCLWUZnKkTDxIVnGNMEhDokbUqd4nGxm4HfyKsl1w8DkjTwjcfzzM+/3bmRoKPIQ81scSGZtZGeWpS1D1ezg9RbYTB8PAX9Mg75L5cSCWlR4MAXEGOvyehkKMHQE+D595ZKC10f7X1n7qz9bxlZoz4KSshMaPtC79JwyD+kgDJQXiphs5ueXX79Ikh28R4HL7lOFbzzM+P1TnnUd7qkEu3AYc35XutTdpMAIqvCl68kUmj+olaV7lUiG2DmuGgWKB99mlbiir3hdvStHEuCIIUE8n+tC9wrKilmPnIF87WHRjDlyco599aH4BmqbyRvEOuw4N2TKP7hl3uiyxqb2XRt1dFu4zmv7zVXGtayO94jEyYIxAiKNkzfw6fjLx/SOLMQEBBzWSsXSTba8TYl5uyDXFifQwghbDCn6rqdnZxq6jTYDgaC24os2yoJTNb2HFdnkp6vo5jAylG/h6XLZy2vWLcBimTkZRyrNRvSqshQDFBakYbm06zBxia1dd/Q3wXMQeAEkKa3YzNoZBXq8leltYwJiie9lbO/iTFd7vU5cNOe+l00W3qaS8Vy17xPOTWTQyuJoxpbWdBIus4S9PHdc30d5qU9NfmDwqW2q+6nKPLOsfxKD1C7CfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(26005)(6512007)(31686004)(508600001)(186003)(6486002)(83380400001)(2616005)(4744005)(31696002)(66556008)(5660300002)(4326008)(54906003)(66946007)(86362001)(6916009)(8676002)(8936002)(36756003)(6506007)(52116002)(2906002)(316002)(66476007)(38350700002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzdSQXVRVW1yRjM0cmZGVFBId2FqOE9UOTdTazhxVW5PamV0N2NOK1ZEZG1B?=
 =?utf-8?B?WG5Hci9qZDVxQ09qZlR3cXJFVEloL0IrZ1BVZ1hlTHk2MStvUXByQjNpZFp6?=
 =?utf-8?B?S2xzKzg1ZGxTU2hxRUFmanNBWkVoZ1VPcXltbnorZUZHMUV2Q1JKQTV6RExX?=
 =?utf-8?B?V3lGTU5tL1U5cWgwZ1kxTUpSdWFLOW9KeGRqc2o5OHV1dmhGSkxSNFRMRURN?=
 =?utf-8?B?RUdwK0o1QzFYRzhvWGdRNTI4Sld1QTdtSzJvQTVCelFneGJ4V2hidGJndWFk?=
 =?utf-8?B?WCtud25jbzlVeUVvWGtOc3FhRUM5aHhzcE5DOXZvdlE4aTUwRFducjRqenly?=
 =?utf-8?B?SnZPNS9lVmJuR0l5L3l3N0NwZXZvUlBOa3dpNjM4cm5LTTcyZnM3MERXVk5T?=
 =?utf-8?B?bHBjV3g2TWp1YVJxNTdueEJNSVpVcloweVcxcWUzbGNGdjk4cGhnYjlqazc4?=
 =?utf-8?B?SW5uQVhHejkzNEtXVXJ4aTNYWkd3d0F6Sy9GaFNYY0hBMkdiSXlBWXJmK2NL?=
 =?utf-8?B?azhHOUNWU21ia3luYkZtWE1GSmRJY0YydHM1d2dyaWJqWVlRbjRtZVBuQS9z?=
 =?utf-8?B?Yk9memo0VG5kdmpEWEU1alNwWnJma21IR1h6dmZSbnZYSWJnQU5uR0FUSytT?=
 =?utf-8?B?SDBGOXFJZytKdDJNbGYyeFV6enA2OFRoeTI0WnhLUEhsamtyUXM1czg0UEFO?=
 =?utf-8?B?a1ZXYXhYYmZneFJQUE1SbkFzSkpFemIzZEhGUUFwWVRTa3JuK0V4K25lL01N?=
 =?utf-8?B?NEtFUFZsOG1lT3JFbEZ4VU1ZVDdUamhqU2VkY2hWZ0Z4d21vOW9tNHJEYzcz?=
 =?utf-8?B?Z0NINytvYXppVjlxaElBTE9haXozNWhGY3dhN2k0YlNwcWpnaVcxVmNkZ280?=
 =?utf-8?B?NW10eENWYVA4M0l1Tm1ObTlUa0lrYnhHNDd2WDVjVGlXWjJkZ0ZFOEkwYVJ6?=
 =?utf-8?B?OFdMRDNmazJ5RWE2Zm9FRFd2eFQvSjdyMGhDcUlyMkJtdUc4QmM0RFF4cWZB?=
 =?utf-8?B?d0dKemFVYUZZSU92NU1pS2l0cU93TFU5QWV4c01JUUhPVTRmM0FOUG1YUnRE?=
 =?utf-8?B?NzZVazRQV0dsRHhyWHNCZXhNMHhMNHZyU2gzclc1dFNEODFnNlJuaFI2VUxX?=
 =?utf-8?B?cHdrczdYbUVodnVxYVM2N1czNXJDYkJGUlFtMG9zT1J6Q2RZNzM5a0NBbUhG?=
 =?utf-8?B?NVpQcmVkUU9QZVMrRmxxeVhiVEN1VkpabWIrRFpvdktNb00yeklScmNOS2tZ?=
 =?utf-8?B?V2dMUzV2WTUxVHFCaFhRZDV3SW9LeDM5VkpEVnFCcEdMR0x2cXAvZzh4OW1H?=
 =?utf-8?B?aDRtN29Ed0tuT0NTbmpjTWF1eXlNamYraUxxWVpKNWlXa0M2bjF3VWc5NXJQ?=
 =?utf-8?B?MEMrVjMweGJLM3ZZNjFCRmx1VERaMjZVSnZFelBmalpYankvcDVOYXc4UUk2?=
 =?utf-8?B?cmJPWmZGYVBrRFhtWThNVnVBL3N6MnFhN1JkK2RXRVdvOFVvOGVDUFRSbXd1?=
 =?utf-8?B?ak9uaDlXRXZ1LzR4bkVQdmdBc2dIT1VWaGF0VDFqaVlIb0MwZjF5Smc0WUtB?=
 =?utf-8?B?OUhpRHZra2UwM0pMbFZ6RGJOcVczWWpSallBODFickZ1cUVSbE5YSExxV1dV?=
 =?utf-8?B?OHVUb1ZWZE9MdE9JRGkxbUpwS2tDTnd0RjAxSnVscEhITjNoOXNZZm03NGti?=
 =?utf-8?B?MUwxcHNUSkVNNENjbEJic2ZIK1JrQkdJekU5R0h5WFZUQmhKQzZhUGJYUDly?=
 =?utf-8?B?TnkwRHFLZ1pzSVJacUFlQXBXcG9BVXFXTzhyc0VDeDlKOFV3Y1ZDOXExNGRL?=
 =?utf-8?B?d3dRczgyaVJSeVZ1cGpRODgxakZSSVlCZ1B6ZnpMbjB4ajRYYXUyWXlmQUpU?=
 =?utf-8?B?TVJ3REJ0ZHo2WnQ3K3BqeDhRbWNKZFhrVzFUNkJHd2VLSDlzUmROSnRONDNs?=
 =?utf-8?B?SWs1S3dpWi95ZnFpQXlFejZpSjZoZktwRm51RlB5cGZUc1FTTUl4bmVoSlBQ?=
 =?utf-8?B?VGtEV3ZmZjRwd0NMY0djQ0Fub1pkVVVGV1E4SHpMMTFYaVl1SEJlNzVQeHJC?=
 =?utf-8?B?Q0tPNEovMlBTYWlsOHBrVkFBZUlFbTk2MzNTTmJia25rOVJWRFFmSDFTNmxX?=
 =?utf-8?B?Wk5wVjFNWnpncTFabElWSXRhanVTUTJkZzZTa0tkQS9ZZWRMTVV5UkF1Uy9K?=
 =?utf-8?Q?sPanvYN+JInKzhCBs6ILnac=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50c7fc4e-4925-4634-ba94-08d9efdd3390
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 17:12:38.3600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kfzI5tSP/U/IrGvSMkhQF3uWwu4xMCrN7fA27HmfvdPaX4UwFLXatr3fk5Yymn6G1SMwQiIwMuCUQytskiB+bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 17:12:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161727

Hi Alex,

Am 14.02.2022 um 17:28 schrieb Alexander Kanavin:
> This fixes one location where the problem can occur in selftests, but
> what about all the others?

Other tests like efibootpartition, gcc, glibc or runqemu already set 
nographic.

> Generally, it is not selftest's job to ensure qemu can be started:

Why selftest requires features which it doesn't need?

> you
> need to either tweak runqemu to detect WSL, configure
> qemu-system-native from your local.conf so that it doesn't enable sdl
> or gtk, or, better yet, fix the problem at the source - find out why
> graphical qemu doesn't work in WSL and fix that.

The graphic support depends on the WSL version.

Regards
   Stefan

