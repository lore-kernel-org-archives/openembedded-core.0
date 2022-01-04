Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B30C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 01:48:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.923.1641260918810965362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 17:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cEaQKgFG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8003c63d27=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2041ftEh020022
	for <openembedded-core@lists.openembedded.org>;
 Mon, 3 Jan 2022 17:48:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=6wvV88toIqTxGkU5InDANqfCkKRuhiKwRcv0/lu42TI=;
 b=cEaQKgFGfPBI6cUCA6pE4NX5esSK6Tjcj+Ihb/l6fhMqXgR78NFxTiMwPsS0MoCp2lH9
 mi+2a5EP6lIrYP1oNQC/JbNYKhTqVX8vinQAc6r7Zns09umRdnQ4u9itU3g145dqB6kW
 QX7tqbRXgliq+GQu413ln0CoKGRsrYwgpM1mILKGOQLnPLbIuOj7PvZB+VluNFp1WVVy
 OvjRTeJzW8U7wYlCNkjvkM3gk8W0DMNuFb+Tvjbn814HYolyqZ3hdrGgBdbX8EC/57Wk
 T12SP0m7hbd1kGtG5pqWPeBn4LqEqrZjBp7ijyLDCk7Pj+mexRh5HPlMF5ivjKe73p8r Cg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc67ug6dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 17:48:37 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2041mbRr001481
	for <openembedded-core@lists.openembedded.org>;
 Mon, 3 Jan 2022 17:48:37 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc67ug6dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jan 2022 17:48:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhvNYCRD/Rkz5b0i5oKM18spveSutmpU43CVxZbUsa8eA7MB368gurtHsXkAeUn2OR7b0f8Uy9Zi6OljtNDywDxlqvgoRDMVYqUYnaFGSXJaCMD9upR5966Ey86nzkdQALaiPRb7VSEDp55IcQcFUt7V72HHmSSKsvi4s5qlB8JyYHHch/digAfYskjjn5E6XcoZTV7q+zcQ4ZKEjOeFfoW1zGnzUqLYHYTCx7AkDnb5hYVf+L2LSjPFOdymggacglNxoUEeO9UGtWuxr+mOZEybw3ykVOGgt9F7EL5ltQ+gqy1LH4JO63GnnZxzMNimgo9bolP2Tnm8t8cyVyxcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wvV88toIqTxGkU5InDANqfCkKRuhiKwRcv0/lu42TI=;
 b=ObZz24aKcamGJMpfDQPT3QiuhB5RGLKuApdFHgHFem3a3aYL1/VU3nm37Kv7A5x72ZWMxWwXlOcJZu1B+UYFChNN4KN28c7V5MDdxpsdhlNKZpHwESQCGW1gqKXrWRIIW8jlFVz5mJnKIFEAU+QOAXuFo6BCesg1D9sSEY0ZrwLDQNkzeOjiC3NZrF6N5IGGhDJw6rhFF91WJ05MG1B2+aO0nFIAQsoxAv0fNKUAeLLgJpBTFX0KeQOQlZctmEsIGHPpOxtX8QMmWSonY/iciDudJMbOYOtLlQRt3CNy1HR/PCXr7RHmLMN23d+rHfGuF8OkQciXYAyYkWIdFHF8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 01:48:34 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 01:48:34 +0000
Subject: Re: [OE-core] [V3][PATCH] rpm: fix CVE-2021-3521
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20211231022140.33421-1-changqing.li@windriver.com>
 <6d4b04f6048055fe85d131679cbfcfda33a97035.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <5119f0f4-ccf3-60c6-8d35-b301a0f8a499@windriver.com>
Date: Tue, 4 Jan 2022 09:48:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <6d4b04f6048055fe85d131679cbfcfda33a97035.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR04CA0049.apcprd04.prod.outlook.com
 (2603:1096:202:14::17) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb2fc85-95e4-4efd-9f69-08d9cf245132
