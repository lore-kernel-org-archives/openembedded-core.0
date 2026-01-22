Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B81D6CFAC
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 22:48:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51615.1769122125804505410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 14:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sUPoXDo9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54825d6134=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MLq5Xq2232321
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 14:48:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=UYiS7yeNRHKwfPea+MJRYBObB1wrtWdxydcqr1aoGTw=; b=
	sUPoXDo99hyKL5hLBMYUkCh/5Yi340pFx4JH0urgbVjVT/cBDgxnbtr99ILDT1b1
	QO7cldO3+wnWYQTFmqZoURiQ5fZki7VKsomoJzTDhE9QB2mH+WDI3M79KvSR90sB
	nzwfy6m4Xi22sSAOOa5jRwzFKPoJIe8mimHmF7S7tUgHXVDXZFKyj3DlgpbECngi
	p2yZHOzyYvVv/pkMKEfB+sC8h8FVrVQ+PD24eKhs/pVrtXyKA5pWTM4pHFsNmXAb
	HD1SshtpkibBurOOWQrIypj/PCRXl7o1AF91PI6ymcj9BsKHt+8u8Z6c+fSbeBys
	RxST/e9HSI5NfPXxtq0iQQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btnd73be7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:48:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Coh6K4HnsXm7T1xOyMD/46NZzOXjbXnFdm70WHgnz4jMC9sgk7juhwB/o9qfWmFoVwVoBfC6V++Yj8ySfa7Wd5eT+V82d3PxDuRv/2rJXod0sOuimlfQQJhwkKIFOKWL7iNF957M1fow7pZtBT2w9vdNTNlw+W8nE13FTvQDnz9jLNTVtJODQVfgrKScZF0cTdl2hZy5p74Vhx+zJF3hLUf7Q/FImu0SX4RiYfjufwArZfY1c8A8F6rSf2uSaeHmzGJVxLEy50D0TIII3320ZBCOxxA6sH4XAlIKPdQBprUIe6ssWZSQoSayzgh+nSw/UFJllshgQKUw9kvaQpHQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYiS7yeNRHKwfPea+MJRYBObB1wrtWdxydcqr1aoGTw=;
 b=XnWhgxOiY22bKyWO4o5/rZj0oZjpHpVMNWh113lQIj4KobwGKBIK2iVJyk41Ai5mcJ5BspFDy1BR77DJnK6L7paIMDEbWcPwu1NsN68V8m/50g9bR0NC1jwijsg5w8rlhFUzElvAL/uFe7DVJ2Mlu34Dnow7s0aUPooXLZiFBh1mG9G7opBg4vLQxYY45DxVUQoiwezQWa/0wEC4m20QcIfcvitD6sV6Dat40vsrwyQKeXbeyWo3DLHJzYpwGPJ8WmQFS5fnprL0A+DXEUxVRloISa9SLYcTEtpQ4MTDnPdcri9smrdX8QVLxK8aqk5LQt5TQ0nDGkfFME05ORCArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:48:37 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 22:48:37 +0000
Message-ID: <ab832338-75c4-44e7-b649-ba6251045a86@windriver.com>
Date: Fri, 23 Jan 2026 00:48:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying directories
 into wic image with ext* partition
To: Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251001163457.49114-1-daniel.dragomir@windriver.com>
 <CAOSpxdas1e33jheu0ELXgQQf9e9+8ccwbFTkffhPPYObAnjJRA@mail.gmail.com>
 <BY1PR11MB79813ED8D397932BA1178D36F7E4A@BY1PR11MB7981.namprd11.prod.outlook.com>
 <CAOSpxdZwfQG_8JUbmvqnpGg=0oTimNv2q=XOc4iW71rX8G04zA@mail.gmail.com>
