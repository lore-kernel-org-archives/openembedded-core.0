Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EF3C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 02:23:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.36151.1683771806370971974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 19:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4495537150=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34B2LNeV007600
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 02:23:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf8b92895-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 02:23:25 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34B2NPEX011167
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 02:23:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf8b92894-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 02:23:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBXHb5WKyd2eHX1fXw+dPlgJq8CSqOrzJ3QUKNk2VBu/rQzIVWD2L2XXvj/hupBtGOib9ck+LQsWq0V5ueIZa7EBtzHl4Y6xx+Y4rqhKTZzAyRLExpN/Hm67CBMHpaxAeMXKsWe2+mp0ACMgzalTucP+zHI1y4kutPWHAVeFNeDvtuW97gbyKLVCqBvZGOzdbTxQE3JmxSmIR+cwIRHvNOoEkI65AL3rLWPCcYT2lZrn+487ggBmCMIgoa0KjX5y/xn7OybR0AQrcZi2S+MDOI3b4A1+uefVctQvIic6ftg6ukBwGKW6rIKU9Ouo8wRVwBCQdbLFyLhyLaAg5yq/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM4j1PSXnh0M0D7e1pYGscs+M+Ou4YWwoERz0IGD77A=;
 b=gLGuDZw7E9voNiwt77gfDyA/W1FgHORhCMU5R7gFN9litaLIY9nh66gnR+gBmSSHOmi1PXESjpbM93Czn7DxYPfYAand1sUwBHcaTgYkC1hb5UKlvesumZhhQeIr/lQHRmzu+S0Ou45Efw1GwgaZ1JPZXLQI8zKz4ODV/FBs1kxW0i4obBFV/lSGKGJN/oxI+94KTVRjbUSV90WBIxcuiW+0CtOiOPhn/1t336wtiRYTglZujfT40Fm4zxAVWajxM5tHhyIQlroO6a6V57UKp2p3IklvljJNwaIqA3Q7q0Xnn+Z416zdRhfSpoh78Lo9l694Msk7JThtr0qEc7Godg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 02:23:03 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6363.029; Thu, 11 May 2023
 02:23:02 +0000
