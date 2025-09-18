Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A610CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 14:43:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16045.1758206583767577225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 07:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VCqHtVPG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1356544a94=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I5cBWa2526535
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=XLUgOunz2cMYqqyoMuLiJ4
	6Eeluogf0fa3DTtiiOYcU=; b=VCqHtVPG6RvRg+ExaP6vu8f0uXIh3La3ooa8/W
	SP7yuly3GVJGi7G/2YnHCIkul9d/jyoCppfaymKcBTQLO8ZLLWx3re7CAjDRb+U2
	RRInKEZFu2QrzDFKQp/FQ/cDtUnWUbuU4TMgY01rFfZIl/C3KKHgDZYRRDVtfoUG
	T+J0vnRzFS95344/mYaEOZ2qhDiPyBk21HzDGUXUwY0iXOAMKKXmvMVF4PtpVOvH
	JEbDIX8+Up8SP6Pd6qWcfs5m5q5xDzjgNVnZpJfcBET5bTKF03cHjnR/y7PafiLI
	rF/t/Vg6Ej/dgZ1sayYA8zmb3+5YcX5Csr0fpkZ3bgd1LyMQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013048.outbound.protection.outlook.com [40.107.201.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwst7kc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 14:43:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnKfF/8Ziz7dK66PQITFA+U2/RAIfrRTVzTEknkqWs0is5X6hsmpnSfzINbbA8yzY+It8P1/s2S1zXhV8cRwYFdyZd2W75NIhVZXU/oXIDWmi8v2WoKzTan2SCyArBVCctc5OZ8hH0KP52k/sMr9qYD0itjUC/U6MkcgwvfGZuFpRYfKqOlZ+QzP10vc+q/ETdHMoQDnDN8Z7HmurYVeObKbBOjfDq2J+beS51QcQpfvKpnY+FA3J/TNaMcktuf308rCTAepLe2EqkgqeCkSGiK5CX15eWzyI6KjhJpTSwjTD8hz3Ump5v76aJTx7/XFBiHh4N374LhTxddYC0iIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLUgOunz2cMYqqyoMuLiJ46Eeluogf0fa3DTtiiOYcU=;
 b=bGmTKES+wctcuf7QybugImpexS+l6R/zitMnL+oSQRZpTn0B5ZmQ21QVjUAdf2Mo60JoQMr57GN1YYffBmT1yVIvXSxkFusPVGzwEnnFDKzP681FE25sGmrYx6MDoyZzrFBDQmtdZiFmHg7Z40FYu927rN1MUf8e4ZmkL9Yob3MAqr3/b5PlpwCFKNVyEbz2Tm6FarxfYTygJBO+Sf2xVQQDhb8qnt2Xz6RJ893kIlqG508pbPiHxpKarjUCmf8Q1Xlyh1WEzS3G4WpRLLlMVJGHCM3rkDtZcr9zBm1DPIDJ1y60/8yLM0nqfQ4OlQUlTornDTOlg7t3mePw2Yq4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 14:42:59 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:42:59 +0000
Content-Type: multipart/alternative;
 boundary="------------d1AcWa0IR4j960CGcuOiOJsT"
Message-ID: <af52f896-b980-4923-bab2-d93c44c71970@windriver.com>
Date: Thu, 18 Sep 2025 20:12:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Remove rust-llvm dependency after LLVM split
To: Ross Burton <Ross.Burton@arm.com>
References: <2906764e-7bca-4947-93f0-2564ccc75129@windriver.com>
 <4513AF0E-A093-4587-BD47-343AC3ECABDE@arm.com>
Content-Language: en-US
Cc: Khem Raj <raj.khem@gmail.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <4513AF0E-A093-4587-BD47-343AC3ECABDE@arm.com>
X-ClientProxiedBy: MAXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c36a046-9a37-44d4-c27e-08ddf6c1a949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U25rbEVDb3lRRzEraWpCclVVOFpmblp5YzBrb2JWRE1nMlQweTl2VEZRK1pQ?=
 =?utf-8?B?NEg4SWMyL1UyOVI4MFE0Y3BIeGszdXN5czRjSXI2YitoMEhITHRLVWZ2a2tm?=
 =?utf-8?B?aENPWk9ieUhReWpRTVhBanhEUjd1R3MyQjc4ZzhuNXkyZDRlOEhhYlFLOTFJ?=
 =?utf-8?B?bUJQSXdCVjBBM3dhdExkbjA1RWpVL1ZSaWJ0MlBtSzFFT1ZMdXJLNmx1VHNx?=
 =?utf-8?B?UWkvek5ZUzFBUkhlRUIwRkJ6Y3JOMHU1OUM0ZzJLNTd0QjhwQ0hWMElpa0hO?=
 =?utf-8?B?d0IyYW1KVU1aelRKMXp0UDREd1RpOUpmZklYdmZBUnpJbTl0Qk4zaFdyaFRx?=
 =?utf-8?B?bnZQUTF2ZlZ0OGFLNVBmeVg1TlZTbXpMQ0ZqVDBBQkpjaU5qS2docTRBM3Bs?=
 =?utf-8?B?U0lXSjFKYzRxYzRwcFhTUDliK0pWZ0dqMVBnbHBXbVFYSDRrN3hMNEtmY3Jh?=
 =?utf-8?B?b1FaazYzdUhLL0g4MVJJdHhXaVRTUFlSRzN0bkNpTmxPY0taUEp1RDRoQUFU?=
 =?utf-8?B?cklpaExRckRFaFd2TEdnbjdCaG8zaURUVWMvdVlJcytQbkFBVStPeXJRVXpI?=
 =?utf-8?B?djNPd0IzT3dsMnNEdjI5dzFZdURWTzN3NDRFOFd3WEM3UTUvNkhWRXBvb3dp?=
 =?utf-8?B?WUpQbDYzNXRvUkNpN3ZoVE4xV1BFTythTUdqV210aU8xZUJoNUZ5RHVxVGM3?=
 =?utf-8?B?VHFrcHFFdUFqSGYwdTZpVXV6a3M2cDFSaURiTVBsOVplUElldDM5SE9hcW1Z?=
 =?utf-8?B?S2ZjVlBlTTZZekl1UUZOeHpIOWNObFpqc0pBR3M3eUpVay9xVGxLUG44QlNQ?=
 =?utf-8?B?SURCK0I4OVRRQ0hxQTZKNHBHS1pMbTlRRU9HVVJiaVM3ZEhqS3EzWWdSMHNo?=
 =?utf-8?B?eUhmZjFpZXlGSU1HdWc1Uk4xYVdLdnhWd0lLZTBwc3NDYnF5blVObms1NFA2?=
 =?utf-8?B?cXVudnV4VTJFVWVmb0oxOFNSWktldzdKKzZpUjYrL1pJeldxS0V3cGlOUkN0?=
 =?utf-8?B?UkRvZUU3RGhWSUwxYkx5U3AwMDdCSjQyTkppTzYvWS9MN0JpNFo2aDhpMUhV?=
 =?utf-8?B?enhPTzlBQTU5ZTlhRmU2cDNNOUt4d3cyY0Z1NEs2YkNzbW1FSUwyZVF0Wmd6?=
 =?utf-8?B?MjRsQ3VZdmJjSnBNdnZwbkJYZkl2WDFWU3dmL1hoWWhmczdYcDVUaXhWb2t5?=
 =?utf-8?B?ejhHSXUvM3NHRys4bGQ0YWY0dTNoQU14TnpZelpLNFFsTkQ5YnVHc05QOFRC?=
 =?utf-8?B?Z3dJVjFMRERNb3QxMHB3NzNtME1XRnVDdm96ZzMyaFB5YkVCM2EvZWU2VlRR?=
 =?utf-8?B?QlpDVVUyVW1zQi80WnRyMC82UU9ieEp0eTV0ZThraFRVcE5zUjQ1VGNNMENm?=
 =?utf-8?B?VVFERkpRbHZEMjVrQytQa2R2cVV2ZXFaeU5yeGpXRVpueTZTRnhuR1BDZDEz?=
 =?utf-8?B?RGVObVkwb1hmRDRGb0hTL1ZzTnNHMnNSZzhZWnhLU1BpUm1mdGo4MGJzdzcx?=
 =?utf-8?B?VmlJamZNa0Erd1lUNUpXK1hTZXp4YXdaUnZidnNCTWROOElYOXl4aThlRS9X?=
 =?utf-8?B?WWZqd1hlVXVnV1FnK0gyR1NNRk05aW12TTJ2QnFwVEVidi9lWGlHK2dielVw?=
 =?utf-8?B?QXpPOUZsZ2V5bXd5bU1iRXBzOXczdHRjVkc5QlhqR0psTmQyckF0QjF6RHEz?=
 =?utf-8?B?SHFpYjJJWm13RlBPdklQNy9oRHpUS0FHNndGSlFpRXFGZ1dJTE9oMUI2WHc1?=
 =?utf-8?B?VFUvZGZFaU42Qm5zTHZWblgyeTI1Y2d6b1ZwUFlmTHFhOWRYSlVwMlBtd0Qx?=
 =?utf-8?Q?89XkFsK8lLwH4+ef78DLQJXPR4EOZ9O7Xi6o8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGlrUHJiQzF3d1hud1JIOGNWS1pyNVpmWXdQVFdEbXQxZUc0ZG0yY3hHRERW?=
 =?utf-8?B?WGNXcS9kTmdNYkZURVg2NGk2TWtFZ1V2Mjd1R0ZGdS9HUi95ampmNDZRYUZ0?=
 =?utf-8?B?YzVCdGE3bmpZM2VZempabno2WjdwWkVDZVFVRENCOG1NSTRpTHJVdUQrb3ZD?=
 =?utf-8?B?c1paRis3RnIxcHVCZmRkbytrNDc3L3ZiUnpFV2RqZjQ4RzFiUkY1Q2ZpdWlT?=
 =?utf-8?B?TEhJVnZPemdWQTk1WEVHcFFCcllFWXBxdGlBdzJ6ZEdzZXRPbGV6STNseGJu?=
 =?utf-8?B?VVZiTm56d29sWmgrOGF2VkdCOXo4WFVKQVZQbG8vOU41R2drNEVvZ2x0cEJJ?=
 =?utf-8?B?a2ZZWTRwMmhRQk1PT201NkNuMjYyYzc2QW5yYXc5eXUreFc1a3M5WE44QWVU?=
 =?utf-8?B?T0o1bHVZQnNYV2NoSWRTZUpISDVYbFJkL0ZxMXlWTUpHWnNLZ1MwVWpFeFdT?=
 =?utf-8?B?RFczY3JCRlFvUFJ1SlZydWlJOE1USHhUdkF0TEovSjZGUUErT3Q1MEZNY0d0?=
 =?utf-8?B?SGR6eERWaEZ0dTM4WHU4QU5tNFRDMUdLWUYwZFlSTlVDTWw5L01vK3g4L0tZ?=
 =?utf-8?B?YkhYdGtDcnhNL2ZYSzhJUENZc09SdVdKWXVPa0NJd3hkZHpQZVRtL014MVds?=
 =?utf-8?B?ajl0T3FsNFdsU25oSUhyZCtNaFdQcm5xOFlaZjk0RzhRcnZhVkd1QUczL2FO?=
 =?utf-8?B?Q3VBa2ROVGFza1VqMmRPYVVVaUNoRUg1SE9JRVJCZDU2YXNIcWZvV0lFeXhG?=
 =?utf-8?B?ZHMycE5vWDE3L1BnYlg0eVptK0p1dmZSWWg4NnpRdVpQbVR0ZkVoUDdyWC9y?=
 =?utf-8?B?d0VIN20xOEFoaEsrSDZ2QlJ0U0hKRmxIZGRrczlUUklPL25CeitXc0RBVDB1?=
 =?utf-8?B?ZmRQUWMzWmxPTkFHTlpLMmJmWnRwakM4WmprOVhyN2s5QlNVTmt6WXdxWHlI?=
 =?utf-8?B?cFNpWTFZZ1BiNmVlem1RZW9UOVpEZlhjYjZjbW01ZTZKRHc2b3htdlZKWFpv?=
 =?utf-8?B?UFZtdVZqSHhCVGRMTUhrNVcxMmxBWWxpMS9ISC9HOFY2NlR6UmNJQ1N5UHRq?=
 =?utf-8?B?TC8xL3NYc2F3WTN5UmdvYXhDZHFFZlJQOGV1VjFhRWZvSjVMamZMeHM2TE8x?=
 =?utf-8?B?Tm56RFE2VDhqUndHMUNuSGtHWjVFRVpjNTh0dkVMbW1YNWtESzhPMU9mMngz?=
 =?utf-8?B?TzNGRTFDSzY2RHpOMUNlbUplN0hYK1BQdGJvTTJaZzdPVE9IQ0JLTzdBa0tH?=
 =?utf-8?B?aVJSM0N1MEhWK2pGSVE3SEh5S1hKMThmZHgzWUpQVUtMZUtXbS8yRlduWmVN?=
 =?utf-8?B?QWxjcXh2dDBnVXgyMW5lcUJQelFFdisxMUxnWUNxb253Y1REYUhyTncvaUpp?=
 =?utf-8?B?anlJSFJyZ0NpUUV1NUE3bEZ3UFkyVXNGbk5FbVRpVzRsLzVaZ082a0VOMUFs?=
 =?utf-8?B?SXlYZlAvcFpBdzVjZEdtN2xuMEEvVGliQWQrRkR3T2E4TkJ0TFkrenkwSWxB?=
 =?utf-8?B?TVN3RHRjcTh3WEE0VmxDUXJHYXRCUmJ0WWEvSWtvai9Wb1RmaVlHQmNyK0ZC?=
 =?utf-8?B?RG1CL0Y1aVJuRzIzUjl0UThNKzdDU2hNN3BDYkxnUjN2NjZrbGhCeVFGcHZU?=
 =?utf-8?B?b3diaGMyT2hvNWYyOWJNcWdlc2w2enRzenIxYloxSmlhUk1uY3N5Yk52SHVj?=
 =?utf-8?B?dUR3UDhBNGNuRGZWQjNJOHMyaXBWOEhsR2RSMXJCSVlDVnhYV3liMFVqdzVV?=
 =?utf-8?B?MUVqdmdUOUpkU2wxMlZTaUZWU0tGNEpkTGNlditCMWZOcUNuM1NzU3NHZEJB?=
 =?utf-8?B?Tzg4MU9jTk1xYnhvNFEwT3hNdkxQQVowdFlUbWhVYm14VjUySHFjYS9CZjNT?=
 =?utf-8?B?WFFVUEVDcGVyQ3NFdFl5RmdTL1Myc3RTNVBPVS9NbzhaaThUOUdGRmRVMHpm?=
 =?utf-8?B?bkQ5SHRNRDluMmdiM1hING92RjVXdHdUaEZLbm4zY0V6MUp4VktjYzFpZzgz?=
 =?utf-8?B?TXR5WStqV244cTZQWjd2eE1JRWhmUlB2Y0RqWGZVVExscEVkMHVPbytnY3JR?=
 =?utf-8?B?dWQ4YkVGYS9MQW1uVGlJUnRMV2h1bGpwUXY0eE5zSm9JREFhWkZzSVhJTWdo?=
 =?utf-8?B?cGVxR3o2bkMzSGhFYTFMOExnRU5kSmJkVmFHOWhHR1d6VXc1MU9tcTE3bXhk?=
 =?utf-8?Q?/HhPpX/5g1ZAwti4C1akhMY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c36a046-9a37-44d4-c27e-08ddf6c1a949
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:42:59.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: darKcu7CnCcHKBwuEznb5Ax3jE7drsQ7Q+CR7GBumsFr9Vq6H0rddyscuCjgnxDk35Px4a26wfApnQxyTbo5bd6EzBTQfOQmd5B6Ttm2pk76T8a3WiQ42amkxNeyk/C+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: xt8EReBeZmKoSGtOe7eWWeJhidzEMigS
X-Proofpoint-ORIG-GUID: 7dBIj_2kWMcvV94ZNTPIDc32pdUj1Zzp
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68cc1a76 cx=c_pps
 a=LawZwnZ+dX5EiMlPDlYRuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=gfrzBx4ME0TrB5gni64A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8
 a=yj-aMKAYKbz0kkd27lYA:9 a=U2IaqE9OmxLvO-Tz:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDEzMiBTYWx0ZWRfXziWtDgGvln7c
 uCh24P2a3AxF50W/IOmedY/8X0BH4Qhnee1Y+HcSbowq8SkE7OaHvxbL7UWElJ4Vw15xqy1BGT3
 YD3dn7UAPEGNh3EQxVkgnn5UF+xNNYJJLG9rpDMHau8JgHWo+RdbGVtBlIgIJv8i0VZEzHeg1RJ
 M+D0Ly00OOvj4KH5C2uVsTopLOiNAbpUpTCns7VxZPaG0Xby4RgchCupbs3c788cU6tQX0ckAQ7
 IvtBe8ng4CAuDaj6gzn/jQ1P4pO4oQL7RG1O7dNOt6iemSDl58f48gOOdOnO92+V9jMA6BOM2WB
 6kAeJfoac0KKS6T7Gwsxy0LkxId/jBF1qXie9ZCTfp84f4t0mEdtkhBlW7VmgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223643

--------------d1AcWa0IR4j960CGcuOiOJsT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58I5cBWa2526535


On 17-09-2025 15:03, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi Deepesh,
>
>> On 16 Sep 2025, at 15:51, Varatharajan, Deepesh via lists.openembedded=
.org<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> We have successfully built Rust 1.91 (nightly) using Clang 21.1.0 afte=
r removing rust-llvm dependency. Additionally, we used
>> Ross's poky-contrib branch, which separates the LLVM recipe from Clang=
, to build Rust-1.89 with LLVM 21.1.0 without the
>> rust-llvm dependency successfully and below are the results.
> Excellent news :)
>
> Can you share a branch with your changes in?  I=E2=80=99d love to run i=
t through the performance builders to see what it says.
>
> Cheers,
> Ross
The relevant changes are present in the following poky-contrib branch:

