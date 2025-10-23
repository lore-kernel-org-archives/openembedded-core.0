Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28BFCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 16:20:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26076.1761236440729761635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 09:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DqDJ0FOx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2391a0ea00=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59NAl6iI993654
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 16:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Ua1qXaZt/
	cAPYUahUQav4CvoGJOVvtWbWCPN2YLotp8=; b=DqDJ0FOxMKA4y3UacKW6hCAMH
	5d16+KX5fg1nGoK/YTz/4G2DzZIh85L2oJFW7WopsZxjZIgzX2RtvgthjBjFgegN
	cnlBDuV99h+DoNDftNsRUrKrmPyawQFXh8AE7rPLsxr+cxEq5bZihQZ7l9slEeGt
	uW/KSnDWwQabq0LLS2T9KLmINjaNYm+kMZRt95q9YR6JI8gVW74j1FUPtRwKXI3i
	Nruu6+GEUBV3aZ/dm9sdHL7R+USPxhdmEBPs6TTlfhTneoAOO1vU8jV9xcuyGa+2
	L4I8NVUQ1/18vI7qurP4WnBMwOFp4tESvMDqxdF4HTRCOKeDuo4HGbWJgusUg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atgwwe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 16:20:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDphqG6AQTeyVj2MG/fFwF1HijK+g4Xm/3mBfjfEG4dEAxcw4PY9/KkijePn0YLkmeOzDIECN42Cv0EYhydEttO6FEo1T37fWG80/1hVX2wZ/y4gf2FwwQlmJBDzGE3FbLAkP0xj6EgRaFnuHYWYeM+P1wpr4HoCBogw99iog8m+xZBJb7mg1fzTzSBjiuuTzwrCqsiefK3NR7qRm4a3VugIO02kOPlBzdltGogobfuMb1mOeYq2tre7acsV7BaSwcvCOENyeje65h+7wdJ55U6wCY5X5tKdU9xquSYUXu7Lo8k6GfLALQVjSqX6ZC2CLoAImWj5aUXklPgvbIJCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua1qXaZt/cAPYUahUQav4CvoGJOVvtWbWCPN2YLotp8=;
 b=dL/tymgVQEDw44ILYIabZwtbPvJIfsT2mKlnDfM37B8XmAfeIF1drmMT7Uq2C1CteSfumqpRt6Tv2BJuwUNgvA8TqqCZwHgfM66tXSuSGZjj2iac0vYmsx6ZEqpnW12lRMmFYrRTxYtOlUvfrq8ei9XDooX3py/oSa3uFy08yCktAafBxE+/4JJ7DjLHsk/tdvpYE4PbOF8/zt+qGmo/rqNQNjp4VJYiNii/gtcRLn+agpjL7WylqXS3IKY+noE8cr+rQVJwaqaDUPZpuZBqT++GtcLbYhgBWGWlcjY0Mf3jouGN4rKJncrPJ2i5qqW+iBdjckfDbL68eEEwE821Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 16:15:34 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 16:15:34 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust-target-config: Set elfv2 ABI for powerpc64 when using ppc64p9le tune