Content-Language: en-US
From: Daniel Dragomir <daniel.dragomir@windriver.com>
In-Reply-To: <CAOSpxdZwfQG_8JUbmvqnpGg=0oTimNv2q=XOc4iW71rX8G04zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::20) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: b86e4f96-4059-4235-8e5f-08de5a08616c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MEVFcFh5VnV4bG5zVVdQSUVEYk1kdjI4aG9jNmNpSVkzMWxLcW0rNWV4Q2Uw?=
 =?utf-8?B?RFRjVW9EWFBabGt5c1BKR2Y2M0N4WUczbC9JeklLSFVFZWd6RHFQSDd6SHla?=
 =?utf-8?B?YVYwWFU2R3F6MnljdGQwb0FpdlFpalZIZGFWaTRiYWo5b2RZMGl5Z2hBSGpq?=
 =?utf-8?B?RkZaeERLMisvZWhlL2FBS1JGNVRaRzc0NFJDS21PbCtvRERKWWxsWm1CMW9U?=
 =?utf-8?B?V0VKT0JLaHRnMkRCcXdiQVJFdlBJK09UVEk0dWdXRlVsTXJ4TnptaU1Eem1N?=
 =?utf-8?B?cVNDVGJ0dldleDEvTGZsL2ptcldUbUI1U2NwL3RlejRNQ0ZBOUc0OFlKSmF0?=
 =?utf-8?B?RVNES3kveDg3dFdHclZOaVJkcG4xNStiQnlOTURDa0JZVUx5cmtpUTNHYmlw?=
 =?utf-8?B?UEFoS2xOa0VIRGlyRFdQTzBHYSt6bncyMVkyY3VOUE9ULzV4d2ZwMHc2a0NL?=
 =?utf-8?B?ODBzVk9rQ1lTS2ZTeE5SclVzaVhmL2k3REk0UThUcWViaU1sbWh6c01NdnNs?=
 =?utf-8?B?M1F1MThGWmVYQ0U0QnE1QmtNTDQ1S09vUmpIa2I2Wk9tWkJ4aHk3dTFXeExP?=
 =?utf-8?B?ZmoxTWdqWVd1TjR4RHBIdUxDWFdxNzdralRVSGp4YzNXTDFoNGdSMWIyRE9w?=
 =?utf-8?B?eEgwR3dHeDhRN2hqb0F4d2t3V2d2NkJUekZ1YWhhVU1NbGgwWXZRUmV4WnVD?=
 =?utf-8?B?T2p3bXdTR2ZmcTJBZFpteXlBSVhZVDZJMHpWblhtcWFCakZoUHFzSjcxUVJK?=
 =?utf-8?B?WlpQbzhnM2lSRVZVZzBBS2hzc1IzZHRUakdPajNQR08zY2hsd2xodEZuVnk2?=
 =?utf-8?B?ZlNpZlJsU1NPd2swVEx1NTF1TEtGR1ZDdzRBRUR2WjcxdFpQRDhTRzI4RmFT?=
 =?utf-8?B?VTE1REd3S0QzL2lERFlHMkVWVjdJd000REs5SEhGVDkrMGRvSnN4d1VPVTQy?=
 =?utf-8?B?akZuelJ6NWdpeHJnRWRPT0lhYTh6dVU2R0Fnc1RCSmtFSW9EbDhwc01zNVJP?=
 =?utf-8?B?TlR6Y0x5elkycGdjc2srLzU1SVdqNkdUMVovdzdCYTNyVVYzcWhndzhFS0tF?=
 =?utf-8?B?bFRrMkwzd3VEd1J0ckEyNXBHeGRhczEwc2Z2eWxpa0ovMVVDVDBpbVE0U1Vm?=
 =?utf-8?B?cGVBNEpFWUYyaE5udUFHeWV0ekxFYnZhTzRnT240bTdPQk5IRkdFaEs0WGta?=
 =?utf-8?B?eTR3UmpycS9QU0ZMaDZIV1BwL1ovSUdNaTdaSmVoOVMxbitUcms2VllqMGNq?=
 =?utf-8?B?VkdaK1QvTnd6eHlId0VyT3E1SDJJM0Jud2EwVkhmS0xVbS9rR3JQdUtYdVJM?=
 =?utf-8?B?NjhteC83Wk5mN29mV3h1R3lSK0Z3NjRrMjZvV24xNzB2NVBVbGw2WVJ1TDFp?=
 =?utf-8?B?eHBmZWNHVk1sK2F0QzZLRS9PYlgvUEM4VWxuQmpiY1VFVFZCYThNcEd3QVhD?=
 =?utf-8?B?dUp1VW5XTnFoTkptMVJoRGgrbjBEKy9qMWlSdVVnd3ZSOUxLNktMQUxGMHlO?=
 =?utf-8?B?TVpFV1Y1cjdhVHZHY0xjZUdVUnVkbkkvcnZWQkYxUThpblovTzVQUkVEQXFC?=
 =?utf-8?B?VGlObWJtcENxai9RQm9LQm5QQzE2S29uazZZYkNTaW1neFduYzc2YzJXQkRQ?=
 =?utf-8?B?L2l1RUhhODJNL00vSUNvVmJYKy85elNlNXczblZXNWplWXdMbFZDR0htNHIw?=
 =?utf-8?B?OXZWMUpFTWVGRjBUYStVSVJGWVY4Ym0wQUE4N2dmTVgwN2FHYmtVRklINTdD?=
 =?utf-8?B?Z1lkWk5qdTdaU1BLSXVVZlp6ckFPdytnNE9aVTFEcmtOVFZTMHNBS1dXUlNH?=
 =?utf-8?B?VDJVM3B5RnBNU0VyWVJqTTRzQ1VEOTNtbDM0a1JIRjNiMmpmMjFObG10VWd4?=
 =?utf-8?B?T2hhUm9jcDVQMDNSR3lrR09tWnZESVRzQ1pPenRMbjRMcHJBVm9XTGR5T1gr?=
 =?utf-8?B?WHQ5M2xkcm1TbHZhTTBqS0hYdE9MUGlhOWdLUHpBallsVmEydzh6dHY0VnB1?=
 =?utf-8?B?SEdaU1JreW5RaHJkQUpqanpwY1ZKalZNNUZBMTdoY0lFOTlBcit0WGc0ZUNO?=
 =?utf-8?B?d0FyamdCTytnem5QTmo0R25YQUNDb3IzZE14TGxNcW9oazRycGg1MnZPQnEr?=
 =?utf-8?Q?p1jT9vd/zrsdyVQd74gRu+t6Q?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZTN5a0NvaGU1dUlSMitBNGY3VC9IL290amJ6eGs5NVNLYWRuYmVodGFoendn?=
 =?utf-8?B?RGdzdjEwWWltSWRSWUtSRmM2VWVWS3I2MDc1Mkc3NldFck5iTG81TmxZckkz?=
 =?utf-8?B?c0JQSkZ2bVpQalhveGNMV05yTW9VNTJiY1htcFB5VWxIYnFPVTdMTkVGbE8y?=
 =?utf-8?B?NFF5Ni8zQXVPWkNBalhFZnJBaUduaktVc21FTU9rU1VLY2o2eTRIb2RxYjhG?=
 =?utf-8?B?RFB0V2xWK3o1YzlNeno2Wkx2ZEdrdDlzYVd3K09hTkl1WktDYjlkQVQvZGFw?=
 =?utf-8?B?a3pmbjNsOEtPbGM0cFJvMFVKcUU4NXRFQTFBZzR2VkM0MVl1N2oyTDd1R2lu?=
 =?utf-8?B?clRreGF2M21ZL3l4NHlpV0hVUGl4V1drQnRFS0V6ZFBSaC9MWXc2eDdITEll?=
 =?utf-8?B?V0JYT3E0blBqOEIvWmUvL3N2b1RYQncrSUtPRUFncElidi9pMzFMVktUSHI5?=
 =?utf-8?B?dzJ0TDAwTkUrWkxCeFRWZWE3cmE5SGF0TVQwdWlTRktKT2FkUEcydUFnazZs?=
 =?utf-8?B?dXVLM3F6Z1FuU2hsalZnZlRvTnVnc3ErbXMrUHhCWUJZUEJQZmM4c01vWmwz?=
 =?utf-8?B?V1IrOVBMSS81elVZdmpncjBoamU0eHQ5eXBkYURSWmg5T2hIcngreE1TREla?=
 =?utf-8?B?S3JlUHFldmZKcUx2dVZUMVZjc3QvQWhzdlRJcnVPRDlYR0pTc00yR3dwbkRa?=
 =?utf-8?B?alRIOVJoVDYvVmZFeiszbmJDV1B4bmhVbkp6TGQ3QThXaVZETUJFa0lOL2My?=
 =?utf-8?B?bldYSldvckZ0MEdmVnZ4OHRyVFZ3ZE82U2FtNVpVTE4zU2lTekJ6MFloMzhH?=
 =?utf-8?B?Y21mQVQ0bHkrL3hod2lNNFBZcGdWV1plblA4dDNYZGkwOTR4OFhBamE1OWVv?=
 =?utf-8?B?bE9NTHptRkxROU5yYStTQU5zMHBZVTRiZnBoYXpsVnhwY0dQTkNtMVZrTmlD?=
 =?utf-8?B?bi9qaHlIMEZQa2RVZWJYTkxabTJlT0JqcVE4N1NZei9TUktyaS93em52ajgy?=
 =?utf-8?B?dlEyQVYrTEJ6MjlRcWNhTktMdmJTbG9SaDNpc2RYZHdzd2xuSzNYZnRnNmsx?=
 =?utf-8?B?YWZJR2RZRVZxTzUrUFNNdEFzcUJNdXlib25pT0R4WFVTYll1VDhOUUkrYXp1?=
 =?utf-8?B?bjVic0tNckFveHdyVzgxV0hZbGlqSzVtcldObmdUUlFyYVFZTHJxREVMMWZY?=
 =?utf-8?B?cDFVcjNWVjZOYk9FcGJlZXdPUjV5TElLYW9ETDN0VlZ0Z1BKWk8ra0Vwclpq?=
 =?utf-8?B?NnlxSE5RTkQ0eWJnSXp6NUtkS0llQlZEMnAvQVRIVy9VUmZkbHZram1qL3Rq?=
 =?utf-8?B?bWhSTGZ1b0ppVGtPNE5jbVdFaGZkYnA1Qm9KQ0VPSXkwWDhRWVp4bUZoQ0Uz?=
 =?utf-8?B?TW9aN3VCVS9qb0tqelZ5U0lZWVlIbFU0TGh1amNkanRXczd0SHcyN0M1WHVi?=
 =?utf-8?B?N1pOZWpBZHBCR3FkbXFMaHRVaGZkMEZ1WWkzcG40SUFHLzRZMGlmeHVrWk1F?=
 =?utf-8?B?SDRzUlJDM0ZTdUhiNXZjVStib2c4cm94ZE5rTkVtS1NNUWEyNGtlU3Mxd0tH?=
 =?utf-8?B?c3lEaWlSWmxpOUNTODEzeDQ5UmIxd2hBblVsQXd6bmFiSnd0dWY4R2ZmQXJM?=
 =?utf-8?B?MmxTTFptQm4wejBSbkxqYU1DMW9qZG04aDZNbkU4em53aHpMNlowRXhCcEI2?=
 =?utf-8?B?YmwyYmdFejJTdUh0dzVYUFZYQUR1enFUaVZLazJ2WWtkNkdvSWdIYmtnK1Nj?=
 =?utf-8?B?aUYvb3pzOHZHbXdEM1BwZkU3K1JqLzVndEd1MnlvZUdDY25mdGxiK2VCUUQw?=
 =?utf-8?B?LzJ0anR6ejJ6U0F5YzdrNUtldmpQRG5vdTNncDZwRTRwNmJPQWkwNFc0bHlt?=
 =?utf-8?B?c1cvZHltSkVzSERtMWk1YWEyV2J6WEVSZElabWFjMW1kU0liSXdqMGszVEZo?=
 =?utf-8?B?SEpiNnhCR1kwK0d5RUtmT2tGeHByMnhac3lEdTdvK1FpQU84Nk1sM1pkNlVH?=
 =?utf-8?B?WXZpUE43bUZPenJhdFVkVHRKcU1yVWdNVENJMzFlQ2s1c0RSWUkrelJ3bWZ6?=
 =?utf-8?B?TThJVWJrQ1FUbGRaZTViaDAyN0lqT1ZQWGJqK0ZwdmRwV3lVWlJZbkdSUVFq?=
 =?utf-8?B?SkpVVVkrdkZ1OHhqNCtsaU9qSEJpbU5DNk5NMk1VL3BldVJWTHF5S3VpaVJi?=
 =?utf-8?B?bS9OeEJqVS92TFk5NEczRTUyUUQxVEhGWnNIQVRUeE9kQ2hMdDF2Y29WSWpX?=
 =?utf-8?B?dlZWVmQ3TGgxYXhoczFBZmVIRFNoWUp1NlBuV24rTm9RMHZxQmd2UVFiZ0E3?=
 =?utf-8?B?d3FxUDdmNHJOenZLajNsdU1DbjhWak1RMmdDUGR0dGZFV2lwUG94bzB0K3VE?=
 =?utf-8?Q?WaN7zkJSn7zj9Q08=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86e4f96-4059-4235-8e5f-08de5a08616c
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:48:37.5751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6Kkpg2rtueMiEMM16OCEMhxfr+pFha5BnkQaRuo42KA6Mu/Bmp7JULK1lS0ifXyd4bPvUbOkh8KcfGjFH3DHdiHYRttOCVPR6yMIFJQ3fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: XF6y77JWm39YZh-24TeC9pyQGf_HyOkv
X-Proofpoint-GUID: tgraJIFehHDu5bYaPJCfaJl9DFBisGm7
X-Authority-Analysis: v=2.4 cv=U++fzOru c=1 sm=1 tr=0 ts=6972a949 cx=c_pps
 a=mDGR2lWCdzQo6q5c8Yz5oA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8
 a=XdLFQ8KsTHmtDSzCC4YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE3MiBTYWx0ZWRfX8jn1P2ci+kb6
 hmfewbTIeOY4goGyR23CN7urLjIarGGLIpPHYqT1ggJREHtimHVvRs9qPPzUduWgsjXrjJ7mFuR
 ywuG87vfBSt99lSMnOtd/JHbdSL44vujNftDO5WTwHYb9fNhTgc4EKxo2YSYlN2XIvG0psVB4mI
 eGltwi0CpI4CMjThAwJ1atL3/XAvsl2coU5oGEfTnw9tho1XVG28fDsgmeoKJEZ7eMdQAbKbXPj
 cTsnO3LyTSTPdv7hlsU3+tvYCVU4kTKZmBgHKyiqhzgVZq0yNoSqvWqR5FRKq6NxfA/0pRkEq50
 BXLQxzjRKqWH/yRbUWoAuyaDe/xaK3+jS9f96xRgT1O2JSf3KubtKieoMrm7gIGEs+PaepSZ7rA
 BlOBI8Q+XNg9XDvSjZLs6UbyoxFDgMY295bPPvz7PY4GRHxj8PONaKrd4KUovFbrhZzM5fBsXqx
 /x0biw262l8EOb0uz5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_05,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220172
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60MLq5Xq2232321
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229858



