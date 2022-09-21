Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AE1C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 07:53:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3832.1663746792258896264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 00:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=dlgzNX4L;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62635da6bb=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28L5ooGY027685
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 07:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=VNz5a3cx5h0rXR1J24vNcRN1ltwGnmDspdR/LPPcPOE=;
 b=dlgzNX4Lg6iHJSzbRsun3dQKXCLOLtokNlYGLknowQqwRWlBlkdRXzOW2uCtycrXWVUM
 fLdJrXVcDqiRUpBDd3v0q15avJhsQgBFBx+uGfhqLhZRFpv7TI5BwVqkSeyI93QCDEma
 w7SdEndUcv+WtdAvm4hgY/fffwQ9d+jvlKdBgR3mHxZhqSfUarI0Ra/FHYvmxqaxniXc
 HKI5z3sDCq0i5fjITOdPo1nK4doQU8ixJIdw12d0ipRQmBKOKvtPTInJVLtQGztB5YUL
 uHEtEh5yhTjJc3DzgnUXkYwMMEBRvhbhsT926BjXSwWPzCLvyyrVb0SxrKa8TlRLgxhf vg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a39m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 07:53:11 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L7pp9K032157
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 07:53:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a39m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 07:53:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdddWa9GATVAwGIEbtjRy3avkUkAMyOMHx5g5Za5FXdMR28eTLFHm8DKyjS0gCb0v2u4vzuH14SjHnTKr8G23GXtms5CjwzKUXHYzPlzOzbY2WjNZ32mhFkW0QtLri/qy3wt1PK7VDov0FT/Ml1cd5nRj8wqP/UArCSkyjToxTAkl0sh57xqVQeDHED+M/kFfRyLyPFtF7Xwxkqrv0t0NXwzkLFuPyXnzFNYVhdJForhG8KKh+IAyseTHiA7epSqY+r/jxgN8qm2DTlKmRLx50cS9rlVAw1NDn9wQJzPF20mB4Y5QIQjtDhAPffTp5q46tT0Sdc9HPELOPZ0QoLIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNz5a3cx5h0rXR1J24vNcRN1ltwGnmDspdR/LPPcPOE=;
 b=DmdFwSVpw48rOs+vm3u3LpvYWqg/rqp5EEQR2dKxPHOIQa6VbUdHfV/ulDbqXAKPRHneWXzyL75mzq/dmk5tXa4jA3Lq4SyaB2QfNcx2et42OHHgIvLq1844PcdBOOXnx7VjNuIitTDdu8f6Zj+rBFW09C81RIOA3TzApEMFXQoyJcg6k8V1SWq/3NymKhmaPiWCLVBoQhSlqeruOIjOTts6nvmdxojKHH55ma23uWKmcAk1PI3XYBQi/xYoS28sDALma7ylT/aTQSic6l0baHV+GQ7xyq3/RkIKU9eMcFpXkANbIyTO+MVWCo3oGCFvP2/M6bBOTXuXMxmy9o9LQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14; Wed, 21 Sep 2022 07:53:08 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::ef40:941e:d951:8a0a]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::ef40:941e:d951:8a0a%6]) with mapi id 15.20.5654.014; Wed, 21 Sep 2022
 07:53:08 +0000
Content-Type: multipart/alternative;
 boundary="------------wE0AR5kp9nAYnY7e07QAgiZd"
Message-ID: <9cc7d0ea-b668-67ea-e6da-1d80883af9c8@windriver.com>
Date: Wed, 21 Sep 2022 15:52:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] mesa: only apply patch to fix ALWAYS_INLINE for
 native
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
References: <20220921053109.10792-1-kai.kang@windriver.com>
 <CAMKF1spSdz4AhZXrv98hKTKRAR3Q+fWSe3dCr1OQ3hU9U-hr4A@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <CAMKF1spSdz4AhZXrv98hKTKRAR3Q+fWSe3dCr1OQ3hU9U-hr4A@mail.gmail.com>
