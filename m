Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D0FCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 04:55:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1048.1761713748254746072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 21:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Cl0sJr2f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=33974254f0=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4o35m2851409
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=sHuUUQgIlfcXK7UOtYyGchtabUdYKgjt2igT8ze5a/Q=; b=Cl0sJr2fg5R7
	dPlwI7ob17KkGzQWwuhte5x5LDmsdxBWSoIRMh4DHDkTPSNXD6iYIbp7Z+lJVMfL
	RUiaZPeXcU2HUrJDvIr8XuMrbnVaU0WlMKkL50mYTM0+iP2Zw1SC5ddfl4PzRe5k
	AkYkmTUMxKDCPzG7t1Kfu5llwtCESU/lZnh40x8R9z2/G8efCCPC3FVSq4PFu17W
	G9NSvEgd8UFJQgcQYkv0Vkr9pwVU7RC70no6Ejh3JKqu3hREH6vtleng2Pxpws4b
	wxCP7tjkJt0aEbJa2LMowJUJuU8p8U5mLogX6PJHyy+i63ljfLVD8Y2QmCWXI0kC
	h9vM0RLvtQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3489gde1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwdGZf0KEcbAwOtrVJFdcCmDJA98waySn65laEbW1IpPzJsrtln/NOJYHecK4mxzlu7DLjtLUhrRainPT9+1+ZiXsM+FWDQO4WeozQU2YpvqFznnAEoTzLMRxu2Zhoc86RMllqdPYKt3DNiqUbk1aO+2iV1OmfesKGoTJVM9JzH8fldlhzZOp0Y1M/lF1NJQlnq+M0J3jahc49GKODdPSrDWDrGwoVyAXxolPZ58csXa8AfPY/+48R3tR3yPLRNVmXeDS7JmjzzZ4h/ESj+1r8C9WBS0d3/D6EqXKVKmh5i4V9ddp69zvJQ52+0XyGlrQGwDWb4sH1k9Tnw/JnGlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHuUUQgIlfcXK7UOtYyGchtabUdYKgjt2igT8ze5a/Q=;
 b=qP5y7EYW756cPNo5gMV++IIpQjVVuDXU4xKdzXvt/sELxvGekfLK14k9DtARuI10UmrbHMtjUxkYJm2ZT/p8NwtvkoqeSKbyCy8dL1SK3oX/bhLxRQ0DeFrJBkZ0nJa6DdPt14LWwNmnggG98G1U22tTpOczhgdZPLOmbWAzpk5plKMb+05pQXNqcdeQj9sLX9rnMVuJGynJaJ5jKj0SP2n3+roW3DsGhcKTNCr5TQIl1JlEIEfij3anhEy50B2elSVJ3lX3mD8UrZf9UUfa9ocahuBCfP+bs9dm6SmX48iuK9m5jErRanUMgZXZekSyMR3EQ54FV5HGjkfOFHdQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 04:55:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 04:55:44 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 2/3] systemd: upgrade from 257.8 to 258.1
Date: Wed, 29 Oct 2025 12:55:26 +0800
Message-Id: <20251029045527.2865818-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029045527.2865818-1-Qi.Chen@windriver.com>
References: <20251029045527.2865818-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: KU0P306CA0001.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: ee37c384-243f-4f97-fa6b-08de16a76a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UFhiWkRmQWU5WUNGaVRiMmFEZ21adSt0b3JRYndaWENIVVl1N2QzN3BheUp0?=
 =?utf-8?B?aHpXa2M2SEdINkdUODRob0JIYjBTMVd3OTBjSkpFS0VFSzJKUUY0Mkxlejhw?=
 =?utf-8?B?WTFCRlFlc2xDSEdBT3U2VDA0ays2Q2lVQTUxcHlXdHNjYVVlNkp5cVAyaXFt?=
 =?utf-8?B?WXFPZWdON1F6K1JVOXFCWkZsTURpczBnVjhEN1RaYVlhODZZd2s2RDhZSWVh?=
 =?utf-8?B?M2Zoa3oyQnpZMzZyN29OYkk4cHdJQ1FEZlNpZEM5VTJtRVZBRHp1Nm1JRWhy?=
 =?utf-8?B?ekJkK2xvSTNDU0FyODYwQldzeG80cDNRNjROb0pDVEU3Y0k4SGtQeGtBR0ox?=
 =?utf-8?B?NGphTFJjRkVpYklnN1kydzlQY25LT0tFRUp1U2s3TWxJL24xVS9sKzFiRFpU?=
 =?utf-8?B?ODZYdGp6YlJubERJbk5xTEJpcktOMXgxUlFtcVZ5YVRvdy9uSWRjbElvNlFV?=
 =?utf-8?B?ZXNJN1ZUSVJVVXFBeXFQdE9oWVV6eWFLOFI0MkR0MjVwQ3BVTTdTd3NnM2Vl?=
 =?utf-8?B?M2l2aTl2ck1CNHRFTGVrV25lNmZPTDNyeFJnM1pDL0pHakhwMkNyZldSUlFv?=
 =?utf-8?B?YVlLelNrZC91bUpDSURjRGVtaUtRZEdWNzdQVGgzWC9wcm5PT0VTSmhTbE5s?=
 =?utf-8?B?dUptTlBZQW5kNUdBdU5mWkR1UzNlRDJOQVhQSy9kQ3ZzT250U3RsSElFYzJ5?=
 =?utf-8?B?YVkxOTVkaGUyZ0hkKzdZS3lUYjdLLzBHTDFNSktTTE96NFAwZXl4UTY2VXJk?=
 =?utf-8?B?N1BaQU9FRXk3RG5melhGd3FlTWVUN2E1Y3ZNRFJzb3p3MUJubHduSjc0Y2lO?=
 =?utf-8?B?cmtuV3FSWm1WRDBlT0RnSUp5SHVMMWV1V1pPNnZJVmh6N1BHQ2ZNcE5tOVBJ?=
 =?utf-8?B?RXk5UEROUnVkNmpWUGIrbFljalhMbWE5RjVzUGwxRVpKQzl0L1hIWkd6bEho?=
 =?utf-8?B?Q1RNVUlEbmxDcmZBaTlqU3prS2xLcFovNzRSNGhOd3dkTkpQSkNMMnpxd256?=
 =?utf-8?B?dHNsWDFyQStPSkNyVnJFczFFMzQ2ME9ERndEL084N0dpMk50cDhiTGloZlI1?=
 =?utf-8?B?SUozSXd3eWpiemRMVUYxOGo2dW55TXp2OHBRSjVGdXpNWThERHRkck9sNkxt?=
 =?utf-8?B?REgvd2tERHJvMlZmUWpZQS9iaXV3ZDFJQ0xJdWRCTGxYYW1mWlJKbmJhUkRZ?=
 =?utf-8?B?a0NObkxNWUxWYkJHMGduOHVPNGIzR25iaS9PaU5ySnl2TXRCVk5XOUhQb09i?=
 =?utf-8?B?cWszT0tNUXhJcGtKOE1EN21pcTVsMCsyK2NWYkJROThFU29tcDVadDQzTUU3?=
 =?utf-8?B?SVlneU12cm9tNk5JcWpzK0pVbDhDT2g2U1Q1a285OGx6ZHU1OHZrUGtXZjhk?=
 =?utf-8?B?R2RUeGVQU0R6c01sL09MZkZTQSs1S2JwbjVPRmZWK1RKZDlXUjRIQ3RyU2VB?=
 =?utf-8?B?RFJxNzFVVitvVHViaFJpUnk4aHk3Nml6VUh5QmdVVEdxVC9WMzNqSG40RUtV?=
 =?utf-8?B?RWhOb0lXbFZxZUlmcVZNc2FaVkxEMk9XRDBLUTdJWGQrRkRRcEJOS1RlWDdl?=
 =?utf-8?B?anVtZ29sSVFqWkxEdzVlQTR5UXZKU00zRnNFcUZFSHQ3OEQxbFdvWXNzTXBY?=
 =?utf-8?B?YTNmeWFuR2FTYkx0YzQ2NFp1M0pPcGQ0d3RZWXJ0djhzWE1XeU5YM1N5cXd4?=
 =?utf-8?B?Ym91QnRVOHZXZm85amVUdzdSL0hNbDNBSUluQkRCUWNBMHMrT0MzSFh2SWc3?=
 =?utf-8?B?R1piU3ZFVDRxNmgzb3pOamVqREpENDBEWG1KK1ordkpIUmxyYmp3QXBQRDRF?=
 =?utf-8?B?ZTU3OXh0dzVNbWppaTN6azlTc0JGSXFwSWd4ay95S3I5KzRNVEw4NllHU1pS?=
 =?utf-8?B?NU1tOFM5WjZRTWJpaG5UcjZQTWt4VjQ1VHpYdUppd2FIMTlCY3pVY3lHcW1E?=
 =?utf-8?B?K2FmTHJZNlVxRjFmWDZGREdjY3FTSEpTR0krd1diaWV5bEo3YkJSeWpxNzkw?=
 =?utf-8?B?eXM0Y1I3dnZzaXZDc05ibWZPeG40czdQZmlIVXJ4UDNZODM5SEJQNzJxYXRR?=
 =?utf-8?B?cVdnZVJtNmM0emJOQk4rWHlEN2VWS1pZRWJuUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eE5sS1JsejUrbVdTMUZWUjJZUzVsSkpBallxcEFaTmF4d2x4SnVIQ0I4Skd2?=
 =?utf-8?B?b0tyaUQzeXQ4YlpweVJTTHN4bnNCM0hrdlNjWHo5T01adWhSUHh4QXVRc0RV?=
 =?utf-8?B?TVpxRVNKT1ViTnhvbXEwNUFsK2ppQXEvVm04VmF3Z0RBbkpjWU1LZnBqQ0Qz?=
 =?utf-8?B?NFBnajdwUnI0Ukh1SW1NVkdOSzN6NkZ4bnFyRm1iOFdsamxYMXhFZ3B1N2xz?=
 =?utf-8?B?YitCQ0hkTDhOZWNUSEZFNkhHRjl4b2s0UmlyaXBHVnJ0Vmx6S0h1QmZtcnRU?=
 =?utf-8?B?akU4bGRidjRoYVJiM1MzbmJCQ1dZcVdFNEp2YTdnN0VudTYrdlhEWmtLWUdq?=
 =?utf-8?B?RUhqRUxlRmhRd1dnaXd1bFZwMFpScHVWNnE3cVBSZmRmT2JybkZTNStFQ2JN?=
 =?utf-8?B?cnQwVFdlN0xEbW5zZytYQm44TjhGc2pFMFo0b1lTVzZTRWFoMVV5YlAweS9a?=
 =?utf-8?B?NjU2bGdFa2VKbG5DMUhNMnpNVGJMa0JYVGxGNW0vaGVNZ21PaVAyUVdLK3Zh?=
 =?utf-8?B?M0pzYVJEaGFqa1Vsbko1VlMxWDlmblhtcE5IYUptZitpZGJoQU14WWNPYzhW?=
 =?utf-8?B?Mm1FRmFJc2RsSUgvZ2tDWUdBV2NWdi8yd0JyREp3amRtRTErL2R4cVFGYTZH?=
 =?utf-8?B?VjU1K091NmhXeVgrc3IvWEFyMnB2RVFuR2JvakNRSzhqNmZBZ3lLTVVwUXJX?=
 =?utf-8?B?WHJLTzQ4dFpvdzZ3Y2kzY25UeHdqUkpab2VxaldKcVQ4UGVpYWoxVUNSOUdh?=
 =?utf-8?B?V296eWRqK3VFWGVwZFcxYXlYQnp3L1lTU25JMTFIUXRxR3lkQk40RHdFQnhN?=
 =?utf-8?B?WmluZC9DdHlUYXo0aDNoaGpkMFFEYkFIbHRKR1FOUVNpb3NoRUxEMVBodWF0?=
 =?utf-8?B?SVh6TmFERCsrdm5FWDZtdlFKdnVIc2tXWGNWUVFOZEVvNEFiRjQyUGZnc21Q?=
 =?utf-8?B?Yjg5d1FoWXFnaEQvczJMaUhkVDR6YnkrVmtOZTduSjRWVWdjQmtaUjZEMmZj?=
 =?utf-8?B?UDg2S1lrcnRhOWRDand3NzdLSnFJU1ZuVmgrM2NTR3hvOS9XZjNkOXUwMjhO?=
 =?utf-8?B?Q0c4WUxKSkVaUmkxUUt2MjdvbjAzdWdPWEUxaDFoUFFkYlJwbkVXT256VlRI?=
 =?utf-8?B?enVTZFQyKzVOTDhzbzJPNW85THRxdTg0UHpiVU9vK0ZPdnI5MTY2WFJnRzgz?=
 =?utf-8?B?R2FyeFJGRGdnc20zdm9VL2h1NlJ4bGhuaXFPa0Mxc3BOcFg2VUJqMDdUU2FJ?=
 =?utf-8?B?d3BFbmVNbzl4T3drZVVvQzl1UVdLa09GNGE2NGFsQXpxTTZ5OGcwWUtPMHVS?=
 =?utf-8?B?VTFoWEN2ZFFEcm5WRnBrdzlNVUJ5TGx1WHRUNHZPT2Q4bWRTY0tuMXkwMmVE?=
 =?utf-8?B?U25VLzVkQzErN2JZOGoyNzFnWWlZRTF1dU9wYXNLL1NzcEpJV3dIN2pXbk1x?=
 =?utf-8?B?UEphYW9GcEdLbmdod0Z4c2Nnd3JSTEVuQ1labFBvOG83UnhoRTVjOW5WYnl3?=
 =?utf-8?B?dkVERE9jWXBTME9LMmh4aE9ZQUJSbUZySW0zRHRYMDFNSzlBbG5kZWhqNVp2?=
 =?utf-8?B?bFFhOUdndHdWZ1YwQnlCWTNSREJoL3djZU02TStjM1EwQm1aeFNRZTNtdFFD?=
 =?utf-8?B?amhRcmZydVk5dlV5amdSdkU4c2tFV0huTEVzY2FxNnNFRGhFc09oTVVLbnht?=
 =?utf-8?B?N0kvTHZ0dDRYOXVwRWxTd1ZCTFNLSzZheDVUTEhGSTFtcmE0TGszRHZFUVg0?=
 =?utf-8?B?TVBsandOK2VmU09WT1pBbEpaeFBGdnlrSklrRGJNU3YwT0Zka1pROUVFUXB2?=
 =?utf-8?B?bHNFWGNvcERYeDYzNkE0V0ZZeVFiVDZXRFMwSWlSbjNsUTA5WU5nd3lDWGoz?=
 =?utf-8?B?bytVUktYdE1WU0I4ckJJU3lBeExDVmhBVmpFV3N6R24vdVFYY2pOR1JxZlNk?=
 =?utf-8?B?UXYrcDhySjRtYmpmbDVXZ2RmSTAyK3g4RTJ2c3Z3YW1SRS9tWmlOdkkvSW84?=
 =?utf-8?B?enp1OTNPYXdWUnRXTSt2aVBMTURVM3U4MUkvbzJGNWhQSFQ3MEpGcEMvUWtl?=
 =?utf-8?B?NEZkekZGdHIvbER4L1gwVnFaUVdrZEhOcWVSdjR3UUpsaGRQY1ZjREROWExv?=
 =?utf-8?Q?nmPGmkhJjSx+KURVmghTNA09O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee37c384-243f-4f97-fa6b-08de16a76a84
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 04:55:44.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLbZcg2QbjOlkpqnJaFP0qRF+lcck0zaCLOnkxzwFXnGw/UeAh1kg1LLzfRZlVxPexsOA5aWpSp3s0rYHN+Lvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
X-Proofpoint-GUID: bwZgwrxnS1MqZz9hjFTQpXkaXc-79wp3
X-Proofpoint-ORIG-GUID: bwZgwrxnS1MqZz9hjFTQpXkaXc-79wp3
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69019e53 cx=c_pps
 a=7NCjPUurWbS4kF9YcBnZ4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=uPZiAMpXAAAA:8 a=XkRKQH6RAAAA:8
 a=t7CeM3EgAAAA:8 a=k-42gJp3AAAA:8 a=3-RhneuVAAAA:8 a=pGLkceISAAAA:8
 a=a_U1oVfrAAAA:8 a=QyXUC8HyAAAA:8 a=yMhMjlubAAAA:8 a=fO35AekCh6eYuPPLMSAA:9
 a=QTU-WVVtynww0T_P:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1gUyE30hU_ULiMxJiLUW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAzNSBTYWx0ZWRfX3iQWKJmaioWs
 UKIYPN1TYj+yoQ8egBIpcOSUbOzBxQjfhdOMLEklBWnmlldufuvMWFK4H5SJUBYXk5ZluQsWdk2
 cNhbzZLs6cPVAe6zjT+2iKXlCqHJjEuUKyp6Bo9vOYDVNlEApniuryCUVTU0FZoipS9xOvlogZ1
 EsU+YNr7qo7a0+OA5yPkOcDWPspcbGFrxccjb1qHBXNifjTvA049l5T44WwCjwHTlu9aOYh3Krx
 /NAWoeF26w7Nxerg4ozvhNRhlUuVKtquHdi0IFGMf64gVRMlRZTwTvfJtOvWyrGENt1m2MKBQcH
 D6sQd27Bx1r/XOMbHXlLbVK4vhLsUN3Q6w8SRvTdYxqLP/G20O+k9d3fze1rS+SMEL1ebHTTqCw
 XMeKwc1CCJTY/IAy4EWeZwMaiMFrDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59T4o35m2851409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225432

From: Chen Qi <Qi.Chen@windriver.com>

v258 Release Changes:
https://github.com/systemd/systemd/releases/tag/v258

v258.1 Contains a critical fix for our link-udev-shared PACKAGECONFIG.
https://github.com/systemd/systemd/commit/49b701531486536f69dcd2ef2cfc10d=
468847481
(meson: fix link-udev-shared option)

License-Update: update address of FSF.
See https://github.com/systemd/systemd/commit/d4802151b0be56d79dc171880fa=
3df0ed6f5f8fa

The 'runlevel', 'initctl', 'telinit' related contents are removed
because they are offically removed in v258.

Disable tests explicitly. This is because we're not installing any
tests. There's no point building them out. And this puts extra burden
on making things compile for musl.

gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the only
supported cryptography backend for systemd-resolved and systemd-importd."

systemd-systemctl-native changes:
sysvinit compat actions are removed. This includes removing unncessary
patches and adding EXTRA_OEMESON. The systemctl-native should only focus
on the systemd units as it was. The removed two extra patches look like
a workaround to make do_rootfs pass. But the correct behavior is that
systemctl-native should not invoke systemd-sysv-install and only focus
on systemd units.

musl changes:
1. This version has big changes in musl patches. The goal is to
   help maintenance. I want patches to be more easily applied
   to new versions. The count of files modified by musl specific
   patches decreased from 113 (v257) to 34 (v258).
2. All patches are re-evaluated.
   This version of systemd introduces big changes in header
   files and other places. So the previous musl patches are
   re-evaluated one by one. Those that are dropped are considered not
   needed. A few new ones are added. There are some notable ones.
   0012-do-not-disable-buffer-in-writing-files.patch is dropped because
   there is not runtime error.
   0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
   added because this version of systemd uses strv_free to free gl_pathv
   instead of relying on globfree provided by libc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ..._257.8.bb =3D> systemd-boot-native_258.1.bb} |   0
 ...md-boot_257.8.bb =3D> systemd-boot_258.1.bb} |   0
 ...8.bb =3D> systemd-systemctl-native_258.1.bb} |   4 +-
 meta/recipes-core/systemd/systemd.inc         |   8 +-
 ...tall-dependency-links-at-install-tim.patch |  10 +-
 ...ll-systemd-sysv-install-without-path.patch |  37 --
 ...implment-systemd-sysv-install-for-OE.patch |  13 +-
 ...> 0003-Do-not-create-var-log-README.patch} |   9 +-
 ...3-missing_type.h-add-comparison_fn_t.patch |  61 --
 ...ntroduce-header-file-and-add-__THROW.patch |  61 ++
 ...-parse_printf_format-implementation.patch} |  79 +--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch | 156 ------
 ...info-related-contents-glibc-specific.patch | 117 ++++
 ...006-add-missing-FTW_-macros-for-musl.patch |  44 --
 ...07-Use-uintmax_t-for-handling-rlim_t.patch | 106 ----
 ...override-sys-prctl.h-to-avoid-redefi.patch |  43 ++
 ...patible-basename-for-non-glibc-syste.patch |  34 --
 ...ompliant-strerror_r-from-GNU-specif.patch} |  20 +-
 ...uffering-when-writing-to-oom_score_a.patch |  41 --
 ...til-Make-STRERROR-portable-for-musl.patch} |  17 +-
 ...-util.h-define-RLIM_FMT-to-fit-musl-.patch |  40 ++
 ...definition-of-prctl_mm_map-structure.patch |  32 --
 ...ride-malloc.h-define-dummy-malloc_tr.patch |  41 ++
 ...-not-disable-buffer-in-writing-files.patch | 530 ------------------
 ...tion.c-avoid-using-glibc-ConditionVe.patch |  47 ++
 .../0013-Handle-__cpu_mask-usage.patch        |  60 --
 ...c-avoid-boot-time-segfault-for-musl.patch} |   8 +-
 ...014-Handle-missing-gshadow-for-musl.patch} |  77 +--
 .../0015-Avoid-sequence-point-error.patch     |  35 ++
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  42 --
 ...-for-glob-related-codes-and-define-d.patch | 409 ++++++++++++++
 ...ass-correct-parameters-to-getdents64.patch |  37 --
 .../0017-Adjust-for-musl-headers.patch        | 526 -----------------
 ...ays-include-netinet-if_ether.h-first.patch |  40 ++
 ...trerror-is-assumed-to-be-GNU-specifi.patch |  52 --
 ...ake-malloc_trim-conditional-on-glibc.patch |  39 --
 ...hared-Do-not-use-malloc_info-on-musl.patch |  57 --
 ...22-avoid-missing-LOCK_EX-declaration.patch |  56 --
 ...gnal.h-to-avoid-the-undeclared-error.patch |  27 -
 ...references-using-stdin-as-a-struct-m.patch |  48 --
 ...clusion-order-to-avoid-redeclaration.patch | 288 ----------
 .../{systemd_257.8.bb =3D> systemd_258.1.bb}    |  67 +--
 42 files changed, 969 insertions(+), 2449 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.8.bb =3D> syst=
