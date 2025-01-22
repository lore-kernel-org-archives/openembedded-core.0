Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1666CC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 07:34:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37946.1737531262241634149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 23:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31175ce57d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M5GfMB014692
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 07:34:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw088s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 07:34:21 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50M7YKmE018318;
	Wed, 22 Jan 2025 07:34:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw088r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 07:34:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeY/OD3KVBS3yVQS4Q0Pzl2HrEfaIPisSP7Y6OPk9Jox8Zu+nhF6oe5Q3hCUCHdxr/9JZeYuBFTj31YjfwrW+rnSZRNzTbJYmo1eX2wJqha9+SesZmBafzzwCN59MVoHid1kx8GMRNy+Qckkk19TcEcVVj9KCHSOKWTeQAyf2RNKzyst6NSaVpBSYDpXx4gfe7/Zdh5PcM3pFJw6Slb+ib4xTAZn8+zRNCtR9tSvLjQUoBE3/apuDSCk1G8CaVsu8rcxxBfJNyDVRh3cC/xBGuW7X9wsAYerkwdJ+mE3XB+M5B2Ycg0JLEhf6PAEhgSmap7CZmTyTV18Ha3RhCFw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4UucrkJwu3JqzHmiBbd9FvnwLv2UXJ/MKb6efEc+Rw=;
 b=aooXWM9Gen44IgQWEECnqMvbFAfaX03SW3Yx4vM3bLSNPj3ghJ9L+sxd8W620+ShBNKk0cq0L+LdVLQ9AP8VElgqSmPOF4uBXlp89xRFu3jG3qQo8uZj0LpcqNHTteYYi6VHlsOltnXiPjM0jlarJqMYqKZaAKDcRa+egQI3shwGwY5bq9gx+9jHR2F771MqB4I4nnbBpOX8Ngh95GV9f541YUgfK8DdLyizphNhVHgmXBvlcJINK8iH46vxmSYxJW85PEvKxLg9JEUi04wLxHmYMnUGxQE5eS+pf0w4wbyYtN5DoWgDiMrn7CxysncD/KF7V3mJPWHmnyalt5zNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 07:34:18 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 07:34:17 +0000
