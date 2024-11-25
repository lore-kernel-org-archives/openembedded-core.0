Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F34D3B7F3
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 08:48:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14848.1732524502624754238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 00:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1059dd1ea8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP7qtHT026581
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 00:48:22 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433feq1cj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 00:48:21 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AP8mLIY011051;
	Mon, 25 Nov 2024 00:48:21 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433feq1cj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 00:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAAhrcog2cSchUBy9XnWKi6SgYpqstGFM4l+17d8Y259aobahPnoqWnKy5zpl85CQ9aYYfFsZPuXMFqtuwF1c95w309QOObVhtZrVWRc2Z7Mvb94yAhj/7CyzWK/zC1KPGSF+zJHLm8CDdPbj28BUFM9uBFEY6PY1PzeGjuWysohovsF5w+B6n5WQzH3yliPvkK4e0clKS69H37Vn+C8LorWVwCuC91L3uxO4mjHc2QTWsrxjM5aoS2PXcuIcYPfFu48WmOWlTnbSozv58MwesZm88LEIzGp6UOC7YkYHJIA3nFLvBiCrqBJSBBCNFPxy+kCyZ06pMYsNzwJiHdIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odVL4FliVezzmFCWMykuzqGoUG/6BlukEeW3RayGtpY=;
 b=AzcaWGgcYX5g9iX6j3p0Of9Vjh2bwTM+YQuucVXDevwlYal8NvKUIlscHtuE1sEPyXZ4njnqRCHk5paCSg10ZJqO1Oof++eWOBBEzlOZx2acMXSrqY893ZgoOhxu6AeBHnM1U8rYtP4U086RFj0BIvfMPBpgNiWqA1wmcenLCHJ7fzVh5qLWj181YjGR1fhnLlYLv9NQ+b8L2t6H/J6xag73ezOyaLdsAYsNO3Pi9TcIOD+88Y2E+PVsgSiuw31JCs2iVJtY2NevrQWVIyL1O4/1FVi+BIs2eEDEZZ7qGracWiIuYIlrsgRCy7NoHVZQmEIATmH538yKGHrsuIbghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 08:48:17 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 08:48:16 +0000
