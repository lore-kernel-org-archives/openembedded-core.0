Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.89])
 by mx.groups.io with SMTP id smtpd.web11.16812.1593014273814068933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bkqDjBtl;
 spf=pass (domain: windriver.com, ip: 40.107.76.89, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW8sVZ2TISrUBs9HLpXULkQU3reo5oA0u89u63h8I+VUmJ1yCNa33xn5IvwnBQfU6LzfxTv83DVFl6Zq5FP5mjlo0pAv8RhdpRgT5qnC18hBzXHGYlwfhFnK7bU5uqsq6QNTIJI0Tlzm9hwWJwnEGOucvDYX/gAFlsgI/sr6SVDgH9zY7cTvmWcw3s2t177TPoXk5JRKibIWh0JRalB2s5EjYNuiFI8gM0RJ1JNUhtP9RHNHm+0VmNKdRRR6w/VN9apR8+5ErK4w6bF29pzr72nsoiLYL76A++sJTmRY+0m/BAm/fGd3PjTxzjNicFy2hrWfUzfd8JgrKAYJ3ztQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z52JpnWaltIt6ZpqBIkN3tbJXVz7MbefQTV47ab+Hg=;
 b=G4woU9frCJAotbhe/414ARhGaNRa9I0cvWk/eGu5BV2qYeHYGpZKCf8S/qsI0mCeNlVCw5pF02ny+mPQCKz7udQ621J0pOcJPRkxygRkB+6cBbAvK107k258ZHJdeZhYZ2eiFfDdJZKlxJaeQwGmCSPtw0MekkHBg4LNdITTJacAoHRlaefSEVL1mnGNzKTUlVOd6Av+SbPE0BoO3+qfCzNCbWD2MubbhEYKev64p82WIApIgE7C70ecMU0LAez8RpkK369Bu+82LC0Z283uYzpYMLCDw2sFiE71J8O3j1uZopIYkBYz9b1uv7Fks8fHV8ZXc+6uMR7nch3NAlJV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z52JpnWaltIt6ZpqBIkN3tbJXVz7MbefQTV47ab+Hg=;
 b=bkqDjBtlb6HUsfPa76NUhfmkYssMFr/7QFbvPxGe6tyIfWm7Hi/pZ73n6qEqn2tc2BdqwIjFsLNLDYUWIdCLnbIQgPaXIT1V9Fs8p8jzRV8AA36axnleHEO6oG0PH3ieEJl59mroxfj2MeGtlRLxH+g5YszlEbx1ZTzSpI2vgxM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB2805.namprd11.prod.outlook.com (2603:10b6:a02:c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 24 Jun
 2020 15:57:52 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 15:57:51 +0000
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
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <77c7e877-527a-3e39-ad58-2b34c4cffa05@windriver.com>
Date: Wed, 24 Jun 2020 23:57:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <b456775facefdc593552db94bf2de51f5725aa97.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:202:2e::16) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR06CA0004.apcprd06.prod.outlook.com (2603:1096:202:2e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 15:57:50 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1501d6d1-0f79-4058-3507-08d818575989
X-MS-TrafficTypeDiagnostic: BYAPR11MB2805:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2805729A358E9C1DEFDB2239E4950@BYAPR11MB2805.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wlsEriemnMy8VgBEMyaS8kA8U9P1Kva2yDsbsL7gLjYIEHdybXddgWerO/NXldz1YEmqnD2+p56QtNIW6IeNRvsXoT3T4Pvbcao7ZDU928lxOrsJlItucU7mUNLzJFPltJmWrNn6oXBwt2eRoR34WO2Gr4CSvxQ2rbFRadOhLggdmIVoIrB1fqySPE6RNg1WablEPsovzwKuVs8kVAWsiDfxU6eFh4yxWfKfJ0RzZuh67eWdjrPEiz2oWMp9FOHb3ojIziKXWvQPXroFoFESGcq1XLA2u5THnL17ccLc2IfTU3Mp9Dl6Y/W9xxvv5t3xfukohXGnKdI7i5FujmtOiC8A+MXaWn886mbz9AyUFqJPm1ERDdnEbryRyWazIdEJlCTLQ1gSRDjLgxVPtxLCWGqV/5T33LXA6VFErhEs2d6/NX8z0SOPCbLP1G/cNJLUOPbdBASG31AznWZAgQMpxhNW1lzjRnWIAW1ZZTEXCMth4QKga+O9SPWmrR4v9XWFe+zfhWg02tmTXs2KomQRDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39850400004)(316002)(6666004)(966005)(478600001)(16576012)(86362001)(31696002)(36756003)(31686004)(53546011)(2616005)(956004)(4326008)(2906002)(52116002)(16526019)(186003)(110136005)(26005)(66556008)(5660300002)(8936002)(6486002)(8676002)(66476007)(66946007)(83380400001)(6706004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FxoZ9duUPhi2EXZa5Mhqpt6I+031coudfs2I3qn/ggzDPFzMbvtu5EIbpHRo2VJSvOAY9JAqitoA16RPYrQL95/slrSij159TjIyzkF8XEIATjlWs7BkOORB9MFPA+iLcikH7ACjBR65bT4XePzMOutxG2VX4AbcJvp8SzpDTYtPtom4HPWNg4X2RVTE1gNqeDAuobBMHzg9OPrL+VReFzt2pgPFRiPLCvzyOPQfdTPLFQhv8ywyG7ch76ZpMQ9SK7yfOrGxg6M5RoufD7Zrsb8DlYVOGm9OVCHOhvP6hg/7AGtwUS/gOUKM5zWIL+Os2DP3w9HVYztwmerDpjbk1iLYwBg2j4vNqUifXm2Z/8NGlc2n2LPim5ux1lDSs/TQIuhO2Rr4Z2llo1ELNFT7c0YXwtohoy4laPJSiMlRN8kn+pSAAY6UA1DzZjo8B8aAZRG+GXowfJvhXrwGSebzgN5p1PU+c4XQ2ej2UYfhpkA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1501d6d1-0f79-4058-3507-08d818575989
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 15:57:51.8579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+z/Fz2ZmUQIUYGhhu2t0QhAqLhm6mtB8/IqcTcOjlJQptahud0nogJx6ewGKlZCHlRGkWFs4Qv7dZVskv/OVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2805
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/24/20 9:08 PM, Richard Purdie wrote:
> On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
>>
>> On 6/24/20 5:51 AM, Richard Purdie wrote:
>>> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
>>>> On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com> wrote:
>>>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>>>
>>>>> Some filesystems don't support symlink, then you will get
>>>>> failure
>>>>> when
>>>>> you install or update the kernel rpm package. Now we use a copy
>>>>> of
>>>>> image for these filesystems instead of symlink.
>>>>>
>>>>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>> Suggested-by: Richard Purdie <
>>>>> richard.purdie@linuxfoundation.org>
>>>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>>>> ---
>>>>>    meta/classes/kernel.bbclass | 19 ++++++++++++++++---
>>>>>    1 file changed, 16 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>> b/meta/classes/kernel.bbclass
>>>>> index 20a0135fc9..1269b54343 100644
>>>>> --- a/meta/classes/kernel.bbclass
>>>>> +++ b/meta/classes/kernel.bbclass
>>>>> @@ -94,6 +94,22 @@ python __anonymous () {
>>>>>            d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-
>>>>> %s' %
>>>>> (kname, typelower))
>>>>>            d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-
>>>>> image-
>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>>>>            d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
>>>>> typelower),
>>>>> '1')
>>>>> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' %
>>>>> (kname,typelower), """
>>>>
>>>> You were previously concerned about boot issues if the
>>>> unversioned
>>>> image link/copy was deferred until boot. I don't see a summary of
>>>> why
>>>> that's no longer a concern in the v3 of the patch. Can you
>>>> confirm
>>>> that it isn't an issue ? Is it simply because the booted image
>>>> isn't
>>>> installed via this package, and hence we are fine ?
>>>
>>> I'm suspecting this patch is why we're seeing selftest failures:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1055
>>>
>> Do you mean this patch has been applied? and introduce new issues?
>=20
> Yes, I reverted it and retested and confirmed this patch causes the
> selftest failure in the link to the build above.
>=20
OK, I am trying to analyse the log. But I haven't figured out what cause
it fialed=EF=BC=8C and how to reproduce it on my mechine. I'd apprecate any
information.

Regards=EF=BC=8C
Yanfei

> Cheers,
>=20
> Richard
>=20
