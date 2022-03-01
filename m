Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1021FC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 08:19:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5998.1646122762662504634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 00:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=a5S8qAwR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0059b693a2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2217cQOH001793
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Mar 2022 08:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=GLpycP/DtzycvpM7mEHCY2I/+xMN6FMPzX4/82rZyvU=;
 b=a5S8qAwR+IRff+us8QV69miNVZeMkgadxqJ8Ujwo0/2ugpIuGclJRM71UqKCcDWWpf8C
 R5L8yIvoaCWqGZ5jrCit/gSV+8eVD1CFng1nWY92BXocAA4AnOLY3qeVy9orJvLEjC0k
 edPtfYPc47BqfHK4ePVsuiPrbuga4iloOGHru5I+pd1JgSq8UqBBPfJKOssP8l0K64nq
 lO0Lo8RwrbXw0t/GViY2jsUvk1Gx8bAKQV8y5jm8iw+jjGP4yThDNbQCR2D9AC68aq4H
 LeA8DeOs/fmq4SPv29EtuZVjscyrLKEf9c5Y2w8Grarj9oycV2esuNHm7Q2837XNUbl7 RQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3egvnxgwsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:19:21 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2218JLY1024957
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Mar 2022 08:19:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3egvnxgwsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Mar 2022 08:19:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYqOKXLr54FXWhPCSDUb66132+TGQ2yPOfeUTt1eBX+MK6wqhd1yvMVeF7+fcuPs7+V0xziYKMxyV5K3PeSQb4FKgDMriePep0vKk4EN5Gm/xHFwwiX8lMib9VWoVJNg0EsLDuKQxeZnd8iks+uHBy7BQlRawYagoMH4fYRUoB+muRxDAmCcp/LxxgO899wId9hJqq2thj5Da59wNgSMAfyXpO9vt/7FWGiXi/8eS5CVjeL+obWuLvfL7F1qy9lq8Gy2S5NtAq8nCqO9YXB8uqu/kLuf2qtiA3USHhbtAa5NMR1+JDvej7pUeYxBG2TcIRTVx/w01xHhP8fKR8HT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLpycP/DtzycvpM7mEHCY2I/+xMN6FMPzX4/82rZyvU=;
 b=DoXJ04uOYyxtJgKstF8g4RLstjRcNiAF4Dq5RP7CQ7TF0By/8lT3oZqdnX3kxtdr29F+2IIbcNHvL8UeZPb32fxOVG3YKREPv5jKZaoyR3auKvXbJgac6/Y5aursoochPdL+IXkqMNYxPBJBUeKTDtke2PB0J3prmh6rkh4pvUn1HH0ZuuYp70PjENpnr57zl/vUyOEGCwqoSmLmvTI6XUVhicEQG7YVG9eI+uOpUTcKaViRmOI8HVfmZasMh5RuLs7XFy3fd++IfJXhdOXolJ3r1o2MhskaYE5aKADo6epH99ffPzaq297Ap7alI6IDUf+L7FH//XLn8M+sTk2TIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CH2PR11MB4469.namprd11.prod.outlook.com (2603:10b6:610:43::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 08:19:18 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439%7]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:19:18 +0000
Message-ID: <7e92775d-b2b1-6482-4221-fb47935f1c47@windriver.com>
Date: Tue, 1 Mar 2022 16:19:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/1] coreutils: fix statx failure on native
 builds
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1646119426.git.liezhi.yang@windriver.com>
 <373dcd3613b74ba10dba54f5116576bc172c222f.1646119426.git.liezhi.yang@windriver.com>
 <6e3a32402d372d518e6c4bce86f54f4791aa5081.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <6e3a32402d372d518e6c4bce86f54f4791aa5081.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0279.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::10) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c61d5343-3838-43cb-cf8f-08d9fb5c2e2b
