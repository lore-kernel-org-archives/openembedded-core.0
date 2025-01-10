Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690BDE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 04:56:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12226.1736485005286786346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 20:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3105835774=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A4QdbN002289
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 20:56:44 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphtmgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 20:56:43 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50A4ugYE012634;
	Thu, 9 Jan 2025 20:56:42 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphtmga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 20:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXqXOPlITx5cfEM3vj/Ut1TDuoCVIma66e4MuiMmGG7Z8+aQ0HuZ6mP9hfn+ArOjpTQ5m+B9gl0osaKdnJu3G8KrkCF0McX55YIFtPINNv8CC5Dpu/YiofbggFaV/kWxQbYvR2Q5fI1Nhp9Ho9BBhlLzxTbdpabzMF8BZgNTs87CBcFY3sMoULPlIhNUPoit+dRNiQVye1ZdI06RWv2SFerg56svXb0nZYsDzA9fwUeN8kRBsHcP7wCZP83/KG7rCru8Q3xfyy7cSyQ7NhV4BBDJ5/ips9sHU+OOMdJYL5UQivXE+drgKeYURSQJNUFCyTmXHYpBcXYxRc/E9/EMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGeDyolDQtftfd/aVyxQsXnz1/zsjXR8HstZLwpetpM=;
 b=huYZuiP86TOc6Z9oZQL2lwLZcsffEHsxUXT85jtuZ6xvLs+g78g801rZk0hQ40VXLz2vB4FH0c5X3M4hZ3IzYbtdrJbLOXpaSl/VRQuehE19jteZLXkDsY23n20xxzGMM6oQ9ddLvPnC3EZWYQxaBaU9tT96OAOK8A2zWgtOnzDK7r26YvC1ixXC0kEGzp5afyldhpxui84fpJQcyBb6uwdP7pK/fu+t1CbyFkybIHhsB0IH6nXU+eafUpxo/IPso8qIcbgW3VjqIXYkqBNkTDBrcuNjY7XKbEWU0otXTLtblXmp4DQ9undVFgVjHeVQbUrq5/KikXEbTslGuFX/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 04:56:39 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 04:56:38 +0000
