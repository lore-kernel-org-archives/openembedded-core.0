Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AEDC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 19:00:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.46343.1741633230419819913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 12:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=516461449a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A7hoOd001224
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:00:30 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27a9ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:00:29 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52AJ0TSw031278;
	Mon, 10 Mar 2025 12:00:29 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27a9ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aO4H5Ms2VzyMHE1pb13gyYIIJs6avV0iXj7SKDIy+vGxCOhLxMIxdoJNHT68QUKQXklWNSO+4PvJAkWslVryMamftkoQ+MaAdOUaWGgLHAzeftSwJBIndZ8agpPzkcp2Muor2Y5+SKKaN2KYjpni02+mb1A+uqL+08LAleeDn+u3rbPJa23Ci9bAs1QcbZqrxZ7/yEAQg+siBFz865tqILItA0yNqJOZRmQa7rT4HqW3h+SAylw2mjeT7xJigyPXV6e6p8F2zeC1yj0UTaozI2XOfwdqdEmkX1rjKQytnrIX7TocskiurfBpmzYWtXLy4/euKYSJgPu5BIEXpSTv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/AIhVsH4ZOsg3apos3bvLIx1i3fDeXCIkpXAnppnK4=;
 b=fmC7eNTItQL5Iu5HVGxMEXCDuzZB2DqFrkN8IQKLzTPnPVfxAxb1t8Sh0EDCiseNtBYegyyfLzJ5yojDZhMcgvJR2WXHsQFRRsOIFSWu6jiFVJmW30eqZ47vV67930axScCeRuEsH2oGZrjdfRfDcZ/dxoYppR+ExRnA4avim7KSw7WJA/FfzHGyrDL8/uaTNzJ4xOEGfq98zMaQcR4j0xCT8AyAtYCq0NVvL9z1oXYxK60kxRYyIdPxCEoVIrSDpuN7tdOFrQUaajO6UqRT5yUImdRz7Ob/oucee7v6SabLvpO92G0uZ+/aD8kmokfLoWdSbuhtXKEJcV+SEDltWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 19:00:21 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 19:00:19 +0000
Content-Type: multipart/alternative;
 boundary="------------17Cdd9xS0SRV6fCa0j3EK6ac"
