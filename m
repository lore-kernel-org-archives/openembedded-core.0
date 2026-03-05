Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A60F3D32C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 16:24:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48184.1772727832004867417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 08:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m2ezQbUe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7524ec9ed4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6255IgDr2286680
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 16:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=AGFuSNlciRC0fHVLewH0lD
	NgYsdHkOVCmrgrYnUGhs0=; b=m2ezQbUeB6jMYl8XKvjVZZm0dlEvl6YKpPUMUx
	MVxKtsokjWNLLX+uJQadaRqOrXS7Gq9uyhWWHfRJE3q7UN88TyqOTE5PGByVvgcT
	Cjz4zwE+UPp4No8zBzPxkWTbTTRhtWKMoKffXwU5q6yM2fZw6AWox8DHEraoR2Aj
	WaSXsiLjQH9iURimIo3IcPDnsOZ2vvdmE6/ixq8+rcCCnJL6gMq5PLs7Ni50r+YM
	365acuQCPEefMjKB2t5MXQAPj9tNR4auvwVhX7wxv9X6g6GfdTIfVf95GOhDlHGa
	eBSpDmujQyGt1ohDPupHfABZCtDfhTMpcKpd6gbos2JDTKnQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4pmqn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 16:23:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFMs6JuWeAJv9k62BzYBLiwzxJe4InOMofy/sSkOBapbGFZ8Aadu5DkF1sjygvc7Bqu09/dHS6P4zK9yLl+3I3mgrW8s1ipUGy86u8ktiCdtwCTw6JLiK/PmRAriTDr7zQsc3DRYxePFLgXqsFZcPywRADM34T6f+Ql3Zujr34RDTPMkXaW9FrqL/+ziRvkV+lrL1Lu2jsr7ma/RpMqr7Iq7Mk1UC4gL87GX3xdc3QInFYLLegPblmtKJZiFYYopbSzrMoARnLj2Ih8ghsUWK0eUIbCvMvBwIcG/tmWzGQO0OxvMS0qwRYADBSaMPdKLPpi4Eq5sOaf+BLHSSYNnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGFuSNlciRC0fHVLewH0lDNgYsdHkOVCmrgrYnUGhs0=;
 b=u4/gfDonOsL3nDH+SoERz8FrHpsGA/rO/UfFwfqrkfbcIgUicBoessxYeTxc11PQuiFpZa+ahSMbuU+QTNPPuzZlnAo92o7YTsbu9o0htcNXH2j+rovOlOChytNpvcTPCJRhldB42fc8IrepweyuSfr+zmo3f0sYieCsKrQauaPsKelaRNLPaGUJqMKezIBwBWV8hDIAsNht7q81Au/4r9/fisvimfJ99e98ZHU6OSmpBndhXqO58S1Bb84y2sZzRGtKgn9ueT9dxD3cTgdbXBIoS54HizNnEQKkDJNrqJ3VP1yolkDtNHeiPOXihCA4gwW/pjBRwiCPRCCwsDmBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Thu, 5 Mar
 2026 16:23:47 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 16:23:46 +0000
Content-Type: multipart/alternative;
 boundary="------------xq7stl4fWtMNazT7MBXbvFhi"
Message-ID: <25b7aea3-e05c-4378-95b7-ad269a4ee93d@windriver.com>
Date: Thu, 5 Mar 2026 11:23:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
To: mathieu.dubois-briand@bootlin.com, raj.khem@gmail.com,
        openembedded-core@lists.openembedded.org
References: <20260127053941.792825-1-raj.khem@gmail.com>
 <DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com>
