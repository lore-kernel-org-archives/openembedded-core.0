Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD17D340A2
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 16:31:21 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15880.1769531475682932889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 08:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=M4htkKXb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.30, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8k/THbz3uVhRmOay6dKL7IrdcE9rBcZxCVXGTn1eb30Gtzz9cMpYFZ9Ehhvdm8P1X31kRPfnbQCtbnpLYwjeo9gDQ38W+EfG9dMtNA5ySfJjWZFHbrDG3bSizmdS6l9SZfnAua1tGTAavOv3MiYo+uvsEhDg4qQf38SBFgDEYhoH8Shmd23sm1Rw7g6Xn7dMBxrtYkPNn/TuDiYYXqgcnlISe5HTE/ZnD5YbLqdiOQuPmDfn5ScLMbQEphwrZoV0JB5Dk1pdcyD8l0MCImwR8iQ1DvcLsPtTN3XbK1du1kOZHsQtKdXwHWeAOaI/h/60kqENSKNhX96Wn1kUlzkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqGwvVGew8++9l5rFWTYAaG64uOD9r1pq/VYURDBH24=;
 b=dfKZFfFTT1M0peW3xplD831IsU4OwZTY8uedxth353PuH3B6wof5RRSQXql8l5NA3aggBsZ3uvDwosLVMBNvUHo3+ZjE3wNkVw+zqd/3K0L9cPAxKjlgd0UaBFZLj07IuM4JGRYJ9JDaAucIITzmz4iSnRrTs6rYQ+XvPmR4XoZel0PsiQB3STtNzyjMFZXZOvdZMK+7w0pdO1VGrqRg2jBCRRE6tpT3PwIpkxFLR6Iw5rJZ+4H/RgZ6Wg46OQh0CTWDtQoLYYYFlQT9joYf1wlSNGitRrl4Z0qxM6AObUEYSUaJjVQI/7q+3Vi8Ya9HkK4T+Yb86opZq9SxMOSCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqGwvVGew8++9l5rFWTYAaG64uOD9r1pq/VYURDBH24=;
 b=M4htkKXbdoAzzLCgKqluP+wUSAqRne1XB4IbSiqakvC/xrStczaSG84lFY1T30OrrPsHSFc/AQNDED3GbEhjb9zw4uVqb0SvsHmXdWUSO9e9A7efR5BN0wDKd/vTILx25qmgs4qqbbb1jhedxg5Rm4dC77Q/TrU9oqfnDxGOqJA=
