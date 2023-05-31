Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC935C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 03:29:39 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.60])
 by mx.groups.io with SMTP id smtpd.web11.5443.1685503779162676108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 20:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=PrTdZmxR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.60, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Imk34VxW7HkJpIE2VsP1omhOBJLzAbnHaM5nbVxQt4GaCg9fTZI4QE/+VLJ2D4RqHqHXiv/iRjimgImpsljV473txUz/A3Nf+ctKm4W2aGc056pAQl+pJCg0kswFPWV5aSIYCulktJZVqSFChp2WR72dAU7ZbSCQPRFkUpJ3N+W+Bci8wqaLvMGWm87y8MftISVPSMkF1N4WHXBh2MMc5dpj3JdxL31fJq2Pr49Ui43CKKLeOzx/ftnJuiT0AOhf8NuVhCy5pNzKeJ9z49mv6BeQoW6DRGsj3qRTIKAXaIKDubVtbqJjVsaFtFKDH6+CTpAWytozie66NxTqzicIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j543l1wz+iVfA9hTJX1TPXBai+pMDkowsNntI+zSqPM=;
 b=kYYJmBIwy0zzMcl+zG9lSuMwVdS17gaQJFX5Gg5HMre6dHjzsjgf7FIWO+96fuLG9tSbSRj+ZRKyZQiC6mIw4QY+4tPG8BqHOrDY4iojEL6ZfKsQxoxHsIxD79IGTE4PXmq1dIh+ZSOf08wibgCGvKHC9cjhxOaWLlmw0IEY8m5mxmOyAIZExoGAW6eMGa3VeRL6eJ86ZULsYOILiDSdQRPFtjPUsVHkGCqj46GLBXMwQ7swH6oqEJxkVI0zVWMdfGj2o7Q8Az5zFv0KdiwAN5uyIxqB5nzeig7LYNNq3gJBpgkw08yn6DMt7b3zeS+ZABX5U5eJxopZZW37YmyY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j543l1wz+iVfA9hTJX1TPXBai+pMDkowsNntI+zSqPM=;
 b=PrTdZmxRN4s7Xga3OU6sbzdU2aOV5LEp2DiHazq71kOw4voXReP4uSOt5kQpfC8TXFlQQXKsP6LKXg3RQdPKBIXv2FNCa6hvUl0OrGnlAAEdV/ecZQ2PpYvJPUcbLhpXcnbY16Rlwbq0WbsJ2BLjVlZ1GNj6VIb0s9XmX7L9/is=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Wed, 31 May
 2023 03:29:36 +0000
Received: from PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::472c:4f29:4645:b7df]) by PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::472c:4f29:4645:b7df%7]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 03:29:36 +0000
Message-ID: <18a6ad82-0872-02da-6f19-b15e028407e4@amd.com>
Date: Tue, 30 May 2023 22:29:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH][pseudo] Move __*xstat* and __xmknod functions to new
 subport 'old__x'
Content-Language: en-US
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org, zhangjialing@loongson.cn
References: <20230531025441.5395-1-mark.hatle@amd.com>
 <20230530221839.2dfa7775@seebsdell>