Content-Language: en-CA
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com>
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 346dfa5f-d9b5-496d-29db-08de7ad39377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	Vno+7yRFcxzaOhilGrU17zF9j1Fm6mXrFEarooYnJZEtNXqxRAWs+NH3m8A34fdVL9SWwhfaQB/M9UUwCyJiA3ldwbMTlrZzu8SXCj0sB/eOMYSj+om/s0nwD9OPeGPRretZkWn1Mu4JfCeVGsK3crmz8uSaCsu4ZIFuKOa2/SaynZMChFnTb5u0S7J/FZ4hoLpUjcVlRK6Nf3x2E/kmmco7g6bYLfs1tw9YrJ6jKvzmY3EDvgwBrHSZU4uMMiNdjN8G+RiTQdfBGZ/CQxnorscFmaWL9A1KawV9yYKNbbjeNrM8jgfEzhFA/7mR9HPp9Fmv9YYqlmA0GdkGxlLRimZV7ekNs7N0lbybe3SyJnsHoDU3wWyI+LrfhhmEol9vnhgY+dO8rd+0SH1wr+I/3PuGjN2SuznFvrJqUGqPIFNaChJmF/xW5dGtykowGbMqGuImRZyF0nEj3Ac1aAWMC+zcpXuVOF7q7Wc/0hDT8wgZtWYQU+HNZ02HPRh5gAa52b5ZFA4HNAHd7h+5GxNxwFFdNsG7Bn3x4IAMcZFpTitFfRE4ts1OaWpTSXoua2uzwenFqlnC9l5F6b/qfPif79h9R6Uw9AdIFsCt+WKScec7KhFGuzqm+L0nl6piaksEeo8PlxZg4fY9tNCJVhlO5ngdY5cxcqQNLdpjoCEeisnQ5CBxhqIvKQhIosjvAyCJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTR6emN3a01lSU5iR01zVXpERm9qN3JHRWxVbVBXZ0ZvamNDbE8xUlVUOWdV?=
 =?utf-8?B?Qjh6TDEzWkpScFBrS2dwMHZmeU91U0dwZXpzRjBRWCt3YWZwOUlwYVVVdXpX?=
 =?utf-8?B?aWpOeWRVRG9QM0lGREY2eW5xVmlhTzJQazJMSHlWSWx4cGtFaEI5a0U4WVBD?=
 =?utf-8?B?UnFadzBRR0JCWGlnVEZlbjNEd3cvaGltbW83UVR0S0VOVW5MOStmTUxkaU9D?=
 =?utf-8?B?dHlZT2JEaUJ4V1dqb1pvZmV3WEVFQ3BxbWxRMCtEMW5TZ1lhZ0JYQkhGQVJD?=
 =?utf-8?B?aUR5bTlsQ1pEMjcwbTk4VWlRVDBscG96aVZUWWdvQmpZdFQzeDRqK0Z3Zm9v?=
 =?utf-8?B?VERhV0dwOGRZY0hnUEpoVVB0Y3NJbGFWbjRMS1MvWDZiUlJDUG9pMVlFY3or?=
 =?utf-8?B?OGtTTVFLbkhIQUxwWXRQekNRMDFNWmpMU0hPZStZVzcvOExOdld5NjVCZUF5?=
 =?utf-8?B?bFRVZVd5SUlqNXM2TlMvUjlCU0thckFEaC9vTHkyY3Rzc2FsbjJRd3IrTWJy?=
 =?utf-8?B?TXVGQmpyV1dlYTVnQk5JcVUzMldPRW96MjhnRUZXb1doakpQaXdKeS9RM0NI?=
 =?utf-8?B?c0l1K1lpY1Y1aXE5b1lkZ2NSZENieFY5K0hqazRXUWpWWUswdFVmQzhtRG9v?=
 =?utf-8?B?dFpwV3JxanNtZUs5R24zRzEzYTBHY2lSWWd4eENYQ1hhOWord3VZVVp6a25n?=
 =?utf-8?B?OTdmRElFU3IvWUhZNGVBdmRVcS9BNmYzWm80QXYrcDBEWXEyR1g2K09kUmFV?=
 =?utf-8?B?elJ2bzc0MkNDSHpmRDdOL21RczFzb2JDSllpOHJHNkNjelRIdTBGanI2UUs4?=
 =?utf-8?B?UzRVemp0TCtwNmZrUVZTM05PYkxhTWxKM0VGUzI5NzR2QjNlUWorcUdTdkJz?=
 =?utf-8?B?VzdMUGRxcHNxLzdLSVhtTnd6cmpVelUwb3BrY3lWb3V3THBOdk54Y1hvQTRX?=
 =?utf-8?B?RCtuWHV1T3pERU1QcS9EUENvbFBmQk1scWJJUUs2c0trMzNkZS9XQ2dzZ0o0?=
 =?utf-8?B?TW9hOTRWeEl3aGV5Skh0M09jU2N5L29hekE1WFlId3ZGeVZ0a2E4MkZBb3VI?=
 =?utf-8?B?WHlWalNxVWFBTE44bU9jYlc3NUVleEd6TUtxdEt5eFNvTXZwRzVMaE1LQ1R2?=
 =?utf-8?B?WUJHNktGSHBKeVlHdHlqamJtMkRwVmNiNUEzekJTWW1oZzZ1Rm9peFRrK2xV?=
 =?utf-8?B?SWNtRjBReXNMU09UQ1ZhUjdmRDY3WUE1akZnZzlBbkFRUG15SzlOZHhaTmtl?=
 =?utf-8?B?cjllU2Zxb09wQVRzcGtTblRmMjZDbS9BcjByVHVhRHlJaWR5ck1aY3UzZjZy?=
 =?utf-8?B?K1ZWblhGakNNeXAyWnJjZkxpSkppOTAyOFVQbjFRUHhmTlM0WnFzeWZySk53?=
 =?utf-8?B?Z3JiUDJ6c1RURzgwQjZEaEc3UDBLUXlTd1NCUENHSXR6Yi9sREJjaTdNZkNK?=
 =?utf-8?B?cnpmejQ4RWlHbVU3QkVOTDQxVzhGOXBlK3Jkc2tKaENwSUFkbTc5MXdUTjhx?=
 =?utf-8?B?cjQ2eGhTcTJCbFBORmJrYk9jRnliNDRlSHB4aGN4Nm1EdUlta1NSOXdudUtG?=
 =?utf-8?B?bDdDTzN6UjM4YTR4UVBCT21KaFFKV25GUjVuMDRpNVdTcVZnTFVxaTJKSHZW?=
 =?utf-8?B?MWszK080NHRjcTBFNWFXOTBXYWJMNVdRcmNMNEY1Q1JSOURabUdFYzVkQUNj?=
 =?utf-8?B?bStxTmxGRVNQbWRNbXJiTmhUMHErdWtnc0pIWXBqUHQ4bG5pZDV5bVppSklv?=
 =?utf-8?B?cDdGR01KbDZrT2xuL2JnWjlMdy8zbHRlMHhZWkpSekpMZXg5RTNkQytyRkdO?=
 =?utf-8?B?RURwUDRlLzBNdGMreWxYZVArN1V3UDU1aWJaYlVYL1didzd1RGJiekorN0F2?=
 =?utf-8?B?QUN2M2VJQnhuOU92dlk1aTRtbjB5SFRBMzRyL1puM2tuKy9MSk1WQ1IzcC9o?=
 =?utf-8?B?cWlObnFVQ2dRSGQveEJPMkN0Z2Z1ejYxZTZtQzlQQ3NnUUttSmI5ZFB3d28w?=
 =?utf-8?B?aCtuamJ6OWpLZnVjbUk1bXcxOS9hOEdjaWZFU2Jlc2NiWmRHT0M0VDlSV2RQ?=
 =?utf-8?B?LytmeVJ1YVZ6Ry9pYzltQWJROXR1Mmc1ZkxZbU9wQk9wdGxUTC96T2g4VmVv?=
 =?utf-8?B?T25IVmMxTDVnUUxlbnZmZEJ4dmtnSjQyOE5tTDVRUWhsNSszQksyZWJwNjJt?=
 =?utf-8?B?a3gxdnFhc283aUtHaHJ0eHdFZkw2c1Fsc2F1TG51VjFjUHRVMzZ3bk04TEF0?=
 =?utf-8?B?L2tKd0FSYlk1Z291NjZYS3Q1MGVzNjEwNVQvcUZVcDBiWmF0RXR0Yk5ReVVs?=
 =?utf-8?B?RFVRTjZTSmJyRjRSRVhSRWpPMVZoRHdxK3Jjak9PWkdNQjI4UFFOa2FSMnp3?=
 =?utf-8?Q?dKRTRWkV1yl9ZYMg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346dfa5f-d9b5-496d-29db-08de7ad39377
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 16:23:46.7477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNXIT87yCtuKQeua0BlFt4bMvwMzj5HcDq/LzKGdQHG/9ADfLFQw3cHmVhLe7wyQUkFmzvvoo+u5FKPL7UH16dbTyUytsMfICmpavHAVAIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a9ae16 cx=c_pps
 a=qHyJGWWDR7+eWeZXJqH6eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=CCpqsmhAAAAA:8
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=2jZ9k3shqQJl4RDxApUA:9 a=QEXdDO2ut3YA:10 a=P-IC7800AAAA:8
 a=VC7d0rx7RHSbbP7T_QYA:9 a=vc3QtQYIs7eSYN0g:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=ul9cdbp4aOFLsgKbc677:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Iaj-qh-6-5Fcn0wvQNfiU207ZJd6m04q
