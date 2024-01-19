Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C218C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:16:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21701.1705670205204227437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 05:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bPeYDKbC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JBLAuL012403
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=IVA97aAv+FqWumbklf9
	1DZ+Rey03nTVJC1xB5jCRogs=; b=bPeYDKbCINLXCGBN3UDs1z1dcBkATRBJ3Rc
	o4cLOl1htNlN1Yv7xQ+jTI79aTeOi8Y9WcAVj4wniC8AJerSw8nSnpusW2Zlfpce
	Z77O4fe2lNBlwv9MXlc5EY0OyiV1SCvtmfsHl0tVKKcJcaXGUDRGakz5iDCmk3ZM
	pzbeZJa2TRu5WthkxaiUA5XMNfdldCodGrTWwxi5QV8fjtDJMx6qdPNhrA2ePVE9
	ES/WMMj49UkuoyQgaId80VT934iRPI8v7lRM9Kn2WKsT6b3rP+2c9iGbirAhWrEY
	64rqSKDeISfBYCNEp6rYCP48xzqIOfrxUpAOiZ2l9vO6W34Qcag==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxf2km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:16:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL7CTnP04ahl6Uk1ovQsmXt2mOvFXKlbglSFMVorF96UHvKiWHnRd1m0QfURap4wjHKQ0Rpubdp81lB1Wa9oKhWY9pyoCr8bavM3NqniJj3LLhf5sdUnPnoCxG0vCfdfv9e4bD4oH0P/wA5PPheW+JprEz8YvkUwEKptyTkJeQlVxjywwEJG9cZ+8YkNfUX9W6gdES5wSFLxYsMYLVLj2DVpvoJavJW/rfSjdaVOrKYwfeh6XFc5Adw81jYSsOdOEUJCvJ7qvhMN1fkEhm6vJKuKIaQEsa8nrdtZLlN6Iu5+XB5Ti3QU5fcgvVPiFxHdjF6nmabhS7uH5M8U8aD93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVA97aAv+FqWumbklf91DZ+Rey03nTVJC1xB5jCRogs=;
 b=V7E6U3xcL6TAQV1rp8gMPS97+VsONYSIBiZ8Jk7sLNkVffMpcKgATUn5H8vKEk8+sSKkh5YQ5zp8G2tlRLDI/Tp0kKhp+1xaiezbOSfboc5ty1eKAfV/YS64N2nny37mB6s8FLgdfr+i4amtAxSIXC0IijHOHSB6tF6Fcb118NZPntcJn23uAQk8lF22eBd5peo9VQH6dCFaUdZqVD7h10+0kvKRwnGcroDOCvY1E9AKOzSd9sKNHXEVYZbZ4eW0eqXilhM5FM+li3TsLV21jM2RanbawKisRedMcuzdlQCqgtglMCViwMHpVdvO51SH9gywLKTBik4gxcL81yWnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 13:16:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 13:16:40 +0000
Content-Type: multipart/alternative;
 boundary="------------aXBLnEtSjzOpFIoQSzUX7OHN"
