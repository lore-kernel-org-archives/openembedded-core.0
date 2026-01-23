Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7E7D778B1
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 21:10:20 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5850.1769202613041021958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 13:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Qkj/QeDi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.55, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8Xet8O1LlyIXtm1bYlQ6Qry/F2pKbu8uFeYoSiyzNwq91t2jHEW6o+Ya32hsofbUIgRZZL16+xvS6jO2GcaJmZCaLiljx9LcBdmJz2I27vfraG8XbB48IqUpNY+BzxchAzLgaNOklXF7H/lDxZ3dujtFtWqP332XpWrnm+V7B43QLuxtgdWkdPvwd3/h4zkRw81Jjg4Ncb3fTazXETF8pyQWlXxbieFmL62aKgOSL/aQ43YLJIMzgx6fg9FGn35SlYnMFubnvPSEWpL20bhyeiWiCTxNOGuF1v7++hiOCIaFiw/PCmO5HMWwugdPw5oTx4k/a+Q44YOYm5vF2ngJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+163Dg3xkFdm17XKFMr42WxglUHOwq70RwGEf2UDqM=;
 b=F5WLrQmDwGO5Y2JdOomVT+8IHSfoMGsD0GiXGu5Sg7k5TS2V3YMOxIZ1/na+FXF1/drWetPzQWzP32u+SXSCiR1Oe1jxC7ue/bF9g4OwrJG0LfuYN6ZxxxytZytDMi+XTUkHNxyGcl/qhfD8bcSsBc4etlwIWG88NkKwcGb0uwf93EOX4A40cALV+t1cNJWKXMLu8VzPrBGPEi0dccanEZ+pt2oaj5R5HV3raiFUBuD5ZLjQjuRS+nMlH1SxAUGhokRIWrR2gTYtU9SkkX1HRtGHbZ8CS6ef5iHVc9ESrFnVYCXYyDKjTeoAflG2/Nf1OwlGAL4gwt7X6Pjvj2zlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+163Dg3xkFdm17XKFMr42WxglUHOwq70RwGEf2UDqM=;
 b=Qkj/QeDiWf14evoIj2LTSek3QcbIwVjaf9TL5m3RW1byDDkjCsK0P5ZA2rPCzDRC/vy2rDyBWbdhdQiNRJeUBmtcfNxMQ/lJ6rStNODEcOjYXsSDzGxTcORDKNT742THEN4AnZjnYLYQtOsgKf4N1+KR9TbNKKOAH6zMFKIltWk=
Received: from CH0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:610:e4::19)
 by MW4PR10MB6396.namprd10.prod.outlook.com (2603:10b6:303:1e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 21:10:09 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::80) by CH0PR03CA0194.outlook.office365.com
 (2603:10b6:610:e4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 21:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 21:10:08 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:10:08 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:10:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 15:10:08 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NLA8vd2808424;
	Fri, 23 Jan 2026 15:10:08 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Jan 2026 15:10:08 -0600
Message-ID: <DFW9ZDYDKJZY.TU0KTUU1Y3NJ@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <changqing.li@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH V4] go.bbclass: set buildid to empty string to
 improve reproducibility
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260114064400.4070617-1-changqing.li@windriver.com>
 <a065254107d5d01736b8a68b67cf53c0b26fbe6e.camel@linuxfoundation.org>
 <188AC968E243AEBC.2595076@lists.openembedded.org>
 <703def79-e544-412c-bac1-4d30cf7ad65f@windriver.com>
