Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66E7C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 01:55:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5902.1676426132068601319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 17:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iGD2xsLu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141047d949=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F1cL2f001559
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 01:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=7ezzc3fUzJuy1R9TuW0Y7cvXjYb39CQllC53Iho7tnU=;
 b=iGD2xsLuCUZ05Y53RMEX14AqhP+77nNoEALHZ9nXPY5vF66SobWyXH8ODGpqmxEb7idK
 68VkkETSAnOB3ge5luu2ijyrFbLCnvja/A648wRjwIgQ3Mt3hge6czsQRoDnVApXkmt0
 iIGZly1X0DUiVdDccGe6vpRdFGT1tOP0QfjDErYQJffhp9Da+9DpuVAJVdloMGZ8SstK
 /6DGZO4KRd1BzrqUetFNw6IubveN7env8lydgEe3QcZYV3oMeD8Yzv4t8BvDNCqIBqqr
 8oHl/OxEE0dIaOqvZQ1iYYWlwWipV2iutmwkibj9el7buUhwLKSdKuySJrq9GPygiPd9 ww== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083bb25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 01:55:30 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31F1tUOC032277
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 01:55:30 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083bb22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 01:55:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8twfUGuud7uxV9iEOYZjLdfjqbC0ZOZY6+w2rPIMPNnxd73YcC1NLQ2fWyTFg89BWCpJsCPX9LK8DSeie6s/d9lOHZ5Vcz2Fg9P2+Fx1Ruk1D/4UlEJvWWMz3M5l/XoaLjB8mg1iti9PsIyYL0krhoQTRiJhpVD+WLFk3B2ERmbp45EioHyMvymVZl1MNdVogV3mM5yZtvDxnBEEAYDHOEGDjDVHvj+94UlbhErE7U3HKRbO2C0E8SKEzcusH4wbITtNtvMBWr/vlxSZDK5UyFePgb4jdNwJFO8rlyPBLg15CGR13a/1vm6k0d6NIMxtd4WEW58QZUrnKuNFthQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ezzc3fUzJuy1R9TuW0Y7cvXjYb39CQllC53Iho7tnU=;
 b=AwYt7MfuP9XEioVGDJHhgKLTpvm/NYLnC8EjVJgVqXWzwK4p8bP1YVWacs3cMuzJFdqIwtlJ5no5uzrcZZ/XQcrX01UBeZK82rIJX0GYIxpY5hBJUgCN5aDBXO7EXS0bF1USjtMfCE8PzRKlNiKVzGW6q+UL+hv5mEQWBhfiqM9p9rxy34+XtSTrJacnOyVd16S8hAiIcApzRCKMleouj0z/HHENMcd9VzNqDodieTOMouMajXePCQ5XKdj9lyzYJGOAEryrUc09d3pVnYNewX8zIMZ3FO17kIQN5WpjJoCRRJoCp5SmGtOeykVp9malv4mYbKGSAFN4t/M8n2riZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 CY8PR11MB6988.namprd11.prod.outlook.com (2603:10b6:930:54::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Wed, 15 Feb 2023 01:55:27 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6%9]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 01:55:26 +0000
