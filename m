Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB683D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 18:15:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1574.1765217694841987446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 10:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c2yPTTq2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44373bf015=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B85sBfY2292558
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Dec 2025 18:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=peGOpCt7IsuCOvJV6OWnxY
	GtaOp38LEnCsDygkkhMSk=; b=c2yPTTq2fS1+Uwyoxa/YHFS+h/ju6kpfuqxnpF
	1eFHX8yVB53uU3uuDdpRvFoN9DXRi174EzWHFWA8aV80LMwMIcw5X726nfRBwbwS
	iJEF/Qhdf+S3KFhIp4xGv9FlPd5sKEtePQhsoq/2YIugbxr6mOXunCpdLa6RvSKx
	pWgeSfEN2RvPnhv/aZDFVNBh5nZjlRWcOS29A6vgbxCe19UlLWUfxVTfxER6k3EC
	34RjHK0aTO2IgoLuzx/crFVhmqg4yDW+LWdbs/ENw3VE8TlIBEpe+e6TL1+0DQHn
	fHqGbvhxjS/OUeKo8U2Ke9v0ohBWJIXR+pdpFeI0xgacKKow==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013020.outbound.protection.outlook.com [40.93.196.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avbf6sxn2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 18:14:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTvbrYJtfckgPgn+mPHSKcZlwj9SFKgbvSradkKcK3pRdKdPiLpUsVoziCKPFthtGOSK0i8wpuRe8uv9U7RSKbs7k7zsRIk37pjp8L6hSDWyn1J94/mnXdWR16sKu5Z0otAmyzVU51C1ntBvm0lM2lIIEsfLiLllCSfn8dg5288V2kmKBrChpWHguFdRua/CG2QWyO5oAQ1dhDjNOhu4JMjhLLzJnpydKGubjxq14CyVNM3Dkcfn+hYG5Vg4RgWAMqpxtTPgsZ2b4OOv6wjF/IhHbSXYXGXfc1vOkeVdXD4d2d3AJFpyGybQ4KBH/eHnHMPzISkdQjKOJoBMgDM5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peGOpCt7IsuCOvJV6OWnxYGtaOp38LEnCsDygkkhMSk=;
 b=dvpnZA48iok3c6YadOMyO2+wvSYq26o9t+DQsfHxah9k/X62aJIlX+rAzZcT55gBcS02rH4Z2B92BpqA44pzlOmOIonAadHE5ro751zfOxQtd9HVypNjy2xgES/urKGTDMbqrBa/lCFIX7iDzIZA18psDnsPZnF91VPDJhgAieXsyaqhxMagRUqfFdj5hJg/xTjNyWMBscGRuZdjPuIu8KA7Dqm3U+kOBSOagpbYtw2HFft4dwywJWY0bAIa2AQVRtCPLINeC6jiOKXJooDj7p/IL98EHNUSdSB0oFThMZqr8Kkng7SRAORGOMNZl9/RZXGsf8uDuIToCzye1oleWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Mon, 8 Dec
 2025 18:14:50 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 18:14:50 +0000
Content-Type: multipart/alternative;
 boundary="------------mQyrumeGycZuAOa50TeJ3mYW"
Message-ID: <3f6b542b-4cc3-4c9c-a4c3-6e20067626bc@windriver.com>
Date: Mon, 8 Dec 2025 13:14:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] itstool: switch from libxml2 to
 python3-lxml
