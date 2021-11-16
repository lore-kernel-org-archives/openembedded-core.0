Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F207AC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:57:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.733.1637081827837008463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=sFcIi4ef;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=695405095e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AGDFwFr023975
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=CTSzEZ0ZvXF4tkLBoUEuj30mOd12HpD9HHPHhyoE8Xk=;
 b=sFcIi4efk/uyuvml4IKDbPowuZnACbQctPMyTLiinBu760n9c5lGRhjEpe4bF9xM+r2F
 AxkqhY/J5b+vT+zjbmy+2aNVNCsCWkHoVwZSIP0nU59lmq/9WuK3W0LGB2Zszdk9gVHj
 kqp5qTv3r5H+68+Hsqhp5RC4w5umvLrP4ekFLk/3c+pyGnehyxc1saQS53Vt/VvcjfCI
 rDH4aNO9NJzRVZCGMsSaBOOzrb65/ozUWPbFJg1gmIMsnwo4sGVj5yjetcCzR8x+UqxF
 i/DFg7YTT8vsb0r9YXeWOQSNmWnRsjgcjMVDNC4Oc3alJIJ0CfxnFG3cASWR+bW2gBui 8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbfy31h25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 16:57:05 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AGGv5mM007754
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:57:05 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbfy31h23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Nov 2021 16:57:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFUPsrXOge4P8m6+QjUvTq0BoZzLLxlp4rmNQ1CyNb18FggZkWx1MdyG8lcFQX2hhIA4gl56B2DGLEK6yePebuqpdbtqNMthm1rem7YA96lccu5YDkqC45e4iWFlfuLYQ5tQTT9hHMxvEiy1l7YpmrDoK2A3l0ptv/ApLCYzy3Me33NwrD6vhKgxnWjVMz+xaxA7lYIsjdsRStBKIHsMvx7vfpx70LTkvi1hFXxodTLtkAyg3nF0r5C6QMAGXxX23JmOSE0Py4o1lSay5U2544keL22iMMDch0VwVg+ANwHRrmYdBsv6ojK+nHY7mgMwA/Vw2QhpVCkZnaeetHza/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTSzEZ0ZvXF4tkLBoUEuj30mOd12HpD9HHPHhyoE8Xk=;
 b=XqyTkha+8k7CTd1TBV/DaLLc+RisXDVBP8QZf2qp6T2rKs3BIO/OuqdioZr61MsW/qBo43o1dBsSCrb/sS3j1AsebAW+AlZtKqShFF+n9uVTVzE4jLAJxdtk21Gi+F5wI266PllZ+RG7xzJI3L/aZry0hjZCE2BgIYa6wsgHxwYX4Lj8R27/S1jLeeVvkepdgT+UBxNj00XOb/fxN4nk5+3p2dW1Da7PQXifL2YOgn4laTzSaNWjjWF2DR1H3+e0R3vHa87tdazBiKiRIbl5fV+YCMxci1qeFGH3lSnkA2BxgxEnE6NWwaXePoKytZsKKVdOhCN40vTMOY9w4w5OYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 16:57:04 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 16:57:03 +0000
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
From: Saul Wold <Saul.Wold@windriver.com>
To: Paul Eggleton <bluelightning@bluelightning.org>,
        Joshua Watt <jpewhacker@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <quaresma.jose@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <sakoman@gmail.com>,
        Andres Beltran <abeltran@linux.microsoft.com>
References: <20211027013050.137364-1-saul.wold@windriver.com>
 <89232e41-ac8b-def5-94b9-22d08b7e01d3@gmail.com>
 <9c6aa6d7-ddb5-0bab-8639-063e71379101@windriver.com>
 <3381838.aeNJFYEL58@linc>
 <17832a06-2f82-a438-3990-178a97352ee4@windriver.com>
