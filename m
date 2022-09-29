Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A92EC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 09:21:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8101.1664443270055713279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 02:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=rAMn9dRx;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=727166c06f=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T5eLtF020245
	for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 02:21:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nbco2im/09Z7lTWqbFka2MSqDtm4gjEWJpvsxncepgo=;
 b=rAMn9dRx40ph63hQULE1oxj+YTpqaZamB8f1ZY+s1dt4FK0U4GH74Jf1W4+aUAtYlyhM
 u8RZQdtCuWpJb5wr8Gm1+eyRQmBib5Px7p+fF3uCvJz9wrfAwPR2AtTYk2PghqhJ4KNq
 uqtaX7BmnVM3m083K40277ODflDj+7WcOkEqn3/s45wj+8RTebOA7TsTJyJnddNcJrMT
 8owgtltJaT0pClqq34LEuyIJbaiNmmQSUsMDh+wkrQy+Jni0CWCdqgyYYjjifW/3LyFv
 iTE9uBRmGxsR0gM2q+MgbBItQzVCAC/XuiwyUvLK3I798B7aFHaZM2PXitHnaDMiH1SQ BQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkc4ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 02:21:09 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T9L9P8010784
	for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 02:21:09 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkc4en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 02:21:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh9tjzB5P19JA5se0rwdlrBOWzXe/vqVQHrt1cZ+BQ4phnFrxBy4RV4dAFis4nvP+f+NNKYhQw5h0tQj534vKfcZQ/c1YkJdDUGA5ZoupcI/mohUYEko2yvQHdZnfX9jZVWZLg8ac3I54ZKcyWfKWeRM2CdBlua9Zvruz8AgeOPfz1UQH1TlRouZKCQC+maN5mhU+/KgBWT9s8xydGZyY5LZSJnrOEGRqAFTy+omjIlIbXZiF9ewfBR+EjAV1bCgOmZCNCHu9FFwrwXlpiE3ZUGC9dPwWgh1ILYPmL2+xL4VQxoQm8xdJ03zeY6lTcyVt5q5bFsCb0S5OMoZNfxb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbco2im/09Z7lTWqbFka2MSqDtm4gjEWJpvsxncepgo=;
 b=B7c8e4nBWQlLkPrU8z3Loo1X8IilaDt+fQaZCdBk/XmwX4cGZKjPUer6Vqpl52ry6DhFPF/Qa/AAtxNLQMmaQizf85vjcTlV9MNkVfMycSPrYAe+LBkGZ4wN4uwqADCuQORIU7Rs6lWca4msCJYNbl/yiF9pGRDI7W4LwFJR12scg39ciSHuI3SKCU4j6w2jyT+A1WcGilN7UcUa0GsQYEIg3CJspvo+vqdwDufRouwRWWFNnmrUvXPVgL5njM+Cnhxh/vjh4BrxBh+jU/m9+CyGyf9J7V09FzjznuKES79UXVnS+WwDk5c8Hac35JB829IX1Oy9C/wEG6ZuqDE2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Thu, 29 Sep 2022 09:21:05 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0%7]) with mapi id 15.20.5654.026; Thu, 29 Sep 2022
 09:21:05 +0000