Message-ID: <cee14f1c-3390-4159-a8b4-93fa88365d42@windriver.com>
Date: Wed, 22 Jan 2025 15:34:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 1/1] wpa-supplicant: Add CVE id to
 CVE-2024-3596_00.patch
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1737352688.git.liezhi.yang@windriver.com>
 <93ea4608b9ed81e9cd3d34030fb74895598d06a1.1737352688.git.liezhi.yang@windriver.com>
 <AS1PR10MB569799A22EA3F64E73F632B0FDE62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <AS1PR10MB569799A22EA3F64E73F632B0FDE62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH7PR11MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: a836abce-4bdc-40e4-4f9d-08dd3ab72d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZmVqa3RHdVJiOEFNMExUdHUxVGhQNEtVazU3THlwandySEFvVGY5bXBhUmh0?=
 =?utf-8?B?UXZhYmNKVm9IM29DYjFHYTNncVNGZUNKeHJyZnN3OXdJNU5ZNEdYR0twcUpK?=
 =?utf-8?B?Wk5HK2ZQSWhnbS9LMlpmTUplU01YUGE0UU1nM3NJeWdPODBoUzExdE12Ui9U?=
 =?utf-8?B?bFpLRkxLZEltMElBY3ZTYjZkTUhYNG1ScUx4M0tBaldPOUVRUDdvVmc4SGZV?=
 =?utf-8?B?ZXhjREhlNzcyNWY0WUp1blhMSVkzVDRPQ1VreXJDZkdlS1FORFNzQXZraUox?=
 =?utf-8?B?aFhlUjVyWFA4TzZRV0tLYUtNS0ZwZ2k1NnhwZXcrVGJqUFRINzE1N3FYdlRV?=
 =?utf-8?B?Y0NJZjZ1dHAvU1V0YmVMMXlZcElTT0F4UlhudGs3ODhOcHR2Sm5Hc1pHUzF1?=
 =?utf-8?B?eHhrS0RNY2loRStnMGR6UHBHYmlFQ0R4SGhpbWZIZ3VzSGlRMFZqNHp2NnBD?=
 =?utf-8?B?UDY5alJvaklEbzEyM0lxZDZHMnZlRFJHN1A4eDlXWklrdU12WkZib2RqMXpI?=
 =?utf-8?B?L0hLUDZIWWw2THMrKzExdWI1MW54ZmpBWUtXQllQUE51TGx1V0h2NDZHd201?=
 =?utf-8?B?clVTUFZndEF0eFN4eHNPb28vVGkxVTI0azFrckpHSHhQMjlLM3k0Z0dFc2ZQ?=
 =?utf-8?B?NjhPTTRwcTdTbmdDY2s0czYzdUJCdXV4WEN5anFzMHA0azlxeUVpVVlLenZt?=
 =?utf-8?B?bXJybmR6bnkyeFRlZXVLN2g1aXZFd0x0U3dLTm1Wb0NaTW80dmh0akNnR1VQ?=
 =?utf-8?B?ZjVMeFpxTE02S0NHQzRTOG1kVTJhT0hQRzBFRmR0a1kza3lpR1d6bW5TR2Uw?=
 =?utf-8?B?b04wVWtXS1gyNEJEem1pU3RzZmFFNnFITHRaWHJsaXBUUGx1SVdzVTBtRHBF?=
 =?utf-8?B?RURGbDBoaHZwQ3ZGVytOQzVCZjFrdzJHdjYvakZjMVV5bUExaGpyWk9HcG9y?=
 =?utf-8?B?QXF0bHFFQ3lTbHFESGZqeDhJWU9IOG1TQmIwOUtvU05rZSsvajNVZStQemsr?=
 =?utf-8?B?QkxkYi9VZ0xVd3hTcGRkVDFUcTRzeitVVk9NZWRFMnhoa2c1THl0MXdzUnhi?=
 =?utf-8?B?NnpGeGFieUZmYStiMTRla1BNSGVCVDlQbGtMVW41bENWMUVneUx2bkFnVzBR?=
 =?utf-8?B?Q2E1NlpabUdnUDN1UWNQTDdNeEFadTUxSVc2TGRIRlVYRVcyeUZWOUtHSW1J?=
 =?utf-8?B?QW9Ed25oMVNrVnI3RjRReUVzQVlsRjZxdmpWOUJaek1PRUU0S25kWithMWdF?=
 =?utf-8?B?UTlaNVFvOERiRFBvcHZtQXNlOG1sdExhMm44TllxNktObWZXUldidmNyY252?=
 =?utf-8?B?RTRYbjJyQkxsNHZ1SDE3RDEvSmN0ZUo0RUt2cmdJQ2NTSW9tT04rbzJ5QjJO?=
 =?utf-8?B?dzdQbFU3M0dWMjJVeFJiY0xMem5ZS2JtV25iMVBYUTVSYStUN2xETURhQnhS?=
 =?utf-8?B?TzQvdjNyaFJMNGR5NE94L0dMclpHc1AzOGNVN1JscG5XQU9UalVqQmtwRkxx?=
 =?utf-8?B?ZUE2bGtxV0VmUFIvRHZDdkJyZ0hFcjBDV0dyVHlQdmErMzJaZjRHS2FicWtm?=
 =?utf-8?B?K1d5eVhkbGUyQzQ2K3d0RzM2STNTdXlkb0h1L3AybXZOVnoyV0JzTnV6cVlL?=
 =?utf-8?B?bi9HbGNCdk9xN0VKMmpVemkxd3FhQnE0eVBuUDVyZHMrMHpReGNFdDZIZlZl?=
 =?utf-8?B?S3FyNGFqUmlMRG9mUGY2NWduQ3pDZDYrQnNSVG9nanB3dFEyK1ViS1hEUlhY?=
 =?utf-8?B?Y0UzdkFjZk9OREl5SE1PaGMxcjRaSXd5YnRpSk51NXF2K2VSb0pXQ2Q5UGdp?=
 =?utf-8?B?TzlqSys0YXhTeFBCYXMxUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmVEVFBuQWozdnlpTFJvd1FTYVkxc1VHTDVvRUdGbVdiYnV2aVA3cGRRemds?=
 =?utf-8?B?MVRQc0doMWVEYXo2d0RidUVKY0VjTlhMVDQvTkJ6MzdjUTB6RzY1YVV1OU1q?=
 =?utf-8?B?NTkzYU9PMlZ2M2R5VXREdCtUaERseVZxM1lqZTFZZTJuSDVTR1NmUFl3N1Rp?=
 =?utf-8?B?VmRvRitCdzFrUFhGdGEwMmRueUVMVWtqVnZMUWwyUy9VT3NCQ01QcS8rYnQ0?=
 =?utf-8?B?YnZpc0ZBYnUxVmVEVGdTK01aL0JYcjcrY3kwb2dNUVBzb0lUN3dHblJ6aGx6?=
 =?utf-8?B?USsrNXArNUd6bWtZTkNaWG9ZbGlkUS9nY21ud3czM05GV2hVL2dxNCtEVysy?=
 =?utf-8?B?cFlieFVrclZSYW9CZUtQbVBwMjlqcENacVN0V0owajlPWnVRdjVUdm8yU0JY?=
 =?utf-8?B?V3dFUEE0YWxCMnhoamhDTmtJSGxTUHpkMXJuYW13YW04SnFJNTZXK3cxZmZG?=
 =?utf-8?B?SzJSMitYK1M5SGZrc1kzbkxVTnBid0pLdjQ0OFUwQVJwekdEQmJST3o3WW9a?=
 =?utf-8?B?a0U0NVVQaHBuMGFLVGllRkwwTXErRVdwUFFubkhiS1MxWVhEbDROOVJNRXY5?=
 =?utf-8?B?MXdrZWJzM0w3OUdWSjR6aDJRMHR1NGtyTzd5WndYcUVVdGlCVmlKckNoZHZ2?=
 =?utf-8?B?SzZSdFYzQzhBK3RhQjdKS2dwSU13YmUyZDJ5VTZJZ0hGMEFUYThyakRIQ2dB?=
 =?utf-8?B?KzVtNThjU2xEblU3N1RNM1dzRkM0WHB2ODVzSFlTVlhaSnE0bzVnZWNLMDQx?=
 =?utf-8?B?RFpxTFZuaGVTcEtxdUgzSmhPNFBhUHl3U09kRGhJVnhpaEhDNXo4dHlCZjJ5?=
 =?utf-8?B?SC9nUm00bU9QNWR3aTFXWFlkYVZ6dGxsYzZNRStoU2pmSTQ3bWxqQ3JqTlBB?=
 =?utf-8?B?eFVYUXhZd3Ywam43SjBKcldBQTVkakNuMGtMV1lWY3pJbTBIUEttYlVOYkdq?=
 =?utf-8?B?d2l1VHhNVjI2ZGVzbkZRZjllZm1XUHdYTnk3THVSUy9FYTJSUStwaUZRUlNl?=
 =?utf-8?B?Sy9yMGpYWDU2by96cHRRS2V1OFhRbUoxM1NoelZGazVZQmVWa0VCMUs3QzVR?=
 =?utf-8?B?cEZoSHV2eTR3a2hNeXE2eHhON0VrZjhsZkU3dHBYZ0lleVFCM25vSnlpSmFx?=
 =?utf-8?B?Vkp6b1dWYXVGNVI3b0EyV0libkFheTBSclFCZndweG85Rm83WThHMWxZTUo4?=
 =?utf-8?B?YTNGTUl5MERTWjczWUhncFJ4czhpMmI5ejhHQ0d0OU5FTlBBMFZvaDZRY2gz?=
 =?utf-8?B?WnlyKzJDb1Q4djVFbmVWN2cza0xra1k1a0lkNVhzL1hrM2JwRE5uOTZ3RCtx?=
 =?utf-8?B?Q1FXSHRIeFp6dVVld0pDVjM1aEV3WkRJcm5CQ0VNY1p5eXYvSlJuOUZvSlJX?=
 =?utf-8?B?TGYxQ1U4ZkVVbVl3Wjh2eTRDSlVqRkRiZVdmREVUczd0U1ZuQnJKUzNuOEdy?=
 =?utf-8?B?b0FjSXErb0hMUmxaODJxUUhrdWZaRnVBajFZTzk1SlFVWEsrOExzSS9aOCtP?=
 =?utf-8?B?eEJKWG5pMkpnTVBTdnp2UHoxN3plb3Y4RkEvbG9BTmEvSzJ4TDlpSXRpQTda?=
 =?utf-8?B?d0luZFVhM0M4YThwNjZCdVdLZ1F4aDRGSU9ieXQvZ1ZVd1F4dE51bGIrMHZi?=
 =?utf-8?B?bjFDazhBYWNHYmhpU1ZoUGVab2lqSWtlRlZuSm1QQWRGclN3a3JEQ015RERw?=
 =?utf-8?B?Vmx6bTd0ZnFManR3bThOL0dIcTEvWUJYVi82MmMrZmpLTFc1L1NaczNZMUdR?=
 =?utf-8?B?akZBcUd0WkRweFlaSEo2Y1l5dDZjZE1sYXZmTytuOXR5K2F0cXRRdXRlQitB?=
 =?utf-8?B?dFRzSmNiS2N3SDUvTlpFOGRMQkcwTnd2NE9jZkhHQmpLRWRRTERUcTVKRllI?=
 =?utf-8?B?UXRqUTlQcmNFWGhCbG9DKzN2LzM3UU5Nc0tvd0ZzdEI0S1B3TDI3UEJ6N3hr?=
 =?utf-8?B?Z2d2NW5HTTV5MFVzUTZpNFFadm0vczVEZlpjbGx1R25WS0RCLzM5QjNIc3Fp?=
 =?utf-8?B?REFaMXNBNFl4ZHhEUjhTQnhjUTY0VC9XY1FqcXVwSHVzWHQyZXZ1Mkt2SnpP?=
 =?utf-8?B?WWhRVEdnNmQvYmhuR2JsblRzM0ZXWmlsdjhoQTBDQks0TnAwbkpRemRuNStI?=
 =?utf-8?B?YjRuUy9oVzJxL0plOXllQlUxVDhFZWxTUC9YR1Q1WEk1UWpLS3VlUFVaZjBQ?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a836abce-4bdc-40e4-4f9d-08dd3ab72d8d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 07:34:17.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoFMjx9ty+uAXdAPw/NEVmyu+OBhnoU15l+6Vo3nBCqtWl4nDlTX7uIoQNkDuTKq6FjNuNfx8dsJSkQd2LePhdSU8pu+sY8cVhMA8LW+Vtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=67909f7d cx=c_pps a=1OKfMEbEQU8cdntNuaz5dg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=yaAG3qJ-AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=lBa2ThZS0Xa2rNiXoQIA:9 a=QEXdDO2ut3YA:10 a=GFfUI7B0NGUA:10 a=oLVlbjkABFOu4cUI0CGI:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HVIdQhu6H-DLK0XaSdgsHvdnL4VNLpdH
