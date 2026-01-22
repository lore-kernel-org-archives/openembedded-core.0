Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C32C44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 11:53:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35825.1769082833593497786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 03:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MVwzKW/3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5482c926bd=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M2TaBp4141464
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 03:53:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pIbJ/0ouLLeKnFTy59BpoaoRycxxNEuQlmZ5dfEH4SU=; b=
	MVwzKW/3Fq2vs4iartlIfM48edOOoecuuvhajxnu7MzsuksyLytTw/CJNmxaVxap
	SimkNcD8EGo1jQozD2ek2cIj5PBmbeEP882rtBzqBqiRkeKwkhxFrlR4mRG5FcvU
	son8WA5/XkKjSVTiZFQ3tue/St+7/9YWTlSa1+l6BfUP22N5lcTuFQHlP8l4ZRDe
	xiiZL68BU+kJ+riNVn4NkT20jPHQ0eEY5YdKprMSNss1rpJMaRfbgJcw3aIoFNsR
	IgAPiwimiN9W4hutLIavIW17GJZGdQzK1Jsphem1tzfzpdJbvk9EOFS3l6TtALRx
	t7BRoc6IhbYuGi3Ywnddlw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btnd72b0m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 03:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc1q+YItE7YyUtxeVikRc5N/fjBRHB9d/lzlGJBFG+epptZEv9qWn5OS3UHQ8fL+SFAfJPaxM6XTN6If78M15jqBx8o4s1uZ0PKWnl3obFSeFHV/SA0E1pdfRZ47bSj8Eg1sdkSt96lPy7S2vXdCmg9A/mTqyU0YzWS0T2yVTaibmuhQKQZ4HUrp/ZfSapuyAIXHwX5hU1ZLOTc7tO6rUfmG7P6wSbtrjxJT+9OeLt9YdVwzFiOYsGRyRX+tN5nlDWN5cMNjQShu57Kmj3HFW2c/mRTw9aPklo4OlEq0K2IFWaF93WltUpSeHbVwXvRdPTeWhT21n/22JPzUQHGZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIbJ/0ouLLeKnFTy59BpoaoRycxxNEuQlmZ5dfEH4SU=;
 b=G/SAWzdQcJ+7CROBG41e+iLZrRE5ZwKQHnMWylZ+PbLLWlfqdcUuIdGkOUOKKF0uGyEAlbRKiSujyLbNQ31HExHn3RQ5mAS/3XpA+Wi/mOTX7PHF8cd57Dr7zpXvBdvIsNkcGCkLG3q3IFt0Ve41yx6WRyQHTqymHNm/WpPQ5P3REtDElPm3g8DTHfSuNSAoT6Jdhrf5JUW1nGaK8xoKLij57AJWaQ40pK2nrKLBcdPuJacoZ7h40+DFSQnDOVrwjBUz3WYhKIAxXS79IuC7RQIZ30vwMXwuPw/2D9C6kYYnjtCxw6IIdMXeRhMcgb3oF3k30Rd4fe67AFBpqCLvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LV4PR11MB9490.namprd11.prod.outlook.com (2603:10b6:408:2e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 11:53:49 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 11:53:49 +0000
Message-ID: <ee399b5a-f8ca-453c-a451-c646766b61c8@windriver.com>
Date: Thu, 22 Jan 2026 17:23:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 00/16] Enable rust support for linux kernel
To: Antonin Godard <antonin.godard@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
 <843161.1768934499700757613@lists.openembedded.org>
 <DFUD78TMO2O0.1WB04Y9FC5LNH@bootlin.com>
