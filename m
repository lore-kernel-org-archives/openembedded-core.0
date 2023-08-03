Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4267CEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 05:29:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8012.1691040567673934983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 22:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ICESV8aZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=757996d9fc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3734UvZu002657
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Aug 2023 05:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=mZSndJC0yEdlaTWNcJlE4HlnVxycIlEAGboEwoPRIUo=; b=
	ICESV8aZpqF70jxxs2K/6Z5pO/ZHtq3s3FK8WW9L7RfUNWJYbSe2DDjUL4OGvZ0N
	wpVoODKnHjGWWudlMxvnNpyMSdHoYaIl84cFBOd/LobuEA0ltATbiQEyuIOhw8Mc
	ELxeqxdUPXWyXyR1q+V4IpP5i45NpN50f06VBz//IzTL+cx/9nbdQut0ohlBYF7f
	7myam4v0A8QbdTNJVpLcNaIRrzCsU4fqVJVDXslk0vU94txu6j49U8oqNa9qiHw1
	Q+4cmovft7YETImy/XB+rruUjKNLfAaXPF5eDb78Dt+qT9Y02M6tgyfq4tn0yAHx
	8bUJhguKoJbLfFe4Q4USUg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx4hmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 05:29:26 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3735Ouqb023108
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Aug 2023 05:29:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx4hmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 05:29:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSp+bp4vDB28U3TsVAEjZtdD8K9KiC47a68A8zo5nhOubUJdFCkGKBAJEIR8LFMxWSYBvKtUt6p2Y2s0tB6WD+c2rGTXHZeOAcYEe0L68DnMly8/+aJ1nx7gDu9GhGn+eCevQZn5tuN9MwubRY5++k2ccW7AFE9uxEB+XkTiugZOqQWGLOwxDCNpS8Q4wSRXtCTytjv8K9iV7VItLuOWcA5es7sEq8/3S3SUBg9O66DsWlIdcD6a7vP0IPBTHLYJAYsO2jKSQwwMgnT7ivaSj6a8uzXaoWh8WkfxeM3ontoii5IMOsmAz0iFEhIobsQwA9mg2L9wcHIg3u66m5CsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZSndJC0yEdlaTWNcJlE4HlnVxycIlEAGboEwoPRIUo=;
 b=QNey62Um4X8aq++i9GfRG7jcbzDiPm7sZj0b5M0tmeNN8Ht9s1aVUNTeYravjenE38upuBC1gM6HOC64rffuAHb1A/qKoCWvWXphknkDhMKp10ZpLFOnjXJAAGL7IV+BLU3CgL47Ttq8m7k7KrJsGDErsg4JoXiWMAfLCM9Xr4ZL8FywSegV/y6Nr3QvySMLPBeKiVrvvk6C0YRvZDO1Ls9k6JNt93hH7CvvJi/h+HCzJTCrhJ5m9XXPT2WGtmDA0ImFfpDRptYPZ7L73fQGrMzFkIzz8cYn7OyhCDdzAPbkllm1Vb3NtnLqo3hCK9F33j2F0bxrFhUDDOnK6Y+ulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 05:29:21 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 05:29:21 +0000