X-Proofpoint-ORIG-GUID: C3SR7-IaYkNjjnU7YQs_Wewm9A-uOBKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEzMyBTYWx0ZWRfX7iyRoP1c6KKy
 0xkd4xj/SAKN+iJhRvsUVqS1ME8WbAJbeC230vkYtFZcXG8bxuk5PQ2zln3CbIu2d5p09a8gvyj
 RlaTg6LEdN8qpzzFi1tOxRBHscHRRy7znH0MJE06AtTjTD+mHdxxvbC8zkWZPPNlUtCojdb9ZVH
 mzTQHft4RZbldxm2HhpHd128NJP0g3mN2STNllV0cuLk99Dg+XINoyRoYsYjVU0mojFawnSd2sW
 Sg5z46xXGohoX/EPSFGA/5SE3sRFd6AiRnjH6181ror9QspnDwpW8qeRFKgWrRXP2cYntxQuP3p
 J+0v4M8cW3TA35V7XkJvf10L+mLc9DcEWL+mE+M4E/obv9705TP/bQPGkscxpm+VVgDCH5bqDKN
 kOjD4moAmS3TlWdoANJAsw3bTwsYW2h3X9K7oELwASk8eoqO9sFj32YjrgLglU0dKA8YrG5fmcg
 Dx92rXVgzj+FVftMixw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 16:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232501

