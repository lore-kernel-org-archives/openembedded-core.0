Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C60D41C04
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 08:10:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4529.1765440642739778813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 00:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BfOVpXoS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4440256309=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB6US6V2546052
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 08:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=xoADiRvcFP9hV+eHUem2S6
	bjkcFO7gAsx/yv0ci6rlo=; b=BfOVpXoS/QfVPDM/3sFzXsoO36H4fAgQZ1F6+7
	znafXTwG3B8fAChm0MDBVy0McCDKQzx0Uilz3S57HfKdtgyZtkrCZbA71rfEP3tU
	SBQA2F1B6xocKR9RsQ4+O1Fj6iB42UrRGfQdvEhi8H/IvJ9gskFM8WdlKhGtHS5C
	701zO4uxwQP1oZsq9FWngHqIog3LmDEW3OZnwmZVviE7AbsoMzC5b+8U7usNH67V
	E6ZMe9wKi8e1n5a18tboPQ/fzhdxb81nrRGhVGJ9YpGvCexWh891t4IGzxYr3PX9
	uNN2D8GlylMQRYZbuGwYg6VAdN8mESHAZEbDTmzdt9vTc1rA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hsqr2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 08:10:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cwtfc6G8cNBLcCppKtTXtf40lm5RIy+554HGjZWp+hfR7K+QTuJnKHKkoyiLAHaydWJVrjy+o2TmWFmMYiRvVo54K5MkcPDcxNCts1xZyNT3Z7ymTEC9/v3oFzFDCJeTC2RRetQvgZRdcnBSbCJv0cZxDs9ZdtIsddXWVKse7dgKw118iZZRGWq2m5pH/7HEHzj5CFlhEQRDQk1aPzC+4Avx4Qid3GbLcwyX3VFqaXtiTusNr2H2z7MtSoy0d9harfEQ890RUqui6sWDLpqZ11GxxTTSJl85kQpMRdThasD9SldwJO9etBGKeikY+XFtlftQECC2S6MQ47ZuQK/JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoADiRvcFP9hV+eHUem2S6bjkcFO7gAsx/yv0ci6rlo=;
 b=XCfjLIn7j+XDQ3IyZT5tI/yhPzIxYIQ6DYt9V/iYmlwG/8VY/8FHZ2mgzSkUOKdzFo8O7qN2Mq+g+UoNZwmS/g1OZ0Z3cDOrMHmM5dpuz+pOg2f+5f33txk5dNzPdWrg22dSU0D6yuZgQR26/OoVbxKNTfABkvdV0D3FUiFLOvPXS90wgY+2J/bJJ0rkw7yC1qS4oT/OHc2cx/eFrY4zn5U+3/dQC/As9uGwRPnlM9nLqidPS3B6J7qTbmEt+VokmVTjFxiX2MGKZESEBQ7gP8rzTxUuj3z4smSGVW8CJm2S62KYjp7b3fkhu5w+r5l1vKGsOwrzA+cybIIdCsU2uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Thu, 11 Dec 2025 08:10:35 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 08:10:35 +0000
Content-Type: multipart/alternative;
 boundary="------------BrzidIFzcCTUtF10HppgW0wV"
Message-ID: <a94bfb6f-657b-444f-80c0-ffcbfd105305@windriver.com>
Date: Thu, 11 Dec 2025 13:40:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] rust: add missing zlib and zstd dependencies
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>, peter.tatrai.ext@siemens.com
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
 <818e8b90-9aa1-45e4-aa1d-6a903676408e@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <818e8b90-9aa1-45e4-aa1d-6a903676408e@windriver.com>