Message-ID: <65d65ba3-b82a-06ad-48df-65796ffa23c6@windriver.com>
Date: Wed, 15 Feb 2023 09:55:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [kirkstone][PATCH 0/1] Update webkitgtk to 2.38.4 for
 CVEs
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>, Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230213055043.15294-1-kai.kang@windriver.com>
 <CAOSpxdY3vz2p083y=5gUzFcYSS6DpafGN=qNtS_9sP+Nip90pw@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAOSpxdY3vz2p083y=5gUzFcYSS6DpafGN=qNtS_9sP+Nip90pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|CY8PR11MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d7d7ad-98af-4bcd-dd17-08db0ef7b534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NuBp1LoCpkkXPEgRTVR7YkTelqxJxwxIjRRZH/L4enBZs6hp1oV7wy7Z4dH2RJOykkKqBNjFLsKi+SVL+Pij8rvRZH2N/hNIf4FuB4UBrme45q8XyV7IrpLq+y9p4KKYoah5Kd+YXcacc3gRKDotU5Jf6K5dYNrSOxv9owI2+1KxcjRl3rEl6dPyXSa6vFARH0/GIjsMHO3tzU8Gekbh7DpeAIFIUIrGE2O+C8bNtFzWeBfKRhotxMD1iMrz8TwYztGhyzqZRyCFZjksIDcg2fXykY5GrsEXVWhuX0PH+TNjYPKRf1UiWIbKHyhsKVVxFqkOiRKf3M1FpHA97OdV/3HUpORozHfLfyGje0vLnzqwhQUQTD+8p+X+QZ4k65MSejNsxEymLh6sERsmmtQnYTRzS0XNCG5ecITlbTVg+5nmU4MZtHLk/wnX7szrtJRJFN2jdMdVaXbz428Q1CdGqlVmoxXjyStEVy8h/QUXgFv6HKEbiCYv0zNY5jiki6JaSSrN0/UdclHtMT7q8zpRSf1UKPn8HKK0QLbMYCob4Zr/JghgbRDUFlHL4hsiDbXTYGqHjzNRtqkyHOSKotOrkMO7SGfoOgjdEesUlZh7Vencb7+pEKePYA0wJVsE5NXsLCqNa6rh3/JsA4dNuWlxVhK2F32vgcTgAJQmt+8erXR5el20BUgsW7t31loIF62T6F1u7w02O8oVWluicbh4lblMA1l0kIzoRiu5nsVpTzJ/+AjMh4BfOLu30K5FjAh9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199018)(8936002)(30864003)(41300700001)(36756003)(5660300002)(15650500001)(2906002)(110136005)(478600001)(6486002)(966005)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(38100700002)(31686004)(2616005)(53546011)(6512007)(6666004)(6506007)(186003)(26005)(86362001)(31696002)(83380400001)(66899018)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejU1K1NDaTNjUDB6NU1TRGZSNTBmSHdwckNWc2Uvemp2eUI4S09TSk05Vm1B?=
 =?utf-8?B?ZnU3L3RoOTJKMiswd0dRUnhwUm53QVVqeEtPR3dES3VOcW1HQThiUlUvM3Aw?=
 =?utf-8?B?cEtQcFFZZnFhR2hEWHc5c0JlaXBRMkx4LzZBT2lIci9UcUVjcktoWldDT0sw?=
 =?utf-8?B?M0dNYmdXcGE1Y2ZPdXM0a1JlTTB6YnlCZnYrdWFRSVQybm5FWUUzMDBjTUda?=
 =?utf-8?B?alZYVE9GVHlEeUxCWlNMd205NWtZcWNzTDAzbTh6REtPbmtadGd6em40TG5v?=
 =?utf-8?B?U0k1MTB0SmxoVThPcXhic3l0NFc2ZjlqZnVGUm05am9NbmhUbFV2T0dHeUgr?=
 =?utf-8?B?bjM3MVZrZThLMFAvY2ZHZnJjTEZMdVFyM3NRNmRlemwyWHgxdjFNQW9MdUJJ?=
 =?utf-8?B?WDcrNm9BaHJsaHMxN1FOWGtZa1RQb091U1FvWWFUS0ZnTWNoNk8rbTgwemxY?=
 =?utf-8?B?ZVMyVTNmY3VBQXhmbnJ2LzdrUGtPTTBOWmZDTlhwYU9LeWJUOUswNmJTUnpU?=
 =?utf-8?B?VS9YcVdtR0RGK3k0ZUdDMWhNbHZKbWY0Q1hHOExEK3J2a0RyeHNoZWwrWXc2?=
 =?utf-8?B?NmhvV0dKSTdsSWN6am84enpyU0lrU014d1hCaFJOKzhGYmw5cm5PdmZqYThM?=
 =?utf-8?B?VWIzTnV1US9hbDM0K0prajBSRTJicjllVmliV0d6TFpjYWhldFAyUTNYQi96?=
 =?utf-8?B?NHZVa04vWVU5a3BXeFpJUUJiZzVkRVRoQmpHUmx3RjdnSjM2TUZibVZkYnFO?=
 =?utf-8?B?K05Qall5T0FhMFpnbzQvam9OcWUvWDBmaHdGMGJ4VDd2TXhLd2tjTkhqcGVv?=
 =?utf-8?B?Nm9sYUJBc0xuc2xpTFRNaVVHbTBaaE51MHlsYW5vVHQ3MTdRWlBrQjdpdzlM?=
 =?utf-8?B?TUNwWitKcGZYQ25LWTQ0eGVYd0tHZU0zWWhmZUFweTlqUFFldkdJcjA0aERB?=
 =?utf-8?B?MS9IOWhKNjNsdXhxZUQ1QjRjaTlmS1pDQzFkY1M2MWg3WXBERTc3eWRhejFS?=
 =?utf-8?B?dlpSaDFLSjZ6bm5JUFZ4M0hGVVZrUlpub3NWdXNCRFlobUZ6ZU1aem5zL2xL?=
 =?utf-8?B?STAvME9tMUh1LzNTdFZLL2NWaUljMXhOdFVBdmFJaEF4YWhPUHNibThOOHFu?=
 =?utf-8?B?TE9BbWhIYzluOFNzZ1JCdHBQYjdwY0QzZnNSaHlMTjQyZVM1WHFYYVdtVGlC?=
 =?utf-8?B?YUFwamlXYkJCWDA2MFZCdXZIYmd0Q2JOTkZDV0tGQitVYXVUM1FZeWlWL3Iz?=
 =?utf-8?B?Qit5bDVrMm5VV0ZWRTRyWHpZYUx6SlhjY0NlbitvQi9nbStmTlVDeEJQWGh3?=
 =?utf-8?B?T2liM3FmTHFQK1F4eUlzZ0hHZ0FMTmZWaTRtMWt4MzZMOXVJMENuZUtZUzUv?=
 =?utf-8?B?M3AxMGk3ZVhiZXlaRkx6VUwxKzN2MFAwNlB4NVdkZjk5ZlBZSFpyMXE0SmhK?=
 =?utf-8?B?S3czb3k5Q091VkkvNFNDUW9sbHZMSGtlemdNTXBNMFdsVytxZVZZM1ZEemJz?=
 =?utf-8?B?WDVEaTdVWDg4WWpWd1N5cmREMUlaajAzWW4yTER1QXE0SDc4R0FqRVBpTzN2?=
 =?utf-8?B?TEc1aDdTK3kwTjQyZHJoRzl6Rkc3ZlBUQ3VQTlhWNUViT1o3MWtxZDk0V3cy?=
 =?utf-8?B?c1NDWHh5d1JQSUZTdW5yd2N6OHJYbTNBL08za2pKdmpqUE5EMTIwOXgrRmlv?=
 =?utf-8?B?eWpqZ2ZuZmFyZGNVditCUEVWeFdITUJBNEhSeXBBUkxZSkE4VEE1RG1QeEdY?=
 =?utf-8?B?UnBXZVBicHYyM2FFclNDbURVMVNZbEdnRFRTQTZOMFNZOTVkUk5ZRjFocHMx?=
 =?utf-8?B?UW9VREp2QWNJS3pvMXRtcmdFem12ZCtwa3NpWHJoc21JMzlZa3FFM1h5bDBy?=
 =?utf-8?B?V1JlN2dRZzVQOGhlV1UzVnZNSjZEam9nL2gzVkZMVnFSR0FsNGJLZS9hVHFs?=
 =?utf-8?B?TDUreTJJMHdnbXhCV3lMSWVjaDdiaGhJbU9kZ3ZoNlVIV2haYm5lYTdUUHpa?=
 =?utf-8?B?MDJUa0JnSGFwS0N1UkRtSStEVm9obERGVmtleFY5WmxjaXNMSVBLQkJDNndz?=
 =?utf-8?B?SW5UZlphdXZZcTZIWUJ5bWZVekFLOEI0MUtNdDF5eng3SGF1eW9FTUJGK1dH?=
 =?utf-8?B?MDdmWXpFZjU2VzZPSlBQVUczQTE1Zi8rY3NMZDlEUHhMaExEck5sN0o0Q24x?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d7d7ad-98af-4bcd-dd17-08db0ef7b534
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 01:55:26.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IA3pznpEmbAfQ1GmxPay495I4y+NJZ5ZdyOZhM+13304XR7EbCvR7dAg7skuvVXJPlXzHmT1yiSg/032fhdMTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6988
X-Proofpoint-GUID: 4m9Vn2eSot_01afFgVg7RO64g0pTKsQz
X-Proofpoint-ORIG-GUID: q5MDJupPgh7Ff4hvp1jDYKbc4i14dAd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302150016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 01:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177178