Message-ID: <0d77f98c-1a7b-f1ad-be89-82776cb2ca92@windriver.com>
Date: Thu, 29 Sep 2022 17:20:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2] mesa: only apply patch to fix ALWAYS_INLINE
 for native
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, raj.khem@gmail.com
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
References: <20220921080357.8493-1-kai.kang@windriver.com>
 <51cc35c11610c638c75efc6de20845f3e497c8dc.camel@linuxfoundation.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <51cc35c11610c638c75efc6de20845f3e497c8dc.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 08153825-2776-4bae-fd64-08daa1fbef37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2TFtJkg2bympSoXDka9/TB4lI3DGOhoPX4QWg0G0+Vu375acxdgFuTz+KgqQN5tcoTa3/s2S2eQXrr433jCM6OshuPnvRFpEjUb4kMxaM3Kd6x77DyO3SuscAqWIc0uL6G+Hl55NELto/Q++DGTB8Whps5UMsPz7abQYhKSaMH7ZR9pHIRxKk/j5F5RTM8wnw1cRsaw1pYun0/HYeQ2tS10pTHL6icvJB7jPLssEaBd7x8rymFuFcnpEs0s7wAo5HdrtOmeXuQ7F5LCEsEwHPIcG2FFwP8nPMxXAridh3BjaeUZAgRngS7sTKy+UTZRTjOwnx3uJ8aytZt+1/c90odips2csXmaAHiQ/lQ3om1NuAO99A5AcXyNC7HuYrmNgx1RVHhy4MlGTqFNFCBlYxEttSdboSqgqMsNTrjouLl3fkS7Mlwy3i6wYdITmYm8eaHmizow2/Pxdz7qwJVCeCWrnK/+3Gbfu5A5yhTemDBsKiOKLpdvOD9tvB2Vpjl31fQmLuz6TrQ4+52WY8pxryobWXGOIyzUOmN9tVXvNj2Ky8OmFxgPSBWPUrk2MO4FIpZaEdFGI/vje9lKx9daJqprl1wtQFSdHngGA4Kef9fI6BIN8phMB0U6AZKz8z3h25xibJv04FYSPjgnh74NP5Pb4GJ6VTn9fazvntxRJCPyGHsi5NDcAopKhUvfP0z0j+IzqkVpl7qms6MyuQI81t9qRWaae5FBKVqPrTOvRc1RlKW5Me/uffd7yT+q5lRdj9Xi5barI5s0J++mz6yLM05rp/kJiLKypFLtQ29M62rY0HEzccTnSwnlO1BhaN/AW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(451199015)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(6666004)(83380400001)(6512007)(26005)(2616005)(186003)(53546011)(6506007)(36756003)(86362001)(6486002)(966005)(478600001)(31696002)(8936002)(31686004)(41300700001)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzBraVNveXZXUmdieDJQU1o5RjV0bllTMWRVUjdwWVRKZ3R6azluL1ZNdGs0?=
 =?utf-8?B?MS96aVdjdGpFUDB1TUUwMGNEQTJrQWpOY25wUVJnRjI1OGFIc2ZiOGFhdTBK?=
 =?utf-8?B?WkJwOU5zWDhQTExiNXFneS9BKzJKWTlZcHlGOVpUREZWN2NOWGtKVmp4dEtX?=
 =?utf-8?B?a0hLQ3U2SzE3N1BpR0lCaTBWN2IvcHFLUmkrbGNJWStjRW1vbDM5UXkxMnpi?=
 =?utf-8?B?aGoyZisxa2EwVlRnakZRTTZCQlRWT2xJTnJDMUtvbC9XQVh0eGxtUzQrOFUv?=
 =?utf-8?B?SFUyUG15RnY3Sk9TQ3VRdU5sbmlSQUxDVVhoSlJFM1FwZUVCWEhrQysyMlkr?=
 =?utf-8?B?VklVeUZGb2wwbDJSd29oL2Fhd01YTEtjV3psZHBoMC8zVkhxR2V3ZER1RExa?=
 =?utf-8?B?cDd0TEcyT1NqMmhpMXJxRy84VHBIK2s0am5wU2JTZG9hdmFkaVY4ZmpSOUho?=
 =?utf-8?B?M3ZBTFFxaTRCaUxURmQwdm1WRVM3TlI4eGt1TVJrcUtlbktEaUpWTlp1cEFO?=
 =?utf-8?B?aGUxSTZZSVdrQWx4dUtNVVBYRUFja2pjR2NhU2pKQ3VFalVwMU1jVUJRQXZC?=
 =?utf-8?B?MWFaRTMrMXFJcllUaXB1NFNuc3p1YkNFcGFlZWU1dU11Y1NhWjZ0amNqOFhR?=
 =?utf-8?B?YWNINFRrVDhLQ1BDWnFOK1FTeUZZK005cVFEWVhsWWtYOXVhVmEyMTdtbzBk?=
 =?utf-8?B?a1NPRmxreUNlbTZ0czR0UXhKM1dBNVZxRkJ0NzFmV3pPUzlQYTVXQVd4UnNi?=
 =?utf-8?B?UG5FemY3c2JBTDJHSWloaGxrbmRGUjJlWGxTSE90RGw3NkVvTVJGWTVkL0ty?=
 =?utf-8?B?Mkp6OU4zcTljaVk3SnJRYzFwVFdCM2FFUWtFTGFpUkRRWUZscXFqck55OGxL?=
 =?utf-8?B?MEFvMU5yS1VTcTRqejF5ZlJPN0FwMlB5WkhCWUx3ZklUTUwwenQrVjBqUzc5?=
 =?utf-8?B?T2ZtWlhGWXlGOXhBdHQ2MXV6MStzSWJoYldDSkZiSFI2WDlibk1CZnMwb2o5?=
 =?utf-8?B?U2FQbzhUTUIyUk9YT011dHU3OUlUVEVncmRqQmF1aXYzaUNpYjliSzBtQ0dE?=
 =?utf-8?B?MVhpZmc0UHcraWY1VHJkaGF6QlBKQVc0bXFYQlZxNGhBcmE2cDNRUjl4YitQ?=
 =?utf-8?B?alQ5Q0YzUUNRMXJ2VGQwQXVyQ0phTW5NR2dNWXQvV0Y0bjlJZU9wcnJnRlNh?=
 =?utf-8?B?LzBZMzN2M3MwREVQa3c4a0xIMmt4WG4vYi8rZmsyWWlsRVBsdFlaYWRSVjll?=
 =?utf-8?B?OVpFUk5aUmlTYW1mR1MwVDBVTDRLTTNlMkphYkMxWk1FeUNvRHEyeWxLamFG?=
 =?utf-8?B?bnMrQkhrVWRxLzZiL2xOeWFRU3V5ajV4YlgyK21zSzYyM2gzSldVZndmbjVx?=
 =?utf-8?B?NXZsZ3F6bmZyUGxDQ3A1Y01ZTlVsRmZIVGc0b3lyVVUzUkVaQnltMzNRcVcv?=
 =?utf-8?B?eUkzazMyaHFYRjdqblRYMDdyaTlvRUNSREJGZERHYm9ISHBDMEtwZWhIK2xI?=
 =?utf-8?B?blJwYklmTWwyZmRRc1dWL0xxa0FmQnRTRFRqSmVsS04rUHNmNEh1dklWcEFT?=
 =?utf-8?B?R1FDZmZ2TlVTUFhJZXJEbDdtVVBLWGZNM2RwT0ZhWXpocGhyZVlpeGN3YXZK?=
 =?utf-8?B?VFNxMXdSSFkrTjdYK3MvRndzWVZGNFNnK0VsaFZMaHdXWE8xdGthYU5vT2Rt?=
 =?utf-8?B?Q2g3alpSNFc3WjFUQkM0dXRGazlIRjR1blEzNWpPU2xRaS94cEJvdmRPVUl3?=
 =?utf-8?B?d09xcDZ1VmJ6NmhPUkdORm9aTU11SmlZaExoSWEwaWJBTEROcHpwdWJvMkcy?=
 =?utf-8?B?cDRIWTdtUHR5ekVzWWJKRmpWbnl3a3VXVklsNVVobVZwRTNjNG5DMHRhWVZ4?=
 =?utf-8?B?QVV3b0VMVDZXQ0V6ME43STBoQkdJVW5Wc25oRGYwcnEwalYyYTdjazkyV1RE?=
 =?utf-8?B?TFZKbklPOHlXcTZUVGpZanNIbHIzZkUyTFN6VXdlTWpzS0VXaG5KOENPN1F6?=
 =?utf-8?B?UHYyNGtwQjlEZjJ5NzlQS1FwZWVpWlVHZWkyRzAyVFkrR1pEdFdTdmc0ZklD?=
 =?utf-8?B?dDRheDFpN0E3T2FVcnZSR2lTcXI5czdzbEdPdmlVbURDaDA3Mi9oZWNUQzhT?=
 =?utf-8?Q?aNQOj+/KpIvoqdPy5FXlksWQS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 08153825-2776-4bae-fd64-08daa1fbef37
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:21:05.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 90thpdZ+7ascPmET8G8Q1+v8htm+KxP3TkK9JOZYU9PK9Ik0ELFKOqordqo1FhByItd0Oyz+WLnVCiR4NAICIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-Proofpoint-GUID: ZKeI0rJyDEucGvIVYfu-mPf_C3w_g_7n
X-Proofpoint-ORIG-GUID: ysoqNJdrx4aFry7IHIfTEvVadwsd-Siq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28T5eLtF020245
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 09:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171178