Message-ID: <27e92872-432c-43d0-b5c5-0dae60105457@windriver.com>
Date: Mon, 10 Mar 2025 15:00:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] minizip: Add new recipe
To: ross.burton@arm.com,
        "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>,
        michal.klocek@qt.io
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250307075100.645020-1-mingli.yu@eng.windriver.com>
 <919CBDF5-C00B-47CD-93EA-0A7BFB4B6028@arm.com>
 <fdcdab78-ab77-41f8-bc9a-b9acee540e7c@windriver.com>
 <9A947B7E-8A39-4937-8DAB-A28EED019B8C@arm.com>
 <182B8493D036BC21.13955@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <182B8493D036BC21.13955@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA3PR11MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf36a7c-99c9-4d02-f279-08dd6005cd3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TllrOUtGREFFY3hpeVI2TjdNYlU0RDlJaktyTzNpMGVVYmFGL2w3TDVrRVI3?=
 =?utf-8?B?NTg0UDJUMXp2QWtsNTVmOXRQU0kxS0M5blBxZVExd1M4VVlNcnFOckx5RUVL?=
 =?utf-8?B?Nm5xUktFQ1lkZDF6YVJZZnlkOG91ckt4SmJZRVdhSDFMdzJZNk1SbXBhbUsz?=
 =?utf-8?B?R3RGa01GNU5XNmtNVktWcnU3TitMSG51aVhJR0N2WnN2ejlYQUxOUFpuZEds?=
 =?utf-8?B?aXJFYTJtYTY1c25RbjlPTGxQdE85RHYzNXVmclgzcC81eEdaTkE1TFJFajRO?=
 =?utf-8?B?MnhBMU81b3o5L2JXamZydzNVMERkakpNRlBadm1XSkdBWWxPUDNoQ3VLdllv?=
 =?utf-8?B?SjlxZ2hRWWhib3hZY2FvQ0RvalZwQmFCZFY3YVRmV3dzaUlvdXJ3OUt4U1RG?=
 =?utf-8?B?TTNVZkx6YVoxa0tnL0wzeXRmNnVkT3FNREd1NGFhcWVGZ1BUYy9kdzV3UDBT?=
 =?utf-8?B?VGI5V1c4UDg3MXZSK2VQbytVV3RRamMybUNSZWxERy9CSXVndnZSSGFSTXJv?=
 =?utf-8?B?a3ZHVEJPaVNZVE1tWmYrbWZBTTZManc2bmlpcWgvQkpwVFJuTTgxTUxVTnpt?=
 =?utf-8?B?T2xKbHI3UEI4TVBneXlrcTF4NGJuU1VkZEFBanVxS1NGa2VVQmpSd3gzZXd4?=
 =?utf-8?B?TStYeWpIS0Z4d0VOcXo3V3Z2NzhlZnFwU3g2UVptN3lsMVJHMmh6VDQraWNv?=
 =?utf-8?B?aW1xMkFUOS9mM0k2cElkdnVRWm9QemxrQ1ZBTmVIOWhxSDFzblRaRVNObW5l?=
 =?utf-8?B?aWRlL0RWaFJxL0xTUnRPSlVlN29kNkdJaVFNRHNqNVRCaDJIdzBvSWp2QkZZ?=
 =?utf-8?B?RWZjZ05GVmFKVDlneUNLQ2h1UWlvcUhyVnZldDdTYWJVSmtXemxpeHNGcjBY?=
 =?utf-8?B?YlJSRHE3YnZBeXhtSm44YXdjT3BiWG85SlNic1JHL3p2aUNZd2tUUlZIMjQ4?=
 =?utf-8?B?UVlHOCtGLzBaaFZwRDFCNEZYMWtoa25qcGVTMkNnZkZnNlNjN2IzclovRUI0?=
 =?utf-8?B?UDJ6STluUXNQalJuR0RBSEFpZm12aHlnT3VKeGJqWGVndWVZdmtUdVNZcDNl?=
 =?utf-8?B?WFNiNytTYmZKVzVEWlBlN0RsRHoweldLZlQ3bTk4VVAzVmZDZG5lYTRmaFQ3?=
 =?utf-8?B?N05xMDlCN3luYW1OU1pKcHNpb1llVGdPd09tV2RBNzdPYkFKbzBLV3VWeDR6?=
 =?utf-8?B?OGsweGxDZW01N2FDVFU4Sm5JTzNyNWhycDk1SHZGM2JsQk52eEpUaWdvN2wv?=
 =?utf-8?B?MjFNeUlKa05mSEljOUNVZFYxOGtVOGovVEIzRXBZcFFENVRwdFJSZWVUMnMy?=
 =?utf-8?B?a2NmaVRWejl1UnZsVENNNFV2aTczRVB0dUZPZ0pDS1R5Rlh2U3VHSVI0aHY0?=
 =?utf-8?B?YnpLRXFBdGR4U08vaXBjTk1rR05tbkVlbGFCaUZFMVB6VlBadCszTzlHRmhM?=
 =?utf-8?B?WkZ5M1BtVjFJK08yc2hWanE4REYyR3ZtKzNaV0k3NnY4d3hXUFZEdGduQmtB?=
 =?utf-8?B?QkNTUTExVTRibGVEN29WNkN3Ry9iUC9Vdk04bDBPd2s3cTcyMFoyalMzRG5z?=
 =?utf-8?B?Zm1ZZ1NEVS84YzlVd2VOWFF4RjRsWTVSaXlkSTV5TDMyZllSWXBaeFVOTlFy?=
 =?utf-8?B?ems1Zno3ZGpYd1NvN0xVTFZrckcyMW0rQ1RiUEdZTVZJRTh3UkxxUnM4ZVBC?=
 =?utf-8?B?NHllSmYyOWdGdG8wamoxRFg4ekhHcjJiSjB6akp2MDRDMElQRDR3UEIvZTdT?=
 =?utf-8?B?K0lPeHFsYklDN1VuSUYwLzdqQnAwbGZGYkpoS0NvSW9JRkxWQ09IeWhhYTZj?=
 =?utf-8?B?N3NhTDZRVW56bk9KeFdhUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXY5L3VtY2lYUXc1SlpxNzFEc0lTdWZxelYwdFlhMG5OL2xmNnZzaEJRbldI?=
 =?utf-8?B?dThMaU5uUzJFZGw2TGdSVnBoanoxYThDdFhyM0RRTDFhc084eUljVjVXc0cv?=
 =?utf-8?B?MDhwUDlYUVppZ3FrdVpkNWdoUUZZYWJQK1VnNGNDeHNGR2oySUNOVWV6Rlpu?=
 =?utf-8?B?cmdGVWdseUlLSzIyQnkvOUdTQ3lGYy8ydXFtVno1ajVSajNYeHhGYXFlcUpl?=
 =?utf-8?B?Q0svV0tLek5CdEs0eVp6aUc4Um1aMU1Fc1BudVMxblRoekFYSVJpOTNGOEFB?=
 =?utf-8?B?MUZ3UjhWTXJpc1NjN08wNDQzOFBiMlZBVUc2QkRTYi9yVHVkd010aUVyQ2U2?=
 =?utf-8?B?RjJpSlYvS1g1Lyt3TWdXRjlmYmI2dzhkQUREMEN4WlFIeUJLenVWWEsxcmZx?=
 =?utf-8?B?K01VdUl6NFdENHFzR0VtTnlQcVN6MFZibEp2QVROOVZUcXdPQnp1SnpFVE85?=
 =?utf-8?B?K08wZmM1YUdyWkh6ZG8rbzI5T2xmV2h6d3NJUmVXY2VaaEhUSXVzaWtkSUdy?=
 =?utf-8?B?ak9laDRVaE9uTlRLdjNIMkwxU05rbnFsTEZJV1MvK0ZKQndXS0FqMFgySXk0?=
 =?utf-8?B?Z0lZQ2cvVXdBUjJGK2dMRW5BKzhIL0xNbWtaN2Mzbk5qSkhIem5kQ3VCckQv?=
 =?utf-8?B?TWgxWm43eU9LVFhIcWJOeEdIaEQyK040SkkydHAzVTc0a1oxUVFUYW1JMGxs?=
 =?utf-8?B?TnJlYkVxRThVaWdOcm90NGl0WDNkSVVvME53cm8yeE14QllYVlUwdXUvaUhV?=
 =?utf-8?B?OFVhcWdwU0Z5RVJvc2lmN2RycHNaWVdvNFZpM0dWOFZNb1kwa29SQ0Fodlcw?=
 =?utf-8?B?ejlQZ1BRRWltVGwvSGYxMDZia2VQNkxRZVFTOThTRXRkYXArNFRkWktVeVZq?=
 =?utf-8?B?L0Y2RDFYb05vMXVBZ200YUx6MEJQMzJmOWNLVlQxT1k0V1RJb1NzSU9YZWF5?=
 =?utf-8?B?dVM5NG80Q3p6YzQ1L1FMNEpBZTgxQk1rblNBak5EMUoxeXpaUTdJSURYcTJz?=
 =?utf-8?B?WkNkVS9MaVRsbWR5VVlFWDJiWjVjNDhRSEN3c1FFRHNkSExDSnZzTWNzanpj?=
 =?utf-8?B?Ykw4QXlWV2hCbllKMGx1b2ZBTFdFdGR4dXBhb1RWQzA3OGdqUTJDZWE1QmN2?=
 =?utf-8?B?bG5qbjEyR090TjUrdG10bFVwNk4xd1FkZzRKZjNHNnVFci9ERUpuUnU2SnE5?=
 =?utf-8?B?TlVKTmMvN3lJb0VzeVp2NENqR05YTVlydFFxbWhZZEdhUDVNM1p3dE1OVCta?=
 =?utf-8?B?Zkg0ajgrODZ1dDY2WDY1WWRUaFJYYzgvVlJzQjVacG9maDNkUU1xbDUwTUV2?=
 =?utf-8?B?T28wN1pHdlJuUDB0N2RlUUNOYTM5WmwvOXc5YkpaTmVEVElSNkozdmhSUWtv?=
 =?utf-8?B?U2oyZXZUK0JObmU1TjJJamFWNEQ1Q2pDWWxnSXdiRFRQWklKd2YzYVUwRVRE?=
 =?utf-8?B?RzQ4Rys5OU1USWc4MC9md2hjVXBXbThlYkgrb2tNNU5VMEsrQ1RhMUNpYTJH?=
 =?utf-8?B?dDE2aHBUM3N6azFZMS9CdzVMT0MyWkpJbHFLanVSZEJVUFdJVVQ4QVBFN3NV?=
 =?utf-8?B?QytLTFdoRE4rMUJ0V01sa3UrbXlpeHJjeTJXZmVJTHY4TDMra1ZqVU4vcnJp?=
 =?utf-8?B?TUdzVFZzR0lNV0YvR2JuaEUraHJXT2E1bVBhOVh3d0tnR3BTcGFuVkoxNHJM?=
 =?utf-8?B?czQ4RUkvTkdvMjVrUVpQZFVQanlaemRHSmlLcjlxcVFuQVZQT2hseDM1ajRj?=
 =?utf-8?B?bk1aWHpZaSswZDQ4N1d2czlYM3BLV0dzSEoyMm83L2pUREEwMFRMNkJhUXVN?=
 =?utf-8?B?SDNHbkhqV0xmUVRRZjZmR2UvUkpaWnZSa2w5WVZFZDdTVk9YaitEY3RVd0Ro?=
 =?utf-8?B?cWtzS1JrL0tQaUZxQzJCWGpvbWIzck4yS2p6a1pWYVA5ZWJqRk1zNk50QWdI?=
 =?utf-8?B?TURIVjQyY3RWZFBRSzZDY0Y4S1NGL3FPMmhRZjk5RGt0eHFWSWx6OHZWZ3R4?=
 =?utf-8?B?LzZSMWlNc2NibkpSbG9XT2NDcE1vSWc3WlBzZjFRcHlpdS8rSmxYelQ1d2Zi?=
 =?utf-8?B?dmZOUjAxMHBOaGMyQXhXZmI4RGd0LzRIUVprWHBmRVNZeERIVXY3ZjNvUmNR?=
 =?utf-8?B?UVJ3SE5NTDlWeWl4enFTc05DOWZmUk1FSjhIME5jTVBpbVp3MEtOd2M1VVZ3?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf36a7c-99c9-4d02-f279-08dd6005cd3a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 19:00:19.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: da3ReW8GydGak0tLVdF03ibf/FGgoVLcLaZug7lMSIcXCNyNrRC6WD8Tb8qbdgoV0Jm7gp0xdUyeXqL2IeH0zql8QDDiQfsz+UWHQzZ5wZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
