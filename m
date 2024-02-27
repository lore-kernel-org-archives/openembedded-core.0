Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26FFC48BF6
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 01:59:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3260.1708999172628163037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 17:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=278765d1f2=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QAoQVx007066
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:59:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6akpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:59:31 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41R1xV3m014192;
	Tue, 27 Feb 2024 01:59:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6akp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 01:59:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogANWj+GUhpU450BDYzzIlpHcYJ7gOtmeDoyS53x7KGk6aJ9gWNdoZH7R58mfrq2Q5bWUcKmUIEyAkNzuOkRxB8ppUrTNNsL63jzI8S6FqUtM2q4AisLMZ4PlQ54Sw6n16vd8bXB3uqgReMDBQaUFieUfAY6OUJ9hvLg0XiFpi2nAWCH8VXaZqBParSJ/YALwf5T5Cj9hwHLlQOWsqftaYr3OzNST+p2VnqqnrNcCGdFe0wDr5Sqi+vK7hFCT1x3RIfkyCtAgQAYg4/lH1zZwfGjIfUe//w5J0ZCH3ocpCOsZYMFk+7OVH85fI63KKYTKFQqiyHaSUg3eD1oBYq3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3BHwZ3d3ZtsIx7ZbXbEgjlIlk9Fj2B2avA8GCFPR1Q=;
 b=YqC5p7Tk53hGEgDSxrhrwEmI0YfIICc4g5lbPB/9ZsA0w/xtBHXWbA4lA75csez/2lI3+n9UdAqq2rfjfTQ+YFvqEnz+BCgoZ9qLRpBNFokXosskp+r/HOXr0gkzDrGHpfGiVR6/GaRHLrSWB5SEkT+ThDRZ6mecnthkVNVpnVnxu1U1NA32AVAgZXIhWoNvAofb4dLusDSTYIlN1/uQQ6Yx2JEvxHDjhznHF5KVYi3TUU8gSKynz/neUU+LRBKc8b+v+4Iwtyh8XmFl4p8NjKbHkBzXOte9wIDgLt3+0FiaTARam3HR7sq9V12Yb+/0TdlcrIY9SOQA2PeDNYUYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 01:59:28 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Tue, 27 Feb 2024
 01:59:28 +0000
