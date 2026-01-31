Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637D1D46C1D
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 01:53:04 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1488.1769824379139905796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 17:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JJ4zkcBz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.24, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT+VcP4Op5zgjqChDI2Qtwp5nZ6YRJxfQMS4ATNXuFysC+ocImjCEOlIIZJSQ8EtzngQVfqfxtcyn/ajybbmF4lEikVfqj5bvDGLvP0tOmet7Jg8gXV5i4nWunK1c+R839jJ6h/uk1QfN1yjJehBBC0dLInjvkDl2FW8QyD1zDGZBJDyC7xF1tTQ3NEm8Px7/S3ew5QCwScJcPm7Hh6POuD6QEdCkUnVMlmQaj47406x458Nao66fg9Pn74/Z4UHk79EK3jbgN9xEnq2f2MriFgn32OjRzErBWSqg1azyt6pde6Nmir/wUD8XEnhwMfgOFSnI6fVaEBtrv29g6vGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4ZrXjukikTLmvQKdFqa5Gw32igv2n5Niby5oZWty3M=;
 b=yGG8UxfWeSbxTPOKbgc53JHxhKJPZA2bUCWTH4N2zGuEQDWefmYdNu5zEIWILpwq6u88wmdNgFum+2HMDPKxjjojB6KaQSfZUzlVL6V2m4+e61l5+74/sgVBXtLFaUcZ84qZlC891QT/0DJC28YENS6wLWY3aPW6kZlPtRegHvzrTehdD90iyDdmY8MzrIsrske9zGzeV9x+IQHV0PSZLDX/D9SKcSjdEF5ZR40PEDsP7dCaYRzfOYucpF1JcBrZ6YOmGGpBtWOmyWaakesXeAjTNIvgV/MsW3TKSsVWuhGgvgC7S/mV9ajTOKzllZ+7nSAgTIThk38vj8SX0GrfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4ZrXjukikTLmvQKdFqa5Gw32igv2n5Niby5oZWty3M=;
 b=JJ4zkcBzUzvr6DcBrWaJx9YhkVrE7X19vt583CCBFTQ0dHkLfSoY18lfhMjo/I61GL93DyGGQQicNAoM24nu4UfowVRG3JyM9F7VXCYrOcNxmN6UZLhlfjI0ao0VBMkfxlg2sZHlU5+78BvdXDwz5WIRikm633FcCP+DtaaTaYI=
