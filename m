Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DAFD73EAA
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 00:15:33 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30376.1769732128129927204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 16:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=BDMpe9su;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.15, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fl9d2V1Xlbn2UJvINQRCSFpNrTWmkef2+lr04qNh7YQ+4j41vNHGwoxBocjbLcHsWMcqKX91mIse2FXQ5gefznyEC1Br89DJ5LM93ybj6AApaccKqum4mUSqBCgGMcC/f3CRhL8UwpAdfzS/wOsBcmvEFbyZ87gOOY0/34OwzfNoXqIcMdJqSwoiEA2f34C8+dd8VXLfUc3BRWsZHeA7qt3U2CG1RBAL4DmGkBJcdOdgWRQKz8WH7B7FiEFIwQQwt3DfaC+uym81P3teANwlZ4zMwmzG69+c1C+r8pi/9BRn5ASNJcUniAm4l8BvaQ2xupElulgEloRaM/YHnfqnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN32E0IA+AADtwCZTv5nyiKxC9Mbk88ajHotoivAWB4=;
 b=nJVQciv8Q1BE4yHMLBUMdCk9cQcLbhcC2PGFK03o+20GwE9X4IgvM2PtKhf427yjPHonEhM62cPA3/vI0znSSL1RQgFFUp2XT08pNDKxXWm83KWVAB9nBmLJsQAz+a80Qlak3VVjnKbuZIV3DKR3XvyY101RnXqydvOKGtAIRxMzMHPXDaCOcWQe0/fb5xB9qefPGaojcNe+sCmKkarMEX6d1EwKIr+0TU7UQU++ESdSvktaevRuoaelkR7/J4BTbUg9fNra6Q4Gq6lIxrmBPfVFHZUacs6KhFaouj2w9Nzdvkr+CV5zz3Huf0IzUi8BU/x/Z+rDYxfO7OueZiBNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN32E0IA+AADtwCZTv5nyiKxC9Mbk88ajHotoivAWB4=;
 b=BDMpe9suT8jUjfnMCWi9grBkmS2CsoEZ5o40Sgi3uyTzLtx6gR+VXb1N649BLOAn8N6gWEqLyaqvkygSF0QGWQ2SERIISyVm0AaL8zFlgEWX52GM78Bfwzb6hgVfKyYiUvxqzBov/HFPaz2m3ULVK8MRejYUutN3TuPqi1FPtTc=
