Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567EBD41C1F
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 11:36:42 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7365.1765452993004551330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 03:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IPas4H3b;
 spf=pass (domain: cherry.de, ip: 52.101.72.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFwW+WTglerrHxRqj9M1TlA1u3GDU/+KJBsO2LJL10fwITnSiLD3sDpZzV4k+Cim05q+S84VMfq3/zHYMT37kgygyJ0PcI4O/4oXLw8TCpPASr335s/hIjo1Eqc2xvHN9ewufY1KDX471W3IaNJpHH/6QRZWxBudCns+19UQT/8EHKngpW67ngNvSrWdjR7+tMWZDNBIG6rpsxqKr72n7orRl3kYxtCRRlTrse1WdZEyn8nY1/ou0ZmWnKpd/RDjz6OA7pTlIw+OtiScnpEHYGc+do1BqdfKTwuLXbNKdrYwhxVuUHHmcFu03f2LxVPVz7OjR1voyU0hgCFXhUhpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0thxUITNbl6q8u5atalw+IKhYXBpPLcySbWv7nQ8ShU=;
 b=pCi8xFXKzzjYj6EQdMMy2Bkbq8TJAu3r49CbN+Ciai+5iXt35IwXVz6CS9kE0D16vZaUlAkemzulvXG7haymOR/StHoHjFegdEVpc+ZXZ8duK5jgCTcU2UeEo9J95DiifK0k94dZzKZO5uUoAR5fCzWI0NZ3RQXR2SFdpKXhrJunv5CdkyBzb2dHUtEnaua4wUpwn3KCzrHdgtDD2uqb43brtQqKPtX2s+zgiuDeHpKeNJt0z551ISBPqJBrFawfmww26nHXYTYOUuzW9/b6UeTqUskd8wr6RP0f4a2FE+WNX93f0ZKMbPaCPC7srscMTWpTPP/cuQAnvVkyR9pztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0thxUITNbl6q8u5atalw+IKhYXBpPLcySbWv7nQ8ShU=;
 b=IPas4H3bjQ23MDvfjTR47izFYFkRmsY+F7ysgjw3Ty9z8qQxsJN9Dxjn7VvFBkZhiu8zCTLFsyvzCFOdqARro9aiN2eRIcDIEKqQQRJtdrteGYPFFLKwmsvQEw/04qo/vdg3iDtzaMInbO2vZ69veESU9Qk2zMdKnPJZQ4N6crE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11857.eurprd04.prod.outlook.com (2603:10a6:10:61c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 11:36:29 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:36:29 +0000
Message-ID: <7cb670a0-a0bb-4615-b934-5f7c1ad22fa0@cherry.de>
Date: Thu, 11 Dec 2025 12:36:07 +0100
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
X-ClientProxiedBy: VI1PR09CA0101.eurprd09.prod.outlook.com
 (2603:10a6:803:78::24) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6719f1-36e9-4a98-78dd-08de38a98669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?enJxYkRPM0hqa3NPVWhjYThTeE5OdWdEaWZRaXp6RmMvaGxFZllub2ZiNDhP?=
 =?utf-8?B?Q21VdHJJdk9EOVVoelN2Y0hhVG9aM0lEY3FhUVZMVTE3dEwrbHdHR2RvYmVO?=
 =?utf-8?B?N0FGNDdNZWhKbTVYZjNRd1lQWWprUEphNkVoYU1yV0Z0SGo5YWx2c3pZV0FE?=
 =?utf-8?B?QVB3WWpZUW5rN2Nac0QzV3diZmtHNHVPZkhuRWtjS0dSOWVJR2RsMU11QUhI?=
 =?utf-8?B?M2dYNE51Vy9GdkdpeDVSWnEvS1BrVTM5bE9ZVFQ2Z1oxdlVvcFE0aUtjdXRU?=
 =?utf-8?B?UmVRaUxYMDlmZ2lWWjlSS2NxOEJIcXZidDhGcUM3TVF4bW1zV09WODRjeDlE?=
 =?utf-8?B?VU81ejQ2azE0ZGlnUFM3TVJoM0JGRWgyZlBYT2xaa2daV3NBS2E2b0pxVjh4?=
 =?utf-8?B?VytDenovNDB6TG9xdmRiWGN3Tzh5a1FtcUhtTG9ZUm1BLzNrVlRaY01NOXdX?=
 =?utf-8?B?SGExRnpZWG1EdnQ2R05pNkc0bXhMVXBIRWtBVHNmeWtqUy8wZ1cwWDV6SVRW?=
 =?utf-8?B?dVVMdlJyYzBWZmVUNkNOYjFtNzZJYmhCVCt1RW9NeGtjRUhRWjd5UHd2ZDAv?=
 =?utf-8?B?UGxHWkxmZ1cwQ1NXZmJkSFNUaDU0TEJKandrS2x2QnNzL29hVThsQnlCWnJv?=
 =?utf-8?B?eXJiTDRmaEFvUm5PYjNmMUNCK3REOEVzbk5YbGs2SjljU2VSUzdZWU45MUI5?=
 =?utf-8?B?eGk0Y0VtYU9BQ0VEY0U2eFJsTHJjUEFoYXNuT2M3MnVyLzN0aVIwUmtISUtJ?=
 =?utf-8?B?TnNqLzh6QjdWSkZxaWVNLzFYQ1JkTG1vMlpzL0VWYjh2WmFDUDFnNFZZZEQv?=
 =?utf-8?B?b3hzMmFoQ3NtZkYwU2Juck81NS9oclUxWjlZSDVhYTZaT2FHaFU1eFBjeEND?=
 =?utf-8?B?YkQvcGYvSHFpL1BvYUREYnVRZkJhVlBBKzZ3ckhXcVJvbnVkci9MZ0dKL0la?=
 =?utf-8?B?Z1MrS1Yxc2U1Nk9tSVJGeUtOTjFXanZUWHlNdmpVcUtISlIrbXlkcWYrMW9B?=
 =?utf-8?B?TkRJdlJYaVlhNUxVd1dPWnFHV1RpY0xVNVhYTUJiOWRJRFp2TklJaEordEU0?=
 =?utf-8?B?c29xd0NYRThEamJ4SWtQcmlmRi94YUNiWmtRMTVDQkRlY21JNE9DQmJiV05l?=
 =?utf-8?B?T1BzdXRpNHpubWQ1a1BGQ2h5Yms1VDA0U1dHbWovd3NZUFBsRkFJTGpFM1JI?=
 =?utf-8?B?Z0hkdS9MQW9ZM3RSZkdVc0puQUhjZkswNTQ3REppN0t3T1RBT1BEcDhBQzZ0?=
 =?utf-8?B?TGNOWkxubDU1c1VsbmpWbkE4QmRDM2lUaG4zL3dkREgyMzF0RERpVHVSWTdi?=
 =?utf-8?B?WWJQMk5nQmp0R2tISzl1ZVpNbnVKLzhTdGhjdGNEM3R0bW5IaW9kdWQ3U0ZN?=
 =?utf-8?B?UlRPdDY2Q0FJa1pSdUxyN3pvKytTd212bHp6R0xzN1JTMFhURE1PUDdZSk02?=
 =?utf-8?B?Q3BsK1FnYy9xYXZHQ001ZmNLRUtSQjdUTm1VOWoxb1Z1K0lhcEQyTG92NDho?=
 =?utf-8?B?aC9FdTA0NUJMeEM0U3I2RUoxSVp5eG0rSUZyazlheG9iSCt1dk9SazRocVl2?=
 =?utf-8?B?Z2FkelFqNm1zbDVmdnZ1Q2FVR0QwTEVXZ1V1TUJVY3hkSVZuZVlHNHZMVVFj?=
 =?utf-8?B?M2taOE1yU0VIYUFlQUgySmUrY3JlVW15ZW1VZ0tpVGZnZGYwYjZoeGFIOGlh?=
 =?utf-8?B?R2ovdTgzWFBUbE9nY1VNSVk3VUhTTFVrYWVwZE1zK21DYWJhSmpwSmpUWm9M?=
 =?utf-8?B?d3RkbUJVTXJtUG5Md1l0bnBJVG5hbnhvZnZ4UHVTUFpRdWxwZml3S2lvdFJv?=
 =?utf-8?B?SFE2R2x4QlBkRkZkWkg0aGRYaE1PUkJiMGd2Uk8yY0luWWdEdHdrVVNqcm9m?=
 =?utf-8?B?YU16VGhIeVNhanduSFdKME5BTW9nQ1U4VEpEOFRieVNvcmZQSXVsU3FnNXNP?=
 =?utf-8?Q?tGLbxPrm8JzTwjQUG+3pw98GmhmaHiIa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aW1FNk5OVmUvQmxaWTlhTkJzbUtEVlBodExvRFFvNjBROS8wb2YwbGdmb0p5?=
 =?utf-8?B?NDRNT21xMEVmRGEyTk1iVXhLWDhpOWdkU3Y1dGdFUkZqUVk2dmFKY0JXNllq?=
 =?utf-8?B?RG1XT0Z5S1R3TGU4Wng2V1p3L3NXYlBaYXZnMEdvdVNKSUU2cWlKckRZUjhK?=
 =?utf-8?B?ZjlMU09QNkY5Z0FXV1JFcTQ0b0FQMVYwMjdKNmRPWHEwcGdQUDdHL0dCdVc1?=
 =?utf-8?B?WlZxVU9vdlJOZlBHT1BtcVJhRnpFSENCSFBpekpZTjkzclNSYUdKN21Xc3lH?=
 =?utf-8?B?QlM2OW5ZeDdudWpRZlZHeFk5TG9aUld6WUo4aVJDVHljN0UxSDhjdDhmejJq?=
 =?utf-8?B?bE5pM0paUTlzZDBPM05JWGdKZmY3cWNmeHZ3b3Z2TW8rZC80TDBaRWNrWGp4?=
 =?utf-8?B?emJCeWRkRElLamVuaGhyMHA0czdkUVVsN25sTkRUbytPaTZ3YkJsdTlBY1hC?=
 =?utf-8?B?NDRPQ1l2NDVDQ0pnQ2NSNmpyTUNudktCSFNIb3l5K3U4MlhxV3pGWDlLSmk1?=
 =?utf-8?B?K2ZkTE1WdytzMlNtbktmaDYzY2ZQNUJTeERnOEltVS9PejVPOEtydUdtTW8y?=
 =?utf-8?B?TEttVEVIVEJXUVZwVlU3aStzaUZZUFVjbXZ6akJDNEV3b0JkbENFdlV1eElt?=
 =?utf-8?B?eVR4VTZ1emlueVkySFF6alU0QVdlWDRMaFpDdWloZGVQU1Jndm5uR3BzU2Ew?=
 =?utf-8?B?U013anNXdlJDRWJBTlB4dU5LdDJINU5hcDRSd0JPNnJ0VVo5K3NIdnJyMms5?=
 =?utf-8?B?dVo5eWdWQlUwMkhCWk1ISG5Za2VTcCtueDgvM0o1VEhieWJlaFVuYm0rLzJZ?=
 =?utf-8?B?RWN4L0VFWVljMlVjZThCVEhZaSs2eFZnbzQ4ZDFxYzEzKzZrMElieTU1SjZZ?=
 =?utf-8?B?SzBTQ2dralpSTjRmNUFCUDZIeVMvOGJnWUZkM3F6NXdDOHRkb2pCRi9jUTh5?=
 =?utf-8?B?MFQxUk5xZjRDdFVZWnVIdVAxek9uRmw3RmFvZTFjVEdMR2YrUzZ1M3pWY0V4?=
 =?utf-8?B?ZktQZmFUY0xkTmlpb2xZQW1xS3NqY0tUYlZOQ25zY1djK0lkbmpJdWlodE9V?=
 =?utf-8?B?M3FTaXB0czcxN0FoSFFpaGd0ZTJYV0hROVIxRWh5S1I2L0FHNkNvMmJDVVMw?=
 =?utf-8?B?RHBHVUxUQ1h5c1I2dUVseHhtRkhNOHFrbGdYMnlGOGVKVDkzaUZqTE1ZeGJB?=
 =?utf-8?B?M2pyNGd1VjU2UWJkVWpGN29TUGVYS1gwVXlnZUk3SDB0bmZ3SHlSYjlVRjlj?=
 =?utf-8?B?bVBGc0VIV2JsZDdITVNValJhcU0vaFA3eEpQRTJpSzhxVjFTODFpcC9TTDQ4?=
 =?utf-8?B?VGVhcFBmNXo1eER1b3hZbXAreXRRS2dwclcyY01Rcm1aeW13RUpKc0dHZjdO?=
 =?utf-8?B?dEV3bTh0UXF0STlHTHV3SEo5NzRJZHNpNEtYcVFWcXQ0b2NzWXVpVGxNZS9T?=
 =?utf-8?B?U2ZPaG1Wb1dyUy9kdm1jWE9OYjJFd1BiZ1U0ZzdHYnlsaFFmc0Y0VGRWRTd1?=
 =?utf-8?B?c3NzODJjWm04aVJkUXFJNUtabnA4ODNlcDRMWGkxcm1hZThDVWU0TmVNdmZO?=
 =?utf-8?B?aXNGU3VJMVhZVmJTeDY0RmhQcUR4bzNSbFVMWlJzMUZMeExqc054MUdxRkpu?=
 =?utf-8?B?WWJpR1Nqc2l2bktLNkxlR3RUUUdHdzZxcXlrUzBwUzZSeS9VV0Rkc0wyY0M1?=
 =?utf-8?B?a0laYlZOTkpxb0d2V0RWeDRnRW5CQjRlM250eDJLcldFSjFRYW9lOXVaOUZp?=
 =?utf-8?B?NWZlTUMzYXZGb2lMblFLMTNpRE85RW83U2ZHNzcvSXZkcmJzU1JwQUI3T21w?=
 =?utf-8?B?eWdiM2U0Umk5ZkczcU5uU2UwMXR1cSthQ0xhc243U1hrcWVOTUdLMVh1VUhi?=
 =?utf-8?B?WG1PUVRmRXpxZm13eUlYa2N5MkcvMTRpSm5yeXpMVXZybWwxdWU5aHNlTVRC?=
 =?utf-8?B?YnBJeWRhYk5LZ3lpR2N4eFNWbWs1emxYQWFxSEQwQVArRVl2L2JRZGVrZkx2?=
 =?utf-8?B?azFBNWRGcURuSFdlMUJGdUxlTW1BbTBUNkNxREJCUlBEVEhzZzlaRk9uaGwz?=
 =?utf-8?B?Z0ZrL0FVWEpac3V4WkZuTTFuMjF3YkJiSnZUUkFDVEpnRGwvSTRUeUtySzVh?=
 =?utf-8?B?aWhvLzV6OW5RY1lhVHJIZ1d2VFJZSzhHaE50VUtnb0VINVVDVDc0ZGtVdU1Z?=
 =?utf-8?Q?38EVEEZHDkK88+nVEaiwkY4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6719f1-36e9-4a98-78dd-08de38a98669
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:36:29.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtAEcmHystta23/R8B/P7HFWC3Qub925D1jSYGlqMoVeJDbJB5Ca8dPssiyNrwMmFzALA0sGVNY5sy+3w7kTiPHUrMW9BaAtTEXgF4UBMzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227522

Hi Dmitry,

On 12/10/25 6:58 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Fix few issues that were left unnoticed or breaking sorting order.
> 
> Fixes: 64108679ada8 ("mesa: sort out driver lists")

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