Received: from DM6PR17CA0036.namprd17.prod.outlook.com (2603:10b6:5:1b3::49)
 by DS7PR10MB4991.namprd10.prod.outlook.com (2603:10b6:5:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Sat, 31 Jan
 2026 01:52:55 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:1b3:cafe::21) by DM6PR17CA0036.outlook.office365.com
 (2603:10b6:5:1b3::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Sat,
 31 Jan 2026 01:52:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Sat, 31 Jan 2026 01:52:55 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 19:52:55 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 19:52:54 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 19:52:54 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60V1qsWq2226404;
	Fri, 30 Jan 2026 19:52:54 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jan 2026 19:52:54 -0600
Message-ID: <DG2EDPK1VQBE.3XAOY279FSGX@ti.com>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
From: Randolph Sapp <rs@ti.com>
To: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>,
	"Randolph Sapp" <rs@ti.com>
CC: <raj.khem@gmail.com>, <changqing.li@windriver.com>,
	<openembedded-core@lists.openembedded.org>
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
In-Reply-To: <CAA_5yotjKeeJHf+vio5e=KpojE=yOBAPem71SoZmNUwAUNT8xg@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DS7PR10MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 35704142-492b-4aec-bbb5-08de606b73e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c3orbzZLRFV5Q3BIVnQ3V2p3L3A0bVlONXdCUThXdEo1N0hJZFd4ZlF2ZDc5?=
 =?utf-8?B?dVRKY3IzVGNJVHAxTE9UU2RZUnNkeTVnYko2VCtDMmMvZEw5V0R1dk1HVzdC?=
 =?utf-8?B?dThUR1ZCM2dhb0tRcGxQQmQ1bFZzYTlPSE5XaHJUejZGMExyc0FUWlo0dmNL?=
 =?utf-8?B?TVE3MmRDZ0UxdEFIRDVqYk1ERENheGI0ZWNHeHdxQncvVUhRNHNDMGZOZDZq?=
 =?utf-8?B?SXU2M3FSQnlJL3dKYU5ZUGtkcHhSeWRVdmVoZ2pEVkJvSjNOOGg2ZWlkeld6?=
 =?utf-8?B?SlY2NzJzZkJwNVA5V2RTekpDTTBhelQ2MXZjcU5DK1lMcWd5Y2JTQTlMaita?=
 =?utf-8?B?U2ExRFZ0bWN1RDJNZmNtbHB0ckpYM0xmTTBnR0gwWmRGQ25vMWJVWmJnc0J5?=
 =?utf-8?B?ell1MmdMVStESENHTWZveGtsY0dmb3RPbC9ockV4Z2RoVUFkczltd0p2bVAw?=
 =?utf-8?B?RWE1L0pkSHFFb2JpSW5SZHQyWHpKQU9zRWtEc2xDQWduOHhmcXYrWHNyeXdK?=
 =?utf-8?B?QjBNOXZxdzczZnd3cE1oVkl6dTlobU1QWGhuc0dWN3FtRjRFUjdkdlVzTzVj?=
 =?utf-8?B?VDlKQkpyTGVheEhkU1ZMUFNJd3BQTHJXSVMxcWtJUGRvZElBaWY0NmhxTXRy?=
 =?utf-8?B?MkxsWE05cVprV0lCc0Rkc3lTbnNFNWJnMTllZ3RFeHdVa3VVNSt4cmtPcmh2?=
 =?utf-8?B?OEhuWUdDUEFOQUNxOTJGR1I3bENMc1ZKcFlVS1BOS2tGdkNlNjRxdFExSHRZ?=
 =?utf-8?B?b1kvMXlmM2VBMm5NaERXMjVxd0tZZE9UUFVxeDFOSFgwanpTVkM1RVRBM3Mw?=
 =?utf-8?B?ak9BbjZxa0U3L242TmVpMnZiL2FhWVhBMjlYMWZRZ3IwUXpDSDRHTEFPNklF?=
 =?utf-8?B?T2pRd1BPUTdjV2F2WGJtQ0d6RVV5ZncvRWhHKzFISHlPMTVsVkQ4VVFTQmZC?=
 =?utf-8?B?OS9KWVdRMUJrUlBua2hDdUppNy9UZ3lBUGxyUVhialF4WGZ6RGNZdEJTbHBn?=
 =?utf-8?B?S1lHVDl3YTZPaUJWNVdsS2RPb0tIVmxXSURTb0NPUzl2VDZWdlJIWEhmVVpP?=
 =?utf-8?B?dEF0bUhvS3dQLzhLTU9ldmE2WmxOUGxIMU83a1cwZUJJb05SenV2MUtaQks5?=
 =?utf-8?B?UlBUVWRyKzVTWUcrQmg2eGlGY3JlRmJpTncwOUc3c3BYa2lMZkYrb3BXZ2dV?=
 =?utf-8?B?ZkQyVnRjUUUrcFFYL3Z0dktJTXR5R0dEcU1jOVE0VUJ4dndVN3dKdURSYnRK?=
 =?utf-8?B?RENISkxyVFgrRVg0Y3FVOWlEeE45YisvL2lkQkJZWE5IdlN0UHN5ZkhLQnNP?=
 =?utf-8?B?dlZ6Lzg1QURaLytlMnQvZ2h6R2xRc29BWm0xYlBOOVhpQ2JqRVpGOVJWelRL?=
 =?utf-8?B?TlhxR2RaS0xzSlJMT3RubFFWTVh6ekJPR3RNUXJrdUZGazdpN1NiU1BXV0J2?=
 =?utf-8?B?VlV4SFI2UFhKYWpXU2hUS2FYVXkwTzhkaEFTaVhQWlh0M2htRWk0bnpGZUNG?=
 =?utf-8?B?Wk0xbmNaMmRLS3l4OTF5NVM3dGNETGVqWmFuUDlKdjdCWmxobzRCOTBPS0ky?=
 =?utf-8?B?ZFpPS0trU1Rod1ZCdm5POGlPSzFvMFRiTU1oNDR3S3QyRXVOUjFzaGJIcjli?=
 =?utf-8?B?cEROMmlqTVZRZmtmTFd1cEVDUEZnVHBrQ05wMUdFd1h2dDJNVmxLK1IxN1F4?=
 =?utf-8?B?U2NzTUJtbGpabmI4NytCSjFoekt2Ykl0c0Vzbi9sYzErTUt3VWJIRXdTMkk2?=
 =?utf-8?B?eGVZYTU4aERib0JOZWRqUFo2bUxTU3AzRUFnS20rd0wwVkQ5OU12Z090K1ln?=
 =?utf-8?B?ZitCSTE3Y1dIUU9MZ2N3bVAvcnIvNTZETVlnbTBjNE1pNXhDMHpaSWFRZDN2?=
 =?utf-8?B?dHNWRVN4TWVJZm16VjZjcFdpWk9oR0ZRcmVRL0dRNEkxQ0dJYlZlVU9yclVz?=
 =?utf-8?B?Skw4eElYUVZka0RLWFIwWGtVQURHRXM5UTc1K0cvMWZVT3BmT2FUNjF5bTNM?=
 =?utf-8?B?L0hOcHFNUUx6L3RnNU1hanRIUEtEVGhKem5mSHd4UEVJZkdrRDhlc0EvR21L?=
 =?utf-8?B?YWZOTE5GZGtBV2V5WFFaRldkaGxoSm9oTmdoWHlxampvVHZ1eHlQWXBhd2cv?=
 =?utf-8?B?S1ZSYzZ4aXNPYTFkd3VTZHltTmlUbmVHMEVBaUQ1eitLOXc5L2xDRlJEaVBT?=
 =?utf-8?B?MXR2L1NwTisrR1VRT2JqSUdmT21jT2RSMi93eWlra3I1NHBwbHBCNis5c1BF?=
 =?utf-8?B?MW13bWZkeW5tb3daZnlLOGxkSnB3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZXiPfZzCLakB2RHj1vvB/TVu5rF4l0M39ONQ9uG8t0MmnfEmsm9Z94EbwGh21fRSuHKPuTUxiQGPQKoIxGkVCSRUMIiwQrAZcdBJbccan2+8MOV9PiF5yNhpuZy+l7f/XpE9CdP8svMiprTKhvMH7CHJvi4q6TmquhCSqxrbkyieFZcJ3SKj6B5NVL540V/l2PlmTxhkVtHX562y/kjfuOSPW8iH2bgmgxxFFFYjk7JeDrHh/ES6TdAjnJJ79jCdIrWUzrXpIGj8bG7nyZxlsuZc+awNNghuBxS7RVMZop4+k18SKb/slnvZGBQtbfiR45exombLxrEz9IutZw/qVxYxYkwGdDehejkO0z7/AbTGn+DUqZyd3dymCJ7k1go9RMT9oC1eqpvJzZtcMzA5CZFRwY6mOMFC1Au2eAdWo1lvvYII6rYpTgw9Py7dXLuG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 01:52:55.4468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35704142-492b-4aec-bbb5-08de606b73e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4991
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 01:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230204

On Fri Jan 30, 2026 at 9:22 AM CST, Ricardo de Araujo (Salveti) wrote:
> On Thu, Jan 29, 2026 at 9:15=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>>
>> On Thu Jan 29, 2026 at 5:45 PM CST, Ricardo Salveti via lists.openembedd=
ed.org wrote:
>> > On Tue, Jan 27, 2026 at 1:50=E2=80=AFPM Khem Raj via lists.openembedde=
d.org
>> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>> >> On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> wro=
te:
>> >>>
>> >>> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedded=
.org wrote:
>> >>> > I am seeing some additional diagnostics see
>> >>> >
>> >>> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153/=
raw_inline
>> >>> >
>> >>> > I wonder if this is related.
>> >>>
>> >>> Man, the mail clients are having fun with this thread.
>> >>>
>> >>> Yeah, I'm able to reproduce that issue locally now. Not sure why it'=
s this
>> >>> package subset that's acting up, but it is directly related to the L=
DFLAGS
>> >>> change unfortunately.
>> >>
>> >> I think this is exposing the underlying issue in packages perhaps bec=
ause they are
>> >> not respecting CFLAGS and when it's gone from LDFLAGS the mapping rel=
ated
>> >> flags go missing. I have a local patch to fix memstat e.g in master-n=
ext, all failures
>> >> perhaps need to be looked into one by one and passed cflags from OE e=
nv which
>> >> might have been missed thus far.
>> >
>> > Just noticed a similar failure with lxc (meta-virtualization), but
>> > while the prefix-map options are provided via CFLAGS, it only works
>> > when provided via LDFLAGS, probably due LTO (enabled by default by
>> > lxc).
>> >
>> > Patch available at
>> > https://lists.yoctoproject.org/g/meta-virtualization/message/9553
>> >
>> > I guess recipes forcing LTO will probably have similar issues.
>>
>> Ran a test locally. Looking at the do_compile log there are actually sev=
eral
>> compilation steps that do not have the macro prefixes passed as cc argum=
ents.
>>
>> That LTO bug has actually been addressed, it's just as Khem Raj pointed =
out,
>> sometimes CFLAGS is ignored and passing the prefixes with LDFLAGS was ma=
sking
>> that problem.
>
> I did look into one of the binaries and it was built with the right
> cflags options, but didn't investigate too much.
>
> I can also confirm that it works fine after disabling LTO, that is why
> I think it could be related to it.
>
> Thanks,
>
> Ricardo

Oh boy. Looking into this more today, spending plenty of time trying to mak=
e
sure it wasn't meson or some other argument combination causing issues, I
stumbled upon this thread [1]. They report the same issue with debug-prefix=
es,
but they also cite potentially package dependent behavior with LTO. There a=
re
quite a few open threads about LTO behavior in general that are concerning.

Maybe this should be reverted and the alternative solution for cgo binary
reproducibility should be taken instead [2]? I don't really have the resour=
ces
to start on compiler development at the moment.

Curious what others have to say, as there seems to be no clean way out righ=
t
now.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109805
[2] https://lists.openembedded.org/g/openembedded-core/message/230059

- Randolph

