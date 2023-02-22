Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9EFC61DA3
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 00:15:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.311.1677024938829711551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 16:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fI7eCMsH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=141720c701=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LMBMRX019939
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 16:15:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=ORuBDXVA+ADBKRVWS7N22+mJie/K9mDIisGZjHRB3ZQ=;
 b=fI7eCMsHGKrVAEQgKNWUvtS0w5wYfEmvToVYwDg0X6Bd7bQMxHY4Vk7sjUMUtkx9wV6m
 xmHPHHHpgwo59fyd4BO5H6qVF5jFvImTnOLX8h76BVaDUiR/N12/0/0Kh4F5ubScHXNu
 EF/l0bDZlFDH/Uht3PJ4+pWWgc+33DIEw0SY6cdl9sLcORPNmuwaNiV8hLGGAsQuZPC4
 Vg75rM3vvjV0fGENLYW0Cb8KS1L6U+RsyiHjkxzbvanIHUGbMWY1ELTFgP4jc9W31IkT
 RKZgD7ck+4bb4uncjkSD0GCv4jW/KLEDE3QUX/NAV8jIJJRZJgbOi/UrxpR1K+32qKhN eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6u5f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 16:15:38 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M0FbYt005369
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 16:15:37 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6u5f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 16:15:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7lwSR6Y4ojURo19F23WVXOWb5QzCSuBNZ7FR7MT/QXTe0sYw7w64iRliKzWoDdeRDTMq5Xvoink7jK8Zz0LYn2JIAqqPQW13LQeDlJCEVfMkZcXhxrqhGRVztnl8KmGyxo+xdQnQoNfcBaAwWvihh+zoOXWDQvEM3b08xUmms3IDK96OBmLzMO0NNvNRxKRVJ/7jaDz5iJcY5ciECo+H1dOQA2LX830c/mRQ8xobPM1XifuWmgJq8VxlNMDe2CIjObn7Vq8x5iKfLq6fuvX+ovIBds07xsAbu6lRc8v/eIzPXKPAE5VMKWZrOGmEUDrOBD1S9IxValSPbNKbf/1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORuBDXVA+ADBKRVWS7N22+mJie/K9mDIisGZjHRB3ZQ=;
 b=jNE7JKCQVaLnBoYnafViq2BNn/Y0Yy2O0WbQsKDFRAwX/sVZ+NnpwbXoOpHk5J3yR1Arv5gWb6Rd56vqRp54VBr19SWp7FvFGt1uDA8ZjqACjcFhX5D0Dl72CKdEzpMXFrFgqsg36qPnFLy98mJ46PS1zRujOiBV8GXHspjA/e5M71dAvRBuw7GcaYDyn6pPpNNeV78VJ7iFAafzNefQ2ec5NDltTKfdzTnRexPbK+br0aPpS2Bw5/SsFkAjDFDErBd6CnPtTFQMpNuSoQnEbdlIm0Gbk+3E6EhkHBWVWkcBtRCFIlF0fUwIiRZQp570wFjGpsjKZWekmoyC9cRCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB7409.namprd11.prod.outlook.com (2603:10b6:8:153::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 00:15:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 00:15:33 +0000
Content-Type: multipart/alternative;
 boundary="------------rbzOFQzziH4or5vDQGGIQfiU"
Message-ID: <4db5f46c-3f0c-90dd-bbda-ba7a176013e7@windriver.com>
Date: Tue, 21 Feb 2023 19:15:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH 3/3] glibc: backport the fix for CVE-2023-25139
Content-Language: en-CA
To: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>,
        "Shinde, Yash" <yash.shinde@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
References: <20230220162817.180458-1-ross.burton@arm.com>
 <20230220162817.180458-3-ross.burton@arm.com>
 <ACFEBC4F-0692-43CA-A44E-2A4102500C3D@arm.com>
 <CANNYZj84YAwbOwxHzrocBD-Aod7U1nevhfL3-duLB4VChCqk0g@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj84YAwbOwxHzrocBD-Aod7U1nevhfL3-duLB4VChCqk0g@mail.gmail.com>