From: Mark Hatle <mark.hatle@amd.com>
In-Reply-To: <20230530221839.2dfa7775@seebsdell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To PH7PR12MB7018.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7018:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: bff4c6f0-e061-4ef4-9e11-08db6187420e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	23w7P058YLU13QkNZhaxO5/Lp+NMArN1xi9fVE8tiIYlbdWb/sdS/UywyBtFgevjCiyzpjKfgq3NIDsD1m9Ew90N2HNg4HzanlLY+PaEBL4Kmmbao9j9xoUuM+LJat1Si8zZgds7oUdAm5S1HMEMhghQdp9qjLT8N2VMtPNOCVZBPqDS/ShQsHDlDm35JGh49y2zfB2V7X5yvKSPt45P1b+WT7anlqx+U7CBGyVtjvAN6GLrP73yV1QPyMTFTvrKHiPyYDq9uUIrGiVLSdf5Z0vZL5gXOPyy/TiHRW1MHLwA1oLKzu1B8c3lIg5W/vA8otuCPyORUEB4f0NE4aFQnc1fber5F6En5o4tvtjwrKeFn8KyfyMLx7tCmvWxXuQTuFqbVa7lS4arZ7wC+9pQ6Cp8wqUfHG296ghvihgD4YsI/wMXjd70qjZvFHDBJDBFl6vx46i2V3v79QZC/LvI/up8BK/ELgha/MRgCt790nlAxI3wSBsBRzcyltwARf3ydaQZJjvwVnO34DCHHHqVWldxRZ1hAG6QN8Ktv54su8dEPIfhAzcj7cnCAxZL59Sv2Rp8v5S/nG72BiPubn2cWwz5T/VrC4uUFDoQmY0LjzLqwXzT+1l7z9sM5IIkyjciDDdYwpOQknKzfF/GrYjFrkL8mZjszlmiLR0RTOiNhrlfcAG7GLjsAk4vB55vAsRf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7018.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(31696002)(86362001)(6666004)(316002)(5660300002)(66946007)(66556008)(66476007)(6916009)(4326008)(36756003)(6486002)(8936002)(38100700002)(41300700001)(8676002)(2616005)(2906002)(53546011)(6512007)(186003)(6506007)(31686004)(44832011)(478600001)(26005)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1dRZEJnbnVqYnlWSVJ5Qm1qLzBBQnhiTTBzbGVhbkFXeTlqSisrNkhyYmw2?=
 =?utf-8?B?UHJyZ1dJTGVRMEl3N3JhWmFmUU93MVJoVE56L3haaVFRUU02Rkx3NjJ3djFz?=
 =?utf-8?B?ZUprcmtvY2kwZHk2enM2bXNuVTE5WVlYTHVVQndiMlZGNTZyU1E1Rm5BcmFZ?=
 =?utf-8?B?Q0JtSTc4NlB3Tk5EL0Y3ZkMxQ1dnSVpWeWgyUTRLcmU1Qzk5bzNNZTlORlp4?=
 =?utf-8?B?Y1A4cTZaS25qNVhDMFloV0JINU0xUUM5YjF4R24rWVhvUjdaT2FNN3dyVjBu?=
 =?utf-8?B?UStPMlMvNzJwWU53TmlWc0YzL2w4ZENPWGM0bDdTY21xUTVBMy9oWExVOFpY?=
 =?utf-8?B?OVREVEoxeU5MK1VpQk8xYjNLV1NsTG9SdUdzVkxweFY5YkdMbVRnT3E4bUsx?=
 =?utf-8?B?V0hVOWFJNXVURTR4OGxzbmlqUldTd3dza3ZUNkxMajdTKzU3U1o3THM2UjBn?=
 =?utf-8?B?N3ZNelF3RjNDdHViazBDTGNnaHdxMW1LMElBNytEcmF0dEhaa2Roa05ER29V?=
 =?utf-8?B?b1dNNFV1d0tYR1Q5Uy9lM1FTTnlQd2NRTzB2dllKcTFwenQ1elVLZjVwQ2Fz?=
 =?utf-8?B?cDE3Q3UycmRVQjZRVWR3WmdpUmI1cTE5enIzUGh4YmtjalhrdnI4Y3ZZVWpv?=
 =?utf-8?B?aVRIaElwZ29Ba0ZmQytTY0dKV01VOTVrclRidlRMOHU2L3VvS3FhOEhxT2Mx?=
 =?utf-8?B?QTYrYVZuaGUyL2lZeWhHN3Fya0QwZ29XQVA1ZHc2OWZ1T0Z5cUdGVWR0L2RD?=
 =?utf-8?B?dHFZYmt4MFgyRFJpU0hhSHBmYUlMWk9vKy81SFdJd2J2ZmxncFVvWVFab2tT?=
 =?utf-8?B?UjZtMFBCTmRhR3pUclhGazE3WFFoOG5GUFBndE5jYUpjcVRMbnNoQmRQYW1C?=
 =?utf-8?B?N1hZa0MycDhFU0kyOE96MnlneVdxek4rZVAwR3dGa2hxZ3RXLzRLdGtEQlJG?=
 =?utf-8?B?MmdsY2k0cExTSDRyZ01nTGxjbm9VSUN1b1pMWnZacTlkNEdGa1Z4YjJHRGdm?=
 =?utf-8?B?WUhiZGZKN2dsVmU5clNmdldVeGQ4YlNiejU0WnRlZzFhNkdpejc1RWRaZSt4?=
 =?utf-8?B?UFBnQXNKTDdJR040Q1JNWGZXVHZkdGtjUTQ4VUlaanJRNDZrY0RMNmlpVGZ0?=
 =?utf-8?B?aUdSeGdLMEVrRFhkR2pmcHNYSy9hcFIvYVRCRVBGWndGL1l5eDhtY3JHcGZP?=
 =?utf-8?B?S2ZFRVRhcUt1M0JHQlRGSWVRdkVOaFBGTW90SFNhNmR6Y1NkSEs4QjQrMUhz?=
 =?utf-8?B?cElWOSsxbDBVem9ZaVFQdTZmanRQSEg1dGM3cFc1TUR4OVBkWHNLMXhFSGtP?=
 =?utf-8?B?NHNpT0JxQjYyUXU2bGkwM3pHbEhPeTRLTFRQenRaNnFSYnFlc1htbkh3VmRV?=
 =?utf-8?B?eUNjMVdaWGNjd09JTnZjWUVYYkFoSHQvc25LalpQKzRMM1VpUXNhVzZQVm1N?=
 =?utf-8?B?eVppSmpRbmlINm4renpmUHBnTU80Q2VZYmhPTnZwVTdEV1RyYWFBbHdKZWFZ?=
 =?utf-8?B?YUd5a3ZwbXd0OTExcHVUNjhHa0Z2OG1lcHc2NjFxODF0WjQ2K01NNkxKbngy?=
 =?utf-8?B?VHFJRWJxMlNIb3NiRlhXVENKZ0RJck5Uc1llSDZ3emthV25aZTNMVXlZTnQ4?=
 =?utf-8?B?bzRSUDlmM2pyUEQ4K1hOS1BteW5ERkd6dXFyRzIwRFhYd1ZrZU14OHlpMTFl?=
 =?utf-8?B?SC9TRHFJcnh0UzgyRmVvRDJRcHB0OFRrYlJjSlpoTEx6WWdueW5KYndDY2NB?=
 =?utf-8?B?RE4yUHhKUUtMVGtxck1udVIvV2dNTEhCR3RMQlJxWEUvcS9wejVDQ0Roc25T?=
 =?utf-8?B?OVA2dTRYT2UzNEJtazRtYWJMSUlacXBmTmRxVHVqRXE0Y2lydHRRcFVIb1RM?=
 =?utf-8?B?L1RxWWRPdk1qQjhZTVFWU3QzSnJsOWFBTklpeXk4MEVKR0lCSVV2NUpraHc0?=
 =?utf-8?B?Umk4TFVYWjYvc2EvRkxXWEN0V1hSdkdxMWFGekhUY2FGQ1ozcFhzUkszYU5E?=
 =?utf-8?B?NkFJbmh2amNlaXZaMlA3WUlLZ05BdHpONzJYb2NsN3B6K0lMekN0NXVnamUx?=
 =?utf-8?B?WDlWSEk5N1ZHRVArSmxXQi9SUGdGWk5KU1BqY1o1MjdwTnovU0puWmJFZ1ky?=
 =?utf-8?Q?+NROfIEqHYsO++W7iRpwSP6Ds?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff4c6f0-e061-4ef4-9e11-08db6187420e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7018.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 03:29:36.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTlXp+RlScLGXxI6xqpnhhcvpF0GS/uhljteCYGCKvJbhCrzMTCrTJPYZ49y6dvy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 03:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181986



