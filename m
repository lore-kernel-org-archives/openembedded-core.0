Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36637C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:23:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12598.1788524579862436485
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BAscUz2N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3707938b91=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AJMeK678369
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 05:22:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2GxLluRpu
	g48rCIw7itATTB7rlm/T33cDXV30d0lDcY=; b=BAscUz2NfTb+zNTox66NK4Grq
	YFvvye2mBBgf/kK0KVjefAE/S9qiIRao3nmaerzWKNYOMnCO5SkNv/i8+QOMJBUi
	OVbu4QorD3RojQFoAD2w24aD4hnaO2Fxl7jxC3da0q+9DCykVwim2helEHCSLmXx
	StZTd729v/aMwZ87ExN2U3fs+MWZwQDn38UQGiGDAuHuWwae8ABuKn1RDhFbeu86
	SCk0L8JCuJzoBt9yrfHxO1fAFlCCKvZzIHld+bZoZul3H/QUuRnkMW0GZ+/6BGqq
	a5PggpwR+e+1yk0yYZJ9ow9Kq8w7U8feMQfrOt7MhXkQrfHftEpTOyIjb4ovA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022128.outbound.protection.outlook.com [40.107.200.128])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gfc8p1kty-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrG3m2qzXHcrR4UE7Dle7JfOZUuPe/PN4B6UDEwEikxXbeWBdDbnJExI8FyQSlXD5py9oVuBcl7B/X+5GW7H/oeZmuftdPB2+/eWByEQfGO3919ZpADzTqQlQLU3zeV1Bo37Blum1HO0uj1e+1m/kKSyHAsvkOKJWzxl62kAw82CCBatPhFSYnFe+x5eazXnf5TYgD/1yMLgBGanipiOhug9w6/vbPtnY3gG0qAxB0lS2veF4K9aOKeDrLKXmjlfmEnEESKbFtwrw89saUgiOZ/xTvBsAUroKAUDADiGMC8dVF+7scCofp9F+wVp8MhAYuHvOcAswZaD2tXjPkmCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GxLluRpug48rCIw7itATTB7rlm/T33cDXV30d0lDcY=;
 b=PgR+SfqOH45GPx0fCDKhp61ZXyV2PU5PaLZEHcqlgBPAdJF+tx8B9xQa6B6bgCaea3pp7hrun+6ry7vfEsvWdAOLjJ2TdFj+OHwzStd0k+vJ4L/3MR3P67LICfk9RebsurM4m+ll37a2+xHEw6rUMCIzNsnbUv+BbOh9z3B39glgiezQhe6R33wmhJhG1NkLD96jCL3bC3lZXMQrP5RJ+mjsec69ob6/6duPB4LJrn7QpbILS//Am0Q/0l431cYtSg+kNCsMJZlnzPoFnhe0XYF+X+sT0FO6etINjf50rv7gzrYyyiZjMUX3KrHDN/LsptsZiW3Dfw4pmcGouiQrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:22:56 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 12:22:55 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Upgrade 1.98.0 -> 1.98.1