--------------xq7stl4fWtMNazT7MBXbvFhi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-02-23 4:01 a.m., Mathieu Dubois-Briand via 
lists.openembedded.org wrote:
> On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via lists.openembedded.org wrote:
>> License-Update: Match to changes [1]
>>
>> Added free_sized, free_aligned_sized, memset_explicit, memalignment, and new time bases (TIME_MONOTONIC, etc.).
>>
>> Support for the Linux mseal system call to protect memory mappings (sealing).
>>
>> Added support for the openat2 system call, allowing more granular file opening options.
>>
>> New, optimized, and correctly rounded functions from the CORE-MATH project (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
>>
>> Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by updating ldbl-96 implementation.
>>
>> Improved remainder, frexp, and frexpl.
>>
>> Experimental Clang Support: Added support for building with LLVM Clang (version 18+) on AArch64/x86_64 Linux.
>>
>> New CPU Detection: Enhanced detection for newer CPU architectures.
>>
>> 64-bit atomics for 32bit x86 patch is no longer required since upstrea has dropped this logic in 2.43 release
>>
>> [1]https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
> Hi Khem,
>
> I have some build issue with this patch. Yet I had some merge
> conflicts, so maybe my resolutions were not correct.
>
> ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864' failed with exit code 1
> ...
> | /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared/gcc-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
> |   330 |               char *q = strchr (p + 1, '}');
> |       |                         ^~~~~~
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3240
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3229
>
> The branch that was tested if you want to check:https://git.yoctoproject.org/poky-ci-archive/tag/?h=oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3260
>
> Thanks,
> Mathieu


Khem,

Will you send a new version of this patch or should Deepesh do that ?
We need this ASAP.

../Randy

>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231659):https://lists.openembedded.org/g/openembedded-core/message/231659
> Mute This Topic:https://lists.openembedded.org/mt/117484328/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------xq7stl4fWtMNazT7MBXbvFhi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-02-23 4:01 a.m., Mathieu
      Dubois-Briand via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com">
      <pre wrap="" class="moz-quote-pre">On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">License-Update: Match to changes [1]

Added free_sized, free_aligned_sized, memset_explicit, memalignment, and new time bases (TIME_MONOTONIC, etc.).

Support for the Linux mseal system call to protect memory mappings (sealing).

Added support for the openat2 system call, allowing more granular file opening options.

New, optimized, and correctly rounded functions from the CORE-MATH project (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).

Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by updating ldbl-96 implementation.

Improved remainder, frexp, and frexpl.

Experimental Clang Support: Added support for building with LLVM Clang (version 18+) on AArch64/x86_64 Linux.

New CPU Detection: Enhanced detection for newer CPU architectures.

64-bit atomics for 32bit x86 patch is no longer required since upstrea has dropped this logic in 2.43 release

[1] <a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe">https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Hi Khem,

I have some build issue with this patch. Yet I had some merge
conflicts, so maybe my resolutions were not correct.

ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared/gcc-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
|   330 |               char *q = strchr (p + 1, '}');
|       |                         ^~~~~~

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3240">https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3240</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3229">https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3229</a>

The branch that was tested if you want to check: <a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-ci-archive/tag/?h=oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3260">https://git.yoctoproject.org/poky-ci-archive/tag/?h=oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3260</a>

Thanks,
Mathieu</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Khem,&nbsp;</p>
    <p>Will you send a new version of this patch or should Deepesh do
      that ?<br>
      We need this ASAP.</p>
    <p>../Randy</p>
    <blockquote type="cite" cite="mid:DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#231659): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/231659">https://lists.openembedded.org/g/openembedded-core/message/231659</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117484328/3616765">https://lists.openembedded.org/mt/117484328/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------xq7stl4fWtMNazT7MBXbvFhi--

