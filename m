Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508BBD65529
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:46:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10715.1765964769928092539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jLbfHvea;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444662dbf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4QXa21017181
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:46:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fyCNPNGope7L5AAqKQ3TrBrY6e027iOUlboZmEPmLeg=; b=jLbfHveaIEvg
	EZNtlHifrSrQdUYF5tRIbDv0RwuuC8XWZnRyQbKhvQiYO5Ew44AYoVfX3qRt+XBg
	4IDzH4hjOIGoe7hIJSb3Mn1gBuN4fcZ4Zu+Bd3GXXsIKWJMJBIcqDF3bkAyGG/DS
	C8QobFRPJshoVF8opxX9FPp8eDRo4PPC2hPek6b89mwcAmSeLIWSHnm0uKe9qc+t
	FkvXQLg++B2RtOh5Gl1KUReY00j6gm2IjhAp7v/jhXVje8Er57WL2bQN7vIqmF2l
	xXYh2KQIU14Bwcgzt+2YURYoCBT85zn3Uliar4S8V76xVpXV4IF8zJCm1qijACoo
	WOoVYcJNTA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013067.outbound.protection.outlook.com [40.107.201.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j0cjn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:46:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aka+k/gzJ0CXMDImImOO/+AMGW6hlrY8EWjuD41CLSE53gx+vhpTZZYZ+3U5dFaZtwTQvd3t9nHl/S3QAu7R41LafWGjIOMwvyzte/1UWx6UDz9OR+BY6LGzhwHToEjA5Fo+JFwJ54RLZKDQiAWOqkI0NgrtJXetJAsipD4JEDV8nRQaSSJ4MUXx52Xjmz9On9AITyMGC/DyTOCquFl8wU8DXI0koOW9KwDWi39U4T92vSyJnrNlgm5iUmFyR2nXwIW4Lkn041iPg0cxOp4dCCCSlipwLCGdLTyVShY0BNQwS/Zt0r05Bl0xfkqeoPQYS+pg03atj0CqepD+nOBTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyCNPNGope7L5AAqKQ3TrBrY6e027iOUlboZmEPmLeg=;
 b=XOplw0gdVo00FNYK8MhiBaiWxZPUYr/XtMhtrW2gopMXasyzqyA2e0KSvDZPXGt5y5by6Rqgc7rxviK+ENgfgXuDD3tquQfcK2DuazPFRPCWZUM2TGR9rv+1Jo9WUwfb+TEQaFMyd0WoTOHuPcyAyUkAoKsP80EvrSacgSBhrnUP93tL91nSPx4Wp4E0nWFjMtjMKZw0vpVkYBcbvdY+2s+F/660zhOhZv5Y9PWSWwW/lBApyqy1OUpBjYy5sRAoaw9x0PcOQFGNBNMLX9wMAKxk8sUyNyVBafplLCurhE5/w1bI74KMzzOLujxYj6O47nmroRCZ8pLnLmlywbttNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:46:07 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 09:46:06 +0000
Message-ID: <5aeafbed-60e9-4be6-8e2b-fc4f1fa7db3a@windriver.com>
Date: Wed, 17 Dec 2025 17:46:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] insane.bbclass: avaid unnecessary rerun of
 do_patch