Message-ID: <890d528b-597f-46c8-a315-2ccb070b2e6c@windriver.com>
Date: Fri, 10 Jan 2025 10:26:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2 3/3] rust: Upgrade 1.80.1->1.81.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20250109092521.3921275-1-Deepesh.Varatharajan@windriver.com>
 <20250109092521.3921275-3-Deepesh.Varatharajan@windriver.com>
 <6d0d537cdd4f22156612f8928be0348f6047747b.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <6d0d537cdd4f22156612f8928be0348f6047747b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 61efd335-d535-4a1a-3206-08dd31332a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1F5UVc5a1FBY0hHL3Nyb0E1YTlzTnRCTUNDcGtRVnJoR2M3cUhybEhncGhR?=
 =?utf-8?B?RXJldVhqVmNrdFpRWTU1NkpmRnFlNTh4NHNBdW14RmVTV05qN1lPMnM2aW1X?=
 =?utf-8?B?Q1p4RGxtYWFaUXV5bXY3S014VnNEaENZMnYzVWFFS3lGejhiT3huWEdSSFpB?=
 =?utf-8?B?RVVJQXFnTVNUODR2K3N5S25JT1ZZVnphY2o5ODBkMmpkc1phWlUxRnVZUUVV?=
 =?utf-8?B?dUxETnAzUnFJNERXWEpCU0JvWDBzYnpuQk9QbmhPUDVUTUhBNnF3OHJtVG5H?=
 =?utf-8?B?SFA1ZW12WUdoQmdvMmV5Rks4ZS94TnNGR3BFQURGdkhLRFhyWGxwR3V4aUVC?=
 =?utf-8?B?WmdvSjhxVUp6cExHMFYyS2pxYmhtWTluQm93L3Rib3RlOU9sSTVzSHJLSmVl?=
 =?utf-8?B?L2VzNUM0OE0vd3Nsa2JmSHNaNVNDV0FxMmh1R3lubHVyZzd0TGlZRGVVZnd1?=
 =?utf-8?B?elhnZjAzdDVSTDRuNTljR2VIUTI1S1F3WGdCSnhRZXF3NmdHWVJEU3NGVlE1?=
 =?utf-8?B?aUNoSG9xc3RyK01LNGxyLzh5OEpjelpETHEyQlZtMnJBM2VmTlBzQUVpUlcr?=
 =?utf-8?B?YjRMTGVUWXMvYkRRNXRVTlJzNjIrcjhDSGZMaU01TEVxN1h5UkI3b1c5dHV5?=
 =?utf-8?B?Y3NRTUJlN2RmVXhUS3QzVEhSSVQzSmhydnRyaTRUcDlxOXl5MWwzMmFnbWRn?=
 =?utf-8?B?b2FyK1RWalViMk9mY3hRUHpBMU8wN3hkTUdFM0ZOeHpnV0kzOHZPeGcybUhD?=
 =?utf-8?B?OG52dWlQWVpZb2dXUXFEcld3Z09ISHk2ejlpTHNOaTU4UXhPMmtYdURRQ3R4?=
 =?utf-8?B?YWhuRkc1a2tCdk1HcHlORWxVeDc0TDR3RGhkOU1RbC9Iakd1Znkrbmk4bUJn?=
 =?utf-8?B?QUplc2Q3dTJKMDYxSVgxOWV4R1gwaVNKUDljOCsvMmh5c2xRN282ZW9US0Qv?=
 =?utf-8?B?RTc1TC9URHZJSE5KcEc1Y0d0dVgxUUNZemhvbnVaMzlhSkhib3Nqd3lPcWJa?=
 =?utf-8?B?ZWxHMXhNcGNoOU0zNm1PRTJYVXZSR0l3ZUVoQW1zUlZEOGVuWTBPRzNhNG9l?=
 =?utf-8?B?VEZDcmR0K1NRNmVQcDZYbmFIMW9abXpaSkVSNUpvbmdySlNtNkRNR3ZzYjRi?=
 =?utf-8?B?cEdVR0ZBVkxLcVViR3V3UHgxS1ptOWI1ZEFJbGN3OHFra2pKb0VzZ1o4OWph?=
 =?utf-8?B?QWFqd0pCeGFyZWY4clJSNHNyRjd3bFBzVkg4d2xTcndpeG9MdmU3RGFDUnVY?=
 =?utf-8?B?dW92SVBZYkV5RmVuUXg4ZTlsQllDQ0R4S21maXgxRTNpWlkxc1RxZHlYbGhV?=
 =?utf-8?B?VVorRjdwRExnRUM1bmxxZVdtYlVBQW9IUXRURXFTMWlwMGdocEF2bDU3Z3ZI?=
 =?utf-8?B?Y3hyTmp2WEg0S3JENmlUUXhUdzN3OHJQRUNDcHd1WjdtYTRTaE13OS81Z1ZG?=
 =?utf-8?B?V2JsSXhWK2toN0lLTVB5MHBVUXRhUWhKM21FNktNK3B0Z3N5enNrbWJJUzRw?=
 =?utf-8?B?MnpNSkZVWHFtNlpxbGdOdTA2c1pQVUlmd0JlbnRzVVd6STVNQXZFcTRVUTky?=
 =?utf-8?B?S05HYlFjQzZhaHZjQnl0UWZpZ1BZZ1pRUzJHLy9Oa2xTcmNidlB2M3MxYUNZ?=
 =?utf-8?B?NFBKN3hjOXVmd29YOFN0MjU4NXZyeW1JTDhCYmdoK3NiQ0EwMUljYTJub3Zt?=
 =?utf-8?B?L0UrQ0dmZE9uRjZEK0l4VXF4Y1JXdHhUZFhPeE1JcU1XeXVOR3VmY2N2WFdh?=
 =?utf-8?B?eU1NVGtSWHRXWU5sS3hYUkR2UTBYOUFkZlI3WmZ1L2NwajFGTkhVN05lVTRm?=
 =?utf-8?B?M08vUVJWemlJb2cxcUhBZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SW90NVpkM01ETzVtYjRzVFdUOWR3a2IzbHRiWFp1NXpOR3JOd1NVQjFEaXdj?=
 =?utf-8?B?S2lHYXY5a05sMFJQQ3lTcFF6NytVN241QUJKVE9BcHRUZFdIY0FpVHJGWnZh?=
 =?utf-8?B?aGFTc09CbWRGTkJIZmQzV3VNb0V4QWZ1QWo5WDY3V3VGWnZvOC9lYjUyRkZl?=
 =?utf-8?B?Rk5yK3Yzd0hFODZHOEkrUUs0N25JRGtyMDZGblFBOWJ3MEZaS0U5TXlMdyt0?=
 =?utf-8?B?ZFdpbERsWlh0dmlwL1h2K1cwcFZZNG8rYkJSOHV0cmxydEF3QisySVBoamtZ?=
 =?utf-8?B?bklTaXVjM1d4YUxWN0lsZ2JOTEhmL0kwZjZaZ0ZwRHJIR1hJNHhIZ2tTRVpz?=
 =?utf-8?B?Z0VJRXU1Qmk4ZVVzNDQ2WFBkemRDWDEyRUdEVHQreE9GUFNKMTE1aUNNYy9U?=
 =?utf-8?B?MXc4K3o5RVgrWlhZTzcyZ1BRSE54VllGc2R0b2pnTlRqWHdVL3IyV1F4cWs3?=
 =?utf-8?B?VTFvOHRJTGVnNk9uc0NHVThOaEJLYmdZcWN4bHhURzk5U0ZzQldaTDIrNVFa?=
 =?utf-8?B?cHo3NFpnSTUwQ2JPbXJvTjc0QSs4NmYvdlNkMUFIV0ZkRUM4dnlRUEJLMm1P?=
 =?utf-8?B?K3ExZ215c0Jxd1FpTENYVnhLb3RWR3lCM3Jac1BaY21CcVNienl5WG96Zjdx?=
 =?utf-8?B?SGFzaFNNWE9xMmFsKzJ1RVpGTGgwd1hhdTN3ZzR2b2ZZUHJSS3pjZUlFc0x1?=
 =?utf-8?B?MEtoKzRneUwxQlRqYWFWU0dVdEcxb0lDdndOZGE0RXZIVG5XYXhuWjVvbVlU?=
 =?utf-8?B?QTlyOGk0Q2I2OVIxR0Jrc1dQZEpOWjNCY2VVM1pLcEE0SlBLN1RJUlZyTzFI?=
 =?utf-8?B?ZlpMa3BaN3dWMFJySGFIOEZDU3lNVlZDVG1MN21Tb1BqT1EyM2tmMXdneFQx?=
 =?utf-8?B?eWc0K1J1WHUrVE1iMVhCV0VWaXN6bk1ZVlZNZThqemFHK0dOZy9TY21nL2tG?=
 =?utf-8?B?dGtwZmhVSjFUOTdIeW5UdlhCWFRLSXhROWRXTzVxVFJ4NzlSellxN0c2dGpJ?=
 =?utf-8?B?eE1aY24yQ0d2bElBYjJVRjZxWUpLRml2OW55RTQrTHV1RGQ0Mm1DalRvZ2pE?=
 =?utf-8?B?N1dleitQMGRKSy9LSHNaVlZhYUZzRm5SL20zMWxCUmQvUi9wMStFcFBSSUxR?=
 =?utf-8?B?dURWNHBKUHJ5NHR0NGFGZGZZWkhGc3UrYzJ4R29kMUxPb1p2ck5yWVF4d3dw?=
 =?utf-8?B?ZEI3aHZrZzVmNXJnVTdGUlB4cVc0RTdWK3ZodGVSdWxlc2xudlJLTlRBdzVo?=
 =?utf-8?B?WkhPTlhCL2ZWcXVXN2pueGtMUVc3cmtPZEVvdWhFaEYxbXFGc053emVPbzF4?=
 =?utf-8?B?eEVScEVFYVNqTmhUTVBHR1NGVjdBZnkxMnpGQ1haaXhGaVFSS29oSUtMOTdQ?=
 =?utf-8?B?bExwK3krSHFGRFcvMnlKRDgyRGhxOEN2OUpmOFZiVlh1dGsraXdBczlubzlo?=
 =?utf-8?B?aERIZG54U0wybnJJaGZ3aktyM0FQL2lsNmdydkx5Z0hQNTllN0xPTVJtRGtv?=
 =?utf-8?B?VXBraG5OL1pEUzVGMTNOekRETkhEaUFZWGtwTFdJTjJQY2hteEhaa1R3Q2FH?=
 =?utf-8?B?ajdReThEUGI0dTBlb3IyektOSWpRTVdmOU84d1V3WmZWSkZ1bjhidkQzWksw?=
 =?utf-8?B?VC9MbzJaYmx1ZTdLR203Qkx1U2VpTzJSRFEraGl4b1FKTXZZY0tMajNGQXp2?=
 =?utf-8?B?Q1B5c1JRTEZqakhna01HaGcxMktQaHdjb1g5blZFMjJHeXhhc2t1ckdLelFw?=
 =?utf-8?B?aHpzOWF2bTZqYWZ4UVg0NHRUSW90dnFKcFR4aU9WU2E4Y1FVaUxGUC9UbEFW?=
 =?utf-8?B?MWt5M21nUWVYRFQ3Q0FZYUdqcVBJdTE5bnhDdlpGNEZJbDdQWndzelc0eVlJ?=
 =?utf-8?B?cHF3Vi9RcDNGRW15MnFBenFJbFN0cjlxWG9NQXBhV0FEYW5oSHhQL2xkMWtz?=
 =?utf-8?B?RnNoTUNYTVVrVUNKOWZLTkRRdG96MzlLdEJKZ3hCeDU2blFMQWxzNWUvMG9P?=
 =?utf-8?B?QVUzVkxwbkp1WHVtK3JxaGp0SVFYcG93Mkc3eks4Z1g1aCs5cmMyUXhaa2RP?=
 =?utf-8?B?UUJHdGVGbWlaeDFtcnVqdUF2SHNuQ283dFZhTUJVQUVrald0c0hVS2RobWFX?=
 =?utf-8?B?OUljK2hYMlFoaWV4QU1hUU5BbXo1WTZnYk5aUjNyeUlGM1ZIRW5YUDVwa1JM?=
 =?utf-8?Q?HlUTleuDUjX8J5IY/GZTXTw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61efd335-d535-4a1a-3206-08dd31332a4d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 04:56:38.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQGBR6rjwP9Qoxna3j2l56S4bMnTJwy2hh0Edd2gWfyoK9s55yXfULZs2jpzgJXGgAihsXLvaV1Qd4rgh2R5oGN1KkzgvOPSBAr8tnaDSr7bdSvGydHy/au4Wa68H0qS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
