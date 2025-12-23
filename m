Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF4DE6F091
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 13:41:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.101101.1766497292573454537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 05:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=p6tfmRf0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44520f7e2e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNDYPJd038517
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 05:41:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=u2grJWW32CZVEJkSb/N3A7D7Cnn0QlWOsDkFFn+W53U=; b=p6tfmRf0usS/
	Uc2Z4w7yLlblOtL+AoP56XZ2o0Sj2ejO66e12/FC0dYFVW3+cnI0EEUDVekm/kim
	fL96xwT+bSTUpN8AYdIAFgwcW1g2OHmUGVkV7bDMpkevBOb1USf7MWODUVyKnFLC
	AUZJzFFIEm94MqmFF3zs3qaQFGXfoZmslSjjZXSIGvyzcd6/UZyE8bEFCAxP0hsM
	WfjBIMnOICxu6NanJ0nmEu7u7Mm/DIdYu2U1f+UfbQHGuJI1egQekx8W6Ozrt5Fm
	m2uj2YzYTxeJKMDif136FjY02RA/VLeVJ/vcdFggRM5Wm0nQypyt7xKflljTYXQD
	j+K61yWB/Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4tvqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 05:41:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDNaU4IqwD94JQTHKaIHZvJ0gp9b9HE2uhPrtGc5zxxnZb8kajAH0Ud7syh+RHwRYRP7gxhGqENvTGAW3OyxmbC6Zc1gU84USg222iFzgFaWa7hi+MAClhjA3uttDOAGdcUjnfAcZXMA8Z0j2B7fZz+lw7VkLOZofubs1jFSsX5HtmLMM2JP3/8cvPdfcVtHYEFU5a3pay3SF2wT4hxyHfSaF7/y7FMoEBerOze01HscIGcOod2loIhElTmNGtJvwkLbu4gFxzkONbCGx8TLZm1vqzGWNqVH2OUGYVoujm1CFZwjj03NikqKUV7F8kutKtzSzXRerR+YxE7QZcESfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2grJWW32CZVEJkSb/N3A7D7Cnn0QlWOsDkFFn+W53U=;
 b=XtSl8ynwQUJ8n6JLHjeXCcpHDvI+IMed06Xbo6yZmMwdVTdFSqWclc/tdhegK+ktkapFF0NqAFs8+pkvyxH4jkto1rJUlJ/0Yyq//yKga0wLmmOCXxXna791YY1yyyVQqxv6hovKZbbLEBeXm3yg4tVkS2CD6XOGQKnpT3FtnPRLMAPK+SQEe19nH0Ot4BMqgbIHSxZCMx4mv+US4oh29UyD3h8QIHsYv4uWF4q9yt5T4AaygVDcLDCUG9OZRQFhpgFQoNMzesm5T+YFwe86hV6aVqaab5fCHxxyvy8oBNfxCSmhGQqCu9NIUOm5Jh4vjbpXndqWI257wSEudp3CoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 13:41:29 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 13:41:29 +0000
