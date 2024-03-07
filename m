Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB577C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 08:52:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18982.1709801542856045994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 00:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b6mO5LgB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796ab1ae3=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4277SOHb027010
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 00:52:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=S601O3n3JZPCclEICnP4b/B+ew0l/OAUCdbPBsjFYJE=; b=
	b6mO5LgBpCxbUP5B/6A0FwzDCyTRd7sD+siTx8TmFxSeViDe7LnyH9tCddRTnRK6
	rMjTlizGZNWs7R2f9BXJSInDh8sgguab6KyKSwQBdfPLslVbHVsiNZ2Kms4KGT8R
	vGotrhrUJAicBT+gGyQu4m7Bza8vHe8jyaGAYuWPkCz4ScW5Ye75tts5f0IcObFF
	9KhpNmhv8MqJeIzgS+EpS2iMfMorCaQubeFn2fWeCnZuUtMFm4FXJgVNB5zFUMqm
	ad21RklXYf4ynj/igpEa9Qo9ThkvDLieb3fdNcviiXx61ei4qn77YzqNYFeQs/rK
	b4Rm1fEeI7Dibb/lbMGfbQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm4ke9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 00:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB/oiAZadPPk6BHVlFU8KFXbqllANt3gBtTE3ZPYGDdFU/H3ZT6wSOuvY7PhhOWNE7YWh4XuXRX353hbUPpcOi8Uz8VRuFReNcRbnQ+LsOk0c6zOYwc8/0EcR9g82o5NahEWNVTgAv1/oxaE+QbdhVr290ZxCcZPtLZgf/KKG2yp/NqnMMrNKaCtTzZKWJYXncHeSvOebVUA31PvzoL7j7kzdWyINu6BUTB3uJoHhEU4xcdg+jCBUWN+TA+/wzppxH1Ieobw5ovPiWWiBftDDBJt845AcCVXBO+tbGVtXdWQnr1J46vURiNTiKKxQNCUBDGGublhXUNptHUfoLwqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S601O3n3JZPCclEICnP4b/B+ew0l/OAUCdbPBsjFYJE=;
 b=a87kzA38jbH0nwvWolfg30CWkpmLtalECZ349av2qfA3EhG62aI/+FgXWH1Ugp6srI62/OI8y7nlf3sXZ8ZKyrOBcBW4/Fqld9hYmNwUe7A7SgbXxG5UjEPpY58IJE2Jx0vxEsBN/w2oI68wnJ1g5wzpEfpqxhyY0WMqtlse7XgyKtN1tegeB6mZcR/rjtfkqIBXJ1rFikLQhmgZfCFszLs9Idr5nUHYS4yGm/KMGN0GO+5OXDD1SS8izkpDYoNJrfAOWKBL3wL7fo0ogqy5OIpMtVRYuiImbmTaisoms+N8wzP3ZDYYfxdKWkzOoZFtM1JVarbZAApmUZm9gDx/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV8PR11MB8748.namprd11.prod.outlook.com (2603:10b6:408:200::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Thu, 7 Mar
 2024 08:52:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7386.005; Thu, 7 Mar 2024
 08:52:18 +0000
Message-ID: <3a52270e-0aaa-4b81-abae-3e884b894568@windriver.com>
Date: Thu, 7 Mar 2024 16:52:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] dnf: remove log_lock.pid before exit
To: openembedded-core@lists.openembedded.org
References: <20240307064856.879596-1-changqing.li@windriver.com>
 <CANNYZj_Vk4i4MmJ-GQ_ry-VUrNCp7p50fwUZ_QtW2jNyxH8zzg@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj_Vk4i4MmJ-GQ_ry-VUrNCp7p50fwUZ_QtW2jNyxH8zzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::15)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV8PR11MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 15fdc474-e148-4e4e-56d6-08dc3e83e519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nz9W1S2Gpwp/yRLyaAb3YDhNVkT1wKx/xvT+DiHV1dm8IDnKnqp5Y+whVTnouaRrI4Xr58gu65g4upZfSFiEehS/RV9/qpZYy15n8g6XfjwYHy0b5i+jiyeVGyii4v/GlucZSgpfS3gZHqR/R84ftOcT3zI8XvcKCiqdR17GVfQJXLlj3ag4YotdPxJgNiu9EU2Sp4Cn79VDV3KdkF+UIBB0H6a3iAnl9uXtHYHpzMaOspVm23KKzHGqGbPub4XxMEEq6kVJPtklzuJ42eaEQwZgW1Pw0yhoUSbk953nNabLLO6b78kdiiwwo2cSJohJFt6DIem5pPI1+cLOFmik1yhNng+W4TRY6dYtWaJL9VYpc+/QD71FAKTZ7GRl2KYjoF7gwB5Ol2G+VB5CnbfOBr8VtTj6YHRUxmxECGBii1zUUiRl8lp8OtC6gODH9BI3ONkB+cTFmfAIAE0DgxR2Ev9WwtmuLzkHC/QbwUtfpPSDZE3X0B2lK1ibxbiS+BIOi0Q421p6XY2FbkUup2lgmL3UQY8h6rQUShdc3okYKJUJkybSE01ln3TM6nePwcWaYYNlSamCXU49cYBobwSJto7g10BCzoy3/sklSomgsfHnGVCqMDOIaOc77sFgb3X0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SitzcERJbSt6RjlKNnJONzBIbzNqbUdJajh5ZmVhMnJUSzBJQ3YxRXB5Y21W?=
 =?utf-8?B?N0dobGJpUm1YNXRjYzdtVFFlZTNYQzFqRWwwaGxrdUNiTGtkMExnbGNRVnp1?=
 =?utf-8?B?Tkpmd3hQUllGbXFSVlVtRW9JeXJ4c09HTytPa1NUQVk2VTArRGZxMUpzSGpE?=
 =?utf-8?B?TEtOQk1rOGtkZzlBUStXTnhqOFdCc3phaWxKdkJJUUhxT21JZDNISkJuYTd5?=
 =?utf-8?B?cnUwa014bytjVnlKUEZtSnVBY3BKUlN1VGFnSmxBTDhBNW01YThYZWJ5d0dB?=
 =?utf-8?B?R1Y3MENKb1FpU0Vna0FUWDE1eFRXeDAxWFhXNUZlRkhWTjZ4TjZqbnNLQ3hh?=
 =?utf-8?B?QUYvMjdQc1RyQ2VIdmx5ditMWUtrRzQ4TEZYRzBSbm8zL0cvcHhockhpMFBW?=
 =?utf-8?B?TmNMRmltVjl4Q3pTVzNBMis3cDJtN3hoU1EwZVA5T2J4QlZiSXF0Uk9ad0cv?=
 =?utf-8?B?L3M1VDdnOVhoYkJQbERJbFgzSDg0ZlZza0p5eTUySXhnS3AyUU1kS2FVeURm?=
 =?utf-8?B?YlZJdEFwRFlJenJVYUVmMXI5MXpBZmZxYWVKczJoY01FS2FxcnNoNWtsQ3JQ?=
 =?utf-8?B?elNWc1ZKaUs5VWxzMG95c0VPSVRDNlNHRVZaV29wcVV3VnFlYklBUmxXTnlF?=
 =?utf-8?B?Mi8zYjlRYndHY0FhRXNrL1YwY2t4dFEwVDRwVjdWUVJjbGtvRW94QmJrYVEw?=
 =?utf-8?B?Z3NRdEtOUms5Ynk5TmJldnFQemxyYjFreml2R0FyUDRONWI4S2tRRmJSMmRp?=
 =?utf-8?B?azd0Q1JvWDlRUG4vS3FaUFhXcTVFRENuV2lyekFZaFFFVjRER0NSL3ZNYmFt?=
 =?utf-8?B?UGVwbERnMlJBR21EY0RxeFNPSS9MMGV3cnZQYnByTWZxbC9raFJPZ2FPcUlJ?=
 =?utf-8?B?eTBMSEd6VWlORElnQVR2cFJHcmFHY25KYVl4eW1MMXYvQXJVYUxyYXh2UVNv?=
 =?utf-8?B?ZFFrTkdCNjRhTUxMRkUwWWtscEgvK2NYaTQ0c3prVko3eWZGYzBha241YUxq?=
 =?utf-8?B?cnVjTkRrQVp5SDAvQkREdjZvbGp1WTBWbWhUdlAxZ2hPL3dDSWh0Nk9qSFRt?=
 =?utf-8?B?bHY2cUZ6U0V3cnBWUzdSMmV4QkNWcUUvREhHcEkzVEtNRDM3SDhJOEtGQkhC?=
 =?utf-8?B?VmJhMUJGNm1zTktTQUxRTktPclBZUnlhQ0Z3QWxiQnB6Mm12SXdDSlE3bEtL?=
 =?utf-8?B?dG5UZGNHeVJKZlNaaDgvZEJZVXJ3eGMzSjA3ZU1ybDJ2K0NaWUVlMEJZdFBP?=
 =?utf-8?B?Zml3SDA4OTIzYUNLY0hmQmQxdDBkdFlKZGsxem9yY2EyUDRua2N6VjVpWHVG?=
 =?utf-8?B?SnF0VzhhZ2lqMUJucFdQdFJvRmU2OTJhTjNSM2U5QXVneUZQZzA1aGwyeHhQ?=
 =?utf-8?B?aHVweStPZGZKdTZKRmdwbnphQ1c3Q2ZZeTNEZXJUNDVieWdvVjdFdEcxZDJX?=
 =?utf-8?B?WldWWjNwNW1pUHYyQVpwYmltdGx4OXdXamVwTFRSWlZHZVlyRmVKYU5WeXEy?=
 =?utf-8?B?RVNNbVFQeUlHcjJldHlTa1dEVVQyWE05L2tqYWVlc1hxd1pCaFZ5UGg0d1VJ?=
 =?utf-8?B?WmZseVZLbVdjMndpQ0lSNC9aRHNEb2F2cmJEaUdvMUthK1FRV2dac013ZXdl?=
 =?utf-8?B?N1FnMGdyb1hPNzZJYlRqYW5JcFkwVk1jVmdFN0xWekN2ZGp5RWNxNEFIbGN4?=
 =?utf-8?B?Z2R3OWtsOThuNGZhSmR6V0dhSDJLdERPQk1TbmN2K0RnYXVRVlFIQlVuV3dL?=
 =?utf-8?B?U0hnQWVRM2JMUDlnc2dVTTBuLzN6N3pXVmRTRmNlYzFlNERlK0hDR3VydTk2?=
 =?utf-8?B?blYveVRlMEhBc291YTdiQ3lrcThVT3d4MmF4bk1JaENUQU40aHVxRkNKRk4r?=
 =?utf-8?B?elJJV2NHVDJmejJ4Sk42RHF0UlFQWE10cExEanBjeDdPdlJqdGlhclYzUHhR?=
 =?utf-8?B?UzJsQVdMWmZQZGdBK2JKMXFvMHl0ajNmY1VvcDU4NnB4ZlJucXVDbGhRVWJ1?=
 =?utf-8?B?NDBRUVBjL0NtUU80dldNNkQ2eFovSnRRM2M1WG15QVFtajQ0T2c1T25pdzh0?=
 =?utf-8?B?Z2JGUjZPbUdhT0FuUndyNTRnbHhlQ0xyUE05TDZwaWsycjJxdG9JR2VQTUtl?=
 =?utf-8?B?b1NDazEvUEhwL3QrelhpSWpiUVEyN0N2ZExkT25aTFZWSHJ3NGMxdEpxdkJr?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fdc474-e148-4e4e-56d6-08dc3e83e519
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 08:52:18.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olu1AOYuO9fEE9zIxZmM7mlknW/g8JMHYzns5j0ZD13z8o+QBjz5aXb3yYKXPbP4THCKZsRjvbU9+8VglhKNsQpJS6BPI/7C39+clhSO5SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8748
X-Proofpoint-ORIG-GUID: qwWjawuimXXzB3uOG36A8OHKcW1KqSM3
X-Proofpoint-GUID: qwWjawuimXXzB3uOG36A8OHKcW1KqSM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_05,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196779


