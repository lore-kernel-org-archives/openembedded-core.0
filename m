Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E85CF887A
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36872.1763652426084095203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fD8HfDAL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCHPEv800524
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=HnoRSqVz8
	NwkGaEKnfY/TKdbV7018ty/TNJ6BQegI6g=; b=fD8HfDALZpgFoIQCm/UdPFiI/
	/GVDkFM/5RpxyzXLpYQlQBgTeI/1SJtNVNWFnp34H8AtnH+Cuq7MdVMRora35d8A
	BTrgdXmUuwY+Kyux9kWDQIumOj7cAjoqj4hS2dKMTDWq1W5wopdVl7msUIC/mgwp
	wC+g/WgIfe6Zt5LWHbwrtm8hJlkzuHypHWnWC1FiyDmmGIhTWPUGSJp/gkq4nzSs
	p+NBPyHFzh4ox+kEK/q0y4S8rKL8ztsXNeuNsIY9/lkn/4tpVTmYm52mJm7IG9tH
	mmV+54wj4Rcvi49UWZb5UclLlBy6DdLchQOB3vE6FHn0eTYOWU2W92yQte6Qg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2xge6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCPr0PLXeR0av9H+AQh5Q2czlUDyPuRv5Cya0YMkmNOntHbKWKjOQvnt3YM3p87S10dZgGrTWVZSV3TjF9HpKel2jsGLXyi9ie/h1PfFmRMp1R7WqVW4PiEXbGHOX9f6ciTpbIMkc6JmHuEbWKDQpdFY/q11JNxVAhd+LbJ+dpLa1gVSfK8fZC2myT+lEgfv6HYjtqx0WBhqr/3l3Wdh10kdb3NTZecJChZHpBw+b7BjCLFR7rmcPT7RyrKU5BxJksVp/4ndp6uMBWTcykndXW8D/FAH33vkvqD0vaDg4dasz7YYjW/lf1TR2JoajJlyXX6p1nw0M8ESTj4A+E7Kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnoRSqVz8NwkGaEKnfY/TKdbV7018ty/TNJ6BQegI6g=;
 b=pAdRj5WlFXM4CxEN2ejvZkug1b7kInGUL9jAyJRg4OVIcQpiksv1gRt7PJ3yRndG9JjXfE3Vq5vvlfw7DOkIkWpAJ8H1YQyITfOP1X23y3yX3U1Phfv7KrIzQWovns28AksrO3yvYjiB4lSCWDAOQOyOlTW8OUvzgp5tjh6uqCGCbs1Af9OaOpMZ6EoaeecMOPnH8bSjmTxGNZ3UMQ2iKyBQ82fiq+ezm3zfjZIynvoFI7/jsLBAraAcCl4hQh6G+MvPB8H8FX4cgL6gGiQ7K+F2JyiD3D66cZm847VE3QILdYitHcbD4LGIXo0L+7bzwL5VZdV8HNyyrhLkiuAucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:03 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:03 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 00/11] Enable rust support for linux kernel
