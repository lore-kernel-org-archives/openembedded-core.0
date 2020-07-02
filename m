Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.47])
 by mx.groups.io with SMTP id smtpd.web10.3715.1593657789892818438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 19:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TY7ZP6np;
 spf=pass (domain: windriver.com, ip: 40.107.94.47, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj2MFioTEgdNU1KKCUXbzKouocU0l+t2ph/8DAEERIglzIZ93yzhyiS7TfH2wabj9MifdcUqJBMVkHubBuT+GOcDzJWl1VOrBgXbOYCvC9/0mFPli7wRlg6jY2PCNr8u4K/jTf6M3NlOxBVRReyAG9sRbIHlH9JMDNLWA8oTq9eWAzvdscb5EjBdA6NFQeOF2VGaDi0hvp6HwYHflEkioMN5xx+Dy9c6/EkbAviS0tcJleJDvb49LbiK9S2uBdjpvUkCrQZAoLETGcjyYWwxyZdC0rJ6FJH3j1/1ZYeFY8pMNLaBJKnoUmj3lY4vHkMUy2lawxKJPiJHhKO0yETtbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON+r4bR+PglUfO2qDo4Q0R0ceSpQJTh6s1OVwKz3tZg=;
 b=I9y+ykO8AlapOqAeQYSm1QAbMpaoRDcEkm9awtU98t3XjTPpMSgdHNMhBn0fb4Am04rMYpMxs3Qd+2FtemhQ7IUh8vzXrD0jliYvSiFrDtLH+e8CFpLyVJ2Ozo/U7HZN0+gHE2WrPNQ5ENA4NhDUul5KqZrJYnvPLNs9tP+fbXe94nvaytzMW6ApBOgyqZcSbablleIfeeuZH8hfNMOf/JRfa52473pQ7bymkR8e3YwgemtFh92SLAaRYuIgOr7OK6mIVeZ/gJBzZUCtcJJOfgFOxHu/Cklu46JGq/KmJnBhFlKsRusKZhZQwzQHE0NDiexuoZb6VK64SnIike0ZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON+r4bR+PglUfO2qDo4Q0R0ceSpQJTh6s1OVwKz3tZg=;
 b=TY7ZP6npaXH8Ax38attYNDRFYCEeFxsWtOiAsyz0xQ/U3M5rSn5/OTVkT1oYaWFcphwoukNWxMSFzsbRV+M6v2hYQiIPGOcPIX2//89hfmlyo/l31MftbXXILo2pE8WcIPqlYJ2An67GgRTKz5/KPmdqPA1jXdXuN3SXuudqcyU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Thu, 2 Jul
 2020 02:43:08 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3131.030; Thu, 2 Jul 2020
 02:43:08 +0000
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
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <ec894ebd-6116-4e68-04b3-6be656108405@windriver.com>
Date: Thu, 2 Jul 2020 10:43:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CADkTA4NHXAF3Hfm9ryw5OvrM+pFM3FTjQNpvhpGfTyiiYEDb8g@mail.gmail.com>
X-ClientProxiedBy: HK2PR0401CA0016.apcprd04.prod.outlook.com
 (2603:1096:202:2::26) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR0401CA0016.apcprd04.prod.outlook.com (2603:1096:202:2::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Thu, 2 Jul 2020 02:43:06 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 477d3f03-8c64-40de-c2fe-08d81e31a6f2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25989F3D0C1C2045CD29F9F1E46D0@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jS+CRj8u0oevwUQpBoBA+avctJ4wn3Cv1PVt6BrXfgYtrxiNttRgwmeH1WyN35Q3HmzX9Kmay+Y/o6Z411lrvppvk4aB44jB0n4uwMhIieOWChxjYZTXr4731L/EMiD/WiiL2Ns1ZfrgcIArrdlOYZQ88iFLDvNpF9GrovreyuPLhmgDYaO7P5yFKmIuQ/LlSyX6CPLfeyBrCysFBD9J3Dp48qT3F70UCVGmccAbPh6ZssgkwtUO2LmUllzf+m2XvZt85R1l5Io4YFomx1oVSCKH/cBxbKZO5rrOeAcujJrmxlrBr5r0a32oHMP5PVsCMO6fY8ny4lEhmzG82hgZARzeJ9VsrpKN4H1kMe4vdrACt4zJWXN8TaHYj/HrSL/0mjPUc9LiljNUZ5pehkmDUAoLqH6I/ymYvXnChjvm/K9NtTJdzgguskzzvkkXdSXkp0p7caXi74dc8x3TEgrDWr7/pUKGMTT463reIEoUFwu98tTbjy2J7kbRdpnXCrlut+whBTVmUxVB08bq5aj02w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(366004)(376002)(346002)(396003)(8936002)(8676002)(6666004)(83380400001)(6486002)(4326008)(478600001)(66556008)(54906003)(16576012)(316002)(966005)(66476007)(6706004)(66946007)(2906002)(6916009)(53546011)(86362001)(31696002)(52116002)(186003)(16526019)(31686004)(26005)(2616005)(36756003)(5660300002)(956004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iSy7O/Mzt4UlOYLsXDZsdt+nE65bKIaxlpPzfpext+VAxK5gAQWDthKKyElEfSIb4mJtAivw1G90R7JU1p5jA/HC8d1Mkf3CWk+jGxHZRyzerupx6NU9+3BkfGm/DtNNu0e631Jz9Gq+4eeEE+iuO0JKAYA2i2OfbZU7NQfhaX7xV6vj23HIrjqaiWjBJluGQGP4p5I3KCgH7vhCgapKiWxxjQo4X32G0BpTlaKkIaNXYwO7SLuWtXyUin89Qz9DWQ3RpAbRrRLSGfz+LuShOARjE5dCKTyTbnELj+YlBzrMqHBsZsquJ8eMWBh6VnKs+nf9qZLv6BP2CkmG+uv5hrAXdGOlzJMV0GEROwnWXIdAml+QGzLU69BXjCZVpe8PDtlUp6Hn+tL3tZRVPo3Ygw2sGC26UnZxjpLM/BAa7QbifyYe3+TpQwbK/teGivQa0xn5E2djbgTnLH48geDn0J4evUQ2935d1EHg+wt4aBk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477d3f03-8c64-40de-c2fe-08d81e31a6f2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 02:43:07.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhRYiHL6wFW2oyPsRuNV3MpyH5OWmJe+rYg3iNkW6S2HNHIM4lVk5r17GzZvPo2u3goFaYRxdT1uuFaHcdVFow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/1/20 9:42 PM, Bruce Ashfield wrote:
> On Wed, Jul 1, 2020 at 4:22 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote=
:
>>
>>
>>
>> On 6/28/20 8:21 PM, Xu, Yanfei wrote:
>>>
>>>
>>> On 6/25/20 12:18 AM, Richard Purdie wrote:
>>>> On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
>>>>>
>>>>> On 6/24/20 9:08 PM, Richard Purdie wrote:
>>>>>> On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
>>>>>>> On 6/24/20 5:51 AM, Richard Purdie wrote:
>>>>>>>> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
>>>>>>>>> On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com>
>>>>>>>>> wrote:
>>>>>>>>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>>>>>>>>
>>>>>>>>>> Some filesystems don't support symlink, then you will get
>>>>>>>>>> failure
>>>>>>>>>> when
>>>>>>>>>> you install or update the kernel rpm package. Now we use a
>>>>>>>>>> copy
>>>>>>>>>> of
>>>>>>>>>> image for these filesystems instead of symlink.
>>>>>>>>>>
>>>>>>>>>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>>>>>> Suggested-by: Richard Purdie <
>>>>>>>>>> richard.purdie@linuxfoundation.org>
>>>>>>>>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>>>>>>>>> ---
>>>>>>>>>>      meta/classes/kernel.bbclass | 19 ++++++++++++++++---
>>>>>>>>>>      1 file changed, 16 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>>>>>>> b/meta/classes/kernel.bbclass
>>>>>>>>>> index 20a0135fc9..1269b54343 100644
>>>>>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>>>>>> @@ -94,6 +94,22 @@ python __anonymous () {
>>>>>>>>>>              d.appendVar('RDEPENDS_%s-image' % kname, ' %s-
>>>>>>>>>> image-
>>>>>>>>>> %s' %
>>>>>>>>>> (kname, typelower))
>>>>>>>>>>              d.setVar('PKG_%s-image-%s' % (kname,typelower),
>>>>>>>>>> '%s-
>>>>>>>>>> image-
>>>>>>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>>>>>>>>>              d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
>>>>>>>>>> typelower),
>>>>>>>>>> '1')
>>>>>>>>>> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' %
>>>>>>>>>> (kname,typelower), """
>>>>>>>>>
>>>>>>>>> You were previously concerned about boot issues if the
>>>>>>>>> unversioned
>>>>>>>>> image link/copy was deferred until boot. I don't see a
>>>>>>>>> summary of
>>>>>>>>> why
>>>>>>>>> that's no longer a concern in the v3 of the patch. Can you
>>>>>>>>> confirm
>>>>>>>>> that it isn't an issue ? Is it simply because the booted
>>>>>>>>> image
>>>>>>>>> isn't
>>>>>>>>> installed via this package, and hence we are fine ?
>>>>>>>>
>>>>>>>> I'm suspecting this patch is why we're seeing selftest
>>>>>>>> failures:
>>>>>>>>
>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/=
1055
>>>>>>>>
>>>>>>>>
>>>>>>> Do you mean this patch has been applied? and introduce new
>>>>>>> issues?
>>>>>>
>>>>>> Yes, I reverted it and retested and confirmed this patch causes the
>>>>>> selftest failure in the link to the build above.
>>>>>>
>>>>> OK, I am trying to analyse the log. But I haven't figured out what
>>>>> cause
>>>>> it fialed=EF=BC=8C and how to reproduce it on my mechine. I'd appreca=
te any
>>>>> information.
>>>>
>>>> The command to reproduce should be:
>>>>
>>>> oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
>>>>
>>> I've addressed this failure why due to boot partation in wic doesn't
>>> contain no-versioned image. This result is different from the previous
>>> I verified, because of the different configuraions in wks.
>>>
>>> "--source" field in wks decides where the files in boot partation come
>>> from. So no-versioned image may come from ${IMAGE_ROOTFS}/boot which is
>>> installed by rpm package. Blow is the wks used by 'oe-selftest -r
>>> efibootpartition.GenericEFITest.test_boot_efi'
>>>
>>> bootloader --ptable gpt
>>> part /boot --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/boot
>>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid
>>> --overhead-factor 1.0
>>> part / --source rootfs --fstype=3Dext4 --label root --align 1024
>>> --exclude-path boot/
>>>
>>> Hence we still should keep the no-versioned iamge in kernel-image*.rpm
>>> which is like the previous v2 patch.
>>>
>> Any opinions? It does cause the kernel rpm larger. However, the kernel
>> image is not always large, only a few MB. And it will be changed to
>> symlink when installed on targe. So this patch's only negative effect
>> is the little increasement about update payloads.
>=20
> I'm trying to follow the description that you had about the
> oe-selftest and I'm missing something.
>=20
> Can you describe it again ? In a way that someone not familiar with
> that the selftest is seeing as a failure can grok ?
>=20
> i.e. in the selftest configuration are we not getting the
> (un)versioned kernel image because the symlink (or copy fallback) is
> in an on-boot post install hook ? And the test is looking for the
> versioned/unversioned kernel image at image construction time ?
>=20
> So that leaves us at either installing both the versioned and
> unversioned, or some sort of package install time testing of the
> target filesystem ? Does that partition exist at package install time
> ? Is that the approach we tried in v1 of the patch (I know v2 was
> keeping both as copies in the package, and converting it to a symlink
> on boot).

Sorry for the uncleared discription.

For the os-selftest failure: The failure happened at qemu booting with
its wic image. Qemu could not find the unversioned kernel image in wic
image for booting itself ,then caused the test failed.

Why the booted partition in wic image doesn't contain the unversioned
kernel image? Cause the wks can decide where the unversioned kernel
images in wic image comes from. For this test, it comes from
${IMAGE_ROOTFS}/boot which is installed by kernel rpm package. Actually
it didn't get unversioned kernel image because the symlink=EF=BC=88or copy
fallback=EF=BC=89 is in an on-boot post install hook.

Hence we should keep a unversioned kernel image in kernel rpm package.
And patch v2 did it.=EF=BC=88 v1 and v2 are similar, but v2 improves print
messages.=EF=BC=89


Yanfei

>=20
> Bruce
>=20
>>
>> BTW, should I resend the v2 patch?
>>
>> Cheers,
>>
>> Yanfei
>>
>>> Cheers=EF=BC=8C
>>>
>>> Yanfei
>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