https://git.yoctoproject.org/poky-contrib/commit/?h=3Dharish/rust-llvm

We=E2=80=99ve successfully built Rust, the SDK, and passed oe-selftest ac=
ross=20
all architectures. However, we=E2=80=99re currently facing a build failur=
e
when *multilib is enabled*. The issue stems from "llvm-config"=20
attempting to locate dependent libraries in the "lib" directory instead o=
f
"lib64".

--- stderr
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.89.0/recipe-sysroot/usr/l=
ib/libLLVMDemangle.a
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.89.0/recipe-sysroot/usr/l=
ib/libLLVMSupport.a

I guess this is related to the following snippet in rust recipe :

 =C2=A0# Copy the natively built llvm-config into the target so we can ru=
n=20
it. Horrible,
 =C2=A0 =C2=A0 # but works!
 =C2=A0 =C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D=20
${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}=
`
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_=
ALTERNATE_EXE_PATH}
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1=
 ]; then
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patchelf --set-rpath \$ORIGIN/=
../../../../../`basename=20
${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patchelf --remove-rpath ${RUST=
_ALTERNATE_EXE_PATH}
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
 =C2=A0 =C2=A0 fi

Is there anything specific I should be watching out for here?

Regards,
Deepesh
> IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipi=
ent, please notify the sender immediately and do not disclose the content=
s to any other person, use it for any purpose, or store or copy the infor=
mation in any medium. Thank you.
--------------d1AcWa0IR4j960CGcuOiOJsT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58I5cBWa2526535

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 17-09-2025 15:03, Ross Burton wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:4513AF0E-A093-4587-BD47-343AC3E=
CABDE@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Hi Deepesh,

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 16 Sep 2025, at 15:51, =
Varatharajan, Deepesh via lists.openembedded.org <a class=3D"moz-txt-link=
-rfc2396E" href=3D"mailto:deepesh.varatharajan=3Dwindriver.com@lists.open=
embedded.org">&lt;deepesh.varatharajan=3Dwindriver.com@lists.openembedded=
.org&gt;</a> wrote:
We have successfully built Rust 1.91 (nightly) using Clang 21.1.0 after r=
emoving rust-llvm dependency. Additionally, we used
Ross's poky-contrib branch, which separates the LLVM recipe from Clang, t=
o build Rust-1.89 with LLVM 21.1.0 without the
rust-llvm dependency successfully and below are the results.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Excellent news :)

