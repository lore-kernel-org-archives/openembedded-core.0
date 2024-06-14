Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57579C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 10:13:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8290.1718360032025981640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 03:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6895365e9a=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E4K1PO021984
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 03:13:51 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2e2md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 03:13:51 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45EA9qX1026255
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 03:13:50 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2e2mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 03:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDphbz9m26XUbU2XXEDdQuyH2FBGYyI3wFZVcFMkG4IlYFg1ncuKgSYfgn6CDmftLESoS9vAAzC0HQeECBXjPEMwU84bF6XH2HVUubnNiX0D5v3soPKhJRhJYxiyCjUHbcmEhqrN46DJQv5UrkYOlns6K2FH4FxhCL9L+Uv3RQntkXnd3arOFieiFgPr5+kY4VFXjCCAeDlDyAmvyQuVI0Tt/HJWMXTz7only9IMwjb6UR4h1DKpiG3B/fkgT+tMqrbsxZO2r+pziPDxRFhKFVJf5pNbxF2hAXUkPX3fhL9fPexzctlWqi145x91FulCoAvYxqbQp4LzwrUE2ZcKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d1znUjevTgeOv/5RDqK6dKhaMM3n6qbQfH27xVmYiU=;
 b=Zas/ovzAuAyGzDqkyviD9oDnrzvpPPStbmUS/W78ekXj961J+kQ5Jan6HrUG1MYn018mFGTKUut9V549SRryzNpEBj8IafCWB5YRYhF99is4olZWNvK68+swFLGq+abw9XXyjUc9asjJ+oQ7zhJzfi9roOJV+tyumSiy6CmoDV7zqmc1dD/8jGHNLMFGzZGZwTFIyShz+K2a7LAxWMpAjtEtscBEC7wiNo/nCBfpSw32Yi44n2Yz9IIXkv3G7qvjw5WS21aGq8CStovwbanYVjjPB70/AOoYUvltPJ8NNbQgoUsiCrSLZWvujzp3i7YR0MYzHt91ClQwMhn/vreJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.23; Fri, 14 Jun
 2024 10:13:45 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%5]) with mapi id 15.20.7677.019; Fri, 14 Jun 2024
 10:13:43 +0000
Content-Type: multipart/alternative;
 boundary="------------30f8JsYyUTHKsfVdIT2zh0w0"
