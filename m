Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF1DC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 02:00:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3032.1646186408395451078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 18:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=PakodvnH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00607f2e0f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 222208LM002452
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 18:00:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Q3GsY57sSY6zQWwmy3qjaJXdo45c2JxPfH+XrUMtaJk=;
 b=PakodvnHQedOBAGMj7tcqhDl5j6DABXwJo6cPZQW4OctV8Hbq0JxauCAgaqns4W1948M
 sOA9FX4Rml2bZNsixr84HvwfpA7BCRCI4V530o1+LPa1ZZm4WgxKq5Io9J49k9meUtfd
 wPwDpXWLsrznJY+8+F8n43nrdP6Mh48jlvxfAhhK1R9D/PWxj6rRLhZpaiuattGaOc2Y
 2SWVmg1hNSFbk8ngEnyGm78Ub015tEyWfLtp6VW+sLa/rvuuHlepSsv//NMjhtZk3+L4
 V50RpcDGU5H5O7gzM3xDL8FuesjD31UJEt6X7xNcnk+KWElajQJO3aIjEECxLqN9xThr Tg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh7ukh1w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 18:00:07 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 222207fC002443
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 18:00:07 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh7ukh1w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Mar 2022 18:00:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BklLoML9aLgDL6qBmuKRRXJUcA4RwfOrJTfT0LfsUAhiwr2GMZw0ordGLpSpbrwvKPzixkAtOcVA6lx1wTwdSOapTZAFTKKVefbAf3MIz7PukcL40SHOK7PNJ4xUdhPyV2EG4PQj7q+OdqQ7L1VUG63/OLb318gDJm6Ofjqt8H1iIP4+2ABWlL7po6g7jy8qr8WARoSJ5qGgbfmYfIbz8EFIYltZfHF/HGA2Q6FAmKkknfyAIei6fMi0HepXLLg1iEHuLerMdeUO21oAUG6jMmmV1JsJ7pyEvKkfLj68d/USBXwziJMyH2OTxNiPIl15EpITwqyo+zBSA613hv9heQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3GsY57sSY6zQWwmy3qjaJXdo45c2JxPfH+XrUMtaJk=;
 b=YcR4Ol0ZHUpP7V4eUqPkUrEkmd0h+RbUrJ/4w6TZPaJ6u8vNR1qz0j0zKGuOJg8uUDHmgmr3gGjr1BK+imSOruGiuGZMFuJsaPxuRMmXkQsazO0Cbbu3DIJL8gT8gJEla6D3Gj0rFDxli+ZekLo5HmiJYNNGWYcDmdA3ylTj2/9DB3erUQf5gTpfZChobmR6bOGTE/MfgCsGtAAwAbFPmfmW3tBYcyennT3DtJGqJabQqpUNPrdUMAgVtZc9Ax2gTSqJFKcq7oiPSxTTRvOaq3KeHvUBW9cB86Rm96SQH5cMw3l8BwNd1wzf1ux0FFEHo7EBCm3Hdy82Xu02SRgyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 2 Mar
 2022 02:00:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97%7]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 02:00:04 +0000
Message-ID: <6e10eedc-d789-5189-6c65-1747a1d94665@windriver.com>
Date: Wed, 2 Mar 2022 09:59:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core][PATCH] multilib_global.bbclass: fix setting preferred
 version for canadian recipes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org,
        Ross Burton <ross@burtonini.com>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20220301081218.25469-1-Qi.Chen@windriver.com>
 <9ee751152333845c93c411b467090f007d63c9b3.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: 
 <9ee751152333845c93c411b467090f007d63c9b3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b270f91-02f9-4fa8-4517-08d9fbf05dff
