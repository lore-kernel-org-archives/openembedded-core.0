Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B458DFF60CB
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 05:56:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12239.1774927378393941878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 20:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=S4gQooIS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8550320415=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V208lZ4169760
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 02:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=GkmfYTYlGAbMnLXh97qKfIkdorGWsXe/7SMR7GFomxA=; b=S4gQooISsSpK
	Uxrxx5D8KPffq/Xh3Yvq1nGaYdAaqwSiwJu+uvicpS+l1KE2a5XcRDf6Vv6DIK/C
	Gin2BTU/+a5DIYQClRdo/PVVyYwrOnrL94otwDNOdFK2za78CEvRHpZorswaBOJh
	olm4Be8B8f1p+UnR3wRj/XLE3BAyiY19B5SiS2S+3oRgYzRAvrjfPCOHujLzTjtt
	RMTN0zUdaTARo3gZ3JIBevIVQjSJ73w0AF7yMoYbLUz9pe4kfUkDF8MBfvRgPbSy
	FHVNbWHlXtr/Hhc2L3g35zxqL6NT56EMnqnPJPr+rtrzErto5DRqD73v7+5BM9db
	TE5e4M0QcQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d65y4b17e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 02:57:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JH9j4A3hZTLBqqcnLBpmuTIudk9o3c9yPr5C6vq6NXEZd2ZTUmDmSzp9yStaYdG7Toyy29W+B6QYWazdrPlLea5b1C7fKPmA6pFftquczJHgGZWVWzZAX1mSfu6lfD/EhNOxQnW9xz+7PFt6FLlewhPUH4eYpqQDq97OSgDXOrpaemtYeWUwj6ZMnRoM9LHDSKvZo0zlP3WG+Xy901VaYqFrize/D6poSuVh61NEmJZUcwWC1EXQbI1LvrWlS5NHEvhlpflr2w677VNZdsf1W8oSEemIM8spdmcBysLWu85btH32JAF4xmxsYyQLNsMsbLWxS+dSF2w3hzqQIphP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkmfYTYlGAbMnLXh97qKfIkdorGWsXe/7SMR7GFomxA=;
 b=DIRMbubGN+VnwLCZV5n/7YzwTb+MZ3grtGgXS/6gDyt1abu1hQlDwCd/H+RYRRrvxSkWlhKNx8Dpzf+ZK5ZL+ETO1IPtwklWAwnIgSa8tjOQ2mbpbEu9RH8FqC+VCFcNOx8BUvEqnXoj7nvGdWJ/qsQsKVi3XZlYgWldwNHPclSpurkGpV8t1DKjcrFTS0Q4h293gbvVwddqSCidI8MLFNjsYneLWMg0j+B1wh3AX55osHQVPv51GuSpzCnDJiQnT2J/goigK1/bFEf3V1YhmEGdG7QYOJfdpqsBZvowf3t3ejon7sImmiKHznQ4g/eMgJuOJmWJpwHuBkaT8TgV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV8SPRMB0057.namprd11.prod.outlook.com (2603:10b6:408:242::5)
 by PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 02:57:53 +0000
Received: from LV8SPRMB0057.namprd11.prod.outlook.com
 ([fe80::1857:ba90:5ced:f888]) by LV8SPRMB0057.namprd11.prod.outlook.com
 ([fe80::1857:ba90:5ced:f888%2]) with mapi id 15.20.9745.012; Tue, 31 Mar 2026
 02:57:52 +0000
Message-ID: <20fd5dc4-ef85-49d6-931b-7a8ea3f94c04@windriver.com>
Date: Tue, 31 Mar 2026 10:57:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] grub: update search parameter
To: Paul Barker <paul@pbarker.dev>, xiangyu.chen@eng.windriver.com,
        openembedded-core@lists.openembedded.org, arindam.nath@amd.com
References: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
 <2c704d3b5aa8852a3d4e24143fdedb8f530517ae.camel@pbarker.dev>
