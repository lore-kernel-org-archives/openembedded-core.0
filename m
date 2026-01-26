Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6E8D1951B
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 20:50:19 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31153.1769460610566211332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 12:50:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WegkE3G+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.24, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mhugoas7S4ttyo7wYpGxfIu0yBlHl6Sn4wSJ4Xjg4yUMoMexxXr6OQ0JNiPDgfFu5ZLbJ2VvjpW1N5r8IZqSaWT2OQEWcsfoRmOfREk8sYa/h5EMgc6nnnUF6j9LeV4HA4qCzEluaXVwkyEVgqLKSFu1Ztaz+9Jin7i/JuhrLwDWgrH14hwwsjw17/6J5gpEbKAYaWjMEMJaCXPUbTrntv0h0+IZtC+GrHUSBPp0FaTSwsHYsjunbUrf/x6qqH649UZ/0bLSccz+OBC8u6IPPuGvdfpjyWCR/qjabrwUW0ixIbZGSmvtd69mibHzgPLkvwzOmrY+d4rWLLxJW/tvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGZLEZjaz28e+mbjZyAAXkf2zEqyuo+FCIolXY2ImnM=;
 b=GTF+svZX3U9BnruOOeJbwAM0nb2KCwDee/yxoesGed0qCJ4G5tpoLz0wxiecHq59qXexo2ikJFTnDnVRv5PyHkmvRtbansYbS6PKMTwtfOR59w2fk1kor6VVt86XFANu5LQkFmW84u+T9pAfraCn9OdVTatxn16mSBTjvbTI6FJBHBkLEnA5L8S6YotPgFyDutOzRN76tCo1U5FB0wWAv5eu0WsqJ5oJxi0zCK/ormRi/UZn5FBspDmNhfUsWCz7ZNmACkpKotUToesHEOYBLa2JdE92wTo83o4b4gAKTqpFEDMtPZmeeaQw05EgP4Bo92jciZgs0Ju7NcYXyP3Bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGZLEZjaz28e+mbjZyAAXkf2zEqyuo+FCIolXY2ImnM=;
 b=WegkE3G+A52vadZOC2fHdh69kEx7pt7ThdRi+5hbqRnVT985WQeUFXh4U9ZafzEOxjPvaGAwqbDKhTA9c8pYed2q2iZ0r+O1pQWOE9zQpKrCQIRgj7vBDznVbr26VFyRTj3Q3dwQshEv0DhM50IOzUNNi6w/eIRFv8EzuGa33UA=