Message-ID: <1ebbd8f8-7dd8-492a-bec6-b4ed8058dcdf@windriver.com>
Date: Fri, 14 Jun 2024 15:43:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] rust: reproducibility issue fix with v1.76
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240614054959.3184774-1-Yash.Shinde@windriver.com>
 <20240614054959.3184774-3-Yash.Shinde@windriver.com>
 <CANNYZj8vFTCHZ=eN2U4py1vmxoWcaJaoj6+VHgho8xkj_Yv2jA@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj8vFTCHZ=eN2U4py1vmxoWcaJaoj6+VHgho8xkj_Yv2jA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 8766ef58-0068-45bd-044d-08dc8c5aabd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230036|376010|52116010|1800799021|366012|4022899005|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmgvejRxYXYrYjVBZ1F3ZnVzckxuMXBXYlNmOG5xc2UrbUF0cXpMbTl0UXo2?=
 =?utf-8?B?MVdVT2ZSbloxZHBpT2JkL28rbm9PZ1lTTTloRXdIVTM3ZW04cEpWdjlETDBz?=
 =?utf-8?B?Um9FaFF0aER5U2IwRHpXQVd3R2ZybGdJU3FCUFJIay9NOXVkQ0Q1M1JWVFBG?=
 =?utf-8?B?NzQxN1NUd1Nsd3hiOHFnQ3o2WGwvWXR2ZVJXQUpkYkhHcURVTzlaekRQejVG?=
 =?utf-8?B?Z21maEQxQWRzK0IzeWhLRDhDcnV2OE1TM0FJZnFXb3BISHdXZjFjQnQrcTBM?=
 =?utf-8?B?OG5SdW9DVit6aGo5aTFKMHZCc09yY0xyck9Tb3N1QnQ0aXRVak9IbE1HS0g1?=
 =?utf-8?B?aEx6U3RRckZwd3pNeXdDY1k4bHRKSVQ0aGJiUXpBVzJZZWRYcW1QMFBzRE1P?=
 =?utf-8?B?aWdXZm1BZDVWV253UXhnQmU5aHNMVWN1dVpXVHo4MWlyZFVXenF5a0lmTks4?=
 =?utf-8?B?cDhFelhRdTRFSHpuSVdRYVloeDBSbkI0WU9oamVac1NYclBuelFFZUJXSytZ?=
 =?utf-8?B?bHR6N1NMdC93TXRwbDJXc2dWM05uc0ZUT1UwVnVuUzhqK3pQNlpBczFvbWdu?=
 =?utf-8?B?U1R3ZXZySmdXcUtOOWFPZHk2Zk12emkvOVpaTzExZE81TmwvWFdUeVZPdzVF?=
 =?utf-8?B?c1JOOTBXUTRlSGZwTGN4a2xzUzhubVlzNHhqeWxKS2xVYjRUTW1DOXd6eTNS?=
 =?utf-8?B?d1RaWDdMRGRkdm1LZHlTQzVhZUZLVVU2UXBkcUxJc0NVcllFblI3VmxUaUJw?=
 =?utf-8?B?MnhESVprZUtveC9mNnhPYzVMQm5GZCt2WnQyY1NONmRnbHhuMFFoblNqVzQw?=
 =?utf-8?B?dGZ1VTRHTjZwRVZCcTk4UlJGT2cxRFk1WlZDNXVDTktyRXhVM2huT1lnSU44?=
 =?utf-8?B?LyttVzhkZVBCTWI2eU1sb0hpMnJZK3ZsR2I3TG1ERldhY2tkQzVOdi83aGhu?=
 =?utf-8?B?OHoyWVg5VDFpM3hza1dwZGxuM3MyV1RmQmNHbWZhYXRPbzRPdUJqR2IwbmNL?=
 =?utf-8?B?YWRoWWRPOXZiU1BHblZxZ2R1bllFUHpnL3p6MEpjSzRSZ1VrT2VDcVU1ZXZL?=
 =?utf-8?B?QUpQWUx6MTR0cHFKd0lSZEMvMWpTYW5LTGZXQUx3aWtSQU9SdENVc2ZFemtF?=
 =?utf-8?B?T29JdG9lRG5tWjJ2Y3NLNkVHL3ErdExMbmVYNGNCNXFvVkpsT0FPQ29pM2J5?=
 =?utf-8?B?K0hDNFpaS2FESlFrbGlYRllPWnZpVWJRNWNPblEzZkx4N0R0OWxZR0NHbU4v?=
 =?utf-8?B?RC9pL3VCWTNaWE5tVVRwaExkek5oSDZ1T1ppa0UzMVQrT3orZFNZZTZoaytv?=
 =?utf-8?B?NkZpSzN2dENNUjBWOTBlNzgyZk9iNVEzRnY4SmtGc2ZvUERlRk5nS1hMbE41?=
 =?utf-8?B?UUljUk9SRVAzUitQNGZqRVRJRmRJVzVqNkZpcFdTa0I3NDNhTm9tRGxLNVpa?=
 =?utf-8?B?Rk9xcHdXT1ppR0lSNmptR3BVMzFQNUFORVJIM1lSRi9YQ2xROGF4eklIQ1p0?=
 =?utf-8?B?YXlscnlDdkR1OWdvdVl1Sno3R0JTM1k2TGFrZFlvdHpWYTNDZVdhY3VMdzNB?=
 =?utf-8?B?TDdJLzhYSVZpM3dTKytvUUlrRk1XY3FtWllmNTQxSHIrb1EwR1puOFl0bXFm?=
 =?utf-8?B?SXUzYllISlczZ250WDFtalJqOExtRmVFOXZVV0JueFZKaWsxbnJKS3ZZUy9J?=
 =?utf-8?B?bGxlUExQSmhHcGg3ZTRVY1dPM201Q1NXTnh3N2NMU05WSFZ0VWdGMVhLajVF?=
 =?utf-8?Q?eVD8aLVoEDyPLlAt2FdxQMl2j+8u7fYRz+104cY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230036)(376010)(52116010)(1800799021)(366012)(4022899005)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bURzcmFVNnhTTGZQT2FqelhPaFp5S1NHRGFBZURRZ0twU2M1K3UrdU9ZQndt?=
 =?utf-8?B?UzZtZ2ZkaUhxbWl6TU1tUThMczNTMXlab251WjY1OHgrekROcW5XNk4zR1U0?=
 =?utf-8?B?d2dSWHEyRENFN1JGNkVPKzFPUjFCd3BLaVJnMW4xYmNPTGJGYWZZYnF2MmMx?=
 =?utf-8?B?TUNUT2I3bGJpRXlKd1RQbUxTejl3eUI0S3YwK016Ulkyb0hBUENSMExVM1Jn?=
 =?utf-8?B?R1FCRFlaSFJFdG5Odi9PT3NEWjU3c2N2NHpNMGtoRzhsYjFsb3EzYUR5NHRz?=
 =?utf-8?B?YWwvUCtESEpjYmFhUXhoQ21XNm14OE54b0NVZFMvNTZvQjJMRmhjVDdvcXE1?=
 =?utf-8?B?djVEZ1pWbHREVFNDaVMwbUIrclcyZWg2QWVuWE9SU2lCUk0rek1SS3ZmN1dm?=
 =?utf-8?B?TFpTakRMWkNpNUQ1L2k4c2RVQSttdloweDVnYXdwUTMxdWxCWThOeWdwK05O?=
 =?utf-8?B?ZGpyTERPQk9kL3hmWVhEUkg0MVJZeWtlYTJPblBxUmhHOEh0blRmTSt2WjZE?=
 =?utf-8?B?WXR0cEo5UExEalNWYXRTVkZndTJyODlVVzNxbmhLZlBPZFhVbzdvKy9vUVlx?=
 =?utf-8?B?QXFCeXhmWGJSditDUmVOb2hmdjFxdjl0aVBRbkoyZnkvZXgvQWRyYmxNM2pM?=
 =?utf-8?B?ZmRpUDBkQUxaalljSWRjWDJvN1ZpZXNWOEtBZEJUK2N4MmRneDNqZ1ZFZ0ZT?=
 =?utf-8?B?ekZQS2dUeFdQTVNMbFJYNmlMeDJ4Qy9DMks5eVlLczRrVHJCaUpPOEhqeldi?=
 =?utf-8?B?cHk5VldsY3hoRG43QjhKUmRwbkhydC90UzJreDZaSWt4SjhmV2tLQVUwYm9v?=
 =?utf-8?B?MENEZ1hEbnJEVjBUUndmRUMwUGgreU5pTWFhdjJNSit5NGs3WlAzaVUvWDlZ?=
 =?utf-8?B?Vi95SHlzclhvcGdHREZmZmpHWVVIT1o1dnozWXN1WVE5MjZSb2ZGL3pnN3R3?=
 =?utf-8?B?b1J6UVB5SHZwN01IemRPcDRFVXVSOXZOalV1NmV5eEJ0VlpSbUpKVmUrVDRO?=
 =?utf-8?B?aWc5T1NPYTdTSUNvNWFLR3VlMmI2cW1FbUFpKzhvaC9pR2hnUytoS3h2dGZO?=
 =?utf-8?B?VzVzbFVqTjdOcW1EWW9BdDdjKzlXRXpBeE10MktuaWdNZ0c4V2h1WVQvTytt?=
 =?utf-8?B?ZDRrWTRiK2kwL3JNY3VUblVFZm5WeWZvWkJucnlnWDBzMENWU0l2TGNmajZK?=
 =?utf-8?B?QnJ6RS9ZbFBQYUI5ZTF3Vy9TSk9sN3ZQTFYvVlU5cVU4TTQ4TWJPM2pHR0N4?=
 =?utf-8?B?Z2ZLaFJ1TDNqUXFvb1JUNUd5d2swd2hqYXlYb0RJN1U4TkVwcFJxVW5YSDNS?=
 =?utf-8?B?Mm1pc1BUOGhJRUhaRE9sejY0UEJaNW91SHYzMndHWWVzNzlxVkRsSjRkb1BY?=
 =?utf-8?B?VUhKeEkzTU9yck5YUm9YWElPMlVPREh2Z0Z4eHBUV3JXa2c5dHgxRUxuTFMw?=
 =?utf-8?B?N2M5Qmx4ek1GSTBJNlRqdDlGNUFHTVZtU2Q2NXZObDNsaGN2a21nVTV5NHM5?=
 =?utf-8?B?NXl2ZnlnemFzS24ydDRLSG1ZZjZlTDlvOHNWRVdBejloM0FSc0NxdHNEYmNk?=
 =?utf-8?B?VzlLUTJCU0Z6c3ZURTZIR0ZqOExKQU9QRTJFSG1iQkN4TXVybHVKVHRRL0F4?=
 =?utf-8?B?WW85Y1VkTUx2bk9EbTZRR1o5Zkh0VTNqS29qZTlNZDc2aGM5ZGhXWU9Sb01a?=
 =?utf-8?B?UGtVdGRIc2dyam5tWXpxUEpIc0E4RWNCT25RaVpoK2tYZHhybVRmUkFQL0Qx?=
 =?utf-8?B?ZEd3TW9ORXNUdktkVmJXSFczTmF6TlFOTFUvZUxmMUhTTFFtbjRRT3pUcVl0?=
 =?utf-8?B?TFYwOEtZbno0SE9rVjVucGtjaENOYkQ3clBHb1ZZaXdiaTlnYUxSdDB6Tith?=
 =?utf-8?B?Y1VGMy9yc1VTWUVuU1dkNEpVMW8wODhMSG9kenB6cm4zMFVzZ2t0SFNlV2xH?=
 =?utf-8?B?czVhdEhKeE1RSW9KUTFPNHNWUHRpRHBSTHVQRlVXNVU2OTVCNTNlcE5QM2I2?=
 =?utf-8?B?RE1rNkxIcy8yWUFIbFd0aDhKRHhNNnEvUC9vYzhIanltcFJHUDFzSlhSL2Ju?=
 =?utf-8?B?SWNKN2dLV1JpeEJicm9Fd1J2ZlhONUJnNWdGQWpUS0JmK201Vko4dHV2YkRr?=
 =?utf-8?B?djNvb2NoK2wrY2VTVEEzUUtWZWpmWkx0aUpRNEYya081RXFnclJxZXRvb3BS?=
 =?utf-8?Q?Px1S9iwp/qj6eusycMO8NsQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8766ef58-0068-45bd-044d-08dc8c5aabd0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 10:13:43.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hf3VzG52baHNOsnggb7UrQGRa+pRBRCp++n4Sn+CDbGgl9Y2Zr6r/YeEFQ8379klU8lDwtmFd/lDa7zMuqljeV5cmC3SzZcyAdOCg2DUp+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