On 9/21/22 17:08, Richard Purdie wrote:
> On Wed, 2022-09-21 at 16:03 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
>> required by target mesa any more. But it still fails to compile
>> mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
>> without this patch:
>>
>>> ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=
=80=98nir_opt_move_block=E2=80=99:
>>> ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining =
failed in call to
>>      always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function cal=
l with a yet undetermined callee
>>>   src_is_ssa(nir_src *src, void *state)
>>>   ^~~~~~~~~~
>> So only apply it for mesa-native.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2:
>> * add comment
>>
>>   meta/recipes-graphics/mesa/mesa.inc | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
>> index ea7ed4fd27..913aec987d 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -22,9 +22,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/m=
esa-${PV}.tar.xz \
>>              file://0001-util-format-Check-for-NEON-before-using-it.pa=
tch \
>>              file://0001-Revert-egl-wayland-deprecate-drm_handle_forma=
t-and-d.patch \
>>              file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-=
driDRI2.patch \
>> -           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-er=
ror.patch \
>>              "
>>  =20
>> +# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUI=
LD enabled
>> +SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-AL=
WAYS_INLINE-compiler-error.patch"
>> +
>>   SRC_URI[sha256sum] =3D "22ced061eb9adab8ea35368246c1995c09723f3f7165=
3cd5050c5cec376e671a"
>>  =20
>>   UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> This still generates warnings for musl builds, e.g.:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5882/=
steps/11/logs/warnings

Hi Richard,

The warnings are related with binutils but not mesa. Would you like to=20
review it again, please?

Thanks,
Kai

>
> Cheers,
>
> Richard
>

--=20
Kai Kang
Wind River Linux


