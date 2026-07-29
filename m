Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22DEC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 04:28:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4260.1785299296602320051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 21:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JXvFvbAR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26709619c3=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T3rhkL601737
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 21:28:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=XUJo320SCpybfC2JBPJbOpKfizFKScdJPvhQnSjGsBo=; b=JXvFvbARAzPr
	D9wbIrJmyF/ahUyMPsojcKxT3RFJbg6XUnsPS5bPw7aRpcsS4LMBQeuUTODKoCmT
	dtuUfAe3kEndDCsQhpcrZ2Vgv2mVGJ9R6SG1tITWuVr2eIbLB5TmNrGn+B3aBmD5
	TTdpAM9duc706ntGLQAasrxh74vlKGFRKUNtLhdNQ9Gt8D3qFUuZmKZuDz8qhVe0
	7UQIZISE0uUAhG4qHVWf0c7m2a+R3gbisdIuHkmg32KyQhIfO7YnCKPiZrsYaIK0
	CO2lTaMQImHeTpq+yal05sJlMMC9uqXzHJ7KFFugjxkoXrPPFljhjFzhV96vm49y
	pJM7evlFmA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fq86nr4ya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 21:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftzcXKCc3aSD1W1YWwIu/NB2yJ0zKh1BTugNqI5djG43yc5O4qnUpWLmeFxJesu0wKzpxFwQ4PRX8vZosDlNkCogPuyOlXDGUrBvmYfKS0GGGPOKy9JXJeM4fIF0dmA8aTt2HpFeFbdGbmclMBkcYKcn/Kp5u0BOhYQiTAlMu4+3zbUOOXSE4p0m6lyWRo1brsZR3bheTH0fvQJnSVWLtTmL5xs2hyct/cD/YkkkQgwTckZ4YaXdv8Pl0SDa+tZeRGUjLiTEmZvs5oth78rS9drYx6Bzb4Q8mVnE+XlCGCPBtOM38ZlG5CgmvZniv0h/a0TUDdMJcLIIc991bbc2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUJo320SCpybfC2JBPJbOpKfizFKScdJPvhQnSjGsBo=;
 b=PA9DAiP+0dWmxCgjgUsc2FCOKEUsKRBJtoKkm+xoiA0xDaQZMgGXqXxEGq11HzWpf209ra0FzwvzBp4+tf876Pu5BKhPYMlfqRUQwAwuqI/hvKUyoekvnHef2mOEKaajvTp4Awrv5nzPo6WU0ta3/onUtqAGinSaEH2dW1gZXqDd73VGzRDjU4fj4Zd0DlIkLKZCniYhkw42CslU8xuYAJU9y67h9uiieDMi5HPsYEZZoFuvQI6L1YfEgckX1jx6w8+Y0RLhH3lZduQCG1oGFre1Qcli6G+b+Y9/KW094TKN7AUKZGLDiPWLlU0oXptCd0mkJaiuyGoCWHUDzmBUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MW4PR11MB6715.namprd11.prod.outlook.com (2603:10b6:303:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 04:28:08 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 04:28:08 +0000
Message-ID: <70d29250-0950-47e9-a180-bfda08a669b3@windriver.com>
Date: Wed, 29 Jul 2026 09:58:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/3] rust: refactor source handling into a
 shared work-shared recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20260725035136.1260408-1-Deepesh.Varatharajan@windriver.com>
 <20260725035136.1260408-2-Deepesh.Varatharajan@windriver.com>
 <e9117009423ec2c41f99383a7993724bc3d221b9.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
