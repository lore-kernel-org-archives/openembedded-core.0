Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9017DCCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 03:33:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7389.1760499205678153836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 20:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gh0b0/6a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383de7e2d=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F1UgCr760136
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 03:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=cGaFKv1mAt1HCWN4Uc0/rc9UDGJ1YIWvZ85V8X4rhwI=; b=gh0b0/6aF8U5
	R6scxZkNfOu4G5uLpHhe1/eB8cm5Ur4p0IKKxLW2Beb35br1P2P/NafDZBz2AmYd
	xmMUn2VoscLo2+tgTgL/L8oC6qhfvrCfYgOjJUxHFRi0xWPh0YctxxEJ5A9CgPNA
	hFtTT4PJUTUKZ8jEC2J5fbvylGA+3gjFor7Hy2FA2QBuRXGc/H9zCwz25j2OSr00
	/jH1zlsuhOe89UrSzMPdXh50UUMtQmY5bnbNNfZ8xRnaaeSh4jFWL8Z0dOImeYVl
	+Bhi/0JNkAUBp4KbsXTj2JWlO+px7S8QVltRHQNypZ6bQhFCMy1NvwlCIBO2cDHZ
	nIiHcAO6gg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthh8rab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 03:33:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uApQxmkAjUAWJn6THKYnr3GYhpBYgZP4e/UdBrk+F2ZlTmWW+qupbYLyj/ETvpLuHByy2lhMcXkBfCPqXusEoCtqtisD42mbKNEbxU+DnJIxAa8lbq2NQg5WRL0Uc1CWFWqMiQEGL3QLPWPlJ9alC0/z2I5vDJQ15vB156ixEUoZ4+7IezWGFHTAJKMb4Ekk+MFE08SXAZ0wr0D1MZEFEcw/vpOwJ6sca3pId3aKMd8MSZi+inWlMjrNVbcAgVnhi19HbT9ILOFMP6DLgGfahHh5ojmOU30CoVJ1shfYybm33bNT2yC/F7EWSpFxG+u1vhbalnA49Zw+wqYSE6Bvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGaFKv1mAt1HCWN4Uc0/rc9UDGJ1YIWvZ85V8X4rhwI=;
 b=zTy2vt72HWDOSdL0TtDCty6tv7b1+I1xSSEnfE4HwtAdT6QIlLQxep03+OHtdAosB19URqfE3an6/bsPhbn0uRhPsocmJn9l7zXjZPJ0iPD6VimPH6DfrZpfvOHeoXLDAaK0GD5/TjwfaPLLxZ76YuKlXz20d8qt1FPcINiSTlH0neltJtInIRELlR9aisYlQ9ob6wCWxNZL6xRt4czcd/JwelPv9B7mSonBUqnUZy7HbU+PJg9dldCnPzj+PHqP1xN8pU3PmOfuoegKVo04BDALySb6SDS3UbRZZgyck2u8y5ENmhN0Jcem+rqhh2dox3YBCNQeO4LWXqUUvouTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 15 Oct
 2025 03:33:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 03:33:22 +0000