Date: Thu, 23 Oct 2025 09:15:22 -0700
Message-ID: <20251023161522.994070-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fee7b3b-07cd-458e-ec03-08de124f656e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KiNs0ao0vuyTnb16358opBiwDCLCzXACwvlPT9pIeSdxPhqzbiT2fVDQZZkp?=
 =?us-ascii?Q?if5ZmQrdRbOB/UKUuo7C87uCPmcpzBVwZ53ma6sGEAjdQ0tHgW7/hYbvfArf?=
 =?us-ascii?Q?9D5Qa8gl80x7bE37txS7zoF4BTaBBjcNwKp/7U/cvv65at5fMWdlw8Fr4qsP?=
 =?us-ascii?Q?GeOu2eYLvk6X0TZQhySrnkQQY9CR8KW4i+Mv4C4T7ip002dsz1XwUBXKMUGC?=
 =?us-ascii?Q?QUWDfEDEdnuBwxnZXilPCW2gE4Ei2b6I4xWpimUjyM9TSRxJr7o4Awdy16dK?=
 =?us-ascii?Q?nmyXJh+1wwcwJFZQv5NrGXQQec+sqehg54v4hn8mozilGuFbMfHLWcnbOtcQ?=
 =?us-ascii?Q?RqtDPypF4aKinJ8PAlR7b+3W2fPC0CyVUlupylYGzqR+KhlXVxVHgE0SB64q?=
 =?us-ascii?Q?LYqv6ibcoWJhNrcaermlnTFJ0kAlcKtYaGcHW5I5qZtSmYrwmfxrGcookimD?=
 =?us-ascii?Q?e7RFh3BLnFUSMCM3xfUSZc5rtHxGNXA8K4qFhE5l8MxWHK33Abza8QKqX+7y?=
 =?us-ascii?Q?JIxG9fSwLJuDfqUYWprPw/bRT1MjKqBjgd5DaeuoJ35bCEF6APaaeVAWBBwZ?=
 =?us-ascii?Q?iuKgYOyrGyMYlDf0Gbl57/ydfGZ1uznvtA6rpfsyhs8X70GRTiaQbBQapeYb?=
 =?us-ascii?Q?uEmQAhmBIYTKhtyt4e3dD5sREJ7du6Y0aDw02k+aTprIL2qRzFM5P7WctMR7?=
 =?us-ascii?Q?o3tAOkdiAA6tpWzElRvQ7S/UE/ymVDcMXIYrZH4DBesaNrjaQhBB1ybW8QMS?=
 =?us-ascii?Q?NktbESkolCdwOV55ZuPsmEK2ZbGWEZpoulXrX25C3F24XM9Ak8O2mfta9z6L?=
 =?us-ascii?Q?MdnbqnpNgsKNyPSl+N+5YAoqcb4LcgwkeCEh4WxqNpCW4MOENqK+BBPgxNC/?=
 =?us-ascii?Q?nT2nVj79jdAaz3x/LyepTlSW8R79/pnI9ZSGmlr5pfMUL0leXIzc63AIVCNa?=
 =?us-ascii?Q?yM+QloGWLEEIjQEpASoJLUtgOzR+/BuVYR6Vfg30EQBBLlgMZJOEZVKRDwVR?=
 =?us-ascii?Q?wW3Bsjkx1Ou2BF9HcyAzOtNNTPLBZnBOtZPYp8DBMvDsfHt2MuYbAy3ft1Rv?=
 =?us-ascii?Q?ci1QsYhYHSWFWH00PNEukemTuR929ehbTTZQFn0uaZdb4AihBwpSTEZYmNef?=
 =?us-ascii?Q?2mmBOJ0Q8uAhXN1v1nLC8uBdrmQXX33JZEfrq7xoCbvZWBkFZj27B1zIunnP?=
 =?us-ascii?Q?luYYCyaGtgicG3khFl4EfhFtHPWbFXihVrQnqPlqBnkCJzNyufExZXRTo1FY?=
 =?us-ascii?Q?Dt8K+iIi/6xYOnsP1RQRtdOweGQW67oKnfJLpbfcZnhu3oE/QQ74yj1Bgre8?=
 =?us-ascii?Q?jrKeEHiR1iEFYVHUk3JxUtE5faVnEozyEvKq12dl9zYJrAV0MYbji8oe/f+f?=
 =?us-ascii?Q?N81CGpglXvjBUXw153cy7ebEm19ETmdzrRijo92yqtJRRKigHBIaivWyYWmf?=
 =?us-ascii?Q?1HMZvNiCS0/S2O71B9+ST4lpt+h801sCxzcmGAtz7zT9jiftz15wUUwBEU/2?=
 =?us-ascii?Q?SxduhqQnEwxyISJCTKtKR8nfLEQyQ/DtyO29?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NxYhbezyWL4mJBCK09nfG41nZo5KwcEw+PMCIWJtS15zZ5uTDTeaZTIow34n?=
 =?us-ascii?Q?q164CZVbyVrEj2SSQ8RJ6VWlDzuJ728FAmtbq9coJjjXz67tbj5B4cB6bhQd?=
 =?us-ascii?Q?be7PSf22jQAREpORurNbdnYTr8uaGp418pvnPaXSDk6BMgFaFfudtwet2Ecp?=
 =?us-ascii?Q?kM0RDSdHPaNjMgvPN01ZWe7zpfVHaf9DXnhFpNh4zMkFiQcMJI0UtlbCKxT5?=
 =?us-ascii?Q?1wgWiiGUEOKP/KSLIj4FqLA1B4ggcnVnped9PMYBl4AXXIOcNVbx4753ibMj?=
 =?us-ascii?Q?28NO8L182NpaqEg6kv0WykMAujMSRqdPFZ3Ja6wSMGFc9IntH6wYA90yXb6w?=
 =?us-ascii?Q?KZliOWGsMFkSszsZ2oIYhP28+YwLGVp6FuWJI/DMNBqM4k/+MStnO4IVKcG+?=
 =?us-ascii?Q?bVpmQjTxthpNsay4EVYqxfaJLC9a16I3RFgUprxMjOxtcN9SOEg6Lc9g2ZRx?=
 =?us-ascii?Q?1Oghx/701nh6Hj6zPCylDNPw2C0dtd+I5UcrusID26qWI7j2Z10Usm7j4w3k?=
 =?us-ascii?Q?eRDG4Kch0nfII1UWB3Y228+/UlrfXVApHbi6aNWrGuIv7EMwyo8pRwVjmnBd?=
 =?us-ascii?Q?8JBenDRNivmpx/WTiL0I+tvHPa4Mjp4GUbiO4AoEX/sT2BvXBsF921EU7FfE?=
 =?us-ascii?Q?Hrtd2MGz8UPIcUU6ImXxf3xBlLqFEpoBL162g/OKtMkYZB0gWCVManLwmKQp?=
 =?us-ascii?Q?BcJPlFL6NtSA7FYcJN/QsQgrM8PfEyYad6yM9si2/ccClhcA34kTG/9ACKdR?=
 =?us-ascii?Q?+mGHII2jVwoblRrsTja6RN2rNtC8Rfgb7OMDaAnQFQOz212M1Rr09NwXuzK6?=
 =?us-ascii?Q?1KtLX8JFx1JPSPqyiuzoXnC8ThybrHK03KTCQlncN+cmQWQq8dUAzdd14iKf?=
 =?us-ascii?Q?Nm+LGAaTGp1Rg6ecOFU9pSBbuFnviPqaQ0SvFyd5kHEKh/UAbo8cvpI/0dNn?=
 =?us-ascii?Q?3hIUt7e7dqFdaMT6JNhqinenVErk1evMOyX0ZFERvijGzYTTnZ4Zl+ej2WRX?=
 =?us-ascii?Q?43P0gLXyoFfC/TB1D5jG2/tQpHuE2/Q5eTXPvWMsY/MAkEOvUsm0zePeO4Go?=
 =?us-ascii?Q?WZwIKO/EJPyr80sP0luSSTnPB1j3CHVXbyArRNswcjzhevAdIl7yaJb7YYHY?=
 =?us-ascii?Q?xKxAHX83ASUCb1k/EBBUHrg/xbnD+UTB4LXzC3CbyT+2tLnSL/itszcb2Qst?=
 =?us-ascii?Q?SFYgLB8xxvw493EisoQ+CWcfa+j82iUjlojWGXNPPoC/GMFK0pNhLUZpiJOU?=
 =?us-ascii?Q?toVAyfYek3ZIZ7fg4xF+H4qrZaQ+eIb9w0ZOYkMpIc6PCVranVF1P00Wxa88?=
 =?us-ascii?Q?OW/EFoY1eu3nBLhnBFhJLTC2hkSIktfFutoUcNRqUJf8q/tJJ1Wmz9JoCcNB?=
 =?us-ascii?Q?r3qP4zOUPERIge6qkyOwVn6HfyB++IQR/8wy484/v5sMl/0q5rRy7+KcHkcU?=
 =?us-ascii?Q?gIpKWhDorYjbrnXZZGRFb15Z+6TKuAY8iLnjqqwtEj3cxGOLAkX/fcGLuVZp?=
 =?us-ascii?Q?mWlSAIe0fGD3yQBEBD8r6iAxzcFQEH/BE7mjnELQt0OHoMjg+B4qP9EFejXn?=
 =?us-ascii?Q?UVoalH72x+TLHRvaU4xhi2hMf2OEFZj2T+AnBGU/0UVt4xdH9dAke6EE10wa?=
 =?us-ascii?Q?Mx4Wmna2I6wSFFfjLB6yxqU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fee7b3b-07cd-458e-ec03-08de124f656e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 16:15:34.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ji26HcCrM3MFhgZoqErhA3TuJmrN5rTMptLF7UBuxwC8ZT+7p6ZMb5XNEuCnhGgDITfGLMeWpMHMp3CQ69Q1eNGGh9H2/wsmunk+bJedbasW+KV5Mibzil+ZacP9JAS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fa55d7 cx=c_pps
 a=0dUMnQhOFwHl/g2jU5Tm3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=lSqvwJkmXKpoOmQOB6cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDE0OSBTYWx0ZWRfXzkqreTZ8caBS
 4ZNsX8UFmjAfZIBRdxFhYCwjFljFagf9RThdg2Q4hC1bVaov6v8u3uDVtiiVbR+nJa3ucNxIn4m
 HSYJ5ghlhkrkP3FxNHnQbHAkt0rnK5MYsGVfbPo0k131vhYmTspNMamOGoA84nCxGqVz/K5K4j0
 TZVz6BPOjJxuwyDGrlkOpdc3FqoEhwio0kLI2WNdm30hpvMf2RLNs1Er4oKNe9+mDApEkLka/Oe
 76veBoiTj7YxzVE0dIaExODk7iBLRTLK5PkUrLVhpNgCAhIusQ/C20kZGphabjzchAd0hnQWp72
 3ySuE8QVzJv+PPEac/mi/hkEHDMdQSNoBERqjY3scX/mK+Oett2SF+jRrEQtdql6wnJXffa/WmZ
 Z4XmX92+Q+/PoYnYSrduFDEmcVkcQQ==