To: hongxu.jia@windriver.com, openembedded-core@lists.openembedded.org
References: <20251203082404.2732162-1-hongxu.jia@windriver.com>
 <20251203082404.2732162-2-hongxu.jia@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251203082404.2732162-2-hongxu.jia@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 1618b6ba-d327-4efb-923d-08de3685ad33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czIzeUJFVjJKdm9nanhlUHp4MkdrWG0xN3FFTWlka053UEdlaEVJUVBYcHVL?=
 =?utf-8?B?UlpXR1kzVk9pOWUvL1F6dWZtVGxPQjdDajkxcnB0ZldQdWdVeDNLQjYzVUVR?=
 =?utf-8?B?MCtIeXBkU3NaRkV5TlpWRFI0S3lwbkFFL3pxUmtCL0kyQ0YrK05JZWZySUVj?=
 =?utf-8?B?eFBhbjVmNUJBV0pDVmIrU1FCaThETXlTODNXa0NvNHFERjhURER1QnFLYTla?=
 =?utf-8?B?b1pxTzJPZktqekp0ZzlaN1kxNXFuODJHWFp6STFTUlpoZ3lsYm4vUFlMSTha?=
 =?utf-8?B?ZmxKMTRtMUxNOWV4ZHh6VWFQTWpYaHZQZE9Dc3JFeWpqMUtaVEM3RnY3R3Z4?=
 =?utf-8?B?S3JOK0dEVGZIc2lFb3pVNldIRVpIdndwWE1iZmN6MXJ6Qk95UE45QVhvUUFk?=
 =?utf-8?B?VVFtbWg5MDlxZWF3R3czUjFPYVQyWmdSTkl4YWxuNW1vNVZzTXpodXpQSC96?=
 =?utf-8?B?ZmhPbHFFaHdtbjV0djlCTnJOM3V0RXNlYUxYVHFUWmtSanAwTGNFdkxUNHVi?=
 =?utf-8?B?Y3RDOHgxYUNGUTIzWDBPdWtUQ2tFdUdaL2hISFRNTHlxZm9sQzBxY1ZkTDFj?=
 =?utf-8?B?cTRVRUo4bTUvOHg5T1NmcE03NHF6RGdmZi9oWUVTZzBub3FVZGxjV1FSd1U3?=
 =?utf-8?B?VHFMSDJVcjdyb2c0WDdVMTZnTmtYeG9pL2hTcmthaG1IOXMyMERDNmh1amZp?=
 =?utf-8?B?SmVlMDJBbHFFdU8yYWllcVdrYjgrdWQ1dUFmdklHa3d6NGxNSUpFOFkxWitR?=
 =?utf-8?B?L0tZdk9qeVhCTXZKSUZod212Zy9UN0R0Q1ZzT24wTFhKaVUrYjA4L0FnT0ZG?=
 =?utf-8?B?VTdDQ2FGdlBpaE94V0Q1MGU1Zy9KSW45UjVuekpOOWpscDBkRlRBRVloQTRi?=
 =?utf-8?B?eEgvbkF1UW8vbHROK3pUd2lzN0RnRU82SVZoUlprTDJTdVB6bHhMeFVLTmZr?=
 =?utf-8?B?Y25NOWdjdDQ1bC9Sdzg5VTJlZUdzNDhaSVNZZ0lCejBHYzNIUFNvd3pRMVlu?=
 =?utf-8?B?aHdBNnFYOHdXWDNZL2RKL3k5V1B4enZSdlNmYXZjVFhpeUNjc2ExYk5yTFZn?=
 =?utf-8?B?RUw0Q2xSYUVVTGw1cWpBWFUwL293VFlTcmJLOUlibm1sVkM2Tjg4TWJpblpF?=
 =?utf-8?B?c3RKOEo4aUYzRUdDaHl4djBrYVRvd2dWZDYvMDNwQWdsbXBhTDJWbUtyUlNB?=
 =?utf-8?B?b3VSR1BRMFRiT3Y1MmUreFkwa1hCK1ZxbTdpZ3dNTk5Vd3k1dHE0MHg4REV2?=
 =?utf-8?B?VEtvblY3R25HTHd5bDF4M0xjMndWMEdkTWgyRFpsNnNyWXpxREJLS0ZqVG1a?=
 =?utf-8?B?MndFQzZGbWhla2RneEZ1Q1dFQ3g2YXpWQmo1SlFQYldLYVg0UDh4bzdNNThl?=
 =?utf-8?B?NkY5Y2hhdCttc3RmdUJjd3IwaFNUVkVYK1BTMEhzbjFlamVhSm9HMDI3N083?=
 =?utf-8?B?bkRQTUtxNjllczZMYm41Y1FZR3BtZmx6SVlEQ05MNzJkZ1lOeXVDb002TTIw?=
 =?utf-8?B?NEs1UnFENHhrNzMyQzJ3Qkk0VGIrUE42cDJEbzhtY3lRRi8vWmJ5U2ZNVUhm?=
 =?utf-8?B?Sk5Udnc1d0l2TWYva1l2Q2swa0hsazJLb0VrVmV4ekJFaW5SNFNPcmU1ckoy?=
 =?utf-8?B?UGo5REg5SnYzcUQ4WjNuK2FoelV5b2x4VlZnckpvNWJLdlBJR0FlN3Vock1z?=
 =?utf-8?B?T2QxUTlScEdHMDRYWFNjeWcvdXF4UGREaUFSN01yL2NuZWJMRUplQ09NQk9k?=
 =?utf-8?B?Y2Q5NU5SU2xrR0M1U3VNOTU2MUJ3QlpZUithMlhUSHoyV1k4d1NLZ0ZWek9h?=
 =?utf-8?B?WmpLdlRpWjFFb2NhWkllU0V0Yk9KNm1wa3hnQlVmbGNONisvYlRVZDR5UGIz?=
 =?utf-8?B?a0oyUTgvRzlkMCsxY0tJMzNwb3NSMDBnTy9lQ3JWbGhZSHp6Y1gzZis1V2U2?=
 =?utf-8?B?VmgrWFhtWE1lUVB2dEVsVFhQdFprREFBL2kvQ3NSaHAwK3ZkV3NWVVB1ODJ6?=
 =?utf-8?B?eWFhQ2kzTWp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S25qdk0xczc4NklPL0lwaXkwVS9LNGUyc3pHMmNITjJ1Y21zdWh0ZGZoNStC?=
 =?utf-8?B?STNpNHRiUmxxM0tRL241OStzTDZSNFZ2am95b0Fnc0xKRTBPbnkwVWxGRVds?=
 =?utf-8?B?M0lrLzVzMURvZldXZFFLUnFwcFhGd2cvRE9Id2ZLdWtHNk5HTVBCZTBhdURa?=
 =?utf-8?B?YnNSR2dBS1ZLUDM1cGpaL3I5Y1lDQW5MSDV3NEFDUVVrTFZGMWxoRWYzZW5r?=
 =?utf-8?B?czdBMTRwd20rTjZqMmgwWVJiSE04Q1dSMitLeDdOZ3JRYTROZ1V4NXNzNHNJ?=
 =?utf-8?B?MHMwQWwyWm5MWmZVUUlzR3VvUDRBVE56YWI5aTBrVlRHQmNXRmxTV1FVcXhW?=
 =?utf-8?B?V3RMVFphejFIUkxCb3c1RUlad09vdkVkaWNkbE1LZjlrZlppcS8ra3VPU0U5?=
 =?utf-8?B?MWl3U2E0WnpNaHM4UnI2SDR6dTZHNzhVclRJV25sZzNaano0dXdpaExpa1RB?=
 =?utf-8?B?c0wzWGFBZEZlbHNxb0VVVUNaUFJGWktzWHFTcjcrWHZoQ0dpWEhMMzNnR0NY?=
 =?utf-8?B?U3Y1R2ppRndDOXp1WENZZEl3c3lDbzFvMDV3cTlrZ3pmT1VCbDNXSGhlYms0?=
 =?utf-8?B?ZThjZVlHU29OMXBLdkJoVGJkVVBCM1dOZHM4cVhCZkp1djQ4OGJjcnp4U1A5?=
 =?utf-8?B?L0ZTZWVxZUluTWtGZnUrVWNLY1NubzFCU3p2ek01QlVpY3ZUbzJNOHAvZThF?=
 =?utf-8?B?cDdaeVRqZk5IUktodGVOVEVLSDJKZC9YZU9NaDlxeDFJMnZQc3Q3QWZaNGFE?=
 =?utf-8?B?dTEwVS9pZndkcytFUkw5R0xVc3dRYktTMEg2VU9qZytQMzcyeFJFOVUzWlRa?=
 =?utf-8?B?MzFFb3k1OFUwL0czK2h4UElyOGlEajI4djNaL0pYd05mVTBRVE5LZ3cvNzNY?=
 =?utf-8?B?d0dFQXhzVUpSWmpNaTk0TzhPL3IwUVJxdGlFelZqUWJNa1BEYnpDZVBlRklN?=
 =?utf-8?B?STl0SnFacVNHNG1SY0ZrM3RmTjRzWXYzdDhOQmRxQlpzVjZPSmliOWdLeXcv?=
 =?utf-8?B?ZHdhQjk5MTZUUzBoQlp4SE9BNkhtTUNwNEtRUThUdTdWNWFzNmJkNjQ4blgv?=
 =?utf-8?B?eWI5TnF0cGR6VFVqdk5RZHFCMmRjNnJvUTlzTVZWZTQyaDZaaHQ0NHFraHZu?=
 =?utf-8?B?b05HQzN3MmdMWk1zdFAvRCtaeGc1akJQcHJtc2FHK2FiNkJSM3JvN1FmNjZn?=
 =?utf-8?B?VTNjWnRrYzVxVzBmZGNUaUE2OGNQblVDV0RaT05MRTdGR2ZKTFZWSzgxT3Rm?=
 =?utf-8?B?ajBBNWduVWVXa3ViaDBHRXJVMU5PN0FkczJKby9TTC9ZNzExeGJzeVJxRmtm?=
 =?utf-8?B?KzdiTXZSVW0zTEhXOHBQRDdZcXNGa1F0T0pXaVFKOEEvVGk1NGZzUEF2MDlJ?=
 =?utf-8?B?Wk82dWE1ejJuemRPbk9Na2ZoSGpXcXpYMDByMnBIRis2ZUJPZGZrTXEzSEs2?=
 =?utf-8?B?Zlo5SndzcCtnWUsrSTRRdXpOcWRFV2tOMFNoNExXK3BCaG1aT01BUXNFQUVJ?=
 =?utf-8?B?VDNPNTYvWG9FM3V6dWcyWUVMMHZQVTF6Wml2eHVoRlNwY2kzKzJ2RWhVVnd6?=
 =?utf-8?B?MXBZZCs3Mjc5WVY1Y0tBdHIzbkNzOERYc3R0TWZWV1cyczVrbVV2RlJPWkZq?=
 =?utf-8?B?MDQzcG1aMFVaZUJUMTlPOUpNYTg5WWQ0TEV2cTlidENLb2NReHlCVFEveFEv?=
 =?utf-8?B?Y3BpY2VtbzcwOTlkUVNxdWtEUkNVb3hhU1ZheWE3R1JMZGJZZUpzTnY2cE4w?=
 =?utf-8?B?OGpiQmJlbjByL1MvcVdvRlkzbkVKNldTTDdjdWdXNkt5ZzBYVlpqYmF0Q1A3?=
 =?utf-8?B?V01vbFRuWmZ0MGRtMndsVHhEQlFoZ3lQRU5NdHJkKzB5NmhZVk1mOTB2NnQy?=
 =?utf-8?B?aFZ4bnNUblpjMU9nbEtkbjRyMmFKYW9qN2dmZDhJcEt4VHhWWUNSbVRvTm9q?=
 =?utf-8?B?WHVGTFA3aFczQmZUejYzQ2VkdDVKM2hTSlFMRVYwUXgxNExBVjBmWjVjV3Bw?=
 =?utf-8?B?VDY0bHY2TlRtVGVxbmJiNnE4aVArVzdrVWk2ek82UVQxQWo2LzNiY0ltek0r?=
 =?utf-8?B?NzZmUVAvTHhZQ09ranlXVCtOOVZKZ3BLYUREQXBwZ05PMTI0MnJIVU5RSkcw?=
 =?utf-8?B?ejAxOHRtODh6WUl5N0lPTDVRVWV2QlRvUG1nQWthVDNQaFVIa0hHa1kwK0wx?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1618b6ba-d327-4efb-923d-08de3685ad33
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 18:14:49.9276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+x8EdgvQb4gzEc0e8+norzEruAhTzQZXzDl+R6cq49ljZT1ipbstdMMvvawXc1jppGsJ2+ZAFzoI4JTQei6+nKbslRM2irre/QZH2Vx7bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
X-Proofpoint-GUID: w39-kf9BQP8YBsP4vfg99jLcEnzRlmEu
X-Proofpoint-ORIG-GUID: w39-kf9BQP8YBsP4vfg99jLcEnzRlmEu
X-Authority-Analysis: v=2.4 cv=Io4Tsb/g c=1 sm=1 tr=0 ts=6937159d cx=c_pps
 a=PurIBXv9FE+FLdDnXy66Mg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=7o4Kq19MeDZUSgaSDu0A:9 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10
 a=g23uNzxYZ8M8qFzVLtwA:9 a=SLdD9qNfaUu2C29p:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE1NCBTYWx0ZWRfX3Kx3TiUOe4M/
 8BEEt6G8VQJKLGRphoG9RxybDyZSqekKz7/InPEpI0D1s/oGdQrBm4Mqnjm63mrEdfzKVe1vcjX
 erftVaqzgOA8g6O5YfLw/W9VShlh2BECPQRVt+k8msWsIOrla12wZd352agQI0ACLGNDIdiLu4i
 aYReBJDxRzpyWHlTivkG/h0sgf7BNOoYtWhJWKvCa/Yv4YyQyUva3v+zaRhs45A3q3bBBhPSaeR
 B2WDUQ+gMG2fVspWdLKDFiPNJkp3LtZ7K/Fhr3HPxmZvlrfPkMT97/QS2X/HCJ88S0edm8Q3pEE
 f9u3mX2AFQ/0K/AEQ3SBFZgM32nTlQOXW43Bdt6J4MqN1K8UzfmS3976g+b64p4djmfsbCEo06W
 9ve/iUKR0x21aQb00U9AWDPkzxHk2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 18:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227401

