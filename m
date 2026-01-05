Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ECEC79FA7
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 16:24:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67823.1767630284342124893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 08:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XJ2IWoSF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54659dee73=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605CNZut111495
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Jan 2026 16:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pg8HQrnarWTEaLG0mWTviu+a6HwnZOuX4R3Vit47QpY=; b=
	XJ2IWoSFsXg+ry44Qi4bu6Qj5+avuVbYVYHqz3Lp3cb4uF0abUqoxweOPVOTmGo+
	TaP2MpAhchBpbRjRpslJcQT2XM1RmWOUXAspNp55rAhr9nLe8huDgNhYr800bqlv
	e1f9IyYW9dqw5kG2enSD5KcU7Wke/3ehSFpFE/yT45nmr/3BAr7y1HCo0LB37NMf
	7NTvkJ/u8UHgeklHp8VPDkIg1FeIdtlmf1zQTRVZCOJ2fdOwtRhzDMBx2xK1FvZa
	CMnq5aMj0Z17ZQNDfoaPWb3VCGHMK4k/lxTFnunPF6ZomeD0UEXU5/fPO6Kb3AqE
	yuZiVUDguwpWm2SXhu0BQQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4berav9tgp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 16:24:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C83XVZst+LBKbukmDEErcLIqF35qK3UWCDPSpoSpDB5a8yod0tuRc+eewMLSCPjJQXVPqclItQlQHCmw2nzozXWI9vR3YzjWaO166NIWNMQuXKm4lCGgFr73Wnvc+iuS1aVDLjTN3nUTJw3vWHjCCD0FBiLeJsPZV4ATBlxsE8v0Q3JeDXcuqBygwaNiSsBs1urlB8NaStXW6DCqrcggRupwFynghaxNM1/6Bpy6l2CHLM6WgHzeh+R9/+xfbkv/S5VDpAGd7V0gbspA88m1JEmjqjmilIP9mmUiDiry+da79+RiVo++HcmdwUVEfid0SzRVTAbalQHPM749UZokLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg8HQrnarWTEaLG0mWTviu+a6HwnZOuX4R3Vit47QpY=;
 b=yhEDQIo1Lym4lGtr85fLV8YhSYnCTNQTvDIrKLyHfc8vrlnPN0SRJQvgj0V7fJvC+J9U5xzVT2UBmmRJSoAHQfMJt+quA2U+yAfrCmxstC+cYepP8/l2qLHEOo5pzP+hcNib2/PFssZuk8GL7Ope3W+qUZhytvzl7+BA+61PxAuxPupl6iSSxvEoH3xd1Xpf8sR8AkmUj6ZjwOBwxwY4ETQHpHwKH0xSXro+xam/xreF/Z+P9EeBahDRiSRMbRo91fp54bqTX6AmO//ncJcRa3ozaKmVX4aQzBT18LhkdLGrXlfOgryZBFc62TIVWhbae6B3OkblhipErwlTpFZP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:24:40 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:24:40 +0000