Date: Thu, 20 Nov 2025 07:26:38 -0800
Message-ID: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7417c6-f43e-4dd7-9a2b-08de28494188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFcvdzRkV1cvdzdDUFR0RDZydXl4Qy8zNW1mTUxQcnpnMi9CL3lPeXlmUDVh?=
 =?utf-8?B?Q3lpNnNEelVEY2paL3QvS3RtckswV3FBYVd0ZENmOXdkeUNWd1NVRkFWVGtq?=
 =?utf-8?B?M1k1T2dYS0VITjY4N1VUeW5UbDhuUVdvNER5eHRUdk84akQrd1NrQW1FQTAv?=
 =?utf-8?B?aGFReWtWV2V2YXJjaHgxRDQvTStyYUJhR1BiM3hpcm5INDZ6b0dNYm9Dd0l0?=
 =?utf-8?B?b1NqSTFTNHVoeTZNcXg1UlBFOFhUbXJjbUQ2azJrMjlydUV5WkdadU1LRWQ0?=
 =?utf-8?B?UWJ4VXE1VWtMSUVUSlZsNjUxUXlFN2FOWlltdEthem1hVWoyZHR4bE5pZVNv?=
 =?utf-8?B?VXNiK1pKUjFUMWZJMWFFS2R6ekJuZWVsQ0gwT0hOaUx0T1dSeFdQVmlwWjBm?=
 =?utf-8?B?M2g3Qm9oMjh2ejlQMjdXQkpLaU1xVmpLTndEVWROQ3Z4Si80YSsxSjRiaytO?=
 =?utf-8?B?U1VCYUNjYkI2MG80aFBNaGhOR2lQVVpmeG1SbGdGRVZLNDNKUElwS0FrVnFS?=
 =?utf-8?B?eGlvK2l0YUdZa0x4NXFjb2ZUKzR5dDdoS0pVeTdQbFFMTWpEZnhwWjlCSlMr?=
 =?utf-8?B?V1gxcDFUb2Z3NlBxQzd2eXZuNUR1SjAxVGhBSHJhZWFwc0hNcTQyb01ueS9o?=
 =?utf-8?B?d1ZpbDZYdHJOa2FtYk1Fb3lxcWNnMklhZG9wR2ZVbjBoZ3BaUTYyMi9lVmNV?=
 =?utf-8?B?M1BEMzQ2cjVTRWN0dVp6V0F6N2FveWNXYU8xR1RIUCtuNTlxZkRmanlZMTV5?=
 =?utf-8?B?R2wwcVVXejlxMHdqcGdlNjlkZmxGZ3ZiZzFCc1A1TTlYRWxZd0svNVdVbGww?=
 =?utf-8?B?ZmNHcEdFVXI1aU5NWC9VdnQ0dS9odkM1WFBHWVFGdUdKRjZBU2RsTDNLdjFK?=
 =?utf-8?B?V1VzVlVkVUV2enFzTWxnS0lvdjBXT3M0NllubmY5dHZJQmJUeHRIeURUclBM?=
 =?utf-8?B?RWwvTW9vcGZqNlJUbDZoeGV5SDU0aFkzVWZGVG1xWVEydjNBVFZpSHdQcExz?=
 =?utf-8?B?Y1pNbHZ5NUR3MythVi9qa1ZZR1VXQ1Z6Z3JSRi81djM1NVM3UVorMWJlK1NY?=
 =?utf-8?B?SE9OZ2R5ZWZOS1RXNkZDc3c3Zm5MeUUxMFJZUURBR2laeDdiY0FOcVY2RWN5?=
 =?utf-8?B?dVZ1MCtPUnZXZUpVRVhyQU1FeGlLVm16Y050VDFtTC9mRlBFRFB5WmFQa05z?=
 =?utf-8?B?MU1YREExSmpZdk1kb2NoWGkvazUrcmhwbHRBTUcrVE1LSzNKM0wxd3M0MHRz?=
 =?utf-8?B?NXZSQzQ5eFJXTzNLMk5ob1NFaUdrdHhuSHhsd0hjd0NJcWdjamh3WkswU3VW?=
 =?utf-8?B?cVFvTURFY0tlcUozanE1Zld2aWtLcTYwazdHYzlzWXNoZjVXZ25RU3lnQXVz?=
 =?utf-8?B?N3pWUDg4RkRlWHE0U1U2UnR3ZmZra0N2TkNRMW9WZEFEaUNuN3JseHR2WG91?=
 =?utf-8?B?TGRRMlhEUE5xUjI5dHB4QnJNbjNzaEthdWxYSjN5NXM0UXZuRHN4cWR2SVJw?=
 =?utf-8?B?ZGw0MFVLOHErOE9sZVhqRUM0NFJjVEJrQVYvWlpFSDdVMmlCVFN2MkVONzVB?=
 =?utf-8?B?TmNrNWYyUnVaTDJlMmpOZlQ2aVZLaUxzZkc3dGtzb25vbFNqMCsvS3Y2dzVS?=
 =?utf-8?B?R09aVnFJcUpNS09wQ1p4em9CMmVldGorR3laWlFIU1VDUWlrSnNSYlk1akpt?=
 =?utf-8?B?ZGszeXI4akVBaG9oTHltS3A2WC92OTl2RXdXb0Y4UktsaE5qeFRoTmw2a1Nv?=
 =?utf-8?B?VDh2UjgwNWN3T3BSRExySmRsY3pGRzlxRmllSDNTV3FkZFQ3R0cvSmIzWStU?=
 =?utf-8?B?S0hNMkNJeFlrR0hGSWJxMk5pc0REQUdkdFlqbjF2bm9jTEl0MUV3MjFGOWRk?=
 =?utf-8?B?bWFQMmxESGNOQ1VRV200WStaOE56U1c1WFhKcjFjOC9MR0pkWTFkcGJwMDlu?=
 =?utf-8?B?NVhnMDdGNU01V2wzZi9VbFBacVlnWnI5aXNoRWJGaVJDZHpTa1JRcXpNYmNJ?=
 =?utf-8?B?QmIwSkR6eG1KT0t2aGRkYTgzVjV4Q1g4aU01cnY5dEZqMXN2SFVPek01akVN?=
 =?utf-8?Q?yb3xa5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEF4c1NVM0lhUjhRZ1ZibEhnTUUyZFBOZys4S1hyS3Y1SmQ2bW43SHB0bjhE?=
 =?utf-8?B?bThJdFJrcXZ0blNNRENDY01MUmV3L1VoMlhrR1dtUUlLZm1OdjFMOE5tUk9N?=
 =?utf-8?B?V05QbkFyMEREalp0cjZLeC9VTG8vSHNuTjY5QnpyQ1NnU1kweUVBQk1vbUNR?=
 =?utf-8?B?cEhpM1V3VW41d0ZDWlV1Um9kVXArbGN6ZUloSWhEQjRLNHBlVTVJT1YwMGs4?=
 =?utf-8?B?R1pNbGIrdFF3RElnQi95UzFLRDVramllR3Q3Z3lJS05zYmdjbGR2d3Y1SkRI?=
 =?utf-8?B?K3NVMTU3TFR6SEJ4RG9RSUcyZmYxTTRnamNhWDErbHVKdnBKSDRLZHlKc1Zm?=
 =?utf-8?B?NUU0U3hYRWQ2QUkzLytsaGVkaGRqQ1d5Z08wWkJxc09sRTNaN2JuaDRXcFJK?=
 =?utf-8?B?d0xSM0hSS2dMZ25iSlpCT1E0ekVOKzAwNVdYcWsrdlloSjNpNnNLVTZVSW05?=
 =?utf-8?B?VWxEOVNjbWN6QWprcjlMbkxSK29HS2tORzZRU3B5eE9UL1RYR1B1bWI5ZFpj?=
 =?utf-8?B?c0pyQWlZNGpxangvZE52TXJtQnU3aEJCSHVORXFlbnZTYXBpYXd5V21QVlNQ?=
 =?utf-8?B?OHdVTXJHTjN5S2toZkhGalR6TlpqalBOWFJ1T3dIb2NIZmZHK1Foa1NhcDZP?=
 =?utf-8?B?Ymo0akFtSHJJUEY0eEhKTjdTQStpV2kxMnIxazlSMVpuMUpHaG42QWJUOVZ6?=
 =?utf-8?B?UHFncHpQMnhHaktVeXpsTEx1RUZQRUlsakVhOHFVM2R3ZENTMTRET1h1QXBN?=
 =?utf-8?B?QjMzMzNaenZ4U1NNWDdPc0N2U0pMT2JkWmlGSnVwZHdoMmtvNHE5a0VvWXp5?=
 =?utf-8?B?clBUM05YbFNiWS9ZNC9XOEFUZ1B5cHBTWThUMHNBTGsxL2NzSjVIM3dJbHlI?=
 =?utf-8?B?ZU53aHlDRFBtUW04VTU3N0tteXIvOGVvdmZPdGJYYks3MXc3bHJPS0FpakVx?=
 =?utf-8?B?VHJxS1RucTNqd0xnalRaSDgvNTVsTEpoOVhmcHF6bVNxOGVHeWNuOCtrTlpG?=
 =?utf-8?B?OUR0citQVGJqT05tN2JxQjIyMGVNMksyVFVGV3VNQmIrVGNzRWlPYzdyRWdQ?=
 =?utf-8?B?TVRGK0xoYk54cjIxMVVJa0x5RGNaaFVzZlcvMXNlNWtKRHhMUElqdEdBakNO?=
 =?utf-8?B?Mk9IM3AydlRQZkdpQUpKY1dwQzArNGo1OThXYklpQnhGY1JNdEJETXUzTk5h?=
 =?utf-8?B?VjlPWGdzTTBWSWZiSm41TlVQemhYSzhna2dRc0p0M1lXR01pS0l2aWF2QjQ3?=
 =?utf-8?B?Mmo0Qk5OWjlVNWZEUGFjSVdETlFKK2hPbVAzMTR5N1hFbHZkUTRmNU5RaUJR?=
 =?utf-8?B?aWE0cUdrNVJRQUVvRnkyZFJwRThFTGdoSEMxVkhpNExuRDBYNnRKQWdlYi9N?=
 =?utf-8?B?U3ZqTUZjSDUydHNsaEs5QStGOEZQS1NaK2RPQURKRFoxNUtad3FWU2RpZTBo?=
 =?utf-8?B?clRhR3RGRE9YUHpmMnAzQTJSNkxjWnF0OWZ6bVdIY3NWMXltMUQ4TjJaanFk?=
 =?utf-8?B?WVlPTm5qR1V0ampINkIyVTM3dklERURocnJ3Nm1rVmVJdWZXYkt6ZWZGMTY0?=
 =?utf-8?B?VnYveWxwT1dWb1doUVp3ZnI2UVFPZWhGbk5zUS9xZFZWN0ZZQzV6b0lQaFdX?=
 =?utf-8?B?T1Zzb3dQNCswbDhabU9icFhZVjJHS0tWRWtvR1FHOEpaQ1dFR1I4OU4yTzR1?=
 =?utf-8?B?aVRyZUJ2NEN1dVo4eGNZK256S28ybDkweExKUW9UQ2dzcG5EbVljVStybHA1?=
 =?utf-8?B?MklsK3FUdzhRZDRyNks2aTljaXNmSUh4V290WEVnQVVCdFJIZzZJMmRNN2Va?=
 =?utf-8?B?QWhxM3RVaDFVdXFuWDdScjJPWDZ3UEU0enVtZFFNQkdROFhoTnBIU0FUNWQx?=
 =?utf-8?B?ZzZQbnQ5aVc3L2dha2l5dmFpaVZ4eVA3aWdDQzZ5WEtqbHdFSFRpczAweUQ2?=
 =?utf-8?B?bzVzQjN3bnBwRWx3elk0R1JRKzRjWjVRT28ybHUxVElialc4aGo3d2NlSXZG?=
 =?utf-8?B?S1h5RitFK2twYjVUTlEzSHluQ25idWc1U243dFU4dy9CQUxwV2owNytHWjJi?=
 =?utf-8?B?R0VnYkkxVGhCNzBrWG5pSWNaMncxTmJPS0ZiRnhPUmV2WmwyeEJhWHNsWnpa?=
 =?utf-8?B?S0RnRE15Znp6RU9FN2w5RXBrY05ZQ2J3MkhucGlYOGt4Qnk4SU9CLzJMUmI1?=
 =?utf-8?Q?9ysLTpCv2qEJxPpR8K7F/tA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7417c6-f43e-4dd7-9a2b-08de28494188
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:03.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uu5xviOUQEjlb8vjUPSoSI3EUa0y9E+/0zRZe1IP1Fa5K3se2t0ag8RHdbbRKkMKWiUPwYnlX8gbRbJuhye2P5RJ3aJdheONQ8Zx/FKRAEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX9afBhtqARUD3
 7GCxw+ByQYyn4LkYbhq7kRgq4lPYe/Ljc9OblHMgtSBD16GXo2IkIji+elJMm2OxveHKGyhJA0R
 v4hSEZb8XxXcoaYQB+NzDOZAGb1wZkan/5ZMGiRxqjdZGt+7xw1+6Gy9ZQNaB3z35n0xHCChF7c
 OsJKfH1/JhVHZepLnEOxr5uK4Z0GU1iBDM+9hbxFYHPF1Myt9VEDDZfBfv+8z+r6NySbNPPfECW
 uh/YjXoS7pvBJb0s2wuY7b8ARoVaqvlipdErQB19mdyyYPiUmWxj3N7EklG4cJdwB8eLoG0C8Jn
 URFhdG6A5+z4BEIh0ow2gS9YHQE52N4RGLrLj5PlvmL0z+cJuMaeSGjZk/0THOYdiJNyAvr1GBS
 edqtJ5vHpgr/rA/qjBXJOSzSFxFrBg==
