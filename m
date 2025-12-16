Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE9ED5CC85
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:08:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18124.1765876105734450168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XmBHI2M/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44450448cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG54J2v1605529
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6X2c4SKTh+F8Rl3sCo4y+dS7IKSYum7Tcb6KogAcQ9E=; b=XmBHI2M/+WXC
	uxbZtcBHv9X92/KA3Fa+UUqwCJ4Drtju/CmdVhXmLS2G2hHJKA0n6LPNTQ4KNcMw
	JH5ke4YKIBCw+x3dnSdU3x2g5slZkxbzxx4DkqCEa8nSJgLF7TMFSLKkWluoxJHl
	c08+UWexp0omDsku9ToxXGNEOrTLZwydzhwc0VNdE1Yyhjd8J5UHcbXaemb8c+cA
	wyKLmn1vkZIX3GXHIgQTDz0YsO6wOtvEkmkr/KbhBzYS3cWoQEgHjUaec/lI3AS4
	jDCR9CdHdhkQ+eeqNbaLmd7NVwZWCfIJheL2sG/5lzt6vUHukN+EdtzT4xEVGOs8
	pbbmm+OGdA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0jy86-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 09:08:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slTB+iwn3Amj2Cxwla9iOCj9Knr+5JGySdRzLk42d1TwRNvRhzsi+AhodnoJ043uMtriPtBw+Lc7zb5AT98iG3Cs4zLdV8sixui6tOGe3IC3RiL2Os/CDTwhNKrxgjl2dOiXBYGbfOVoV7OsVrW+3rAtxLcasJ/htYUKvVi0tifmHGTIrk92+mngyH1+7LwIcgpOyX+klGuBPMz8x3+1nWQUFv34CnxOj2gzd8+qaNHRZFWVxUEwfWAkBL3mOna+jQdgkB9dR/TlbEi7qPBwOnaVqEAiLpoD4mSPJ0b+8Lb8r/pstq4yef45LALd5yCRrGHgNIuquWdNrnyu+QwdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6X2c4SKTh+F8Rl3sCo4y+dS7IKSYum7Tcb6KogAcQ9E=;
 b=HFQHg76j0uQx0uouDZn0nCDwmQDvBZWHPq10z1anQiTVETEIyCJxkQHxjqThTR7x30m31y88gu7EXmkQIFlMPxRmqP33NO6mL2oAkwVeH+zLwaiWRJ7hh9Mn2xbQfot1TfzKBgQd+8kFeq4L6fIk+QrQeauyX4v3apu3boNdXvP42a4WE5Im91n72M+01CJQOJk8xZH/RnXxWun7YynQEP/yGGCimlEAn88f5v1b2P9JnmsYqkGJJXJk3mX5X/zuQx3DYMDMMZwCKhsyPJyXEp0E3W47atw7MUdjCVYuPqlOI3ov7+1+nl891uL8yTcSzaDoW0tFZX6MHZaxmunz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Tue, 16 Dec 2025 09:08:22 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 09:08:22 +0000
