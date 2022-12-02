Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89B0C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 10:05:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.71478.1669975550031701894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 02:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=933599fd69=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B295iwq017371
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Dec 2022 10:05:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3813576m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 10:05:49 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B2A5mBl009833
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Dec 2022 10:05:48 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3813576k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Dec 2022 10:05:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dicYRM7ak1ZBhkj3oZ63xnVT9YmWDWmukovSPYTQ1uGvT2Pvma5cFr4ELZmHJ6/2egj/DBhNVDSgT3tYQhVthvZUpbTeHcXtYhMCuE5aGuGHIIeX7s8EieI223MGbwASxz8FCbzpuwgVrs2OiEwoO5PijOillpBVyoW38IEMK06+fNfYEGod+1IJQKvhHc6UWvH+5YEiJRD9Pddwt+gtIm8m8QzTaXZ3vFUcc7szEtMWXmVsPljGIreokr+mDMrEVPvIKcpRnqpOVWhewq4FfUK270dt8EJ8NrbFU8FEJIubkesvAa3wKI2DL9wj0Dh6i/C7MYr0sd4U/934iWer8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5krxu9QcJQ2JA03l3x/V5K0ukFzeMG4xN46iA7pbVfw=;
 b=i0ww40kO0xbkiOad3Hu82N/vqd5rMnPC3Af4WX6JGUsExj8LiWhAfjc+yJvS+J0D+qQsgMuAvz9LhuzJSQ1xS8r+igld1GeZJDa9WX0I9ULgy1qNwaF7lm+COcW2XO4Q1sd3e/PnpL5tyMi/SQQrqrTUh7/PmwyQ77/X4czhYLTqKk5iDT72qEBQjBawpNoQtbBGht0/p5nMWH54Q2Evg71LFmv/N0DhpMNibEB2VaX+ANQLUlxk7TB1iUrmNI26/1MUyfePSvWp0kEoEcSx/OXbEgRGd51C3G+z6/Fz5Ma5u+CuecYuWMGDehe3UgDyWmDdCMUokxvIIx9I2P33uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 10:05:45 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%4]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 10:05:44 +0000
Message-ID: <dfdafe6d-d73e-1032-8ae3-71524f667758@windriver.com>
Date: Fri, 2 Dec 2022 18:05:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][langdale][kirkstone][PATCH v2] rng-tools:
 backport patch to adjust jitterentropy library to timeout/fail on long delay