X-MS-TrafficTypeDiagnostic: SA0PR11MB4592:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB459285972BAD22A722B8A1B0824A9@SA0PR11MB4592.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FMxXDStvKJ+Y3fodNy1TZYKPS/6zUwXBF2zNE7ISIpkeKcVsYIJWYcphBtZzDIiH9AV+o8KGGnwKf6uHIee98YQsAVTvsNQVRmQmsWAUIG2b6+jHeYQSRSvUFdw9I16/ycMApAkGpf5pDXYV8bKS4GZ/TJ2SV26o0n7JB6GP5LRZ5b4YFqbI2atILJcVjorwUPJOHjTKM78cyMfJp9uqt6EWYT3TsTo2XFMERP2suxj3uEwyVY349vOcm1DuEsxcrYy+3+FhdXELR1MqD6jN8rmlnHJ/aEfbXERcoGzC0aeYTjq4Dt7K8Pf6BygVuwOzxAeTzVZHawzjpnIz08iEPObY9hS2rPHVL5vXjlOL8L/jA7v6QW9jq8YvK0u2Z/2aQoGQvLJWkzj4Oab2QSbAlLl3xw+vCwxpJoygHPJTOSg6JgL53BiQSXXq6jgOj/mumxRS55mXXA4QvT6qbFvfJMWkf0MrzkmFcDUmfDB2Ld7fWQU/TCXE2reGmj3+P5PT0EGmOIGFmIdH0qYgRRj4wOeCTsiACT71m0HRcxfK+qez9OZ0gE4qLkLrCw+70/6yNsGxmFq/YQYnt2TjwmUXtI2kwp5PUlXJt8F16TcHNbaCxaXHa6vAUADrKUw6rMKP13qvVDzDb1/0PG247KTvM35xs64pOfcWlXFJ+mlbZHQzfP+ZHE+728Lp3buv8c/ZEIXR0HpkEPdRm624cpLv/znjSFM48fsfhbg0/3/HnOpqVipmkhfFr0GUmsHdAMrsVfWFTeADryeA0MWJOniUL3XnHaLh/vVO/TQ2p/njQmWwvAfxTIMtA9TQqUrtXVeOZPszdfZSeOcysjpuX0mwLmEHvWOi6L7P+eSZEwhzqv1RO9sg5blfz4Or/oHKqJyAB0Y9Wvil9yOwtFs/3+kWRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(38350700002)(2616005)(44832011)(8676002)(6506007)(53546011)(5660300002)(66476007)(316002)(66946007)(6512007)(2906002)(38100700002)(66556008)(6486002)(8936002)(4001150100001)(6666004)(508600001)(83380400001)(52116002)(86362001)(31686004)(31696002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bm5zZ2lja0J2NS8xVmRBbzE3em1PUnJpUjl2a2NxU0F4UEx5dXhrV0xuNk00?=
 =?utf-8?B?SytBSGNOOVlmSGNwcjhIYmJjV2RZOE5UU1lRREYvckc4RUF5WDZQLzMzSC9t?=
 =?utf-8?B?eUZhamViblZIMkgyY3hFQkdqL1kxTk1EZVFmZFh3djhDZmVnZS96U3VYb2RQ?=
 =?utf-8?B?bWFGYUdhQ2pLRVEwTWFVWTNFdEc4WW16a0JoaGtnemZ2eG4wOGErKzRQYkh4?=
 =?utf-8?B?SWJEMTcwdlJwUVl1ZjZBRlo2aS9RalNhZDBYY3NScUphb1hieTl0QkdhQVE3?=
 =?utf-8?B?VTFoUXpxMWd0QnVzQmxHRi94VWpndFY5NkFweklqSjZsTUtrQ3JGZXZweHR3?=
 =?utf-8?B?TXJieUtJSTgzSUpCenRJaGlpUjV3ZExqQVdZSXhKK3J3blBsOGNxQTYyY1lq?=
 =?utf-8?B?aXFWdlF2U2xra2NiRk1ZRVdPZ3oxckRCZEVLWlRRNHhSS3pueERHUmJQSTk4?=
 =?utf-8?B?SFROT3VlNEdwOWpLYSs2Y1djTlp5NHIwVzhYSDRxN2lQZ0V3UnFlMWdTVVNV?=
 =?utf-8?B?aXQ1L1BaRG8zZzhhcmtEWGE5dGtSWVZiY1A0T2ttWFNqZHBleFJ4U3ZGdkFp?=
 =?utf-8?B?VVZ5Nm10cmFuNkkzVzNYOE9XZ2hmRlAvMUhWSnp6cDlWL3dRRXVUNmhyQzdD?=
 =?utf-8?B?WmdPSFh0SWZBNXo1Zkg5OENTUHRJQTNYQUEvLzIySjVzKzc5Q2poQkxxc1Vk?=
 =?utf-8?B?aGdBNGROckhFejZGdE44Y0lpQVZOb25IMGxtRTlNWXpxWnlRREdod0lzMWRk?=
 =?utf-8?B?Y0l5aE5sR1pRMHFHM2tZeWJkeU1BWGpJL084Q245SEhPVkFFdTRNRXIyRkw0?=
 =?utf-8?B?YWQ3ZkMyUTFVNGIvOEJVcUozR3VMU1VpUGNieWxxaXhDeTZ0eEUyc0JSRzlX?=
 =?utf-8?B?dEovSGpTbW5ZaUd3TFpNa201bm9lYTRMazFmV3FyNWw4YnpGNHlINUxNbDRE?=
 =?utf-8?B?ZTBxRU5FN3VGV2pPSi8rQWY2N3FkSURIQWMxSXRteXpCc0YyZDQ2blBYa3d0?=
 =?utf-8?B?eVVSeFNxcUlPVElyTnFaRTlJMzNDSmVyU3FVU3NkUlJ3dlhod1ZDak15NjB6?=
 =?utf-8?B?MlRnU2JvRWx1cUFvc3Mvd3E2dHk1VkNSdjdPMTllTWphU05FKzIyU1NOTGJw?=
 =?utf-8?B?WGZVTWMvcHdaS25NTkFCVTdXZUE3TklETlIzUndDckFieGpYQ2NNeHZvN2Yv?=
 =?utf-8?B?cjJHeUtzZGFWdWNYVVZaNXdLRkkwU1pxdnVETHhEWUZIM2ZRSzFYSnVnbXo1?=
 =?utf-8?B?VmdFWk83alFZd2ZOelRVM2phRmROQlJwVllzb3FaQzY3QWl4OXMzSWpPeEx3?=
 =?utf-8?B?K3RHaHlBM1ZTbnhOWWNLSFF6TS92emxQZHUxd3oxejNHdU5valVPR01DRTg4?=
 =?utf-8?B?L1NPNGxMaFUzeDBseEpneExJYnh3NFpnYmQ3MmdBVVlBVUhlVFhRWVRob3hD?=
 =?utf-8?B?VVRNaFBwMitQRS94SW44dmliMDMwMHBRb2pRSjJ0TitQemFjdlphTVZ4cEZY?=
 =?utf-8?B?S2pXazNWWXNmcDV6a25QYjJBU3ptMFZTS29hWFNWKytvYkpOdnZ1Z1M2Uk03?=
 =?utf-8?B?MjJtQkF5T04zM2NGUlZJTVVUR1JPQzc5eTRsOVNGZ1pKaU9pSm4zdUluc3Vn?=
 =?utf-8?B?RW44SkZiT0ZtN0ljWU1DYVJoek84MXd4K1NvVzE3eEQyV0VOeU5CZ01vTlBx?=
 =?utf-8?B?V09iTTcrUlNwNHZ5R1kyZFRQSXEreldIdFhXTjNMcXBTcndMaGpXUHppT0xJ?=
 =?utf-8?B?dktmNXM2Y0RJejNDNGZ5Mk9GUnF6Qmh1SCtCTENLcWlrcWVha21RQ2RsU2R3?=
 =?utf-8?B?cUJBOVY2UmhIWE4vM2tONkZvcThRai9hVVVFRVM4ajZ2bTJQNWRaM3pTRlhz?=
 =?utf-8?B?NytFWjNBeTJBR2Y3Z0dncVdnR0lFQWlhRlFQSXQrbkFKNUVYVVJpcFJENlNJ?=
 =?utf-8?B?WnM2UVhjdzRUbG1lN2Y3d2FEZkxqL2hOWVRzejRpdlJicVdNc0tRSjlDSHBN?=
 =?utf-8?B?MVliUFQyWWlib1VxZVFIVWRNNlR4ZFd2akRpNi90TCthb1R0bXFTd043dm4v?=
 =?utf-8?B?TGV2OUZpQzVVczJoRmVnN0RLUDdoczQ3K285c3MzQVY4cGJLWE9uQVFqdldj?=
 =?utf-8?B?Wm11cFBNNlRZa1ZJdXBVM2UvbzFJdmtWcFNrV2d1eGFHOTNGWXlFditBNU5z?=
 =?utf-8?B?b2t4ck1vR3ZrcVlDcE5EWER3MXJlT0Z2SHJyTldRV0ZsQkV1ZFVGbEtYbWpB?=
 =?utf-8?B?L0pla3lucFlhNFIydnNNVXBaK3VBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bb2fc85-95e4-4efd-9f69-08d9cf245132
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 01:48:34.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tC475WSle6erOCfOuf3zTQrv014E7sz6vv/gWgsqE7PUdU31tuRlUr0C3B40tbkSrboxj/AsWiW1sfOORHEuspWuPzCx3KewNt/baUMkYL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-Proofpoint-GUID: AQUtqvZ7q9fztc9pum5uNxSPSVyF9iEH
X-Proofpoint-ORIG-GUID: SDQX1VOV7WxZ9ZDvhZZkMxuvmCm4sGFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 01:48:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160154


On 12/31/21 11:38 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, 2021-12-31 at 10:21 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../rpm/files/0001-CVE-2021-3521.patch        |  57 +++
>>   .../rpm/files/0002-CVE-2021-3521.patch        |  64 ++++
>>   .../rpm/files/0003-CVE-2021-3521.patch        | 329 ++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_4.17.0.bb       |   3 +
>>   4 files changed, 453 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
>>   create mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
>>   create mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
>> new file mode 100644
>> index 0000000000..b374583017
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
>> @@ -0,0 +1,57 @@
>> +From 9a6871126f472feea057d5f803505ec8cc78f083 Mon Sep 17 00:00:00 2001
>> +From: Panu Matilainen <pmatilai@redhat.com>
>> +Date: Thu, 30 Sep 2021 09:56:20 +0300
>> +Subject: [PATCH 1/3] Refactor pgpDigParams construction to helper function
>> +
>> +No functional changes, just to reduce code duplication and needed by
>> +the following commits.
>> +
>> +CVE: CVE-2021-3521
>> +Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/9f03f42e2]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + rpmio/rpmpgp.c | 13 +++++++++----
>> + 1 file changed, 9 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
>> +index d0688ebe9a..e472b5320f 100644
>> +--- a/rpmio/rpmpgp.c
>> ++++ b/rpmio/rpmpgp.c
>> +@@ -1041,6 +1041,13 @@ unsigned int pgpDigParamsAlgo(pgpDigParams digp, unsigned int algotype)
>> +     return algo;
>> + }
>> +
>> ++static pgpDigParams pgpDigParamsNew(uint8_t tag)
>> ++{
>> ++    pgpDigParams digp = xcalloc(1, sizeof(*digp));
>> ++    digp->tag = tag;
>> ++    return digp;
>> ++}
>> ++
>> + int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
>> +              pgpDigParams * ret)
>> + {
>> +@@ -1058,8 +1065,7 @@ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
>> +         if (pkttype && pkt.tag != pkttype) {
>> +             break;
>> +         } else {
>> +-            digp = xcalloc(1, sizeof(*digp));
>> +-            digp->tag = pkt.tag;
>> ++            digp = pgpDigParamsNew(pkt.tag);
>> +         }
>> +     }
>> +
>> +@@ -1105,8 +1111,7 @@ int pgpPrtParamsSubkeys(const uint8_t *pkts, size_t pktlen,
>> +             digps = xrealloc(digps, alloced * sizeof(*digps));
>> +         }
>> +
>> +-        digps[count] = xcalloc(1, sizeof(**digps));
>> +-        digps[count]->tag = PGPTAG_PUBLIC_SUBKEY;
>> ++        digps[count] = pgpDigParamsNew(PGPTAG_PUBLIC_SUBKEY);
>> +         /* Copy UID from main key to subkey */
>> +         digps[count]->userid = xstrdup(mainkey->userid);
>> +
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
>> new file mode 100644
>> index 0000000000..b93a1d5404
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
>> @@ -0,0 +1,64 @@
>> +From c4b1bee51bbdd732b94b431a951481af99117703 Mon Sep 17 00:00:00 2001
>> +From: Panu Matilainen <pmatilai@redhat.com>
>> +Date: Thu, 30 Sep 2021 09:51:10 +0300
>> +Subject: [PATCH 2/3] Process MPI's from all kinds of signatures
>> +
>> +No immediate effect but needed by the following commits.
>> +
>> +CVE: CVE-2021-3521
>> +Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/b5e8bc74b]
>> +
> The new tests also trigger for the missing space above after Backport. It does
> make me wonder why you don't see those test failures. I've tweaked the patches
> in master-next to fix this.
Thanks.

I don't receive mail about the failure, seems the patchwork is not working.


Regards

Changqing

> Cheers,
>
> Richard
>