Message-ID: <05fd65ff-7965-482a-b2cc-c69fa20bae8a@windriver.com>
Date: Tue, 16 Dec 2025 17:08:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 4/5] debug_build.inc: override
 MESON_BUILDTYPE for meson.bbclass
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com,
        randy.macleod@windriver.com, raj.khem@gmail.com,
        openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
 <20251010075258.2161972-4-hongxu.jia@windriver.com>
 <bb5eb607ba04438257930310d17513b7b959d343.camel@linuxfoundation.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <bb5eb607ba04438257930310d17513b7b959d343.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: aef7ad09-d25d-4f84-deba-08de3c82a97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2Z6YlUzMDlXK2swMjlTNHkzd0FzajFXcVROcDVpcnlkMXBqWW5adTZwRDFm?=
 =?utf-8?B?N1gwMFJzQ3pxa2o4ZjIxdzh1VWZlbXVtQXJMRUU5WkJzejZaa2RnSUg1ZHpw?=
 =?utf-8?B?Wi9RWlhLVVFncmpzK2g2MlNTSmdEV3M0eEZSbjVyNmFYRzk3THpFOGVRTmxO?=
 =?utf-8?B?UFNpeGZNRHNUOGdId05OWFF4UGErL09zTlNTSzcwNVNYaGhuZGtIcVFOQUQ0?=
 =?utf-8?B?ZC9GeXl4UDZSeFZjTkljWTNRcnA0d1J3OGhUbExVVDZoTC9ROUM3VlpibGNR?=
 =?utf-8?B?blFhbHV0azdoQ24yUzhvRnhBNURVUUVtMHZSY3RJdW9XS2FpdEpkcDgrR0xh?=
 =?utf-8?B?aldIY3R1Q3lBbDFBazF5bmxWZWZBR1hmZFduMFVRdXE3WHVYQlc5TG5WK05j?=
 =?utf-8?B?V0JoN2svTEIvVUk1UGpycW1zOFV5a1VDODFPb1lyakNzQlMvV0FMbVRDckFs?=
 =?utf-8?B?RXFtRUlGdVk1QnYyNEVFSzJKMXNWMHV1ZGgwYmd6UkZCcGFMWnhNcXZHbmRy?=
 =?utf-8?B?dU4xTjF1YWJNWmhLbmd6aStUak5ZTGZxa0V2TExYWVlXK25BRXRaSS8zbC84?=
 =?utf-8?B?elUrVzBjNXFvenFTNmhwMVYxa1NzcnFiNDJaVUFjbDRhS2FlcDVlUHpxN1FK?=
 =?utf-8?B?NUUrQmpNcVVQSGtheHdBN3ZJYjFYQzlCOVJZdHRPSk1qZjVSOUd5TFFlSkhn?=
 =?utf-8?B?S1EzdTNiU21WZTUyUzF5MG1TbFhoZ093dFYrR1NVUHlxUlhYUnlvVk5OK09Y?=
 =?utf-8?B?eW4wRWJzUkdwZndNUGNiTmkxMFFkQmxyZytib0dkaENQTEJrQXBHS0hMNWts?=
 =?utf-8?B?azM2ZkdUYWRmVFRDTko4NjRCVGhDeExENnJpc1dTa0pHM2hOTGhYdTRHbHhx?=
 =?utf-8?B?bkxHckxIY3VkcisvcHBFK3dIR0wxZzk5eEhUOXEyc2tuTFg0QVVjRDFVSzdx?=
 =?utf-8?B?YVE1Mkp5VUVHbmNLT2UwQXowRWVGMFRvTWIrOXVUdnlhWmU3V3lxSGVuU1U2?=
 =?utf-8?B?ckNFWVhqQTBnamVQMzNNV0lRNGh5OS9TQ2JlVXprSWR5OG16bFpPNVJ6VWU2?=
 =?utf-8?B?ZXlKL3NWQndjaVlYNWlQREZmZHBqMUdqTlZLVmMzUHlteEV2Rjk1S0QxRTJV?=
 =?utf-8?B?M1lvOUtkSlo4VUs4ZmtQT2N4QmZabWhNaG1lUXAzSEdqQUhTaU1FaTBGaVNi?=
 =?utf-8?B?ZGZpQkx3NVVhbllDcmw2eUVOL0hqRHJzMUEvUndsaFIvd2VYUGpPVVhCdllM?=
 =?utf-8?B?K0svQUpEOWQxZEp6akgwSnhaTE1VQkpiQVFMK1prTzhVVno5SG02SVBCSS9R?=
 =?utf-8?B?cWVjbDJkZEhLS1hCODM5WWZRNDVUMUk5YnhLZGhxdzFwVEkvM2FrZlJBN0pM?=
 =?utf-8?B?WnhFKzBWcmZjdnpKV25wTDg5YmsxWUUrU3Q2bTc3Z3I1OGM0YlpDeHl4eVVm?=
 =?utf-8?B?MGRDY2JNYWkrZFJFUGkwUExiY3NucXhienBsRHo3VlJpaS9LUllDb0JwQ3Zn?=
 =?utf-8?B?bDdHSUdVV0NHaHNPSisvWU9FbWxzNytVaDlBUGF1MktYcm1xcEVvaEFESzFh?=
 =?utf-8?B?ZHJUL2FYV3dCcnpnbWIwS1dGOG9xcFJGMlc3Mi83bDl2WmdjUk5ld0xmcng0?=
 =?utf-8?B?cmlXYTViU3NxcDYrWDhsa2ZYSHl6Sk1XaUpyR1pjNEUyaC9kd2lKRHNKbHY5?=
 =?utf-8?B?RDI2QmVHVkNEazdWT05YMVRxdEs4OEZEUHNmSEpsMEhHWTdVZWFqWDArSXEv?=
 =?utf-8?B?RzE5aVpIMkViZ0YrZ2R6dlhkZU9wamppbjlXLzR5OWlDdVVINFRaVGpiZ1Zy?=
 =?utf-8?B?aDNZNUFnd2t1bmc1cmxNdlR3dm0yMG0yYjFOR1h2Q2dsWm9CcjlpUFZnajgz?=
 =?utf-8?B?YmRyR2ZYSStLSUVScy8xcjhsM29kVG9SOHhZNnpuZm5jTWQyejk3ZFB4WHRw?=
 =?utf-8?Q?4yiZFhrf1VRHmN2NVfRP2p8BV7fhxNYf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjJpNTVZb3BFNzBWYjAzOWNpZnVvZWJrWlZ1U0szVSs4K29OYUUzc3ZIUjVI?=
 =?utf-8?B?SUZNZUozYW1INXpackJmREV0Y2JMUm9RSkErMEpPcERWVDR5dlUvckFCeVRo?=
 =?utf-8?B?OE4wV1BtQkdQeXpocDlybktzdzRzTitQOGJVTThTR25wU2QxUmxmVW9KSC8w?=
 =?utf-8?B?clRXZHJQRjNUM0hGTEFvdDNMVE5waUhiV2c1UlBadXQrU1dVbnNoaUVMZXlJ?=
 =?utf-8?B?ZU4rWGNQRWZza0pVM09EeUpNL0Mra1prZW1KTWFaZEo1Mzc5dUI1QksyYkFx?=
 =?utf-8?B?U1ZIOUtXYWgrTG9CTTU4aXZ5R3IzSFc1eDljdXcrd3dUdmN3OUcrRXdNVy9O?=
 =?utf-8?B?NTBiOFdjSHdZVVJYdmwzc2E3YWR4am1mQk1XMi9GSm9GQ3BZRlBHY25DYk5m?=
 =?utf-8?B?QUttTENtdmRBMUp4VmE1QkhEZ3F1OU1qa2VteFpuUDdUT3ZQM015bS80Sks1?=
 =?utf-8?B?TEhmdk5uZlVlWTdLKzFhQ2NxaEhXZXRXUVBtbE42RVY0eHdBZWNHWTdKTXR1?=
 =?utf-8?B?Znd1MWJrVDRRTnYvTmZrZS9lNEcxbUtWYUJjQWc5YjFmYTdKYXpIanpNT2Fl?=
 =?utf-8?B?VnJoc3RXZndPeGdnM1BQRFpGaVBuZ25KcEZmOWRMZUdITFlya0IzenM1TElM?=
 =?utf-8?B?dnhXR2IzeGszbTlRNVE4SUdLckw0c0lGV3NYcFptcisxRmhjZWQxaFN6ZWhw?=
 =?utf-8?B?T0hISmFBVTU0Q0p2aTFDdzB3and5SUtFTCtjTFJhWkxDVjQ5S3QwbCt0L0xL?=
 =?utf-8?B?ZDVhOWlYS0lENEJ0T2VLNVlwMGZoOTBxYUZ4UXdLN1AzMXZ4Tm5QZ0d2aCtn?=
 =?utf-8?B?TUpVUVgveG00aDY3dTVnY3ZHTGpsMVBaQll4OWZOUWZ5T2o1ZjB3VnRLNVI3?=
 =?utf-8?B?K0lVazlNang0dW1vcWU1NHF4U21VdHFMY3JqSFVHMjZCclZBd2xIQXg1L0Ni?=
 =?utf-8?B?M21nR2lnRjE5MlJqVnBLcjM2QjFiVzVUdCs5a2ZEdUNnSUpvazBsRUN5WTVk?=
 =?utf-8?B?QlliZFA0VVpOSHU0T05PUU44QytzbmFvd21JbzlKQXlCMjk5ZGYzLzM3L21k?=
 =?utf-8?B?UVBqZ3czckpaNzErL2NtdWdUS1o3ME51KzhLSXRmR3JsQWJFaC9kNHIyMTBr?=
 =?utf-8?B?cnZ6UUtKZjlUS1B3ZWdRTHRqd1NtRHVPdXY0QzI3aVRJa1ZvRGZkWjhHVnNo?=
 =?utf-8?B?NnFyY3N5ckFrcHVWdTUyek9GSXZpelBvU01wNFFZbkdCb3M3L0FIeUZUTjB0?=
 =?utf-8?B?cFc2Z09rYWkzM1JNNndMOGI1NXJSeGRLd3VMZkhNeVZhaXpFSzhFOEVOd0Rr?=
 =?utf-8?B?ZjU5SnpSMFhpczN2S1VjUWxPYURxUkZqZnZ1NnFCSlVOQ212RDlyRk5RbWZ3?=
 =?utf-8?B?TlRuWjE0bWFyY2M1a1lNQ3lSUVE0M0Z0WEhQbkUvVDladDZta0JLRDlQQlo5?=
 =?utf-8?B?NkRrQlE5UUZpYUNEVVJRc1ZuQlh3ZzM4ck5HemFqbE82T3pRb214dHh4Y2VZ?=
 =?utf-8?B?SkFNa2xlc0MyZnpXUWVOd3R4dFhtcTFscFdCMDZiL0JTNEM4VzM1NXprM1ZK?=
 =?utf-8?B?RGNyQmVSMWdyS1BhT04yVy95cnJEbzRlaXJaRm80V3NSTXMxZkN1VXJOSEty?=
 =?utf-8?B?MlVEeWFUamFxaWlVdDVSQnRiVE9nY3JRTE44cW5zdFI4QjRSRmxZTndWVnQ4?=
 =?utf-8?B?OWEyUVBYWGx5cXpjd0k1T2NDSXRlSTdBQ3BuYkhzRWJsdVovTUovUmJ2NnVi?=
 =?utf-8?B?bUNDTlJ5ZDZyRXh6cnEwK29Da0FPSjBnM245cTlXc2l5U0dUYnFVNkRxK3lN?=
 =?utf-8?B?OUx4eDEzWm1WTkhuREVacTIvVUFFSjYxTitKS3hQZlhOaDdMSkV1S3JVZm81?=
 =?utf-8?B?ZW50U3VpUW1uRkZTdVpTUDRzZzhkODJaTmZqa0Z2MzZOOHBnY1VPVWpjQ0Zx?=
 =?utf-8?B?cVlMdjZUTkV2b2xCcFpCaVdDYUdUMUVGVVE5U2FYdmYvRzhRR240TFZJb2Nt?=
 =?utf-8?B?WGlIeHIrZVFwUGJnRUhnaU11Y2MxOXQwWjZFVi9mZllZMFdrVXdkUTIzTEtO?=
 =?utf-8?B?RmJTazVQaDVua1BtUDUwTStZNS9RNi9PTDMxOElvYUYrL2VqQ1hkSEg2QWxy?=
 =?utf-8?B?bXhPa1gwYVJwaFI2Qnp0NVY5OUFpOGEramlCSS9RWTh5MmFtUzZwQmRDZy8x?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef7ad09-d25d-4f84-deba-08de3c82a97a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:08:22.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qn8qDhZmz8Z1SdKQ43pZ1/xHvIbkjgrRsG3khPI62ahPTdzPZaRfknhGQAXct42JrTMLr2Q5SPD0ACc08gi6+JyjGURFQsmQEmRjT8nrgmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3NiBTYWx0ZWRfXzYkXke5yooWv
 vFgzb2O+cUhg3KGX3NuAaMmG3lxxLwzEkXYXQV3ZEWONHCi/fzj01eJdcZpJmcJtyCOpRSZ015g
 ssrNkPyUD5RDHQfaefJagCUM5F4C9kvvKSdP4KknR1WXmZHxnO4aa+2NuQ2JUzvXs/0TKsBDH9Q
 rCWlLmyyiQrJXK6AUVj3oqhz1g5FyTq5XYw5IiYd2YQMwV7rFwdSTqIiSowB252cCdYflwAbJpA
 /hf8S7mrUgjfS2qfFJaI3h8zi6SUKAm2fPbPvxu5FmSiuJWze803T0kYVu5fpfUMuRdSO4v5aDh
 UuAjzW7EvlXUlPevkHT+DjDkQpT9OMYYP9J2VMqkeIPf0BJrnTCFcqw9SpfzUHIAgXsojAgK6oH
 n9ITbjQuQS5BoGmz2cXo7m97WvQs9w==