Message-ID: <ba2c6c7c-329c-49ad-9eb5-9c285c87c20f@eng.windriver.com>
Date: Tue, 27 Feb 2024 09:59:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] libc-locale: fix ASCII compatible warning cause
 build failure.
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        Mark Hatle <mark.hatle@kernel.crashing.org>, jonathan@joggee.fr,
        Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20240226095921.363844-1-xiangyu.chen@eng.windriver.com>
 <81fee331-31ed-4ca9-9a8d-2522857a54ef@windriver.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <81fee331-31ed-4ca9-9a8d-2522857a54ef@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0213.apcprd06.prod.outlook.com
 (2603:1096:4:68::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CO6PR11MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: c5872860-a928-43e5-3c31-08dc3737bae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cVkUx6gms8vF6dGZTB6QhJax8vgMt/JU/jDjKsbQNONvqG6HbcK0ArRGe2ODteSyaEGLpC+GDXzZKwGylHHiubtY4nGO8Mm56eodCM8NL5mELQkQ/AjKWgUKIH1vqCh4bgAoaqGlu+V1sEgczZtr4wMKi2q1o2JWF1she0YKytn81i4W76lXK/JtL0qNWE5SuN+bb7T/0BzXfLlIg6aruwpOvDECWK0OpRFJQjiDyRixKLcFBoWUearf0ZENAfI2Cv9jAGRMFLh3SUz4XQUSuTHhTWAYOptU60jUQ49F94hoW/i/0JKo6W0OylLBrEWwB/UPgHnvBZEtaPsc38+PXGg8Gj87EU0QjagWG4km+NMUefKW8vBy6loDxbtDA7IwaY4KKwoAwEam2ztFfug+Xp/a+ojMChttR2HBDudfIlnQ9VTkOpsrZ2l/aQbI9veYzRuSbvoJDmQb1GwcYDoKnIR1jDYs3bklWA/pRHvIoKkiQU5cJFT1laxAc6GWNZnwX7Ho5uGA1Pjbn3uT+4SElEF+uKrRR16bL2u22jHfgngkaluYDd2NJSkpeFTcjvBwI6RLQoPey6HWwa4gJUIgAFLWwxGDArHDn/Qt2Bg0ZUpzqZ2h34bWGOMD1g1DNwH2h/j4dsfuxp8X7R3mcKqy9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2o2TkpjK0hSak50d0ttZWVaTjdTVHJ5bUdBNy9Gb0hudlBDckVzdGUzVWNn?=
 =?utf-8?B?eHhpUStub2RwdExJdkJObmdhSzN6NDRuRGl1c2FCQ21kdHZKZHUySHYvWFNn?=
 =?utf-8?B?akV4SEx4dDlXanV0RHB1eFZPaVNJYmQ4ZHRYT3AwQVQydGR6eGYxd3I2WmIx?=
 =?utf-8?B?b3ZqeE9aL2J1Y0V1bHhXeXNJbmZtZ285bWQrM256VGozbFhnRjFZT3hzZVVU?=
 =?utf-8?B?SVB1QjNlVWxRTzRkWU9LVXhWU0U1K1NTUCswSEpKSVF1blhBNTR3dTBwLzg4?=
 =?utf-8?B?N3BnSVllanVET2ZHbDZzNTNkVmZESXRsQWpleThwK29hbUFPMDFGbnpZL3pD?=
 =?utf-8?B?L0w2MjZ5ckhYVitNSVF3a0NDTkErWU01aDRYaVNSZmlaYWJMSDdZL1ZZekRw?=
 =?utf-8?B?MmVUa0VReDByOFJkQ0hzd3RoNE5ZL2JDMXRXQnQ5ZTZ6NXB3YjY1U0dGYWNn?=
 =?utf-8?B?NXFuK1NnclBVN1ZrVmxtMi9jdTR6bjhFSEI0YTZlWlNTVUx1R3d5enNadkd4?=
 =?utf-8?B?Sk05dlRKbXVpQUdCL2tJRE43MnBjZldWKzNqZndyc09IQW5udXhmbjRTcFlp?=
 =?utf-8?B?a0g4bGptOGYxTGJHRUY5Ti9SQUVWc05DeTIyR1lTTkR3N2kzakl3ZWNqRzl5?=
 =?utf-8?B?L0VDbDdWVkUxZWpQZGR4RUNocWdtMEo4RklvaFNrTkh2Vk1zZDVyUitFMWRa?=
 =?utf-8?B?ZldJZlhlQW9YTTFIM0I3OGtwbFg2RkE3NnBYbW5jNExjdDBGQmgvWkZXbGcx?=
 =?utf-8?B?cFNyMlhSakk2N3IyVnRtTEFHTlRxSHEzMHRQK3dKUFFJeEZNT01lcGFjOVAy?=
 =?utf-8?B?MDNob3ZEdkYrTFZSaVA5QysrT0VyT1JFYVlxVzJkWFFvR3RJSk51V056MGVs?=
 =?utf-8?B?MVhOVVNnbit0VjhSRktnczFXNW5tNmRhcHZJSWVLeFlwQnord25pdE1ZWjIr?=
 =?utf-8?B?bWhCbmd3YlQxUER1MVVJMXBKNUNYd3plQ2dmZ1RIc3N4NUk1b1lLR05UZEgz?=
 =?utf-8?B?Rm5YczU2MGpqSDZ0TUZjSUtBTjBzRWtQQytBdVRocmhrNWpOVUUwb3hFTllz?=
 =?utf-8?B?cFNBc0ZTeDJzTjFkaVBhY3NvdEszb0Q0T3pSVUg0WEZJRmM1WnRoWjh0TGhP?=
 =?utf-8?B?djZQb0hsWjlCdjRvRUpabjM3TjdkQTFvaU5mQ0N6RDhvQ3lqM2FrUFUyYmFZ?=
 =?utf-8?B?amExMnVNU1dFZkF4Ly9aMmFvYjZhaWlpRkFpa3N4U3lFRFlhSUZ6Y2UwTzJT?=
 =?utf-8?B?RGI3dUhwWmhaNlFUdjFvTnRmaldzZGoyRk4wcTdRc2twWkdXS0xTQS8zY2pi?=
 =?utf-8?B?KzVnTElPUm5xbmphMXgvbSs5S045ZmQycUpLMi9qbThudmYxUG9qZzZrYmpV?=
 =?utf-8?B?TkpXL3ZVdTB3cStXL3hHT21XaTQyd0M0UEFHRVE4czB4Y1BCb2xUdk0xUnlm?=
 =?utf-8?B?ZDVSYTU4amVEMnF6d2M3Z3NlY0xkR2JpajFmVHU5N1hIdjNoNENrNFZXMm5U?=
 =?utf-8?B?U3RwR3dPU29vTDVNeXZBRnhyaXZwUnExUnUzV3RDQUFUWEN5OVhGanhRL3VI?=
 =?utf-8?B?RUNQUFVZelJtNGVFTUpaeWVUeUhBVTNPRDM0UnVST3JLeURMZTgxajd5eDV4?=
 =?utf-8?B?OUh6cGd0Z1pHeDYxaWtVYkpKK1E1MVFhY3ZLQVBKY2VYWkM2VVgyRnlCUzVK?=
 =?utf-8?B?MWpRQ1IxUnVScUxTeGxJRnRrZDJ5cFJJR3didDViQnhLalZYbE1QMEtkVlRG?=
 =?utf-8?B?SWF3Y1NNZDJVK0RabldJb1F1eU10blMxeTRDbEJLeGF4Y1JyUXV3WlFKT255?=
 =?utf-8?B?TzVpM05mNkx2MUZIMVJCTXhIMGNLK212RVpkY1RjUWdkSlFHcFkxSUNKY2or?=
 =?utf-8?B?WnRRODdJSmVkUkZObk1zQU5iYnNKdEdXUmxQaUFySW9XZTNqWXd4a3o1eG45?=
 =?utf-8?B?SWIzc0hrVHIwT2U2NUV1VmZDL3ZFanNPcUNDQ0xML3FycmRrUHgrNXNGNkhl?=
 =?utf-8?B?eUJUUHlnU1p2SnpteUNuclA3ejdpWjhya2pkUXEwQ3RKMHgyOExxTExmSlcw?=
 =?utf-8?B?VEJ5UkpNZk1sUmtpT05FK08ycXcyQlhXbHFzRWhURmNTS1ZFY0Q4OUZ0M3Ri?=
 =?utf-8?B?dEZUcU0raEVmSm8weWtzV2pyK1hhbjVOYVBHMmpFdnpqTU4zZnhSZGVoYVZM?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5872860-a928-43e5-3c31-08dc3737bae3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 01:59:28.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqA/s5JYz3y+5x0sPoTXeOltKfpIxXRczLZllPaxHlQdVfADFI98RhkbsamDQGA2t5J/+klvIZwX+GPuomL2+aIDwNfcf72i0iY3/k5aVhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-Proofpoint-GUID: pAcpu9SFg6rsL5swK0r8RfAHTZGBmKiw
X-Proofpoint-ORIG-GUID: PhveMdFh9kmHolGYc968kOp-IM2PvFa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402270014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41QAoQVx007066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196238


On 2/27/24 09:16, Randy MacLeod wrote:
> On 2024-02-26 4:59 a.m., Xiangyu Chen via lists.openembedded.org wrote:
>> From: Xiangyu Chen<xiangyu.chen@windriver.com>
>>
>> Some locales are not listed in glibc locales support list, but can be =
generated,
>> here using ja_JP.SHIFT_JIS as an example. We can add following line in=
to local.conf
>> to enable and generate it:
>>
>> GLIBC_GENERATE_LOCALES +=3D "en_GB.UTF-8 en_US.UTF-8 ja_JP.UTF-8 ja_JP=
.SHIFT_JIS"
>> IMAGE_LINGUAS +=3D "ja-jp en-us ja-jp.shift-jis"
>>
>> The localedef tool would report a warning and exit with 1, that cause =
build failure,
>> error message as below:
>>
>> [warning] character map `SHIFT_JIS' is not ASCII compatible, locale no=
t ISO C compliant [--no-warnings=3Dascii]
>>
>> So add a --no-warnings=3Dascii in libc-package.bbclass to fix build fa=
ilure if someone needs those locale
>> in yocto.
>
> For context, Xiangyu is changing the libc-package.bbclass so that we=20
> can generate a ja_JP.SJIS=C2=A0 / ja_JP.SHIFT_JIS locale
> to make another of the bash ptests pass.
>
> I don't know if that locale is commonly used these days but apparently=20
> it's not POSIX complaint:
>
> https://discourse.nixos.org/t/building-unsupported-locales-ja-jp-sjis/3=
612
>
>
> Richard, Mark, Sundeep, Jonathan, Khem,
>
> Any idea if this is a change that we should be merging to master
> rather than skipping the bash ptest?
>
> Xiangyu,
>
> Did you test musl? ( I don't know if musl even supports locales,=20
> off-hand! ;-)=C2=A0 )
>
Hi Randy,


Yes, but I meet a build failure that seems musl cannot provide ja_jp=20
locale (or needs to add more configurations in local.conf? )

Error info:

ERROR: Nothing RPROVIDES 'locale-base-ja-jp'


Br,

Xiangyu


> ../Randy
>
>
>> Signed-off-by: Xiangyu Chen<xiangyu.chen@windriver.com>
>> ---
>>   meta/classes-recipe/libc-package.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-r=
ecipe/libc-package.bbclass
>> index bf160b115d..c06a2ce90a 100644
>> --- a/meta/classes-recipe/libc-package.bbclass
>> +++ b/meta/classes-recipe/libc-package.bbclass
>> @@ -278,7 +278,7 @@ python package_do_split_gconvs () {
>>                   bb.fatal("unknown arch:" + target_arch + " for local=
e_arch_options")
>>  =20
>>               localedef_opts +=3D " --force --no-hard-links --no-archi=
ve --prefix=3D%s \
>> -                --inputfile=3D%s/%s/i18n/locales/%s --charmap=3D%s %s=
/%s" \
>> +                --inputfile=3D%s/%s/i18n/locales/%s --charmap=3D%s %s=
/%s --no-warnings=3Dascii" \
>>                   % (treedir, treedir, datadir, locale, encoding, outp=
utpath, name)
>>  =20
>>               cmd =3D "PATH=3D\"%s\" I18NPATH=3D\"%s\" GCONV_PATH=3D\"=
%s\" cross-localedef %s" % \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196197):https://lists.openembedded.org/g/openembed=
ded-core/message/196197
>> Mute This Topic:https://lists.openembedded.org/mt/104579284/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