X-ClientProxiedBy: TYAPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::22) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ca8fed-07ab-4288-fb81-08da9ba652c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fy1cbr+s5dbySTr1Np56hgkuqJrmpjYvvarpQEOQGSGdYz+U7yBo9ZcqtClaihRFItClSQ5XY7Xss9oR0zVww/x3Me/EI6iJ4T8R8c/2BVbXPPRKqV/uJS3KWpav3lMTMwv51vJ8/hKR7aU6moTYMMrym4fXfYA/oe+2Su5Fm9n0yMGUjOZKXp3evZBa1RVoy0H12a7eZLBsBTLZOHWasUZIGYYgcm3mazqz7S8HElsDPE8QExOzCcDPzzF8qIb1l83g/a54HB0C/Cuf184MO34wLUgw8ewWINdy9hUxULTeqseUL6cGeaKoBxEj5wkHq8T366zvhAyqaeBsMlL6B40sZqMVYxEIOWw9AB3wLDzrpoDFlg2gAkdlaOiLjd0ZQ7KWXwVFZ+TvgcjsBg9sU1aSsH7nXIGaKDjipDVcI+oOuiriKkJTEb0xxxwuHC5lShAVVT2ktZnVjtMS2S/XlFpYCFXEpIXvTxRI/gzOkx8IkJNeCkSO7aYY9++vIJcuD+OoTK9YKkJ82ElPW1Ot7QODvpA2sHqg5OmL8RVRMUvKV0A6XlBa0zuebNixxR4MZrfyfZbc0kLd2+3SeU8zEMa3D/QqJCi8E6t3PC3zvS1MxeqwxZ5BL3YTJCANMqEJg+NsLmvSoghdqb8tHq+299DhYRzic/YXBHAP0q0chR0pJDVoDx6SZF47xKrvHF71R4pxiiE/a8sjccthkuv+J8f/zEchPB/C9crlD2OFv4V3Hx4gniennXCXvc0XiEBw71E9GbO7M5R7ZrSTlCqXpt7BTcBRdtO8Xf7GYiZpkmeo9aOAkTEnlIdOuN7Bqc1wLTu3OrMwlMaCCB34ZALvhp3kDAXzSVUtUa9/bXsNE6Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39850400004)(136003)(366004)(396003)(451199015)(316002)(966005)(83380400001)(4326008)(8676002)(36756003)(66946007)(2906002)(66476007)(66556008)(86362001)(31696002)(38100700002)(166002)(478600001)(6486002)(31686004)(26005)(53546011)(6512007)(6666004)(186003)(6916009)(2616005)(5660300002)(41300700001)(33964004)(8936002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHhtMk5IQTFrQThKaUlhQ3ZITU5QWmpHUExoZGowNkwwTEVzOXRhUENkNkpj?=
 =?utf-8?B?UGxNWUVUbGx6UTFmc0hqb3BIbStWdWtVNExIWkRZeTNtZ21sZ2FqSWZnNDRO?=
 =?utf-8?B?TGtZTWp4Zi9xNUZUNEM3OEdCTjJEMXV4a0FLZmsvTlVLS2VzODlDZU5zZ1hC?=
 =?utf-8?B?MlN2K2tWblh4YWVLeE5pQVgxVU13bTJpTEwxYVhTY1BtZkV6ZGhLUHhQb1JD?=
 =?utf-8?B?d1RqbjVuOFlBQ3EwNzd1TWtlczVRVzJBZW1oaFVYakFTczRMRmE0SzVBT0xo?=
 =?utf-8?B?Z2hrVmMyemJrd3NINWhmbnhPSDBZWGVMS2pQTUg2eHUwcUJTOHMzRTA1dVpw?=
 =?utf-8?B?cjUydDNRRDh4LzZPZm5VdzhpZWRnQVo0TjVrelU4aEZSczljY2szenNjZjhE?=
 =?utf-8?B?ZGd1aFcrWWJSNHpKaFBuRlJadmFjYVIycENKZGNZNkpNdVdNSjk5UW5OUGhV?=
 =?utf-8?B?MlJiUjZTWlVZbHV1TGZrUHg4R3NUR1RKQkxkb2M0QVZzYjlwL1FQSWtid1J5?=
 =?utf-8?B?RVRubUNHTFpJSElXa1lGTmpnL21XbGVrdk5qU1l3Z3hSYmJTN0tvVXMvVEEw?=
 =?utf-8?B?ZFJDbmVPdEs2VHY5Z3Z5b2l3MEtIMDZ2bEM0cFNEQndDa1lBcXoxbUd0T1ZT?=
 =?utf-8?B?UTVIbzVMeVNJMFcra1EzUFladUpPQVEwaDNwWmhRdlZ4RnAzbzlFNy8xRWNM?=
 =?utf-8?B?TkpuOVZYbS93Um5xb2lxdHpYdXZzVzMzYTBFTWVIRXpWUHRoZ2x6aldFdHM3?=
 =?utf-8?B?M3JmWlE0bVljaElYNHowS21IZ0VmcUsvaXBOYlZyR2VOcTlhMmQ0YllvT3U2?=
 =?utf-8?B?UXdTTDFLQlpGZk92ZHVxSVlOVzluS2RDbEd4NEZ2RHBWSlAzdVMyb2hoR2hQ?=
 =?utf-8?B?Y0RCQ2M2TlBRQ1BWeDNwY04zSTI4UEpYNjJ3ZUpMSUR4VWh4a0ZoZjk4eCtX?=
 =?utf-8?B?ZWJUNkQ4dUdqbVJaQVpVRmtCSnlRTXpNTE5UdzRTZllkUGNsWkNNTmx0TWZ0?=
 =?utf-8?B?blJvVEVrTldBVTJ1TXJPb1JMalJ3dDdnREhodkJRbmxkMEl3c3hSN2d6dzND?=
 =?utf-8?B?Y2tMc2owZ3Y5Um51cFRSeVh0bU1xNzRBUVA1V2lPcjFJenowRDJNZlZKMURS?=
 =?utf-8?B?QXFoeHIrajE3SFZWN0JNMHVNaG5jRWFaMjV2NFdWR2RwSHlRSyttdDBqd0hq?=
 =?utf-8?B?M0hzeFM2UElETDBxNHV6T3ZqM3lrSUdDOEZnZzkrVDlRYWltTzhrbHY0Tkp6?=
 =?utf-8?B?OFBoWkNFS3JpcDRiN0JmOWh6Z21FZzVveThHZTdsdUxuMDZhUWd1MFY1YjVX?=
 =?utf-8?B?d0NlVHhoSjlwemxrK2xlU1VQRE9mdlQrT2RYTnJzdGRXSTdzVVpZaEQ3aGVU?=
 =?utf-8?B?dVB0ekNmb09jS3owb3hiU1hBYlRNeEY1YW5kbS82M1Z3NllqK3NNcXNjb1NS?=
 =?utf-8?B?b00weDR6bllKR0VMT3B2azNKL3d5c2hrUWwvejB6N3JXWFVOdHowY3BGYWc0?=
 =?utf-8?B?R3hGb1VFOTNadWRIamlsMkJKWnlGdmdSd2k5RFlndUZvQTl1NjBpTTN6M05B?=
 =?utf-8?B?NlpzZVVxeGJXVUpJN0tORjRzcFA0Z0Y1SXl6cUZHMTF4RG1jMGV2ZFQzNHVQ?=
 =?utf-8?B?QUdHdVByNHhKRndsWjdWRmFYdWhGWnhrbDFvKzdFZjFkb1pVVzJFMkszY3lp?=
 =?utf-8?B?NkpxUnhFekJiQzBsVTN3SzlhUG5BTGNWcldmNTNQM0p5SGtySlVXQThrQjBK?=
 =?utf-8?B?V0k5cUp3T2V5TnlWN3FnZWRNR1ZOQmlpZGdHWmhOdnVVUTA1WU1IeTV0S1lB?=
 =?utf-8?B?UW9Wc3VYbi9XajBCVFF2K3lXUGVxRzhRQzhqMHkraUhDNmZwUjhSaElNSGxj?=
 =?utf-8?B?dytwalg0SFdveVJLVHIwMFh3TE9OTThmNzJJTDk0bG5ueWF4MlBtY2ZoaXgz?=
 =?utf-8?B?TksySGVDU2F5dkRheDNoQ3ZSR0J0YW1kRlRCdnRyVXkyU1ExQkl5UGowM2Ev?=
 =?utf-8?B?Mm5KY1pXemRycnZWV2hORVpSNDBJT2hKTytrUWtKcXVPNElZWUxONXpjN0Ju?=
 =?utf-8?B?MmdrZnhQVFp2cVNsZ1o5djkwYktSQml3UFJoRVNsZVhHRG1DZG1yZ0hUM0FS?=
 =?utf-8?Q?vv8U9tOnkLGkju/hzwBgluHZF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6ca8fed-07ab-4288-fb81-08da9ba652c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 07:53:08.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DZ5AGxiEKvElOLvrssAv+oE7vhLAVxd5jDTfIrpDR1Ll73TNRdVOAz/f2wbxYSUqIzMTMklBBAs49k6O2RfsZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
X-Proofpoint-ORIG-GUID: FHjrvAtYKsJXHXRwogUGfQQ-SRFXMU-Q
X-Proofpoint-GUID: g_cauxLuHjnjyKwr06vMYLYgzagVDQux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 07:53:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170935

--------------wE0AR5kp9nAYnY7e07QAgiZd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28L5ooGY027685

On 9/21/22 15:49, Khem Raj wrote:
>
>
> On Wed, Sep 21, 2022 at 1:31 AM kai <kai.kang@windriver.com> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com>
>
>     0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
>     required by target mesa any more. But it still fails to compile
>     mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
>     without this patch:
>
>
> Perhaps add a comment on the recipe as well so we do not forget to=20
> remove it when Ubuntu 18.04 is dropped in future

OK.

Kai

>
>
>     | ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In
>     function =E2=80=98nir_opt_move_block=E2=80=99:
>     | ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error:
>     inlining failed in call to
>     =C2=A0 =C2=A0 always_inline =E2=80=98src_is_ssa=E2=80=99: indirect =
function call with a yet
>     undetermined callee
>     |=C2=A0 src_is_ssa(nir_src *src, void *state)
>     |=C2=A0 ^~~~~~~~~~
>
>     So only apply it for mesa-native.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     ---
>     =C2=A0meta/recipes-graphics/mesa/mesa.inc | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-graphics/mesa/mesa.inc
>     b/meta/recipes-graphics/mesa/mesa.inc
>     index ea7ed4fd27..c306c6b726 100644
>     --- a/meta/recipes-graphics/mesa/mesa.inc
>     +++ b/meta/recipes-graphics/mesa/mesa.inc
>     @@ -22,8 +22,8 @@ SRC_URI =3D
>     "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>     <https://urldefense.com/v3/__https://mesa.freedesktop.org/archive/m=
esa-$*7BPV*7D.tar.xz__;JSU!!AjveYdw8EvQ!dbbFFL5lCMGNpfGo89Tb3Dh3mIAaTcrL4=
Yy04D-dUFftLJBFkOJLoY51QCvQNTuqbJxjJgVayxu3G8vvmg$>
>     \
>     file://0001-util-format-Check-for-NEON-before-using-it.patch \
>     file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.pa=
tch
>     \
>     file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.pa=
tch
>     \
>     -
>     file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch=
 \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     +SRC_URI:append:class-native =3D "
>     file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch=
"
>
>     =C2=A0SRC_URI[sha256sum] =3D
>     "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
>
>     --=20
>     2.17.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#170930):
>     https://lists.openembedded.org/g/openembedded-core/message/170930
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/170930__;!!AjveYdw8EvQ!dbbFFL5lCMGNpfGo89Tb3Dh3mIAaT=
crL4Yy04D-dUFftLJBFkOJLoY51QCvQNTuqbJxjJgVayxufAyqgrw$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/93820842/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9382=
0842/1997914__;!!AjveYdw8EvQ!dbbFFL5lCMGNpfGo89Tb3Dh3mIAaTcrL4Yy04D-dUFft=
LJBFkOJLoY51QCvQNTuqbJxjJgVayxs-kZQkXA$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!dbbFFL5lCMGNpfGo89Tb3Dh3mIAaTcrL4Yy04D=
-dUFftLJBFkOJLoY51QCvQNTuqbJxjJgVayxvzfSij7A$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------wE0AR5kp9nAYnY7e07QAgiZd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28L5ooGY027685

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 9/21/22 15:49, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spSdz4AhZXrv98hKTKRAR3Q+f=
WSe3dCr1OQ3hU9U-hr4A@mail.gmail.com">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 21, 2022 at 1=
:31
            AM kai &lt;<a href=3D"mailto:kai.kang@windriver.com" moz-do-n=
ot-send=3D"true" class=3D"moz-txt-link-freetext">kai.kang@windriver.com</=
a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">From:
            Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=
=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">kai.=
kang@windriver.com</a>&gt;<br>
            <br>
            0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
            is not<br>
            required by target mesa any more. But it still fails to
            compile<br>
            mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with
            gcc 7.5.0<br>
            without this patch:</blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Perhaps add a comment on the recipe as well s=
o
            we do not forget to remove it when Ubuntu 18.04 is dropped
            in future <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>OK.</p>
    <p>Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spSdz4AhZXrv98hKTKRAR3Q+f=
WSe3dCr1OQ3hU9U-hr4A@mail.gmail.com">
      <div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)" dir=3D"auto"><br>
            <br>
            | ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In
            function =E2=80=98nir_opt_move_block=E2=80=99:<br>
            | ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1:
            error: inlining failed in call to<br>
            &nbsp; &nbsp; always_inline =E2=80=98src_is_ssa=E2=80=99: ind=
