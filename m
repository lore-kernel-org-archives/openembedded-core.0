Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8F2C282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:23:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16045.1741875774137698255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5167e39e1b=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DCv2ce017975
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:22:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0ga235y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:22:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRUCCZVTWfh7GlEeV0rZFiEIXTUphAGcuqPAfncOhCs+EcA1htrhb8qVqzB2K8fG/PdpkrD5nfnWEqnZ+WK7IMO5Ic2ZE/pees1rN/5mc2OKxHPXu8l5Nsckb8iBIR+Onk8UAa078n74chMeH/dzycVVWzqXfSy+FgDgzvCMtfU2OfkYsS/5201wVlPbTmT4clR+as5FYWzmzAdinjVXXP6YdBvM/K9KF3NuCzFLhEOqXyrSBIVu/phc2lTE5k7CtIipJmTfYql2cTaXcg0Ca0IW/NSNgCMKqArnIBX6V+oHTiYtIMQeshjFFvzoKn5bUWAmjQypkle4mDin67FkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixu/hcQLgfrMZyqE+2qE17EAQyvjPmIcOUr/rerp6jA=;
 b=Ce7+9WiyqH6YPnfV7ypvTAmomvmwX3+3SX06vIvx4v8v5jsRB0a9C8mDKukpU++0Uly7BNQqFVYRn6OiMd1NKForWdlKWtlaZxA30OVQh1Yk4BPiHfaDvumQblYDvFxHR2aHt8r0RIInq6BtJZVYsbiqGU68KSz8bmQJAqRjMmhNcRM+zwr6ydmwXPVJE6pZm/RekMHc/XSZ/CDirE5Mp/ZBsHwwBb6VGmZm29f+ohR2epbkDUnk+iZpcGHV9ReSQeaNLbSirxSzyUz6jqi3WYgTApuREPeLGhoD7oux1/MDzO7lL4ABY+/L0d8g+oPj6PGCF6t1d4FkCL95CftBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 14:22:47 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%5]) with mapi id 15.20.8511.025; Thu, 13 Mar 2025
 14:22:47 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?q?=5BOE-core=5D=5Bkirkstone=5D=5BPATCH=C2=A0=5D=20mpg123=3A=20fix=20CVE-2024-10573?=
Date: Thu, 13 Mar 2025 22:22:35 +0800
Message-ID: <20250313142236.1221114-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:404:a::31) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: efea5a62-1c45-43cc-ec85-08dd623a86e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|10070799003|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZG13eWpEU0tDdnpqN1EzNGZNUlhKZEJMVUZCQUtuSVZnR2JWajFRT05mMmt1?=
 =?utf-8?B?b3FNNDZteTZ1WjBJeGQzaHFibGFsTEF6NkIyTm9Rdjd0c0ZzbVczRURJdzh5?=
 =?utf-8?B?b2VRUU14RVBCWW1aMWZJR0FYZlFTVWI3Mk9RVElHNVRhd0NFVUlhV3BDNy96?=
 =?utf-8?B?VWRrVUFpT2J5aXVNU3o2QllLK3FmK3k2aS9ZcmgzTzBrdTAremtjK3Rocy9Z?=
 =?utf-8?B?OUJ0Nml2UXY2UzNlajNzbW9FM0k4eEo5RWJSRGNIUFZSN3JIQ0NxQlpqWnRJ?=
 =?utf-8?B?bHVxZFZMbVQrU250Q1BRTUZEbld0RGEvRjNrUCtPU3VYbzVnTjVFQ3F0OTFs?=
 =?utf-8?B?WWNMUE1CY3A3cjlsZHBJWUIxQWpNRVR2N0Y3MkRsNnZyTGk2R0RKRnp3OVNz?=
 =?utf-8?B?SXZNaTNwZ2hnSXFoOUZmeTl4WC9BQTNNUVZtZzl3YkU3Q2RsWURKeTI1OFZY?=
 =?utf-8?B?c01raW8vZFhzZnBqM0Q4Y0tNNGZWREFLcGtMSjZlZWRnRm1YckQrSUxVMFVG?=
 =?utf-8?B?N0lXUCs1UDQ2YWZ6cUxzMG1OdUppMjJYaTNZbTk4bXBVVEdtVVo3dkdhcUxE?=
 =?utf-8?B?MGRlN2NJR3NWTmw4YmgwUEp5MWFrby9EZUlMQ0xFQ2RyRm04WUZXZ2ZUZUt3?=
 =?utf-8?B?SEVETE1TSTJ5cU1VWkp2RDJ3cUlBM0hpYzM3ZWZQWjFJd1plenk0dEg2d3Js?=
 =?utf-8?B?ekk3aURMK2NPZUVadm9TWTA5WitlVkFMWEtNMEg1WDc5aWtOWDdFS0dxTnJk?=
 =?utf-8?B?UjU3bE5LaDRROFRtNjR2TFpBTXBGajEwbXdHVGdldFQ4ZTE4ekdXNm91RFNp?=
 =?utf-8?B?NGZ1TU9mUXQ5bVNKaXdmcnFua2pJeGlScEtQcTA2UVlnUmMvckFDdXFKQm8y?=
 =?utf-8?B?TUZVdERNZU5kRzRUYzFVS1JYMUYyam45WWtORWo2K0RHM0hLOWdabXlzVURa?=
 =?utf-8?B?cVJoZVNCSXh6Njh3d3dpanhwcjJXK2R4Y0hKUlhvVmZYQ3V4ZkFpTjVqZmU1?=
 =?utf-8?B?d2t2azd6aURQM2tMRnlCZnBpQTN5UTEyQk9oRStXN1NMZVI0NUdRc290T1Iv?=
 =?utf-8?B?RERRQzhOWE56MTlzbTNtMjZCcldCcjNBYURTRXFmQW1ySVZrRHV1NEVTZml4?=
 =?utf-8?B?RHZQR2Z5QzByUjVrVWowa0laMTVsZkZscHZPdTN2U3VnNmhoazRIQW4xclM4?=
 =?utf-8?B?K3BOZlhZSjAyZjBTZzlzK0FqMDN1UFArL2k1L1BlYnZEdTJZUUZLck1DMWJa?=
 =?utf-8?B?a2ZVVzAyOVVqZmJpalh2RmtnR25hU1pVQ3BHV0UvdGk2Y3FCOFVDa2J0cnl0?=
 =?utf-8?B?R3hWL2tKb3NpVC9ZU3FLMWxwWVRjT1hOOGhRc2VJclJMTmlLcFYwSzhxSnk3?=
 =?utf-8?B?QmJPOU1LeWNFOHRhN2NpRlN6MXNucURvNThFSjJrdDNqMWZZZUU5ZGRFeDR2?=
 =?utf-8?B?eVp2RU5iazlwTHNrSnhkaU04QkE5eWhMKzVISHpCL01QaGo0QytETWJrNlZ3?=
 =?utf-8?B?MEp5cG9oWFVhWlNvbWdOZVQzWTBwN3JmV2xYSXR5TnlkUlZGbEV3Z3JLLy9h?=
 =?utf-8?B?bWFHQlRSNERzRVdONzFlMEZtRHhIVDJzVTNLS3BxaFA5d3c4N2prN1pyWHF2?=
 =?utf-8?B?SEJ0empMazVnQmFPdC9wME5NRzVVSWNHUlNZNTRaMnA1WWpKTlZRUUNJM1Av?=
 =?utf-8?B?RHBteVdOUks0V1N5dEpyTEVOL2R6Rys3UFFQSUl0cCs2UnVQUXVBUitRNnB2?=
 =?utf-8?Q?cOSEa7nqiqDFDYkhUszKCnR96fmNeofvpz5xQeV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(10070799003)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZmVhYXdaZGlQK085RmpHZ2VyVjlUUDJIWVBvZEFjUFVtUkF0WER2NWJoZ0M1?=
 =?utf-8?B?NnRCb1lObENSMVltSXBnbld4ZkFRRXo5d24yNzZjdWthcW1SM09CL1o4aHEy?=
 =?utf-8?B?NmsrU205dm5GNC92aTUwdEhLK1ZMUks3dGR3MlVnNk9xNGVFS1JsbHptTDVV?=
 =?utf-8?B?anpzZjB5ZVo3SWg4V3NTZnNwaTNWYjR0UFRFb0JXd0djNWpGWEM2aVVSaHBu?=
 =?utf-8?B?cmV3YTFRY0pZcnk0b25zSlBsa0VaMmNIL000OWFCWGovbHZSNEhoMlNVVjdv?=
 =?utf-8?B?NGxhbnNKTE11SXlHUkpCZkdvMndIaFRpUHZYOU1DT0FYQVVFTTJWbGtVUEdt?=
 =?utf-8?B?aDFOSXlQZTdnMytUd2grNS93SVJDdDdZTXFYU24vNmFybzdBUUtveU9zWlBv?=
 =?utf-8?B?VWlkblV5M1dBM2J4eG5RSXE3ektIbER5UndCRWxPTXQzYnVCOGR6OGpYeFB5?=
 =?utf-8?B?SDE2ZEY3bG1lRWNLVzFva21yQmdFV0hPdEorU3YyTENwVzFhWmhUMW5JQmk5?=
 =?utf-8?B?eUw4VW9iaXpSWjhvbjZYZHdzaE5nbURoNmhPSFRtNFFLdlBKeEMyRys2U1dS?=
 =?utf-8?B?YXpZOUxwMkJSUGkvUHZuNTdmT2ZqaHpCMkt0WlpOdUkrWWRUSDZRa2Vyd0hK?=
 =?utf-8?B?aWhoK3hyRTNraXVxZk1xU21lOFU0NFVOSEhFQ1NaM2EwNjhMTWdjU1JTa3dJ?=
 =?utf-8?B?VGRCNHdCOU9aVUVWRlREUzdoMDA1S042OEtJckNDZlJFSVVXc3E3clVUNnNH?=
 =?utf-8?B?OUFTRmlLQVZmVUJ4NzRSVnpuZGYvTHVVQzdSeUM5Uit3TnZ1blk4TlJlQ1Ey?=
 =?utf-8?B?Q0xPL1FlYmJHUEtHQ29oSTNzRm5pZHZQYWVKWktjRVBHOUhnZGNFUFNBWk9C?=
 =?utf-8?B?MC9uMlRBSHdtV3p3SG1SU21PWWE5MDNPN3M1V1R6cDllZkNjQWhzWVBIRTU3?=
 =?utf-8?B?KzlqWVZMd2MzY2dWNUxCR3VCcndaMVNYcDAyWXBoMWxGc0E4dDdHeDNRTEw5?=
 =?utf-8?B?WkkreFROaFJ2NFNRaElwSjJqZjRJMXFnTjVjMTIxakVDZmI3Sk9kZHNRK1NE?=
 =?utf-8?B?MDQwanRGMENIZnIvYkZJcncvL01CVmlFZnAzbjJoK1cwZXpMaUwvWlZwRkds?=
 =?utf-8?B?OE53eXhCQndhOWRoSEVTaTVLekt0TVp3TndMM0tXaHc4a1UvWE5UUzB5VzFY?=
 =?utf-8?B?MkVVdW0wYWtkUFpaNVlpTlg2Rkt5SmhQeWpGSStza3hVa21SVzg0ZVJJWmFO?=
 =?utf-8?B?d2tkT0RXdE5yVitvaittRXpjRmU3Q2UzU2Z4ZVlCck9SaTdUMEV6VnI3b0Vw?=
 =?utf-8?B?OU1iTXkxUWc0VzN3WE9SUnJTRWFTRS9Uc0N0dm85RFg0ZGJ1Yk1CeDhPQWpC?=
 =?utf-8?B?Zk56TnpSQnVpSEpnYkU3NzNOUHBpUVRSenZTT3pqQ3BPci93blVwN2NWSG1U?=
 =?utf-8?B?WFVlNUpCaThyUCt6ekUzbmpMMjFLbndyOVVkb0hyWG0wTjEzQWJEaEMxUTQ3?=
 =?utf-8?B?ZFdOOHVHcFI1UW1jTk1BdXI2Ym1hdkZkbTBqdWw3UDU1OUJjZzZsdy8yTG01?=
 =?utf-8?B?eUV3YnJmL1dZOVMyWmN0MkpCR0Ridk9IcnZnWHUxNE9haUU1eHdvUVcveEE0?=
 =?utf-8?B?ZS8reTBVYThWb0RORFlWS1dJRnRETFpRbHZBelpSVW9oQmhzV3NzZ245R21Q?=
 =?utf-8?B?OUtwZHB5b0xlV0hETmo5OHJoajV4UFFYNlNsUG5yQzcyRG54Vk5FMnhqc0kw?=
 =?utf-8?B?STlNOTFtb0owN1FXYW9DdTFJRkRFaEh1aG5haVVST00zb0lvSmtOOHB0NGgw?=
 =?utf-8?B?dG9WRTk4R1pXVVgxRHcra2pQOFowbC9HLy9ZVFFFVjNmRUhzaFlzWUpycFlT?=
 =?utf-8?B?LzVsL3FISWFZa1hubWZSZG44UFVPV0RXazNlaXoyKy80K0djRnhIZWhUN0Zw?=
 =?utf-8?B?WkhOb0tZak40TjZxVm16bWoyWEVFUXJ1TnB4bVh0L25jZmlOUVhqNHVsV3ZG?=
 =?utf-8?B?RWcvalAzUmFieVZxMmpEakdYdDE2b1Y3QVg3anZBVHhrTVQ3bmNsRXViWG4v?=
 =?utf-8?B?WTVNYWxoSWIwVzYrMmRsMGFoRXhzMEdtTDhSWThpalpqODZRY1Q4Vmp4TjZo?=
 =?utf-8?B?UHZQdXZMRGZCTnVCcXdsUWFiRXFpb1YrWFgzaENGUG1XSk9uWkg3N1E0OEps?=
 =?utf-8?B?NlFna0RLVFhNZFRWUnF2OENPQjlsbVhVSCtNa21mcFRsTFNDQVpvL1lqSmVV?=
 =?utf-8?B?bHJadVA0T2NsQlFGSk80cXA5TzZ3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efea5a62-1c45-43cc-ec85-08dd623a86e7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 14:22:47.1260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDyrKqN17XbQJaQ4Q0uxFMk93ywEyzuUzolmt6LxKluCOhz31PilfLYMZijhrNQCng395tQg2+pyWjtJeMcowMftR9I9nu/tlVkm5AkRzAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
