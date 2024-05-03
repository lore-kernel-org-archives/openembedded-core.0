Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBA5C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 17:22:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.262.1714756951309774243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 10:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=eUZORcSY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=58535d2ffb=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443BCsqk024618
	for <openembedded-core@lists.openembedded.org>; Fri, 3 May 2024 10:22:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=sMxHYmTFpXi3GSdBcsy
	B7a3qwUkZ3RFlz+nnOlcagGY=; b=eUZORcSYPbRPhwAohuwgOoFs5Fuxu29ltEt
	68sxYcvGDAIdOXrhaqv2AmQzwbKp8EjC2knB2qypLMhcXCunuKZmuv8bTnpEu//q
	3wosv6QzchSXMe+zfQMwlaZrJMgem2WJnJ08DZYBGI4iNYkGZVqUpkIUnmyDTTga
	nJ+PTIyixuOLaeU6SE2Sftj2LS5Y14z6T3qFWTj1ZOGMvT4gcp0R2CP2w/3jl6zw
	omO6VkoT/kIJStBhOVpu3gu7IU+4PZNHkHHCGRubgo3n5hjEGSExS1nuFi28tOhY
	YB3Bq4FpY5+P8xAdC5zuYeDcADyh3Yej9qwWzRo4J3GbjIZyMSQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrvn1ejhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:22:30 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 443HMUw0003994;
	Fri, 3 May 2024 10:22:30 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrvn1ejhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 10:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvobD3UPE7wi4Ovooa+GtV0kuENKwQNlYs2EJu6/7mP447mDbcMwIMGsyJrVcgGWaLFE+8hPtCKPDTY8n/YRYkG/Fgu5tGiYLCUsXhlGWT0dMx3QdMJF5bPc3RvUpOH25UMerRTjg2020CVsEOGomvK0Yiu9MvWEMxQAwwZKumjfDp5EbgF+ztIDBy57RJc0hkSeJcjdN9XEjIOoBC4I5w2YygTx8K9qqZkmE+/Xc0/nd3YhpVq31NdRw+JB9H2Fo3nL3ZXCMjU2pSdhxUwXlxzhcY6cmRQKppGOSdRPM3/2psSsgFIv2/jclntvSzL5oe5ExfgociVDhiHlzmo2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMxHYmTFpXi3GSdBcsyB7a3qwUkZ3RFlz+nnOlcagGY=;
 b=j7nveBp6cb4DWfBzBhAv+l/sDULebQFFPq7FSlkXpT7f6YfeTpzj/gFXCbIqv39Ck1Ell8FGWFX8nO+ID6LB6HxMV3bbDf0pZ7OXUmxMOEMxQeCbU/6HDJKEFuWHRofGwkZvDILkDkZrKiWOeUvWHiHB3v3MN7MUxpOlco5fvP9doxODx8AYKrQEs1bJKJwJlqugExcD2x0Fv7+I877Afnyxg4pQUA57gWrSHWNWldLZeSnYefDzDzYRCXh/vCOKfpVj6+q6pKBlZn7pBiIFqKVjFDplPHMp+l+evFL9FD51A/QSbcWFOo2iq8bpZA9y8D7QG4jo11/cyLS4DrPy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 17:22:26 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c141:cdae:82f5:1b89]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c141:cdae:82f5:1b89%4]) with mapi id 15.20.7544.023; Fri, 3 May 2024
 17:22:26 +0000
Content-Type: multipart/alternative;
 boundary="------------Bcj7mpE08etgxGXkki6jo8oV"
Message-ID: <350638b5-9151-4e7a-993a-cdaf042f50f7@windriver.com>
Date: Fri, 3 May 2024 13:22:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Improvements for performance test report view
To: engineering@neighbourhood.ie, openembedded-core@lists.openembedded.org,
        Ninette Adhikari <ninette@thehoodiefirm.com>
Cc: richard.purdie@linuxfoundation.org
References: <5e46a5c002cc62e0da9f3053c890120eb4582820.camel@linuxfoundation.org>
 <20240503144340.27385-1-ninette@thehoodiefirm.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240503144340.27385-1-ninette@thehoodiefirm.com>