X-ClientProxiedBy: MA5PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::15) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd0be4c-6f58-4c26-82dd-08de388cc337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?enlCTjRjSER6M2pLVUZ0a29pVlU3dEJna3kzbkVFZisvQlgrUmNSNEtQaEYw?=
 =?utf-8?B?WnNyQ2JieDN0K09zZDAvVGJ3RWpCNjd4MFJhaGhXZ3hyTkJKbmpiRnRtb2Rr?=
 =?utf-8?B?NkNuVjdjMW9mbnd4NkRkNFUwak9wQ1hheHRuOHlRa0VzN3JqVEJUQ3FjM0lB?=
 =?utf-8?B?NzRsRHFlN1pBOG1WNU9lVzZHWW5kOG1vOEtQUmZvbytHY3VvNXY0VFRBMndy?=
 =?utf-8?B?dEFSeE8wMDU3RHRGRnNwZFkwVGxEWVpwN3FoRFpXZHE1SVByV2RwcVN6bXJy?=
 =?utf-8?B?S3lPYXNjVk9HcXA2VlJrczVnNHVJdHFzdjM1RmMySlM2UmtKcS93emE4cjBJ?=
 =?utf-8?B?WC9aazBLT1BSNWd1S0RqaDhxbFpQT2daeXM2UldlaFV3dE5wRmRLWDRxemxL?=
 =?utf-8?B?Sm1QR1FaV3REdjVoekd4MDhPRXdMT3k2Rk0zU3BWZHFHSkE2MmtVaWoyRG1E?=
 =?utf-8?B?NFRDblpqQU5hTEZGZnZsUEF3MHFGdytCMzNnZHhhK3NmRUVtMGYzcXBBalhj?=
 =?utf-8?B?Y1lSKzRPNjFGRzNGeW5OeWtheHFCR2wvZXUyUTYzOXZ0Y2tGcGk3dVErSW02?=
 =?utf-8?B?WkdVaXdFUncwWUVGcmVSOWFQdnJyVFhRcTlzWGpTWEtRN0VDZ1BkUFIyN01Y?=
 =?utf-8?B?WGh3djdFd1ZMV25mYW5RdHphOGh0b0hzZmtDZHNWWnd4OE82YndmQzNoYzF4?=
 =?utf-8?B?emhOMm91QWd4Yml4ZlBONjdqdldsV0s1aGplcWhrNFFlK2w3aDhUd05mcU1U?=
 =?utf-8?B?czF4WHFpRUsvdUtxSytTMy9QdXZkVVh5NjRRYkdsL1MveVd2cWJFaXFrQkcz?=
 =?utf-8?B?V0wxYm1tSWF3SlBueXc5cDJWYVF0Tkt0Q1ZQc3FibnZmejRZeWJLbzJPM2dC?=
 =?utf-8?B?cW5uS3pobUFvZE9RYWZLaGVyMkhzZ0VJY1JlWm5nMmlMZW5Ea2J2QXcxejdo?=
 =?utf-8?B?cWxXMlpheERTaEJ5TC96a3Q3UmdEdllJSEVqWXk3ekJ6ckJYRENVb1I2UXY1?=
 =?utf-8?B?MW8ycm1yNjkydkZWaGNRZ0ZCTFBVTjhRUHkzRWFVUnJVQjh4bUkvNDJOL1Ny?=
 =?utf-8?B?V2FML2NaSnZRRFU0ZituS2hSQUhHMlhkaDY4RHRlVnhYekQrV2J6VURwelIw?=
 =?utf-8?B?c1pMd2xjMTQ2R0gxU28yVjhSZzBGaWtuaHpBKy9kL3RzTlk4Rk1MOEJDbEpo?=
 =?utf-8?B?eEZmZmc0S0hnNElhMllZOWN1dGFXNzNZY0dHLzg4QXVHT1ZwaWxGWHFsbkFT?=
 =?utf-8?B?OWorVmV3STZFRmZ5MjVBeTgvT1hWYW5JZWp3R3l1dSt6MHpHUDRrSk1lc2I3?=
 =?utf-8?B?eXkzZWdMcU4wMFhDVVFXR0xKUnVjSTN0N0Z2SkpZdXJLVkFvWXBNU3BSbUdi?=
 =?utf-8?B?YzZxV2JOMDZWajFGSFhkK1BhTlBCbGlRRXdDai9LdnEvU0VEcHdIaGJlVmh6?=
 =?utf-8?B?cHJodWFQYUFneDZ5c0FrSTZqZW5qNVg5OVVvMi9NSGJFTmNNREh6L3FXSHJF?=
 =?utf-8?B?WWtTTmRrOHZzL0FSWnlaOWJxRE9wMGx3ZzJlZm5GY01LaDJyM1JxejlCNE9w?=
 =?utf-8?B?cnl2MmlRaXF6STFHWXF0VFpxWHdLRk54SWgxWkVxTGk4OGwzMktCaTQvbW96?=
 =?utf-8?B?VWVyLzFLWnNtQmVLN2tMRSszSlh5c1ZDeWFkZDR1TEVpREl6T0dqZkJXdytv?=
 =?utf-8?B?N092Nk9mV1NjUXVVY3pIb0xVeFRYa1ZCMmt0SDhYYnBhYVc2M2hFYU5EWEFP?=
 =?utf-8?B?TzVtd000K1ZUS2VhODV2WU1yU0d3T21HKzh2SG9OMUxsUUlWampjaE13c0lm?=
 =?utf-8?B?YWRQNThQeWZrOTRJaGI3Q0FOa0dPUkc4V0draVZIRlUrYzBVRnJMdWVNK0o3?=
 =?utf-8?B?NmNIY1NSaE42RllScy81T0VIMVRmcWxjNE5ybEN5QUtRUEVJckdzODErUzF2?=
 =?utf-8?B?VEYycWU5aXl4RDFKTXZJZ2JtOTdsaWVyWUZINEZkY09FSEt6Zi9PaGE0YmJZ?=
 =?utf-8?B?T3h0NDBRUHRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWVCSXh0VlhXdjJkc1VWazAvMFdWOGtyNTFGL01yUzFqbFpTYUNFVWFpUDNS?=
 =?utf-8?B?cTFWY29jdlR4WTJGOXRnVnZNQmd1eGdldEdlNUtiT2VjSWlXenN1aHh5RDVD?=
 =?utf-8?B?RzFERVVucDV6cXZGOVROQVpQL0tBMTkwL2VLTk43VHpzZ0ZsVFVVL20rVXR5?=
 =?utf-8?B?S2s5TXJmNjlNbzJaL0c3RUVuRGRjNlRycTVMRXJEZ3BqZExpdk5qUG5pSGNa?=
 =?utf-8?B?bzI4TlV3YVFrUHpreGtXbHpOZXpqbzVWaFRKMDhuTkNkd2tlODRDbjNROHNy?=
 =?utf-8?B?bG15c3JTMjRhWGp1K01rSTIzbmFUbnFiU05Sem1oUWxkQUN2VzMwTXZRR3dl?=
 =?utf-8?B?K2FjUTdoUUpHUC81bEFDVUo2dmJkMTBha0Fqa0o3bnRYZGZtMjZqZTBOUTVX?=
 =?utf-8?B?cE1XN3ZIUXg3UitVeitCK1hoUU5kTVlJbmJtOTAvT2d6b0psbGs5dGZPdEdF?=
 =?utf-8?B?R3RSTG80MWZldjhrRDR2MzQxTFc5clVUbXpDVE94UHNMb2w0V0RvZnFPTUJZ?=
 =?utf-8?B?U0JLenM3cDQ1YlVJNEprajliSmlVOWxkRDlNL3RFYk5IQ1Jja3JSUklhVTln?=
 =?utf-8?B?QjY0R21oS0d6MU9PUUwxVnpacGZMcUV0Yms0OWVVbDc3ZHdNcFRrU3VRenA1?=
 =?utf-8?B?Y2JzUnVTTEdhM0RQcFZsbkljNmEwUC9weFl6NnBQZkI5K1poSGx3N2lyUDJP?=
 =?utf-8?B?WDc4eC9tQkVYV21ZTjNVWWQvMmpiTm9aeHh5SjJUSE1lMzQ3VTNlQndsMzR1?=
 =?utf-8?B?K1p1eDY3UWUwNFJBc3IrS2poSktmajQ1YVcxMkxQb1M3SWx3aEVPRHBMRTRB?=
 =?utf-8?B?UUtLNTdHZExQZDI5U1BNWjhydGJtb1ZwcjhRbFJhd1QvaUxtUFlxOGt3cHhq?=
 =?utf-8?B?NUN3TnhCeTdwV3RwQ2VobmRWZHhMbEhGb0lVazh4eFpDMFJtVDhEV1p5bEZ4?=
 =?utf-8?B?aU1tUk05N1pYS09VNSt3TFRkN3M0L0NHcXFUWkdmclo1QUhTaWV6RmE3UmJ3?=
 =?utf-8?B?NFp4dHhWRHJOV2xGTERydGRtcGNOei9adkpzMVBPZGNxWHlPVTMwYm8rbkF4?=
 =?utf-8?B?K3VzQUZhS1FnWk9sWXVRU0hGZnQxOUN2VzQyN1ZaRGU1cHF5YlVZeGhvS0tz?=
 =?utf-8?B?Sk5vMHZJc0txMDR1Ky95UWVxRVhjOC81OGlQN2xtUmFHTmpYdTlWZG9uT2dM?=
 =?utf-8?B?SEJOU3dTWnVqaWxHb3ZGM3lnM2FlRWdVZmMyTjRVV0tlTW95QW56T1d3VXhi?=
 =?utf-8?B?enk0ZmZscGRFWTJldUQ3RmRTNVhtRWx2U1hlSmdld1A4YTFsQWFSQzg4SXlW?=
 =?utf-8?B?QjlsbXFBYVBaRTMyQ0llcXhwdUVoWUZLTm9aOTJTQ04yNlM0YjFJRDJhQlJP?=
 =?utf-8?B?a2ZUN0lIdFU2YXh6NCtab1ZhYzVvc2pPcjV2Zm8vZ2ZEQnRBcnBxckFrSEN4?=
 =?utf-8?B?azlSeWdPdlVFdUl2elhiK1VFUlZnblhmOHpaUW9QMUpwVjdUVEcvcWd2Mjd4?=
 =?utf-8?B?RGRsRHNCTUg1UXVITml2czN6NTFnYmJCT3JVNThZWVNUTTJDaGlHRE0zYU80?=
 =?utf-8?B?aTdnT2ZHUlE1cTRJMEowQmZ2VE9GY08rSWl2RzhHL0JZbmJUV2duQ3k0a2ZG?=
 =?utf-8?B?aDB3UnJKWlAyeG9CU0xxckxYRnV1MEI3VlZ6NHBXbE4xandGSDQ3cVBqTG94?=
 =?utf-8?B?bHZidEhBSDF3WE5MblNwMDd3VndaU2UvQWU3MGVleEF4Rk02UWVhUGFad0V0?=
 =?utf-8?B?NEFHWW1taUJOK1l3eFg1WjJMODNRWk1LaEx5UzRTV2tpTEpaSWlJRFpqQjBq?=
 =?utf-8?B?aW5TWHBVMFlZUnBqS216VUZMRlhIa0dRZXlQdS9rUkFSTGk3M2x3ZXY5Zi9m?=
 =?utf-8?B?eXhhd3FxSVBPTFVvNzdJZVFhTXdXMHZHdXhxSzQ0cEEvaDh2SWhzQ3BOTFU2?=
 =?utf-8?B?akFCUnJocFp3bkNiblh0VFdiUGFZYlhGQUs0a0xLZnlOQkR0SkJXUmJ0L21S?=
 =?utf-8?B?dW13WlhlaWVJYWZGQXl2M2c1dXBzWHB2c3grRExaZjJZWUU5QXFwKzcvd2tu?=
 =?utf-8?B?YTRQOGY3YW5aQ25UeFdFTVQ3Tk9IZTRxMGZEcERzTGFOVmIxaTR5RmlvQTkr?=
 =?utf-8?B?SUlFMWJDQzhQc3psY3V6NWEwditpdGk1RngyQUx6aXVtcmJUeGFXbWRwVmgw?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd0be4c-6f58-4c26-82dd-08de388cc337
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 08:10:35.6196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RlYCsouGRkTCLO37sDK16l+RMJy9mxMd185HaOzftJaStEvkEnQViNom1oCd80evohRbw2G1VT74McmMEoMCEZ2635AI7I7PFU8MssKn8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfXw0ZnIYaRX8dh
 ILS6LbuqqL1mmh7TJ4gDloEogylp10HZod4x0frmebj4mnGNs+tUxBgFkxbqZOGNQkpuZIVa/9l
 P5HLEn+my3QjRocs9VeQJYDdG547Pz9n03sU0Zuu36kLCUz/bRzPte8StCH6fuFCZoYOy+5Bvk0
 FH9V0FPx7dZ/oZB9KETm8SGycqQG7vTrA6gGKbLvEEGfvxWfcMStszvg+ZvurhSpjV5sn7wfG4H
 gOKQPDuktX0ATKXtDCdPkGptYyyaJF0eQttSmwfM3rOFkZplGI//1fKDai65WLgSPclmOdjnzjx
 4DZdRHp1RNPMxpThquJ6p+DFqtyEwL3bBK202rNtydZF+IIF2FfFRRriu/yNBIsrWBlPWlxbhrQ
 JKFjA5JCT+A+YSWfVTqAPtitv3HCKA==