Message-ID: <ad562934-8523-4071-801a-8dd5709c0868@windriver.com>
Date: Mon, 5 Jan 2026 21:54:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources for
 'make rustavailable' support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
 <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0127.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::12) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b10716-2f95-495a-c35a-08de4c76ed21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T3NuZGk1TGkyMkFWUUxEWU50eVViM29XNnlhbTQ0cE1uK1dYYzBJREx4d25w?=
 =?utf-8?B?N1JtcFp3OVRHY3B3YW5hQ2xIZnRaNnloVURiWlBkRkxvNUV4UnVnK2N5VFRV?=
 =?utf-8?B?T21hL3VzcmRxOTdDNFpUd2JRUU5tajYvZWpzNWJvSXowZUo1cUgycUU2L1Fu?=
 =?utf-8?B?TTJ3aVBxbGdKb29MTFJxK3ozZERzRnpsV3VqQ2RzQSt3MDlRaWhaZGkzUVdW?=
 =?utf-8?B?dGsxK2JXakVHUUc1THpiS2xEYk9iRlkwWk93MU05YWYyREJLSVh4d2FTQ2pW?=
 =?utf-8?B?cjlaNm5EbHBYVjdqSXYrU0NvbFcwOG5aV0ZWNG1NZ0VxblRpRkNBNzZ4ZGFC?=
 =?utf-8?B?SzMyOW5rZzdIdGF2ZWlUWkNVQVNHUEtiUWdvakhIL2hGak02bjR5UmVha1RD?=
 =?utf-8?B?M0dmcTZHUzZKWGttQVI0Y0Y5TktJN1JONkZJUlgrRVcxdHhZSjIzbGR3dlUw?=
 =?utf-8?B?SkUzMm5NWlRBRUhwYUJTUzNKRDczbkdNcG1kdFBvNWZpSENkdmY4OE16MEMx?=
 =?utf-8?B?RlMzejVsd09JOFQ5M2h5WGtYOG5lSno1YnhXT1J6eHo4STh2T2srOTk4Sm5J?=
 =?utf-8?B?T04vT3dIQW9QQ3pDTGtXSHNRUkhib0t3ZnBQWndGS2F3S3FENkpKWXdBN2Vz?=
 =?utf-8?B?am0zTUlWbVZqS01RclRoTE5sQWN2L01uOUlhTmRNQmo5TWttejIybjliRkY1?=
 =?utf-8?B?UHU0cWhTQzY4YWlUa05MeGEva3dRdGcvSXZmVnkyaitZNkxyYS9UVU9HZ2Qw?=
 =?utf-8?B?UGtiOHhJUUZQejlxS215bDFNVFAzY2EwenRTSTJXZVByVE5ZV3U3V1FhY3hy?=
 =?utf-8?B?UXo0WldPVDVWbW96a3FNOWwrN2ZEM00zUmt5d3ZJamdkM2I4d2lUYmt6MGxn?=
 =?utf-8?B?TENoZmZYY1d0OWZGREFFaTRzd2c2Mlh1Z2cxUjlTOG1heHN0d3FUMGVua3hY?=
 =?utf-8?B?T1NCS2trNWNhOEt0Y0xNT2RxeVVsbVdtTUR3dm84SGVRVU95MGtpRzJkZUY5?=
 =?utf-8?B?dWVZU1ZDRUVJRHo0V0ZoQVpWWWZOc0x3S2l6eTd1dktwWlV4bEdYK0lCQVp6?=
 =?utf-8?B?K0tQUVoveHRwRWhBMTRaSlZud0Y1aWd2WFgvay84dXFqOXRDM1d6dnJOR0Vq?=
 =?utf-8?B?bXFqcWxYelMyNHpOVHFLR0RYRFZMc1JSam1xMFBNVXJxL3NMdHdDUHN2U0ZR?=
 =?utf-8?B?Wk5NQWtSL0x3WTZkY3lkcXhQdHRwL3hQM21yc1FpbFdxWnN5VUJ4M2NBTHIy?=
 =?utf-8?B?ZDNFTmZHLzYzSFV1UzZ6VGM2Z1k1VTZ2NlVXejA1WW5ieUc4MzVHY25VZVAz?=
 =?utf-8?B?UHFxQmFOR1JMTExYZ0dNZHZ6bkVURFJ2dEhiOGQyOUJjQXQ1SHpXVnZJTFF2?=
 =?utf-8?B?UjYyTXZjY3gvYnRLV0hLWDJjYnhsZlJMYjNKNm9xQjlGaUJQT3JLQXlNSmM3?=
 =?utf-8?B?RUpnS0dUZ012b2xLbVF0eWVDVkR4T3JkNGlwVzg2TG1ueWtYdHQzRldzeDNH?=
 =?utf-8?B?RmhiMVNFM0NaelVudzEzdVJtMXhLck1OY2plUldObWEzVWFtWDN6RnU3Rits?=
 =?utf-8?B?RmdJM3NZM0Nkc3JncGo3SWtHakhSREt5UDdubVpGRU1SN0EwMFMzVnFHZlBN?=
 =?utf-8?B?NjRUNWVtcEtmN0Z6NGlBRXRIMnVITGdaMFZLa04wTkRDaUFESGtmZkZsQVIv?=
 =?utf-8?B?NkNNb3c2d1pZZ1c3TXZ3Yy9SV2ZmWXF3cFZ5WGxreFFQUHNUTll6bVZ1REIy?=
 =?utf-8?B?THJnNWkxcnQzelVFdnY5cUxuNnNEU1IzOUxTUWtsZDZqRGxvcUFad0pCYkdw?=
 =?utf-8?B?S3FBZWRPc2pZRlBoNExjQ2NJMmhDOFZkWHJiSUJrcnZqM3Z0SmdGWk91UTll?=
 =?utf-8?B?TTV6OU1Uc3dXTUd3YkJKZ25INWwwOXQyMXl2eDRlUzRlVlM0RjQxYndUQmVM?=
 =?utf-8?B?UTgwc1hLNU9iZlpCL04wdU1qWDhtYnk0MkZyYnpqSkN3TVJtSGprWFliQzU3?=
 =?utf-8?B?L3JDV3lkcldCT1dxZVFaRzBqYU81N0dLQ214UVN4QXlTaTZGYUFpT2NjV3Jx?=
 =?utf-8?B?NVlBenBIUHNqVllwMVZzZ3MvSzVwejg3NW1kZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUpoVm9mb2o4S0p6bUpCaGcvditJMGwwaDNZMDlldGlETmx1bXExekxEVUZq?=
 =?utf-8?B?S1VSdVkzY2ZQQnF5MHFHUmVBYWJETlM0a3ZDVExnTUM2cGlrRzVnT2NFc1JL?=
 =?utf-8?B?MlBpQjdXejBLakROVzNIUUhUcDZQbkFaN2V5SnliRHJyQ1hnUUZlS2RsVXd3?=
 =?utf-8?B?WDNkbWhvRzF0YWthbUpiSHoxS3h1MDA2clZhcVdWVTdIQkRXQy9pcWthdEVP?=
 =?utf-8?B?NVh2QjF6WHdSenhNTCs2SjN1QUk0dXluSk5NblYzL04yUXdmTVgveHJDNHBi?=
 =?utf-8?B?ZkJmdmY0RGJCbUJKRlNIOWVEVmVVcDBCaFJvMTE1T3dWMnBVanlJa3owMTF0?=
 =?utf-8?B?QkovZk56N1piUmMzY3B3QVppb2M4Z0Vnbjh1eDdQZFMrWmVTSldPZWFXcC9Y?=
 =?utf-8?B?QndUdEtXSTBYaU1RajVxd2pmcXlOMnViZzRJd2liOG5tdlgwc0FuSXdlTHA5?=
 =?utf-8?B?Rm1IRk5XaUZMdkh4NE9hL3ZXV0pCTWYyWk03NlRwanMrK3Q0MEM0NlhEV0NK?=
 =?utf-8?B?UEE3Y2ExQ2t3a0xhUVMwUTdzaGhzd0hLc3JKdHVMTWc2R0pNcldzNVVpWEp3?=
 =?utf-8?B?Q0Q4OHhhK2hrZ0dBZkJQZGV5N1RYeHNlZlllZlRERVRpVXV0SXZVZ1N3dWg3?=
 =?utf-8?B?cDRxeU9Jb01abVlFdTMxVXZjY0M0aTYzcVZVVFdVRm54SFVTd0FFc21qQzZW?=
 =?utf-8?B?U2RXcE1VbHJRVjhqUVNpUWJsVU9kWk04aXU2VmJuSGhDZ3V5U3FQNU1COE8x?=
 =?utf-8?B?bDk3Vm5KOG5aZnRCT1YvMDhQcTFOcXZDM2cyQ2ZNZmZKWGdGMHByZGFKVGpn?=
 =?utf-8?B?eHFlMEpPYW10Vnl6bnFYeFhZR3g5YVVFZDBVTTVoWW01MEI4YWNmK2lnL1F4?=
 =?utf-8?B?VlFQMlg3UG0wcnMzRW50dzNBMjlUM3k3UjdiRmMvMmlnZTBTM0VObGx3Z29x?=
 =?utf-8?B?ejY5cGM5dDRJVWs4eDIzaThERDVNOWpkQUlpZ05CNW43QmFsaFU1YWdIMUw2?=
 =?utf-8?B?Rzh3SXE2b29jZEFUMEFGbzdqV3FndWZUcTlkVEdlZ2Fsdk5uMXFXZjRCR2pQ?=
 =?utf-8?B?MzZHZllvZ2lYTXgrRXVudzBNaTJFQTJ5dVpXQ0xncXRWekpCOG00RDVULyt6?=
 =?utf-8?B?OW9mc2o2ZUxidUIrQzEzN0RwQkFJQnM2aGVteWZLc1pJWVVLOFBFUFlXWkcy?=
 =?utf-8?B?UHJab25HbEYxM0NuSXBNNy8zQk9DZGRYbVZjTGJ5ZXRIUWZRUnBDd2ZkbTNL?=
 =?utf-8?B?ZTdZYXFla0tZTnhVTktrbWlwWmd0RTlDYnJveG9RdmhRb0NLS0ZOaDI5Umhi?=
 =?utf-8?B?RTB2SnJJVjlLQ1RHcGQ1NWR6bU5CaHFacFpEVi9WTWJXMXU2UTJVazRvc3Ir?=
 =?utf-8?B?OURIR1B4dzlPN2FyZ2NDOGJDL05mS2hlV1VlMDBzYjlmekZFZ3RlbnBrU0x5?=
 =?utf-8?B?MjlUYlB4YlhueElLTUpta1VzU2d3elZPTDN4Zjh4TSt5UG5lRklMNlhDSGR4?=
 =?utf-8?B?czRNUDMyV0dRK0VneDA1UnQ2Z2Nqa3pZWDQ2akxXc1VydjZSNzY2TnhQTjdh?=
 =?utf-8?B?dU1LVWpiaG9UdkIwU0w4alJwZUtTZEg3QVpIRkVXYXp0ek4xS0dIcGk0UHJN?=
 =?utf-8?B?eDdjcThkUDNvVFgwM1o3VHV5UG1EUXVuZm9pTzI3eGc3MXVlREZlRWpmekg5?=
 =?utf-8?B?ekE3WWRGRStrNTNEK1FEYncxQjQ2RTMrM24zdjFabGJYVzBIaFRuM3JPeVVl?=
 =?utf-8?B?b2ZyNC8weEYxaXpDb2ptNG9LRWVvMkJaZzJlNzNIWFpRWDg2ZXY2elNaV3FT?=
 =?utf-8?B?ZGh1SzR2TUZyKzNTdEpEc1ZuTmNIdGt3YTlSYmszZjZtQkJCSHRGQVd3ZlVL?=
 =?utf-8?B?QTJoT1RIUlBQeWJXbEhsVHdsOWxhWXM3ZFl3WDRaY1IxWno2dE5oc2pncTFk?=
 =?utf-8?B?VUlLM05xTk9uRlB0Sko5MjFTYnQrUnlvejJuaGJ5QkR2Y1AxSzJJZElnSUd2?=
 =?utf-8?B?d2s0bHdjeExxZm0zNklqdUxYMURoTlIzMnM3b3hVc1NPMEVwRmZpaHNJY05I?=
 =?utf-8?B?ZmVsQUgrRVBESGloekllUGN6TlRsL1FwUlB0VHR3MlFEbUZhMTJkNHRIRks1?=
 =?utf-8?B?UzEwWEVGYnJrSExJeW9peXVIQTRTd3ZVL2lEcmdwam5DNzA1SmtENTlxU1Ar?=
 =?utf-8?B?bXJramNxY1FOR0d6dE9oNDZpYWRTWS9oNmxiUGw4NVk1ajkxWjZRQ0pXZkU4?=
 =?utf-8?B?MHJaMjFHVTc2NGJkVGgvY3BFUjE2UHc1NWFOM3dhQ3ppaWh4T2hKTGxGNzB3?=
 =?utf-8?B?c3I1YXczdHRJeFZGcnZlVUYxREdXNDF3aW1rVitvdTc0bVFjQWNVVlhWckIv?=
 =?utf-8?Q?HijEmYpmWERwKzI0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b10716-2f95-495a-c35a-08de4c76ed21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:24:40.5282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FSGvLRPyO6C6y7zLsUR3jGyTxTPthG4d25maYqY5SlUlKaGXiYxwQ110hQ68dBqDop7/NOnb/uKhnpBmlaP5xrHO7WVYAtLm9aNadhuKiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE0MyBTYWx0ZWRfXzIcWxEm0KkqM
 ReKACWiEUh8s9ULi8aQgLd/LE0admDQqNImqSsCRtyU9YxG9G8mElsWqxKwb3ozZaJMH4PFVvvx
 Iqf52rsN87CpHOlc6r0FnxeVXtyrMuHx8EoU1P5qbPY3wI1/XGqYU+sJ84idOOQk09J9kN55c0W
 3sIhbs3KzdhZNLvV7SxRowXnMqHZUh6mXI4ndW5r6oNUoRIeuYSMbAYWRQ06xcF9vhkUS86r6kz
 3uXRD/1TmtRFOze15hK7EpScZYd7KJGGIn4USKgITqkY7A5Z96HvsVrXKME/E0+6s5fNYD0j3QV
 GUuJfsaFKchUG5aV40lO4eWro0/TmT2gK7lk4ByKp/qPuGFguCKE8tvZ06IrGhH4OBuipoRNzJP
 P1tHuTMeR31hYIdCie4KJRkKaXtQZlQEV7JKIV8HBLLBaa9DGaCmKPrsEEMehU2OBoy1i7ZQDMD
 WotDTj9jsrWBLtjoYUw==
