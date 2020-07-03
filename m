Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web10.2604.1593743353208591861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 19:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nxwhdw/6;
 spf=pass (domain: windriver.com, ip: 40.107.237.66, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fr8bb52/qqZ/XmfGU+fWM+dqS8Sc6dOrKhSgfznc68VWuW4knFZ+Ld5hiOwb4N5YFBT02ImmDh/b1M11hyhU8GmLh6G0VIBBSrS+jnZSV1z1CLp9xReVt8egCAcTLW88OOfe6qTZuVEqbVpBCbgiEBI0PyumadM+gpjFupSqBGuFDgAo8T+IMB1DMgcwXeB+XSm+hrXKQq0+1D3bUlsYD2y4CKbixPfoexcb2BoJDGtnFTW4GnnoMSl5a2kfygtl/F6O3fhpZmvF6NmV7SQAVH9lyABWCLJXyoBRZa7sDIe/oNEeOtduFRiQKvWJHMr59eblQOMZK1RhmtzxbUX5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2m3VCXTuaLjQHzDJIVruAznDQbbqCDyH6KLbEXr+hQ=;
 b=J6++DD/kh8dXqvSc8RNhheyebEBsVfEeGqlKp2vQOgG7oo872Oq/tRuCNnGz4/0fIWqWelAsmOhafbM3QaDHsYWbEY25+WdKnGcS1XCltmJZJZ2KBBp2MrsS/gPvQT8E8jGh8IcLLMKHVVZ96eVwkku5Y8ODyIHY6LE6GCD9rdE7Kzfvq8FqVWm5iL+7pHMJ8/cx98qVn/3DxcJGsOpTyKk6+0+Cdq3F9oz4fcjHjBmkBWdxpa/DCt5B1ftMuibs7vcMl1cI61KbH1KmNEVRV8a+jPc1lhwU151/OIWaax2oWYB0PcADKBeBfBdAUhsT9FU6R6ixAdSpHXH3prC/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2m3VCXTuaLjQHzDJIVruAznDQbbqCDyH6KLbEXr+hQ=;
 b=nxwhdw/6wO0vsLokLuV3MR5MZdW2Lopydgd+aGoc9QBuvaMYeoANjCbPkjgy2P4X8PF2rMeWzIv6r5v+JP5lAcb9GfCQFJW7l6IM6YMeqUnHMtw6LqDv0AMYF7HTgfN7RiqjBtdIuI92kI2anTJkwtdAEg8Fg7TOE9d0VkO2kNY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Fri, 3 Jul
 2020 02:29:11 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3153.027; Fri, 3 Jul 2020
 02:29:10 +0000
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
 <20200619114727.40142-2-yanfei.xu@windriver.com>
 <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
 <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
 <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com>
 <b456775facefdc593552db94bf2de51f5725aa97.camel@linuxfoundation.org>
 <77c7e877-527a-3e39-ad58-2b34c4cffa05@windriver.com>
 <764ae03515c1e73c6eaa394a68b4b98877b38577.camel@linuxfoundation.org>
 <777044a4-8a9b-ea9b-fc05-636caa004c3d@windriver.com>
 <d2119fa2-2d1f-27c6-bf73-055422e6819b@windriver.com>
 <CADkTA4NHXAF3Hfm9ryw5OvrM+pFM3FTjQNpvhpGfTyiiYEDb8g@mail.gmail.com>
 <ec894ebd-6116-4e68-04b3-6be656108405@windriver.com>
 <992d7721671aa464f6a59209d0346a55dc569db6.camel@linuxfoundation.org>
 <ac5b5d5b-13df-5c4b-b293-fd0965e508ff@windriver.com>
 <CADkTA4Nh8n6N-xb=oMe4SUpE_-zX4Sx0gQAFVLz994C9rGip6Q@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <cb48c45f-200b-f94c-880a-4146cdd66b58@windriver.com>
Date: Fri, 3 Jul 2020 10:29:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CADkTA4Nh8n6N-xb=oMe4SUpE_-zX4Sx0gQAFVLz994C9rGip6Q@mail.gmail.com>
X-ClientProxiedBy: HKAPR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:203:c8::23) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HKAPR03CA0018.apcprd03.prod.outlook.com (2603:1096:203:c8::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 02:29:09 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec8bf70-6a63-46f5-a98d-08d81ef8de75
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816E3242CF7099E08E5FAD8E46A0@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fwTCWR73C1joQNHAgIhW4rFxEG2ZYx/0UbRxeDIbYIJPnNOUqpRYfBID57iD8Pct0VLydEr6hzKC6C+oYlIinbwRjYbglrEQOVCsPkQPIjb3FuoqkRmCpmqCeqbPz/0ce+4uLkH4zWM4aMU+br8BdhCZfx2hfxwcqRYHGuzIScYIqpwDmpKRh5+ASAzgT1k4wBFQYEtffsoM8iWV2ikZdH6T+xrzmziJcW7TI2XvpQq7xA6Lho9W1E1A2F7RV7EH3jQXpqNxHPrb+yMYho+mzcf1Yqu9ZdlpAP//pgBK0BSrYd/CtZBfwMegBmtw4V/TKJ4NbneSc6JTS2o+SO56T919X533ZHjhtUb0gVY5sr8MArOoKE1qFHsw41jwduVgCjZp8XkQlMl++rIIoUa5wDusNqlfUo2+yGWWyaulSjwabAYsFg1exhMHOWiRWvnVwuvS7U9opHDphtLOSsegrza9hmBdpNcyQcsadBueRtcHwlB8835Ce3ZUdXTSl8SxHqSlxNu1Bx8GkS52Ki542A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39830400003)(376002)(396003)(346002)(6916009)(8676002)(31696002)(8936002)(16576012)(316002)(478600001)(966005)(2906002)(36756003)(26005)(31686004)(53546011)(54906003)(4326008)(6486002)(6666004)(6706004)(86362001)(66946007)(66556008)(66476007)(83380400001)(956004)(2616005)(52116002)(186003)(5660300002)(16526019)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ts55JRpp+Ed0W0pJ/Ze/qhlKRm9ZzNrqSFeuBrW5cl3CEhPJunYhtTDOYIDKJAgBekPH46RdLrgl4FnpY9C32QlSrFoEd9RewijnZNrwk9TSOhfUe5eT4Oycmb6Mz5wnnmB1RFfQ2nzv0adbCKX/5Xh/J44G1/AkVg+sQq1Y7O2cYb+NFsHArG2/7Uc9iU/fLajEbtL6+T1FR5H221ZFrcHI5ndEcuiD+WajgjQNFonzSiULNwaDB1fUrC41YDNh7bLfMbABfictTxzECyuVCshiy0CTAMc4EuxdVXidFHkhPL9DUfILK+pDRAEyYwYTazk/w0NCx/yv+//BmMUYcYcpDjoK3LQA12O2mK+R6dsJDulRVRzHDxEircqvKwbOddbiBkBRYRD0GrBggLKj8Watbf27eogWavhQwODPIrzxNrOg/AaUzxExdKZuSAdjJMJbhKHV3+HRovYsGFbi2FYft7eGyghTvX21D1fYzXs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec8bf70-6a63-46f5-a98d-08d81ef8de75
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 02:29:10.7650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAgLMxbKZUFNL1ofQEHvzS/UtIABW2o65iPWYBCWLnvhyu6v+q1X2j+6Vn7woqsNZwHUYW4MqkcpVRf0DCRM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/2/20 8:37 PM, Bruce Ashfield wrote:
> On Thu, Jul 2, 2020 at 5:49 AM Xu, Yanfei <yanfei.xu@windriver.com> wrot=
e:
>>
>>
>>
>> On 7/2/20 3:46 PM, Richard Purdie wrote:
>>> On Thu, 2020-07-02 at 10:43 +0800, Xu, Yanfei wrote:
>>>>
>>>> On 7/1/20 9:42 PM, Bruce Ashfield wrote:
>>>>> On Wed, Jul 1, 2020 at 4:22 AM Xu, Yanfei <yanfei.xu@windriver.com>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> On 6/28/20 8:21 PM, Xu, Yanfei wrote:
>>>>>>>
>>>>>>> On 6/25/20 12:18 AM, Richard Purdie wrote:
>>>>>>>> On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
>>>>>>>>> On 6/24/20 9:08 PM, Richard Purdie wrote:
>>>>>>>>>> On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
>>>>>>>>>>> On 6/24/20 5:51 AM, Richard Purdie wrote:
>>>>>>>>>>>> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield
>>>>>>>>>>>> wrote:
>>>>>>>>>>>>> On Fri, Jun 19, 2020 at 7:47 AM <
>>>>>>>>>>>>> yanfei.xu@windriver.com>
>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Some filesystems don't support symlink, then you
>>>>>>>>>>>>>> will get
>>>>>>>>>>>>>> failure
>>>>>>>>>>>>>> when
>>>>>>>>>>>>>> you install or update the kernel rpm package. Now
>>>>>>>>>>>>>> we use a
>>>>>>>>>>>>>> copy
>>>>>>>>>>>>>> of
>>>>>>>>>>>>>> image for these filesystems instead of symlink.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Suggested-by: Bruce Ashfield <
>>>>>>>>>>>>>> bruce.ashfield@gmail.com>
>>>>>>>>>>>>>> Suggested-by: Richard Purdie <
>>>>>>>>>>>>>> richard.purdie@linuxfoundation.org>
>>>>>>>>>>>>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>        meta/classes/kernel.bbclass | 19
>>>>>>>>>>>>>> ++++++++++++++++---
>>>>>>>>>>>>>>        1 file changed, 16 insertions(+), 3
>>>>>>>>>>>>>> deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>>>>>>>>>>> b/meta/classes/kernel.bbclass
>>>>>>>>>>>>>> index 20a0135fc9..1269b54343 100644
>>>>>>>>>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>>>>>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>>>>>>>>>> @@ -94,6 +94,22 @@ python __anonymous () {
>>>>>>>>>>>>>>                d.appendVar('RDEPENDS_%s-image' %
>>>>>>>>>>>>>> kname, ' %s-
>>>>>>>>>>>>>> image-
>>>>>>>>>>>>>> %s' %
>>>>>>>>>>>>>> (kname, typelower))
>>>>>>>>>>>>>>                d.setVar('PKG_%s-image-%s' %
>>>>>>>>>>>>>> (kname,typelower),
>>>>>>>>>>>>>> '%s-
>>>>>>>>>>>>>> image-
>>>>>>>>>>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname,
>>>>>>>>>>>>>> typelower))
>>>>>>>>>>>>>>                d.setVar('ALLOW_EMPTY_%s-image-%s' %
>>>>>>>>>>>>>> (kname,
>>>>>>>>>>>>>> typelower),
>>>>>>>>>>>>>> '1')
>>>>>>>>>>>>>> +        d.setVar('pkg_postinst_ontarget_%s-
>>>>>>>>>>>>>> image-%s' %
>>>>>>>>>>>>>> (kname,typelower), """
>>>>>>>>>>>>>
>>>>>>>>>>>>> You were previously concerned about boot issues if
>>>>>>>>>>>>> the
>>>>>>>>>>>>> unversioned
>>>>>>>>>>>>> image link/copy was deferred until boot. I don't
>>>>>>>>>>>>> see a
>>>>>>>>>>>>> summary of
>>>>>>>>>>>>> why
>>>>>>>>>>>>> that's no longer a concern in the v3 of the patch.
>>>>>>>>>>>>> Can you
>>>>>>>>>>>>> confirm
>>>>>>>>>>>>> that it isn't an issue ? Is it simply because the
>>>>>>>>>>>>> booted
>>>>>>>>>>>>> image
>>>>>>>>>>>>> isn't
>>>>>>>>>>>>> installed via this package, and hence we are fine ?
>>>>>>>>>>>>
>>>>>>>>>>>> I'm suspecting this patch is why we're seeing
>>>>>>>>>>>> selftest
>>>>>>>>>>>> failures:
>>>>>>>>>>>>
>>>>>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/bu=
ilds/1055
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>> Do you mean this patch has been applied? and introduce
>>>>>>>>>>> new
>>>>>>>>>>> issues?
>>>>>>>>>>
>>>>>>>>>> Yes, I reverted it and retested and confirmed this patch
>>>>>>>>>> causes the
>>>>>>>>>> selftest failure in the link to the build above.
>>>>>>>>>>
>>>>>>>>> OK, I am trying to analyse the log. But I haven't figured
>>>>>>>>> out what
>>>>>>>>> cause
>>>>>>>>> it fialed=EF=BC=8C and how to reproduce it on my mechine. I'd
>>>>>>>>> apprecate any
>>>>>>>>> information.
>>>>>>>>
>>>>>>>> The command to reproduce should be:
>>>>>>>>
>>>>>>>> oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
>>>>>>>>
>>>>>>> I've addressed this failure why due to boot partation in wic
>>>>>>> doesn't
>>>>>>> contain no-versioned image. This result is different from the
>>>>>>> previous
>>>>>>> I verified, because of the different configuraions in wks.
>>>>>>>
>>>>>>> "--source" field in wks decides where the files in boot
>>>>>>> partation come
>>>>>>> from. So no-versioned image may come from ${IMAGE_ROOTFS}/boot
>>>>>>> which is
>>>>>>> installed by rpm package. Blow is the wks used by 'oe-selftest
>>>>>>> -r
>>>>>>> efibootpartition.GenericEFITest.test_boot_efi'
>>>>>>>
>>>>>>> bootloader --ptable gpt
>>>>>>> part /boot --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/boot
>>>>>>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid
>>>>>>> --overhead-factor 1.0
>>>>>>> part / --source rootfs --fstype=3Dext4 --label root --align 1024
>>>>>>> --exclude-path boot/
>>>>>>>
>>>>>>> Hence we still should keep the no-versioned iamge in kernel-
>>>>>>> image*.rpm
>>>>>>> which is like the previous v2 patch.
>>>>>>>
>>>>>> Any opinions? It does cause the kernel rpm larger. However, the
>>>>>> kernel
>>>>>> image is not always large, only a few MB. And it will be changed
>>>>>> to
>>>>>> symlink when installed on targe. So this patch's only negative
>>>>>> effect
>>>>>> is the little increasement about update payloads.
>>>>>
>>>>> I'm trying to follow the description that you had about the
>>>>> oe-selftest and I'm missing something.
>>>>>
>>>>> Can you describe it again ? In a way that someone not familiar with
>>>>> that the selftest is seeing as a failure can grok ?
>>>>>
>>>>> i.e. in the selftest configuration are we not getting the
>>>>> (un)versioned kernel image because the symlink (or copy fallback)
>>>>> is
>>>>> in an on-boot post install hook ? And the test is looking for the
>>>>> versioned/unversioned kernel image at image construction time ?
>>>>>
>>>>> So that leaves us at either installing both the versioned and
>>>>> unversioned, or some sort of package install time testing of the
>>>>> target filesystem ? Does that partition exist at package install
>>>>> time
>>>>> ? Is that the approach we tried in v1 of the patch (I know v2 was
>>>>> keeping both as copies in the package, and converting it to a
>>>>> symlink
>>>>> on boot).
>>>>
>>>> Sorry for the uncleared discription.
>>>>
>>>> For the os-selftest failure: The failure happened at qemu booting
>>>> with
>>>> its wic image. Qemu could not find the unversioned kernel image in
>>>> wic
>>>> image for booting itself ,then caused the test failed.
>>>>
>>>> Why the booted partition in wic image doesn't contain the unversioned
>>>> kernel image? Cause the wks can decide where the unversioned kernel
>>>> images in wic image comes from. For this test, it comes from
>>>> ${IMAGE_ROOTFS}/boot which is installed by kernel rpm package.
>>>> Actually
>>>> it didn't get unversioned kernel image because the symlink=EF=BC=88or=
 copy
>>>> fallback=EF=BC=89 is in an on-boot post install hook.
>>>>
>>>> Hence we should keep a unversioned kernel image in kernel rpm
>>>> package.
>>>> And patch v2 did it.=EF=BC=88 v1 and v2 are similar, but v2 improves =
print
>>>> messages.=EF=BC=89
>>>
>>> This does bring us to a bit of an impasse as I don't really like the
>>> idea of duplicating the kernel binaries twice in the packages just to
>>> work around fat filesystem limitations.
>>>
>>> Today its this file, you could argue we have to replace a load more
>>> files with duplicate copies and postinstalls which would seem to be th=
e
>>> wrong direction to go in.
>>
>> Yes, I agree that duplicate copies is not a good way to solve these
>> symlink problems for normal rpm. Users should be awared the
>> disadvantages of vfat filesystem. But kernel rpm maybe more important
>> than others rpm? so we could make its compatibility more all-around?
>>
>>>
>>> Which tools does the extraction of the files onto this fat system?
>>> Could we ignore the symlink errors there and rely on a postinstall to
>>> create if not already created?
>>
>> It may not. Cause if the extraction of the files runs failed, the
>> postinstall of this rpm package won't excute. So...
>=20
> Is that true even if it is a "normal" post install hook (not the
> on-target/boot one, just a standard package post install hook) ?
>=20
> We can programatically create a package post install the same way the
> ontarget one was being created (or at least it was when I last
> checked). Wouldn't that make the /boot partition and filesystem
> available and before wic runs ? So we could have the "try symlink,
> fail to a copy" before anything ever looks for it. It would also cover
> the on-target package upgrade path. My apologies if we've already
> discussed that, and discarded it due to technical issues.

Good idea. I'll try it.

Yanfei
>=20
> Bruce
>=20
>>
>>
>> Cheers,
>>
>> Yanfei
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>=20
>=20
>=20
>=20
>=20
>=20
