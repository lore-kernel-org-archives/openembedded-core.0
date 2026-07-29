Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E26C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 04:47:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4472.1785300459860062337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 21:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cgJGioRH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26709619c3=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4gsbQ687273
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 21:47:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=kpln9eYXxttDwPGe/U9eD31HovBcROBnDH9c2FEfPB0=; b=
	cgJGioRH4NxHkSLx10Rkm9B7rKgGlzTgQ6rrN1l7DvMFqDaFNWYOvRqkQu+KP7Ue
	Ag3hs37t4Or6nMXjiQeJp1EAvFrNfY9fjU5fkdPjIoa8ZROmOlg7pZAgFVS7ubZk
	kYejs2e5b+x0dSKCyn/gg2ESqWUpsG9r9c38lt4XAa+lmTXPfK//BZvHa/Y7s6QG
	3ZUp3xWxfDnk8H76FicU+YMEivkSLA0gFSUETxaZVDTkvHLVg5Nye03yMHsAyMvR
	ETwtPSvRhdSk6tw467u5gNg2jD5MYH8o04taqGEpF6yBF+jIaVJKMfff3c4WNItL
	eqNNl3dphgO8oMxwwzyJ+A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fq86nr5bw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 21:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8GM8sleiG9elHSl6hL7/oduYmv2Y9qG5OJY2/arLpT7tA57mv/w9ZVYIlra/v2yaXckyt/soVYxPYayitV5y3IRoUyhEREuvW/Q3+eCkHeM+J+vYfLKCqvWZpXDmW+sxgFD1899X0wdTuxhrMmmtbNm7mEDjdKtvvPp2XfoHpGOqmW4n98PRS32sgcGOn9h14N1CyCSRL1H2s51NaUwEyjsAHyjUl2ksxs5a83viZsawndtWWS7rMw+TRrU0+ORUCicvWXaKoGfx4GveiWN6nituWJeOyhdOe3lIGEG7UWjBFjY331wzoATJc5TSVRsjqotF1kgnDKnWfGh0vTNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpln9eYXxttDwPGe/U9eD31HovBcROBnDH9c2FEfPB0=;
 b=OYx7Z32lFTT58mI3iX2/2GpkyE4P39taore758uGoAlkGGPg8aAE65z9RQxlZ5AVLylmnt2vyXFKGSIagBMjOJDPOMNu+51iyEaVXUmDjq+rYW7FX34GbGTxm2F+qNFdXP3kBunMBK9N4Sb0/kOEWoyKfdVTlqDnk0nZl6m6R5BCHbWnqk0ubx0e9U0BmLaJljTCv0SFrctt/1HBa8ZnR3ozQUPigyfCpU60sahBJHAZvtxImQvboCDpCXkxePdwKIMlXyNBlGetDqseLCGc4vBH81q81E3AIn0/j9bbjhIJ24VkKoRECa3b5W/UCpVouWydNQxErAIftJig6g8GAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 04:47:33 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 04:47:33 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v4 2/3] rust: refactor source handling into a shared work-shared recipe
