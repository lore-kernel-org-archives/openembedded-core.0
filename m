Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B38C636D4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 19:46:16 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web10.64030.1675712765997787939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 11:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=ZRH18rAC;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=14017bbb0b=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316Icirr022754;
	Mon, 6 Feb 2023 13:46:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=I78GvkmOwGnuagnXj7BfSfS+OvJBdkYhPJW7/VXQTLo=;
 b=ZRH18rACbk87D+dhPZ4yt9fIVeqbCCz4BBaj2J/kJS8yvYZvFTO4y4uAQcfBeOu6EAUF
 7noR+H2LQdSNS4ZEGZ9HLIp8g/ZKtyFbnUzf1W/Bwjrf7YHevuHvTMsu6aLhr5FyS6xx
 3lWGbNvLaB247+FEj4l+d7tyCu/VjUvg5OHkC4VaSY+2DAhlqHuWdYtQQhS0gZhED34w
 LRvXaiqpLZ5qyV44rH/Yyj9Ba99zhMRM4GgtjwF08gHxQFkJxGXm2FOhNZfpfYVeGxL5
 7wm+TVUNNyneXP2+QAlD9KPlX6ici3NG4NwoRH6tCyMOBPovT66K4fNUmSIuv0ymLb89 2w== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3nhkmjd28u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 13:46:04 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifFWKqIQ7zm3revF+XUAKbllzq8woVeFprlk3Ob6lTD56e60JunnNDXLMQit0i+TW9wrYBcLSWxzbi3EjQZ+rTewJOcIJdd+um9PnfH1RfH1e1YOSNLsABXSSY7NmtB5SOYsFIeyxH/ojVNyc2bNwYspxPr0UPfudIOJitdPR7I7Vc5LbwDFZA1FEJHtcdODSCfMH0hDeu72njRxrbfF0SoXuqR+CdgPa7vS3aFUlQVqk2sb2RmHMkpbREchPFNfqUmqGsHkdkZsvWlSi9Lsl+EDXUWkC50WgAsiWnGQ7gkqf+Iyrr7apXtj8JHmWPI8iT2dkK3vAscotUchQaXQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I78GvkmOwGnuagnXj7BfSfS+OvJBdkYhPJW7/VXQTLo=;
 b=PBIcUwfQx2XSsOI7N6AGr8FCYqW39MEDZBfqsQVoUZ4ns2b1ok3xyw24fz51jv58VZJIliJAaI5gIHAhGCheFaqIg+mXhooNYw938ZxElCjbKIdRTqNQLFDJG5hHqp8PfU3KRUAEJ5nMe5XG+KrsK4hR+O9o8oD4JHICBDcPGW7yg/zHQS98W0ULmRTACmNhLIahY/mq1T1PpTT2r8OH9xAVc9CprvevYkBOa3zz7B1x5q0zArJ2ZrQ23KalAsys7EluBhx36xDpdAw4r6NnWQeXDlL9cAsVMLDrFYBurMKfq2v4cXDw4EeJx804ApwQOyb/elU4/bLYqNq7J1YOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I78GvkmOwGnuagnXj7BfSfS+OvJBdkYhPJW7/VXQTLo=;
 b=Gi3uEzVWx1pajyhymkU3RvMoM8A6MQ8pF6/HB74higCQpBuX7NJl0yGfQ3q1AZq8YoasW89vCSCD5mJXRrMebT4en1w/gDBDQ++ma3xcWC+0Iy+uOz3mx23JVa3p+T/pl7xC29Lo9oHZ2RItGXNt7GneX6SzP8PQkOQw/9M9avk=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BYAPR04MB4280.namprd04.prod.outlook.com (2603:10b6:a02:fe::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 19:46:02 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163%5]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 19:46:02 +0000