X-ClientProxiedBy: SJ0PR05CA0134.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::19) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: b81db65a-df1b-4e15-814c-08dc6b959a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aStrcWU3anhxRkFiVVArOXgzbGRvMm0zVVREanVJTnk4R2Q5bkkzLzV0TDFJ?=
 =?utf-8?B?Y3cyTUxGeU13TUZnU2x0YUM5UjlraE5FWE10aTk5Q0lFdmxDY0lWMnkzd0xs?=
 =?utf-8?B?NnZPb0tkbUFmTU8wSTN2VzdzMTcxVFVVdFdEaUg4RDVtU0JtSW5yL3JaRG1Q?=
 =?utf-8?B?WGlKM0kySEk5NC96TkdyelI2dndkMVhWYnlzeWk4R2pwcE5ZNi9FMEhWTnBs?=
 =?utf-8?B?cTcwSGE1QXZuSG1nVDZvNjg5OTdTNU5LQm5TVEFHdXZuN3N1NE9NMDduejNY?=
 =?utf-8?B?MFBzUW54VGVkM3kzNFBLSTF0TXFuZG1HOUlnQXU3WWNRNnRqVHIrNjhoZTly?=
 =?utf-8?B?YTQwVmtYQUI5cXlTMDUvcmpOZ3oxaERRSGxraUtBMWlOTFdQdjNQdTNXUkVy?=
 =?utf-8?B?UWhYYlJQemJHOStMaU1KZHZxejdKWFp5VmFsQkc2SThNUjJWUGJZZ0xTUk9s?=
 =?utf-8?B?Smt1Q1JZajZ1K3JoQ091RS9uTG54QzdSa25RY1haY2t6SkJCSXFyTkhiSnJV?=
 =?utf-8?B?ZHE1eXVHYWJrSDNjMW9hRHNjS0cyQWVQSFUxU2FNZ1dkS3B0UGExZTk0ZVRJ?=
 =?utf-8?B?SzcrNWVFUUVTejNCNkMrQ2dmQUFoTVhiUVlZcVp6eU02RG8zY1VWYWlNS2hY?=
 =?utf-8?B?c2NUd2N2YzNnNFF5WnRNbXIxVk0wdmFRQU1DbTJITXhQWUlhejZ0SHI4RW51?=
 =?utf-8?B?aGZUeTFkYTRYdVhhbmh2WWc1aUt5bXQyekhRdC9XQmo1UURqU0xsdURCT2Vh?=
 =?utf-8?B?Mm1leStJYlFXRmdUN2hpSUV3RWk5emZJZlFWUkxUYS8vNXdIYnRxYjFsU2JZ?=
 =?utf-8?B?K2VBdjBoMTNEbGVxWC9vMU05My9oMG0zVHByV1lkOElGKzBMK1ViWlZ5b1lC?=
 =?utf-8?B?SGxFMVlCdTVQVFpYdU5CWkZVMEdlc3FxZjY4MnpMeVlPaVRlQ0N4VFJJWFMr?=
 =?utf-8?B?ZDdHSzJpM3dGV2dvUDN0eCttVjVxcTA0ek1oY2R5NlVrcTlZRm1tZnhYUFBO?=
 =?utf-8?B?ZTFlWEJIOXhpbWYwL1Zsd1ZlbURUdW9EVzdZdWtPWmpjWllQWFlCRm9nZFdw?=
 =?utf-8?B?UTRWeUxjdkhMSDZhaU1nTC9yT3Y5TnFIV0JFOWZ4WTd6bExQLzZ4ejVhQlUy?=
 =?utf-8?B?OFJERVBrU2p4K2FjYXphcjlYRHJOOU1DQS8rL1ppTzljYjZ3UFBRa21iYWd3?=
 =?utf-8?B?eFhUek15S0o0UUZYRlFuRXYzSGJ3cXRXSzE5dzVCTEsxcnhwMEpvanVqTFEz?=
 =?utf-8?B?TGV0a25RU0xTTmd3T2RSTGM5K3NLNlE5QVhEbnpXWERiK0E2enFZRWZkbHps?=
 =?utf-8?B?eUt3VGxwQW9QeUMrRStGK2xxb3lhRzc0WndXdVRNa0tpR0V2VGF5RjFaV2wv?=
 =?utf-8?B?bDgzS0dhRXR1RUo2QzZtRFdBZTlzTUNJbFp3NFZNV0N2T2tXcGJkWjNia2c1?=
 =?utf-8?B?aTcyRWUyN2pQVEg3eGV6UDQvNGZGakRTQUhoY3NsekpGRXBlWE5pQ1ZNdVlJ?=
 =?utf-8?B?eEJaME1tRHpuY1NpSUJlZWh6UlZJWGlINzlxSldzWTQ1akNvNDF6NXZ1Q2ht?=
 =?utf-8?B?b29XSFBqYzhEa0lKTnk0NC9MTVI2QnlzZzlHY3hvVFBBbHRMRjd0QVBFV2dU?=
 =?utf-8?Q?9iP2YR/eQ5j2D31rMoOX7dqi1x2mYpZQDQ9swyxB8GqI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dm1PbGh2eWxodnBXWVgvbk5aWTM0K21ZM1d6OEdPV1MwU3F0Zi82NDV4ZmlS?=
 =?utf-8?B?N1lDYTFXcTFWbytJVkZVSGpyeDVYQlJSdVQ2TVBIZnY4N0IxanZrVlZLZVhF?=
 =?utf-8?B?YzdYU3ViWVlQYUpxNUl5WEFhYUZ3Vm1LM0JzdlZjeFVPU3h1TlN5YUd1Z0RY?=
 =?utf-8?B?U0IrVU5UYlN6UGlSMWZEcFkxekVTRTV1VkxjWmt1bC9xazNqRzFWR0FBQURF?=
 =?utf-8?B?VjdDVjA2bVo3ZlFuZmdqRTJrRXppb1RIRk1jNUhISEVvb3N2K1cwVFZvZVBM?=
 =?utf-8?B?OGRHK0JqcXE4RFI2Y1ZIRUxDSWUrSjhzZzFzVDFKYVVHd0NLeENablpDcHdO?=
 =?utf-8?B?RHFxN2U3c2VEcXhVZnJ4RGtvYjk2Z2o5OTRXNXArVWIzZzZRZ1kxK05Xd0Fq?=
 =?utf-8?B?UHlCRHdoSzRhNUhlejJVTWx5Q21RL0tuMm1SSXdUdGh0Y1BXMTVPQWd5ZUdy?=
 =?utf-8?B?K2lFZUZ4aEhZb2dtYjZkYjFGdlViUTU4TXFSUU5STlM3aUJPRlBVVXdYV0hk?=
 =?utf-8?B?WE1zdERNMHRkMG5KZjg3N3NKYzA0dDZaMHR5aU4zbURPdUYrYkpPaDdIVkh0?=
 =?utf-8?B?TlF1R2V2VG5vRWh5TkdFUmRpYWZjN1A4a0Y5QktxbXZFUnBuaWxZTERGaUho?=
 =?utf-8?B?Rk1jcW1MOFlpdlNNQzh4WVBKWGtDREpBKzZzajlJV3ZRM0J2VjNUNkFXcTZ5?=
 =?utf-8?B?ZjZKSmorTW9MSitQVndtcUwvN0dlcGpFcUVhUnBnU2ZHSVRwNnNNa1g4czl2?=
 =?utf-8?B?aHlxUkdGWm9CQWVEelFYWXo3Rm1CODIzTGxJdU9EVkY2R05VR2E2a0lucTRO?=
 =?utf-8?B?WEpPRGcyNDJIek1CYktXb2RHclZqbC8ycEhDM3BUK2UzMC9yNHlyeFgyaEd6?=
 =?utf-8?B?NXcvN1pjajU4V2tmcUo4NFNOcnhkWDEwanFoZFpiOXhyK0hvNVZWcWx4eEtG?=
 =?utf-8?B?VGQwenJpcGh3Qm9HTWs5bEtxdzBwa0xkaUVza1BIVktpakJvcmtBQWNSOE5T?=
 =?utf-8?B?MkZZU1FlQ3VsTThueWhtOXZXeEwzUERHNkF4YVNnYm1zNzg4Uk5xWkxiT1Z1?=
 =?utf-8?B?Zlc5U2VONEV5T3phV3h1ajVqc3FlSzVkQ1F0UE5nd2tBeHdPNURSbjJxbll2?=
 =?utf-8?B?cTBXaFR5eEJVNWpBRTM3SjJ0TE9WUHYxMGgyVURXUEZyV0hqU2FuSzNqVnhI?=
 =?utf-8?B?cnNvWlR6WlRTVjh1ZmxoZUp3U1NFMDIySVQ2NlVyY3B1dUZJeXZJYXN6bEN2?=
 =?utf-8?B?WXd1R1MzdG5YWWNGQ2F0VFVwRnB5bDRCZmtaMjVrNnoxNlFrK0VNVjdmRDkr?=
 =?utf-8?B?SHA4U0p3SnlHNjRzRTFYRXZWblY2aVJ6T1p3OThRUHVBU1Y3V3hpUkdXRWR1?=
 =?utf-8?B?OXRJUm9hL0tnYWR3ZytEbWdZdDJkM0cvaXU5bjg2UEpjVnZRaDZsQkgvOVRq?=
 =?utf-8?B?MWpuR09wbG4vaC8rOTJzNkw2dFdLR3lKR0dvdm01SVF4SmRKTCtrK05hRGJI?=
 =?utf-8?B?NnV6dkNEUVBhSWtibTVEZjFyTldJZmZEak9JT0lqSW9JMFhJc2JhRWJjc0ph?=
 =?utf-8?B?WGZycEEvd3JZUXdvL3hYYWR1aUF0L0tOSjlQQTZJNUVwMnJvenFZV2VaRytk?=
 =?utf-8?B?ZjMzNk9qV2MxanZ0TExEc2xyUk96Vi9UbU9oS2tjT0U2aEY5WXl3cy9ZMnla?=
 =?utf-8?B?WERZeGNLaGlGRXpBMitIQ3NrYmM1UUUxNklBcE8rcjBJcU1ESVllTDQ5VWhl?=
 =?utf-8?B?K2VrRW81UmZFZkJ1SGJzcDNYdGJmOFRWWmxIeDY4Q0hkWVdHS2NqUDRIVEU1?=
 =?utf-8?B?ZWFyNTkvWDZ6VnFHQVFQQVNHSEtIWW9HekZRT2NrbHlMVVduL05uUU81Ym1k?=
 =?utf-8?B?N3VkR3N6SHpBWHM0L05zTVV2NVZhbnpUbzBDNHhWaytuc0tKMDcyWHoxNzVD?=
 =?utf-8?B?TTIzQWRObXlIUm5iSXhyeU8zcTlFb0xzUS81a2w2My9UaFNxT2cwcjgvNzNi?=
 =?utf-8?B?TU82MXBLQ0VaZFIrb3J2SDhINGxlNkdaMExmZXF1R0lyaGVCTTNxY3kzNUV4?=
 =?utf-8?B?c3NVU1ZsVzN0cVZSODNwWEN1bEtnWHE4TXBpOGRPTmgyMXdMUU0wWGxyWlN2?=
 =?utf-8?B?VXdJTVQweUxkYkY4a0hGSTE0aXZqNzI3cHRYZjViWDJmNStFMnd5YWZhR2lm?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81db65a-df1b-4e15-814c-08dc6b959a0a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 17:22:26.1393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Tn3YrLFY4/UxnH89D+B2by6uQlW5GtK5RsypxnhzM07V6sDi9W98uXSYL0bkkUgjdipYDKsGLA2/VG0yLM48UV6yE86yI4T7T3xhwrVWNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-Proofpoint-GUID: w8jVUBVPcuOffqNTK9d3mRC_aojjhByp