Content-Language: en-US
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DFUD78TMO2O0.1WB04Y9FC5LNH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: MA5PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::7) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LV4PR11MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6e7ca4-e03d-434c-d815-08de59ace7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czc5Tmc0WkdGOTRpY3YxWkUyQVV2eldndldwd0RKOUtLZWpGd3FNd3U3ZWpt?=
 =?utf-8?B?YlBDckZHcFBhSUlYMXN4SUxNa29neHBBbnVRRnMzMHU0eVc3cDZuMXJmT0Vh?=
 =?utf-8?B?YnNoQUhJMkNEUGRKL2Q4WTZRRVlRY3NNSlYyTERUTldWRnF1aUVFVGJyYWh2?=
 =?utf-8?B?a2FZa29IUDJndW1DT01GdTJXdDBmNmxuNWVuU1Ftd3FhM3JBNFA1bVprcFgr?=
 =?utf-8?B?bTloWCtnRVFlYnlWamxuRUJMd0RnYnZRL2hDTHF5QUVZbTlsQ2tSZVNzMmNh?=
 =?utf-8?B?TjY4RlFYSjJudGZoSHJZZ3crQ01mOTNyWUxlTS9lckNkcmFDL0VFclJtRWFQ?=
 =?utf-8?B?am5acUlxWHZuSEtzRnJ2ZVVKL29LYnB3ZWJ6enBxenJEZmJwVVhtZnl0ZjEw?=
 =?utf-8?B?WFMxS3ZiMGg5Tnh1VTJQdEVLTnJBN2R0Ni9kOVk5WkFpQzVIUjJOaHZ0L0s3?=
 =?utf-8?B?dTRQa3RjdVFET1NCRGt6YXlqUEJyYzBDc0VLVklLUURUS3czNnBrTldaNDR3?=
 =?utf-8?B?RFpyZE0zUFdrMG1LSS8wUHF2OGFLRTJzSWhPdk56cjFqd0pNM0g1eUpUZGpu?=
 =?utf-8?B?cWFrQngxM2RrSVdVOVdxeVkyVWptZXQ0WkxRMmNHeVluQ0E4VkVTSXdIQjhu?=
 =?utf-8?B?b0QyVlZZVEJsMUJhZ0tCL290YXhUYVVvNm00Q1AzR1I2Wisvb291QWEzVUli?=
 =?utf-8?B?dEpEUUV1MFJSaVZZSWNJazRmdzcydkhJcXNjbXlNUlFyZTljMEFNME5KWWVz?=
 =?utf-8?B?R2JJN0hoZjJrNGJVTmR0cERXUTludDI1Nm9sNTVndHM0ZktDampBTmpXZlhC?=
 =?utf-8?B?bk9uaDNlMXVXaC9Kc0s0ZGNYcXNVWkd4Z0o5bE9LODRtR1hPMkRaVzVmVkR6?=
 =?utf-8?B?T3dnanJ2WnZvNmxvN1FrTnpEZzRBQVpzL2J2YUhjNmZVVnhDVEFZazNmaGhT?=
 =?utf-8?B?d29sNURGclJyd0RxVVZTdnBiQUhqMnFyd2NoVWgrQ3pIU0pqbjAvbGZYSUJL?=
 =?utf-8?B?YXhIM0hQRGozZEVYVFZ2UWpLNjFJVGhVZ3gybCtUUDRXektKODd0bTJVaDJS?=
 =?utf-8?B?M3VxTzdhTExSNkJOTTFpdkpPUWFGMjI1Nm9xc1B2WVN3SkIxbGtiZmRzcVVs?=
 =?utf-8?B?N0JPYm9ZSVZsNk1kQ3JLOVVWeHFJc3QyMGZmVnRmUk81eXBZb1NObURIYklF?=
 =?utf-8?B?V0JBaGhGWHdlZjRKdEVIVk1aYlBua3E2RGlHbC9qWVI5QXc2c1JQcEVmR1Iy?=
 =?utf-8?B?YWpudE9zRC9JR1ppOStybWcrK2NFWWk1NG1pRE1hRkMvNktBUUJQTmlVN1VL?=
 =?utf-8?B?VThtL2VnWlRJNVdueVdteWpUZm9XaS9UUjdoN000SnpnSWpzdG5lc3NBMURq?=
 =?utf-8?B?dzBMUjNicXg2WE5vOTVoVEltYjloRVdQUStZRmtheFYva2Q0Sk94ckdtYTRk?=
 =?utf-8?B?N3E1MHlVVU0rcGRDY3NTVVZLR0VYMGQ2eCthRk8wazNEclQwMEJkOEdKUW80?=
 =?utf-8?B?aExQS0lkbXM1c3RJNU5qTmo5SS9kd0hnK3RPWUh2N2ZnVjYwUHBwKzVsdzNy?=
 =?utf-8?B?M2s0YUZiMERqSis5aVZ3RkU1VTZxOUhBMlVJay9BYVplbmtkOHBlQUFnZkEx?=
 =?utf-8?B?eFFqbURCVkNpdlRlVVc1dDNYV0RXSmQwNkEvcVZEblVxZzhnNHlTTTF0SldL?=
 =?utf-8?B?c2Z1blZXbkZKVm5PcGxMRHRLa3hRZ2V2VXB4UnhrU09NK3M5VVlPNStUdGhJ?=
 =?utf-8?B?ZjFlUnJFNVk1WUxoZTBWSFh1dHhseGd4Nld2ZGtuWm1icjB6MnBJUmNVL0Zp?=
 =?utf-8?B?cHgyOWJ1SmxqdGRVdDFFSTJ2MWxmNVZISGRLSnp1NGtjemlFeUxsV25yclBq?=
 =?utf-8?B?VUE5Q1NYbnNuZHBxKy9PODJObzRxaGh2VTRGNEJtZkcrUDA3YmxPTHFZbXdF?=
 =?utf-8?B?MHVSSmhHUUhiOXhGaDM2Z0JWdThsbitWK0pieGFkd0pwR1ZNMnJ3Q0dJNXdV?=
 =?utf-8?B?YnRCWGVCcVFXejNoSlQwWi8ySzNobTQyRElibVdqMERiK3hWcFplSGlGclVB?=
 =?utf-8?B?TFhqRzRvV09WbFBaVVlOM3RJblVLK01scmF0aVpSb0NRaCtzTHdZUllGVFJz?=
 =?utf-8?Q?0UZo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVhja2ltYXJ0WExnd1ZtRkl2Y2liQ2h1VlJsbkhBencwZHVsKzgwaVNESm02?=
 =?utf-8?B?S3R0bkdNVW5ubmMva0xNUjhEbk9FVk1XMVJ3ajlhOHlaR0dUTUVnZnhrcXNw?=
 =?utf-8?B?T3FjeU9zMVJVU3hMVm5KVndNVWUyakhOSVdFS2ZxTU4zSGF2VXV1akp5TXpa?=
 =?utf-8?B?aUxHc3FjVFlsb0gwUGdRdlhDNFUzbVkrMXZzR1hUSncyUTRkaXpRWWhQWnlm?=
 =?utf-8?B?eGx6bGhUNlJrclg2dzR2aStpQkNnSTV3Ukx3U1p6MENabFRrTkdWUDBNNzQz?=
 =?utf-8?B?V3EwYjZPQnFaT2RNM2xHaFZkcjFvdmt4TDU2OFhEVVN4clB3L0MvL1J5aGVB?=
 =?utf-8?B?UWpORGpoYXZVWnVic2FYSkxIL2prdTBXWGpaQTVrWHNWVXBYQnNnUi9la2hp?=
 =?utf-8?B?eldkL0pzNUIrSjQ3RzkzclB2c3g5UDdURE5QMG9pdWpOMHVVSVdUNW40OFZi?=
 =?utf-8?B?b091a1JpZnNoeGhkZ2ZWTjVHS0hxYkRtZDNTYjYyQnk0elFqa1VVTVhMemdU?=
 =?utf-8?B?Vk5YaGx1cC9SMEY0eWVMQ0dsc2dPazgyMjBkU3d3anAyTkVLay9ERzd0akJl?=
 =?utf-8?B?VVN4ellFOEhaN21xUTB2cTRYVDhPaklIY3ZFUHBQN2swamgvY25Kd2Q3K3Ns?=
 =?utf-8?B?c1N0WmpNVWlsVjZUZlE2SDlMTExuVm5CbkpqeTFoL2ZhRDJpSkt0YnhwdHRL?=
 =?utf-8?B?QlBnVmJUMzljVy85TlpvaGtMZllONjZFTzJseFU3SXoyUGZhUE80bUtlTnV5?=
 =?utf-8?B?NUlHbnB1WnZ0T1hOU29sUjdialdCcTlWc2k4Y2VUanpJaWFZQjVRNUdtcjdM?=
 =?utf-8?B?TTZ1elRTMVNtdHhya2JicHRBMWxJTE04d3NiRmk3TUZzOWJTNExvZFZFYjVL?=
 =?utf-8?B?cXZJTUlFc3JrcERtUlNra0tCa0hxdGtxUXRRSU9DSTBQazVHQUpxRkJOdkZ2?=
 =?utf-8?B?THRkWWEvUzA5bUY2RG12bmFWNlIremExS3FKMDNyRDAwWDUyN211QU85blg2?=
 =?utf-8?B?aTVIQ2pvQzRESndBQVJjT2NCNkc4UTFyTW0wTnhZMDdhODdPQ3l3Ym5CdnMx?=
 =?utf-8?B?dlpOc0FoaHNkaUI2M1EvNE1lZGNydDRVL2s4aDU1eWdlTXdHVENtT2M3M3l4?=
 =?utf-8?B?U1RsZXhYQW83Z2hjVkpmRllTYWZzRDRFd3h0WjFERlArK0NzUHk5N1NpOFdV?=
 =?utf-8?B?Z3lpMWdwNTRNbEw3Vm9CS0hpYWxidHRvdFFXY2FBM2IwYWJQM3I2SmVZUmRp?=
 =?utf-8?B?UWdkTTR0N2ZJRUJRR29NdEpwS2E2WlVzeG43U25VOHdIQi91M2xWK0F0Y1Zq?=
 =?utf-8?B?R0F4dW5MRERHUnJQTHZ0bjdHbThLeXZCSlpEVXVTbThnbU9OY1k3WEdaYXJT?=
 =?utf-8?B?ZUFNd0YzMC92UnRQc0N1WVVKMFVadjc0aFFzb3BIYU5LRG5zQUNNNytnYld1?=
 =?utf-8?B?azc0Y2YreTkyZEZxWUtNMDlETzQrY1Z6eWZXMVdWdkFkSExXN3QwaWxzcDhN?=
 =?utf-8?B?OHBmcUphS2xCYWtPZ0VnN3NuZG5ONlIzNCtITXRtck9DaGppdEk4eVVGWW53?=
 =?utf-8?B?U1llMzVXa3lBNXRYMUdmTWs2Z3VKVm0xR0NMMGF1TlRyMCsxcllUaFdPSWdE?=
 =?utf-8?B?WXJrem5rSWtYRkFISTdoZUNoWmNMWEJMc1Z2WXJ1QTh6eUw3NTh1dlg3VEVj?=
 =?utf-8?B?blpYWU1aZVZXS3RBa2IxMDVtUmQ3ZktRZUorMUptMkxQSFRMeHZXRTVsSkoz?=
 =?utf-8?B?ZXJWT001alN4dGFaS1RBaFp0YmZUbGg4cmJUZlZjblFtTTBybitMNjdQV0I4?=
 =?utf-8?B?c0VDQ0pBSUF6RXRVVTdHUkpveU91TWUvU2xwNE9IUTUrU3F3VlAzZ0RXWU1O?=
 =?utf-8?B?aWYvc08xbGlkSGlkTWdBMEo3WXd1RWFMR29EZWVaRTJyS2M2Y2lZNmczUGp4?=
 =?utf-8?B?SHA4aUNSSm9Ta1p5L0xwWlBzZDhxdVZ2b1VYRlJUSmQ4SXFRL3Bhc01DVkFS?=
 =?utf-8?B?L3o0MVljUWpEWk1aTDU4RHZjUys5dURoODRiQzFOaGtEcTBHUFhGSDBTNUpm?=
 =?utf-8?B?VjFqbFZCZUdCVmt5M2NYUWpxdzZuQ3dac0pjYXdNbkFNTDRsdU1yYVhsTDQ4?=
 =?utf-8?B?Q3ZVTXA3NDhkMUhseDJoNE45VXhhSlNkY3Ezb2FMc0V3Y1BYOU1QNGdZQllk?=
 =?utf-8?B?VnVEbzd2MGtKU1dCeitrRnFvczIrdHZCeTFkOUE1U09tdEhpbENlbHFhTUU5?=
 =?utf-8?B?b1hyZkh2dURkUmhlcDlNcWwyMkNiT0xTdXdRWUZTbHpoOVlyL0hWYSttT3VW?=
 =?utf-8?B?STY1TWJ2NkJjZXNocVhjQXdSSUlQY3NZWW0zS3VVeElzeCtra3d4czdjQTlX?=
 =?utf-8?Q?oNfBROMZvmRzSoMk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6e7ca4-e03d-434c-d815-08de59ace7f0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:53:49.7330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9zB/P3UVWRpTgmiiEFDSEkwy0itvIgz6JYcVcwS2vJS3A17fffCrSDaMmFAj9lDGt4zH2quXWlAcBTCkMRX5eT4kBAqQVUkFuJQa87SwOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9490
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: VUzOmDLHQ8hD9K7X3X47ygeb58PZmCek
X-Proofpoint-GUID: WnVDKpWec9tBmBO4zITz_H5B2qWeo0nf
X-Authority-Analysis: v=2.4 cv=U++fzOru c=1 sm=1 tr=0 ts=69720fd0 cx=c_pps
 a=AaT4FrH4hTNSk8p5YcQWtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=jY03BI607apxzx8gfkYA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4NyBTYWx0ZWRfX7NAVJmdpyAZF
 qgkt/uvoXj2mzPq2zgnWQak3keys6Z5rkdWbWeHfMFsjnwY8MNf71OfjeELAAdmP9RAZkaiJcE3
 8Ve65vC07UV5Usf2hSgIR8rO00hrZNM5bPYUqueYQZlo9Tef+ZkZbho8brypZRAgHMww84enicC
 luYIQ7s077yOxQHvD/0H1SAx9F9mCOkve5vGPDiDTrZdvzil99xHnv7QRO0+QbtMVdBL0QGeEFc
 9BKovFjtZs2VY7EE2lyemMxK5BLztVNPDBi+bBPYwDQadZW4TdrNWwAXTgSaIoQvzYSbP68c0zF
 MA1cAADvCYmHQKrGGm89lB1gc5PjI7mcaQXuO/u2f9ev0QBKkMXrOFGtdFv5OAksLqnyKZSBT9m
 0SWhlx2r5fo/P7ob4fAhcPMAMRj2d8qmHWaJRuR6cdPD2jvtgi/RQOOYrdV2sMnEhinadhWUCeq
 Mt15cqLMtT/8MB61TFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 11:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229839