In-Reply-To: <703def79-e544-412c-bac1-4d30cf7ad65f@windriver.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|MW4PR10MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 7991a86b-140e-436f-1448-08de5ac3ca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?akZOSHNwQ3NWTDFwV2ltM0Iwbk9SZlJCMVdyOWxUSng3YmdFQWo2SVE0WEg4?=
 =?utf-8?B?Q2UxWDZhSjNNamozd3JYRHZCMTNHZ2FvS21XR3lEblA1S1RJQ0R3N1BsL05X?=
 =?utf-8?B?ZzNhMmFzbUN3eUU5NnpnN3loYmhNOHg3K3owL3I2ZWU5L1ZiekV4WlFsNVlL?=
 =?utf-8?B?elFWcm40b2hzQVVLZVFUOTIxNldrcWdVRk5yQ2FOR1FLT2o5b1hKS3hPVXMr?=
 =?utf-8?B?U1c2c2lMbnYwK1NyZEVWMk13T3U4R0RRU1VRL3AvTnR1NEg5djBHTlZSUEg2?=
 =?utf-8?B?MjhDelhtMElERmt3SFdpTm01WUxHMzJzNmYvZGNIK1dwcmwzMStHNjFPbklw?=
 =?utf-8?B?ZXVYUTdkNmV0LzJ0WWxFMmUzWmkvenovR0QrWFFlUUx1eXlUdEZkT3lWbmpn?=
 =?utf-8?B?T3BLUmk2UDBVNlF2NkhwS1FLejVkTlhQM2V5SXZ0MlRvMnNkN3czeGt5NlM1?=
 =?utf-8?B?K1VVRWE0WXBBMExrZjFqVDJuTWRvbUMralJZTXN0NklGalBVTFIzQU12c2wz?=
 =?utf-8?B?RmtsKzV3LzZVSVlSR0owM1pLSkN4NGcyMDlxT3l4TjhXR2ExV2xFcllFUVZB?=
 =?utf-8?B?cFdNem5pRHQyTS9PbHpRSUt3dUxUam5GQTd4L29JSEZoSCtRNXd4SDAxdFJz?=
 =?utf-8?B?VXhIQ3hqODF3ZnlRbkFtTFZ1WUhNa1JqR0JOYmRVWlRFV1FuN1lOSndZc0V4?=
 =?utf-8?B?R3VQTmh5YnlEbnQ3UnlxMTJRMklybWxsbStQNzRoQzdLOFJWTHV2clUzSUdM?=
 =?utf-8?B?WndjV21VNmd6QTNUQzFNRDZTN1JBUXRVREJtOWdUWEpFc3FBZHNSR1gwN2xh?=
 =?utf-8?B?QVM2YWhJd2VlQkVyYTJMY29NN2VyWlBXczdsSmhtWGx1OUNWUFIzMU1HeU5P?=
 =?utf-8?B?YlZkRElkOWM4QTR3NldySDA0UFdpRnFNZVNkS0EvZHIzM1pQRC9aN0hRcmVI?=
 =?utf-8?B?ak43SlJ4OG5DWG56N1U2dDllSjZiNTJJdkFXdE96dmFnVVZxNDRYYVhoOUZv?=
 =?utf-8?B?M08zSWpBUk4xRFpaa2djTUx4S0VEejRmZDFkdUJYckg4RjN1RUlEY1BzWTdQ?=
 =?utf-8?B?RU5GMmlCT29uNnFIbWRLTDVxTTZnTmoybHRXdkJycFFQcEJQWFBCSitmMUZp?=
 =?utf-8?B?blM5VGtUSFpiNXI3TzcxaEZKRGlrVVBpM1dlVVlhOGJIRTdzR2xDWlJtRG8y?=
 =?utf-8?B?UURPNERRRkF4QytLR0tobFVqNDZUZ0ZCdmxXRVNhYUFHdjBYK0JYZVdOOVFi?=
 =?utf-8?B?T2NSeitTdm1zZEF4eFJ1enhvMjF2QzlheUFMY05PZVN6emVXL1FpVVBQeE43?=
 =?utf-8?B?WDBsRWRkY0JDZzd0OGRDcGtwTGxmUnRIRS9vTm5yWE41VzVMdFhIVjdkNzhn?=
 =?utf-8?B?RXpsa3lIU2hnSmtzb0hVN1lKbHp6a05vOFNYeXZRb1pZdEgxUDVDdzMzS2N1?=
 =?utf-8?B?Z0NjejIvUkRMTzgyWThQSnEzaDU0VGowOUVQUFdyY3FucmpVRjZKdTZsd0h0?=
 =?utf-8?B?RnFqZmpqMVBraVp6Z3hBQ1lPM1EvekpnNHVOcUU1SndhM1ZxUVBHZEcrQldO?=
 =?utf-8?B?V1o2WHphbXhHYkx3bWdpODVrVVRJakR1b3d3ZXM1bUdVWUNJTUhCbGw1SkVs?=
 =?utf-8?B?YlpTWjVTOG5wd3ZPVzEvUHdpaHJyMkxocUZvRTVlMUY2cnliSHMwTUpWMFBW?=
 =?utf-8?B?NHB6bWd5RFlhRkhQZVNWWjh4cnZTQmhucmN6amI5OVA3Q3dzOExTMXJiOFdu?=
 =?utf-8?B?OUZXaFlJSkh3M1NRam1id1FXRWZSWENNd0NHakhYM1pQalNUTjEycXNwc3Er?=
 =?utf-8?B?MmUwYmxzM3lKdFYzNU1YSDJFUEkxV1E1ck5KVTZrODZOYnJwc2RCeEUyQmda?=
 =?utf-8?B?bDRmZWpNeGVQVjhNS05lRTJGU2NJYjl3TTdYbW53RFZqU2wraGRCbEpKa0RI?=
 =?utf-8?B?dGpoclNzN1pKS2Y4SUtsSUlXZ1VIUGtNNzBiU0M1VFVEOWptY0R4a0FURXcy?=
 =?utf-8?B?UGQ4SFUrSW52OGlpUWRyKzNEck1HbE9QVEdOZGIxT0FwYTAwalk2R21KRDZ1?=
 =?utf-8?B?bXA3SHg4QzdMWDdKeTVObUVPVUY5WTVjSktZbTJZb0VyNDRna0F0MGFZZlE0?=
 =?utf-8?B?dldKa0l2enlUMEtnMS9pOWsxTy9ZOEFYd1paZXI1L2czN0lrRXovZnJTbnNv?=
 =?utf-8?B?ditDM2FMQ0txaUkvMFpIVXJ3bFkyeDYxNWhobmlzblFsUzBuNWY1NFFMMG04?=
 =?utf-8?Q?8eRyqVZ1bjn6nyhUu3OSK8M0N6DgPTAB0s19Us0ztc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 21:10:08.9894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7991a86b-140e-436f-1448-08de5ac3ca35
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 21:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229915