In-Reply-To: <e9117009423ec2c41f99383a7993724bc3d221b9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MW4PR11MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 5365c564-3327-4e24-9418-08deed29ca84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|5023799004|10067099003|3023799007|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	K+QSNWZu60oMqx/5TVlhz9kf3eZoFRr/VNWSszttI/KrKsZWyPUmhGZEiJx6Hd++xzQjtkt6TYlfNY4r8i5W2edElndSfPCtmkvKWDb3+NnrH57JopSw/Qmammkc9/+NHZ8qJEDz9O5imHhInfte7ENilfG/3VDREanybJ1Pf8naNdDODCfJ92fPGA0kRqI7dwKP0eN+H01nilvOtU83k29Y+yGWNuDPyEsvVINTMGX9VmWTWSIEEZWk5RELM3Ah9Qk7AEgycBAnznNKCo0BDtyHtyD/bMXEG4Q6QPGQgkVmtyC8L48Hw0FHXi5TL7eecVkCpjZM9HjFmXZuX0bunAVTII+4rOg8QZiGYo61HvY/XIlfMGB+Pwm+giGC4yK2/i+eFW+YS/SvBC47g4RqzYaw/O4WBxulNsmDC+mOIFwO0uepTNIMTt9SUeteDcvM+JlTP5HamAMBPTOZBiuX0yAQU3jFzgtGzojCE8FNPivR4h747tgIwI6WNh5PnL1wqAEsiBx+encC5lhR8crPcn142DYFcKsy0T29GdwVKsplGMrfpg1KA0iot+CA1scvmpTVaFGVPYQTVo7ZXNWJbos5lmffzwwRt0lQulAFtYBtYRYW20Pmc+MMJRfA3TR8ya3oOVtPZZp4cTlcrZ3GBWbvitiye9YJZFqEw75ntdo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(5023799004)(10067099003)(3023799007)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2FYUVNqaXlTMzFWWjhGRFdncjkxaEI5MkZ3QlhNcWZEMnhlRUp5Mmx6OHFr?=
 =?utf-8?B?SUVnREkrRk9BbzlndWtRZXVkRmNYZy9pK3BHdWR0aGhMa3Z2VU9sNnlLSWxR?=
 =?utf-8?B?cHh0QnMzQmh1dUluSjM0aFR0NEpzdnJPL3RoNEg4TmFIQnJqYVpJUWpFbFE1?=
 =?utf-8?B?T2xIdHJoTU8wOUpEWDMyNkxPSys2Y1B3cnZpWDhySDhCaDlXL2JVaXRWU2Vj?=
 =?utf-8?B?RXhXRDdOcnQxOWpMdndGcDNEcEJMUVdMVlRIdjlwQXA2WE9GRmtob2NDUHFl?=
 =?utf-8?B?dlNya1IwSWNIcXQrMGovOXc5NmdyQTNzbzBYdXdCbm1GZkN0YzMvRXpZL3pE?=
 =?utf-8?B?NHJ2ZDlQaVNIR0xWOVN6V1JrK0ZMWWtRem0rdHVHTDB5VnFIRHZIajBsMGNY?=
 =?utf-8?B?aFArMTdTTnZGWGsyOTBsS1hTdjRXUFIrVU95RFdyT2krRWpKUzlOa24yT0F0?=
 =?utf-8?B?ZFFoVkt6UTFLakhsYjBJV1dlRkh1ZE5IY3FHL3ROQStRQU1iSjNCQkY3bUVI?=
 =?utf-8?B?ZityajVvT1lsS2RzT0thVkJkVFF1UjNlRzdmUHJMR1o1SzVRejRzWUhTc1dj?=
 =?utf-8?B?QUlpTE1GanZHbWdUUXFJOWRTUTY5NjhXRmY3eFM0V3pDTFl0ekwydno5bW16?=
 =?utf-8?B?b0FsdXVTazRQa0lxVGhESmhyd2w5b1pPVE5jaUVVUkw2SENhS0tsb2g1Nktk?=
 =?utf-8?B?d1NkZWEyS2FQdlFucDNFcWc2aHhxQmZlQkpUTXhwSjRIaFFXTGdUL0lYMmtW?=
 =?utf-8?B?QnVaWnQ2Wnc5RFdHVERlMFovakZYNFQ5UTR4bmErZjdjZzd5aXN3RTZIeGph?=
 =?utf-8?B?MjRkS0h0ZXlTZzJ4amxZYUFoWmxWZXdnQ1NHSnpkbklOcGE0dlRxTitEREUw?=
 =?utf-8?B?Ymk0Ti9Vd2cydWQwQURKVENXVHk1SmhRQUNpRWtvM0NpM1pFVkpCeDJRdS9L?=
 =?utf-8?B?RmZtVHNSR2NLSDFrV3VUeTVaU1RJR2tjT3NZZS9pTDM4bnNiRjdSOGp4SVk1?=
 =?utf-8?B?Q0FBdmpyT1p3Z0loOVpLZ3g0R2Q1TU4xY2htK0lnMWRNL2dwVS9DVHJBSm5o?=
 =?utf-8?B?bWFwZGJMa2tseE5ycXFTTjdVZUdsMG1VMi9kbG10WUdwWUhRdUN5cmlPdGlv?=
 =?utf-8?B?UkEydzZVcEhoT0lQWGp4RTJHb1EvQ2kvaTFOa1p3UFpTY3A4aHBPbjNwWDhi?=
 =?utf-8?B?UkM1R0QyeFB5cENKRWJEZnk3eHBUNWZWaCtndTBqZmx6d1JvWjhHVEZWN1lt?=
 =?utf-8?B?cmowTHlJY1NuNjRYQTZhdWFudWE1ZlN1VnJxVkVGeVhHY2hpdjNLNFlubHhy?=
 =?utf-8?B?dGU4YXlKV2VXVzJmcUxwOStzSmVMNmNpZlBBQ2l0TFNFSFhlbmxmbVNSdEdh?=
 =?utf-8?B?WUljRkRwelh3NUk2MElPNFgrVDhES0xXWTIraGtiNFpXRkEreXVpK2lyWTJn?=
 =?utf-8?B?blpOZVhQYWFWTEJTRWlabUJmUFFiVTFySUVKb3EzWjB6TUNoVTNhMW53c2Nt?=
 =?utf-8?B?emxaa1l1SFF5dkVHV2FaaG15czhnejFjUmtNYmVrOWdwYUh2Zkg2dHhSZTJr?=
 =?utf-8?B?RjBLcjRPcnZUODJJdWRGem53Yk9DY2d6d1RncE04azc4TjlXa2szYXZDV3lQ?=
 =?utf-8?B?eWlFdnRtZlFhbnJxWkV1RjAzR000bnJHM1l0bHB2bEFIYUFyMFZoOCt1YlRv?=
 =?utf-8?B?clU2S1Y1cDJJaVppNFRhRkZreFNqUWUvejYrY0lodE5kaUlmSTJJVkx6Rmo4?=
 =?utf-8?B?TWtqeW9uNTdtdlAvQUxybVRhcGhPRzYraUtGS1ZTS2hDZzl4WGJMLzlVeldk?=
 =?utf-8?B?dlo2aXpoRnkxaFRsVGpsai9ZOUxIaXVicjlMNm5rRFRxY1pJRm05bWNhdHB0?=
 =?utf-8?B?eE5maWhvWXZZNjlZSXdVTG9aa2Fka3J4OU5uQTJRc1J5YmtRdDF0cENWUzhN?=
 =?utf-8?B?KzhJY0RjMGlNRE5LOHp2NGZnOXdYclc0TlBQcit2Ykp1YTl5cHJ6WC9WU0N5?=
 =?utf-8?B?eUF5QkNGZmg0RGhXSTF0V2lOZmZmUHBUOTNjdWkyU3A5WEk3LzB6U082WUZm?=
 =?utf-8?B?TXNQYUhiRkNvS3RPQ2pOd3BjU0t3cDc1SFdBdjJ3d2pTc2Y2dVpjT0NqTElo?=
 =?utf-8?B?bHNiaEZQVWdoS2NEZUt4MUNIMk9BdkI5c0hjQ3JUY3c4bVdEc24yVURuQnJD?=
 =?utf-8?B?cXBHTWEzZGYyVld2dUZaYUpDTXN5UDlXNlVWTVBTVzJwK1AvUkJWSkw2cEg5?=
 =?utf-8?B?WUZQZ0Z3QlRaWG15UStRNjJwQWZLbmZEK2hNYWJTVzgzcVJpSjliTXMyMUhS?=
 =?utf-8?B?S2d2b2sybS9kUmJUQngwUWhTTnpGVnVsL21URjN1TENXWWphdTUrSXV1c0w0?=
 =?utf-8?Q?57rka680RayHn6xN1fGEX7KXxESZZNKj7oNby?=