X-Proofpoint-ORIG-GUID: ExiCyTbbfsJBYF5yckq0kuEbxgCSRJAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_11,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 17:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199007

--------------Bcj7mpE08etgxGXkki6jo8oV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 443BCsqk024618

On 2024-05-03 10:43 a.m., Ninette Adhikari wrote:
> This work is done according to "Milestone 9: Build performance test rep=
ort view" as stated in the Scope of Work with Sovereign Tech Fund (STF) (=
https://www.sovereigntechfund.de/).
> The current report can be accessed here:
> Performance test report HTML (https://autobuilder.yocto.io/pub/non-rele=
ase/20240117-15/testresults/buildperf-alma8/perf-alma8_master_20240117090=
048_663f180574.html)
> The report is created using the `oe-build-perf-report` script in the po=
ky repository. This script generates a performance test report in HTML fo=
rmat using the data from the yocto-buildstats (https://git.yoctoproject.o=
rg/yocto-buildstats/) repository.
> The report displays the performance test results in line chart format. =
The chart x-axis represents the commit numbers, and the y-axis represents=
 the test duration in minutes.
> The report also includes a table that displays the measurement statisti=
cs data for each test. The report is interactive and allows users to zoom=
 in on specific sections of the line chart.
>
> The current report format required some updates to make it more interac=
tive and user-friendly. And this patch addresses such improvements:
>
> - Add [Apache echart](https://echarts.apache.org/en/index.html) library=
 to create oe build performance report charts and make them interactive.
> - Restructure data to time and value array format to be used by echarts=
. It also converts test duration to minutes and adds zoom to the charts.
> - Update measurement statistics data to include `start_time` so that ti=
me can be displayed instead of commit numbers on the chart. It also updat=
es default commit history length to 300.
> - Add styling updates including page margin, labels for x and y axis, t=
ooltip, and section descriptions.
The tooltips are very nice and useful so
> - The charts are created as step charts instead of plain line charts.
> - Add start time, size, and commit number to tooltip.
> - Add dark mode view
>
> Updated report screenshots:
> https://github.com/neighbourhoodie/poky/assets/13760198/65a1890c-fd2a-4=
0d4-ac90-f13055735e53
> https://github.com/neighbourhoodie/poky/assets/13760198/b40c326b-17d2-4=
2e2-8e41-72e52ed2c003
> https://github.com/neighbourhoodie/poky/assets/13760198/cc7ec996-9dab-4=
35a-8fdc-82a2a4193c0a
> https://github.com/neighbourhoodie/poky/assets/13760198/6e0fe09d-50e5-4=
b0b-b70b-6943f71b5208


Very nice! Thanks for the work and the v2 improvements.


I applied the patches by saving them from email and there was a minor=20
whitespace warning which
is really nothing to worry about but if you want to avoid such noise,=20
you could send yourself
patches by email and then apply them in a different branch if you want=20
to check for such problems.


=E2=9D=AF git am /tmp/ninette-v2/*
Applying: oe-build-perf-report: Add apache echarts to make report=20
interactive
Applying: oe-build-perf-report: Display more than 300 commits and date=20
instead of commit number
Applying: oe-build-perf-report: Improve report styling and add descriptio=
ns
.git/rebase-apply/patch:240: trailing whitespace.
 =C2=A0=C2=A0=C2=A0 start_time =3D time
warning: 1 line adds whitespace errors.
Applying: oe-build-perf-report: Update chart tooltip and chart type
Applying: oe-build-perf-report: Add dark mode

poky.git on ninette-v2 [$?]
=E2=9D=AF ls /tmp/ninette-v2/*
'/tmp/ninette-v2/[OE-core] [PATCH v2 1_5] oe-build-perf-report: Add=20
apache echarts to make report interactive - "Ninette Adhikari via=20
lists.openembedded.org"=20
<ninette=3Dthehoodiefirm.com@lists.openembedded.org> - 2024-05-03 1043.em=
l'
'/tmp/ninette-v2/[PATCH v2 2_5] oe-build-perf-report: Display more than=20
300 commits and date instead of commit number - Ninette Adhikari=20
<ninette@thehoodiefirm.com> - 2024-05-03 1043.eml'
'/tmp/ninette-v2/[PATCH v2 3_5] oe-build-perf-report: Improve report=20
styling and add descriptions - Ninette Adhikari=20
<ninette@thehoodiefirm.com> - 2024-05-03 1043.eml'
'/tmp/ninette-v2/[PATCH v2 4_5] oe-build-perf-report: Update chart=20
tooltip and chart type - Ninette Adhikari <ninette@thehoodiefirm.com> -=20
2024-05-03 1043.eml'
'/tmp/ninette-v2/[PATCH v2 5_5] oe-build-perf-report: Add dark mode -=20
Ninette Adhikari <ninette@thehoodiefirm.com> - 2024-05-03 1043.eml'

>
> For local setup, you can do the following:
>
> 1. Clone the yocto-buildstats (https://git.yoctoproject.org/yocto-build=
stats/) and the poky repository (https://git.yoctoproject.org/poky/)
>
> 2. In the poky repository run the following to build the report HTML:
> ```bash
> ./scripts/oe-build-perf-report -r "LOCAL_PATH_TO_YOCTO_BUILDSTATS" --br=
anch "master" --commit "663f1805742ff6fb6955719d0ab7846a425debcf" --branc=
h2 "master" --html > test.html

These are the same setup step as last time I think and again, they=20
aren't quite right but
the script tells you do do:

=E2=9D=AF git fetch origin=20
refs/notes/buildstats/perf-debian11/master/qemux86:refs/notes/buildstats/=
perf-debian11/master/qemux86


and that works.


> ```
> Note:
> - Add your local path to the yocto-buildstats repo
> - The above command builds the report in a file called `test.html`. You=
 can access it in the root directory in poky.
> - This exmaple report uses the commit `663f1805742ff6fb6955719d0ab7846a=
425debcf` from `master` branch.

Hmmm, ah, that's a poky commit id. I (stupidly!) expected it to be a=20
commit ID in the yocto-buildstats repo.


One thing that you can think about fixing or just ignore is that the=20
--commit arg needs to be the
full commit hash not the shortened version. i.e. this doesn't work:

=E2=9D=AF ./scripts/oe-build-perf-report -r=20
"/media/rmacleod/gitter/rmacleod/src/distro/yocto/yocto-buildstats.git"=20
--branch "master" --commit "663f180574" --branch2 "master" --html >=20
/tmp/ninette-v2-test-663f180574.html
Traceback (most recent call last):
 =C2=A0 File=20
"/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/./scripts/oe-b=
uild-perf-report",=20
line 617, in <module>
 =C2=A0=C2=A0=C2=A0 sys.exit(main())
 =C2=A0 File=20
"/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/./scripts/oe-b=
uild-perf-report",=20
line 532, in main
 =C2=A0=C2=A0=C2=A0 index1 =3D gitarchive.rev_find(revs, 'commit', args.c=
ommit)
 =C2=A0 File=20
"/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/lib/oeqa/=
utils/gitarchive.py",=20
line 282, in rev_find
 =C2=A0=C2=A0=C2=A0 raise ValueError("Unable to find '{}' value '{}'".for=
mat(attr, val))
ValueError: Unable to find 'commit' value '663f180574'

Since the script is going to be used in other scripts run on the=20
autobuilder, this is a low priority enhancement.


I was happy to see that a newer poky commit, worked fine:

=E2=9D=AF ./scripts/oe-build-perf-report -r=20
"/media/rmacleod/gitter/rmacleod/src/distro/yocto/yocto-buildstats.git"=20
--branch "master" --commit "632e3170595bb32717c0471a55a619b4b33fe787"=20
--branch2 "master" --html >=20
/tmp/ninette-v2-test-632e3170595bb32717c0471a55a619b4b33fe787.html
INFO: Parsing buildstats from=20
'refs/notes/buildstats/perf-debian11/master/qemux86'


but I did notice:=C2=A0 Stdev: nan


whereas in your linked charts, and in my first run with commit:=20
663f1805742ff6fb6955719d0ab7846a425debcf

the correct numerical standard deviation is displayed.

I can debug this is you can't reproduce it yourself.


Again. these reports and beautiful interactive charts are great to see.

Thanks!

../Randy


>
>
> Ninette Adhikari (5):
>    oe-build-perf-report: Add apache echarts to make report interactive
>    oe-build-perf-report: Display more than 300 commits and date instead
>      of commit number
>    oe-build-perf-report: Improve report styling and add descriptions
>    oe-build-perf-report: Update chart tooltip and chart type
>    oe-build-perf-report: Add dark mode
>
>   .../build_perf/html/measurement_chart.html    | 140 ++++++++++++-----=
-
>   scripts/lib/build_perf/html/report.html       | 124 +++++++++++-----
>   scripts/lib/build_perf/report.py              |   5 +-
>   scripts/oe-build-perf-report                  |   6 +-
>   4 files changed, 193 insertions(+), 82 deletions(-)
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Bcj7mpE08etgxGXkki6jo8oV
Content-Type: multipart/related;
 boundary="------------0B24ALD6wmrYsnOJDLLhHRCu"

--------------0B24ALD6wmrYsnOJDLLhHRCu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 443BCsqk024618

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-05-03 10:43 a.m., Ninette
      Adhikari wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240503144340.27385-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">This work is done according =
to &quot;Milestone 9: Build performance test report view&quot; as stated =
in the Scope of Work with Sovereign Tech Fund (STF) (<a class=3D"moz-txt-=
link-freetext" href=3D"https://www.sovereigntechfund.de/">https://www.sov=
ereigntechfund.de/</a>).
The current report can be accessed here:=20
Performance test report HTML (<a class=3D"moz-txt-link-freetext" href=3D"=
https://autobuilder.yocto.io/pub/non-release/20240117-15/testresults/buil=
dperf-alma8/perf-alma8_master_20240117090048_663f180574.html">https://aut=
obuilder.yocto.io/pub/non-release/20240117-15/testresults/buildperf-alma8=
/perf-alma8_master_20240117090048_663f180574.html</a>)
The report is created using the `oe-build-perf-report` script in the poky=
 repository. This script generates a performance test report in HTML form=
at using the data from the yocto-buildstats (<a class=3D"moz-txt-link-fre=
etext" href=3D"https://git.yoctoproject.org/yocto-buildstats/">https://gi=
t.yoctoproject.org/yocto-buildstats/</a>) repository.
The report displays the performance test results in line chart format. Th=
e chart x-axis represents the commit numbers, and the y-axis represents t=
he test duration in minutes.=20
The report also includes a table that displays the measurement statistics=
 data for each test. The report is interactive and allows users to zoom i=
n on specific sections of the line chart.

The current report format required some updates to make it more interacti=
ve and user-friendly. And this patch addresses such improvements:

- Add [Apache echart](<a class=3D"moz-txt-link-freetext" href=3D"https://=
echarts.apache.org/en/index.html">https://echarts.apache.org/en/index.htm=
l</a>) library to create oe build performance report charts and make them=
 interactive.
- Restructure data to time and value array format to be used by echarts. =
It also converts test duration to minutes and adds zoom to the charts.
- Update measurement statistics data to include `start_time` so that time=
 can be displayed instead of commit numbers on the chart. It also updates=
 default commit history length to 300.
- Add styling updates including page margin, labels for x and y axis, too=
ltip, and section descriptions.</pre>
    </blockquote>
    The tooltips are very nice and useful so<br>
    <blockquote type=3D"cite" cite=3D"mid:20240503144340.27385-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
- The charts are created as step charts instead of plain line charts.
- Add start time, size, and commit number to tooltip.
- Add dark mode view

Updated report screenshots:=20
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/neighbourho=
odie/poky/assets/13760198/65a1890c-fd2a-40d4-ac90-f13055735e53">https://g=
ithub.com/neighbourhoodie/poky/assets/13760198/65a1890c-fd2a-40d4-ac90-f1=
3055735e53</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/neighbourho=
odie/poky/assets/13760198/b40c326b-17d2-42e2-8e41-72e52ed2c003">https://g=
ithub.com/neighbourhoodie/poky/assets/13760198/b40c326b-17d2-42e2-8e41-72=
e52ed2c003</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/neighbourho=
odie/poky/assets/13760198/cc7ec996-9dab-435a-8fdc-82a2a4193c0a">https://g=
ithub.com/neighbourhoodie/poky/assets/13760198/cc7ec996-9dab-435a-8fdc-82=
a2a4193c0a</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/neighbourho=
odie/poky/assets/13760198/6e0fe09d-50e5-4b0b-b70b-6943f71b5208">https://g=
ithub.com/neighbourhoodie/poky/assets/13760198/6e0fe09d-50e5-4b0b-b70b-69=
43f71b5208</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p>Very nice! Thanks for the work and the v2 improvements.</p>
    <p><br>
    </p>
    <p>I applied the patches by saving them from email and there was a
      minor whitespace warning which<br>
      is really nothing to worry about but if you want to avoid such
      noise, you could send yourself <br>
      patches by email and then apply them in a different branch if you
      want to check for such problems.</p>
    <p><br>
    </p>
    <p>=E2=9D=AF git am /tmp/ninette-v2/*<br>
      Applying: oe-build-perf-report: Add apache echarts to make report
      interactive<br>
      Applying: oe-build-perf-report: Display more than 300 commits and
      date instead of commit number<br>
      Applying: oe-build-perf-report: Improve report styling and add
      descriptions<br>
      .git/rebase-apply/patch:240: trailing whitespace.<br>
      &nbsp;&nbsp;&nbsp; start_time =3D time <br>
      warning: 1 line adds whitespace errors.<br>
      Applying: oe-build-perf-report: Update chart tooltip and chart
      type<br>
      Applying: oe-build-perf-report: Add dark mode<br>
      <br>
      poky.git on ninette-v2 [$?] <br>
      =E2=9D=AF ls /tmp/ninette-v2/*<br>
      '/tmp/ninette-v2/[OE-core] [PATCH v2 1_5] oe-build-perf-report:
      Add apache echarts to make report interactive - &quot;Ninette Adhik=
ari
      via lists.openembedded.org&quot;
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ninette=3Dthehood=
iefirm.com@lists.openembedded.org">&lt;ninette=3Dthehoodiefirm.com@lists.=
openembedded.org&gt;</a> -
      2024-05-03 1043.eml'<br>
      '/tmp/ninette-v2/[PATCH v2 2_5] oe-build-perf-report: Display more
      than 300 commits and date instead of commit number - Ninette
      Adhikari <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ninette@=
thehoodiefirm.com">&lt;ninette@thehoodiefirm.com&gt;</a> - 2024-05-03 104=
3.eml'<br>
      '/tmp/ninette-v2/[PATCH v2 3_5] oe-build-perf-report: Improve
      report styling and add descriptions - Ninette Adhikari
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ninette@thehoodie=
firm.com">&lt;ninette@thehoodiefirm.com&gt;</a> - 2024-05-03 1043.eml'<br=
>
      '/tmp/ninette-v2/[PATCH v2 4_5] oe-build-perf-report: Update chart
      tooltip and chart type - Ninette Adhikari
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ninette@thehoodie=
firm.com">&lt;ninette@thehoodiefirm.com&gt;</a> - 2024-05-03 1043.eml'<br=
>
      '/tmp/ninette-v2/[PATCH v2 5_5] oe-build-perf-report: Add dark
      mode - Ninette Adhikari <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:ninette@thehoodiefirm.com">&lt;ninette@thehoodiefirm.com&gt;</a> -
      2024-05-03 1043.eml'<br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240503144340.27385-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

For local setup, you can do the following:

1. Clone the yocto-buildstats (<a class=3D"moz-txt-link-freetext" href=3D=
"https://git.yoctoproject.org/yocto-buildstats/">https://git.yoctoproject=
.org/yocto-buildstats/</a>) and the poky repository (<a class=3D"moz-txt-=
link-freetext" href=3D"https://git.yoctoproject.org/poky/">https://git.yo=
ctoproject.org/poky/</a>)

2. In the poky repository run the following to build the report HTML:
```bash
./scripts/oe-build-perf-report -r &quot;LOCAL_PATH_TO_YOCTO_BUILDSTATS&qu=
ot; --branch &quot;master&quot; --commit &quot;663f1805742ff6fb6955719d0a=
b7846a425debcf&quot; --branch2 &quot;master&quot; --html &gt; test.html</=
pre>
    </blockquote>
    <p>These are the same setup step as last time I think and again,
      they aren't quite right but<br>
      the script tells you do do:<br>
      <br>
      =E2=9D=AF git fetch origin
refs/notes/buildstats/perf-debian11/master/qemux86:refs/notes/buildstats/=
perf-debian11/master/qemux86</p>
    <p><br>
    </p>
    <p>and that works.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240503144340.27385-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
```
Note:
- Add your local path to the yocto-buildstats repo
- The above command builds the report in a file called `test.html`. You c=
an access it in the root directory in poky.
- This exmaple report uses the commit `663f1805742ff6fb6955719d0ab7846a42=
5debcf` from `master` branch.</pre>
    </blockquote>
    <p>Hmmm, ah, that's a poky commit id. I (stupidly!) expected it to
      be a commit ID in the yocto-buildstats repo.</p>
    <p><br>
    </p>
    <p>One thing that you can think about fixing or just ignore is that
      the --commit arg needs to be the<br>
      full commit hash not the shortened version. i.e. this doesn't
      work:<br>
      <br>
      =E2=9D=AF ./scripts/oe-build-perf-report -r
      &quot;/media/rmacleod/gitter/rmacleod/src/distro/yocto/yocto-builds=
tats.git&quot;
      --branch &quot;master&quot; --commit &quot;663f180574&quot; --branc=
h2 &quot;master&quot; --html
      &gt; /tmp/ninette-v2-test-663f180574.html<br>
      Traceback (most recent call last):<br>
      &nbsp; File
&quot;/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/./scripts=
/oe-build-perf-report&quot;,
      line 617, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; sys.exit(main())<br>
      &nbsp; File
&quot;/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/./scripts=
/oe-build-perf-report&quot;,
      line 532, in main<br>
      &nbsp;&nbsp;&nbsp; index1 =3D gitarchive.rev_find(revs, 'commit', a=
rgs.commit)<br>
      &nbsp; File
&quot;/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/lib/=
oeqa/utils/gitarchive.py&quot;,
      line 282, in rev_find<br>
      &nbsp;&nbsp;&nbsp; raise ValueError(&quot;Unable to find '{}' value=
 '{}'&quot;.format(attr,
      val))<br>
      ValueError: Unable to find 'commit' value '663f180574'<br>
    </p>
    <p>Since the script is going to be used in other scripts run on the
      autobuilder, this is a low priority enhancement.<br>
    </p>
    <p><br>
    </p>
    <p>I was happy to see that a newer poky commit, worked fine:<br>
      <br>
      =E2=9D=AF ./scripts/oe-build-perf-report -r
      &quot;/media/rmacleod/gitter/rmacleod/src/distro/yocto/yocto-builds=
tats.git&quot;
      --branch &quot;master&quot; --commit
      &quot;632e3170595bb32717c0471a55a619b4b33fe787&quot; --branch2 &quo=
t;master&quot;
      --html &gt;
      /tmp/ninette-v2-test-632e3170595bb32717c0471a55a619b4b33fe787.html<=
br>
      INFO: Parsing buildstats from
      'refs/notes/buildstats/perf-debian11/master/qemux86'<br>
    </p>
    <p><br>
    </p>
    <p>but I did notice:&nbsp; Stdev: nan</p>
    <p><img src=3D"cid:part1.dMx4Nz2i.eQq0vdeT@windriver.com" alt=3D""></=
p>
    <p><br>
    </p>
    <p>whereas in your linked charts, and in my first run with commit:&nb=
sp;&nbsp;
      <span style=3D"white-space: pre-wrap">
   663f1805742ff6fb6955719d0ab7846a425debcf</span></p>
    <p>the correct numerical standard deviation is displayed.<br>
      <br>
      I can debug this is you can't reproduce it yourself.</p>
    <p><br>
    </p>
    <p>Again. these reports and beautiful interactive charts are great
      to see.<br>
      <br>
      Thanks!</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240503144340.27385-1-ninette@=
thehoodiefirm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">


Ninette Adhikari (5):
  oe-build-perf-report: Add apache echarts to make report interactive
  oe-build-perf-report: Display more than 300 commits and date instead
    of commit number
  oe-build-perf-report: Improve report styling and add descriptions
  oe-build-perf-report: Update chart tooltip and chart type
  oe-build-perf-report: Add dark mode

 .../build_perf/html/measurement_chart.html    | 140 ++++++++++++------
 scripts/lib/build_perf/html/report.html       | 124 +++++++++++-----
 scripts/lib/build_perf/report.py              |   5 +-
 scripts/oe-build-perf-report                  |   6 +-
 4 files changed, 193 insertions(+), 82 deletions(-)

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>
--------------0B24ALD6wmrYsnOJDLLhHRCu
Content-Type: image/png; name="ipZPodcPGxdg4E4H.png"
Content-Disposition: inline; filename="ipZPodcPGxdg4E4H.png"
Content-Id: <part1.dMx4Nz2i.eQq0vdeT@windriver.com>
Content-Transfer-Encoding: base64

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
7UMbl3/WuyXN4+emo39zuv51SNK+6tU1pdqOVwx4VqVt+LJywLMptLx2Ydr7N6c4v3aNA472rZqz
7F3PplSzPP1q79+c9v7Nad1+cbpduk2qZtWvUV+lmo607D4/LTsuWrvCi6UsO3ZK2gcv/5m1jl6S
tmEN6X7RiOVBUyFpOmB2qp/qlupnuq2kgKT+7n5pOGJ6mg6YnZqnuq/2Zw0AAAAAwOZnsw15+vXr
l27dlv+BesrUqSs8nz9vQfl64MAB5euRI7Zd/s6UKTns8IMzevR2mTdvfh5+6D95+OFH1mj8YrGY
gw7av3x/5x33rPC8uakpzU1Na9RXktTV1eX3l12UnXbaYYXPR4/ZLqPHbJe3vu3N+da3vpuLfn3J
Gvf5ajQdOLsc8NT8p1dqnuqe1u0Xp3W7JWkdsyTNs+avdpVLR7/OcKvQXEztxD4ve15cUvOyz1JV
SuNBs5JSUmgrpFRTenmbDamQNO8+P0lS++/eyRoO33jIzHLAUzuxT6qndE3bsIa0vG5BSjUdaThi
enr8euQq+2jZdUFaRy9J+8CmlGrXcKnUi7SOWZL2wY0pLqpJ12uGptBQlcZDZqZtxLI07zEvXf7R
ua1gyw6L0t6/Kd3/NuIV+6p5vEcKB1Wlo1drWscsSc2jPde6HgAAAAAANq3NNuRZuHBhDjnozeX7
1tYVV4wMG778LJGZM2eXr1+8+udXF16wQuiTJNdfd1O+9IWvZtHixascf/DgQamrq0uSdHR0pFQq
5dtnfz177rl7evbskf88/Ggu/f3lue66G9fo+5z6sQ+XA57GxsbccftdmTZ9Rl7zmp2yyy6vSZJ8
7nNn5K4778ljkx5foz7XVammIy1jO79/1Ywu6Xrd4KSU1DzRPUve/3Q6+rSkZedFqw95+jZ39jGn
PvX/GrDKti9o3nVBOvq1pPbhXmkb0phS3zVbBfWC9sGNad5rftoHNKXUtS2FpTWpmlmfunv7pWp2
3Wrfbx25NB29WpOOQmof6bVGY5ZqO9I+pDMQq36qe7r8vTNMqXm8Rzp6taRt5LJ09GtJR8/WFBev
JNh6XtugxrQNa1ijMVem/flQrWZSz1TN6Fw1VPtAn7SNWJaO/p0/i1JNR5r3m5Pah3qnau4q5qOt
kJpJPdOyy4I07zZfyAMAAAAAUIE225Cnvb09zz03ZaXPBg8ZlGOPPbp8f+2115evR45cHvK8NOBJ
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
ta18BlD70MY0DJ368heqS2k4amrqbx6Yugl9Xrnf+bXpduWwlLq0p23EsrSOWJq2EctSqm9PqaYj
TW+Yk+pnu6VqVv1K3y80vXK4tSZaxyxJ4xtnpFTb0bmi5u8DU/twr9W/uIG1jVyatuHL0u2ybTpX
Tb2hM4Csu7N/6ib2SeuIpWl804w07T0vtff1XSGQemEe1uWMJAAAAAAANq3NOuR5/wdOLAc8SXLm
Z774igFPkkybPj277PKaJEmpVMqBB+2fm/9xS5Jkjz12y9vfcVS57YR7J5avx44bk1GjOs/LaW5u
yd9vujmlUilXXXV1PvKRDyZJvvKVL+b00z6b5ubmDBk6OJ/81Knl9x944KFVfo8xY7bLlX/8fZKk
qbEpB+z/xsyfPz9tbe256867c8XWQ8ohz4tXCL0adXf1S91dK1/VUjWnPoWmqpTq259fFTMg6ehc
zdG2Tef5OsVFNSkufuWQp3XMkjQdOCtJUnt/39Td+/w5MIWkbfjyM3qqZtevcL+u2gc0p21050qb
6sndU/NIz87zfqpKaTx0Zlp2WpQk6ejd+oohT7GhqnOrumIppW4rhlurmq8kaRuxLA1HTkuKSWFZ
dbpdPixVc+te9fd61YqlNO4/OzVP9kj1lK4p1Xako0db0lZI/V39kvZCav/TKy27LUj7Vk3p6Nuy
wvy8MA/FlZw5BAAAAADA5m2z/ctuoVDIe95zfPm+vb09n/3cp/PZz336ZW0ffviRnPbJz2TG9Jm5
/V935vX77pNCoZALfvajPPnE5BSKhYwYsW35PJ9///uhXHXV1eX3j3zLm3LyyR9IksyZMzd/v+nm
JMkfLr0y73//e1NXV5dDDzso/7rjpkydOj2jR49KbW1tkmTWzNm5+KLfrvK7PPLIpCxYsCB9+vRJ
fZf6/OWvV+Tmf9ySRYsXZ+jQITn44APKbW+95V/rMl1rp62Qmkd7puV1C9I+sCnLjpmS6me7pnXM
0nT07Fx1UzuxT/nsnIa3TEvb1p1b3XX9y5BUT+2aqpn16ejWnhRLad5nbjp6t6S4oDZtI5emfXBn
25rJ3VNorEr9rQNSf+uAl5Wx5P89lY6+LSm0FtPzB2NWW3bT+M6ziopjl6T+9v4pLqlOR5/WtG/V
XG7zSgFPkqS9kKpZ9Wkf3Jj2QY1JXn5GzUoVksaDZybF5WO0jVmStjErbu9W83CvFBfXrHS+NpSW
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
mQzj4+N8//vf56WXXroi23Tq1CmCwUrz9Pe9731vyfrWs19sxf4nxGZcbQEecfWb83rp7+/lxiM3
Vs87e3p7uPsD72fswth2b54QQgghxJZ5+06HE9vmB49/nw98+H/n//q//wKD0UgqmWR2epbnn/+v
t+T+k9Ewl86cgnWUZ7palUulSkm74sZnZYa9s5jtbdidHvLZ7GU1LRaikayikFXWLoFzrcoo6U3N
iP7UrTDghGdPwbn5PtVD7koGz1oBHqj0hvnOd77D5z73OXK5HA899NCGt2El99xzDyaTiR//+Md8
97vfxWKxsH//fu6+++4tu4/ljh49ik6n46c//SkPPvggWq2W3bt386EPfahhP5OtXv65556r/v7M
M8/wzDPPVP++8847q4PYH/rQh3j++ed5+umniUQimM1mjh49yt13311zP8r8e76zs3PV+73//vvp
6Ojgl7/8Jd/4xjcwGAwcOXKkOjD+J3/yJ3g8Hl5++WW+9KUvodVq2bVrF3fffTeDg+t4o2yD2267
jQsXLjA6OsrnPvc5AB566CHc7surQXjvvfeSy+W4dOkSf/3Xf82BAwfYv38/r7/++lZsdo2DBw9y
+vRp/vVf/xVFUbjxxhu5//77q9f/0R/9ER0dHfzqV7/iK1/5Cs3Nzbjdbo4cOcLRo0e3fHsAXnjh
BaAS4L3hhhsa3uY3v/kN3/nOd2oue/LJJ3nyySfp7+/ni1/84obWt9794nL3PyGEeCuklQxP/egn
3H783dz1wXtobm4mm81x+vU3+NG/PbndmyeEEEIIsWVUFuPwWzol6rHv/S8A/uSP/s91L6OShKPr
0qEbDvHXf/e3/D9ffHi7N+VtSa3VUCoUt3szhLh6lRc6g5XnZw9XfpbLZSiX+PWLj23v9omryhe/
+EUSiQQPPPCADHILsUFHbrsflUpdKY03/7NSJm/JT1i135wQQqxmx44+3v+/Hefxxx7npf/8+XZv
jrhMZa79EpRCCCG23mbiDlejMqX5M6D1n/9I9ESItykJ8AghxNYIBoNEIhHuvPNOCfAIIYQQVymJ
EwshhBDieiXl2sS2iUai270JQgghxGVzOBw8+uij270ZQgghhFiFWq0mmbp+SwoLIYQQ4u1LMnnE
tpmcmASg2+2gSSd9YYQQ1waZBCqEEFeOfMYKIbZak06H025BpQJ/MLzdmyOEEEIIseUkk0dsO51O
w+6dXTTp5O0ohLgazHfiKVd+X+jDs/CvVCpRLksdcCGE2CoHh/tRqzWo1WpUKvX8T1XNv0p/noUl
JBQkhFi/fL6Iy92O1Wbb7k0RQgghhLgiZFRdbKs//u+f2O5NEEKIFdQGeyq/l1kI/MCD27VhQghx
XXnuZy/NN8tYGtBZCORIcEcIsRV+DiwcywkhhBBCXF8kyCO2TbFYJOyb3e7NEEKINZQX/68ODMgA
gRBCbJVI0DcfvlFRDeSoVEtCOhLcEUIIIYQQQoiVSE8eIYQQQgghxDaTQI4QQgghhBBCbIYEeYQQ
QgghhBBCCCGEEEIIIa5BEuQRQggh1ksmmgshxJar+2iVz1ohhBBCCCGEWDcJ8gghhBDroFr2l88X
3KYtEUKI60ftZ6l04RFCCCGEEEKIjZIgjxBCCLEqVcPfH/yfX3vrN0UIIa4zD/zPr1Ef0mn8uSuE
EEIIIYQQop4EeYQQQoiNmB9v/P4Tz/Bn/+MLktEjhBCb4PMF+fT/+AL/8sTT85eoan4IIYQQQggh
hFgf7XZvwHqUKW33JgghhHhbKy/7rfL/E088xRNPPNXgmtrfhBBCwEIEp3FRNlX1p4rykk9QifoI
IYQQQgghxGquiSCPEEIIsb1ULARtVEC5+ufi5YuDl4t/S5hHCCEqlvc1a3itaq3bCSGEEEIIIYRY
ToI8QgghxAapUFFWlZcEemB5sGfxNwn1CCHe7lYK1qhqflVJUEcIIYQQQgghNkyCPEIIIcS6LM3a
WR7oWbge6oM6MmgphBC1VHV/1gd45LNTCCGEEEIIIdZDgjxCCCHEujUK9FC5rC7Y04hk9Qgh3i7W
EaRRVf6rv6UEeIQQQgghhBBivSTII4QQQmzI8kBP5f9qsAdWieXIwKUQ4m1OtfhL409E+ZwUQggh
hBBCiI2QII8QQgixYbWBnoVLljYPl5wdIYSotXb4RgI8QgghhBBCCLFREuQRQgghNmWlHjy11woh
hFiLfGIKIYQQQgghxGZJkEcIIYS4LEsHJyV/Rwgh1kcCO0IIIYQQQgixFSTII4QQQmwZGbQUQggh
hBBCCCGEEG8d9XZvgBBCCCGEEEIIIYQQQgghhNi4bcvkeex7/2u77loIIYS4bOWylGYTQoitpFJJ
NqQQQgghhBBCbJSUaxNCCCE2YWEwUoI9QghxeSS4I4QQQgghhBCbp7IYh2V0SgghhBBCCCGEEEII
IYQQYhuVKaFCxUb6PktPHiGEEEIIIYQQQgghhBBCiGuQBHmEEEIIIYQQQgghhBBCCCGuQRLkEUII
IYQQQgghhBBCCCGEuAZJkEcIIYQQQgghhBBCCCGEEOIaJEEeIYQQQgghhBBCCCGEEEKIa5AEeYQQ
QgghhBBCCCGEEEIIIa5BEuQRQgghhBBCCCGEEEIIIYS4BkmQRwghhBBCCCGEEEIIIYQQ4hokQR4h
hBBCCCGEEEIIIYQQQohrkAR5hBBCCCGEEEIIIYQQQgghrkES5BFCCCGEEEIIIYQQQgghhLgGSZBH
CCGEEEIIIYQQQgghhBDiGiRBHiGEEEIIIYQQQgghhBBCiGuQBHmEEEIIIYQQQgghhBBCCCGuQRLk
EUIIIYQQQgghhBBCCCGEuAb9/xvJI8hKoX6DAAAAAElFTkSuQmCC

--------------0B24ALD6wmrYsnOJDLLhHRCu--

--------------Bcj7mpE08etgxGXkki6jo8oV--