X-Proofpoint-ORIG-GUID: bhFvVJnpyaclNpapUXft4wWLS24_jRU9
X-Proofpoint-GUID: HNgRIu7vtRsd9XOYiqb33hEijOdTxk3T
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693a7c81 cx=c_pps
 a=IyT5loBvHZYA5YPQi3EYsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=Twlkf-z8AAAA:8
 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=pGLkceISAAAA:8 a=0r3lOOKFftw2IsxWJ-0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=j9TAL7x8aGYBsfzJFCgA:9
 a=Vfhzm9NQ3DZQ7AaQ:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 08:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227513

--------------BrzidIFzcCTUtF10HppgW0wV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BB6US6V2546052


On 10-12-2025 23:06, Randy MacLeod wrote:
> Add Peter since this is/was his patch and you have his SOB line.
> Please do that in the future.
>
> I have some comments and questions that could go contribute to a v2
> but so far, I don't object, too strongly, to merging patch 1/5 at least=
!
>
>
> On 2025-12-10 5:17 a.m., Yash.Shinde@windriver.com wrote:
>> From: Peter Tatrai<peter.tatrai.ext@siemens.com>
>>
>> Rust's internal LLVM
> Is this an old comment? llvm is now an oe-core=C2=A0 recipe and we don'=
t=20
> use rust's internal llvm
> as far as I know (which isn't very far!).

I kept the message from Peter's patch unchanged which was submitted=20
around the same time when
 =C2=A0rust-llvm was dropped. I will reword the commit message in v2, if=20
required.

For more details:=20
https://lists.openembedded.org/g/openembedded-core/message/225636

>
>> requires zlib and zstd compression libraries when
> Yes, we have a patch for clang for this:
> meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-d=
etect-libzstd.patch
> adding in meta-clang in 2022:
> https://github.com/kraj/meta-clang/commit/0f38186ae93400b870f7f92938bbf=
8643e7da958
> and the llvm-project commit is (1).

The selftest execution environment requires the zlib and zstd features
as llvm enables them unless explicitly disabled.

The rust recipe level RUSTFLAGS aren't propagated to qemu image for testi=
ng.
This requires explicit passing of the flags for zstd lib.
(zlib is already available by default in core-image-minimal)

The following error confirms that rust via llvm expects these libs to be=20
available in the image for testing.

> Anyway, Khem,
>
> What are your thoughts about this patch and about using cmake for llvm?
>
>> building rustc_codegen_llvm and other compiler components.
>> Without these dependencies, building Rust for target fails
>> with linker errors:
>>
>>    error: linking with `target-rust-ccld` failed: exit status: 1
>>    =3D note: undefined reference to `compress2'
>>    =3D note: undefined reference to `uncompress'
>>    =3D note: undefined reference to `ZSTD_decompress'
>>    =3D note: undefined reference to `ZSTD_isError'
>>    =3D note: undefined reference to `ZSTD_compress2'
>>    =3D note: undefined reference to `crc32'
>>
>> This manifested in oe-selftest failure on qemuppc:
>>    oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
>>
>> Additionally, this was observed while testing with other targets as we=
ll.
> If you have a list on hand of which targets had this problem,
> that might be useful to include in the log. It might help
> us understand why the problem seems to be arch-specific.

Peter reported it for ppc target but eventually it was observed on all=20
targets in our testings,
i.e arm32, arm64, riscv-64, x86-32 and x86-64.
So, this is a generic requirement rather than arch-specific.

>> Signed-off-by: Peter Tatrai<peter.tatrai.ext@siemens.com>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/self=
test/cases/rust.py
>> index 31222e2456..01a98339a6 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
>>           bitbake("{} -c test_compile".format(recipe))
>>           builddir =3D get_bb_var("RUSTSRC", "rust")
>>           # build core-image-minimal with required packages
>> -        default_installed_packages =3D ["libgcc", "libstdc++", "libat=
omic", "libgomp"]
>> +        default_installed_packages =3D ["libgcc", "libstdc++", "libat=
omic", "libgomp", "libzstd"]
>>
> This has been present since the original rust.py selftest was added.
> It seems like a hack in that things are added to (blindly?) fix=20
> linking errors
> rather than getting to the root cause of the problem.
>
> That may be acceptable in the short run but shouldn't the list should b=
e
> just what rustc/cargo from rustup depend on:
> =E2=9D=AF which rustc
> /home/rmacleod/.cargo/bin/rustc
> =E2=9D=AF ldd `which rustc`
> =C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x00007a636834b000)
> =C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so=
.1=20
> (0x00007a636830b000)
> =C2=A0=C2=A0=C2=A0 librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1 (0x=
00007a6368306000)
> =C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthrea=
d.so.0=20
> (0x00007a6368301000)
> =C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00=
007a636821a000)
> =C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x=
00007a6368215000)
> =C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00=
007a6366a00000)
> =C2=A0=C2=A0=C2=A0 /lib64/ld-linux-x86-64.so.2 (0x00007a636834d000)
>
> =E2=9D=AF cargo --version
> cargo 1.91.1 (ea2d97820 2025-10-10)
> =E2=9D=AF which cargo
> /home/rmacleod/.cargo/bin/cargo
> =E2=9D=AF ldd `which cargo`
> =C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x0000789ffe470000)
> =C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so=
.1=20
> (0x0000789ffe430000)
> =C2=A0=C2=A0=C2=A0 librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1 (0x=
0000789ffe42b000)
> =C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthrea=
d.so.0=20
> (0x0000789ffe426000)
> =C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00=
00789ffcf19000)
> =C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x=
0000789ffe421000)
> =C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00=
00789ffcc00000)
> =C2=A0=C2=A0=C2=A0 /lib64/ld-linux-x86-64.so.2 (0x0000789ffe472000)
>
> perhaps with the exception of libatomic and libgomp which seem like=20
> valid requirements.
> I guess I'm really wondering if libzstd even libatomic and libgomp,=20
> should be RDEPENDs for some recipe.