X-Proofpoint-ORIG-GUID: vcdUQHgRcB3bk9FhntqwJ9x4JgPOhlF9
X-Authority-Analysis: v=2.4 cv=Oa1iDgTY c=1 sm=1 tr=0 ts=6780a88b cx=c_pps a=mXs27GP3B2XOU+bPH1EGlQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=FpcLdYbmFvFPcse97M4A:9 a=QEXdDO2ut3YA:10 a=On0Qz11iJF4A:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: W0oOnc4kTZG9sSx7ssoRG5J1iWa2LNyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_01,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=686 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 04:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209634


On 09-01-2025 19:11, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 2025-01-09 at 01:25 -0800, Varatharajan, Deepesh via
> lists.openembedded.org wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> https://blog.rust-lang.org/2024/09/05/Rust-1.81.0.html
>>
>> Drop the following backported patches which is addressed
>> with rust v1.81.0 upgrade.
>>
>> 0001-cargo-do-not-write-host-information-into-compilation.patch
>> https://github.com/rust-lang/cargo/commit/2db0bab16139d094f689587b73539aae386a1919
>>
>> hardcodepaths.patch
>> https://github.com/rust-lang/rust/commit/28503d69ac204ff208d115aea30dc09d6fca8728
> I put this into a build for testing. Unfortunately there was one
> failure so far, on x32:
>
> https://valkyrie.yoctoproject.org/#/builders/11/builds/761/steps/11/logs/stdio
>
> :(
>
> Cheers,
>
> Richard

After analyzing the cause of the failure, it was found that the issue 
was from a data-layout mismatch between the Rust sources and our sources 
for the x86_64-x32 target. The data-layout has been updated for this 
target, along with other required targets, except for the MIPS targets. 
A V3 with the updated data-layout will be sent shortly.

Deepesh