X-ClientProxiedBy: DS7PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:8:55::10) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 2895d329-34af-4198-03b0-08db1469ea35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jT+52YQF7lMFm5aoD62zwVuxynm5sjmPut5SI5jvU168Tp7DuTUVctDvBl/aXVT62fR5N0OgjuKDaxlu94A3M8l7cb/c/oxQ88o01tOW1K+7jhU5VqAFEBa1wqPMwOUxZd2FZ5hSwhwqyw2+ClwfUW0Ba7P3E/A9qeqQ69a36A+I4noGQOZnd/tUTR8NKhaQni5k5au/PYKpNbVEqdL/1SEs6j7+XzodO9IUbdOZH39sQI2ETbkdZb7OUQfC420izmLUjnQtwyE+g8KvI62VYRGB/9prCeZeKIktFX5DLHyMzTzSj5+x7zmGrxQGR0SPQO36Q+j4OBOjBOxVNlRQa9Ep+iMpDemxThx9C72SAM2Fy4DpS8AFWDCn0X02iu1bly/Bl1+c8ssTKtRJBCi+104RM61LdNBe46NuJLRN2OK0Q0y+h1LmjyXsEK0GtN1hP7YpIYw5g7ALW2vRTPlIMvjHiC0vW4rYD8ITs+/qGtCjhnVBqUfv5kCwCR+EjTZRSOzkoelhtvlQwSRnTppAEyzLzxQjP6EfqPTKU0m689bsUEiOCog00zEWHn6m8i1g+S9/T2092x8iQoEasXI1mdZNyzYhbi4hW3L/v5o9jvH1ElXdSl78mk+hdwCySDzOyFIJa0Fe8vRZrMFqNmNP7/MGhF49zcCr1tI+m6W06kaWGpZFNQ5OGTqfMyuiah3+RTyABaAGx4SDdxhoSbH0zOtnXa9doyOtbHcaBk5GAdW0L2l+8RSfalS8pFZJomORMIAcgvo8L2QF+2PXUMtSNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(366004)(39850400004)(346002)(451199018)(31686004)(66899018)(2616005)(31696002)(110136005)(478600001)(86362001)(4326008)(83380400001)(6636002)(8676002)(166002)(36756003)(2906002)(5660300002)(38100700002)(66476007)(66556008)(66946007)(41300700001)(8936002)(33964004)(26005)(6506007)(53546011)(6486002)(966005)(186003)(316002)(6512007)(30864003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlltTytBMWp5NmFKQkhYK2RETTVIMWR6Y21odFVXM2VJUDBuTjlEODlVb0pa?=
 =?utf-8?B?Vlg0emlqRjd2TUJZZkdVNENQYnRuWmVjNDFwcVNZbENvSk9EcjJQU2tFa0t6?=
 =?utf-8?B?U0hGYUR3azlvbjRNZnlZQTJlV3F1UUtPd3dCdXhtaUp5RGgzK2JWd1g4ZzhF?=
 =?utf-8?B?dDVLYjNaby8rWWw2S1VrUVMvWEFRR2RnbVdGU2U5d0hlcFpBcjU2bFZ3U09j?=
 =?utf-8?B?QXRaT0hIUFY0YXRoNWoyYnJHT2k1OXVFUVRIYjVkV2UwZ2RRcnlxRWdwSkNu?=
 =?utf-8?B?Q0s2VjJiNVpna0lacXB6MnZqV014VFZkT2Qzb3JjRWVNWnhTdDNPK3M2dElm?=
 =?utf-8?B?NmFzSkdZTFpJWk5JaE9yWXEyQzZkcTRRak0rUGk4aXFheHhOVW5JZ3FOZGE4?=
 =?utf-8?B?NktEWjRYNlVmSUtlQkxlV01SQXpCV2ZOMmhXRlNWK0dGK0Z2aW9xSzg1SGtR?=
 =?utf-8?B?YVU5TlhBUG9VT0RmejhwKzJUVCsrUXhGM1dENGNoOGp4VTJkYkNqMEdKUG1C?=
 =?utf-8?B?Y0pwWTROMmJTdWhGOGlIYUxmNzY2MlJoMDZUVkViRndpUnF1QkZjMW1oejNk?=
 =?utf-8?B?QWEvcWw2dW54dXQyVWN6NVhpbWtKbjlpNVlWbTI0UDRVQVZYeW1PTzVxc1Bq?=
 =?utf-8?B?dHFOVjFBeDZNSHpOSkdqZmk2Wm9sNGF2M2RmWkJwYm9IdTVScFhtU3k1c3Vu?=
 =?utf-8?B?VFN1NHRyb2k3K0F4VVoxc0djOHViYXZUbUtHQlh5S0xIaG0vclFWTEpKdkZF?=
 =?utf-8?B?ZFRBaWZYQjRyd2dGaVc4ZmU1emxKZVRYdUVsbnRJaTJONDc3MCtFd2FlZVdl?=
 =?utf-8?B?dXZPMktlNkFuSXZpdnNDVEdXTWhiR0IyWENGTThCU3dMc0VISUoxQ0tabGZ6?=
 =?utf-8?B?S0R3OERFMk16TC80d3lrUCtxNnA5YlVFOVgxR2gvOTFHQVl0elVsUUoyNE9T?=
 =?utf-8?B?VEJyL1FJV3BhZ0xCUnUxdDlvRkFQYldnakhRdHpzLzNScDlmL1Nnek0zR3Nw?=
 =?utf-8?B?NFBsNmNQaHZ4ZTVRdFhld1JlWFRxS3FGVVVKSk9samUwVEluS2RHTUZjV2tI?=
 =?utf-8?B?b2pQWUtBSGRuRFZ3RUFSQ1AyZkl6Qm5sTlhYMUtlVzkraFQrMmNLWERhZUhS?=
 =?utf-8?B?c2EwWFJXSWpOcEhDeHRNRDU0TnNScUxJbXduTnYrZGkrZ1YyNld4Y2tWaTlU?=
 =?utf-8?B?QXFhWUl1eXlTbEZvY3pFNktrWW5aT3I3TzRVR0FqS08wNlhEcDN6QklhR3RC?=
 =?utf-8?B?RWxjQ2tSckI2cnk0Uzg3bGdOTjBnUFpqT1psTUZTL3FHZGVPZURrTWp3K2Va?=
 =?utf-8?B?NXRlTklIRTJCMXkzZE4wYm5SQ3JDYmRJaytIRU9hN1h2cFRYTEVQV3plMXhS?=
 =?utf-8?B?Q2V0SlVRVVVkdC90SEFJbGs1SEt2aG5xSUZPR2pyQ3QrL0lXdm1icVhDdVl4?=
 =?utf-8?B?OHVOdFl6K0VtOUJQbmhDdk85ekRMUnI0WUU0RitWcHZOL0lTQjU1OWVtK0h5?=
 =?utf-8?B?bHNTcElkdUZaMm95eDdjS0s2NTg1akE4RTRBdHBGUEtxZzkvQ3RRV2ZqZGhr?=
 =?utf-8?B?SkJvQ0xrVHpzVkRLZU4xckk1TE9CcEpVM1JOSTN1L3gzUXpLbC9DVHVPeUpy?=
 =?utf-8?B?REg0UU9xUmJnOUVsUDk2WExqbmhKYkw4OVFXbmM0RzZTRVREdmpBMkhUV2Ns?=
 =?utf-8?B?U2tmS09BMGdBNnNKWmhDVnVCOHlpditwazVPWmpuc3l2Yk9WdU44YnMxdkMw?=
 =?utf-8?B?N0hNdG00ZzAzTHFodHQ3OFI5ME1STlNBcWhmWUgrS3QzaGl5enhiOWI2bDlK?=
 =?utf-8?B?RTJUcTBnMnFKOVVSYXdwQUtwdE1jSDJPbURwaVdzSGF4dmlCN09uOE9KSXM4?=
 =?utf-8?B?WTJVbEFZK1JSVEl2VXFCOFZ3R1UwUTNBaHJYZndscFdDM3ljODJWc3VaRk8v?=
 =?utf-8?B?dE5lbzdtclc1NFduTEh5QUc4ZCt5ZzVqajJzMGp3bTBYWEtzakJmK1FKaGZW?=
 =?utf-8?B?TzdnOExVU2p3TG8yVk1DTnNPbVAyMW1YKzdxMmRsbEgybUJyZWtsczh1RWtT?=
 =?utf-8?B?Y3UvOENQMGViM1htL3NpVzdHcnhXaCthUnpKZEE0aEpPRU9RNlFFOVlydlRi?=
 =?utf-8?B?QUkwakkzSkEyYnd1dzZyV0RDaDZNV3Q5U25HWXVnSkJVcDFDY285SXZWQXlv?=
 =?utf-8?Q?GaFGbHLExmYuD2QBTtFnjhA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2895d329-34af-4198-03b0-08db1469ea35
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 00:15:33.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJtVQFcpyIjCTrzDTwfTpg4+gK6BQDeTlV6yXtIV9iED7VyPDB+9nsapWz2D3k+1Iax842Y1wMsIUI9CWaDK0PHub7qXNCzC0h47fiOLC10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7409
X-Proofpoint-ORIG-GUID: _xVSxX4OemaJLyNHciAjYMRriIKP8USp
X-Proofpoint-GUID: srlvV232VvUXIlOKR7AaAIWLfPHLDuCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_13,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302210207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 00:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177550

--------------rbzOFQzziH4or5vDQGGIQfiU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31LMBMRX019939

On 2023-02-20 11:35, Alexander Kanavin via lists.openembedded.org wrote:
> But then the cve should be marked as resolved?

Yash is new to this game.

Yash,

Please submit an update along the lines of:
https://git.openembedded.org/openembedded-core/commit/?id=3Debb0220bf211e=
c1318a0a7f6a9ab80cf7775a848

and next time you bump glibc/gcc/... indicate that the CVE is fixed by=20
setting CVE_CHECK_IGNORE.

../Randy

>
> Alex
>
> On Mon 20. Feb 2023 at 17.34, Ross Burton <ross.burton@arm.com> wrote:
>
>     Ignore this, "glibc: stable 2.37 branch updates=E2=80=9D incorporat=
es it.
>
>     Ross
>
>     > On 20 Feb 2023, at 16:28, Ross Burton via lists.openembedded.org
>     <http://lists.openembedded.org>
>     <ross.burton=3Darm.com@lists.openembedded.org> wrote:
>     >
>     > Signed-off-by: Ross Burton <ross.burton@arm.com>
>     > ---
>     > ...r-grouping-in-printf-width-bug-30068.patch | 84
>     +++++++++++++++++++
>     > meta/recipes-core/glibc/glibc_2.37.bb <http://glibc_2.37.bb> =C2=A0=
 =C2=A0
>     =C2=A0 =C2=A0|=C2=A0 1 +
>     > 2 files changed, 85 insertions(+)
>     > create mode 100644
>     meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-w=
idth-bug-30068.patch
>     >
>     > diff --git
>     a/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf=
-width-bug-30068.patch
>     b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf=
-width-bug-30068.patch
>     > new file mode 100644
>     > index 00000000000..9efd39a9eb4
>     > --- /dev/null
>     > +++
>     b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf=
-width-bug-30068.patch
>     > @@ -0,0 +1,84 @@
>     > +CVE: CVE-2023-25139
>     > +Upstream-Status: Backport
>     > +Signed-off-by: Ross Burton <ross.burton@arm.com>
>     > +
>     > +From 07b9521fc6369d000216b96562ff7c0ed32a16c4 Mon Sep 17
>     00:00:00 2001
>     > +From: Carlos O'Donell <carlos@redhat.com>
>     > +Date: Thu, 19 Jan 2023 12:50:20 +0100
>     > +Subject: [PATCH] Account for grouping in printf width (bug 30068=
)
>     > +
>     > +This is a partial fix for mishandling of grouping when formattin=
g
>     > +integers.=C2=A0 It properly computes the width in the presence o=
f
>     grouping
>     > +characters when the width is larger than the number of significa=
nt
>     > +digits. The precision related issue is documented in bug 23432.
>     > +
>     > +Co-authored-by: Andreas Schwab <schwab@suse.de>
>     > +(cherry picked from commit
>     c980549cc6a1c03c23cc2fe3e7b0fe626a0364b0)
>     > +---
>     > + stdio-common/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 ++
>     > + stdio-common/tst-grouping3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 54
>     +++++++++++++++++++++++++++++
>     > + stdio-common/vfprintf-process-arg.c | 22 +++++++++---
>     > + 3 files changed, 73 insertions(+), 5 deletions(-)
>     > + create mode 100644 stdio-common/tst-grouping3.c
>     > +
>     > +diff --git a/stdio-common/vfprintf-process-arg.c
>     b/stdio-common/vfprintf-process-arg.c
>     > +index 24c9125f9f..8c0fcbcf78 100644
>     > +--- a/stdio-common/vfprintf-process-arg.c
>     > ++++ b/stdio-common/vfprintf-process-arg.c
>     > +@@ -186,11 +186,17 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0=
 /* Unsigned
>     number of base BASE.=C2=A0 */
>     > +=C2=A0 =C2=A0bool octal_marker =3D (prec <=3D number_length && n=
umber.word !=3D 0
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 && alt && base =3D=3D 8);
>     > +
>     > +-=C2=A0 prec =3D MAX (0, prec - (workend - string));
>     > ++=C2=A0 /* At this point prec_inc is the additional bytes requir=
ed
>     for the
>     > ++=C2=A0 =C2=A0 =C2=A0specificed precision.=C2=A0 It is 0 if the =
precision would not
>     have
>     > ++=C2=A0 =C2=A0 =C2=A0required additional bytes i.e. the number o=
f input digits
>     is more
>     > ++=C2=A0 =C2=A0 =C2=A0than the precision.=C2=A0 It is greater tha=
n zero if the
>     precision is
>     > ++=C2=A0 =C2=A0 =C2=A0more than the number of digits without grou=
ping
>     (precision only
>     > ++=C2=A0 =C2=A0 =C2=A0considers digits).=C2=A0 */
>     > ++=C2=A0 unsigned int prec_inc =3D MAX (0, prec - (workend - stri=
ng));
>     > +
>     > +=C2=A0 =C2=A0if (!left)
>     > +=C2=A0 =C2=A0 =C2=A0{
>     > +-=C2=A0 =C2=A0 =C2=A0 width -=3D number_length + prec;
>     > ++=C2=A0 =C2=A0 =C2=A0 width -=3D number_length + prec_inc;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (number.word !=3D 0 && alt && (bas=
e =3D=3D 16 || base =3D=3D 2))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Account for 0X, 0x, 0B or 0=
b hex or binary marker.=C2=A0 */
>     > +@@ -221,7 +227,7 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0=
 /* Unsigned
>     number of base BASE.=C2=A0 */
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_putc (bu=
f, spec);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +-=C2=A0 =C2=A0 =C2=A0 width +=3D prec;
>     > ++=C2=A0 =C2=A0 =C2=A0 width +=3D prec_inc;
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_pad (buf, L_('0'), wid=
th);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (octal_marker)
>     > +@@ -237,6 +243,8 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0=
 /* Unsigned
>     number of base BASE.=C2=A0 */
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +=C2=A0 =C2=A0else
>     > +=C2=A0 =C2=A0 =C2=A0{
>     > ++=C2=A0 =C2=A0 =C2=A0 /* Perform left justification adjustments.=
=C2=A0 */
>     > ++
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_negative)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_putc (bu=
f, L_('-'));
>     > +@@ -263,9 +271,13 @@ LABEL (unsigned_number):=C2=A0 =C2=A0 =C2=A0=
 /* Unsigned
>     number of base BASE.=C2=A0 */
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (octal_marker)
>     > + --width;
>     > +
>     > +-=C2=A0 =C2=A0 =C2=A0 width -=3D workend - string + prec;
>     > ++=C2=A0 =C2=A0 =C2=A0 /* Adjust the width by subtracting the num=
ber of bytes
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required to represent the num=
ber with grouping characters
>     > ++ (NUMBER_LENGTH) and any additional bytes required for
>     > ++ precision.=C2=A0 */
>     > ++=C2=A0 =C2=A0 =C2=A0 width -=3D number_length + prec_inc;
>     > +
>     > +-=C2=A0 =C2=A0 =C2=A0 Xprintf_buffer_pad (buf, L_('0'), prec);
>     > ++=C2=A0 =C2=A0 =C2=A0 Xprintf_buffer_pad (buf, L_('0'), prec_inc=
);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (octal_marker)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xprintf_buffer_putc (buf, L_('=
0'));
>     > +--
>     > +2.34.1
>     > +
>     > diff --git a/meta/recipes-core/glibc/glibc_2.37.bb
>     <http://glibc_2.37.bb> b/meta/recipes-core/glibc/glibc_2.37.bb
>     <http://glibc_2.37.bb>
>     > index f299a3004a4..e5689e536ad 100644
>     > --- a/meta/recipes-core/glibc/glibc_2.37.bb <http://glibc_2.37.bb=
>
>     > +++ b/meta/recipes-core/glibc/glibc_2.37.bb <http://glibc_2.37.bb=
>
>     > @@ -51,6 +51,7 @@ SRC_URI =3D
>     "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>     >
>     file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch=
 \
>     >
>     file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.pa=
tch
>     \
>     >
>     file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.pa=
tch
>     \
>     > + file://0001-Account-for-grouping-in-printf-width-bug-30068.patc=
h \
>     > "
>     > S =3D "${WORKDIR}/git"
>     > B =3D "${WORKDIR}/build-${TARGET_SYS}"
>     > --
>     > 2.34.1
>     >
>     >
>     >
>     >
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177443):https://lists.openembedded.org/g/openembedd=
ed-core/message/177443
> Mute This Topic:https://lists.openembedded.org/mt/97089377/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------rbzOFQzziH4or5vDQGGIQfiU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31LMBMRX019939

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-02-20 11:35, Alexander Kanavin
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj84YAwbOwxHzrocBD-Aod7U1n=
evhfL3-duLB4VChCqk0g@mail.gmail.com">
     =20
      <div dir=3D"auto">But then the cve should be marked as resolved?</d=
iv>
    </blockquote>
    <p>Yash is new to this game.<br>
    </p>
    <p>Yash,&nbsp; <br>
    </p>
    <p>Please submit an update along the lines of:<br>
      &nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/commit/?id=3Debb0220bf211ec1318a0a7f6a9ab80cf7775a848">h=
ttps://git.openembedded.org/openembedded-core/commit/?id=3Debb0220bf211ec=
1318a0a7f6a9ab80cf7775a848</a><br>
    </p>
    <p>and next time you bump glibc/gcc/... indicate that the CVE is
      fixed by setting CVE_CHECK_IGNORE.<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj84YAwbOwxHzrocBD-Aod7U1n=
evhfL3-duLB4VChCqk0g@mail.gmail.com">
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">Alex</div>
      <div dir=3D"auto"><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon 20. Feb 2023 at
            17.34, Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">ross.burton@arm=
.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">Ignore
            this, &quot;glibc: stable 2.37 branch updates=E2=80=9D incorp=
orates it.<br>
            <br>
            Ross<br>
            <br>
            &gt; On 20 Feb 2023, at 16:28, Ross Burton via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">lists.openembedded.org</a>
            &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedde=
d.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">arm.com@lists.openembedded.org</a>&gt;
            wrote:<br>
            &gt; <br>
            &gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.bu=
rton@arm.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt=
-link-freetext">ross.burton@arm.com</a>&gt;<br>
            &gt; ---<br>
            &gt; ...r-grouping-in-printf-width-bug-30068.patch | 84
            +++++++++++++++++++<br>
            &gt; meta/recipes-core/glibc/<a href=3D"http://glibc_2.37.bb"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">glibc_2.37=
.bb</a>&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
            &gt; 2 files changed, 85 insertions(+)<br>
            &gt; create mode 100644
meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width-b=
ug-30068.patch<br>
            &gt; <br>
            &gt; diff --git
a/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width=
-bug-30068.patch
b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width=
-bug-30068.patch<br>
            &gt; new file mode 100644<br>
            &gt; index 00000000000..9efd39a9eb4<br>
            &gt; --- /dev/null<br>
            &gt; +++
b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-width=
-bug-30068.patch<br>
            &gt; @@ -0,0 +1,84 @@<br>
            &gt; +CVE: CVE-2023-25139<br>
            &gt; +Upstream-Status: Backport<br>
            &gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.b=
urton@arm.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">ross.burton@arm.com</a>&gt;<br>
            &gt; +<br>
            &gt; +From 07b9521fc6369d000216b96562ff7c0ed32a16c4 Mon Sep
            17 00:00:00 2001<br>
            &gt; +From: Carlos O'Donell &lt;<a href=3D"mailto:carlos@redh=
at.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">carlos@redhat.com</a>&gt;<br>
            &gt; +Date: Thu, 19 Jan 2023 12:50:20 +0100<br>
            &gt; +Subject: [PATCH] Account for grouping in printf width
            (bug 30068)<br>
            &gt; +<br>
            &gt; +This is a partial fix for mishandling of grouping when
            formatting<br>
            &gt; +integers.&nbsp; It properly computes the width in the
            presence of grouping<br>
            &gt; +characters when the width is larger than the number of
            significant<br>
            &gt; +digits. The precision related issue is documented in
            bug 23432.<br>
            &gt; +<br>
            &gt; +Co-authored-by: Andreas Schwab &lt;<a href=3D"mailto:sc=
hwab@suse.de" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt=
-link-freetext">schwab@suse.de</a>&gt;<br>
            &gt; +(cherry picked from commit
            c980549cc6a1c03c23cc2fe3e7b0fe626a0364b0)<br>
            &gt; +---<br>
            &gt; + stdio-common/Makefile&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;|&nbsp; 2 ++<br>
            &gt; + stdio-common/tst-grouping3.c&nbsp; &nbsp; &nbsp; &nbsp=
; | 54
            +++++++++++++++++++++++++++++<br>
            &gt; + stdio-common/vfprintf-process-arg.c | 22 +++++++++---<=
br>
            &gt; + 3 files changed, 73 insertions(+), 5 deletions(-)<br>
            &gt; + create mode 100644 stdio-common/tst-grouping3.c<br>
            &gt; +<br>
            &gt; +diff --git a/stdio-common/vfprintf-process-arg.c
            b/stdio-common/vfprintf-process-arg.c<br>
            &gt; +index 24c9125f9f..8c0fcbcf78 100644<br>
            &gt; +--- a/stdio-common/vfprintf-process-arg.c<br>
            &gt; ++++ b/stdio-common/vfprintf-process-arg.c<br>
            &gt; +@@ -186,11 +186,17 @@ LABEL (unsigned_number):&nbsp; &n=
bsp; &nbsp; /*
            Unsigned number of base BASE.&nbsp; */<br>
            &gt; +&nbsp; &nbsp;bool octal_marker =3D (prec &lt;=3D number=
_length
            &amp;&amp; number.word !=3D 0<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &amp;&amp; alt &amp;&amp; base
            =3D=3D 8);<br>
            &gt; + <br>
            &gt; +-&nbsp; prec =3D MAX (0, prec - (workend - string));<br=
>
            &gt; ++&nbsp; /* At this point prec_inc is the additional byt=
es
            required for the<br>
            &gt; ++&nbsp; &nbsp; &nbsp;specificed precision.&nbsp; It is =
0 if the precision
            would not have<br>
            &gt; ++&nbsp; &nbsp; &nbsp;required additional bytes i.e. the=
 number of
            input digits is more<br>
            &gt; ++&nbsp; &nbsp; &nbsp;than the precision.&nbsp; It is gr=
eater than zero if
            the precision is<br>
            &gt; ++&nbsp; &nbsp; &nbsp;more than the number of digits wit=
hout grouping
            (precision only<br>
            &gt; ++&nbsp; &nbsp; &nbsp;considers digits).&nbsp; */<br>
            &gt; ++&nbsp; unsigned int prec_inc =3D MAX (0, prec - (worke=
nd -
            string));<br>
            &gt; + <br>
            &gt; +&nbsp; &nbsp;if (!left)<br>
            &gt; +&nbsp; &nbsp; &nbsp;{<br>
            &gt; +-&nbsp; &nbsp; &nbsp; width -=3D number_length + prec;<=
br>
            &gt; ++&nbsp; &nbsp; &nbsp; width -=3D number_length + prec_i=
nc;<br>
            &gt; + <br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (number.word !=3D 0 &amp;=
&amp; alt &amp;&amp;
            (base =3D=3D 16 || base =3D=3D 2))<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Account for 0X, 0x=
, 0B or 0b hex or binary
            marker.&nbsp; */<br>
            &gt; +@@ -221,7 +227,7 @@ LABEL (unsigned_number):&nbsp; &nbs=
p; &nbsp; /*
            Unsigned number of base BASE.&nbsp; */<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Xprintf_buffer=
_putc (buf, spec);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; + <br>
            &gt; +-&nbsp; &nbsp; &nbsp; width +=3D prec;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; width +=3D prec_inc;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;Xprintf_buffer_pad (buf, L_(=
'0'), width);<br>
            &gt; + <br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (octal_marker)<br>
            &gt; +@@ -237,6 +243,8 @@ LABEL (unsigned_number):&nbsp; &nbs=
p; &nbsp; /*
            Unsigned number of base BASE.&nbsp; */<br>
            &gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp;else<br>
            &gt; +&nbsp; &nbsp; &nbsp;{<br>
            &gt; ++&nbsp; &nbsp; &nbsp; /* Perform left justification adj=
ustments.&nbsp; */<br>
            &gt; ++<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (is_negative)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Xprintf_buffer=
_putc (buf, L_('-'));<br>
            &gt; +@@ -263,9 +271,13 @@ LABEL (unsigned_number):&nbsp; &nb=
sp; &nbsp; /*
            Unsigned number of base BASE.&nbsp; */<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (octal_marker)<br>
            &gt; + --width;<br>
            &gt; + <br>
            &gt; +-&nbsp; &nbsp; &nbsp; width -=3D workend - string + pre=
c;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; /* Adjust the width by subtractin=
g the number
            of bytes<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;required to represen=
t the number with
            grouping characters<br>
            &gt; ++ (NUMBER_LENGTH) and any additional bytes required
            for<br>
            &gt; ++ precision.&nbsp; */<br>
            &gt; ++&nbsp; &nbsp; &nbsp; width -=3D number_length + prec_i=
nc;<br>
            &gt; + <br>
            &gt; +-&nbsp; &nbsp; &nbsp; Xprintf_buffer_pad (buf, L_('0'),=
 prec);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; Xprintf_buffer_pad (buf, L_('0'),=
 prec_inc);<br>
            &gt; + <br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (octal_marker)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Xprintf_buffer_putc (=
buf, L_('0'));<br>
            &gt; +-- <br>
            &gt; +2.34.1<br>
            &gt; +<br>
            &gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://g=
libc_2.37.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">glibc_2.37.bb</a>
            b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.37.bb" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">glibc_2.37.bb=
</a><br>
            &gt; index f299a3004a4..e5689e536ad 100644<br>
            &gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.=
37.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">glib=
c_2.37.bb</a><br>
            &gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.=
37.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">glib=
c_2.37.bb</a><br>
            &gt; @@ -51,6 +51,7 @@ SRC_URI =3D&nbsp;
            &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \<b=
r>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0020-tzsele=
ct.ksh-Use-bin-sh-default-shell-interpreter.patch">file://0020-tzselect.k=
sh-Use-bin-sh-default-shell-interpreter.patch</a>
            \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0021-fix-cr=
eate-thread-failed-in-unprivileged-process-BZ-.patch">file://0021-fix-cre=
ate-thread-failed-in-unprivileged-process-BZ-.patch</a>
            \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0022-Avoid-=
hardcoded-build-time-paths-in-the-output-binar.patch">file://0022-Avoid-h=
ardcoded-build-time-paths-in-the-output-binar.patch</a>
            \<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
Account-for-grouping-in-printf-width-bug-30068.patch">file://0001-Account=
-for-grouping-in-printf-width-bug-30068.patch</a>
            \<br>
            &gt; &quot;<br>
            &gt; S =3D &quot;${WORKDIR}/git&quot;<br>
            &gt; B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
            &gt; -- <br>
            &gt; 2.34.1<br>
            &gt; <br>
            &gt; <br>
            &gt; <br>
            &gt; <br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#177443): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/177443">https:/=
/lists.openembedded.org/g/openembedded-core/message/177443</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/97089377/3616765">https://lists.openembedded.org/mt/=
97089377/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------rbzOFQzziH4or5vDQGGIQfiU--