X-Proofpoint-ORIG-GUID: 3KYMFvKRsS43XVgr2y8jtmdjqPtk2UIk
X-Authority-Analysis: v=2.4 cv=WNuFXmsR c=1 sm=1 tr=0 ts=67cf36cd cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=WNDY76dxAAAA:8 a=1pLMaboaAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=mm-yrw9HVJhvyCDK_BYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=E3k6eB6KuMJFupH31GoA:9 a=3c9wgRB5J7r2DBgO:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=HFDSX3BADwN2sFIQuyTb:22
 a=2aaH65VIsbpPzA9iZWfO:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=EkbKBPG5VgkJHREmgZSy:22
X-Proofpoint-GUID: 77dVKG2Z5aOA0LjfndWN6adT8DX5o8-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=989 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 19:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212536

--------------17Cdd9xS0SRV6fCa0j3EK6ac
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id 52A7hoOd001224

DQpBZGQgTWljaGFsIGZyb20gUXQgd2hvIG1hZGUgdGhlIGNvbW1pdCBtZW50aW9uZWQgYmVs
b3cuDQpIb3BlZnVsbHkgdGhleSBjYW4gYWRkIGEgYml0IG1vcmUgZGV0YWlsIHRvIHRoZSBX
ZWJFbmdpbmUgLT4gbWluaXppcCANCnByZWZlcmVuY2UuDQoNCk9uZSB3b3VsZCBob3BlIHRo
YXQgdGhlIG9iamVjdCBzaXplIGFuZCBydW4tdGltZSBtZW1vcnkgZm9vdHByaW50IG9mIA0K
bWluaXppcCBpcyBzbWFsbGVyIHRoYW4NCnRoZSBmZWF0dXJlIHJpY2gsIGxpYnogYnV0IHdl
IHNob3VsZCBjaGVjayBpZiB0aGF0J3MgdHJ1ZS4NCg0KU29tZSBkYXRhIGJlbG93IHNob3dp
bmcgdGhlIExPQyBmb3IgbWluemlwIGFsb25lICg3LjZLKSwgdnMgDQp6bGliKGluY2x1ZGlu
ZyBtaW5pemlwKSAoNTJLKS4NCg0KLi4vUmFuZHkNCg0KDQoNCkkgaGFwcGVuZWQgdG8gaGF2
ZSB0aGlzIGRhdGEuIEkgc2hvdWxkIGxvb2sgYXQgaG93IG1hbnkgcGxhY2VzIHZlbmRvciAN
CnpsaWIuLi4NCg0K4p2vIGxvYyANCnRtcC93b3JrL3g4Nl82NC1saW51eC9ydXN0LW5hdGl2
ZS8xLjgzLjAvcnVzdGMtMS44My4wLXNyYy92ZW5kb3IvbGliei1zeXMtMS4xLjMvc3JjL3ps
aWIvY29udHJpYi9taW5pemlwLw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiDCoExh
bmd1YWdlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEZpbGVzwqDCoMKgwqDCoMKgwqAgTGlu
ZXPCoMKgwqDCoMKgwqDCoCBCbGFuayBDb21tZW50wqDCoMKgwqDCoMKgwqDCoCBDb2RlDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIMKgQ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgN8KgwqDCoMKgwqDCoMKgwqAgNjMxMsKgwqDCoMKg
wqDCoMKgwqAgMTA1NyA1NDLCoMKgwqDCoMKgwqDCoMKgIDQ3MTMNCiDCoEMvQysrIEhlYWRl
csKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA2wqDCoMKgwqDCoMKgwqDCoCAxMjAzwqDCoMKg
wqDCoMKgwqDCoMKgIDIzMyAzNjXCoMKgwqDCoMKgwqDCoMKgwqAgNjA1DQogwqAuLi4NCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogwqBUb3RhbMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAxOMKgwqDCoMKgwqDCoMKgwqAgNzY3N8KgwqDCoMKgwqDCoMKg
wqAgMTMzNCA5MDfCoMKgwqDCoMKgwqDCoMKgIDU0MzYNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQoNCuKdryBsb2MgDQp0bXAvd29yay94ODZfNjQtbGludXgvcnVzdC1uYXRpdmUv
MS44My4wL3J1c3RjLTEuODMuMC1zcmMvdmVuZG9yL2xpYnotc3lzLTEuMS4zL3NyYy96bGli
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIMKgTGFuZ3VhZ2XCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgRmlsZXPCoMKgwqDCoMKgwqDCoCBMaW5lc8KgwqDCoMKgwqDCoMKgIEJs
YW5rIENvbW1lbnTCoMKgwqDCoMKgwqDCoMKgIENvZGUNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQogwqBDwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgNDLCoMKgwqDCoMKgwqDCoCAyNjM3OMKgwqDCoMKgwqDCoMKgwqAgMzMwMiA0ODA0wqDC
oMKgwqDCoMKgwqAgMTgyNzINCiDCoEFzc2VtYmx5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgOMKgwqDCoMKgwqDCoMKgwqAgNTI1OcKgwqDCoMKgwqDCoMKgwqAgMTAzMyA5
OTjCoMKgwqDCoMKgwqDCoMKgIDMyMjgNCiDCoEMvQysrIEhlYWRlcsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMjfCoMKgwqDCoMKgwqDCoMKgIDY3MTDCoMKgwqDCoMKgwqDCoMKgwqAgOTEz
IDI2NDXCoMKgwqDCoMKgwqDCoMKgIDMxNTINCiDCoFBsYWluIFRleHTCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAyMcKgwqDCoMKgwqDCoMKgwqAgMzc1M8KgwqDCoMKgwqDCoMKgwqAg
MTExNyAwwqDCoMKgwqDCoMKgwqDCoCAyNjM2DQogwqBBZGHCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEwwqDCoMKgwqDCoMKgwqDCoCAyODQwwqDCoMKgwqDC
oMKgwqDCoMKgIDU5OSA1NjDCoMKgwqDCoMKgwqDCoMKgIDE2ODENCiDCoE1ha2VmaWxlwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDIywqDCoMKgwqDCoMKgwqDCoCAyMTQwwqDC
oMKgwqDCoMKgwqDCoMKgIDQ5MyAyODjCoMKgwqDCoMKgwqDCoMKgIDEzNTkNCiDCoFBhc2Nh
bMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0wqDCoMKgwqDCoMKgwqDC
oCAxNDQzwqDCoMKgwqDCoMKgwqDCoMKgIDIxOSAxNjbCoMKgwqDCoMKgwqDCoMKgIDEwNTgN
CiDCoEJvdXJuZSBTaGVsbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAywqDCoMKgwqDCoMKg
wqDCoCAxMjg3wqDCoMKgwqDCoMKgwqDCoMKgIDE1NiAxNDjCoMKgwqDCoMKgwqDCoMKgwqAg
OTgzDQogwqBDKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
NcKgwqDCoMKgwqDCoMKgwqDCoCA5MDfCoMKgwqDCoMKgwqDCoMKgwqAgMTcyIDEzNsKgwqDC
oMKgwqDCoMKgwqDCoCA1OTkNCiDCoEhUTUzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDHCoMKgwqDCoMKgwqDCoMKgwqAgNTQ1wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA1IDHCoMKgwqDCoMKgwqDCoMKgwqAgNTM5DQogwqBDI8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDnCoMKgwqDCoMKgwqDCoMKgwqAgMzMywqDC
oMKgwqDCoMKgwqDCoMKgwqAgNDcgNTTCoMKgwqDCoMKgwqDCoMKgwqAgMjMxDQogwqBDTWFr
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDHCoMKgwqDCoMKgwqDC
oMKgwqAgMjQ5wqDCoMKgwqDCoMKgwqDCoMKgwqAgMzIgMzHCoMKgwqDCoMKgwqDCoMKgwqAg
MTg2DQogwqBQZXJswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAx
wqDCoMKgwqDCoMKgwqDCoMKgIDE1MsKgwqDCoMKgwqDCoMKgwqDCoMKgIDMzIDE1wqDCoMKg
wqDCoMKgwqDCoMKgIDEwNA0KIMKgQXV0b2NvbmbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAzwqDCoMKgwqDCoMKgwqDCoMKgIDU1OcKgwqDCoMKgwqDCoMKgwqDCoMKgIDQ5
IDQwN8KgwqDCoMKgwqDCoMKgwqDCoCAxMDMNCiDCoFhNTMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgwqDCoMKgIDExNsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgNSAxNsKgwqDCoMKgwqDCoMKgwqDCoMKgIDk1DQogwqBCYXRjaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDLCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAgMMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgNA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiDCoFRvdGFswqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxNTnCoMKgwqDCoMKgwqDCoCA1MjY3NMKgwqDCoMKg
wqDCoMKgwqAgODE3NSAxMDI2OcKgwqDCoMKgwqDCoMKgIDM0MjMwDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KDQoNCk9uIDIwMjUtMDMtMTAgMjozMCBwLm0uLCBSYW5keSBNYWNM
ZW9kIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBPbiAyMG1pY2hhbC5r
bG9jZWtAcXQuaW8yNS0wMy0xMCA4OjUxIGEubS4sIFJvc3MgQnVydG9uIHZpYSANCj4gbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+IE9uIDEwIE1hciAyMDI1LCBhdCAwMjo1
MCwgWXUsIE1pbmdsaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxtaW5nbGkueXU9ZW5n
LndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4gSGkg
Um9zcywNCj4+Pg0KPj4+IE9uIDMvNy8yNSAxODoyNCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+
Pj4+IENBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVt
YWlsIGFjY291bnQhDQo+Pj4+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4+Pj4gT24gNyBNYXIgMjAyNSwgYXQgMDc6NTEsIFl1LCBNaW5nbGkg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8bWluZ2xpLnl1PWVuZy53aW5kcml2ZXIuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+Pj4gRnJvbTogTWluZ2xpIFl1
PG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPg0KPj4+Pj4NCj4+Pj4+IG1pbml6aXAgWzFdIHVz
ZXMgemxpYiBbMl0gdG8gc3VwcG9ydCBjb21wcmVzc2VkIGFyY2hpdmVzLg0KPj4+Pj4NCj4+
Pj4+IG1pbml6aXAgaXMgbm90IHBhcnQgb2YgemxpYiwgYnV0IGlzIGluY2x1ZGVkIGluIHRo
ZSB6bGliDQo+Pj4+PiBkaXN0cmlidXRpb24gWzFdIGFzIGEgdGhpcmQtcGFydHkgY29udHJp
YnV0aW9uIGluIHRoZSBjb250cmliDQo+Pj4+PiBkaXJlY3RvcnkuDQo+Pj4+IFRoZSBtaW5p
emlwIHdoaWNoIGhhcyAiQWxsIGZpbGVzIHVuZGVyIHRoaXMgY29udHJpYiBkaXJlY3Rvcnkg
YXJlIFVOU1VQUE9SVEVELiBUaGV5IHdlcmUNCj4+Pj4gcHJvdmlkZWQgYnkgdXNlcnMgb2Yg
emxpYiBhbmQgd2VyZSBub3QgdGVzdGVkIGJ5IHRoZSBhdXRob3JzIG9mIHpsaWIu4oCdIGlu
IHRoZSBSRUFETUU/DQo+Pj4+IFdoeSB3b3VsZCB3ZSBuZWVkIHRoaXMgYXQgYWxsLCBhbmQg
d2h5IHdvdWxkIGl0IGJlIGluIGNvcmU/DQo+Pj4gSWYgaXQncyBub3QgYXBwcm9wcmlhdGUg
dG8gc2VuZCB0aGlzIHBhdGNoIHRvIGNvcmUsIEkgd2lsbCByZXNlbmQgdG8gb3RoZXIgbGF5
ZXIuDQo+PiBJdOKAmXMgYWxtb3N0IGRlZmluaXRlbHkgbm90IGFwcHJvcHJpYXRlIGZvciBj
b3JlLCBidXQgd2h5IHdvdWxkIHlvdSBuZWVkIGEgcmVjaXBlIGZvciBpdCBhdCBhbGw/DQo+
DQo+DQo+IEl0IHdhcyBhIGN1c3RvbWVyIHJlcXVlc3QuIEkgc2hvdWxkIGhhdmUgYXNrZWQg
d2h5LCBhcyB5b3UgYXJlIG5vdyBzbw0KPiB3ZSdsbCBkbyB0aGF0IGFuZCB3ZSdsbCBnZXQg
YmFjayB0byB5b3UuDQo+DQo+DQo+IE5vdGUgdGhhdCBtaW5pemlwIGlzIHVzZWQgaW4gbWV0
YS1xdDY6DQo+IGh0dHBzOi8vY29kZS5xdC5pby9jZ2l0L3lvY3RvL21ldGEtcXQ2LmdpdC9j
b21taXQvP2lkPTljMmIwMmFhYjY1MDEzN2ZkOGMwZmViYWVjYmM2ZDU5M2ZmYjNkMDINCj4N
Cj4gwqDCoMKgIFdlYkVuZ2luZSBuZWVkcyBtaW5pemlwIHdoaWNoIGlzIHBhcnQgb2Ygemxp
Yi5UaWxsIG5vdyBpdCBhbHdheXMgYnVpbHQNCj4gwqDCoMKgIGJ1bmRsZWQgemlwIGFzIG1p
bml6aXAgcmVjaXBlIGRvZXMgbm90IGV4aXN0IGluIHBva3kgYW5kIG1vcmVvdmVyIHRoaXMN
Cj4gwqDCoMKgIHdhcyBuZXZlciBhIGNvbmZpZ3VyYWJsZSBmZWF0dXJlIGFzIGl0IHdhcyBu
b3QgaW4gUEFDS0FHRUNPTkZJRy4NCj4NCj4gwqDCoMKgIEEgY2hhbmdlIGluIA0KPiBodHRw
czovL2NvZGVyZXZpZXcucXQtcHJvamVjdC5vcmcvYy9xdC9xdHdlYmVuZ2luZS8rLzM4NDI2
Mg0KPiDCoMKgwqAgZW5hYmxlcyBjb21waWxhdGlvbiBvZiBidW5kbGVkIG1pbml6aXAgYWdh
aW5zdCBzeXN0ZW0gemxpYiAoYnkgdXNpbmcNCj4gwqDCoMKgIHNoaW0gaGVhZGVycykgaG93
ZXZlciBpdCBpcyBub3QgYWR2aXNhYmxlIGFzIHRob3NlIHR3byB2ZXJzaW9uIG9mIHppcA0K
PiDCoMKgwqAgbWlnaHQgYmUgZGlmZmVyZW50IGFuZCBtaW5pemlwIGlzIHByb2plY3Qgd2lz
ZSBhIHBhcnQgb2YgemxpYi4NCj4NCj4gwqDCoMKgIFRoZXJlZm9yZSBpbnRyb2R1Y2UgY2hl
YXAgcmlwIG9mZiBvZiB6bGliIHJlY2lwZSwgaG93ZXZlcg0KPiDCoMKgwqAgYnVpbGRpbmcg
bWluaXppcCBmcm9tIHNhbWUgc291cmNlIHRyZWUuDQo+DQo+DQo+IFRoYXQgaXNuJ3QgYSB2
ZXJ5IHNhdGlzZnlpbmcgZXhwbGFuYXRpb24gb2Ygd2h5IHRoZSBXZWJFbmdpbmUgcHJlZmVy
cyANCj4gbWluaXppcCB0byB6bGliLi4uDQo+DQo+DQo+IFN0YXkgdHVuZWQsDQo+DQo+IC4u
L1JhbmR5DQo+DQo+DQo+DQo+DQo+PiBSb3NzDQo+Pg0KPg0KPiAtLSANCj4gIyBSYW5keSBN
YWNMZW9kDQo+ICMgV2luZCBSaXZlciBMaW51eA0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBn
cm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMTI1MzUpOmh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjEyNTM1DQo+IE11
dGUgVGhpcyBUb3BpYzpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTExNTY0
MTcyLzM2MTY3NjUNCj4gR3JvdXAgT3duZXI6b3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTpodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFuZHkubWFjbGVvZEB3
aW5kcml2ZXIuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPg0KDQotLSANCiMg
UmFuZHkgTWFjTGVvZA0KIyBXaW5kIFJpdmVyIExpbnV4DQo=
--------------17Cdd9xS0SRV6fCa0j3EK6ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52A7hoOd001224

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>Add Michal from Qt who made the commit mentioned below.<br>
      Hopefully they can add a bit more detail to the WebEngine -&gt;
      minizip preference.</p>
    <p>One would hope that the object size and run-time memory footprint
      of minizip is smaller than <br>
      the feature rich, libz but we should check if that's true.</p>
    <p>Some data below showing the LOC for minzip alone (7.6K), vs
      zlib(including minizip) (52K).</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>I happened to have this data. I should look at how many places
      vendor zlib...<br>
    </p>
    <p>=E2=9D=AF loc
