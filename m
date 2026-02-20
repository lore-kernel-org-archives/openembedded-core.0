Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0DCC55180
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:56:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35430.1771581368564869785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VSUdOP4s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6511fe63f5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K9fPAb2116288
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=G0icSBPyC2VKe2BxiJo9KKLy7zS+BktZYgNqfpqROHo=; b=
	VSUdOP4setPWMNI/cRQVQ4C+KkJT5Klk1vu1Wypf6TafBKox7Q8K2OVSUDZjY3zJ
	rFHNdsIuFkAUkcGTlqPenaM8KYpyjvziHjV+c/MX/7zsicxPJhDzVE2ky4UKMWVO
	maYTQxY0917Jbt2OPLQ72PyQFGZyAmvSgWqYHCbBt3QK2J6bXt0oud4sDgNJsUeJ
	Ue+M+HLL4OcdDAHmBus2WWUmPahFJDIrw53ZCPvliHB3ogjQb4heVvHucyBghxS2
	5SparRqnIAlDVc3Kiw2OGWZ7ww585DCN4f05/mFVFOIsi+6jE8jg3fYuEiYMHZPR
	A/sAfWYrsjZU7d/LZpT3og==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuqhj9e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 09:56:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuqpGCg78crLZD1H/rsHZ/5iNCSVwgNZtFaNpmcOHfUzK4eH1ngrrMI5ctW5sQVACwcSl6Qlm2h5ngCeVwE9kMNGl5iAa58uew3UfCgW8u9kjwDRyMr9fpi5HwdljPOm916QrYpuFAlegMHP/e1n+8SmtHCR0FWpz97KEHq18GmMB8FX9JaAK0dR/tq4XgGX7bJ/PCZxrYmQP8laFvU3YoGqaxhBUx9Hu5l5MMN1F9dKZ/12ySUUEoC05pOmha3upYZz3S4SqQ18WgpRlV4SR3cDbNdmxJucQC7NRgfx3cWW9sxHtERpjerZ7EvsaB43BA2CYOzen3jvO4zi0suecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0icSBPyC2VKe2BxiJo9KKLy7zS+BktZYgNqfpqROHo=;
 b=n192WHFihUheMqTHBYGSjwYP3PCfbGUFeuCpO7rK1EDPPccuno5bGtKdK7+P+pTrzFcZ7J04iOq6oSGeFAHiAMPE8gesBvOjk/U2aTJiV4hgvjg84KK8w67w2yc5ZlbMljoepyThbUpQQ1UJC6r8iXIjX19xpvaNhLDdqz0fyAE2l/EIw5To90u0SlZPIryqW43gPG7txu32qT8WkPMDY7roYh3V2IYw0A+F42voMq7AU4rCmM31TmWnoZlxBqevA8f6+YvfUyYGoh3dBOsZavWU/mBny+N0AoJmfG8e3uGgCf6+zXnNZUWfvIMZhhVKU080WZ/r+mpbaIeQlfBIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:56:04 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 09:56:04 +0000
