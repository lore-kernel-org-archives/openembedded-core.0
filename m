Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C00EFD7079
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:59:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73286.1773745161084994391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 03:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pLNkySFO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7536974059=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4fECI1352420
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 03:59:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=FdrlmllpGoy84d31DJ9zN+
	poi3rD7/rD+vEg908LuPM=; b=pLNkySFOj+gaJVLik1hH9Fz1ZnaTC7M1WjjLGH
	69d8F3iSu0GEOpGzQ0gXPw3417M9kYzxk1hIY+ycVvFHyAVRPb8adEJwQjsC54te
	e75Rd94wDBENbMAHQ7S84hZugN+WJArvdr3+SuQ9PiUIFZ4j82hRMgIpxa6PKcfn
	7FAjeb6FYfW3/HTBvy1m4bx7oht4SyaRLhrebQppw52n8tz3JbDAEKt5qyYcTExO
	oQZ+jRh+JuNKjJ0XEFdRmgd0o6SGR+1DXH6HvB47UHxDMizTX+M+rVFNOFws0UNg
	zLTaXsoF5s5e8uFV/BYyktP3SZ5WoCKEYCiWbNUHVEEmVCBw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dtwmm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 03:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnhkmYxP0k+1TkFZfuA+7S+0qjQjKHNKqACFPW9S+jLO2H/o343zaJY1oY8hkuO6PcfErTDWYz8t2fK3y5FpuqkaCm+dtqZyBdDTXsHF+lLMn4IVfuhtoJ33eC9FBvVsUXcQPy3GAVM4r92BlS53iCgMd7g3BcdldIU0OKxxHjn6rd6T3YOOOvIVP78Ea+cVeSkl0PZNxCx1QuHrLn2OoFtwO8mK4KhhU0++A61tzXf1OdeA6KOBCUbi63RyaPBSDXwDv1BVYcXyu/jKLQnMWRj61kQvHhKvcBDwwxmxgUanxM8gvGnItrZDFRVkDxSA/M5YItiqQv3b8pL+TsPUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdrlmllpGoy84d31DJ9zN+poi3rD7/rD+vEg908LuPM=;
 b=iDaWYZxew1nD0/ZkHSx3k10RiZcg+wEXCLI5WLJkmOyz8hnxRzVTY5O0Z11HBOb5AWx4HrR6tnuuFsPXDLCeL6oN4TUkgZFRewwvWvNFXskhUYF7gpxfn889gWBub21KjP/sXm35gZEZmY+P4s/vWPEY+G7RO+qnInkkysMqC0IEOGBtf7uTsKpYdDYVA7wCX5+lF+NnaP/2LJn4ub/Fswg6mUYK7K0VjZnNMuVT/n3+ls5XIL45/fOZpHXBZugWWpwCJBS8ijurIRq7D4CvuFIL2ryfKwxl271oxSUDHacaegoTd5//pDXju/sqne19mHfWXCmJPaRDVP1FThozGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 10:59:17 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 10:59:17 +0000
Content-Type: multipart/alternative;
 boundary="------------cq9efhshDMFccnhAv0c48exj"
Message-ID: <5864101b-3548-43dc-8b98-cc65f28e1a2e@windriver.com>
Date: Tue, 17 Mar 2026 16:29:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] rust: Enable parallel-frontend-threads
To: openembedded-core@lists.openembedded.org,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260313060226.2354003-1-sundeep.kokkonda@windriver.com>
 <DH2B38CNQ2YI.2HLSQSBYYSU0S@bootlin.com>