X-Exchange-RoutingPolicyChecked: 
	VgHLcLK8dr7yb0JIscaiUAXiOJUj/TF3yYyfPx/y6evWjr5dBkVBQI45F3D0yM0dhyVJ71qThOM42y/bTdlm4eBcpDPwu5vkC4xsIlRMiIJzV635v4u8KZghvpstGn5J5ddUQC9vZLXKAameyI/aVLd6k9FqxJvCHkhaWhPFUm3uK1jRoVm/ZHG+fEjwtWY/8t6wJI+F7TNlnrP+HaX6twDAc/7xELyNcdUSeMtl/b3+vyp4gdj5YRB4s7/t2Dhf+nfxrE8eeRTNfvtbjG0y+6BPkCAwdrm+G40yhsy9+CfL/lp2ZbUtIRXRYgPdEfUNSKKeY6DEuVrUgRTiKrSxnQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5365c564-3327-4e24-9418-08deed29ca84
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 04:28:08.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNbEQKtn5sA+GWLaSzQ/jGQWDKEUnD5oWZS4z9g0NJwfCOonx9uuGo7cAPjxlxjBn/oLfJv+hETLnd/TO2igKPa+JmwDFuuxJKfS0Ww5KQMKvmakyStmibOFoMw5GYQ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6715
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: IcJwwlTfGZpxapVQySPBGtXBz8CcPTaD
X-Authority-Analysis: v=2.4 cv=f594wuyM c=1 sm=1 tr=0 ts=6a69815f cx=c_pps
 a=wsTBi80DslKxnI1CMYi+3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=iUlhFbh2rbC_Z-zqM7EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAzMyBTYWx0ZWRfX/xPKoHZPplep
 Lbj35AlbfnZkYt6sgLbAdEMB4dIChvzBBxER+99dEVOfD5YzIf2VYQB18o1TlTwkayee1anJKvp
 +3HyApnBe/4OizwNHKqWozcctex0V5B+VmoFYA3Bc3nsPNjj2dx+