Received: from SA0PR11CA0076.namprd11.prod.outlook.com (2603:10b6:806:d2::21)
 by BN0PR10MB4837.namprd10.prod.outlook.com (2603:10b6:408:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 20:50:08 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::7c) by SA0PR11CA0076.outlook.office365.com
 (2603:10b6:806:d2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 20:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 20:50:08 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 14:50:07 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 14:50:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 26 Jan 2026 14:50:07 -0600
Received: from localhost ([10.249.48.50])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60QKo73r3187258;
	Mon, 26 Jan 2026 14:50:07 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jan 2026 14:50:07 -0600
Message-ID: <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
From: Randolph Sapp <rs@ti.com>
To: Tony Battersby <tonyb@cybernetics.com>, Changqing Li
	<changqing.li@windriver.com>, <rs@ti.com>,
	<richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260122194959.13457-2-rs@ti.com>
 <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com>
In-Reply-To: <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|BN0PR10MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8d609c-8e66-4731-2b44-08de5d1c7dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFhOVDRnYWpVUWZMb1VzanRuQ3FaV1kvNzNBYWtiemVnRmFJZXkvYjhrbHo1?=
 =?utf-8?B?RlM4c2lUVWNlN0V6S1JoMjhwUXZDQUlvcDUyQytnN0tQWk5sQnlxVlpqY2U0?=
 =?utf-8?B?MkIyR2tValpoYUg2VnA0SlBqTDlRQ0NSUEt4M2hPZ0Mwck14U0ZCME8ra2pO?=
 =?utf-8?B?ckRxKzdFUHUzSXlJOUJCN29TdWM2eE01d0FHWm16MWczbVBKNngzUTVuaVNL?=
 =?utf-8?B?TGtNNUZkWXpyMDVtbnVZcTAxaWVjTE9qb2FDU2l6bVlmYWIwaTJZcENmRmxq?=
 =?utf-8?B?MEl0Y1RKUWU4N0NuSFJuOTZIRFZiQURXbHZ3TjFCTWM1K0tuVTFxazNWUE1s?=
 =?utf-8?B?ZHNkTkQvYThZOVhCdHc0MjA5VnpTRVpZczBFWSt3dXJQeFFvOGV0bkNRMk9r?=
 =?utf-8?B?YWRIbmpLVSs2Z1FpTzUwNU9zRzh4eHljU0dsbndiTkt3TFVEWURZR2FHUHlS?=
 =?utf-8?B?ZjZ5TnIzcmdFZEgyK3U2bGpCbXl5U3h2TFN1Y29OZzRpSkNXemoreHJLZHpP?=
 =?utf-8?B?cWtEeWNWUXZPN0Q0RTFFek5RTGdJeVlyMlkwV2NCZzg0NEVHdmo2bzJ0NHhh?=
 =?utf-8?B?eHNKTlNWb0JmTFUxS2Jnck92L3JWQkw0cDFoTzE5RkZQbW43ZDYySnVYOGdN?=
 =?utf-8?B?S1dIK0M4S20xM1gvcWt4UmxtN0JHc2xuV2p6aktQYnNUdjJyQjhNWGM2V0RV?=
 =?utf-8?B?Vy9sblFLYTdmZmsvZFczbE4wRTB3SVN1cE1iOVdZcjFYY2JoeHdkVmVvMmY3?=
 =?utf-8?B?Y2JWSklaMjk0ZWlNOXAxTi9PV2VWeXVNclhOeGZhaElzNDF0dWRqN3pjdkJ6?=
 =?utf-8?B?c0hBTi9YWENEZy9oc0xXd1BnbXNDditPaVFKWFJvU08zcE5jbllXbFhDdE56?=
 =?utf-8?B?UjRUeTRNUGZ2ZmxmQi9UUDc3Z2VaU2J6S3FzUVZQeTJCTFlYa3B5SjZST2tC?=
 =?utf-8?B?QkxEYlZrU1RtbGFuY0FSTCsxK3NBT3NObWZiVEFuQUVscmFDU09IMXJrWS9s?=
 =?utf-8?B?OFVsdkpNZE8vaFJYWlVDNEhSZlNWOEJ5RUgyTlBTa01EaHRyeDRyQWtuTlVZ?=
 =?utf-8?B?MWFTUkIrZVg3OW9hQjU5aEhQNzVzZGNGdTNJc1hMNXQ5REpvQXQvdlVzLzJo?=
 =?utf-8?B?RytWZ2k3UHVrT2sxaEpDWmM0K1psQjhWNXJMQ1I3cGNod2VUdW9pWUFaMlRM?=
 =?utf-8?B?NHRtTzhFRFQwS0ZiT21VUWd2cGpwdFJkK1dWQ2VmdnhneXNuM0lBM3grNlhG?=
 =?utf-8?B?Nlo4bC9Ia1I3RlBCbjk1ZGQ3bWNueStQcVVqTmNvMGIzam5PWTJDV1FMTFds?=
 =?utf-8?B?NkhhNjU3UWRnRTlVYnV4UGFUTDhmTEVUNCt3VzR0TC9ZUjlsc3lqcDA3Z2pF?=
 =?utf-8?B?RUFpNUR5SjRDbTd0UFdhcllndTRyb0dieENiRHUyVzgwd1JTWkNXNG56eWNU?=
 =?utf-8?B?VlVkcm5kL1VWcHk1SThsa0dBNFRhV2xlR1N0Snh3NnZmMXh2ZEV3RVdTT3Br?=
 =?utf-8?B?OEszVzdubGErL0d1YUQwN2lTR21CeTR5MUtGVE9SS2xNTEEyWERVWE16RGdJ?=
 =?utf-8?B?dHJGL2doRTFCdHZNSFpWVXFNaGZ4YS9ja29XVjhDdytCTE1SRjZXRXp1bWJm?=
 =?utf-8?B?aFh2Z3g3bVRzQi9kK2Y3Rkk2Yi9DV1BTUFY4c1Z4dDJNa1NrM3VYZ0pFK0lZ?=
 =?utf-8?B?TGhHUUpFQis1Zm9KOU9BMTJhZzhmY0NCVm5OK1pHUlE2UGVmWWZJeUtxL1hi?=
 =?utf-8?B?bWxEN1RmL1JMSTQwWDAzWWFEeFhyb0dLK0xtU3VyTnJ6TUxwWjh6dnJ0YzM5?=
 =?utf-8?B?VTR5Q2dkcDRLeUhhTk10V0kzaGVJdmJHT21QeE9YWFBxRkdDQmtIWlJqdy9o?=
 =?utf-8?B?eFBLb29ldTgxMHlOdFNKay8wMVpxajFWN0h3YmZ6dHZITFdYdWpPVU9QYlFO?=
 =?utf-8?B?TGFRQ2FuVTgxclJmeFFWbmIydldsNnRubmVCaWlGTytxRCttRmxDRE1EK0d5?=
 =?utf-8?B?blhPNWVZL1l5YUVWWU5yUkx2YkI1WTcrZFpWSUp3bW5mblp3SHBTSTlSaW5S?=
 =?utf-8?B?aXBJV2tabU16ZEJRTnFsWGpyWk1MeFE5Y0VZMFpEaWpibExzSnVXUC9YMG9a?=
 =?utf-8?B?VUY5VGdiRE9sb2xYdGM3TnBvNEtjL0k3UkMxTDMvUXhOR3c5MmdTTWtDeXBk?=
 =?utf-8?B?OHc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:50:08.4003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8d609c-8e66-4731-2b44-08de5d1c7dd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4837
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 20:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230026

On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:
> On 1/26/26 03:39, Changqing Li wrote:
>>
>>
>> On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>>>
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Now that the previous bug affecting binary reproducibility has been
>>> addressed [1], we can revert this patch. This will resolve issues with
>>> cgo applications becoming unreprodcible.
>>>
>>> Currently go considers link arguments to be sacred, meaning any change
>>> should produce a different binary output. They ensure this by baking
>>> link arguments into the intermediary output, changing the content ID of
>>> that step. As such, the marco prefixes inadvertently end up adding buil=
d
>>> paths to the output binary instead of removing them if they are passed
>>> as link arguments to cgo applications.
>>>
>>> These paths are later stripped out again, but at this point the content
>>> ID of the dependency has changed and thus the build ID of the end
>>> application will be affected by the cascade of hash changes. See the
>>> upstream bug for more information [2].
>>>
>>> This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.
>>>
>>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
>>> [2] https://github.com/golang/go/issues/77218
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>
>>> This resolves the previously reported emptty issues:
>>> https://lists.openembedded.org/g/openembedded-core/message/228549
>>>
>>>  meta/conf/bitbake.conf | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index 88f4d0df69..da873c3f4e 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=
=3Dgnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?=3D "-Wl,--as-needed"
>>>
>>>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
>>> -TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DE=
BUG_PREFIX_MAP}"
>>> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
>>
>> Hi,
>>
>> After check the related gcc bug and yocto bug,=C2=A0 gcc bug comments 21
>> ([1])=C2=A0 and yocto bug comments 13 ([2]),
>>
>> my understanding is that,=C2=A0 when lto is enabled,=C2=A0 even with gcc=
 fix