Message-ID: <09acdd74-3a51-4de1-9d94-8c6332b0d4c5@windriver.com>
Date: Fri, 20 Feb 2026 15:25:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.46 release
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
        mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260212142933.3543788-1-Deepesh.Varatharajan@windriver.com>
 <DGDWTI56DB4D.1I1SUNULX6S5R@bootlin.com>
 <5cfda679-374f-4bc7-a33e-53f75833b090@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <5cfda679-374f-4bc7-a33e-53f75833b090@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::17) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: d76d4fd2-28c6-400b-f2f5-08de7066426f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzdWU1dldVlWZ3F5WUJkVFdUeTlLdkc1SkJ0YzMwQkdYV1ZrK25qUUhMVlZB?=
 =?utf-8?B?V3lLZyszdkgxNUlyWnRlbi9WUDYwRFRHZnhHTTlGMU9ZdElsWGpHSnBOdVRH?=
 =?utf-8?B?bnNwOXNDNjhmT0xFM2pFTmVucWhjTlA1VDlQcTdLQU9MQytlQlRJbEVTM0JE?=
 =?utf-8?B?dlpPalV5dzk1R1BhT3dBNHl0WXI3c2ZPYXpsVkdRYk4wUUNmVk9YNFU2WDJq?=
 =?utf-8?B?Vi9IVkhyMGV3cThiWXVUVytWOEVURVcvdFlDVGY5UHZ6YVp4dkt3QjhWK3Uz?=
 =?utf-8?B?WVRoT01xK2NLQnZYTldyd1dINnF1eFY5V2lUUzUwMlZHR3Z6aVNqQklZUDNt?=
 =?utf-8?B?R2Znd2NSY1VwVXJEazhSWmZsU1NULzVVWmFMNDZzOUxMWTNnZnQ5Qjd1cUNo?=
 =?utf-8?B?ZTljZ0FRMExzRDU4bHlCcGE0Z1Q3SnNJSUNqaHo2UkJUMnY4UnBVaS80S0xJ?=
 =?utf-8?B?Mk9JQWxIcWY0YkVBanhNbER6aDBodS9uMWJSUElhK0hTeXdaUjZoQUJ5QlFv?=
 =?utf-8?B?c051dTRQbFpmWnlueGJIbEkyRHFKaGZ3cGd5NVdrNE5HbVNoWW1mRHBwZ3Nj?=
 =?utf-8?B?K3M2VmJlTTlxUFRSZXZjbm8waFR2SWhyQWJRRWhWTndTYkRlUk9yNGdPSHkv?=
 =?utf-8?B?b01PSmZvQ2NZMDhhcDVsZ3N6OHpPQVdKVlV0UDZLeXM3UlVDM3o3bHBWeDd5?=
 =?utf-8?B?STFseDY0L2lmTm4vN1Z5cnpOaWpkWEpQeU4vQkV4SW1KRHN5SGJ4TTF4K3dN?=
 =?utf-8?B?NUdZQnJkNTZ6WDVGeVpyYU5NTDE3b1VkSnJXZ3oyU0pVU2VHMUFPTGswZUZD?=
 =?utf-8?B?K3JTL2pMMUNvRTk1WjREL1I0ekdlZFo2UkF6UmJmQVlybFlRWXE5WDR6d0hw?=
 =?utf-8?B?Rkx3bW9CaEw5cDhiY2FkNDNmRXFENnBSckVvZnFaZVhhU01qSUhMY2x6U3M1?=
 =?utf-8?B?NkRXcnNaMklYbDZ1bVNBRzgwNjJEbnQrM0hyWHNzcFdjVWUyREpSb0ljS1Vz?=
 =?utf-8?B?OHpVOStZMUlKYjg0N1cyaFU2V0FxZm1WS0RaVEt2REtVTFhwMURMVStwT3kx?=
 =?utf-8?B?ZDByYndhd0dqbTBWM3kyMHRqd0tOMGN0SHl1LytvZXEzV05mSUNMdDFFdkJw?=
 =?utf-8?B?VGNYU1hmdnRSd3R5K2M2UW9SM0JjbXRmN09RbSt5NndxZnJON2dGeXlmelBr?=
 =?utf-8?B?bStPeVhMSkVvVy9tUnNhZjNJckJsNkdBeDJHS0hJQXkwVjFkL1hGZXgwdlNX?=
 =?utf-8?B?czRPR21VTDFMRG50YVFPL3JxRjZ0SFJrekpMeXpGTTVOVVoyc3dFc3FvUDJr?=
 =?utf-8?B?RGV1ZUdrbUVMTjhQSkNlUGxlTU4zZU51NkZXSmR5dXZRRGIwV2pJdkhsRzh6?=
 =?utf-8?B?dkdzZ3l1MDkveFRjd3Z6aUNIQ0svK29GclVEaXBnM3VqNW9UcVNhL3dEOVpt?=
 =?utf-8?B?dmVhcTJPTWNjdEhjWU51N29pTlFLQXBmZHZvcSs5NiswZlNxRHJ5Rzl5bjhQ?=
 =?utf-8?B?VVJnZVlwZCtBeHFLT2k4ZjJuOFRtcFY4U3dOYU9ubSt4WmZLR0E3VkJvSi9x?=
 =?utf-8?B?bmV2VHpFd1dRSUw1REpsQVdBUlpDNFo2bWg4bXpnRzFFT0VjS2VqQ1huMUZz?=
 =?utf-8?B?dkVuNk1DaTBjRVg2VEw4aUQxVXpDczc3cnlUQzh2emtUb09jODdib2FzNUFK?=
 =?utf-8?B?QUY5ejNLQUhxdVpRcm5tYkNhUDF5cDkrUHRTTGk5L0o0Q0F6MmJKTFZTQTFx?=
 =?utf-8?B?amxjKzBYeVd2MTVYWEpyUm1KVlZWdU05L2dvSlNDanVaTFFwaVJxWXV0em1h?=
 =?utf-8?B?WmkxYk1QbWtCdXNyb2Y3QXgrNityVnVud2NTS3kzTEE3SnlSam5qUWFZa0cy?=
 =?utf-8?B?SGN5TVl5S0o3Mmd1RHUrWjlSc1BQb3crcWQ5RFJiaHFIZ04vRW5vZjEyNktx?=
 =?utf-8?B?ZWx0Mms1L1hKSU1LdTA0elpsbWhEQ1ZsWTJLRTNKWXZBVFpVZjlvRE5KZVBk?=
 =?utf-8?B?djZoalRGUTVOVGk1T3BJc3Q0WUhIZjRIelZzZUFSeTNiakd5aVJCKytBMkN0?=
 =?utf-8?Q?/juIuh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWdndHVHcU1DbWZia0RnZ1Q2OWt2WjNZQkRTcEtlVHQ5bWRySFRxQzVraFJY?=
 =?utf-8?B?ZW1DbVplV2dRdGh5d3hJem5NdW9xek1idzh4b2Q4MjVnaGFyci92bTZsaVhI?=
 =?utf-8?B?Q1lwK0svOGRCUmExSS90bWlLZWxGbGN2SUp2Q0tMcVpKRDJvWnJUMDViUjFR?=
 =?utf-8?B?ZTk3WVcvM3ltMkJBamtzN2Y4V05uMnVzQWJjNUdKZHpjZ2t4MWl0ZDFWalpj?=
 =?utf-8?B?NkJpdEI4RlpsUVpFai9XZVhyOWVXVHRnUHJmNGQ4dk5yZnhUSXpTVW5qZHR5?=
 =?utf-8?B?NklPNzY2Tll5YVN2NTBzdW96bU93YmN3dnhwbVcvRndrUUVWNzhtK3JuMDFa?=
 =?utf-8?B?QktyUzQ0OE5vRE1GeDZNVlR5NkdMdzZsY2Zqc3FkbU1zaFI1WDZNVFpTUmgz?=
 =?utf-8?B?QkdBWFcxdWdjUXFKTWtaUmhWMERveVBVb1JqL3pMa05IazlSNHJBY0VqYlAx?=
 =?utf-8?B?RVQ4REdUSFRjMTZCOHpJMnF3bE5XTUZQczVBMFZySHY3ZGhUcThjV3I5Z3VR?=
 =?utf-8?B?aVllWW8xbzBEd0E0VDhTV3hrOG9hS0kwc3JhSFZLOVVzcURGK1dJYjJzS3ht?=
 =?utf-8?B?ZGdiL2xxVHFsYUE3b0c1ZTAzK3JLTDJGazJKM254Y1QzSUVodEFYSTJadjZo?=
 =?utf-8?B?Mm1oK25ZVHRrZWxONHZFQUVPODVydEFVR0dkRmsvVVNqMThPNlZlTmxkeHNh?=
 =?utf-8?B?UkY1MFlQai9tMUlnUEtabnVwVlRhMElXbDdMRU41aS9rM3BqTTRZNGFtL3NN?=
 =?utf-8?B?Uk5vZnZueVRZblpDUTc5bTFsdFcvREZzdUZtTU9VRU9KNHVOTVhsc3lSMFNq?=
 =?utf-8?B?dHFjRHN3MEFUUDFnb09xQnlJY2tWUkQrMk90Y3kzZWI0VlBENHRQblZSMDBG?=
 =?utf-8?B?OE1va2ZQZ1RibXcrRDFtNTh0V1Y1Z1YxT1haaE9jZGY3VzJIYW85eGZtK1Nt?=
 =?utf-8?B?SkJRTDNQZW90Q3kzaVlOYWRud2x4RVh1QW9RT0tpci9QckxRZzZLSWdETFpX?=
 =?utf-8?B?MlVaMnl1dy9KRnM3QmZRS1E3M3d2eCtqSG1SbEVlTjM4OWtKaERSaFZMOU9r?=
 =?utf-8?B?aTQyeXBWOTU0MXRyNlRVWEpOdXQ1aHlDMnE5Ui9ML3BhaDFxUEVqZUxjSFha?=
 =?utf-8?B?b0pBTi9Yb08yVlljcllrVHBVcFFxa1duQUJobk1hQlFCWGJFTVJyMXlTa2Na?=
 =?utf-8?B?SElpZ0drSlZJNWlGdWovd3J0Vm8vemUvbDdFQnBLaTNLRWZib0hjbFVaQkRs?=
 =?utf-8?B?Rlk0OFg0d0dPUEJGTjBzM3JMT1pGU0NSekRWa2wxUlhnODJFQlVtYUd1M2Ur?=
 =?utf-8?B?dzJkaFVBZ2g0bXBTY1AxbjVZUGpVTitLbTRkNHREQ0tBL1lNeTIzMHlqRllq?=
 =?utf-8?B?U0FuVkNvakpkL0xMNmJRdlJaVTRZcGhMaGU0ZWdYUE1pRStmWmp5WDRxM3pU?=
 =?utf-8?B?WWoxaGI5cE5nZDc3aEtOTVdBUHRVcEY1cEVqTEptU3MrNWx3TEtNU0ZobDg2?=
 =?utf-8?B?b2FhVjBUZ24xTW5LcnJiSTZiaHpWKzBCNEdLSm9SWnJDTFFpeWE5OUZGckRO?=
 =?utf-8?B?c1plci9hVzJQWnpyWVkzYmUzN3FzNFVKNTVMKzBYT0VXR1V6RkFjaTgramZp?=
 =?utf-8?B?WjEyZ1lBMThGa1hxRkIxeVhsZjFNZnZrVkMzYno0NnhZNlJGcmt0QWpHN1Nn?=
 =?utf-8?B?S2dQM2lxdjJhRytiQzg3MlNMSzYyOTdqc0pwZmdLTnNTQm9CVXpMVjNzM1Yw?=
 =?utf-8?B?aFgrbHI5aWZYSmpxQVU5YXAxalQ4WVcydmNBUE8yLzdMclcrSndERmxZWUZI?=
 =?utf-8?B?YXJZUE0ycVFSQnpOdXpuMmsrT0JISzV5RkEwTWw0L2xOQm1UR3BvcndEVkRW?=
 =?utf-8?B?SGtkY0tPWXkveThJcno5RzBJOWx1SkRFYVRTbDRvV2hEblZ4NHhhc1Q5RTBW?=
 =?utf-8?B?UUYwYTVhNzNaY1UzVUlteGVVY09Fc3pna1Vzdmp1Zzh5QkhyN3ZMK1VScXVI?=
 =?utf-8?B?eHlhZURMVVM1WnJQUkovWXg4cFhDNzRib0JHL1hqQ3RwMWdEMjZtZ2RXUVQ1?=
 =?utf-8?B?YkFPTG9yUkIrQWJwNDFqMWl0VVl4RUE3NnBXQzdiU2xSTE9pWnlnMFFnbXl1?=
 =?utf-8?B?SllyMUhjbnRraWVBYUJEMVcwZ1ZsV2I4V2pZc1o0elBFREliaXF4YUdpMmlx?=
 =?utf-8?B?UnBqeEZCOEhlZmpVdDk0K20vRzZ6Rk1pT3dmYm4xUkpHRmRPb25EM1prUHF4?=
 =?utf-8?B?VWMrcmx3TDFXSEJ0a2VLaTdsSXJuWjdTeGRQVEVXMG5SZ3pTYXpRcTc5UXUr?=
 =?utf-8?B?RVcySFBJb2tZYlltUWFHMDE5aWFLVTJVVnFaTVRxczNKMkYyY1lYMnJxZEUx?=
 =?utf-8?Q?S+Ipi+wuN6p8xoU7vdcEj0ONsEbXdqjEsGYaR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76d4fd2-28c6-400b-f2f5-08de7066426f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:56:04.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyawgFAhSEkEEDcFn1awS/2XjY93d9IAk5eZtWDVwn+S11JuSrDbrJz61XP/epamaL69dvLG6t9B0ZOubMBmlyIW8W4OHdZfSYGUZPQjxEew70EjzSVbUacHsjvfYU+B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: o4akjitsix0dtSWYtejnrPFdW_eiTwj0