Message-ID: <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com>
Date: Thu, 11 May 2023 10:22:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::7) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|PH7PR11MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: f5568225-f266-487b-f15c-08db51c6a581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gQYT21LcxWZNKHfYxVh6fcluWSp/dReQy796/4oRW4aO8Rxc7X1GW/GnkR2triYpnv01uZtyYQAC5Q7tEcUmAFeLZqnOXqoza7gzuYfiMz3A+w6fKtW260SD8z7dYT5KjkaQSiq9EHnytlIBLygynXBxQZqnfa9+8JrX8294mTYI3gowc6CXL8iHC4b5wdutmSYByHRzT81EtKXPjDtK3ZSpDUeAJQJvfMkDyOcDfmU129YzYbbm58S95pBHuPBTFUqh55QjQwS3VTInyY1Re1Z62T4ucSUBoaKdD4IVhzNg/jnMJcLB0u7+9y9yEbJM44T+p5jHG7l0GbcHLM572gMd7mjWNj5V4z70YeY/WbiKDJrSHYak3sb4o9Rij3zsUP9/Oan25YwnrsOcKswas+ilGKLYWzTGmXKb+VySYFAp7ihh8Ox41ydk3wLCdndT2hRdjx6IRyWyoYR2MGOQ2z1cFsWalpAZxNMb7l+DTGrPX4wfvz0qYY8FuJSEu9fKmfNMaoZkYNTE0wRj0iCZbN4YM/6yq0/PyJSHGs9hJRmOCydyvpLsoNbojxoYDJC2y9IZBLTQzF2ouEOT2voQe+KevLGZgT0Met6CJ1ogz2ZTwr3kuwmEzh2CXXvP5rw4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(451199021)(8676002)(9686003)(2906002)(83380400001)(6486002)(186003)(53546011)(66476007)(66556008)(4326008)(66946007)(6512007)(41300700001)(316002)(6666004)(110136005)(44832011)(6506007)(26005)(5660300002)(478600001)(8936002)(38100700002)(83170400001)(31696002)(36756003)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFYvMFN3NXpaVUx6WFJ2Vk1Rb1pyMjdUUmtoOWRSQlBuK0wxaG8rNDkyTjJS?=
 =?utf-8?B?U3QxR09reGt5d0RZbjVPV1ozRG9wcVZrSkRXZyttWnNSMHFHbTVmTjVTWVA3?=
 =?utf-8?B?SmtGUDlBQjBtYTIyL0hLTnNtWjdLejc0VHVjbFByS3o4TE9NZitOR2czak5Q?=
 =?utf-8?B?U3BXR1R6OUJmM0ZsOWJ3M2o5RUhBbmRyL0lQdTF6VTY5Z1E2NkpQTHRCSE43?=
 =?utf-8?B?L21ZRE1kYlZGVlgzV0xZaXMzU2VQZkZtWHZLdW1pbGFrL2EzM3d4Ujc0SS80?=
 =?utf-8?B?aHFCaVdtbC9USHpFL0Q5aUwvUGE2TStSMlJSbkxidnBzeHNHTDlTWWRkdkox?=
 =?utf-8?B?WGhVb0pnZlk4Z1JFV0s0bEFtVHdpY1B0eWJpVVZxYUZ4U3JQa0N3bEZva1kv?=
 =?utf-8?B?M29BV1JodmNzVTNjT21DckN6QlU1SitVdHFUWksvbm1PaHFkUjFYQWRBTnor?=
 =?utf-8?B?SFdhNEg3eGgvNGxtK2pUemFua1JpWEY3bUFCTjZZOGluaFhIdkRaOElQODVK?=
 =?utf-8?B?SExGM05qWFBRMkhNbTFMbEpkSnJ2Y3dTTVdsWGVMcW81RUNvbjhmVm1lMW9a?=
 =?utf-8?B?QTVyakpzdGVqR1JiamxKYU9hNTdzVVN3bWV2em1zNlduc2Zmd3ZIN00yVEZL?=
 =?utf-8?B?bFpTTzRHYnBUUDAra1QydCtLSGhIdkRXbFEyeHVMZ0V2VjAvcVBreDhVUE92?=
 =?utf-8?B?cytGcDhUSTNEMGR6eHN0RHRPTE93OC9tY0xjRnVjSGRJT0twN0UxYytYb21C?=
 =?utf-8?B?eUJnekxZNGRPZXdHNXNtVytva2NzR0JJM2NLRzdSdEt4VXA2bVluTXU2VWkx?=
 =?utf-8?B?bHp4VzNJdWVJOFN5TU9CN096aGkySmZyV1g4S3BMTXV0YnZ3VXBNb0FtNEY4?=
 =?utf-8?B?ZGVqRHdhaC9yRmN2YmkwWmxoU1M5Y1JCWFRoMVR4dExYZkdna3NCN3hlUndm?=
 =?utf-8?B?NVdtREFzeTZKVVdJR1YvNzBKZklrbTR2bTY1UU9hMmhlZUErSHJIRWpBUk1y?=
 =?utf-8?B?MUNIRzIrR294dldvRUhGSUtETnNVMkMwSTNqYzdrWldEVUF3eFQ3YVdEY0Y1?=
 =?utf-8?B?WXd2SXVFMWVNZTVwajBIbWpWeVB0TnJlcFFxRk8rYmpVbENEazJiODZyYXhR?=
 =?utf-8?B?SEFvdDhTQSsxeXZ0RE1lRytvVFFaYm9NczdwSnUvOSs3YmJzcjVIT2ZPTVFF?=
 =?utf-8?B?RUtaaDVrd0lvcXp1eGxyNUFyellyM2VaWWlTVm96Q0dKYVg4RTRWNVJ6S3Jr?=
 =?utf-8?B?TDFvekVHWURzdEVxUVJjcDlqMXQ2blJWQWhUNkJuQUlLZkJpbjhYVXZRRHMy?=
 =?utf-8?B?aGVRRzZhck14ZWhIN2NvbExjTzd2WWFOTXgzZ3p0Yk5Jek5wakYyNzY3ZXQ0?=
 =?utf-8?B?UHpKcEUxcGlreWllbk10UEdmMWZPcm14TWJ4Wk9lWS9IR0Juam5LSkxtK1Js?=
 =?utf-8?B?K1A0RGdTeXZ0NFVGaWlJdXpKTFZXV3dVMG9VNENXaHBvcTE0aGJwYWVYWFFR?=
 =?utf-8?B?VXdTQmZKajNmMzU1ZFhqN1ZlMlBoZ09zZ2d4UlNQeUpQdkV2ZHhRTDlaWkR3?=
 =?utf-8?B?bU1yVnZEL3FSaFJ5SjJYY280cklLaG5QUFhOeEJweUVxNHQrZC9nSjlETS9X?=
 =?utf-8?B?WVYyNVp5R2lJbm01RGZ6ZVNBTWwzYzBKZlhOZFczc05MU2Z5czBBR2NGdmlV?=
 =?utf-8?B?TzRFczdBbVZYalo4UXRkN2FaMTJUVEU5NFQxRzB4MnJ2WC8xU2hlRDMyaDY1?=
 =?utf-8?B?RWZOd011TTZtNnNFTFR2WlA0U21nVU55VGFSZ0lONTc2N1lWdjVmbUczdkkr?=
 =?utf-8?B?QTlid3AvbE5FL0ZPOUZMclQwVTN0dU1QS282bU44MWVxbFRoSWlkTFBhRUlQ?=
 =?utf-8?B?RFJEQU4wUHhxNDVuemhYdDExdGdHK2lFTlJ2aVNXdG9paFlJR0pUcWJLNjRW?=
 =?utf-8?B?eVhDSng0N25hQjlEL0hFK1p6TlJTQ2JlMFphb2YxOXAzL2ZNK3Z3KzlZbGhn?=
 =?utf-8?B?VnRqT0FBckNkamxMM3BvdXpFNXFobVNQVC9EeGYyd2FxN2lvVnVwSVpEYndR?=
 =?utf-8?B?T1JrN2l1RzV2YkRZZDhpZXR6cDZXZjkzd3FvbjhvWml1ME56OWc1dzduTGlW?=
 =?utf-8?B?NXA5MXl6MEhRaEZrbGJUN2VNUGFPSjdScG1hUm5ZRHEvSkdNaWo3RzhHRnl4?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5568225-f266-487b-f15c-08db51c6a581
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 02:23:02.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH+UTEuO+COzhPeFtB3SBmhgH9VfDY0iEU5iYB+R6bW3k6KkmJEIjwb7O3KE2zcRa4drxUnaPA4sGiEbvWK6u6sxed8USg7J9ECgrM60PXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
X-Proofpoint-GUID: 9m5UBQhOJ52_nWj2y85c-EyIWSq6Hklp
X-Proofpoint-ORIG-GUID: 5x1wroM_x1ymfojLNojlQkmQE60cYiHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34B2LNeV007600
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 02:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181125