Message-ID: <2bba1260-a968-4c2b-b19d-bcf37a0bdeae@windriver.com>
Date: Tue, 23 Dec 2025 21:41:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3 V2] kea: fix creating runtime directory in
 service files
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20251218134426.4187527-1-yi.zhao@windriver.com>
 <af7814b2-9d54-4235-bb21-c1aac90638ff@windriver.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <af7814b2-9d54-4235-bb21-c1aac90638ff@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: b63e07b9-baed-42fd-c689-08de4228f9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eW1KcTAyRlBhVjh3QndHZFI3dC8yZWtaTmtWUjhUdzF6RkJYRHh0Ri85eTdF?=
 =?utf-8?B?MHVUVXM5VXhMQUEzcE4xb2d2SHFDdVNEWkdqNzk5VW1md1B0SFA3Wm5Qandn?=
 =?utf-8?B?SUZjMTVpQWZJWk40QzRvNHBjQnJmbS9UUVZycjZqcGFFSlprWkRzVUFMcXFK?=
 =?utf-8?B?czdaTEJhakxIdW1nSmxzcWx2eDFJQ0toVE5yMnVhcUdWZHdEV2ltK2ZrcG53?=
 =?utf-8?B?T3pNcFFWZC9EMVBHUnlWMDl5eGdOVzJDV0V2UXFjVTQ0SUh0cHJLOVE0NENG?=
 =?utf-8?B?bFdmbFlEeGRNUzJIVWNOMWtYNnplNitzRkhkSE1FNTB2a1hJUXRuMG53Tml4?=
 =?utf-8?B?azhyL1hzc1UxWHNJRkZkRWRqbmNKWnc3ZlNTdG55OGNwWUsrVWRRcGVzMzNP?=
 =?utf-8?B?Z2NQWS8zSFNqQmRtVHJMTGdiYkEyd2h6SXMwZDZpYjdXYlJyMjVtOURFVlFP?=
 =?utf-8?B?bDl2WlJKWjVJeXI2bzNoM01LNFB5eXZmUGlGU0wvcnBxWTNXeUkwbGJWM0F3?=
 =?utf-8?B?aXVEeEFQczBiVkV3d0YxR2M1SDRmUE5tOUN6Q0ZSWHJQN2lOMSsrK3l5aURa?=
 =?utf-8?B?Um50OTB1Sktkd0sxZ3krNW1MUFNsNDFZV2dnL0N3TlhIY0trN2xnbXg5Uitk?=
 =?utf-8?B?emIxa3puTGpqd1l1RWxJeVFod0tONitNR0duM1dKSGt4cUErRVpzQ2tEcWZD?=
 =?utf-8?B?eFdPdzFIbzdoMG9peWNLTzRxUlZLdW1kcnE0WnVXbXR6dnJJYitOeUxYajlZ?=
 =?utf-8?B?UHFoWitqOEJRUkRPZXdCbi9zV0s3V2s2d0lic0xQUnNyWFlZVHA1Z1BnMHF1?=
 =?utf-8?B?QmY3RW1ESnkxYVZWeDMyY3A2OHhNaDdoTzUzc0Vwc0tPSE5mMklWRDF1Z0Nv?=
 =?utf-8?B?TDVqRzVoSzIreXdGWk5NdE1kTi9SclNBNTl3VWpmdlpWVjk1Q3A0ME9oY0ti?=
 =?utf-8?B?MzkxckFUQVIvSG41ZSttQzR1M2o3a3czcUw5Z2NjMVhUVkc2MzJBd0RTS2tU?=
 =?utf-8?B?emxkNElRMzZyeUNWSDBTNmJFV3NXeEVzR2tIWDVDZm5aeWFDV3FsNXpXRGRu?=
 =?utf-8?B?MlFoQ01vYnlZa3h6TVJZQ2VtZXh1TnFabTJkaEpRU3lzWXVvRE9Qckpyb2xJ?=
 =?utf-8?B?QzdXZmIwQ0lDSFZJOGVUUXYwb2c3RnZ5S0JWNDJZV2FsN0xDdXZBU0FmSXBq?=
 =?utf-8?B?NzVzbldRWGlCbHlXaFo4bVRod1pDa3hIa1V6TmpHTHRnQ014SSt5bzRsZlp0?=
 =?utf-8?B?UDlBdE1qaUFpWmFvbldsUDFVSXhPWGF1NFdBTi9XU0JqbDQ1Rkw2QkJlVy8z?=
 =?utf-8?B?RUVHcnE5dnRLb2xMZ3Njczd1QisxRFE1Q3lXR2VyUlRxNmtxZ3B1U2lKUDhy?=
 =?utf-8?B?Z0p1TjY1cG1YcWhjQXhZeGVCZmgwaE5tUGR6WklLeS9ZNldRYjRUU1J2MlF6?=
 =?utf-8?B?alRnVnZDTUJMcFFsWG10VW9RZmVCVGk0ZFVLRFppMCtwUDBJMFo4V3FZQ24y?=
 =?utf-8?B?WEV4cmNsRDF5czJsZXVZYVdWQmRYVWYwcCswQk9lYVp6akpEajhOQ3VzcjFp?=
 =?utf-8?B?ZnhvS1IyTlkxQ29HcDdLcFN1YVlTQWJLM0FkSXVXTW9QYU94TE1NT2RLTTZV?=
 =?utf-8?B?cHVlZDVyVHNBcHlwTnMwR0dmZ25UMSttdVlVVVZNSTFWYXQvYklrRVVXK2xm?=
 =?utf-8?B?djZhTXdlMVFQWGE2aG8rU2E0Nk5KSWhJUTF3QXJ0aWpKQmhxTGRQd1U3NUJj?=
 =?utf-8?B?MW9KQ0RKTktYYStBWVJpSDM3WGlrTURhNU5hUEFDRWRQRGcxajhucWdOdHBR?=
 =?utf-8?B?bzgrWFkrOVRyQ0EyeXBGQ0dJY2kyR2ZPaEVwdG5FakRHamNrOEdBRHRRMnJr?=
 =?utf-8?B?S2ZQa2IvaW9mV0U2TVRjcW00dzZRcWUxL0kzZmEvVjh0STBQZDBxL3p2Nmxq?=
 =?utf-8?B?ZVFVZSt4Um54RzBIUDNUNGVTQTdIa2RmNlc5MFV5dWtMQlR2ZG8yV3p5Rm02?=
 =?utf-8?B?R0VWTnNMT1VnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bk9HWnRFV1hxeG55OTg0MFgwc3NVemFTNWVqazFBMkFWMCt4Yy9yTjIyc3Jx?=
 =?utf-8?B?TWFJZ29jY2RZNVpqV3RFc1h2Y0lZYkNGcWxsNzRXelNyUWxSeVJzemxIVTNy?=
 =?utf-8?B?ZkNCTDBIQUtsT0UyK2xCUU5qUWhCaCtYNWtVbVQyN3JlNko2YWRFcjlUcCtr?=
 =?utf-8?B?V05SZWRkdlkxQTRHc0c2ZVFhRU5oSVhna1lzUk5IV1AwcWdoNkg5R3RGNXo3?=
 =?utf-8?B?bTlIcFUzTlBuR3ZJOGlJSE1Vd0EvUmd1ZER1blZwWmVlSXEvanY3SHZyR1B2?=
 =?utf-8?B?UE80TktOUjY4LzVtWUJiTU9nTkdYcDlKVG9Ic2dYcE1QQlQvK3k2b2t0N2xV?=
 =?utf-8?B?TlNwelRkbmNDSE1CNHV3a1ZaSmZvS0FNeXpscm5rTTYrZzhCTEZwWXA3b0JC?=
 =?utf-8?B?akJjY1Vib3ZPQnphd1NWbmpNQ3hnNTJzbWVrckVRNGpxVktIdEI1blMxOVFy?=
 =?utf-8?B?amNHWXArOVNVaFJKN3JZUDJ4bGNvRUtsbVB1b0h0dzNUQkhCbUlSSUxmU3lw?=
 =?utf-8?B?WGR4OU1uNFI1aERad05yWGhWaXZyQXk1dWJ1QUhIUFAvYUptT1EvS09nemZq?=
 =?utf-8?B?cHZCd2QrWGJlK2YydTZtWGRxV01CUUcxWkJrd1ZUQ0wzVEI4TzJ2ZHh0c2lt?=
 =?utf-8?B?RTBJKzNDb3daWTBTWXhuNWFOa3FNNXpSeVBBOG9MNkxhN0kwK21aZ2tySmZS?=
 =?utf-8?B?ODlobDdFNThMSzRHdlM3d3FpakNaQVVDUWg2YWhQVktUZFgrclppR1JRdnVY?=
 =?utf-8?B?TXVKTExXZkJZeFVsY1NNbFpFVlFRaW9TdGVZQ01qR2ZxSFBwZEFrbkFLckls?=
 =?utf-8?B?V1JTZFNyWmdwTXRURmpNbVpUWWtoeFhiQktQc0x1TWlYVEdwOXlWTU5UdjlB?=
 =?utf-8?B?azBxSHk5YThZVUxmSm1Da2FyU1BEYW9CeUpWUHN1MC91SGozeTUzMWwra0J3?=
 =?utf-8?B?SStLNlZDUWZnZjdFbVRQeXlQYisvcDNEbDJjaTFONFAvbnBkbzNkbkphNzUy?=
 =?utf-8?B?dkM1NXYyOE10ZWQrNzQxQjF1Vkg5Y3ZOZFpOK3QvWktuS0JCNFcxTlFMbU5X?=
 =?utf-8?B?QUlGVVhxUEliSjlELzQ5aXdoYkZmdm9sNWlKcWRCSUZ6WkRpdDdzQzVHdUls?=
 =?utf-8?B?WXlrU0JXMXloeXBxNWRGUXRTTmNqYVg5SFJkeE9TWGtrOUdpcUIyeUxqUFFl?=
 =?utf-8?B?QU41bHVoc0Q5aTgvTW1nbHRFa2swV2RhTEZZc1VEdnRMMXVGTUpzWU85L0wr?=
 =?utf-8?B?bk5xaTdCS0UyWHhjWVNjem1odExnQ0lkS1ZyNHJsa1JJUVlzelMvTk1FN2k3?=
 =?utf-8?B?bGtVQkYveGYzYVNrNzNQTXk4amVrL20xOWxvWXRjMVZqKzg4a1I4U0NKaXYx?=
 =?utf-8?B?TnFrODJYd2lZVjJyS0xVZUpOQ3VsZUNvck8rMG1UY2JoTVl1OWsvd05iRk05?=
 =?utf-8?B?djlZYU5HKzdGYnpqclhuZ2RsWVMva3Zha3VHK1dYNUN2anh0dGVtbU13N0FK?=
 =?utf-8?B?aEVtc2JnYnk0MmU3djZ4dXpxWjk5cTFVeHpXR084Y2E0Q1RlaE1xVXQ5MGhz?=
 =?utf-8?B?MG1WeDNqa05SWEQ3dUR2dVM0VVRRMGQ1ZGE0aHFZeW9kZlg0SEZKMHNXR1Ez?=
 =?utf-8?B?b1I3eW00ajhLeE8ySFByY1BxSFV1ZUt5R2cxanplTENNWmw5TmVyc0R6dWVa?=
 =?utf-8?B?WnY0UGd6VTM2MzBKRHFHcGxYaFFUUENYR1ZBZlQ0STJHVWRQRUNGK3FhdXpT?=
 =?utf-8?B?TlVMTEFmMUtGdlVzbFJHT200b3E2SWpmUFU2MlZBT0JwWVBQZzF0bWlnbGZU?=
 =?utf-8?B?ejlZak10VmZ2eTFIME4rdFR0a2lXL3YrVWlNbzdDSmxBUlNkQ0FVM3RhNjFM?=
 =?utf-8?B?NnVXWGRMczg0WjVqRDk1cTJsTXVDa1c3eHlacnBoc3FGYXhZeWRCV2s5OTR2?=
 =?utf-8?B?TmJjWEFkd1VHTk05dUdtWlowWkZjVWJ5RFpzdlFVMUhrY3JZNW44WUNBVTJS?=
 =?utf-8?B?M2ltSEFkQlVnZVVUQUwyS2tJT3hmWDJhS1VWWmZKN2NpbVVHaDM2Y0VzR0do?=
 =?utf-8?B?eWZtNG9LdW5DRURLL2Q4b2UrVGpvZmZ4UFdTb0RBZGYweE83UERLOHl2WXhi?=
 =?utf-8?B?TWcxbWJhRDZtNzZQV0tYN1JTQ0hHRTFOR1kzVnpMajZUWVhmL3VjUUkxWU52?=
 =?utf-8?B?R0hNanZtMzVGUFU3RC9vcXhwSWVXMzNXaWxDa0JqanIzcXRVS3ltTlYvNTdk?=
 =?utf-8?B?RlR1OWhEelphTXJ4cXBVQVE1VTdIcUZqQ0hFVnc5U2VmMzJGNEIwSEJqMmY1?=
 =?utf-8?B?VmRjWDI5MUdSbHh6UURhejhvT1d0NEUyMjExR2ViMzJISWhmczRydz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63e07b9-baed-42fd-c689-08de4228f9ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 13:41:29.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYc8cXrFzBStoWmqHSAQbPjUSBtuvmdjUAsmo2KSuw/+Vsb7dCA50FGN5U5GI6snQju7fVxRRewpvx+ktrBhxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