The list of packages in "default_installed_packages" is needed to=20
include additional selftest requirements apart from the default ones=20
used in core-image-minimal. These are actual requirements rather than=20
hack. Adding them in DEPENDS/RDEPENDS do not propagate the dependencies=20
in selftest qemu image.


>
>>           features =3D []
>>           features.append('IMAGE_FEATURES +=3D "ssh-server-dropbear"')
>>           features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.format=
(" ".join(default_installed_packages)))
>> @@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCas=
e, OEPTestResultTestCase):
>>               cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-target=
s;" % rustlibpath
>>               # Strip debug symbols from test binaries to reduce size =
(300+ MB -> ~140 MB)
>>               # PowerPC mac99 QEMU has 768MB RAM limit, so we need to =
minimize test binary sizes
>> -            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo'=
;"
>> +            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo =
-Clink-arg=3D-lz -Clink-arg=3D-lzstd';"
>>               # Trigger testing.
>>               cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";"=
 % qemu.ip
>>               cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.p=
y test %s --target %s" % (builddir, testargs, targetsys)
>
> ../Randy
>
>
> 1)=20
> https://github.com/llvm/llvm-project/commit/e939bf67e34037970192fa90ad2=
2ab7628f5de33
>
> commit e939bf67e34037970192fa90ad22ab7628f5de33
> Author: Cole Kissane <cole.kissane@gmail.com>
> Date:=C2=A0=C2=A0 Tue Jul 19 13:54:35 2022
>
> =C2=A0=C2=A0=C2=A0 [llvm] add zstd to `llvm::compression` namespace
>
> =C2=A0=C2=A0=C2=A0 - add zstd to `llvm::compression` namespace
> =C2=A0=C2=A0=C2=A0 - add a CMake option `LLVM_ENABLE_ZSTD` with behavio=
r mirroring=20
> that of `LLVM_ENABLE_ZLIB`
> =C2=A0=C2=A0=C2=A0 - add tests for zstd to `llvm/unittests/Support/Comp=
ressionTest.cpp`
> =C2=A0=C2=A0=C2=A0 - debian users should install libzstd when using=20
> `LLVM_ENABLE_ZSTD=3DFORCE_ON` from source due to this bug=20
> https://bugs.launchpad.net/ubuntu/+source/libzstd/+bug/1941956
>
> =C2=A0=C2=A0=C2=A0 Reviewed By: leonardchan, MaskRay
>
> =C2=A0=C2=A0=C2=A0 Differential Revision: https://reviews.llvm.org/D128=
465
>
>
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------BrzidIFzcCTUtF10HppgW0wV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BB6US6V2546052

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10-12-2025 23:06, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a90367=
6408e@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">Add Peter since this is/was his patc=
h
        and you have his SOB line. <br>
        Please do that in the future.</div>
      <div class=3D"moz-cite-prefix"><br>
      </div>
      <div class=3D"moz-cite-prefix">I have some comments and questions
        that could go contribute to a v2<br>
        but so far, I don't object, too strongly, to merging patch 1/5
        at least! <br>
        <br>
      </div>
      <br>
      <div class=3D"moz-cite-prefix">On 2025-12-10 5:17 a.m., <a class=3D=
