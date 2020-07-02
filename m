Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.54])
 by mx.groups.io with SMTP id smtpd.web12.3122.1593683361401769010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 02:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aArLGEEB;
 spf=pass (domain: windriver.com, ip: 40.107.220.54, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRT/yPOFpgOVhsl+aA1egoJEl1uNn2f31ZhV1X39WlOV9X/UVafgzGaCpGizS+rifNtvOUW/uk46UlxjY3YSjSICtWfC/SZ9xZ93VVmgQFouAxzHfcKtJyvtvEFwIIOzUAoou407HCTjx3Bago4Rfrk3JnvidMmrJwPYquo3EEJ1SQa8DZIvq0jmNz/oxUUtXD5Vw4lnz1bpbM7f1ey8TqIsPbY5/a9UEMfOqsJw3YDNopzapc1Pz0LaxMR55P70Bw95sEcs48t3c45wszXmxG8kfWfW04i+xQVSJs1R+NdA4cvmUlHfzso8YhOLY8oDs8BS4dpxVIkMnNt4KB6WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7MAvYNVF23hmK7Y4fdvh6uoYF/GYrYnkUDaiBmpnJQ=;
 b=aigk8b+BNA4q4vfB9pgItK/YLZqkVdUqTxABgj5Ak0DetsOeoP3Tc8mNCjZk5RkA7k7KZbpOVUAd/dRiPyzA6Vu6xlYQfmtI9MbtsqW0TlM7J0j3+UZd2ZGHg11OCIW4Rzt3HqT7qO+DTAA/ZoO/NodYHk8Qy4e/vWaj105KIQfIJJMf6VnPmWijXiADmhKsRp5rUz/IuqyB25CP9HFPwQIsWfu14bNZ5BGEZmCaQrl6chVRwWdkdoDi7vxa+e9Wxs7TcyTXEVj6rXTqvDzi3AEwiUM4kpBxQg/GzP5PftVDC51xo/3X7c1ZPg6q6/flIPUDUnkSjjHNoNYAv7UGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7MAvYNVF23hmK7Y4fdvh6uoYF/GYrYnkUDaiBmpnJQ=;
 b=aArLGEEBdKZzU4uzewHHuFAQyISyhBq5PVhE5WLfRN9qdcDcgA3GeDshhnlw0ZmN2hpJymSKVGVgfoFTIxFPKvkvmh0Qk5SjaZ1AhH1uLDzMoFc+NEquFcx+yGKti4xeBpDh0SeePWMHwgMLg8wDUDcDm9WnNRF0zZ2cjeoQPk8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4252.namprd11.prod.outlook.com (2603:10b6:5:201::26)
 by DM6PR11MB4475.namprd11.prod.outlook.com (2603:10b6:5:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 2 Jul
 2020 09:49:19 +0000
Received: from DM6PR11MB4252.namprd11.prod.outlook.com
 ([fe80::5537:283f:6cf0:f196]) by DM6PR11MB4252.namprd11.prod.outlook.com
 ([fe80::5537:283f:6cf0:f196%7]) with mapi id 15.20.3153.023; Thu, 2 Jul 2020
 09:49:19 +0000
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
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
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <ac5b5d5b-13df-5c4b-b293-fd0965e508ff@windriver.com>
Date: Thu, 2 Jul 2020 17:49:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <992d7721671aa464f6a59209d0346a55dc569db6.camel@linuxfoundation.org>
X-ClientProxiedBy: BYAPR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:40::28) To DM6PR11MB4252.namprd11.prod.outlook.com
 (2603:10b6:5:201::26)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by BYAPR04CA0015.namprd04.prod.outlook.com (2603:10b6:a03:40::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Thu, 2 Jul 2020 09:49:18 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 462cce24-098f-4fc6-cbc9-08d81e6d30d7
X-MS-TrafficTypeDiagnostic: DM6PR11MB4475:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB44754BF26FEF4A2CA44FFEEBE46D0@DM6PR11MB4475.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I1H4H6l4UydQ2Y0ugUtFkjqQDihPsVTHmGWLdW5LNMlKE1ETZOweAV6f105kf08taFqt4Br0LTeFYG8w4HkTnPZHp6OXDC/Xspp/bW/zNufBdRPcwzH6svdIfagys6/s9c1RNatJ29HSMY9hix8kUbEF2Ve9HKdFy/ltwh/zZCwMFOTRN+OaMjhLimNrw9LUelv72r0jCrPdOY7h8/pyvs6yf5qa7OEaDJeEWQuAp/xP5eNJBpAel4L6Apb/miuV6PEKAWMSMBcCbxsfNXy+URa7tM+z+f2tXexVeEMG3+aktX72tkVmR8MVQzfGPTVEHLUoWfWFlPWnsfVIdjpU6H2ILk8EirJtGFY4IxOAqVLUsCgkX3NFkJ0MuXpxcKN0Z9sK6dPfF3kA/s6btJ1d2j7ufEXjmVRZ3AAUPaUH4IRW8YsaCLk3Vc4POp2e5bbWA0bmJXvukO+qXKb/rKfPr+Xm84u7OD6AIB7QZYjNtJxk1x1Zt/mz4yjisMCQ7hj8H7JAv2wDd4dbNLjuHm0m7Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4252.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(136003)(376002)(39850400004)(366004)(956004)(2616005)(26005)(6486002)(186003)(16576012)(31686004)(316002)(86362001)(110136005)(52116002)(16526019)(6666004)(31696002)(6706004)(2906002)(53546011)(5660300002)(83380400001)(4326008)(8936002)(36756003)(478600001)(8676002)(66476007)(66556008)(66946007)(966005)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+x6KJBylXHlm748XsCNb493RGOC1X1TzrZGNTQWmIvhn0bL6qc1bWE3Am06ERERTwgidoVZ2GZpRbB/vRYI+P4VwwrCr4ptkj5XHJs9aidf3Sxj7LRnSQXM1iMfVOnuqNBB2m+1uXXYTtL/2ZaVQ3Ad79MOQmvew0WkYZM1F330z6YLT3/TRfBc9/RXAIKGnXUJ29BqHDh5a5GwkvOXp/niMkh/sbyKwoVa/3Lnd/ythDIgdDLMASPUou/APYGJUZkLn4dWyf17ryxagplMpgYJRm5w/5P2RVt3D/4zO0gAlqFbfjMzJFxWuIwkTlEG5MWY6enIQ6DhLhgkPYIriwUJUxLwOOFOzzgmZUS85n49Cf4GdhibQ5mpB4DW19GTD9n0YSllvI1+Nr2aRnRzIk7XqbkmRoXQ831aao0OnxduBsKZy+0f0v5poGDPDDju9SB4FtfCptNGTLRigq0GvXLwjVp5HQKpB+tYPC6Paj80=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462cce24-098f-4fc6-cbc9-08d81e6d30d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 09:49:19.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkMoD8/375g2i64OuvTtCnfy4vZCkgDGrtEBV3E+Is4KUdibs2Gsn/l3ASDmurA9PUHrNNNspOQm0EsOcQ+SmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4475
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/2/20 3:46 PM, Richard Purdie wrote:
> On Thu, 2020-07-02 at 10:43 +0800, Xu, Yanfei wrote:
>>
>> On 7/1/20 9:42 PM, Bruce Ashfield wrote:
>>> On Wed, Jul 1, 2020 at 4:22 AM Xu, Yanfei <yanfei.xu@windriver.com>
>>> wrote:
>>>>
>>>>
>>>> On 6/28/20 8:21 PM, Xu, Yanfei wrote:
>>>>>
>>>>> On 6/25/20 12:18 AM, Richard Purdie wrote:
>>>>>> On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
>>>>>>> On 6/24/20 9:08 PM, Richard Purdie wrote:
>>>>>>>> On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
>>>>>>>>> On 6/24/20 5:51 AM, Richard Purdie wrote:
>>>>>>>>>> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield
>>>>>>>>>> wrote:
>>>>>>>>>>> On Fri, Jun 19, 2020 at 7:47 AM <
>>>>>>>>>>> yanfei.xu@windriver.com>
>>>>>>>>>>> wrote:
>>>>>>>>>>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Some filesystems don't support symlink, then you
>>>>>>>>>>>> will get
>>>>>>>>>>>> failure
>>>>>>>>>>>> when
>>>>>>>>>>>> you install or update the kernel rpm package. Now
>>>>>>>>>>>> we use a
>>>>>>>>>>>> copy
>>>>>>>>>>>> of
>>>>>>>>>>>> image for these filesystems instead of symlink.
>>>>>>>>>>>>
>>>>>>>>>>>> Suggested-by: Bruce Ashfield <
>>>>>>>>>>>> bruce.ashfield@gmail.com>
>>>>>>>>>>>> Suggested-by: Richard Purdie <
>>>>>>>>>>>> richard.purdie@linuxfoundation.org>
>>>>>>>>>>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com
>>>>>>>>>>>>>
>>>>>>>>>>>> ---
>>>>>>>>>>>>       meta/classes/kernel.bbclass | 19
>>>>>>>>>>>> ++++++++++++++++---
>>>>>>>>>>>>       1 file changed, 16 insertions(+), 3
>>>>>>>>>>>> deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>>>>>>>>> b/meta/classes/kernel.bbclass
>>>>>>>>>>>> index 20a0135fc9..1269b54343 100644
>>>>>>>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>>>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>>>>>>>> @@ -94,6 +94,22 @@ python __anonymous () {
>>>>>>>>>>>>               d.appendVar('RDEPENDS_%s-image' %
>>>>>>>>>>>> kname, ' %s-
>>>>>>>>>>>> image-
>>>>>>>>>>>> %s' %
>>>>>>>>>>>> (kname, typelower))
>>>>>>>>>>>>               d.setVar('PKG_%s-image-%s' %
>>>>>>>>>>>> (kname,typelower),
>>>>>>>>>>>> '%s-
>>>>>>>>>>>> image-
>>>>>>>>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname,
>>>>>>>>>>>> typelower))
>>>>>>>>>>>>               d.setVar('ALLOW_EMPTY_%s-image-%s' %
>>>>>>>>>>>> (kname,
>>>>>>>>>>>> typelower),
>>>>>>>>>>>> '1')
>>>>>>>>>>>> +        d.setVar('pkg_postinst_ontarget_%s-
>>>>>>>>>>>> image-%s' %
>>>>>>>>>>>> (kname,typelower), """
>>>>>>>>>>>
>>>>>>>>>>> You were previously concerned about boot issues if
>>>>>>>>>>> the
>>>>>>>>>>> unversioned
>>>>>>>>>>> image link/copy was deferred until boot. I don't
>>>>>>>>>>> see a
>>>>>>>>>>> summary of
>>>>>>>>>>> why
>>>>>>>>>>> that's no longer a concern in the v3 of the patch.
>>>>>>>>>>> Can you
>>>>>>>>>>> confirm
>>>>>>>>>>> that it isn't an issue ? Is it simply because the
>>>>>>>>>>> booted
>>>>>>>>>>> image
>>>>>>>>>>> isn't
>>>>>>>>>>> installed via this package, and hence we are fine ?
>>>>>>>>>>
>>>>>>>>>> I'm suspecting this patch is why we're seeing
>>>>>>>>>> selftest
>>>>>>>>>> failures:
>>>>>>>>>>
>>>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/buil=
ds/1055
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>> Do you mean this patch has been applied? and introduce
>>>>>>>>> new
>>>>>>>>> issues?
>>>>>>>>
>>>>>>>> Yes, I reverted it and retested and confirmed this patch
>>>>>>>> causes the
>>>>>>>> selftest failure in the link to the build above.
>>>>>>>>
>>>>>>> OK, I am trying to analyse the log. But I haven't figured
>>>>>>> out what
>>>>>>> cause
>>>>>>> it fialed=EF=BC=8C and how to reproduce it on my mechine. I'd
>>>>>>> apprecate any
>>>>>>> information.
>>>>>>
>>>>>> The command to reproduce should be:
>>>>>>
>>>>>> oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
>>>>>>
>>>>> I've addressed this failure why due to boot partation in wic
>>>>> doesn't
>>>>> contain no-versioned image. This result is different from the
>>>>> previous
>>>>> I verified, because of the different configuraions in wks.
>>>>>
>>>>> "--source" field in wks decides where the files in boot
>>>>> partation come
>>>>> from. So no-versioned image may come from ${IMAGE_ROOTFS}/boot
>>>>> which is
>>>>> installed by rpm package. Blow is the wks used by 'oe-selftest
>>>>> -r
>>>>> efibootpartition.GenericEFITest.test_boot_efi'
>>>>>
>>>>> bootloader --ptable gpt
>>>>> part /boot --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/boot
>>>>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid
>>>>> --overhead-factor 1.0
>>>>> part / --source rootfs --fstype=3Dext4 --label root --align 1024
>>>>> --exclude-path boot/
>>>>>
>>>>> Hence we still should keep the no-versioned iamge in kernel-
>>>>> image*.rpm
>>>>> which is like the previous v2 patch.
>>>>>
>>>> Any opinions? It does cause the kernel rpm larger. However, the
>>>> kernel
>>>> image is not always large, only a few MB. And it will be changed
>>>> to
>>>> symlink when installed on targe. So this patch's only negative
>>>> effect
>>>> is the little increasement about update payloads.
>>>
>>> I'm trying to follow the description that you had about the
>>> oe-selftest and I'm missing something.
>>>
>>> Can you describe it again ? In a way that someone not familiar with
>>> that the selftest is seeing as a failure can grok ?
>>>
>>> i.e. in the selftest configuration are we not getting the
>>> (un)versioned kernel image because the symlink (or copy fallback)
>>> is
>>> in an on-boot post install hook ? And the test is looking for the
>>> versioned/unversioned kernel image at image construction time ?
>>>
>>> So that leaves us at either installing both the versioned and
>>> unversioned, or some sort of package install time testing of the
>>> target filesystem ? Does that partition exist at package install
>>> time
>>> ? Is that the approach we tried in v1 of the patch (I know v2 was
>>> keeping both as copies in the package, and converting it to a
>>> symlink
>>> on boot).
>>
>> Sorry for the uncleared discription.
>>
>> For the os-selftest failure: The failure happened at qemu booting
>> with
>> its wic image. Qemu could not find the unversioned kernel image in
>> wic
>> image for booting itself ,then caused the test failed.
>>
>> Why the booted partition in wic image doesn't contain the unversioned
>> kernel image? Cause the wks can decide where the unversioned kernel
>> images in wic image comes from. For this test, it comes from
>> ${IMAGE_ROOTFS}/boot which is installed by kernel rpm package.
>> Actually
>> it didn't get unversioned kernel image because the symlink=EF=BC=88or c=
opy
>> fallback=EF=BC=89 is in an on-boot post install hook.
>>
>> Hence we should keep a unversioned kernel image in kernel rpm
>> package.
>> And patch v2 did it.=EF=BC=88 v1 and v2 are similar, but v2 improves pr=
int
>> messages.=EF=BC=89
>=20
> This does bring us to a bit of an impasse as I don't really like the
> idea of duplicating the kernel binaries twice in the packages just to
> work around fat filesystem limitations.
>=20
> Today its this file, you could argue we have to replace a load more
> files with duplicate copies and postinstalls which would seem to be the
> wrong direction to go in.

Yes, I agree that duplicate copies is not a good way to solve these
symlink problems for normal rpm. Users should be awared the
disadvantages of vfat filesystem. But kernel rpm maybe more important
than others rpm? so we could make its compatibility more all-around?

>=20
> Which tools does the extraction of the files onto this fat system?
> Could we ignore the symlink errors there and rely on a postinstall to
> create if not already created?

It may not. Cause if the extraction of the files runs failed, the
postinstall of this rpm package won't excute. So...


Cheers,

Yanfei
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
>=20
>=20
