Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C7CC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 17:03:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.105.1633626215347743306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 10:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KxAeGDBL;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=591430a4fa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197BcFPN008427
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Oct 2021 17:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=BvtQn2FGhSgHwfI2+OLrQY2PaEGLDoCTYRp7JSG8AQg=;
 b=KxAeGDBL5rcVXpIyN/X2gXspQ88nOfLq74BLMycijcM+p8QFSWdSJFwbu1wpsUsP7yY0
 4L8aNY4bDElBxEOGIOXUr5RaryzrFmeHawED5o7leQYh5O9oS03//mYLNWy0CG++QwzR
 80neZntMmqdpzwIQJ6OqMTbpFI+GMmHfZkKrVPRRkUEdIZBGhW8doPFi9ADYjxwfLDWR
 XxIMsnt2O69sDqC/o4fnUeRjF1MFo9r087tRW2fCL7G+65Ypgjg7iVt/h2UtA09CuDFX
 t6yDLwPLpe6u/D5NahGNWOF7B6rbMVm+rgOAW5n/PXiexORhMeiRX1zpF1mQB3RGFQSB bQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bhm68rtt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 17:03:33 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 197H3XkW012049
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Oct 2021 17:03:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bhm68rtt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Oct 2021 17:03:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhMi0TTbPStXL9bdvk+Mt1l+3za79z/2tnkPIVRrJeLUl7yL66OFkvUQdk2OVnrt9dFL5m+onSLXy73z9QzqKFHxy/FIoiJPhfR9FlJr6638y/A9NwDKwcQ+iwWvEuPKYU+k1OkymA+YuVvBDPBxYgsoWeXLL4Inn7yM/ZRSSEAo4LSRMFDUqKYCPOmahP80xosOzaakyvuTiSZxz6FeYA80mKzbh1MyiVUchBp2GKEGJgfz30E5HPu2cSBg4QixNKYMr8UU3sBRav8Je9Tlzuo7DvSXpIsPnAeM3RGUYzZsxUvNI+Bn7Zve6h1AZQptGUJo/a00fQdH2JB/rp77Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvtQn2FGhSgHwfI2+OLrQY2PaEGLDoCTYRp7JSG8AQg=;
 b=RU0fJteTcodAO15AEQTJtKvGFGJ3b+f9rHQn9oDVdTNsRppuWjtoX1eaHIUqHsqzl7HkY7E67PlDq611TegETsDXbKyeWkzoeqAoJSlCnMhuRpl/24mr6rdaY+EILjJs6F4zTwlGagh6WRRbxfnbEEQq2Mdm3A/vp5Y15ycokHldwEHmsqCVLdB3ver6pARpaKHmjUloZ+G5lD6a9wi2L4wcVCMbvH4a4OMsk5IlREZp47BNB1QOftLwkQhW1btu7Xwe2VNxIg/RO5HiMklMrImYTZrFxm73IPR9NxGAxfxYM7Ll9vAXU3JGPcjI/keIa4v7IYZd65srwgnGiDZ+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2603.namprd11.prod.outlook.com (2603:10b6:5:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:03:31 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 17:03:30 +0000
Subject: Re: [OE-core] [PATCH] Fix rust-native build issue when debug is
 enabled
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randy MacLeod <rwmacleod@gmail.com>, alex.kanavin@gmail.com,
        umesh.kalappa0@gmail.com, Vinay Kumar <vinay.m.engg@gmail.com>
References: <20210929132054.117151-1-pgowda.cve@gmail.com>
 <582c9e8b-0b34-dba4-4a6f-1d6ff27f9204@windriver.com>
 <CALY4986EeF05NRTUM7mGAaCpsc1sWXM=KTP+08wRSXDOCumH1g@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <92856886-b13b-b134-a963-21570683dc52@windriver.com>
Date: Thu, 7 Oct 2021 13:03:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CALY4986EeF05NRTUM7mGAaCpsc1sWXM=KTP+08wRSXDOCumH1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 SJ0PR05CA0100.namprd05.prod.outlook.com (2603:10b6:a03:334::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Thu, 7 Oct 2021 17:03:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbb24def-9e30-4ebb-789f-08d989b4638b
X-MS-TrafficTypeDiagnostic: DM6PR11MB2603:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB260330E113AD573267F608BAF8B19@DM6PR11MB2603.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iAmsFRriN/oRlu/2JTpaSRBwTJJe9MJRYqqMA0GGLSTWe4le2iqFaL0E5pJwLqazbzjYwPSq+RPXIvNXTcT3sSQb/CMXKSePYu3BgFdo1bTHK5YuIRkLVaM0KV289y/ihLXtUEy45UEodrtFUyBmqndpH6q2AA4p+Y03Hrrrygs3GsvxEp9YmcTrkFpVJbWzBwaelJYMT/z7BU7mJKLrRzU56FPmhfI8pcMq7jbouk0fgQ/JtY0ai4fuLW62UOh59wDGFSI1qzAq6B8nqRP/IRMNI8Tarpj7QbRUVWjPDbkrgds4ST4rbqnv/XTLK1RVPH2AAquxOVod4zntCl0idqQatX+FpWsfJB3ydQlKHtGuPMJGcIM303dbW/aR66PYRGWYjV6F/F1mRLLOOFxXcnNyK9Az1T0xPCdvz3bke/ICcg7HF+fL4xfc41qZXM1mvgwthI/oN9a+RlyyV7KgOM+IVRSTvrqEX/zzDFeSu4O0qhFre0spRcFHtkSbPp/NxsHTPJywlmtUKJDGD8jn6iHEqSZ/g5yZZ9DMwRmDvyJYcSzOPhCsmrcCd7fjEJWAJ4LPH/CtKLRHeM7tnwIaOmY1ieQ++XB+6n0T1muTbJx86uh4QuCEwq9WNp7wRUt90KZSQmz7HccdL06xIIvMoHp80zoKdT/YpqmBAd1jcGvOaqoo8xF6o05Oh+PXHMBQrtD2U3EjDzQ8/4ghkZWEeXMgZcIplR7ZKR+MqXOqbFh8wxRV64PFYiuCnqGKxvQJnVeGY8VQE6iN0cuPNxJF+8MfTsyvpmIWDapY6k0n0WQyBZot0Zr8V3p8KHG4c/L4tFFQD5ayTZMRNyR+QGN/oA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(38350700002)(5660300002)(2616005)(66556008)(54906003)(16576012)(31686004)(956004)(6916009)(4744005)(2906002)(36756003)(66476007)(316002)(66946007)(6666004)(186003)(26005)(8936002)(86362001)(508600001)(8676002)(83380400001)(4326008)(52116002)(53546011)(6486002)(31696002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGlRbWhVTkdHYW5tbFErRkdBVmVmK1FlZ3lvQ1VqMVpiVHdBTHcvSUxLQm84?=
 =?utf-8?B?aHlUM1hpMzVuRTFkZmkwN1J0RlNWQWhLYXdzT0ZVbktkdkluYzlsQTRHMjQz?=
 =?utf-8?B?Q0ZjK0QycE9OeGQyZlVvcUhrRGZQNEs1OUtIb0RId1NxdHNrUUpzTUpzL2RH?=
 =?utf-8?B?Z2JWWVhQMGZOeWMzdG5UL3VlKzVxUDNGT2ttTllXWW1mU2MwcWhPZmhpUXFx?=
 =?utf-8?B?dk4veWtaeWp1ZTYvRHFlamVWa2xZS0l3dUc2TlVQeThVVXRqUWJodzFod3FC?=
 =?utf-8?B?RHB0MlV4NmNMY1BzaTBMMmFlQW44ZlU3YjNPUTIrRGwrQytuR3dSb21heXdB?=
 =?utf-8?B?QnhtRUpNNi9WVnZnWmRtWXg0VW5aN0V5VnVRdTVnazI5YVRZWVdzbXN3SC9q?=
 =?utf-8?B?TE1VeUF0Q0ZsQWQ2eHZDTk5RdXY2Q1kxRWhIMkRUT3NQZUNZQTJLSjNOUUFP?=
 =?utf-8?B?eGJOUGpjLzM0V2V4YlpzdDZCM3BDNHdpTzhDS3V2bzNiWE9JLzNOUjVPaHY2?=
 =?utf-8?B?V3h2SVR2UnR0b2kzYWFxejB5QjE3c0h0NWVSay9LYkFtb0c5bUN1MW9xeWpJ?=
 =?utf-8?B?WGwxSGc2dml1WnJtUzRJdXB0RmF3UE9vMDY5eGNnZElQa1RZQUJ6ckhHVEo1?=
 =?utf-8?B?cWhPRHR0N0FKR0dhRGhiZ3FndElOZlZkejJHQkxheXladVFHN3czUDkra2RD?=
 =?utf-8?B?c1BxMWJvSVA1U3owRjAzNzlVM3hGVEUrbFF5ckhySGhLcWdjYlJpTDZiMEJr?=
 =?utf-8?B?MzBXM01PUmtpVWV0bG9qdG1zcWtaYS9WVFRGTXo3OUx0S3cvanllZFhYVjhB?=
 =?utf-8?B?ZG5IeTIwWW5hVVNBL1NHK0FJaEdEWWVTaXZCenBRMklwRXd4dHVBckJPOTBR?=
 =?utf-8?B?RFJaWW1pQ05RVVhKbTZ0TUNEQ3ZWTTVvNDBQSFp6YkhoeUlBQkR4YW1ra3dD?=
 =?utf-8?B?V29CaWJmakpWaDhWRDFiald5NC9LNUswUFNVcVFPMWJpY0wyallJSHBsUDU2?=
 =?utf-8?B?ajVxQTUzbFVwQ1hyRmx3QWpqcjdNTDhLanoyNHNZaUFGdzJmc3U3Y20zbjFu?=
 =?utf-8?B?ZnlJdFRmc3dlSEoyWGp5Z3ZXSzBKSkxKZDBYMFBieFF4TEFLUG5zbkdlaG9a?=
 =?utf-8?B?WU5JWmF2U2dKK1R1WkdxbzFweDEvM2dJSlNNUWFDd0w3WFpTVklTU1ZaazBn?=
 =?utf-8?B?OTVMa0JaZjFLRUkxWHB5RXExTk1zcUNrVXBmeStPZ0ZkeDNGK2o3U28weGV0?=
 =?utf-8?B?QnVBQlZlbXViSGQwLzUrL3YwZFA3Mlc3K0FMSDNrM0Zub01IdVdzSDVlTCto?=
 =?utf-8?B?ZUR6clY5am5jSUFUY0NVaDBGY3BBYVRkZC9nTTFrWFo2T0Q1TnAxd05Vd1hC?=
 =?utf-8?B?L0dxTUVSTC9YYmd4TWFFZGJiUWt0eFRWVVkrTGgweHRaRnZIN2s1UXZaNFNq?=
 =?utf-8?B?Slp1UU9vNFA3OGhkM3hoWEFMc3FBbDJ1eGtiMkIwMkQ4M3NpdVdiWXJpVTBv?=
 =?utf-8?B?U1V6OENoT2hTWldnVzlUMFJESUJhbmpIaGs3ZU1tZ1BJNmhKVVpEK1Ftc2Nz?=
 =?utf-8?B?eFgxUWRBL0V2UTg5QmFxdE5XTXY3QlpWTXpqNjExS2dFZHZFWUFtZ3Y4T3R5?=
 =?utf-8?B?SzVjcnl1eDFKcmdYbHRvQjlSSkRtVU5lbXAwVzBTN1JoQ3ZKeGd4YkMxcDlm?=
 =?utf-8?B?UzdEYVhrejhxd2xwTTZpNWVkL0VCQkpsRjFMN1gyRDA0NG82QTI4Y2hobzRl?=
 =?utf-8?Q?AbB7JK4JkcVklFT5C0nvKYkIvoNYtTAKxDu90Y4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bbb24def-9e30-4ebb-789f-08d989b4638b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:03:30.7918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wyZY37CCPMMbZIEdrTjObcBT16hG+7u/VUdJ6ytOQDxApZGGlyPpUMEkxrvURfKuynEIq3qSK25MwxyqHbib5sBqKqHPvIpJNzjHS8qzdac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2603
X-Proofpoint-GUID: w0iXi08hjKYsdgwlAU4tnnPqcaRx5YAS
X-Proofpoint-ORIG-GUID: ReYoCC6um4G0PGm70zvx7N5lFtOWCZn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_03,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 17:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156742

On 2021-10-07 4:56 a.m., pgowda cve wrote:
> Hi Randy,
> 
>>> check this problem still happens with Alex's 1.55 upgrade:
> 
> I checked the issue with latest version upgrade branch from Alexander:-
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates
> 
> It builds as expected without any errors for rust-native with
> DEBUG_BUILD = "1"
> 
> Thanks,
> pgowda
> 


Oh excellent! We don't really need to identify what the change was
that fixed it but I'm curious so please take 10 minutes or so
to see if you can find it.


-- 
# Randy MacLeod
# Wind River Linux