X-MS-TrafficTypeDiagnostic: SA0PR11MB4527:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4527784A77E7EFCDD74E81EFED039@SA0PR11MB4527.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TBADTAunsWLKVOe1OEERuTdvLGw/u/xEdf91k6N/4YqEP2ewJKhq9A2zilljxLHwas4Z9AF7sf2knnZ1gu4RDEUvGDfzq2tDFEe2yXP9kSc5kCvS78DuUQuVaStAqYP6QJSzr5EU2Jz3nL6Hy16dc5RUDHFIu6HmPSZATZIvf91VQkZ+3GPSbv93av0kEToBl6x5dAujbGg8Vvur6S4rx4KfT4n6IJUNQu61O3u4ocX76a3QE210w5KbOdT2OM8yzwniR+PUwqgQibhQ5H6qeh0h+i/N8G/MU7hQ+MRV2OKrU8yr+CV8VAPytHRarL2fsbwxMGxKVn/X7cKTvPMN4IgN8h4cQW1DsWp2seuPCkn983fCxZMMOpkxq5OotlxhiwG48JSidNQMn0DkrJYygqFv0u2C3IvjJEY02q1J9mEqua7dOa4Ipe5ooxh9mU69oNxHDMmqCszX1lQlmYVbW2kwvFft/W3Rt1fNw3qVz9aakcgDW3Jcjwr4gUBYbgyG2RyFC5rTDRwzQB/5WZ4O0A4lNlINZdGCKqrQLfDhNHB1lriEWEm+BYQiDXKyoXayMNQ1nt8onvQRgq4BaG3vbwap2XhM4M2dk+FZbwxObCiRhUXQdgVmLBoZ0mEE+y71K+jWyUTOTKrk6rq8hk1KkAy0ZpesRFWRqJqKvh9p06e4O7Lw4qgYAJtbDvrPBj+/sSyBcZlZpwNacFvnGxmNJmhUl2ZhpwBTfkFH6c3MlxTGBpkuPMNrwZgcfEGE0Jo7WZBox07R3Vd0RVAFwToOKg0ksDF8++76slpKwC4iA0gDjvnsF83JhW2elhGitr1MmkhCYx2+r6lWxTSg+R60279kZD2KjMBJf2FH7hdMeq4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(38350700002)(38100700002)(6512007)(4326008)(66476007)(66556008)(66946007)(2616005)(2906002)(86362001)(31696002)(26005)(5660300002)(8676002)(83380400001)(186003)(31686004)(6666004)(36756003)(966005)(508600001)(6486002)(316002)(110136005)(6506007)(52116002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHM1dEFIZW51NE5oYndCSDNFRW5MNG5EMjBHejk3SVRjOFNmY04wK2tmRUxE?=
 =?utf-8?B?b0dMT0VUOFpYdEVaak4zdGg4WENNb0JVZERRZlFJd0xNSmZ6YUdNeVY5MjY1?=
 =?utf-8?B?eGZJdS9leGtSYllYUS9wcHIxWTNNL1RDSWtiLzc4ZDhsTGg3RVNkZEgyaVJN?=
 =?utf-8?B?OFRyWnU3QWVQaThwQVVUb2pnYUMvSjRFVHgydEJGOFphNkw4Rkg3amRuMW4z?=
 =?utf-8?B?SkwzQXFIOWpPQXV1UDl0aDVSb24wKzgzUlFOZjJCeFRPWVJsM3YxOVJnQlVj?=
 =?utf-8?B?ZHN0Z3FPamtRVFJVZUNxbk1IeVpGZUFrMEdhb21qTHV0UkhHK1FINmkxQ0d2?=
 =?utf-8?B?S0grMG5OempnWlRHV3ZvQy8vbFBCanFkZjBPVEo5a3JMWmpYSk96SXJObE53?=
 =?utf-8?B?YWNUWUt0Wjl3RFVvekI1dGMrRVFxa3J4dXhzSlRmTGJYZlY2YVY3N1ZWSkE2?=
 =?utf-8?B?U0pyNEdyRmliT1JmKzZWbmloVFZxOHBQUjNaNisvZmxDVHlsb21LMC9tcUwz?=
 =?utf-8?B?VjlUeVZvNkVoSGF6OGlhREdUZmgwc2kxZ0RIQmt3ZTNoS1RTT29KRUJTYXht?=
 =?utf-8?B?RTlZd2hia0IwUmlaZG5xTGR0R2I1RFBvVEt3QW44bFUrUk14Q1BUOXUxNE5H?=
 =?utf-8?B?Q3FwMXdUV2R6UjZ2SDZnMURHSTVpd2UyWWNOeHZQNFQ4NzJPa1dyd2pub0ps?=
 =?utf-8?B?RzB2dm5RU0c2OXZyQkxwb3ZaQzdFeCs1M0NhSWxaQnlMWFpSTVJKZTczUkxt?=
 =?utf-8?B?SjJxNzFROVF3bGczVGNRb2RoZGpoOWpVanQ0K3JZTGhaTVZMelpYMTN3T1ZI?=
 =?utf-8?B?TVVId3dRcjEyOTRVZXdXZ0lIMEljR3JWZ28vVHVTMGdRbWN4bzEvOUdxaWRF?=
 =?utf-8?B?UHhvL0FXeFc0QjV0MHdoWkJKMWFQNHhIL01mWUh6Q3Mydk5UbzRaWlVqOWV2?=
 =?utf-8?B?d21kNkJPcnQwb0FkaUtJenRkaUlLc29LaDg1Z1pGbWtIY2FoTnNmb3Z6Z2VL?=
 =?utf-8?B?d0VUYUluS0QwNFVhUVlYVXVqTWtYTjZNTEZzc202cmFRdHhvVmNNdnprWUZw?=
 =?utf-8?B?WFhaR1RLeHREbExyRVg4WTZSRHFrNFhET240MmdPdnZpMkoyNFhvZVhBMVRo?=
 =?utf-8?B?MkRiMGdLbDBFaDViWUI2TzY1VW8vNE1BQkQrUlpwWjBGREVsdHNDQmo4RWhJ?=
 =?utf-8?B?c1Vab0lTL210UityRFlyNzlLdUFlTjdheVlwYVc4d1NianppVXpGNVNIeHlM?=
 =?utf-8?B?QzFEL0t5SmRsajR4RVZYVmgzTFA5bEVQTStsdUFnNnlmRmtPeDBVOUVON3hn?=
 =?utf-8?B?Q3UwSEVBZkVnQ1ZQZ3pjakI3R0M0RXc4K0VPNTN6WjUxdnFhdkRKWHRydW9m?=
 =?utf-8?B?ZVVVWGp0bEdEODlrUTg3N0JaWVJvRkhGY2FsdnUzdXQyT0loaklVcjJrRFdV?=
 =?utf-8?B?RG42MC94RXcrTFdKakc2TUpmUHBwYmd1My9vMzd4M2lNc2ZDeXltUExSQTcr?=
 =?utf-8?B?WWpxQUplVk9XdjFNVitmWUl6b0phODBMbmZzdjVSTFpKRTJsY1lPQllOektW?=
 =?utf-8?B?cW55eVBjUWV1MWxUczZ3WmUwdEZ0V3gyb3lNUjNsY1IxWGRuT1ZYcXlGUjJp?=
 =?utf-8?B?c3ZLS2JJWk5oUDcybWZPSmIrUEZmWjl5ek8zRVMvWG9wSGxWK1ZxQkVkcjEz?=
 =?utf-8?B?MjVvUGxFMGJqWmhrcXBKdnBEL3Fsa25Hem5taWpoQ1ZJTFVDNlBrWXdqZzZl?=
 =?utf-8?B?Mlp5T0QzaFE1QzhydFVaVkZ5Q0k1blIyZTBUdVB1d1VWUWljVXJrSmNFR000?=
 =?utf-8?B?RkpOOVdnUGpMTmlLRHRLZWtmUFFNbWhvNjZ0dW9HbWZkSXVvRFRFNHNoUTl5?=
 =?utf-8?B?VnJrdnJXS3dtV1E1Y0JvdWJRZjZOMXVCUUZQN0c5Nmt4VUlBTHhUMXV1bnlE?=
 =?utf-8?B?RE95dmYwNGNnajY3Q0hwT3oyRXo1bEYzSnVlUVRxS2RJQWdDS3JxckJpZnJh?=
 =?utf-8?B?UGxwaEFSWGF5UkVjRTJQWjM2dm8yL2N6TWhUUk1xNVNMbituTG9JZUMvTkgr?=
 =?utf-8?B?SENVWjMzNUtjM0ppVVNDelc3L3VlczZHaUNTMnFnOTZ1eTg0U1NSV1c4cGhO?=
 =?utf-8?B?U1BFRTRHUk4vcUg5aUpBZTdOcU1PWEd3MitNYzRzejJjREpCL0s2R0tmN2J3?=
 =?utf-8?Q?DYA27YC6lmrnTSf3V0H2SX0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b270f91-02f9-4fa8-4517-08d9fbf05dff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 02:00:03.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 x821Vi3Z0k7mIh5A5CqWGE1tVeH/jv9V/kPlb7PQoSZfeT73p2tLJFkl0REhnHbaWKg9/kCd0B0NOyrtcbL0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-Proofpoint-GUID: z-gjuf_nYdd5x3EDSLAClGMv-BtGI4uq
X-Proofpoint-ORIG-GUID: YIi3MfFOrRFCddzbQn2FY_brCqzUZssF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020008
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 222208LM002452
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 02:00:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162588

On 3/2/22 08:20, Richard Purdie wrote:
> On Tue, 2022-03-01 at 16:12 +0800, Chen Qi wrote:
>> Currently the TRANSLATED_TARGET_ARCH is not changed when trying
>> to set preferred version for canadian recipes.
>>
>> e.g.
>> ```
>> bitbake core-image-minimal -c populate_sdk -e > env
>> grep ^PREFERRED_VERSION_gcc-cross-canadian env
>> ```
>> The result is:
>> """
>> PREFERRED_VERSION_gcc-cross-canadian-x86-64=3D"11.%"
>> """
>>
>> We need to explictly change DEFAULTTUNE to ensure TRANSLATED_TARGET_AR=
CH is
>> changed when trying to set the preferred version for multilib version =
of
>> the canadian recipes.
>>
>> e.g.
>> ```
>> bitbake core-image-minimal -c populate_sdk -e > env
>> grep ^PREFERRED_VERSION_gcc-cross-canadian env
>> ```
>> The result is:
>> """
>> PREFERRED_VERSION_gcc-cross-canadian-i686=3D"11.%"
>> PREFERRED_VERSION_gcc-cross-canadian-x86-64=3D"11.%"
>> """
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/multilib_global.bbclass | 3 +++
>>   1 file changed, 3 insertions(+)
> This seems to break multilib builds:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4844
>
> Cheers,
>
> Richard
>
Hi Richard and Ross,

I looked at the above failure. It's not caused by this patch. It's=20
caused by the one below.

 =C2=A0 package: do_package should depend on binutils

I could reproduce this problem by cherry-picking this commit to latest=20
master branch. See detailed console output below.

chenqi@pek-lpg-core3:~/builds/build-poky-rm [2][0] $ bitbake=20
lib32-core-image-minimal
Loading cache: 100% | | ETA:=C2=A0 --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100%=20
|########################################################################=
#################################################|=20
Time: 0:00:26
Parsing of 843 .bb files complete (0 cached, 843 parsed). 2357 targets,=20
116 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/i686-pokymllib32-linux-binutils'. Close=20
matches:
 =C2=A0 virtual/lib32-i686-pokymllib32-linux-binutils
 =C2=A0 virtual/lib32-i686-pokymllib32-linux-rust
 =C2=A0 virtual/x86_64-poky-linux-binutils
ERROR: Required build target 'lib32-core-image-minimal' has no buildable=20
providers.
Missing or unbuildable dependency chain was:=20
['lib32-core-image-minimal', 'lib32-qemuwrapper-cross',=20
'virtual/i686-pokymllib32-linux-binutils']

Summary: There were 2 ERROR messages, returning a non-zero exit code.
chenqi@pek-lpg-core3:~/builds/build-poky-rm [2][0] $ cd -
/buildarea2/chenqi/poky
chenqi@pek-lpg-core3:~/poky [2][0] $ git log --oneline origin/master..HEA=
D
45d7a9a750 (HEAD -> master) package: do_package should depend on binutils

Regards,

Qi