X-Proofpoint-GUID: xKytUkPSUv0mhuJ1zXuI9lTFxmHencwK
X-Proofpoint-ORIG-GUID: xKytUkPSUv0mhuJ1zXuI9lTFxmHencwK
X-Authority-Analysis: v=2.4 cv=ZrXtK87G c=1 sm=1 tr=0 ts=67d2ea3d cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=5KLPUuaC_9wA:10 a=H5OGdu5hBBwA:10 a=PYnjg3YJAAAA:8 a=zlTb_1xVAAAA:8 a=t7CeM3EgAAAA:8 a=MrKMYuwgAAAA:8 a=bLpGpgTByA6iAPrWe04A:9 a=FDxig3KYsbsUfCh4:21 a=QEXdDO2ut3YA:10 a=ntYVSH5SEK9JljX4K8Km:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=vQcbazIeAi3PjP216lLL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503130112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212776

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-10573:
An out-of-bounds write flaw was found in mpg123 when handling crafted streams.
When decoding PCM, the libmpg123 may write past the end of a heap-located buffer.
Consequently, heap corruption may happen, and arbitrary code execution is not
discarded. The complexity required to exploit this flaw is considered high as
the payload must be validated by the MPEG decoder and the PCM synth before execution.
Additionally, to successfully execute the attack, the user must scan through the
stream, making web live stream content (such as web radios) a very unlikely attack vector.