Content-Language: en-US
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <DH2B38CNQ2YI.2HLSQSBYYSU0S@bootlin.com>
X-ClientProxiedBy: MN2PR01CA0046.prod.exchangelabs.com (2603:10b6:208:23f::15)
 To CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: 049c84a3-d036-455c-de24-08de84143ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|52116014|366016|1800799024|22082099003|18002099003|56012099003|38350700014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	hfKGbIkFUdfqVKImpQaNuhBuClrpU9bWOZIX9n4Kxm2sk36AFnK5kp5Ab5AXhrlV6zThmdS90XHRiAAKhM9gzF2P6bWX7vYDXjUVnNaHIPi6wbLyWul9yB2jiII8WWiDS84onqWdIVsEYNy1hkL4MyOMQxD5Ehh/OoT9QJrkywk33Vj0ukBw+VDI6lJsOgWwA9NjT/NEcix6yiVP/5IoPys2ayb365FMTIVJFutOxdHoIQy2Gi3PPRsxbbV/1Qx4kGvV3scvNA2X3LsRMD9RpBrBD6p8YreO/ZWIg7bsxBwAu5C236KJoOW0N9ZrICbg4gqV2D/lbvuR3pcH4Lrk7nfDwBCi8JqdlVaqKMqZyeGJQF9XJ0urrO9UwVEAwO1Fd34beSGShsq3g8qC2Sl9vcoTWtKE0QTtzQBg3C7vuFvU7plORTxEINUBIE0l0fvsQIIaz2vACq18YQwsJSdG6jYAB/MYmEntFovg/PXFiVbtyQMh1ciTNrG+8zoq9r6gDTewwxwwTUFVhJdfbToCBeK+0RwYDMHCLBW7F7WPdXaizHAVLi0AfScKgcbYZrmVHSk/I/776mxFMN/gGO20JYOTX1UQgC6OpscnVaA87nAp/9YP5YmaP5LtIN1271U0he158TeOLHngQv7PQBXFC4qZ+PCfSrOQUe5qs+y8sU1mwF4L8/+iBDhQllOd/cZnlGE9CD6DihnEByTCTk00pstPH8PAOIcp13unycYKf/U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(52116014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWVhTTFCNU5XRnYwdDVjVGVwb1ZsNWVUaDV5bWpPQjh4WkhqL29JTHI2Qk1F?=
 =?utf-8?B?V280V1JybTB5OTNNQUw2V0ltUVEwRTNSM1UvaGdiOTc5ZmNCYkZReFZianNl?=
 =?utf-8?B?aEhXaElNTzA5WFlUV0hPVUFoSW1EZ1kyZzhtRUU5SGEwR1E3UTdBMU9YM1Uw?=
 =?utf-8?B?Z3FtTzFCMG05RlNpMW55STF5UmxZcmtrK1NBbkE0dkFBa2UvTTdXYzJ1M3ZJ?=
 =?utf-8?B?cWFkTzNEVTNxbkFmZU9xZlA4dE93REk2RFJvV3E3V0FYKzlyQlRRUjhxQllm?=
 =?utf-8?B?VCtWZlprWWpybWRGRER6Skd4enFJdm5vWE1UNVFZdHNKUm1KQzlQaENxbzBK?=
 =?utf-8?B?c3hvS0krdng5c0NVUEpNSy9DM1gzYjEydHJJRmhBV2JOYzI3dzVaTnVxaVF3?=
 =?utf-8?B?QXpTU2RDYmtDVXdZeFNDSVFsNWRxS1EzN1pXcTZjdmdvbG1YczFqVG5pSVRG?=
 =?utf-8?B?QXM3K1pvSVJYZDZLeWxGMFFlZExkSkhSSkhCQnRjMTd2NFRKd2x6MytIV3B4?=
 =?utf-8?B?SjBoSXMvbmowRnBSdzIzNVI0R1QxeHVlalNqd3V3WDZuWmNIakpaR1ZjcXgw?=
 =?utf-8?B?aFg2ak0wRVRLdmFHMFVhTzFPbWxDbFdoZDJ5SnRFdmNnQ2Y0Ty9Ua00zMk94?=
 =?utf-8?B?b3MvMG5jQkgwL1FhMlFoSkhBcVlpT2tNU0xOMFliWDdtQjNzejBpcGRpcnUy?=
 =?utf-8?B?QllYbm9ZenVHbzF1SW44Yk9yWjY4c2wzcUh5SEM2NWdoWjBkNEdRem5Weml4?=
 =?utf-8?B?ZDZpQTRvQjhZRk9QdnJ4WWY0cDkyRWdCaHdDSGJzS1QrZC8reWtjZHpLb0l5?=
 =?utf-8?B?SGY5Mk5FWVg0emZ1MnFORFJDVDFJZXVBRkxsSU44T1BsUUc2MTNqazV6N1Z5?=
 =?utf-8?B?UWJ4WHpRaE95QkNQY1BUcDJjTTdXNW1KUWtaV25kSGNudWdhOGovM2cxeEth?=
 =?utf-8?B?YTh2S3VKYzVMT2E4LzM1K0l1cGxwUStxMUZDTEZhZ0p0VkZzaWpsbWlSV0hS?=
 =?utf-8?B?RVF0RWdIc2YyT3djeSt6Mi9YTzVwbTk2eEp5eEY4VWNQK2lsQXVTR2QySjlV?=
 =?utf-8?B?Q3FEN01WeXV5ZStueUo2K0taY0w4SXJnOG5tVzhTdjAyRVFTYWwzMGtuWDZG?=
 =?utf-8?B?dDZ2L3MzZlR2eklTRFR1Y0RZUU1RV1drZjJLcy8zSzBoY1VkcE54UVJrN0pG?=
 =?utf-8?B?WkhuQlBoM0cwSCtmYVFIcUoxRkFLVGYzcFZ5QnphOUlLZXVNL0k2bDNrakNk?=
 =?utf-8?B?OUloS0NoTXYyWUJRUnNSODR5WGpiVGZnL1NmaUdjYm0xNVRBVmxJbVlBZjhp?=
 =?utf-8?B?bmFrcDFxMi9hNVdzU0VaUVhhZ2ZlcEVDbnpVd3JDODVYWjgvR1Z0cjFxRkN1?=
 =?utf-8?B?dmdBZ0pnWUkwNC9CM3d4Y1dVeGhQblA5dERuU0NKUHNlZm5EL3F0cVBLeXdE?=
 =?utf-8?B?UE9Od3FEYXBmQWp2SzZHTUlXSWlNYzQ3Ukw4WWZrUUJGVjR4Z0hKVWlCRkJD?=
 =?utf-8?B?dlJ6dUJCUVh4T3VNbGF4bXpRNjhWMUtVNVVhVnlHdXVmdWlxQUZPMkRBdWFJ?=
 =?utf-8?B?ZCtPYy8rOUtvQjg4Y1BNODBpREIwdHovRVJmbnFtc3lmV3BQY01JZmZzRGRE?=
 =?utf-8?B?SWE2U0xaYnQxdkJiQUtucnRINlJmanIzblpEWGc5V3ExVGhMSzFLYmF1WTVF?=
 =?utf-8?B?MC9PK2FSaWtucmpSRmhlUEc3Y3dMbzNOdlVTTHFHQ3l5L0NJVWEwRmo5VUVI?=
 =?utf-8?B?UkJsWG5HaGZxdTh6V1g3R3NkQ2tLYkNNVkhZYVd1eWY4UkY3dFFHMjRueVdM?=
 =?utf-8?B?VFFNUDJiQjMvbnNXVis0c3lnY0RxR3c1ZUVDRzVUWGVjWmNxeVM3UmxFQkx6?=
 =?utf-8?B?ME93dmREaUJoY1FwbVFFMkozWVB4NEV6dXY2V1JlRkNoUm9uRWc0V0IvaUVB?=
 =?utf-8?B?MUxZdXdKWHJKMXZoR3lRNzNhNnVxOW9KbzRGdWpMVDdCMjUxMWpTU09ScGVT?=
 =?utf-8?B?WjRMRUEveFZTWDUxRy9BTVFxVTlqbXVZNXdPVXVuUk1jbG95d3JxL0NaU2Q0?=
 =?utf-8?B?M2NEMEp4bTFSWHZUTXAyTlBRcXVJQm9GSU5NazF5WmdGaGVjcG85R1JWVHFD?=
 =?utf-8?B?amtmWERRTGYyMzlZdzg4cVIvVjVDZzJKMzVqK2t0RGswUmZuRDJoejV1UjNj?=
 =?utf-8?B?bjRkYnF4SVZyUCtNZE9GMGNDRG9vVW1FNnhCSm1lS1FrUnhmUUw4WkRtajM3?=
 =?utf-8?B?TS9xOTBWTkx5OGtBdm9kSGZhZzNObW5PMFNiQ0QrSm5jZTFjUDJ2Uk5DR2kx?=
 =?utf-8?B?R3YvS05IZGtZTWE3ZHowRkVCZnhZQWdEK0ptYWJDKy9CcjUwaVpEYUNCbWhz?=
 =?utf-8?Q?o19THZSMMou/45aE=3D?=
X-Exchange-RoutingPolicyChecked: 
	St0+ltnvccMh1d4WwwpuEUSAlIoNgBGPkpS+Z8BD5SU5tovei5WYBDrbrTtXEXcrUnh+qe+uf2igSFY9T13eEIZXTxRT8lTQrMSTEZdmJVWDj/bQQzmJdMdC0iELRBuaKdMvEeqRr1YyWLvNdoMho3c4JMf76Rrd7+gUS82eJtAMJuFCYX+L0xo8bBsXDPU1AF9T8nA/Y2QKfmZGnjDmATVo3xL5REfmvre4dxZfJfLyCdr/HjSo4I3yOjCLc1w8JiQxT72u7cTL6pc9feMM8QCb41dtVe3FscwkqlLDv1XyHLDBSD8/8tmFY/Q0DXAIkekv/IpL6S0OuVONnU1QfA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049c84a3-d036-455c-de24-08de84143ba9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:59:17.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOug0+7fKQPQjvgaXFda09ztn/7YDuK0Hq703r6tRTo8PED5SSRcaLC2GfRu3tdku5H2C18Rjhc+XwZCtLuIerm28rIe0BIE3CfVMLBPUr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b93408 cx=c_pps
 a=/jEiNo7mPoItVXs2NspnyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=ei4SEBeUAAAA:8
 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=kN5DKK1IMhvx3iJUc3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=LVVdaqqDU9W9cF4QaU8A:9 a=u8e-bCAzIEx76nhl:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=97APRTa-CG6DvPMFVxHL:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5NyBTYWx0ZWRfX1Nd5FcFlfnB2
 JH+/EwmhM3LDLY6HmLyzKFN4yPIoTsK+ZrKJoqGbNjOTelyr4XCTrb3hxl7tb8NH62wLKR33+qG
 4bmLU9lZDYT1mmD5a3Bwh5niIu7NqX4rnS2zJ6CHoMWu3j2L1cvczM36hw92cOZzz3Vn3V0sE9a
 nSNPgD5vSSbUkrKNgF/bFB8EOQMe9VaQEqJCnSNyeLxCljxz132HmfsH5nG/PR2Elc0K6OiC7N1
 KKL/q4NnwOWzBLKrL2Xovtl8BxltN6/lqa3X/RzO3dLtsqUJDBB0spwFrGVBzwzm3Uq9hYDn+H2
 Lj62FeudoDfiThn9H0NIHENgPUubKagwarYInTq5UurY31RTcy+dN1Re8cbqgQ2X1QajdD9V285
 R/aR/CsXU+GdmIkCk2UowdXVrkFfzPAVMpfLSs21WhwDph7bV0CglctPWOoAzHBhyzNGNOeGpdz
 Tagf52zxb8HsFsjjiNg==
X-Proofpoint-ORIG-GUID: W1eJ3gXCGSfTmmY0lKWPFwXKOeI-zFWy
X-Proofpoint-GUID: _gLB6MnNaCp4l2H37ituo-oehWmInLfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 10:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233314

--------------cq9efhshDMFccnhAv0c48exj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H4fECI1352420


On 14-Mar-26 12:24, Mathieu Dubois-Briand via lists.openembedded.org wrot=
e:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri Mar 13, 2026 at 7:02 AM CET, Sundeep KOKKONDA via lists.openembe=
dded.org wrote:
>> From: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
>>
>> Enabled the parallel-frontend-threads for faster compilation of rust c=
ode.
>>
>> Test Results:
>> A few tests (bitbake rust) ran by with and without enabling this optio=
n.
>> - Machine config: Intel(R) Xeon(R) CPU E5-4669 v3 @ 2.10GHz with 144 C=
PUs.
>> - Avg. default build time (w/o this option) - 56m 50.104s
>> - Avg. build time with this option - 49m 17.224s
>> - Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)
>>
>> parallel-frontend-threads is limited to a max of 8 for best results.
>> More info -https://blog.rust-lang.org/2023/11/09/parallel-rustc/
>>
>> Signed-off-by: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
>> ---
> Hi Sundeep,
>
> It looks like this is causing some reproducibility issues:
>
> AssertionError: The following deb packages are different and not in exc=
lusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.94.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/deb/./x86-64-v3/rust_1.94.0-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.94.0-r0_x86-64-v3.ipk
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/ipk/./x86-64-v3/rust_1.94.0-r0_x86-64-v3.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/rpm/./x86_64_v3/rust-1.94.0-r0.x86_64_v3.rpm
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/rpm/./x86_64_v3/rust-dbg-1.94.0-r0.x86_64_v3.rpm
>
> Diffoscope output is here:
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260313-gl43m=
wtc/packages/diff-html/
>
> Can you have a look at it?

