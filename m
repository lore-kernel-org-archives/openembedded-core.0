Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6988EC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 20:01:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16560.1707768104667482963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 12:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bpp76fS2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2772da6af1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CDeZQV007528
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 20:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:from:to:cc:references
	:in-reply-to:mime-version; s=PPS06212021; bh=JttndoN42tZ2PlTtdqY
	fsF39ImYkjR/+rWlEmSUpRzE=; b=bpp76fS2QYitrUs0EvJ4nm05J1Vc5QiZxY8
	frndFOb/5bLOnpmuqIlCDChwSH64352bX9Ltcz9R7JnSPMXnjGrSJXCpl3s5xYbZ
	LVMs7IPWoThnWyKjTthwWbNsfvaJX0lo6GsxHoUdBtN61MwBEMdpd0LTvuoEcE1P
	iZKHkMXC3PKq3OojbvQa1CQTXTD6pJVC9TnmZVVGdlfiVs4BKub1x0gDjemoydfO
	fN/gwCbVrdozFRFWu0BqBCpM1MpBtuhyBb2g+QOgNPEBz5tt8Ny0Y6HZ9olRCzWp
	BowqTKrLiWHgoZhHoUgPhIK+jGlWx0esOnbe3oqjsox3DQDbO7A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxt22q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 20:01:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz+LMDGUJ4mrQTIBMDgaJWTJ9IP6Z5a2WCmVCKOU14nQvikbiGZLLCAvsKmyWI0kkf7xWUgwwnPxbHR9VeqdDlRjYdYVnraZutzYF32RrKj2HNhfyDg0zCkRt+VVXrC+PDu6OIjgjhRzTK9zCOrputH0jBPod69bp6nSCiwSUA3VUQ8d/vDjtZm4o9HDC2g25cGwQNWuYyLKp+noDqevcneGdFgLdP6LTH0abzt6y7f0YsiLddkT8bRfdwYcRb+484J2pQeUAr3d7hZa2lApg0i1cihm1xM9NL/tRK9nxQyGAwO2hFw5ImDR0WnxIPqGuuEY8GbVU6TyJFBGNj+I8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JttndoN42tZ2PlTtdqYfsF39ImYkjR/+rWlEmSUpRzE=;
 b=XjpkkrOk0EkTQ9OuBX7daKzxZDp1/E3Kz4hVdI2K1eMy8Zpns/dT4Yc/IbgIgsvJSWX+HPvv3OS7O10mVlaqbYV6U8/dEYbU3JDzYOHuOGMZu7lYFK7nFh+P8f11DpgWmlUveWVYCl6f+BxACOtXQTR87uF+pCJyJ8tKQKYZEq+N6/r5TlBA8MHl4ky3Y0eEu/kDGS/+9g5vizO4jQ2S3eCwSIYXflaKGtdLTFRcObBOSryaGOVSVnLQizieXZxawe2LChFi/jo1RaJFje3CWRP+LE8X3BOp06RKXJBBb/Huk8/c1PSaFqow52r+3Bdmt/h6+sQlqnzPBqW5w46HRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by DM4PR11MB5360.namprd11.prod.outlook.com (2603:10b6:5:397::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Mon, 12 Feb
 2024 20:01:38 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 20:01:38 +0000
Content-Type: multipart/alternative;
 boundary="------------j7Tt9DkFsdlcbYZzKTSVxM4A"
Message-ID: <fcc39c54-1961-40ed-88fe-9303c8280bf1@windriver.com>
Date: Mon, 12 Feb 2024 15:01:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gcc: Add riscv64 as a compatible host to gcc-sanitizers
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        "Hao, Kexin" <Kexin.Hao@windriver.com>
Cc: Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
 <df3c6eb1-2cec-490f-bb89-e06de070b62c@windriver.com>
In-Reply-To: <df3c6eb1-2cec-490f-bb89-e06de070b62c@windriver.com>
X-ClientProxiedBy: BY5PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::14) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|DM4PR11MB5360:EE_
X-MS-Office365-Filtering-Correlation-Id: 5880e9e7-04e7-4253-8d02-08dc2c056c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JYy4kVnPRTOWb5yKrK7Qt0sy+qgc08H6M0CdWgLIj5cIWlZn4p15sJmq3RwNhtwX1lllIaw6pcpxkxXzgGDu5+lkYsIDAriTWh0QnBoFNs7yL/Y3ltFBSNpmj2ubkwcTS81hGwjO5HRwo8b9Ib5+rtEIwX4+1VCwTjaumOX8jN+pdkLr4ynrR6eb4zQtAzLgYyz/aKOwhkwtkAuPT/i/4y6Lk0xVPW9PD20RLYaO+ivSzjbtL1i/0Xo/BuStSNWazr6p/xnUJZ7aR/zLz9ADiPm1Omej1G2WPQw/Uz/mLN9Rf17/Vib40Qccof7zIGSBS/b8R4ZGMcPUrF5EkC49P4CLmRmKhYAAtUIgk+CeTaApBAU4xoZkxgv27FqFo5Q0otKiQJqY1fpHdQGNHI4nV3mKKgmSfimXriq4xtm+xNd0rnOJLN0+u8s5eOYN8hUFlcCUO1zNKtRntqpry+BgFwyemlLU3F5twxsHDww8GE6a0Yu74PFTouIpul4pgx56oR7rSDlD1zKDF4i7AijA2SpImRkvvw0dqu6y+SIdQGg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(31686004)(41300700001)(107886003)(26005)(478600001)(2616005)(4326008)(30864003)(5660300002)(110136005)(33964004)(53546011)(6636002)(8676002)(8936002)(66556008)(66946007)(66476007)(83380400001)(36756003)(86362001)(316002)(6506007)(6512007)(6666004)(31696002)(38100700002)(166002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UG5hazdldldTbjlQR05rMzR6WUIrVW5vVDMrZjVkWUd3ZWsyN3I3RUg4N3JW?=
 =?utf-8?B?ZWk0NVFKZjh5RVFCV1hKdHV2R05oR1NlUkc1Z3RvOGVxWnhqbldUZXZGZ1ho?=
 =?utf-8?B?L3pCa1Q5RVNKeWFwNlZtK05JQVN5Qmx4NlBsWnlYS1ppbVY2Z3BwMDN0UmVS?=
 =?utf-8?B?b1l2NzBYU1ZvYmtEY3A4ekRzRGwwOHlraUtSZ0VsU1RtbHFESWlhV2hXMjU1?=
 =?utf-8?B?K1FNaUwrb1krTXp1dDBuY250TEpUZllEQVlRMUE5clJiUHJGYStJS1RZdkhp?=
 =?utf-8?B?OERsL3E4dVdkTDh6OXBWSDdSeDMzSENZcExuRy9KTTIzbkpSMWQxcElKdjBK?=
 =?utf-8?B?VUkwZUhHbUU5azlQRmhNbjlMWGVwMEY0L21xOHA3WFBnMzB6NHZOc1pxTm5r?=
 =?utf-8?B?VjFuRGpvOEp1bDhzR3ExdXlhVVRtTDJ6b3dQVFJhUVVka3lJeUdWcjd4cnZG?=
 =?utf-8?B?OUdsRmh2ZUNjOHl0RVZaTXpKQW1kZWp6VkJmSjQybE5reEFtZ3VzTzhXMFAz?=
 =?utf-8?B?N01oeG1rWnlkSVdYdUIreFpocm8zZ1dPQWZGV0dZY1lzUHNnWU5xUEtBOGds?=
 =?utf-8?B?WDZ6cUVUN2VlYmNXN1hpcWZZTWd6U0tuajR5T0dKcTZsVVplR2ZJVHArVEhF?=
 =?utf-8?B?enZzSm0yZElMeEFocG5CUHFFVTdzUy9ZWnNoK09scnFyTmxFY3dQL1FhTzlr?=
 =?utf-8?B?VWh6ZmNLazU2cXZ6bHRuZ0dXRWhTYk5MbEdsUmc2NkJ5RjZjYWZJUjFWbVBk?=
 =?utf-8?B?TWlSNERRYWZKSTFjVzE3ZHB6QmtzYnUzT0ptdzB3VzVlcmdPQ3Q4cTQ0Zjc3?=
 =?utf-8?B?TWFOSHJ3Q2piaStpY1VUVlk2WmY0aHg0QTVmaEMrVEt6cnIweUFHcElLd2Jq?=
 =?utf-8?B?NjFnKzE3ejd5SHcvcTBmSkVZVVlFeDF2S05mQVU1aTMrNFpzZDI3bGd6aFFy?=
 =?utf-8?B?SVNxYUthbkN2NjdMeVZTUjNZRXZpWVlOcHFBeGNoRjN5WWdDV01aMllSbVd4?=
 =?utf-8?B?cTlqTTgvNWQvNUNxWFNRWEozWG1mdlR1cTM5OVVhR0ZqOTc4aEFCaFBpVTA5?=
 =?utf-8?B?dXAwc0VBVjNrUU81aUl6T3VGQmZEOEtnc211Y2dWZ0dTbXRSYjZ4V0F6OUJ2?=
 =?utf-8?B?OFUzb3ZEZkxhTFFiOWNzeTBwUDdpSlFJMStJTnFYcHBwenNockkwRCtETXFL?=
 =?utf-8?B?ODh0ejRvTVBWMm9qeXJ5b282dEMycTZCUU0reXdMWUg4clZhVXdnSXpRdzB0?=
 =?utf-8?B?WG9NKzZ3NzVjM2tPL21oUFpSVEw0WHh4Z1RoZElXMGVpUDNKbFVmdC9vOEdF?=
 =?utf-8?B?Q0VXaExmZkZjSG1yeFhscStiSktzR3RwckpWTGk0cmV3OGdFVUpqWjE3MXZN?=
 =?utf-8?B?T1dzNHczZTBtWGk4LzRId3YrRWs1Qlc2MnJPOVovcnZySHA1NUxSNDBZNlF2?=
 =?utf-8?B?SFk2TlJrMEhCbENPdHVlbnFKUlo3L0xlYUpwZGtpcVVnL0FMQ0xQYWNBK1Fj?=
 =?utf-8?B?Qi9xekQ0clZFSjdBN05GYytjV3pBdHI3b3ZlRTlBdmw1SU03Ly91aHgxc3dP?=
 =?utf-8?B?Qkh0NkFqRzBVOFp1NFAra3NzYW40YzI0WTlqRDgvUVBtQnlKcTJ0eWh1c3Rq?=
 =?utf-8?B?cHVWcnI0VjExRWdzcGhDYTllZDhuWXh1MWlPYnBISmExUG40ZmNnYUlsM0pv?=
 =?utf-8?B?QjdsVTkzK2JhbjlPSElEUlRDdUZCZkpMQ1dkU3ZwdzZXSzVScWR0eHVOQWNJ?=
 =?utf-8?B?ZFRxZFpkZGpmQ3RQRVVCaWxFZTBGMEhhbVRTY2QrK1FXOE5uVS9od2tZM2xz?=
 =?utf-8?B?V0VIK1J6NStocEoxdmtiaDBJckJQbk1VaFp0S2IwTUJoR2NmZ1MxcWNaUWdI?=
 =?utf-8?B?K3ZLdnVyOHVyKzdUMFdETlBuVEJxVFJrUHZEeCtpZ1k1c1dEU1VmQk9lem9C?=
 =?utf-8?B?VzZkbVNlbjNBa0J4TU1oY0VXM3JjWjNWM0ZLOUFRQmtwTis3M1lzbzBrZUo4?=
 =?utf-8?B?Z29ia2lYNGxqWVBEL2xCMXJxSkMrZ1hQMm0rZzBzUEI3NU1lRHdRTFJCWDBG?=
 =?utf-8?B?by9KYmlEeE5leHZhUDVPYmZDRjFmdWs0dUMxWmR0cERxZzBRd0NvYUd1Ykpo?=
 =?utf-8?B?SDJIUW1PcTVHaTVGYi9rdWZCSmt3cngvSHEzRmRuL3NIem5NNGhTRDNVd3dV?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5880e9e7-04e7-4253-8d02-08dc2c056c4b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 20:01:38.4811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5IC2pOkhXbaVDI+QWI0W2p7UBAL1i8cwgcs44FNlOMnsugbYr0jWUpmiEqVpzuS/Rd6rUGqUsNCu+L/hmQ0lMChUQuufIWt4ynqnw1f2PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5360
X-Proofpoint-ORIG-GUID: mYn-tKlv-7umlQU21gdyXpIc4Ma-OD-A
X-Proofpoint-GUID: mYn-tKlv-7umlQU21gdyXpIc4Ma-OD-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 20:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195361

--------------j7Tt9DkFsdlcbYZzKTSVxM4A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41CDeZQV007528

On 2024-02-12 2:49 p.m., Randy MacLeod wrote:
> On 2024-02-12 6:00 a.m., Deepthi.Hemraj@windriver.com wrote:
>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>
>> The issue address-sanitizer check failure arises when attempting to ru=
n a testcase compiled with AddressSanitizer on RISC-V 64 systems using th=
e SV48 and SV57 virtual address scheme.
>> This error occurs due to the lack of support for SV48 and SV57 in ASAN=
, which was originally designed for SV39 in Riscv64 architecture.
>> This patch disables SV48 and SV57 support in QEMU and modifying the ke=
rnel to use SV39 by default.
>
>
> Deepthi,
>
> Thanks for looking into the gcc-sanitizers feature for qemuriscv64.
>
> I'm not sure if we want to make the qemu change that you have proposed =
and
> since no one else has replied, I've looped in Kevin and Raj who may be=20
> able to
> comment on the change.
>
> Oh, in reading over the comments to the issue linked below, I see:
> =C2=A0 "As a temporary workaround for this problem"
>
> so I really doubt we want to make this change. Changing thevirtual=20
> address range for qemu is not to be undertaken lightly!
>
> Let's see what we hear from Kevin, Raj and upstream qemu over the=20
> coming week or two.
>
> To me, this is a '(very) nice to have' feature not a 'must have feature=
'
> so if we have to wait until after Yocto-5.0, that's fine.
>
One more thing Deepthi,

It would be good to add a test case similar to or extending:

 =C2=A0=C2=A0 meta/lib/oeqa/runtime/cases/gcc.py

to ensure the feature does not regress.

Thanks,

../Randy

>> Upstream-Status: Backport [https://github.com/google/sanitizers/issues=
/1707]
>
> s/Backport/Submitted/
>
> as you have done below in the patch body.
>
>
> Only commits merged to supported branches or master/main, should be=20
> labelled as back-ports
>
> Thanks,
>
> ../Randy
>
> `
>
>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
>>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>>   ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++=
++
>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57=
-support-for-riscv64.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recip=
es-devtools/gcc/gcc-sanitizers.inc
>> index 524ebd4ba4..8c98e9cf8a 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>>   RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>>   RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>>   RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
>> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
>>  =20
>>   do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREF=
IX}compilerlibs:do_packagedata"
>>   do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREF=
IX}compilerlibs:do_packagedata"
>>   do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREF=
IX}compilerlibs:do_packagedata"
>>  =20
>>   # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are s=
upported
>> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loon=
garch64).*-linux'
>> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loon=
garch64|riscv64).*-linux'
>>   # musl is currently broken entirely
>>   COMPATIBLE_HOST:libc-musl =3D 'null'
>>  =20
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc
>> index 2a81870151..56c988e7fd 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -36,6 +36,7 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \=20
>> file://fix_segv.patch \ file://qemu-guest-agent.init \=20
>> file://qemu-guest-agent.udev \ +=20
>> file://disable-sv48-sv57-support-for-riscv64.patch \ "
>>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>  =20
>> diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support=
-for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-su=
pport-for-riscv64.patch
>> new file mode 100644
>> index 0000000000..7f3eab1463
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-ri=
scv64.patch
>> @@ -0,0 +1,25 @@
>> +From: Deepthi Hemraj
>> +Date: thur, 18 jan 2024 17:52:45
>> +Subject: disable-sv48-sv57-support-for-riscv64
>> +
>> +Disabling  48 & 57 bit virtual memory address in a RISC-V program, wh=
ile the system's upper address limit resembles that of a 39-bit address s=
pace.
>> +This signals a lack of support for the 48 & 57 bit virtual address sp=
ace on RISC-V; only the SV39 scheme is supported.
>> +
>> +Upstream-Status: Submitted [https://github.com/google/sanitizers/issu=
es/1707]
>> +Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> +
>> +---
>> +
>> +diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> +--- a/target/riscv/csr.c
>> ++++ b/target/riscv/csr.c
>> +@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] =3D {
>> +     [VM_1_10_MBARE] =3D true,
>> +     [VM_1_10_SV39] =3D true,
>> +-    [VM_1_10_SV48] =3D true,
>> +-    [VM_1_10_SV57] =3D true
>> ++    [VM_1_10_SV48] =3D false,
>> ++    [VM_1_10_SV57] =3D false
>> + };
>> +
>> + /* Machine Information Registers */
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------j7Tt9DkFsdlcbYZzKTSVxM4A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-02-12 2:49 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:df3c6eb1-2cec-490f-bb89-e06de070b62c@windriver.com">
      
      <div class="moz-cite-prefix">On 2024-02-12 6:00 a.m., <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:Deepthi.Hemraj@windriver.com" moz-do-not-send="true">Deepthi.Hemraj@windriver.com</a> wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
        <pre class="moz-quote-pre" wrap="">From: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

The issue address-sanitizer check failure arises when attempting to run a testcase compiled with AddressSanitizer on RISC-V 64 systems using the SV48 and SV57 virtual address scheme.
This error occurs due to the lack of support for SV48 and SV57 in ASAN, which was originally designed for SV39 in Riscv64 architecture.
This patch disables SV48 and SV57 support in QEMU and modifying the kernel to use SV39 by default.</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Deepthi,</p>
      <p>Thanks for looking into the gcc-sanitizers feature for
        qemuriscv64.</p>
      <p>I'm not sure if we want to make the qemu change that you have
        proposed and<br>
        since no one else has replied, I've looped in Kevin and Raj who
        may be able to<br>
        comment on the change.</p>
      <p>Oh, in reading over the comments to the issue linked below, I
        see:<br>
        &nbsp; &quot;As a temporary workaround for this problem&quot;&nbsp;</p>
      <p>so I really doubt we want to make this change. Changing the<span style="white-space: pre-wrap"> virtual address range for qemu is
not to be undertaken lightly!
</span></p>
      <p>Let's see what we hear from Kevin, Raj and upstream qemu over
        the coming week or two.<br>
      </p>
      <p>To me, this is a '(very) nice to have' feature not a 'must have
        feature' <br>
        so if we have to wait until after Yocto-5.0, that's fine.<br>
      </p>
    </blockquote>
    <p>One more thing Deepthi,<br>
      <br>
      It would be good to add a test case similar to or extending:<br>
    </p>
    <p>&nbsp;&nbsp; meta/lib/oeqa/runtime/cases/gcc.py</p>
    <p>to ensure the feature does not regress.</p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:df3c6eb1-2cec-490f-bb89-e06de070b62c@windriver.com">
      <p> </p>
      <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
        <pre class="moz-quote-pre" wrap="">Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/google/sanitizers/issues/1707">https://github.com/google/sanitizers/issues/1707</a>]</pre>
      </blockquote>
      <p>s/Backport/Submitted/</p>
      <p>as you have done below in the patch body.</p>
      <p><br>
      </p>
      <p>Only commits merged to supported branches or master/main,
        should be labelled as back-ports <br>
      </p>
      <p>Thanks,<br>
      </p>
      <p>../Randy</p>
      <p>`<br>
      </p>
      <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 = &quot; liblsan&quot;
 RRECOMMENDS:${PN}:append:x86-64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:powerpc64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:aarch64 = &quot; liblsan libtsan&quot;
+RRECOMMENDS:${PN}:append:riscv64 = &quot; liblsan libtsan&quot;
 
 do_package_write_ipk[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_deb[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_rpm[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2a81870151..56c988e7fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://download.qemu.org/${BPN}-${PV}.tar.xz\file://fix_segv.patch\file://qemu-guest-agent.init\file://qemu-guest-agent.udev\+file://disable-sv48-sv57-support-for-riscv64.patch\">&quot;https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fix_segv.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://disable-sv48-sv57-support-for-riscv64.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;
 
diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
new file mode 100644
index 0000000000..7f3eab1463
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
@@ -0,0 +1,25 @@
+From: Deepthi Hemraj
+Date: thur, 18 jan 2024 17:52:45
+Subject: disable-sv48-sv57-support-for-riscv64 
+
+Disabling  48 &amp; 57 bit virtual memory address in a RISC-V program, while the system's upper address limit resembles that of a 39-bit address space. 
+This signals a lack of support for the 48 &amp; 57 bit virtual address space on RISC-V; only the SV39 scheme is supported.
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/google/sanitizers/issues/1707">https://github.com/google/sanitizers/issues/1707</a>]
+Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
+
+---
+
+diff --git a/target/riscv/csr.c b/target/riscv/csr.c
+--- a/target/riscv/csr.c
++++ b/target/riscv/csr.c
+@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] = {
+     [VM_1_10_MBARE] = true,
+     [VM_1_10_SV39] = true,
+-    [VM_1_10_SV48] = true,
+-    [VM_1_10_SV57] = true
++    [VM_1_10_SV48] = false,
++    [VM_1_10_SV57] = false
+ };
+ 
+ /* Machine Information Registers */
</pre>
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------j7Tt9DkFsdlcbYZzKTSVxM4A--