tmp/work/x86_64-linux/rust-native/1.83.0/rustc-1.83.0-src/vendor/libz-sys=
-1.1.3/src/zlib/contrib/minizip/<br>
-------------------------------------------------------------------------=
-------<br>
      &nbsp;Language&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Files&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lines=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blank&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
      Comment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Code<br>
-------------------------------------------------------------------------=
-------<br>
      &nbsp;C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6312&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1057&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
      542&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4713<br>
      &nbsp;C/C++ Header&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1203&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 233&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      365&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 605<br>
      &nbsp;...<br>
-------------------------------------------------------------------------=
-------<br>
      &nbsp;Total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7677&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 1334&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      907&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5436<br>
-------------------------------------------------------------------------=
-------<br>
      <br>
      =E2=9D=AF loc
tmp/work/x86_64-linux/rust-native/1.83.0/rustc-1.83.0-src/vendor/libz-sys=
-1.1.3/src/zlib<br>
-------------------------------------------------------------------------=
-------<br>
      &nbsp;Language&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Files&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lines=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blank&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
      Comment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Code<br>
-------------------------------------------------------------------------=
-------<br>
      &nbsp;C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
42&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 26378&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 3302&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
      4804&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18272<br>
      &nbsp;Assembly&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 5259&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1033&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      998&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3228<br>
      &nbsp;C/C++ Header&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 27&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6710=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 913&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      2645&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3152<br>
      &nbsp;Plain Text&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 3753&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1117&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2636<br>
      &nbsp;Ada&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2840&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 599&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
      560&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1681<br>
      &nbsp;Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 2140&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 493&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      288&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1359<br>
      &nbsp;Pascal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1443&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 219&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;
      166&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1058<br>
      &nbsp;Bourne Shell&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1287&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 156&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      148&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 983<br>
      &nbsp;C++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 907&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
      136&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 599<br>
      &nbsp;HTML&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 545&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 539<br>
      &nbsp;C#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 332&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 47&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      54&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 231<br>
      &nbsp;CMake&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 249&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
      31&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 186<br>
      &nbsp;Perl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 152&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
      15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 104<br>
      &nbsp;Autoconf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 559&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 49&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;
      407&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 103<br>
      &nbsp;XML&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 116&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 95<b=