Hello,

I am able to reproduce the issue. I see the=20
/librustc_driver-3a7e57d3c38387b5.so/ has changed between the builds.=20
The 'BuildID' is different in both .so files which is happening due to a=20
difference in .gnu_debuglink section.

I am further analyzing how this option is affecting this section.


Thanks,

Sundeep K.

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233071):https://lists.openembedded.org/g/openembedd=
ed-core/message/233071
> Mute This Topic:https://lists.openembedded.org/mt/118293063/7677583
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [s=
undeep.kokkonda@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------cq9efhshDMFccnhAv0c48exj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H4fECI1352420

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 14-Mar-26 12:24, Mathieu
      Dubois-Briand via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DH2B38CNQ2YI.2HLSQSBYYSU0S@boot=
lin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Fri Mar 13, 2026 at 7:02 AM CET, Sundeep KOKKONDA via lists.openembedd=
ed.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Sundeep KOKKONDA <a =
class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sundeep.kokkonda@windriver=
.com">&lt;sundeep.kokkonda@windriver.com&gt;</a>

Enabled the parallel-frontend-threads for faster compilation of rust code.

Test Results:
A few tests (bitbake rust) ran by with and without enabling this option.
- Machine config: Intel(R) Xeon(R) CPU E5-4669 v3 @ 2.10GHz with 144 CPUs.
- Avg. default build time (w/o this option) - 56m 50.104s
- Avg. build time with this option - 49m 17.224s
- Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)