Date: Tue, 28 Jul 2026 21:47:12 -0700
Message-ID: <20260729044714.1239545-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729044714.1239545-1-Deepesh.Varatharajan@windriver.com>
References: <20260729044714.1239545-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BN1PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:408:e0::27) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 1748c964-e3d4-4ff3-823d-08deed2c80c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|23010399003|366016|376014|18002099003|22082099003|5023799004|10067099003|56012099006|11063799006|3023799007|6133799003|12006099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Afy83lidgrotAqP6PhhOZ6Y+MYjYIy9XcM4UCoZcNojcCSnU29MMoUqFbj0BxY3DqqY6nW7xuB4/5uArci2axjn+NUKEtCuLVKLypJSwQHo2ttxfQPajngBJudQlNKrKnHBCD33YJc2g6jldhrfoOuLJpOcYPgl0ruF168v5RFGZQIHhn6Nkk0V3slNmscMVBcCkAVbk3g95kOfUJtycS0/eEGFjH6rycB5Qr6QTU7E2voEQ1jRRb8VjyHCQ7v8pgiIxikdk3lk5j/BP9cRJtTzWb3j0/23pZNO7i7mg3ud/gERTKCUx+LQNIc8MGBozWxfHNokX+Zni7rzuJ1xajt/4MsjQIOUHmf67R1fZXwy3P2NbVQ5GcgaulyDo8j0R8js0k1/f7IIN0HTtRBZgeQMd5HzNbTiu5WcLYVDgOyrZKBMfFF8Nsvb+xNZ8W1sZ4op78CSWX0LRgcgwXJCaVRs/9DyFOMEbHC8zE9tFQNhUcP8tx1mKQH4mMOnm+dhzTtAby7L+3L6B9YyYu84QmJIAHl0Tv4wVRPo2KKLaZrexqgJN31wXakzaBLCxkjcm1QvQSh593BRkQgxpR/QGCaoJmGhRUPvTQLrpQq7TUnEBe3omQjjuHJ7T2uTePpCV3hy/Pz4ObTUEC0jwGPMl9ejdGB971mVnpk4KNZ+l7fI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(5023799004)(10067099003)(56012099006)(11063799006)(3023799007)(6133799003)(12006099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGxSbkNBaDFadUtGU1dSQTFxL044aVpCb0tVdW1xdXdhZmwvQXNaejJySlJa?=
 =?utf-8?B?Ym9wdVZoMjNSRmhPaTNoRURzSzN1UnJCOGt0N1NmUFdOU2ExNXpFanhhTGVv?=
 =?utf-8?B?Q2ZQL2p0akZ2WFZXMTJjSEhERlp2aWlyYVdUVkxQc1BKVElxRlF4cXBWRjdG?=
 =?utf-8?B?T1NJZFNDTWM1VlZ5a2h4YUo3SEtoSUdvYW00YTZqM2s5V1laeHpNbEw4SGhO?=
 =?utf-8?B?aDNEODFvUFZFRTg2RW5USFpLVzI1dWFrdWZ3OW1VOXhrVityUHBYeG1xUXpT?=
 =?utf-8?B?M0ZuRHRVQ1RzcFpwQmlrYXlzaTdPeWcxZGVvTVFwaGU3bFRwVGV0SXFmQkJ4?=
 =?utf-8?B?bWhSZGwrWHFaUmRyNFNmcXF2Sjc0cWRleUtjKzBJb1YweGRoMDEwYVZCQ1RY?=
 =?utf-8?B?Y1RiUGV6aXV0VEpLR2lHNGtJN2NLSTRXN2NlN2tzOTYzL1A0NGRIaUkwbkM0?=
 =?utf-8?B?UmM2NXJDLzN5a2k2bEdTOUxVd0Q3TDhCNUVmTDh3WGhTZ2NvTE0xL2JNdEF5?=
 =?utf-8?B?KzlVSU5pN0FHUXJSeldSZlQyL0ZjNU5QamlTeVhOOXRRV1BWclZxRzJjSzBY?=
 =?utf-8?B?QldNSXRwcUFIZzAwQkcwMzJ2MFo2VnR6NEwrdytmY0d4Z09uYnFBM2R2WTNR?=
 =?utf-8?B?cWp5N1ZxbHRSbmN6RWhXOGhablBWWEtEUXhHTE5VT08xMWphejh3ZDM4ODhE?=
 =?utf-8?B?NzI0Y0ZMNlhzR3d6elRKWmdHdXI4NUVFMUQzR09qVFhxaVRodUQwR3pGenM0?=
 =?utf-8?B?RXd1aERTdWtRcHRPazBVSXIybHJyMzgwYThtYlFmT1ordW44U0NhUDNZdXhJ?=
 =?utf-8?B?VmVnWGI3dXZYeU5JQmhadDk5eG9YRzU4KzNWWUQzc2szRTZ4QzlnQTZlNjNt?=
 =?utf-8?B?QnkrSjZ0R0kzRzZ0ejczdmFFbHhmNEEzVmxYQmVNMk55ODhGbGtBeTJuRWEw?=
 =?utf-8?B?NkRtTFFwRnB2L2RKZnRRY0loSHUzK2wxcDRQNUVmWk9DaXdYcjRUelUwSmQr?=
 =?utf-8?B?U210bHhPUEJac3lBS2FzbG9IZDB1Y3dUZ0hRRUFGTU1HNEtMRzJpOWYvVHcx?=
 =?utf-8?B?bjNBWS9qbEVJV0wrRTBxbkJNYTMvQWpBZTBLUnNiWnJZcitjRG81TU0waE1Z?=
 =?utf-8?B?ZjNuMXREcStKc0xmOW5TQWJiNjFkTE9PR2pFUG9hRGdXWXJjTTlvQXFpYVlS?=
 =?utf-8?B?YUF6dlg4enl0WTZVUEM5Z3QxUi9LN0REaUpialRqZERqVS9ET0pVQmJmc2Y0?=
 =?utf-8?B?RWdzVm9vR1pmdWhNeEozR3o4UzVOdHpzbWo2dWN6cm1wdDZYdHE3L1ZPdy9V?=
 =?utf-8?B?LzNGRjJlTHhFbnpvakdNRjVEdFFVVHVtRFZsSWgwRFExYmxjd0pqZGo1MFdr?=
 =?utf-8?B?Q0dIL3FuTXN2VHowTjc5RVM5Skh4cUFzU1NZSWl2alllcnMzbCtRRGsrR2dI?=
 =?utf-8?B?ZHd0OXlxTXFtcnhuamlhRS8vWlRjSVY1eHNnRksxVzVMSGN6UVBkYkg4UmNG?=
 =?utf-8?B?VHJqSC9QY2QxTnBzK3Q0M2p4aVZWU0hwVXdyTzlaYjB3WmdDZFR4ZjlMLzRj?=
 =?utf-8?B?ajhLQkJKejk2bUN6ZkJ6VHlFOTh0SFk1WFZqTEthYXpSWXg5dnlxMDBNSnlO?=
 =?utf-8?B?bGFTb3JLQVBnWXFIazM5UG42bWdPelk0UmV4MTlRMVJlRGN1OXdCUkdwcEd3?=
 =?utf-8?B?aWpSejFLMmIzakJiYUl5R1hGUnN0UmplUXJyak5kOCs0U3piL1pNUVJibzY2?=
 =?utf-8?B?Y1lCbldwcHl3SWpYenJzanlUK1lPZ2FGSG1LM3dtbHA1b3BrVEs0ZkQzQk1O?=
 =?utf-8?B?ZUt5YmdtS1ZSM044TVZJc0VhaTMydzBJakhycFgvdnVNNXFnVkFTUG5LbzBn?=
 =?utf-8?B?bTh5bGFBdHRPdmhyR1BHdXRGcXlwU3h6ano5TGpCZGNkMzdEVVpZa2l0VTQ1?=
 =?utf-8?B?bTBzcXV3WVg3c2hkMmdJRWZ4K1BvOUQ0alZxcWtpYitxWC9Wd05BQTdkTGpl?=
 =?utf-8?B?Q0V0dFVOb2h1U3h4eEpKZUNoNmdRQTlhTzQ1NE9ab3Fab3pRTEl6eWVwbEsy?=
 =?utf-8?B?NzUxQWI1bFpUUE9Mb3EzaU1HYk5RYVN1U2ZBcHkrMnBHMG5Pbmd5RTdwend0?=
 =?utf-8?B?RUFUWVpQR0xlQkFuaFZ1OThtVWQ2Z1ZCcXBZR3dnTjlDRUx3Q3JhUkVvR2Nw?=
 =?utf-8?B?MDhvRjZ4TUIrMXE4SWxOVjgxWlBXQ0hhcHBoRGtjOWU5KzlJejV3SkRoUXhI?=
 =?utf-8?B?YWRZQU1YU1VJQVE0eTEya0tVOW43L3lxdnQzeHZUdi9XblFOdURFelB0dTJn?=
 =?utf-8?B?Y2tYalZ6aU1CU0ZuT01OeWZlZEhZZGppL2tXMXRVNFlmazl5SWl0cnhHOFdh?=
 =?utf-8?Q?jlEMDFPFezydEFeCf71OSlPzUZc+Fx92esWal?=
X-Exchange-RoutingPolicyChecked: 
	nsXXCOPnrBp/klxwYex0Cc0AGesRiNq3rt0VRqpnFYgVxrPNjhPj4VIi1/vLuNngomIXj1d0PiAggrjQ3lqny6ZoDyiHXaXtDhayNvt20csZIuagqQDPO/DZv72olfIQNQJI57Dy/FH89uremNs9QCbq15nlF0NTsLObtw9IhdocMKXDky7PLO/zDS5YVCDtc97sDrlwImA92ERlNzUz3LCQXtnJ3h8Hapy6g9W73rERz7fhXbLOW+2c/o4fHeW7QSVMayWlFXwwKUaqHkk+fGCFA910P32fCdCj7vegRg8jxrpdl1qwBHBPIJfb+XbYFOUC1w8Ne2Ai+BgUVFviLw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1748c964-e3d4-4ff3-823d-08deed2c80c9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 04:47:32.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgDrI6HKuVR0Ol42KvNK4Yo8kJCGu/UU7J8eVYVKOU+1W2+n+YthHQkMYrskFq2Ob1/DInLke9VZkDbiw2b+pGw58vvpdYbaMWlzvIUgDv2HScC4mp5WVADgx2OnX6z0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: l3-kCTEb4m33mQPMg8lrxF5OFKecVwLy
X-Authority-Analysis: v=2.4 cv=f594wuyM c=1 sm=1 tr=0 ts=6a6985ea cx=c_pps
 a=1HqfSBmQQ8HGCHze6/9uFg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=8wEic9LhAAAA:8 a=ag1SF4gXAAAA:8 a=CofITuVKK-SS19HQx1UA:9
 a=4vBCUijPwtmRX65I:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAzNiBTYWx0ZWRfX5ZLjg7e5vpDh
 rTIEV+wwOBDqrDHSbPm0E4ijCeT9Q86Lj6LXU1u7e0qvdm7HTDkM/Np1ltC6DsjDTrq0FcMPFd7
 UJIQ+AxicoHWXgo23jWy2N6A1WRsXlwLALO7uSUheQcr9K1Oel0q
X-Proofpoint-GUID: GASg-BarWim9qsYaeBcz8q_s8abz7WQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAzNiBTYWx0ZWRfX1x1+04q8FaXn
 F81IPDgqrRsf8Q4ifHrkf4XXf2ZIQLbUla4JrTFedHohk2DjqOSgYSuM95vBNjsHIBQXiKYBqML
 +sWvxx55NfDyW1TQu/0ECcIAOhUBx9/vgBrrdPbplPdcYiSY7nHZdQGHfyNVN5DVGugqt8pidE8
 pdvMydK49lDDZtHRiFQv67kKM0z8jr2F7bf115Mtyd0eDVyyTWsWT5UvUVpz7d9BmcArCr3r0ku
 ix1gnTPoYsP51g6hYKHzgdBAoXje62OwWaFiu3C1PXtS3cVAHeVleVUiLWeLBqnE75ABCII4Fmk
 udyEiwT8Scg+5aSI4bzMSP4hI7GlqzYZpjeRJuyZuAAlgSYIDbxT4wCbhXQTXe24bgShC/rLxMt
 TavzKbnjP46WShKptEIXDm6SiZM7CvwR9zDoi8BVuSANEVmKlDiSOaIUZo8n/HzrRqwkt2r+hjx
 g+tSU7pDQIj4Y18s2Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290036
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66T4gsbQ687273
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 04:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242230

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

[YOCTO #15808]

Consolidate Rust source management across all Rust recipes (rust, cargo,
libstd-rs and their native/nativesdk variants) into a single shared
source tree using the work-shared pattern.

Disk savings: a world build with multilibs enabled, together with
nativesdk-rust and nativesdk-cargo, now shares a single ~4.2 GB rustc-src
tree instead of maintaining up to 11 independent copies (~46.2 GB total).

Performance (clean core-image-sato build, qemux86-64):

Before: 68m53.507s
After:  65m46.159s
Improvement: 3m07.348s (~4.5%)

New files:

- rust-source_1.96.1.bb: A shared recipe that fetches, unpacks, and patch=
es
  the rustc source tree into ${TMPDIR}/work-shared/rust-source-${PV}-${PR=
}.
  All build/install/packaging tasks are disabled; this recipe exists sole=
ly
  to provide a single copy of the source. Inherits allarch/nopackages,
  excludes itself from rm_work, and is hidden from world builds.
  Also defines RUST_BUILD_ARCH locally since this recipe does not inherit
  rust-common.bbclass but still needs the mapping for snapshot fetching
  via rust-snapshot.inc.

- common-source.inc: Included by consumer recipes (rust, cargo, libstd-rs=
)
  to disable their local do_fetch/do_unpack/do_patch tasks, clear SRC_URI=
,
  and add task dependencies on rust-source-${PV} for configure, licensing=
,
  and SPDX generation. Also provides is_work_shared_spdx() override for
  correct SPDX shared-workdir detection.

Modified files:

- rust-source.inc:
  - Set UNPACKDIR to the work-shared location so all consumers share one
    source tree via RUSTSRC and S.

- rust_1.96.1.bb:
  - Add 'require common-source.inc' to use the shared source tree.
  - Set B =3D ${WORKDIR}/build to separate build artifacts from shared so=
urce.
  - Set CARGO_HOME =3D ${WORKDIR}/cargo_home to isolate cargo caching.
  - Set build-dir =3D "rust-build" in config.toml to distinguish Yocto's =
build
    directory (B), which holds config.toml, from the bootstrap's own buil=
d
    output directory. Without this, bootstrap defaults to "build/" inside=
 B,
    creating an ambiguous build/build/ nesting.
  - Use absolute ${S}/src/bootstrap/bootstrap.py path since cwd is now B.
  - Update install functions to reference rust-build/ instead of build/.
  - Update do_test_compile to use absolute ${S}/src/tools/ path.
  - Change do_rust_setup_snapshot from 'after do_unpack' to depend on
    rust-source-${PV}:do_unpack (since local do_unpack is removed).

- cargo_1.96.1.bb:
  - Add 'require common-source.inc' to use the shared source tree.
  - Change do_cargo_setup_snapshot from 'after do_unpack' to depend on
    rust-source-${PV}:do_unpack.

- libstd-rs_1.96.1.bb:
  - Add 'require common-source.inc' to use the shared source tree.

- rust-common.bbclass:
  - Add a second --remap-path-prefix for ${TMPDIR}/work-shared so debug
    info from the shared source tree is correctly remapped.
  - Retain RUST_BUILD_ARCH definition so that consumer recipes (rust, car=
go,
    libstd-rs) which inherit this class can resolve snapshot directory na=
mes
    used by do_rust_setup_snapshot and do_cargo_setup_snapshot.

- lib/oeqa/selftest/cases/rust.py:
  - Adapt the selftest to the build-dir/source-dir split: use B for build
    artifacts and RUSTSRC for source paths.
  - Update remote-test-server copy path from build/ to rust-build/.
  - Pass --build-dir and --config explicitly to bootstrap.py.

- conf/distro/include/maintainers.inc:
  - Add maintainer entry for the new rust-source recipe.

License-Update: recipe file renames only, no license change

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-common.bbclass       |  4 +-
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oeqa/selftest/cases/rust.py          |  9 ++-
 meta/recipes-devtools/rust/cargo_1.96.1.bb    |  8 ++-
 meta/recipes-devtools/rust/common-source.inc  | 28 ++++++++++
 .../recipes-devtools/rust/libstd-rs_1.96.1.bb |  4 ++
 meta/recipes-devtools/rust/rust-source.inc    |  6 +-
 .../rust/rust-source_1.96.1.bb                | 56 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.96.1.bb     | 31 +++++++---
 9 files changed, 132 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/common-source.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source_1.96.1.bb

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recip=
e/rust-common.bbclass
index 057aeda67a..6bc42016d1 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -14,7 +14,9 @@ FILES:${PN}-dev +=3D "${rustlibdir}/*.rlib ${rustlibdir=
}/*.rmeta"
 FILES:${PN}-dbg +=3D "${rustlibdir}/.debug"
=20
 RUSTLIB ?=3D "-L ${STAGING_DIR_HOST}${rustlibdir}"
-RUST_DEBUG_REMAP =3D "--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC=
_DIR}"
+RUST_DEBUG_REMAP =3D "--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC=
_DIR} \
+                    --remap-path-prefix=3D${TMPDIR}/work-shared=3D${TARG=
ET_DBGSRC_DIR} \
+"
 RUSTFLAGS +=3D "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ??=3D "libstd-rs"
 RUST_PANIC_STRATEGY ??=3D "unwind"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index e0edfdef7e..1565b18fec 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -784,6 +784,7 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-source-1.96.1 =3D "Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index c961a8f652..4111d72044 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -46,7 +46,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
         recipe =3D "rust"
         start_time =3D time.time()
         bitbake("{} -c test_compile".format(recipe))
-        builddir =3D get_bb_var("RUSTSRC", "rust")
+        builddir =3D get_bb_var("B", "rust")
+        sourcedir =3D get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
         default_installed_packages =3D ["libgcc", "libstdc++", "libatomi=
c", "libgomp", "libzstd", "llvm", "openssl"]
         features =3D []
@@ -111,7 +112,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
             # Copy remote-test-server to image through scp
             host_sys =3D get_bb_var("RUST_BUILD_SYS", "rust")
             ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=
=3D"root")
-            ssh.copy_to(builddir + "/build/" + host_sys + "/stage2-tools=
-bin/remote-test-server","~/")
+            ssh.copy_to(builddir + "/rust-build/" + host_sys + "/stage2-=
tools-bin/remote-test-server","~/")
             # Execute remote-test-server on image through background ssh
             command =3D '~/remote-test-server --bind 0.0.0.0:12345 -v'
             sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=
=3D/dev/null', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@%s" % qem=
u.ip, command), shell=3DFalse, stdout=3Dsubprocess.PIPE, stderr=3Dsubproc=
ess.PIPE)
@@ -131,8 +132,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to mini=
mize test binary sizes
             cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo -Cl=
ink-arg=3D-lz -Clink-arg=3D-lzstd';"
             # Trigger testing.
+            # Run bootstrap from sourcedir with explicit --build-dir and=
 --config
+            # pointing to the separate build directory.
             cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" % q=
emu.ip
-            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py te=
st %s --target %s" % (builddir, testargs, targetsys)
+            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py --=
build-dir %s/rust-build --config %s/config.toml test %s --target %s" % (s=
ourcedir, builddir, builddir, testargs, targetsys)
             retval =3D runCmd(cmd)
             end_time =3D time.time()
=20
diff --git a/meta/recipes-devtools/rust/cargo_1.96.1.bb b/meta/recipes-de=
vtools/rust/cargo_1.96.1.bb
index adc1f0d331..16f8a76310 100644
--- a/meta/recipes-devtools/rust/cargo_1.96.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.96.1.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 require rust-source.inc
 require rust-snapshot.inc
+# Use shared source tree from rust-source.bb; disables local fetch/unpac=
k/patch
+require common-source.inc
=20
 S =3D "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
@@ -21,6 +23,9 @@ CVE_PRODUCT =3D "rust-lang:cargo"
=20
 inherit cargo pkgconfig
=20
+# Explicit CARGO_HOME avoids cargo caching in the shared source tree
+CARGO_HOME =3D "${WORKDIR}/cargo_home"
+
 DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${RUSTSRC}/vendor=3D${TARGET_=
DBGSRC_DIR}"
=20
 do_cargo_setup_snapshot () {
@@ -32,9 +37,10 @@ do_cargo_setup_snapshot () {
 	fi
 }
=20
-addtask cargo_setup_snapshot after do_unpack before do_configure
+addtask cargo_setup_snapshot before do_configure
 do_cargo_setup_snapshot[dirs] +=3D "${WORKDIR}/${CARGO_SNAPSHOT}"
 do_cargo_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
+do_cargo_setup_snapshot[depends] +=3D "rust-source-${PV}:do_unpack"
=20
 do_compile:prepend () {
 	export RUSTC_BOOTSTRAP=3D"1"
diff --git a/meta/recipes-devtools/rust/common-source.inc b/meta/recipes-=
devtools/rust/common-source.inc
new file mode 100644
index 0000000000..a0d4dc542c
--- /dev/null
+++ b/meta/recipes-devtools/rust/common-source.inc
@@ -0,0 +1,28 @@
+# common-source.inc - Disable source tasks for recipes using shared rust=
-source
+#
+# Recipes that include this file rely on rust-source-${PV} for fetching,
+# unpacking, and patching the Rust source tree. This avoids duplicating =
the
+# ~4.2 GB rustc-src tree per recipe variant (rust, cargo, libstd-rs and =
their
+# native/nativesdk counterparts).
+
+# Disable local fetch/unpack/patch since rust-source-${PV} handles them
+do_fetch() {
+        :
+}
+do_fetch[noexec] =3D "1"
+deltask do_unpack
+deltask do_patch
+
+# Clear SRC_URI to prevent fetcher warnings from stale URIs inherited vi=
a .inc
+SRC_URI =3D ""
+
+# Ensure the shared source is fully ready before dependent tasks run
+do_configure[depends] +=3D "rust-source-${PV}:do_patch"
+do_populate_lic[depends] +=3D "rust-source-${PV}:do_unpack"
+do_create_spdx[depends] +=3D "rust-source-${PV}:do_patch"
+
+# The SPDX class uses is_work_shared_spdx() to detect shared workdirs.
+# Since we redirect S rather than WORKDIR, the default detection fails.
+# Override to always return True so SPDX processing works correctly.
+def is_work_shared_spdx(d):
+    return True
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.96.1.bb
index 1ecd6bff3f..939e5824b3 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
@@ -5,6 +5,7 @@ LICENSE =3D "Unicode-3.0 AND (Apache-2.0 OR MIT)"
 LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D11a3899825f4376896e43=
8c8c753f8dc"
=20
 require rust-source.inc
+require common-source.inc
=20
 # The dummy crate named `sysroot` represents the standard library target.
 #
@@ -30,6 +31,9 @@ CARGO_FEATURES ?=3D "panic-unwind backtrace"
 CARGO_BUILD_FLAGS +=3D "--features '${CARGO_FEATURES}'"
 CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
=20
+# Explicit CARGO_HOME avoids cargo caching in the shared source tree
+CARGO_HOME =3D "${WORKDIR}/cargo_home"
+
 do_compile:prepend () {
     # For Rust 1.13.0 and newer
     export RUSTC_BOOTSTRAP=3D"1"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index 5678e00671..7b10eef9a6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,7 +13,11 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-=
${RUST_VERSION}-src.tar.xz;n
 "
 SRC_URI[rust.sha256sum] =3D "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1=
a1f63818903bfc3fa8b98"
=20
-RUSTSRC =3D "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
+# Point UNPACKDIR into the work-shared location so rust-source.bb and al=
l
+# consumers (via S/RUSTSRC) reference a single shared source tree.
+UNPACKDIR =3D "${TMPDIR}/work-shared/rust-source-${PV}-${PR}/sources"
+RUSTSRC =3D "${UNPACKDIR}/rustc-${PV}-src"
+S =3D "${RUSTSRC}"
=20
 UPSTREAM_CHECK_URI =3D "https://forge.rust-lang.org/infra/other-installa=
tion-methods.html"
 UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-src"
diff --git a/meta/recipes-devtools/rust/rust-source_1.96.1.bb b/meta/reci=
pes-devtools/rust/rust-source_1.96.1.bb
new file mode 100644
index 0000000000..e9163b4a97
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source_1.96.1.bb
@@ -0,0 +1,56 @@
+# rust-source_${PN}.bb - Shared source recipe for the Rust toolchain
+#
+# This recipe fetches, unpacks, and patches the rustc source tree into a
+# work-shared location so that rust, cargo, libstd-rs, and their native/=
nativesdk
+# variants all share a single copy of the source. This eliminates duplic=
ation
+# (up to 11 copies of the ~4.2 GB source tree in multilib + nativesdk bu=
ilds)
+# and significantly reduces disk usage (~46.2 GB -> ~4.2 GB for rustc-sr=
c).
+#
+# Only do_fetch, do_unpack, and do_patch are meaningful here. All other
+# tasks are disabled since this recipe exists solely to provide sources.
+
+SUMMARY =3D "Rust sources"
+HOMEPAGE =3D "http://www.rust-lang.org"
+SECTION =3D "devel"
+LICENSE =3D "Unicode-3.0 AND (Apache-2.0 OR MIT)"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c75=
3f8dc"
+
+# This recipe only provides source; disable build/install/packaging task=
s
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+deltask do_populate_lic
+
+# Prevent rm_work from removing the shared source tree
+RM_WORK_EXCLUDE +=3D "${PN}"
+
+require rust-source.inc
+require rust-snapshot.inc
+
+inherit allarch nopackages
+
+PN =3D "rust-source-${PV}"
+BPN =3D "rust-source"
+
+# Place WORKDIR under work-shared so all consumers reference the same lo=
cation
+WORKDIR =3D "${TMPDIR}/work-shared/rust-source-${PV}-${PR}"
+SSTATE_SWSPEC =3D "sstate:rust-source::${PV}:${PR}::${SSTATE_VERSION}:"
+
+# Use work-shared stamp directory so sstate is shared across all archite=
ctures
+STAMP =3D "${STAMPS_DIR}/work-shared/rust-source-${PV}-${PR}"
+STAMPCLEAN =3D "${STAMPS_DIR}/work-shared/rust-source-${PV}-*"
+
+DEPENDS =3D ""
+PACKAGES =3D ""
+baselib =3D "lib"
+PACKAGE_ARCH =3D "all"
+
+B =3D "${WORKDIR}/build"
+
+# rust-source.bb does not inherit rust-common.bbclass (it is allarch/nop=
ackages
+# and has no toolchain dependencies), so we define RUST_BUILD_ARCH local=
ly for
+# snapshot URL resolution in rust-snapshot.inc.
+RUST_BUILD_ARCH =3D "${@{'ppc': 'powerpc', 'ppc64': 'powerpc64', 'ppc64l=
e': 'powerpc64le', 'riscv64': 'riscv64gc'}.get(d.getVar('BUILD_ARCH'), d.=
getVar('BUILD_ARCH'))}"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/recipes-devtools/rust/rust_1.96.1.bb b/meta/recipes-dev=
tools/rust/rust_1.96.1.bb
index fa8777826f..4bbe4ed0bd 100644
--- a/meta/recipes-devtools/rust/rust_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.1.bb
@@ -4,6 +4,10 @@ SECTION =3D "devel"
 LICENSE =3D "Unicode-3.0 AND (Apache-2.0 OR MIT)"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c75=
3f8dc"
=20
+require rust-source.inc
+require rust-snapshot.inc
+require common-source.inc
+
 inherit rust
 inherit cargo_common
=20
@@ -24,6 +28,9 @@ INHIBIT_DEFAULT_RUST_DEPS:class-native =3D "1"
 PROVIDES:class-native =3D "virtual/${TARGET_PREFIX}rust"
=20
 S =3D "${RUSTSRC}"
+# Separate build directory from the shared source tree so that multiple
+# variants (target, native, nativesdk) don't conflict in the source dir.
+B =3D "${WORKDIR}/build"
=20
 # Use at your own risk, accepted values are stable, beta and nightly
 RUST_CHANNEL ?=3D "stable"
@@ -38,6 +45,9 @@ RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NA=
TIVE}/llvm-config"
 # own vendoring.
 CARGO_DISABLE_BITBAKE_VENDORING =3D "1"
=20
+# Explicit CARGO_HOME avoids cargo caching in the shared source tree
+CARGO_HOME =3D "${WORKDIR}/cargo_home"
+
 setup_cargo_environment () {
     # The first step is to build bootstrap and some early stage tools,
     # these are build for the same target as the snapshot, e.g.
@@ -66,11 +76,11 @@ do_rust_setup_snapshot () {
         done
     fi
 }
-addtask rust_setup_snapshot after do_unpack before do_configure
+addtask rust_setup_snapshot before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
-do_rust_setup_snapshot[depends] +=3D "patchelf-native:do_populate_sysroo=
t"
+do_rust_setup_snapshot[depends] +=3D "patchelf-native:do_populate_sysroo=
t rust-source-${PV}:do_unpack"
=20
 RUSTC_BOOTSTRAP =3D "${STAGING_BINDIR_NATIVE}/rustc"
 CARGO_BOOTSTRAP =3D "${STAGING_BINDIR_NATIVE}/cargo"
@@ -173,6 +183,12 @@ python do_configure() {
     # nothing about when trying to build some stage0 tools (like fabrica=
te)
     config.set("build", "build", e(d.getVar("RUST_BUILD_SYS")))
=20
+    # Yocto's B (${WORKDIR}/build) is where config.toml lives. Rust's
+    # bootstrap creates its own build output directory inside B; name it
+    # "rust-build" to avoid ambiguity with Yocto's build directory and
+    # prevent a confusing build/build/ nesting.
+    config.set("build", "build-dir", e("rust-build"))
+
     # [install]
     config.add_section("install")
     # ./x.py install doesn't have any notion of "destdir"
@@ -223,13 +239,10 @@ rust_runx () {
=20
     oe_cargo_fix_env
=20
-    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argumen=
t(d, '-j %d')} "$@" --verbose
+    python3 ${S}/src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_ar=
gument(d, '-j %d')} "$@" --verbose
 }
 rust_runx[vardepsexclude] +=3D "PARALLEL_MAKE"
=20
-require rust-source.inc
-require rust-snapshot.inc
-
 INSANE_SKIP:${PN}:class-native =3D "already-stripped"
 FILES:${PN} +=3D "${libdir}/rustlib"
 FILES:${PN} +=3D "${libdir}/*.so"
@@ -241,7 +254,7 @@ do_compile () {
 do_test_compile[dirs] =3D "${B}"
 do_test_compile () {
     replace_llvm_config_path
-    rust_runx build src/tools/remote-test-server --target "${RUST_TARGET=
_SYS}"
+    rust_runx build ${S}/src/tools/remote-test-server --target "${RUST_T=
ARGET_SYS}"
 }
=20
 ALLOW_EMPTY:${PN} =3D "1"
@@ -282,7 +295,7 @@ rust_do_install:class-nativesdk() {
=20
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
+        cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/re=
lease/$i ${D}${bindir}
         patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
=20
@@ -322,7 +335,7 @@ rust_do_install:class-target() {
=20
     install -d ${D}${bindir}
     for i in ${EXTRA_TOOLS}; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
+        cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/re=
lease/$i ${D}${bindir}
         patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
=20
--=20
2.49.0