X-MS-TrafficTypeDiagnostic: CH2PR11MB4469:EE_
X-Microsoft-Antispam-PRVS: 
	<CH2PR11MB4469B006FE1081BF193C57A2FF029@CH2PR11MB4469.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rLQzyG/Q6iklk/kZb45UGhXK9N2utgBXnygC3QQ7gczrtIujd7qqntS61vxx/TKfYsLrO0oZq+RgiV/9uHIbI/8WcAl1NDBTRwnWKFOxqZxdriqx4cJl8AbbWiGi+wlBwd+JB/u6TNIQt49nslviS/OCvjF0/RXOvalQAcUz9IWE9gmksvgbJtrzV0Tztda2Otd+CbfUVsOgAoAgEwX13XVDDSJH1Mi8eFe6Y4H8HVhmuDIn8EceI0P4gwN5rZw2F+vQ/M9PlQ++pODzOGE5qED3pziTLpB7TyGrSf+w7mJx43f021QfaF5meLKiypTBWjWuveCCOtlwIUL5qNftHCo9JipZKsP3C+G9k8+iDdGTExmd40CHKWULfTo930GqYzQ6Ha/K2Lj1ErnMv+FpBsSFC3rk6tuZIO1BZUPY9xVCy69Ym/vHbb/ciFUgRpdxaG2ly9t66AqOtNGsTOlXVEW/Dc/rRfskeI+lf6Mtn9WTHyCDBlInkMHx9GEg/3eVtb9VrZoJlX8Nnm677l6hhHT+cvM0d/0BJgVSTsTV1Tiscy1tkV87/E7sLR0CdJzYklUm8hAzVozA110KPUbJBit0Lux99rA3DEMjvU5ix5D0yA7SYT9x3vHvlc4YKvWXkhUXf87T9KgRjSxxsBwXUaCOR8LYNeyainSbzyjEsbzoltKejP335W3ufy3mi3li1PvZSKaCXvvOo+LZoptyifiC4bxQxefLWnsRgX00R0i1ySSiVSkLs3eQRAKa/6/aeNSiBeAgS5IxzBxnvmGwFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(6512007)(8676002)(66476007)(8936002)(38350700002)(66556008)(38100700002)(2616005)(2906002)(26005)(31696002)(86362001)(5660300002)(31686004)(186003)(6666004)(6486002)(36756003)(508600001)(316002)(6506007)(52116002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFliOGhNZW5EZDV3NzBmRXkxQTNkQlh1Q0t1elNmQzUrUy9xK1RwQVFkN3U3?=
 =?utf-8?B?azZBM3QxTHVtMzVDNU04QndjZ2I1WWxjcFBwaU1HRVJ3dmZ1bEdFaUxsQXp5?=
 =?utf-8?B?NFZtd0kxdE9GaHVzNlVtUk1hUnBHcnY1NFVZeGc2T2N4U3ZSajRwZVNQUXFj?=
 =?utf-8?B?NkJjck9TZ0FrTUxpV0xyNkhXMzg0VEF4N3NlOFBPMmNBN1J5Wnp0Q1piOEhx?=
 =?utf-8?B?bisrWVZjVmt5NzhnNWZSVTMxaXVkQW1wdGRXQjhuL1lEUUFiUVZ4djRLYiti?=
 =?utf-8?B?UjhMY081cjRwMmRBbWFEdVpKTkF6L092eTNTeitGY1hUTnZSaERvYkszWXRy?=
 =?utf-8?B?Y1F6OWVwOHMxVitSdDdhOUc1bm4xRTlBRWt1ZmQrZzFrS0xINE9Fb0owUFhn?=
 =?utf-8?B?VHFsUUJNYW9NUW44NUdTNVNOQjhHd3hSb3YxSmhyODNZbzBIZldsTy9yY3px?=
 =?utf-8?B?RHhnVXVLNlJoS1VZTFpQZlIvaE1nbkNzckNDUEVDRFFkMkY5am4wdXVOdTNK?=
 =?utf-8?B?L29nWjNPK0laeEs2SzkrSkFvaFVncjl4ajFHazdodzcrc0wya2hLUkMyTnhF?=
 =?utf-8?B?VmdGMlY1akJvU0N3R2dIcmhMRVRzWEhJWGk2Zy8xZk0veDIxNGdnenZwR3FB?=
 =?utf-8?B?dFAvdWhLUXFBeVpFYm9kWFNiZjJGcEdRSS9SL2NLdEdac2RtUWRCckllQUZX?=
 =?utf-8?B?WkY4ejdDMkdtLzNKTlhTdzhwZG92ei9ZTHBueHo1bXFKSmxpbUhxUkFWMHgv?=
 =?utf-8?B?YTM2czhreGxOUUxGbDhPY0dCUkZDWW1oa202djhTYnYyaUNVams2ZlZXejBn?=
 =?utf-8?B?VkdFYU02eG0rb0hBaVh4aTAzWWw2SkFTeGtCeWdxYzkyRllmNlhJdjVMYkoy?=
 =?utf-8?B?bUU1WXhMN1RJZ2pYMjg5TGs4ODBzWVU5cGJkK052Qkh3STYxUzYyUVVSUmdJ?=
 =?utf-8?B?R2kwU3VrNWVrRVZ3TklWK0kxM1o2N3hpRjArOXdFbHM0ZmdOOCszOEQvV1JW?=
 =?utf-8?B?SzZHalZsRUk2WHFQcjdUQWdUQ3dVeFYrcE1RSHZyKzd4VzNpZkhFUzZhQmhj?=
 =?utf-8?B?bnV3czZvWXlwTmlicmNrZENCcTlscnF1elJrMEhTanp3aFBEUVUrTkxaT2RQ?=
 =?utf-8?B?QUdoejNUMnhNT1BOR2FRY05wdUlqNWpGdnJ0ZHQweTlja29jMEp0bUtXNU5l?=
 =?utf-8?B?aWN4YkV0U3VHYW5zYzVSRWFKRWlzaDF0TUluMTZVVElQRGZkTkJmbXJnM2Ro?=
 =?utf-8?B?T293QzZiM21tM2NENmNpUGdSc1JTZmF2VUxRQkl2Q0thRk45KzZJREx0NUNB?=
 =?utf-8?B?VmtjS0pLM0dVSHZZQUtMM2pZMkNOaGhMT3MwRzVBRk9NSzBmcExnTk9hSFJQ?=
 =?utf-8?B?KzVWYjVnTnNxQnVicDAxKzd1R1ZHYTV2YkFwTVlvQVNhTmhjUVpua1FYWFpX?=
 =?utf-8?B?WnRTZ0xOMzk3NnV6Q3YrbEN1V3pBU1g2QUJRdUduR1B4Y2plY2JWai9nUnJh?=
 =?utf-8?B?bmFhenBJNDgzdjg5cEhMQ0hTby8zNmJKMGVnQ2VONlhsdm5iaTUzTEowWTEw?=
 =?utf-8?B?WGVXNnVvTXpmMm5GRmNZY1RyNzdoNC9URlF3a1FLdHBiaHBxcVoxQTZLZ29Q?=
 =?utf-8?B?Tk43NmEraXd5cFhQeVBSTjl6YTlUR05ycS9yNFBMamIxcHQ4blUyTEhZbXVy?=
 =?utf-8?B?YmhMS1JVcXNyczRydWFWWmVkWmZteHFIVWFXVlVGeVM5Tk9yLzVlOWV2YnZB?=
 =?utf-8?B?Y1A2SFdhQVNyUXFxM2xhOWNtSW1aY1RtdnVqT2NvY2JWcDR1NCttTjZmZ1pa?=
 =?utf-8?B?cHlLOTBtcUdaQUNEekk0RnZhVnBoQnB1VDNNSjgrWFVUUDBZYlBlSVZobGVk?=
 =?utf-8?B?dW1tRnJBRWtkRkpCck9nYk9SeG9FSCtkTWhMbVlpV3pUMnhsM3cwTVNXa2Ny?=
 =?utf-8?B?ZGNxdGVUUEZzTHNUbFlmU1JiekRLc29kTlV1bUQrTjR2SUp0WHM1RTBKWWtF?=
 =?utf-8?B?aWxBOG54UkI5a2FuWHdZQ3hKNWh1ZXB3SmppQ2hxbGNpOUZzVEV2cGNubmVR?=
 =?utf-8?B?akdhMnd3a1loVCtlenN6MjlodFM0YWg0RmdTV1RyS25PeUNRd3I3VmhOeklx?=
 =?utf-8?B?VVdvMStTcEVTVFU5NG1QNWxjTC9TOVk2dWZKYVlHZ0htL2pQUUZUaDZ2OE93?=
 =?utf-8?B?VEROTWN5UkdRdDBiSmt5WFdyS0EzazFZNXhRRGZ1T3lUbXpTd0QwR0VYVldk?=
 =?utf-8?Q?sCwDQWr9MuKh+BRT3eWGpObKii4bvh7np/RUnxcU6o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c61d5343-3838-43cb-cf8f-08d9fb5c2e2b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:19:18.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hxOkFCVlhJbi6MiQUVhELaPIzErRE4ZoEqOqmSHFFQ6IFnnORdQiGYvWCm+d4RbsdzqebjbtyGnaZf/qldSqszeMYNb0e5jlaPZqJ6I/nvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4469
X-Proofpoint-GUID: SMQlbDI9e55TkwHVL1tpfRoD9NTmKkXZ
X-Proofpoint-ORIG-GUID: 5tw8uGUW69wqH0Lc_LhkLT8-uCRMzXcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 08:19:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162532



On 3/1/22 3:59 PM, Richard Purdie wrote:
> On Mon, 2022-02-28 at 23:24 -0800, Robert Yang wrote:
>> From: Davi Poyastro <davi.poyastro@nokia.com>
>>
>> Coreutils configure only checks glibc compatibility for statx
>> syscall but fail to check kernel support.
>>
>> Fixed on RedHat Enterprise Linux Server 7.6 (Maipo)
>> Host kernel: 3.10.0-1127.8.2.el7.x86_64
>> Docker distro: Ubuntu 20.04.1 LTS
>>
>> $ bitbake coreutils-native
>> find the binary ls and run it as "ls -l ."
>> The result is something like: "?????????. ? ? ? ? ? foo"
>>
>> Signed-off-by: Davi Poyastro <davi.poyastro@nokia.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-core/coreutils/coreutils_9.0.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
>> index e4633949f42..40fad72bbf4 100644
>> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
>> @@ -152,6 +152,11 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
>>   ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
>>   
>>   python __anonymous() {
>> +    from distutils.version import LooseVersion
>> +    # statx syscall require glibc >= 2.28 and linux kernel >= 4.11
>> +    if LooseVersion(os.uname().release) < LooseVersion('4.11'):
>> +        d.appendVar("EXTRA_OECONF_class-native", " ac_cv_func_statx=0")
>> +
> 
> Shouldn't that be EXTRA_OECONF:class-native?

Yes, you're right, I took this patch from hardknott and built it, but didn't 
realize that I need change the override syntax.

> 
> Which makes me worry about where this was tested/needed?
> 
> I'm then a bit worried we have two different signatures for coreutils-native
> depending upon which host this runs on, which will cause a number of other
> issues. I don't think we can do this.

That's a problem, maybe we need disable statx for coreutils-native?

The errors happens when glibc has a higher version (Ubuntu 20.04 in docker) 
which has statx(), but kernel version is low (CentOS 7) which doesn't support
statx.

// Robert

> 
> Cheers,
> 
> Richard
> 