Message-ID: <25331232-b2b8-4fb5-a6da-c69d3513cd81@windriver.com>
Date: Mon, 25 Nov 2024 16:48:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] ovmf: fix CVE-2024-38796
To: Steve Sakoman <steve@sakoman.com>, hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20241122051749.1260019-1-hongxu.jia@windriver.com>
 <CAOSpxdaLUbcJ7UZv15VYQG1s=HgRWa9huu-az9ekiy1dxCADbA@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAOSpxdaLUbcJ7UZv15VYQG1s=HgRWa9huu-az9ekiy1dxCADbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 58be008a-fc19-42b9-442a-08dd0d2de73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TmVYYnFuMUpkV2xzVWtMcnpRcXp5OUI1TXFJMHhLUlNub3JTSE5JNTJQeURp?=
 =?utf-8?B?VkJ4cm1ST1pBb1g3OGdFL043Q0JYZUxSY0FsSzdiWWh1ME12THgwNkVmTHNm?=
 =?utf-8?B?dHpVdjdpSjRZVEpRM09CTGVGcStPMlhMRmNvNmtkRWtjVmh1empRLy9LTU10?=
 =?utf-8?B?T25SYVdSUnZpZE9Ra0d3OWZLVDlhbXo4TzNZbWZoNWtBNzhXZ0dFVmYvMEZ3?=
 =?utf-8?B?d2V1NzdpQTFhOWVRZ25mbmhOR3QvM2J2NHZmcE9kOEU0Uy83dTc5NCtuWGUr?=
 =?utf-8?B?RFpDYU90RDRMcUhqRXNWUHpxb1pxMW9NZ3JMZVlXWmJoUnI1dHhFNy9mRm5n?=
 =?utf-8?B?YlNNaU9scnpRNG9IaUdacklNRll2RDM2V3NLMlNUT0diRm9PclRTWGFBUWhh?=
 =?utf-8?B?RG4wSTFXUGJsSUUzNXcxREkyL3JzRC9pT2NsMDhreHhiZ0FxSGpRZGg4TzUz?=
 =?utf-8?B?T1ZVUVRpTE54bmU3U1B1eCtLc25BZUpmOWdZQXB4RjVJSStwaXZ6QjZVQWk0?=
 =?utf-8?B?dFlzeFoyTnBuUW9LSk9BK1hJU3RNZTFZcWZCOGs3Y1FFeG9LZHZaVHdZMisy?=
 =?utf-8?B?dzBpM0ZTTEhSQ3JqWFlXcFB5ampYZjFtckJMTEN6Z29BU3o0NVBHMHdiQWlv?=
 =?utf-8?B?WkpockJ0VGVPWTJ3UWw3SHdidi9UNWdOUnloTkdyamRxcXNpUnJQMmNuSlBQ?=
 =?utf-8?B?Q3F4NzhNdmZtelY1cEZlT2ZIS1U5d2p1Uys5QzZtczFjTTVubVhxQi91VG15?=
 =?utf-8?B?dWpaUHg5dzZ5dVBnREs0cXpBZzB2bk8zeEVMWkJoV3NHNHkyNU1NU0svZHdz?=
 =?utf-8?B?VGxaTDE3czdyVTdKcGxDQmlkeTNVd1NYOFZ2UFV2UGxvTlRiYWVFam5ubEdU?=
 =?utf-8?B?bUxkazE3ZC9naVBmUDkzVFdaZDBpZzgySS9aUENuZ3c1NVk1UnVkMWozWHIy?=
 =?utf-8?B?aTZ1SzdPcUdPcUh5dkY4aTZvWlpSWWtCOEJnQlhxZ0RoZ1lzRytWd0hKbVgr?=
 =?utf-8?B?MDZKYWowWm5kWlJ5USt3YU1NWWZnT3l1c3E0K3d4V3lXUzM4N29vMnM1aTYz?=
 =?utf-8?B?SnA3NnlaYk5scm9zUyttbkp1cDZNdkpGUjhTWGJRMWd5N0RIQUFaZ2lHSHUr?=
 =?utf-8?B?SXd1WEVyRzh5UXFhd0NBTFpyNWZSRW5hZHpYc25JVVVidDFLcC85U3ZpcmVW?=
 =?utf-8?B?cmloNi9Ld3IxbmlaT0lsdE1kRVlKcVZvb0JrZnUzSG9UT01XMGJwVnE1U1Zt?=
 =?utf-8?B?MlVGYUZvc3Y1Y0Y1ajhLc0xvNUlWNjJSc2RTY0ppR2lNOGRlSXN6UitzbFkz?=
 =?utf-8?B?bWNkS1hwRSsxWjQxZjVZTzEraDE0eEhvZDVlZnhuaUF4bGV1T1NTUWUzajln?=
 =?utf-8?B?cC9oMVhXeXVMV20vRGxIRVpMTDAyY2pHOVhSK0VKdThWZ2N3bW85UXV1YWl0?=
 =?utf-8?B?K1BHY2hNOEJOSnhsRk5rYVgyOGdxcTcxckdHWEtmZy80M2NJTm9lTkV5ay9q?=
 =?utf-8?B?M3k2NjE3MzVEUTg0MCtqK3V2SjArS01aSS9UTGNzWHNLK3F1V0tPbGMxaVgr?=
 =?utf-8?B?VFB4M0ZnUC9pVUpidTVIR3YvMG83T2NQa1VBdUJzNlphb1E3L2ZydlhXZ2Vr?=
 =?utf-8?B?cVNjV21HNDk4UUE4cmFJL3loOGRMU3NRN1l0VEdSMkpMS2ZUZVlEV1gzb2ds?=
 =?utf-8?B?bU9nQnEyWUc1ajJTbTloMEpJcGxBSW9JSG9mTnV3ZmRWS1A1dFdaR3ZIRlpl?=
 =?utf-8?Q?Bw3jxNDCidl1OGcSO1Z+fJmkDVDism9XZd/BBGw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnlwVmY3Z3p3NngvV0FYYmRpcEZBK2FwYnVRQUF3NU5nWlB1ajJrVnZMRUNH?=
 =?utf-8?B?T1BkZmdBc1VPQllUNHl3Vlg4WkFzenU5SzV6a0IxT0k3bGs5TW5IRDQwaHRK?=
 =?utf-8?B?T080K0M1REoyT0hsQTBhcURNbUM5NXU2U09mWHVua3g1eExGdE5SdWVZeGtZ?=
 =?utf-8?B?ZXpFSUJrZGp2dEVxdDdKTlpFVVB6RXE4SmkxSFpmMzBvR3ZyM0pSQ3Z4dXlR?=
 =?utf-8?B?YWJvcFI3VjlmejlRZjJVNWUrNUJoaFNTbkJ1dFlhOTZIc1UzNTdhQ0N1Wm5z?=
 =?utf-8?B?bDJEdUM3QUlJUzhNTk9QS0V0S040aEgyUVVaWkExUmxUdkVCSDNZc1hEaXJU?=
 =?utf-8?B?WGErZS9DWFdFd3dobFdrc0xqSHFkVzVxYkdjVllBY2xIZHNFVnlDQ2M0OFVX?=
 =?utf-8?B?ZFJMalFnSnE1Vlo5WUdKdE1lNHJ2TzhaNXUvQWNURUJ4OVhSclF3SC9ESTRL?=
 =?utf-8?B?dDMxMGwxbTE5dE9JZG9Ob3lZWXZjNzBZUGowNmxtUmU2VFY5YnczWUpha3lZ?=
 =?utf-8?B?Q1kwTkMxNkdyVjlYY3F6TWo0QkVuczFEeEd3ZThwc2dSczdFdFFsWDBOejhj?=
 =?utf-8?B?ZCtVNVVDc3RnWjFveTNHOHJjN1Z1Q2trWnQrelVoOEkrRlpoZnh0d1pyOWh3?=
 =?utf-8?B?Q2VRWnQycWE4cXRVR2UxUE5IdjJ6NmE3aGFRTEFjVDZ5ckEwUmk2ZFZ5ak9h?=
 =?utf-8?B?Q3dwWmZBRnh2NFhBQ1dpQ2R4MEdBb0dzOEhJc3hVWEI0TkFnNkUwK25OZ0FV?=
 =?utf-8?B?WFlRdEoyOWpHemdRNC9DUG5FSXlTY09qRm1TYXdvTTBrb0FQQXZnNmpSMmhX?=
 =?utf-8?B?NFlYNUFPa0EwVFBNaXV3MFJmQm9HVk1iR3Jid0FTbE9PazNuTmhPZ2xsRE1u?=
 =?utf-8?B?YnBFREhqaVdTTjlUdHBEbm9uNUgxZzVId3lnWnBUMm53NG1Zdmlublh4cTU2?=
 =?utf-8?B?dGNISmI1Q015cWlySy9FUDVucnM5VDZqV09VOEgvSXlKRk1hOFNqMEk4NFE4?=
 =?utf-8?B?YmZCRjdnUmdJeC9hNDlmVXJ2dXQyR1dzN3h5bTJJaTdwTXVQRmJKWDQvUlIx?=
 =?utf-8?B?dnZIZ0dHT1htUHNrOG0xNXJHQnpXWDlYZEZsZkY2Z1Roa25RYXJOdFFmTGRY?=
 =?utf-8?B?VWsvdE5keklCMVZ3OWR2N2RHWTVScmlWcHJVVndCQ1pRbjRoUEJHMmVSTHgz?=
 =?utf-8?B?ZDRyUUhsQXBJa2hiaUJwbFdXdGNaNTVJNnd5SGlWdmlNWmlDQmo4ZGxsM0cy?=
 =?utf-8?B?eDBzQVJpNHZnamxFRFNHRi9OSkkzN29CYno5OWZmYkhHVHlrYlMzRTdoTCtR?=
 =?utf-8?B?QkY5TFhZeU9tOUIvTjh5SGM1RG1sclNUUTg5NDZTNzk2WlYvYVMyaUVZU0sw?=
 =?utf-8?B?RHg2eGZSSmdBUTg3ZWtFRVlPVmZhT2NIaHZGZUdrR2pDQyt6NktxWVN0Vk1M?=
 =?utf-8?B?WDVKMWtMeDNlOHdHU0FhTmxiMlVBb213cmxVUGQremFXM0Zpd3RoTzltUERj?=
 =?utf-8?B?WmRVTElldU10c00wdkNuKzRDVnNCQXA0Wm5ZdENGYnkxSUFFQzE3YkJra1Bo?=
 =?utf-8?B?UlQ4M2dLNExUTzY2cVNNTzNCVGlweXZOdHNNVnh5aDhvZjEvTXZ5bVNLUTdL?=
 =?utf-8?B?L1JvQmRoeXpWdHZXVjA5YTRjYUNwSk04V0dNMGVmeWdacE5HYVlIY2trTzJv?=
 =?utf-8?B?YWY0SEZwd0p0cW5zR2VPYVh1Y0lBejBzQkx5V3JNdFp0NStFa0dlMGtXU04v?=
 =?utf-8?B?UnhRdWpoWTRUcnJQNUxGRFRUcDJxOTAxcXhLYVg2Si84UUp0aVRtcGtoOGFw?=
 =?utf-8?B?OWwxNnJEeU9xdlBjenc5RWtrQUVNRUJkTjArTy9ONjVOUkRsSGtwRnB4MVhI?=
 =?utf-8?B?Ujk3SlVLM2FhY2hUOTExdTRuaUlpblpXQ0lDR0Rhb1RHT0d1aUtlK29oTU52?=
 =?utf-8?B?c3hYU1dBUFVaRWRpUzFOeGEzdW9IUWRYZ1RySlRzVUFqNjQ4dXZtaDhpNzJk?=
 =?utf-8?B?dzBRVUtkQU9heEFIbWN1WlhmZTB5QTNZU1B6Nm1qczlKdFNDdWdVYTBqdGZq?=
 =?utf-8?B?cTZYZWx1TVBkZUxENkFBUXY4ak1lTU5KcVpNby9JS29uSWNIUXFzOWd0dDdY?=
 =?utf-8?B?OHc5MkJXaFlVS2paOHN1T1Rhc0JoRTVTc1VrS2Q1YnVUb3VBVFRSaUV0OGxP?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58be008a-fc19-42b9-442a-08dd0d2de73f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 08:48:16.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0zBuONcQkWjmbIb0L0cIOrIRn1+8je0c521l5teAxUREvchpBSuCGVSve1RE92YIyeR7oxJpeKORN772QGabC5nq+eOpOkzaghY84UzlDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
