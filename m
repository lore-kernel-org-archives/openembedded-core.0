Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AE3E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 23:13:47 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.75])
 by mx.groups.io with SMTP id smtpd.web10.141836.1734650022135909022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 15:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=J+IciLnN;
 spf=pass (domain: oss.nxp.com, ip: 40.107.249.75, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3iz4xiQG/wM9XfpIxnPzbtY4Pez+7Eprx5SAKQM4ozVpGKN46TElpWTuZ4fFk15cdTvII3y1abs5IvadY5amtmDMN21OurD4Eq4J9r+vQnLlI668VGWzEevqfBdnddrbLXcire/KPu/4ruFv0mX7qpFvVjKoUuVka3m/LaNKbflFii201/pAaYD0DZCztEzwD6Y7Ue3aUeF3rlMQTCDEDzWyFncL8b5L5YiK31LsKL9BsAIl1m9gbbs/zD8N+YDiELurKgWL8lPr3EL872Nrc+K6hjJgfeitGkWAjvHhHbL/dpv/D/fisVTDrcEI2OaY/4fzXPSgYr6USC4K5bazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCBFW+nz7in/cJBPl0gXVk1hJpX5u9p6jhtREtVAX0w=;
 b=Hkfm4qWxdnNDNUQz9/jOqgMEccN7e4tJILHW8UUXpAsuUimANKv7nSsDSzhxQuuouKX9f+uhvudZQqJQThRz2T83STcZ/lRZF//kaksw2T+aUZMuVdMJjRRXdDslnkzJsJnareZqh/rajenDdUQQM8emVVSsUXcUfySOB2Sz7Z4OicmWtLyII3oXc6VLkn1sV80LnMc4kW240zn0eS06Ln3UX1Pg76zOKX+PD8z0F60QAXKYOpD/g+fXAuKiKeeyZbT0j52itRPei9rtlnRrxzZ9zqYq7//2irsiDl+vJW5YMFgQwILl9tPoJxTA6FVi00CYpm6HCaOBomuSzYFhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCBFW+nz7in/cJBPl0gXVk1hJpX5u9p6jhtREtVAX0w=;
 b=J+IciLnNUO0o1/a/umbf+5b6y4Mt3lnQs76O/OH+TYWC8/X1n8JlDfTA2915xyQZqFJ+2hBVTAr/Fi0NNAsic4c05itZoJpybbsSf9bCar2appJ5GOnteRKh8MWiHseAr3eFHAxOpnj0IMRFVSMKOsg4q4lci1IEDvUtW2ZSPiHNVg3RXHoOfyYCagERV4OA0C1RJr78UXk5c8XnorRLvtFt3K6rj63uK4ixX7JsIsCQDWgjiuQBRj54m0EuS9aA6nS65MSSc+lSemZvFFYC2aZ0sYYI5x64DQndQLV1tYDFQe14POC5GsCL90KKj1tgfGSiR0x4sYJaf5BxyhVGIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8938.eurprd04.prod.outlook.com (2603:10a6:20b:409::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 23:13:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 23:13:39 +0000
Message-ID: <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
Date: Thu, 19 Dec 2024 17:12:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
 <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7c3660-6c6f-42bc-cf77-08dd2082c597
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0pKbHdQLzhoOUZPVktDZHduRHZDT0hWam5HTG9SS2wwb213V3JzbVV3STVo?=
 =?utf-8?B?TFE2ZXgrUURPQVVQdk53dkhTQ3F0V1phUzB5RmcrLzNpSWloK2oxL0xVTHI4?=
 =?utf-8?B?Mzl5T1VDTXQ0R0JxR3ExNmpGTG1xcGpkQlpEZ0dTK0FsODlVV3ljZnc1WDhH?=
 =?utf-8?B?MlArR2FSUllONkJYRXlvV2UwcUMyam1FOGlHcUk5LzVIMEQzcUdNbkw2WHR5?=
 =?utf-8?B?WUplUWxmNVdiclFVQkErdXdTQmlUMWx0cUhnSW9hNDZ1Z3NZOVdad2craUNP?=
 =?utf-8?B?T2lDVEJNM3hhWEg1dkJKTDBPUFc2b3o2ODk2UEMvV3Zic1Eva2FGRGY5RzRK?=
 =?utf-8?B?TytLOG53K09vSURaZTArNWhTRXhWOEZ6TGZIR01nbSswc2dXMnh2akhrdVZy?=
 =?utf-8?B?RkY4V2tXdTdVS0NVMjZ2b3FNMlBGckZQRWpyN1hXaXo2ZHB5L2Naa0RtQUU5?=
 =?utf-8?B?ZnlLRjlkTDM5ekRmOEhBSFlWTjRvQ0RUL2tXVmcxTjBNdWhKQUIvK2hJYkto?=
 =?utf-8?B?bTR6NDNLclliQlRoM3p1TER5dEhMdUdueFFuekRjOW1nQWNSNGZxNU1HTFVr?=
 =?utf-8?B?dDBXc2o1Y1plTG9tYUF6S2dmVFRLVUJ6UGZZSytlc1BBNTZ0UVpYd3ppam1h?=
 =?utf-8?B?amtTbVVkd2MxZ3JHMWhsZ3lVaDliNHpHa1BzcXA5c0tWNXNFdE9vbDlOQzk1?=
 =?utf-8?B?MHdWdjN2Rkt2YTFUMWlnT1RDREtCaXdMcUtLa1dUSjBwVWhac0F1WEhFa3Y5?=
 =?utf-8?B?MmJkNkJDVktEN21OQ0dJSGdKV1gwMlNzZDRmc3RaL0tFRHFOMWM4elphTnlF?=
 =?utf-8?B?d05PSkhkcWw3eVBQQ0dWN0dxUGFhY0hYMG1oeVM4dFQwZTljWHUwaE5oUDJK?=
 =?utf-8?B?MmhlMk12U3ZidFJoaUdCdm03NXM1d0JaQVp1cUZ6ZURRZnI0Z0hwSU1iRWdz?=
 =?utf-8?B?M1craGJsTEhUNXcyY1VZaDBFeDBkaGZRNTBFbDQwcWF0MEE5QVQxWSs1YU5l?=
 =?utf-8?B?eHVkbnNoaU8yMXZFMVdhZXFmWjZrMW1RMUFlaytjZi9GREQwWWJTbmZpNzFr?=
 =?utf-8?B?QUVaN0VLL3JabDZuaFJCK2lSOWptU0xnd3V2Rmg2WTF5NmYvL3UwVXh1aDZa?=
 =?utf-8?B?ajk4dDZtclVxd2VOQmFOQ2ozcmU0c0xqQzBMc3hURzBFcFdqeitjV3FLRmph?=
 =?utf-8?B?SDNrb1NraVlsSGpLc3VjQ25lRkhWZE9INHU4QWJBOSthSitDZ2ZsZGxORDE5?=
 =?utf-8?B?bTlXcjlMSnloajhNaFVqRVJiQ28yOFozM2hSSU5IaEUrWjQwRjlySmwyekgr?=
 =?utf-8?B?ZFd5OGp4bDU3S1V1ZWdtVDVGNlpSUnZEOFYyK08yYWFsWjlrbXl5Z09ocElB?=
 =?utf-8?B?TnBQeldVRlZsZEZ0TlJNUm9KcHkzbGZWVVJEdGhLeHJHVWg5Z2krTzV0cHli?=
 =?utf-8?B?QjFkcmFlRDFtVXV0QURNckltVjMvOUY5bWc1QVNPVVlrbFZOa0pYTktEd3hS?=
 =?utf-8?B?a2F1VzZWdTkwZDJaUHB3RzNKYk1ZNEhLdFliQVRxWFdQTVp3bURJUFhkcHRt?=
 =?utf-8?B?TVhkdExCUCsybUtyZGJlTjNKZ0RRNjN4NlVrN0FKamZuSGxvT1YwS3ZlUGZN?=
 =?utf-8?B?OHl2VkROZWwwUG5uRnVqb3ZGZ3Y2S05vaXdQMlVmSnVOSDcvVG9wSHNuQVJN?=
 =?utf-8?B?Z2JOMGRzNVFUUFBLaGtwWlBZU1IzVVVxQlAwMld2MFQwVFVycUZmZlNraTJJ?=
 =?utf-8?B?Nms3WGU4YllEWUViaTE1VWFCU0JrME0zak5RV29Ka0svQUVBRjZReCtFS1RH?=
 =?utf-8?B?cEhPYmR1NmwwUGtJNmZneEYxZ1JPeDlWN2Z1QVRrYW0xUjllTks4N2UrTVlv?=
 =?utf-8?Q?X5gcAurS14At4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3hsc2VTSkxwWks5VzlKRGRqWlFUMG93NHJqSWxzb25NS2hRa01OT3J2T0Fl?=
 =?utf-8?B?LzN2dkN1VXZkVHlMRWpZRDg3Mkx4RjFRNGNFekx5UEV2dkpRT05sajAxYU4x?=
 =?utf-8?B?aG1qaStsaE5ZMnVVUlNKcWNHVWpxVy9vMDQraTRXbDQzSFdta0pKQmJqUXBx?=
 =?utf-8?B?VnhXa216MnUvc2ZmYldvQ2Fpbm42amJVRWtDRGZmelpxb3V2ZFlFVWo3OTNG?=
 =?utf-8?B?TTVabjdlWFJtSGRJMGk0Q1NhOEhSd1ZoRXJlZnRUUUpzRDNYM2h1cTdIcUVz?=
 =?utf-8?B?SzFsUnkyWlM3R3dlM2F5YWlJNGxodXg1VEY2STNlM1hiUEcvUVhVM254YnlE?=
 =?utf-8?B?Y3MrTDlxemtIbzY0cnBFQkRXUE9aeXJjQ3ZqUFFXbDljQU4wZTg1OFkrT2hs?=
 =?utf-8?B?NzZKTEx0Z1VUWVNGdC83d0R0cTdLa1duM3VYL2xEOFBpVVVIOHlCVnUzeTRM?=
 =?utf-8?B?YXl6anY5WS9QaDkyayt6TWJjMTJrNkhlYVY0RzhkN1ViU0hoTDhycm95TkVv?=
 =?utf-8?B?UjBGY0pPZXlERGFwK0gyUjRTUlBKMGJYVWtKNVBDSk00b2g4anVUUmJyVk9q?=
 =?utf-8?B?TFJ6V0Voa0NYeC95d2xBcVQvSjVac1JZSHN0WmNXK3lVdjkvOUtmYThHNHdp?=
 =?utf-8?B?TWRuYWE4UU5pMmQrN2ZCNVBxSGZucUtQd013TUNldTFMS3NLV05iL2dFN3ps?=
 =?utf-8?B?Y1FqVUwvdGJldEpnaVFnd1RiK3hxU1VTNXY0MXhCN2hTUERsSDN5T1NyRElE?=
 =?utf-8?B?YVhaeXRSVkNKMUR2b3VOOG9INkRqTHpMQytkTUJiZGVaL21mZDB1UEhxQ25S?=
 =?utf-8?B?Q0duc0dETGpWM2pLVTl6ellhcWFMQlRrV1VkTU1BZFJWZjZ4dFg1cUpFNXJp?=
 =?utf-8?B?dVQxUzdaMURzOGl0dVdhZm1UNEZVd0N6RHJ3RVp6cHFmNjRPTVRoaHdjODdx?=
 =?utf-8?B?cHVMSU5tanIzQ0JtZEFhQW44ck9odzYrcTNxRHFudjdvUGs4TDl2T1lJdXlC?=
 =?utf-8?B?UHlCbkJ3a0lnQ0tzcVE3cXExWjU2T082cmVaajYwRDVRZXMrK0VaaEhVeTdU?=
 =?utf-8?B?aE9hS0N2SGtrYllRYTdrZXdaclFRSTVUQ2pTMytqU3Y4NUxyT1AxYXhxMDdF?=
 =?utf-8?B?REp5OERkbGZlQTlFWGVZa1hHVGtmalRRZ21yd1JsYkZPb0M5MnBsdkRwNGoy?=
 =?utf-8?B?RDc0V0g2eW5YU3NoQWs0YjVHK1Z4UnEzSDZEVDZRS25wcTVNSmcxVDhBWGN4?=
 =?utf-8?B?cFlYdFFlQjc1MHl3ZHdCUy8wazBERTlrL0pDWDVrcTZvRWpoMytTSkVUNU9L?=
 =?utf-8?B?aW5oRVQzRjI1eWVZYXVHcGFxRjZ2ZUtlR2doRUxjSk1ZcFZuNVNFUWhaa3k3?=
 =?utf-8?B?b2w2b25mRmkwbVE5UU4rTTB0OGlMRWFQeTIyUE9FdllUUkVZTVV2L2lCTFdG?=
 =?utf-8?B?cTR5a3VFci8yYWNLa0w5OStYTkN2L01pK29wUGRLVEl0U3EwdCtaZlU5VXlp?=
 =?utf-8?B?SDJISlV1dEpYOExJWVAxTDdPTXVwNFA1Y3J2M3VTQ2xHeDl6bkxwaDRXUmo1?=
 =?utf-8?B?VVJ2SGNkVFRDWlRCK1M5Zm1hYnhQTktpK2tZbExzd0E0aTMvTFY5TEpVTGZO?=
 =?utf-8?B?WmhCWkQ5cTB4L0IyTGRGMHBhY1BpWTVkUDNYWWFnU0p5UG1LQ0xHbmg0UXp6?=
 =?utf-8?B?Q05JMWxXeldzSlVDZ3pXZE0vV2p5Q1Naak90cUVseTMremtPL2U2ZHltNnF0?=
 =?utf-8?B?WFNFN0JhYTFGL20rVnZVTkFSd3JQMUF0S2orbHQwUUdNaXkrZlRQOUh5M3BJ?=
 =?utf-8?B?ckl3S3dkMUZOOTRFU0p4NDhURmt2dXFoOFFTak9rajcvQ2tielZ6cG9JMGpY?=
 =?utf-8?B?Y1VKRllvL25yWEpXOU5xeW5XRmVBMW9ibnk2aU9nZ3BhSjVBb1Nsc0pIMGl1?=
 =?utf-8?B?aWVmeHczKzZGaFFpWlBvQUNRSmUxejJIWExJdlpZSnlIVUxhYit4YTFMTi9V?=
 =?utf-8?B?QXVraDBsUXd0c1gySzhaWW4vWFB1SkI4bG5XTXM0SXFyeDV0bXhJL0g2bEE5?=
 =?utf-8?B?WENxdzFocHVtUEJkR1JickQ0QWNmYUN4bXIrM05sdGNSdnlSNk5pb0FwTEE2?=
 =?utf-8?B?WEdRZTN4SjY4RENXcWw1RWNaSVVBd2tOc1orcXFReVQ1bklwVEtyWlhpcGdr?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7c3660-6c6f-42bc-cf77-08dd2082c597
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:13:39.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgyAyNEL+9nbzJ1p0iIi8VDpsoxemtp/QNVA1rfsc4TzGlRpRIl7lgXwl57K5T0xIIOLJ0E20HG1bMhi+Q/d5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8938
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 23:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208965

On 12/19/2024 4:41 PM, Alexander Kanavin wrote:
> On Thu, 19 Dec 2024 at 23:22, Tom Hochstein via lists.openembedded.org
> <tom.hochstein=oss.nxp.com@lists.openembedded.org> wrote:
>>
>> Building weston with core-image-weston SDK fails:
>> ```
>> Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)
>>
>> tests/meson.build:357:2: ERROR: Problem encountered: xcb and xcb-cursor required for running xwayland tests
>> ```
>>
>> Fixed by adding xcb-util-cursor as runtime dependency.
>> -PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xcb-util-cursor xwayland"
>> +PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xcb-util-cursor xwayland,xcb-util-cursor"
> 
> I'm not sure I understand. If the error happens at build time, how is
> it addressed with a runtime dependency?
> 
> Alex

Good question, I actually made a guess that xcb-util-cursor is missing 
from the rootfs because nothing actually links to it, so Yocto doesn't 
automatically add it to the runtime. Adding it explicitly to the runtime 
forces it into the SDK as well and fixes the above error.

Tom