>> [3],=C2=A0 we still need DEBUG_PREFIX_MAP in LDFLAGS
>>
>> to make bin reproducible. Also seems Tony's commit [4] is after gcc
>> fix [3].
>>
>> [1]=C2=A0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21
>>
>> [2]=C2=A0 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481#c13
>>
>> [3]=C2=A0 https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c
>>
>> [4]=C2=A0
>> https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc88979=
967d0e00e2fafdbaaabec030da9f
>>
>>
>> @Tony, @Randolph, Could please correct me if my understanding is not
>> right, Thanks.
>>
>>
> Yes,=C2=A0LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducible,
> unless something else has changed since 2021 to make it unnecessary. I
> have not kept up with the issue.
>
> Tony

I think there has been some change because I tested this locally with the n=
ormal
reproducible builds selftest and no new packages were added to the failing =
list.
This included oe-core and some layers from meta-openembedded as well.

The example code given in the report is fairly rudimentary, we should have =
hit
the bug if it was still in effect across a majority of packages if my
understanding is correct.

I'm also curious to see what golang want's to do about this though. Baking =
build
options into a binary seems a little silly, but I'm sure there was some unu=
sual
behavior that led them to that point.

As indicated on another thread, we could also just remove this string from =
Go
packages LDFLAGS if that puts everyone at ease.

- Randolph