X-Proofpoint-GUID: aGoQ_M3NRJ9VIO7zqxTDf5k_XArtGbfD
X-Proofpoint-ORIG-GUID: BZj73AesPRdl3_r0CtcLM_qDdhAmfUZZ
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695be5cb cx=c_pps
 a=RGFq7D/WLd/IouGP2/vkQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=zFogQM7HyroiLXLzREgA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 16:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228871


On 12/30/2025 9:28 PM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
>> to be present in the `library/` directory under `rustlib/src/rust/`.
>>
>> This patch ensures the required sources are available by:
>> - Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
>>    during the snapshot setup.
>> - Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
>>    `nativesdk` class, making them available in them available in sdk
>>
>> 1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
>> index a25f65f674..7644ecf2d2 100644
>> --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
>> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
>>           done
>>       fi
>>   }
>> +
>> +do_rust_setup_snapshot:append:class-native () {
>> +   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
>> +         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
>> +                mkdir -p ${TMPDIR}/work-shared/rust
>> +                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
>> +         fi
>> +   fi
>> +}
>> +
>>   addtask rust_setup_snapshot after do_unpack before do_configure
>>   addtask do_test_compile after do_configure do_rust_gen_targets
>>   do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
>> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
>>        export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
>>        export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
>>        EOF
>> +
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
>> +           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
>> +                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
>> +                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
>> +           fi
>> +    fi
>>   }
>>
>>   FILES:${PN} += "${base_prefix}/environment-setup.d"
> The commit message should mention the size of these files.
Ok sure, I will add file size in v3.
> Does this make sense as a distro feature or should we just do this all the time?
This is suggestion from Bruce that we take it as distro feature.
https://lists.openembedded.org/g/openembedded-core/message/225256

In future when rust is default in kernel we can change this, But till 
then it is good to have it as a distro feature.
> Do the nativesdk components get packaged separately? If they were, we
> could then make that an SDK feature instead.
No, We are not packaging it separately.
> What happens for on target kernel module development? Shouldn't there be a target package too?
Yes, I have made the necessary changes to include Rust library for 
target as well and have tested Rust-based kernel module development on 
the target.
I will send updated patches with v3.

Thanks,
Harish
> Cheers,
>
> Richard