On 5/30/23 10:18 PM, Seebs wrote:
> On Tue, 30 May 2023 19:54:41 -0700
> Mark Hatle <mark.hatle@amd.com> wrote:
> 
>> -	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
>> +	int existed = (base_stat64(path, &buf) != -1);
> 
> Honestly, with the benefit of hindsight, I actually can't even think
> why I ever thought I should be using those directly instead of through
> the base_foo wrappers. Probably for a reason.
> 
> ... Just in case, definitely don't merge this before testing it in
> case there's some insane reason for which the base_* wrappers didn't
> work here.

Ya, it's going to require some soak time in the master-next and various builds I suspect.

...

>> diff --git a/ports/linux/old__x/README b/ports/linux/old__x/README
>> new file mode 100644
>> index 0000000..c94413f
>> --- /dev/null
>> +++ b/ports/linux/old__x/README
>> @@ -0,0 +1,28 @@
>> +Older glibcs contain stat functions such as:
>> +
>> +__fxstat
>> +__fxstatat
>> +__lxstat
>> +__xstat
>> +
>> +__fxstat64
>> +__fxstatat64
>> +__lxstat64
>> +__xstat64
>> +
>> +The format of these functions use the _STAT_VER defintion.  New
>> glibc no +longer define or utilize these functions, so neither can we.
>> +
>> +We only use this subport when the functions are present, this is
>> checked +by with the existence of _STAT_VER.
> 
> "by with the existence"? Looks like a typo.

Ya, I forgot to clean that up, how does this look as a replacement:

Older glibcs contain xstat functions such as:

__fxstat
__fxstatat
__lxstat
__xstat

__fxstat64
__fxstatat64
__lxstat64
__xstat64

These functions are defined when the _STAT_VER is also defined.

Similarly these xmknod functions are also only defined in older glibcs:

__xmknod
__xmknodat

These functions are defind when the _MKNOD_VER is also defined.

This subport is automatically enabled with BOTH _STAT_VER and _MKNOD_VER
are present.  Alternatively if the user force enables subport, it should
work as long as the symbols for these functions are still available.


> Anyway, looks reasonable to me, thanks!
> 
> -s