irect function call with
            a yet undetermined callee<br>
            |&nbsp; src_is_ssa(nir_src *src, void *state)<br>
            |&nbsp; ^~~~~~~~~~<br>
            <br>
            So only apply it for mesa-native.<br>
            <br>
            Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">kai.kang@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/recipes-graphics/mesa/mesa.inc | 2 +-<br>
            &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/meta/recipes-graphics/mesa/mesa.inc
            b/meta/recipes-graphics/mesa/mesa.inc<br>
            index ea7ed4fd27..c306c6b726 100644<br>
            --- a/meta/recipes-graphics/mesa/mesa.inc<br>
            +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
            @@ -22,8 +22,8 @@ SRC_URI =3D &quot;<a href=3D"https://urldef=
ense.com/v3/__https://mesa.freedesktop.org/archive/mesa-$*7BPV*7D.tar.xz_=
_;JSU!!AjveYdw8EvQ!dbbFFL5lCMGNpfGo89Tb3Dh3mIAaTcrL4Yy04D-dUFftLJBFkOJLoY=
51QCvQNTuqbJxjJgVayxu3G8vvmg$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">https://mesa.freedesktop.org/archive/mesa-${PV}.tar.x=
z</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-util-f=
ormat-Check-for-NEON-before-using-it.patch">file://0001-util-format-Check=
-for-NEON-before-using-it.patch</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Revert=
-egl-wayland-deprecate-drm_handle_format-and-d.patch">file://0001-Revert-=
egl-wayland-deprecate-drm_handle_format-and-d.patch</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-swrast=
_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch">file://0001-swrast_=
kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch</a>
            \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch">file://0001-nir-=
nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
            +SRC_URI:append:class-native =3D <a class=3D"moz-txt-link-rfc=
2396E" href=3D"file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-er=
ror.patch">&quot;
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch&quot;</a><br>
            <br>
            &nbsp;SRC_URI[sha256sum] =3D
            &quot;22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5ce=
c376e671a&quot;<br>
            <br>
            -- <br>
            2.17.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#170930): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-core/message/170930_=
_;!!AjveYdw8EvQ!dbbFFL5lCMGNpfGo89Tb3Dh3mIAaTcrL4Yy04D-dUFftLJBFkOJLoY51Q=
CvQNTuqbJxjJgVayxufAyqgrw$" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">https://lists.openembedded.org/g/openembedded-core/messa=
ge/170930</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/93820842/1997914__;!!AjveYdw8EvQ!dbbFFL5lCMG=
NpfGo89Tb3Dh3mIAaTcrL4Yy04D-dUFftLJBFkOJLoY51QCvQNTuqbJxjJgVayxs-kZQkXA$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://li=
sts.openembedded.org/mt/93820842/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedd=
ed-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!dbbFFL5lC=
MGNpfGo89Tb3Dh3mIAaTcrL4Yy04D-dUFftLJBFkOJLoY51QCvQNTuqbJxjJgVayxvzfSij7A=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://=
lists.openembedded.org/g/openembedded-core/unsub</a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------wE0AR5kp9nAYnY7e07QAgiZd--