r>
      &nbsp;Batch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 4<br>
-------------------------------------------------------------------------=
-------<br>
      &nbsp;Total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 159&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 52674&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 8175&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      10269&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 34230<br>
-------------------------------------------------------------------------=
-------<br>
      <br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2025-03-10 2:30 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:182B8493D036BC21.13955@lists.op=
enembedded.org">
     =20
      <div class=3D"moz-cite-prefix">On <a class=3D"moz-txt-link-abbrevia=
ted" href=3D"mailto:20michal.klocek@qt.io25-03-10">20michal.klocek@qt.io2=
5-03-10</a> 8:51
        a.m., Ross Burton via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:9A947B7E-8A39-4937-8DAB-A28EE=
D019B8C@arm.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 10 Mar 2025, at 02:50, =
Yu, Mingli via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:mingli.yu=3Deng.windriver.com@lists.openembedded.org">&lt;=
mingli.yu=3Deng.windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Hi Ross,

On 3/7/25 18:24, Ross Burton wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email co=
mes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
On 7 Mar 2025, at 07:51, Yu, Mingli via lists.openembedded.org <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:mingli.yu=3Deng.windriver.com@list=
s.openembedded.org">&lt;mingli.yu=3Deng.windriver.com@lists.openembedded.=
org&gt;</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre wrap=3D"" class=3D"moz-quote-pre">From: Mingli Yu <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:mingli.yu@windriver.com">&l=
t;mingli.yu@windriver.com&gt;</a>