On 10/3/25 19:43, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Fri, Oct 3, 2025 at 12:13=E2=80=AFAM Dragomir, Daniel
> <Daniel.Dragomir@windriver.com> wrote:
>>
>> Yes, this is an issue on master/master-next too.
>> I tested and the same patch can be applied fine on both master and sca=
rthgap branches.
>=20
> Thanks for checking.
>=20
> Please submit the patch for the master branch.  It would be helpful if
> you would then ping me when you see that it has been accepted.  I'll
> try to remember to watch for it, but a ping would ensure I don't miss
> it :-)

Hi Steve,

Those changes were accepted in master branch. I created also a selftest=20
for this scenario.
Could you please back-port the commits to scarthgap branch? I tried=20
locally and there is a minor merge conflict on one of the commits. If=20
you want me to send again a scarthgap version of the commits on the=20
mailing list, let me know.

Commits from master branch are:
6de3d2602f oeqa/selftest/wic: test recursive dir copy on ext partitions
1ed38aff5f wic/engine: fix copying directories into wic image with ext*=20
partition

Regards,
Daniel

>=20
> Steve
>=20
>>
>> Regards,
>> Daniel
>>
>> ________________________________
>> From: Steve Sakoman <steve@sakoman.com>
>> Sent: Thursday, October 2, 2025 5:55 PM
>> To: Dragomir, Daniel <Daniel.Dragomir@windriver.com>
>> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org>
>> Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying direc=
tories into wic image with ext* partition
>>
>> Is this also an issue on master?  If so, you will need to submit this
>> patch for master before I can take it for scarthgap.  If not, can you
>> explain why it isn't needed there?
>>
>> Thanks,
>>
>> Steve
>>
>> On Wed, Oct 1, 2025 at 2:25=E2=80=AFPM Dragomir, Daniel via
>> lists.openembedded.org
>> <daniel.dragomir=3Dwindriver.com@lists.openembedded.org> wrote:
>>>
>>> wic uses debugfs to write on ext* partitions, but debugfs can only
>>> write to the current working directory and it cannot copy complete
>>> directory trees. Running 'wic ls' on a copied directory show this:
>>>      -l: Ext2 inode is not a directory
>>>
>>> Fix this by creating a command list for debugfs (-f parameter) when
>>> recursive parsing the host directory in order to create a similar
>>> directory structure (mkdir) and copy files (write) on each level
>>> into the destination directory from the wic's ext* partition.
>>>
>>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>>> ---
>>>   scripts/lib/wic/engine.py | 63 ++++++++++++++++++++++++++++++------=
---
>>>   1 file changed, 49 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
>>> index b9e60cbe4e..9d596be3a7 100644
>>> --- a/scripts/lib/wic/engine.py
>>> +++ b/scripts/lib/wic/engine.py
>>> @@ -345,29 +345,64 @@ class Disk:
>>>                                                      path))
>>>
>>>       def copy(self, src, dest):
>>> -        """Copy partition image into wic image."""
>>> -        pnum =3D  dest.part if isinstance(src, str) else src.part
>>> +        """Copy files or directories to/from the vfat or ext* partit=
ion."""
>>> +        pnum =3D dest.part if isinstance(src, str) else src.part
>>> +        partimg =3D self._get_part_image(pnum)
>>>
>>>           if self.partitions[pnum].fstype.startswith('ext'):
>>> -            if isinstance(src, str):
>>> -                cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
>>> -                      format(os.path.dirname(dest.path), src, os.pat=
h.basename(src),
>>> -                             self.debugfs, self._get_part_image(pnum=
))
>>> -            else: # copy from wic
>>> -                # run both dump and rdump to support both files and =
directory
>>> +            if isinstance(src, str): # host to image case
>>> +                if os.path.isdir(src):
>>> +                    base =3D os.path.abspath(src)
>>> +                    base_parent =3D os.path.dirname(base)
>>> +                    cmds =3D []
>>> +                    made =3D set()
>>> +
>>> +                    for root, dirs, files in os.walk(base):
>>> +                        for fname in files:
>>> +                            host_file =3D os.path.join(root, fname)
>>> +                            rel =3D os.path.relpath(host_file, base_=
parent)
>>> +                            dest_file =3D os.path.join(dest.path, re=
l)
>>> +                            dest_dir =3D os.path.dirname(dest_file)
>>> +
>>> +                            # create dir structure (mkdir -p)
>>> +                            parts =3D dest_dir.strip('/').split('/')
>>> +                            cur =3D ''
>>> +                            for p in parts:
>>> +                                cur =3D cur + '/' + p
>>> +                                if cur not in made:
>>> +                                    cmds.append(f'mkdir "{cur}"')
>>> +                                    made.add(cur)
>>> +
>>> +                            cmds.append(f'write "{host_file}" "{dest=
_file}"')
>>> +
>>> +                    # write script to a temp file
>>> +                    with tempfile.NamedTemporaryFile(mode=3D'w', del=
ete=3DFalse,
>>> +                                                     prefix=3D'wic-d=
ebugfs-') as tf:
>>> +                        for line in cmds:
>>> +                            tf.write(line + '\n')
>>> +                        scriptname =3D tf.name
>>> +
>>> +                    cmd =3D f"{self.debugfs} -w -f {scriptname} {par=
timg}"
>>> +
>>> +                else: # single file
>>> +                    cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {=
}".\
>>> +                          format(os.path.dirname(dest.path), src,
>>> +                                 os.path.basename(src), self.debugfs=
, partimg)
>>> +
>>> +            else: # image to host case
>>>                   cmd =3D "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n=
' | {} {}".\
>>>                         format(os.path.dirname(src.path), src.path,
>>> -                             dest, src.path, dest, self.debugfs,
>>> -                             self._get_part_image(pnum))
>>> +                             dest, src.path, dest, self.debugfs, par=
timg)
>>> +
>>>           else: # fat
>>>               if isinstance(src, str):
>>>                   cmd =3D "{} -i {} -snop {} ::{}".format(self.mcopy,
>>> -                                                  self._get_part_ima=
ge(pnum),
>>> -                                                  src, dest.path)
>>> +                                                      partimg,
>>> +                                                      src, dest.path=
)
>>>               else:
>>>                   cmd =3D "{} -i {} -snop ::{} {}".format(self.mcopy,
>>> -                                                  self._get_part_ima=
ge(pnum),
>>> -                                                  src.path, dest)
>>> +                                                      partimg,
>>> +                                                      src.path, dest=
)
>>>
>>>           exec_cmd(cmd, as_shell=3DTrue)
>>>           self._put_part_image(pnum)
>>> --
>>> 2.39.5
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#224331): https://lists.openembedded.org/g/openemb=
edded-core/message/224331
>>> Mute This Topic: https://lists.openembedded.org/mt/115542019/3620601
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [steve@sakoman.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