"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:Yash.Shin=
de@windriver.com" moz-do-not-send=3D"true">Yash.Shinde@windriver.com</a>
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash=
.Shinde@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Peter Tatrai <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:peter.tatrai.ext@siemens.com" =
moz-do-not-send=3D"true">&lt;peter.tatrai.ext@siemens.com&gt;</a>

Rust's internal LLVM </pre>
      </blockquote>
      Is this an old comment? llvm is now an oe-core&nbsp; recipe and we
      don't use rust's internal llvm <br>
      as far as I know (which isn't very far!).<br>
    </blockquote>
    <br>
    I kept the message from Peter's patch unchanged which was submitted
    around the same time when<br>
    &nbsp;rust-llvm was dropped. I will reword the commit message in v2, =
if
    required.<br>
    <br>
    For more details:
    <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/225636">https://lists.openembedded.org/g=
/openembedded-core/message/225636</a><br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a90367=
6408e@windriver.com"><br>
      <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash=
.Shinde@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">requires zlib and zstd com=
pression libraries when</pre>
      </blockquote>
      Yes, we have a patch for clang for this:<br>
      &nbsp;&nbsp;
meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-det=
ect-libzstd.patch<br>
      adding in meta-clang in 2022:<br>
      &nbsp;&nbsp;
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/kraj/=
meta-clang/commit/0f38186ae93400b870f7f92938bbf8643e7da958" moz-do-not-se=
nd=3D"true">https://github.com/kraj/meta-clang/commit/0f38186ae93400b870f=
7f92938bbf8643e7da958</a><br>
      and the llvm-project commit is (1).<br>
    </blockquote>
    <br>
    The selftest execution environment requires the zlib and zstd
    features<br>
    as llvm enables them unless explicitly disabled.<br>
    <p>The rust recipe level RUSTFLAGS aren't propagated to qemu image
      for testing.<br>
      This requires explicit passing of the flags for zstd lib.&nbsp;<br>
      (zlib is already available by default in core-image-minimal)<br>
      <br>
      The following error confirms that rust via llvm expects these libs
      to be available in the image for testing.</p>
    <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a90367=
6408e@windriver.com">
      <p>Anyway, Khem,<br>
        <br>
        What are your thoughts about this patch and about using cmake
        for llvm?</p>
      <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash=
.Shinde@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">building rustc_codegen_llv=
m and other compiler components.
Without these dependencies, building Rust for target fails
with linker errors:

  error: linking with `target-rust-ccld` failed: exit status: 1
  =3D note: undefined reference to `compress2'
  =3D note: undefined reference to `uncompress'
  =3D note: undefined reference to `ZSTD_decompress'
  =3D note: undefined reference to `ZSTD_isError'
  =3D note: undefined reference to `ZSTD_compress2'
  =3D note: undefined reference to `crc32'

This manifested in oe-selftest failure on qemuppc:
  oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust

Additionally, this was observed while testing with other targets as well.=
</pre>
      </blockquote>
      If you have a list on hand of which targets had this problem,<br>
      that might be useful to include in the log. It might help<br>
      us understand why the problem seems to be arch-specific.<br>
    </blockquote>
    <p>Peter reported it for ppc target but eventually it was observed
      on all targets in our testings,&nbsp;&nbsp;<br>
      i.e arm32, arm64, riscv-64, x86-32 and x86-64.<br>
      So, this is a generic requirement rather than arch-specific.<br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a90367=
6408e@windriver.com">
      <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash=
.Shinde@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">Signed-off-by: Peter Tatra=
i <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peter.tatrai.ext@siem=
ens.com" moz-do-not-send=3D"true">&lt;peter.tatrai.ext@siemens.com&gt;</a=
>
Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com" moz-do-not-send=3D"true">&lt;Yash.Shinde@w=
indriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index 31222e2456..01a98339a6 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
         bitbake(&quot;{} -c test_compile&quot;.format(recipe))
         builddir =3D get_bb_var(&quot;RUSTSRC&quot;, &quot;rust&quot;)
         # build core-image-minimal with required packages
-        default_installed_packages =3D [&quot;libgcc&quot;, &quot;libstd=
c++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;]
+        default_installed_packages =3D [&quot;libgcc&quot;, &quot;libstd=
c++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;, &quot;libzstd&quot=
;]

</pre>
      </blockquote>
      This has been present since the original rust.py selftest was
      added.<br>
      It seems like a hack in that things are added to (blindly?) fix
      linking errors<br>
      rather than getting to the root cause of the problem.<br>
      <br>
      That may be acceptable in the short run but shouldn't the list
      should be<br>
      just what rustc/cargo from rustup depend on:<br>
      =E2=9D=AF which rustc<br>
      /home/rmacleod/.cargo/bin/rustc<br>
      =E2=9D=AF ldd `which rustc`<br>
      &nbsp;&nbsp;&nbsp; linux-vdso.so.1 (0x00007a636834b000)<br>
      &nbsp;&nbsp;&nbsp; libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libg=
cc_s.so.1
      (0x00007a636830b000)<br>
      &nbsp;&nbsp;&nbsp; librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt.s=
o.1
      (0x00007a6368306000)<br>
      &nbsp;&nbsp;&nbsp; libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/li=
bpthread.so.0
      (0x00007a6368301000)<br>
      &nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.=
6
      (0x00007a636821a000)<br>
      &nbsp;&nbsp;&nbsp; libdl.so.2 =3D&gt; /lib/x86_64-linux-gnu/libdl.s=
o.2
      (0x00007a6368215000)<br>
      &nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.=
6
      (0x00007a6366a00000)<br>
      &nbsp;&nbsp;&nbsp; /lib64/ld-linux-x86-64.so.2 (0x00007a636834d000)=
<br>
      <br>
      =E2=9D=AF cargo --version<br>
      cargo 1.91.1 (ea2d97820 2025-10-10)<br>
      =E2=9D=AF which cargo<br>
      /home/rmacleod/.cargo/bin/cargo<br>
      =E2=9D=AF ldd `which cargo`<br>
      &nbsp;&nbsp;&nbsp; linux-vdso.so.1 (0x0000789ffe470000)<br>
      &nbsp;&nbsp;&nbsp; libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libg=
cc_s.so.1
      (0x0000789ffe430000)<br>
      &nbsp;&nbsp;&nbsp; librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt.s=
o.1
      (0x0000789ffe42b000)<br>
      &nbsp;&nbsp;&nbsp; libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/li=
bpthread.so.0
      (0x0000789ffe426000)<br>
      &nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.=
6
      (0x0000789ffcf19000)<br>
      &nbsp;&nbsp;&nbsp; libdl.so.2 =3D&gt; /lib/x86_64-linux-gnu/libdl.s=
o.2
      (0x0000789ffe421000)<br>
      &nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.=
6
      (0x0000789ffcc00000)<br>
      &nbsp;&nbsp;&nbsp; /lib64/ld-linux-x86-64.so.2 (0x0000789ffe472000)=
<br>
      <br>
      perhaps with the exception of <span style=3D"white-space: pre-wrap"=
>libatomic and libgomp</span>
      which seem like valid requirements.<br>
      I guess I'm really wondering if libzstd even libatomic and
      libgomp, should be RDEPENDs for some recipe.<br>
    </blockquote>
    <p>The list of packages in &quot;<span style=3D"white-space: pre-wrap=
">default_installed_packages&quot; is needed to include additional selfte=
st requirements=20
apart from the default ones used in core-image-minimal. These are actual =
requirements rather than hack.

Adding them in DEPENDS/RDEPENDS do not propagate the dependencies in self=
test qemu image.</span></p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a90367=
6408e@windriver.com"><br>
      <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash=
.Shinde@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">         features =3D []
         features.append('IMAGE_FEATURES +=3D &quot;ssh-server-dropbear&q=
uot;')
         features.append('CORE_IMAGE_EXTRA_INSTALL +=3D &quot;{0}&quot;'.=
format(&quot; &quot;.join(default_installed_packages)))
@@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
             cmd =3D cmd + &quot; export RUST_TARGET_PATH=3D%s/rust-targe=
ts;&quot; % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300=
+ MB -&gt; ~140 MB)
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to mini=
mize test binary sizes
-            cmd =3D cmd + &quot; export RUSTFLAGS=3D'-C strip=3Ddebuginf=
o';&quot;
+            cmd =3D cmd + &quot; export RUSTFLAGS=3D'-C strip=3Ddebuginf=
o -Clink-arg=3D-lz -Clink-arg=3D-lzstd';&quot;
             # Trigger testing.
             cmd =3D cmd + &quot; export TEST_DEVICE_ADDR=3D\&quot;%s:123=
45\&quot;;&quot; % qemu.ip
             cmd =3D cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.=
py test %s --target %s&quot; % (builddir, testargs, targetsys)
</pre>
      </blockquote>
      <p>../Randy</p>
      <p><br>
      </p>
      <p>1)
        <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/llv=