Message-ID: <a49524df-497b-4f03-af1a-bdd5e36a53d8@windriver.com>
Date: Fri, 19 Jan 2024 18:46:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Enable rust oe-selftest
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240118105723.904877-1-Yash.Shinde@windriver.com>
 <4a855ad1-a4c8-4141-9ee8-7b2f5ec0a0a7@windriver.com>
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <4a855ad1-a4c8-4141-9ee8-7b2f5ec0a0a7@windriver.com>
X-ClientProxiedBy: CY5PR15CA0090.namprd15.prod.outlook.com
 (2603:10b6:930:18::8) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c0b803-a085-4b29-0d60-08dc18f0df99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zDfzjJQ4qUwhuSDm2LOJl7VVgl/XPDdB2iYVdAKpmJUexLCFonvZYG2xWU7QyEdXXvEcbwX3hpAFSjpvqEcid+7McpEfq45Omhp55TzNt6LQ3vFx049JS9kaBQWMp3TzU102qRjjM9xJYjr6FID6SEXiIY/t/Pl3Fssv3kor4cbxJ1I2yUvbAXa2YRUFyd0OSMj6aooK3VhuOy9N2tvHxYJXPErrpvPOh1clK3aDWqI9XTtnzibzGFx16OEHpmJ3dUm9V445Dgb1/v4mDXoyKiIWGjZs1r5d+Ty4v6xx8BqdwmVJlD7y8wz3mM5omU4KTmfyYOQGg3knNxOwDeCv4xM3gby6da+mLrF9ihoncaADbVIUIynFGqtNP6Gj380j+KAvK+Cq7YyuA7V3hOSCQhhP2zje3cQmSzpCUwPLHflH7Mb7QdgNRbCQgTn7PikWiXHAjAgO4mRTF4NI8nae7yZ0opzLAx0VFKGJBUzeNfPFpTBlhjtZF9uINar4hLAi7FQX9OsOtOTxf7jtulBSglg6Ma97ZIA7hg1K6Y2HVCpmfrUn23mcFx8sL8hS5aODIj2lThZWQbA+gUdYchDHdzq1DbL9rh93mYjrXbaB43f+OC2T+uPRPzcjYFxqofSU9Gf3JVRxY7Zz+T/8ctwswA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39850400004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(36756003)(31696002)(86362001)(166002)(38100700002)(83380400001)(6486002)(478600001)(6666004)(33964004)(8936002)(4326008)(8676002)(6506007)(316002)(966005)(66946007)(66476007)(66556008)(5660300002)(26005)(2906002)(6512007)(53546011)(2616005)(107886003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zk1iQ0xkSE52RVBjZzJocnhsdDNqNER0QnhzNE1STDJiQUhWSGlhb0VTN3JN?=
 =?utf-8?B?NDhNenV5MnRiQTc3VDFwdG1tVytlY3VJZFFGeXhtV09MaHlMa2tVZDVNV0VX?=
 =?utf-8?B?ZUZqcUdVV0ZxVG96RmZrWmxlSEZIT2hPc3JoNmYwTjhiQVNTMTRDcTdKVUts?=
 =?utf-8?B?QnpYUmtDMHlBQmJ5RE9nSno3SFkxTjdid3pEalFha1JYZDNVcjBVTU9aMS9y?=
 =?utf-8?B?bG45NGFBd25nQ0pEQVIwL0o5MlBJYXZKcXVkVXFvVEVFQXhOY0JIRm9wdDNq?=
 =?utf-8?B?VDZoUVlSbkxralRCRGo1OUlvTHp1SjBJQ1Bvbk5BL29TOXVoaXFpSXNYZmhR?=
 =?utf-8?B?WWsxZ243c3N0bzZ1MHRVWjhUbFFyV2YyYkNnakJlZHNLQXV0c1cyZDlHcDZx?=
 =?utf-8?B?SWNaVkI2SmFjL0xCN3NnNHNVcFBPNktLQm5ITzRpK0hIUUhSVDhjZXhkalB5?=
 =?utf-8?B?cnpVc0Y4d0hQYngyRU95SmVSdmluUkpzWklubGN0bzVoUjl5UG5CT0FOdHBJ?=
 =?utf-8?B?TXYrNEJkNDdjOWkxcUovOGtvd1lQV1VIR3V4NFVaeW5EZ05YMDZtdCtIam9N?=
 =?utf-8?B?NGZwcmt6bkFZTDZ4Q09wTWZ5dTRZVWlzZ2tpQVpVdmU5dEdOMjRtOWd0UGxM?=
 =?utf-8?B?R1ZLM1lYTkh1S3pONDdQVjhMR1BNOTNJelphQ0w1d1BoVm0zUlhpcC93MDR5?=
 =?utf-8?B?ODU3dXhrUEg1VmtpTmszUVhHU3ZzdWNUbEN2RWVhWHpLSTVjclgyZkZ0bDJJ?=
 =?utf-8?B?WTJzSkkvZkdKWnpBV2ZiaVExNkVwb3E3cnRhcmNzaWhMaFI5cmZTYnh0UWxj?=
 =?utf-8?B?bjYvdFU0VFFtN1dSWFRIendIQU13MGRlbFhkYXpOeHovZ0RPZzRrbmt2ZkNG?=
 =?utf-8?B?bkFhWUhOcnNMeXhrQW1rZS9WN3E2YVk1Vk1WN0NCblBXQ2s0ZVAxRzZMYUcr?=
 =?utf-8?B?b24xUTZDWDZFeWZPbmJHcVFYcEZCb2hqa2FIeHVGMjBHUmZKTW5BSnVSN1Nz?=
 =?utf-8?B?NVl3WGRFOHJ3MHNERU5YbW1rSVhmTmRXaEszSUttSllWaEExcElTUUttNXB1?=
 =?utf-8?B?b1F3ZVczU2JjdGxjNFIwaWVLanZ0eEZtODc4ZTA5OFpiWGdsdmgzbGNMVDdr?=
 =?utf-8?B?OFJGWHZ1SkllSHlrWmFaQVJveUc4eUliMVdCazZ1Q1JEazEzSzJodnV2dDkx?=
 =?utf-8?B?ejlpaWVJNlRDRnNwWEdjczR0MHNZNkQ2K0dOMGdKTW5hUjlnTy93K0hlaGpM?=
 =?utf-8?B?YTBxRmk4Uld6TUZkT1FuMnBJc0dYSlBjYU1tNW0rN3VaTnMydGFDbDRTeHk5?=
 =?utf-8?B?WXZKODZ6Nkt3aWtLUDBQdkY4SEt4K2syR3JsS0U4S0NjTndhM1QxTm5jdVlE?=
 =?utf-8?B?QWJ0ZzZCZCs3TGtHZzV6TXRuMWVHeXpHTTFLbG1GTEkyNDNpVExJTFdNbzNx?=
 =?utf-8?B?T3BjeTFrY2k0bkVEck9tcGN2TDYyQ2F3TXh1OGhEMndKWHA5d0dyNExDOVRO?=
 =?utf-8?B?cXZrcGJmTDZJQ1k3WVh0OHJtdERWZGFmc1kyOGZjaTU5Zm1tOXVnSTV5bEVt?=
 =?utf-8?B?NWR6NzAwTTdyaTdsYW51ZXVuOFNOTHlqbW1BMGU3TGFDM0NNQXRCcnlkWUNR?=
 =?utf-8?B?NnY1K2oxUW52aGFvRm5yWitINUdtc1NOeXhnNU8yY1Q5ZXZkRXUvaG80aUxs?=
 =?utf-8?B?RXdNbmtRY2ZUQzhFd1hVVXk1a0ZNcFFIZDBxeWI5dkxGa3c4TFU4NCtCYmF2?=
 =?utf-8?B?eEpMQXRpNHg2NWI3SHVHQWNEaXRzSlM4bTBtb09YY2FOdSs2bkxESWJwbkg4?=
 =?utf-8?B?SkJ3N2JyWWJKWEN3TlFXTFluQWNvUGJTcHVxbytSc2lZa1U4ZXNpdEtqaEMz?=
 =?utf-8?B?R3ZyT0ZhNldYRXhOMEJGRUpPQm81TWFOdGdKdXErMmdSTWNEL2JCZ3UyT0I1?=
 =?utf-8?B?TGhVd2toUG0wQVVKMytoOVNkS2JCRi9jSmUrSTRrQUJkS0pnOFdvYm5XWFZu?=
 =?utf-8?B?Z3BFcWQzNlNMR2FPSFBUWHBHbzVsbWJubGRNMjk1NFE3NDQwMVhPUGZCSytt?=
 =?utf-8?B?VHdEaFIzeEw0Q3JzNmxSbUFrbEJaT09iSVk1Tjd6RkxlRHRMSWZMTU11YXdT?=
 =?utf-8?B?SnErYmt6WTdVcUM5ZWhXR2tLZXBHVlIxYXNVY3JsdXR1TWNqQjBYRk5CTGVt?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c0b803-a085-4b29-0d60-08dc18f0df99
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 13:16:40.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bb9+K2OFGjVWv+YWWsDhZtIOFq80pADQ+HKKHaIk3MLxNnONRc7UibczVyJolOfgI+7ertRZ9faGd/18U84GhL+bvNS5KZxXOVzE9YlHZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
X-Proofpoint-GUID: 8pKrKUPdjOrtbe6rEEJTXoy8aEsnwkPk
X-Proofpoint-ORIG-GUID: 8pKrKUPdjOrtbe6rEEJTXoy8aEsnwkPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_07,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194043

--------------aXBLnEtSjzOpFIoQSzUX7OHN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40JBLAuL012403


On 19-01-2024 01:38, Randy MacLeod wrote:
> On 2024-01-18 5:57 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Enable rust oe-selftest for rust 1.74.1 version and
>> add target_cfg.patch to handle target configurations
>> for custom targets.
>
> Hi Yashe,
>
> Yay, getting the rust test suite working again great news!
>
> We talked about this in today's YP bug review and decided NOT to merge=20
> this
> until after the M2 build is taken care of over the next few days.
>
> That gives me a chance to review the commit and ask some questions! ;-)
>
> First, your commit log should be expanded to explain what has changed=20
> at a high level
> to someone who is just reading "git log".
>
> What you have is a good start but I'd like more info on what changed in=
:
> meta/lib/oeqa/selftest/cases/rust.py
>
> There are lots of tests added to the exclude list and some seem to=20
> have just moved.
>
> Please explain why you did this and if there is any way to avoid the=20
> "noise" of moved tests in future updates. Could you also report on the=20
> number of newly disabled tests and try to summarize in the commit log=20
> what these tests are doing and
>
> Ah, I see what you have done: 1. sort the exclude list 2. add the=20
> newly excluded tests. Please do that in separate commits so that it's=20
> easier to understand. This will reduce the size of the "Enable rust=20
> oe-selftest" diff for meta/lib/oeqa/selftest/cases/rust.py from: | 103=20
> ++++++++----- to: | 37 +++-
>
> and let people easily see that most of the newly excluded tests are in=20
> tests/codegen
>
> That reminds me, do we really need to list directories in that exclude=20
> list or only list .rs files?
>
> If I save the list to /tmp/jj, you can see that we could reduce the=20
> list by 34 lines:
>
> =E2=9D=AF rg "\.rs" /tmp/jj | wc -l 203 =E2=9D=AF rg -v "\.rs" /tmp/jj =
| wc -l 34
>
> If we can do that, again do it as a separate commit since it should=20
> not affect the outcome of the test.
>
>
> Also this backport link:
> https://github.com/rust-lang/rust/pull/119619/commits
> is actually 3 separate commits so it might be better to apply those=20
> individually
> so that we can know when they can be dropped by running:
> $ git tag --contains <commit-id> on each commit
>
> Also in the patches, please add you Signed-Off-By line but keep the=20
> upstream author's S-O-B line.
>
>
I will do patch changes to split into separate commits for each issue=20
fix, and with oe-selftest changes.