Can you share a branch with your changes in?  I=E2=80=99d love to run it =
through the performance builders to see what it says.

Cheers,
Ross</pre>
    </blockquote>
    The relevant changes are present in the following poky-contrib
    branch:<br>
    <br>
    <a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.o=
rg/poky-contrib/commit/?h=3Dharish/rust-llvm">https://git.yoctoproject.or=
g/poky-contrib/commit/?h=3Dharish/rust-llvm</a><br>
    <br>
    We=E2=80=99ve successfully built Rust, the SDK, and passed oe-selftes=
t
    across all architectures. However, we=E2=80=99re currently facing a b=
uild
    failure&nbsp;<br>
    when <strong data-start=3D"415" data-end=3D"438">multilib is enabled<=
/strong>.
    The issue stems from &quot;llvm-config&quot; attempting to locate dep=
endent
    libraries in the &quot;lib&quot; directory instead of<br>
    &quot;lib64&quot;.<br>
    <br>
    --- stderr<br>
    |&nbsp; &nbsp;llvm-config: error: missing:
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.89.0/recipe-sysroot/usr/l=
ib/libLLVMDemangle.a<br>
    |&nbsp; &nbsp;llvm-config: error: missing:
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.89.0/recipe-sysroot/usr/l=
ib/libLLVMSupport.a<br>
    <br>
    I guess this is related to the following snippet in rust recipe :<br>
    <br>
    &nbsp;# Copy the natively built llvm-config into the target so we can=
 run
    it. Horrible,<br>
    &nbsp; &nbsp; # but works!<br>
    &nbsp; &nbsp; if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D
    ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ];
    then<br>
    &nbsp; &nbsp; &nbsp; &nbsp; mkdir -p `dirname ${RUST_ALTERNATE_EXE_PA=
TH}`<br>
    &nbsp; &nbsp; &nbsp; &nbsp; cp ${RUST_ALTERNATE_EXE_PATH_NATIVE}
    ${RUST_ALTERNATE_EXE_PATH}<br>
    &nbsp; &nbsp; &nbsp; &nbsp; if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.s=
o.1 ]; then<br>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; patchelf --set-rpath \$ORIG=
IN/../../../../../`basename
    ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}<br>
    &nbsp; &nbsp; &nbsp; &nbsp; else<br>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; patchelf --remove-rpath ${R=
UST_ALTERNATE_EXE_PATH}<br>
    &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
    &nbsp; &nbsp; fi<br>
    <br>
    Is there anything specific I should be watching out for here?<br>
    <br>
    Regards,<br>
    Deepesh
    <blockquote type=3D"cite" cite=3D"mid:4513AF0E-A093-4587-BD47-343AC3E=
CABDE@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents =
to any other person, use it for any purpose, or store or copy the informa=
tion in any medium. Thank you.
</pre>
    </blockquote>
  </body>
</html>

--------------d1AcWa0IR4j960CGcuOiOJsT--