Message-ID: <3745c5b9-432a-e7db-96c0-8e4ab669b32b@windriver.com>
Date: Thu, 3 Aug 2023 10:56:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-certifi: fix
 CVE-2023-37920
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        steve@sakoman.com
Cc: "hari.gpillai@windriver.com" <hari.gpillai@windriver.com>
References: <20230802175711.2212338-1-narpat.mali@windriver.com>
 <9446c735a7d89e8287e75dcb5fbf93bab2f2efcb.camel@intel.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <9446c735a7d89e8287e75dcb5fbf93bab2f2efcb.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|DM6PR11MB4644:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e69a2f-d039-4c41-99b4-08db93e296dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CZfHmhGtZQHHSSGY+YkNubMA/VxfhZwv7/NOERDXA7mO64mTI5mdwDv1n23QwsXDxoeg8hWl0jdtoZZt+oYi2Qe4pxTR7yeGIV0MZLHlz5Ds/SSxu9NZsORzQiO0fMGAF6BogyQ3UZ9GGYPHYRA8zXDcO3+W4krdF8S9sKdGzczVZNddDofVRJrej7ONdFOcnXT3RvTOLn+qEMIa94FqcxEKQRV0TeqyszI7eoeqkwYHa+NUwoDe12662DyXBUjg1rEkKzmuu+lmBteZYBlE8aGTG0IpwPjs8fW4aIVE7+j+iVofML4cwFSychIeB5NXR+6pHS2EP2eJUtT4Jn7iqmi4lQfEHsYZdP/+ZqTVuEXJ/76w15ZLG8BhXomDRqjThu+HE+ebSI1uftaCdqS/5aDEm8K5XzITiYNjdQVl7y7ILkJtLLwiWuj3OmCjOKbx6o8FWHXgJgp9Vt/x3xOrCNBwT64tuwJoACcQO2PmNvts3oryXxZgR50T5sm0eVaTP1VkZKru4stC9+DXhHQOxP88qNTT1/yr6pkpe+2220tWoo8ljDzTfInqbmJeddvsCuGdTxyI1AFm6Bo28cbdE+sHriVoosWJS87VvlqHfr5mySUOczdNqUNhlObul9ooiky/gw1b+jXdbJB9CU9qlsARRp5Fn7i55gW9d22rk14=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(451199021)(66556008)(66476007)(66946007)(2616005)(316002)(66899021)(4326008)(5660300002)(107886003)(41300700001)(186003)(53546011)(6506007)(8676002)(8936002)(31696002)(86362001)(478600001)(6512007)(6486002)(966005)(110136005)(31686004)(19627235002)(38100700002)(30864003)(2906002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnJ5bzRQalVBM0J4ZGY4V0VGT3BRcnNscGhVWVU3ejNzYSt6bmh3VWwwaGYr?=
 =?utf-8?B?Si81YUgzZ1hKa21QSUw0NkJmTkJ1S1l4VjZIWG1yaHFBYVdsdDZoSVFSckRB?=
 =?utf-8?B?UXpjaUc1MmhyVVM5M2ZsVm9jUDNTblRPLzIvTnF3T0tmZ25hemZ5eXp4dUMw?=
 =?utf-8?B?bVA0d0dUYTIxRGRGcFdvamc3WjJHckN0U3c2Q3lIaWE5cUtSdWRtK3YyTWpK?=
 =?utf-8?B?SytIZTQ3QitxdmoyOWsreDVWUzdrWjRYc0ZIakdZN2lRWjllVzFoN1U0eDFD?=
 =?utf-8?B?T3JTMXg0RlExcE9yNlBXTGUwYXZiRVJZZDJSR2pxWExXTkFpRWRYUi8xT1VB?=
 =?utf-8?B?SU5Rc1c4c2JBenhzYmx6OG5YOTBPQU1TUGlVeTRLd2dVSndmL2x0S3IxMXQx?=
 =?utf-8?B?S0lqZEtCMHViT00vUHg5cC8xUGxWKzA1U0ZxN0FQN3pSSGREcGIzU3JiWFk0?=
 =?utf-8?B?Z0JHLysvU1M1SFdXUW9BTjNHdjJvYU80NE80TnVHRU1ZeHNLL3dJd1gzQzJ3?=
 =?utf-8?B?NWplVzdLM1lQZVhXeXNtNXEvcUlKbzJ2NWJzTk1nKzB1ejNTSk5iekU1OVRn?=
 =?utf-8?B?QVEzU0N2V3V1aU4vSDFncmszcWJJd1N6YnhtWU4rNjFRQ2dzRnJmekVDSHRR?=
 =?utf-8?B?MU8xNzlmVkNSZFFpYW1DN2NSMHIyRkdqN2liMFpNeDVNSVF4Ri9FTjU4c1BC?=
 =?utf-8?B?MWxsd282RlY2MTBiWFVzUEE4cWt6NlpvdXVuMjAxVGJ3N0xkSTZKYVpKSWl1?=
 =?utf-8?B?eTAxQVNrWDh1TldwSTFPc1FzdVVhY3hWU1VGQktraGd3NjdwKzdnc2trS3dK?=
 =?utf-8?B?VGRlc3N1N0J0MEtDcU1hdU1sQVFndjlBWU9aMmVwZnNIZEF5U0dNQnhhZ2dI?=
 =?utf-8?B?L2JIcnJ3aXY4ZE1KMTkwSGZHY3ovZ21pRlliVXVHNDJWUkJIZi9EbytPSXZC?=
 =?utf-8?B?c0FkUVVtYUVaVDN6VVVYS3BVc0RIVm51TE1ybWlIWWdRcVhMQVdUSlZyS2x0?=
 =?utf-8?B?d0g2d1pSbTArcEpPUC8vNjMvY0RDbU9vVzRxTUp0UVFrRnE4SmVhRnI0dzVP?=
 =?utf-8?B?OUtsUkxJbEhTN05CcnpDUDBXZTRQNTR6VlhIWmpnR2hUYzlZc2FLWUlLTDRn?=
 =?utf-8?B?OFRyMWxaZCtJUUhNa0tlaTJEZkxxOU51SEpGWnJ2ZnY3Y0dobGI0cDZjODFj?=
 =?utf-8?B?NFM1VTJtcGZobG1UZHBUY0hHY25RTFMrZDdiQ2dYa0hxVThTeTl2UXlEYU01?=
 =?utf-8?B?R3YyMjVrZ2VLZGZLai85cm1zaE5kS3pXWnJHSDhkZElNaFR4bXN4VEduWVoy?=
 =?utf-8?B?NmNzcnFJL2ZyMGc0K0pRcWN2ZVp6QkJTc1ZZUDhFV3NPNUg1MHdqM1N4eWMw?=
 =?utf-8?B?UVFpd05kZU11ZHNLb1hXTFdkQlpGM2NVVldtUzBSTGlxaTNkK2l1eElPZE52?=
 =?utf-8?B?K29GR2UzcU1MRWtVRVdycEEwR2ZEMXBFQ0dRZURybmFJOTdqMDM0eGUwWGVR?=
 =?utf-8?B?Q3l4d2lma2p6OVNHV1RPVmtBRm9RcW5tam5zdkw3alZ1OEZPY2hNOFBQeC9P?=
 =?utf-8?B?ZUtaWCtqVEF4NDFIZWFPZmR2TzgvT1hFU1BwVnl2UTJBeSt1SEZKZGw5RkMz?=
 =?utf-8?B?dHFvb3Y0VjVRWXNkZ0xYYlczUmdqVDhRNWUySC9rclZlaDBOcVMzaE1BQjB6?=
 =?utf-8?B?NnJESXNvSHlaZVU0ejdrVjd4MzFrZWdJbkl5eWNPMS9lbUdBSWFNSkkwc21w?=
 =?utf-8?B?ZEt3SXBaZ1RRNllUWENxcEk4OXVzZ1dtSEwxdjNvOU9aZjA3OHMzYklKRVc2?=
 =?utf-8?B?SmFaVUpPVUhOUE4wUnpMQ3BUTmdQcVkvcHF4dldqNzJ3L011L1QvM00rU0Fz?=
 =?utf-8?B?cnpDUFI1a1hGb0p0WjgyaTBHazR6cjQrVExzODRZREFuWXNXWHc1ajFnZDNu?=
 =?utf-8?B?UmllM2h2WTFvcVBZUndQRk1jVExLOFhlZ3hLRWFBb3FSSzVhUHBEaDc1WVF3?=
 =?utf-8?B?WnZrZVZiVTUvUi9lZWFscTlRMFNVWll3bGhHRDhMS3JuRHNVL0dVczFXK1Ar?=
 =?utf-8?B?dU1ZdGFxbDE4SjR6YW05a0IxdytnNnlIcUllaHhDOUVEeEg1enlFRW1GQThI?=
 =?utf-8?B?TjdmWXVWT1VRZXRLYW5zT1h1cm43U1FPZE42U3NVK01weDFoeE1INUlBb0ti?=
 =?utf-8?B?ZGtyZExXWEpRcmRQYXU1eWc0dFpJQWNQSjFNRTVYTkQ2aGhoenhLbGc1NCtB?=
 =?utf-8?B?R240NUxoaEpNd0dxdmxHSzhUU0xBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e69a2f-d039-4c41-99b4-08db93e296dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 05:29:20.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nh16Z34bhakDTZLSPiq4YtRXjK4qJY6zOmZnb4UNA5EretcLtqeZdpB5hptQbd4TOkdXEq/AIQ9Ru1bWtPjGRbtgzfFUVBMMl0ULqXwT+1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
X-Proofpoint-GUID: n1q2d4xCih9Mf_7mMernyFD0mv8hX5xi
X-Proofpoint-ORIG-GUID: rMFFMmi8afMIL7uS-u2qEdw_qdd5XVJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_03,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=989 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3734UvZu002657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 05:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185455

On 03-08-2023 07:43, Mittal, Anuj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I think this recipe should simply be upgraded instead ...

The current version python3-certifi_2021.10.8 in kirkstone is very old=20
and I didn't find the release notes for python3-certifi anywhere.

So, as per kirkstone policy have sent the patch to backport on current=20
version.

@steve is it ok to upgrade python3-certifi 2021.10.8 -> 2023.07.22=20
version in kirkstone ?

../Narpat

>
> Thanks,
>
> Anuj
>
> On Wed, 2023-08-02 at 17:57 +0000, Narpat Mali via
> lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> Certifi is a curated collection of Root Certificates for validating
>> the trustworthiness of SSL certificates while verifying the identity
>> of TLS hosts. Certifi prior to version 2023.07.22 recognizes "e-
>> Tugra"
>> root certificates. e-Tugra's root certificates were subject to an
>> investigation prompted by reporting of security issues in their
>> systems.
>> Certifi 2023.07.22 removes root certificates from "e-Tugra" from the
>> root store.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-37920
>> https://github.com/certifi/python-certifi/security/advisories/GHSA-xqr=
8-7jwr-rhp7
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>   .../python3-certifi/CVE-2023-37920.patch      | 301
>> ++++++++++++++++++
>>   .../python/python3-certifi_2021.10.8.bb       |=C2=A0=C2=A0 4 +-
>>   2 files changed, 304 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/python/python3-certifi/CVE-
>> 2023-37920.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3-certifi/CVE-2023-
>> 37920.patch b/meta/recipes-devtools/python/python3-certifi/CVE-2023-
>> 37920.patch
>> new file mode 100644
>> index 0000000000..62187ec469
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-certifi/CVE-2023-
>> 37920.patch
>> @@ -0,0 +1,301 @@
>> +From 2dfddd74a75e4a1fa9bb901ba31a96e13b98a4e2 Mon Sep 17 00:00:00
>> 2001
>> +From: Narpat Mali <narpat.mali@windriver.com>
>> +Date: Wed, 2 Aug 2023 16:05:04 +0000
>> +Subject: [PATCH] Certifi is a curated collection of Root
>> Certificates for
>> + validating the trustworthiness of SSL certificates while verifying
>> the
>> + identity of TLS hosts. Certifi prior to version 2023.07.22
>> recognizes
>> + "e-Tugra" root certificates. e-Tugra's root certificates were
>> subject to an
>> + investigation prompted by reporting of security issues in their
>> systems.
>> + Certifi 2023.07.22 removes root certificates from "e-Tugra" from
>> the root
>> + store.
>> +
>> +CVE: CVE-2023-37920
>> +
>> +Upstream-Status: Backport
>> [https://github.com/certifi/python-certifi/commit/8fb96ed81f71e7097ed
>> 11bc4d9b19afd7ea5c909]
>> +
>> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> +---
>> + certifi/cacert.pem | 257 ++++++++++++++++++++++++++++++++----------
>> ---
>> + 1 file changed, 185 insertions(+), 72 deletions(-)
>> +
>> +diff --git a/certifi/cacert.pem b/certifi/cacert.pem
>> +index 6bae3e4..1bec256 100644
>> +--- a/certifi/cacert.pem
>> ++++ b/certifi/cacert.pem
>> +@@ -879,34 +879,6 @@
>> uLjbvrW5KfnaNwUASZQDhETnv0Mxz3WLJdH0pmT1kvarBes96aULNmLazAZfNou2
>> + XjG4Kvte9nHfRCaexOYNkbQudZWAUWpLMKawYqGT8ZvYzsRjdT9ZR7E=3D
>> + -----END CERTIFICATE-----
>> +
>> +-# Issuer: CN=3DHongkong Post Root CA 1 O=3DHongkong Post
>> +-# Subject: CN=3DHongkong Post Root CA 1 O=3DHongkong Post
>> +-# Label: "Hongkong Post Root CA 1"
>> +-# Serial: 1000
>> +-# MD5 Fingerprint: a8:0d:6f:39:78:b9:43:6d:77:42:6d:98:5a:cc:23:ca
>> +-# SHA1 Fingerprint:
>> d6:da:a8:20:8d:09:d2:15:4d:24:b5:2f:cb:34:6e:b2:58:b2:8a:58
>> +-# SHA256 Fingerprint:
>> f9:e6:7d:33:6c:51:00:2a:c0:54:c6:32:02:2d:66:dd:a2:e7:e3:ff:f1:0a:d0:
>> 61:ed:31:d8:bb:b4:10:cf:b2
>> +------BEGIN CERTIFICATE-----
>> +-MIIDMDCCAhigAwIBAgICA+gwDQYJKoZIhvcNAQEFBQAwRzELMAkGA1UEBhMCSEsx
>> +-FjAUBgNVBAoTDUhvbmdrb25nIFBvc3QxIDAeBgNVBAMTF0hvbmdrb25nIFBvc3Qg
>> +-Um9vdCBDQSAxMB4XDTAzMDUxNTA1MTMxNFoXDTIzMDUxNTA0NTIyOVowRzELMAkG
>> +-A1UEBhMCSEsxFjAUBgNVBAoTDUhvbmdrb25nIFBvc3QxIDAeBgNVBAMTF0hvbmdr
>> +-b25nIFBvc3QgUm9vdCBDQSAxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
>> +-AQEArP84tulmAknjorThkPlAj3n54r15/gK97iSSHSL22oVyaf7XPwnU3ZG1ApzQ
>> +-jVrhVcNQhrkpJsLj2aDxaQMoIIBFIi1WpztUlVYiWR8o3x8gPW2iNr4joLFutbEn
>> +-PzlTCeqrauh0ssJlXI6/fMN4hM2eFvz1Lk8gKgifd/PFHsSaUmYeSF7jEAaPIpjh
>> +-ZY4bXSNmO7ilMlHIhqqhqZ5/dpTCpmy3QfDVyAY45tQM4vM7TG1QjMSDJ8EThFk9
>> +-nnV0ttgCXjqQesBCNnLsak3c78QA3xMYV18meMjWCnl3v/evt3a5pQuEF10Q6m/h
>> +-q5URX208o1xNg1vysxmKgIsLhwIDAQABoyYwJDASBgNVHRMBAf8ECDAGAQH/AgED
>> +-MA4GA1UdDwEB/wQEAwIBxjANBgkqhkiG9w0BAQUFAAOCAQEADkbVPK7ih9legYsC
>> +-mEEIjEy82tvuJxuC52pF7BaLT4Wg87JwvVqWuspube5Gi27nKi6Wsxkz67SfqLI3
>> +-7piol7Yutmcn1KZJ/RyTZXaeQi/cImyaT/JaFTmxcdcrUehtHJjA2Sr0oYJ71clB
>> +-oiMBdDhViw+5LmeiIAQ32pwL0xch4I+XeTRvhEgCIDMb5jREn5Fw9IBehEPCKdJs
>> +-EhTkYY2sEJCehFC78JZvRZ+K88psT/oROhUVRsPNH4NbLUES7VBnQRM9IauUiqpO
>> +-fMGx+6fWtScvl6tu4B3i0RwsH0Ti/L6RoZz71ilTc4afU9hDDl3WY4JxHYB0yvbi
>> +-AmvZWg=3D=3D
>> +------END CERTIFICATE-----
>> +-
>> + # Issuer: CN=3DSecureSign RootCA11 O=3DJapan Certification Services,
>> Inc.
>> + # Subject: CN=3DSecureSign RootCA11 O=3DJapan Certification Services=
,
>> Inc.
>> + # Label: "SecureSign RootCA11"
>> +@@ -1836,50 +1808,6 @@
>> HL/EVlP6Y2XQ8xwOFvVrhlhNGNTkDY6lnVuR3HYkUD/GKvvZt5y11ubQ2egZixVx
>> + SK236thZiNSQvxaz2emsWWFUyBy6ysHK4bkgTI86k4mloMy/0/Z1pHWWbVY=3D
>> + -----END CERTIFICATE-----
>> +
>> +-# Issuer: CN=3DE-Tugra Certification Authority O=3DE-Tu\u011fra EBG
>> Bili\u015fim Teknolojileri ve Hizmetleri A.\u015e. OU=3DE-Tugra
>> Sertifikasyon Merkezi
>> +-# Subject: CN=3DE-Tugra Certification Authority O=3DE-Tu\u011fra EBG
>> Bili\u015fim Teknolojileri ve Hizmetleri A.\u015e. OU=3DE-Tugra
>> Sertifikasyon Merkezi
>> +-# Label: "E-Tugra Certification Authority"
>> +-# Serial: 7667447206703254355
>> +-# MD5 Fingerprint: b8:a1:03:63:b0:bd:21:71:70:8a:6f:13:3a:bb:79:49
>> +-# SHA1 Fingerprint:
>> 51:c6:e7:08:49:06:6e:f3:92:d4:5c:a0:0d:6d:a3:62:8f:c3:52:39
>> +-# SHA256 Fingerprint:
>> b0:bf:d5:2b:b0:d7:d9:bd:92:bf:5d:4d:c1:3d:a2:55:c0:2c:54:2f:37:83:65:
>> ea:89:39:11:f5:5e:55:f2:3c
>> +------BEGIN CERTIFICATE-----
>> +-MIIGSzCCBDOgAwIBAgIIamg+nFGby1MwDQYJKoZIhvcNAQELBQAwgbIxCzAJBgNV
>> +-BAYTAlRSMQ8wDQYDVQQHDAZBbmthcmExQDA+BgNVBAoMN0UtVHXEn3JhIEVCRyBC
>> +-aWxpxZ9pbSBUZWtub2xvamlsZXJpIHZlIEhpem1ldGxlcmkgQS7Fni4xJjAkBgNV
>> +-BAsMHUUtVHVncmEgU2VydGlmaWthc3lvbiBNZXJrZXppMSgwJgYDVQQDDB9FLVR1
>> +-Z3JhIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTEzMDMwNTEyMDk0OFoXDTIz
>> +-MDMwMzEyMDk0OFowgbIxCzAJBgNVBAYTAlRSMQ8wDQYDVQQHDAZBbmthcmExQDA+
>> +-BgNVBAoMN0UtVHXEn3JhIEVCRyBCaWxpxZ9pbSBUZWtub2xvamlsZXJpIHZlIEhp
>> +-em1ldGxlcmkgQS7Fni4xJjAkBgNVBAsMHUUtVHVncmEgU2VydGlmaWthc3lvbiBN
>> +-ZXJrZXppMSgwJgYDVQQDDB9FLVR1Z3JhIENlcnRpZmljYXRpb24gQXV0aG9yaXR5
>> +-MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA4vU/kwVRHoViVF56C/UY
>> +-B4Oufq9899SKa6VjQzm5S/fDxmSJPZQuVIBSOTkHS0vdhQd2h8y/L5VMzH2nPbxH
>> +-D5hw+IyFHnSOkm0bQNGZDbt1bsipa5rAhDGvykPL6ys06I+XawGb1Q5KCKpbknSF
>> +-Q9OArqGIW66z6l7LFpp3RMih9lRozt6Plyu6W0ACDGQXwLWTzeHxE2bODHnv0ZEo
>> +-q1+gElIwcxmOj+GMB6LDu0rw6h8VqO4lzKRG+Bsi77MOQ7osJLjFLFzUHPhdZL3D
>> +-k14opz8n8Y4e0ypQBaNV2cvnOVPAmJ6MVGKLJrD3fY185MaeZkJVgkfnsliNZvcH
>> +-fC425lAcP9tDJMW/hkd5s3kc91r0E+xs+D/iWR+V7kI+ua2oMoVJl0b+SzGPWsut
>> +-dEcf6ZG33ygEIqDUD13ieU/qbIWGvaimzuT6w+Gzrt48Ue7LE3wBf4QOXVGUnhMM
>> +-ti6lTPk5cDZvlsouDERVxcr6XQKj39ZkjFqzAQqptQpHF//vkUAqjqFGOjGY5RH8
>> +-zLtJVor8udBhmm9lbObDyz51Sf6Pp+KJxWfXnUYTTjF2OySznhFlhqt/7x3U+Lzn
>> +-rFpct1pHXFXOVbQicVtbC/DP3KBhZOqp12gKY6fgDT+gr9Oq0n7vUaDmUStVkhUX
>> +-U8u3Zg5mTPj5dUyQ5xJwx0UCAwEAAaNjMGEwHQYDVR0OBBYEFC7j27JJ0JxUeVz6
>> +-Jyr+zE7S6E5UMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAULuPbsknQnFR5
>> +-XPonKv7MTtLoTlQwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUAA4ICAQAF
>> +-Nzr0TbdF4kV1JI+2d1LoHNgQk2Xz8lkGpD4eKexd0dCrfOAKkEh47U6YA5n+KGCR
>> +-HTAduGN8qOY1tfrTYXbm1gdLymmasoR6d5NFFxWfJNCYExL/u6Au/U5Mh/jOXKqY
>> +-GwXgAEZKgoClM4so3O0409/lPun++1ndYYRP0lSWE2ETPo+Aab6TR7U1Q9Jauz1c
>> +-77NCR807VRMGsAnb/WP2OogKmW9+4c4bU2pEZiNRCHu8W1Ki/QY3OEBhj0qWuJA3
>> +-+GbHeJAAFS6LrVE1Uweoa2iu+U48BybNCAVwzDk/dr2l02cmAYamU9JgO3xDf1WK
>> +-vJUawSg5TB9D0pH0clmKuVb8P7Sd2nCcdlqMQ1DujjByTd//SffGqWfZbawCEeI6
>> +-FiWnWAjLb1NBnEg4R2gz0dfHj9R0IdTDBZB6/86WiLEVKV0jq9BgoRJP3vQXzTLl
>> +-yb/IQ639Lo7xr+L0mPoSHyDYwKcMhcWQ9DstliaxLL5Mq+ux0orJ23gTDx4JnW2P
>> +-AJ8C2sH6H3p6CcRK5ogql5+Ji/03X186zjhZhkuvcQu02PJwT58yE+Owp1fl2tpD
>> +-y4Q08ijE6m30Ku/Ba3ba+367hTzSU8JNvnHhRdH9I2cNE3X7z2VnIp2usAnRCf8d
>> +-NL/+I5c30jn6PQ0GC7TbO6Orb1wdtn7os4I07QZcJA=3D=3D
>> +------END CERTIFICATE-----
>> +-
>> + # Issuer: CN=3DT-TeleSec GlobalRoot Class 2 O=3DT-Systems Enterprise
>> Services GmbH OU=3DT-Systems Trust Center
>> + # Subject: CN=3DT-TeleSec GlobalRoot Class 2 O=3DT-Systems Enterpris=
e
>> Services GmbH OU=3DT-Systems Trust Center
>> + # Label: "T-TeleSec GlobalRoot Class 2"
>> +@@ -4179,3 +4107,188 @@
>> AgGGMAoGCCqGSM49BAMDA2cAMGQCMBHervjcToiwqfAircJRQO9gcS3ujwLEXQNw
>> + SaSS6sUUiHCm0w2wqsosQJz76YJumgIwK0eaB8bRwoF8yguWGEEbo/QwCZ61IygN
>> + nxS2PFOiTAZpffpskcYqSUXm7LcT4Tps
>> + -----END CERTIFICATE-----
>> ++
>> ++# Issuer: CN=3DSectigo Public Server Authentication Root E46
>> O=3DSectigo Limited
>> ++# Subject: CN=3DSectigo Public Server Authentication Root E46
>> O=3DSectigo Limited
>> ++# Label: "Sectigo Public Server Authentication Root E46"
>> ++# Serial: 88989738453351742415770396670917916916
>> ++# MD5 Fingerprint: 28:23:f8:b2:98:5c:37:16:3b:3e:46:13:4e:b0:b3:01
>> ++# SHA1 Fingerprint:
>> ec:8a:39:6c:40:f0:2e:bc:42:75:d4:9f:ab:1c:1a:5b:67:be:d2:9a
>> ++# SHA256 Fingerprint:
>> c9:0f:26:f0:fb:1b:40:18:b2:22:27:51:9b:5c:a2:b5:3e:2c:a5:b3:be:5c:f1:
>> 8e:fe:1b:ef:47:38:0c:53:83
>> ++-----BEGIN CERTIFICATE-----
>> ++MIICOjCCAcGgAwIBAgIQQvLM2htpN0RfFf51KBC49DAKBggqhkjOPQQDAzBfMQsw
>> ++CQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMTYwNAYDVQQDEy1T
>> ++ZWN0aWdvIFB1YmxpYyBTZXJ2ZXIgQXV0aGVudGljYXRpb24gUm9vdCBFNDYwHhcN
>> ++MjEwMzIyMDAwMDAwWhcNNDYwMzIxMjM1OTU5WjBfMQswCQYDVQQGEwJHQjEYMBYG
>> ++A1UEChMPU2VjdGlnbyBMaW1pdGVkMTYwNAYDVQQDEy1TZWN0aWdvIFB1YmxpYyBT
>> ++ZXJ2ZXIgQXV0aGVudGljYXRpb24gUm9vdCBFNDYwdjAQBgcqhkjOPQIBBgUrgQQA
>> ++IgNiAAR2+pmpbiDt+dd34wc7qNs9Xzjoq1WmVk/WSOrsfy2qw7LFeeyZYX8QeccC
>> ++WvkEN/U0NSt3zn8gj1KjAIns1aeibVvjS5KToID1AZTc8GgHHs3u/iVStSBDHBv+
>> ++6xnOQ6OjQjBAMB0GA1UdDgQWBBTRItpMWfFLXyY4qp3W7usNw/upYTAOBgNVHQ8B
>> ++Af8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAwNnADBkAjAn7qRa
>> ++qCG76UeXlImldCBteU/IvZNeWBj7LRoAasm4PdCkT0RHlAFWovgzJQxC36oCMB3q
>> ++4S6ILuH5px0CMk7yn2xVdOOurvulGu7t0vzCAxHrRVxgED1cf5kDW21USAGKcw=3D=3D
>> ++-----END CERTIFICATE-----
>> ++
>> ++# Issuer: CN=3DSectigo Public Server Authentication Root R46
>> O=3DSectigo Limited
>> ++# Subject: CN=3DSectigo Public Server Authentication Root R46
>> O=3DSectigo Limited
>> ++# Label: "Sectigo Public Server Authentication Root R46"
>> ++# Serial: 156256931880233212765902055439220583700
>> ++# MD5 Fingerprint: 32:10:09:52:00:d5:7e:6c:43:df:15:c0:b1:16:93:e5
>> ++# SHA1 Fingerprint:
>> ad:98:f9:f3:e4:7d:75:3b:65:d4:82:b3:a4:52:17:bb:6e:f5:e4:38
>> ++# SHA256 Fingerprint:
>> 7b:b6:47:a6:2a:ee:ac:88:bf:25:7a:a5:22:d0:1f:fe:a3:95:e0:ab:45:c7:3f:
>> 93:f6:56:54:ec:38:f2:5a:06
>> ++-----BEGIN CERTIFICATE-----
>> ++MIIFijCCA3KgAwIBAgIQdY39i658BwD6qSWn4cetFDANBgkqhkiG9w0BAQwFADBf
>> ++MQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMTYwNAYDVQQD
>> ++Ey1TZWN0aWdvIFB1YmxpYyBTZXJ2ZXIgQXV0aGVudGljYXRpb24gUm9vdCBSNDYw
>> ++HhcNMjEwMzIyMDAwMDAwWhcNNDYwMzIxMjM1OTU5WjBfMQswCQYDVQQGEwJHQjEY
>> ++MBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMTYwNAYDVQQDEy1TZWN0aWdvIFB1Ymxp
>> ++YyBTZXJ2ZXIgQXV0aGVudGljYXRpb24gUm9vdCBSNDYwggIiMA0GCSqGSIb3DQEB
>> ++AQUAA4ICDwAwggIKAoICAQCTvtU2UnXYASOgHEdCSe5jtrch/cSV1UgrJnwUUxDa
>> ++ef0rty2k1Cz66jLdScK5vQ9IPXtamFSvnl0xdE8H/FAh3aTPaE8bEmNtJZlMKpnz
>> ++SDBh+oF8HqcIStw+KxwfGExxqjWMrfhu6DtK2eWUAtaJhBOqbchPM8xQljeSM9xf
>> ++iOefVNlI8JhD1mb9nxc4Q8UBUQvX4yMPFF1bFOdLvt30yNoDN9HWOaEhUTCDsG3X
>> ++ME6WW5HwcCSrv0WBZEMNvSE6Lzzpng3LILVCJ8zab5vuZDCQOc2TZYEhMbUjUDM3
>> ++IuM47fgxMMxF/mL50V0yeUKH32rMVhlATc6qu/m1dkmU8Sf4kaWD5QazYw6A3OAS
>> ++VYCmO2a0OYctyPDQ0RTp5A1NDvZdV3LFOxxHVp3i1fuBYYzMTYCQNFu31xR13NgE
>> ++SJ/AwSiItOkcyqex8Va3e0lMWeUgFaiEAin6OJRpmkkGj80feRQXEgyDet4fsZfu
>> +++Zd4KKTIRJLpfSYFplhym3kT2BFfrsU4YjRosoYwjviQYZ4ybPUHNs2iTG7sijbt
>> ++8uaZFURww3y8nDnAtOFr94MlI1fZEoDlSfB1D++N6xybVCi0ITz8fAr/73trdf+L
>> ++HaAZBav6+CuBQug4urv7qv094PPK306Xlynt8xhW6aWWrL3DkJiy4Pmi1KZHQ3xt
>> ++zwIDAQABo0IwQDAdBgNVHQ4EFgQUVnNYZJX5khqwEioEYnmhQBWIIUkwDgYDVR0P
>> ++AQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEMBQADggIBAC9c
>> ++mTz8Bl6MlC5w6tIyMY208FHVvArzZJ8HXtXBc2hkeqK5Duj5XYUtqDdFqij0lgVQ
>> ++YKlJfp/imTYpE0RHap1VIDzYm/EDMrraQKFz6oOht0SmDpkBm+S8f74TlH7Kph52
>> ++gDY9hAaLMyZlbcp+nv4fjFg4exqDsQ+8FxG75gbMY/qB8oFM2gsQa6H61SilzwZA
>> ++Fv97fRheORKkU55+MkIQpiGRqRxOF3yEvJ+M0ejf5lG5Nkc/kLnHvALcWxxPDkjB
>> ++JYOcCj+esQMzEhonrPcibCTRAUH4WAP+JWgiH5paPHxsnnVI84HxZmduTILA7rpX
>> ++DhjvLpr3Etiga+kFpaHpaPi8TD8SHkXoUsCjvxInebnMMTzD9joiFgOgyY9mpFui
>> ++TdaBJQbpdqQACj7LzTWb4OE4y2BThihCQRxEV+ioratF4yUQvNs+ZUH7G6aXD+u5
>> ++dHn5HrwdVw1Hr8Mvn4dGp+smWg9WY7ViYG4A++MnESLn/pmPNPW56MORcr3Ywx65
>> ++LvKRRFHQV80MNNVIIb/bE/FmJUNS0nAiNs2fxBx1IK1jcmMGDw4nztJqDby1ORrp
>> ++0XZ60Vzk50lJLVU3aPAaOpg+VBeHVOmmJ1CJeyAvP/+/oYtKR5j/K3tJPsMpRmAY
>> ++QqszKbrAKbkTidOIijlBO8n9pu0f9GBj39ItVQGL
>> ++-----END CERTIFICATE-----
>> ++
>> ++# Issuer: CN=3DSSL.com TLS RSA Root CA 2022 O=3DSSL Corporation
>> ++# Subject: CN=3DSSL.com TLS RSA Root CA 2022 O=3DSSL Corporation
>> ++# Label: "SSL.com TLS RSA Root CA 2022"
>> ++# Serial: 148535279242832292258835760425842727825
>> ++# MD5 Fingerprint: d8:4e:c6:59:30:d8:fe:a0:d6:7a:5a:2c:2c:69:78:da
>> ++# SHA1 Fingerprint:
>> ec:2c:83:40:72:af:26:95:10:ff:0e:f2:03:ee:31:70:f6:78:9d:ca
>> ++# SHA256 Fingerprint:
>> 8f:af:7d:2e:2c:b4:70:9b:b8:e0:b3:36:66:bf:75:a5:dd:45:b5:de:48:0f:8e:
>> a8:d4:bf:e6:be:bc:17:f2:ed
>> ++-----BEGIN CERTIFICATE-----
>> ++MIIFiTCCA3GgAwIBAgIQb77arXO9CEDii02+1PdbkTANBgkqhkiG9w0BAQsFADBO
>> ++MQswCQYDVQQGEwJVUzEYMBYGA1UECgwPU1NMIENvcnBvcmF0aW9uMSUwIwYDVQQD
>> ++DBxTU0wuY29tIFRMUyBSU0EgUm9vdCBDQSAyMDIyMB4XDTIyMDgyNTE2MzQyMloX
>> ++DTQ2MDgxOTE2MzQyMVowTjELMAkGA1UEBhMCVVMxGDAWBgNVBAoMD1NTTCBDb3Jw
>> ++b3JhdGlvbjElMCMGA1UEAwwcU1NMLmNvbSBUTFMgUlNBIFJvb3QgQ0EgMjAyMjCC
>> ++AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANCkCXJPQIgSYT41I57u9nTP
>> ++L3tYPc48DRAokC+X94xI2KDYJbFMsBFMF3NQ0CJKY7uB0ylu1bUJPiYYf7ISf5OY
>> ++t6/wNr/y7hienDtSxUcZXXTzZGbVXcdotL8bHAajvI9AI7YexoS9UcQbOcGV0ins
>> ++S657Lb85/bRi3pZ7QcacoOAGcvvwB5cJOYF0r/c0WRFXCsJbwST0MXMwgsadugL3
>> ++PnxEX4MN8/HdIGkWCVDi1FW24IBydm5MR7d1VVm0U3TZlMZBrViKMWYPHqIbKUBO
>> ++L9975hYsLfy/7PO0+r4Y9ptJ1O4Fbtk085zx7AGL0SDGD6C1vBdOSHtRwvzpXGk3
>> ++R2azaPgVKPC506QVzFpPulJwoxJF3ca6TvvC0PeoUidtbnm1jPx7jMEWTO6Af77w
>> ++dr5BUxIzrlo4QqvXDz5BjXYHMtWrifZOZ9mxQnUjbvPNQrL8VfVThxc7wDNY8VLS
>> +++YCk8OjwO4s4zKTGkH8PnP2L0aPP2oOnaclQNtVcBdIKQXTbYxE3waWglksejBYS
>> ++d66UNHsef8JmAOSqg+qKkK3ONkRN0VHpvB/zagX9wHQfJRlAUW7qglFA35u5CCoG
>> ++AtUjHBPW6dvbxrB6y3snm/vg1UYk7RBLY0ulBY+6uB0rpvqR4pJSvezrZ5dtmi2f
>> ++gTIFZzL7SAg/2SW4BCUvAgMBAAGjYzBhMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0j
>> ++BBgwFoAU+y437uOEeicuzRk1sTN8/9REQrkwHQYDVR0OBBYEFPsuN+7jhHonLs0Z
>> ++NbEzfP/UREK5MA4GA1UdDwEB/wQEAwIBhjANBgkqhkiG9w0BAQsFAAOCAgEAjYlt
>> ++hEUY8U+zoO9opMAdrDC8Z2awms22qyIZZtM7QbUQnRC6cm4pJCAcAZli05bg4vsM
>> ++QtfhWsSWTVTNj8pDU/0quOr4ZcoBwq1gaAafORpR2eCNJvkLTqVTJXojpBzOCBvf
>> ++R4iyrT7gJ4eLSYwfqUdYe5byiB0YrrPRpgqU+tvT5TgKa3kSM/tKWTcWQA673vWJ
>> ++DPFs0/dRa1419dvAJuoSc06pkZCmF8NsLzjUo3KUQyxi4U5cMj29TH0ZR6LDSeeW
>> ++P4+a0zvkEdiLA9z2tmBVGKaBUfPhqBVq6+AL8BQx1rmMRTqoENjwuSfr98t67wVy
>> ++lrXEj5ZzxOhWc5y8aVFjvO9nHEMaX3cZHxj4HCUp+UmZKbaSPaKDN7EgkaibMOlq
>> ++bLQjk2UEqxHzDh1TJElTHaE/nUiSEeJ9DU/1172iWD54nR4fK/4huxoTtrEoZP2w
>> ++AgDHbICivRZQIA9ygV/MlP+7mea6kMvq+cYMwq7FGc4zoWtcu358NFcXrfA/rs3q
>> ++r5nsLFR+jM4uElZI7xc7P0peYNLcdDa8pUNjyw9bowJWCZ4kLOGGgYz+qxcs+sji
>> ++Mho6/4UIyYOf8kpIEFR3N+2ivEC+5BB09+Rbu7nzifmPQdjH5FCQNYA+HLhNkNPU
>> ++98OwoX6EyneSMSy4kLGCenROmxMmtNVQZlR4rmA=3D
>> ++-----END CERTIFICATE-----
>> ++
>> ++# Issuer: CN=3DSSL.com TLS ECC Root CA 2022 O=3DSSL Corporation
>> ++# Subject: CN=3DSSL.com TLS ECC Root CA 2022 O=3DSSL Corporation
>> ++# Label: "SSL.com TLS ECC Root CA 2022"
>> ++# Serial: 26605119622390491762507526719404364228
>> ++# MD5 Fingerprint: 99:d7:5c:f1:51:36:cc:e9:ce:d9:19:2e:77:71:56:c5
>> ++# SHA1 Fingerprint:
>> 9f:5f:d9:1a:54:6d:f5:0c:71:f0:ee:7a:bd:17:49:98:84:73:e2:39
>> ++# SHA256 Fingerprint:
>> c3:2f:fd:9f:46:f9:36:d1:6c:36:73:99:09:59:43:4b:9a:d6:0a:af:bb:9e:7c:
>> f3:36:54:f1:44:cc:1b:a1:43
>> ++-----BEGIN CERTIFICATE-----
>> ++MIICOjCCAcCgAwIBAgIQFAP1q/s3ixdAW+JDsqXRxDAKBggqhkjOPQQDAzBOMQsw
>> ++CQYDVQQGEwJVUzEYMBYGA1UECgwPU1NMIENvcnBvcmF0aW9uMSUwIwYDVQQDDBxT
>> ++U0wuY29tIFRMUyBFQ0MgUm9vdCBDQSAyMDIyMB4XDTIyMDgyNTE2MzM0OFoXDTQ2
>> ++MDgxOTE2MzM0N1owTjELMAkGA1UEBhMCVVMxGDAWBgNVBAoMD1NTTCBDb3Jwb3Jh
>> ++dGlvbjElMCMGA1UEAwwcU1NMLmNvbSBUTFMgRUNDIFJvb3QgQ0EgMjAyMjB2MBAG
>> ++ByqGSM49AgEGBSuBBAAiA2IABEUpNXP6wrgjzhR9qLFNoFs27iosU8NgCTWyJGYm
>> ++acCzldZdkkAZDsalE3D07xJRKF3nzL35PIXBz5SQySvOkkJYWWf9lCcQZIxPBLFN
>> ++SeR7T5v15wj4A4j3p8OSSxlUgaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSME
>> ++GDAWgBSJjy+j6CugFFR781a4Jl9nOAuc0DAdBgNVHQ4EFgQUiY8vo+groBRUe/NW
>> ++uCZfZzgLnNAwDgYDVR0PAQH/BAQDAgGGMAoGCCqGSM49BAMDA2gAMGUCMFXjIlbp
>> ++15IkWE8elDIPDAI2wv2sdDJO4fscgIijzPvX6yv/N33w7deedWo1dlJF4AIxAMeN
>> ++b0Igj762TVntd00pxCAgRWSGOlDGxK0tk/UYfXLtqc/ErFc2KAhl3zx5Zn6g6g=3D=3D
>> ++-----END CERTIFICATE-----
>> ++
>> ++# Issuer: CN=3DAtos TrustedRoot Root CA ECC TLS 2021 O=3DAtos
>> ++# Subject: CN=3DAtos TrustedRoot Root CA ECC TLS 2021 O=3DAtos
>> ++# Label: "Atos TrustedRoot Root CA ECC TLS 2021"
>> ++# Serial: 81873346711060652204712539181482831616
>> ++# MD5 Fingerprint: 16:9f:ad:f1:70:ad:79:d6:ed:29:b4:d1:c5:79:70:a8
>> ++# SHA1 Fingerprint:
>> 9e:bc:75:10:42:b3:02:f3:81:f4:f7:30:62:d4:8f:c3:a7:51:b2:dd
>> ++# SHA256 Fingerprint:
>> b2:fa:e5:3e:14:cc:d7:ab:92:12:06:47:01:ae:27:9c:1d:89:88:fa:cb:77:5f:
>> a8:a0:08:91:4e:66:39:88:a8
>> ++-----BEGIN CERTIFICATE-----
>> ++MIICFTCCAZugAwIBAgIQPZg7pmY9kGP3fiZXOATvADAKBggqhkjOPQQDAzBMMS4w
>> ++LAYDVQQDDCVBdG9zIFRydXN0ZWRSb290IFJvb3QgQ0EgRUNDIFRMUyAyMDIxMQ0w
>> ++CwYDVQQKDARBdG9zMQswCQYDVQQGEwJERTAeFw0yMTA0MjIwOTI2MjNaFw00MTA0
>> ++MTcwOTI2MjJaMEwxLjAsBgNVBAMMJUF0b3MgVHJ1c3RlZFJvb3QgUm9vdCBDQSBF
>> ++Q0MgVExTIDIwMjExDTALBgNVBAoMBEF0b3MxCzAJBgNVBAYTAkRFMHYwEAYHKoZI
>> ++zj0CAQYFK4EEACIDYgAEloZYKDcKZ9Cg3iQZGeHkBQcfl+3oZIK59sRxUM6KDP/X
>> ++tXa7oWyTbIOiaG6l2b4siJVBzV3dscqDY4PMwL502eCdpO5KTlbgmClBk1IQ1SQ4
>> ++AjJn8ZQSb+/Xxd4u/RmAo0IwQDAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBR2
>> ++KCXWfeBmmnoJsmo7jjPXNtNPojAOBgNVHQ8BAf8EBAMCAYYwCgYIKoZIzj0EAwMD
>> ++aAAwZQIwW5kp85wxtolrbNa9d+F851F+uDrNozZffPc8dz7kUK2o59JZDCaOMDtu
>> ++CCrCp1rIAjEAmeMM56PDr9NJLkaCI2ZdyQAUEv049OGYa3cpetskz2VAv9LcjBHo
>> ++9H1/IISpQuQo
>> ++-----END CERTIFICATE-----
>> ++
>> ++# Issuer: CN=3DAtos TrustedRoot Root CA RSA TLS 2021 O=3DAtos
>> ++# Subject: CN=3DAtos TrustedRoot Root CA RSA TLS 2021 O=3DAtos
>> ++# Label: "Atos TrustedRoot Root CA RSA TLS 2021"
>> ++# Serial: 111436099570196163832749341232207667876
>> ++# MD5 Fingerprint: d4:d3:46:b8:9a:c0:9c:76:5d:9e:3a:c3:b9:99:31:d2
>> ++# SHA1 Fingerprint:
>> 18:52:3b:0d:06:37:e4:d6:3a:df:23:e4:98:fb:5b:16:fb:86:74:48
>> ++# SHA256 Fingerprint:
>> 81:a9:08:8e:a5:9f:b3:64:c5:48:a6:f8:55:59:09:9b:6f:04:05:ef:bf:18:e5:
>> 32:4e:c9:f4:57:ba:00:11:2f
>> ++-----BEGIN CERTIFICATE-----
>> ++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3D=3D
>> ++-----END CERTIFICATE-----
>> +--
>> +2.40.0
>> diff --git a/meta/recipes-devtools/python/python3-
>> certifi_2021.10.8.bb b/meta/recipes-devtools/python/python3-
>> certifi_2021.10.8.bb
>> index 57bd59ba44..eb1574adf6 100644
>> --- a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
>> +++ b/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
>> @@ -7,7 +7,9 @@ HOMEPAGE =3D " http://certifi.io/"
>>   LICENSE =3D "ISC"
>>   LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D67da0714c3f9471067b729eca6c9fbe8"
>>
>> -SRC_URI +=3D "file://CVE-2022-23491.patch"
>> +SRC_URI +=3D "file://CVE-2022-23491.patch \
>> +            file://CVE-2023-37920.patch \
>> +           "
>>
>>   SRC_URI[sha256sum] =3D
>> "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#185423):
>> https://lists.openembedded.org/g/openembedded-core/message/185423
>> Mute This Topic: https://lists.openembedded.org/mt/100510993/3616702
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub [
>> anuj.mittal@intel.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

