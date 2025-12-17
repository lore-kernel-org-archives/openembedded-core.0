Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6890FD65C58
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 14:38:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16175.1765981664004973855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 06:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bVmHjba4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444635b17a=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH2snOe868324
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 06:27:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=xr0VADdh5Vo4HUvoT1XH
	+v7sfxaK0Ujb7w8eivRgSgs=; b=bVmHjba4iOIYXO4k2NlIgW+ZPf+ZoLNC/YEg
	eUOrpfShV4Tu50Yw8G48LYRZIDxXp+89qprvKPeDtXUT9Lh3RqKsCXWrKpPXB0Ex
	D1L2BKwjLRB+ImXQjI6KJ0DTXQdmbAHmW8p26/3JQHM3K/KBbeATTYYRYncWQqs4
	XUFU27NGfhahgMG2MacwMz292YDW+UWukDF+XN0JrObpp7E+WourgyYmqYQx4MyZ
	ElSSx23e0BH1E2tp7SydPwfuy/puRzSMCQN9VvzOUXt9Vu0wO/F2KzulLqgrPctw
	quM9+/qaUNgDt1nfZ+EX+D90ObRvJiPiBqz5zrwIUOeOtYqDOw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j0nhp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 06:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKxlxtvpucgmV3NiLvGk+eNWLY/fSnbRf42hlWdEgDUYVX8K5OLyy+/8d8yEtrszTsjCdTFvZud/c7reHMpC+O2p/8JR/2I1DTTNg/uNAQGSRdq/h6gtU7bIpldbHTOc5CYSqY+D1LSxxG3GO3vUgz8siLkLysY7as/yy2rBjg/PWkjBpXFoRiY14PhWW6OCpf7HhKlpk+EE81SE9fXreiDla7VOIosEW9/HpF7c78EsYMB73ASN63AeONcpirbQdTr5aKfP5QxOTNbKlnxs0f6kAl1WoT9Qg1lBZJmZ2n/CneQ4QjoUcoeCHetpybuLS8vPxhR4TmRxiYRQaSqSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr0VADdh5Vo4HUvoT1XH+v7sfxaK0Ujb7w8eivRgSgs=;
 b=TZJguDgcvNU+6Njdv6npSa305g1apRT0lleCFRF8liVc0CIs4IfIyVxe5eLH/W78wc8tqc9Tw0eWlqXNXOKlCp+XYxP4diWpFI1t7KkDmooFNcwJNrggy8jB5xujqQzzpBIZ70swDvpBhjKxXt+J2tUThey0YrnBmYp7FyLFu5IRMdOXBBSKUOiDGRPDxgiU6iIXM74t6dadftH3Djvlfae1hf1lb8sT8nTFn1/ObshRerzkra+iZy5/pAJIxcdwbLJ03dFcoJccM5GTepzo3jHmcPu/3afriTtqOZxboTow4TmH9ODXZBtKNQVK7zwr7V5IDkY0I7CE4BbwzanOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 14:27:40 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%2]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 14:27:40 +0000