Received: from DS7PR03CA0271.namprd03.prod.outlook.com (2603:10b6:5:3ad::6) by
 PH8PR10MB6410.namprd10.prod.outlook.com (2603:10b6:510:1c5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Fri, 30 Jan 2026 00:15:21 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::5) by DS7PR03CA0271.outlook.office365.com
 (2603:10b6:5:3ad::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Fri,
 30 Jan 2026 00:15:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 00:15:20 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 18:15:20 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 18:15:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 18:15:19 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U0FKhX391989;
	Thu, 29 Jan 2026 18:15:20 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Jan 2026 18:15:20 -0600
Message-ID: <DG1HOGASBF39.XTOA1VCZCPSR@ti.com>
CC: Randolph Sapp <rs@ti.com>, <changqing.li@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
From: Randolph Sapp <rs@ti.com>
To: <ricardo.salveti@oss.qualcomm.com>, <raj.khem@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260122194959.13457-2-rs@ti.com>
 <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com>
 <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com>
 <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
 <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com>
 <CAMKF1spQbv-WCy9XEBxiK-Hzn1v=XZnGW8jWdOkk2axsx7r13A@mail.gmail.com>
 <CAA_5you6j=mVutd7JkF7Pxpsn+rhmg+NazFc0=pFXz8=LFW3Ww@mail.gmail.com>
In-Reply-To: <CAA_5you6j=mVutd7JkF7Pxpsn+rhmg+NazFc0=pFXz8=LFW3Ww@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|PH8PR10MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e5f93d-9bdc-4666-4d75-08de5f94a7c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d2o3d2twUlVHaXVCcUpQZklEUGtMK3ArS25qZU1NK1cvOU1uZStzaVA3MXBq?=
 =?utf-8?B?blRjd00xR28wOXJBZktydTJXZmNrQU16bzBMM0RicStHR1ZSV3VTRE8wemRk?=
 =?utf-8?B?Q0pQWitrbWFiZzQxTWN3cUszUHBHQzZNa0xGY1p5akNETG05cnFISjNxNmoz?=
 =?utf-8?B?V01oRzY3T2RrZ3pWWVFEa1hmSDYxcEpBSzZYYWhRSFh1cVpKWFZTSDdxZzRl?=
 =?utf-8?B?Qk9sK1YxRnZFM2RhVG9LclMvVjl4bVp5bHhWOS9zR0gxc0hsRlAzZWxwS1Yz?=
 =?utf-8?B?dkZwRlNJQVlnN3BWV0NSSW0zOFA3ZW5lYi84WWpSeWNhUUxPdXc0c0dScUlv?=
 =?utf-8?B?bjgxb2RlMHVnbjlCd0libS96YUY1SEJ6MHlDbWk4aUU0OE5PRDhQSktRUDI5?=
 =?utf-8?B?aDFOS1MvU3Q0NHNPdmVGTHdNVzRpQXFOaXdZQ3N4OStHcGw2WW41cnl4bXV3?=
 =?utf-8?B?UG9UVlFFMGsrcHN5Z2MrK2ZJaUozdG1ZSkhYOGdWWHBkMkZnU2ZEMDJNclpO?=
 =?utf-8?B?YkNOb3dHRDUzbUVHMTFWS21hM1hLby9mTU8wWXdyK1diS3d1bVBuWjNUbkoz?=
 =?utf-8?B?TW40QnU5YUt3d0dFYkJSdW95bFJ2U2ozajgzbHNQMzdPc3QyZDg4bDFzenpk?=
 =?utf-8?B?M0g3WlZWVy9sbERBY3hEUWpHcmRwaHpYTHpJNWo5SGU0NEtVVUxTMmRXR3ph?=
 =?utf-8?B?MGQ2cG1PY2tRclc0MjFxTkFVNHd4NHZLOTYxR0NBOTVGZVk5c2lBVlNjRWox?=
 =?utf-8?B?YjVYY2FvbVNuQ0FITDRVaHVmY0FmeHZSTVk2MDl3dzJjRFJMZjkzbHFYNXBm?=
 =?utf-8?B?SzdZSzJxYlU1SjB5NUFINVJLa0UzWS9YUEpUMWFSVFNab2xWdnBKUmlNSGF3?=
 =?utf-8?B?MlErSkdnTHZyYThpSHFObzYyeWhFcTVrTk13MzBtN0p5SENzQlJtbmhDQ0tC?=
 =?utf-8?B?RU1VNTZIc0QzYW1qUHBpSy92OEFIMFRtZVE0S3VqaWJRcEcvK0NOY3luVVFq?=
 =?utf-8?B?K1BJam9MZndCWnYvc25seUFkdlZycEZ4NjhpYTY0M3ByR1hzWDV6OXNsWFhs?=
 =?utf-8?B?VEdIcDBieGZTcHcrbCtLTElIRm5wbzJ3ekkvNDQ5Q0VMOXFrNlh6Yy9OYzEr?=
 =?utf-8?B?SkNOTVpDYjBEb0dLQk94Z3poS0l5d0NobnFDQmpFVXU4SHFTZHhHV3dQNjRz?=
 =?utf-8?B?TXRBeERGaXBMandWSEo1alFQTlcycWlFOVNrRVN3Yjg4MmdnNWt6WFd1Vm5n?=
 =?utf-8?B?TklDZE5hZlBqeC92SDIxWWxrOU96TkNjNDJCN21ZclRhcWpNMG0xYTdUUmQ2?=
 =?utf-8?B?V3hldGlldnNxZXNSdW56VTFRQVV5b1hmN3VTRmtOaTBzSkFBM2Z0alFuT2ZT?=
 =?utf-8?B?OG4rVC92ZDEwRUtzRVAwazN0VVdrVHVhWng3V3JJbnpBbG12RXFBN1haa1JO?=
 =?utf-8?B?OXJsZDFWd00vb0M2YlJnUDg0QmpxZDhnY0JPaGhJV2JmZVBqRVFFK2k5cm1M?=
 =?utf-8?B?Qi9NcDNuUERCQ1c5dzRtYlprMjVVNkJHOHJXa2lKUGVCNytNLys4c2t1cFRF?=
 =?utf-8?B?RmNBTTlRbjhxSXA1TGpwUm1jWDFaNWE2WVVsekFRRko3SUNSaDMzc08vaDBm?=
 =?utf-8?B?Y1oybHNPczJzL1hQT3JyTm9YTVBibGg4WC9DaWFOblZYYzR6QXNHbWF6Tmw5?=
 =?utf-8?B?a0VBTGkyNnh3WjM5ejJrYVh6UWtGUGlNZ0FjaHNaSjBoeTlQZUVWcUtzdnRP?=
 =?utf-8?B?MzM0cGJIVDdlZlVwVmdxcXJrVlc1ZXY1alA4bUdQZThjL2xBSWkvdU92eDF5?=
 =?utf-8?B?TVFORXV2cDlibWFMZnE1bVFuWW13NCs0Uk9wSlhYRlFMR3V1NlN3UGhHSWpm?=
 =?utf-8?B?YjIvbjQ2MExWMit2SjNDeGVmalBseVdXem9UeEtOWEphY3dSRDJzWmNxWUdq?=
 =?utf-8?B?K2lrRFBhUWZ0a1R1ajNjc1dlK0JIcXl4NjBRSzZ1b1ovSW16ZVJKSklnUGtP?=
 =?utf-8?B?U2NzeEJiZW5BRTc4dVZ0d2UrbVVwa3BMQTNSbEp3QnZsMlo0QnIvSm1tcDhB?=
 =?utf-8?B?TWVnc21GWmZGOWtveFRzTlovaFM2SEZ6eE5PU09FTWc4Tm1LSUIyM3ZRZC9k?=
 =?utf-8?B?azBmSjdDb2FOeVE4UGlHR1BtT1M5enNjazIrOHF3clR1MExGNHF6ZVRIaEpw?=
 =?utf-8?B?VGZkbWZEM2NSdkI1SmNoZllJZlBFcDc5MHRWTGxHZGpXWUMyUDY3dUw4Q2w2?=
 =?utf-8?B?MXFRVEJ4RWtubTkwSkhQVjY2YVh3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	whfo6Zkl6qPpOB1NwnzwXYc3ze6xV5+wkVKBCGx+c+/sAmmkXlbPHPHo3BbZyHtFisWIAV+Owc5tlRalvzleBk5Cq+1E3wAcZv0rPtVpoiMgAGOXlh8dsTWJMI1tlT4loeaJkcxcDwK2J1VofpGel4RAiFej5oP86ktb21MeT57pzeMuJaQn7cOTRvFEmQpJaUKsVnt/wHuyVb0rG66VYzKbRhmzpvj8LUVVomunMQBKByyjhMdWOrldpJbq1wPUQUzQmR+7ZBSYhtqjmKRS/Ks4hvQUUqKkONt+2Jwl22tpZXrdmdRIHeT9mPmOQQ7V3ld6pt03YtOq5Bp54x0OyLOJvR3th38wEv9Fvkr6RDuGRZ7y4xQybp7T734h8HxZB53Skp8uZbRqsHPxbrrPU7huoI/MRHBBJOacBHhE8gCq3RKk5rJr5r3/URpTF5EP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:15:20.7063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e5f93d-9bdc-4666-4d75-08de5f94a7c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6410
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 00:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230172

On Thu Jan 29, 2026 at 5:45 PM CST, Ricardo Salveti via lists.openembedded.=
org wrote:
> On Tue, Jan 27, 2026 at 1:50=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>> On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
>>>
>>> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedded.or=
g wrote:
>>> > I am seeing some additional diagnostics see
>>> >
>>> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153/raw=
_inline
>>> >
>>> > I wonder if this is related.
>>>
>>> Man, the mail clients are having fun with this thread.
>>>
>>> Yeah, I'm able to reproduce that issue locally now. Not sure why it's t=
his
>>> package subset that's acting up, but it is directly related to the LDFL=
AGS
>>> change unfortunately.
>>
>> I think this is exposing the underlying issue in packages perhaps becaus=
e they are
>> not respecting CFLAGS and when it's gone from LDFLAGS the mapping relate=
d
>> flags go missing. I have a local patch to fix memstat e.g in master-next=
, all failures
>> perhaps need to be looked into one by one and passed cflags from OE env =
which
>> might have been missed thus far.
>
> Just noticed a similar failure with lxc (meta-virtualization), but
> while the prefix-map options are provided via CFLAGS, it only works
> when provided via LDFLAGS, probably due LTO (enabled by default by
> lxc).
>
> Patch available at
> https://lists.yoctoproject.org/g/meta-virtualization/message/9553
>
> I guess recipes forcing LTO will probably have similar issues.
>
> Thanks,
>
> Ricardo

Ran a test locally. Looking at the do_compile log there are actually severa=
l
compilation steps that do not have the macro prefixes passed as cc argument=
s.

That LTO bug has actually been addressed, it's just as Khem Raj pointed out=
,
sometimes CFLAGS is ignored and passing the prefixes with LDFLAGS was maski=
ng
that problem.

- Randolph