To: Randy MacLeod <randy.macleod@windriver.com>, ross.burton@arm.com,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20221127134909.72700-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj95YNhEgK+ony5KyLo_DBXJg-wE8cD7F9xVH4vDMELqwA@mail.gmail.com>
 <0ADEBB89-0C61-4976-946B-4A0E1B997EA4@arm.com>
 <ea2e31cb-21e1-0c04-9542-d8b8f0e58040@windriver.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <ea2e31cb-21e1-0c04-9542-d8b8f0e58040@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0176.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MN0PR11MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 3544c0ec-b22f-4653-5495-08dad44cc6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	228fC2ofz4342dZeB0asjpdd49H7KdacnJq/oDU5yuC2z3juFziBwFNNZBPWdDnpWbg6Mj/RHSI1g6lyZlUZUHIVmDCNcPBKZ/pd7yN80NhMZvD70hVZepMCnzZXUalwU+Qs1eOOfI6YwWWq8tA8iLxMvxPZFLdOJCuthtXY2DitBV65FSBY08ZTtceTFFaWpmlyzzGAwVDEYVURYIit7fwskm8G5TB5HDDUC13u1esED/yS2CfcOznILEJ07/kShqX0rNJmjpuiAQUB+njUyzNgGU4SexEO+KCqiJlYlj/dAh2v13utUsb7QIRfWZCtQYB7yIspaLsbXv4l5bxd4uig55evOhIi/Df7WxH2tzxK/B2AcsqVKUJGxqYfBny1wzU/aUNoO+4ISvOkD1CEvzy7RZT8i12pjfHTjqnM+0c99OrKU79NtQmt2Nd+D5yJeynkX2m3djn/y7w/wEYQHg1BjXDk6qdlz3XQmuulcGM7OyXQ0H40oLSNzxmFtRpCt2cYsjtX0vs+/PTr3tqh3D9Y/4FoBAKyYMdGIxRewlkQRZ8TkljXEabY+UhL3zG/5OnoEYznHMwd0J1kr9cgdPWQIyv/QBNY4tYG1hj1yanICdE5PzzUGX953cm4JntNQDMnu70mFMNMTtaHuLVDPZuljCGu8Nem6OdfPAQCTx3GhuzaYqMGUR5AOSGP9Icbj6NHpGker0IY4GKYKPBOIbfLEzEWcv1K9BPwKSAfSDvQHx/FcSVVH03eQO5DXtmCls1DzdrG7JR2ok/ffkbwVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39850400004)(366004)(376002)(451199015)(26005)(53546011)(31696002)(6512007)(186003)(9686003)(55236004)(110136005)(966005)(36756003)(478600001)(38100700002)(83170400001)(83380400001)(6506007)(44832011)(6486002)(4001150100001)(66899015)(2906002)(31686004)(66556008)(6666004)(4326008)(8676002)(66946007)(66476007)(8936002)(41300700001)(316002)(5660300002)(9126006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUdpV0tEdzI2R0ZvUzBKT3dKTjRlWDU3R0RLL1dGOEVObm5QOG9WcFhHOUdy?=
 =?utf-8?B?QlRKVnRxcFNzbFl1c3FvQ0JIU0pPd1d4TFBVeHhDOXJlQW13SytIcVo0VThu?=
 =?utf-8?B?bGQ5elZjRGdEOXZTYTFBMGJVY0VZaEFzSVdXNm1lRUpKWDVRbG1xeGZPdEV5?=
 =?utf-8?B?VmNpQlhLTTlsNnpEWUtyQWtNUmttVUNRT21HUUMwcWpVL1J1TmM1Q0twRTJY?=
 =?utf-8?B?YmNjOFBNczcyeUZYZ2ZDQjRKTjRveW96QVpxNG55bUx2L2NPKytXL1Q4NTkr?=
 =?utf-8?B?RTVwck5UQ0U3UHZuWGNsSld0dGtjbW92NS9tZVRvbC9mbzZJc05zZ1JTWVJF?=
 =?utf-8?B?K2JKZUpiQTlFQ3JNRkRZaFE1NTl0bzN3ancrbUlhcGExRGtneXUwdGx6NXJk?=
 =?utf-8?B?cnZwSHNZUGZKMXVySDhGWFRRYjhycHMvcVZmWlIyb1R2WThMRWlzTmJPQ3hu?=
 =?utf-8?B?aFp6U3dCbkNOTkg5QjNaZStYQllTaFBGUm5DWjRuUFV4MDFSK3ZTbjRnZlNO?=
 =?utf-8?B?dTIveW01Y2pMWnphUWhSMTdVY2tNRmZlYmdYVmZZR0FQa282d0lDYW8rTWd1?=
 =?utf-8?B?VUZWNXkvWXFuVFVsODZHRWh5N20yTVVncWtXZW5pV3ozU1BhS0JzQ1Y1a3B4?=
 =?utf-8?B?bzU4L3FEaU4wRzR2d2N2WXQ3S05Ock9qZVdIM0srMHVhVWhQdjJtMkQycklO?=
 =?utf-8?B?NU5aazVPWnVrTEZTUjFwL2x1SCtDbFhXQzVWUmpONUFLV3dXOVBhRkpyY0gr?=
 =?utf-8?B?bzk1aXQvUjg5ZXZSQy9KTy9XdVF1bTVzb3J1ZjJLQTk3bHNucEJGMkdRK2ht?=
 =?utf-8?B?cXVDOUlSYWFBVFcwWnl2am9pRTM4RS9NR09BUFoydUpjU1V6RzlrK0lnbGkx?=
 =?utf-8?B?bWN4RGFzVElzN0prUVYvRmtlVEF1WGJXVFVZdGNhQmZ4QTVpbXhvaHVsWUV0?=
 =?utf-8?B?c2t6aWVtL0pCUVFTclBIbEVhVlFTaTdBRnB6VzJ0bWhvTW9keUdkV1dSSG92?=
 =?utf-8?B?OFp4dWV6a3ByOVB4SlVGbm42MWdLcldsQXRxT1hmc1ZObG5kMTk2NHUvK3lw?=
 =?utf-8?B?MTN3OUdDTDlmRTFBc2Zrbkp3akFFK2h4UWFxVlRlS3RjUk05Uks5eWViTTQ2?=
 =?utf-8?B?c1pld0l0cXgvMi95clNBWFhIWDFPcUxaRWs0bHEwSGVXRGZPQWNtUGgrd1FG?=
 =?utf-8?B?dEJDNFFmN05jaVlrcmFQMmw2MEgvMW5MN1JjSEMzZnUra1J0L0NzOXFhMnpo?=
 =?utf-8?B?Ynlrd0IrZUp2VVJKYWpMb2h6dUpSREo3ZDFzZklqbTNtZlZlcVc3UkFNM1Zi?=
 =?utf-8?B?eE5WNHh6ZFE3NlZZN1ExWGZCRDJ2TjBJaVNDcDcrY25EZEdudmVDQTlLdVdo?=
 =?utf-8?B?Q21BWit2T0xmS0lTQTlCM0NwNE1YT0s2TXRveVJMQ3prUCtYbXRLbnVoaUZk?=
 =?utf-8?B?b3FLNC9odkw5TGw4VjhudXZwbFdVL0Z4ZTQ1dXMwVUI2UUJHMVh0VTJDTmNl?=
 =?utf-8?B?SldZOWp4djgvYy9OY09JbzN5eCtGYVF2SWM3Z080RDRYb2ozQlZiWVVKeDdS?=
 =?utf-8?B?Y21ieWptVEdUM2tkM3Q4a1AzbmhkVzIxRmJKUGlUc09oa3VuQkdkaTQrMTFt?=
 =?utf-8?B?Z0E4Tm5KQStrNEtVR1dDTjVXd1FDK2g2akhDYld6TVowUzRwUTdpODJzWWxa?=
 =?utf-8?B?Y2Fhb1lWWDlPSnZIcjFUeSt4RWcrVkpqR3dadkwvemRucFJwWDFyTldFS0tF?=
 =?utf-8?B?a0JCbVlhdENOdGtQbEFNSm0rMEN4eFhQRjlITXU1V1VEb0RXTnc0eG1YQWlj?=
 =?utf-8?B?WEJvbnJkUzFpR3RWTURHMk1OTzVYZkt6WEdkSE1nYWt3enNyWElidG8zcmpW?=
 =?utf-8?B?YjRkSXJXeHl4QTJGVkFRM0tTc0hFWkpyUGZxTDRGaUs2bTJBQ3J1UmZOR0NP?=
 =?utf-8?B?eFhMVzZsV3VjK21waytOREMzODBvSDNucnNuTDQwdGFLOVZJeWFIMTAzMXUy?=
 =?utf-8?B?LzBrSmtVeTg0aWpaSW1EKzFiZ0g3bmljUEl6czdoRitRNDFLc29NeE1kSmdI?=
 =?utf-8?B?Ry9pS05jYUYwWXlNMlhCSG9vYXZKV0tzbGx1OHVySHBLOVdGZG1oMklwZ2tk?=
 =?utf-8?B?Mk5qRkRHaVZsMVZFdFRHVmIzVmhVdzAzSHMydzc0SVowUmVWQWtsV3hualJN?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3544c0ec-b22f-4653-5495-08dad44cc6d2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 10:05:44.7121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZZyBsmisz1gr7jG9KZxmKXTVTjKE2HKKBMlXGNWnMn8EHqO1OjTdQ0Oc3eSjUTWi3gmowXpGfKpRUYo/Y8VnsW077jfPpglawRn440lQYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6231
X-Proofpoint-GUID: l7AZ6cmAw04rNcmfEYLnFN3Rr_0YnW11
X-Proofpoint-ORIG-GUID: eqk17B3D49KqcXS-QZFjV1Wzcn1iPF4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B295iwq017371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 10:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174232


On 11/30/22 06:28, Randy MacLeod wrote:
> On 2022-11-29 10:52, Ross Burton via lists.openembedded.org wrote:
>> On 28 Nov 2022, at 09:25, Alexander Kanavin via=20
>> lists.openembedded.org=20
>> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> On Sun, 27 Nov 2022 at 14:39, Xiangyu Chen
>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>> =C2=A0 * add libgcc in RDEPENDS flag to solve testing failed in=20
>>>> core-image-full-cmdline
>>>> +RDEPENDS:${PN} =3D "libgcc"
>>>
>>> This needs to be better investigated first. The change looks like
>>> solving the symptom, but not the actual issue.
>> It=E2=80=99s not uncommon:=20
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10954
>
> While it would be good to solve the general case of libgcc dependency=20
> mentioned in that case,
> I do wonder if the original issue that Xiangyu saw, goes away if we=20
> _only_ add:
>
> =C2=A0+RDEPENDS:${PN} =3D "libgcc"
>
> to rngtools without added the upstream timeout after 5 seconds or
> it the dependency is only required with the patch?
>
> Xiangyu ?

The software jitter thread will call the pthread_exit after timeout=20
value reached, the code has already exists there but normally won't be=20
called,=C2=A0 when applying this patch, the timeout logic can go there,=20
that's the reason missing libgcc which was reported by oe testing

>
>
> I also don't like the arbitrary timeout and I'd like references
> from the board vendor that explains that proper RNG isn't supported!
> ( I'm not a BSP person so this may be optimistic! )
> Note that there is a follow-up patch to make the timeout configurable,=20
> see below.
> If we take the original patch, we should take both and require that=20
> the BSP tune
> the timeout. We'll get this behaviour once the patches are integrated=20
> into a release
> so we might as well figure out if we're going to:
> =C2=A01. have a tuning policy,
> =C2=A02. continually revert the patch or
> =C2=A03. actually get to the root cause of the problem (by working with=
=20
> board vendors I expect).
>
After investigating this patch, it just add a mechanism to avoid jitter=20
thread take long time, but not "really" solve the jitter thread full cpu=20
usage when it start.=C2=A0 But we still need to think about the timeout v=
alue=20
because this commit will contain in next rng-tool release version.

There is another question need to clarify that whether rng-tool built-in=20
jitter random generator still need after kernel 5.6, the /dev/random=20
doesn't block anymore, perhaps we can turn built-in jitter random=20
generator off by default service start parameter because it would take=20
full CPU cores effort to generate jitter random when it start.


Br,

Xiangyu

>
> ../Randy
>
> commit 6e14b8bd491b3f94f60f36748959e0ae7d7c1f95
> Author: Dan Hor=C3=A1k <dan@danny.cz>
> Date:=C2=A0=C2=A0 Mon Jul 18 04:47:41 2022
>
> =C2=A0=C2=A0=C2=A0 rngd_jitter: make timeout configurable
>
> =C2=A0=C2=A0=C2=A0 The current default 5 sec timeout can be too short i=
n some situations
> =C2=A0=C2=A0=C2=A0 (eg. slow hardware). Introduce a command line option=
 (jitter:timeout)
> =C2=A0=C2=A0=C2=A0 to make the value configurable. Increasing the defau=
lt timeout is not
> =C2=A0=C2=A0=C2=A0 desirable, because it might slow down system startup=
 when there are
> =C2=A0=C2=A0=C2=A0 other entropy sources.
>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Dan Hor=C3=A1k <dan@danny.cz>
>
> commit c29424f10a0dcbd18ac25607fa1c81c18a960e81 (origin/jitter-init)
> Author: Neil Horman <nhorman@tuxdriver.com>
> Date:=C2=A0=C2=A0 Mon May 16 13:38:54 2022
>
> =C2=A0=C2=A0=C2=A0 Adjust jitterentropy library to timeout/fail on long=
 delay
>
> =C2=A0=C2=A0=C2=A0 When running rngd -l its possible, on platforms that=
 have low jitter
> =C2=A0=C2=A0=C2=A0 entropy to block for long periods of time.=C2=A0 Adj=
ust jitter to=20
> timeout on
> =C2=A0=C2=A0=C2=A0 init after 5 seconds in the event it takes to long t=
o gether jitter
> =C2=A0=C2=A0=C2=A0 entropy
>
> =C2=A0=C2=A0=C2=A0 Also while we're at it, I might have a build solutio=
n for the=20
> presence
> =C2=A0=C2=A0=C2=A0 of internal timers.=C2=A0 When jitterentropy is buil=
t without internal
> =C2=A0=C2=A0=C2=A0 timers, jent_notime_init is defined publically, but =
when it is built
> =C2=A0=C2=A0=C2=A0 with timers, its declared as a static symbol, preent=
ing=20
> resolution, so
> =C2=A0=C2=A0=C2=A0 we can test to see if the function exists.=C2=A0 If =
it does we _don't_=20
> have
> =C2=A0=C2=A0=C2=A0 notime support. The logic is a bit backwards, but i =
think it works
>
>
>>
>> Ross
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#173981):=20
>> https://lists.openembedded.org/g/openembedded-core/message/173981
>> Mute This Topic: https://lists.openembedded.org/mt/95288451/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