X-Proofpoint-ORIG-GUID: Xqj4-RN2Am7KfUc4uW3DKyNagXUadaOm
X-Proofpoint-GUID: n2AJWgNzGgNrHCR8tJ6uXfuBawbHxslz
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691f3349 cx=c_pps
 a=N6jWaT6qAb3kxWP2Z7atcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=SF7ZRt_51XJYnt0nrtcA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226623

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v4:
- Removed rust-debug.scc from linux-yocto recipe.
- Addressed RFC v3 review comments on typo's and commit message changes.

Summary of patches:

- Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 2: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 4: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
           propagates from target DISTRO_FEATURES to native/nativesdk builds
- Patch 5: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
- Patch 6: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 7: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
- Patch 8: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 9: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 10: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 11: Added an oe-selftest case for the Linux Rust sample.

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Test results:
- tested with oe-selftest case for the Linux Rust sample for  x86_64 and arm64.
- tested on rust-out-of-tree kernel in sdk for x86_64 and arm64.

Harish Sadineni (9):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  bitbake.conf: Include "rust-kernel" in native/nativesdk feature
    filters
  kernel-yocto: stage rustlib sources for linux-yocto 'make
    rustavailable' support
  kernel-yocto: add rust support via "make rustavailable" in
    do_kernel_configme
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel source to $kerneldir/build

Yoann Congal (2):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample

 meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 24 ++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb     | 17 +++++++++++
 .../recipes-kernel/linux/files/rust-debug.cfg |  1 +
 .../recipes-kernel/linux/files/rust-debug.scc |  3 ++
 .../linux/files/rust-samples.cfg              |  4 +++
 .../linux/files/rust-samples.scc              |  3 ++
 meta/recipes-kernel/linux/files/rust.cfg      |  3 ++
 meta/recipes-kernel/linux/files/rust.scc      |  3 ++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.17.bb |  2 ++
 15 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

-- 
2.49.0