parallel-frontend-threads is limited to a max of 8 for best results.
More info - <a class=3D"moz-txt-link-freetext" href=3D"https://blog.rust-=
lang.org/2023/11/09/parallel-rustc/">https://blog.rust-lang.org/2023/11/0=
9/parallel-rustc/</a>

Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sundeep.kokkonda@windriver.com">&lt;sundeep.kokkonda@windriver.co=
m&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Hi Sundeep,

It looks like this is causing some reproducibility issues:

AssertionError: The following deb packages are different and not in exclu=
sion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.94.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/rust_1.94.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.94.0-r0_x86-64-v3.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/ipk/./x86-64-v3/rust_1.94.0-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/rust-1.94.0-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/rust-dbg-1.94.0-r0.x86_64_v3.rpm

Diffoscope output is here:
<a class=3D"moz-txt-link-freetext" href=3D"https://valkyrie.yocto.io/pub/=
repro-fail/oe-reproducible-20260313-gl43mwtc/packages/diff-html/">https:/=
/valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260313-gl43mwtc/packa=
ges/diff-html/</a>

Can you have a look at it?
</pre>
    </blockquote>
    <p>Hello,</p>
    <p>I am able to reproduce the issue. I see the <i>librustc_driver-3a7=
e57d3c38387b5.so</i>
      has changed between the builds. The 'BuildID' is different in both
      .so files which is happening due to a difference in .gnu_debuglink
      section.</p>
    <p>I am further analyzing how this option is affecting this section.<=
/p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Sundeep K.</p>
    <blockquote type=3D"cite" cite=3D"mid:DH2B38CNQ2YI.2HLSQSBYYSU0S@boot=
lin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class=3D"moz-txt-link-freetext" href=3D"https://bootlin.com">https://b=
ootlin.com</a>

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#233071): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/233071">https:/=
/lists.openembedded.org/g/openembedded-core/message/233071</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/118293063/7677583">https://lists.openembedded.org/mt=
/118293063/7677583</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:sundeep.kokkonda@eng.windriver.com">sundeep.kokkonda@eng.windrive=
r.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------cq9efhshDMFccnhAv0c48exj--