Message-ID: <5557322f-c72f-7edf-4ca4-0f6b603013e9@ni.com>
Date: Mon, 6 Feb 2023 13:45:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
 <CAJdd5Ga11=ND7_5qqXjT7FHkEy4=RXdj-2Xa6RKFBe92QJ9phQ@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <CAJdd5Ga11=ND7_5qqXjT7FHkEy4=RXdj-2Xa6RKFBe92QJ9phQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:806:28::13) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BYAPR04MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fc178c-a265-4fb6-2f2d-08db087ac6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AUHyIGpEbpEPmz2wWi6vRB/2Bf4Pg6g2PHvVaFZkaWyPAg/htN2IR0CUeeLO5a6QsKkQkuJmLRFuEXMYL+ke7DLj/UyeKHX2efG/RxWUKiAl+BAVWVLsCZcsQZ8OUKo6mmIcQmS12gIE56ENuLeUz9vejy4/yrryEh5UGDC/NB3Tm+5WKwXK8KH0B83Fq8dGOXs33oEs41tQ4hgMLrzWwXrFoDCkqZSywn8OHeICwxmAm/FxRkPq5a0VCBGo25KRLAtsl/ZpeYVx8uEhuwQPcpV/afUcXhtQUonbeoIpOX31eeEyrZbpTsuJGY2XmvOcXjC3EPBdK41zM3iHSQzK5FAZTiZhgdvXOabwAKuPizzMZULHel08089gzH12t35YzifvFu7mv1BfTH0955SZ42ceaaGU+AOkmsAnPSP7/auORIwTTsZmmu3p6bWnwD3toJlstgdpFmp8pszKo92E5KbohQoGNCInIyc3jTREb7eJOVckCN4+Jv7ZREh5Ha/5xMWpiRrjz+whaqW3M6pSaWE48GlRVZHg2x273zp1HXdIs04XGbkKuXCUqXG2LgcIXhtjhSKl2xGfQQQIf2spgRn+h/u8zk5jMNq/H0z/w83XOlNjRjgc++h6HhI9U+NMd8xH95IsAJjA/ibPvN71Jbgbryq0RgLX9x1iPONbu0ouhLvX+kthlUSpZSJp+DyTB0x2Jlye8GXjyqsQLCu013GoAhDQ+4Dn60N09aoLhRH+Y9rmBjZTEDoxKk0H8sT1Q19Lmp7+AT55MpcU9jso0/BgoL+kPIq9jgLqlOotlfA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199018)(36756003)(6486002)(478600001)(316002)(966005)(36916002)(86362001)(8936002)(5660300002)(8676002)(2906002)(44832011)(66476007)(66556008)(6916009)(41300700001)(4326008)(66946007)(38100700002)(2616005)(26005)(186003)(6666004)(31696002)(6506007)(53546011)(6512007)(83380400001)(31686004)(66899018)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEQ0NDBKUG12MXZLZ2xYTHo0QzRwSjJGSlJXaDlIdXpMUytyaFhZcTQ4Nmx6?=
 =?utf-8?B?eWFrMEJyV050UXVuYjZWZGp0b1RHbUxIZW1Xa0YxREk2L3A1MU9BNGhSaFNs?=
 =?utf-8?B?WXRCMS9XbVNWeTUxK3U0TmhXSWJKQmNaV2M3OFM5Tmg5QVArK2dsZWE4UjQ4?=
 =?utf-8?B?bVgxV25KbzZNTFZDcjJ2MC83N0hxMTM0dHhKL2ZvT1NDNTd2VGlJRHA3QjIy?=
 =?utf-8?B?NlA0dlg5VTBROVhiL3FwQ0FRR3FNWkdPQU91SGFlTnJiY0RTcXZjbVRMU0VK?=
 =?utf-8?B?MXd6VWFBeEZQTGZCVXRhYVc4ZUxvbzNmbGdENjNMTWFxVzlPNEVwRzE2MW9L?=
 =?utf-8?B?a280TFhlNXBmOWJUTmxvMkx5eVhGclVGR2Z4WnJtRVZRK1hSNzNtdzBkK3VO?=
 =?utf-8?B?aTk2SmVKd1JjV2pKSVJJR0duWHRoREtYR1ozand0SVNRUThrbmlZMlJBcnZJ?=
 =?utf-8?B?S1pXalkxclFlRE54aXpjMjAzR3hXd01NS3hSUTJRMXN4aTE2VjZud21GUThG?=
 =?utf-8?B?Wk9rTWJ4a1hIeDZEVURvTXAyYUI4cU8vYVBnVVQzVnJKQnBZYm5XSjhZZFJW?=
 =?utf-8?B?QU9hUjkzSElENktJMk5PT1dicGdhNUF1b3J0cFhqK3VGbkpjaEp0cG5naFdh?=
 =?utf-8?B?R0lqRmlSaWpQckIyZTBVaXpzUk5HNFJzVzVHMXRHNEl5bWwvUVB0VW5FVnlU?=
 =?utf-8?B?eWRHNlpQL3lqdDR0MXkyQXpNQ01BVUZIYllSSXA0UzhYQ2tVdVFUeEJZbFJr?=
 =?utf-8?B?SElpUHk1VmN1QzBpSEhZTTIzRnhNZEdwTEN4NGQ3TU92bWdUN3prczZ3TU9k?=
 =?utf-8?B?RkQzK0lJSVBUUkxSaytFd0F0a0d5dm5PZHNKTFBVVG1lR0ZaZlFTZ1loaEtT?=
 =?utf-8?B?OGhVWXFBZVpRQ3d0QTM3ZzZWbUY5eEJoL3BoR1R3UmVkMDgyNE1tZkdKblAz?=
 =?utf-8?B?YlBSdy92UWhTYnkvVnVzazd4eVdyaDJEUFdWRUQvSEJwTXdydUl5cysxTzBs?=
 =?utf-8?B?dW5mWXBPdmxCWlRQeTAzS3U3UEtlT3dhakRPY0dmTmpwYkhWampJRUVJYVVw?=
 =?utf-8?B?OTltRmNVTCtRWFQ0aU4rc1ZXK09IVUpibTlCNDl0MTl3SzBEVzdZaW1Nc2hj?=
 =?utf-8?B?eDF4OEtjOFhvWmZuR01mNnVNRE9iUmtHS2hnWUFCK2lFamVjNTR2Wk9PNFlq?=
 =?utf-8?B?Q2ZpaTlSSjUwSzlhU0pXdDZsdzMrMWNtK3dqMXhQbjFTMkVWM2dPbmoyMEEw?=
 =?utf-8?B?VmhVME9DeXRSMnlZSVM3dDFvTGQ0UC9xajE2ckNMb1lFMDU3bHZkL3BMN0FO?=
 =?utf-8?B?U1RpZWdETlhKeW1OazlWV3FDTjF4MzVrd0dMOUlpMkZkdkplVTRtaS9qbzFL?=
 =?utf-8?B?V0V4RTFjMnhrMERuNEx6NHZoVzExbll1OG9VNWhaa3VFbFUzRHFTencyK2Zi?=
 =?utf-8?B?UEZnR3Y4cmxBcnVtTERrSlJyTDJzS2JEYW1WRm1pSXc2ZDN4M05odldjeFly?=
 =?utf-8?B?OWJHY3ZFcWQvZUtVaWR2RjBvOTltNHNUV0JlVzFGUnhGVEFydWJHOFQ0RTRj?=
 =?utf-8?B?b0ozeVYxa0tSN0E0WExSNXRLRkxsRzRDdlBscjdvZHE2ZDB2VVZIL3RvOFpq?=
 =?utf-8?B?endIaTFVTGEwNEFiV3VleWNadEJBWVQ0TStxaGxwL2ZKWjByRzc2TkNNZGdU?=
 =?utf-8?B?UVNGNm83WmR6aFJMVGVZRVB5VmQ4M1NBaGo1OXVUeTNxNlFHSGdCVUZjeTNF?=
 =?utf-8?B?NFlzQmJ4YmZuRWhqTkVsZHlSd1FBa0EyUi9IT2lCcDdqQTVCUm5hNk5tUUxy?=
 =?utf-8?B?RGhOK3JwOGwrRGp0ZXc1K05LTlNpdjJkbWdNYzV3Q2pWYXoxRENpQWNZalRs?=
 =?utf-8?B?ZXkxdUxWZGw2L2lTM2I4T0R3RDQzUWtHSk5yZmthTHRPclNhc2UrVzErQVVv?=
 =?utf-8?B?RHRrcFU2cGpGeHVEeU5SekhSMkEyMDZOOGtmQ3JuL1dMYkNHZ3ZDZUxlNXFZ?=
 =?utf-8?B?ekVHUEttSGt3RlFveVhZT0xublVsOTBqaGpLbmord0l3MDdvYlVMRUsyNDgr?=
 =?utf-8?B?c012MHhZTkxwUTFrNEhSS1M2cU5UQjhaNE5QWWRmWWtPaC9kdnR5YWx3bUU3?=
 =?utf-8?B?MWIzdW9KaVFrc281dUpxV3NJaDd2S2UwUUlYYldLOWFiWi94Z3NUditvckdj?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fc178c-a265-4fb6-2f2d-08db087ac6d4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 19:46:01.9602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL+P31JRmL4ybHu2Ct6mNMFwbFrGauhPH8z57TJdFOY+ihxYWGpQNNUpQR4vgHv//fhhCaLtqVx2yVO8O+iLjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4280