Date: Fri,  4 Sep 2026 05:22:41 -0700
Message-ID: <20260904122242.1745548-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2aee72-40bb-428f-c998-08df0a7f3fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|10067099003|6133799003|18002099003|12006099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ySqM5qyMu68LbSN3Dlju+N6AN7eTTC/kkdkYT/whSPKryV81FpU1f/VTSbPW349q5U3DMPJz8uB4NczMxJixH+TeY/tIYoeo3LEptgus0CqExyAwY5aNusq9CR0ZGXWvGUh/qv2CI04G2G90OIqd6zJg5HsMg1myKY9tlhmC5E6HN6rGt471R22iJuRQNx9RfSE3k/kWldZDn1UvabVXJJzb1wreqcrS1kP6tcHC/vQ+0UYh+ujPHm3np5p+t+e6IxiUMMe70Cygw4wiXgsL6K6/iNpMsTAU3XuL7PmpfK6tQP3//cvUOoUN1ynfpSb12bN+fxIdf2sxgF+AD0JZAEfEKEIuMQxIK3Qq3pxd5DMJ1Ho+T+hNGbbyZ6UNYAzkV51UNOo2pFKaJO55TMeHNTq4VMtHv53WfoXMjnW6W1NIqr1G4YrmjFrX13vRKRRXMdvQLOWsRWq3A/pJYFIbAfbrx7STiXuldcKEO0gf7v8zMaiCFVx4B30YLWqyKr4kQgd+C2fnFFNEBJ1LPbylln1UcObskN4p9m781ytvNrxG7kqBtg3cYRafSAMvscYvDZJ2xxGRbEHZIL2FeGJAkJr5icJip+Yvwp8XfXZNU0uniun0cJyfJqzXeRNlQkkEbaSFsH5SGhJTRxBeAuOa2psX5fn0cxw9pha4JJjX3t4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(10067099003)(6133799003)(18002099003)(12006099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RG50MkFHUWZtYmhSRTM2UTRLVU1wOVZtVWxYOVEzcS9RU1RXc0REYmZHN2Jz?=
 =?utf-8?B?QnNEZlNxVmovU0YxNlJPa3JDWW9sL1oyZFdNK25TbkR6SVh6bVk2bkFRZ3NT?=
 =?utf-8?B?YjlmOXVTa3VzdE5xQnRLNnVvYVBQM3VyWGt3VDBaUFBGMzJmYWcvMXR5OHhp?=
 =?utf-8?B?bGpNNGUyODB2VmxxYlVoVzU1YWd0YlZXQXhiOHJhaDZ5YjExRWFxeVlBcFAw?=
 =?utf-8?B?di9FUU80SElWN2cvaDBMOVVmYVFMOTFwSm1RWVRhR3pNeTRDTHcwNmUrbXZu?=
 =?utf-8?B?eDF6QkRtelBDSHk4TFVvQkl2c3RBVkhoc1BPUlJ3WGQzZ1hYUVJiNkFKNjBa?=
 =?utf-8?B?VmxaTjdIUmlzZTlBUUQ2dVVYWWNLbytKYkh5OFo4bm1CdFdZVncxYlNkNUVO?=
 =?utf-8?B?M2xVQnc2OUpaVmVqS1ZjNGd4bWIyNDJhdUJqNHJSdmVKQnlKQjBMaGtILzhE?=
 =?utf-8?B?bXdETEVPdDMwbVZ3bW5YZnlWdldsZDJlcEd5Wm9qeGJPKzAxS05OUVByODg3?=
 =?utf-8?B?VnNhQ0pUZnoxNmlrNHdQS25WSEhYeGF3ZlFoVlRNWXhybFhhRzNTQXhVdFdF?=
 =?utf-8?B?QVdaYkFHV0liSVl1K3FUamFyMXhJYkt2bU9KQXhTaThWQmlMU0VJdkVTU2NT?=
 =?utf-8?B?d0FPWDhicFZ1bE1WS01KNmJvWEgreTkwalFlSTVRNjFRMkhvSytWL2NsMnhT?=
 =?utf-8?B?Z2t2RXJxZ3dhbkN5UG9GMVNVNzRNbDFzTUxXeDloV29tZG9QZFZrRlFTQ3dX?=
 =?utf-8?B?TEpheTVweW81clFoMU5jRTQwT01PWHpmcWZEajZsUXhnSlNjVWtlaFNYc3B5?=
 =?utf-8?B?clQ1VUpUc2g3ejNEQ2Z4QXpiaGF2SWJ4OWZUa1czdnB3b2lYa0ZDQ2d0MklJ?=
 =?utf-8?B?eUlFZ1hnaEt5TjNuendNVFlDTjhGTWJKNW9iQzhtdmcxUW1VVkVSQzI5K0ls?=
 =?utf-8?B?SHJtZmNQWFpDV0FhZjJYUk9wNGJueG1YaGtaRlJmb2V5S2xLd1hpQVptek9I?=
 =?utf-8?B?eHhjejAwaXQwNWNvNEh1WWhiK1RaMXpGc2JnbGlYeVJjaWpJRDAwSk9BNGF2?=
 =?utf-8?B?c3pXcUFPRnpWaktQRHl4cE0yY1ZCWHJrcUpPNnRrK1VIeDVCM2pWcmdyNnN4?=
 =?utf-8?B?TFRVSVhDdkJ0VmlwcDVxMkZvd2h5ZCs3T1RDcXR3Y21tMlhweUoyblFYeDlR?=
 =?utf-8?B?UHVmY3AvcHBxQ0owYVlqcENTcnV3cDNMaW9pS3E3MjdaMmtJTERMODlpWXVG?=
 =?utf-8?B?VzFTZWEvd091Um95MWdvU0FzTGFHdjZzWHlXK0ZSV3FyRGladi93U2wxT25a?=
 =?utf-8?B?RitZWG9DS0RQdGppU00xaEhCcnIybU9WYmRNZlZoQWU1ckRWZXkrcjNNcHJi?=
 =?utf-8?B?UE5uMUpYSnhHOEJzR29yVzh2K0EvYks4MVF1TUxFaWFRUWdId3JNVEVmVWVa?=
 =?utf-8?B?VkIrdEJUNXAwVXNMQVFsd2NLREtFdzJqRHB4YTlyaU43YlQxNzNJSElmZ1dD?=
 =?utf-8?B?VWwzYmlmTmRNWnhRRmxNRDRQZXR6MUJiTGZybHVnTTJiV0FXS3ZvRG1veEcw?=
 =?utf-8?B?aVhKbjlZMk5ZQlNKdFlUYkdRUllKV2RqRHVPblJoRlo1QWtUZnlXTmlmTi84?=
 =?utf-8?B?ZEhOV2xpUmVPdXhId09VTFJ0aUx5MWlTbDlBZ1c0dFJUNkhkV1JHVUZuVFN5?=
 =?utf-8?B?ZkNhNzBDRmQ5QzZMNDB3bWlLd2JEYlRjdllkSEUxc2FvV2RWR2E3RlQvTHZX?=
 =?utf-8?B?V1gvR0FLazE2Q3JncHkweVR1Y01TL3J4dGFxbmpJZVRJSUllUzQ3M0JBRmJr?=
 =?utf-8?B?ME0rc1BIc1ZnZ1RvbjN0YXZCR3lpTHRlaHdzWmdlYXVpb1JuR2Npemt1bzVw?=
 =?utf-8?B?Q2pLTWgwYlJvYTZScDlHN2tTb3R2U05xWTlCVlpMYjQxQnZXMjFoYlo5VTZO?=
 =?utf-8?B?MWpMMFVJT2l1eVZDdVloY3gxVk1VWmZ1TmFVZGFqam1tbzBPU2Ixc0t3akkv?=
 =?utf-8?B?cmcxYjh0MEpmMXIwSE5lU0xRZHV5d0RPMXB3QlpxZldITmdCdnBLL0tSYlpq?=
 =?utf-8?B?UWFZSXNkTzIrS0hnMEZOOUYvQWZRYlFMbDVzWkJZK0VpV0lFSWY3Y21mcXg0?=
 =?utf-8?B?Szl0Ymg1NEZ0NkNRWkRGQThzWkJNVGp0N1lSeSt1alVob1JxNVo3anhsaFBp?=
 =?utf-8?B?eDY5UEJVTDdnalhWaUNZOVYraENGU3BRZWRLMkNCS2FseWhYNXJhSHRia0F5?=
 =?utf-8?B?Zk9HLzM0OFJIbUY4MnZWRUhqd3RzOU5aQ2NqZGZOZjR1K2FLelRpWDVmSlI3?=
 =?utf-8?B?KzBteldxVlNTNGk3V0lEQnh2SUVRYUNrNm9icTFwSEQ4L1RGSUtaWG1maWx4?=
 =?utf-8?Q?QMYzounDYfXr268FOCxChi4BDFkdWLbNJG9ch?=