X-Proofpoint-ORIG-GUID: ERt3bsL3pVRIATHG0zQFtwfRlf-5VdYU
X-Proofpoint-GUID: gf48UuGnB7XCLVq8WQfA1OOCRTX0ez_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406140070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 10:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200656

--------------30f8JsYyUTHKsfVdIT2zh0w0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxNC1KdW4tMjQgMTQ6NDEsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2Nv
dW50IQ0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUu
DQo+DQo+IElzIHRoZSBpc3N1ZSByZXBvcnRlZCB1cHN0cmVhbT8gVGhpcyBzaG91bGQgYmUg
ZG9uZSwgYW5kIHRoZSBsaW5rDQo+IGluY2x1ZGVkIGludG8gdGhlIGluYXBwcm9wcmlhdGUg
cGF0Y2guDQoNCkkgZ3Vlc3Mgbm8sIGluaXRpYWwgcGF0Y2ggd2FzIG1hZGUgd2l0aCANCiIv
MDAwMS1SZXZlcnQtTWFwLXNvdXJjZS1hYnNvbHV0ZS1wYXRocy10by1PVVRfRElSLWFzLXJl
bGF0LnBhdGNoLyIgDQoodGhhdCBpcyBhbHNvIC9JbmFwcHJvcHJpYXRlLykgYW5kIGJhc2Vk
IG9uIHRoZSBjaGFuZ2VzIGluIGNyYXRlICdjYycgSSANCnVwZGF0ZWQgdGhlIHBhdGNoIHRv
IGZpeCB0aGUgcmVwcm8gaXNzdWUuDQoNCkkgd2lsbCBjaGVjayBhbmQgcmVwb3J0IHRoZSBp
c3N1ZSB0byAnY2MnIGNyYXRlIGFib3V0IGJ1Z2d5IA0KY29tbWl0I2M0ZjQxNGY0NDliYjdj
ZmZiYTNiYzkyM2YyNzc3MDRkMWQwOGE4ZWMuDQoNCg0KVGhhbmtzLA0KDQpTdW5kZWVwIEsu
DQoNCj4NCj4gQWxleA0KPg0KPiBPbiBGcmksIDE0IEp1biAyMDI0IGF0IDA3OjUxLCBZYXNo
IFNoaW5kZSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8WWFzaC5TaGluZGU9d2lu
ZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiAgd3JvdGU6DQo+PiBGcm9tOiBZ
YXNoIFNoaW5kZTxZYXNoLlNoaW5kZUB3aW5kcml2ZXIuY29tPg0KPj4NCj4+IEEgZmV3IGNy
YXRlcyBhcmUgdXNpbmcgdGhlIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGUgJ2NjJyBjcmF0ZSBh
bmQNCj4+IHRoaXMgaXMgY2F1c2luZyB0aGUgZ2VuZXJhdGVkIG9iamVjdCBmaWxlIG5hbWVz
IGNvbnRhaW5pbmcgYSB1bmlxdWUgaGFzaG1hcCBpZC4NCj4+IFRoZSBoYXNobWFwIGFkZGl0
aW9uIHRvIGdlbmVyYXRlZCBmaWxlcyBpcyByZXZlcnRlZCBoZXJlLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFN1bmRlZXAgS09LS09OREE8c3VuZGVlcC5rb2trb25kYUB3aW5kcml2ZXIu
Y29tPg0KPj4gU2lnbmVkLW9mZi1ieTogWWFzaCBTaGluZGU8WWFzaC5TaGluZGVAd2luZHJp
dmVyLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi5lcHJvLWlzc3VlLWZpeC13aXRoLWNjLWNyYXRl
LWhhc2htYXAucGF0Y2ggfCA1OSArKysrKysrKysrKysrKysrKysrDQo+PiAgIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYyAgICB8ICAxICsNCj4+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9maWxlcy9yZXByby1pc3N1ZS1maXgtd2l0
aC1jYy1jcmF0ZS1oYXNobWFwLnBhdGNoDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydXN0L2ZpbGVzL3JlcHJvLWlzc3VlLWZpeC13aXRoLWNjLWNyYXRl
LWhhc2htYXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9maWxlcy9yZXBy
by1pc3N1ZS1maXgtd2l0aC1jYy1jcmF0ZS1oYXNobWFwLnBhdGNoDQo+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uMjBkN2UzZmMxNQ0KPj4gLS0tIC9k
ZXYvbnVsbA0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvZmlsZXMvcmVw
cm8taXNzdWUtZml4LXdpdGgtY2MtY3JhdGUtaGFzaG1hcC5wYXRjaA0KPj4gQEAgLTAsMCAr
MSw1OSBAQA0KPj4gK3J1c3Q6IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZSBmaXggd2l0aCB2MS43
Ng0KPj4gKw0KPj4gK0EgZmV3IGNyYXRlcyBhcmUgdXNpbmcgdGhlIHVwZGF0ZWQgdmVyc2lv
biBvZiB0aGUgJ2NjJyBjcmF0ZSBhbmQgdGhpcyBpcyBjYXVzaW5nIHRoZSBnZW5lcmF0ZWQg
b2JqZWN0IGZpbGUgbmFtZXMgY29udGFpbmluZyBhIHVuaXF1ZSBoYXNobWFwIGlkLg0KPj4g
K1RoZSBoYXNobWFwIGFkZGl0aW9uIHRvIGdlbmVyYXRlZCBmaWxlcyBpcyByZXZlcnRlZCBo
ZXJlLg0KPj4gKw0KPj4gKw0KPj4gK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
cGF0Y2hlcyBuZWVkIHJld29ya10NCj4+ICtTaWduZWQtb2ZmLWJ5OiBTdW5kZWVwIEtPS0tP
TkRBPHN1bmRlZXAua29ra29uZGFAd2luZHJpdmVyLmNvbT4NCj4+ICstLS0NCj4+ICstLS0g
YS92ZW5kb3IvY2MtMS4wLjc5L3NyYy9saWIucnMNCj4+ICsrKysgYi92ZW5kb3IvY2MtMS4w
Ljc5L3NyYy9saWIucnMNCj4+ICtAQCAtNTYsMTIgKzU2LDExIEBADQo+PiArICMhW2FsbG93
KGRlcHJlY2F0ZWQpXQ0KPj4gKyAjIVtkZW55KG1pc3NpbmdfZG9jcyldDQo+PiArDQo+PiAr
LXVzZSBzdGQ6OmNvbGxlY3Rpb25zOjp7aGFzaF9tYXAsIEhhc2hNYXB9Ow0KPj4gKyt1c2Ug
c3RkOjpjb2xsZWN0aW9uczo6SGFzaE1hcDsNCj4+ICsgdXNlIHN0ZDo6ZW52Ow0KPj4gKyB1
c2Ugc3RkOjpmZmk6OntPc1N0ciwgT3NTdHJpbmd9Ow0KPj4gKyB1c2Ugc3RkOjpmbXQ6Ontz
ZWxmLCBEaXNwbGF5LCBGb3JtYXR0ZXJ9Ow0KPj4gKyB1c2Ugc3RkOjpmczsNCj4+ICstdXNl
IHN0ZDo6aGFzaDo6SGFzaGVyOw0KPj4gKyB1c2Ugc3RkOjppbzo6e3NlbGYsIEJ1ZlJlYWQs
IEJ1ZlJlYWRlciwgUmVhZCwgV3JpdGV9Ow0KPj4gKyB1c2Ugc3RkOjpwYXRoOjp7Q29tcG9u
ZW50LCBQYXRoLCBQYXRoQnVmfTsNCj4+ICsgdXNlIHN0ZDo6cHJvY2Vzczo6e0NoaWxkLCBD
b21tYW5kLCBTdGRpb307DQo+PiArQEAgLTEwMzcsMjQgKzEwMzYsNyBAQA0KPj4gKw0KPj4g
KyAgICAgICAgIGxldCBtdXQgb2JqZWN0cyA9IFZlYzo6bmV3KCk7DQo+PiArICAgICAgICAg
Zm9yIGZpbGUgaW4gc2VsZi5maWxlcy5pdGVyKCkgew0KPj4gKy0gICAgICAgICAgICBsZXQg
b2JqID0gaWYgZmlsZS5oYXNfcm9vdCgpIHsNCj4+ICstICAgICAgICAgICAgICAgIC8vIElm
IGBmaWxlYCBpcyBhbiBhYnNvbHV0ZSBwYXRoLCBwcmVmaXggdGhlIGBiYXNlbmFtZWANCj4+
ICstICAgICAgICAgICAgICAgIC8vIHdpdGggdGhlIGBkaXJuYW1lYCdzIGhhc2ggdG8gZW5z
dXJlIG5hbWUgdW5pcXVlbmVzcy4NCj4+ICstICAgICAgICAgICAgICAgIGxldCBiYXNlbmFt
ZSA9IGZpbGUNCj4+ICstICAgICAgICAgICAgICAgICAgICAuZmlsZV9uYW1lKCkNCj4+ICst
ICAgICAgICAgICAgICAgICAgICAub2tfb3JfZWxzZSh8fCBFcnJvcjo6bmV3KEVycm9yS2lu
ZDo6SW52YWxpZEFyZ3VtZW50LCAiZmlsZV9uYW1lKCkgZmFpbHVyZSIpKT8NCj4+ICstICAg
ICAgICAgICAgICAgICAgICAudG9fc3RyaW5nX2xvc3N5KCk7DQo+PiArLSAgICAgICAgICAg
ICAgICBsZXQgZGlybmFtZSA9IGZpbGUNCj4+ICstICAgICAgICAgICAgICAgICAgICAucGFy
ZW50KCkNCj4+ICstICAgICAgICAgICAgICAgICAgICAub2tfb3JfZWxzZSh8fCBFcnJvcjo6
bmV3KEVycm9yS2luZDo6SW52YWxpZEFyZ3VtZW50LCAicGFyZW50KCkgZmFpbHVyZSIpKT8N
Cj4+ICstICAgICAgICAgICAgICAgICAgICAudG9fc3RyaW5nX2xvc3N5KCk7DQo+PiArLSAg
ICAgICAgICAgICAgICBsZXQgbXV0IGhhc2hlciA9IGhhc2hfbWFwOjpEZWZhdWx0SGFzaGVy
OjpuZXcoKTsNCj4+ICstICAgICAgICAgICAgICAgIGhhc2hlci53cml0ZShkaXJuYW1lLnRv
X3N0cmluZygpLmFzX2J5dGVzKCkpOw0KPj4gKy0gICAgICAgICAgICAgICAgZHN0LmpvaW4o
Zm9ybWF0ISgiezowMTZ4fS17fSIsIGhhc2hlci5maW5pc2goKSwgYmFzZW5hbWUpKQ0KPj4g
Ky0gICAgICAgICAgICAgICAgICAgIC53aXRoX2V4dGVuc2lvbigibyIpDQo+PiArLSAgICAg
ICAgICAgIH0gZWxzZSB7DQo+PiArLSAgICAgICAgICAgICAgICBkc3Quam9pbihmaWxlKS53
aXRoX2V4dGVuc2lvbigibyIpDQo+PiArLSAgICAgICAgICAgIH07DQo+PiArKyAgICAgICAg
ICAgIGxldCBvYmogPSBkc3Quam9pbihmaWxlKS53aXRoX2V4dGVuc2lvbigibyIpOw0KPj4g
KyAgICAgICAgICAgICBsZXQgb2JqID0gaWYgIW9iai5zdGFydHNfd2l0aCgmZHN0KSB7DQo+
PiArICAgICAgICAgICAgICAgICBkc3Quam9pbihvYmouZmlsZV9uYW1lKCkub2tfb3JfZWxz
ZSh8fCB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgRXJyb3I6Om5ldyhFcnJvcktpbmQ6
OklPRXJyb3IsICJHZXR0aW5nIG9iamVjdCBmaWxlIGRldGFpbHMgZmFpbGVkLiIpDQo+PiAr
SW5kZXg6IHJ1c3RjLTEuNzcuMC1zcmMvdmVuZG9yL2NjLTEuMC43OS8uY2FyZ28tY2hlY2tz
dW0uanNvbg0KPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+ICstLS0gYS92ZW5kb3IvY2MtMS4wLjc5
Ly5jYXJnby1jaGVja3N1bS5qc29uDQo+PiArKysrIGIvdmVuZG9yL2NjLTEuMC43OS8uY2Fy
Z28tY2hlY2tzdW0uanNvbg0KPj4gK0BAIC0xICsxIEBADQo+PiArLXsiZmlsZXMiOnsiQ2Fy
Z28ubG9jayI6ImRkZGI5YzQ5MDU4ZDQxMWEwOThlOThkYzFjMDZlM2JjODlmODU5YTIwODBk
OTZjMTFiMTFhZWM2NzM5NGJiOGMiLCJDYXJnby50b21sIjoiMTk1M2E4YmM0Yjk4ZTM1MWZl
NzU5MTdjMTUxYjFlMDhhNDY1MzFkNTYyYWViYmEyNWE5MGFkZDRhYWRlY2FjMiIsIkxJQ0VO
U0UtQVBBQ0hFIjoiYTYwZWVhODE3NTE0NTMxNjY4ZDdlMDA3NjU3MzE0NDlmZTE0ZDA1OWQz
MjQ5ZTBiYzkzYjM2ZGU0NWY3NTlmMiIsIkxJQ0VOU0UtTUlUIjoiMzc4ZjU4NDBiMjU4ZTI3
NzljMzk0MThmM2YyZDdiMmJhOTZmMWM3OTE3ZGQ2YmUwNzEzZjg4MzA1ZGJkYTM5NyIsIlJF
QURNRS5tZCI6IjU4YWY1MTA2MzUyYWFmYTYyMTc1YTkwZjhhNWYyNWZhMTE0MDI4YmY5MDky
MjBkYzA3MzVkNzk3NDU5OTllYzEiLCJzcmMvYmluL2djYy1zaGltLnJzIjoiMzZkYzRlNDQ3
NDI4ZTczYzU0OGNjNzEwNmNhMWU4ZjI4MmMwOTg0NjNiMDE0ZTEzYTcyOWE0NDQ0NWRlNDg4
MCIsInNyYy9jb20ucnMiOiIyOWQwZGVlMDhhNjU2YWIxYTRjYzNlNWZlMjQ1NDJlMGZhYjVj
MTM3M2NiYzliMDUwNTlmNzU3MmNmOWI4MzEzIiwic3JjL2xpYi5ycyI6IjE3YTQ2NTk3MTBh
YTI5MGM0ZWQ5YzIzMDYzYzdiMjAyYzViY2YyYTg0ZGUzM2FhMWYwMWZjNmZkZWQ2OWExZjgi
LCJzcmMvcmVnaXN0cnkucnMiOiI5OGFlMmI3MTc4MWFjYzQ5Mjk3ZTU1NDRmYTBjZjA1OWY3
MzU2MzZmOGYxMzM4ZWRlZjhkYmY3MjMyNDQzOTQ1Iiwic3JjL3NldHVwX2NvbmZpZy5ycyI6
IjcyZGVhZjE5MjdjMGI3MTNmZDVjMmIyZDViOGYwZWEzYTMwM2EwMGZkYTE1Nzk0Mjc4OTVj
YWMyNmE5NDEyMmQiLCJzcmMvdnNfaW5zdGFuY2VzLnJzIjoiMmQzZjgyNzhhODAzYjBlNzA1
MmY0ZWViMTk3OWIyOWY5NjNkZDAxNDNmNDQ1OGUyY2I1ZjMzYzRlNWYwOTYzYiIsInNyYy93
aW5hcGkucnMiOiJlMTI4ZTk1YjJkMzlhZTdhMDJmNTRhN2UyNWQzM2M0ODhjMTQ3NTliOWYx
YTUwYTQ0OWUxMDU0NTg1Njk1MGMzIiwic3JjL3dpbmRvd3NfcmVnaXN0cnkucnMiOiIxZjk3
M2Y4MDRiNGI0NTFlNDhmZjZkOThjZTY2MDM1NTc3MmYxNjRkZmRmNzlhNmFlNTE0NjQ1Yzdj
NzY0MDA1IiwidGVzdHMvY2NfZW52LnJzIjoiZTAyYjNiMDgyNGFkMDM5YjQ3ZTQ0NjJjNWVm
NmRiZTZjODI0YzI4ZTc5NTNhZjk0YTBmMjhmN2I1MTU4MDQyZSIsInRlc3RzL2NmbGFncy5y
cyI6IjU3ZjA2ZWI1Y2UxNTU3ZTViNGEwMzJkMGM0NjczZTE4ZmJlNmY4ZDI2YzFkZWIxNTMx
MjZlMzY4Yjk2YjQxYjMiLCJ0ZXN0cy9jeHhmbGFncy5ycyI6ImMyYzZjNmQ4YTBkNzE0NjYx
NmZhMWNhZWQyNjg3NmVlN2JjOWZjZmZmZDUyNWViNDc0MzU5M2NhZGU1ZjMzNzEiLCJ0ZXN0
cy9zdXBwb3J0L21vZC5ycyI6ImEzYzhkMTE2OTczYmIxNjA2NmJmNmVjNGRlNTE0MzE4M2Y5
N2RlN2FhZDA4NWQ4NWY4MTE4YTJlYWFjM2UxZTAiLCJ0ZXN0cy90ZXN0LnJzIjoiNjFmYjM1
YWU2ZGQ1Y2Y1MDZhZGEwMDBiZGQ4MmM5MmU5ZjhlYWM5Y2MwNTNiNjNlODNkM2Y4OTc0MzZm
YmY4ZiJ9LCJwYWNrYWdlIjoiNTBkMzA5MDYyODYxMjFkOTViZTNkNDc5NTMzYjQ1OGY4NzQ5
M2IzMGE0YjVmNzlhNjA3ZGI4ZjVkMTFhYTkxZiJ9DQo+PiArXCBObyBuZXdsaW5lIGF0IGVu
ZCBvZiBmaWxlDQo+PiArK3siZmlsZXMiOnsiQ2FyZ28ubG9jayI6ImRkZGI5YzQ5MDU4ZDQx
MWEwOThlOThkYzFjMDZlM2JjODlmODU5YTIwODBkOTZjMTFiMTFhZWM2NzM5NGJiOGMiLCJD
YXJnby50b21sIjoiMTk1M2E4YmM0Yjk4ZTM1MWZlNzU5MTdjMTUxYjFlMDhhNDY1MzFkNTYy
YWViYmEyNWE5MGFkZDRhYWRlY2FjMiIsIkxJQ0VOU0UtQVBBQ0hFIjoiYTYwZWVhODE3NTE0
NTMxNjY4ZDdlMDA3NjU3MzE0NDlmZTE0ZDA1OWQzMjQ5ZTBiYzkzYjM2ZGU0NWY3NTlmMiIs
IkxJQ0VOU0UtTUlUIjoiMzc4ZjU4NDBiMjU4ZTI3NzljMzk0MThmM2YyZDdiMmJhOTZmMWM3
OTE3ZGQ2YmUwNzEzZjg4MzA1ZGJkYTM5NyIsIlJFQURNRS5tZCI6IjU4YWY1MTA2MzUyYWFm
YTYyMTc1YTkwZjhhNWYyNWZhMTE0MDI4YmY5MDkyMjBkYzA3MzVkNzk3NDU5OTllYzEiLCJz
cmMvYmluL2djYy1zaGltLnJzIjoiMzZkYzRlNDQ3NDI4ZTczYzU0OGNjNzEwNmNhMWU4ZjI4
MmMwOTg0NjNiMDE0ZTEzYTcyOWE0NDQ0NWRlNDg4MCIsInNyYy9jb20ucnMiOiIyOWQwZGVl
MDhhNjU2YWIxYTRjYzNlNWZlMjQ1NDJlMGZhYjVjMTM3M2NiYzliMDUwNTlmNzU3MmNmOWI4
MzEzIiwic3JjL2xpYi5ycyI6ImRmYjM2YjE3MzYyZTlhNWIyNjZjYjE5YTIyOWQ5ODJlOGMw
YmJhNzg0YjFlOTk3NjlmNjkwNjkyYjBjZDVjNGUiLCJzcmMvcmVnaXN0cnkucnMiOiI5OGFl
MmI3MTc4MWFjYzQ5Mjk3ZTU1NDRmYTBjZjA1OWY3MzU2MzZmOGYxMzM4ZWRlZjhkYmY3MjMy
NDQzOTQ1Iiwic3JjL3NldHVwX2NvbmZpZy5ycyI6IjcyZGVhZjE5MjdjMGI3MTNmZDVjMmIy
ZDViOGYwZWEzYTMwM2EwMGZkYTE1Nzk0Mjc4OTVjYWMyNmE5NDEyMmQiLCJzcmMvdnNfaW5z
dGFuY2VzLnJzIjoiMmQzZjgyNzhhODAzYjBlNzA1MmY0ZWViMTk3OWIyOWY5NjNkZDAxNDNm
NDQ1OGUyY2I1ZjMzYzRlNWYwOTYzYiIsInNyYy93aW5hcGkucnMiOiJlMTI4ZTk1YjJkMzlh
ZTdhMDJmNTRhN2UyNWQzM2M0ODhjMTQ3NTliOWYxYTUwYTQ0OWUxMDU0NTg1Njk1MGMzIiwi
c3JjL3dpbmRvd3NfcmVnaXN0cnkucnMiOiIxZjk3M2Y4MDRiNGI0NTFlNDhmZjZkOThjZTY2
MDM1NTc3MmYxNjRkZmRmNzlhNmFlNTE0NjQ1YzdjNzY0MDA1IiwidGVzdHMvY2NfZW52LnJz
IjoiZTAyYjNiMDgyNGFkMDM5YjQ3ZTQ0NjJjNWVmNmRiZTZjODI0YzI4ZTc5NTNhZjk0YTBm
MjhmN2I1MTU4MDQyZSIsInRlc3RzL2NmbGFncy5ycyI6IjU3ZjA2ZWI1Y2UxNTU3ZTViNGEw
MzJkMGM0NjczZTE4ZmJlNmY4ZDI2YzFkZWIxNTMxMjZlMzY4Yjk2YjQxYjMiLCJ0ZXN0cy9j
eHhmbGFncy5ycyI6ImMyYzZjNmQ4YTBkNzE0NjYxNmZhMWNhZWQyNjg3NmVlN2JjOWZjZmZm
ZDUyNWViNDc0MzU5M2NhZGU1ZjMzNzEiLCJ0ZXN0cy9zdXBwb3J0L21vZC5ycyI6ImEzYzhk
MTE2OTczYmIxNjA2NmJmNmVjNGRlNTE0MzE4M2Y5N2RlN2FhZDA4NWQ4NWY4MTE4YTJlYWFj
M2UxZTAiLCJ0ZXN0cy90ZXN0LnJzIjoiNjFmYjM1YWU2ZGQ1Y2Y1MDZhZGEwMDBiZGQ4MmM5
MmU5ZjhlYWM5Y2MwNTNiNjNlODNkM2Y4OTc0MzZmYmY4ZiJ9LCJwYWNrYWdlIjoiNTBkMzA5
MDYyODYxMjFkOTViZTNkNDc5NTMzYjQ1OGY4NzQ5M2IzMGE0YjVmNzlhNjA3ZGI4ZjVkMTFh
YTkxZiJ9DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVz
dC1zb3VyY2UuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2Uu
aW5jDQo+PiBpbmRleCA2Yjc0MTRiNWMxLi5lNjhiYzE4YzlmIDEwMDY0NA0KPj4gLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jDQo+PiArKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LXNvdXJjZS5pbmMNCj4+IEBAIC0xMCw2
ICsxMCw3IEBAIFNSQ19VUkkgKz0iaHR0cHM6Ly9zdGF0aWMucnVzdC1sYW5nLm9yZy9kaXN0
L3J1c3RjLSR7UlVTVF9WRVJTSU9OfS1zcmMudGFyLnh6O24gDQo+PiBmaWxlOi8vcmVwcm8t
aXNzdWUtZml4LXdpdGgtdjE3NS5wYXRjaDtwYXRjaGRpcj0ke1JVU1RTUkN9IFwgDQo+PiBm
aWxlOi8vMDAwMS1jYXJnby1kby1ub3Qtd3JpdGUtaG9zdC1pbmZvcm1hdGlvbi1pbnRvLWNv
bXBpbGF0aW9uLnBhdGNoO3BhdGNoZGlyPSR7UlVTVFNSQ30gDQo+PiBcIGZpbGU6Ly9ydXN0
LW9lLXNlbGZ0ZXN0LnBhdGNoO3BhdGNoZGlyPSR7UlVTVFNSQ30gXCArIA0KPj4gZmlsZTov
L3JlcHJvLWlzc3VlLWZpeC13aXRoLWNjLWNyYXRlLWhhc2htYXAucGF0Y2g7cGF0Y2hkaXI9
JHtSVVNUU1JDfSANCj4+IFwgIg0KPj4gICBTUkNfVVJJW3J1c3Quc2hhMjU2c3VtXSA9ICI4
MDU0ODJiNDM2NDQyYTY3ODZkMjcwY2FjYmFiOGYwMDUyOWUwNjE0MWIyN2I3ZmIwMTkwOWI5
N2NlNGYzNDY0Ig0KPj4NCj4+IC0tDQo+PiAyLjQzLjANCj4+DQo+Pg0KPj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMDA2NDcpOmh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2Uv
MjAwNjQ3DQo+PiBNdXRlIFRoaXMgVG9waWM6aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL210LzEwNjY2NTkwMC8xNjg2NDg5DQo+PiBHcm91cCBPd25lcjpvcGVuZW1iZWRkZWQt
Y29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PiBVbnN1YnNjcmliZTpodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiAg
W2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
Pj4NCg==
--------------30f8JsYyUTHKsfVdIT2zh0w0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 14-Jun-24 14:41, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8vFTCHZ=3DeN2U4py1vmxoWcaJ=
aoj6+VHgho8xkj_Yv2jA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes from=
 a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Is the issue reported upstream? This should be done, and the link