X-Proofpoint-GUID: detXTEAyTiYmjjSuW4UvePbjsr6HlFGC
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694a9c0c cx=c_pps
 a=mfnpAPd2LV9TTO/yo6PAYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=IXT0MUPOjvkDjNDExAUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExMiBTYWx0ZWRfX4VmsB0g9qUFQ
 ri+UYcaeq/Vj1EUM0NAPFpuwVkT58amrlzELmn8KhGRhpHP5oMdCzIYKLXbVl4XvNPvPwatpr1h
 XHbugKpwtKXRfNTJoC/NXGGVhIOCKh3Y2Ws80OmLnijB5kQ0E2DR/n+q8ASQlxzveqmctq2ZNLR
 Hc+/mGc552XqJrbmncGGtyHcNnSsJsaa0aGh0/BMTSXZAWHGWMrtEpEjnzSD1uTBQreOu1RJ/32
 6+cR882DaQBA8rWBvajnrV8SLK+ATRcjuA8pLbCONjYnM1FTBo6DAM3umFqZHb28twMOeJQLsuO
 0UTBorv3jd3XQmW6G+1nrwGVPVYz1rpIALCKhbK80H36Ndt/wAwKeCPHivkF2nI1/6G7SXlTDYw
 FWv59F9qLUQtFM3Dv6VRmVvUQr42kuq5aMqtt2SL7+FiL8PqfDOdJuwvsygNYH07l8UF/JoOH9J
 9DjD0ZN/dt9E8xm6DxA==