X-Exchange-RoutingPolicyChecked: 
	MzzjFfklAGjV66iWWbhrBRbTQBMMgGv08EeAk00zb0U7oa6QZdcAkhQSpRDJaVDfu3FvgSZ4jF0UMnmZ5urDfaQhoXE3QME/DNmPhhTcHM2/YD5bD9fkhGQzao+h5OgZJYG8Ch49oWlkSce925EdFDI/KZHQn73zMA73q+pA2qYu7sqUfb2SNp4mwKfHfBg5D2HvjMTQuIaNy2zpS1f0CIK5ipwyJlU2hpWVViVfbmFESXqfVUEElgjGhfvZ/leVWngZTvV6dgOMIpNdi254mod2M/oYss6ZV8frar9Wtq4oag+n2IMJpr0zBUcZ/HLnyoeNlFccfb5bB3QRkWoQYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2aee72-40bb-428f-c998-08df0a7f3fa9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:22:55.7304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRyXfFOQjQGl1mP/ZCxfO3/JnX5R5hx4XlGvCaMiSfz5EJELupctWcp0iXw0KC7jhahJhS3olIykjPBp/UYWybTX9cF+EN/zM6COV2LK6hb9+ErPaJSfeGPV0wxWyCTf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMiBTYWx0ZWRfX8hAICaV7slHM
 hapoq04Pf6S1QwvNK7wL6vVCx/8nAf5iOX7uIV5tYNeUjG0ZrnrQdgWsX2ObNIJKdexeu7uLHDd
 AmyZE3zwxb9BXasMwTvCErv9Skwi3hpHLpsBdX+MzC8Q4GkplIID