X-Authority-Analysis: v=2.4 cv=KpNAGGWN c=1 sm=1 tr=0 ts=69982fb7 cx=c_pps
 a=7sXfYZKWL/+VDStniiEWIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=mDV3o1hIAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=qUWmf8dcSyHT96UeDCkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NiBTYWx0ZWRfX6HYZS9hJFG4g
 4tYF88lnXwCKKZ5AQ2VYdnnjxiUyvseGLFokgR/Ncjjhb+ab5kniwL0mGr48pL2Aenp65Mlpg78
 1jS3wtOaAAPfqD2ldWpYzis4eOzZEemiuPBG+jbB8p53ejFg3zx/ZPrB6nGUlKgVYdJT7F1MwrF
 d8fAjx5UUMNo0sc270DgjLKbTV018E2UPkYiA49kAkxN2TCJy931aD0BaExNKISzzqa7pYxPpXw
 SJYcstcVrLYf0ohT3N6Vr4+bQFTn6aB1eoVMuAHSG83BswFXRO9DkCU3IjNxYW9DNfDvxc3vA5l
 XMvYsGpy/sjHJnK8AO7e9JHfKSbxQV1tlXV6WgaAjUcU/Q/L3UUaXkQolGCoBUVbLonUVt8ExVI
 NEsF/w33kAnZ0bbmXYJgRib9cWdnYXEzBg+E38oYap23VLK9Ft4wYjq7v3hlbWMP06rU1ryKuWi
 win2Lg6m1EYSE7CEjOg==