X-Proofpoint-GUID: tr7a2c_66f1Uj2QkOYw94Tw_tF7W7xGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAzMyBTYWx0ZWRfX1b1931LPhp0s
 mkpsx+zJ6rMni3C7IK0L43miT1x3F89uZbwMu3uYJwUI1L++Be2u5PU6f1ViJth7jdSkW1cOsI7
 /NIB3tdVvG0iImxQm4bSqGj+oiOA+ab5Wst+LZB87UJgJ62ElC1k5AmdvMDp69p6h7cQeFqHH2B
 5TEop4++OhdoIxYMADLiMzrH3J+dbzFz83vTNuWd0OjT7rP0V4aSF9/NBipyEG+Y5IKY/L1RCd0
 qcpEUDjHkBR3mjqTXDYKzaRBUUdaUmdO+Lt+8Infa9NJ8ljS0vY2jk7T+tdU2iKlo1aut4+Bz4p
 lHfITpxGtDwBHuREVNow+7k2mfBceOMBakFHa3Bmvk9rzJ0JD6e/1o0cXbxDw9PZEwO1pL2LSJD
 ZNSZ4qrODlLl+Z9ESk+0liubEmwXveE0Cs/a8key9mrUvQAkllOpiYbARnWHEHSjuZiOHwzOyGe
 oqcoDD02I53KVP/cqfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66T3rhkL601737
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 04:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242227