From: Xiangyu Chen <xiangyu.chen@windriver.com>
In-Reply-To: <2c704d3b5aa8852a3d4e24143fdedb8f530517ae.camel@pbarker.dev>
X-ClientProxiedBy: IA4P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::13) To LV8SPRMB0057.namprd11.prod.outlook.com
 (2603:10b6:408:242::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8SPRMB0057:EE_|PH0PR11MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9b495a-51d0-4949-78a1-08de8ed14d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	RCHywKKWwoR/6iky43I0ON+an0x0nXzUr3a11OmaMg1uPdeveOQiTB+NP4TV1wy8Zo46K/rmLQbpeEqznS6ejyzX7GJ36nXNdNRsGV1kKqmtnvXGmkcFplmExOMPBkDuT1Ss1KXPbs7ya1hrxRyfmJxPNs0XBj5y5FLDY2aKgW1sGzKCxFH0sZ1EnjfQgN44J3SwKfvNqIgP2/dLetnLP+bvbthbwoWwFVAduy0mpzr+mGjD0Vg2FhAXgbxJwBcifb3gGcxBOoASifPNsfYs0DtOZTaX89HgNN1tZXqGuAShKjgcNHuU6jrsmF5hpQYj8bbIl0tyCJvpHLb5E5JwYQR9YBArNxc/XS6XuoJW9Bd+LNWNtgluhiT5WvzJ20gUnvVJRk2WPVj7ZA4m+k0j4s5KnL3CbB4ua7SF9jHAgJWauQwRKKLlliR2vbvrJtU9b1Ls2zeUxe1mZMjeZFRKMf1RU3yoGJekp13ZDomCF6UpjJClOXYDk2USPpiT78nnLlKJM1rzw8KJKBAqxFrQYhnpR/FczfzZ6Hk+q2Ggz+K79BlT6rL56ysHrcgaRYwFmbvb3JQSgWcqkvm7kcbsNa4eMfXdjjFvJgQi1wzC2IzfozWstsETm6VzCF4YfJs46gs1OnRFqfeONvy1+HlADl4oYxIhHRIB0EwZcO9yJX4goUCX3RiFG5DwmfDYEC8I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8SPRMB0057.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEtCTzY2TmxTNnEzb3htMHFWajgvWnBWa2hLTlhtRm1MREQrcmtVMFlHdjdD?=
 =?utf-8?B?ckpicmhQa0t6Vi9zSWtQVVBNRENGRlZucm95R20xL0tFSzFQWkpmNFpDUVdh?=
 =?utf-8?B?Z2dTN1ZoNGprUmMxaWNuL3NkVDVYcFk2UjZPL3gycWo3eWR4TW5mek14a3hP?=
 =?utf-8?B?aTJKa0pGc1VnMVdGYmk4QW1Ca3o1NEVYOVNWb3pHL3BYVzNxdGdtSzk2YWdo?=
 =?utf-8?B?dlowOHFVMTUyMDBmZFRES0FjSDdmcXlIN1VWVWdDcjhqbDJLYkw0TVJQcVRO?=
 =?utf-8?B?dUkwYkp4WlREWmF2OUNLVHRyK1NNY0xJcUVyNldCWmQzOC9wM2xteWtuL0th?=
 =?utf-8?B?ZlJOemoyckI2cXFrNUh5d0FieDdvVkRMbHFkZytFa0RROHpqS295Tmd5cDU0?=
 =?utf-8?B?QmpMblNrbVcxamdaQUFZeit2TlZlTnhscE0wMmorQTF6VzJWdjlwV3Vna3FT?=
 =?utf-8?B?ejlqaFgzak5BcE9DV2NDbWFPdE10WnAzejZreFBPTnZWOGtvWTJQa1ZmNThm?=
 =?utf-8?B?RG5EZi8vcnJBbnFqNnRDQXNnN1ZENTlxSk0vTmJ1V1NsRHN0Mit2bCtlN1Z3?=
 =?utf-8?B?RFBvRDQ1czcwYlBPK3VDQnlud2tnL0txbVVXZDRsNW5hOVMvQk05TDliL1Y5?=
 =?utf-8?B?TjdmNXhtUk02TUtuSHdCQXJkbkxGWVVmSjdIYWk2RmQ4NDF4c2RNRXM1S3NI?=
 =?utf-8?B?VUJiQmhUWW84dGhOU0t5T0NjK2RoM1NlamhWdjJEbnY3bmM3aFVrUml3SEds?=
 =?utf-8?B?MDVBMTI1TWFVZW5HUlBIQnpqdFM2Uisrc25xNXEvVkc0SlptVnVFSzdxYmxr?=
 =?utf-8?B?ZExDUkFHL2w1R1RNQkgwalh4YkJjT0tPVmJYbXJqOWh2Q2Z5c05GdGpyZTlw?=
 =?utf-8?B?UXlBWWkzUDIrdnpUSVBRWVl5amJIbWJxTng1d3k5dGoyaU1QRmxNZkRZcFhD?=
 =?utf-8?B?T0hIU3FaZ2wreldIdVhuN3RRSE1vck9aV1lwNzlvdmxMVnNnWlF0aDI1QzF6?=
 =?utf-8?B?MWdGMU1jZ0RzVStPMmYwTEVFMUduaVdsMSt2OXgrT1M2UmtrSm4yVGRKQ0Zv?=
 =?utf-8?B?Vkd2aFl0OUZlWVZBREsvZ0s5TitjUnN4UXRZYzNmaGxtK0VNYXcvcC9ON1or?=
 =?utf-8?B?UzZIaE5iS3prdEpQTnFEcmpEN1ZnRG0zK0hyNGxzQVBHS1Y5NERYMXgyUVBG?=
 =?utf-8?B?RXE0cWY0V2xnSHFuVlVZMlY2cW03Y0o1WHJlYlhiVFJWUVhHZWhnR045RFFN?=
 =?utf-8?B?b29oUS9jYXIwK29qWXAvdU96MTB2NGNhbXZBbFVvNlUwSFdYejczWEYrblVq?=
 =?utf-8?B?UHB3VUlMMDVsNzNRSmhuK1FDTEFPWStpNVRKRCtsd2tSZHhZVE52aC9kQWlY?=
 =?utf-8?B?VVNHVEhDRkNQRW40dUJ4elFCdXZqQnRCT2lrWmdjZ2JnNW9KVDd6WjlxNjJj?=
 =?utf-8?B?K2ZtZUVDOUJmNUVZMFlGY1ZScHpoWVZjUzJHeDFXU05jUlJ6VGo5QVlmQUp5?=
 =?utf-8?B?M0NaOFI0L1MxZm9CaFo1RDdCKzA5SDBmUDNsbU0wM2VrSEhLMTk4WERGQUFE?=
 =?utf-8?B?ekpCcXJNQ0h6Rmt0c053WDlxS1ZySW42NXMzSEVEbllidlVwOFBaUVBNVVg4?=
 =?utf-8?B?MFRBcmx1ZFUwU1EvWVRHR2I1NEJReFhLdHRQdmlSUWFUUHdvTW9rV0hFallG?=
 =?utf-8?B?RC9JVEJkZkhGa2JERFhRTG1yS2xVMEc1SWZXbWdLY2ZsMzAwV0Z1d0xIdmh0?=
 =?utf-8?B?MEpyRGtnQTV1WHc5WWh5eDZ1YSsxcEg4UWdPb3doZUhTSTBNdnphKzZ6allX?=
 =?utf-8?B?Z08xR21lTTJMOU45Q0VjUi94STFWc0QzbWtUWGZCTG9Gb01FT0oxRVVPeWJG?=
 =?utf-8?B?azRTclVSM0s3b1FFWWl1YWVHZHFYekxIM09VTTEyOVBhdzg0RFRORHNwdFdi?=
 =?utf-8?B?eVJiUkIzbWNTL1ZHWUxkbUNKektnNGFmSzEwTHdnVGI4UFQ2a1BVZ2tFQlpn?=
 =?utf-8?B?SWlTNG1hK25JTUd0UENFaWN5Q3lFaHdyemcrQi96eG1adXJQOFVscko2UWxL?=
 =?utf-8?B?S3U1U0JpUUV0Snl4RXg3Wlpyc0tXVURxSi9rU25WdXVCRkd2b0V2ZEFmZUw1?=
 =?utf-8?B?Z0tPOS8zaVdsMWxQVUthUCtIVGxuNWZQd1UwZ1RRMmUrL0J3QjUrQmFmYWN5?=
 =?utf-8?B?ZFR3ZS9PRUkvODl5eGZxckVkZ1ppNDFhOHhVUGpEUklGcjc2ZTZLV051bFBX?=
 =?utf-8?B?RFRUZEU1eG1NdEhSVzI5SG5xaE5oVTByK1J6V251am1YRjBwNXFIUWZxanpR?=
 =?utf-8?B?bGhpYlJzZ01aVFl5S3ViWmVKOW4xeGdxNFZyTWE1dHJkV0tkQldPRkxabVZz?=
 =?utf-8?Q?J6JvXQaq1hu1rfTY=3D?=
X-Exchange-RoutingPolicyChecked: 
	XNF83Ng52rPwwrLLxi/bVEobBV8AFmZ2UFOjq0i6kXwCeD6zq+hQBRj3kqqEjD4uvywmbgvf2NWzNdF0PqPy1TcfqX8w6uJo4xM77bjaNmeja9kXs4ljmEGY7tluJU1yfaGU2d6GGWqJH5izOtIJama6TWKVu0qh/zSFCh1kAG46Js/ZZPxr9Fk6LBrxe67DRas11HPjxljawxIpvEuKIrQcpNOYWlEIFu1b08CJtB2OiibK8Ef6to1UMR7sGrbRRR+L7dxA3g9j8DwqaY1aSvg29ZvfhoRvN4/xUMoJbE4CVzC6gCCwHL6Xmv9RI4/P2ahfGMmqZ5FQ6kLwzJxOlg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9b495a-51d0-4949-78a1-08de8ed14d14
X-MS-Exchange-CrossTenant-AuthSource: LV8SPRMB0057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:57:52.7121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VPFqbKNxIHV1Xz2WvxkO8+bF4QhTbRC230MThQA/tl3GZI3MwOl1T0kxynn8LuWY0e25PrGsXZdJqKcQUOQ2PntfYZhsyjP+y9AtNVOXWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=QaZrf8bv c=1 sm=1 tr=0 ts=69cb3834 cx=c_pps
 a=nW9vh20j/mJxMPy+qbWKBA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=P-IC7800AAAA:8 a=7qCwRQJ5XsZNJCK2LBUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAyNiBTYWx0ZWRfX+wOZ4bj7z1Q1
 vq7VXEGCvDecspf7WYk1px3sciyIC0UGtFKUE/47YmtlSSaV8wmhiFHuPiS+HzXAIRursH86WQk
 dHxd5i8DpqAd8F1xl8X8fBiGHI9g3Bcd5QZz3mjm5UEbfn4EEr4x+im/wHx0fH1G57qCega3gxV
 z+qKVYCnJ2j2C0WWfrvGlp5wD6hOTKQOA184I7fxFOPs2ri/wn3yDA5lMZ8S9Lo2Wnci2EJAeG/
 cKgEY/z7C7yqT6srOAHh+n62SWx5R7OBbSN+9X7Rx8yuJnT5yHNAi/eevQ/vqRvh3Qa2DiJIbn4
 LFiZraremo9lEKKHoxY7795YCWd7HjGxPySqAacDcVvbG9jZRvUEaQqsrEjjrX+h0efFlAl66YA
 XBiblW3O0V6ywRUf9nblDd2qam9Dtu3Wdc80RmoQpD05QAwkbOHoegKowaFKqSBNB0gnfTpyeug
 FxElUYKNN4eCkkBJwng==
X-Proofpoint-GUID: ESJuWSEsHRNOV0wCrHM5vH_MGXCi1KGs
X-Proofpoint-ORIG-GUID: axXd3w_EaqLFiDa2XQqyvIUx322OPDSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310026
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62V208lZ4169760
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 05:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234261

Hi Paul,


On 3/5/26 19:49, Paul Barker wrote:
> I'm not sure that this can work for all use cases. The grub
> documentatation for hints says "First try the device HINT" (i.e. it's
> explicitly a device), whereas the documentation for cmdpath says that i=
t
> is "an absolute directory name".
While the documentation defines $cmdpath as a directory and hints as=20
devices, grub=E2=80=99s internal implementation of
grub_disk_open (grub-core/kern/disk.c [1]) is designed to handle this=20
exact "device+path" format.

When a hint like (hd0,gpt1)/EFI/BOOT/ is passed, grub_disk_open calls=20
find_part_sep to locate the partition/path delimiter.
It then uses grub_memcpy to extract only the device part (e.g., (hd0)=20
into the raw buffer for the disk driver.

The remaining string (gpt1)/EFI/BOOT/) is passed to=20
grub_partition_probe, which identifies the partition and gracefully
ignores the trailing directory path.

The current syntax ($cmdpath) results in double parentheses ((hd0...))=20
if the variable is already populated.
In grub_disk_open, this extracts a malformed device name ((hd0 which no=20
driver can open, triggering a hard no such device error.


Ref:

[1]=20
https://elixir.bootlin.com/grub/grub-2.14/source/grub-core/kern/disk.c#L1=
92


Br,

Xiangyu