--------------mQyrumeGycZuAOa50TeJ3mYW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-12-03 3:24 a.m., hongxu via lists.openembedded.org wrote:
> Due to libxml2 deprecate python bindings[1], itstool is trying to switch
> from libxml2 to lxml[2], port them to Yocto
>
> [1]https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
> [2]https://github.com/itstool/itstool/pull/57
>
> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> ---
>   ...ficiently-quoted-regular-expressions.patch |   79 +
>   .../0002-Switch-from-libxml2-to-lxml.patch    | 1502 +++++++++++++++++

Hongxu,

We reviewed this commit
and the libxml2: upgrade 2.14.6 -> 2.15.1 one during the patch review 
meeting today but
the consensus was to not merge yet.

There's a big patch that we'd prefer to see merged upstream rather than 
carry it.

Upstream seem to be blocked since late May, 2025:
https://github.com/itstool/itstool/pull/57
Can you help them get unstuck?

If/When the upstream merge happens,
please ask upstream to do a release or ask them when they plan to do a 
release?

Thanks,

../Randy

>   .../itstool/0003-Fix-element-check.patch      |   36 +
>   ...Rewrite-remaining-call-to-addContent.patch |   36 +
>   ...f-namespaced-attributes-from-langPoi.patch |   38 +
>   ...missing-placeholders-more-gracefully.patch |   36 +
>   meta/recipes-support/itstool/itstool_2.0.7.bb |   10 +-
>   7 files changed, 1735 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-support/itstool/itstool/0001-Fix-insufficiently-quoted-regular-expressions.patch
>   create mode 100644 meta/recipes-support/itstool/itstool/0002-Switch-from-libxml2-to-lxml.patch
>   create mode 100644 meta/recipes-support/itstool/itstool/0003-Fix-element-check.patch
>   create mode 100644 meta/recipes-support/itstool/itstool/0004-Rewrite-remaining-call-to-addContent.patch
>   create mode 100644 meta/recipes-support/itstool/itstool/0005-Fix-extraction-of-namespaced-attributes-from-langPoi.patch
>   create mode 100644 meta/recipes-support/itstool/itstool/0006-Handle-missing-placeholders-more-gracefully.patch


 >< snip, snip ><