On Fri Jan 23, 2026 at 4:35 AM CST, Changqing Li via lists.openembedded.org=
 wrote:
>
> On 1/15/26 11:20, Changqing Li via lists.openembedded.org wrote:
>>
>> On 1/14/26 20:36, Richard Purdie wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the=20
>>> sender and know the content is safe.
>>>
>>> On Wed, 2026-01-14 at 14:44 +0800, changqing.li@windriver.com wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> Go packages and binaries are stamped with build IDs that record both=
=20
>>>> the
>>>> action ID, which is a hash of the inputs to the action that produced=
=20
>>>> the
>>>> packages or binary, and the content ID, which is a hash of the action
>>>> output, namely the archive or binary itself, Refer [1].
>>>>
>>>> And action ID include hash of modroot, which will include build path,
>>>> so this make go package not reproducible.
>>>> Refer [2], keying off module path instead of module root directory=20
>>>> is a TODO.
>>>>
>>>> [snip of log]
>>>> HASH[moduleIndex]: "go1.25.3"
>>>> HASH[moduleIndex]: "modroot=20
>>>> /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-na=
tive/usr/lib/go/src/cmd\n"
>>>> HASH[moduleIndex]: "package go1.25.3 go index v2=20
>>>> /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-na=
tive/usr/lib/go/src/cmd/buildid\n"
>>>> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC=20
>>>> 1704\n"
>>>> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
>>>> HASH[moduleIndex]:=20
>>>> 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b
>>>>
>>>> Report this issue to upstream, refer [3]
>>>> Workaround the reproducible by setting buildid to empty, refer [4]
>>> The trouble is there is a lot of potentially important information
>>> going into these buildids and you're just removing that functionality
>>> entirely.
>>>
>>> Can we patch out the problematic component until it is fixed instead?
>>
>> OK.=C2=A0 I will check if it can be patched out.
>>
>> //changqing
>>
>>> I'm very reticent to remove them entirely, that doesn't feel like a
>>> good solution.
>>>
> After do more investigation, it turns out that the not reproducible is=20
> not caused by what the previous commit messsage mentioned modroot.
>
> The root cause related to the cgo_ldflags, which may include build path.
>
> Take buildah as example, it deps runtime/cgo,=C2=A0 and runtime/cgo is=20
> compiled into ar archive file _pkg_.a,=C2=A0 and=C2=A0 it includes _go_.o=
,=20
> __.PKGDEF and other files.
>
> _go_.o maybe include metadata "cgo_ldflags,=20
> -ffile-prefix-map=3Dbuidpath/xxx=3Dxxx", and meantime, _go_.o, __.PKGDEF =
all=20
> embeded go buildid in them.
>
>
> build buildah, deps on package runtime/cgo, so "import runtime/cgo=C2=A0=
=20
> 'contentID of this package'" will be part of actionID of buildah.
>
> 'content ID of this package' is the content ID of _pkg_.a.=C2=A0 we canno=
t=20
> change this content ID by simply exclude them like
>
> what this line has done:=20
> https://github.com/golang/go/blob/master/src/cmd/internal/buildid/rewrite=
.go#L46
>
> because the build process will use this content hash,=C2=A0 sometime veri=
fy=20
> cached can be reused or do cache verify.
>
> it is related to how go design like.
>
> I have update this analyze result into:=20
> https://github.com/golang/go/issues/77086.
>
>
> And seems fix the reproducible issue by passing -buildid=3D is a safe way=
.=20
> It only influences the last step when generating elf, the previous build=
=20
> process still use the original actionID and contendID,
>
> if we set buildid by pass -buildid=3D,=C2=A0 it will influence what value=
 will=20
> be set into section ".note.go.buildid" in doelf.
>
>
> Bruce had suggested to set buildid to a proper value like SRCREV.=C2=A0 i=
f=20
> you all agree with this solution, I can try to send a V5 patch,
>
> if I can get SRCREV, set -buildid=3DSRCREV, otherwise, still set buildid=
=20
> empty?=C2=A0 like:
>
> GO_BUILDID ?=3D ' -buildid=3D"${@d.getVar('SRCREV') if d.getVar('SRCREV')=
 !=3D 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCREV_%s'%=
${PN}) !=3D '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.getvarflag(=
'sha256sum') !=3D '' if () else ''
>
>
> Regards
>
> Changqing
>
>
>
>>> Cheers,
>>>
>>> Richard
>>
>>=20
>>

Oh cool, someone else found the same issue I did. I submitted the following
patch the other day, since the only LDFLAG parameter that is actually break=
ing
build ID functionality is the prefix maps, which include build paths. That =
was a
change made way back when to address an issue that has long since been solv=
ed.
We can safely revert it now, assuming nobody is using external toolchains o=
lder
than GCC 12.

Alternatively, we could just conditionally remove those arguments for go
applications only. Up to you all.

https://lists.openembedded.org/g/openembedded-core/message/229857

- Randolph