X-Proofpoint-ORIG-GUID: detXTEAyTiYmjjSuW4UvePbjsr6HlFGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BNDYPJd038517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228469


On 12/23/25 01:34, Randy MacLeod wrote:
> Hi=C2=A0 Yi,
>
> This is probably fine but it needs a better description in the commit l=
og.
>
> Please explain why you're making this change and
> what the implication is for users, such as changing a build-time=20
> config to a run-time instantiation.
>
> Also the conf files change is not mentioned.
>
> We'll hold your other kea commits for v2.

OK. I will send v2.


Thanks,

Yi

>
>
> In patch 2:
> Is : kea.volatiles for sysvinit ? Is so, please mention that in the=20
> commit log.
>
> Patch 3: looks good.
>
> Thanks,
>
> ../Randy
>
>
> On 2025-12-18 8:44 a.m., Yi Zhao via lists.openembedded.org wrote:
>> Create runtime and state directories using RuntimeDirectory and
>> StateDirectory in systemd service files, rather than creating
>> them via ExecStartPre.
>>
>> Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
>> ---
>>   .../kea/files/kea-dhcp-ddns.service                  |  7 +++++--
>>   .../recipes-connectivity/kea/files/kea-dhcp4.service |  8 +++++---
>>   .../recipes-connectivity/kea/files/kea-dhcp6.service |  8 +++++---
>>   meta/recipes-connectivity/kea/kea_3.0.1.bb           | 12 +++++++---=
--
>>   4 files changed, 22 insertions(+), 13 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service=
 b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