Exclude list is sorted and updated w/ module names, and now the module=20
names and test list reduced to 114 lines from 201 lines.

I will send a v2 with updating above changes.

Regards,
Yash

>
> For anyone interested we did talk about the number of Rust tests that=20
> we are excluding and of course our goal is to work with the upstream=20
> Rust community to reduce the number of excluded tests over the coming=20
> months but for now, it's just nice to see the test working again!
>
> If you update these things convince yourself that the changes are=20
> functionally identical, I don't think there's any need to re-do all=20
> the testing that you have done.
>
> Thanks Yash,
>
> ../Randy
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------aXBLnEtSjzOpFIoQSzUX7OHN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40JBLAuL012403

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 19-01-2024 01:38, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:4a855ad1-a4c8-4141-9ee8-7b2f5ec=
0a0a7@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2024-01-18 5:57 a.m., <a class=3D=
"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:Yash.Shin=
de@windriver.com" moz-do-not-send=3D"true">Yash.Shinde@windriver.com</a>
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:20240118105723.904877-1-Yash.=
Shinde@windriver.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Yash Shinde <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com" moz-=
do-not-send=3D"true">&lt;Yash.Shinde@windriver.com&gt;</a>

Enable rust oe-selftest for rust 1.74.1 version and
add target_cfg.patch to handle target configurations
for custom targets.</pre>
      </blockquote>
      <p>Hi Yashe,<br>
      </p>
      <p>Yay, getting the rust test suite working again great news!</p>
      <p>We talked about this in today's YP bug review and decided NOT
        to merge this <br>
        until after the M2 build is taken care of over the next few
        days.<br>
      </p>
      <p>That gives me a chance to review the commit and ask some
        questions! ;-)</p>
      <p>First, your commit log should be expanded to explain what has
        changed at a high level<br>
        to someone who is just reading &quot;git log&quot;.</p>
      <p>What you have is a good start but I'd like more info on what
        changed in:&nbsp; <br>
        <span style=3D"white-space: pre-wrap">   meta/lib/oeqa/selftest/c=