included into the inappropriate patch.</pre>
    </blockquote>
    <p>I guess no, initial patch was made with &quot;<i>0001-Revert-Map-sou=
rce-absolute-paths-to-OUT_DIR-as-relat.patch</i>&quot;
      (that is also <i>Inappropriate</i>) and based on the changes in
      crate 'cc' I updated the patch to fix the repro issue.</p>
    <p>I will check and report the issue to 'cc' crate about buggy
      commit#c4f414f449bb7cffba3bc923f277704d1d08a8ec.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Sundeep K.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8vFTCHZ=3DeN2U4py1vmxoWcaJ=
aoj6+VHgho8xkj_Yv2jA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Alex

On Fri, 14 Jun 2024 at 07:51, Yash Shinde via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde=3Dwindriver.c=
om@lists.openembedded.org">&lt;Yash.Shinde=3Dwindriver.com@lists.openembedd=
ed.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Sh=
inde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

A few crates are using the updated version of the 'cc' crate and
this is causing the generated object file names containing a unique hashmap=
 id.
The hashmap addition to generated files is reverted here.

Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:sundeep.kokkonda@windriver.com">&lt;sundeep.kokkonda@windriver.com&g=
t;</a>
Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/repro-issue-fix-with-c=
c-crate-hashmap.patch

diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch
new file mode 100644
index 0000000000..20d7e3fc15
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
@@ -0,0 +1,59 @@
+rust: reproducibility issue fix with v1.76
+
+A few crates are using the updated version of the 'cc' crate and this is c=
ausing the generated object file names containing a unique hashmap id.
+The hashmap addition to generated files is reverted here.
+
+
+Upstream-Status: Inappropriate [patches need rework]
+Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sundeep.kokkonda@windriver.com">&lt;sundeep.kokkonda@windriver.com&=
gt;</a>
+---
+--- a/vendor/cc-1.0.79/src/lib.rs
++++ b/vendor/cc-1.0.79/src/lib.rs
+@@ -56,12 +56,11 @@
+ #![allow(deprecated)]
+ #![deny(missing_docs)]
+
+-use std::collections::{hash_map, HashMap};
++use std::collections::HashMap;
+ use std::env;
+ use std::ffi::{OsStr, OsString};
+ use std::fmt::{self, Display, Formatter};
+ use std::fs;
+-use std::hash::Hasher;
+ use std::io::{self, BufRead, BufReader, Read, Write};
+ use std::path::{Component, Path, PathBuf};
+ use std::process::{Child, Command, Stdio};
+@@ -1037,24 +1036,7 @@
+
+         let mut objects =3D Vec::new();
+         for file in self.files.iter() {
+-            let obj =3D if file.has_root() {
+-                // If `file` is an absolute path, prefix the `basename`
+-                // with the `dirname`'s hash to ensure name uniqueness.
+-                let basename =3D file
+-                    .file_name()
+-                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgument,=
 &quot;file_name() failure&quot;))?
