Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F920E83060
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 20:06:01 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2873.1770149160028571725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 12:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lY1tXD7v;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.61, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxHh4ZaxJHzbvNEDsOMptHH5t9lkuaeyOqYdrkPhHdNV9DdlCUYh/5FWzQGuWb7Jf4j5p8gjyzKCof6l0970YZgsKbkENXGmONr6g5wGKB/H5Yc4A3u7gLn5eKzAoZ2AWvZS0xSNIdeHCKK6ODcmkevnCaWN3JkvuuFl766vAGocQESOSD5yCA2Xr/gOZIc3JFnYxnmac00FumptBWXf2dmKYX1EndcWfQyiVGm2FbEH3SZzgH+63XansH19PhOCEU/PjH0ly74FFfC5q4Ekh5O2bDDicGbxKqe9YNhi5vCdz67a9jWN3163ugbIkZDP16ah+HcsMuBMsP6HMo6mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnASndguBAl0yd8yrdNzxXlhtIpVMUCBET+mT1rLzL4=;
 b=GT/8JrTN/VPiNyQilSEbLqAoNiFik+QG5gRbm2MyGmJdPRzZvDIz+/RQFv7tJfZG0KfBREMh/JCKXqr323PyEuRTk/VpboA8rZXNsm1oT+lUVrsVKL0WBmlNZsAZFFd7k91qQ2l8P7x8VuYMuqS/TUjbkD4fxrHmc2BXTHVT8BuynSUOo2uX1zuB3mY75/RhcC5eJcEr0fp79MmbETyy1SjLfLcPTajtqW7fsSh8CBW7ocjrMDAO2qMW0ZIfSNhWvL8LOdXDko9040cJmt2R0atIVcgrGYjQytyanCKGXKfbxhwC7QWvUNWeIqyGmByhFMe4Z499tsvr0MlZ5W//6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnASndguBAl0yd8yrdNzxXlhtIpVMUCBET+mT1rLzL4=;
 b=lY1tXD7vo/GRFPBal2IszTQ85q5uh3sEGSo5SogzHYJwqFhrkQV34Uj9PCv4NXy277X5HNoG4I1Gb0nek8zHP7vMGXc3mnzR5++3u/x/M8QUXCS9HEbmLsOPXGtRz1XFms9iHGFh2DPsu2/wn7P+mpY+7paLuajhKaxjLg8fl/U=
