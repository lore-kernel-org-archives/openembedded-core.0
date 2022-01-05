Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB25C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 17:40:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3961.1641404425464341779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WyiJ2U0m;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8004bf7d9c=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 205DTvFR007241
	for <openembedded-core@lists.openembedded.org>;
 Wed, 5 Jan 2022 09:40:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ifKrh4cUPGsxiOn6EXTGxtW3ggQo7kIVOIrp0D0zTEQ=;
 b=WyiJ2U0mQs+OE8FCm3eB8zgF8yLZ+7g95SPYuGLFXUAFmej+jblEq9dz38T4RsbEgA80
 oKcvQUvcVeJp2i6f3UcBNV8F+A+GaE0tbKgkJcdrtbMOuiOS1sTEG7wreZKZYUqsF/bG
 8uKdNtvxF5CXWnsphgCYcB3JgVRxlVMV6kvaA+Bcbd81ML4POYia+Lep3oK6iiibDQJd
 QH/MftEF7B4sbdeKfOJqUadiOiCQEXs4aglsOJUBCPKiLGkFkKdYb/waWLESZUkNuwTm
 xzlRF4cCYiPQYUe9wUqvw90j6Kesu5szXtOkVDp9yvtIoItmmiQpadddhLF3le5llMGc 9g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc62thevq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:40:23 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 205HeNwW014459
	for <openembedded-core@lists.openembedded.org>;
 Wed, 5 Jan 2022 09:40:23 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc62thevp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jan 2022 09:40:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNE5U45I5j2gK1ZzDHsywrgrKDydy9ebz395MmYrvoFYzO+wxPUyFx6a45OUebgxLiHvjYmVB5i0C87JwA1B72wHIuyqIhMwV6BFA/SYTbZkgX3LFMikunBUnRCKY5bzCFb1OecQ0KCp1C2h+b7W9wJOFnn0/57e0/ag2WHUHIw8xbfnObgDYl0rYoBPvMnHQnlZlsofjhz5G9729TViMzEq1AaE5zp82Kn092lbj76dTQJoK5bH2MBAdFvGRZAygzaosqx4sPXil30NTaBwaybymILy59Gbtl0ZcpLjFVSwYSo7YgOEYG/wbpt2D3YO1Hq5x2WQF2yB++Q4JaoP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifKrh4cUPGsxiOn6EXTGxtW3ggQo7kIVOIrp0D0zTEQ=;
 b=PQCasKGqY2KLiBxnT5MCMnKPLepuYNE7LUsvjHK++DVRSxpEnn+ayYYZ5w4qaYIH32zD9LCRXSbnmMfHcJBSg3cP4Kf3UMx9F9X9YEkDpL1ZHmJcyb/hWagk9dXjtuSUg5Zru8vL0aOlTbgx7JqBnebUAiPOjmznFTsmVFC6eRvMwwF+Lcf+LYT5b9fSKo8vVUyZ/rYfnBZNfVRKCpdhMBFJKsgr10wH+OUu7TpegpS1U1WzE08kG9A00zyY4SXnB3dVGVk9R1fKmASryhgoU7/9DFUfpjQX7UY9R1W9LxHMjPPYjjj7rclvqHO78wAL1A2aqlcsoK2c7FlxyugkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1981.namprd11.prod.outlook.com (2603:10b6:300:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 17:40:20 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4867.009; Wed, 5 Jan 2022
 17:40:20 +0000
Message-ID: <a576adf3-6444-9ee1-6bd8-2d4acbf0815b@windriver.com>
Date: Wed, 5 Jan 2022 09:40:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: don't skip kernel and
 kernel modules
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Joshua Watt <JPEWhacker@gmail.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
References: <20211221190809.89882-1-saul.wold@windriver.com>
 <20211221190809.89882-3-saul.wold@windriver.com>
 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
 <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
 <f55b92395da477d06df9b545ac6fc7ac47d0df41.camel@linuxfoundation.org>
 <CADkTA4Mh78Kmg_NWoS+Bm4on+D_6wzCErawALKQqWdH9OsN9pA@mail.gmail.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <CADkTA4Mh78Kmg_NWoS+Bm4on+D_6wzCErawALKQqWdH9OsN9pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR18CA0056.namprd18.prod.outlook.com
 (2603:10b6:104:2::24) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 941ad0b5-9a72-4ac0-82ee-08d9d07271b6
X-MS-TrafficTypeDiagnostic: MWHPR11MB1981:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19815E0649DDA6AA129489DCEE4B9@MWHPR11MB1981.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qtA7hxMGmLca+fvnURP/mQCZPVpCgpIKIkwr5gwx0Y8k90de36UCOQKpSvcstM6tgFKOevx3+opVAsO+QOVtBA7YVP3M1aknQSIdfJiZpDCoh2834kDGmz36q0EtTuA+B9ZLJlbespXm7pEHhI9rJS7Oh8oWXKnAQ8OakQ5RJ9Omqr3HtM24o10I4KLsVjJMlk/e+nvK5DEorOm3oNPtPDOfiLksev5X6c5fFe5BcZj5AbLZmMHBzwfyDmtbqwUZvmXk7bqnfA610QAuoY7I/oiZdbQm/dlkCf/SVUjLq6dYgP9h7cadIuhIsQHhPwFh7Z2b21wySApAAtcu8nXpAkfMbwPAjcunH9iBRqiTldfVF0ber0q89r1NUJ3V0z7H6JwNwwyuP2IJuatm1+Hwgp3rbLBoPR/2TLiaMpxley5q7rjuirxgKyjuHTLxmzk1i4P3oeTjhcn+b8hbNxeBmEW0gLANeSwu+yhrVfnN1oxZBIhsiemsb7qgDDS+/PDp3iDX28xXCw61ZpgdxCmHYPFxr1X2s3uBGOSJshSbBQz5DLSf/dhq33SOB0ZzZR/LWcsydQa8SZPVB+e03Skb5lHvE1QVxoBrS4SUuuG0lHu8gHDa8S+OL/vMeMUKRp0dR3hNhNplOBjK3Co5eGk+vlb9KR4rFWhSgsVVl7azKy39pUYpWiIHXMt3yuDbwH9Sk+XPyjVpXDREanb7iNhJObigtBGT9F8DMUTu5Ezq1k/mmkPEbwDU2KMEjIIRnAkynOumbV5Q/Mgr1M/pqLEn9At21cOqeh3pzRQiW3nfacEg4g+dW6wwUcYcq8kr35sWozZ1X6M1Fx/POeyZAl1wTuD003yRExDLQxBJ3qbCd9/nlbynXcRj2VVPt2FNkRkxgBkFj5h0Rax44w+CtZODUg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(66946007)(83380400001)(316002)(38100700002)(38350700002)(6512007)(2616005)(6486002)(508600001)(8676002)(8936002)(4001150100001)(966005)(2906002)(53546011)(52116002)(6506007)(36756003)(31696002)(26005)(31686004)(186003)(4326008)(5660300002)(54906003)(86362001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OW5qWm1RNDBuSFY3ZU9iUW1kZi9jbHU3UjAxOVFRSDIxdWozdjVtazlIQmtv?=
 =?utf-8?B?R01HUmJzMGpYVVJkdEtYZUhTQjNzTlFycGJjeENyK0wyUWNVUEdseXhPQ0VS?=
 =?utf-8?B?Z2ZqK2t4cmU0UTNKaEZ4RlFJd1ZuNGRWcDhhL0NSRjFhYWJHZ2pmOUd4TUJU?=
 =?utf-8?B?RHJOYUFHRTFUdjd2SnBBRmZ1cy9YclZXTXpZUDRrZGV2R1ZubWdkZFlzRzNo?=
 =?utf-8?B?M0lGYlJlSkRMb0JKR3I5L3VncWk1SXA4OE9COU1ZZFBlcmlYTm1RbU9sOXFr?=
 =?utf-8?B?YVQxT1IzRXBVcmJDMHNvZ2Zvei9mSFFkSmJ5bkVydzh6eURjeTdqakdmV0Ra?=
 =?utf-8?B?WmhaR1B0MTl0cHNsUE5GYUI2UnN5SkUwVXZQYTJMN2VTZGFsb3BKU1FxRjZM?=
 =?utf-8?B?bitJSTY2ZFFaRkx4aG9hM3JtYkdudlF1ZVJQc2l3K1Y1aC8vZENvVWlMd2xX?=
 =?utf-8?B?MFRLSWRodXg4MENxeHNsamRNS2huQmF4MUhlTWprTTEzY1UxaGYvMUJLU1Nt?=
 =?utf-8?B?YjdOT2ZWSVVKb2FQSU1MaDN3RTMxeUY4YUQ2V2tDSytaUXliVUlQUE9WeUFm?=
 =?utf-8?B?V1F5S2grUVZYK3R2RjlHejlSeGl0VlpxVkREaFdCd2l0Y2x1WDJLc25uZ3JD?=
 =?utf-8?B?djh3aDNXQm9rdXMyRkpjdm1PZDRKb1o3OG1CWW5YbzQrayswL3IvTmVKeW9W?=
 =?utf-8?B?MUxnUnVnQjVCRVZDL1FUVnBlMUdWekV3QkRWR3FwYTZUdkNqRXVUQWV5L3Vi?=
 =?utf-8?B?SkdpS0tjemJDcWpDaVZISWs1V3o0eEp0WnVaTW5Jd25kWFlqcWczYmVGMCs0?=
 =?utf-8?B?TXBkSXJGbDlOdzI4SUJzemxKdUJYcHVRdjZoMmc5cm8wSFQ1NUYrK1lXdFhn?=
 =?utf-8?B?WUw3K2hPL3lhSncxbHV5L2RpM2JLOTRKdk4zb1JpSkdzTUt2ZGRRYXJYeW9B?=
 =?utf-8?B?K2FGU0svdHJCc2NzelRnanZPNjdpOGlFZkNyUTZsM1plN1pCVXdNcTdWMGkv?=
 =?utf-8?B?c0VTZ2hSVlVmS1ZkWTZCV1U5R3lraklxK3ZnSm5ucmpzR1cvQUJDQzFEbDBj?=
 =?utf-8?B?S3dzMThnSEtHU2ZTL3FXNXBjeUJVYkZCaFVKWExEQm9ZL2taUUVqcE9Qandh?=
 =?utf-8?B?eklXRHMrUkQ2UHpXUFF0dStsVG05c3AxblEyM2hoYXIrNU5PblVWeUpmdEJL?=
 =?utf-8?B?ZWNZa0d3TExQTkI4TE5HZVozdlYrbUl5Y2JJa2N5bmJqYmxTZ2NWM01rWDk1?=
 =?utf-8?B?WFlIUzBmSVVSVDBQV1lGalVNY0FpM2k3UjB6UGFIc0JsT0FpQzlHVUNoYmk1?=
 =?utf-8?B?akJBNEhiZlJ5QjcyVGdOb2NBdW1hQ3o2TnVJRk9IRE1uOWFPUlorQ01xWXRi?=
 =?utf-8?B?MXQrZnZxM0pNV0tDOVE3NlR2QktHVDIzSW0vR0VrcUlQN2tNaEFtNjFWTWNi?=
 =?utf-8?B?SFBCVnd0NVpVRnBaWitoQTNoekpUcmFYMkozT1VNd2lzRSswTDhXdzZEU2Ey?=
 =?utf-8?B?cnlHdFBVQ3hMQzhBNXlobDdxdGN2blh1OWpuWHgzSk5NdXM5cjhnSEx3cDBB?=
 =?utf-8?B?TVlVR013SFpxQ1dsbHlaR0szVkNRVStMb0JVZTFMTldIUmExZDFEMVI1Zm1q?=
 =?utf-8?B?MzFhMFQ4YjVac3AxOHEyU2dyQ1lsY1IycU9YYmRNdXFxWFA5SUlRMTFYTmNk?=
 =?utf-8?B?OTJ0NE9ySEVQRTBIMnRCT3RpVHBTRUFMMzk5RnBIcStyYzBnOS9GMDQ0SXQ0?=
 =?utf-8?B?ZjNSNXZoL3doTDIrMUxqV2cvSlVrb0tRZUViVFEzcTNkdXlDem5rK2hOUlB3?=
 =?utf-8?B?c01sRVFvc2o4Z3c1bGJhLzFCQXYyVG54ZDZDSnYrVjIrYVo2VnM4VGZIUCsr?=
 =?utf-8?B?NGcwSkVWTjF4K1BpZUpWMjVQbnJrT205Q3l2d01uSkdoYlpZbTZUaERRRUVF?=
 =?utf-8?B?NXAzQ3U1cGFMazBoUDI3NkZtUHpNVjVhc1kzbktlWldBekpNUXl6TUd3UUdT?=
 =?utf-8?B?VVh3RHdQaFNDUnF3QkJtTG1JcXlJeDFsNW1zSng0VWxONWFvVXlmclp2bEg0?=
 =?utf-8?B?UEdpcWFsNmh4L3B1c0Nzc0swQkFSMXU5b0dNSXhqR2ZLR2tYejgvUmhVa3py?=
 =?utf-8?B?NFdDVzhyd0pFZkpGbzUxckk5Rlc1OERNS2pCWnNxekxmdjZNMGIzQ2NYK1A2?=
 =?utf-8?Q?Sh4q/kph4wo9CzqK9GF6cfM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 941ad0b5-9a72-4ac0-82ee-08d9d07271b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 17:40:20.3989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hAApDpAsuGP2LGsMjONCdRwKuU9V67yGmxE24hRp/Ono/Z1Q/SPWZ/0w7HfCFuT+5ZT8gTFPNR5XaB2lL63UfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1981
X-Proofpoint-GUID: OTnmFDJ6Op-DxfQB2SzECorluoBYoMJB
X-Proofpoint-ORIG-GUID: wXJWPxtWc1HjY3DRaEFk3lD3asMh-w3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_05,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 17:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160214



On 1/5/22 09:30, Bruce Ashfield wrote:
> On Wed, Jan 5, 2022 at 12:07 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2022-01-04 at 14:07 -0800, Saul Wold wrote:
>>>
>>> On 12/22/21 01:09, Richard Purdie wrote:
>>>> On Tue, 2021-12-21 at 11:08 -0800, Saul Wold wrote:
>>>>> Stop ignoring or skipping the kernel and kernel modules code in the
>>>>> split debug and striping functions, this will allow create_spdx to
>>>>> process the kernel and modules.
>>>>>
>>>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>>>> ---
>>>>>    meta/classes/package.bbclass | 8 ++------
>>>>>    1 file changed, 2 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>>>>> index 84eafbd529..4b7fe4f1e1 100644
>>>>> --- a/meta/classes/package.bbclass
>>>>> +++ b/meta/classes/package.bbclass
>>>>> @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
>>>>>        dvar = d.getVar('PKGD')
>>>>>        objcopy = d.getVar("OBJCOPY")
>>>>>
>>>>> -    # We ignore kernel modules, we don't generate debug info files.
>>>>> -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
>>>>> -        return (file, sources)
>>>>> -
>>>>>        newmode = None
>>>>>        if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
>>>>>            origmode = os.stat(file)[stat.ST_MODE]
>>>>> @@ -1147,7 +1143,7 @@ python split_and_strip_files () {
>>>>>
>>>>>                    if file.endswith(".ko") and file.find("/lib/modules/") != -1:
>>>>>                        kernmods.append(file)
>>>>> -                    continue
>>>>> +
>>>>>                    if oe.package.is_static_lib(file):
>>>>>                        staticlibs.append(file)
>>>>>                        continue
>>>>> @@ -1165,7 +1161,7 @@ python split_and_strip_files () {
>>>>>                        continue
>>>>>                    # Check its an executable
>>>>>                    if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
>>>>> -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
>>>>> +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
>>>>>
>>>>>                        if cpath.islink(file):
>>>>>                            checkelflinks[file] = ltarget
>>>>
>>>> edgerouter:
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4513
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2507/steps/11/logs/stdio
>>>>
>>> So I have been digging into this and it seems that an option was added a
>>> decade ago or so to strip the kernel/vmlinux when it's too big, this was
>>> done for at least the routerstationpro according to bug #3515 [0], and
>>> persists with the edgerouter, although I am not sure if it would still
>>> actually be required as the edgerouter also uses the
>>> KERNEL_ALT_IMAGETYPE to create a smaller binary kernel image.
>>>
>>> The change I proposed causes the all kernels to be stripped all the time
>>> as part of the split_and_strip_files(). As I see it there few different
>>> options:
>>>
>>> 1) Set KERNEL_IMAGE_EXTRA_STRIP_SECTIONS = "" in create_spdx.bbclass
>>>     - This solves the problem with create_spdx.bbclass is in use, but not
>>> the general case
>>
>> I don't think I like this as it is a side effect that isn't obvious or expected.
>>
>>>
>>> 2) Remove the KERNEL_IMAGE_EXTRA_STRIP_SECTIONS from edgerouter.conf
>>>     - Will solve the edgerouter case but may not solve other usages
>>> unknown to me.
>>>     - Does anyone know of other machines/layers usage of this variable?
>>>
>>> 3) deprecate the kernel.bbclass:do_strip function in favor of using the
>>> split_and_strip_files() of package.bbclass
>>
>> I know Bruce has said he doesn't like this, however stepping back, these issues
>> were from a time our stripping code was young and evolving. If we can
>> standardise and have it all work together well in one set of functions, I think
>> that is worth looking at. I'd prefer the kernel wasn't a special case if it no
>> longer needs to be.
>>
>> That said, I don't remember the details of why we did this.
> 
> There's a middle ground of debug being possible, and some sections
> removed to keep the footprint a bit lower. There were also some
> unwinders, etc, that didn't work when everything was stripped and
> split into debug. The stripping was too aggressive, and removed some
> sections that were required.
> 
> While I can't exactly point to the use cases for it now, with the 5K
> options in the kernel, they haven't all been removed, and I'd be very
> hesitant to remove the capability completely.
> 

I think this makes the most sense after thinking about it also, having 
one place where the striping occurs in runstrip() in lib/oe/package.py, 
seems reasonable. The one neck to ring as it were.

We can extend the is_elf() types to add vmlinux and use the 
KERNEL_IMAGE_EXTRA_STRIP_SECTIONS there. So this could deprecate the 
do_strip() from the kernel.bbclass and keep the behavior.

Sau!
> Bruce
> 
>>
>>
>>>
>>> 4) Change error to warning in packaging.bbclass for the kernel only
>>>     - This would explain that a kernel image (vmlinux) is already
>>> stripped and extended package data would not be available for for SPDX
>>> creation.
>>>
>>> RP, Bruce, Joshua: Thoughts?
>>
>> If we can simplify and stop the kernel being a special case for this code (or
>> handle kernels generically) that would be worth a bit of effort IMO...
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#160211): https://lists.openembedded.org/g/openembedded-core/message/160211
>> Mute This Topic: https://lists.openembedded.org/mt/87884056/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

-- 
Sau!

