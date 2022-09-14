Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB4FECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:52:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.67])
 by mx.groups.io with SMTP id smtpd.web10.3999.1663145562578338174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=IxXpmwFG;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.67,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCzZdFULZ0ZnWH9c3ykrUsx3Qp4MiZR0pnoOytw2QtO7vuZGcMUIC4ymuKWpJ66blZCeWoknd3RPmLqDjY8P1mkteZoQd65IBaptbJxILU9yBGqWX67ORIo1tZIfN+bV5jYOwiNC3jW9Bm6rIlUYaNVo5azcifLUsW/15bXAj/e/4llcwYMt+qQhH9ChDi/hBkBIijbUc+vK9cmEu+6g4clWyAVNTuoRfhO8SQXi3yJo0HH3AsuHEpgyg06M2y4UZ4loGsSbAqqwnGge3LXvXMQiUM+fYLsxYXBZUeLwuf5wLDYvIBkxtYO1k4HgD9AYxmrdOmA4OIUP47/QL1O90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bDaZyzFULGDA1eBI8xbevV4RXWEb74m+Qn+LK+4/O0=;
 b=KPDynMkrae9NEIniWfgRRBI+CTtOCoB/gbUd6Jam4W44FzW2Wh5UtqmYZUF/gMfGSmNm5MGZdLOANKkjv3z/GQmFFR5o/VmVK71cwHG4rLiqRP1Ee7EEX/DQY2eub9T1pq1shbIS6JiIKJCMI/G+Mg9tW70PsIVfm9eeODT4drYD6TyEMMtosD/Y/A00VbgT+xCnhzxp/QBYErL0pAK53ZykfHHYWbGyQuBphI9JLhJN24syKqPxFf8bKEe61L7BDz5OItGKrsoG+gXE3nsZJ1GxI3AqtKIXBa+b2U+g5kN+zCfZMRdmHNhQIrjJP3FODqXb4BBAgw0SwlcETgEErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bDaZyzFULGDA1eBI8xbevV4RXWEb74m+Qn+LK+4/O0=;
 b=IxXpmwFGgdyDFJ9g0+AApPgrs4BfDqAEIlM0Q8xbRi1TY3JzLeuAQIpJI69tM9/Z9oM9KFntFQEymwr3r8ATFcaTntPETwp7Ya3M+CmB1QKjj60XljM9B+0rSvxGOXhLxi8s8OP6slAjvq1Fm4Weo3YImiDlT4M6sC8fI9le4G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 08:52:39 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 08:52:39 +0000