On 3/7/24 16:14, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Thanks, the patch is ok, but you need to actually open a dnf pull
> request with the patch, and not just the ticket (also 'Submitted'
> means that the patch was actually provided to upstream). It's okay if
> upstream then rejects the patch. We'll at least try to convince them
> :)
>
> Alex

ok, I will send an pull request and send a v2 with the pull request.

Thanks

Changqing

>
> On Thu, 7 Mar 2024 at 07:49, Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> dnf has a bug, refer [1], it causes that log_lock.pid may not removed
>> after dnf exit. And for native dnf, since we change the lock file path
>> to /, it will never be removed, and make the rootfs not clean,refer
>> [2][3].  This patch is a workaround to fix above issue.
>>
>> [1] https://github.com/rpm-software-management/dnf/issues/1963
>> [2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
>> [3] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   ...n.py-remove-log_lock.pid-before-exit.patch | 41 +++++++++++++++++++
>>   meta/recipes-devtools/dnf/dnf_4.18.2.bb       |  3 +-
>>   2 files changed, 43 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
>>
>> diff --git a/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch b/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
>> new file mode 100644
>> index 0000000000..ae036cbbd6
>> --- /dev/null
>> +++ b/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
>> @@ -0,0 +1,41 @@
>> +From bdf17281385cf33ad59267fe75a9e427e6e2ffc4 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 7 Mar 2024 14:03:07 +0800
>> +Subject: [PATCH] main.py: remove log_lock.pid before exit
>> +
>> +dnf has a bug, refer [1], it causes that log_lock.pid may not removed
>> +after dnf exit. And for native dnf, since we change the lock file path
>> +to /, it will never be removed, and make the rootfs not clean,refer
>> +[2][3].  This patch is a workaround to fix above issue.
>> +
>> +[1] https://github.com/rpm-software-management/dnf/issues/1963
>> +[2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
>> +[3] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf
>> +
>> +Upstream-Status: Submited [ report to https://github.com/rpm-software-management/dnf/issues/1963]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + dnf/cli/main.py | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/dnf/cli/main.py b/dnf/cli/main.py
>> +index 2a7f92d54..2f672cff2 100644
>> +--- a/dnf/cli/main.py
>> ++++ b/dnf/cli/main.py
>> +@@ -200,6 +200,12 @@ def user_main(args, exit_code=False):
>> +
>> +     errcode = main(args)
>> +     if exit_code:
>> ++        for arg in args:
>> ++            if arg.startswith("--installroot="):
>> ++                root=arg.split("=")[1]
>> ++                if os.path.exists(os.path.join(root, "log_lock.pid")):
>> ++                    os.unlink(os.path.join(root, "log_lock.pid"))
>> ++                break
>> +         sys.exit(errcode)
>> +     return errcode
>> +
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-devtools/dnf/dnf_4.18.2.bb b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
>> index dc0c18be5e..7770c9d7e0 100644
>> --- a/meta/recipes-devtools/dnf/dnf_4.18.2.bb
>> +++ b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
>> @@ -17,7 +17,8 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
>>              file://0001-set-python-path-for-completion_helper.patch \
>>              "
>>
>> -SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
>> +SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch \
>> +                               file://0001-main.py-remove-log_lock.pid-before-exit.patch"
>>
>>   SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
>>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196776): https://lists.openembedded.org/g/openembedded-core/message/196776
>> Mute This Topic: https://lists.openembedded.org/mt/104782944/3616873
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