X-Proofpoint-GUID: ExcNafE8WllZhNGo7PxeGTUhstKodgNl
X-Proofpoint-ORIG-GUID: ExcNafE8WllZhNGo7PxeGTUhstKodgNl
Subject: Re: Re: [OE-core] SPDX 3 and OE-core CycloneDX support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302060171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 19:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176796

Thanks for the context; I'll feed this back into our internal discussions.

Looks like I just missed the general meeting for this month. I've joined 
the ML and I'll try to attend in the future.

On 2/5/23 05:08, Joshua Watt wrote:
> On Fri, Feb 3, 2023 at 12:26 PM Alex Stewart <alex.stewart@ni.com> wrote:
>> Hey Josh,
>>
>> I have been roadmapping SBOM generation for NI's yocto distro and have a
>> few open questions about the future of SPDX and the create-spdx bbclass.
>> Since your name seems to be attached to both of those, I figure you
>> might have the best insight here.
>>
>> Also posting to the OE-core ML so that this discussion can help other
>> members.
>>
>>
>> 1. SPDX 3 timeline. I hear that SPDX 3 is going to be a complete rewrite
>> of the spec, with more support for modern SBOM discussion topics like
>> VEX and more comprehensive vulnerability tracking. And it also seems to
>> me that the timeline for its release is very behind schedule [1], but
>> still in active development. Can you give a SWAG for how close that new
>> spec is to completion? Are we months away or years?
> Our goal is to provide SPDX 3.0 with "example" SPDX 3.0 documents
> before the initial release. This should benefit both projects, since
> it means that we can give SPDX real examples of comprehensive SBoMs
> before they release the 3.0 spec, and also means that Yocto project
> SPDX output should be of high quality.
>
> SPDX 3.0 is moving along and it's getting closer to release, but I
> can't say exactly when the release will be. If you have serious
> interest in this, I would recommend joining the SPDX meetings:
> https://urldefense.com/v3/__https://github.com/spdx/meetings/blob/main/README.md__;!!FbZ0ZwI3Qg!ofUCTG3cuMma5YvThWEwqKVzFJ2AWeMpZT8faPH4PrT-1fujpKm0yyXwYU9fcuvDPHNI0DnNjVqJWLTVF84$