Message-ID: <f0dd9760-fc8f-87e3-b22b-0b5256f6308f@windriver.com>
Date: Tue, 16 Nov 2021 08:57:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <17832a06-2f82-a438-3990-178a97352ee4@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from [IPv6:2601:642:c400:ecf0::956f] (2601:642:c400:ecf0::956f) by
 SJ0PR13CA0136.namprd13.prod.outlook.com (2603:10b6:a03:2c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.16 via Frontend
 Transport; Tue, 16 Nov 2021 16:57:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd3fb209-adf8-4066-18ab-08d9a9221d60
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2031478317D2C2D9AB987B1FEE999@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YixtYz1xFDeWiOoUHVRv5zDsBEKxYpzy2MNF5q7L88bNOSxoTt7KpzvaGZKTkI7daH03LWIOwNpwLUxkID+21YEo9giAhN6qX7UqC/u122pPHi7bbHHR7fG00zqrCKJbKXW1BG1D9Z0NAeovQoLTOZLBdqdBOdD8SLKca8DhKxWxD/TU9SdBPeBp8MoziI8Z97DidbBCL5Ba/jnY1ZWHGu6NNMbmrX2R1rcAuyNGxR8b4e8nkyY274fDcfWIop5LEm/Yr0G4VnyUAcMrtUvmehCgvUZJcvaV9NSxp8H8vNs15wxhHXdmuTp0ywhvv0DXRX0cBawairb9eU8GSzDSQ5uDfXsSK91GkjD2JvrlMspzbQDyYC++ZCGCmvnWwP56pNzJCcFUkzm5qhu0U/NovGv/ykETy8eLs+xH2rkRFN6JZCFtsgbi4mQYBKCHRfeEXMX+AyGT1dIk2/zsOHBUttINVzWySQDtcWLXFFlFUpv4xkCWoYIwKQouF1utrwDPlOvRDM7FmWqmgxdrBH7tWjllNf+Ytuh0AASG6CSXGXbnqUbZY75nGwusVfjr7KlZQ4LkdXE+87Jqh2RKmR8X1yFPH55uQmKO50NNWk8B6K1WckXKtbuN84+YjrMv2bYIuYY/De9VRPx1SEUD59B0XJT7iEuLW/KWv5arfIPLGQIrvgx1XFeOrXJD8SMVnd2tRavMqfajdz5SARTXlHrUXrAlBA1pNBfxE9eIFivjtev+eQbYKWodFMPBrGKh1d3p
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(36756003)(66946007)(66476007)(2906002)(6486002)(54906003)(316002)(110136005)(83380400001)(4326008)(31696002)(508600001)(8936002)(38100700002)(52116002)(4001150100001)(53546011)(86362001)(5660300002)(2616005)(8676002)(31686004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0ZyazZNQnhwcUF3R08wSlBITG01RnU4clc2ajduVEdDTmFSSmZGSUw1ZmJQ?=
 =?utf-8?B?WDhEY2ZYNlUxNkJmYS92NVRWVS96eWRRRWtLMEVCSDVDZSt5Qzh2WDM3NEox?=
 =?utf-8?B?S3FYb3NZcTNvMlVlODlVNXlzZk8zN0Z0Uzh4U3ZWYTlRTTZNNlNaMFJYRnVk?=
 =?utf-8?B?a0RCNVFSMzBSYytkbFRyVWNLMjl2ZVFuQm0xOVEwSU1GNmpnbmVxUWtKRWhN?=
 =?utf-8?B?Wk5DajNIYzRPeHJMWFU0eTlVQTlxNTdYZzJVZGdEa3lQMFh6YUJLcXkrRnli?=
 =?utf-8?B?SWw4NDB2THZsU1Z3aFlndHBJdENOTmpoT3lzZzkvVW5idnEyQ1hZKzU2dmFU?=
 =?utf-8?B?OUw2MlZuQUVoMmtiOU1vSzdudXUxQ2VKYjZ6V3JLcmhpQjBKTzk5S3pJS3FS?=
 =?utf-8?B?WjgrSVhBUHR6ays1WkJGTmNsRHY4Y0hxR3l1cytGSkhwYzNiWDNDTmpPS3R4?=
 =?utf-8?B?NHlrNTh1UUd2MmNDb0RWRnlucW5qdmhxcGVvMWJuUElDYyszVnN5aW9tU3Jx?=
 =?utf-8?B?WU85d081Wjk2ek1yQ0tQTWl1Rmt6QXpRckQ0WWRUKzYzRkpZaHErNE53NExP?=
 =?utf-8?B?VzBaRmFIL1MzQ0lVVXN3Z1M1L3FFNHhBOVVkS1JNZTlzNzVzWUFFc3RhT2d4?=
 =?utf-8?B?dFRURWxRTHFmNHdTc2Z6NFdHZlEwdFJORTZMNTAybkJNWDZGbUNlaHRyeEJ6?=
 =?utf-8?B?Y0M5OXhoUXg3cmFiQVNlTFZUSWhBU0FoSUpZNEd4VUhRdUt2bWRjQXp2UkJS?=
 =?utf-8?B?VzdvWk5GWGhob2RxZXRWOTJXbTU3bVRpejhHYVZ5OVQzVlVhZkVFenBjdC9B?=
 =?utf-8?B?UjJWSkpjNzRqSFg3U3dxc1E5eFpHTWJjUm53Z3I1b01BRGNFVjBiQlM0bldE?=
 =?utf-8?B?ekphTUZIVHZWYXZrc1IzZXA0Q0NLUnhlUnFkU1kzQUEvT3kyS0Y2akJZdEZ2?=
 =?utf-8?B?S0Q4dzJTTmFUT055eE1oUmp6T0RTT1B6RTIya3hMcGtDN2VYeC9mMlIvVXpR?=
 =?utf-8?B?b2g1NlF6OTRKS0RsMVJuTURLTEk3TDVhWHFPbldTMHY2SGcxRFdVbHFINng3?=
 =?utf-8?B?SEJkNURWWFZHNlk2UXdqS2psSmozM1dHY214WFN4dm01YnkxNnhKUk5LeG04?=
 =?utf-8?B?RUJsU0krakxGa25GRWJIYWJLazR1VjZ1TW1xQ1BodkszWUhtbHNxSEpGYm9p?=
 =?utf-8?B?Q2V2QmcwZkkxVlVGdW5BUWkyb1VjajE4Q2RjdWFYdk5wM2pFWkw1d21ubVhQ?=
 =?utf-8?B?YVM0UmlrQ3QyY25KUmkwUjdZTUtGcit5ZEg0ZmhHQmFWUyt2eFdCWkZtdWw1?=
 =?utf-8?B?V0ovWXd5RGNBMXVsRTQ2NGpVRGhoRHB1Vks1NVlxVnNMdlNCL0gwMzFXc3By?=
 =?utf-8?B?WFhLK1V6bldqVndYbWdNc2NvSWMzOThkUVp0WFpyL3ErU1Bob1l5c3pRU1pj?=
 =?utf-8?B?M0VqOCtyZG1HRkRjVVo0cmNMeEMrZmxiSlg1MUsrM0JGdVp4TGF4QUVRalp1?=
 =?utf-8?B?UTBjZkR6YU51OEZCM2tUNkdBTWdabVNTT1BzRzFzbkFodUtnZUIxZi9hUTVX?=
 =?utf-8?B?NGxRTVNiOXhqU0g0ajlERUh3aENSUDM4LzVKMzgwRE5SOURyV2dHNzVITklI?=
 =?utf-8?B?NkJzUjlKYmxMV3hFcjY5TVdJdEM5bnR4dzFvc25UWUV2cngza2l3TVlpS2tZ?=
 =?utf-8?B?b3Bzd28vSTkveG9rTmNDaXAyREJQV0ZqUTdsS1hQTXdtZUJpTVlZc0Rmb1Vu?=
 =?utf-8?B?eTczakpBWXViOGViMmhWTmtIZmk2R2RIOGNMN254d2p3V0dXaUFyRnBIUWFp?=
 =?utf-8?B?ZFcyRElGd3YySE9HUXplOFRKREJsQjZpMlo4M1JCeHZrN3N3L3V3Yk9YazVu?=
 =?utf-8?B?SmpqL0dHb096OWpYMXhvdGc4SWFQa0I0RnJ5dVpWTmJVc0p2eHVTZnpzMlAw?=
 =?utf-8?B?cGJ1QjF1V01VeERQT2VNTXhOR3hERTRiaGtiWit6ZnpRTEN2bW1GNTZ5bVJO?=
 =?utf-8?B?VUNwR2VPTUZkUXlPdUFVc3BXVm8zYkxQTytRS1REbzUzckhmQjROMjhaRjA3?=
 =?utf-8?B?Q3BQazkyOTUvaWVmcWdxWVY0bGp2bXYxMVBLY0cxeGF2V2VaRUtoNFhmQi9k?=
 =?utf-8?B?aDV0MVc3S3AxZUZqa2FPOGZKZFk1Y3hYeEp6bTlBZU9EejA2SmhRbkRkUURt?=
 =?utf-8?B?Z05TUW1mVDJpV2p4VG04S1I2em1SRmhZdE1RdVNQUXZ1MWlObHV1dGp5UUtp?=
 =?utf-8?B?Zm5HYnBKTEtsa05CaWs1ZlZaV0NnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd3fb209-adf8-4066-18ab-08d9a9221d60
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 16:57:03.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xf4Y/HumWr2JQyPLn8UMH3s/VvOEBPqH+QK9DzKy/xXwYQ7PUyg0XUDUXYjTrJ6sS4JRK0FxIUjK9c6t6UauEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
X-Proofpoint-ORIG-GUID: UPr6klVP6sfcGe_jVIdsVelWiohRK6ck
X-Proofpoint-GUID: 9zd0DNmDUMpk9_YtaBdMlJu2bv4N1fmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_03,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111160083
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1AGDFwFr023975
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:57:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158367



On 11/16/21 8:39 AM, Saul Wold wrote:
>=20
>=20
> On 11/15/21 2:44 PM, Paul Eggleton wrote:
>> On Tuesday, 9 November 2021 08:01:38 NZDT Saul Wold wrote:
>>> On 11/4/21 2:20 PM, Joshua Watt wrote:
>>>> On 11/4/21 3:50 PM, Richard Purdie wrote:
>>>>> On Thu, 2021-11-04 at 15:45 -0500, Joshua Watt wrote:
>>>>>> On 11/4/21 3:43 PM, Richard Purdie wrote:
>>>>>>> On Thu, 2021-11-04 at 20:00 +0000, Jose Quaresma wrote:
>>>>>>>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no =
dia
>>>>>>>> quinta,
>>>>>>>>
>>>>>>>> 28/10/2021 =C3=A0(s) 21:58:
>>>>>>>>> On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
>>>>>>>>>> On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma
>>>>>>>>>> <quaresma.jose@gmail.com>
>>>>>>>>>
>>>>>>>>> wrote:
>>>>>>>>>>> Hi all,
>>>>>>>>>>>
>>>>>>>>>>> There are any plans or is it possible to backport the SBOM/SP=
DX
>>>>>>>>>>> to the
>>>>>>>>>
>>>>>>>>> dunfell branch?
>>>>>>>>>
>>>>>>>>>> I'm going to yield to Saul as to whether he thinks this is
>>>>>>>>>> desirable/possible or not.
>>>>>>>>>
>>>>>>>>> The packagedata changes are pretty invasive unfortunately and
>>>>>>>>> likely not
>>>>>>>>> something you're going to want in dunfell sadly.
>>>>>>>>
>>>>>>>> Thanks for the clarification.
>>>>>>>
>>>>>>> I have been thinking a bit more about this. I did wonder if we
>>>>>>> should consider a
>>>>>>> mixin layer of some kind for it that could work with dunfell?
>>>>>>>
>>>>>>> We could host it, it is just a question of writing the mixin=20
>>>>>>> layer and
>>>>>>> maintaining it.
>>>>>>
>>>>>> I don't think it's going to be possible with a pure mixin layer,=20
>>>>>> since
>>>>>> it relies on the extended package data?
>>>>>
>>>>> I suspect that could perhaps be patched in through a layer though? =
You
>>>>> might
>>>>> choose to drop the compression piece or do it differently for the
>>>>> backport?
>>>>
>>>> I'm not sure if a layer could hook in well enough to get the data
>>>> needed...=C2=A0 maybe worth an experiment though
>>>
>>> Yeah, I am not sure an mixin could track the changes for package.bbcl=
ass
>>>
>>>> With a backport, I would probably either use GZip compression or no
>>>> compression. The zstd compression was designed as a drop in replacem=
ent
>>>> for Gzip if we wanted to go that route.
>>>
>>> I will say that we did something similar with Hardknott for WRLinux, =
but
>>> did not propose it upstream as Hardknott was knot going to be support=
ed
>>> longer term.
>>>
>>> Having the spdx class standalone with the correctly backported change=
s
>>> seems to be working
>>
>> FYI Andres and I have done this backport to dunfell - should I post=20
>> it? That
>> said, I did just take the hit on some of the invasive parts (e.g. LICE=
NSE
>> value changes). I think given regulatory requirements this is=20
>> important for
>> lots of folks, so we probably need to do something here. Happy to be=20
>> part of
>> it.
>>
> Hi Paul, Andres:
>=20
> We talked about this during the Tech Call this morning and the consensu=
s=20
> was that this work should be done in a mix-in style layer so that it=20
> could be used by multiple releases.
>=20
> The LICENSE value changes could be handled by a single file with=20
> LICENSE_<package> style overrides in the mix-in layer, or by a set of=20
> bbappends in the mix-in layer.
>=20
minor correct: LIENCE_pn-<package_name>


> Did you include the compression changes or convert that back to basic X=
Z=20
> compression?
>=20
> We realize that this make for more work, but it's the problem of=20
> backporting a feature to the release vs having the feature in a separat=
e=20
> mix-in.
>=20
> Hope this is clear.
>=20
> Sau!
>=20
>> Cheers
>> Paul
>>
>>
>>
>>
>=20

--=20
Sau!