X-Authority-Analysis: v=2.4 cv=GZcnWwXL c=1 sm=1 tr=0 ts=6a9ab823 cx=c_pps
 a=kTZZPKNJDFewiw4iZ0IhzA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=j57RdskLAAAA:20 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8
 a=iGHA9ds3AAAA:8 a=8wEic9LhAAAA:8 a=ag1SF4gXAAAA:8 a=rh7QmuLL9MBKuMkeWpkA:9
 a=vMSLIoBrxnVuxsOA:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: PVARkAkwmG7bi5_RV2QM5uXfLRNcuxcE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMiBTYWx0ZWRfXw6WhSaz4HHW4
 OPxKj4vBNuTflPfAz490Hw+WaTDssqtP8G2MGPaOdQLAcoKil2v1JOozunOSQLBmsoJeye1s83c
 iugWR7W7KwzGmyacTVy06ocPohrCBkoD3WhePpg7bb3c02cyUQ2P8L2Wp5QkE0ZidZEPKE3WmeC
 oCEQu9DE4RjvgNbisrW6ved3H+CAjh3tZJ18CciqtvNoKZD3DobErFOZb+7rNo86VFDFHG68y8v
 FRYXnjuPYWsGKV/H36lJDV26sVRPFxx0PKfanqj4HEpk/Ytzj4Bwra1BlD1gM/3iq8/dS+/rQvq
 9vuaqQM5JGQwZv0BcJlvklkHJmzaEkRDHdapyqmSdmQ0qY5X30xU2Jw37XB6dkcTcOddFa6Mhy6
 FW81HRPel13ju/+jyAMWE5M1roCYEwxJncBDveaNd146WoFrdEUBaKHhp/cQI07T650STLI0lRz
 oxlHVtXgPkpBlTDcz3A==
X-Proofpoint-ORIG-GUID: PVARkAkwmG7bi5_RV2QM5uXfLRNcuxcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 684AJMeK678369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245095

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://github.com/rust-lang/rust/releases/tag/1.98.1

Rust 1.98.1 fixes:
- Fixes a miscompilation when generating vtables

Test results:

rust v1.98.1
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  23170  |   805   |
| qemux86     |  22914  |  1061   |
| qemuarm64   |  23000  |   975   |
| qemuarm     |  22894  |  1081   |
| qemuriscv64 |  22943  |  1032   |
+-------------+---------+---------+

Test results difference (1.98.1 - 1.98.0):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |   +1   |    0    |
| qemux86     |   +1   |    0    |
| qemuarm64   |   +1   |    0    |
| qemuarm     |   +1   |    0    |
| qemuriscv64 |   +1   |    0    |
+-------------+--------+---------+

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 meta/recipes-devtools/rust/{cargo_1.98.0.bb =3D> cargo_1.98.1.bb} | 0
 .../rust/{libstd-rs_1.98.0.bb =3D> libstd-rs_1.98.1.bb}           | 0
 ...t-cross-canadian_1.98.0.bb =3D> rust-cross-canadian_1.98.1.bb} | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 .../rust/{rust-source_1.98.0.bb =3D> rust-source_1.98.1.bb}       | 0
 meta/recipes-devtools/rust/{rust_1.98.0.bb =3D> rust_1.98.1.bb}   | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.98.0.bb =3D> cargo_1.98.1.bb}=
 (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.98.0.bb =3D> libstd-rs_1.=
98.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.98.0.bb =3D> ru=
st-cross-canadian_1.98.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-source_1.98.0.bb =3D> rust-sourc=
e_1.98.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.98.0.bb =3D> rust_1.98.1.bb} (=
100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 5a7c69ab4e..3c1a4ffa43 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -784,7 +784,7 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-source-1.98.0 =3D "Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-source-1.98.1 =3D "Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
index 71097d933c..d176bd28aa 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
 GCCVERSION ?=3D "16.%"
 SDKGCCVERSION ?=3D "${GCCVERSION}"
 GLIBCVERSION ?=3D "2.44%"
-RUSTVERSION ?=3D "1.98.0%"
+RUSTVERSION ?=3D "1.98.1%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.98.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.98.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.98.0.bb
rename to meta/recipes-devtools/rust/cargo_1.98.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.98.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.98.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.98.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.98.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.98.0.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.98.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.98.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.98.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index f40f1652b2..019e2585e2 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,7 +10,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.p=
atch;patchdir=3D${RUSTSRC} \
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-=
23.patch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "271fa73d8174f53d713c46a8310da7bf7cfdcfb8b7c=
fd1c2b74b84a83ae9fb1e"
+SRC_URI[rust.sha256sum] =3D "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4=
561e4d5470207df616b9f"
=20
 # Point UNPACKDIR into the work-shared location so rust-source.bb and al=
l
 # consumers (via S/RUSTSRC) reference a single shared source tree.
diff --git a/meta/recipes-devtools/rust/rust-source_1.98.0.bb b/meta/reci=
pes-devtools/rust/rust-source_1.98.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-source_1.98.0.bb
rename to meta/recipes-devtools/rust/rust-source_1.98.1.bb
diff --git a/meta/recipes-devtools/rust/rust_1.98.0.bb b/meta/recipes-dev=
tools/rust/rust_1.98.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.98.0.bb
rename to meta/recipes-devtools/rust/rust_1.98.1.bb
--=20
2.51.0