minizip [1] uses zlib [2] to support compressed archives.

minizip is not part of zlib, but is included in the zlib
distribution [1] as a third-party contribution in the contrib
directory.
</pre>
            </blockquote>
            <pre wrap=3D"" class=3D"moz-quote-pre">The minizip which has =
&quot;All files under this contrib directory are UNSUPPORTED. They were
provided by users of zlib and were not tested by the authors of zlib.=E2=80=
=9D in the README?
Why would we need this at all, and why would it be in core?
</pre>
          </blockquote>
          <pre wrap=3D"" class=3D"moz-quote-pre">If it's not appropriate =
to send this patch to core, I will resend to other layer.
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">It=E2=80=99s almost defini=
tely not appropriate for core, but why would you need a recipe for it at =
all?</pre>
      </blockquote>
      <p><br>
      </p>
      <p>It was a customer request. I should have asked why, as you are
        now so <br>
        we'll do that and we'll get back to you.</p>
      <p><br>
      </p>
      <p>Note that minizip is used in meta-qt6:<br>
        <a class=3D"moz-txt-link-freetext" href=3D"https://code.qt.io/cgi=
t/yocto/meta-qt6.git/commit/?id=3D9c2b02aab650137fd8c0febaecbc6d593ffb3d0=
2" moz-do-not-send=3D"true">https://code.qt.io/cgit/yocto/meta-qt6.git/co=
mmit/?id=3D9c2b02aab650137fd8c0febaecbc6d593ffb3d02</a></p>
      <p>&nbsp;&nbsp;&nbsp; WebEngine needs minizip which is part of zlib=