Reference: [https://nvd.nist.gov/vuln/detail/CVE-2024-10573]

Upstream patches: [svn://scm.orgis.org/mpg123/branches/1.31-fixes@5442]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../mpg123/mpg123/CVE-2024-10573.patch        | 978 ++++++++++++++++++
 .../mpg123/mpg123_1.29.3.bb                   |   4 +-
 2 files changed, 981 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/mpg123/mpg123/CVE-2024-10573.patch

diff --git a/meta/recipes-multimedia/mpg123/mpg123/CVE-2024-10573.patch b/meta/recipes-multimedia/mpg123/mpg123/CVE-2024-10573.patch
new file mode 100644
index 0000000000..ef7b84027d
--- /dev/null
+++ b/meta/recipes-multimedia/mpg123/mpg123/CVE-2024-10573.patch
@@ -0,0 +1,978 @@
+From 89d1e6cfbfa5f34a4ba706cad1034e6ad7373726 Mon Sep 17 00:00:00 2001
+From: thor <thor@35dc7657-300d-0410-a2e5-dc2837fedb53>
+Date: Sat, 26 Oct 2024 16:23:36 +0000
+Subject: [PATCH] backport Frankenstein's Monster fix
+
+git-svn-id: svn://scm.orgis.org/mpg123/branches/1.31-fixes@5442 35dc7657-300d-0410-a2e5-dc2837fedb53
+
+CVE: CVE-2024-10573
+Upstream-Status: Backport [svn://scm.orgis.org/mpg123/branches/1.31-fixes@5442]
+
+The original patch is adjusted to fit for the current version.
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libmpg123/frame.c     |  15 +--
+ src/libmpg123/frame.h     |  46 +++++---
+ src/libmpg123/layer1.c    |   2 +-
+ src/libmpg123/layer2.c    |   6 +-
+ src/libmpg123/layer3.c    |  42 +++----
+ src/libmpg123/libmpg123.c |  22 ++--
+ src/libmpg123/parse.c     | 241 ++++++++++++++++++++++----------------
+ 7 files changed, 211 insertions(+), 163 deletions(-)
+
+diff --git a/src/libmpg123/frame.c b/src/libmpg123/frame.c
+index b14908f2..20d56931 100644
+--- a/src/libmpg123/frame.c
++++ b/src/libmpg123/frame.c
+@@ -515,6 +515,7 @@ static void frame_fixed_reset(mpg123_handle *fr)
+ {
+ 	frame_icy_reset(fr);
+ 	open_bad(fr);
++	memset(&(fr->hdr), 0, sizeof(fr->hdr));
+ 	fr->to_decode = FALSE;
+ 	fr->to_ignore = FALSE;
+ 	fr->metaflags = 0;
+@@ -528,15 +529,12 @@ static void frame_fixed_reset(mpg123_handle *fr)
+ 	fr->clip = 0;
+ 	fr->oldhead = 0;
+ 	fr->firsthead = 0;
+-	fr->lay = 0;
+ 	fr->vbr = MPG123_CBR;
+ 	fr->abr_rate = 0;
+ 	fr->track_frames = 0;
+ 	fr->track_samples = -1;
+-	fr->framesize=0; 
+ 	fr->mean_frames = 0;
+ 	fr->mean_framesize = 0;
+-	fr->freesize = 0;
+ 	fr->lastscale = -1;
+ 	fr->rva.level[0] = -1;
+ 	fr->rva.level[1] = -1;
+@@ -571,8 +569,7 @@ static void frame_fixed_reset(mpg123_handle *fr)
+ 	fr->icy.next = 0;
+ #endif
+ 	fr->halfphase = 0; /* here or indeed only on first-time init? */
+-	fr->error_protection = 0;
+-	fr->freeformat_framesize = fr->p.freeformat_framesize;
++	fr->hdr.freeformat_framesize = fr->p.freeformat_framesize;
+ 	fr->enc_delay = -1;
+ 	fr->enc_padding = -1;
+ 	memset(fr->id3buf, 0, sizeof(fr->id3buf));
+@@ -637,7 +634,7 @@ int attribute_align_arg mpg123_framedata(mpg123_handle *mh, unsigned long *heade
+ 
+ 	if(header    != NULL) *header    = mh->oldhead;
+ 	if(bodydata  != NULL) *bodydata  = mh->bsbuf;
+-	if(bodybytes != NULL) *bodybytes = mh->framesize;
++	if(bodybytes != NULL) *bodybytes = mh->hdr.framesize;
+ 
+ 	return MPG123_OK;
+ }
+@@ -906,9 +903,9 @@ static off_t ignoreframe(mpg123_handle *fr)
+ {
+ 	off_t preshift = fr->p.preframes;
+ 	/* Layer 3 _really_ needs at least one frame before. */
+-	if(fr->lay==3 && preshift < 1) preshift = 1;
++	if(fr->hdr.lay==3 && preshift < 1) preshift = 1;
+ 	/* Layer 1 & 2 reall do not need more than 2. */
+-	if(fr->lay!=3 && preshift > 2) preshift = 2;
++	if(fr->hdr.lay!=3 && preshift > 2) preshift = 2;
+ 
+ 	return fr->firstframe - preshift;
+ }
+@@ -953,7 +950,7 @@ void frame_set_frameseek(mpg123_handle *fr, off_t fe)
+ void frame_skip(mpg123_handle *fr)
+ {
+ #ifndef NO_LAYER3
+-	if(fr->lay == 3) set_pointer(fr, 1, 512);
++	if(fr->hdr.lay == 3) set_pointer(fr, 1, 512);
+ #endif
+ }
+ 
+diff --git a/src/libmpg123/frame.h b/src/libmpg123/frame.h
+index e34ea16f..fcdae8a8 100644
+--- a/src/libmpg123/frame.h
++++ b/src/libmpg123/frame.h
+@@ -96,6 +96,33 @@ enum frame_state_flags
+ 	,FRAME_DECODER_LIVE  = 0x8  /**<     1000 Decoder can be used. */
+ };
+ 
++// separate frame header structure for safe decoding of headers without
++// modifying the main frame struct before we are sure that we can read a
++// frame into it
++struct frame_header
++{
++	int lay;
++	// lots of flags that could share storage, should reform that
++	int lsf; /* 0: MPEG 1.0; 1: MPEG 2.0/2.5 -- both used as bool and array index! */
++	int mpeg25;
++	int error_protection;
++	int bitrate_index;
++	int sampling_frequency;
++	int padding;
++	int extension;
++	int mode;
++	int mode_ext;
++	int copyright;
++	int original;
++	int emphasis;
++	// Even 16 bit int is enough for MAXFRAMESIZE
++	int framesize; /* computed framesize */
++	int freeformat;
++	int freeformat_framesize;
++	// Derived from header and checked against the above.
++	int ssize;
++};
++
+ /* There is a lot to condense here... many ints can be merged as flags; though the main space is still consumed by buffers. */
+ struct mpg123_handle_struct
+ {
+@@ -199,26 +226,12 @@ struct mpg123_handle_struct
+ 	int single;
+ 	int II_sblimit;
+ 	int down_sample_sblimit;
+-	int lsf; /* 0: MPEG 1.0; 1: MPEG 2.0/2.5 -- both used as bool and array index! */
+ 	/* Many flags in disguise as integers... wasting bytes. */
+-	int mpeg25;
+ 	int down_sample;
+ 	int header_change;
+-	int lay;
++	struct frame_header hdr;
+ 	long spf; /* cached count of samples per frame */
+ 	int (*do_layer)(mpg123_handle *);
+-	int error_protection;
+-	int bitrate_index;
+-	int sampling_frequency;
+-	int padding;
+-	int extension;
+-	int mode;
+-	int mode_ext;
+-	int copyright;
+-	int original;
+-	int emphasis;
+-	int framesize; /* computed framesize */
+-	int freesize;  /* free format frame size */
+ 	enum mpg123_vbr vbr; /* 1 if variable bitrate was detected */
+ 	off_t num; /* frame offset ... */
+ 	off_t input_offset; /* byte offset of this frame in input stream */
+@@ -227,8 +240,6 @@ struct mpg123_handle_struct
+ 	int state_flags;
+ 	char silent_resync; /* Do not complain for the next n resyncs. */
+ 	unsigned char* xing_toc; /* The seek TOC from Xing header. */
+-	int freeformat;
+-	long freeformat_framesize;
+ 
+ 	/* bitstream info; bsi */
+ 	int bitindex;
+@@ -255,7 +266,6 @@ struct mpg123_handle_struct
+ 	double mean_framesize;
+ 	off_t mean_frames;
+ 	int fsizeold;
+-	int ssize;
+ 	unsigned int bitreservoir;
+ 	unsigned char bsspace[2][MAXFRAMESIZE+512+4]; /* MAXFRAMESIZE */
+ 	unsigned char *bsbuf;
+diff --git a/src/libmpg123/layer1.c b/src/libmpg123/layer1.c
+index c5bfc75d..048611e1 100644
+--- a/src/libmpg123/layer1.c
++++ b/src/libmpg123/layer1.c
+@@ -217,7 +217,7 @@ int do_layer1(mpg123_handle *fr)
+ 	real (*fraction)[SBLIMIT] = fr->layer1.fraction; /* fraction[2][SBLIMIT] */
+ 	int single = fr->single;
+ 
+-	fr->jsbound = (fr->mode == MPG_MD_JOINT_STEREO) ? (fr->mode_ext<<2)+4 : 32;
++	fr->jsbound = (fr->hdr.mode == MPG_MD_JOINT_STEREO) ? (fr->hdr.mode_ext<<2)+4 : 32;
+ 
+ 	if(stereo == 1 || single == SINGLE_MIX) /* I don't see mixing handled here */
+ 	single = SINGLE_LEFT;
+diff --git a/src/libmpg123/layer2.c b/src/libmpg123/layer2.c
+index 0f2071b5..910f0bf9 100644
+--- a/src/libmpg123/layer2.c
++++ b/src/libmpg123/layer2.c
+@@ -313,10 +313,10 @@ static void II_select_table(mpg123_handle *fr)
+ 	const struct al_table *tables[5] = { alloc_0, alloc_1, alloc_2, alloc_3 , alloc_4 };
+ 	const int sblims[5] = { 27 , 30 , 8, 12 , 30 };
+ 
+-	if(fr->sampling_frequency >= 3)	/* Or equivalent: (fr->lsf == 1) */
++	if(fr->hdr.sampling_frequency >= 3)	/* Or equivalent: (fr->lsf == 1) */
+ 	table = 4;
+ 	else
+-	table = translate[fr->sampling_frequency][2-fr->stereo][fr->bitrate_index];
++	table = translate[fr->hdr.sampling_frequency][2-fr->stereo][fr->hdr.bitrate_index];
+ 
+ 	sblim = sblims[table];
+ 	fr->alloc      = tables[table];
+@@ -337,7 +337,7 @@ int do_layer2(mpg123_handle *fr)
+ 	int single = fr->single;
+ 
+ 	II_select_table(fr);
+-	fr->jsbound = (fr->mode == MPG_MD_JOINT_STEREO) ? (fr->mode_ext<<2)+4 : fr->II_sblimit;
++	fr->jsbound = (fr->hdr.mode == MPG_MD_JOINT_STEREO) ? (fr->hdr.mode_ext<<2)+4 : fr->II_sblimit;
+ 
+ 	if(fr->jsbound > fr->II_sblimit)
+ 	{
+diff --git a/src/libmpg123/layer3.c b/src/libmpg123/layer3.c
+index a25ef098..83912503 100644
+--- a/src/libmpg123/layer3.c
++++ b/src/libmpg123/layer3.c
+@@ -127,16 +127,16 @@ static int III_get_side_info(mpg123_handle *fr, struct III_sideinfo *si,int ster
+ 	int powdiff = (single == SINGLE_MIX) ? 4 : 0;
+ 
+ 	const int tabs[2][5] = { { 2,9,5,3,4 } , { 1,8,1,2,9 } };
+-	const int *tab = tabs[fr->lsf];
++	const int *tab = tabs[fr->hdr.lsf];
+ 
+ 	{ /* First ensure we got enough bits available. */
+ 		unsigned int needbits = 0;
+ 		needbits += tab[1]; /* main_data_begin */
+ 		needbits += stereo == 1 ? tab[2] : tab[3]; /* private */
+-		if(!fr->lsf)
++		if(!fr->hdr.lsf)
+ 			needbits += stereo*4; /* scfsi */
+ 		/* For each granule for each channel ... */
+-		needbits += tab[0]*stereo*(29+tab[4]+1+22+(!fr->lsf?1:0)+2);
++		needbits += tab[0]*stereo*(29+tab[4]+1+22+(!fr->hdr.lsf?1:0)+2);
+ 		if(fr->bits_avail < needbits) \
+ 		{
+ 			if(NOQUIET)
+@@ -154,7 +154,7 @@ static int III_get_side_info(mpg123_handle *fr, struct III_sideinfo *si,int ster
+ 
+ 		/*  overwrite main_data_begin for the really available bit reservoir */
+ 		backbits(fr, tab[1]);
+-		if(fr->lsf == 0)
++		if(fr->hdr.lsf == 0)
+ 		{
+ 			fr->wordpointer[0] = (unsigned char) (fr->bitreservoir >> 1);
+ 			fr->wordpointer[1] = (unsigned char) ((fr->bitreservoir & 1) << 7);
+@@ -163,7 +163,7 @@ static int III_get_side_info(mpg123_handle *fr, struct III_sideinfo *si,int ster
+ 
+ 		/* zero "side-info" data for a silence-frame
+ 		without touching audio data used as bit reservoir for following frame */
+-		memset(fr->wordpointer+2, 0, fr->ssize-2);
++		memset(fr->wordpointer+2, 0, fr->hdr.ssize-2);
+ 
+ 		/* reread the new bit reservoir offset */
+ 		si->main_data_begin = getbits(fr, tab[1]);
+@@ -171,11 +171,11 @@ static int III_get_side_info(mpg123_handle *fr, struct III_sideinfo *si,int ster
+ 
+ 	/* Keep track of the available data bytes for the bit reservoir.
+ 	   CRC is included in ssize already. */
+-	fr->bitreservoir = fr->bitreservoir + fr->framesize - fr->ssize;
++	fr->bitreservoir = fr->bitreservoir + fr->hdr.framesize - fr->hdr.ssize;
+ 
+ 	/* Limit the reservoir to the max for MPEG 1.0 or 2.x . */
+-	if(fr->bitreservoir > (unsigned int) (fr->lsf == 0 ? 511 : 255))
+-	fr->bitreservoir = (fr->lsf == 0 ? 511 : 255);
++	if(fr->bitreservoir > (unsigned int) (fr->hdr.lsf == 0 ? 511 : 255))
++	fr->bitreservoir = (fr->hdr.lsf == 0 ? 511 : 255);
+ 
+ 	/* Now back into less commented territory. It's code. It works. */
+ 
+@@ -184,7 +184,7 @@ static int III_get_side_info(mpg123_handle *fr, struct III_sideinfo *si,int ster
+ 	else 
+ 	si->private_bits = getbits(fr, tab[3]);
+ 
+-	if(!fr->lsf) for(ch=0; ch<stereo; ch++)
++	if(!fr->hdr.lsf) for(ch=0; ch<stereo; ch++)
+ 	{
+ 		si->ch[ch].gr[0].scfsi = -1;
+ 		si->ch[ch].gr[1].scfsi = getbits(fr, 4);
+@@ -249,14 +249,14 @@ static int III_get_side_info(mpg123_handle *fr, struct III_sideinfo *si,int ster
+ 			}
+ 
+ 			/* region_count/start parameters are implicit in this case. */       
+-			if( (!fr->lsf || (gr_info->block_type == 2)) && !fr->mpeg25)
++			if( (!fr->hdr.lsf || (gr_info->block_type == 2)) && !fr->hdr.mpeg25)
+ 			{
+ 				gr_info->region1start = 36>>1;
+ 				gr_info->region2start = 576>>1;
+ 			}
+ 			else
+ 			{
+-				if(fr->mpeg25)
++				if(fr->hdr.mpeg25)
+ 				{ 
+ 					int r0c,r1c;
+ 					if((gr_info->block_type == 2) && (!gr_info->mixed_block_flag) ) r0c = 5;
+@@ -291,7 +291,7 @@ static int III_get_side_info(mpg123_handle *fr, struct III_sideinfo *si,int ster
+ 			gr_info->block_type = 0;
+ 			gr_info->mixed_block_flag = 0;
+ 		}
+-		if(!fr->lsf) gr_info->preflag = get1bit(fr);
++		if(!fr->hdr.lsf) gr_info->preflag = get1bit(fr);
+ 
+ 		gr_info->scalefac_scale = get1bit(fr);
+ 		gr_info->count1table_select = get1bit(fr);
+@@ -1717,7 +1717,7 @@ int do_layer3(mpg123_handle *fr)
+ 	int stereo = fr->stereo;
+ 	int single = fr->single;
+ 	int ms_stereo,i_stereo;
+-	int sfreq = fr->sampling_frequency;
++	int sfreq = fr->hdr.sampling_frequency;
+ 	int stereo1,granules;
+ 
+ 	if(stereo == 1)
+@@ -1730,14 +1730,14 @@ int do_layer3(mpg123_handle *fr)
+ 	else
+ 	stereo1 = 2;
+ 
+-	if(fr->mode == MPG_MD_JOINT_STEREO)
++	if(fr->hdr.mode == MPG_MD_JOINT_STEREO)
+ 	{
+-		ms_stereo = (fr->mode_ext & 0x2)>>1;
+-		i_stereo  = fr->mode_ext & 0x1;
++		ms_stereo = (fr->hdr.mode_ext & 0x2)>>1;
++		i_stereo  = fr->hdr.mode_ext & 0x1;
+ 	}
+ 	else ms_stereo = i_stereo = 0;
+ 
+-	granules = fr->lsf ? 1 : 2;
++	granules = fr->hdr.lsf ? 1 : 2;
+ 
+ 	/* quick hack to keep the music playing */
+ 	/* after having seen this nasty test file... */
+@@ -1752,7 +1752,7 @@ int do_layer3(mpg123_handle *fr)
+ 	if(fr->pinfo)
+ 	{
+ 		fr->pinfo->maindata = sideinfo.main_data_begin;
+-		fr->pinfo->padding  = fr->padding;
++		fr->pinfo->padding  = fr->hdr.padding;
+ 	}
+ #endif
+ 	for(gr=0;gr<granules;gr++)
+@@ -1773,7 +1773,7 @@ int do_layer3(mpg123_handle *fr)
+ 					,	gr_info->part2_3_length, fr->bits_avail );
+ 				return clip;
+ 			}
+-			if(fr->lsf)
++			if(fr->hdr.lsf)
+ 			part2bits = III_get_scale_factors_2(fr, scalefacs[0],gr_info,0);
+ 			else
+ 			part2bits = III_get_scale_factors_1(fr, scalefacs[0],gr_info,0,gr);
+@@ -1813,7 +1813,7 @@ int do_layer3(mpg123_handle *fr)
+ 		{
+ 			struct gr_info_s *gr_info = &(sideinfo.ch[1].gr[gr]);
+ 			long part2bits;
+-			if(fr->lsf) 
++			if(fr->hdr.lsf) 
+ 			part2bits = III_get_scale_factors_2(fr, scalefacs[1],gr_info,i_stereo);
+ 			else
+ 			part2bits = III_get_scale_factors_1(fr, scalefacs[1],gr_info,1,gr);
+@@ -1863,7 +1863,7 @@ int do_layer3(mpg123_handle *fr)
+ 				}
+ 			}
+ 
+-			if(i_stereo) III_i_stereo(hybridIn,scalefacs[1],gr_info,sfreq,ms_stereo,fr->lsf);
++			if(i_stereo) III_i_stereo(hybridIn,scalefacs[1],gr_info,sfreq,ms_stereo,fr->hdr.lsf);
+ 
+ 			if(ms_stereo || i_stereo || (single == SINGLE_MIX) )
+ 			{
+diff --git a/src/libmpg123/libmpg123.c b/src/libmpg123/libmpg123.c
+index f175a5c9..8ad068b1 100644
+--- a/src/libmpg123/libmpg123.c
++++ b/src/libmpg123/libmpg123.c
+@@ -434,7 +434,7 @@ int attribute_align_arg mpg123_getstate(mpg123_handle *mh, enum mpg123_state key
+ 			theval = mh->enc_padding;
+ 		break;
+ 		case MPG123_DEC_DELAY:
+-			theval = mh->lay == 3 ? GAPLESS_DELAY : -1;
++			theval = mh->hdr.lay == 3 ? GAPLESS_DELAY : -1;
+ 		break;
+ 		default:
+ 			mh->err = MPG123_BAD_KEY;
+@@ -1154,10 +1154,10 @@ static int init_track(mpg123_handle *mh)
+ 	b = init_track(mh); \
+ 	if(b < 0) return b; \
+  \
+-	mi->version = mh->mpeg25 ? MPG123_2_5 : (mh->lsf ? MPG123_2_0 : MPG123_1_0); \
+-	mi->layer = mh->lay; \
++	mi->version = mh->hdr.mpeg25 ? MPG123_2_5 : (mh->hdr.lsf ? MPG123_2_0 : MPG123_1_0); \
++	mi->layer = mh->hdr.lay; \
+ 	mi->rate = frame_freq(mh); \
+-	switch(mh->mode) \
++	switch(mh->hdr.mode) \
+ 	{ \
+ 		case 0: mi->mode = MPG123_M_STEREO; break; \
+ 		case 1: mi->mode = MPG123_M_JOINT;  break; \
+@@ -1165,14 +1165,14 @@ static int init_track(mpg123_handle *mh)
+ 		case 3: mi->mode = MPG123_M_MONO;   break; \
+ 		default: mi->mode = 0; /* Nothing good to do here. */ \
+ 	} \
+-	mi->mode_ext = mh->mode_ext; \
+-	mi->framesize = mh->framesize+4; /* Include header. */ \
++	mi->mode_ext = mh->hdr.mode_ext; \
++	mi->framesize = mh->hdr.framesize+4; /* Include header. */ \
+ 	mi->flags = 0; \
+-	if(mh->error_protection) mi->flags |= MPG123_CRC; \
+-	if(mh->copyright)        mi->flags |= MPG123_COPYRIGHT; \
+-	if(mh->extension)        mi->flags |= MPG123_PRIVATE; \
+-	if(mh->original)         mi->flags |= MPG123_ORIGINAL; \
+-	mi->emphasis = mh->emphasis; \
++	if(mh->hdr.error_protection) mi->flags |= MPG123_CRC; \
++	if(mh->hdr.copyright)        mi->flags |= MPG123_COPYRIGHT; \
++	if(mh->hdr.extension)        mi->flags |= MPG123_PRIVATE; \
++	if(mh->hdr.original)         mi->flags |= MPG123_ORIGINAL; \
++	mi->emphasis = mh->hdr.emphasis; \
+ 	mi->bitrate  = frame_bitrate(mh); \
+ 	mi->abr_rate = mh->abr_rate; \
+ 	mi->vbr = mh->vbr; \
+diff --git a/src/libmpg123/parse.c b/src/libmpg123/parse.c
+index c2efd3dc..a026d6fb 100644
+--- a/src/libmpg123/parse.c
++++ b/src/libmpg123/parse.c
+@@ -63,9 +63,10 @@ static const int tabsel_123[2][3][16] =
+ 
+ static const long freqs[9] = { 44100, 48000, 32000, 22050, 24000, 16000 , 11025 , 12000 , 8000 };
+ 
+-static int decode_header(mpg123_handle *fr,unsigned long newhead, int *freeformat_count);
+-static int skip_junk(mpg123_handle *fr, unsigned long *newheadp, long *headcount);
+-static int do_readahead(mpg123_handle *fr, unsigned long newhead);
++static int decode_header(mpg123_handle *fr, struct frame_header *hdr, unsigned long newhead, int *freeformat_count);
++static void apply_header(mpg123_handle *fr, struct frame_header *hdr);
++static int skip_junk(mpg123_handle *fr, unsigned long *newheadp, long *headcount, struct frame_header *nhdr);
++static int do_readahead(mpg123_handle *fr, struct frame_header *nhdr, unsigned long newhead);
+ static int wetwork(mpg123_handle *fr, unsigned long *newheadp);
+ 
+ /* These two are to be replaced by one function that gives all the frame parameters (for outsiders).*/
+@@ -73,12 +74,12 @@ static int wetwork(mpg123_handle *fr, unsigned long *newheadp);
+ 
+ int frame_bitrate(mpg123_handle *fr)
+ {
+-	return tabsel_123[fr->lsf][fr->lay-1][fr->bitrate_index];
++	return tabsel_123[fr->hdr.lsf][fr->hdr.lay-1][fr->hdr.bitrate_index];
+ }
+ 
+ long frame_freq(mpg123_handle *fr)
+ {
+-	return freqs[fr->sampling_frequency];
++	return freqs[fr->hdr.sampling_frequency];
+ }
+ 
+ /* compiler is smart enought to inline this one or should I really do it as macro...? */
+@@ -141,8 +142,8 @@ static int check_lame_tag(mpg123_handle *fr)
+ 		Mono                                17       9
+ 	*/
+ 	int lame_offset = (fr->stereo == 2)
+-	? (fr->lsf ? 17 : 32)
+-	: (fr->lsf ? 9  : 17);
++	? (fr->hdr.lsf ? 17 : 32)
++	: (fr->hdr.lsf ? 9  : 17);
+ 
+ 	if(fr->p.flags & MPG123_IGNORE_INFOFRAME) goto check_lame_tag_no;
+ 
+@@ -154,7 +155,7 @@ static int check_lame_tag(mpg123_handle *fr)
+ 		for the actual data, have to check if each byte of information is present.
+ 		But: 4 B Info/Xing + 4 B flags is bare minimum.
+ 	*/
+-	if(fr->framesize < lame_offset+8) goto check_lame_tag_no;
++	if(fr->hdr.framesize < lame_offset+8) goto check_lame_tag_no;
+ 
+ 	/* only search for tag when all zero before it (apart from checksum) */
+ 	for(i=2; i < lame_offset; ++i) if(fr->bsbuf[i] != 0) goto check_lame_tag_no;
+@@ -190,7 +191,7 @@ static int check_lame_tag(mpg123_handle *fr)
+ 
+ 	/* From now on, I have to carefully check if the announced data is actually
+ 	   there! I'm always returning 'yes', though.  */
+-	#define check_bytes_left(n) if(fr->framesize < lame_offset+n) \
++	#define check_bytes_left(n) if(fr->hdr.framesize < lame_offset+n) \
+ 		goto check_lame_tag_yes
+ 	if(xing_flags & 1) /* total bitstream frames */
+ 	{
+@@ -443,10 +444,10 @@ static int head_compatible(unsigned long fred, unsigned long bret)
+ static void halfspeed_prepare(mpg123_handle *fr)
+ {
+ 	/* save for repetition */
+-	if(fr->p.halfspeed && fr->lay == 3)
++	if(fr->p.halfspeed && fr->hdr.lay == 3)
+ 	{
+ 		debug("halfspeed - reusing old bsbuf ");
+-		memcpy (fr->ssave, fr->bsbuf, fr->ssize);
++		memcpy (fr->ssave, fr->bsbuf, fr->hdr.ssize);
+ 	}
+ }
+ 
+@@ -462,8 +463,8 @@ static int halfspeed_do(mpg123_handle *fr)
+ 			fr->to_decode = fr->to_ignore = TRUE;
+ 			--fr->halfphase;
+ 			set_pointer(fr, 0, 0);
+-			if(fr->lay == 3) memcpy (fr->bsbuf, fr->ssave, fr->ssize);
+-			if(fr->error_protection) fr->crc = getbits(fr, 16); /* skip crc */
++			if(fr->hdr.lay == 3) memcpy (fr->bsbuf, fr->ssave, fr->hdr.ssize);
++			if(fr->hdr.error_protection) fr->crc = getbits(fr, 16); /* skip crc */
+ 			return 1;
+ 		}
+ 		else
+@@ -496,10 +497,11 @@ int read_frame(mpg123_handle *fr)
+ 	/* TODO: rework this thing */
+ 	int freeformat_count = 0;
+ 	unsigned long newhead;
++	/* Start with current frame header state as copy for roll-back ability. */
++	struct frame_header nhdr = fr->hdr;
+ 	off_t framepos;
+ 	int ret;
+ 	/* stuff that needs resetting if complete frame reading fails */
+-	int oldsize  = fr->framesize;
+ 	int oldphase = fr->halfphase;
+ 
+ 	/* The counter for the search-first-header loop.
+@@ -507,11 +509,12 @@ int read_frame(mpg123_handle *fr)
+ 	   when repeatedly headers are found that do not have valid followup headers. */
+ 	long headcount = 0;
+ 
+-	fr->fsizeold=fr->framesize;       /* for Layer3 */
++	fr->fsizeold=fr->hdr.framesize;       /* for Layer3 */
+ 
+ 	if(halfspeed_do(fr) == 1) return 1;
+ 
+ 	/* From now on, old frame data is tainted by parsing attempts. */
++	// Handling premature effects of decode_header now, more decoupling would be welcome.
+ 	fr->to_decode = fr->to_ignore = FALSE;
+ 
+ 	if( fr->p.flags & MPG123_NO_FRANKENSTEIN &&
+@@ -540,13 +543,13 @@ init_resync:
+ #ifdef SKIP_JUNK
+ 	if(!fr->firsthead && !head_check(newhead))
+ 	{
+-		ret = skip_junk(fr, &newhead, &headcount);
++		ret = skip_junk(fr, &newhead, &headcount, &nhdr);
+ 		JUMP_CONCLUSION(ret);
+ 	}
+ #endif
+ 
+ 	ret = head_check(newhead);
+-	if(ret) ret = decode_header(fr, newhead, &freeformat_count);
++	if(ret) ret = decode_header(fr, &nhdr, newhead, &freeformat_count);
+ 
+ 	JUMP_CONCLUSION(ret); /* That only continues for ret == PARSE_BAD or PARSE_GOOD. */
+ 	if(ret == PARSE_BAD)
+@@ -561,7 +564,7 @@ init_resync:
+ 	{
+ 		ret = fr->p.flags & MPG123_NO_READAHEAD
+ 		?	PARSE_GOOD
+-		:	do_readahead(fr, newhead);
++		:	do_readahead(fr, &nhdr, newhead);
+ 		/* readahead can fail mit NEED_MORE, in which case we must also make the just read header available again for next go */
+ 		if(ret < 0) fr->rd->back_bytes(fr, 4);
+ 		JUMP_CONCLUSION(ret);
+@@ -585,8 +588,8 @@ init_resync:
+ 	{
+ 		unsigned char *newbuf = fr->bsspace[fr->bsnum]+512;
+ 		/* read main data into memory */
+-		debug2("read frame body of %i at %"OFF_P, fr->framesize, framepos+4);
+-		if((ret=fr->rd->read_frame_body(fr,newbuf,fr->framesize))<0)
++		debug2("read frame body of %i at %"PRIi64, nhdr.framesize, framepos+4);
++		if((ret=fr->rd->read_frame_body(fr,newbuf,nhdr.framesize))<0)
+ 		{
+ 			/* if failed: flip back */
+ 			debug1("%s", ret == MPG123_NEED_MORE ? "need more" : "read error");
+@@ -597,6 +600,10 @@ init_resync:
+ 	}
+ 	fr->bsnum = (fr->bsnum + 1) & 1;
+ 
++	// We read the frame body, time to apply the matching header.
++	// Even if erroring out later, the header state needs to match the body.
++	apply_header(fr, &nhdr);
++
+ 	if(!fr->firsthead)
+ 	{
+ 		fr->firsthead = newhead; /* _now_ it's time to store it... the first real header */
+@@ -608,7 +615,7 @@ init_resync:
+ 			fr->audio_start = framepos;
+ 			/* Only check for LAME  tag at beginning of whole stream
+ 			   ... when there indeed is one in between, it's the user's problem. */
+-			if(fr->lay == 3 && check_lame_tag(fr) == 1)
++			if(fr->hdr.lay == 3 && check_lame_tag(fr) == 1)
+ 			{ /* ...in practice, Xing/LAME tags are layer 3 only. */
+ 				if(fr->rd->forget != NULL) fr->rd->forget(fr);
+ 
+@@ -624,6 +631,8 @@ init_resync:
+ 
+ 	set_pointer(fr, 0, 0);
+ 
++	// No use of nhdr from here on. It is fr->hdr now!
++
+ 	/* Question: How bad does the floating point value get with repeated recomputation?
+ 	   Also, considering that we can play the file or parts of many times. */
+ 	if(++fr->mean_frames != 0)
+@@ -632,7 +641,7 @@ init_resync:
+ 	}
+ 	++fr->num; /* 0 for first frame! */
+ 	debug4("Frame %"OFF_P" %08lx %i, next filepos=%"OFF_P, 
+-	(off_p)fr->num, newhead, fr->framesize, (off_p)fr->rd->tell(fr));
++	(off_p)fr->num, newhead, fr->hdr.framesize, (off_p)fr->rd->tell(fr));
+ 	if(!(fr->state_flags & FRAME_FRANKENSTEIN) && (
+ 		(fr->track_frames > 0 && fr->num >= fr->track_frames)
+ #ifdef GAPLESS
+@@ -664,7 +673,7 @@ init_resync:
+ 	if(fr->rd->forget != NULL) fr->rd->forget(fr);
+ 
+ 	fr->to_decode = fr->to_ignore = TRUE;
+-	if(fr->error_protection) fr->crc = getbits(fr, 16); /* skip crc */
++	if(fr->hdr.error_protection) fr->crc = getbits(fr, 16); /* skip crc */
+ 
+ 	/*
+ 		Let's check for header change after deciding that the new one is good
+@@ -711,7 +720,6 @@ read_frame_bad:
+ 
+ 	fr->silent_resync = 0;
+ 	if(fr->err == MPG123_OK) fr->err = MPG123_ERR_READER;
+-	fr->framesize = oldsize;
+ 	fr->halfphase = oldphase;
+ 	/* That return code might be inherited from some feeder action, or reader error. */
+ 	return ret;
+@@ -725,9 +733,9 @@ read_frame_bad:
+  * <0: error codes, possibly from feeder buffer (NEED_MORE)
+  *  PARSE_BAD: cannot get the framesize for some reason and shall silentry try the next possible header (if this is no free format stream after all...)
+  */
+-static int guess_freeformat_framesize(mpg123_handle *fr, unsigned long oldhead)
++static int guess_freeformat_framesize(mpg123_handle *fr, unsigned long oldhead, int *framesize)
+ {
+-	long i;
++	int i;
+ 	int ret;
+ 	unsigned long head;
+ 	if(!(fr->rdat.flags & (READER_SEEKABLE|READER_BUFFERED)))
+@@ -748,7 +756,7 @@ static int guess_freeformat_framesize(mpg123_handle *fr, unsigned long oldhead)
+ 		if((head & HDR_SAMEMASK) == (oldhead & HDR_SAMEMASK))
+ 		{
+ 			fr->rd->back_bytes(fr,i+1);
+-			fr->framesize = i-3;
++			*framesize = i-3;
+ 			return PARSE_GOOD; /* Success! */
+ 		}
+ 	}
+@@ -765,8 +773,13 @@ static int guess_freeformat_framesize(mpg123_handle *fr, unsigned long oldhead)
+  *  0: no valid header
+  * <0: some error
+  * You are required to do a head_check() before calling!
++ *
++ * This now only operates on a frame header struct, not the full frame structure.
++ * The scope is limited to parsing header information and determining the size of
++ * the frame body to read. Everything else belongs into a later stage of applying
++ * header information to the main decoder frame structure.
+  */
+-static int decode_header(mpg123_handle *fr,unsigned long newhead, int *freeformat_count)
++static int decode_header(mpg123_handle *fr, struct frame_header *fh, unsigned long newhead, int *freeformat_count)
+ {
+ #ifdef DEBUG /* Do not waste cycles checking the header twice all the time. */
+ 	if(!head_check(newhead))
+@@ -777,43 +790,42 @@ static int decode_header(mpg123_handle *fr,unsigned long newhead, int *freeforma
+ 	/* For some reason, the layer and sampling freq settings used to be wrapped
+ 	   in a weird conditional including MPG123_NO_RESYNC. What was I thinking?
+ 	   This information has to be consistent. */
+-	fr->lay = 4 - HDR_LAYER_VAL(newhead);
++	fh->lay = 4 - HDR_LAYER_VAL(newhead);
+ 
+ 	if(HDR_VERSION_VAL(newhead) & 0x2)
+ 	{
+-		fr->lsf = (HDR_VERSION_VAL(newhead) & 0x1) ? 0 : 1;
+-		fr->mpeg25 = 0;
+-		fr->sampling_frequency = HDR_SAMPLERATE_VAL(newhead) + (fr->lsf*3);
++		fh->lsf = (HDR_VERSION_VAL(newhead) & 0x1) ? 0 : 1;
++		fh->mpeg25 = 0;
++		fh->sampling_frequency = HDR_SAMPLERATE_VAL(newhead) + (fh->lsf*3);
+ 	}
+ 	else
+ 	{
+-		fr->lsf = 1;
+-		fr->mpeg25 = 1;
+-		fr->sampling_frequency = 6 + HDR_SAMPLERATE_VAL(newhead);
++		fh->lsf = 1;
++		fh->mpeg25 = 1;
++		fh->sampling_frequency = 6 + HDR_SAMPLERATE_VAL(newhead);
+ 	}
+ 
+ 	#ifdef DEBUG
+ 	/* seen a file where this varies (old lame tag without crc, track with crc) */
+-	if((HDR_CRC_VAL(newhead)^0x1) != fr->error_protection) debug("changed crc bit!");
++	if((HDR_CRC_VAL(newhead)^0x1) != fh->error_protection) debug("changed crc bit!");
+ 	#endif
+-	fr->error_protection = HDR_CRC_VAL(newhead)^0x1;
+-	fr->bitrate_index    = HDR_BITRATE_VAL(newhead);
+-	fr->padding          = HDR_PADDING_VAL(newhead);
+-	fr->extension        = HDR_PRIVATE_VAL(newhead);
+-	fr->mode             = HDR_CHANNEL_VAL(newhead);
+-	fr->mode_ext         = HDR_CHANEX_VAL(newhead);
+-	fr->copyright        = HDR_COPYRIGHT_VAL(newhead);
+-	fr->original         = HDR_ORIGINAL_VAL(newhead);
+-	fr->emphasis         = HDR_EMPHASIS_VAL(newhead);
+-	fr->freeformat       = !(newhead & HDR_BITRATE);
+-
+-	fr->stereo = (fr->mode == MPG_MD_MONO) ? 1 : 2;
++	fh->error_protection = HDR_CRC_VAL(newhead)^0x1;
++	fh->bitrate_index    = HDR_BITRATE_VAL(newhead);
++	fh->padding          = HDR_PADDING_VAL(newhead);
++	fh->extension        = HDR_PRIVATE_VAL(newhead);
++	fh->mode             = HDR_CHANNEL_VAL(newhead);
++	fh->mode_ext         = HDR_CHANEX_VAL(newhead);
++	fh->copyright        = HDR_COPYRIGHT_VAL(newhead);
++	fh->original         = HDR_ORIGINAL_VAL(newhead);
++	fh->emphasis         = HDR_EMPHASIS_VAL(newhead);
++	fh->freeformat       = !(newhead & HDR_BITRATE);
++
+ 
+ 	/* we can't use tabsel_123 for freeformat, so trying to guess framesize... */
+-	if(fr->freeformat)
++	if(fh->freeformat)
+ 	{
+ 		/* when we first encounter the frame with freeformat, guess framesize */
+-		if(fr->freeformat_framesize < 0)
++		if(fh->freeformat_framesize < 0)
+ 		{
+ 			int ret;
+ 			if(fr->p.flags & MPG123_NO_READAHEAD)
+@@ -828,12 +840,12 @@ static int decode_header(mpg123_handle *fr,unsigned long newhead, int *freeforma
+ 				if(VERBOSE3) error("You fooled me too often. Refusing to guess free format frame size _again_.");
+ 				return PARSE_BAD;
+ 			}
+-			ret = guess_freeformat_framesize(fr, newhead);
++			ret = guess_freeformat_framesize(fr, newhead, &(fh->framesize));
+ 			if(ret == PARSE_GOOD)
+ 			{
+-				fr->freeformat_framesize = fr->framesize - fr->padding;
++				fh->freeformat_framesize = fh->framesize - fh->padding;
+ 				if(VERBOSE2)
+-				fprintf(stderr, "Note: free format frame size %li\n", fr->freeformat_framesize);
++				fprintf(stderr, "Note: free format frame size %i\n", fh->freeformat_framesize);
+ 			}
+ 			else
+ 			{
+@@ -848,81 +860,110 @@ static int decode_header(mpg123_handle *fr,unsigned long newhead, int *freeforma
+ 		/* freeformat should be CBR, so the same framesize can be used at the 2nd reading or later */
+ 		else
+ 		{
+-			fr->framesize = fr->freeformat_framesize + fr->padding;
++			fh->framesize = fh->freeformat_framesize + fh->padding;
+ 		}
+ 	}
+ 
+-	switch(fr->lay)
++	switch(fh->lay)
+ 	{
+ #ifndef NO_LAYER1
+ 		case 1:
+-			fr->spf = 384;
+-			fr->do_layer = do_layer1;
+-			if(!fr->freeformat)
++			if(!fh->freeformat)
+ 			{
+-				long fs = (long) tabsel_123[fr->lsf][0][fr->bitrate_index] * 12000;
+-				fs /= freqs[fr->sampling_frequency];
+-				fs = ((fs+fr->padding)<<2)-4;
+-				fr->framesize = (int)fs;
++				long fs = (long) tabsel_123[fh->lsf][0][fh->bitrate_index] * 12000;
++				fs /= freqs[fh->sampling_frequency];
++				fs = ((fs+fh->padding)<<2)-4;
++				fh->framesize = (int)fs;
+ 			}
+ 		break;
+ #endif
+ #ifndef NO_LAYER2
+ 		case 2:
+-			fr->spf = 1152;
+-			fr->do_layer = do_layer2;
+-			if(!fr->freeformat)
++			if(!fh->freeformat)
+ 			{
+-				debug2("bitrate index: %i (%i)", fr->bitrate_index, tabsel_123[fr->lsf][1][fr->bitrate_index] );
+-				long fs = (long) tabsel_123[fr->lsf][1][fr->bitrate_index] * 144000;
+-				fs /= freqs[fr->sampling_frequency];
+-				fs += fr->padding - 4;
+-				fr->framesize = (int)fs;
++				debug2("bitrate index: %i (%i)", fh->bitrate_index, tabsel_123[fh->lsf][1][fh->bitrate_index] );
++				long fs = (long) tabsel_123[fh->lsf][1][fh->bitrate_index] * 144000;
++				fs /= freqs[fh->sampling_frequency];
++				fs += fh->padding - 4;
++				fh->framesize = (int)fs;
+ 			}
+ 		break;
+ #endif
+ #ifndef NO_LAYER3
+ 		case 3:
+-			fr->spf = fr->lsf ? 576 : 1152; /* MPEG 2.5 implies LSF.*/
+-			fr->do_layer = do_layer3;
+-			if(fr->lsf)
+-			fr->ssize = (fr->stereo == 1) ? 9 : 17;
++			if(fh->lsf)
++			fh->ssize = (fh->mode == MPG_MD_MONO) ? 9 : 17;
+ 			else
+-			fr->ssize = (fr->stereo == 1) ? 17 : 32;
++			fh->ssize = (fh->mode == MPG_MD_MONO) ? 17 : 32;
+ 
+-			if(fr->error_protection)
+-			fr->ssize += 2;
++			if(fh->error_protection)
++			fh->ssize += 2;
+ 
+-			if(!fr->freeformat)
++			if(!fh->freeformat)
+ 			{
+-				long fs = (long) tabsel_123[fr->lsf][2][fr->bitrate_index] * 144000;
+-				fs /= freqs[fr->sampling_frequency]<<(fr->lsf);
+-				fs += fr->padding - 4;
+-				fr->framesize = fs;
++				long fs = (long) tabsel_123[fh->lsf][2][fh->bitrate_index] * 144000;
++				fs /= freqs[fh->sampling_frequency]<<(fh->lsf);
++				fs += fh->padding - 4;
++				fh->framesize = fs;
+ 			}
+-			if(fr->framesize < fr->ssize)
++			if(fh->framesize < fh->ssize)
+ 			{
+ 				if(NOQUIET)
+ 					error2( "Frame smaller than mandatory side info (%i < %i)!"
+-					,	fr->framesize, fr->ssize );
++					,	fh->framesize, fh->ssize );
+ 				return PARSE_BAD;
+ 			}
+ 		break;
+ #endif 
+ 		default:
+-			if(NOQUIET) error1("Layer type %i not supported in this build!", fr->lay); 
++			if(NOQUIET) error1("Layer type %i not supported in this build!", fh->lay); 
+ 
+ 			return PARSE_BAD;
+ 	}
+-	if (fr->framesize > MAXFRAMESIZE)
++	if (fh->framesize > MAXFRAMESIZE)
+ 	{
+-		if(NOQUIET) error1("Frame size too big: %d", fr->framesize+4-fr->padding);
++		if(NOQUIET) error1("Frame size too big: %d", fh->framesize+4-fh->padding);
+ 
+ 		return PARSE_BAD;
+ 	}
+ 	return PARSE_GOOD;
+ }
+ 
++// Apply decoded header structure to frame struct, including
++// main decoder function pointer.
++static void apply_header(mpg123_handle *fr, struct frame_header *hdr)
++{
++	// copy the whole struct, do some postprocessing
++	fr->hdr = *hdr;
++	fr->stereo = (fr->hdr.mode == MPG_MD_MONO) ? 1 : 2;
++	switch(fr->hdr.lay)
++	{
++#ifndef NO_LAYER1
++		case 1:
++			fr->spf = 384;
++			fr->do_layer = INT123_do_layer1;
++		break;
++#endif
++#ifndef NO_LAYER2
++		case 2:
++			fr->spf = 1152;
++			fr->do_layer = INT123_do_layer2;
++		break;
++#endif
++#ifndef NO_LAYER3
++		case 3:
++			fr->spf = fr->hdr.lsf ? 576 : 1152; /* MPEG 2.5 implies LSF.*/
++			fr->do_layer = INT123_do_layer3;
++#endif 
++		break;
++		default:
++			// No error checking/message here, been done in decode_header().
++			fr->spf = 0;
++			fr->do_layer = NULL;
++	}
++}
++
++
+ /* Prepare for bit reading. Two stages:
+   0. Layers 1 and 2, side info for layer 3
+   1. Second call for possible bit reservoir for layer 3 part 2,3.
+@@ -934,26 +975,26 @@ static int decode_header(mpg123_handle *fr,unsigned long newhead, int *freeforma
+ void set_pointer(mpg123_handle *fr, int part2, long backstep)
+ {
+ 	fr->bitindex = 0;
+-	if(fr->lay == 3)
++	if(fr->hdr.lay == 3)
+ 	{
+ 		if(part2)
+ 		{
+-			fr->wordpointer = fr->bsbuf + fr->ssize - backstep;
++			fr->wordpointer = fr->bsbuf + fr->hdr.ssize - backstep;
+ 			if(backstep)
+ 				memcpy( fr->wordpointer, fr->bsbufold+fr->fsizeold-backstep
+ 				,	backstep );
+-			fr->bits_avail = (long)(fr->framesize - fr->ssize + backstep)*8;
++			fr->bits_avail = (long)(fr->hdr.framesize - fr->hdr.ssize + backstep)*8;
+ 		}
+ 		else
+ 		{
+ 			fr->wordpointer = fr->bsbuf;
+-			fr->bits_avail  = fr->ssize*8;
++			fr->bits_avail  = fr->hdr.ssize*8;
+ 		}
+ 	}
+ 	else
+ 	{
+ 		fr->wordpointer = fr->bsbuf;
+-		fr->bits_avail  = fr->framesize*8;
++		fr->bits_avail  = fr->hdr.framesize*8;
+ 	}
+ }
+ 
+@@ -961,7 +1002,7 @@ void set_pointer(mpg123_handle *fr, int part2, long backstep)
+ 
+ double compute_bpf(mpg123_handle *fr)
+ {
+-	return (fr->framesize > 0) ? fr->framesize + 4.0 : 1.0;
++	return (fr->hdr.framesize > 0) ? fr->hdr.framesize + 4.0 : 1.0;
+ }
+ 
+ int attribute_align_arg mpg123_spf(mpg123_handle *mh)
+@@ -977,8 +1018,8 @@ double attribute_align_arg mpg123_tpf(mpg123_handle *fr)
+ 	double tpf;
+ 	if(fr == NULL || !fr->firsthead) return MPG123_ERR;
+ 
+-	tpf = (double) bs[fr->lay];
+-	tpf /= freqs[fr->sampling_frequency] << (fr->lsf);
++	tpf = (double) bs[fr->hdr.lay];
++	tpf /= freqs[fr->hdr.sampling_frequency] << (fr->hdr.lsf);
+ 	return tpf;
+ }
+ 
+@@ -1062,7 +1103,7 @@ int get_songlen(mpg123_handle *fr,int no)
+ }
+ 
+ /* first attempt of read ahead check to find the real first header; cannot believe what junk is out there! */
+-static int do_readahead(mpg123_handle *fr, unsigned long newhead)
++static int do_readahead(mpg123_handle *fr, struct frame_header *nhdr, unsigned long newhead)
+ {
+ 	unsigned long nexthead = 0;
+ 	int hd = 0;
+@@ -1074,9 +1115,9 @@ static int do_readahead(mpg123_handle *fr, unsigned long newhead)
+ 
+ 	start = fr->rd->tell(fr);
+ 
+-	debug2("doing ahead check with BPF %d at %"OFF_P, fr->framesize+4, (off_p)start);
++	debug2("doing ahead check with BPF %d at %"OFF_P, nhdr->framesize+4, (off_p)start);
+ 	/* step framesize bytes forward and read next possible header*/
+-	if((oret=fr->rd->skip_bytes(fr, fr->framesize))<0)
++	if((oret=fr->rd->skip_bytes(fr, nhdr->framesize))<0)
+ 	{
+ 		if(oret==READER_ERROR && NOQUIET) error("cannot seek!");
+ 
+@@ -1211,7 +1252,7 @@ static int forget_head_shift(mpg123_handle *fr, unsigned long *newheadp, int for
+ }
+ 
+ /* watch out for junk/tags on beginning of stream by invalid header */
+-static int skip_junk(mpg123_handle *fr, unsigned long *newheadp, long *headcount)
++static int skip_junk(mpg123_handle *fr, unsigned long *newheadp, long *headcount, struct frame_header *nhdr)
+ {
+ 	int ret;
+ 	int freeformat_count = 0;
+@@ -1267,7 +1308,7 @@ static int skip_junk(mpg123_handle *fr, unsigned long *newheadp, long *headcount
+ 		if(++forgetcount > FORGET_INTERVAL) forgetcount = 0;
+ 		if((ret=forget_head_shift(fr, &newhead, !forgetcount))<=0) return ret;
+ 
+-		if(head_check(newhead) && (ret=decode_header(fr, newhead, &freeformat_count))) break;
++		if(head_check(newhead) && (ret=decode_header(fr, nhdr, newhead, &freeformat_count))) break;
+ 	} while(1);
+ 	if(ret<0) return ret;
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
index 0baa7aa4a1..62c6564cec 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
@@ -9,7 +9,9 @@ SECTION = "multimedia"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
-SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
+SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2 \
+           file://CVE-2024-10573.patch \
+           "
 SRC_URI[sha256sum] = "963885d8cc77262f28b77187c7d189e32195e64244de2530b798ddf32183e847"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