Message-ID: <f5246008-5064-467c-ae06-baf42f0fc110@windriver.com>
Date: Wed, 15 Oct 2025 11:33:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] musl: avoid redefinition error on ethhdr
To: openembedded-core@lists.openembedded.org
References: <20251014121513.2606389-1-Qi.Chen@windriver.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20251014121513.2606389-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6bdd79-f749-4769-59cd-08de0b9b97a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXRScnFrQ2ZtNzk2em9XM3dseEtkcTZNbGt4aUtoMlQyYzYvcXlScmlDdk14?=
 =?utf-8?B?VmEwTEFCMnNvQ3ZsWUlnU01HSDhCblRGUXlvVk82ZW9EYi9KcDB3RGttUE9m?=
 =?utf-8?B?cWhoYU1jVVBWTlAwZGZFZTdWYVRVZ05OVWdZelZLdGhDK0RLL25ROW9idGN6?=
 =?utf-8?B?S0dLSFJlY2hMaFBUUVEwLzRaa3JJUlZZUVFuVDJBbmc5aTVyZFBjS1lJLy9R?=
 =?utf-8?B?OHBjLzRLQkEzRHJUUlJlSS9hNGplWnZxWlJyQmRvR1VBSG5sbTBIWVozWS9F?=
 =?utf-8?B?Q2Frcm16RmtlNlJJV2U1cEJLSnFnWUNka2krMFhsTGVJUTJsUWFTbE8rRHVE?=
 =?utf-8?B?RzBNRDlKay9xa0tmUS9wQ041RDcyZHZua0hRQWtFNEFpQTBXOG9nVy9oKzBZ?=
 =?utf-8?B?TkYvbFpBQi95ZVJtQ1FnZzMyd3N0Qy9TQmt6T1EzLythL04wa3RWUFY2MmVM?=
 =?utf-8?B?eHFwQXdqNFM2RENqejN2WUdGbkFic2s1TTJ1TjNwZzZ6UWdJME9zU0liUFQ3?=
 =?utf-8?B?NEVTZVBDeis5UjlFVWhqbm1pNkFXa3RaTVBHT3dvVjIxRzZkenFIWXgwbDNw?=
 =?utf-8?B?bU9GaG1yeEs4ODkxQmhvYW1rLzhWajA3akdRb1FZdEJhZVZaNjJyQUFLY1JW?=
 =?utf-8?B?RWFLWmtuMi9rVFRoN280WFpPeVlTOG5qL2dJYWg4OUxCTGF3OWtFYmxYd3ZV?=
 =?utf-8?B?WVFYdmovMVZzZ1k4bG9DUEVtdERjNS9ZdUJNd3hhdXRHM1JIUkpWeFZTazNy?=
 =?utf-8?B?R2IvYmM3YTk5R25kS1JEV2lQVmFyS284bkpoV2lpeGwxd2FKWWRZRTU4cVpJ?=
 =?utf-8?B?NmlJMmQ3NDZiVDlSVmo0MmZjem5QMzNiTVRHaTN6QTR3K3FpSXFhUmV6SFVz?=
 =?utf-8?B?aVNLRXFwdThXNG9lVnE4L2QySWx0ZlBPT3Y2NitWUXllZVRDQ1c1cERqcDBL?=
 =?utf-8?B?WTg4NHF4T3oycVlBVWNIOEtobWZyWVZ3S0JvRSswR25zWHVtcDY4Rk5FNVgv?=
 =?utf-8?B?VjJPaU45cGwxTzRSelp2dDFuVHZ3UTJqNE1xdVpKakV3L08xb0JYbVQ1VDYz?=
 =?utf-8?B?WUlDRE9sMDdlbmI4cjY2ODFFL2V5N0k5ZzRQT1JFc1FkdzhMNUxXa3BHZkhF?=
 =?utf-8?B?bFI3YkFyZ1RYMkh1T2FPaHFrRVRpL3MwcUZld2R0VGI0MCtyeno4TDRmVlRC?=
 =?utf-8?B?SUpuUkJrYUNGUS9yZUN0MXpwallaOWkvTWd1Qm5KV0tXSkZnL0R4U0hWWFFq?=
 =?utf-8?B?UmZnVzUyUFZxK3JnaUpGK3czdHZTNmRrY3R4WnlqWWtiRTJLeXVFOGRhSDRK?=
 =?utf-8?B?dzEyaHN1VTVGTGNGakZOYkkwZWdVQ2VucjVvUUpoWlRHZmkvQUlZM1R4amIr?=
 =?utf-8?B?aTQycU1vejR5VCtzakx5VW5nakdnUVc5QXRYZ08raWJWRTJQY3VFWFBRa2d2?=
 =?utf-8?B?ZmVQM0h6QW1zY0dqVmdqYzZZOUJTRC9CZmFzUUx3aTFVdnpPNlZxSitYNnR0?=
 =?utf-8?B?Y0dsMktqdDNnc1IzQmhQRGNCekQvekg3UUgrQmk3OGpvdkdjeVAyMjQ3UEps?=
 =?utf-8?B?NXE1QkVQVVdLQTNTZkpxMGNDYzV3WS9JMXl6Rjl4Wit0SmdZdk8wTTVhWGhq?=
 =?utf-8?B?YzBMZVZNbWlHUlNWOG9LNStXbGFMdjN0ZnVYK0k1Z3ZWdldOQjJzWlVzbEdJ?=
 =?utf-8?B?bkEvSzU2bkh0a29mS0h2UFp2cklkcmZ1enFWbVJhMXJHWG0waDMyZXQ4aG1l?=
 =?utf-8?B?YkcvWS8rMkoydHVqRzdHVlVweXV2K3hVemRPOVIvckNrWTJwOVI1Z1FXVXFv?=
 =?utf-8?B?a0orYUV2bWJnVnVaZFFia2tBaFR2TlhMM01tdFdlSE5PSmFvNDRFTVY5MlB3?=
 =?utf-8?B?NjNzNWF1RkozdkgrNk5Pd2pJWHpNbWV0MENxSnV3ZXlxeXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0F1bkxmcnB0TTA3Z01PVDNjMTdWUG5Pb0ZDcHJna2syMk1FQ3d6VXhLSldv?=
 =?utf-8?B?YkVVeWVscU9mNXpqaVBndFB2ODlkS1RhbVYvVitFa0xWTStJL3ZMSk5Gek1K?=
 =?utf-8?B?SnNhcTB6dW1ZYlBkcm80d3BXMG9RU0FOZ3NUdWlJdnpvYVVYVG84K0FqNnEv?=
 =?utf-8?B?VU9rNHoyWmRzYTJMdnRyRERzQmVFVG8vcURJOE84M2FTVWNIQmlSeDJlSUdY?=
 =?utf-8?B?eVdIUlUzZ1RITHFTbmo4RmhVTTNtVGRjM0pYcTV0bEdYQ0x5ZVJDa2lNRElO?=
 =?utf-8?B?dXk4b2c5QWZvM05lK1dmdGFkdVhUNUpRQUpnL2hJOHBkeldoK0taZWZaVmxE?=
 =?utf-8?B?MDdldmJyYlFDamN5ejZ4ZjgxaFBuUVp3dWJjNEZWenA4a3FKWlc0RjRhOGtG?=
 =?utf-8?B?Q3ZwZ3ZOc3VwRDhMT0RWY2tDUi9xMGR6Sm9zSXF2RjZRU1FHdWt1MTk1WFZn?=
 =?utf-8?B?MmJVUy9RbHc3Nld5eGg5UEJPa3piMko3ZjVBYzNaTzdqWDliS1FMcTdRVTdO?=
 =?utf-8?B?ZmVBS3RoaUZJYStidlNYWnVqVFdxTjdkbVhEdWl5a2kvVlFobmw4L2E0dUoz?=
 =?utf-8?B?Ukh4WUI1TEFlUUMyVmcvbkpIVWhTd0xpY3QvVnpZTmcxY0VmVHRTeVhWZ3E2?=
 =?utf-8?B?dE5JSjFIdEpFMzdEc0M2T3QvSVdQU1cwSE83bGJoQ2x5SjJzbDZVb05NbDJF?=
 =?utf-8?B?MWVaSy9ZTHFTZW9oQTh2bXBuODczcWV2bjJXUWRWd3dFRWVWK2FPRFFUZXFS?=
 =?utf-8?B?cFAvOHA4UThsNkxXZ3M5MmxNM3FLSHZyRXRDV3MzVVZNL216dkNOdVMzMS9J?=
 =?utf-8?B?cjlrM09pejVkeXVBSkNIdFRxbUZWMkNzYXBFSmEybnk3a3dMZFZHZUM0dEpP?=
 =?utf-8?B?Zmhob01Tdlo1M1lVNjNqY0QvL2NGRTViMWxQYkN4RE5CQ3Q2RFh2bHA4VlhM?=
 =?utf-8?B?b0Y3aGFsRldRbXZIZWp0SkdLWjFOSlc3cmhRL2FQeE5tcFUzMk8wc3J5dnht?=
 =?utf-8?B?NG5TRjkxd2IxYkt3ei9tN3FXMlZkemg1MzI2NVhxNGx6eXJBVytmV3FwaTJm?=
 =?utf-8?B?VlhIZmN1OUxWTDBTSXViMzNObi9hQ1FZYURoRG5sekgweTJYVXZ2TTZheHY4?=
 =?utf-8?B?a3lIWlBrcVFld2J0S1hJcnlQck4xZDFVYzRUSjlScTFFckhmMlEyc3FIaVdk?=
 =?utf-8?B?WklHUk8yLzFmeTd5aklGKzNxSlB0cWZ6NGhJWDJNYzF4QjVma1hXQXZNbnJp?=
 =?utf-8?B?Qzg2cHJJSEZkWXdZUUN3aWJNZFFUWnAxVE02S0JGV3FFRWViaTBIbXo4bjNQ?=
 =?utf-8?B?TGRpOVNoL3JUeXIzV0cwVVhhVUE1cjBYOEFZTEwwL09VUk9ZSzExaW5qcStD?=
 =?utf-8?B?NFdOdHc5bzdvNXNibEZzOHZYcUlQemVwd25LbEREWEhuWThJV0dJMk4vNE1k?=
 =?utf-8?B?UnBDNjZmMUg3MU9OSVRCRkFLc2ZKZElINExFclEvMnhUOE5yZ0Z0MzYwMVUz?=
 =?utf-8?B?anpuMVJORTY0eDVsa2tsUWFCUnVzSzdkTzdSMmxJYkw4bzBmODBBSXdMNU9J?=
 =?utf-8?B?bUdJc2dHYmhkbUVySTB6Tk9XUnVETUtFNUdpdk9DSDQvc3FVUFdVRTkwRmZM?=
 =?utf-8?B?QTVVREI2U2VrcGhndzF4dGVIUDU5c1U2ZWlXTHRzU2FHdysxSEM4WUlOZEdn?=
 =?utf-8?B?aGFmbGtYN1ZxRDFBRVJQMGlkNmRDS1RTZ3pka1NJeEVqSm5jYVpPdUU5eHhu?=
 =?utf-8?B?Ny9ESnpDSFlISlFGelRYQ0RJVHNkbXR6MUszRHpUUzNvQzNLd3JxajNoU0My?=
 =?utf-8?B?dERjejNZRlhUanQ5Mm9iZERYMkhzY2tOQk1Pdldnd2lpZ0FZOC9WUS9EckN6?=
 =?utf-8?B?UVFsRmdvVjF2aFExbytQMkQ4WE5XaDlScnJ3ZWhqNjEwSWFrRjZGaVFKOWE1?=
 =?utf-8?B?THJ5YzBIMlJZaHJ2L2ZMVVE1S1dOOUJqOXpRUzFyUGQ1L2VuNXoraUdGTm82?=
 =?utf-8?B?UUY4OGMxWW1Od0VTaHJvbkJYcTNUUDVLMUVXNStKdTRVZ2lsRE5iRzFwNEZr?=
 =?utf-8?B?U3B6b2QvbTR3aHdDTnovN1JIRlU3NkNzNkVWTDl3ZTAvcVFoYy9HZHRQVkxX?=
 =?utf-8?Q?pOH0lbAznEEfNYkTxreSGAhDW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6bdd79-f749-4769-59cd-08de0b9b97a3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 03:33:22.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiBvPa7BTGFJZ2UTD/slSR6fOikYtKtP0TGSndHiaK1bYpnzzhYWZefa4Ta4jNJdIKMmwBA198rdm0Edy9I7Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