X-Proofpoint-GUID: 0H4k5x4t5gltP7wmty5-aom5uFQRG0Vk
X-Proofpoint-ORIG-GUID: p1LYHa2E6_Rsg-v-VnVscQ5pOF43aBoy
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=69412188 cx=c_pps
 a=IN6nX5sQGDwae/9PVKyrlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=P9OaJZdTnaGmCSeFWsYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227928

On 12/15/25 20:02, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org
> wrote:
>> The debug_build.inc is used to collect debug build configuration,
>> override MESON_BUILDTYPE for meson.bbclass when DEBUG_BUILD is
>> enabled
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes-recipe/meson.bbclass        | 3 +--
>>   meta/conf/distro/include/debug_build.inc | 3 +++
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-
>> recipe/meson.bbclass
>> index c8b3e1ec29..0944ea03cc 100644
>> --- a/meta/classes-recipe/meson.bbclass
>> +++ b/meta/classes-recipe/meson.bbclass
>> @@ -28,8 +28,7 @@ MESON_INSTALL_TAGS ?= ""
>>   def noprefix(var, d):
>>       return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
>>
>> -MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug',
>> 'plain', d)}"
>> -MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
>> +MESON_BUILDTYPE ??= "plain"
>>   MESONOPTS = " --prefix ${prefix} \
>>                 --buildtype ${MESON_BUILDTYPE} \
>>                 --bindir ${@noprefix('bindir', d)} \
>> diff --git a/meta/conf/distro/include/debug_build.inc
>> b/meta/conf/distro/include/debug_build.inc
>> index 1062326417..c8e2cf90cf 100644
>> --- a/meta/conf/distro/include/debug_build.inc
>> +++ b/meta/conf/distro/include/debug_build.inc
>> @@ -44,3 +44,6 @@ CXXFLAGS:append:pn-vulkan-validation-layers = " -
>> DXXH_NO_INLINE_HINTS=1"
>>   # No strip sysroot for cross and native
>>   INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
>>   INHIBIT_SYSROOT_STRIP:class-native ?= "1"
>> +
>> +# For meson.bbclass
>> +MESON_BUILDTYPE ?= "debug"
> Should we do this only for target by default?

Copy

//Hongxu

> Cheers,
>
> Richard
>