-- 
# Randy MacLeod
# Wind River Linux

--------------mQyrumeGycZuAOa50TeJ3mYW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-12-03 3:24 a.m., hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251203082404.2732162-2-hongxu.jia@windriver.com">
      <pre wrap="" class="moz-quote-pre">Due to libxml2 deprecate python bindings[1], itstool is trying to switch
from libxml2 to lxml[2], port them to Yocto

[1] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/issues/891">https://gitlab.gnome.org/GNOME/libxml2/-/issues/891</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/itstool/itstool/pull/57">https://github.com/itstool/itstool/pull/57</a>

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 ...ficiently-quoted-regular-expressions.patch |   79 +
 .../0002-Switch-from-libxml2-to-lxml.patch    | 1502 +++++++++++++++++</pre>
    </blockquote>
    <p>Hongxu,<br>
    </p>
    <p>We reviewed this commit&nbsp;<br>
      and the libxml2: upgrade 2.14.6 -&gt; 2.15.1 one during the patch
      review meeting today but<br>
      the consensus was to not merge yet.<br>
    </p>
    <p>There's a big patch that we'd prefer to see merged upstream
      rather than carry it.<br>
      <br>
      Upstream seem to be blocked since late May, 2025:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://github.com/itstool/itstool/pull/57">https://github.com/itstool/itstool/pull/57</a><br>
      Can you help them get unstuck?<br>
    </p>
    <p>
      If/When the upstream merge happens,&nbsp;<br>
      please ask upstream to do a release or ask them when they plan to
      do a release?</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <blockquote type="cite" cite="mid:20251203082404.2732162-2-hongxu.jia@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 .../itstool/0003-Fix-element-check.patch      |   36 +
 ...Rewrite-remaining-call-to-addContent.patch |   36 +
 ...f-namespaced-attributes-from-langPoi.patch |   38 +
 ...missing-placeholders-more-gracefully.patch |   36 +
 meta/recipes-support/itstool/itstool_2.0.7.bb |   10 +-
 7 files changed, 1735 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/itstool/itstool/0001-Fix-insufficiently-quoted-regular-expressions.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0002-Switch-from-libxml2-to-lxml.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0003-Fix-element-check.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0004-Rewrite-remaining-call-to-addContent.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0005-Fix-extraction-of-namespaced-attributes-from-langPoi.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0006-Handle-missing-placeholders-more-gracefully.patch
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>&gt;&lt; snip, snip &gt;&lt;<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------mQyrumeGycZuAOa50TeJ3mYW--