DQpPbiAxLzIxLzIwMjYgODo0NiBQTSwgQW50b25pbiBHb2RhcmQgd3JvdGU6DQo+IENBVVRJT046
IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2du
aXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj4gSGksDQo+
DQo+IE9uIFR1ZSBKYW4gMjAsIDIwMjYgYXQgNzo0MSBQTSBDRVQsIEhhcmlzaCB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyBTYWRpbmVuaSB3cm90ZToNCj4+IFRoaXMgcGF0Y2ggc2VyaWVzIHdh
cyB0ZXN0ZWQgb24gQXV0b2J1aWxkZXI6DQo+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJv
amVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8yMy9idWlsZHMvMzE5Mw0KPj4gaHR0cHM6Ly9h
dXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzUvYnVpbGRz
LzMwNTYNCj4gVGhhbmtzIGZvciB5b3VyIGVmZm9ydHMgb24gdGhpcy4gSG93ZXZlciBJIHRoaW5r
IGl0IHRyaWdnZXJzIGlzc3VlcyBpbiBvdGhlcg0KPiBidWlsZGVycyBhcyB5b3UgY2FuIHNlZSBm
cm9tIHRoaXMgYS1mdWxsIHJ1biAoYS1mdWxsIGlzIHRoZSBjb21wbGV0ZSBBdXRvYnVpbGRlcg0K
PiB0ZXN0aW5nIHJ1bik6DQo+DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9y
Zy92YWxreXJpZS8jL2J1aWxkZXJzLzI5L2J1aWxkcy8zMTAxDQo+DQo+IEZvciBleGFtcGxlLCB0
aGUgZmlyc3QgZmFpbHVyZSBpbiB0aGUgbGlzdCAoYmVhZ2xlYm9uZSBidWlsZGVyKToNCj4NCj4g
fCBlcnJvcjogbGlua2luZyB3aXRoIGAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvYmVhZ2xl
Ym9uZS9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbmF0aXZlc2RrLXBva3lzZGstbGludXgv
bmF0aXZlc2RrLXJ1c3QvMS45Mi4wL3dyYXBwZXIvYnVpbGQtcnVzdC1jY2xkYCBmYWlsZWQ6IGV4
aXQgc3RhdHVzOiAxDQo+IHwgICB8DQo+IHwgICA9IG5vdGU6ICAiL3Nydi9wb2t5YnVpbGQveW9j
dG8td29ya2VyL2JlYWdsZWJvbmUvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LW5hdGl2ZXNk
ay1wb2t5c2RrLWxpbnV4L25hdGl2ZXNkay1ydXN0LzEuOTIuMC93cmFwcGVyL2J1aWxkLXJ1c3Qt
Y2NsZCIgIi1tNjQiICIvdG1wL3J1c3RjQkRRUUNjL3N5bWJvbHMubyIgIjw3NSBvYmplY3QgZmls
ZXMgb21pdHRlZD4iICItV2wsLS1hcy1uZWVkZWQiICItV2wsLUJzdGF0aWMiICI8c3lzcm9vdD4v
bGliL3J1c3RsaWIveDg2XzY0LXVua25vd24tbGludXgtZ251L2xpYi97bGlic3RkLSosbGlicGFu
aWNfdW53aW5kLSosbGlib2JqZWN0LSosbGlibWVtY2hyLSosbGliYWRkcjJsaW5lLSosbGliZ2lt
bGktKixsaWJjZmdfaWYtKixsaWJydXN0Y19kZW1hbmdsZS0qLGxpYnN0ZF9kZXRlY3QtKixsaWJo
YXNoYnJvd24tKixsaWJydXN0Y19zdGRfd29ya3NwYWNlX2FsbG9jLSosbGlibWluaXpfb3hpZGUt
KixsaWJhZGxlcjItKixsaWJ1bndpbmQtKixsaWJsaWJjLSosbGlicnVzdGNfc3RkX3dvcmtzcGFj
ZV9jb3JlLSosbGliYWxsb2MtKixsaWJjb3JlLSosbGliY29tcGlsZXJfYnVpbHRpbnMtKn0ucmxp
YiIgIi1XbCwtQmR5bmFtaWMiICItbGdjY19zIiAiLWx1dGlsIiAiLWxydCIgIi1scHRocmVhZCIg
Ii1sbSIgIi1sZGwiICItbGMiICItTCIgIi90bXAvcnVzdGNCRFFRQ2MvcmF3LWR5bGlicyIgIi1X
bCwtLWVoLWZyYW1lLWhkciIgIi1XbCwteixub2V4ZWNzdGFjayIgIi1MIiAiL3Nydi9wb2t5YnVp
bGQveW9jdG8td29ya2VyL2JlYWdsZWJvbmUvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LW5h
dGl2ZXNkay1wb2t5c2RrLWxpbnV4L25hdGl2ZXNkay1ydXN0LzEuOTIuMC9yZWNpcGUtc3lzcm9v
dC91c3IvbG9jYWwvb2Utc2RrLWhhcmRjb2RlZC1idWlsZHBhdGgvc3lzcm9vdHMveDg2XzY0LXBv
a3lzZGstbGludXgvdXNyL2xpYiIgIi1MIiAiPHN5c3Jvb3Q+L2xpYi9ydXN0bGliL3g4Nl82NC11
bmtub3duLWxpbnV4LWdudS9saWIiICItbyIgIi9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9i
ZWFnbGVib25lL2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1uYXRpdmVzZGstcG9reXNkay1s
aW51eC9uYXRpdmVzZGstcnVzdC8xLjkyLjAvc291cmNlcy9ydXN0Yy0xLjkyLjAtc3JjL2J1aWxk
L2Jvb3RzdHJhcC9kZWJ1Zy9kZXBzL3J1c3Rkb2MtOTJjNzIwYzAxMGRhOGM3NCIgIi1XbCwtLWdj
LXNlY3Rpb25zIiAiLXBpZSIgIi1XbCwteixyZWxybywteixub3ciICItbm9kZWZhdWx0bGlicyIg
Ii1seiIgIi1senN0ZCINCj4gfCAgID0gbm90ZTogc29tZSBhcmd1bWVudHMgYXJlIG9taXR0ZWQu
IHVzZSBgLS12ZXJib3NlYCB0byBzaG93IGFsbCBsaW5rZXIgYXJndW1lbnRzDQo+IHwgICA9IG5v
dGU6IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9iZWFnbGVib25lL2J1aWxkL2J1aWxkL3Rt
cC9ob3N0dG9vbHMvbGQ6IGNhbm5vdCBmaW5kIC91c3IvbG9jYWwvb2Utc2RrLWhhcmRjb2RlZC1i
dWlsZHBhdGgvc3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvbGliL2xpYm0uc28uNjogTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiB8ICAgICAgICAgICAvc3J2L3Bva3lidWlsZC95b2N0
by13b3JrZXIvYmVhZ2xlYm9uZS9idWlsZC9idWlsZC90bXAvaG9zdHRvb2xzL2xkOiBjYW5ub3Qg
ZmluZCAvdXNyL2xvY2FsL29lLXNkay1oYXJkY29kZWQtYnVpbGRwYXRoL3N5c3Jvb3RzL3g4Nl82
NC1wb2t5c2RrLWxpbnV4L2xpYi9saWJtdmVjLnNvLjE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkNCj4gfCAgICAgICAgICAgY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3Rh
dHVzDQo+DQo+DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJp
ZS8jL2J1aWxkZXJzLzIvYnVpbGRzLzMwODQNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3ZhbGt5cmllL2FwaS92Mi9sb2dzLzUwNTIxOTEvcmF3X2lubGluZQ0KPg0KPiBD
YW4geW91IGhhdmUgYSBsb29rIGF0IHRoZXNlIGZhaWx1cmVzPw0KVGhhbmtzIGZvciByZXBvcnRp
bmcgdGhpcy4NClRoZSBlcnJvciBpbmRpY2F0ZXMgdGhhdCB0aGUgbGlua2VyIGlzIHVuYWJsZSB0
byBsb2NhdGUgbGlibS5zby42IGFuZCANCmxpYm12ZWMuc28uNiBpbiB0aGUgcmVjaXBlIHN5c3Jv
b3QuDQpUaGVzZSBsaWJyYXJpZXMgYXJlIG5vcm1hbGx5IHByb3ZpZGVkIGJ5IGdsaWJjLCBhbmQg
dGhpcyBpc3N1ZSBkb2VzIG5vdCANCmFwcGVhciB0byBiZSBjYXVzZWQgYnkgb3VyIHBhdGNoZXMs
IGFzIHdlIGFyZSBub3QgYWJsZSB0byByZXByb2R1Y2UgaXQgDQpsb2NhbGx5Lg0KQ291bGQgeW91
IHBsZWFzZSByZS10ZXN0IHRoZSBzZXJpZXMgb25jZSBtb3JlIHRvIGNvbmZpcm0/DQoNClRoYW5r
cywNCkhhcmlzaA0KPg0KPiBBbnRvbmluDQo+DQo+IC0tDQo+IEFudG9uaW4gR29kYXJkLCBCb290
bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9i
b290bGluLmNvbQ0KPg0K