.Till now it
        always built<br>
        &nbsp;&nbsp;&nbsp; bundled zip as minizip recipe does not exist i=
n poky and
        moreover this<br>
        &nbsp;&nbsp;&nbsp; was never a configurable feature as it was not=
 in
        PACKAGECONFIG.<br>
        &nbsp;&nbsp; &nbsp;<br>
        &nbsp;&nbsp;&nbsp; A change in <a class=3D"moz-txt-link-freetext"=
 href=3D"https://codereview.qt-project.org/c/qt/qtwebengine/+/384262" moz=
-do-not-send=3D"true">https://codereview.qt-project.org/c/qt/qtwebengine/=
+/384262</a><br>
        &nbsp;&nbsp;&nbsp; enables compilation of bundled minizip against=
 system zlib
        (by using<br>
        &nbsp;&nbsp;&nbsp; shim headers) however it is not advisable as t=
hose two
        version of zip<br>
        &nbsp;&nbsp;&nbsp; might be different and minizip is project wise=
 a part of
        zlib.<br>
        &nbsp;&nbsp; &nbsp;<br>
        &nbsp;&nbsp;&nbsp; Therefore introduce cheap rip off of zlib reci=
pe, however<br>
        &nbsp;&nbsp;&nbsp; building minizip from same source tree.<br>
      </p>
      <p><br>
      </p>
      <p>That isn't a very satisfying explanation of why the WebEngine
        prefers minizip to zlib...<br>
      </p>
      <p><br>
        Stay tuned,<br>
      </p>
      <p>../Randy</p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:9A947B7E-8A39-4937-8DAB-A28EE=
D019B8C@arm.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">Ross</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#212535): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/212535">https:/=
/lists.openembedded.org/g/openembedded-core/message/212535</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/111564172/3616765">https://lists.openembedded.org/mt=
/111564172/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------17Cdd9xS0SRV6fCa0j3EK6ac--

