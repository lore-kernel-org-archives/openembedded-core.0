Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A1ED5B85D
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 17:31:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92.1765819872774975091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 09:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=n/Mkoye0;
 spf=pass (domain: cherry.de, ip: 52.101.65.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCWCFFa9Xx5B3lqV3CJRApVppSsdxGE5SQCtvt2MeqlxkzOWJ0KPnDL1sylB2KbT75kqNEPrW89pN19a+ti6XcfnzGIgZi7Nvxumo2++ChPdIupgqHjd2g1T3bnQaQKSfZUhWbn4mSQKXTFookArghsArNVxCPstv8kbB4s6uJtFAixrU/097xcN5Xhd4nlZl4dXw4eiazalJTUR0V2g201SY2psJHIJElEZiYFNx5sq3RoJPrnbhBjfEQYA+XwikIJzdhpkfppdootRbkwLOAvWl1OO4wl1umtI+wtt6vE0gJl6aOb42NnZmoa6fYyBJhgL8nXZJ3Mw5E907P2DrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeIhNEovsyx70Qb4wXjvfunNoJdLsoj6MYFfcJNk5MQ=;
 b=yy/93LuQXrlTkPMpqXD96muyG0E29jvHZdTFf/qtKg+bF3pSl72Qn66z1xPhZg9P+mLtrbHVYvZwhXWpVLkwzcvYZhNeT2szw125gPI+z0/D4+ppVLKUQGM4s3YbqoDefv0NfkdLHjFZT1n2H3lW3rncjwyfhqxHFPaNbXnS9UHu1mAcgemTAHV5vp/2Uvigv7l8Pi8jBaYQPYeUotHbJWTUXzHsrNwE2CRxKuH0Mu3qeQKBUMMHAJUC7dKmJWa6W3Ufzx9WXn407P8cd2yvK9A2tACKqONSY7cVcsAU5DwUXgzInbQK/y6kX2k59DQKsxFGaJaoLI4HnZjYhmA+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeIhNEovsyx70Qb4wXjvfunNoJdLsoj6MYFfcJNk5MQ=;
 b=n/Mkoye03niHHuCTZPRrWPdlzB5v6KCCq/LxTRPu4rkWZO18eHHk13ai9n+gsodu+j8bP0oAgW4Tc0U/FQ2ptJkLeFyJtnj6tH17XSUYKMIdpfJ6GrjbKzl8fMTyHzQDI6WCC0piLWswMscbVrw7BZGA/lvwpxn/dsD8i+ikPdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11078.eurprd04.prod.outlook.com (2603:10a6:10:584::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:31:09 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:31:08 +0000
Message-ID: <f8fc7814-00f0-4a23-8f25-712173a261f2@cherry.de>
Date: Mon, 15 Dec 2025 18:31:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 4/4] mesa: upgrade 25.2.5 -> 25.3.1
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251213031200.2619204-4-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251213031200.2619204-4-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11078:EE_
X-MS-Office365-Filtering-Correlation-Id: 371554e4-84f3-4229-f94e-08de3bffbbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjMrWHpJdTQza0IwTXM2ckVjOW1hckV6bjdsV3c2RllpVGZ6ZGdwOVBLRStE?=
 =?utf-8?B?T0svWk1FRnZibmVyTlFmaU9BbytwUm1zLzR5T2FZV0xnMlozSjlJTEppTFhB?=
 =?utf-8?B?dEVOUGlCSzFHL2tWbU0xeWt3Y2YvVlk0YUZ1RUZlcjlUbWNuMWsxaDArbTFC?=
 =?utf-8?B?TmVRRnRmbkpERUtwQUVZWjhNZXNuWWdaazB3K3ExVWdpUXFpWHhJaGJwWjZn?=
 =?utf-8?B?MTY0cDEwWFBTU2lodks3ZzRnaERRUko2bHc1UTEzd1ZpR1Fzd3p5YnBVTzI1?=
 =?utf-8?B?cjFwWmFaTmVnL2FkdkRVS0E0ODVFemltdEJxMUgyL0lkanpSWStWeWUvaE5P?=
 =?utf-8?B?eHFRN1BVdkkzUE05TDRiNEVicDRkN0IvNUdsSU1aVFR1TTE4T2VyRWViTVBj?=
 =?utf-8?B?eCsrbDI4Kyt4bGlKaG9kYm5reGJhaHJlVnFvakNpQXlVRGFROWVwTURrOUla?=
 =?utf-8?B?Q3hTQVRocUx2UEN6ZzVnOG1PY2YyUUNQbjBibDB5dGF1eXcvaHVIRDd4Tjd0?=
 =?utf-8?B?OUY4MDB3RjI2MDhNK0hvdnJLblNCbXNMVjRvQW1pb1BIaVlOWjBQM2g5WlBp?=
 =?utf-8?B?M3F3V2x5UEFIYUdXczdMYkM1d0VtYW9acTZqOC9CV2J3TzZ2a0VYN2ovTFcz?=
 =?utf-8?B?T3g5NHd0TGsyRndzNkUrNHAyMWIwTzhuQ0ZhVy95MmRSTjZ2UnpTRFhCcmFI?=
 =?utf-8?B?bGxkNmtPMmt6TGxvMHRxdDFRSkJzcWpNMFBPNzI1OFJIM2xaYzl5dW42bklX?=
 =?utf-8?B?blU2eW42dE50ZDcrMTR5REY1a29rQk56dnNGaTVucWZkOXNXblVFY3lFZmZ3?=
 =?utf-8?B?ZUJMWXQ2bTJnbUJEWjQweVZZTXJzcFFWcWFxNXUycUFJK1lKZXk0d1oyb08r?=
 =?utf-8?B?eXlCWnJXU2MveUdhWkJKYzk1d29nRHNoY1Fwa2taOSs3Uk93MkR0eE9oaHp3?=
 =?utf-8?B?RGJwSXd5dW9GTUpJVEMrbWNxMlBoblBjdnprUEpiZEFHaVhhN05MWlFubXB0?=
 =?utf-8?B?bzZIYVlKYUlXVThpaVZuTjU3V2dOY09nQWc2dno0SmpGN1ErR1NaaUEwcEVh?=
 =?utf-8?B?R1dRb0grZ2Rqdk11bGRSdG42ZEhkODhZdjZsK1RpQzBXeG9XZE9ZR2IzZUdB?=
 =?utf-8?B?amw4cTJ0QnVFeGVLaXRGUjBRR3IxdVVnRHMzZ0doWUlHQ3ZTbVZuNGREczNZ?=
 =?utf-8?B?YXluYWIvWXQzSnlTVlg5aHQ5NkVFMEtBbkdwRWJnTXVKMGM1TGo3OUQ0cXY3?=
 =?utf-8?B?dXdWalpIUFVPL1BicG05a1ljc0VoNE9OejkzYUhQazk3Z0Qra0lvem1tV1I3?=
 =?utf-8?B?VGJLNHpPbmlqbVRGWWZoOFlHdHJzRUdSLzJzUHFJenM5c2R4RHB6MGxFSThw?=
 =?utf-8?B?MmJZQk9GMXM0V2ZybFBNM201Ym1XUHpzUHhERGpMRjFlVmMxakFBZEdtaUgr?=
 =?utf-8?B?N3FYY2RWaGhLRWtsQ2NObXE5NXRkQXdEeVQ1MG5MUnp3Rm1BclJWZEJXNGZa?=
 =?utf-8?B?ZUMwTzBXbGJZdnlkeHVzUzJrc3dxTTVWcHJ4ZGlRaVAwamFlRXFVcTlXNWNs?=
 =?utf-8?B?UDdlZEg1VjJPaGMzajB4VG9pSWtjaDUxb3RsOVZmTHQ3UWZ2RzdHMWhTMlJj?=
 =?utf-8?B?d2xqUWZBZ3NzNzJPbk5Zd0FXTnI3N0pDS01VbEpqMjVVcUhYS2VLUDhucUll?=
 =?utf-8?B?cU8wS08yaGhmVzAxTW1RS3FEQzU2Tkk2NC9mQjRGNVFUZm5vSFJNK09tMmVa?=
 =?utf-8?B?dWhJT0ljdG9TbkVDb2FZRExjSXM2R1hWZWhBLzJrTXFQOFB6Sy9LclhURDZC?=
 =?utf-8?B?NUhnZEtOQkxxWjJWVTU3c3lIcENOQ2ZoRXpDbTdIdyt6RGd2SjdvcFJweC9u?=
 =?utf-8?B?VXpSankrM1BUY290ek92eFpUQUxsM25WS29wTjlldnJQcVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkZEYWhTbDFvU0M4aHhaT0xUcXc2L2ttd1Z0ejUwS1RzQllkbllKMVJEMmNW?=
 =?utf-8?B?MWZld05oTUhVRlpLTWY5aTZZcWk0Y3ZpWmJCSm1LeVBJd1h1Tnc0SUF5OXF5?=
 =?utf-8?B?SGNzamRTK3dZWHhwRlJxenUvdzlZeXB1L1h4dHFMc0Zja1M4MzZJVi9nZGky?=
 =?utf-8?B?Mk9OVHdmZEM4ZklQMzluODh6MjNlWENOaldNZGZxWVJ5eXdCNGp3aXltMUJM?=
 =?utf-8?B?SHdjcG5JL1dpWHptZHB6SDh0cVRVYUhQc2UzL3lJRmRLUFpkK2ZNOFRrMXBp?=
 =?utf-8?B?anR2Szl6b3ErWXg1bC83MmZtQ3AzUWwxekRmYXJvMmtZMVRuYm80MmN1eHR1?=
 =?utf-8?B?M3YzTmxJdzVaTWEzdE91aVU4cUE0Tk9QaCtsZ2JFbDhFTCtPNmxMR1R0OGFC?=
 =?utf-8?B?TTIrc3psS2JWK1FlcDFuajNLekpqY1NYUmxnQ3NPaG9ScTA3Y29YMHZ1ZVNE?=
 =?utf-8?B?aThYeDR3bjBlODZreUhZL2NRWDBEY1ZDVXQxSnQzV0dtdTQyejUxM3FFbXpM?=
 =?utf-8?B?d01hZW8ralpyYi94cWdBeTBhbnUrN3FoOWtQTHY2NXFKUW1VT1BxV2tKNlNo?=
 =?utf-8?B?SFBBL3hPdENqckJjdjE2dmF4NVQvZnpZbEhMTGRrVUdsRFZkTkhMdTd3S1dM?=
 =?utf-8?B?VEV5SVJ5T084bHBSVitTOXBMT2lHazZRK0pDYzFWcUozV3pTRnhjc0E5ZmhT?=
 =?utf-8?B?NHJMMEZLc3loYlhaYkxaUFJjZmVzbVJyeHhjaWd5bDhBVDFRYVZWeGR0cjBq?=
 =?utf-8?B?MWlOZE9ZaDZ0RWllelhYVXJ3a2ZNS3pEWEZqeDdXRUVlbS8vdVltTmxxd1Zp?=
 =?utf-8?B?bEg0dUEzRzErbGR1VkFNM3JJdlg3TXpRUFBJWlh1SGV5NTYwT2piZERrVE5W?=
 =?utf-8?B?S0tKd095US83YW9uSFh5aWlPclVRR21FaS9kRldnK08rK2lIRC8wN2JLaUsx?=
 =?utf-8?B?aXgwRVcrc09ERHdLTlFjamQxdHpaaW1SMTRDanFXMG1hNlNmbFA0d2RDUDFV?=
 =?utf-8?B?dGMySWxrWElBSDlBTkF1ZUZhQ1plUHpLdU82WlovTXZLVDk1Mkw1dzA2V2FL?=
 =?utf-8?B?RUltYVJXMWZ4VVVEN25SUGxEN3Fsc0Q0UndTMllUMWUrVjFsUkhqYXBhMk5h?=
 =?utf-8?B?dWpIcm95U2VIQ01nK0llVXFHQzJRVUVWWEErczFrNXVmTUhDWTBzM2pHdW5N?=
 =?utf-8?B?d3BKcHhDRUIvZkdQVWRhVDY0MWdDVEpIZkVGQWdrN1dPbm56UTMxMVRYWWp0?=
 =?utf-8?B?QzZ6bHlxME05N0NPRm5KY1NFbFpXdUkrR0hVamUyT2xxeVlUVjh4VXMxTGZS?=
 =?utf-8?B?ZWI2VDVjTlVtRXhSaXdOS1Uza3ZLSWtnL2R4bHlFWVd0WlNRczRzY3E5MGg2?=
 =?utf-8?B?bVp3a1FhTDhFMEFGdkJWRlJQbnJNL3J2dmljZUVhNUdRRXdjcmx1U0x6U2Qz?=
 =?utf-8?B?WEZaS0R3SGJYbzhsSUQ4UW82MzFxOW1GYXUxZWMzcjRZb3kzVDZlb2FENFJl?=
 =?utf-8?B?Q0dXVUVvMUNlRDdIa3plNTZwUjEwM01Gd3dvNjk3bEpWYnRxQmdYNVdaL2pD?=
 =?utf-8?B?Z25YWVBwZVdhSzh0OGVqZnVDT0N4a2JTTHZkYkU3Q1Izc3RZWEU3WTJicnJk?=
 =?utf-8?B?ZnloTU9xY1BteEFLa2FOWitiRG5kcVhJNG9vMWNQVTlxTDlGYzhCSWdGbDlk?=
 =?utf-8?B?MHQ0Q205enpVZjdtTFYweldsMkxzaDQ3Z0p1VG5uQU83TDM4R0FtTkpjVkJH?=
 =?utf-8?B?OUcvYkU2YzRFeXFDQ3J4Q1BoRDZOSUJKQnhnd0daV3V1RmhIeUYwb3UwMzVq?=
 =?utf-8?B?Z1dKWlJZVWxSSWxZZmJ0R1JvK3FUUkVnN0t2UkFZYkRUSzFWME1IT2p4SERy?=
 =?utf-8?B?RWhaMnZNS051aTJ3MXRqYjBuU3hzUk90b0lTa1c1OW9VUEx1SnFHQjgxRER2?=
 =?utf-8?B?by9qTGk2WHRZZEJ2amVodmdFZWxnVnZuSjBNcC9ZM2NPRko4eUFoUVlLaitL?=
 =?utf-8?B?Y0pGZzkvMWM5UVhBUk5rMzNkR1dVZm1XdThJVU0xTC9JVGc0elZoeXBDMUU4?=
 =?utf-8?B?OXFJaitXa1FBQU9lN1hNUndXZmgwREpYN1l6enY1VmdsNFhCT3d6SEROMGlo?=
 =?utf-8?B?WEJFclFVNTBrU3pOaG01dXI1T2h4eWt1cFh3czRvcmpJT3lSQU9MVURQdnhO?=
 =?utf-8?Q?1bjeewr9I1AzVdOrPSYZy1U=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 371554e4-84f3-4229-f94e-08de3bffbbd3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:31:08.7985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkNLBDqwhFkrUeeCXcnbW0kUIp1IpFoL8sQLlkLQSFU5zyMKEcwLebtkb0V+Ym7a+Lv2YGMQSKsXfSW6E6v2uiPTHErT7zqUn0a+v/TVV8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 17:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227749

Hi Dmitry,

Took the time to test the NPU part (rocket) on some RK3588 device. It 
seems to work fine following the example from 
https://docs.mesa3d.org/teflon.html#do-some-inference-with-mobilenetv1 
though... I didn't need libteflon package (which brings the libteflon.so 
library) to make all of this work if I omit '-e 
/usr/lib/libteflon.so'... Weird. I'll send a patch to meta-rockchip to 
handle all this once linux-yocto 6.18 has been merged to oe-core (Rocket 
driver is only available in 6.18+).

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 GPU 
(kmscube) + NPU (mesa's classification.py)

However, something I missed in earlier review:

Shouldn't we remove everything vdpau?

mesa-vdpau-drivers package for example, as well as 
FILES:${PN}-vdpau-drivers and the path in FILES:${PN}-dev?

Cheers,
Quentin