emd-boot-native_258.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.8.bb =3D> systemd-boo=
t_258.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.8.bb =3D>=
 systemd-systemctl-native_258.1.bb} (87%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemctl-Call=
-systemd-sysv-install-without-path.patch
 rename meta/recipes-core/systemd/systemd/{0001-Do-not-create-var-log-REA=
DME.patch =3D> 0003-Do-not-create-var-log-README.patch} (84%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-missing_type.h=
-add-comparison_fn_t.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-musl.h-introdu=
ce-header-file-and-add-__THROW.patch
 rename meta/recipes-core/systemd/systemd/{0004-add-fallback-parse_printf=
_format-implementation.patch =3D> 0005-add-fallback-parse_printf_format-i=
mplementation.patch} (88%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-don-t-fail-if-=
GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0006-Make-mallinfo-=
related-contents-glibc-specific.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-add-missing-FT=
W_-macros-for-musl.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-Use-uintmax_t-=
for-handling-rlim_t.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0007-add-src-includ=
e-override-sys-prctl.h-to-avoid-redefi.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-Define-glibc-c=
ompatible-basename-for-non-glibc-syste.patch
 rename meta/recipes-core/systemd/systemd/{0010-distinguish-XSI-compliant=
-strerror_r-from-GNU-specif.patch =3D> 0008-distinguish-XSI-compliant-str=
error_r-from-GNU-specif.patch} (77%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-Do-not-disable=
-buffering-when-writing-to-oom_score_a.patch
 rename meta/recipes-core/systemd/systemd/{0019-errno-util-Make-STRERROR-=
portable-for-musl.patch =3D> 0009-errno-util-Make-STRERROR-portable-for-m=
usl.patch} (72%)
 create mode 100644 meta/recipes-core/systemd/systemd/0010-src-basic-form=
at-util.h-define-RLIM_FMT-to-fit-musl-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0011-avoid-redefini=
tion-of-prctl_mm_map-structure.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0011-src-include-ov=
erride-malloc.h-define-dummy-malloc_tr.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0012-do-not-disable=
-buffer-in-writing-files.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0012-src-shared-con=
dition.c-avoid-using-glibc-ConditionVe.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-Handle-__cpu_m=
ask-usage.patch
 rename meta/recipes-core/systemd/systemd/{0026-build-path.c-avoid-boot-t=
ime-segfault-for-musl.patch =3D> 0013-build-path.c-avoid-boot-time-segfau=
lt-for-musl.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0014-Handle-missing-gshadow.pa=
tch =3D> 0014-Handle-missing-gshadow-for-musl.patch} (71%)
 create mode 100644 meta/recipes-core/systemd/systemd/0015-Avoid-sequence=
-point-error.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0015-missing_syscal=
l.h-Define-MIPS-ABI-defines-for-musl.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0016-Fix-the-segfau=
lt-for-glob-related-codes-and-define-d.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-pass-correct-p=
arameters-to-getdents64.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0017-Adjust-for-mus=
l-headers.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0017-Always-include=
-netinet-if_ether.h-first.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-test-bus-error=
-strerror-is-assumed-to-be-GNU-specifi.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0020-sd-event-Make-=
malloc_trim-conditional-on-glibc.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0021-shared-Do-not-=
use-malloc_info-on-musl.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0022-avoid-missing-=
LOCK_EX-declaration.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0023-include-signal=
.h-to-avoid-the-undeclared-error.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0024-undef-stdin-fo=
r-references-using-stdin-as-a-struct-m.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-adjust-header-=
inclusion-order-to-avoid-redeclaration.patch
 rename meta/recipes-core/systemd/{systemd_257.8.bb =3D> systemd_258.1.bb=
} (92%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.8.bb b/met=
a/recipes-core/systemd/systemd-boot-native_258.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.8.bb
rename to meta/recipes-core/systemd/systemd-boot-native_258.1.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.8.bb b/meta/recip=
es-core/systemd/systemd-boot_258.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.8.bb
rename to meta/recipes-core/systemd/systemd-boot_258.1.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb =
b/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb
similarity index 87%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb
index a37c9035ed..3d01d60e9c 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb
@@ -6,14 +6,12 @@ require systemd.inc
=20
 DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2=
-native"
=20
-SRC_URI +=3D "file://0001-systemctl-Call-systemd-sysv-install-without-pa=
th.patch"
-SRC_URI +=3D "file://0002-implment-systemd-sysv-install-for-OE.patch"
-
 inherit pkgconfig meson native
=20
 MESON_TARGET =3D "systemctl:executable"
 MESON_INSTALL_TAGS =3D "systemctl"
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
+EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
=20
 # Systemctl is supposed to operate on target, but the target sysroot is =
not
 # determined at run-time, but rather set during configure
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
index 761660f2c8..daf37060d7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -12,11 +12,11 @@ work as a drop-in replacement for sysvinit."
=20
 LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
 LICENSE:libsystemd =3D "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
-                    file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
+LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e=
6e72d2c6 \
+                    file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420=
a007368f2"
=20
-SRCREV =3D "5e38d199a623563698ab4a69acbbe3afa9135198"
-SRCBRANCH =3D "v257-stable"
+SRCREV =3D "67a1069b7269cc23c3d04a2fb0cf110abe7abf31"
+SRCBRANCH =3D "v258-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branc=
h=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd=
/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 5101f9227e..8061ff1000 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
@@ -1,7 +1,7 @@
-From e5fd143f215f072404c544f694cb026a4231503e Mon Sep 17 00:00:00 2001
+From b1ab58d3b4a8164e5978409706d6769f5cfde404 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH 01/26] binfmt: Don't install dependency links at install=
 time
+Subject: [PATCH 01/16] binfmt: Don't install dependency links at install=
 time
  for the binfmt services
=20
 use [Install] blocks so that they get created when the service is enable=
d
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  3 files changed, 7 insertions(+), 2 deletions(-)
=20
 diff --git a/units/meson.build b/units/meson.build
-index 96f4852741..0a3a4fee67 100644
+index 4f47a3b2bd..237870025b 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -156,7 +156,6 @@ units =3D [
+@@ -154,7 +154,6 @@ units =3D [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index 96f4852741..0a3a4fee67 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -258,7 +257,6 @@ units =3D [
+@@ -263,7 +262,6 @@ units =3D [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
diff --git a/meta/recipes-core/systemd/systemd/0001-systemctl-Call-system=
d-sysv-install-without-path.patch b/meta/recipes-core/systemd/systemd/000=
1-systemctl-Call-systemd-sysv-install-without-path.patch
deleted file mode 100644
index bf08dbe9b0..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-systemctl-Call-systemd-sysv-=
install-without-path.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 34c8551a8b16bf235a1ebe8d9cb1a3474a7c975e Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Fri, 22 Aug 2025 18:07:28 +0200
-Subject: [PATCH] systemctl: Call systemd-sysv-install without path
-
-Expect to find systemd-sysv-install in $PATH instead of hardcoding the
-path to it, as the latter does not work when running systemctl from a
-recipe sysroot.
-
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Upstream-Status: Inappropriate [OE specific]
----
- src/systemctl/systemctl-sysv-compat.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/systemctl/systemctl-sysv-compat.c b/src/systemctl/syste=
mctl-sysv-compat.c
-index cb9c43e3dc..e44ef9f64e 100644
---- a/src/systemctl/systemctl-sysv-compat.c
-+++ b/src/systemctl/systemctl-sysv-compat.c
-@@ -140,7 +140,7 @@ int enable_sysv_units(const char *verb, char **args)=
 {
-         while (args[f]) {
-=20
-                 const char *argv[] =3D {
--                        LIBEXECDIR "/systemd-sysv-install",
-+                        "systemd-sysv-install",
-                         NULL, /* --root=3D */
-                         NULL, /* verb */
-                         NULL, /* service */
-@@ -218,7 +218,7 @@ int enable_sysv_units(const char *verb, char **args)=
 {
-                         return j;
-                 if (j =3D=3D 0) {
-                         /* Child */
--                        execv(argv[0], (char**) argv);
-+                        execvp(argv[0], (char**) argv);
-                         log_error_errno(errno, "Failed to execute %s: %=
m", argv[0]);
-                         _exit(EXIT_FAILURE);
-                 }
diff --git a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv=
-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0002-implment-s=
ystemd-sysv-install-for-OE.patch
index 98d050ceae..7529abe668 100644
--- a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-instal=
l-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-instal=
l-for-OE.patch
@@ -1,7 +1,7 @@
-From 4a5602ede9881fd8e578a3c8bc40dd5df7c4d802 Mon Sep 17 00:00:00 2001
+From 08ab9f1eaa86ca2c6a0bb45219a0153495708acb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH] implement systemd-sysv-install for OE
+Subject: [PATCH 02/16] implment systemd-sysv-install for OE
=20
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl=
/systemd-sysv-install.SKELETON
-index cb58d8243b..eff3f5f579 100755
+index cb58d8243b..000bdf6165 100755
 --- a/src/systemctl/systemd-sysv-install.SKELETON
 +++ b/src/systemctl/systemd-sysv-install.SKELETON
 @@ -34,17 +34,17 @@ case "$1" in
@@ -22,13 +22,13 @@ index cb58d8243b..eff3f5f579 100755
          # call the command to enable SysV init script $NAME here
          # (consider optional $ROOT)
 -        echo "IMPLEMENT ME: enabling SysV init.d script $NAME"
-+        update-rc.d ${ROOT:+-r $ROOT} -f $NAME defaults
++        update-rc.d -f $NAME defaults
          ;;
      disable)
          # call the command to disable SysV init script $NAME here
          # (consider optional $ROOT)
 -        echo "IMPLEMENT ME: disabling SysV init.d script $NAME"
-+        update-rc.d ${ROOT:+-r $ROOT} -f $NAME remove
++        update-rc.d -f $NAME remove
          ;;
      is-enabled)
          # exit with 0 if $NAME is enabled, non-zero if it is disabled
@@ -38,3 +38,6 @@ index cb58d8243b..eff3f5f579 100755
          ;;
      *)
          usage ;;
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0001-Do-not-create-var-log=
-README.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-=
log-README.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0001-Do-not-create-var-log-=
README.patch
rename to meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-RE=
ADME.patch
index 850e356b2f..1d3c4f83c0 100644
--- a/meta/recipes-core/systemd/systemd/0001-Do-not-create-var-log-README=
.patch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README=
.patch
@@ -1,7 +1,7 @@
-From 425ad51e727058b48dd4580fd6afe7e51e96a28a Mon Sep 17 00:00:00 2001
+From a7f6a296707642d05463aec22ea3dfce7d06c989 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
-Subject: [PATCH] Do not create /var/log/README
+Subject: [PATCH 03/16] Do not create /var/log/README
=20
 /var/log/README is a link to /usr/share/doc/systemd/README.logs. The
 latter is packaged in systemd-doc and likely not installed, which leaves
@@ -15,7 +15,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@a=
xis.com>
  1 file changed, 3 deletions(-)
=20
 diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
-index b475500e58..650c91a8da 100644
+index cdef21fa9b..03798c953e 100644
 --- a/tmpfiles.d/legacy.conf.in
 +++ b/tmpfiles.d/legacy.conf.in
 @@ -13,9 +13,6 @@
@@ -28,3 +28,6 @@ index b475500e58..650c91a8da 100644
 =20
  {% if HAVE_SYSV_COMPAT %}
  # /run/lock/subsys is used for serializing SysV service execution, and
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-co=
mparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0003-missing_type=
.h-add-comparison_fn_t.patch
deleted file mode 100644
index f2094eb71d..0000000000
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-compariso=
n_fn_t.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From f99ef6c4407b56e8d15455fe27eb732ada87215b Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH 03/26] missing_type.h: add comparison_fn_t
-
-Make it work with musl where comparison_fn_t and is not provided.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-[Rebased for v244]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Rebased for v242]
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-[Rebased for v250, Drop __compare_fn_t]
-Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
----
- src/basic/missing_type.h            | 4 ++++
- src/basic/sort-util.h               | 1 +
- src/libsystemd/sd-journal/catalog.c | 1 +
- 3 files changed, 6 insertions(+)
-
-diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index 1d17705c35..fc33b76ec1 100644
---- a/src/basic/missing_type.h
-+++ b/src/basic/missing_type.h
-@@ -10,3 +10,7 @@
- #if !HAVE_CHAR16_T
- #  define char16_t uint16_t
- #endif
-+
-+#ifndef __GLIBC__
-+typedef int (*comparison_fn_t)(const void *, const void *);
-+#endif
-diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index 9c818bd747..ef10c8be2c 100644
---- a/src/basic/sort-util.h
-+++ b/src/basic/sort-util.h
-@@ -4,6 +4,7 @@
- #include <stdlib.h>
-=20
- #include "macro.h"
-+#include "missing_type.h"
-=20
- /* This is the same as glibc's internal __compar_d_fn_t type. glibc exp=
orts a public comparison_fn_t, for the
-  * external type __compar_fn_t, but doesn't do anything similar for __c=
ompar_d_fn_t. Let's hence do that
-diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-jou=
rnal/catalog.c
-index 7dcc35d8d5..87b8d6aad6 100644
---- a/src/libsystemd/sd-journal/catalog.c
-+++ b/src/libsystemd/sd-journal/catalog.c
-@@ -29,6 +29,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "tmpfile-util.h"
-+#include "missing_type.h"
-=20
- const char * const catalog_file_dirs[] =3D {
-         "/usr/local/lib/systemd/catalog/",
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0004-musl.h-introduce-head=
er-file-and-add-__THROW.patch b/meta/recipes-core/systemd/systemd/0004-mu=
sl.h-introduce-header-file-and-add-__THROW.patch
new file mode 100644
index 0000000000..63dc991f3a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-musl.h-introduce-header-file=
-and-add-__THROW.patch
@@ -0,0 +1,61 @@
+From ca53ef485929773cbb2e4b1d2dd3d15204409d70 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 11:04:09 +0800
+Subject: [PATCH 04/16] musl.h: introduce header file and add __THROW
+
+1. Introduce musl.h in preparation to hold musl related header workaroun=
ds.
+2. Define __THROW as empty to avoid compilation error.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/include/override/musl.h      | 8 ++++++++
+ src/include/override/net/if.h    | 2 ++
+ src/include/override/sys/mount.h | 2 ++
+ 3 files changed, 12 insertions(+)
+ create mode 100644 src/include/override/musl.h
+
+diff --git a/src/include/override/musl.h b/src/include/override/musl.h
+new file mode 100644
+index 0000000000..6d747c1005
+--- /dev/null
++++ b/src/include/override/musl.h
+@@ -0,0 +1,8 @@
++#ifndef _MUSL_H
++#define _MUSL_H    1
++
++#ifndef __THROW
++#define __THROW
++#endif
++
++#endif /* musl.h */
+diff --git a/src/include/override/net/if.h b/src/include/override/net/if=
.h
+index 1914b596e3..1606be0fef 100644
+--- a/src/include/override/net/if.h
++++ b/src/include/override/net/if.h
+@@ -4,6 +4,8 @@
+ #include <features.h>
+ #include <linux/if.h>   /* IWYU pragma: export */
+=20
++#include <musl.h>
++
+ #define IF_NAMESIZE       16
+=20
+ extern unsigned int if_nametoindex(const char *__ifname) __THROW;
+diff --git a/src/include/override/sys/mount.h b/src/include/override/sys=
/mount.h
+index 33a843b8f4..1b9d00ee60 100644
+--- a/src/include/override/sys/mount.h
++++ b/src/include/override/sys/mount.h
+@@ -9,6 +9,8 @@
+ #include <stdint.h>
+ #include <sys/ioctl.h>
+=20
++#include <musl.h>
++
+ /* Since glibc-2.37 (774058d72942249f71d74e7f2b639f77184160a6), sys/mou=
nt.h includes linux/mount.h, and
+  * we can safely include both headers in the same source file. However,=
 we cannot do that with older glibc.
+  * To avoid conflicts, let's not use glibc's sys/mount.h, and provide o=
ur own minimal implementation.
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_pr=
intf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0005=
-add-fallback-parse_printf_format-implementation.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0004-add-fallback-parse_pri=
ntf_format-implementation.patch
rename to meta/recipes-core/systemd/systemd/0005-add-fallback-parse_print=
f_format-implementation.patch
index 47b8583e7a..8afdec943b 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_fo=
rmat-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0005-add-fallback-parse_printf_fo=
rmat-implementation.patch
@@ -1,7 +1,7 @@
-From 34fe809cf686c1a81db5f3f027e33fece350ba0b Mon Sep 17 00:00:00 2001
+From e826bec34abac24b6a595919d965b888227d1687 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH 04/26] add fallback parse_printf_format implementation
+Subject: [PATCH 05/16] add fallback parse_printf_format implementation
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -10,35 +10,36 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+[Rebased for systemd 258]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- meson.build                              |   1 +
- src/basic/meson.build                    |   5 +
- src/basic/parse-printf-format.c          | 273 +++++++++++++++++++++++
- src/basic/parse-printf-format.h          |  57 +++++
- src/basic/stdio-util.h                   |   2 +-
- src/libsystemd/sd-journal/journal-send.c |   2 +-
- 6 files changed, 338 insertions(+), 2 deletions(-)
+ meson.build                     |   1 +
+ src/basic/meson.build           |   5 +
+ src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++
+ src/basic/parse-printf-format.h |  55 +++++++
+ src/basic/stdio-util.h          |   2 +-
+ 5 files changed, 335 insertions(+), 1 deletion(-)
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
=20
 diff --git a/meson.build b/meson.build
-index bffda86845..4146f4beef 100644
+index 238b935372..0df7ecbe67 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -770,6 +770,7 @@ foreach header : ['crypt.h',
-                   'linux/ioprio.h',
-                   'linux/memfd.h',
-                   'linux/time_types.h',
-+                  'printf.h',
-                   'sys/auxv.h',
-                   'sys/sdt.h',
-                   'threads.h',
+@@ -697,6 +697,7 @@ foreach header : [
+ endforeach
+=20
+ foreach header : [
++        'printf.h',
+         'sys/sdt.h',
+         'threads.h',
+         'valgrind/memcheck.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index e02f787c75..9435df895d 100644
+index 79af468381..a06d0b4745 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -188,6 +188,11 @@ endforeach
-=20
+@@ -166,6 +166,11 @@ endforeach
+ generated_sources +=3D generated_gperf_headers
  basic_sources +=3D generated_gperf_headers
 =20
 +if conf.get('HAVE_PRINTF_H') !=3D 1
@@ -48,7 +49,7 @@ index e02f787c75..9435df895d 100644
 +
  ############################################################
 =20
- arch_list =3D [
+ filesystem_sets_py =3D files('filesystem-sets.py')
 diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-fo=
rmat.c
 new file mode 100644
 index 0000000000..49437e5445
@@ -330,10 +331,10 @@ index 0000000000..49437e5445
 +}
 diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-fo=
rmat.h
 new file mode 100644
-index 0000000000..47be7522d7
+index 0000000000..1d4e8ac914
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
-@@ -0,0 +1,57 @@
+@@ -0,0 +1,55 @@
 +/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
 +
 +/***
@@ -360,8 +361,6 @@ index 0000000000..47be7522d7
 +
 +#pragma once
 +
-+#include "config.h"
-+
 +#if HAVE_PRINTF_H
 +#include <printf.h>
 +#else
@@ -392,43 +391,21 @@ index 0000000000..47be7522d7
 +
 +#endif /* HAVE_PRINTF_H */
 diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index 0a2239d022..43a765dacd 100644
+index 052087ce15..62a6b6b316 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
-@@ -1,12 +1,12 @@
+@@ -1,10 +1,10 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
  #pragma once
 =20
 -#include <printf.h>
- #include <stdarg.h>
  #include <stdio.h>
- #include <sys/types.h>
 =20
- #include "macro.h"
+ #include "forward.h"
 +#include "parse-printf-format.h"
 =20
  _printf_(3, 4)
  static inline char* snprintf_ok(char *buf, size_t len, const char *form=
at, ...) {
-diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/s=
d-journal/journal-send.c
-index 7d02b57d7b..75e8e08add 100644
---- a/src/libsystemd/sd-journal/journal-send.c
-+++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -2,7 +2,6 @@
-=20
- #include <errno.h>
- #include <fcntl.h>
--#include <printf.h>
- #include <stddef.h>
- #include <sys/un.h>
- #include <unistd.h>
-@@ -28,6 +27,7 @@
- #include "stdio-util.h"
- #include "string-util.h"
- #include "tmpfile-util.h"
-+#include "parse-printf-format.h"
-=20
- #define SNDBUF_SIZE (8*1024*1024)
-=20
 --=20
 2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0005-don-t-fail-if-GLOB_BR=
ACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd=
/0005-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
deleted file mode 100644
index 1b5e0d54c4..0000000000
--- a/meta/recipes-core/systemd/systemd/0005-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From d368a0317c747961f69a455a09a3de3fd13410a2 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH 05/26] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is n=
ot
- defined
-
-If the standard library doesn't provide brace
-expansion users just won't get it.
-
-Dont use GNU GLOB extentions on non-glibc systems
-
-Conditionalize use of GLOB_ALTDIRFUNC
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- src/basic/glob-util.c     | 12 ++++++++++++
- src/test/test-glob-util.c | 16 ++++++++++++++++
- src/tmpfiles/tmpfiles.c   | 10 ++++++++++
- 3 files changed, 38 insertions(+)
-
-diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index 802ca8c655..23818a67c6 100644
---- a/src/basic/glob-util.c
-+++ b/src/basic/glob-util.c
-@@ -12,6 +12,12 @@
- #include "path-util.h"
- #include "strv.h"
-=20
-+/* Don't fail if the standard library
-+ * doesn't provide brace expansion */
-+#ifndef GLOB_BRACE
-+#define GLOB_BRACE 0
-+#endif
-+
- static void closedir_wrapper(void* v) {
-         (void) closedir(v);
- }
-@@ -19,6 +25,7 @@ static void closedir_wrapper(void* v) {
- int safe_glob(const char *path, int flags, glob_t *pglob) {
-         int k;
-=20
-+#ifdef GLOB_ALTDIRFUNC
-         /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to =
be set. */
-         assert(!(flags & GLOB_ALTDIRFUNC));
-=20
-@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pg=
lob) {
-                 pglob->gl_lstat =3D lstat;
-         if (!pglob->gl_stat)
-                 pglob->gl_stat =3D stat;
-+#endif
-=20
-         errno =3D 0;
-+#ifdef GLOB_ALTDIRFUNC
-         k =3D glob(path, flags | GLOB_ALTDIRFUNC, NULL, pglob);
-+#else
-+        k =3D glob(path, flags, NULL, pglob);
-+#endif
-         if (k =3D=3D GLOB_NOMATCH)
-                 return -ENOENT;
-         if (k =3D=3D GLOB_NOSPACE)
-diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index 49d71f15c7..0a49ebcc17 100644
---- a/src/test/test-glob-util.c
-+++ b/src/test/test-glob-util.c
-@@ -34,6 +34,12 @@ TEST(glob_first) {
-         ASSERT_NULL(first);
- }
-=20
-+/* Don't fail if the standard library
-+ * doesn't provide brace expansion */
-+#ifndef GLOB_BRACE
-+#define GLOB_BRACE 0
-+#endif
-+
- TEST(glob_exists) {
-         char name[] =3D "/tmp/test-glob_exists.XXXXXX";
-         int fd =3D -EBADF;
-@@ -61,11 +67,13 @@ TEST(glob_no_dot) {
-         const char *fn;
-=20
-         _cleanup_globfree_ glob_t g =3D {
-+#ifdef GLOB_ALTDIRFUNC
-                 .gl_closedir =3D closedir_wrapper,
-                 .gl_readdir =3D (struct dirent *(*)(void *)) readdir_no=
_dot,
-                 .gl_opendir =3D (void *(*)(const char *)) opendir,
-                 .gl_lstat =3D lstat,
-                 .gl_stat =3D stat,
-+#endif
-         };
-=20
-         int r;
-@@ -73,11 +81,19 @@ TEST(glob_no_dot) {
-         assert_se(mkdtemp(template));
-=20
-         fn =3D strjoina(template, "/*");
-+#ifdef GLOB_ALTDIRFUNC
-         r =3D glob(fn, GLOB_NOSORT|GLOB_BRACE|GLOB_ALTDIRFUNC, NULL, &g=
);
-+#else
-+        r =3D glob(fn, GLOB_NOSORT|GLOB_BRACE, NULL, &g);
-+#endif
-         assert_se(r =3D=3D GLOB_NOMATCH);
-=20
-         fn =3D strjoina(template, "/.*");
-+#ifdef GLOB_ALTDIRFUNC
-         r =3D glob(fn, GLOB_NOSORT|GLOB_BRACE|GLOB_ALTDIRFUNC, NULL, &g=
);
-+#else
-+        r =3D glob(fn, GLOB_NOSORT|GLOB_BRACE, NULL, &g);
-+#endif
-         assert_se(r =3D=3D GLOB_NOMATCH);
-=20
-         (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 86bf16356d..da552dbaab 100644
---- a/src/tmpfiles/tmpfiles.c
-+++ b/src/tmpfiles/tmpfiles.c
-@@ -73,6 +73,12 @@
- #include "user-util.h"
- #include "virt.h"
-=20
-+/* Don't fail if the standard library
-+ * doesn't provide brace expansion */
-+#ifndef GLOB_BRACE
-+#define GLOB_BRACE 0
-+#endif
-+
- /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
-  * them in the file system. This is intended to be used to create
-  * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -2573,7 +2579,9 @@ finish:
-=20
- static int glob_item(Context *c, Item *i, action_t action) {
-         _cleanup_globfree_ glob_t g =3D {
-+#ifdef GLOB_ALTDIRFUNC
-                 .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
-+#endif
-         };
-         int r;
-=20
-@@ -2601,7 +2609,9 @@ static int glob_item_recursively(
-                 fdaction_t action) {
-=20
-         _cleanup_globfree_ glob_t g =3D {
-+#ifdef GLOB_ALTDIRFUNC
-                 .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
-+#endif
-         };
-         int r;
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0006-Make-mallinfo-related=
-contents-glibc-specific.patch b/meta/recipes-core/systemd/systemd/0006-M=
ake-mallinfo-related-contents-glibc-specific.patch
new file mode 100644
index 0000000000..ea901e5bc5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0006-Make-mallinfo-related-conten=
ts-glibc-specific.patch
@@ -0,0 +1,117 @@
+From ec5bda959aa2820acc4b6c72668cfb50a745de86 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 12:52:35 +0800
+Subject: [PATCH 06/16] Make mallinfo related contents glibc specific
+
+musl does not define mallinfo related contents.
+And systemd has removed support for checking, and has assumed it
+always exists[1], so these contents need to made glibc specific.
+
+[1] https://github.com/systemd/systemd/commit/abb99d3168259136187f81e0f7=
01cda712ffd78d
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/include/override/malloc.h      |  3 ++-
+ src/libsystemd/sd-event/sd-event.c | 14 ++++++++++----
+ src/shared/selinux-util.c          | 10 +++++++++-
+ 3 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/src/include/override/malloc.h b/src/include/override/malloc=
.h
+index d0080b6cbc..c129713831 100644
+--- a/src/include/override/malloc.h
++++ b/src/include/override/malloc.h
+@@ -2,7 +2,7 @@
+ #pragma once
+=20
+ #include_next <malloc.h>
+-
++#ifdef __GLIBC__
+ #if !HAVE_MALLINFO2
+ struct mallinfo2 {
+         size_t arena;    /* non-mmapped space allocated from system */
+@@ -37,3 +37,4 @@ static inline struct mallinfo2 mallinfo2(void) {
+         };
+ }
+ #endif
++#endif
+diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-even=
t/sd-event.c
+index 6cb496c541..79d574f5a9 100644
+--- a/src/libsystemd/sd-event/sd-event.c
++++ b/src/libsystemd/sd-event/sd-event.c
+@@ -1867,9 +1867,9 @@ _public_ int sd_event_trim_memory(void) {
+          * NULL callback parameter. */
+=20
+         log_debug("Memory pressure event, trimming malloc() memory.");
+-
++#ifdef __GLIBC__
+         struct mallinfo2 before_mallinfo =3D mallinfo2();
+-
++#endif
+         usec_t before_timestamp =3D now(CLOCK_MONOTONIC);
+         hashmap_trim_pools();
+         r =3D malloc_trim(0);
+@@ -1881,7 +1881,7 @@ _public_ int sd_event_trim_memory(void) {
+                 log_debug("Couldn't trim any memory.");
+=20
+         usec_t period =3D after_timestamp - before_timestamp;
+-
++#ifdef __GLIBC__
+         struct mallinfo2 after_mallinfo =3D mallinfo2();
+         size_t l =3D LESS_BY(before_mallinfo.hblkhd, after_mallinfo.hbl=
khd) +
+                 LESS_BY(before_mallinfo.arena, after_mallinfo.arena);
+@@ -1892,7 +1892,13 @@ _public_ int sd_event_trim_memory(void) {
+                    LOG_MESSAGE_ID(SD_MESSAGE_MEMORY_TRIM_STR),
+                    LOG_ITEM("TRIMMED_BYTES=3D%zu", l),
+                    LOG_ITEM("TRIMMED_USEC=3D" USEC_FMT, period));
+-
++#else
++        log_struct(LOG_DEBUG,
++                   LOG_MESSAGE("Memory trimming took %s",
++                               FORMAT_TIMESPAN(period, 0)),
++                   LOG_MESSAGE_ID(SD_MESSAGE_MEMORY_TRIM_STR),
++                   LOG_ITEM("TRIMMED_USEC=3D" USEC_FMT, period));
++#endif
+         return 0;
+ }
+=20
+diff --git a/src/shared/selinux-util.c b/src/shared/selinux-util.c
+index f7c4c7d2f8..b669475180 100644
+--- a/src/shared/selinux-util.c
++++ b/src/shared/selinux-util.c
+@@ -91,10 +91,13 @@ static int open_label_db(void) {
+         struct selabel_handle *hnd;
+         /* Avoid maybe-uninitialized false positives */
+         usec_t before_timestamp =3D USEC_INFINITY, after_timestamp =3D =
USEC_INFINITY;
++#ifdef __GLIBC__
+         struct mallinfo2 before_mallinfo =3D {};
+-
++#endif
+         if (DEBUG_LOGGING) {
++#ifdef __GLIBC__
+                 before_mallinfo =3D mallinfo2();
++#endif
+                 before_timestamp =3D now(CLOCK_MONOTONIC);
+         }
+=20
+@@ -104,11 +107,16 @@ static int open_label_db(void) {
+=20
+         if (DEBUG_LOGGING) {
+                 after_timestamp =3D now(CLOCK_MONOTONIC);
++#ifdef __GLIBC__
+                 struct mallinfo2 after_mallinfo =3D mallinfo2();
+                 size_t l =3D LESS_BY(after_mallinfo.uordblks, before_ma=
llinfo.uordblks);
+                 log_debug("Successfully loaded SELinux database in %s, =
size on heap is %zuK.",
+                           FORMAT_TIMESPAN(after_timestamp - before_time=
stamp, 0),
+                           DIV_ROUND_UP(l, 1024));
++#else
++                log_debug("Successfully loaded SELinux database in %s",
++                          FORMAT_TIMESPAN(after_timestamp - before_time=
stamp, 0));
++#endif
+         }
+=20
+         /* release memory after measurement */
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0006-add-missing-FTW_-macr=
os-for-musl.patch b/meta/recipes-core/systemd/systemd/0006-add-missing-FT=
W_-macros-for-musl.patch
deleted file mode 100644
index 578411c4cf..0000000000
--- a/meta/recipes-core/systemd/systemd/0006-add-missing-FTW_-macros-for-=
musl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 54b6e10aea2b0fb52782c3a71f06654a89b46bff Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH 06/26] add missing FTW_ macros for musl
-
-This is to avoid build failures like below for musl.
-
-  locale-util.c:296:24: error: 'FTW_STOP' undeclared
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing_type.h    | 4 ++++
- src/test/test-recurse-dir.c | 1 +
- 2 files changed, 5 insertions(+)
-
-diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index fc33b76ec1..34a36d83f0 100644
---- a/src/basic/missing_type.h
-+++ b/src/basic/missing_type.h
-@@ -14,3 +14,7 @@
- #ifndef __GLIBC__
- typedef int (*comparison_fn_t)(const void *, const void *);
- #endif
-+
-+#ifndef FTW_CONTINUE
-+#define FTW_CONTINUE 0
-+#endif
-diff --git a/src/test/test-recurse-dir.c b/src/test/test-recurse-dir.c
-index 8684d064ec..70fc2b5376 100644
---- a/src/test/test-recurse-dir.c
-+++ b/src/test/test-recurse-dir.c
-@@ -8,6 +8,7 @@
- #include "recurse-dir.h"
- #include "strv.h"
- #include "tests.h"
-+#include "missing_type.h"
-=20
- static char **list_nftw =3D NULL;
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-Use-uintmax_t-for-han=
dling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0007-Use-uintmax_t=
-for-handling-rlim_t.patch
deleted file mode 100644
index b4a570e1f5..0000000000
--- a/meta/recipes-core/systemd/systemd/0007-Use-uintmax_t-for-handling-r=
lim_t.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 85d8c4c27e855d54c1740902a836c8f2aea9bebc Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH 07/26] Use uintmax_t for handling rlim_t
-
-PRIu{32,64} is not right format to represent rlim_t type
-therefore use %ju and typecast the rlim_t variables to
-uintmax_t.
-
-Fixes portablility errors like
-
-execute.c:3446:36: error: format '%lu' expects argument of type 'long un=
signed int', but argument 5 has type 'rlim_t {aka long long unsigned int}=
' [-Werror=3Dformat=3D]
-|                          fprintf(f, "%s%s: " RLIM_FMT "\n",
-|                                     ^~~~~~~~
-|                                  prefix, rlimit_to_string(i), c->rlimi=
t[i]->rlim_max);
-|                                                               ~~~~~~~~=
~~~~~~~~~~~~~~
-
-Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Rebased for v241]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/format-util.h |  8 +-------
- src/basic/rlimit-util.c | 12 ++++++------
- src/core/execute.c      |  4 ++--
- 3 files changed, 9 insertions(+), 15 deletions(-)
-
-diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index b528c005ca..41c4c095be 100644
---- a/src/basic/format-util.h
-+++ b/src/basic/format-util.h
-@@ -41,13 +41,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
- #  error Unknown timex member size
- #endif
-=20
--#if SIZEOF_RLIM_T =3D=3D 8
--#  define RLIM_FMT "%" PRIu64
--#elif SIZEOF_RLIM_T =3D=3D 4
--#  define RLIM_FMT "%" PRIu32
--#else
--#  error Unknown rlim_t size
--#endif
-+#define RLIM_FMT "%ju"
-=20
- #if SIZEOF_DEV_T =3D=3D 8
- #  define DEV_FMT "%" PRIu64
-diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index a9f7b87f28..059c67731d 100644
---- a/src/basic/rlimit-util.c
-+++ b/src/basic/rlimit-util.c
-@@ -47,7 +47,7 @@ int setrlimit_closest(int resource, const struct rlimi=
t *rlim) {
-             fixed.rlim_max =3D=3D highest.rlim_max)
-                 return 0;
-=20
--        log_debug("Failed at setting rlimit " RLIM_FMT " for resource R=
LIMIT_%s. Will attempt setting value " RLIM_FMT " instead.", rlim->rlim_m=
ax, rlimit_to_string(resource), fixed.rlim_max);
-+        log_debug("Failed at setting rlimit " RLIM_FMT " for resource R=
LIMIT_%s. Will attempt setting value " RLIM_FMT " instead.", (uintmax_t)r=
lim->rlim_max, rlimit_to_string(resource), (uintmax_t)fixed.rlim_max);
-=20
-         return RET_NERRNO(setrlimit(resource, &fixed));
- }
-@@ -310,13 +310,13 @@ int rlimit_format(const struct rlimit *rl, char **=
ret) {
-         if (rl->rlim_cur >=3D RLIM_INFINITY && rl->rlim_max >=3D RLIM_I=
NFINITY)
-                 r =3D free_and_strdup(&s, "infinity");
-         else if (rl->rlim_cur >=3D RLIM_INFINITY)
--                r =3D asprintf(&s, "infinity:" RLIM_FMT, rl->rlim_max);
-+                r =3D asprintf(&s, "infinity:" RLIM_FMT, (uintmax_t)rl-=
>rlim_max);
-         else if (rl->rlim_max >=3D RLIM_INFINITY)
--                r =3D asprintf(&s, RLIM_FMT ":infinity", rl->rlim_cur);
-+                r =3D asprintf(&s, RLIM_FMT ":infinity", (uintmax_t)rl-=
>rlim_cur);
-         else if (rl->rlim_cur =3D=3D rl->rlim_max)
--                r =3D asprintf(&s, RLIM_FMT, rl->rlim_cur);
-+                r =3D asprintf(&s, RLIM_FMT, (uintmax_t)rl->rlim_cur);
-         else
--                r =3D asprintf(&s, RLIM_FMT ":" RLIM_FMT, rl->rlim_cur,=
 rl->rlim_max);
-+                r =3D asprintf(&s, RLIM_FMT ":" RLIM_FMT, (uintmax_t)rl=
->rlim_cur, (uintmax_t)rl->rlim_max);
-         if (r < 0)
-                 return -ENOMEM;
-=20
-@@ -425,7 +425,7 @@ int rlimit_nofile_safe(void) {
-         rl.rlim_max =3D MIN(rl.rlim_max, (rlim_t) read_nr_open());
-         rl.rlim_cur =3D MIN((rlim_t) FD_SETSIZE, rl.rlim_max);
-         if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
--                return log_debug_errno(errno, "Failed to lower RLIMIT_N=
OFILE's soft limit to " RLIM_FMT ": %m", rl.rlim_cur);
-+                return log_debug_errno(errno, "Failed to lower RLIMIT_N=
OFILE's soft limit to " RLIM_FMT ": %m", (uintmax_t)rl.rlim_cur);
-=20
-         return 1;
- }
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 3d55b0b772..4824ff159e 100644
---- a/src/core/execute.c
-+++ b/src/core/execute.c
-@@ -1162,9 +1162,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
-         for (unsigned i =3D 0; i < RLIM_NLIMITS; i++)
-                 if (c->rlimit[i]) {
-                         fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
--                                prefix, rlimit_to_string(i), c->rlimit[=
i]->rlim_max);
-+                                prefix, rlimit_to_string(i), (uintmax_t=
)c->rlimit[i]->rlim_max);
-                         fprintf(f, "%sLimit%sSoft: " RLIM_FMT "\n",
--                                prefix, rlimit_to_string(i), c->rlimit[=
i]->rlim_cur);
-+                                prefix, rlimit_to_string(i), (uintmax_t=
)c->rlimit[i]->rlim_cur);
-                 }
-=20
-         if (c->ioprio_set) {
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-add-src-include-overr=
ide-sys-prctl.h-to-avoid-redefi.patch b/meta/recipes-core/systemd/systemd=
/0007-add-src-include-override-sys-prctl.h-to-avoid-redefi.patch
new file mode 100644
index 0000000000..ee1b4689a2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0007-add-src-include-override-sys=
-prctl.h-to-avoid-redefi.patch
@@ -0,0 +1,43 @@
+From 62d0b5c1689076468e95b5473bffd599b51f8d8e Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 14:14:44 +0800
+Subject: [PATCH 07/16] add src/include/override/sys/prctl.h to avoid
+ redefinition error
+
+The linux/prctl.h has all the needed macros, what we need is the
+prctl function definition. This avoids error of redefinition.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/include/override/sys/prctl.h | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 src/include/override/sys/prctl.h
+
+diff --git a/src/include/override/sys/prctl.h b/src/include/override/sys=
/prctl.h
+new file mode 100644
+index 0000000000..20468bd30f
+--- /dev/null
++++ b/src/include/override/sys/prctl.h
+@@ -0,0 +1,17 @@
++#ifndef _SYS_PRCTL_H
++#define _SYS_PRCTL_H
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#include <stdint.h>
++#include <linux/prctl.h>
++
++int prctl (int, ...);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatib=
le-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd=
/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
deleted file mode 100644
index 22e2ceadcc..0000000000
--- a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f4cd939c7cc1ce0a59bab2693768f2c95d9ced00 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH 08/26] Define glibc compatible basename() for non-glibc
- systems
-
-Fixes builds with musl, even though systemd is adamant about
-using non-posix basename implementation, we have a way out
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/basic/string-util.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/string-util.h b/src/basic/string-util.h
-index cc6aa183c0..0b035125cd 100644
---- a/src/basic/string-util.h
-+++ b/src/basic/string-util.h
-@@ -27,6 +27,10 @@
- #define URI_UNRESERVED      ALPHANUMERICAL "-._~"       /* [RFC3986] */
- #define URI_VALID           URI_RESERVED URI_UNRESERVED /* [RFC3986] */
-=20
-+#if !defined(__GLIBC__)
-+#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
-+#endif
-+
- static inline char* strstr_ptr(const char *haystack, const char *needle=
) {
-         if (!haystack || !needle)
-                 return NULL;
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd=
/0008-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compli=
ant-strerror_r-from-GNU-specif.patch
rename to meta/recipes-core/systemd/systemd/0008-distinguish-XSI-complian=
t-strerror_r-from-GNU-specif.patch
index 0dfb77890e..73819375c8 100644
--- a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0008-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
@@ -1,10 +1,10 @@
-From b7f6c245b4ae72999f23eecc2bbb6d6fb8db667c Mon Sep 17 00:00:00 2001
+From bbe0096367618026fe5ebb81c266fd50084f113a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 10/26] distinguish XSI-compliant strerror_r from GNU-spe=
cifi
+Subject: [PATCH 08/16] distinguish XSI-compliant strerror_r from GNU-spe=
cific
  strerror_r
=20
-XSI-compliant strerror_r and GNU-specifi strerror_r are different.
+XSI-compliant strerror_r and GNU-specific strerror_r are different.
=20
        int strerror_r(int errnum, char *buf, size_t buflen);
                    /* XSI-compliant */
@@ -24,10 +24,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 15 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/b=
us-error.c
-index 58c24d25c0..69a0d09d42 100644
+index bc0164c1b4..e69ffe4f75 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -405,7 +405,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
+@@ -400,7 +400,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
                          return;
 =20
                  errno =3D 0;
@@ -40,25 +40,25 @@ index 58c24d25c0..69a0d09d42 100644
                  if (errno =3D=3D ERANGE || strlen(x) >=3D k - 1) {
                          free(m);
                          k *=3D 2;
-@@ -590,8 +595,12 @@ const char* _bus_error_message(const sd_bus_error *=
e, int error, char buf[static
+@@ -585,8 +590,12 @@ const char* _bus_error_message(const sd_bus_error *=
e, int error, char buf[static
 =20
          if (e && e->message)
                  return e->message;
 -
 +#ifndef __GLIBC__
-+        strerror_r(abs(error), buf, ERRNO_BUF_LEN);
++        strerror_r(ABS(error), buf, ERRNO_BUF_LEN);
 +        return buf;
 +#else
-         return strerror_r(abs(error), buf, ERRNO_BUF_LEN);
+         return strerror_r(ABS(error), buf, ERRNO_BUF_LEN);
 +#endif
  }
 =20
  static bool map_ok(const sd_bus_error_map *map) {
 diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/s=
d-journal/journal-send.c
-index 75e8e08add..41e5c7c2b8 100644
+index e838e7e0d7..28b6e014c0 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -361,7 +361,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
+@@ -338,7 +338,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
                  char* j;
 =20
                  errno =3D 0;
diff --git a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffer=
ing-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd=
/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
deleted file mode 100644
index 8e3eb15b54..0000000000
--- a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6959db351fdd551d46e22667deec6032552b2662 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH 09/26] Do not disable buffering when writing to oom_scor=
e_adj
-
-On musl, disabling buffering when writing to oom_score_adj will
-cause the following error.
-
-  Failed to adjust OOM setting: Invalid argument
-
-This error appears for systemd-udevd.service and dbus.service.
-This is because kernel receives '-' instead of the whole '-900'
-if buffering is disabled.
-
-This is libc implementation specific, as glibc does not have this issue.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- src/basic/process-util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 3253a9c3fb..772c4082a1 100644
---- a/src/basic/process-util.c
-+++ b/src/basic/process-util.c
-@@ -1848,7 +1848,7 @@ int set_oom_score_adjust(int value) {
-         xsprintf(t, "%i", value);
-=20
-         return write_string_file("/proc/self/oom_score_adj", t,
--                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WR=
ITE_STRING_FILE_DISABLE_BUFFER);
-+                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
- }
-=20
- int get_oom_score_adjust(int *ret) {
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRER=
ROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0009-errn=
o-util-Make-STRERROR-portable-for-musl.patch
similarity index 72%
rename from meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERR=
OR-portable-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0009-errno-util-Make-STRERROR=
-portable-for-musl.patch
index 56083cc7b3..4a9a05147a 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-por=
table-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0009-errno-util-Make-STRERROR-por=
table-for-musl.patch
@@ -1,7 +1,7 @@
-From 28fa1d5f56c6ddee9e336e6f2051c55e9f2f98b4 Mon Sep 17 00:00:00 2001
+From 7ce68a17deeda43c31a5de5956bad4c92481f1ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
-Subject: [PATCH 19/26] errno-util: Make STRERROR portable for musl
+Subject: [PATCH 09/16] errno-util: Make STRERROR portable for musl
=20
 Sadly, systemd has decided to use yet another GNU extention in a macro
 lets make this such that we can use XSI compliant strerror_r() for
@@ -10,27 +10,30 @@ non-glibc hosts
 Upstream-Status: Inappropriate [musl specific]
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Rebased for v258
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  src/basic/errno-util.h | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
=20
 diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
-index 48b76e4bf7..6e7653e2d9 100644
+index 5fe337cfb1..dee34167cb 100644
 --- a/src/basic/errno-util.h
 +++ b/src/basic/errno-util.h
-@@ -15,8 +15,16 @@
+@@ -13,8 +13,16 @@
   * https://stackoverflow.com/questions/34880638/compound-literal-lifeti=
me-and-if-blocks
   *
   * Note that we use the GNU variant of strerror_r() here. */
--#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){=
}, ERRNO_BUF_LEN)
+-#define STRERROR(errnum) strerror_r(ABS(errnum), (char[ERRNO_BUF_LEN]){=
}, ERRNO_BUF_LEN)
 +static inline const char * STRERROR(int errnum);
 =20
 +static inline const char * STRERROR(int errnum) {
 +#ifdef __GLIBC__
-+        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_B=
UF_LEN);
++        return strerror_r(ABS(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_B=
UF_LEN);
 +#else
 +        static __thread char buf[ERRNO_BUF_LEN];
-+        return strerror_r(abs(errnum), buf, ERRNO_BUF_LEN) ? "unknown e=
rror" : buf;
++        return strerror_r(ABS(errnum), buf, ERRNO_BUF_LEN) ? "unknown e=
rror" : buf;
 +#endif
 +}
  /* A helper to print an error message or message for functions that ret=
urn 0 on EOF.
diff --git a/meta/recipes-core/systemd/systemd/0010-src-basic-format-util=
.h-define-RLIM_FMT-to-fit-musl-.patch b/meta/recipes-core/systemd/systemd=
/0010-src-basic-format-util.h-define-RLIM_FMT-to-fit-musl-.patch
new file mode 100644
index 0000000000..d6281b015b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0010-src-basic-format-util.h-defi=
ne-RLIM_FMT-to-fit-musl-.patch
@@ -0,0 +1,40 @@
+From adf7bd6cf6305f5454cfb1ad4f1755880e831f7e Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 14:41:52 +0800
+Subject: [PATCH 10/16] src/basic/format-util.h: define RLIM_FMT to fit m=
usl's
+ rlim_t definition
+
+musl always defines rlim_t to be "unsigned long long".
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/format-util.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/basic/format-util.h b/src/basic/format-util.h
+index e42f788ce6..9275f9615d 100644
+--- a/src/basic/format-util.h
++++ b/src/basic/format-util.h
+@@ -39,6 +39,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
+ #  error Unknown timex member size
+ #endif
+=20
++#ifdef __GLIBC__
+ #if SIZEOF_RLIM_T =3D=3D 8
+ #  define RLIM_FMT "%" PRIu64
+ #elif SIZEOF_RLIM_T =3D=3D 4
+@@ -46,6 +47,9 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
+ #else
+ #  error Unknown rlim_t size
+ #endif
++#else
++#define RLIM_FMT "%llu"
++#endif
+=20
+ #if SIZEOF_DEV_T =3D=3D 8
+ #  define DEV_FMT "%" PRIu64
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of=
-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0011-av=
oid-redefinition-of-prctl_mm_map-structure.patch
deleted file mode 100644
index 16d741cf87..0000000000
--- a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_=
mm_map-structure.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 43b0269e850a2fbcb6ca615258aa8f8a9b4f6a9d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH 11/26] avoid redefinition of prctl_mm_map structure
-
-Fix the following compile failure:
-error: redefinition of 'struct prctl_mm_map'
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing_prctl.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
-index 2c9f9f6c50..65a984b564 100644
---- a/src/basic/missing_prctl.h
-+++ b/src/basic/missing_prctl.h
-@@ -1,7 +1,9 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
-=20
-+#ifdef __GLIBC__
- #include <linux/prctl.h>
-+#endif
-=20
- #include "macro.h"
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0011-src-include-override-=
malloc.h-define-dummy-malloc_tr.patch b/meta/recipes-core/systemd/systemd=
/0011-src-include-override-malloc.h-define-dummy-malloc_tr.patch
new file mode 100644
index 0000000000..0571165440
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0011-src-include-override-malloc.=
h-define-dummy-malloc_tr.patch
@@ -0,0 +1,41 @@
+From 9173921022c74067f35078d0a4de686cc504e182 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 14:49:13 +0800
+Subject: [PATCH 11/16] src/include/override/malloc.h: define dummy
+ malloc_trim/malloc_info for musl
+
+For malloc_trim:
+As we're not releasing any stack, just return 0 to match the
+malloc_trim's meaning in glibc.
+
+For malloc_info:
+There's no real malloc_info implementation in musl, define a dummy
+one which always return -1 to indicate error.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/include/override/malloc.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/include/override/malloc.h b/src/include/override/malloc=
.h
+index c129713831..0b09bf6de6 100644
+--- a/src/include/override/malloc.h
++++ b/src/include/override/malloc.h
+@@ -37,4 +37,12 @@ static inline struct mallinfo2 mallinfo2(void) {
+         };
+ }
+ #endif
++#else
++#include <stdio.h>
++static inline int malloc_trim(size_t s) {
++        return 0;
++}
++static inline int malloc_info(int options, FILE *stream) {
++        return -1;
++}
+ #endif
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer=
-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-d=
isable-buffer-in-writing-files.patch
deleted file mode 100644
index 0bbc6bbac7..0000000000
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-wri=
ting-files.patch
+++ /dev/null
@@ -1,530 +0,0 @@
-From eaf26fdad00448b8cd336eb5db51e0baa8d8e588 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 16 Dec 2024 14:37:25 +0800
-Subject: [PATCH 12/26] do not disable buffer in writing files
-
-Do not disable buffer in writing files, otherwise we get
-failure at boot for musl like below.
-
-  [!!!!!!] Failed to allocate manager object.
-
-And there will be other failures, critical or not critical.
-This is specific to musl.
-
-Upstream-Status: Inappropriate [musl]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Rebased for v242]
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-[rebased for systemd 254]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 255.1]
----
- src/basic/cgroup-util.c              |  4 ++--
- src/basic/namespace-util.c           |  4 ++--
- src/basic/procfs-util.c              |  4 ++--
- src/basic/sysctl-util.c              |  2 +-
- src/binfmt/binfmt.c                  |  6 +++---
- src/core/cgroup.c                    |  2 +-
- src/core/ipe-setup.c                 |  2 +-
- src/core/main.c                      |  2 +-
- src/core/smack-setup.c               |  6 +++---
- src/home/homework.c                  |  2 +-
- src/libsystemd/sd-device/sd-device.c |  2 +-
- src/nspawn/nspawn-cgroup.c           |  2 +-
- src/nspawn/nspawn.c                  |  6 +++---
- src/shared/binfmt-util.c             |  2 +-
- src/shared/cgroup-setup.c            | 12 ++++++------
- src/shared/coredump-util.c           |  2 +-
- src/shared/hibernate-util.c          |  4 ++--
- src/shared/smack-util.c              |  2 +-
- src/sleep/sleep.c                    |  2 +-
- src/storagetm/storagetm.c            | 24 ++++++++++++------------
- src/vconsole/vconsole-setup.c        |  2 +-
- 21 files changed, 47 insertions(+), 47 deletions(-)
-
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 309dccb45a..7aec5072a0 100644
---- a/src/basic/cgroup-util.c
-+++ b/src/basic/cgroup-util.c
-@@ -495,7 +495,7 @@ int cg_kill_kernel_sigkill(const char *path) {
-         if (r < 0)
-                 return r;
-=20
--        r =3D write_string_file(killfile, "1", WRITE_STRING_FILE_DISABL=
E_BUFFER);
-+        r =3D write_string_file(killfile, "1", 0);
-         if (r < 0)
-                 return log_debug_errno(r, "Failed to write to cgroup.ki=
ll for cgroup '%s': %m", path);
-=20
-@@ -1721,7 +1721,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
-         if (r < 0)
-                 return r;
-=20
--        return write_string_file(p, value, WRITE_STRING_FILE_DISABLE_BU=
FFER);
-+        return write_string_file(p, value, 0);
- }
-=20
- int cg_get_attribute(const char *controller, const char *path, const ch=
ar *attribute, char **ret) {
-diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
-index 332e8cdfd5..804498127d 100644
---- a/src/basic/namespace-util.c
-+++ b/src/basic/namespace-util.c
-@@ -359,12 +359,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
-                 freeze();
-=20
-         xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
--        r =3D write_string_file(path, uid_map, WRITE_STRING_FILE_DISABL=
E_BUFFER);
-+        r =3D write_string_file(path, uid_map, 0);
-         if (r < 0)
-                 return log_debug_errno(r, "Failed to write UID map: %m"=
);
-=20
-         xsprintf(path, "/proc/" PID_FMT "/gid_map", pid);
--        r =3D write_string_file(path, gid_map, WRITE_STRING_FILE_DISABL=
E_BUFFER);
-+        r =3D write_string_file(path, gid_map, 0);
-         if (r < 0)
-                 return log_debug_errno(r, "Failed to write GID map: %m"=
);
-=20
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index d7cfcd9105..58fb5918a3 100644
---- a/src/basic/procfs-util.c
-+++ b/src/basic/procfs-util.c
-@@ -63,13 +63,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
-          * decrease it, as threads-max is the much more relevant sysctl=
. */
-         if (limit > pid_max-1) {
-                 sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since=
 PID 0 is not a valid PID */
--                r =3D write_string_file("/proc/sys/kernel/pid_max", buf=
fer, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                r =3D write_string_file("/proc/sys/kernel/pid_max", buf=
fer, 0);
-                 if (r < 0)
-                         return r;
-         }
-=20
-         sprintf(buffer, "%" PRIu64, limit);
--        r =3D write_string_file("/proc/sys/kernel/threads-max", buffer,=
 WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/sys/kernel/threads-max", buffer,=
 0);
-         if (r < 0) {
-                 uint64_t threads_max;
-=20
-diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index 2feb4917d7..4c74620a00 100644
---- a/src/basic/sysctl-util.c
-+++ b/src/basic/sysctl-util.c
-@@ -97,7 +97,7 @@ int sysctl_write_full(const char *property, const char=
 *value, Hashmap **shadow)
-         if (r < 0)
-                 return r;
-=20
--        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_=
FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_SUPPRESS_R=
EDUNDANT_VIRTUAL);
-+        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_=
FAILURE | 0 | WRITE_STRING_FILE_SUPPRESS_REDUNDANT_VIRTUAL);
- }
-=20
- int sysctl_writef(const char *property, const char *format, ...) {
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index d21f3f79ff..258607cc7e 100644
---- a/src/binfmt/binfmt.c
-+++ b/src/binfmt/binfmt.c
-@@ -30,7 +30,7 @@ static bool arg_unregister =3D false;
-=20
- static int delete_rule(const char *rulename) {
-         const char *fn =3D strjoina("/proc/sys/fs/binfmt_misc/", rulena=
me);
--        return write_string_file(fn, "-1", WRITE_STRING_FILE_DISABLE_BU=
FFER);
-+        return write_string_file(fn, "-1", 0);
- }
-=20
- static int apply_rule(const char *filename, unsigned line, const char *=
rule) {
-@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned l=
ine, const char *rule) {
-         if (r >=3D 0)
-                 log_debug("%s:%u: Rule '%s' deleted.", filename, line, =
rulename);
-=20
--        r =3D write_string_file("/proc/sys/fs/binfmt_misc/register", ru=
le, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/sys/fs/binfmt_misc/register", ru=
le, 0);
-         if (r < 0)
-                 return log_error_errno(r, "%s:%u: Failed to add binary =
format '%s': %m",
-                                        filename, line, rulename);
-@@ -248,7 +248,7 @@ static int run(int argc, char *argv[]) {
-                         return r;
-=20
-                 /* Flush out all rules */
--                r =3D write_string_file("/proc/sys/fs/binfmt_misc/statu=
s", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
-+                r =3D write_string_file("/proc/sys/fs/binfmt_misc/statu=
s", "-1", 0);
-                 if (r < 0)
-                         log_warning_errno(r, "Failed to flush binfmt_mi=
sc rules, ignoring: %m");
-                 else
-diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 6933aae54d..ab6fccc0e4 100644
---- a/src/core/cgroup.c
-+++ b/src/core/cgroup.c
-@@ -5175,7 +5175,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
-         if (r < 0)
-                 return r;
-=20
--        r =3D write_string_file(path, one_zero(objective =3D=3D FREEZER=
_FROZEN), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file(path, one_zero(objective =3D=3D FREEZER=
_FROZEN), 0);
-         if (r < 0)
-                 return r;
-=20
-diff --git a/src/core/ipe-setup.c b/src/core/ipe-setup.c
-index 4648d43829..80d03d87d4 100644
---- a/src/core/ipe-setup.c
-+++ b/src/core/ipe-setup.c
-@@ -94,7 +94,7 @@ int ipe_setup(void) {
-                 if (!activate_path)
-                         return log_oom();
-=20
--                r =3D write_string_file(activate_path, "1", WRITE_STRIN=
G_FILE_DISABLE_BUFFER);
-+                r =3D write_string_file(activate_path, "1", 0);
-                 if (r =3D=3D -ESTALE) {
-                         log_debug_errno(r,
-                                         "IPE policy %s is already loade=
d with a version that is equal or higher, skipping.",
-diff --git a/src/core/main.c b/src/core/main.c
-index 172742c769..e68ce2a6d8 100644
---- a/src/core/main.c
-+++ b/src/core/main.c
-@@ -1826,7 +1826,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
-         if (getpid_cached() !=3D 1)
-                 return;
-=20
--        r =3D write_string_file("/proc/sys/kernel/core_pattern", arg_ea=
rly_core_pattern, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/sys/kernel/core_pattern", arg_ea=
rly_core_pattern, 0);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to write '%s' to /proc/sys=
/kernel/core_pattern, ignoring: %m",
-                                   arg_early_core_pattern);
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 7ea902b6f9..ee4cd56023 100644
---- a/src/core/smack-setup.c
-+++ b/src/core/smack-setup.c
-@@ -321,17 +321,17 @@ int mac_smack_setup(bool *loaded_policy) {
-         }
-=20
- #if HAVE_SMACK_RUN_LABEL
--        r =3D write_string_file("/proc/self/attr/current", SMACK_RUN_LA=
BEL, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/self/attr/current", SMACK_RUN_LA=
BEL, 0);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to set SMACK label \"" SMA=
CK_RUN_LABEL "\" on self: %m");
--        r =3D write_string_file("/sys/fs/smackfs/ambient", SMACK_RUN_LA=
BEL, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/sys/fs/smackfs/ambient", SMACK_RUN_LA=
BEL, 0);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to set SMACK ambient label=
 \"" SMACK_RUN_LABEL "\": %m");
-         r =3D write_string_file("/sys/fs/smackfs/netlabel",
-                               "0.0.0.0/0 " SMACK_RUN_LABEL, WRITE_STRIN=
G_FILE_DISABLE_BUFFER);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to set SMACK netlabel rule=
 \"0.0.0.0/0 " SMACK_RUN_LABEL "\": %m");
--        r =3D write_string_file("/sys/fs/smackfs/netlabel", "127.0.0.1 =
-CIPSO", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/sys/fs/smackfs/netlabel", "127.0.0.1 =
-CIPSO", 0);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to set SMACK netlabel rule=
 \"127.0.0.1 -CIPSO\": %m");
- #endif
-diff --git a/src/home/homework.c b/src/home/homework.c
-index 00e74894b3..7457113efe 100644
---- a/src/home/homework.c
-+++ b/src/home/homework.c
-@@ -304,7 +304,7 @@ static void drop_caches_now(void) {
-          * for details. We write "3" into /proc/sys/vm/drop_caches to e=
nsure dentries/inodes are flushed, but
-          * not more. */
-=20
--        r =3D write_string_file("/proc/sys/vm/drop_caches", "3\n", WRIT=
E_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/sys/vm/drop_caches", "3\n", 0);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to drop caches, ignoring: =
%m");
-         else
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-de=
vice/sd-device.c
-index 01fa90b1ff..83ab655bf4 100644
---- a/src/libsystemd/sd-device/sd-device.c
-+++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2564,7 +2564,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
-         if (!value)
-                 return -ENOMEM;
-=20
--        r =3D write_string_file(path, value, WRITE_STRING_FILE_DISABLE_=
BUFFER | WRITE_STRING_FILE_NOFOLLOW);
-+        r =3D write_string_file(path, value, 0 | WRITE_STRING_FILE_NOFO=
LLOW);
-         if (r < 0) {
-                 /* On failure, clear cache entry, as we do not know how=
 it fails. */
-                 device_remove_cached_sysattr_value(device, sysattr);
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 4f28b4a225..c899c218b2 100644
---- a/src/nspawn/nspawn-cgroup.c
-+++ b/src/nspawn/nspawn-cgroup.c
-@@ -93,7 +93,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_reque=
sted, uid_t uid_shift) {
-         fn =3D strjoina(tree, cgroup, "/cgroup.procs");
-=20
-         sprintf(pid_string, PID_FMT, pid);
--        r =3D write_string_file(fn, pid_string, WRITE_STRING_FILE_DISAB=
LE_BUFFER|WRITE_STRING_FILE_MKDIR_0755);
-+        r =3D write_string_file(fn, pid_string, 0|WRITE_STRING_FILE_MKD=
IR_0755);
-         if (r < 0) {
-                 log_error_errno(r, "Failed to move process: %m");
-                 goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 500725d35f..745b6815db 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -2857,7 +2857,7 @@ static int reset_audit_loginuid(void) {
-         if (streq(p, "4294967295"))
-                 return 0;
-=20
--        r =3D write_string_file("/proc/self/loginuid", "4294967295", WR=
ITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/self/loginuid", "4294967295", 0)=
;
-         if (r < 0) {
-                 log_error_errno(r,
-                                 "Failed to reset audit login UID. This =
probably means that your kernel is too\n"
-@@ -4588,7 +4588,7 @@ static int setup_uid_map(
-                 return log_oom();
-=20
-         xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
--        r =3D write_string_file(uid_map, s, WRITE_STRING_FILE_DISABLE_B=
UFFER);
-+        r =3D write_string_file(uid_map, s, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write UID map: %m"=
);
-=20
-@@ -4598,7 +4598,7 @@ static int setup_uid_map(
-                 return log_oom();
-=20
-         xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
--        r =3D write_string_file(uid_map, s, WRITE_STRING_FILE_DISABLE_B=
UFFER);
-+        r =3D write_string_file(uid_map, s, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write GID map: %m"=
);
-=20
-diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
-index a26175474b..1413a9c72c 100644
---- a/src/shared/binfmt-util.c
-+++ b/src/shared/binfmt-util.c
-@@ -46,7 +46,7 @@ int disable_binfmt(void) {
-                 return 0;
-         }
-=20
--        r =3D write_string_file("/proc/sys/fs/binfmt_misc/status", "-1"=
, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/sys/fs/binfmt_misc/status", "-1"=
, 0);
-         if (r < 0)
-                 return log_warning_errno(r, "Failed to unregister binfm=
t_misc entries: %m");
-=20
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index 49d40f60d8..0f4aa8512a 100644
---- a/src/shared/cgroup-setup.c
-+++ b/src/shared/cgroup-setup.c
-@@ -369,7 +369,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
-=20
-         xsprintf(c, PID_FMT "\n", pid);
-=20
--        r =3D write_string_file(fs, c, WRITE_STRING_FILE_DISABLE_BUFFER=
);
-+        r =3D write_string_file(fs, c, 0);
-         if (r =3D=3D -EOPNOTSUPP && cg_is_threaded(path) > 0)
-                 /* When the threaded mode is used, we cannot read/write=
 the file. Let's return recognizable error. */
-                 return -EUCLEAN;
-@@ -399,7 +399,7 @@ int cg_fd_attach(int fd, pid_t pid) {
-=20
-         xsprintf(c, PID_FMT "\n", pid);
-=20
--        return write_string_file_at(fd, "cgroup.procs", c, WRITE_STRING=
_FILE_DISABLE_BUFFER);
-+        return write_string_file_at(fd, "cgroup.procs", c, 0);
- }
-=20
- int cg_attach_fallback(const char *controller, const char *path, pid_t =
pid) {
-@@ -1049,7 +1049,7 @@ int cg_install_release_agent(const char *controlle=
r, const char *agent) {
-=20
-         sc =3D strstrip(contents);
-         if (isempty(sc)) {
--                r =3D write_string_file(fs, agent, WRITE_STRING_FILE_DI=
SABLE_BUFFER);
-+                r =3D write_string_file(fs, agent, 0);
-                 if (r < 0)
-                         return r;
-         } else if (!path_equal(sc, agent))
-@@ -1067,7 +1067,7 @@ int cg_install_release_agent(const char *controlle=
r, const char *agent) {
-=20
-         sc =3D strstrip(contents);
-         if (streq(sc, "0")) {
--                r =3D write_string_file(fs, "1", WRITE_STRING_FILE_DISA=
BLE_BUFFER);
-+                r =3D write_string_file(fs, "1", 0);
-                 if (r < 0)
-                         return r;
-=20
-@@ -1094,7 +1094,7 @@ int cg_uninstall_release_agent(const char *control=
ler) {
-         if (r < 0)
-                 return r;
-=20
--        r =3D write_string_file(fs, "0", WRITE_STRING_FILE_DISABLE_BUFF=
ER);
-+        r =3D write_string_file(fs, "0", 0);
-         if (r < 0)
-                 return r;
-=20
-@@ -1104,7 +1104,7 @@ int cg_uninstall_release_agent(const char *control=
ler) {
-         if (r < 0)
-                 return r;
-=20
--        r =3D write_string_file(fs, "", WRITE_STRING_FILE_DISABLE_BUFFE=
R);
-+        r =3D write_string_file(fs, "", 0);
-         if (r < 0)
-                 return r;
-=20
-diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
-index 805503f366..3234a1d76e 100644
---- a/src/shared/coredump-util.c
-+++ b/src/shared/coredump-util.c
-@@ -180,7 +180,7 @@ void disable_coredumps(void) {
-         if (detect_container() > 0)
-                 return;
-=20
--        r =3D write_string_file("/proc/sys/kernel/core_pattern", "|/bin=
/false", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/proc/sys/kernel/core_pattern", "|/bin=
/false", 0);
-         if (r < 0)
-                 log_debug_errno(r, "Failed to turn off coredumps, ignor=
ing: %m");
- }
-diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
-index 1213fdc2c7..4c26e6a4ee 100644
---- a/src/shared/hibernate-util.c
-+++ b/src/shared/hibernate-util.c
-@@ -498,7 +498,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
-=20
-         /* We write the offset first since it's safer. Note that this f=
ile is only available in 4.17+, so
-          * fail gracefully if it doesn't exist and we're only overwriti=
ng it with 0. */
--        r =3D write_string_file("/sys/power/resume_offset", offset_str,=
 WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/sys/power/resume_offset", offset_str,=
 0);
-         if (r =3D=3D -ENOENT) {
-                 if (offset !=3D 0)
-                         return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSU=
PP),
-@@ -514,7 +514,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
-                 log_debug("Wrote resume_offset=3D%s for device '%s' to =
/sys/power/resume_offset.",
-                           offset_str, device);
-=20
--        r =3D write_string_file("/sys/power/resume", devno_str, WRITE_S=
TRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/sys/power/resume", devno_str, 0);
-         if (r < 0)
-                 return log_error_errno(r,
-                                        "Failed to write device '%s' (%s=
) to /sys/power/resume: %m",
-diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
-index d0a79b2635..0c82d9943a 100644
---- a/src/shared/smack-util.c
-+++ b/src/shared/smack-util.c
-@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label=
) {
-                 return 0;
-=20
-         p =3D procfs_file_alloca(pid, "attr/current");
--        r =3D write_string_file(p, label, WRITE_STRING_FILE_DISABLE_BUF=
FER);
-+        r =3D write_string_file(p, label, 0);
-         if (r < 0)
-                 return r;
-=20
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 181bb4ccef..2dbb3f4bc6 100644
---- a/src/sleep/sleep.c
-+++ b/src/sleep/sleep.c
-@@ -158,7 +158,7 @@ static int write_mode(const char *path, char * const=
 *modes) {
-         assert(path);
-=20
-         STRV_FOREACH(mode, modes) {
--                r =3D write_string_file(path, *mode, WRITE_STRING_FILE_=
DISABLE_BUFFER);
-+                r =3D write_string_file(path, *mode, 0);
-                 if (r >=3D 0) {
-                         log_debug("Using sleep mode '%s' for %s.", *mod=
e, path);
-                         return 0;
-diff --git a/src/storagetm/storagetm.c b/src/storagetm/storagetm.c
-index ca8e886d37..5c27c54f09 100644
---- a/src/storagetm/storagetm.c
-+++ b/src/storagetm/storagetm.c
-@@ -197,7 +197,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
-                                         if (!enable_fn)
-                                                 return log_oom();
-=20
--                                        r =3D write_string_file_at(name=
spaces_fd, enable_fn, "0", WRITE_STRING_FILE_DISABLE_BUFFER);
-+                                        r =3D write_string_file_at(name=
spaces_fd, enable_fn, "0", 0);
-                                         if (r < 0)
-                                                 log_warning_errno(r, "F=
ailed to disable namespace '%s' of NVME subsystem '%s', ignoring: %m", e-=
>d_name, s->name);
-=20
-@@ -265,7 +265,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
-                 _cleanup_free_ char *truncated =3D strndup(w, 40); /* k=
ernel refuses more than 40 chars (as per nvme spec) */
-=20
-                 /* The default string stored in 'attr_model' is "Linux"=
 btw. */
--                r =3D write_string_file_at(subsystem_fd, "attr_model", =
truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                r =3D write_string_file_at(subsystem_fd, "attr_model", =
truncated, 0);
-                 if (r < 0)
-                         log_warning_errno(r, "Failed to set model of su=
bsystem to '%s', ignoring: %m", w);
-         }
-@@ -279,7 +279,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
-                         return log_oom();
-=20
-                  /* The default string stored in 'attr_firmware' is `un=
ame -r` btw, but truncated to 8 chars. */
--                r =3D write_string_file_at(subsystem_fd, "attr_firmware=
", truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                r =3D write_string_file_at(subsystem_fd, "attr_firmware=
", truncated, 0);
-                 if (r < 0)
-                         log_warning_errno(r, "Failed to set model of su=
bsystem to '%s', ignoring: %m", truncated);
-         }
-@@ -306,7 +306,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
-                 if (!truncated)
-                         return log_oom();
-=20
--                r =3D write_string_file_at(subsystem_fd, "attr_serial",=
 truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
-+                r =3D write_string_file_at(subsystem_fd, "attr_serial",=
 truncated, 0);
-                 if (r < 0)
-                         log_warning_errno(r, "Failed to set serial of s=
ubsystem to '%s', ignoring: %m", truncated);
-         }
-@@ -356,7 +356,7 @@ static int nvme_namespace_write_metadata(int namespa=
ce_fd, sd_device *device, co
-                 id =3D id128_digest(j, l);
-         }
-=20
--        r =3D write_string_file_at(namespace_fd, "device_uuid", SD_ID12=
8_TO_UUID_STRING(id), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(namespace_fd, "device_uuid", SD_ID12=
8_TO_UUID_STRING(id), 0);
-         if (r < 0)
-                 log_warning_errno(r, "Failed to set uuid of namespace t=
o '%s', ignoring: %m", SD_ID128_TO_UUID_STRING(id));
-=20
-@@ -419,7 +419,7 @@ static int nvme_subsystem_add(const char *node, int =
consumed_fd, sd_device *devi
-         if (subsystem_fd < 0)
-                 return log_error_errno(subsystem_fd, "Failed to create =
NVME subsystem '%s': %m", j);
-=20
--        r =3D write_string_file_at(subsystem_fd, "attr_allow_any_host",=
 "1", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(subsystem_fd, "attr_allow_any_host",=
 "1", 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to set 'attr_allow_an=
y_host' flag: %m");
-=20
-@@ -434,11 +434,11 @@ static int nvme_subsystem_add(const char *node, in=
t consumed_fd, sd_device *devi
-=20
-         /* We use /proc/$PID/fd/$FD rather than /proc/self/fd/$FD, beca=
use this string is visible to others
-          * via configfs, and by including the PID it's clear to who the=
 stuff belongs. */
--        r =3D write_string_file_at(namespace_fd, "device_path", FORMAT_=
PROC_PID_FD_PATH(0, fd), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(namespace_fd, "device_path", FORMAT_=
PROC_PID_FD_PATH(0, fd), 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write 'device_path=
' attribute: %m");
-=20
--        r =3D write_string_file_at(namespace_fd, "enable", "1", WRITE_S=
TRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(namespace_fd, "enable", "1", 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write 'enable' att=
ribute: %m");
-=20
-@@ -568,19 +568,19 @@ static int nvme_port_add_portnr(
-                 return 0;
-         }
-=20
--        r =3D write_string_file_at(port_fd, "addr_adrfam", af_to_ipv4_i=
pv6(ip_family), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(port_fd, "addr_adrfam", af_to_ipv4_i=
pv6(ip_family), 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to set address family=
 on NVME port %" PRIu16 ": %m", portnr);
-=20
--        r =3D write_string_file_at(port_fd, "addr_trtype", "tcp", WRITE=
_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(port_fd, "addr_trtype", "tcp", 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to set transport type=
 on NVME port %" PRIu16 ": %m", portnr);
-=20
--        r =3D write_string_file_at(port_fd, "addr_trsvcid", fname, WRIT=
E_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(port_fd, "addr_trsvcid", fname, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to set IP port on NVM=
E port %" PRIu16 ": %m", portnr);
-=20
--        r =3D write_string_file_at(port_fd, "addr_traddr", ip_family =3D=
=3D AF_INET6 ? "::" : "0.0.0.0", WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file_at(port_fd, "addr_traddr", ip_family =3D=
=3D AF_INET6 ? "::" : "0.0.0.0", 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to set IP address on =
NVME port %" PRIu16 ": %m", portnr);
-=20
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup=
.c
-index ba742dda69..6f20e81615 100644
---- a/src/vconsole/vconsole-setup.c
-+++ b/src/vconsole/vconsole-setup.c
-@@ -277,7 +277,7 @@ static int toggle_utf8_vc(const char *name, int fd, =
bool utf8) {
- static int toggle_utf8_sysfs(bool utf8) {
-         int r;
-=20
--        r =3D write_string_file("/sys/module/vt/parameters/default_utf8=
", one_zero(utf8), WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r =3D write_string_file("/sys/module/vt/parameters/default_utf8=
", one_zero(utf8), 0);
-         if (r < 0)
-                 return log_warning_errno(r, "Failed to %s sysfs UTF-8 f=
lag: %m", enable_disable(utf8));
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0012-src-shared-condition.=
c-avoid-using-glibc-ConditionVe.patch b/meta/recipes-core/systemd/systemd=
/0012-src-shared-condition.c-avoid-using-glibc-ConditionVe.patch
new file mode 100644
index 0000000000..6734c47f3c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0012-src-shared-condition.c-avoid=
-using-glibc-ConditionVe.patch
@@ -0,0 +1,47 @@
+From 3deaad26b98ce024a938aa61c1609cbd038da369 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 14:59:27 +0800
+Subject: [PATCH 12/16] src/shared/condition.c: avoid using glibc
+ ConditionVersion
+
+The ConditionVersion on glibc is glibc specific.
+And musl does not export programming interface to get its version.
+So it cannot be extended to musl.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/shared/condition.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/condition.c b/src/shared/condition.c
+index b09eff1bfb..4899bd6c39 100644
+--- a/src/shared/condition.c
++++ b/src/shared/condition.c
+@@ -2,7 +2,9 @@
+=20
+ #include <fcntl.h>
+ #include <fnmatch.h>
++#ifdef __GLIBC__
+ #include <gnu/libc-version.h>
++#endif
+ #include <sys/stat.h>
+ #include <sys/utsname.h>
+ #include <time.h>
+@@ -254,10 +256,10 @@ static int condition_test_version(Condition *c, ch=
ar **env) {
+=20
+         if (streq(word, "systemd"))
+                 return condition_test_version_cmp(p, STRINGIFY(PROJECT_=
VERSION));
+-
++#ifdef __GLIBC__
+         if (streq(word, "glibc"))
+                 return condition_test_version_cmp(p, gnu_get_libc_versi=
on());
+-
++#endif
+         /* if no predicate has been set, default to "kernel" and use th=
e whole parameter as condition */
+         if (!streq(word, "kernel"))
+                 p =3D c->parameter;
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usa=
ge.patch b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage=
.patch
deleted file mode 100644
index 35009cba42..0000000000
--- a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patc=
h
+++ /dev/null
@@ -1,60 +0,0 @@
-From ab4fda874b26542de96720db58cb0e8704a40108 Mon Sep 17 00:00:00 2001
-From: Scott Murray <scott.murray@konsulko.com>
-Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH 13/26] Handle __cpu_mask usage
-
-Fixes errors:
-
-src/test/test-cpu-set-util.c:18:54: error: '__cpu_mask' undeclared (firs=
t use in this function)
-src/test/test-sizeof.c:73:14: error: '__cpu_mask' undeclared (first use =
in this function)
-
-__cpu_mask is an internal type of glibc's cpu_set implementation, not
-part of the POSIX definition, which is problematic when building with
-musl, which does not define a matching type.  From inspection of musl's
-sched.h, however, it is clear that the corresponding type would be
-unsigned long, which does match glibc's actual __CPU_MASK_TYPE.  So,
-add a typedef to cpu-set-util.h defining __cpu_mask appropriately.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- src/shared/cpu-set-util.h | 2 ++
- src/test/test-sizeof.c    | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
-index 2c477d8a01..c026ce77a6 100644
---- a/src/shared/cpu-set-util.h
-+++ b/src/shared/cpu-set-util.h
-@@ -6,6 +6,8 @@
- #include "macro.h"
- #include "missing_syscall.h"
-=20
-+typedef unsigned long __cpu_mask;
-+
- /* This wraps the libc interface with a variable to keep the allocated =
size. */
- typedef struct CPUSet {
-         cpu_set_t *set;
-diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index ea0c58770e..b65c0bd370 100644
---- a/src/test/test-sizeof.c
-+++ b/src/test/test-sizeof.c
-@@ -1,6 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <sched.h>
- #include <stdio.h>
- #include <string.h>
- #include <sys/resource.h>
-@@ -12,6 +11,7 @@
- #include <float.h>
-=20
- #include "time-util.h"
-+#include "cpu-set-util.h"
-=20
- /* Print information about various types. Useful when diagnosing
-  * gcc diagnostics on an unfamiliar architecture. */
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0026-build-path.c-avoid-bo=
ot-time-segfault-for-musl.patch b/meta/recipes-core/systemd/systemd/0013-=
build-path.c-avoid-boot-time-segfault-for-musl.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0026-build-path.c-avoid-boo=
t-time-segfault-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0013-build-path.c-avoid-boot-=
time-segfault-for-musl.patch
index a7549ee151..e4d2c198f9 100644
--- a/meta/recipes-core/systemd/systemd/0026-build-path.c-avoid-boot-time=
-segfault-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0013-build-path.c-avoid-boot-time=
-segfault-for-musl.patch
@@ -1,7 +1,7 @@
-From f2a7cf1d2a2bc2516a180809efd85c828cd9c7f4 Mon Sep 17 00:00:00 2001
+From a4b921b8d408e0f1c9d035a3ec93c3da3fe42352 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 3 Jul 2024 07:18:42 -0700
-Subject: [PATCH 26/26] build-path.c: avoid boot time segfault for musl
+Subject: [PATCH 13/16] build-path.c: avoid boot time segfault for musl
=20
 This function, at runtime, should return -ENOEXEC. For musl, it
 somehow segfaults. I think it's related to getauxval, but it's
@@ -15,10 +15,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/src/basic/build-path.c b/src/basic/build-path.c
-index b5972658df..4ef551034e 100644
+index 577ff72bce..3a7876798c 100644
 --- a/src/basic/build-path.c
 +++ b/src/basic/build-path.c
-@@ -151,6 +151,7 @@ int get_build_exec_dir(char **ret) {
+@@ -152,6 +152,7 @@ int get_build_exec_dir(char **ret) {
           */
 =20
          static int runpath_cached =3D -ERRNO_MAX-1;
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshado=
w.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow-f=
or-musl.patch
similarity index 71%
rename from meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow=
.patch
rename to meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow-f=
or-musl.patch
index 0aabae6d82..a512e3d650 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow-for-m=
usl.patch
@@ -1,7 +1,7 @@
-From c5165f6adf8a9cfe8c0784c598b87d7d7e8b7d1a Mon Sep 17 00:00:00 2001
+From 6018d55f5fcab127fef9acbd250cdc185983ba59 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH 14/26] Handle missing gshadow
+Subject: [PATCH 14/16] Handle missing gshadow for musl
=20
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -10,17 +10,36 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+[Rebased for v258]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/shared/user-record-nss.c | 20 ++++++++++++++++++++
- src/shared/user-record-nss.h |  4 ++++
- src/shared/userdb.c          |  7 ++++++-
- 3 files changed, 30 insertions(+), 1 deletion(-)
+ src/include/override/gshadow.h | 10 ++++++++++
+ src/shared/user-record-nss.c   | 20 ++++++++++++++++++++
+ src/shared/userdb.c            |  7 ++++++-
+ 3 files changed, 36 insertions(+), 1 deletion(-)
+ create mode 100644 src/include/override/gshadow.h
=20
+diff --git a/src/include/override/gshadow.h b/src/include/override/gshad=
ow.h
+new file mode 100644
+index 0000000000..568a9bb2d9
+--- /dev/null
++++ b/src/include/override/gshadow.h
+@@ -0,0 +1,10 @@
++#ifndef _GSHADOW_H
++#define _GSHADOW_H    1
++
++#if ENABLE_GSHADOW
++#include_next <gshadow.h>
++#else
++struct sgrp;
++#endif
++
++#endif /* gshadow.h */
 diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index 9223a2e6ca..f9eb1a5b64 100644
+index 10a5a75e9f..24db7c953d 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
-@@ -286,8 +286,10 @@ int nss_group_to_group_record(
+@@ -296,8 +296,10 @@ int nss_group_to_group_record(
          if (isempty(grp->gr_name))
                  return -EINVAL;
 =20
@@ -31,7 +50,7 @@ index 9223a2e6ca..f9eb1a5b64 100644
 =20
          g =3D group_record_new();
          if (!g)
-@@ -303,6 +305,7 @@ int nss_group_to_group_record(
+@@ -313,6 +315,7 @@ int nss_group_to_group_record(
 =20
          g->gid =3D grp->gr_gid;
 =20
@@ -39,7 +58,7 @@ index 9223a2e6ca..f9eb1a5b64 100644
          if (sgrp) {
                  if (looks_like_hashed_password(utf8_only(sgrp->sg_passw=
d))) {
                          g->hashed_password =3D strv_new(sgrp->sg_passwd=
);
-@@ -318,6 +321,7 @@ int nss_group_to_group_record(
+@@ -328,6 +331,7 @@ int nss_group_to_group_record(
                  if (r < 0)
                          return r;
          }
@@ -47,15 +66,15 @@ index 9223a2e6ca..f9eb1a5b64 100644
 =20
          r =3D sd_json_buildo(
                          &g->json,
-@@ -345,6 +349,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
+@@ -355,6 +359,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
          assert(ret_sgrp);
          assert(ret_buffer);
 =20
 +#if ENABLE_GSHADOW
          for (;;) {
                  _cleanup_free_ char *buf =3D NULL;
-                 struct sgrp sgrp, *result;
-@@ -373,6 +378,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
+                 struct sgrp sgrp =3D {}, *result =3D NULL;
+@@ -383,6 +388,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
                  buflen *=3D 2;
                  buf =3D mfree(buf);
          }
@@ -65,7 +84,7 @@ index 9223a2e6ca..f9eb1a5b64 100644
  }
 =20
  int nss_group_record_by_name(
-@@ -383,7 +391,9 @@ int nss_group_record_by_name(
+@@ -393,7 +401,9 @@ int nss_group_record_by_name(
          _cleanup_free_ char *sbuf =3D NULL;
          _cleanup_free_ struct group *result =3D NULL;
          bool incomplete =3D false;
@@ -75,7 +94,7 @@ index 9223a2e6ca..f9eb1a5b64 100644
          int r;
 =20
          assert(name);
-@@ -392,6 +402,7 @@ int nss_group_record_by_name(
+@@ -402,6 +412,7 @@ int nss_group_record_by_name(
          if (r < 0)
                  return r;
 =20
@@ -83,7 +102,7 @@ index 9223a2e6ca..f9eb1a5b64 100644
          if (with_shadow) {
                  r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
                  if (r < 0) {
-@@ -403,6 +414,9 @@ int nss_group_record_by_name(
+@@ -413,6 +424,9 @@ int nss_group_record_by_name(
                  incomplete =3D true;
 =20
          r =3D nss_group_to_group_record(result, sresult, ret);
@@ -93,7 +112,7 @@ index 9223a2e6ca..f9eb1a5b64 100644
          if (r < 0)
                  return r;
 =20
-@@ -419,13 +433,16 @@ int nss_group_record_by_gid(
+@@ -429,13 +443,16 @@ int nss_group_record_by_gid(
          _cleanup_free_ char *sbuf =3D NULL;
          _cleanup_free_ struct group *result =3D NULL;
          bool incomplete =3D false;
@@ -110,7 +129,7 @@ index 9223a2e6ca..f9eb1a5b64 100644
          if (with_shadow) {
                  r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
                  if (r < 0) {
-@@ -437,6 +454,9 @@ int nss_group_record_by_gid(
+@@ -447,6 +464,9 @@ int nss_group_record_by_gid(
                  incomplete =3D true;
 =20
          r =3D nss_group_to_group_record(result, sresult, ret);
@@ -120,27 +139,11 @@ index 9223a2e6ca..f9eb1a5b64 100644
          if (r < 0)
                  return r;
 =20
-diff --git a/src/shared/user-record-nss.h b/src/shared/user-record-nss.h
-index 22ab04d6ee..4e52e7a911 100644
---- a/src/shared/user-record-nss.h
-+++ b/src/shared/user-record-nss.h
-@@ -2,7 +2,11 @@
- #pragma once
-=20
- #include <grp.h>
-+#if ENABLE_GSHADOW
- #include <gshadow.h>
-+#else
-+struct sgrp;
-+#endif
- #include <pwd.h>
- #include <shadow.h>
-=20
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index ff83d4bf90..54d36cc706 100644
+index 49850ff216..f4217c0971 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1042,13 +1042,15 @@ int groupdb_iterator_get(UserDBIterator *iterato=
r, GroupRecord **ret) {
+@@ -1551,13 +1551,15 @@ static int groupdb_iterator_get_one(UserDBIterat=
or *iterator, GroupRecord **ret)
                  if (gr) {
                          _cleanup_free_ char *buffer =3D NULL;
                          bool incomplete =3D false;
@@ -157,7 +160,7 @@ index ff83d4bf90..54d36cc706 100644
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS=
_SHADOW)) {
                                  r =3D nss_sgrp_for_group(gr, &sgrp, &bu=
ffer);
                                  if (r < 0) {
-@@ -1061,6 +1063,9 @@ int groupdb_iterator_get(UserDBIterator *iterator,=
 GroupRecord **ret) {
+@@ -1570,6 +1572,9 @@ static int groupdb_iterator_get_one(UserDBIterator=
 *iterator, GroupRecord **ret)
                          }
 =20
                          r =3D nss_group_to_group_record(gr, r >=3D 0 ? =
&sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd/0015-Avoid-sequence-point-=
error.patch b/meta/recipes-core/systemd/systemd/0015-Avoid-sequence-point=
-error.patch
new file mode 100644
index 0000000000..c3401068cb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0015-Avoid-sequence-point-error.p=
atch
@@ -0,0 +1,35 @@
+From 5dbeaee2085d3edcf20983fce4208eb174e46422 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 9 Oct 2025 15:19:09 +0800
+Subject: [PATCH 15/16] Avoid sequence-point error
+
+See https://www.openwall.com/lists/musl/2025/09/30/4
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/shared/cpu-set-util.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/cpu-set-util.c b/src/shared/cpu-set-util.c
+index 7a155c12d4..a9c57fc31c 100644
+--- a/src/shared/cpu-set-util.c
++++ b/src/shared/cpu-set-util.c
+@@ -97,9 +97,11 @@ char* cpu_set_to_mask_string(const CPUSet *c) {
+         for (size_t i =3D c->allocated * 8; i > 0; ) {
+                 uint32_t m =3D 0;
+=20
+-                for (int j =3D (i % 32 ?: 32) - 1; j >=3D 0; j--)
+-                        if (CPU_ISSET_S(--i, c->allocated, c->set))
++                for (int j =3D (i % 32 ?: 32) - 1; j >=3D 0; j--) {
++                        --i;
++                        if (CPU_ISSET_S(i, c->allocated, c->set))
+                                 SET_BIT(m, j);
++                }
+=20
+                 if (!found_nonzero) {
+                         if (m =3D=3D 0)
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Def=
ine-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0=
015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
deleted file mode 100644
index 1443c5082b..0000000000
--- a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ef9ad83759f78de983d2d7c4f95bc48b83bb8f66 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 12 Apr 2021 23:44:53 -0700
-Subject: [PATCH 15/26] missing_syscall.h: Define MIPS ABI defines for mu=
sl
-
-musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
-unlike glibc where these are provided by libc headers, therefore define
-them here in case they are undefined
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/basic/missing_syscall.h  | 6 ++++++
- src/shared/base-filesystem.c | 1 +
- 2 files changed, 7 insertions(+)
-
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -20,6 +20,12 @@
- #include <asm/sgidefs.h>
- #endif
-=20
-+#ifndef _MIPS_SIM_ABI32
-+#define _MIPS_SIM_ABI32	1
-+#define _MIPS_SIM_NABI32 2
-+#define _MIPS_SIM_ABI64	3
-+#endif
-+
- #include "macro.h"
- #include "missing_keyctl.h"
- #include "missing_sched.h"
---- a/src/shared/base-filesystem.c
-+++ b/src/shared/base-filesystem.c
-@@ -20,6 +20,7 @@
- #include "string-util.h"
- #include "umask-util.h"
- #include "user-util.h"
-+#include "missing_syscall.h"
-=20
- typedef enum BaseFilesystemFlags {
-         BASE_FILESYSTEM_IGNORE_ON_FAILURE =3D 1 << 0,
diff --git a/meta/recipes-core/systemd/systemd/0016-Fix-the-segfault-for-=
glob-related-codes-and-define-d.patch b/meta/recipes-core/systemd/systemd=
/0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch
new file mode 100644
index 0000000000..41dbabfff7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0016-Fix-the-segfault-for-glob-re=
lated-codes-and-define-d.patch
@@ -0,0 +1,409 @@
+From bedd0563f4b142aa6376a2ad1e2884d2c0dc3e45 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 13 Oct 2025 17:07:57 +0800
+Subject: [PATCH 16/16] Fix the segfault for glob related codes and defin=
e
+ dummy macros
+
+systemd switches to use its own free function to free gl_pathv
+located by glob() function. This causes segfault error for musl.
+
+The backtrace is like below:
+get_meta (p=3Dp@entry=3D0x7ffff7b39fa8 "/proc/sys/net/ipv4/conf/all/rp_f=
ilter")
+    at /usr/src/debug/musl/1.2.5+git/src/malloc/mallocng/meta.h:131
+    131             assert(!((uintptr_t)p & 15));
+
+Why so? Because it's expected that people use globfree to do the memory
+freeing work. Invoking free on gl_pathv[*] is not freeing the correct
+memory address.
+
+The key line in musl's globfree is as below:
+  free(g->gl_pathv[g->gl_offs + i] - offsetof(struct match, name));
+
+So we can see the addree is not gl_pathv[*], it's
+gl_pathv[*] - offsetof(struct match, name).
+
+To address this issue, revert the following codes:
+1. Revert "glob-util: rework safe_glob()"
+   This reverts commit 2a5f950e5643a74bef70b1c3c46ec33ad0e3fd41.
+2. Revert "glob-util: drop unused _cleanup_globfree_"
+   This reverts commit f117272f6645fc2fe9751898770603ed07d15cea.
+
+There is no functional change.
+
+Also, define dummy macros to make things compile for musl.
+
+Note:
+If systemd later adopts some dramatic change for glob, we might
+need to adopt other methods instead of doing the revert. In this
+version, reverting is prefered because there is NO functional change.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/glob-util.c       | 96 ++++++++++++++++++-------------------
+ src/basic/glob-util.h       | 12 ++---
+ src/core/exec-credential.c  |  6 +--
+ src/core/execute.c          |  8 ++--
+ src/include/override/glob.h |  6 +++
+ src/test/test-glob-util.c   | 27 ++++++-----
+ src/tmpfiles/tmpfiles.c     | 20 +++++---
+ 7 files changed, 95 insertions(+), 80 deletions(-)
+ create mode 100644 src/include/override/glob.h
+
+diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
+index 5843ef088f..a9c62151af 100644
+--- a/src/basic/glob-util.c
++++ b/src/basic/glob-util.c
+@@ -6,83 +6,81 @@
+ #include "dirent-util.h"
+ #include "errno-util.h"
+ #include "glob-util.h"
++#include "log.h"
+ #include "string-util.h"
+ #include "strv.h"
+=20
+-DEFINE_TRIVIAL_DESTRUCTOR(closedir_wrapper, void, closedir);
+-
+-int safe_glob_full(const char *path, int flags, opendir_t opendir_func,=
 char ***ret) {
+-        _cleanup_(globfree) glob_t g =3D {
+-                .gl_closedir =3D closedir_wrapper,
+-                .gl_readdir =3D (struct dirent* (*)(void *)) readdir_no=
_dot,
+-                .gl_opendir =3D (void* (*)(const char *)) (opendir_func=
 ?: opendir),
+-                .gl_lstat =3D lstat,
+-                .gl_stat =3D stat,
+-        };
+-        int r;
+-
+-        assert(path);
++static void closedir_wrapper(void* v) {
++        (void) closedir(v);
++}
+=20
++int safe_glob(const char *path, int flags, glob_t *pglob) {
++        int k;
++
++        /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to =
be set. */
++        assert(!(flags & GLOB_ALTDIRFUNC));
++#ifdef __GLIBC__
++        if (!pglob->gl_closedir)
++                pglob->gl_closedir =3D closedir_wrapper;
++        if (!pglob->gl_readdir)
++                pglob->gl_readdir =3D (struct dirent *(*)(void *)) read=
dir_no_dot;
++        if (!pglob->gl_opendir)
++                pglob->gl_opendir =3D (void *(*)(const char *)) opendir=
;
++        if (!pglob->gl_lstat)
++                pglob->gl_lstat =3D lstat;
++        if (!pglob->gl_stat)
++                pglob->gl_stat =3D stat;
++#endif
+         errno =3D 0;
+-        r =3D glob(path, flags | GLOB_ALTDIRFUNC, NULL, &g);
+-        if (r =3D=3D GLOB_NOMATCH)
++        k =3D glob(path, flags | GLOB_ALTDIRFUNC, NULL, pglob);
++        if (k =3D=3D GLOB_NOMATCH)
+                 return -ENOENT;
+-        if (r =3D=3D GLOB_NOSPACE)
++        if (k =3D=3D GLOB_NOSPACE)
+                 return -ENOMEM;
+-        if (r !=3D 0)
++        if (k !=3D 0)
+                 return errno_or_else(EIO);
+-
+-        if (strv_isempty(g.gl_pathv))
++        if (strv_isempty(pglob->gl_pathv))
+                 return -ENOENT;
+=20
+-        if (ret) {
+-                *ret =3D g.gl_pathv;
+-                TAKE_STRUCT(g); /* To avoid the result being freed. */
+-        }
+-
+         return 0;
+ }
+=20
+-int glob_first(const char *path, char **ret) {
+-        _cleanup_strv_free_ char **v =3D NULL;
+-        int r;
++int glob_first(const char *path, char **ret_first) {
++        _cleanup_globfree_ glob_t g =3D {};
++        int k;
+=20
+         assert(path);
+=20
+-        r =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE, &v);
+-        if (r =3D=3D -ENOENT) {
+-                if (ret)
+-                        *ret =3D NULL;
++        k =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE, &g);
++        if (k =3D=3D -ENOENT) {
++                if (ret_first)
++                        *ret_first =3D NULL;
+                 return false;
+         }
+-        if (r < 0)
+-                return r;
+-
+-        assert(!strv_isempty(v));
++        if (k < 0)
++                return k;
+=20
+-        if (ret) {
+-                /* Free all results except for the first one. */
+-                STRV_FOREACH(p, strv_skip(v, 1))
+-                        *p =3D mfree(*p);
++        if (ret_first) {
++                assert(g.gl_pathv && g.gl_pathv[0]);
+=20
+-                /* Then, take the first result. */
+-                *ret =3D TAKE_PTR(*v);
++                char *first =3D strdup(g.gl_pathv[0]);
++                if (!first)
++                        return log_oom_debug();
++                *ret_first =3D first;
+         }
+=20
+         return true;
+ }
+=20
+ int glob_extend(char ***strv, const char *path, int flags) {
+-        char **v;
+-        int r;
+-
+-        assert(path);
++        _cleanup_globfree_ glob_t g =3D {};
++        int k;
+=20
+-        r =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE|flags, &v);
+-        if (r < 0)
+-                return r;
++        k =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE|flags, &g);
++        if (k < 0)
++                return k;
+=20
+-        return strv_extend_strv_consume(strv, v, /* filter_duplicates =3D=
 */ false);
++        return strv_extend_strv(strv, g.gl_pathv, false);
+ }
+=20
+ int glob_non_glob_prefix(const char *path, char **ret) {
+diff --git a/src/basic/glob-util.h b/src/basic/glob-util.h
+index ea3e869319..4fa23f5048 100644
+--- a/src/basic/glob-util.h
++++ b/src/basic/glob-util.h
+@@ -5,18 +5,16 @@
+=20
+ #include "forward.h"
+=20
+-typedef DIR* (*opendir_t)(const char *);
+-
+-int safe_glob_full(const char *path, int flags, opendir_t opendir_func,=
 char ***ret);
+-static inline int safe_glob(const char *path, int flags, char ***ret) {
+-        return safe_glob_full(path, flags, NULL, ret);
+-}
++/* Note: this function modifies pglob to set various functions. */
++int safe_glob(const char *path, int flags, glob_t *pglob);
+=20
+ /* Note: which match is returned depends on the implementation/system a=
nd not guaranteed to be stable */
+-int glob_first(const char *path, char **ret);
++int glob_first(const char *path, char **ret_first);
+ #define glob_exists(path) glob_first(path, NULL)
+ int glob_extend(char ***strv, const char *path, int flags);
+=20
+ int glob_non_glob_prefix(const char *path, char **ret);
+=20
++#define _cleanup_globfree_ _cleanup_(globfree)
++
+ bool string_is_glob(const char *p) _pure_;
+diff --git a/src/core/exec-credential.c b/src/core/exec-credential.c
+index 5e2bc8edd9..32cbb4d4d0 100644
+--- a/src/core/exec-credential.c
++++ b/src/core/exec-credential.c
+@@ -556,20 +556,20 @@ static int load_credential_glob(
+         assert(search_path);
+=20
+         STRV_FOREACH(d, search_path) {
+-                _cleanup_strv_free_ char **paths =3D NULL;
++                _cleanup_globfree_ glob_t pglob =3D {};
+                 _cleanup_free_ char *j =3D NULL;
+=20
+                 j =3D path_join(*d, ic->glob);
+                 if (!j)
+                         return -ENOMEM;
+=20
+-                r =3D safe_glob(j, /* flags =3D */ 0, &paths);
++                r =3D safe_glob(j, 0, &pglob);
+                 if (r =3D=3D -ENOENT)
+                         continue;
+                 if (r < 0)
+                         return r;
+=20
+-                STRV_FOREACH(p, paths) {
++                FOREACH_ARRAY(p, pglob.gl_pathv, pglob.gl_pathc) {
+                         _cleanup_free_ char *fn =3D NULL;
+                         _cleanup_(erase_and_freep) char *data =3D NULL;
+                         size_t size;
+diff --git a/src/core/execute.c b/src/core/execute.c
+index c384e9dd63..3d6546c037 100644
+--- a/src/core/execute.c
++++ b/src/core/execute.c
+@@ -897,7 +897,7 @@ static int exec_context_load_environment(const Unit =
*unit, const ExecContext *c,
+         assert(ret);
+=20
+         STRV_FOREACH(i, c->environment_files) {
+-                _cleanup_strv_free_ char **paths =3D NULL;
++                _cleanup_globfree_ glob_t pglob =3D {};
+                 bool ignore =3D false;
+                 char *fn =3D *i;
+=20
+@@ -913,7 +913,7 @@ static int exec_context_load_environment(const Unit =
*unit, const ExecContext *c,
+                 }
+=20
+                 /* Filename supports globbing, take all matching files =
*/
+-                r =3D safe_glob(fn, /* flags =3D */ 0, &paths);
++                r =3D safe_glob(fn, 0, &pglob);
+                 if (r < 0) {
+                         if (ignore)
+                                 continue;
+@@ -921,9 +921,9 @@ static int exec_context_load_environment(const Unit =
*unit, const ExecContext *c,
+                 }
+=20
+                 /* When we don't match anything, -ENOENT should be retu=
rned */
+-                assert(!strv_isempty(paths));
++                assert(pglob.gl_pathc > 0);
+=20
+-                STRV_FOREACH(path, paths) {
++                FOREACH_ARRAY(path, pglob.gl_pathv, pglob.gl_pathc) {
+                         _cleanup_strv_free_ char **p =3D NULL;
+=20
+                         r =3D load_env_file(NULL, *path, &p);
+diff --git a/src/include/override/glob.h b/src/include/override/glob.h
+new file mode 100644
+index 0000000000..a8f1829766
+--- /dev/null
++++ b/src/include/override/glob.h
+@@ -0,0 +1,6 @@
++#pragma once
++
++#include_next <glob.h>
++
++#define GLOB_BRACE 0
++#define GLOB_ALTDIRFUNC 0
+diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
+index a9880f15c8..754dc77447 100644
+--- a/src/test/test-glob-util.c
++++ b/src/test/test-glob-util.c
+@@ -9,7 +9,6 @@
+ #include "fs-util.h"
+ #include "glob-util.h"
+ #include "rm-rf.h"
+-#include "strv.h"
+ #include "tests.h"
+ #include "tmpfile-util.h"
+=20
+@@ -55,25 +54,31 @@ TEST(glob_exists) {
+ TEST(safe_glob) {
+         char template[] =3D "/tmp/test-glob-util.XXXXXXX";
+         const char *fn, *fn2, *fname;
+-        _cleanup_strv_free_ char **v =3D NULL;
+=20
+-        ASSERT_NOT_NULL(mkdtemp(template));
++        _cleanup_globfree_ glob_t g =3D {};
++        int r;
++
++        assert_se(mkdtemp(template));
+=20
+         fn =3D strjoina(template, "/*");
+-        ASSERT_ERROR(safe_glob(fn, /* flags =3D */ 0, &v), ENOENT);
++        r =3D safe_glob(fn, 0, &g);
++        assert_se(r =3D=3D -ENOENT);
+=20
+         fn2 =3D strjoina(template, "/.*");
+-        ASSERT_ERROR(safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &v), ENOENT=
);
++        r =3D safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &g);
++        assert_se(r =3D=3D -ENOENT);
+=20
+         fname =3D strjoina(template, "/.foobar");
+-        ASSERT_OK(touch(fname));
++        assert_se(touch(fname) =3D=3D 0);
+=20
+-        ASSERT_ERROR(safe_glob(fn, /* flags =3D */ 0, &v), ENOENT);
++        r =3D safe_glob(fn, 0, &g);
++        assert_se(r =3D=3D -ENOENT);
+=20
+-        ASSERT_OK(safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &v));
+-        ASSERT_EQ(strv_length(v), 1u);
+-        ASSERT_STREQ(v[0], fname);
+-        ASSERT_NULL(v[1]);
++        r =3D safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &g);
++        assert_se(r =3D=3D 0);
++        assert_se(g.gl_pathc =3D=3D 1);
++        ASSERT_STREQ(g.gl_pathv[0], fname);
++        ASSERT_NULL(g.gl_pathv[1]);
+=20
+         (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
+ }
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index 4342ed70ab..2e1fd87f54 100644
+--- a/src/tmpfiles/tmpfiles.c
++++ b/src/tmpfiles/tmpfiles.c
+@@ -2575,21 +2575,25 @@ finish:
+ }
+=20
+ static int glob_item(Context *c, Item *i, action_t action) {
+-        _cleanup_strv_free_ char **paths =3D NULL;
++        _cleanup_globfree_ glob_t g =3D {
++#ifdef __GLIBC__
++                .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
++#endif
++        };
+         int r;
+=20
+         assert(c);
+         assert(i);
+         assert(action);
+=20
+-        r =3D safe_glob_full(i->path, GLOB_NOSORT|GLOB_BRACE, opendir_n=
omod, &paths);
++        r =3D safe_glob(i->path, GLOB_NOSORT|GLOB_BRACE, &g);
+         if (r =3D=3D -ENOENT)
+                 return 0;
+         if (r < 0)
+                 return log_error_errno(r, "Failed to glob '%s': %m", i-=
>path);
+=20
+         r =3D 0;
+-        STRV_FOREACH(fn, paths)
++        STRV_FOREACH(fn, g.gl_pathv)
+                 /* We pass CREATION_EXISTING here, since if we are glob=
bing for it, it always has to exist */
+                 RET_GATHER(r, action(c, i, *fn, CREATION_EXISTING));
+=20
+@@ -2601,21 +2605,25 @@ static int glob_item_recursively(
+                 Item *i,
+                 fdaction_t action) {
+=20
+-        _cleanup_strv_free_ char **paths =3D NULL;
++        _cleanup_globfree_ glob_t g =3D {
++#ifdef __GLIBC__
++                .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
++#endif
++        };
+         int r;
+=20
+         assert(c);
+         assert(i);
+         assert(action);
+=20
+-        r =3D safe_glob_full(i->path, GLOB_NOSORT|GLOB_BRACE, opendir_n=
omod, &paths);
++        r =3D safe_glob(i->path, GLOB_NOSORT|GLOB_BRACE, &g);
+         if (r =3D=3D -ENOENT)
+                 return 0;
+         if (r < 0)
+                 return log_error_errno(r, "Failed to glob '%s': %m", i-=
>path);
+=20
+         r =3D 0;
+-        STRV_FOREACH(fn, paths) {
++        STRV_FOREACH(fn, g.gl_pathv) {
+                 _cleanup_close_ int fd =3D -EBADF;
+=20
+                 /* Make sure we won't trigger/follow file object (such =
as device nodes, automounts, ...)
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0016-pass-correct-paramete=
rs-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0016-pass-corr=
ect-parameters-to-getdents64.patch
deleted file mode 100644
index b802106155..0000000000
--- a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-g=
etdents64.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9079b158779a9c395c24f882f72a1c734795045d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH 16/26] pass correct parameters to getdents64
-
-Fixes
-../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types =
passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct =
dirent *' [-Werror,-Wincompatible-pointer-types]
-                n =3D getdents64(dir_fd, (uint8_t*) de->buffer + de->buf=
fer_size, bs - de->buffer_size);
-                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
-
-../git/src/basic/stat-util.c:102:28: error: incompatible pointer types p=
assing 'union (unnamed union at ../git/src/basic/stat-util.c:78:9) *' to =
parameter of type 'struct dirent *' [-Werror,-Wincompatible-pointer-types=
]
-        n =3D getdents64(fd, &buffer, sizeof(buffer));
-                           ^~~~~~~
-
-Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
----
- src/basic/recurse-dir.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
-index 378fd92b06..5b567b457d 100644
---- a/src/basic/recurse-dir.c
-+++ b/src/basic/recurse-dir.c
-@@ -56,7 +56,7 @@ int readdir_all(int dir_fd,
-                 bs =3D MIN(MALLOC_SIZEOF_SAFE(de) - offsetof(DirectoryE=
ntries, buffer), (size_t) SSIZE_MAX);
-                 assert(bs > de->buffer_size);
-=20
--                n =3D getdents64(dir_fd, (uint8_t*) de->buffer + de->bu=
ffer_size, bs - de->buffer_size);
-+                n =3D getdents64(dir_fd, (struct dirent*)((uint8_t*) de=
->buffer + de->buffer_size), bs - de->buffer_size);
-                 if (n < 0)
-                         return -errno;
-                 if (n =3D=3D 0)
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-heade=
rs.patch b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers=
.patch
deleted file mode 100644
index 5a2bc3c552..0000000000
--- a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patc=
h
+++ /dev/null
@@ -1,526 +0,0 @@
-From be9d8f221ab9d31c0df8b2b3e66172bb9bc0f71f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Jan 2022 22:19:37 -0800
-Subject: [PATCH 17/26] Adjust for musl headers
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-[Rebased for v255.1]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/linux/ethtool.h                     | 3 ++-
- src/libsystemd-network/sd-dhcp6-client.c      | 2 +-
- src/network/netdev/bareudp.c                  | 2 +-
- src/network/netdev/batadv.c                   | 2 +-
- src/network/netdev/bond.c                     | 2 +-
- src/network/netdev/bridge.c                   | 3 ++-
- src/network/netdev/dummy.c                    | 2 +-
- src/network/netdev/geneve.c                   | 2 +-
- src/network/netdev/ifb.c                      | 2 +-
- src/network/netdev/ipoib.c                    | 2 +-
- src/network/netdev/ipvlan.c                   | 2 +-
- src/network/netdev/macsec.c                   | 2 +-
- src/network/netdev/macvlan.c                  | 2 +-
- src/network/netdev/netdev.c                   | 2 +-
- src/network/netdev/netdevsim.c                | 2 +-
- src/network/netdev/nlmon.c                    | 2 +-
- src/network/netdev/tunnel.c                   | 2 +-
- src/network/netdev/vcan.c                     | 2 +-
- src/network/netdev/veth.c                     | 2 +-
- src/network/netdev/vlan.c                     | 2 +-
- src/network/netdev/vrf.c                      | 2 +-
- src/network/netdev/vxcan.c                    | 2 +-
- src/network/netdev/vxlan.c                    | 2 +-
- src/network/netdev/wireguard.c                | 2 +-
- src/network/netdev/xfrm.c                     | 2 +-
- src/network/networkd-dhcp-common.c            | 3 ++-
- src/network/networkd-dhcp-prefix-delegation.c | 3 ++-
- src/network/networkd-dhcp-server.c            | 2 +-
- src/network/networkd-dhcp4.c                  | 2 +-
- src/network/networkd-ipv6ll.c                 | 2 +-
- src/network/networkd-link.c                   | 2 +-
- src/network/networkd-ndisc.c                  | 2 +-
- src/network/networkd-setlink.c                | 2 +-
- src/network/networkd-sysctl.c                 | 2 +-
- src/shared/netif-util.c                       | 2 +-
- src/udev/udev-builtin-net_id.c                | 2 +-
- 36 files changed, 40 insertions(+), 36 deletions(-)
-
-diff --git a/src/basic/linux/ethtool.h b/src/basic/linux/ethtool.h
-index a32293ba20..2aad67e9c0 100644
---- a/src/basic/linux/ethtool.h
-+++ b/src/basic/linux/ethtool.h
-@@ -16,7 +16,8 @@
-=20
- #include <linux/const.h>
- #include <linux/types.h>
--#include <linux/if_ether.h>
-+#include <netinet/if_ether.h>
-+//#include <linux/if_ether.h>
-=20
- #include <limits.h> /* for INT_MAX */
-=20
-diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-n=
etwork/sd-dhcp6-client.c
-index 3e992d7cad..c7e1ff4dbf 100644
---- a/src/libsystemd-network/sd-dhcp6-client.c
-+++ b/src/libsystemd-network/sd-dhcp6-client.c
-@@ -5,7 +5,7 @@
-=20
- #include <errno.h>
- #include <sys/ioctl.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_infiniband.h>
-=20
- #include "sd-dhcp6-client.h"
-diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.c
-index e122abd97f..c120c2969b 100644
---- a/src/network/netdev/bareudp.c
-+++ b/src/network/netdev/bareudp.c
-@@ -2,7 +2,7 @@
-  * Copyright =C2=A9 2020 VMware, Inc. */
-=20
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "bareudp.h"
- #include "netlink-util.h"
-diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
-index 9806d8eb7c..19c3d881c2 100644
---- a/src/network/netdev/batadv.c
-+++ b/src/network/netdev/batadv.c
-@@ -3,7 +3,7 @@
- #include <inttypes.h>
- #include <netinet/in.h>
- #include <linux/genetlink.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "batadv.h"
- #include "fileio.h"
-diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index b866940b7a..a0eaf0a866 100644
---- a/src/network/netdev/bond.c
-+++ b/src/network/netdev/bond.c
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "alloc-util.h"
- #include "bond.h"
-diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index d3ba4989d9..4f7301c4f1 100644
---- a/src/network/netdev/bridge.c
-+++ b/src/network/netdev/bridge.c
-@@ -2,7 +2,8 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
--#include <linux/if_arp.h>
-+#include <netinet/in.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_bridge.h>
- #include <netinet/in.h>
-=20
-diff --git a/src/network/netdev/dummy.c b/src/network/netdev/dummy.c
-index 8b2893d5b4..412123f036 100644
---- a/src/network/netdev/dummy.c
-+++ b/src/network/netdev/dummy.c
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "dummy.h"
-=20
-diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
-index 1d68be9bc8..539151c49e 100644
---- a/src/network/netdev/geneve.c
-+++ b/src/network/netdev/geneve.c
-@@ -2,7 +2,7 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <netinet/in.h>
-=20
- #include "alloc-util.h"
-diff --git a/src/network/netdev/ifb.c b/src/network/netdev/ifb.c
-index d7ff44cb9e..e037629ae4 100644
---- a/src/network/netdev/ifb.c
-+++ b/src/network/netdev/ifb.c
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later
-  * Copyright =C2=A9 2019 VMware, Inc. */
-=20
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "ifb.h"
-=20
-diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
-index 6932c62e2a..fc458da9e8 100644
---- a/src/network/netdev/ipoib.c
-+++ b/src/network/netdev/ipoib.c
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_link.h>
-=20
- #include "ipoib.h"
-diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
-index 6e50f72aaa..49acfee25e 100644
---- a/src/network/netdev/ipvlan.c
-+++ b/src/network/netdev/ipvlan.c
-@@ -3,7 +3,7 @@
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "conf-parser.h"
- #include "ipvlan.h"
-diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 6dd434f803..f9fbe9f51a 100644
---- a/src/network/netdev/macsec.c
-+++ b/src/network/netdev/macsec.c
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_ether.h>
- #include <linux/if_macsec.h>
- #include <linux/genetlink.h>
-diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
-index fd112b58e1..b038740bda 100644
---- a/src/network/netdev/macvlan.c
-+++ b/src/network/netdev/macvlan.c
-@@ -3,7 +3,7 @@
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "conf-parser.h"
- #include "macvlan.h"
-diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index c2986aafb5..147f1c95d0 100644
---- a/src/network/netdev/netdev.c
-+++ b/src/network/netdev/netdev.c
-@@ -3,7 +3,7 @@
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <unistd.h>
-=20
- #include "alloc-util.h"
-diff --git a/src/network/netdev/netdevsim.c b/src/network/netdev/netdevs=
im.c
-index 59958c3bbe..61169016b0 100644
---- a/src/network/netdev/netdevsim.c
-+++ b/src/network/netdev/netdevsim.c
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "netdevsim.h"
-=20
-diff --git a/src/network/netdev/nlmon.c b/src/network/netdev/nlmon.c
-index ff372092e6..eef66811f4 100644
---- a/src/network/netdev/nlmon.c
-+++ b/src/network/netdev/nlmon.c
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "nlmon.h"
-=20
-diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
-index af05cfda81..f659bed3a6 100644
---- a/src/network/netdev/tunnel.c
-+++ b/src/network/netdev/tunnel.c
-@@ -2,7 +2,7 @@
-=20
- #include <netinet/in.h>
- #include <linux/fou.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_tunnel.h>
- #include <linux/ip.h>
- #include <linux/ip6_tunnel.h>
-diff --git a/src/network/netdev/vcan.c b/src/network/netdev/vcan.c
-index 380547ee1e..137c1adf8a 100644
---- a/src/network/netdev/vcan.c
-+++ b/src/network/netdev/vcan.c
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "vcan.h"
-=20
-diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
-index 54d3b59734..f3f75e22b5 100644
---- a/src/network/netdev/veth.c
-+++ b/src/network/netdev/veth.c
-@@ -3,7 +3,7 @@
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
- #include <errno.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/veth.h>
- #include <netinet/in.h>
-=20
-diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
-index 60e49a5b8a..266fd58813 100644
---- a/src/network/netdev/vlan.c
-+++ b/src/network/netdev/vlan.c
-@@ -3,7 +3,7 @@
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
- #include <errno.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_vlan.h>
-=20
- #include "parse-util.h"
-diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
-index c35419f859..4d1d3ef141 100644
---- a/src/network/netdev/vrf.c
-+++ b/src/network/netdev/vrf.c
-@@ -2,8 +2,8 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
--#include <linux/if_arp.h>
- #include <netinet/in.h>
-+//#include <linux/if_arp.h>
-=20
- #include "vrf.h"
-=20
-diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
-index 2de89b8e24..ce1b8f9b69 100644
---- a/src/network/netdev/vxcan.c
-+++ b/src/network/netdev/vxcan.c
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <linux/can/vxcan.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "vxcan.h"
-=20
-diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
-index d8a066370d..8f94eeb763 100644
---- a/src/network/netdev/vxlan.c
-+++ b/src/network/netdev/vxlan.c
-@@ -3,7 +3,7 @@
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "conf-parser.h"
- #include "alloc-util.h"
-diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
-index 8d1dddf828..5182783f45 100644
---- a/src/network/netdev/wireguard.c
-+++ b/src/network/netdev/wireguard.c
-@@ -5,7 +5,7 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/ipv6_route.h>
- #include <netinet/in.h>
- #include <sys/ioctl.h>
-diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
-index 905bfc0bdf..39e34dbb3b 100644
---- a/src/network/netdev/xfrm.c
-+++ b/src/network/netdev/xfrm.c
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "missing_network.h"
- #include "xfrm.h"
-diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-d=
hcp-common.c
-index 8b64dfe8f0..caa2885728 100644
---- a/src/network/networkd-dhcp-common.c
-+++ b/src/network/networkd-dhcp-common.c
-@@ -1,7 +1,8 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-+#include <net/if.h>
-=20
- #include "bus-error.h"
- #include "bus-locator.h"
-diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network=
/networkd-dhcp-prefix-delegation.c
-index 16426de981..3d8efc05f1 100644
---- a/src/network/networkd-dhcp-prefix-delegation.c
-+++ b/src/network/networkd-dhcp-prefix-delegation.c
-@@ -1,6 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/ipv6_route.h>
-=20
- #include "dhcp6-lease-internal.h"
- #include "hashmap.h"
-@@ -21,6 +20,8 @@
- #include "strv.h"
- #include "tunnel.h"
-=20
-+#include <linux/ipv6_route.h>
-+
- bool link_dhcp_pd_is_enabled(Link *link) {
-         assert(link);
-=20
-diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-d=
hcp-server.c
-index c35102af74..3be469ae16 100644
---- a/src/network/networkd-dhcp-server.c
-+++ b/src/network/networkd-dhcp-server.c
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if.h>
-=20
- #include "sd-dhcp-server.h"
-diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index d94ac1a213..b8fe82cb6a 100644
---- a/src/network/networkd-dhcp4.c
-+++ b/src/network/networkd-dhcp4.c
-@@ -3,7 +3,7 @@
- #include <netinet/in.h>
- #include <netinet/ip.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "alloc-util.h"
- #include "device-private.h"
-diff --git a/src/network/networkd-ipv6ll.c b/src/network/networkd-ipv6ll=
.c
-index 04f51ab530..c4580754f7 100644
---- a/src/network/networkd-ipv6ll.c
-+++ b/src/network/networkd-ipv6ll.c
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "in-addr-util.h"
- #include "networkd-address.h"
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 3c042e6c18..05fe2cb900 100644
---- a/src/network/networkd-link.c
-+++ b/src/network/networkd-link.c
-@@ -4,7 +4,7 @@
- #include <net/if.h>
- #include <netinet/in.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_link.h>
- #include <linux/netdevice.h>
- #include <sys/socket.h>
-diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
-index 33e86fb04e..51292871fc 100644
---- a/src/network/networkd-ndisc.c
-+++ b/src/network/networkd-ndisc.c
-@@ -6,7 +6,7 @@
- #include <arpa/inet.h>
- #include <netinet/icmp6.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "sd-ndisc.h"
-=20
-diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setli=
nk.c
-index 8519e6e7a0..7aca2bbecc 100644
---- a/src/network/networkd-setlink.c
-+++ b/src/network/networkd-setlink.c
-@@ -2,7 +2,7 @@
-=20
- #include <netinet/in.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/if_bridge.h>
- #include <linux/ipv6.h>
-=20
-diff --git a/src/network/networkd-sysctl.c b/src/network/networkd-sysctl=
.c
-index 10a35bc44b..84c6b68ee4 100644
---- a/src/network/networkd-sysctl.c
-+++ b/src/network/networkd-sysctl.c
-@@ -2,7 +2,7 @@
-=20
- #include <netinet/in.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "sd-messages.h"
-=20
-diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
-index 978ce42341..899b5f613f 100644
---- a/src/shared/netif-util.c
-+++ b/src/shared/netif-util.c
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
-=20
- #include "arphrd-util.h"
- #include "device-util.h"
-diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_=
id.c
-index 09c04b9a7f..4686897dbf 100644
---- a/src/udev/udev-builtin-net_id.c
-+++ b/src/udev/udev-builtin-net_id.c
-@@ -19,7 +19,7 @@
- #include <stdarg.h>
- #include <unistd.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
-+//#include <linux/if_arp.h>
- #include <linux/netdevice.h>
- #include <linux/pci_regs.h>
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0017-Always-include-netine=
t-if_ether.h-first.patch b/meta/recipes-core/systemd/systemd/0017-Always-=
include-netinet-if_ether.h-first.patch
new file mode 100644
index 0000000000..1cd9622540
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0017-Always-include-netinet-if_et=
her.h-first.patch
@@ -0,0 +1,40 @@
+From 675460e529f7373d042db581da3fdc3c9c25bf63 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 15 Oct 2025 15:48:09 +0800
+Subject: [PATCH 17/17] Always include netinet/if_ether.h first
+
+When compiling systemd with musl, we get many ethhdr redinition
+errors. This is because netinet/if_ether.h in musl does not check
+__UAPI_DEF_ETHHDR and expects programs to include it before other
+kernel headers.
+See https://www.openwall.com/lists/musl/2025/10/14/2
+
+To avoid this redefinition error, and to avoid resolving conflicts
+every time we upgrade systemd, use '-include netinet/if_ether.h' to
+make sure this file header is included first.
+
+The major consideration behind such method is maintenance.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 0df7ecbe67..842f058f04 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2006,7 +2006,7 @@ config_h =3D configure_file(
+         output : 'config.h',
+         configuration : conf)
+=20
+-userspace_c_args +=3D ['-include', 'config.h']
++userspace_c_args +=3D ['-include', 'config.h', '-include', 'netinet/if_=
ether.h']
+=20
+ jinja2_cmdline =3D [meson_render_jinja2, config_h]
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerr=
or-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd=
/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
deleted file mode 100644
index a92b8cc80f..0000000000
--- a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 349f9a0f9ecfc6575a3d9eeaffe89536e6a43914 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Nov 2022 13:31:34 -0800
-Subject: [PATCH 18/26] test-bus-error: strerror() is assumed to be GNU
- specific version mark it so
-
-Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libsystemd/sd-bus/test-bus-error.c | 2 ++
- src/test/test-errno-util.c             | 3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/libsystemd/sd-bus/test-bus-error.c b/src/libsystemd/sd-=
bus/test-bus-error.c
-index 91045c06c2..a06b9bac0c 100644
---- a/src/libsystemd/sd-bus/test-bus-error.c
-+++ b/src/libsystemd/sd-bus/test-bus-error.c
-@@ -99,7 +99,9 @@ TEST(error) {
-         assert_se(!sd_bus_error_is_set(&error));
-         assert_se(sd_bus_error_set_errno(&error, EBUSY) =3D=3D -EBUSY);
-         assert_se(streq(error.name, "System.Error.EBUSY"));
-+#ifdef __GLIBC__
-         assert_se(streq(error.message, STRERROR(EBUSY)));
-+#endif
-         assert_se(sd_bus_error_has_name(&error, "System.Error.EBUSY"));
-         assert_se(sd_bus_error_get_errno(&error) =3D=3D EBUSY);
-         assert_se(sd_bus_error_is_set(&error));
-diff --git a/src/test/test-errno-util.c b/src/test/test-errno-util.c
-index ab463bd1b3..e2ebcaaf33 100644
---- a/src/test/test-errno-util.c
-+++ b/src/test/test-errno-util.c
-@@ -4,7 +4,7 @@
- #include "stdio-util.h"
- #include "string-util.h"
- #include "tests.h"
--
-+#ifdef __GLIBC__
- TEST(strerror_not_threadsafe) {
-         /* Just check that strerror really is not thread-safe. */
-         log_info("strerror(%d) =E2=86=92 %s", 200, strerror(200));
-@@ -46,6 +46,7 @@ TEST(STRERROR_OR_ELSE) {
-         log_info("STRERROR_OR_ELSE(EPERM, \"EOF\") =E2=86=92 %s", STRER=
ROR_OR_EOF(EPERM));
-         log_info("STRERROR_OR_ELSE(-EPERM, \"EOF\") =E2=86=92 %s", STRE=
RROR_OR_EOF(-EPERM));
- }
-+#endif /* __GLIBC__ */
-=20
- TEST(PROTECT_ERRNO) {
-         errno =3D 12;
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_=
trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0020-=
sd-event-Make-malloc_trim-conditional-on-glibc.patch
deleted file mode 100644
index 16df44cd86..0000000000
--- a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 66de8a53849f76f5596327c38ae5f002b9f534cd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Aug 2023 12:06:27 -0700
-Subject: [PATCH 20/26] sd-event: Make malloc_trim() conditional on glibc
-
-musl does not have this API
-
-Upstream-Status: Inappropriate [musl-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libsystemd/sd-event/sd-event.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-even=
t/sd-event.c
-index 7aea7d2581..d3f4001f53 100644
---- a/src/libsystemd/sd-event/sd-event.c
-+++ b/src/libsystemd/sd-event/sd-event.c
-@@ -1881,7 +1881,7 @@ _public_ int sd_event_add_exit(
- }
-=20
- _public_ int sd_event_trim_memory(void) {
--        int r;
-+        int r =3D 0;
-=20
-         /* A default implementation of a memory pressure callback. Simp=
ly releases our own allocation caches
-          * and glibc's. This is automatically used when people call sd_=
event_add_memory_pressure() with a
-@@ -1895,7 +1895,9 @@ _public_ int sd_event_trim_memory(void) {
-=20
-         usec_t before_timestamp =3D now(CLOCK_MONOTONIC);
-         hashmap_trim_pools();
-+#ifdef __GLIBC__
-         r =3D malloc_trim(0);
-+#endif
-         usec_t after_timestamp =3D now(CLOCK_MONOTONIC);
-=20
-         if (r > 0)
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-mal=
loc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0021-shared-Do=
-not-use-malloc_info-on-musl.patch
deleted file mode 100644
index 7ab56ef8fb..0000000000
--- a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_inf=
o-on-musl.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 93d13363c605fb2de484f38f3726f8fbad1c3540 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Aug 2023 12:20:40 -0700
-Subject: [PATCH 21/26] shared: Do not use malloc_info on musl
-
-Upstream-Status: Inappropriate [musl-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/shared/bus-util.c      | 5 +++--
- src/shared/common-signal.c | 4 ++--
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index ff80e580fc..a628a29d0c 100644
---- a/src/shared/bus-util.c
-+++ b/src/shared/bus-util.c
-@@ -787,15 +787,16 @@ static int method_dump_memory_state_by_fd(sd_bus_m=
essage *message, void *userdat
-         _cleanup_close_ int fd =3D -EBADF;
-         size_t dump_size;
-         FILE *f;
--        int r;
-+        int r =3D 0;
-=20
-         assert(message);
-=20
-         f =3D memstream_init(&m);
-         if (!f)
-                 return -ENOMEM;
--
-+#ifdef __GLIBC__
-         r =3D RET_NERRNO(malloc_info(/* options=3D */ 0, f));
-+#endif
-         if (r < 0)
-                 return r;
-=20
-diff --git a/src/shared/common-signal.c b/src/shared/common-signal.c
-index 8e70e365dd..9e782caec9 100644
---- a/src/shared/common-signal.c
-+++ b/src/shared/common-signal.c
-@@ -65,12 +65,12 @@ int sigrtmin18_handler(sd_event_source *s, const str=
uct signalfd_siginfo *si, vo
-                         log_oom();
-                         break;
-                 }
--
-+#ifdef __GLIBC__
-                 if (malloc_info(0, f) < 0) {
-                         log_error_errno(errno, "Failed to invoke malloc=
_info(): %m");
-                         break;
-                 }
--
-+#endif
-                 (void) memstream_dump(LOG_INFO, &m);
-                 break;
-         }
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX=
-declaration.patch b/meta/recipes-core/systemd/systemd/0022-avoid-missing=
-LOCK_EX-declaration.patch
deleted file mode 100644
index d06967f8d5..0000000000
--- a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declar=
ation.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 5b8df64993b68a5a4af0f214d8cae77f4e716593 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 2 Jan 2024 11:03:27 +0800
-Subject: [PATCH 22/26] avoid missing LOCK_EX declaration
-
-This only happens on MUSL. Include sys/file.h to avoid compilation
-error about missing LOCK_EX declaration.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/fd-util.h    | 1 +
- src/core/exec-invoke.c | 1 +
- src/shared/dev-setup.h | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
-index 93b254c680..5f0b1a816d 100644
---- a/src/basic/fd-util.h
-+++ b/src/basic/fd-util.h
-@@ -6,6 +6,7 @@
- #include <stdbool.h>
- #include <stdio.h>
- #include <sys/socket.h>
-+#include <sys/file.h>
-=20
- #include "macro.h"
- #include "missing_fcntl.h"
-diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
-index 9d636f5529..6be43caa57 100644
---- a/src/core/exec-invoke.c
-+++ b/src/core/exec-invoke.c
-@@ -5,6 +5,7 @@
- #include <sys/ioctl.h>
- #include <sys/mount.h>
- #include <sys/prctl.h>
-+#include <sys/file.h>
-=20
- #if HAVE_PAM
- #include <security/pam_appl.h>
-diff --git a/src/shared/dev-setup.h b/src/shared/dev-setup.h
-index 92ba6cf764..ba01a0ae55 100644
---- a/src/shared/dev-setup.h
-+++ b/src/shared/dev-setup.h
-@@ -2,6 +2,7 @@
- #pragma once
-=20
- #include <sys/types.h>
-+#include <sys/file.h>
-=20
- int dev_setup(const char *prefix, uid_t uid, gid_t gid);
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0023-include-signal.h-to-a=
void-the-undeclared-error.patch b/meta/recipes-core/systemd/systemd/0023-=
include-signal.h-to-avoid-the-undeclared-error.patch
deleted file mode 100644
index c8bcd9e355..0000000000
--- a/meta/recipes-core/systemd/systemd/0023-include-signal.h-to-avoid-th=
e-undeclared-error.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e39afec7e5a2f3a9de7202affab4d0340ba879d7 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 2 Jul 2024 22:18:47 -0700
-Subject: [PATCH 23/26] include signal.h to avoid the 'undeclared' error
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/pidref.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/pidref.h b/src/basic/pidref.h
-index 42ddf4e50b..b9cf53680f 100644
---- a/src/basic/pidref.h
-+++ b/src/basic/pidref.h
-@@ -3,6 +3,7 @@
-=20
- typedef struct PidRef PidRef;
-=20
-+#include <signal.h>
- #include "macro.h"
- #include "process-util.h"
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0024-undef-stdin-for-refer=
ences-using-stdin-as-a-struct-m.patch b/meta/recipes-core/systemd/systemd=
/0024-undef-stdin-for-references-using-stdin-as-a-struct-m.patch
deleted file mode 100644
index 9532e6b9af..0000000000
--- a/meta/recipes-core/systemd/systemd/0024-undef-stdin-for-references-u=
sing-stdin-as-a-struct-m.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 5a4334fde21b896cd75b2d1a56e06a4f365e9c4d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 2 Jul 2024 22:44:31 -0700
-Subject: [PATCH 24/26] undef stdin for references using stdin as a struc=
t
- member
-
-In musl stdio.h, we have:
-include/stdio.h:#define stdin  (stdin)
-
-This causes error when a struct member is also named stdin. undef it.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/shared/edit-util.c         | 2 ++
- src/systemctl/systemctl-edit.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c
-index e37609c2e1..1b212ae7b4 100644
---- a/src/shared/edit-util.c
-+++ b/src/shared/edit-util.c
-@@ -3,6 +3,8 @@
- #include <errno.h>
- #include <stdio.h>
-=20
-+#undef stdin
-+
- #include "alloc-util.h"
- #include "copy.h"
- #include "edit-util.h"
-diff --git a/src/systemctl/systemctl-edit.c b/src/systemctl/systemctl-ed=
it.c
-index c42a31153d..7695ceeead 100644
---- a/src/systemctl/systemctl-edit.c
-+++ b/src/systemctl/systemctl-edit.c
-@@ -13,6 +13,8 @@
- #include "systemctl.h"
- #include "terminal-util.h"
-=20
-+#undef stdin
-+
- int verb_cat(int argc, char *argv[], void *userdata) {
-         _cleanup_hashmap_free_ Hashmap *cached_id_map =3D NULL, *cached=
_name_map =3D NULL;
-         _cleanup_(lookup_paths_done) LookupPaths lp =3D {};
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0025-adjust-header-inclusi=
on-order-to-avoid-redeclaration.patch b/meta/recipes-core/systemd/systemd=
/0025-adjust-header-inclusion-order-to-avoid-redeclaration.patch
deleted file mode 100644
index d791ad2da1..0000000000
--- a/meta/recipes-core/systemd/systemd/0025-adjust-header-inclusion-orde=
r-to-avoid-redeclaration.patch
+++ /dev/null
@@ -1,288 +0,0 @@
-From a90044320eecda424ed678d283ef60806c70fcda Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 2 Jul 2024 23:23:57 -0700
-Subject: [PATCH 25/26] adjust header inclusion order to avoid redeclarat=
ion
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/parse-util.c                | 3 ++-
- src/libsystemd-network/ndisc-option.c | 6 +++---
- src/libsystemd-network/sd-radv.c      | 5 +++--
- src/network/netdev/l2tp-tunnel.c      | 9 ++++-----
- src/network/netdev/l2tp-tunnel.h      | 6 +++---
- src/network/netdev/wireguard.c        | 2 +-
- src/network/networkctl-link-info.c    | 4 ++--
- src/network/networkd-bridge-mdb.c     | 3 ++-
- src/network/networkd-route.c          | 8 ++++----
- src/resolve/resolved-dns-stream.c     | 5 +++--
- src/resolve/resolved-manager.c        | 5 +++--
- src/shared/conf-parser.c              | 3 ++-
- 12 files changed, 32 insertions(+), 27 deletions(-)
-
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index faa5344921..0fc9d12c89 100644
---- a/src/basic/parse-util.c
-+++ b/src/basic/parse-util.c
-@@ -2,7 +2,6 @@
-=20
- #include <errno.h>
- #include <inttypes.h>
--#include <linux/ipv6.h>
- #include <net/if.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -20,6 +19,8 @@
- #include "string-util.h"
- #include "strv.h"
-=20
-+#include <linux/ipv6.h>
-+
- int parse_boolean(const char *v) {
-         if (!v)
-                 return -EINVAL;
-diff --git a/src/libsystemd-network/ndisc-option.c b/src/libsystemd-netw=
ork/ndisc-option.c
-index 3aab51f51b..feeb4c78e5 100644
---- a/src/libsystemd-network/ndisc-option.c
-+++ b/src/libsystemd-network/ndisc-option.c
-@@ -1,8 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/ipv6.h>
--#include <netinet/icmp6.h>
--
- #include "dns-resolver-internal.h"
- #include "dns-domain.h"
- #include "ether-addr-util.h"
-@@ -16,6 +13,9 @@
- #include "strv.h"
- #include "unaligned.h"
-=20
-+#include <linux/ipv6.h>
-+#include <netinet/icmp6.h>
-+
- /* RFC does not say anything about the maximum number of options, but l=
et's limit the number of options for
-  * safety. Typically, the number of options in an ICMPv6 message should=
 be only a few. */
- #define MAX_OPTIONS 128
-diff --git a/src/libsystemd-network/sd-radv.c b/src/libsystemd-network/s=
d-radv.c
-index f241929ad5..7cef3c3f71 100644
---- a/src/libsystemd-network/sd-radv.c
-+++ b/src/libsystemd-network/sd-radv.c
-@@ -3,8 +3,6 @@
-   Copyright =C2=A9 2017 Intel Corporation. All rights reserved.
- ***/
-=20
--#include <linux/ipv6.h>
--#include <netinet/icmp6.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
-=20
-@@ -29,6 +27,9 @@
- #include "strv.h"
- #include "unaligned.h"
-=20
-+#include <linux/ipv6.h>
-+#include <netinet/icmp6.h>
-+
- int sd_radv_new(sd_radv **ret) {
-         _cleanup_(sd_radv_unrefp) sd_radv *ra =3D NULL;
-=20
-diff --git a/src/network/netdev/l2tp-tunnel.c b/src/network/netdev/l2tp-=
tunnel.c
-index c87e44797b..437b40c114 100644
---- a/src/network/netdev/l2tp-tunnel.c
-+++ b/src/network/netdev/l2tp-tunnel.c
-@@ -1,10 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <netinet/in.h>
--#include <linux/if_arp.h>
--#include <linux/l2tp.h>
--#include <linux/genetlink.h>
--
- #include "conf-parser.h"
- #include "hashmap.h"
- #include "l2tp-tunnel.h"
-@@ -17,6 +12,10 @@
- #include "string-table.h"
- #include "string-util.h"
-=20
-+#include <netinet/in.h>
-+#include <linux/l2tp.h>
-+#include <linux/genetlink.h>
-+
- static const char* const l2tp_l2spec_type_table[_NETDEV_L2TP_L2SPECTYPE=
_MAX] =3D {
-         [NETDEV_L2TP_L2SPECTYPE_NONE]    =3D "none",
-         [NETDEV_L2TP_L2SPECTYPE_DEFAULT] =3D "default",
-diff --git a/src/network/netdev/l2tp-tunnel.h b/src/network/netdev/l2tp-=
tunnel.h
-index c558ed49de..8419ef34c5 100644
---- a/src/network/netdev/l2tp-tunnel.h
-+++ b/src/network/netdev/l2tp-tunnel.h
-@@ -1,13 +1,13 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
-=20
--#include <netinet/in.h>
--#include <linux/l2tp.h>
--
- #include "in-addr-util.h"
- #include "netdev.h"
- #include "networkd-util.h"
-=20
-+#include <netinet/in.h>
-+#include <linux/l2tp.h>
-+
- typedef enum L2tpL2specType {
-         NETDEV_L2TP_L2SPECTYPE_NONE =3D L2TP_L2SPECTYPE_NONE,
-         NETDEV_L2TP_L2SPECTYPE_DEFAULT =3D L2TP_L2SPECTYPE_DEFAULT,
-diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
-index 5182783f45..79b21cb4ba 100644
---- a/src/network/netdev/wireguard.c
-+++ b/src/network/netdev/wireguard.c
-@@ -5,9 +5,9 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
-+#include <netinet/in.h>
- //#include <linux/if_arp.h>
- #include <linux/ipv6_route.h>
--#include <netinet/in.h>
- #include <sys/ioctl.h>
-=20
- #include "sd-resolve.h"
-diff --git a/src/network/networkctl-link-info.c b/src/network/networkctl=
-link-info.c
-index f356d3c231..216c442de1 100644
---- a/src/network/networkctl-link-info.c
-+++ b/src/network/networkctl-link-info.c
-@@ -1,7 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_tunnel.h>
--
- #include "bus-common-errors.h"
- #include "bus-error.h"
- #include "bus-util.h"
-@@ -16,6 +14,8 @@
- #include "strxcpyx.h"
- #include "wifi-util.h"
-=20
-+#include <linux/if_tunnel.h>
-+
- /* use 128 kB for receive socket kernel queue, we shouldn't need more h=
ere */
- #define RCVBUF_SIZE    (128*1024)
-=20
-diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-br=
idge-mdb.c
-index 358ca4d294..fe87f7c093 100644
---- a/src/network/networkd-bridge-mdb.c
-+++ b/src/network/networkd-bridge-mdb.c
-@@ -2,7 +2,6 @@
-=20
- /* Make sure the net/if.h header is included before any linux/ one */
- #include <net/if.h>
--#include <linux/if_bridge.h>
-=20
- #include "netlink-util.h"
- #include "networkd-bridge-mdb.h"
-@@ -13,6 +12,8 @@
- #include "string-util.h"
- #include "vlan-util.h"
-=20
-+#include <linux/if_bridge.h>
-+
- #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
-=20
- /* remove MDB entry. */
-diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 0f3f79ec4f..325743bebf 100644
---- a/src/network/networkd-route.c
-+++ b/src/network/networkd-route.c
-@@ -1,9 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if.h>
--#include <linux/ipv6_route.h>
--#include <linux/nexthop.h>
--
- #include "alloc-util.h"
- #include "event-util.h"
- #include "netlink-util.h"
-@@ -21,6 +17,10 @@
- #include "vrf.h"
- #include "wireguard.h"
-=20
-+#include <linux/if.h>
-+#include <linux/ipv6_route.h>
-+#include <linux/nexthop.h>
-+
- static Route* route_detach_impl(Route *route) {
-         assert(route);
-         assert(!!route->network + !!route->manager + !!route->wireguard=
 <=3D 1);
-diff --git a/src/resolve/resolved-dns-stream.c b/src/resolve/resolved-dn=
s-stream.c
-index e57af66221..f66d8f0606 100644
---- a/src/resolve/resolved-dns-stream.c
-+++ b/src/resolve/resolved-dns-stream.c
-@@ -1,7 +1,5 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
--#include <linux/if_arp.h>
--#include <netinet/tcp.h>
- #include <unistd.h>
-=20
- #include "alloc-util.h"
-@@ -12,6 +10,9 @@
- #include "resolved-dns-stream.h"
- #include "resolved-manager.h"
-=20
-+//#include <linux/if_arp.h>
-+#include <netinet/tcp.h>
-+
- #define DNS_STREAMS_MAX 128
-=20
- #define DNS_QUERIES_PER_STREAM 32
-diff --git a/src/resolve/resolved-manager.c b/src/resolve/resolved-manag=
er.c
-index dbaad81734..b988e75851 100644
---- a/src/resolve/resolved-manager.c
-+++ b/src/resolve/resolved-manager.c
-@@ -1,8 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
-=20
- #include <fcntl.h>
--#include <linux/ipv6.h>
--#include <netinet/in.h>
- #include <poll.h>
- #include <sys/ioctl.h>
- #include <sys/stat.h>
-@@ -46,6 +44,9 @@
- #include "utf8.h"
- #include "varlink-util.h"
-=20
-+#include <linux/ipv6.h>
-+#include <netinet/in.h>
-+
- #define SEND_TIMEOUT_USEC (200 * USEC_PER_MSEC)
-=20
- static int manager_process_link(sd_netlink *rtnl, sd_netlink_message *m=
m, void *userdata) {
-diff --git a/src/shared/conf-parser.c b/src/shared/conf-parser.c
-index eaa8a5f11c..03379e7474 100644
---- a/src/shared/conf-parser.c
-+++ b/src/shared/conf-parser.c
-@@ -2,7 +2,6 @@
-=20
- #include <errno.h>
- #include <limits.h>
--#include <linux/ipv6.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -47,6 +46,8 @@
- #include "time-util.h"
- #include "utf8.h"
-=20
-+#include <linux/ipv6.h>
-+
- DEFINE_PRIVATE_HASH_OPS_WITH_VALUE_DESTRUCTOR(config_file_hash_ops_fclo=
se,
-                                               char, path_hash_func, pat=
h_compare,
-                                               FILE, safe_fclose);
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-co=
re/systemd/systemd_258.1.bb
similarity index 92%
rename from meta/recipes-core/systemd/systemd_257.8.bb
rename to meta/recipes-core/systemd/systemd_258.1.bb
index 549eb7fb29..5035b7c6da 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -28,36 +28,26 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
-           file://0001-Do-not-create-var-log-README.patch \
+           file://0003-Do-not-create-var-log-README.patch \
            "
=20
 # patches needed by musl
 SRC_URI:append:libc-musl =3D " ${SRC_URI_MUSL}"
 SRC_URI_MUSL =3D "\
-               file://0003-missing_type.h-add-comparison_fn_t.patch \
-               file://0004-add-fallback-parse_printf_format-implementati=
on.patch \
-               file://0005-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
-               file://0006-add-missing-FTW_-macros-for-musl.patch \
-               file://0007-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0008-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
-               file://0009-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
-               file://0010-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
-               file://0011-avoid-redefinition-of-prctl_mm_map-structure.=
patch \
-               file://0012-do-not-disable-buffer-in-writing-files.patch =
\
-               file://0013-Handle-__cpu_mask-usage.patch \
-               file://0014-Handle-missing-gshadow.patch \
-               file://0015-missing_syscall.h-Define-MIPS-ABI-defines-for=
-musl.patch \
-               file://0016-pass-correct-parameters-to-getdents64.patch \
-               file://0017-Adjust-for-musl-headers.patch \
-               file://0018-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
-               file://0019-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
-               file://0020-sd-event-Make-malloc_trim-conditional-on-glib=
c.patch \
-               file://0021-shared-Do-not-use-malloc_info-on-musl.patch \
-               file://0022-avoid-missing-LOCK_EX-declaration.patch \
-               file://0023-include-signal.h-to-avoid-the-undeclared-erro=
r.patch \
-               file://0024-undef-stdin-for-references-using-stdin-as-a-s=
truct-m.patch \
-               file://0025-adjust-header-inclusion-order-to-avoid-redecl=
aration.patch \
-               file://0026-build-path.c-avoid-boot-time-segfault-for-mus=
l.patch \
+               file://0004-musl.h-introduce-header-file-and-add-__THROW.=
patch \
+               file://0005-add-fallback-parse_printf_format-implementati=
on.patch \
+               file://0006-Make-mallinfo-related-contents-glibc-specific=
.patch \
+               file://0007-add-src-include-override-sys-prctl.h-to-avoid=
-redefi.patch \
+               file://0008-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
+               file://0009-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
+               file://0010-src-basic-format-util.h-define-RLIM_FMT-to-fi=
t-musl-.patch \
+               file://0011-src-include-override-malloc.h-define-dummy-ma=
lloc_tr.patch \
+               file://0012-src-shared-condition.c-avoid-using-glibc-Cond=
itionVe.patch \
+               file://0013-build-path.c-avoid-boot-time-segfault-for-mus=
l.patch \
+               file://0014-Handle-missing-gshadow-for-musl.patch \
+               file://0015-Avoid-sequence-point-error.patch \
+               file://0016-Fix-the-segfault-for-glob-related-codes-and-d=
efine-d.patch \
+               file://0017-Always-include-netinet-if_ether.h-first.patch=
 \
                "
=20
 PAM_PLUGINS =3D " \
@@ -154,8 +144,6 @@ PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfi=
rstboot=3Dfalse"
 PACKAGECONFIG[repart] =3D "-Drepart=3Denabled,-Drepart=3Ddisabled"
 PACKAGECONFIG[homed] =3D "-Dhomed=3Denabled,-Dhomed=3Ddisabled"
 # Sign the journal for anti-tampering
-PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Denabled,-Dgcrypt=3Ddisabled,libgcr=
ypt"
-PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Denabled,-Dgnutls=3Ddisabled,gnutls=
"
 PACKAGECONFIG[gshadow] =3D "-Dgshadow=3Dtrue,-Dgshadow=3Dfalse"
 PACKAGECONFIG[hibernate] =3D "-Dhibernate=3Dtrue,-Dhibernate=3Dfalse"
 PACKAGECONFIG[hostnamed] =3D "-Dhostnamed=3Dtrue,-Dhostnamed=3Dfalse"
@@ -252,6 +240,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dtranslations=3D${@'false' if d.getVar('USE_NLS') =3D=
=3D 'no' else 'true'} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-=
Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
                   -Ddbus=3Ddisabled \
+                  -Dtests=3Dfalse \
                   "
=20
 # Hardcode target binary paths to avoid using paths from sysroot or wors=
e
@@ -341,15 +330,6 @@ do_install() {
 	install -d ${D}${systemd_system_unitdir}/reboot.target.wants
 	install -d ${D}${systemd_system_unitdir}/rescue.target.wants
=20
-	# Create symlinks for systemd-update-utmp-runlevel.service
-	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)} &=
& ${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', 'true', 'false', d)};=
 then
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_un=
itdir}/graphical.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_un=
itdir}/multi-user.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_un=
itdir}/poweroff.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_un=
itdir}/reboot.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_un=
itdir}/rescue.target.wants/systemd-update-utmp-runlevel.service
-	fi
-
 	# this file is needed to exist if networkd is disabled but timesyncd is=
 still in use since timesyncd checks it
 	# for existence else it fails
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ] &&
@@ -552,6 +532,7 @@ FILES:${PN}-container =3D "${sysconfdir}/dbus-1/syste=
m.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/org.freedesktop.machi=
ne1.busname \
                          ${systemd_system_unitdir}/systemd-importd.servi=
ce \
                          ${systemd_system_unitdir}/systemd-machined.serv=
ice \
+                         ${systemd_system_unitdir}/systemd-machined.sock=
et \
                          ${systemd_system_unitdir}/dbus-org.freedesktop.=
machine1.service \
                          ${systemd_system_unitdir}/var-lib-machines.moun=
t \
                          ${nonarch_libdir}/systemd/systemd-import \
@@ -614,10 +595,6 @@ FILES:${PN}-extra-utils =3D "\
                         ${systemd_system_unitdir}/systemd-pcrphase-sysin=
it.service \
                         ${systemd_system_unitdir}/systemd-suspend.servic=
e \
                         ${systemd_system_unitdir}/sleep.target \
-                        ${nonarch_libdir}/systemd/systemd-initctl \
-                        ${systemd_system_unitdir}/systemd-initctl.servic=
e \
-                        ${systemd_system_unitdir}/systemd-initctl.socket=
 \
-                        ${systemd_system_unitdir}/sockets.target.wants/s=
ystemd-initctl.socket \
                         ${nonarch_libdir}/systemd/system-generators/syst=
emd-gpt-auto-generator \
                         ${nonarch_libdir}/systemd/systemd-cgroups-agent =
\
 "
@@ -668,8 +645,6 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${base_sbindir}/shutdown \
                 ${base_sbindir}/halt \
                 ${base_sbindir}/poweroff \
-                ${base_sbindir}/runlevel \
-                ${base_sbindir}/telinit \
                 ${base_sbindir}/resolvconf \
                 ${base_sbindir}/reboot \
                 ${base_sbindir}/init \
@@ -790,6 +765,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/60-infiniband.rules \
                ${nonarch_libdir}/udev/rules.d/60-input-id.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-alsa.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-hidraw.rules=
 \
                ${nonarch_libdir}/udev/rules.d/60-persistent-input.rules =
\
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rule=
s \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.=
rules \
@@ -810,7 +786,9 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/78-sound-card.rules \
                ${nonarch_libdir}/udev/rules.d/80-drivers.rules \
                ${nonarch_libdir}/udev/rules.d/80-net-setup-link.rules \
+               ${nonarch_libdir}/udev/rules.d/81-net-bridge.rules \
                ${nonarch_libdir}/udev/rules.d/81-net-dhcp.rules \
+               ${nonarch_libdir}/udev/rules.d/90-image-dissect.rules \
                ${nonarch_libdir}/udev/rules.d/90-vconsole.rules \
                ${nonarch_libdir}/udev/rules.d/90-iocost.rules \
                ${nonarch_libdir}/udev/rules.d/README \
@@ -855,7 +833,6 @@ python do_warn_musl() {
 addtask warn_musl before do_configure
=20
 ALTERNATIVE:${PN} =3D "halt reboot shutdown poweroff \
-                     ${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', '=
runlevel', '', d)} \
                      ${@bb.utils.contains('PACKAGECONFIG', 'resolved', '=
resolv-conf', '', d)}"
=20
 ALTERNATIVE_TARGET[resolv-conf] =3D "${sysconfdir}/resolv-conf.systemd"
@@ -878,10 +855,6 @@ ALTERNATIVE_TARGET[poweroff] =3D "${base_bindir}/sys=
temctl"
 ALTERNATIVE_LINK_NAME[poweroff] =3D "${base_sbindir}/poweroff"
 ALTERNATIVE_PRIORITY[poweroff] ?=3D "300"
=20
-ALTERNATIVE_TARGET[runlevel] =3D "${base_bindir}/systemctl"
-ALTERNATIVE_LINK_NAME[runlevel] =3D "${base_sbindir}/runlevel"
-ALTERNATIVE_PRIORITY[runlevel] ?=3D "300"
-
 pkg_postinst:${PN}:append () {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'set-time-epoch', 'true', 'fal=
se', d)}; then
 		touch $D${nonarch_libdir}/clock-epoch
--=20
2.34.1