X-Authority-Analysis: v=2.4 cv=c+L5Qg9l c=1 sm=1 tr=0 ts=674439d5 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=_enOPnqeAAAA:8 a=KI3QSJojz5I6W0JGVysA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: eCKKuCh0tHKpK4ThVyEi_Z_t6GFq0J0k
X-Proofpoint-GUID: SxB3UCAfrjfLuD53hr51QqJGUHZio2Ke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-25_05,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411250075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AP7qtHT026581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 08:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207726

On 11/22/24 22:31, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> These patches don't apply to the specified branches.
>
> I *think* you may have swapped the branch names in the subject line.
> Could you please verify and resubmit a v2?

Hi Steve,

Sorry for errors, the ovmf patches on scarthgap should be right, but=20
patches on kirkstone failed

I will resent v2 for kirkstone branch

//Hongxu


> Thanks,
>
> Steve
>
> On Thu, Nov 21, 2024 at 9:18=E2=80=AFPM hongxu via lists.openembedded.o=
rg
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>> Backport fix from upstream to resolve CVE-2024-38796
>>
>>    https://github.com/tianocore/edk2/commit/c95233b8525ca6828921affd14=
96146cff262e65
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 +++++++++++++++++=
++
>>   meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
>>   2 files changed, 37 insertions(+)
>>   create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overf=
low-issue-in-BasePeCoffLib.patch
>>
>> diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issu=
e-in-BasePeCoffLib.patch b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-ov=
erflow-issue-in-BasePeCoffLib.patch
>> new file mode 100644
>> index 0000000000..c6e15c5069
>> --- /dev/null
>> +++ b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-Ba=
sePeCoffLib.patch
>> @@ -0,0 +1,36 @@
>> +From 5f7bd3f3c4747d5bb2733f017f8c5b93b63a74e3 Mon Sep 17 00:00:00 200=
1
>> +From: Doug Flick <dougflick@microsoft.com>
>> +Date: Fri, 22 Nov 2024 13:03:33 +0800
>> +Subject: [PATCH] MdePkg: Fix overflow issue in BasePeCoffLib
>> +
>> +The RelocDir->Size is a UINT32 value, and RelocDir->VirtualAddress is
>> +also a UINT32 value. The current code does not check for overflow whe=
n
>> +adding RelocDir->Size to RelocDir->VirtualAddress. This patch adds a
>> +check to ensure that the addition does not overflow.
>> +
>> +Signed-off-by: Doug Flick <dougflick@microsoft.com>
>> +Authored-by: sriraamx gobichettipalayam <sri..@intel.com>
>> +
>> +CVE: CVE-2024-38796
>> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c=
95233b8525ca6828921affd1496146cff262e65]
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + MdePkg/Library/BasePeCoffLib/BasePeCoff.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c b/MdePkg/Libra=
ry/BasePeCoffLib/BasePeCoff.c
>> +index 86ff2e7..128090d 100644
>> +--- a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
>> ++++ b/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
>> +@@ -1054,7 +1054,7 @@ PeCoffLoaderRelocateImage (
>> +     RelocDir =3D &Hdr.Te->DataDirectory[0];
>> +   }
>> +
>> +-  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0)) {
>> ++  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0) && (RelocDir->Siz=
e - 1 < MAX_UINT32 - RelocDir->VirtualAddress)) {
>> +     RelocBase    =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageA=
ddress (ImageContext, RelocDir->VirtualAddress, TeStrippedOffset);
>> +     RelocBaseEnd =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageA=
ddress (
>> +                                                   ImageContext,
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ov=
mf/ovmf_git.bb
>> index 35ca8d1834..cc2ac4268c 100644
>> --- a/meta/recipes-core/ovmf/ovmf_git.bb
>> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
>> @@ -24,6 +24,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;b=
ranch=3Dmaster;protocol=3Dhttps \
>>              file://0002-BaseTools-makefile-adjust-to-build-in-under-b=
itbake.patch \
>>              file://0003-debug-prefix-map.patch \
>>              file://0004-reproducible.patch \
>> +           file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.pat=
ch \
>>              "
>>
>>   PV =3D "edk2-stable202402"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#207588): https://lists.openembedded.org/g/openembe=
dded-core/message/207588
>> Mute This Topic: https://lists.openembedded.org/mt/109718092/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