+-                    .to_string_lossy();
+-                let dirname =3D file
+-                    .parent()
+-                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgument,=
 &quot;parent() failure&quot;))?
+-                    .to_string_lossy();
+-                let mut hasher =3D hash_map::DefaultHasher::new();
+-                hasher.write(dirname.to_string().as_bytes());
+-                dst.join(format!(&quot;{:016x}-{}&quot;, hasher.finish(),=
 basename))
+-                    .with_extension(&quot;o&quot;)
+-            } else {
+-                dst.join(file).with_extension(&quot;o&quot;)
+-            };
++            let obj =3D dst.join(file).with_extension(&quot;o&quot;);
+             let obj =3D if !obj.starts_with(&amp;dst) {
+                 dst.join(obj.file_name().ok_or_else(|| {
+                     Error::new(ErrorKind::IOError, &quot;Getting object f=
ile details failed.&quot;)
+Index: rustc-1.77.0-src/vendor/cc-1.0.79/.cargo-checksum.json
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/vendor/cc-1.0.79/.cargo-checksum.json
++++ b/vendor/cc-1.0.79/.cargo-checksum.json
+@@ -1 +1 @@
+-{&quot;files&quot;:{&quot;Cargo.lock&quot;:&quot;dddb9c49058d411a098e98dc=
1c06e3bc89f859a2080d96c11b11aec67394bb8c&quot;,&quot;Cargo.toml&quot;:&quot=
;1953a8bc4b98e351fe75917c151b1e08a46531d562aebba25a90add4aadecac2&quot;,&qu=
ot;LICENSE-APACHE&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249=
e0bc93b36de45f759f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c3=
9418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&=
quot;58af5106352aafa62175a90f8a5f25fa114028bf909220dc0735d79745999ec1&quot;=
,&quot;src/bin/gcc-shim.rs&quot;:&quot;36dc4e447428e73c548cc7106ca1e8f282c0=
98463b014e13a729a44445de4880&quot;,&quot;src/com.rs&quot;:&quot;29d0dee08a6=
56ab1a4cc3e5fe24542e0fab5c1373cbc9b05059f7572cf9b8313&quot;,&quot;src/lib.r=
s&quot;:&quot;17a4659710aa290c4ed9c23063c7b202c5bcf2a84de33aa1f01fc6fded69a=
1f8&quot;,&quot;src/registry.rs&quot;:&quot;98ae2b71781acc49297e5544fa0cf05=
9f735636f8f1338edef8dbf7232443945&quot;,&quot;src/setup_config.rs&quot;:&qu=
ot;72deaf1927c0b713fd5c2b2d5b8f0ea3a303a00fda1579427895cac26a94122d&quot;,&=
quot;src/vs_instances.rs&quot;:&quot;2d3f8278a803b0e7052f4eeb1979b29f963dd0=
143f4458e2cb5f33c4e5f0963b&quot;,&quot;src/winapi.rs&quot;:&quot;e128e95b2d=
39ae7a02f54a7e25d33c488c14759b9f1a50a449e10545856950c3&quot;,&quot;src/wind=
ows_registry.rs&quot;:&quot;1f973f804b4b451e48ff6d98ce660355772f164dfdf79a6=
ae514645c7c764005&quot;,&quot;tests/cc_env.rs&quot;:&quot;e02b3b0824ad039b4=
7e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e&quot;,&quot;tests/cflags.rs=
&quot;:&quot;57f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41=
b3&quot;,&quot;tests/cxxflags.rs&quot;:&quot;c2c6c6d8a0d7146616fa1caed26876=
ee7bc9fcfffd525eb4743593cade5f3371&quot;,&quot;tests/support/mod.rs&quot;:&=
quot;a3c8d116973bb16066bf6ec4de5143183f97de7aad085d85f8118a2eaac3e1e0&quot;=
,&quot;tests/test.rs&quot;:&quot;61fb35ae6dd5cf506ada000bdd82c92e9f8eac9cc0=
53b63e83d3f897436fbf8f&quot;},&quot;package&quot;:&quot;50d30906286121d95be=
3d479533b458f87493b30a4b5f79a607db8f5d11aa91f&quot;}
+\ No newline at end of file
++{&quot;files&quot;:{&quot;Cargo.lock&quot;:&quot;dddb9c49058d411a098e98dc=
1c06e3bc89f859a2080d96c11b11aec67394bb8c&quot;,&quot;Cargo.toml&quot;:&quot=
;1953a8bc4b98e351fe75917c151b1e08a46531d562aebba25a90add4aadecac2&quot;,&qu=
ot;LICENSE-APACHE&quot;:&quot;a60eea817514531668d7e00765731449fe14d059d3249=
e0bc93b36de45f759f2&quot;,&quot;LICENSE-MIT&quot;:&quot;378f5840b258e2779c3=
9418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397&quot;,&quot;README.md&quot;:&=
quot;58af5106352aafa62175a90f8a5f25fa114028bf909220dc0735d79745999ec1&quot;=
,&quot;src/bin/gcc-shim.rs&quot;:&quot;36dc4e447428e73c548cc7106ca1e8f282c0=
98463b014e13a729a44445de4880&quot;,&quot;src/com.rs&quot;:&quot;29d0dee08a6=
56ab1a4cc3e5fe24542e0fab5c1373cbc9b05059f7572cf9b8313&quot;,&quot;src/lib.r=
s&quot;:&quot;dfb36b17362e9a5b266cb19a229d982e8c0bba784b1e99769f690692b0cd5=
c4e&quot;,&quot;src/registry.rs&quot;:&quot;98ae2b71781acc49297e5544fa0cf05=
9f735636f8f1338edef8dbf7232443945&quot;,&quot;src/setup_config.rs&quot;:&qu=
ot;72deaf1927c0b713fd5c2b2d5b8f0ea3a303a00fda1579427895cac26a94122d&quot;,&=
quot;src/vs_instances.rs&quot;:&quot;2d3f8278a803b0e7052f4eeb1979b29f963dd0=
143f4458e2cb5f33c4e5f0963b&quot;,&quot;src/winapi.rs&quot;:&quot;e128e95b2d=
39ae7a02f54a7e25d33c488c14759b9f1a50a449e10545856950c3&quot;,&quot;src/wind=
ows_registry.rs&quot;:&quot;1f973f804b4b451e48ff6d98ce660355772f164dfdf79a6=
ae514645c7c764005&quot;,&quot;tests/cc_env.rs&quot;:&quot;e02b3b0824ad039b4=
7e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e&quot;,&quot;tests/cflags.rs=
&quot;:&quot;57f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41=
b3&quot;,&quot;tests/cxxflags.rs&quot;:&quot;c2c6c6d8a0d7146616fa1caed26876=
ee7bc9fcfffd525eb4743593cade5f3371&quot;,&quot;tests/support/mod.rs&quot;:&=
quot;a3c8d116973bb16066bf6ec4de5143183f97de7aad085d85f8118a2eaac3e1e0&quot;=
,&quot;tests/test.rs&quot;:&quot;61fb35ae6dd5cf506ada000bdd82c92e9f8eac9cc0=
53b63e83d3f897436fbf8f&quot;},&quot;package&quot;:&quot;50d30906286121d95be=
3d479533b458f87493b30a4b5f79a607db8f5d11aa91f&quot;}
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 6b7414b5c1..e68bc18c9f 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"h=
ttps://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile://r=
epro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC}\file://0001-cargo-do-n=
ot-write-host-information-into-compilation.patch;patchdir=3D${RUSTSRC}\file=
://rust-oe-selftest.patch;patchdir=3D${RUSTSRC}\+file://repro-issue-fix-wit=
h-cc-crate-hashmap.patch;patchdir=3D${RUSTSRC}\">&quot;https://static.rust-=
lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilati=
on.patch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
+            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
 &quot;</a>
 SRC_URI[rust.sha256sum] =3D &quot;805482b436442a6786d270cacbab8f00529e0614=
1b27b7fb01909b97ce4f3464&quot;

--
2.43.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#200647): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/200647">https://lis=
ts.openembedded.org/g/openembedded-core/message/200647</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.o=
penembedded.org/mt/106665900/1686489">https://lists.openembedded.org/mt/106=
665900/1686489</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openem=
bedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/ope=
nembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"mai=
lto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------30f8JsYyUTHKsfVdIT2zh0w0--