Received: from MN0P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::13)
 by DM3PR10MB7925.namprd10.prod.outlook.com (2603:10b6:0:46::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 16:31:10 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::ca) by MN0P221CA0030.outlook.office365.com
 (2603:10b6:208:52a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 16:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 16:31:05 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 10:31:04 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 10:31:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 10:31:04 -0600
Received: from localhost ([10.249.33.183])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RGV4t4804789;
	Tue, 27 Jan 2026 10:31:04 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Jan 2026 10:31:04 -0600
Message-ID: <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <raj.khem@gmail.com>, <changqing.li@windriver.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260122194959.13457-2-rs@ti.com>
 <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com>
 <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com>
 <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
In-Reply-To: <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM3PR10MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 483d2734-a73c-4878-5008-08de5dc1783a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkxxZnMyTS9TT2V3RDlzSXptZWw5dkk4OGh0WHBlME1uNTBJRmc3VFZzTWdh?=
 =?utf-8?B?VitYQ3h5N2lyU0pZRUxUM0tERyt2U1BjSUdSZ0FwamU4U3VPVEhFTmZ1ZHQz?=
 =?utf-8?B?c05yemh3R0Mrck5mRXU2RGp0SFhORlF3dDNDTFRZQ1MzRyt0K3Y2Q3A0WnhM?=
 =?utf-8?B?QTV4Vk9tNVBVc3huU1FOT0RNRzdlQmZYTysvZlN3c1ZVTWRmdTl1RDFBRzZJ?=
 =?utf-8?B?TVN4NWdhT0RROUNRZDdiS0dGbGZmRDdMTkJvNEdmcW1DbnB0V2QwajFBaEF1?=
 =?utf-8?B?SWV2bzJBSDNFYzJNVmJFbFNYeEdiTUdnandOSjdGWktOWGk4clBaT1cxelVL?=
 =?utf-8?B?OFBRQURMWUJCNTdSSzFqUjRRWERVNzc2TlNkbGx4QzZpYldQeUpxR2M0dWc4?=
 =?utf-8?B?ZlBtSGpmUzh4UmJyTCtyNDhGZFlzSlhPeUlRd0R4Wm5SQWZhRlBvR2lQUXVW?=
 =?utf-8?B?UldYSTRuS0lFd1FGVUwvQ0tvZFUwamdha2xyeFM0YkdNbkVMOXk5M0ZzWVJy?=
 =?utf-8?B?L0svMzhaVTErSTlIS3BBZ1RTTmVnZTl0bGlQdEtteHRQdTlTMjdxQmpldDlQ?=
 =?utf-8?B?T1ZjMU1oZXY5VHJvLzFHdEpKL1ZvWDJ0SmZjSklnMEtmdWpmWmtHMlVXVVBL?=
 =?utf-8?B?V2tFVXB3VnpkUFBGblExSGhmWFU2dVkxTGt1SnB0c21YWmdPdlN1VDJ1YXVK?=
 =?utf-8?B?aUNOZWpnZmlBNklJSkhlQU9UeUVzQTN5MFkwK1d2R2laM2ZnODF5L2RTM2l2?=
 =?utf-8?B?aFhYRXpoa3Y0QW1NWXB4dno0d0w1QnZoN0N4bHZrU29pYVJEYTdSMFJWTWll?=
 =?utf-8?B?RmxnODFLbXJxRlIxck1pV1lra1JoZDJHR3R0WDJ3OUYwQzhqbnRKMzFHdGtT?=
 =?utf-8?B?ZmIrV3BUOVFBektjT2x2YUxHQlM3aUFGQXBFWGxGemNFRkRiV3RzVVQ3c3A1?=
 =?utf-8?B?Yy8zVCtUY25ndDBKeXprZWJjS0pZclNjSU5neUdNOHNyclZUWFRNeFcrMnJP?=
 =?utf-8?B?NHFnUzhranVpOUcrUjhrajBYYUxEREE4STY0SkFlaCtvRXBqT24wb25oUEFw?=
 =?utf-8?B?aWFMMkN3VWR6RnVhV09JdkcyQXpqeDhNTWhIeERoc0dFQks1WVVCWFRncGNs?=
 =?utf-8?B?U2VQeUZINHYrQXlxSzAxWlFvV240c0lMa0gxZ0FHL2U5UERsam1FSkFCTDlJ?=
 =?utf-8?B?TWxHaXdQVXE1cG1HZVZDeGNIZkVLKzdUZjRvK3VMZXgrbmRkZnJLSkYrakNj?=
 =?utf-8?B?bW9PZnliUkZyc2hsZ1dudGNGd0lVTFB6bkM3RFN5T2hiL1NtOHYyZzVpZ2ZH?=
 =?utf-8?B?b2N6R1BQTkcyaXJTUk9RcmZrT3YxVTdFcnF2OWNmMzNtdGpHTGRIa0xVY1dv?=
 =?utf-8?B?Q2JuUHZCbHRXeUwzUzhpNVRibGlxbkxaeTBsTDFDR3dRRGNjdGlqQ09wOWMx?=
 =?utf-8?B?eDViNmx6Tjl4Mll1dFBRcUNmZk5Wemt3S25Gd2swVDhvRmQ5dUdhQWpjeDJO?=
 =?utf-8?B?UDVKbVlMKzkwNDJlQ1AzeVZ6SENDR2RNSmVRU1IreFhZSk5idHBoRUNGNlpD?=
 =?utf-8?B?SWdpdFNaQ1NWbDNpaVpkZ3JLdEFnUVBpblhKQTJDWnkwa0tUdm5OYlNxWHZk?=
 =?utf-8?B?LzlRcGZUc1ErM0d4TnR4QkRRT3lXSE0vbzYvcGhqSGc3VjFPTTJzUEpPNndN?=
 =?utf-8?B?V1dyZkhIb08vVmJKWG5LdlNVN0J3Mk5DcmdieUduNXY4UERXeTVEbHJaWHRK?=
 =?utf-8?B?QjZveklhTXpLZEtwYXc1QkNORmw4R2xLMWRWMWJwUkdLVFVFNjVNWFFubFNq?=
 =?utf-8?B?WVU4T3pIUUhNZVVxSXgvVGJpU0JodEViUmQydy9ONW1wNEt5andqYUFOcGdZ?=
 =?utf-8?B?QnkrdWdWYlFyc2g3QlBPc2dPVXdtOHUwMnZSK0FGdkJBTmNJUEdYMDZvV09h?=
 =?utf-8?B?WFBXUnUzSEpvNE1hVmVzdC9oK2ljdVQxbEdTQXBFd0ttbDJKTGlwdWNiRFN3?=
 =?utf-8?B?SG4ycmlSOG9BeWpUUzVIbzNoSUttbkdJeVI2dTJQVDFWTFdzU2pISzRGU1Va?=
 =?utf-8?B?dkxDbmtVZFgxVkRUOU1oekhacVpxZ0k5NXNJaVN3TE9vMnd3N1pFQ0JjUGxG?=
 =?utf-8?B?SXFGSUc0SlJ4NThCcTlSM3BsNFVPY0RLZ1lDTUVDVERFNTdxWVlxUVFLNFY2?=
 =?utf-8?B?TlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:31:05.9195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 483d2734-a73c-4878-5008-08de5dc1783a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7925
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 16:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230056

On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedded.org wr=
ote:
> I am seeing some additional diagnostics see
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153/raw_inl=
ine
>
> I wonder if this is related.

Man, the mail clients are having fun with this thread.

Yeah, I'm able to reproduce that issue locally now. Not sure why it's this
package subset that's acting up, but it is directly related to the LDFLAGS
change unfortunately.

If that bug is actually still in effect then this requires some change to g=
olang
to avoid baking cgo_ldflags into the binaries. Right now we can get away wi=
th a
go class specific LDFLAGS override if we want to, but that GCC bug may begi=
n to
affect go binary reproducibility in the future.

- Randolph

> On Mon, Jan 26, 2026 at 6:50=E2=80=AFPM Changqing Li via lists.openembedd=
ed.org <
> changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
>>
>> On 1/27/26 04:50, Randolph Sapp via lists.openembedded.org wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:
>>
>> On 1/26/26 03:39, Changqing Li wrote:
>>
>> On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> From: Randolph Sapp <rs@ti.com> <rs@ti.com>
>>
>> Now that the previous bug affecting binary reproducibility has been
>> addressed [1], we can revert this patch. This will resolve issues with
>> cgo applications becoming unreprodcible.
>>
>> Currently go considers link arguments to be sacred, meaning any change
>> should produce a different binary output. They ensure this by baking
>> link arguments into the intermediary output, changing the content ID of
>> that step. As such, the marco prefixes inadvertently end up adding build
>> paths to the output binary instead of removing them if they are passed
>> as link arguments to cgo applications.
>>
>> These paths are later stripped out again, but at this point the content
>> ID of the dependency has changed and thus the build ID of the end
>> application will be affected by the cascade of hash changes. See the
>> upstream bug for more information [2].
>>
>> This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
>> [2] https://github.com/golang/go/issues/77218
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com> <rs@ti.com>
>> ---
>>
>> This resolves the previously reported emptty issues:https://lists.openem=
bedded.org/g/openembedded-core/message/228549
>>
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 88f4d0df69..da873c3f4e 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=
=3Dgnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?=3D " <$%7B@['-Wl,--hash-style=
=3Dgnu',''][d.getVar('LINKER_HASH_ASNEEDED?=3D>-Wl,--as-needed"
>>
>>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
>> -TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEB=
UG_PREFIX_MAP}"
>> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
>>
>> Hi,
>>
>> After check the related gcc bug and yocto bug,  gcc bug comments 21
>> ([1])  and yocto bug comments 13 ([2]),
>>
>> my understanding is that,  when lto is enabled,  even with gcc fix
>> [3],  we still need DEBUG_PREFIX_MAP in LDFLAGS
>>
>> to make bin reproducible. Also seems Tony's commit [4] is after gcc
>> fix [3].
>>
>> [1]  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21
>>
>> [2]  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481#c13
>>
>> [3]  https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c
>>
>> [4] https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc8=
8979967d0e00e2fafdbaaabec030da9f
>>
>>
>> @Tony, @Randolph, Could please correct me if my understanding is not
>> right, Thanks.
>>
>>
>>
>> Yes, LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducible,
>> unless something else has changed since 2021 to make it unnecessary. I
>> have not kept up with the issue.
>>
>> Tony
>>
>> I think there has been some change because I tested this locally with th=
e normal
>> reproducible builds selftest and no new packages were added to the faili=
ng list.
>> This included oe-core and some layers from meta-openembedded as well.
>>
>> Got it,  if DEBUG_PREFIX_MAP is not needed any more,  I think remove DEB=
UG_PREFIX_MAP
>> from LDFLAGS
>>
>> is a good way to fix the issue.
>>
>> The example code given in the report is fairly rudimentary, we should ha=
ve hit
>> the bug if it was still in effect across a majority of packages if my
>> understanding is correct.
>>
>> I'm also curious to see what golang want's to do about this though. Baki=
ng build
>> options into a binary seems a little silly, but I'm sure there was some =
unusual
>> behavior that led them to that point.
>>
>> +1
>>
>> //Changqing
>>
>> As indicated on another thread, we could also just remove this string fr=
om Go
>> packages LDFLAGS if that puts everyone at ease.
>>
>> - Randolph
>>
>>
>>
>>=20
>>
>>