From: "Dragomir, Daniel" <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oeqa/selftest/wic: test recursive dir copy on ext partitions
Date: Wed, 17 Dec 2025 16:27:26 +0200
Message-Id: <20251217142726.3787722-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: VI1PR09CA0129.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::13) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 96586a33-bfe3-449a-f61f-08de3d786f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjA0WXpnMmdaWmdUSHY5TVgzcWJIYUxwQmFLdHVLL004c0pjREdNbXU3alBH?=
 =?utf-8?B?ZXdZSUJ0OExaNU1ENkZ3MnFSc05CSzAxT2hLaU1ZTk5uK0lpUkh4VXNLbSt5?=
 =?utf-8?B?dEg3UkRsRGtrbUtDdlRtYk55L2s3dTFPR05ob2U1WkhhR1R3RjgxQ2g4YllV?=
 =?utf-8?B?dXVzeW01VlFkS28xZjFPZGNmNGQ4aWNPa2ljaFA4RmhRbnd4Q2pyTXdpcmlV?=
 =?utf-8?B?eHVDS2J1dUd5eVMwaXFXMUJveml6WnVNNmpJYkRNSXJCNThuTEFTSkhpR0dM?=
 =?utf-8?B?RFd5N1R2Z2M5b0U1MjZEMGN3cU5GTG9JcWo3RTdtK3dyN0V1aTdUbWRjeUdO?=
 =?utf-8?B?eTIrMmk2U2tzZFA4WGJVaFNJWlFNUFBQVndwejZRNi95bTJ0VFp4MnNSOE9U?=
 =?utf-8?B?UmdCZXdmVGFlRXBKUzFWWTV2UVg0bWlTZ0NWNjZZTUlnYlBpZGFTbmJueFJo?=
 =?utf-8?B?OEhvb1JxcEl3WkpkdFVCZGh6Q08rS0toSnJ5RG5PaERYTnVLRGdJZ2g1RGJ1?=
 =?utf-8?B?RE1kczZCYmhHTEJ4SW9uN0dpOVpCOHhRMU5LVGRFNEJrcno2MHk5RFl2emYz?=
 =?utf-8?B?VGE2ZlBuN1hRU2loU2xMNFh1cld2dXN1QVpMdFAxRVgvSXFuTFJESG5WeG91?=
 =?utf-8?B?N0VQbXZicFNObEkyUjFZRTBzY0txUnBiN3JCUWp5WWlIcHFPNU5xekUrWS9S?=
 =?utf-8?B?dklmOTFIVkFMUDBRQzhTK2ZhWEttUm5iamNMZko4MXZoUml2ZFNlL1BTOFpi?=
 =?utf-8?B?U2tMT3I1MlVXU2lsRGNYcmlNYWZpZWVKRWhMN0RPVDA2L1VNaEs2T3o0dU1F?=
 =?utf-8?B?UEp4clorR3NVNWJnQk9LSFVXTUVMVGJubUZGQkVSL1ZzbWFicXJEY0VVUkdD?=
 =?utf-8?B?Um9XemNkdUdTbUVCb2xmNE14UHdTcmcydFVoekxQUVprRW01bW5NcHVEVHU0?=
 =?utf-8?B?eEpQVHkvWjhBS1VjNlR1WnlQWUhPNE9SaThFOS9HcDBsak82YW9IbmdOZlpy?=
 =?utf-8?B?QWZ0S1lBeXNQcTBGUnJRYVNhVmtXZDhjL0ljdjQ5ZThOKzQza3E4WXMzaGNp?=
 =?utf-8?B?VitGekFwbERuWXpMcjhablVmK01Pam1ESENsSXZ0cmhRVGFScjZiOGgvdHFu?=
 =?utf-8?B?ajZmQndISVhYZ2VUY1daVVNmd3pRSXFRS09vL0l4ZHNsZHhqWVgySWdwY0RS?=
 =?utf-8?B?d0VqVVJrZ3N4Rk9Ba3o4eStwZkhmRVl3MUpqM3h5Q2ZXbjkwSVFpaE8yZWhn?=
 =?utf-8?B?VGJBelEyOHd1eFdEQk1yT21oZzB2MUNMN0ZjTEFyWjdodjZxdkx5ZUZ4L1Zo?=
 =?utf-8?B?K2UvVFhrelcvVDFyMU5VRUo1LzEzSmhZU0RUaUt0TXVrWkxBMkJma2ZiSUgv?=
 =?utf-8?B?VXcvZVhSaUFlNWpLc3puQnBUMWNkSCtqY25VUTV6dkRaRHlpOWo4V1ZMWkFW?=
 =?utf-8?B?eFhVK2FleklWYmlrcTJQVytyZS9HMG1XSlMwN21TUE1sdkNEdUtYVk1POFRJ?=
 =?utf-8?B?NDltYklzRkJHUnpacFBzTkNMSmdnYVNYL2ROS29GYUNmam50UXEyTEtEQkpy?=
 =?utf-8?B?SVMyc3FpZUNuSWV4YVRNNXFuaWNUaWNrUjdsM3ZzNnRzcldRTUVTNDBzOHZG?=
 =?utf-8?B?clFZZWd4WUlJb3cwOExmU0huNWZoTUtpZUdteHAvbGFYTHBKUGRQTnB2ekJ3?=
 =?utf-8?B?UGpOQ1dPYys2b3lJR1A1UjhtYXN4VEFzZmh0UEdMZUpKeXlwcUNpZXo1VzQz?=
 =?utf-8?B?YzR0ZS9lV0pCRzdVQXZzS2c3Q2N5MXhNZTZFRzVOTkdFUitwdEY5ODhlQkZM?=
 =?utf-8?B?OEQ3UldlSStmQnhnSjNUdFdaTUoyN0ZXMk1nTXNLRURib3BOc1FxdkY4ZDVt?=
 =?utf-8?B?S1J0N3Uxa2oxOXNhOFhmVHFKQlhiU1NtV0hXM2FBQzZmUkdzM1pQbjJaUXY1?=
 =?utf-8?B?aS93bTQxdDBKZWZIcmp2RzBiekVuZFREMG4rTGZwcEFlNS9yeUhYeG81b0I2?=
 =?utf-8?B?Mm5BbjZUMEk2bkUvUFRIcXdCZno1ZEpNUkdUWVdLZW8ycUdobDhKcmpLdGor?=
 =?utf-8?Q?KPcQCH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THA2bUp4WDBvT25SdFc5N1lLbUtJbkU4SkkrZ1ZqZ2ZtM2xRSGRUUG5OVzFo?=
 =?utf-8?B?RFVIWkc4eVRtSlh5aHl1MVFCSzVNL0k0Yk5sSnZUUmpzWGdUVjFWVGNTNm92?=
 =?utf-8?B?WGg0RlZ1bDc5VWVBYVk2UHJ0R01mVEh3MWRVeXdrV3JIQmwvQStnN2w2VEdP?=
 =?utf-8?B?dlE2amd2RHhZMjRzNUFlZVhvTlBoUmhSck9UQ0l6M0x2TkdpR2huRWZQcmJO?=
 =?utf-8?B?WDBTWEZpNWZMbzRWMFVKU3pocUFwNUlwRUlQdHJyQWE1K3FZNVQxdGpPS1FD?=
 =?utf-8?B?clBqTFRlL3FDQ3dqd1VNNmdNanNoc01VYWlhbnZXdjJBY21keDdaUVh3TWpM?=
 =?utf-8?B?UXN6Q0k5aHY5ZWFzK1pRbkJyZGp0SlJhbFFWcENTVXYxek8rbFI1ZWljL2JN?=
 =?utf-8?B?WEZPcDR1QVlSSDZuUC9WQ2MzZWlJK0Z6emgvSERqRVZQS2gvVC95bnQxcFRm?=
 =?utf-8?B?SjFSc2JaWmF3a2dsakJwcGVvazBNcHl5YTkzYzJPWXNHQlFuL0g5M0xZbWVM?=
 =?utf-8?B?RFdSTzQzblhUZEdJUkhzb1JDcU1PNDZ0dis2RjQ0RW85VWJNczVodDJYQTJI?=
 =?utf-8?B?K2V0bE9CYjhQai9CNHlxNWJoNXlpM2VkaFVKMlFGb0RTL09iY3hIRGNUN1FW?=
 =?utf-8?B?UlRmajBNbCs2NndzODBEWVV2QXgrMDNFYi9UTWtXc2xTeGpHK0RUUXZRZ0Ez?=
 =?utf-8?B?c202Zjl2d0RlMThINGpMMXhSUEo3RU00ZmJzcjl5RTNFQXpYL0xjaGYrTUh5?=
 =?utf-8?B?MGNMcmwwL2xna0J4cGF5WTdGWWRrVjBTbGdDbHlUcUtCK2xtWkNqM2pWZnY5?=
 =?utf-8?B?aHlaNGJSaGhGYmMzeTFXVjF2L0F2SVZVUTVNYUtQWUdUYmZkRXYyditTZkt1?=
 =?utf-8?B?cG01OTRubVNFSWt2bHl6cVhXMVQ5Zk1Ld2g2OXEyZnZXTmJ0dUVFT0xpNDVz?=
 =?utf-8?B?aVE5REZ1ZjFodDlaSGE4V2xyOU1hQk5oZDlqNHpML2dsK2dwaVpsSUIzSHAr?=
 =?utf-8?B?MlNGb1FJRDZnU2c1Q0U3MHBtY2pWc3dZL3R4dzh0U2FsZEVIWWd2VFR6eDJx?=
 =?utf-8?B?aGc5T0FldDdrWVg0UzE1Z2lwRHNPZHh6UWpoR1BMQnhPRStoV2FoaXF2bHFE?=
 =?utf-8?B?QzJDdEdHbnNqcXdNTXpMakFiaUUrbzkrcTVMcjZJZW5DWHJFWG1yak9BRTlK?=
 =?utf-8?B?Wmo5OCtaUmtrMFVRRHYrdUVXdEo0ZzRMbktrZGRoZVUxQldnbU0yTFdXdDFv?=
 =?utf-8?B?bWRuekZGZ0ZiaU8wU1RoYlJ4V1dKUjFPQ3B5bk9ZbWpqOGVad0pOVkhSdkFx?=
 =?utf-8?B?MXJPaUJMblYvbmlCOUI1b3ZRRW9UcTVBSW1CMmVYWWRGQjVBSGxDd0VGUUZr?=
 =?utf-8?B?QUYzTXB3ZEJiSkR0MFV4Wm1rdzhLL3FBWHB5VzYzdFMyeGZ5MlhqQUFEaDlZ?=
 =?utf-8?B?WXYxUjkwNU1sLzIyZjd6anBocWk5WDhIUlpOaEhUQ3ZWSEdaekpEa2xDK3RG?=
 =?utf-8?B?cVRoTzhCZzB0L3NrTmk2eHMrdzFQMC8xUXBNemdYMFBnTUU0M2xXV0x4REFC?=
 =?utf-8?B?NFJrMXo4MVU0UHdKdlR6WHBvSjRZcTZaRTZ1VUlZNWlwczYzVWt1dFJrd01R?=
 =?utf-8?B?a20xcSs3NWMvek9LWTN4TkFJMnFRZWlIQWtiSEhNK0IwMStUWVIxNUthQzhR?=
 =?utf-8?B?b0JOR0k0cENuSFVSRGZvWVJpZFNNeTRMSTQ4anNDZC9iWVkwKzB2dUpkY0dK?=
 =?utf-8?B?QmE2MHNtY0RMT2dTdXh2K2t5TU90VCt5V0xXNWhwVmNLV20yekFOU09zTSs2?=
 =?utf-8?B?Y3hOYXgvTXdYcUtuU1FON0puYmJJUzQxL1lDMVl1YUZKUmdPdWFEMU5oS0Vl?=
 =?utf-8?B?VUV5RE5FRUU1ajhhU2tJSWFITDJOQzRhcHBPdHd1L1lHMkNnT3dKM2NyRFk2?=
 =?utf-8?B?QjZ6NDJuYUc0OU5CNy93OVBmbUppbndQa1JTdUxyc3VmOU9oakIrV3ZvK2Zr?=
 =?utf-8?B?R1cxQWxGOXdUQmN6aDVHMkovZFNWRHB6T2xIT2JvbDVydmtUZ2VLU2lvNEtq?=
 =?utf-8?B?SElDcExmVit1SGdmdDVnQ2NaUnJyZXBzMzh4bVF2UFZ4UDlucGtabEp6aytM?=
 =?utf-8?B?UkhCSFc2T1VBZUZMU1hucFlpSS96VHcwNWNCNmtLdGtqVnh3ZTdycjhoMFV0?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96586a33-bfe3-449a-f61f-08de3d786f1e
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 14:27:40.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLbK/t/OwStc0tBRpa1rxjvBz/40SqUBjZwbfiRhoXM1p29gRDVSzSO/nM80nZjBEo2CQd1lQyM4PtkP8kjKNbS7a8ugRKq1AhZ9/85yfrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=6942bddf cx=c_pps
 a=9wPeeuiWglyMylSd9qupQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=AoXOhhOut3wUavBMMSwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: sqK9fpr3ejqGBYWhUUfZJlR35TTNKW9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMiBTYWx0ZWRfX2ZT92+7faO2U
 IVGZtUwZXnR6SKMGTpY9wDJ/vKZGR61YFkt/FR7HgY3c6CfX7uPNStjw/v/vuCBTQyMLhMBQlXZ
 1Oz2v4kaEDaxJzAEfwW7RPbijr/hep+Zp6FVraZU7M3KDimM2W5EeNODPfvuRz/Xkved7rfI/x0
 FwfIOFUOe4DreVmvrnWXesv8UbcJXkwXN9yQt0o/MrZyal6F666Icd1nZZKbWSMyQmA/Hj1dcTS
 AObDurQBpMSZOf6lkzzKTpsnkd3GE74p0Q/UxjY8A8ZM5dJqqNvfXOL7Iu49VWHBbWEYITlbBc1
 +eU22ZpgMAoIx9o44F2MJ9swNwx7DQqmCddDHXxvVtlSo9VkyFuU0FwmcdlX4zxdDUlGNmYdHWa
 u17qFVpz+4m6L6HsX0Sd6zDS0QSegQ==