>> 2. If/when SPDX 3 support is released, is it to be assumed that the SPDX
>> facilities in OE core are going to be upgraded to handle it?
> Yes. We should have support for generating either the current SPDX
> 2.2, or SPDX 3.0
>
>> 3. The rest of my org is interested in CycloneDX as our common SBOM
>> format. Have there been any discussions about supporting CDX SBOMs in
>> OE-core? Any blockers there; or is it something that my org could author
>> and upstream if we decide to go that route?
> As stated, we don't really think supporting CycloneDX is worth our
> effort in the project. That effort would probably be better spent
> making the conversion tools better.
>
> There's not really any documentation why we made this choice, I just
> decided to do it this way when I wrote the implementation. TBH I think
> both formats are technically fine, but SPDX had an edge because of the
> LF connection between the two projects. Gvien that there are
> conversion tools between them, I wasn't really concerned that choosing
> one format of the other would cause problems.
>
>>
>> [1] https://urldefense.com/v3/__https://github.com/spdx/spdx-spec/milestone/3__;!!FbZ0ZwI3Qg!ofUCTG3cuMma5YvThWEwqKVzFJ2AWeMpZT8faPH4PrT-1fujpKm0yyXwYU9fcuvDPHNI0DnNjVqJbtlx0Hc$
>>
>>
>> Appreciate the input,
>>
>> --
>> Alex Stewart
>> Software Engineer - NI Real-Time OS
>> NI (National Instruments)
>>
>> alex.stewart@ni.com
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#176784): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/176784__;!!FbZ0ZwI3Qg!ofUCTG3cuMma5YvThWEwqKVzFJ2AWeMpZT8faPH4PrT-1fujpKm0yyXwYU9fcuvDPHNI0DnNjVqJtMJ4WK4$
>> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.org/mt/96729387/3616788__;!!FbZ0ZwI3Qg!ofUCTG3cuMma5YvThWEwqKVzFJ2AWeMpZT8faPH4PrT-1fujpKm0yyXwYU9fcuvDPHNI0DnNjVqJ4LM7VOA$
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!ofUCTG3cuMma5YvThWEwqKVzFJ2AWeMpZT8faPH4PrT-1fujpKm0yyXwYU9fcuvDPHNI0DnNjVqJMmHvq8k$  [alex.stewart@ni.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