X-Proofpoint-ORIG-GUID: 3vP5U0QvnKbqeq8NjsrFV0WR9xflmyUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 07:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210135



On 1/22/25 00:41, Marko, Peter wrote:
> This is not correct.
> 
> The patch CVE-2024-3596_00 does not fix any part of that CVE.
> As the commit message says, it's a style commit so that real CVE patches apply cleanly.
> If it bothers you that it has CVE in filename but no CVE, maybe rename it instead adding incorrect tag?

The cve patches can't be applied without it, may we should just leave it as the 
current status.

// Robert

> 
> Peter
> 
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Robert Yang via
>> lists.openembedded.org
>> Sent: Monday, January 20, 2025 7:01
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [scarthgap][PATCH 1/1] wpa-supplicant: Add CVE id to CVE-
>> 2024-3596_00.patch
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch         | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-
>> 3596_00.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-
>> supplicant/CVE-2024-3596_00.patch
>> index 7a8197d2b4..58e1327f2b 100644
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-
>> 3596_00.patch
>> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-
>> 3596_00.patch
>> @@ -6,6 +6,7 @@ Subject: [PATCH 1/9] ieee802_11_auth: Coding style cleanup -
>> no string
>>
>>   Signed-off-by: Jouni Malinen <j@w1.fi>
>>
>> +CVE: CVE-2024-3596
>>   Upstream-Status: Backport
>> [https://w1.fi/cgit/hostap/commit/?id=945acf3ef06a6c312927da4fa055693dbac
>> 432d1]
>>   Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>   ---
>> --
>> 2.44.1
> 