m/llvm-project/commit/e939bf67e34037970192fa90ad22ab7628f5de33" moz-do-no=
t-send=3D"true">https://github.com/llvm/llvm-project/commit/e939bf67e3403=
7970192fa90ad22ab7628f5de33</a><br>
      </p>
      <p>commit e939bf67e34037970192fa90ad22ab7628f5de33<br>
        Author: Cole Kissane <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:cole.kissane@gmail.com" moz-do-not-send=3D"true">&lt;cole.kissane@g=
mail.com&gt;</a><br>
        Date:&nbsp;&nbsp; Tue Jul 19 13:54:35 2022<br>
        <br>
        &nbsp;&nbsp;&nbsp; [llvm] add zstd to `llvm::compression` namespa=
ce<br>
        &nbsp;&nbsp; &nbsp;<br>
        &nbsp;&nbsp;&nbsp; - add zstd to `llvm::compression` namespace<br=
>
        &nbsp;&nbsp;&nbsp; - add a CMake option `LLVM_ENABLE_ZSTD` with b=
ehavior
        mirroring that of `LLVM_ENABLE_ZLIB`<br>
        &nbsp;&nbsp;&nbsp; - add tests for zstd to
        `llvm/unittests/Support/CompressionTest.cpp`<br>
        &nbsp;&nbsp;&nbsp; - debian users should install libzstd when usi=
ng
        `LLVM_ENABLE_ZSTD=3DFORCE_ON` from source due to this bug <a clas=
s=3D"moz-txt-link-freetext" href=3D"https://bugs.launchpad.net/ubuntu/+so=
urce/libzstd/+bug/1941956" moz-do-not-send=3D"true">https://bugs.launchpa=
d.net/ubuntu/+source/libzstd/+bug/1941956</a><br>
        &nbsp;&nbsp; &nbsp;<br>
        &nbsp;&nbsp;&nbsp; Reviewed By: leonardchan, MaskRay<br>
        &nbsp;&nbsp; &nbsp;<br>
        &nbsp;&nbsp;&nbsp; Differential Revision: <a class=3D"moz-txt-lin=
k-freetext" href=3D"https://reviews.llvm.org/D128465" moz-do-not-send=3D"=
true">https://reviews.llvm.org/D128465</a><br>
        <br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------BrzidIFzcCTUtF10HppgW0wV--

