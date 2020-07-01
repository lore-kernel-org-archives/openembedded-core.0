Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.78])
 by mx.groups.io with SMTP id smtpd.web12.16817.1593591744099359844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 01:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K6jyZH0R;
 spf=pass (domain: windriver.com, ip: 40.107.94.78, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvgdizdUzupaK8j2kyf6ED2HwL1y8XKjWJVJ+ozH0bw4LVTlkRaxPTqw6a3/Wm9scRlsZg/jht9WjJqanps3LVpeBM4PCp6uaao60OzzV2KDAkMzYY3HvQmgRho8Y3eR9TNQ8YL8u++7XDzB0yoT/o/k3s6VJVm6OiPH1WYgiVzawhkLwnvYu3idU78v/tg63Y46zpAeTTnT2p8MsUyqzvm0L040qqokjpiqz3jDNbSVxvsMlQKkn9v0fPMMQFL7zX81nPwyK0ezLLbVDTrYQ6ONpS0lxoM9OmdbYSNoMVx5hAAzlqeorb9BPj3xyqkNBHXLE0AiKQRkvhKhjPxU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2odS2pS6G3z5ZdQ1WKwx3jdiOb0hR6/RhjYYhC7if9k=;
 b=Ja4T1pi1gbWK1KJitmGeVU+8+ckGI3YecTYZwvp2aQexokN/mDAkVnGiP3341CG8RDJRy0RjB3dth5STJHOM0jBdfWl5ukzpU/wgi66qSv4LmRqjXp73A/ufj8SmHoaLzffTUTPES0sFMeauZn/0AQFyL6ekoW3QNw+fuBF7FENSAMtVWiw8uO6EUZITkQ7gF6YGMZtrsv58Z2j6Iiiw08YuRVX2QdhUw2X7mt1AGvlY1J7SePttY+mGhEfYFoYXaGkl65eGQ1gtGLPwRPpnLYnebs6LoMQC8WEDfmPdPfMynVGRVSUh9AnoX1j/rUc8GB5n1mqdaH1Nhj9g6BkUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2odS2pS6G3z5ZdQ1WKwx3jdiOb0hR6/RhjYYhC7if9k=;
 b=K6jyZH0R4w8w8CGfovV3egrphcew+c4vwu4ZjGufPMCHOSw32ENUig06GS0wcRks1VtscDr09EI3Tce2aypbVWTQGGAlv+QAbTUU773XgJtGkYHY01/INxUF08OjUbIGyedJlSwt5oYnzOpRiC/ic9FUJzW87k7kWfeXyRcpnu4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 08:22:20 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3131.030; Wed, 1 Jul 2020
 08:22:20 +0000
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
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
Message-ID: <d2119fa2-2d1f-27c6-bf73-055422e6819b@windriver.com>
Date: Wed, 1 Jul 2020 16:22:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <777044a4-8a9b-ea9b-fc05-636caa004c3d@windriver.com>
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR02CA0174.apcprd02.prod.outlook.com (2603:1096:201:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 08:22:18 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82aa2ec0-5e9c-487e-3328-08d81d97df7b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4241:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4241D3DF9B76B809B50BEE87E46C0@BY5PR11MB4241.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m/DlLJUMyibzfOAIe72YW+F55gsDuO7mgsO2kmwuomB9mIIeMEyUsHXAnm9aFjRElIQsk+OyMD//BKtKPx9dpIPgaEq9mTfe2iIZWebT4ZB5wjjFQ4EmE1YFMItDnBsOX39uG+1ZBhL0wWAhzvxEyMCxgWIiETefp7Q2Ta8drKBi8nJKJP0vhP4UxO878BxvBdWW9d2B0Hew/fEnTCm7H4MbjpyM4u2KmhJIiKSLX3Lbk21F9vR9UyAvwLstVCcuNRvJssH9Nn576NkCEVWIdtnt6BVCGwkosoaFQRVJ6UnBpQYOc1P0b4g08tc5M+l3S4ZqUQB8sceEg6hcnJWAXoHq+MjK2eEOZqbAkqaSc7mcEL+e1esVxF0b5lWE0vM0kB3vi7wliqbj256Y0XsNPR5tdJL2ZFoTHk5ReX61tJoSu2jGLQAyoPFjbJlqV6MoysQXK8/Cwcqz813nge+hnUkaOYoG7g2gcvUI8wlCO0uUCrrsdvDDA3wONAcBc5YFyjUQQpCZPPmrDN99JpBRvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(6706004)(8676002)(8936002)(6486002)(16576012)(110136005)(2906002)(86362001)(36756003)(31686004)(31696002)(5660300002)(66476007)(6666004)(66556008)(66946007)(83380400001)(53546011)(186003)(16526019)(26005)(52116002)(2616005)(966005)(956004)(498600001)(4326008)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vCfLc/iaChWqIhxYfS+jB0+kawsull+X5TC78dQzI8MPdmnzsmGa/w3m+X/ZQrCG6fTcv0EyTQOY+EvDe3z4zvnAgaRYx4GSyXLA2EqvFV/HLVkeCs5XBAW5rtcm75lXI1WFbSnLTzdeyDmsKFUp4KIMckVqChKj7Y7CVQ+3/fyxOg2/UuUnNycbrNBQh7ESD2zV80yQYGy9OVaT8gBR9aLS39rWog+aFJnIHDicUWMiTZ5zsmd0rTNRY57Fn0reoiMfC+TgENM/xNJLLBX5RLZKxaxu8AI2fwejZ1KGxuRBFTCZeaPHXAtj/KGhNj/W5h5PjqArkPOg4pqRaRmKhJj1y70PVDcah2of2o51FdsP04t7TLRWVHGvi5r+Zah1c5lr99aTrslkFgLjD2r0zLAvdBO8Z6EaLUGlfgFM+RiJxdRTwRP0aUutzs5CRmGrqrgElP2ucBQd5/KCC1oW1t0e+sBZoWdRH8PXzwwCTyk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aa2ec0-5e9c-487e-3328-08d81d97df7b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 08:22:20.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vb6HfvGhgkrq8hirR2yOn/hF1mfk/02mg/NWZRZN09XbSvFxzsduQLnta/QUdhXKdYdEiIoBn4W7F+knOXMtRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4241
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/28/20 8:21 PM, Xu, Yanfei wrote:
>=20
>=20
> On 6/25/20 12:18 AM, Richard Purdie wrote:
>> On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
>>>
>>> On 6/24/20 9:08 PM, Richard Purdie wrote:
>>>> On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
>>>>> On 6/24/20 5:51 AM, Richard Purdie wrote:
>>>>>> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
>>>>>>> On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com>
>>>>>>> wrote:
>>>>>>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>>>>>>
>>>>>>>> Some filesystems don't support symlink, then you will get
>>>>>>>> failure
>>>>>>>> when
>>>>>>>> you install or update the kernel rpm package. Now we use a
>>>>>>>> copy
>>>>>>>> of
>>>>>>>> image for these filesystems instead of symlink.
>>>>>>>>
>>>>>>>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>>>> Suggested-by: Richard Purdie <
>>>>>>>> richard.purdie@linuxfoundation.org>
>>>>>>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>>>>>>> ---
>>>>>>>> =C2=A0=C2=A0=C2=A0 meta/classes/kernel.bbclass | 19 ++++++++++++++=
++---
>>>>>>>> =C2=A0=C2=A0=C2=A0 1 file changed, 16 insertions(+), 3 deletions(-=
)
>>>>>>>>
>>>>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>>>>> b/meta/classes/kernel.bbclass
>>>>>>>> index 20a0135fc9..1269b54343 100644
>>>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>>>> @@ -94,6 +94,22 @@ python __anonymous () {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 d.appendVar('RDEPENDS_%s-image' % kname, ' %s-
>>>>>>>> image-
>>>>>>>> %s' %
>>>>>>>> (kname, typelower))
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 d.setVar('PKG_%s-image-%s' % (kname,typelower),
>>>>>>>> '%s-
>>>>>>>> image-
>>>>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
>>>>>>>> typelower),
>>>>>>>> '1')
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('pkg_postinst=
_ontarget_%s-image-%s' %
>>>>>>>> (kname,typelower), """
>>>>>>>
>>>>>>> You were previously concerned about boot issues if the
>>>>>>> unversioned
>>>>>>> image link/copy was deferred until boot. I don't see a
>>>>>>> summary of
>>>>>>> why
>>>>>>> that's no longer a concern in the v3 of the patch. Can you
>>>>>>> confirm
>>>>>>> that it isn't an issue ? Is it simply because the booted
>>>>>>> image
>>>>>>> isn't
>>>>>>> installed via this package, and hence we are fine ?
>>>>>>
>>>>>> I'm suspecting this patch is why we're seeing selftest
>>>>>> failures:
>>>>>>
>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/10=
55=20
>>>>>>
>>>>>>
>>>>> Do you mean this patch has been applied? and introduce new
>>>>> issues?
>>>>
>>>> Yes, I reverted it and retested and confirmed this patch causes the
>>>> selftest failure in the link to the build above.
>>>>
>>> OK, I am trying to analyse the log. But I haven't figured out what
>>> cause
>>> it fialed=EF=BC=8C and how to reproduce it on my mechine. I'd apprecate=
 any
>>> information.
>>
>> The command to reproduce should be:
>>
>> oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
>>
> I've addressed this failure why due to boot partation in wic doesn't
> contain no-versioned image. This result is different from the previous
> I verified, because of the different configuraions in wks.
>=20
> "--source" field in wks decides where the files in boot partation come
> from. So no-versioned image may come from ${IMAGE_ROOTFS}/boot which is
> installed by rpm package. Blow is the wks used by 'oe-selftest -r=20
> efibootpartition.GenericEFITest.test_boot_efi'
>=20
> bootloader --ptable gpt
> part /boot --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/boot=20
> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid=20
> --overhead-factor 1.0
> part / --source rootfs --fstype=3Dext4 --label root --align 1024=20
> --exclude-path boot/
>=20
> Hence we still should keep the no-versioned iamge in kernel-image*.rpm
> which is like the previous v2 patch.
>=20
Any opinions? It does cause the kernel rpm larger. However, the kernel
image is not always large, only a few MB. And it will be changed to
symlink when installed on targe. So this patch's only negative effect
is the little increasement about update payloads.

BTW, should I resend the v2 patch?

Cheers,

Yanfei

> Cheers=EF=BC=8C
>=20
> Yanfei
>=20
>> Cheers,
>>
>> Richard
>>