Received: from CH5PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610:1f0::9)
 by SN7PR10MB6596.namprd10.prod.outlook.com (2603:10b6:806:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 20:05:56 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::b6) by CH5PR05CA0004.outlook.office365.com
 (2603:10b6:610:1f0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 20:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 20:05:55 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:05:55 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:05:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 14:05:55 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613K5tit4075840;
	Tue, 3 Feb 2026 14:05:55 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 3 Feb 2026 14:05:55 -0600
Message-ID: <DG5LI7KVRXQE.2N11NZEFI41AB@ti.com>
To: <changqing.li@windriver.com>, "Ricardo de Araujo (Salveti)"
	<ricardo.salveti@oss.qualcomm.com>, Randolph Sapp <rs@ti.com>
CC: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
From: Randolph Sapp <rs@ti.com>
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
 <DG1HOGASBF39.XTOA1VCZCPSR@ti.com>
 <CAA_5yotjKeeJHf+vio5e=KpojE=yOBAPem71SoZmNUwAUNT8xg@mail.gmail.com>
 <DG2EDPK1VQBE.3XAOY279FSGX@ti.com>
 <CAA_5yoszcBBMpcJ7iYkCOvUqGw21hbED1o5iK+w=EkDDhjYZAA@mail.gmail.com>
 <be095942-3b0f-4d62-97ff-590e7b6fbfbd@windriver.com>
In-Reply-To: <be095942-3b0f-4d62-97ff-590e7b6fbfbd@windriver.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|SN7PR10MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: a18d6f90-3ede-445a-7d3d-08de635fa416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cElOZkgyYUJTOXlMbVdWTlY4SE94M3orb2tyTnA5Mk1IeEZGVmI5TUtZd0Q3?=
 =?utf-8?B?UWNoS0M2bGFvSXl2N2w2TTNUZnkxaFgwdXBqNjBtT2NCQ1hnK1Y1aC81K3Zu?=
 =?utf-8?B?Y0RPb3BtNWdkWmRqOC9vYjFmQytRWjR2WkFTeFlNUVQ1RW1PRUoyVHlSRExH?=
 =?utf-8?B?UW9tNHpOWEtyMnpaMVkyOWdYZ01SU0k5UG43QUtHWGlISEY2UUhrK0lYd3Vq?=
 =?utf-8?B?V0ZiZy9IS1pDbEE4Sk5ibGxnYmFEU0R6c2RuaXE3VDRjU2lJTjQrNEx3M1JG?=
 =?utf-8?B?RmhmcXRYa0pTNGMxd2lkSTZpR2VkYW9WZStPK2djRzlhMTA0eW5XWjRDWCtK?=
 =?utf-8?B?RXZGZmt4ZmhUemlkVGc0aHFiem1PNC9ZWi9leVlxaEZyMXArc3AvUWpKYkpt?=
 =?utf-8?B?S2cwOEhCVW0ya3h1TmFTWlVQQzllK1V5b2JCbFlZQUZyRTR1b2phSWdMTzF1?=
 =?utf-8?B?K3Z3UnR6S3RnYW1FYkhvbWFQNlRaZzM0OWRuOVRiYzFpMWQ2UTV0ZVNkM0VY?=
 =?utf-8?B?WGx1aHVNQm9zUzMrMjN2RXlrMXBZcHYzMElqWFBVRFk0Z2xzSEUyTGV6eHBl?=
 =?utf-8?B?RUhsUFMvZ3lTYW5uQWliTlQ1MFQ5TDQvdmVXdjFldWVTeHBONVNETWdVM0s3?=
 =?utf-8?B?NVpUUXpXUWozL1E5OVJCUjgzMEFMdGhyTlcrVWVENklaU0xCb25NeGFxM05m?=
 =?utf-8?B?Ry94UXJFbWVScHZTNlJ2UGZMQ2w4OWFva1VzU2EzUkdUNVV3UERXWGNnSU9E?=
 =?utf-8?B?Zi9wTVdrQi9MM0hzZnJnYjNSdnQ3Q2pWU2VJdHRSZnRzb1RjRjhwYmNZdlZp?=
 =?utf-8?B?N2tjajNjQXdoSFQ4T05yYnRKUHVXOXpTY25xblFjNm5zLysxRzJYZmk0eWFy?=
 =?utf-8?B?b0tpSFlHVFQ0MWcyOWcyR2ZwaWJEVmk0Uk1QQXR3aTFxQmhiNnR5RnJyOHFt?=
 =?utf-8?B?NnRLb3dHVlV0MFJjQXZkSk5ZVTBNNUhrRG03bDFpL1o2ekRyeGF2TWpldTFx?=
 =?utf-8?B?ZVJUV2g3SGpiSlZpYVFrRERyakFVZjIrcDZzU2V1Zko2d3l3ZmtFeXlPVC9H?=
 =?utf-8?B?Tm50ZzFxaVdOc2kyQTUwMnlmUktGSDM0NlQ0WDJPcERuZ2tmR0NGQkgrWUQr?=
 =?utf-8?B?YVVpLzhVM3FzU3lRODJvczhUZlp4MCtuZFdaNnJiaHV2ajhvVEVJdUMvSFkz?=
 =?utf-8?B?ZXRmL2luWFgvV21STzhnMjdvME9aMzBCeUNrOWQ4SEJxaTB0TGpueEpuanZy?=
 =?utf-8?B?ZE5LMEx5aDZXNXNka2ZYSGVyRi9STUYzb3pYNEVmTU5adXFjY1o1MHM5eW5I?=
 =?utf-8?B?ZFdKb3J1VW1uNnJweE1RRWxnZEtpMk1iK0VHcWF3RFVyaTlmQzdkeVoxM213?=
 =?utf-8?B?MnFkSGhqS1o2QkFaQW9WRGtseXNCbVVnM3Bac2hDeC8zT003VFAybkxianBL?=
 =?utf-8?B?L0EzWE44dVNhUmpPQkJiRnVCK0hGWkhHOW04dUxCbjY5TTVyV2NsRENuckJj?=
 =?utf-8?B?SlBvV0FkODlzYlBFbVdTQnhMSENDbURaNjFSQ3FRMyt5N0dpemt2cFpzVCtP?=
 =?utf-8?B?VnQxUDdlV2ExMFRiSFdTNGJtbndZbnB6L2lPQnk3eXd4VTV1UE5hYk9hSG15?=
 =?utf-8?B?cnZYb1ErSm0zNmpmdExVcUU4SG1jSXJTRkp0cktGTlJzVlRWTmxvSzlNaHdX?=
 =?utf-8?B?NE9veUZkSHhYdGNuOVhSVHlFN3Q4U0pUT3h6dzRaT2dweUZwbkpnMm9ZODU4?=
 =?utf-8?B?d2RxdEw5YjVPc1JjbWxsLzE3Y1lFQW00K0JEZ0FCR1k2MnUyWUVjSWRlUkNU?=
 =?utf-8?B?M0JHL0ZhNVZURmVLcG1WWmF2QStaTlZwMU1HK1JxM21NNmxPMjJ3Y2tQV3Y3?=
 =?utf-8?B?a3JxS09sMHdlRjdGakNNT1JtZktuTkpZdDFqT1NYTTB1WHFrTzJNOElMbkZV?=
 =?utf-8?B?UWZMeThsMk9qWGVYVDlYQzNMRjN4U25iREtjRTEyTHVaQnEwTkwxQjRiTGNF?=
 =?utf-8?B?WHhxVlZXQkFiQzdqMzhRM2hNNzJlYUxUc3lMeHBNME9JS2ZONm9obEdrOE9Q?=
 =?utf-8?B?UTlEUWJYWmFFZTVsN2lVNGp3T0hnWnNua3N2aXY3cWJlUHV3QkJvU0UwLy9U?=
 =?utf-8?B?UEIxeUJCNFcxTGk2TmN3eExhM0xGaVZFUFRIRllrZ3FtWTk3WjBlcDFVTlNq?=
 =?utf-8?B?aHNyOGVGSnFEdUxhVWRZcjlka2VNS3VqRlpmbVY2b0Joa2xqVzg3Rm0wbVEw?=
 =?utf-8?B?cUhQbkJ0RUZYanp0eXgvWmc5MHJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GwFenSU81CDX1ZFVnxJwa52vwvMFWBuuul8M6pH9UTWaiHmA6O8gGotFmTgYn/VkgOjSa5zOFaG/mEptzpDwu2wyeno0QHb9CMFz0tTYikuOFFhmNbIYx3OxF5VpWV16J0iEhxx2BXufR6hUd1HFzRhth/rvFKxQaoPSfAyq1bDXvppth+1+tkO0OE3qeeijSxp/Ep8CH8q51sN/roGZvo417wP2xXQeb7gUf9fTS9tinsqoihMRgzIio0UZqfFrXSczN3sC0xKLtL5iNe1dwti9ja3WIUW00eVxh0lnMAMh/C8uvRtoqZliVg+IrE/Todz0pjlchcbh1Y6yzW2oxtrAeKt7qKIClQXhsEz32r+iaJA+4hgvl3kxVLpa1jHvIWyDHsQIpwI0c0NxU67CSmH+y11qokvIiq7fvT14NyWA3DCz+QKMOazfj9w+DkeH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:05:55.8289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a18d6f90-3ede-445a-7d3d-08de635fa416
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6596
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 20:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230469

On Mon Feb 2, 2026 at 10:46 PM CST, Changqing Li via lists.openembedded.org=
 wrote:
>
> On 2/3/26 04:10, Ricardo de Araujo (Salveti) wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Fri, Jan 30, 2026 at 10:52=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote=
:
>>> On Fri Jan 30, 2026 at 9:22 AM CST, Ricardo de Araujo (Salveti) wrote:
>>>> On Thu, Jan 29, 2026 at 9:15=E2=80=AFPM Randolph Sapp <rs@ti.com> wrot=
e:
>>>>> On Thu Jan 29, 2026 at 5:45 PM CST, Ricardo Salveti via lists.openemb=
edded.org wrote:
>>>>>> On Tue, Jan 27, 2026 at 1:50=E2=80=AFPM Khem Raj via lists.openembed=
ded.org
>>>>>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>>>>>> On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> w=
rote:
>>>>>>>> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedd=
ed.org wrote:
>>>>>>>>> I am seeing some additional diagnostics see
>>>>>>>>>
>>>>>>>>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153=
/raw_inline
>>>>>>>>>
>>>>>>>>> I wonder if this is related.
>>>>>>>> Man, the mail clients are having fun with this thread.
>>>>>>>>
>>>>>>>> Yeah, I'm able to reproduce that issue locally now. Not sure why i=
t's this
>>>>>>>> package subset that's acting up, but it is directly related to the=
 LDFLAGS
>>>>>>>> change unfortunately.
>>>>>>> I think this is exposing the underlying issue in packages perhaps b=
ecause they are
>>>>>>> not respecting CFLAGS and when it's gone from LDFLAGS the mapping r=
elated
>>>>>>> flags go missing. I have a local patch to fix memstat e.g in master=
-next, all failures
>>>>>>> perhaps need to be looked into one by one and passed cflags from OE=
 env which
>>>>>>> might have been missed thus far.
>>>>>> Just noticed a similar failure with lxc (meta-virtualization), but
>>>>>> while the prefix-map options are provided via CFLAGS, it only works
>>>>>> when provided via LDFLAGS, probably due LTO (enabled by default by
>>>>>> lxc).
>>>>>>
>>>>>> Patch available at
>>>>>> https://lists.yoctoproject.org/g/meta-virtualization/message/9553
>>>>>>
>>>>>> I guess recipes forcing LTO will probably have similar issues.
>>>>> Ran a test locally. Looking at the do_compile log there are actually =
several
>>>>> compilation steps that do not have the macro prefixes passed as cc ar=
guments.
>>>>>
>>>>> That LTO bug has actually been addressed, it's just as Khem Raj point=
ed out,
>>>>> sometimes CFLAGS is ignored and passing the prefixes with LDFLAGS was=
 masking
>>>>> that problem.
>>>> I did look into one of the binaries and it was built with the right
>>>> cflags options, but didn't investigate too much.
>>>>
>>>> I can also confirm that it works fine after disabling LTO, that is why
>>>> I think it could be related to it.
>>> Oh boy. Looking into this more today, spending plenty of time trying to=
 make
>>> sure it wasn't meson or some other argument combination causing issues,=
 I
>>> stumbled upon this thread [1]. They report the same issue with debug-pr=
efixes,
>>> but they also cite potentially package dependent behavior with LTO. The=
re are
>>> quite a few open threads about LTO behavior in general that are concern=
ing.
>>>
>>> Maybe this should be reverted and the alternative solution for cgo bina=
ry
>>> reproducibility should be taken instead [2]? I don't really have the re=
sources
>>> to start on compiler development at the moment.
>> Right, it might be indeed better to revert for now as we will probably
>> face similar LTO issues with multiple recipes and layers, since the
>> bug is still valid upstream.
>
> I did a world build with this patch + LTO enabled with our distro,=C2=A0=
=20
> there are many failures, and it should be related to
>
> this change.=C2=A0 I did not check them all one by one, just check some o=
f=20
> them.=C2=A0 Eg:=C2=A0 cups(oe-core)
>
>
> Maybe we can only append DEBUG_PREFIX_MAP in TARGET_LDFLAGS when LTO=20
> enabled. I will send a patch for this later.
>
> So we don't need to revert this change,=C2=A0 and but we also need to tak=
e=20
> the following commit:
>
> https://lists.openembedded.org/g/openembedded-core/message/230059
>
>
> Regards
>
> Changqing

Thanks Changqing, the LTO + DEBUG_PREFIX_MAP is fine if we know ahead of ti=
me or
are setting that flag ourselves. Unfortunately some things like lxc force L=
TO
with meson project flags. Tricks like that makes things a little messy.

- Randolph