X-Proofpoint-GUID: TnfWjxfrqnNtc_uc7lfgEpLw-ZSR_B4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602200086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61K9fPAb2116288
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231501


On 13-02-2026 21:03, Joao Marcos Costa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> Hello,
>
> On 2/13/26 15:39, Mathieu Dubois-Briand via lists.openembedded.org wrot=
e:
>> On Thu Feb 12, 2026 at 3:29 PM CET, Deepesh via=20
>> lists.openembedded.org Varatharajan wrote:
>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>
>>> New Features:
>>> Support for new instructions added to AMD, ARM and RISC-V=20
>>> architectures.
>>> Support for version 3 of the SFrame standard.
>>> The readelf program can now display the contents of Global Offset=20
>>> Tables.
>>> Improved linker tagging support.
>>>
>>> Detailed release notes are here [1]
>>>
>>> [1] https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00006.html
>>>
>>> Dropped patches:
>>> 0001-aarch64-constify-BTI-and-GCS-report-functions.patch
>>> Since the fix is already included in binutils 2.46.
>>>
>>> CVE patches: CVE-2025-11081,CVE-2025-11082,CVE-2025-11083,
>>> CVE-2025-11839,CVE-2025-11840,CVE-2025-11412,CVE-2025-11413,
>>> CVE-2025-11414,CVE-2025-11494,CVE-2025-11495.
>>> These were dropped because they are already addressed in binutils 2.4=
6.
>>>
>>> Drop CVE_STATUS:
>>> binutils 2.46 has needed fixes for CVE-2025-7545 and CVE-2025-7546.
>>>
>>> Rebase existing patches with binutils 2.46.
>>>
>>> Testing Results:
>>> +----------------------+--------+--------+------+
>>> | Result=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2.45.1 |=C2=A0 2.46=C2=A0 | Diff |
>>> +----------------------+--------+--------+------+
>>> | Expected Passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 318=C2=A0=C2=A0=C2=A0=
 |=C2=A0 331=C2=A0=C2=A0 | +13=C2=A0 |