Hi Richard and Bruce,


Thanks for your suggestion,


On 5/11/23 00:25, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>
>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make w=
ould report some
>>> errors due to pahole and elfuitls is missing, since this is a debug o=
ption, so conditionally
>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need en=
able CONFIG_DEBUG_INFO_BTF
>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" in l=
ocal.conf to solve the pahole
>>> and elfutils dependency.
>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with thi=
s
>> option documented somewhere?
>>
>> I also think the mention of devshell in the commit message is
>> misleading, this issue happens regardless of how you enable the option.
>> There are also other ways of enabling this than local.conf, you'd
>> likely not want people doing that at the end of development.
>>
>> I'm curious on Bruce's opinion but to me this at the very least needs =
a
>> commit message rewrite and I'd question whether the docs elsewhere
>> would allow someone to discover this workflow anyway.
> I missed this entirely, thanks for replying to it, or I never would
> have noticed.
>
> This mechanism isn't appropriate for these dependencies. I only added
> it to work around pkgconfig issues (which we can more cleanly solve in
> newer kernels  (see what I've been doing with make-mod-scripts) .. so
> it can eventually be dropped).
>
> We are already enabling elfutils-native conditionally on a
> per-architecture basis (currently only x86-64).
>
> If we need it on more arches now, we should enable it in the version
> specific recipes, or actually, we have moved far enough into newer
> kernel's that it could be in the .inc now.
This commit's background was some kernel debug options needs elfutils=20
and pahole native package, since the issue happens on enabling kernel=20
debug options and not all people needs it, so I conditionally add the=20
dependency in KERNEL_DEBUG_OPTION.

If possible we can enable it in .inc because newer kernel tools like btf=20
are support using pkg-config to locate the libelf instead of finding it=20
from /usr/ folder, so we can use elfutils-natvie instead of installing=20
elfutils package on host PC.

>
> Similarly, we should enable the pahole-native dependency on a per-arch =
basis.
>
> As Richard mentioned, what's the reproducer to see the errors ? it
> must be more than devshell.

Yes, this happens on devshell and normal world if some kernel debug=20
options are enabled. We can reproduce this issue with following steps(I=20
have found the issue with kernel 5.15):

1. enable kernel option CONFIG_DEBUG_KERNEL=C2=A0 CONFIG_DEBUG_INFO and=20
CONFIG_DEBUG_INFO_BTF

2. build the kernel image, the compiler would report missing libelf.h=20
and gelf.h which contains in elfutils-native(this step not happens on=20
x86-64 due to it has been enabled).

3. enable elfutils-native by manual, the kernel source code can be=20
compiled successfully but failed in final step due to missing pahole.


>
> If you can follow up with the steps to reproduce, I can take on the
> refactoring and broader dependency cleanup question, since I can test
> the wider matrix at the same time.

Thanks, my local setup might missing some corner case, this is another=20
reason I enable those native packages limit in KERNEL_DEBUG_OPTION :).


Xiangyu

> Bruce
>
>> Cheers,
>>
>> Richard
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