To: openembedded-core@lists.openembedded.org
References: <1881F77D1B486FAE.1250271@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <1881F77D1B486FAE.1250271@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b4a49e-e75a-4dc0-e1f0-08de3d5119c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUY4RTFUeDMyb0FHdXkwWWFuRjBtWEVvWUdUVGxucVZyMHVhVytMUDZiaGJK?=
 =?utf-8?B?MVNGOFFaRmlmMXp0ZjFzVHJPMkNhUGtBT08wbjBRcEhmSGk0TkgvSlREbTc4?=
 =?utf-8?B?MDhmL2RSdlJmUS9qTE1FRklmRnYvc2l2QmxWbWdpWm1ldDc4TXpVMzVQVnRE?=
 =?utf-8?B?N0NCSE5BQ3FrNHdGWTlXN25yNnNvV2JLZFJGeEt3dWFnb3pDVnNqNU9kcVA1?=
 =?utf-8?B?UnpHMEFKZTQ2dDBGb2F3YjkvWW40ZDRLUkRVSE9veEZBWnVVN21IREF3SmRR?=
 =?utf-8?B?dnNieXlxTk5NNlpFbmhlRnZjUW9RWFVkREd6U3YxVmxtRnhqdWpGaXpRY0hx?=
 =?utf-8?B?a2Nzell4S2tyVm4zekkwcE1HdG9RRUdkVURaRktpTXB6MFRCUlFoZk10ek12?=
 =?utf-8?B?VXRCT0pDem1tR3NMN09jNjkvVEZtdE0vWHRVRExHbm05Z3pTT08xd2dIcHQ0?=
 =?utf-8?B?ak5ZUmo5WW9hYXBKbUZWVStUMjJYc1ZlUGpoNlhjN1NGNmt6K0xZaGRaL1o1?=
 =?utf-8?B?KzdlRXdNUXc1UDQyQTQyTjBTNFVxNnRHdnVaQVpyTmpJcTV2SGVhY0I0eTV3?=
 =?utf-8?B?QkNqVHUvRFBWWU5GanlvckxEQWllZ1RnRXJHdHdHUDB2WVVUOUVUWmU2bnFn?=
 =?utf-8?B?SlBiQmtpT2h6UDVFQ2lXY283SzI4YXVLR2lENkw1WkdadDRKQ0VyVVYrczJZ?=
 =?utf-8?B?R2dLQlZqaDlZcitqenRTZlZLYkRrNmtkQW9URmVEaU5WRy91VDM0N1hWcWh1?=
 =?utf-8?B?T01SUmNjeDZEMHV1cEtXRXVRNTA2R1Uya1NORmhpV0V2MkRUTlpuVUFhSC9o?=
 =?utf-8?B?QXJVTk9mVG4yOWQ2RWFqWTZCVE1BdGhoU3VHa283VWtzU29BS3B4NWF0VmZO?=
 =?utf-8?B?NmI2Q0M2Q2lKNnYvc1hzVTdSeTVxMS9xSjl0eWc5dGttem0xY3ZVL1EwR0Fp?=
 =?utf-8?B?SEQ0aG1SVGIwOHBDdUN0N01leWVrLzdqbUdsSEtHdmFVYVhSQXc1dFV1dEMy?=
 =?utf-8?B?TlBZTDMxU3hiaDBnUnBLcFhVMWp4dTQ5OE1USTlHQ05hdDVSbGw2aWtML0ZF?=
 =?utf-8?B?alVQZ21lR0RNaW5HeURDc08vS3k4STFBbWpwSEJMOW1XWmwxVUJMWVJacmJE?=
 =?utf-8?B?YkpXa3V4eUkvMi9tZWxNM3N4WjZQZkRUVnN1VG1SYXVoMXc0bi9JZTZNc0Ux?=
 =?utf-8?B?V0h5enlsQjJNTmRtUldUN0VZYjc3NDBaTmtMbFcyMWxLbFZ2UEM0ZzhwdndN?=
 =?utf-8?B?ay80Wlg5RnI0a3d0cVUvdGhzV1l2YkxGOC83cFRCUHRMWVNqcWt1NnRBZ2Yw?=
 =?utf-8?B?UDJPR3VwdCs4ZHFCWVNEM01vaDRqbUZtUE5yL1hlTnhRZGp3SGRTTFlzVE9P?=
 =?utf-8?B?U050cVlXRkRWNzROMTVFOFl2ekI1OUgvT1BDZ3Q0c3hDaC9QaVB6c0JkRzFU?=
 =?utf-8?B?elRSV28xUFEvWkd4eDZhTi9qZFIrRmJWdDlaT3NuTUFwT1paY1pDSzF4MHIr?=
 =?utf-8?B?MCtQUXRZdC9HYmptc1R5bWYwZEFDb09PRmNEcThUYkoyeEtJUHNtNGZINGJu?=
 =?utf-8?B?dThVV3NjSExiSkJSUXM2Z2lrK0RVd1ZFV3I1eXZvM1N3QVBaam5BYUUxV3lx?=
 =?utf-8?B?enpUNXdNUjhVR0dlNVZ1M1F4NHBZVmhhd0lBVVBJblc2NUd2dFVldlJnTWtq?=
 =?utf-8?B?ZDREelN0R1pXQVFMZTFmVURJd1lmOTR0WkdiSVkwdkxNZjJ6ZEsxMHVKWklH?=
 =?utf-8?B?L1ZVcE02cFlQMzV1QVBUOTdpb2ZvUm4zVUxIVk1hOUdoVnE0MGZTOGRoT3pv?=
 =?utf-8?B?cHpOWE9pdkszTEFIdDFpbnN1K1IxQnhKdnd0czczN1JLQWJoUThtSEpWdmEw?=
 =?utf-8?B?RlFURXBHYjQ2bW1CUVhUSXlnSU9rUGRUeTErK0dmQ243SHZSR1RkVGF3SWVI?=
 =?utf-8?Q?EZ7kNsjeLq/NeCxmrlx2JzE/aGu4Vg3b?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RS8zcjJQMktJMkpTWjA3dHpNZ0lsTmRSTkRIOU9ScGVLRjJSOEQwRGlYMVgw?=
 =?utf-8?B?a2F3Unh0UnJvVzVVc2t6VnViZUVqdTBlN1dDRStpd1Jsdm1hMEpzTlFQQWlX?=
 =?utf-8?B?RWdIZnE2NUFDK3pGS0cwWU5FQ0FVdnd0OVRqTmY1YU55eGpvUVVKUm9zYzVZ?=
 =?utf-8?B?Vk1YWlZzcjZIZEM4VkphbkFkM0tNb2E4NmZSY1ZIdlhlRFJ1RXdla1o2Y01a?=
 =?utf-8?B?VkhlZWo5YkN4MDVaS2RKU0VVQURmSS9kZVJEblVXZ2g4QlJ3bHBZZ3VZQ2lu?=
 =?utf-8?B?cy9UWnRML3RwSXpMUnoxNlNYQXA2ekkrTUh4Ym56dm1uOE9RT1doVkUxNE5u?=
 =?utf-8?B?dHlOc1FDQlV1Q29RQ09BZlFjTXFldWs3UFdZVnVJdWRYWFNQKzZhNjlBajdC?=
 =?utf-8?B?UFZCbXhVSU4wNHhsRDIyWTFlK3hFK3doRWpSRUkrQW44NE1NZURmS0R5bGVD?=
 =?utf-8?B?bTAvRXpCZk1BOGpTdC9tQWNNNWJzcG5lWE5ZOVFWayt3ZGN6UzB1cVNlR0xz?=
 =?utf-8?B?Y1M1anNjMXdjVUR2dXU2blc4YjBYMHlhdnpoQ1QzVVBOMnJRS1RyZlBKSVpK?=
 =?utf-8?B?SlNnTDBiR1J3andoZloreG4xVHdGdmVjMnE4NGo3NDJrSG4yVytsYXRjQ1Vq?=
 =?utf-8?B?RUlNYkJucHZNYlhmaEtkUUEyWXQ2RnV5dWRoZDBoTldkcktscjV3TWEzME1C?=
 =?utf-8?B?YkJBc2ZzR0dTYkVNZVJlbXBRaUJSUEw3SmJwWHFMSXpmWEhSOWtkMzF5elYy?=
 =?utf-8?B?djh4cDZJMWx0SVIvbDdZT0kyNWE5aDFMbUF0SUJrUzBNa2xHUGVxSVp6clJC?=
 =?utf-8?B?WXAzWEFqK2FadGRLbzBqbmRiSEZlMkFrcVFpMndpTzJpR3I1TWpVbS9IbnZw?=
 =?utf-8?B?bHFRejhJUlZmZmp6Y1UxSjAzSTRXaGxucGRuOG0zR2ZtZGpyamNJVjh1L2Ns?=
 =?utf-8?B?RGJYK2FUQTFsaW4yblZtL1NQQXhqc1NkdEx3dWxiVDJpeS9UampBQjdkT1Ji?=
 =?utf-8?B?bDIyeHRZRk1aVTR1SzJvK1VLdk02UmhDNVJIc3NoNTFTYVpaYUVmMHloVC9Y?=
 =?utf-8?B?eDVCN2kyVUtoVDl5QkZzTUVxdFlGby9nVDBYc1BsY245YWdUN2tvbThaVnN1?=
 =?utf-8?B?cWZvaE42WlV1b0ZKTmhiV3Z1SnFaamZpN1lGRk1TRHkvamhqSnR6YWF6SlhR?=
 =?utf-8?B?ZTRGUTlNRjFwbElFN1FtS0huUU80L0EvRjZ1UjRYS0ozaU9EZ0RmVnN3WWJj?=
 =?utf-8?B?eHlWM2lIQnFMMzZ2ZkJpZk5XR1kyRkZ4a3JUelh5Zi8wT0FscE5ZS2pQM05I?=
 =?utf-8?B?Y2F3T2ZFWk52MmxuNmtWM1pZa2NabUxyc0wrV3JBSnNPUWtvNkVCZmNZUzFj?=
 =?utf-8?B?T3V6S2NwdUVDU09lY29xNnVYU1ErWGROUlp0MmJDNHA4RjVCZVB2ZnJuSlNX?=
 =?utf-8?B?YmhiYzRWdFV5bXFxU3l1bmprRzBJcVFMc25rMXBQeWh1SlE4RFhCRTFSSExu?=
 =?utf-8?B?K2RHTU42RWh5Z1dBN3ZrejBheXUrSlpFNDc3clZxc2xIZ3RuakhZOHRyYzhL?=
 =?utf-8?B?M3FtZy9YZnVmdUlRMXZac3F6azFxaS96M2JqZWpZbUN4bXlTV3lGT0JOMDhH?=
 =?utf-8?B?KzkzQWJhQ0hmanFYZkk5VEdIZ1dXTGo0dnhNbXNzaW5XYkhTMC9IUmd2d2tM?=
 =?utf-8?B?dGxvNVExcHY2UENwY0FCQUVBR2ZLQVZvLzFqK0MrNit3czlEVjgrNlZZQmJB?=
 =?utf-8?B?b0dLQWRuUlhqVkpOSFc1R0phVmR4ZjBiNGRNVi9kUFFWekZsQ0VWd2J0a2w0?=
 =?utf-8?B?dGxvSGw0TysyU1J2RndxQU9PVk9BbUt3UGQ1S2lYbG1VTFRtdWwweEJtazhX?=
 =?utf-8?B?bmdDTCtEaXo4UCtBL3d4cGZGUE04OHdnSlp0ZGQ2MHYyNEhjdGdWSjgwOENr?=
 =?utf-8?B?K1lHN2NFbXhQQjRFSlBpSzZpdlo5bEM4UTlKWFZmMG9FWkhiYkhoQ3hRejVs?=
 =?utf-8?B?d3phdDdMRGVCV0NieUVQWDBzclp0NWlCRlVsMDBPSmRRc0YrYjlxc0hDZEZL?=
 =?utf-8?B?V1hINFBlYk1GNVZUMWtJbWkzaTNLR3hJaEJuVXdnSnhuSTU3MzlrK2lHbXNX?=
 =?utf-8?Q?HJA98cyiRPshhhkpBYGh9BQZB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b4a49e-e75a-4dc0-e1f0-08de3d5119c9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 09:46:06.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+cQKeDjncJM/jacFb9BHf2c6zYH86fwrAPPwNORiD/OmqiYes1FYV1KHLrVteCAuoo6BJV51Me84tcpdSJq+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69427be1 cx=c_pps
 a=WMD2V7/OXcB8V+UEbxscyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=FhZDkBIl8-ymeVxkJ9YA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DTjEE-UB8oVVrguz2jKqje70FwGgGlEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NyBTYWx0ZWRfX8oYLXrMzIXr+
 WZNpJNiLDE7cxlDYlOC4jSZTY9TY5686VgHHF/Ae32GbLvE6Zrjtw4cM6XGtZnNiQi1xzvup2M/
 yyrCAbJ6XIt17Gz4hgQdftEwS3uZKFyVvJkW1VoMwQs+3+aZJJG1/6f1hpWMK4njF0NkRelRWcK
 qUAGSGL/JL4ZEk4rDIQmU/m7BdEzCDyGaPbNqxErJtlA3auI9fKbaHr6fid2tsmDTMVR9dG/UJV
 YtdaTZZKWyMwtcnPA/WXdOq9fCjyEl657dF7yyI2TGlJ31jo8hiJYTRSkpfeNXf3hwTS8egTcIP
 JVIt23TEiUmjjANu6NFi584uPrSHqwMHLMHZ9WbW+LgB+wEFT4OKCPgv+RDsm9DsHVexUhWaBVA
 eUtAi+153nyNDniJjQW+AznGJa/rTQ==
X-Proofpoint-ORIG-GUID: DTjEE-UB8oVVrguz2jKqje70FwGgGlEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228018

Sorry. Typo in title. I'll send out V2.

On 12/17/25 17:43, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> When toggling ptest for DISTRO_FEATURES, the do_patch function
> gets rerun.
>
> The dependency chain is:
> do_patch -> do_qa_patch -> DISTRO_FEATURES{ptest}
>
> Such rerun is not necessary. And it's kind of annoying because everything
> gets rebuilt, including cross toolchain and recipes not using ptest.
>
> The ERROR_QA and WARN_QA should be enough to trigger the re-run
> if unimplemented-ptest is added to one of them.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes-global/insane.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index fed8163c3e..3185209b7f 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1345,6 +1345,7 @@ python do_qa_patch() {
>   
>       oe.qa.exit_if_errors(d)
>   }
> +do_qa_patch[vardepsexclude] = "DISTRO_FEATURES"
>   
>   python do_qa_configure() {
>       import subprocess
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228017): https://lists.openembedded.org/g/openembedded-core/message/228017
> Mute This Topic: https://lists.openembedded.org/mt/116824148/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