On 2/15/23 00:22, Steve Sakoman wrote:
> Stable branch policy doesn't allow this type of version upgrade.  I
> can only take upgrades that are strict bug/security fix only releases.
The reason that why upgrade webkitgtk directly is that there is no 
obvious single patch to fix CVEs.
It just declares that some CVEs have been fixed in x.x.x version. And 
update to 2.38.4 could resolve
15 CVEs at least.
>
> Exceptions to the policy would require TSC approval.

Who is TSCer? Would he/she like to review it, please?

Thanks,
Kai

>
> Best regards,
>
> Steve
>
> On Sun, Feb 12, 2023 at 7:50 PM Kai Kang <kai.kang@eng.windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update webkitgtk 2.36.8 to latest version 2.38.4 which solves a lot of CVEs.
>>
>> The diff output of header files is attached at the end of this file.
>>
>> Kai Kang (1):
>>    webkitgtk: 2.36.8 -> 2.38.4
>>
>>   ...spection.cmake-prefix-variables-obta.patch |  39 +--
>>   .../0001-Fix-build-without-opengl-or-es.patch | 133 --------
>>   ...tings-so-that-gtkdoc-generation-work.patch |  47 ---
>>   ...trospection-files-do-not-quote-CFLAG.patch |  78 -----
>>   ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ++++++++++++++++++
>>   ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 ++
>>   ...ebkitgtk_2.36.8.bb => webkitgtk_2.38.4.bb} |  15 +-
>>   7 files changed, 348 insertions(+), 290 deletions(-)
>>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
>>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
>>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
>>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
>>   rename meta/recipes-sato/webkit/{webkitgtk_2.36.8.bb => webkitgtk_2.38.4.bb} (92%)
>>
>> --
>> 2.17.1
>>
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h  2022-06-30 17:49:25.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h  2022-09-20 16:13:44.000000000 +0800
>> @@ -23,7 +23,7 @@
>>    * THE POSSIBILITY OF SUCH DAMAGE.
>>    */
>>
>> -#if !defined(__JSC_H_INSIDE__) && !defined(JSC_COMPILATION)
>> +#if !defined(__JSC_H_INSIDE__) && !defined(JSC_COMPILATION) && !defined(WEBKIT2_COMPILATION)
>>   #error "Only <jsc/jsc.h> can be included directly."
>>   #endif
>>
>> @@ -42,7 +42,9 @@
>>   #    define JSC_API __attribute__((visibility("default")))
>>   #endif
>>
>> +#ifndef __GI_SCANNER__
>>   #define JSC_DEPRECATED JSC_API G_DEPRECATED
>>   #define JSC_DEPRECATED_FOR(f) JSC_API G_DEPRECATED_FOR(f)
>> +#endif /* !__GI_SCANNER__ */
>>
>>   #endif /* JSCDefines_h */
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h    2022-06-30 17:49:25.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h    2022-09-20 16:13:44.000000000 +0800
>> @@ -49,6 +49,21 @@
>>       JSC_VALUE_PROPERTY_WRITABLE     = 1 << 2
>>   } JSCValuePropertyFlags;
>>
>> +typedef enum {
>> +    JSC_TYPED_ARRAY_NONE = 0,
>> +    JSC_TYPED_ARRAY_INT8,
>> +    JSC_TYPED_ARRAY_INT16,
>> +    JSC_TYPED_ARRAY_INT32,
>> +    JSC_TYPED_ARRAY_INT64,
>> +    JSC_TYPED_ARRAY_UINT8,
>> +    JSC_TYPED_ARRAY_UINT8_CLAMPED,
>> +    JSC_TYPED_ARRAY_UINT16,
>> +    JSC_TYPED_ARRAY_UINT32,
>> +    JSC_TYPED_ARRAY_UINT64,
>> +    JSC_TYPED_ARRAY_FLOAT32,
>> +    JSC_TYPED_ARRAY_FLOAT64,
>> +} JSCTypedArrayType;
>> +
>>   struct _JSCValue {
>>       GObject parent;
>>
>> @@ -246,6 +261,55 @@
>>   jsc_value_function_callv                  (JSCValue             *value,
>>                                              guint                 n_parameters,
>>                                              JSCValue            **parameters) G_GNUC_WARN_UNUSED_RESULT;
>> +JSC_API JSCValue *
>> +jsc_value_new_array_buffer                (JSCContext           *context,
>> +                                           gpointer              data,
>> +                                           gsize                 size,
>> +                                           GDestroyNotify        destroy_notify,
>> +                                           gpointer              user_data);
>> +
>> +JSC_API gboolean
>> +jsc_value_is_array_buffer                 (JSCValue             *value);
>> +
>> +JSC_API gpointer
>> +jsc_value_array_buffer_get_data           (JSCValue             *value,
>> +                                           gsize                *size);
>> +
>> +JSC_API gsize
>> +jsc_value_array_buffer_get_size           (JSCValue             *value);
>> +
>> +JSC_API JSCValue *
>> +jsc_value_new_typed_array                 (JSCContext           *context,
>> +                                           JSCTypedArrayType     type,
>> +                                           gsize                 length);
>> +
>> +JSC_API JSCValue *
>> +jsc_value_new_typed_array_with_buffer     (JSCValue             *array_buffer,
>> +                                           JSCTypedArrayType     type,
>> +                                           gsize                 offset,
>> +                                           gssize                length);
>> +
>> +JSC_API gboolean
>> +jsc_value_is_typed_array                  (JSCValue             *value);
>> +
>> +JSC_API JSCTypedArrayType
>> +jsc_value_typed_array_get_type            (JSCValue             *value);
>> +
>> +JSC_API gpointer
>> +jsc_value_typed_array_get_data            (JSCValue             *value,
>> +                                           gsize                *length);
>> +
>> +JSC_API gsize
>> +jsc_value_typed_array_get_length          (JSCValue             *value);
>> +
>> +JSC_API gsize
>> +jsc_value_typed_array_get_size            (JSCValue             *value);
>> +
>> +JSC_API gsize
>> +jsc_value_typed_array_get_offset          (JSCValue             *value);
>> +
>> +JSC_API JSCValue *
>> +jsc_value_typed_array_get_buffer          (JSCValue             *value);
>>
>>   JSC_API gboolean
>>   jsc_value_is_constructor                  (JSCValue             *value);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h  2023-02-12 23:02:14.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h  2023-02-13 11:34:32.000000000 +0800
>> @@ -44,7 +44,7 @@
>>    * application compile time, rather than from the library linked
>>    * against at application run time.
>>    */
>> -#define JSC_MINOR_VERSION (36)
>> +#define JSC_MINOR_VERSION (38)
>>
>>   /**
>>    * JSC_MICRO_VERSION:
>> @@ -53,7 +53,7 @@
>>    * application compile time, rather than from the library linked
>>    * against at application run time.
>>    */
>> -#define JSC_MICRO_VERSION (8)
>> +#define JSC_MICRO_VERSION (4)
>>
>>   /**
>>    * JSC_CHECK_VERSION:
>> @@ -61,6 +61,8 @@
>>    * @minor: minor version (e.g. 2 for version 1.2.5)
>>    * @micro: micro version (e.g. 5 for version 1.2.5)
>>    *
>> + * Check the version of JSC header files at compile time.
>> + *
>>    * Returns: %TRUE if the version of the JavaScriptCore header files
>>    * is the same as or newer than the passed-in version.
>>    */
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h     2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h     2022-09-20 16:13:49.000000000 +0800
>> @@ -52,6 +52,7 @@
>>   struct _WebKitAuthenticationRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h 2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h 2022-09-20 16:13:49.000000000 +0800
>> @@ -58,12 +58,14 @@
>>   struct _WebKitAutomationSession {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitAutomationSessionPrivate *priv;
>>   };
>>
>>   struct _WebKitAutomationSessionClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h   2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -44,12 +44,14 @@
>>   struct _WebKitBackForwardList {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitBackForwardListPrivate *priv;
>>   };
>>
>>   struct _WebKitBackForwardListClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -43,12 +43,14 @@
>>   struct _WebKitBackForwardListItem {
>>       GInitiallyUnowned parent;
>>
>> +    /*< private >*/
>>       WebKitBackForwardListItemPrivate *priv;
>>   };
>>
>>   struct _WebKitBackForwardListItemClass {
>>       GInitiallyUnownedClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -44,12 +44,14 @@
>>   struct _WebKitContextMenu {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitContextMenuPrivate *priv;
>>   };
>>
>>   struct _WebKitContextMenuClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h     2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h     2022-09-20 16:13:49.000000000 +0800
>> @@ -74,12 +74,14 @@
>>   struct _WebKitCookieManager {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitCookieManagerPrivate *priv;
>>   };
>>
>>   struct _WebKitCookieManagerClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h   2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -45,4 +45,11 @@
>>   #define WEBKIT_DEPRECATED WEBKIT_API G_DEPRECATED
>>   #define WEBKIT_DEPRECATED_FOR(f) WEBKIT_API G_DEPRECATED_FOR(f)
>>
>> +/**
>> + * WEBKIT_DEPRECATED_FOR: (skip)
>> + * @f: replacement symbol name
>> + *
>> + * Marks a symbol as deprecated, indicating a replacement.
>> + */
>> +
>>   #endif /* WebKitDefines_h */
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -49,6 +49,7 @@
>>   struct _WebKitDeviceInfoPermissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h  2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h  2022-09-20 16:13:49.000000000 +0800
>> @@ -46,15 +46,18 @@
>>   struct _WebKitDownload {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitDownloadPrivate *priv;
>>   };
>>
>>   struct _WebKitDownloadClass {
>>       GObjectClass parent_class;
>>
>> +    /*< public >*/
>>       gboolean (* decide_destination)  (WebKitDownload *download,
>>                                         const gchar    *suggested_filename);
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -64,12 +64,14 @@
>>   struct _WebKitEditorState {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitEditorStatePrivate *priv;
>>   };
>>
>>   struct _WebKitEditorStateClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h 2023-02-12 23:58:45.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h 2023-02-13 12:30:22.000000000 +0800
>> @@ -198,6 +198,10 @@
>>
>>   WEBKIT_API GType
>>   webkit_media_capture_state_get_type (void);
>> +#define WEBKIT_TYPE_WEB_EXTENSION_MODE webkit_web_extension_mode_get_type ()
>> +
>> +WEBKIT_API GType
>> +webkit_web_extension_mode_get_type (void);
>>   /* Enumerations from WebKitWebsiteData.h. */
>>   #define WEBKIT_TYPE_WEBSITE_DATA_TYPES webkit_website_data_types_get_type ()
>>
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h     2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h     2023-01-27 21:16:47.000000000 +0800
>> @@ -147,6 +147,8 @@
>>    * @WEBKIT_USER_CONTENT_FILTER_ERROR_INVALID_SOURCE: The JSON source for a content filter is invalid.
>>    * @WEBKIT_USER_CONTENT_FILTER_ERROR_NOT_FOUND: The requested content filter could not be found.
>>    *
>> + * Errors that can occur while compiling content filters.
>> + *
>>    * Since: 2.24
>>    */
>>   typedef enum {
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h   2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -46,12 +46,14 @@
>>   struct _WebKitFaviconDatabase {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitFaviconDatabasePrivate *priv;
>>   };
>>
>>   struct _WebKitFaviconDatabaseClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -50,6 +50,7 @@
>>   struct _WebKitFileChooserRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h    2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h    2022-09-20 16:13:49.000000000 +0800
>> @@ -75,6 +75,7 @@
>>   struct _WebKitFindControllerClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h     2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h     2022-09-20 16:13:49.000000000 +0800
>> @@ -50,6 +50,7 @@
>>   struct _WebKitFormSubmissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h     2022-06-30 17:49:38.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h     2022-09-20 16:13:49.000000000 +0800
>> @@ -47,6 +47,7 @@
>>   struct _WebKitFrame {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitFramePrivate *priv;
>>   };
>>
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -53,6 +53,7 @@
>>   struct _WebKitGeolocationManagerClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h      2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h      2022-09-20 16:13:49.000000000 +0800
>> @@ -50,6 +50,7 @@
>>   struct _WebKitGeolocationPermissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h     2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h     2022-09-20 16:13:49.000000000 +0800
>> @@ -66,12 +66,14 @@
>>   struct _WebKitHitTestResult {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitHitTestResultPrivate *priv;
>>   };
>>
>>   struct _WebKitHitTestResultClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -43,12 +43,14 @@
>>   struct _WebKitInstallMissingMediaPluginsPermissionRequest {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitInstallMissingMediaPluginsPermissionRequestPrivate *priv;
>>   };
>>
>>   struct _WebKitInstallMissingMediaPluginsPermissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h   2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -50,6 +50,7 @@
>>   struct _WebKitMediaKeySystemPermissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h  2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h  2022-09-20 16:13:49.000000000 +0800
>> @@ -53,6 +53,7 @@
>>   struct _WebKitNavigationPolicyDecisionClass {
>>       WebKitPolicyDecisionClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h      2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h      2022-09-20 16:13:49.000000000 +0800
>> @@ -44,12 +44,14 @@
>>   struct _WebKitNotification {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitNotificationPrivate *priv;
>>   };
>>
>>   struct _WebKitNotificationClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -44,12 +44,14 @@
>>   struct _WebKitOptionMenu {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitOptionMenuPrivate *priv;
>>   };
>>
>>   struct _WebKitOptionMenuClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h    2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h    2022-09-20 16:13:49.000000000 +0800
>> @@ -43,12 +43,14 @@
>>   struct _WebKitPlugin {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitPluginPrivate *priv;
>>   };
>>
>>   struct _WebKitPluginClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h      2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h      2022-09-20 16:13:49.000000000 +0800
>> @@ -50,6 +50,7 @@
>>   struct _WebKitPointerLockPermissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h    2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h    2022-09-20 16:13:49.000000000 +0800
>> @@ -51,6 +51,7 @@
>>   struct _WebKitPolicyDecisionClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h 2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h 2022-09-20 16:13:49.000000000 +0800
>> @@ -44,12 +44,14 @@
>>   struct _WebKitPrintCustomWidget {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitPrintCustomWidgetPrivate *priv;
>>   };
>>
>>   struct _WebKitPrintCustomWidgetClass {
>>       GObjectClass parent_class;
>>
>> +    /*< public >*/
>>       void    (* apply)               (WebKitPrintCustomWidget *print_custom_widget,
>>                                        GtkWidget               *widget);
>>       void    (* update)              (WebKitPrintCustomWidget *print_custom_widget,
>> @@ -57,6 +59,7 @@
>>                                        GtkPageSetup            *page_setup,
>>                                        GtkPrintSettings        *print_settings);
>>
>> +    /*< private >*/
>>       void    (*_webkit_reserved0) (void);
>>       void    (*_webkit_reserved1) (void);
>>       void    (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h    2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h    2022-09-20 16:13:49.000000000 +0800
>> @@ -57,12 +57,14 @@
>>   struct _WebKitPrintOperation {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitPrintOperationPrivate *priv;
>>   };
>>
>>   struct _WebKitPrintOperationClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h    2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h    2022-09-20 16:13:49.000000000 +0800
>> @@ -53,6 +53,7 @@
>>   struct _WebKitResponsePolicyDecisionClass {
>>       WebKitPolicyDecisionClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h   2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -43,12 +43,14 @@
>>   struct _WebKitSecurityManager {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitSecurityManagerPrivate *priv;
>>   };
>>
>>   struct _WebKitSecurityManagerClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h  2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h  2023-01-26 20:05:13.000000000 +0800
>> @@ -70,12 +70,14 @@
>>   struct _WebKitSettings {
>>       GObject parent_instance;
>>
>> +    /*< private >*/
>>       WebKitSettingsPrivate *priv;
>>   };
>>
>>   struct _WebKitSettingsClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> @@ -133,17 +135,17 @@
>>   WEBKIT_API void
>>   webkit_settings_set_enable_html5_database                      (WebKitSettings *settings,
>>                                                                   gboolean        enabled);
>> -WEBKIT_API gboolean
>> +WEBKIT_DEPRECATED gboolean
>>   webkit_settings_get_enable_xss_auditor                         (WebKitSettings *settings);
>>
>> -WEBKIT_API void
>> +WEBKIT_DEPRECATED void
>>   webkit_settings_set_enable_xss_auditor                         (WebKitSettings *settings,
>>                                                                   gboolean        enabled);
>>
>> -WEBKIT_API gboolean
>> +WEBKIT_DEPRECATED gboolean
>>   webkit_settings_get_enable_frame_flattening                    (WebKitSettings *settings);
>>
>> -WEBKIT_API void
>> +WEBKIT_DEPRECATED void
>>   webkit_settings_set_enable_frame_flattening                    (WebKitSettings *settings,
>>                                                                   gboolean        enabled);
>>
>> @@ -154,10 +156,10 @@
>>   webkit_settings_set_enable_plugins                             (WebKitSettings *settings,
>>                                                                   gboolean        enabled);
>>
>> -WEBKIT_API gboolean
>> +WEBKIT_DEPRECATED gboolean
>>   webkit_settings_get_enable_java                                (WebKitSettings *settings);
>>
>> -WEBKIT_API void
>> +WEBKIT_DEPRECATED void
>>   webkit_settings_set_enable_java                                (WebKitSettings *settings,
>>                                                                   gboolean        enabled);
>>
>> @@ -513,6 +515,13 @@
>>   webkit_settings_set_media_content_types_requiring_hardware_support (WebKitSettings *settings,
>>                                                                       const gchar *content_types);
>>
>> +WEBKIT_API gboolean
>> +webkit_settings_get_enable_webrtc                              (WebKitSettings *settings);
>> +
>> +WEBKIT_API void
>> +webkit_settings_set_enable_webrtc                              (WebKitSettings *settings,
>> +                                                                gboolean enabled);
>> +
>>   G_END_DECLS
>>
>>   #endif /* WebKitSettings_h */
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -51,6 +51,7 @@
>>   struct _WebKitURIRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -51,6 +51,7 @@
>>   struct _WebKitURIResponseClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h  2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h  2022-09-20 16:13:49.000000000 +0800
>> @@ -46,12 +46,14 @@
>>   struct _WebKitURISchemeRequest {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitURISchemeRequestPrivate *priv;
>>   };
>>
>>   struct _WebKitURISchemeRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h 2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h 2022-09-20 16:13:49.000000000 +0800
>> @@ -45,12 +45,14 @@
>>   struct _WebKitURISchemeResponse {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitURISchemeResponsePrivate *priv;
>>   };
>>
>>   struct _WebKitURISchemeResponseClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h    2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h    2022-09-20 16:13:49.000000000 +0800
>> @@ -58,6 +58,7 @@
>>   struct _WebKitUserContentFilterStoreClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -52,6 +52,7 @@
>>   struct _WebKitUserContentManagerClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -49,6 +49,7 @@
>>   struct _WebKitUserMediaPermissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -57,12 +57,14 @@
>>   struct _WebKitUserMessage {
>>       GInitiallyUnowned parent;
>>
>> +    /*< private >*/
>>       WebKitUserMessagePrivate *priv;
>>   };
>>
>>   struct _WebKitUserMessageClass {
>>       GInitiallyUnownedClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h   2023-02-12 23:02:17.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h   2023-02-13 11:34:35.000000000 +0800
>> @@ -28,42 +28,10 @@
>>
>>   G_BEGIN_DECLS
>>
>> -/**
>> - * WEBKIT_MAJOR_VERSION:
>> - *
>> - * Like webkit_get_major_version(), but from the headers used at
>> - * application compile time, rather than from the library linked
>> - * against at application run time.
>> - */
>>   #define WEBKIT_MAJOR_VERSION (2)
>> +#define WEBKIT_MINOR_VERSION (38)
>> +#define WEBKIT_MICRO_VERSION (4)
>>
>> -/**
>> - * WEBKIT_MINOR_VERSION:
>> - *
>> - * Like webkit_get_minor_version(), but from the headers used at
>> - * application compile time, rather than from the library linked
>> - * against at application run time.
>> - */
>> -#define WEBKIT_MINOR_VERSION (36)
>> -
>> -/**
>> - * WEBKIT_MICRO_VERSION:
>> - *
>> - * Like webkit_get_micro_version(), but from the headers used at
>> - * application compile time, rather than from the library linked
>> - * against at application run time.
>> - */
>> -#define WEBKIT_MICRO_VERSION (8)
>> -
>> -/**
>> - * WEBKIT_CHECK_VERSION:
>> - * @major: major version (e.g. 1 for version 1.2.5)
>> - * @minor: minor version (e.g. 2 for version 1.2.5)
>> - * @micro: micro version (e.g. 5 for version 1.2.5)
>> - *
>> - * Returns: %TRUE if the version of the WebKit header files
>> - * is the same as or newer than the passed-in version.
>> - */
>>   #define WEBKIT_CHECK_VERSION(major, minor, micro) \
>>       (WEBKIT_MAJOR_VERSION > (major) || \
>>       (WEBKIT_MAJOR_VERSION == (major) && WEBKIT_MINOR_VERSION > (minor)) || \
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -113,6 +113,7 @@
>>   struct _WebKitWebContextClass {
>>       GObjectClass parent;
>>
>> +    /*< public >*/
>>       void     (* download_started)                    (WebKitWebContext        *context,
>>                                                         WebKitDownload          *download);
>>       void     (* initialize_web_extensions)           (WebKitWebContext        *context);
>> @@ -122,6 +123,7 @@
>>       gboolean (* user_message_received)               (WebKitWebContext        *context,
>>                                                         WebKitUserMessage       *message);
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> @@ -300,6 +302,9 @@
>>   WEBKIT_API gboolean
>>   webkit_web_context_get_use_system_appearance_for_scrollbars (WebKitWebContext      *context);
>>
>> +WEBKIT_API const gchar*
>> +webkit_web_context_get_time_zone_override           (WebKitWebContext              *context);
>> +
>>   G_END_DECLS
>>
>>   #endif
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h      2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h      2022-09-20 16:13:49.000000000 +0800
>> @@ -44,12 +44,14 @@
>>   struct _WebKitWebInspector {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitWebInspectorPrivate *priv;
>>   };
>>
>>   struct _WebKitWebInspectorClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h   2022-06-30 17:49:38.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -67,6 +67,7 @@
>>   struct _WebKitWebPage {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitWebPagePrivate *priv;
>>   };
>>
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h       2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h       2022-09-20 16:13:49.000000000 +0800
>> @@ -45,12 +45,14 @@
>>   struct _WebKitWebResource {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitWebResourcePrivate *priv;
>>   };
>>
>>   struct _WebKitWebResourceClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h   2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -85,7 +85,7 @@
>>    *   a #WebKitNavigationPolicyDecision. These decisions are useful for implementing
>>    *   special actions for new windows, such as forcing the new window to open
>>    *   in a tab when a keyboard modifier is active or handling a special
>> - *   target attribute on &lt;a&gt; elements.
>> + *   target attribute on <a> elements.
>>    * @WEBKIT_POLICY_DECISION_TYPE_RESPONSE: This type of decision is used when WebKit has
>>    *   received a response for a network resource and is about to start the load.
>>    *   Note that these resources include all subresources of a page such as images
>> @@ -221,6 +221,23 @@
>>       WEBKIT_MEDIA_CAPTURE_STATE_MUTED,
>>   } WebKitMediaCaptureState;
>>
>> +/**
>> + * WebKitWebExtensionMode:
>> + * @WEBKIT_WEB_EXTENSION_MODE_NONE: Not for an extension.
>> + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2: For a ManifestV2 extension.
>> + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3: For a ManifestV3 extension.
>> + *
>> + * Enum values used for setting if a #WebKitWebView is intended for
>> + * WebExtensions.
>> + *
>> + * Since: 2.38
>> + */
>> +typedef enum {
>> +    WEBKIT_WEB_EXTENSION_MODE_NONE,
>> +    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2,
>> +    WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3,
>> +} WebKitWebExtensionMode;
>> +
>>   struct _WebKitWebView {
>>       WebKitWebViewBase parent;
>>
>> @@ -231,6 +248,7 @@
>>   struct _WebKitWebViewClass {
>>       WebKitWebViewBaseClass parent;
>>
>> +    /*< public >*/
>>       void       (* load_changed)                (WebKitWebView               *web_view,
>>                                                   WebKitLoadEvent              load_event);
>>       gboolean   (* load_failed)                 (WebKitWebView               *web_view,
>> @@ -293,6 +311,7 @@
>>       gboolean   (* user_message_received)       (WebKitWebView               *web_view,
>>                                                   WebKitUserMessage           *message);
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>   };
>>
>> @@ -489,6 +508,15 @@
>>                                                         GError                   **error);
>>
>>   WEBKIT_API void
>> +webkit_web_view_run_async_javascript_function_in_world (WebKitWebView           *web_view,
>> +                                                        const gchar             *body,
>> +                                                        GVariant                *arguments,
>> +                                                        const char              *world_name,
>> +                                                        GCancellable            *cancellable,
>> +                                                        GAsyncReadyCallback      callback,
>> +                                                        gpointer                 user_data);
>> +
>> +WEBKIT_API void
>>   webkit_web_view_run_javascript_from_gresource        (WebKitWebView             *web_view,
>>                                                         const gchar               *resource,
>>                                                         GCancellable              *cancellable,
>> @@ -637,6 +665,12 @@
>>   webkit_web_view_set_display_capture_state            (WebKitWebView             *web_view,
>>                                                         WebKitMediaCaptureState    state);
>>
>> +WEBKIT_API WebKitWebExtensionMode
>> +webkit_web_view_get_web_extension_mode               (WebKitWebView             *web_view);
>> +
>> +WEBKIT_API const gchar*
>> +webkit_web_view_get_default_content_security_policy  (WebKitWebView             *web_view);
>> +
>>   G_END_DECLS
>>
>>   #endif
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -49,6 +49,7 @@
>>   struct _WebKitWebsiteDataAccessPermissionRequestClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h        2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h        2022-09-20 16:13:49.000000000 +0800
>> @@ -62,12 +62,14 @@
>>   struct _WebKitWebsiteDataManager {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitWebsiteDataManagerPrivate *priv;
>>   };
>>
>>   struct _WebKitWebsiteDataManagerClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h   2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h   2022-09-20 16:13:49.000000000 +0800
>> @@ -42,12 +42,14 @@
>>   struct _WebKitWebsitePolicies {
>>       GObject parent;
>>
>> +    /*< private >*/
>>       WebKitWebsitePoliciesPrivate *priv;
>>   };
>>
>>   struct _WebKitWebsitePoliciesClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h
>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h  2022-06-30 17:49:37.000000000 +0800
>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h  2022-09-20 16:13:49.000000000 +0800
>> @@ -51,6 +51,7 @@
>>   struct _WebKitWindowPropertiesClass {
>>       GObjectClass parent_class;
>>
>> +    /*< private >*/
>>       void (*_webkit_reserved0) (void);
>>       void (*_webkit_reserved1) (void);
>>       void (*_webkit_reserved2) (void);
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#177154): https://lists.openembedded.org/g/openembedded-core/message/177154
>> Mute This Topic: https://lists.openembedded.org/mt/96930211/3616933
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kai.kang@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Kai Kang
Wind River Linux