X-Proofpoint-GUID: QXbKeGIDYk_kjV3qsUkvrt2ymAB0LGgR
X-Proofpoint-ORIG-GUID: QXbKeGIDYk_kjV3qsUkvrt2ymAB0LGgR
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68ef1604 cx=c_pps
 a=F8U3mngwmb3oM6JELIq/Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XkRKQH6RAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=5KEJ3k9QAAAA:8 a=bKiee93LDus7gG5LKuEA:9 a=QEXdDO2ut3YA:10
 a=1gUyE30hU_ULiMxJiLUW:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=olg2BfGzmf2haRflzj8J:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDAyNCBTYWx0ZWRfX06SLtkJCaSix
 rEAomPXgG2peJMZ4DiOhHAXlOXEoridDT/FqJmK7LWf/pl6ugLc7FxctchmwXZIEAYlwX+hSZP0
 TjsRuhnX8/+AbContaXHIqjgqd7iIt9LnDdtA96kpvfIz8MF+PwqHMMJmZ5khe8x2SNBieP5dBj
 U6hFyoPgf/lMkPbO7tQLNcOPZb4AavhDl2aSOVR2N9lmR5BVB233t+KvumOJjz8iYzAnNqPKo2y
 RYLV+Hn66CDb7innXU7jYC3kY952Rey2ZR14VY7t8V1RkEKaHYYbgRXLgAWIY8P/Kqar8p0DBeG
 4sYuMCFPlGU68RX3oURgwKlD4qGPQNTZeNrZ6hJU4GARdyiqo0WtBzp7D6KoKd0nUuM+bKpVt1C
 C8+UuPixPXSgasUiZEX2dlJzuzQ7Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 03:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224873