X-Proofpoint-ORIG-GUID: D9x5px-Bvf1Ocbwh0q9KvJvt0iic71ce
X-Proofpoint-GUID: D9x5px-Bvf1Ocbwh0q9KvJvt0iic71ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 16:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225271

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

For the powerpc64 machine with ppc64p9le tune, the supported ABI is elfv2
but the default elfv1 ABI is used and this causes link-time errors such as:

    ABI version 1 is not compatible with ABI version 2 output

To resolve this, the powerpc64 machine with ppc64p9le tune is updated
with elfv2 ABI otherwise, default to elfv1 ABI. This change ensures
consistent ABI behavior across LLVM and Rust builds.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 0c7e3c0090..c462478dae 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -406,7 +406,11 @@ def rust_gen_target(d, thing, wd, arch):
     if "powerpc64le" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "elfv2"
     if "powerpc64" in tspec['llvm-target']:
-        tspec['llvm-abiname'] = "elfv1"
+        defaulttune = d.getVar('DEFAULTTUNE') or ''
+        if 'ppc64p9le' in defaulttune:
+            tspec['llvm-abiname'] = "elfv2"
+        else:
+            tspec['llvm-abiname'] = "elfv1"
     tspec['vendor'] = "unknown"
     tspec['target-family'] = "unix"
     tspec['linker'] = "{}{}gcc".format(d.getVar('CCACHE'), prefix)
-- 
2.49.0