>> index aec6446f0e..feef7e0b6e 100644
>> --- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
>> @@ -5,8 +5,11 @@ After=3Dnetwork-online.target
>>   After=3Dtime-sync.target
>>  =20
>>   [Service]
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
>> +RuntimeDirectory=3Dkea
>> +RuntimeDirectoryMode=3D0750
>> +RuntimeDirectoryPreserve=3Dyes
>> +StateDirectory=3Dkea
>> +StateDirectoryMode=3D0750
>>   ExecStart=3D@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddn=
s.conf
>>  =20
>>   [Install]
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/m=
eta/recipes-connectivity/kea/files/kea-dhcp4.service
>> index a2ed4edb59..ce1256cf26 100644
>> --- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
>> @@ -5,9 +5,11 @@ After=3Dnetwork-online.target
>>   After=3Dtime-sync.target
>>  =20
>>   [Service]
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
>> +RuntimeDirectory=3Dkea
>> +RuntimeDirectoryMode=3D0750
>> +RuntimeDirectoryPreserve=3Dyes
>> +StateDirectory=3Dkea
>> +StateDirectoryMode=3D0750
>>   ExecStart=3D@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
>>  =20
>>   [Install]
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/m=
eta/recipes-connectivity/kea/files/kea-dhcp6.service
>> index ed6e017d0c..6123a8ad58 100644
>> --- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
>> @@ -5,9 +5,11 @@ After=3Dnetwork-online.target
>>   After=3Dtime-sync.target
>>  =20
>>   [Service]
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
>> +RuntimeDirectory=3Dkea
>> +RuntimeDirectoryMode=3D0750
>> +RuntimeDirectoryPreserve=3Dyes
>> +StateDirectory=3Dkea
>> +StateDirectoryMode=3D0750
>>   ExecStart=3D@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
>>  =20
>>   [Install]
>> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes=
-connectivity/kea/kea_3.0.1.bb
>> index 8729b1162e..1be557c79a 100644
>> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
>> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
>> @@ -74,13 +74,15 @@ do_install:append() {
>>              ${D}${sbindir}/kea-admin
>>       rm -rf ${D}${datadir}/${BPN}/meson-info
>>       rm -rf ${D}${runtimedir}
>> +    rm -rf ${D}${localstatedir}
>>   }
>>  =20
>> -do_install:append() {
>> -    rm -rf "${D}${localstatedir}"
>> -}
>> -
>> -CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf"
>> +CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf \
>> +                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
>> +                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
>> +                   ${sysconfdir}/kea/kea-dhcp4.conf \
>> +                   ${sysconfdir}/kea/kea-dhcp6.conf \
>> +                  "
>>  =20
>>   PACKAGES =3D+ "${PN}-python"
>>   FILES:${PN}-python =3D "${nonarch_libdir}/python*/site-packages/*"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#228122):https://lists.openembedded.org/g/openembed=
ded-core/message/228122
>> Mute This Topic:https://lists.openembedded.org/mt/116841995/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