ases/rust.py</span></p>
      <p><span style=3D"white-space: pre-wrap">There are lots of tests ad=
ded to the exclude list and some seem to have just moved.</span></p>
      <p><span style=3D"white-space: pre-wrap">Please explain why you did=
 this and if there is any way to avoid the &quot;noise&quot; of moved
tests in future updates.  Could you also report on the number of newly di=
sabled tests
and try to summarize in the commit log what these tests are doing and=20
</span></p>
      <p><span style=3D"white-space: pre-wrap">Ah, I see what you have do=
ne:
  1. sort the exclude list
  2. add the newly excluded tests.

Please do that in separate commits so that it's easier to understand.
This will reduce the size of the &quot;Enable rust oe-selftest&quot; diff=
 for=20
</span><span style=3D"white-space: pre-wrap">
meta/lib/oeqa/selftest/cases/rust.py
</span><span style=3D"white-space: pre-wrap">   from:          | 103 ++++=
++++-----
</span><span style=3D"white-space: pre-wrap">   to:            |  37 +++-=
</span></p>
      <p>a<span style=3D"white-space: pre-wrap">nd let people easily see =
that most of the newly excluded tests are in tests/codegen </span></p>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:4a855ad1-a4c8-4141-9ee8-7b2f5ec=
0a0a7@windriver.com">
      <p><span style=3D"white-space: pre-wrap">That reminds me, do we rea=