Sorry for the inconvenience.
But please don't merge these two patches.

I just got a clear message from musl community that the second patch is 
not appropriate.
https://www.openwall.com/lists/musl/2025/10/14/2

I'll re-work on musl and systemd upgrade and send out V2.

Regards,
Qi

On 10/14/25 20:15, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This __UAPI_DEF_ETHHDR macro should be defined right after
> the definition of 'struct ethhdr', otherwise, we'll get
> re-definition error in some case. This is because the
> lines under 'struct ethhdr' definition are header file inclusion
> lines and those header files might also check __UAPI_DEF_ETHHDR
> and define ethhdr, resulting in redefinition error.
>
> Another problem is that if_ether.h in musl should also consider
> the possibility that other header files included before it also
> defines struct ethhdr and __UAPI_DEF_ETHHDR.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...if_ether.h-define-__UAPI_DEF_ETHHDR-.patch | 39 +++++++++++++++++++
>   ...if_ether.h-guard-ethhdr-definition-t.patch | 39 +++++++++++++++++++
>   meta/recipes-core/musl/musl_git.bb            |  2 +
>   3 files changed, 80 insertions(+)
>   create mode 100644 meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
>   create mode 100644 meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch
>
> diff --git a/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
> new file mode 100644
> index 0000000000..800273612d
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
> @@ -0,0 +1,39 @@
> +From 5ab64f7e08ea0325d83d446dd4015f82b4c179dd Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 29 Sep 2025 21:39:01 +0800
> +Subject: [PATCH] include/netinet/if_ether.h: define __UAPI_DEF_ETHHDR early
> +
> +After 'struct ethhdr' is defined, we should immediately define
> +__UAPI_DEF_ETHHDR. Because the following lines are header inclusion
> +lines which might introduce header files checking __UAPI_DEF_ETHHDR.
> +If we don't define this macro early, we will get redefinition error.
> +
> +Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/09/30/1]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + include/netinet/if_ether.h | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
> +index 3479f511..b1646f6f 100644
> +--- a/include/netinet/if_ether.h
> ++++ b/include/netinet/if_ether.h
> +@@ -117,6 +117,7 @@ struct ethhdr {
> + 	uint8_t h_source[ETH_ALEN];
> + 	uint16_t h_proto;
> + };
> ++#define __UAPI_DEF_ETHHDR       0
> +
> + #include <net/ethernet.h>
> + #include <net/if_arp.h>
> +@@ -144,6 +145,4 @@ do { \
> + 	(enaddr)[5] = ((uint8_t *)ipaddr)[3]; \
> + } while(0)
> +
> +-#define __UAPI_DEF_ETHHDR       0
> +-
> + #endif
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch
> new file mode 100644
> index 0000000000..343b0976ed
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch
> @@ -0,0 +1,39 @@
> +From 67976391887c3c65138a3b6fc306f2f5b490aeb4 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 30 Sep 2025 10:42:51 +0800
> +Subject: [PATCH] include/netinet/if_ether.h: guard ethhdr definition to better
> + work with other header files
> +
> +The unconditional definition of 'struct ethhdr' has the implicit
> +requirement on this header file, that is, it needs to be included
> +before other header files defining ethhdr.
> +
> +Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/09/30/2]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + include/netinet/if_ether.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
> +index b1646f6f..e5a1ebd0 100644
> +--- a/include/netinet/if_ether.h
> ++++ b/include/netinet/if_ether.h
> +@@ -112,12 +112,14 @@
> + #define ETH_P_XDSA	0x00F8
> + #define ETH_P_MAP	0x00F9
> +
> ++#ifndef __UAPI_DEF_ETHHDR
> + struct ethhdr {
> + 	uint8_t h_dest[ETH_ALEN];
> + 	uint8_t h_source[ETH_ALEN];
> + 	uint16_t h_proto;
> + };
> + #define __UAPI_DEF_ETHHDR       0
> ++#endif
> +
> + #include <net/ethernet.h>
> + #include <net/if_arp.h>
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 3f5fa37fba..ab4655b378 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -14,6 +14,8 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
>              file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
>              file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
>              file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch \
> +           file://0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch \
> +           file://0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch \
>             "
>   
>   PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224817): https://lists.openembedded.org/g/openembedded-core/message/224817
> Mute This Topic: https://lists.openembedded.org/mt/115751322/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