Message-ID: <5b9e4e0a-b401-6c3f-b4ab-a04f8c180399@theobroma-systems.com>
Date: Wed, 14 Sep 2022 10:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [OE-core] [PATCH v2] python3: add PACKAGECONFIG[editline]
Content-Language: en-US
To: ecordonnier@snapchat.com, openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220913152553.107118-1-ecordonnier@snap.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220913152553.107118-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0591.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::23) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: fb37dde3-e6ce-484b-3346-08da962e7a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yQDUGLdkbKeFMsgnjU0Ap/Uiz/Cio1STdOiWmRe1re3zNtlaqlaZn4bOOebVi/15L6Tou6nRWDQlITxz2Ltgxjv6rc8rxDpov0+17oIcU6xSan/l+un82kjsUbtZxJW3kioYZHk4OH/w7nCseMg1BkVRK65rSRTC6072VLb6mRWXITj0g8qxN9jTiZrKddD090FeyQXkXUkli0gTS48d6sh9JAw32PpwFM6cN8ZzNLUk4XZ9m9Ex1ui2jLPFFFPzQNtHj7lgX603Tce9c7kioCEsMh9IbjPF6TzrDj4Ztn/Aw7slE4wAjgIA6F6Mbih1JmZTwM5SGdoEp7XrtwQNaDaTgzbLXOWA6IRugwYQkzUrXJwo6ISIYtEMPoOnPxjh7z07ZBiVCejWI0zjdoNIkDHzV+ikDj8BmUiZBprmWOOYvbhBSSf0husr0URpucYLQwCEMswHEJDLGq3XvbjIajEg4wC25jOhnuemkKIxebqTiIMo3zRBxM/euRwjFxgkx1sDT4614lB5uDIl++DjqHIssEYuXn6YsO/N1EnrpPhcEO9bjmos7iIh+74LlSFhCYgyY/oRFak0Lx+LydaUQDfyYtuMpEP4VHZRt+PQjSN4wgQP+mnpd5QV0rVsFvhByMBzH3pXfl7BMFJjScJljwNwUpBR1uy7jlSoO2/XTQyHULz3sOCPnRPFD58MNnQasMvID8EyshukFtQa2+31XA2iXuAC1vQ6f951uw7c/WAQ+dRcVO3051+p9cY2zDygGXy8jc3igW643xr44JHWVSYlBtfCvPj3E/mAsnG7LG8DmWaecPOoZMd+7U/AzK5q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199015)(316002)(66556008)(4326008)(54906003)(2616005)(41300700001)(66476007)(966005)(186003)(86362001)(6486002)(66946007)(5660300002)(8676002)(8936002)(478600001)(44832011)(26005)(31696002)(2906002)(53546011)(38100700002)(6512007)(31686004)(36756003)(6506007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ek1rTmlQTENvZGtwY21SMWg4K2N4QlBzaEtadTh4ZmJ6eS8yNzdYOWRwa3Vn?=
 =?utf-8?B?bmg2Y2FkZmNEQTFEZFdLRmxzM2pQV2d6cVpuK0J3UjJTSCthdEc1cytPanBQ?=
 =?utf-8?B?MmphQWMwNTh3Ui9qaUd1d3dCR3BtNnFQU3BEMDU4RnEybXFqQnI0eVRreTJa?=
 =?utf-8?B?MHpvV3p5aWYrOHRpWFVoRWJPUVUxSk1zZjRzRmI5a0RXc25oSThhRUlBQ0xq?=
 =?utf-8?B?anlCeVZ4dFZyaVdlc2FwUEdFQXYzOGxpQVBxam9iRXo5d0lldHhSZzRNQU0x?=
 =?utf-8?B?TFpIeXc5VnVtSGZUMHRiSUQ4b1h5Y2hHeUdYSkhLSkdsanNSNi95MXpMUEJI?=
 =?utf-8?B?OGNmU2x5Q1ZaNFpiOHRoVHBxNmFpTFkxVVRYU0NTMStqTXRFNnE4ZCs0NDN5?=
 =?utf-8?B?RDNGb2d1cVhUNkpQcjN6blhPQ1hOT1Bnd3hwSStEbDBMWGV0TlYxNmwvb00y?=
 =?utf-8?B?RmZWRDN4alJUcHpVL0J2NVVJNjV3bTJPWTBHQkdDOEZBTVdFOVZwVVZBN2E2?=
 =?utf-8?B?L2xhanlhQkhWRHdENVVyZHo4aXRhdUd2Tk9RdDR3aXFmblBudkp6VDZwaEwz?=
 =?utf-8?B?THl6eTlXS3FtbTVyK0V5S3RmTTluWm1UZC8wK2ltM1FQUkYrSkE1UHdsSTJT?=
 =?utf-8?B?Vlk0eXNkaUs5cTQ1VGJvcG53WkMyMk0wWDJUWUlTbFJmNWhvcjZMMmVFRXZE?=
 =?utf-8?B?RmNOZkZPUmZEeUppYUhLNnppdGFra1BrdERTZS9UV1l2MkMxcHB0QWluMllE?=
 =?utf-8?B?UlNnNGs1V0RZenZ1Vy9uNjJLN3pZNFB5bWMzcXRzQ0ovR0x5NTBmUVNUbTRp?=
 =?utf-8?B?V1hzbkZUeTlRaFRlYkk0N3FpeFphQ2ZNdkpTRmRMVnk1dXRTb25vd0RUUVQ3?=
 =?utf-8?B?THFhWG1HZWpEd0E1cS9mazZtR0ZsT3gwQUorRTlBOEp4dFNwQXZIbFgwUXhH?=
 =?utf-8?B?akNuV29qcjdZUWxjcnVTMWl1M0VZNndrNEZrTkZnSTA4NzRXdllIbVhralll?=
 =?utf-8?B?Qm56VktFWlFsYVpuVVVIUHAwRE9SK3VNUVF2U0VyVjBDVlFBUmVEaHdUa0Js?=
 =?utf-8?B?R0Q3QTJwdmFpd2xTSm9QMU1OTDFxZ2JITHorMEVOOVdZeHplQmgrTWtBdFJW?=
 =?utf-8?B?L2VtZkdsRnhhcCtUZ3BBdzgxYkRPT0VrZ3cxbjMwQ0JIZUVEWlhObFREUUlY?=
 =?utf-8?B?MHZOSVFIU0VLTW9rWEdJRmwzQUJGM0pFUXVCRHprbHBPMFVFNEY4YncyTGxY?=
 =?utf-8?B?QXJBWE9JczdHSGg1NFdHMzFveXdHNzBmRE9wajBRczlmU0NoWFVtV0JHdXpE?=
 =?utf-8?B?M2JNSVdoVmp3UzRLVG9keHRFNUh1ZHY4WGpVbjN5Z1lpQXpUTGNSK3MrRXJm?=
 =?utf-8?B?aXBvZkduR2MzUlRHZXFEdjZLc2ZVOEFRTDhESkRMbXQvNC85dnI1ZVlFL1Jr?=
 =?utf-8?B?YWtlc1h4NVBxSmRleGNpTmErbUl0eGxkWGNwYW9kK2ZQWUlxN25DSnI0ODVF?=
 =?utf-8?B?NmVDRFl6dVVIaHVnRVV3b2VUVkVnNUw1YVFiWCtBQXBqRzNramRkQmpENkd3?=
 =?utf-8?B?THBSSUxmcGU3NFBtRjNhcTJmdktSWUNSTHMvTUtzYVZzbDhDR3F5U0ltMDJa?=
 =?utf-8?B?NHFiM1VnZlh2TU00bXYyYWxGUHFhRTBsSUQ4R0Zqd0ZEbUN1WTU3WnRVOXR0?=
 =?utf-8?B?Mk1kYlUwZTQ2dFFyZjJyQUJhYmlESHlWek84YmdmN2xwVVVlck9Yc3dSV3dm?=
 =?utf-8?B?RVpqS0pPMk1SenVyVlhXeUlkWi92Q0drd3VYNlN0Y3FsRXBiQWliVStEUXBS?=
 =?utf-8?B?djlJVjBrY2NyL1NMS3hSYWE5Y0dYWTBraDdFVGF3cUZ5aDdjK3phd2VXVHBK?=
 =?utf-8?B?d3pYSU1YS0xJOU9rVko5NnpuVVhGbjNQQnRiZG9UQ00wdDE5MHZFUXBaTHMx?=
 =?utf-8?B?ZTBweUNHYXZBRDZVMTlUajQwdjkrWFBBYzN4ME4xNGtmVHRqZzQ4WS9CRUtW?=
 =?utf-8?B?K1MxVCt0WlY2S2N6a1RMbGxYMjNCU2czU25lMnVPZWxjLzhpcmd3a3BTMlpQ?=
 =?utf-8?B?OEtkVGRRZDVKcHlNREluTWNNTEo4YVFsSWJjcEFST2dPUm5WUEsxc1ZLNVlx?=
 =?utf-8?B?VUwrcVpRaEVVTmE2NXZxa3BlbENxc3dDWjdoNFhXTi8rOXVxZVRkZmJFV25D?=
 =?utf-8?Q?ahghL18qcV88R2XzekcfL4c=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb37dde3-e6ce-484b-3346-08da962e7a32
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 08:52:39.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zK0V3zOff2xQgPrOrj9gZnIHAATMVP3VVbumVLj2nOGWsBjNB4u1oQhYrQp7LMGIUzm+inCe++h3wjBZGy0oOymQ98fZ46GpfZBTLoxW2o7NBLdO2wBfNw6D2xCrpfLa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:52:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170647

Hi Etienne,

On 9/13/22 17:25, Etienne Cordonnier via lists.openembedded.org wrote:
> editline is a BSD alternative for readline which is GPLv3.
> 
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   meta/recipes-devtools/python/python3_3.10.6.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
> index 1b28728732..1f8b60a7a5 100644
> --- a/meta/recipes-devtools/python/python3_3.10.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.6.bb
> @@ -105,6 +105,7 @@ PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURE
>   PACKAGECONFIG:class-native ??= "readline gdbm"
>   PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
>   PACKAGECONFIG[readline] = ",,readline"
> +PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"

I'm wondering if something else isn't missing just below:
https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/python/python3_3.10.6.bb?h=master#n119

Considering the introducing commit: 
https://cgit.openembedded.org/openembedded-core/commit/?id=79ebbca6943bc66b619671f93ac283ed2cfc8e5c

I'm wondering if there isn't something we can do better here.

I see that the configure.ac script allows to disable readline entirely, 
c.f. https://github.com/python/cpython/blob/v3.10.6/configure.ac#L4945-L5062

--without-readline should work. I hope this can fix the issue the 
aforementioned commit works around by avoiding to always try to build 
the readline module.

Now we'll have another issue is that this without-readline should be 
passed only when both readline and editline PACKAGECONFIG are not used.

I guess we usually do it by having EXTRA_OECONF with the 
--without-readline always set (you'll need --with-readline in the 
readline PACKAGECONFIG though). Then if readline or editline is set, 
--without-readline will be overridden by either --with-readline or 
--with-readline=editline?

Cc'ing Alex as author of the aforementioned commit, hope you don't mind :)

Cheers,
Quentin

>   # Use profile guided optimisation by running PyBench inside qemu-user
>   PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
>   PACKAGECONFIG[tk] = ",,tk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170597): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_170597&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=XNvdvtLikCKaFjNcAWNt5mIde00pSKx-u0DJa3IygGZ8HV_LB2KCmWfxVykHwOx9&s=SKoNv6E4PhcWNWbzSaKgReME4onz_12fEFLgVq9UTbI&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_93657764_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=XNvdvtLikCKaFjNcAWNt5mIde00pSKx-u0DJa3IygGZ8HV_LB2KCmWfxVykHwOx9&s=oTjBsA6DrUJHv0YGJ-JKxn9gexa5br-EM3G0Yo6jRUM&e=
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=XNvdvtLikCKaFjNcAWNt5mIde00pSKx-u0DJa3IygGZ8HV_LB2KCmWfxVykHwOx9&s=4Q3jRB_dGGJ86BqqJLUoXjixcpsEqtwuhC9ImPl0kng&e=   [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