On 28-07-2026 13:18, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2026-07-24 at 20:51 -0700, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> [YOCTO #15808]
>>
>> Consolidate Rust source management across all Rust recipes (rust, carg=
o,
>> libstd-rs and their native/nativesdk variants) into a single shared
>> source tree using the work-shared pattern.
>>
>> Disk savings: a world build with multilibs enabled, together with
>> nativesdk-rust and nativesdk-cargo, now shares a single ~4.2 GB rustc-=
src
>> tree instead of maintaining up to 11 independent copies (~46.2 GB tota=
l).
>>
>> Performance (clean core-image-sato build, qemux86-64):
>>
>> Before: 68m53.507s
>> After:  65m46.159s
>> Improvement: 3m07.348s (~4.5%)
>>
>> New files:
>>
>> - rust-source.bb: A shared recipe that fetches, unpacks, and patches t=
he
>>    rustc source tree into ${TMPDIR}/work-shared/rust-source-${PV}-${PR=
}.
>>    All build/install/packaging tasks are disabled; this recipe exists =
solely
>>    to provide a single copy of the source. Inherits allarch/nopackages=
,
>>    excludes itself from rm_work, and is hidden from world builds.
>>    Also defines RUST_BUILD_ARCH locally since this recipe does not inh=
erit
>>    rust-common.bbclass but still needs the mapping for snapshot fetchi=
ng
>>    via rust-snapshot.inc.
>>
>> - common-source.inc: Included by consumer recipes (rust, cargo, libstd=
-rs)
>>    to disable their local do_fetch/do_unpack/do_patch tasks, clear SRC=
_URI,
>>    and add task dependencies on rust-source-${PV} for configure, licen=
sing,
>>    and SPDX generation. Also provides is_work_shared_spdx() override f=
or
>>    correct SPDX shared-workdir detection.
>>
>> Modified files:
>>
>> - rust-source.inc:
>>    - Replace RUST_VERSION with explicit MAJOR_VER/MINOR_VER/PATCH_VER =
and PV.
>>    - Set UNPACKDIR to the work-shared location so all consumers share =
one
>>      source tree via RUSTSRC and S.
>>
>> - rust_git.bb (renamed from rust_1.96.1.bb):
>>    - Add 'require common-source.inc' to use the shared source tree.
>>    - Set B =3D ${WORKDIR}/build to separate build artifacts from share=
d source.
>>    - Set CARGO_HOME =3D ${WORKDIR}/cargo_home to isolate cargo caching.
>>    - Set build-dir =3D "rust-build" in config.toml to distinguish Yoct=
o's build
>>      directory (B), which holds config.toml, from the bootstrap's own =
build
>>      output directory. Without this, bootstrap defaults to "build/" in=
side B,
>>      creating an ambiguous build/build/ nesting.
>>    - Use absolute ${S}/src/bootstrap/bootstrap.py path since cwd is no=
w B.
>>    - Update install functions to reference rust-build/ instead of buil=
d/.
>>    - Update do_test_compile to use absolute ${S}/src/tools/ path.
>>    - Change do_rust_setup_snapshot from 'after do_unpack' to depend on
>>      rust-source-${PV}:do_unpack (since local do_unpack is removed).
>>
>> - cargo_git.bb (renamed from cargo_1.96.1.bb):
>>    - Add 'require common-source.inc' to use the shared source tree.
>>    - Change do_cargo_setup_snapshot from 'after do_unpack' to depend o=
n
>>      rust-source-${PV}:do_unpack.
>>
>> - libstd-rs_git.bb (renamed from libstd-rs_1.96.1.bb):
>>    - Add 'require common-source.inc' to use the shared source tree.
>>
>> - rust-cross-canadian_git.bb (renamed from rust-cross-canadian_1.96.1.=
bb):
>>    - Rename only (version now comes from rust-source.inc via PV).
>>
>> - rust-common.bbclass:
>>    - Add a second --remap-path-prefix for ${TMPDIR}/work-shared so deb=
ug
>>      info from the shared source tree is correctly remapped.
>>    - Retain RUST_BUILD_ARCH definition so that consumer recipes (rust,=
 cargo,
>>      libstd-rs) which inherit this class can resolve snapshot director=
y names
>>      used by do_rust_setup_snapshot and do_cargo_setup_snapshot.
>>
>> - lib/oeqa/selftest/cases/rust.py:
>>    - Adapt the selftest to the build-dir/source-dir split: use B for b=
uild
>>      artifacts and RUSTSRC for source paths.
>>    - Update remote-test-server copy path from build/ to rust-build/.
>>    - Pass --build-dir and --config explicitly to bootstrap.py.
>>
>> - conf/distro/include/maintainers.inc:
>>    - Add maintainer entry for the new rust-source recipe.
>>
>> License-Update: recipe file renames only, no license change
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/classes-recipe/rust-common.bbclass       |=C2=A0 4 +-
>>   meta/conf/distro/include/maintainers.inc      |=C2=A0 1 +
>>   meta/lib/oeqa/selftest/cases/rust.py          |=C2=A0 9 ++-
>>   .../rust/{cargo_1.96.1.bb =3D> cargo_git.bb}=C2=A0=C2=A0=C2=A0 |=C2=A0=
 8 ++-
>>   meta/recipes-devtools/rust/common-source.inc  | 28 ++++++++++
>>   .../{libstd-rs_1.96.1.bb =3D> libstd-rs_git.bb} |=C2=A0 4 ++
>>   ...n_1.96.1.bb =3D> rust-cross-canadian_git.bb} |=C2=A0 0
>>   meta/recipes-devtools/rust/rust-source.bb     | 56 +++++++++++++++++=
++
>>   meta/recipes-devtools/rust/rust-source.inc    | 16 +++++-
>>   .../rust/{rust_1.96.1.bb =3D> rust_git.bb}=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 31 +++++++---
>>   10 files changed, 140 insertions(+), 17 deletions(-)
>>   rename meta/recipes-devtools/rust/{cargo_1.96.1.bb =3D> cargo_git.bb=
} (91%)
>>   create mode 100644 meta/recipes-devtools/rust/common-source.inc
>>   rename meta/recipes-devtools/rust/{libstd-rs_1.96.1.bb =3D> libstd-r=
s_git.bb} (92%)
>>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.96.1.bb =3D=
> rust-cross-canadian_git.bb} (100%)
>>   create mode 100644 meta/recipes-devtools/rust/rust-source.bb
>>   rename meta/recipes-devtools/rust/{rust_1.96.1.bb =3D> rust_git.bb} =
(93%)
> In the patch review call we noted that "_git" isn't accurate as these
> are version'd recipes, not git based. There was a suggestion to just
> remove that piece but without the versions, it would make it harder to
> have multiple rust versions in parallel should that be needed. This is
> why the gcc recipes retain a version in the filenames.
>
> Our suggestion would be to have rust match what gcc does for those two
> reasons.
>
> Otherwise with the LICENSE bracket fix, we think is is probably ready
> to merge. The space savings are nice to have!
>
> Cheers,
>
> Richard
Hi Richard,

Thanks for the review feedback!

Makes sense I'll rename the recipes to include the version in the=20
filename, matching the gcc convention.
Also get the LICENSE bracket fix in. Will send a new version shortly.

Regards,
Deepesh