X-Proofpoint-ORIG-GUID: sqK9fpr3ejqGBYWhUUfZJlR35TTNKW9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170112
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BH2snOe868324
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 14:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228045

Extend the wic selftests to cover recursive directory copying
into ext partitions.

Previously, copying a directory into an ext partition could
appear to succeed, but attempting to access the directory
contents would fail with:

  -l: Ext2 inode is not a directory

This was fixed in commit 4fc3b42774 ("wic/engine: fix copying
directories into wic image with ext* partition").

This test now verifies that directories copied with "wic cp"
into an ext4 partition:
  - are created with correct inode types
  - can be listed recursively with "wic ls"
  - preserve files and subdirectories
  - can be copied back out of the image without data loss

A simple directory structure is used in this test:

wic-test-cp-ext-dir/
=E2=94=9C=E2=94=80=E2=94=80 topfile.txt
=E2=94=94=E2=94=80=E2=94=80 subdir/
    =E2=94=94=E2=94=80=E2=94=80 subfile.txt

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 65 +++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index d7a9b14658..958f1d084f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -13,6 +13,7 @@ import sys
 import unittest
 import hashlib
 import subprocess
+import filecmp
=20
 from glob import glob
 from shutil import rmtree, copy
@@ -2084,6 +2085,70 @@ class ModifyTests(WicTestCase):
             runCmd("wic cp %s:2/etc/fstab %s -n %s" % (images[0], testfi=
le.name, sysroot))
             self.assertTrue(os.stat(testfile.name).st_size > 0, msg=3D"F=
ilesize not as expected %s" % os.stat(testfile.name).st_size)
=20
+            # prepare directory structure
+            testdir =3D os.path.join(self.resultdir, "wic-test-cp-ext-di=
r")
+            testsubdir =3D os.path.join(testdir, "subdir")
+            os.makedirs(testsubdir)
+
+            # add a file in the top-level of the directory
+            src_file =3D os.path.join(testdir, "topfile.txt")
+            with open(src_file, "w") as f:
+                f.write("top-level\n")
+
+            # add file in the subdir
+            src_subfile =3D os.path.join(testsubdir, "subfile.txt")
+            with open(src_subfile, "w") as f:
+                f.write("sub-level\n")
+
+            # copy directory to the partition root
+            runCmd("wic cp %s %s:2/ -n %s" % (testdir, images[0], sysroo=
t))
+            basedir =3D os.path.basename(testdir)
+
+            # check if directory is there at partition root
+            result =3D runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot=
))
+            root_entries =3D set(line.split()[-1] for line in result.out=
put.split('\n') if line)
+            self.assertIn(basedir, root_entries, msg=3D"Expected directo=
ry not present at root: %s" % root_entries)
+
+            # list INSIDE the copied directory
+            result =3D runCmd("wic ls %s:2/%s/ -n %s" % (images[0], base=
dir, sysroot))
+            self.assertEqual(0, result.status,
+                             msg=3D"wic ls inside copied directory faile=
d. Output:\n%s" % result.output)
+            self.assertNotIn("Ext2 inode is not a directory", result.out=
put,
+                             msg=3D"Regression detected (inode not a dir=
ectory). Output:\n%s" % result.output)
+
+            inside_entries =3D set(line.split()[-1] for line in result.o=
utput.split('\n') if line)
+            self.assertTrue(set(["subdir", "topfile.txt"]).issubset(insi=
de_entries),
+                            msg=3D"Expected entries missing inside dir: =
%s" % inside_entries)
+
+            # list inside the subdir
+            result =3D runCmd("wic ls %s:2/%s/subdir/ -n %s" % (images[0=
], basedir, sysroot))
+            self.assertEqual(0, result.status,
+                             msg=3D"wic ls inside copied subdir failed. =
Output:\n%s" % result.output)
+            self.assertNotIn("Ext2 inode is not a directory", result.out=
put,
+                             msg=3D"Regression detected (inode not a dir=
ectory). Output:\n%s" % result.output)
+
+            sub_entries =3D set(line.split()[-1] for line in result.outp=
ut.split('\n') if line)
+            self.assertIn("subfile.txt", sub_entries, msg=3D"Expected fi=
le missing in subdir: %s" % sub_entries)
+
+            # copy directory from the partition and compare with origina=
l
+            outparent =3D os.path.join(self.resultdir, "wic-test-cp-ext-=
out")
+            os.makedirs(outparent)
+            runCmd("wic cp %s:2/%s %s -n %s" % (images[0], basedir, outp=
arent, sysroot))
+
+            copied_dir =3D os.path.join(outparent, basedir)
+            self.assertTrue(os.path.isdir(copied_dir), msg=3D"Copied-bac=
k directory not created: %s" % copied_dir)
+
+            copied_file =3D os.path.join(copied_dir, "topfile.txt")
+            copied_subfile =3D os.path.join(copied_dir, "subdir", "subfi=
le.txt")
+
+            self.assertTrue(os.path.isfile(copied_file), msg=3D"Missing =
copied-back file: %s" % copied_file)
+            self.assertTrue(os.path.isfile(copied_subfile), msg=3D"Missi=
ng copied-back subfile: %s" % copied_subfile)
+
+            self.assertTrue(filecmp.cmp(src_file, copied_file, shallow=3D=
False),
+                            msg=3D"topfile.txt differs after round-trip =
copy")
+            self.assertTrue(filecmp.cmp(src_subfile, copied_subfile, sha=
llow=3DFalse),
+                            msg=3D"subfile.txt differs after round-trip =
copy")
+
=20
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""
--=20
2.39.5