lly need to list directories in that exclude list or
only list .rs files?</span></p>
      <p><span style=3D"white-space: pre-wrap">If I save the list to /tmp=
/jj, you can see that we could reduce the list by 34 lines:</span></p>
      <p><span style=3D"white-space: pre-wrap">
=E2=9D=AF rg  &quot;\.rs&quot; /tmp/jj  | wc -l
203

=E2=9D=AF rg  -v &quot;\.rs&quot; /tmp/jj  | wc -l
34
</span></p>
      <p><span style=3D"white-space: pre-wrap">If we can do that, again d=
o it as a separate commit since it should not affect the outcome
of the test.</span></p>
      <p><br>
      </p>
      <p>Also this backport link:<br>
        &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://g=
ithub.com/rust-lang/rust/pull/119619/commits" moz-do-not-send=3D"true">ht=
tps://github.com/rust-lang/rust/pull/119619/commits</a><br>
        is actually 3 separate commits so it might be better to apply
        those individually<br>
        so that we can know when they can be dropped by running:<br>
        $ git tag --contains &lt;commit-id&gt; on each commit<br>
      </p>
      <p>Also in the patches, please add you Signed-Off-By line but keep
        the upstream author's S-O-B line.<br>
      </p>
      <p><br>
      </p>
    </blockquote>
    <p>I will do patch changes to split into separate commits for each
      issue fix, and with oe-selftest changes.<br>
    </p>
    <p>Exclude list is sorted and updated w/ module names, and now the
      module names and test list reduced to 114 lines from 201 lines.</p>
    <p>I will send a v2 with updating above changes.&nbsp; <br>
      <br>
      Regards,<br>
      Yash<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:4a855ad1-a4c8-4141-9ee8-7b2f5ec=
0a0a7@windriver.com">
      <p> </p>
      <p><br>
      </p>
      <p><span style=3D"white-space: pre-wrap">For anyone interested we d=
id talk about the number of Rust tests that we are
excluding and of course our goal is to work with the upstream Rust commun=
ity
to reduce the number of excluded tests over the coming months but for now=
,
it's just nice to see the test working again!</span></p>
      <p><span style=3D"white-space: pre-wrap">If you update these things=
 convince yourself that the changes are functionally=20
identical, I don't think there's any need to re-do all the testing that y=
ou have done.
</span></p>
      <p><span style=3D"white-space: pre-wrap">Thanks Yash,</span></p>
      <p><span style=3D"white-space: pre-wrap">
</span></p>
      <p><span style=3D"white-space: pre-wrap">../Randy
</span></p>
      <p><span style=3D"white-space: pre-wrap">
</span></p>
      <p><span style=3D"white-space: pre-wrap">
</span> </p>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------aXBLnEtSjzOpFIoQSzUX7OHN--

