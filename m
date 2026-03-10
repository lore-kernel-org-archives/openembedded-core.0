Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB29EB104B
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 10:58:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37185.1773140300799868569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 03:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=W3A6LSkr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752994159e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8mSLZ689547
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 03:58:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MZumB0cwxGyVXArbJ7TxuRJdvMlfUwsjnzYBtYcX48I=; b=
	W3A6LSkr9mqTvxZAe1qYwahTu7us9gbwWqAVORv2b0JQtmyzZhmXrDt/vmmRD4zt
	1vboIovSqzz6PTxMJwdQQSor7iF2ZuL+NwCCrnw6z4YbaboJqbL4ZlHWpHGN6hAw
	D39TPfcdu1605AnByVDesCuXMEoMMECnpnhgF98ehk4LZ1tkJPsxIZ2J6fJpMtNS
	jrBYZcOqfgfOBypfHGDW5Od7Am6TlEa/LEciCnvNroS0bIKIXIYocaxLI2Bb/PwM
	IJomUwwyRIzpvOoJ6wL3rI/EY4Ou+0FWzjCS3Ir08zHl3bH5tCtE8PrGevMMn1jb
	7KRAWCRGBtXApK0PYoGn+g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62k04p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 03:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXubo7zvXvXh2wnGm3+rmLCwu6bcnRqVPTqOVST1/FTNHIU4G5hIC2KMRtORpcarVrG96ijVFNWSeRWeYyRks1GT1QY8btb0RwrQqUS3L4rdQacWbvjSvBXkob+1JOGk4ymoUSwT9tA7SWS0JzjHJvN3YKB5wEw1lds8YuL/Rv4P66tCJY4FrQI6tRVxoSBLSvXeBJY7S/Id1I5pNNjE7MQVdY4ewwtbslKW/7iK0WZqlMW8NbCIeYh2hYlJInjQAwG+VfHpcO05iTiT6hpNbAir3W18AmVUtFAIOXsfe4ms8CZnb/MN1f7OOKixZ1NNULONquNGD3JAXl4IQr84gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZumB0cwxGyVXArbJ7TxuRJdvMlfUwsjnzYBtYcX48I=;
 b=rRrW+syzHL0qySTf4ESl/hnJv7e5zQq4saTuP3HPSLOcP1+xC+kNZx3gOEZbVqGBcv/w66Gfu3Sgdlh9eyFxp2qm0VgShr2CFZL4wJwAGGQk0lC3oRSTI5SuCSxHQEKq1SEmkS907AwggKtVQ0fseUwQAMUIYDh6uWBLAL/H+r0VeGKNeMSMResSkf1Gn0gX7NTQSuEowGsZ5jycpqSAR0v2UVjzNoRI6UGeMnnQX1/LD5huJUH6cXeA/sq08wyZ7nQ1gEYLv8S9h4X3VBh9eCnZa26sxNBMyAg/lvZn5X5jnVXvR92J+MULFHzvg8yZNNUY1Slctd1fX1abP6A23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6489.namprd11.prod.outlook.com (2603:10b6:208:3a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:58:01 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 10:58:01 +0000
Message-ID: <638a690c-6890-47da-a604-a25b86140139@windriver.com>
Date: Tue, 10 Mar 2026 16:27:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, paul@pbarker.dev,
        yoann.congal@smile.fr
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
 <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com>
 <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
 <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com>
 <CADkTA4OZVd17y5v2XYzZx1gRqSE81A+RRo4-WaL13195GpKTAw@mail.gmail.com>
 <cff0fc23fcf9e5176fc4830f1ff395a79bcaffe8.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <cff0fc23fcf9e5176fc4830f1ff395a79bcaffe8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: c88d6a4f-ca19-4f13-a58c-08de7e93e594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ZUdKAESX/cM7fMCvfmBtpOBKbJ+wjpD92m8IS38bUE0ViyUQnJ1f31QhzVHmLvpknilv4vyX850YqauCw+1pgzh8cqd8OpXfpEielXaKJsAV4CYs+QqS3bZ2z5xCRstguc53vBOiAuVSc7zFQBYhVfgBoCAtpoj85C3MbY64+XlSonfvgtAMQ4Wxh9se89Z56HvnLaaqCI2eQABrsWBPSSg67kSzmOe8lortWUs/x6fFbeYICsHWmeGIGfESd6v/SZSQ510sjxfK6SXXobNqmlI/YGQ05BBAq1E2MzzZ8suwn3PGZyyP6IIKEdi9bLQdzlXh39cSRFR0Ygj4rlscbhfJbKBlNTQqJABHJ7BksBURgvZVcHN6TgjaHSrPqUqVYA9RpMbP0s8cApebJs3lKCu50wZPf1j2dZhTbZPsrdRAiI9uf2k/QLKMIpGzJnXUmVuvkFxm4k2VXU4PVnui0i/XLrEa4kbCmyqoRgkVV359ZybwPvnnuGZRdmhndlGb/Nf/h5O1+tFWZCloeB7FNeUNsOxrznwe853uaLtmjb9Lh5aleSFGycSk8QL5+GP3Y9BL97cOwYx3CeS8ljyy00Pt4mz2/jKBahUphy1kXvruIwR5S5TwFE3e8Uj44m3dVyNDZef2r32w3brSX/ECm80RaTJaZxce3OoDrer5D5JwbVJByL4bSaSuk9JXx0GFF06dxoShSn9RuE2hthXIHUUlpe/IbyTcIVCJc0fs9Dao+jZ0plAp0AREPJd4KNoRAgFaHO4Ysxzkz2PlIPBMfnue9b95YRAPOW28Gq8BS68=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N00ya2VnVmw1RTYwcHU0bTF5V2RVTXg4S0JlQkRsOGRXOHc0dDZqb2x2QmJq?=
 =?utf-8?B?emM3MVlYbFdWdUppUXpUa2NkdE8zRVFhTjlFK2o2SXFiRTI4dDNhVC9VRjhM?=
 =?utf-8?B?bmVSNHREOHBSTUloRXZjbkxValhsb2o4aCs2cWJjcHJpck12TkpPaUtDQjk5?=
 =?utf-8?B?blNvb1lPV0U2REExdDJaTUNVczFtazFPUU9BaG4zQ0NMS0F4SFFIK0E5WWVU?=
 =?utf-8?B?c0NiZWRwalVWYVhlSXJ1NTl4QURBejRXVEJmalNzVXJoWkMvQlFISWZBTk16?=
 =?utf-8?B?L00vdjNwN0RTZXRFUFo0MFFuR0VlU0pQU2xMalZuMHRxTjR2U013cEZiRUsy?=
 =?utf-8?B?NUdPaFU1amJUb3ZPc0g3cWtVSlZCQTBjR25DejRWaHJkVTBqMERkR04wdnJJ?=
 =?utf-8?B?ZTEzc29SbENEVFEySjF1OGUyZW9MSUY4VHNiYXNVSnFHSXNQMG1RZWVtbkNz?=
 =?utf-8?B?ZHFWRDZuYXF4K3c0dy9vZWx1WFo3VW9DSnJHdkJQYWtjYitxTW1SOWd0N3Vn?=
 =?utf-8?B?enkrN0xxZUlNb2FmcW56NXY2NjFuSStRNXpUY0d2ZmNYUzBqS1FLeWIreFlJ?=
 =?utf-8?B?alJJV0JDeWRVSnB5aHFtcEtkOTIvOXFKUDlNSXJEQ1JpMElxOUJPOG9MVCtI?=
 =?utf-8?B?dzgyZWY2ZEZqUjdudkRIdW84M0VYbHNiTTBkNHZobDJDNm05bHFFeEtuZDc1?=
 =?utf-8?B?UC9BQUJOeWFwMjJwYTVNenk5b3Jtb29wL2Q2Mm5KYVZ3Nkpxc1k2RGZIMzJa?=
 =?utf-8?B?WW1QdjNQYUg0MVhoV2pQYzJRWG9rQlNYWVBFdkdLd202VjRnUy93QUJPeHlF?=
 =?utf-8?B?Z3prUzFBeDZScGVNNW0yaVpNVy9LSmNJVDNPR2k3SXZOejlWRUl5VTlTUEdS?=
 =?utf-8?B?SjZ5STlrbXZyQ1lFTHNwQ09vMHY2ejdMWkVma3JnbmFOZmZTd0crUHZJY0hN?=
 =?utf-8?B?aHo4d015c093UDhQT0tYcU1MczNhc2w5M3QrMmNOVE9XL1NQbEFyZGc3Z1pS?=
 =?utf-8?B?V3FkRGxveVc3NTZMZXh4MnhDZ3Z1N0NGVEs2WGNBaXBnYmw4RVJOdVpxRlF3?=
 =?utf-8?B?QkRCdlE1SGJ2YkcyazlRZTIrUkVHUlZ5cFVNblpGc3Fva3hGS2hJRzhUYVJI?=
 =?utf-8?B?UUJPZFVCUXZWcVdzQ2VEUTl3MndZQ2xobkVZOTJRS2RoeElIZlBxTWNVUnNL?=
 =?utf-8?B?akJGRGpHckVqQzk2U1UrWWpGcXJkVmprUS9TMENUYXRwLzg2cEtsWm82NFZo?=
 =?utf-8?B?cmd0SmVFY3ZjNnl3M1g4ZDJVNHFMamR3VFZGaC9EQmpINW1Mb3dvMVB6QzU5?=
 =?utf-8?B?KzhhRG1zRzcyL3A1WmhqUXJoMW1TVnlXQ2hFdUtlOUFwSmp4Mngwa2xRcTVj?=
 =?utf-8?B?STlWNUdYVHZxTHZKaFA2MkJSTFJUYU1DMTNKUTB3aC96aUgxWVFFMTZzTXYx?=
 =?utf-8?B?Tlo2SjZQUlBsMmZveEJyOEw1YXdSUzRVM050ZEQ1U2ZXMUx5YWdMRG9tbDRr?=
 =?utf-8?B?ai94N2w4eVNUa1JKWDRqT0ZCOGhIQkx0akdyeE1CaENEc2JrNUttR1hNbkVQ?=
 =?utf-8?B?eWNldld3VHVHa1l4cUdkS1FqdSsyRUIxczRrdDJveEJsbngvUktRSUYydDRu?=
 =?utf-8?B?QVBjUmtYQVNsWitBU2xEMFdVN2VLU0J0bkdNZENpTjVnaW15YzhJVzQzaWNu?=
 =?utf-8?B?T0VPcG1RcWZ5b210WVNFSDNIZmhwMk1wLzJWdkVGVzRrU1FES3dHWXRmaFFX?=
 =?utf-8?B?Y2ZrWDNoYUVGTjMvdkV1dTN5UGRuanNaRVRLTFV5WG5Sdm5SREw5K3p3dUlO?=
 =?utf-8?B?b1lIdXBGc3dWbitoVVpMRkpSSEJLa3NUU0RpM1liR1NlaTZqVUVldmhkSnBK?=
 =?utf-8?B?R2kzVlY5N0FpUitaQmFsZ3o3dkFralV6UVZwMTlhYWx3L01EQ0g2NzI1cWNY?=
 =?utf-8?B?MTcwM0I3MWxGZXo0WmNPYnBOT3JUS251NHMrUFQ4bm1zZmk2c3dva0J1NmhN?=
 =?utf-8?B?R0pKeWtWeFJ2NC9VSUYza1d4b0ZCVjVCYVV4VVVOOHRoR3IrNlBYU1dWRS80?=
 =?utf-8?B?cDBNZkY5ZzlRMjRwalR0bC9kaEVnT29HdXpUWm8wbTRwTytzR0ZjNlY4VFMw?=
 =?utf-8?B?ZkE5K1JzRXUvaTRBQUVCWkxTblJ3WDB6by81Sy9tUGd4NElIZEkycjZOMTAw?=
 =?utf-8?B?MVJFL1BsRWl1Z2tCUnZ0SGJLKzY4YmoxdlAwNnV3NXF6UzFQZ2xkTzZyQUxn?=
 =?utf-8?B?MlRlc3QvUjl1dzJPYiswYjRqQ2JVREN0WjBublVoUys3YkN6OE9vaWFYakc1?=
 =?utf-8?B?NWRlNWQ0MHFQcGI1OWFjVFFJekZxZjhDS0ZvTFcvUU5vOStRcjJzUHBjeG9u?=
 =?utf-8?Q?wjmZhnGqC0vwwCko=3D?=
X-Exchange-RoutingPolicyChecked: 
	DFqHSwTyVlmGIQzmbZQ798AsKxBBIoLlfmYu0E56FBkd4PHg4JeR+Mx/3k44HPA9CAAsRt9z6qqX0rqEW8KApNnOWImdBIbsUOi/FYlsJdx8gqSZcVUmI8xZgw0HYb3R8leUMEQDfurq8vN5YhyVQPbnh2bB4tJuym28EdjMrDJzWtFELYi8ipQ8vRUvkzruom2Wd5cK5XCK9eOkMX9M6j1aIJKnNa7cu+e3LyBFgBMgahk+MvoLuLJuzVzeBzjXdRk+aei1VuHC++w7Tk53IVx+DVnm+KuivgeDmX3i9mlgFa/ZC6ax+3AJgLjiAhfscsc9X8Y0pq/QY1scu++Apg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88d6a4f-ca19-4f13-a58c-08de7e93e594
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:58:01.3989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMR4yxxXLp7cd8ZhR7rlyw5F1DK3NjEsTMV1KnJrwvk4Uw/eWoTEAe58mzBAWYz4kVp5oZMncHuReVnTMqj6H3bXv38PUcJrqlEG3q5Gq1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6489
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69aff94c cx=c_pps
 a=1mmXF8F6+aLADKsbn3w/2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=Vphpr4Ak2nZ00DuHT3gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5NCBTYWx0ZWRfXw6YSq8Beq+H3
 cFAwLMUeUqNiKcBnjNFG8AEYhk0mcyEmqfqYvS0oLAitpSN+BidL72eq4dYaUYfWTOrhibMHLnE
 TyHMhZgR8AN9RtM94wBTprpPyPt/euG2oMabUaqUNwv2lMfmEYm+Avke2P2vikgfRaQedzW+CGV
 xQI7N59g4T5OzDIkXO9IoTm6axq4BN2yYq2sZo39p7X2YN2338ke1Q3O1RhjkP8kHbK9rgUR1bj
 9EK6kQfzNm0Kjggdv+PnAwXlZtYt+yK8ibwlX3Wui+astxTLgCR2BqKWgaZ7saqiQ7mSubTe4T2
 ESJuHLJOZav1VYtjeki4vVCeBgxiDOZz8L1SWxzyS+5MqORfv2AfVOzNq8CI6qByePTGfufckK+
 Pnz7+bibOp/in5LY61knmTTJeumj4OToR7iumOo+AtCF8DKPgGqPwLpBETCZZvXNRYt8/qwxAaL
 9UCrjbjEv2AFTPlWsIw==
X-Proofpoint-ORIG-GUID: jMb7z9EqxjSQHzjxVvVTq9LOQFdgSkxb
X-Proofpoint-GUID: 21v4thIaeraLay7XdWEInE4nmh15izxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100094
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62A8mSLZ689547
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 10:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232768


On 3/10/2026 12:50 AM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield wrote:
>>
>>
>> On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadineni
>> <Harish.Sadineni@windriver.com> wrote:
>>>
>>>
>>>
>>>
>>> On 3/9/2026 9:59 PM, Bruce Ashfield wrote:
>>>
>>>
>>>> CAUTION: This email comes from a non Wind River email account!
>>>>   Do not click links or open attachments unless you recognize the
>>>> sender and know the content is safe.
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni
>>>> <Harish.Sadineni@windriver.com> wrote:
>>>>
>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> On 3/9/2026 4:56 PM, Richard Purdie wrote:
>>>>>
>>>>>
>>>>>> CAUTION: This email comes from a non Wind River email
>>>>>> account!
>>>>>> Do not click links or open attachments unless you recognize
>>>>>> the sender and know the content is safe.
>>>>>>
>>>>>> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via
>>>>>> lists.openembedded.org wrote:
>>>>>>
>>>>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>>>>
>>>>>>> Conditionally add 'clang-native', 'rust-native' and
>>>>>>> 'bindgen-cli-native' to 'DEPENDS'
>>>>>>> when Kernel Rust Support is enabled.
>>>>>>>
>>>>>>> These tools are required for building Rust-enabled kernels
>>>>>>> and for
>>>>>>> generating Rust FFI bindings via bindgen during the kernel
>>>>>>> build.
>>>>>>>
>>>>>>> This ensures the additional dependencies are only pulled in
>>>>>>> when
>>>>>>> Rust support is explicitly enabled, avoiding unnecessary
>>>>>>> native
>>>>>>> dependencies for non-Rust kernel builds.
>>>>>>>
>>>>>>> Signed-off-by: Harish Sadineni
>>>>>>> <Harish.Sadineni@windriver.com>
>>>>>>> ---
>>>>>>>   meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>>>>>>>   1 file changed, 3 insertions(+)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>>>>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>>>>>>> index 4d0a726bb6..b7961bbcdf 100644
>>>>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>>>>>> @@ -76,11 +76,14 @@ do_install:append(){
>>>>>>>   KERNEL_FEATURES:append:qemuall =3D " features/kernel-
>>>>>>> sample/kernel-sample.scc"
>>>>>>>
>>>>>>>   KERNEL_DEBUG ?=3D ""
>>>>>>> +KERNEL_RUST_SUPPORT ?=3D ""
>>>>>>>   # These used to be version specific, but are now common
>>>>>>> dependencies.  New
>>>>>>>   # tools / dependencies will continue to be added in
>>>>>>> version specific recipes.
>>>>>>>   DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86",
>>>>>>> "arm64", "powerpc" ], "elfutils-native", "", d)}'
>>>>>>>   DEPENDS +=3D "openssl-native util-linux-native"
>>>>>>>   DEPENDS +=3D "gmp-native libmpc-native"
>>>>>>> +RUST_KERNEL_DEPENDS ?=3D
>>>>>>> "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True',
>>>>>>> 'clang-native rust-native bindgen-cli-native', '', d)}"
>>>>>>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>>>>>>>
>>>>>>>   # Some options depend on CONFIG_PAHOLE_VERSION, so need to
>>>>>>> make pahole-native available before do_kernel_configme
>>>>>>>   do_kernel_configme[depends] +=3D
>>>>>>> '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-
>>>>>>> native:do_populate_sysroot", "", d)}'
>>>>>>>
>>>>>> I thought we were going to try and use KERNEL_FEATURES for
>>>>>> this?
>>>>>>
>>>>>   Hi Richard,
>>>>>
>>>>>   I have tried this but i got circular dependency error with
>>>>> KERNEL_FEATURES. So, I opted using variable
>>>>> KERNEL_RUST_SUPPORT.
>>>>>
>>>>>
>>>>
>>>>
>>>>
>>>>
>>>> I'm curious about that. Can you share the details ? (diff and the
>>>> bitbake error)
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>   As discussed previously, I attempted to use the following in
>>> meta/recipes-kernel/linux/linux-yocto_6.18.bb:
>>>
>>>   KERNEL_FEATURES:append =3D " ${@bb.utils.contains('KERNEL_FEATURES'=
,
>>> 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
>>>
>>>   This resulted in a BitBake variable dependency chain failure. The
>>> issue occurs because the expression is trying to read
>>> KERNEL_FEATURES
>>>   while simultaneously modifying KERNEL_FEATURES, which creates a
>>> circular dependency.
>>>
>>
>> Yes, that's clearly not going to work, but that wouldn't have been
>> the suggestion.
>>
>> Wasn't Richard asking about setting the RUST_KERNEL_DEPENDS based on
>> the KERNEL_FEATURES containing rust.scc ?
We understood like Richard suggestion is to use KERNEL_FEATURES=20
everywhere instead of KERNEL_RUST_SUPPORT variable.

We can use the KERNEL_RUST_SUPPORT variable to append rust.scc to=20
KERNEL_FEATURES and then we could make other checks depends on=20
KERNEL_FEATURES.
But as the other recipes (make-mod-scripts, kernel-devsrc,=20
module-rust.bbclass) do not know about KERNEL_FEATURES, so again we've=20
to depend on KERNEL_RUST_SUPPORT Variable.

So, for consistency we used everywhere KERNEL_RUST_SUPPORT.

Is this implementation ok or we should switch to use -
KERNEL_FEATURES in kernel recipes and
KERNEL_RUST_SUPPORT in other recipes.

Thanks,
Harish
> Yes, along with maybe with a tweak to the KERNEL_FEATURES code which
> could expand " rust " or maybe " kernel-rust "in KERNEL_FEATURES into
> "features/kernel-rust/kernel-rust.scc" too just so there was a nice
> short cut for it?
>
> Cheers,
>
> Richard
>
>
>