>>> | Untested Testcases=C2=A0=C2=A0 | 5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 0=C2=A0=C2=A0 |
>>> | Unsupported Tests=C2=A0=C2=A0=C2=A0 | 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 6=C2=A0=C2=A0=C2=A0=C2=A0 | -2=C2=A0=C2=A0 |
>>> +----------------------+--------+--------+------+
>>>
>>> Testcases changes:
>>> ---------------------------------------------------------------------=
----------=20
>>>
>>> Testcase-name 2.45.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.46
>>> ---------------------------------------------------------------------=
----------=20
>>>
>>> nm --ifunc-chars=3D-- (global ifunc) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>> nm --ifunc-chars=3D-- (local ifunc) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>> copy with unknown section flag -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PASS
>>> objcopy tek2bin -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PASS
>>> binary symbol (implicit) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PASS
>>> binary symbol (explicit) -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PASS
>>> readelf SFrame V2 (x86-64/test-v2-ET_EXEC.sframe) -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>> objdump SFrame V2 (x86-64/test-v2-ET_EXEC.sframe) -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>> readelf SFrame V2 (x86-64/test-v2-ET_REL.sframe) -=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>> objdump SFrame V2 (x86-64/test-v2-ET_REL.sframe) -=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS
>>> run objcopy of executable UNSUPPORTED=C2=A0=C2=A0=C2=A0 PASS
>>> run stripped executable UNSUPPORTED=C2=A0=C2=A0=C2=A0 PASS
>>> run stripped executable with saving a symbol UNSUPPORTED=C2=A0=C2=A0=C2=
=A0 PASS
>>> Copy object attributes v2 data from an object to another -=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>>> UNSUPPORTED
>>>
>>> Signed-off-by: Deepesh Varatharajan=20
>>> <Deepesh.Varatharajan@windriver.com>
>>> ---
>>
>> Hi Deepesh,
>>
>> Thanks for the upgrade.
>>
>> It looks like some patch needs to be refreshed or dropped. It's only
>> applied for class-nativesdk, so that's probably why it does not show i=
n
>> most builds.
>>
>> ERROR: Task=20
>> (virtual:nativesdk:/srv/pokybuild/yocto-worker/genericx86-64/build/lay=
ers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_=
patch)=20
>> failed with exit code '1'
>> ...
>> ERROR: nativesdk-binutils-2.46-r0 do_patch: Applying patch=20
>> '/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-c=
ore/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Searc=
h-for-alternative-ld.so.conf.patch'=20
>> on target directory=20
>> '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64=
-nativesdk-pokysdk-linux/nativesdk-binutils/2.46/sources/binutils-2.46'
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3189
Hi All,

We looked into this issue and fixed it.
>>
>> Can you have a look at it?
>>
>> Thanks,
>> Mathieu
>>
>
>
> Just in case, there's also a ptest failure that could be related to thi=
s
> update:
>
> Failed ptests:
> {'elfutils':
> ['run-strip-strmerge.sh',
> 'run-elflint-self.sh',
> 'run-reverse-sections-self.sh']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3036=
/steps/13/logs/stdio=20
>

We have been able to reproduce this issue. It is related to three=20
elfutils ptest failures. These test cases were previously
failing with LLD linker and were marked as XFAIL. However, after=20
upgrading to binutils 2.46, the same failures are now
occurring with GNU ld as well.

The issue appears to be specific to the arm64 architecture. We are=20
currently investigating the root cause and will
provide further updates once we have more information.


Regards,
Deepesh
>
>
> --=20
> Best regards,
> Jo=C3=A3o Marcos Costa

