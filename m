Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C2DC43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 21:15:13 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1021.1783458912657085266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 14:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=Hbu0SQCs;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=nu8+OliX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667KiJSU240806
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 14:15:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=Eu0/VD1tz6rAYAntBmwDC5
	8LUE1dH2NEDbOchW5SURU=; b=Hbu0SQCsym+TTAzyex2LDt6ZsI8EbsIxSgufG6
	NKY3TGR/pDRwW2mymPsLvUwaCamVAzURG1S1iwYveEgeJQgnjBp3YiO8wDz79BxF
	CFpDyKeMOwR2pSatimbEwybAr3GsQ+od7EiL36PsB82Aj9zqa5XwfWjDljnzwY33
	PioMAVPZ+I4iiZOjpXe8u5E/8NDoTHEhzC/082dRtMcpJblk06qQq7KtdDKJ8byd
	9HOn/a0zvoAT6ObM9p1PSYlDXideWMKcHr1LNPvqTSGsal3vFbTtQgLPqENSk8g+
	F7pOV6vMXQyP/+jYwztK8XAgMZitFtdHveUVq8GSMBdz/WJQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4f98rmg38r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohAMeL7DdwrnulUfbgnfkVm0Cnk9Sm/iOiKCduCstFFDOI+dJOLN/6AG1hoRmFlTkmYJs1hBAPSnf+VVf0HKeNkEYUB7Xt8o0Nl7SFCbdI/FJZijTukueR8+VZi3H6DRAIue0lFzQ4ZZqtxjoOoMW1Os9t56OjwszZkZbhT4UO9Zj4RqJOiSvlBsZDTbpeV9dfFxEYjs4BRDo/PbXc4Q56tVRtDUQVxcagOBtQh8X9upUi+3oInjPi4vy1ZY1R/mE0dkP/KMzWd8DtAR8jboBuqBHZWkysPE6rPhb2xMxGVV2ejShlfQEjP6EyS3w5IivEDf4BwCM3pp7HIIYDWQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eu0/VD1tz6rAYAntBmwDC58LUE1dH2NEDbOchW5SURU=;
 b=SNEhIr9ZXRLCbQLV8j9z5Q7keZz2wvrJxfLtMBy94wiW28ouOSN9njWmTuK0EqglKIszwBDUuKijfcZaednQBojnwupFcp3rzSgidyORYHaTfMMBGeWyQzapFOql+CF0kuOtz/K8N8qyNIhfNDxeE3/bpAGanwOvZjANIcnutpi80SWW2z5PVMwlRn2YxS8ssiPTN4l30u5pdTSjjsNnZ+JvtrN2Uxd+r6HsKHhutjutip9X/Gw5QgL4tQAaaqmtNQafxA/hSIvRB34MYHKHjh35DC2e4SbHsn6nv0QSyFibHOrZ9x9uyPxA1ZRKdcm745fuADNjfGKKswuUC8l3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu0/VD1tz6rAYAntBmwDC58LUE1dH2NEDbOchW5SURU=;
 b=nu8+OliXRgL+ZrKozwztn8b/kZIeO5lulDDIHLSgK/bTmjCJWrDQ6ItWZ1gqRoH0t2dUF2P1sLvCkaOPl20ZndtANoVHpA53GSRkaq0X5mzwyFxH5WU8/T3m+IhYuSFNIS9hgarYkDV3aGZbu0VKBzUy8Ek2LkpQY+xnGrnDRt8=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by CO6PR17MB4900.namprd17.prod.outlook.com (2603:10b6:5:357::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 21:15:07 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 21:15:07 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [OE Core] [meta][PATCH 0/3] Create selftest suite for go-vendor.bbclass
Date: Tue,  7 Jul 2026 15:14:53 -0600
Message-ID: <cover.1783457902.git.john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0162.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::13) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|CO6PR17MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 24526b06-ab31-44f4-71e6-08dedc6cd1ab
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|55112099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ycu1Y1/nLuK8sEXtgc7Qe/89bnbYRR4beSjRcxuGTzv95rfwZ8RiUMNrwFn1iVJpOTfLGDpD+ZxB7XbhaH26/4fjpquhGnyvG2OiCM9r8qRseNOr8IwsKXC0Pw6gtWSNLLrGH4dQcDhZRSq1n8e9sb1Ms5nU1H1nNsHTrdPMLVI7zTiT3Aukwqkx2tWQORpVYLzISIAFw+zhlPkQR3H9LXstrFD+3lBwO5UH1kIYQV4NoLSPLYITr8FYjNy19mgnCw4GYpEHanbVlN/nrEroK9YxLEXZAZORVNmhvA/uP/QjDgrc7xVbRFe+JKcJGppQ9tTXkFm+k+F7+2AnQTyM+lbQVUKu5RDK2gNXFITuZrpYGUGpG9iZbHGhvgbDUH/srMI/CAb8QoWUgsCP4ldGQFlx4XqP3Jy1KF3jb7261OUIm/bvhLdU2WJUYV4ELnZYz2pKUCe3qvghHXTo8tfoNDY0T2cFVBu4XpRhw8/sH7UCvXzkJHGepCjfOISNDbEnE8QJpTfrBnD/Kn5se8qFz1JkpqSq0/4/fanH3G+VrXpY5sJ/durQpqDnlBHFBshEA+QxSf8o33okKoWLvUjjIL0Zx4dY9a5S81Iq/hk8TxXVgIEmdJwYhrBI8D5M0PvVDb3i1KpkwU6/vZq7/Ixv0nrs5lybEXxt7uG2/y+llT8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(55112099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CFE1/0Tn/WUAqmXicSpvvF9NWWyPsDOAAKP5Jm9d3uS+sLD/G2gzUZmNVQyv?=
 =?us-ascii?Q?9j2YiWi5VEFP+B7vLW8nMXSC0xbw6jaVxXX+kiGsOeCPhqP9Oh2/00GRsrx6?=
 =?us-ascii?Q?OLWnIE3dv41qAiw/wzX9YfqKpeeID6TyXux/n5dDRd5RHuhJzpZTxuBdxCfx?=
 =?us-ascii?Q?+T1infeg0YhBVoUCDsdftEDynrszMlYAB1XSgEarG1IsviOy5yTzF1qvEmov?=
 =?us-ascii?Q?AouOVkEt2+Wx/0//WUw4mcJwu4Ur4WKudaFQYpDpH4w0GTu3auhV97zRLRl+?=
 =?us-ascii?Q?qy1VnT7BM/b2NhHWOXUGBp1FXvv91Ta6qKSQIDM641SW1HCvsN6gU9wbDqdX?=
 =?us-ascii?Q?OjrIsoQvli+wPpVJ1UnnY/zn/hBMbM7orXpjlhZrP5Gx4+rZ9hOmcpnFnnUn?=
 =?us-ascii?Q?OeeZg48K3a0lEi37uwqfTCk/lrkH1ICggk5qYreHDgD7LqxvjC3a2XGNKYw+?=
 =?us-ascii?Q?bOTzlZr9ROyUnSpcFbpr/l2C3KAsKMNRSVcP5M/m2CXc39NfKJoPDya2Xn9D?=
 =?us-ascii?Q?MPO43oMJToEap5GEKToWrcoUOcjlHkSpAOzs2AoCgYcN5j+KZkAa2NBH/BtH?=
 =?us-ascii?Q?PZMBPY+m80rqYFvl1ubpY0Eq2M393LOzjjeUGoHmMrXjHX9G0Ez7+t/JCO8z?=
 =?us-ascii?Q?mGUlVPhl6Yt7Gc3LD2UPVem5SBEK+GM3V3InuwvLYNtuURcZHxCxlGWekurt?=
 =?us-ascii?Q?huPWr61a4bJa9mcnYePNWJUgK6C9LNo3dntGO2yWoKnvHgrIvPTKG8zxcLSx?=
 =?us-ascii?Q?n9GELUTn6+TXfpGDSSBVV/5eT6KrQQVH+jSnYdcNso7dBW9cKDTQv899yVUt?=
 =?us-ascii?Q?jlj2b/SJA2pPLeOO+B+YvuOBeKxIDHlTX4liFxnLOzgpqWxXJinxljSBnHVd?=
 =?us-ascii?Q?rhaKZkeMqYEFtxg8joTy2yvds43zs6VZVb78TMGShWA8MbVp8FaKUyWhzRmu?=
 =?us-ascii?Q?nwYVrrqOmMv93NYuaFQ2uEGaB0GI7ShoVEV6H3yYbqko4piTsJcw+5zFR6KH?=
 =?us-ascii?Q?NnJZVaNqidwNKX0dvfpgdsDa1qPsZSstLtJyyzjyTta8MxU2KS4VvrCsoCuo?=
 =?us-ascii?Q?xcXNpIIyuoiNo9BvDv9zCQShOqJmN7Xf+22TpQt39AghFfoSCC7KjJKDVv0B?=
 =?us-ascii?Q?X4x1lDaZeUWkjICz7fjEOA91XuYAI81wbeoIJva/cdWiyo5lZAj02r7GxZrx?=
 =?us-ascii?Q?kTfPEkG/98XvaqfbbhVju7HPVZS1Bgcp3frdE/3pZQDiQP4IEDfxhURD6wFM?=
 =?us-ascii?Q?DuVo9pjKtqHPuwE7FLgN2LJfyJkqS/QgoA9yAEk1E80/oNuvxnRoBvmagcXl?=
 =?us-ascii?Q?Da2eXrTIXX+9FRDM5HWAY9IL7xLzgr7xAQiB9TzsiX/37oMQjF++PMTmQo/4?=
 =?us-ascii?Q?EbLWJ3VWZt471/2AnsRMuuzQS6JfpbEKqKBZ/P7kMx5VgpKG2KAPzhFVgKBQ?=
 =?us-ascii?Q?S1mr8EwVMCq93lcLNqh4LaadXosZiSormzuduXLLTpV5RPmLbn+mR1d5ijl0?=
 =?us-ascii?Q?qzuYXYvwDGAQ8FKlI/wTxPghKVWpDqVhRMkcDqd8PhSpbbacxFrvRVi4G/Mv?=
 =?us-ascii?Q?vKymtiRsj7p6b7Au3UJDfDNAeHmZSy8nZXNtD+yNht3cklOcfqwp3x146oy9?=
 =?us-ascii?Q?O8XnceKdkWmD9QK1ra5vRQOV1Y3gwmv0D4/OzqNB5kJN38yWikxB+bGQLaKm?=
 =?us-ascii?Q?jQNEDq/8MxdozdjW6GwuALcH3EdGAhpzXTiiC9u7XX88wk5B4TTfAemGKULb?=
 =?us-ascii?Q?7ejOMWwpQw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	As+IVbbUEGmVv8vUtWPlJ/ZzubrNz5iET7LumesDNsY9fwg1bHSQo/fBL6vfNbZRksEgmCn3UbTtd+pmvpZkw81cRkfglqKxyAdq8sQ0z3cfuhaqaW696rkUS5s3DtPmL8mKWOzQFz9BIaBfRmbYzmCCUPSUpLCKPDWGSMT2AgjAU0L1tjFvfPzcLXZVOX/Szx4i8VijxNfIbm1sk7Z242qfwg5gmgQv1Ta6OHvbJ3mgTC+4Ihx+u8rMQ8XLpH9pY7+4gl8bX3l3z1BAgGBVXxbEnDv71m16XVGl7P8Hk4ac7eO95wsLbLHHnoxY7UtiDRU4cXAnzYipXAB354fTbQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Ur2C18nRmNvdLgwEzDi9A+zxpw1x6DLZkwsOQPAHweHDh3svihatmCSrMvzBfgYp+j40LIKyUcW5Tij32hVGofcg7/BrsUBLRerbC0ZrztZuzeEGN+0Zm8wcmQc6IKqLDwTm3da9sfsMGmfd3KuzHOOQp1flw57oFu0nOSb6XQES3jBBRL9kPjXUJAak9t+wV0GEwhB88clUgXbdvFCFZDAJesrrtA2vheZEeEX7riMaoYu9rdeOL4lQTVLUTuRFDmyc9KNMMTOL5tok+odRc85ySH7vAMqC1DbmRhEQcsc5NJQ48P1hgt+Dh3Vu910gEfy4q4r4RU1tT8lCZSJ6Izr2PczeXrgFQKgXQyHl7t1KfLOPc77sgeLs7E3CGaJOWs+OSdf/yKtYcosA35L/+gOnokMw28HGLLgrYtM7TRV91iGx5kpN7YsTbPBIUtyzpZDpVHBEtVxXFGiovOWOsUrHM0cE4DWnRE7JxrevEh4yDaUGOW0S58MFOTTbE3tUm8cGR0xnDAf4sSaEAPqE9+BaoDDbCZnB91uXTDA8sC63aNPEQcCLh8OSA/Ps6/YseR5cauNjWL+CtUBmNMsBPdDOxKMrtiZ5DVUSRzhJU+778QN+t9zLvDh1kHpwS71t
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24526b06-ab31-44f4-71e6-08dedc6cd1ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:15:06.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4mJJiIX6YLaVLXjBZoFDcL0AjQNZZ9VMVjRqwjcZlL9SJ5zFKqGL1EeR79vrUOtbAQ7AkwVgb+mfp1qFuBfKFSvgnDQmodaCY59ioobSQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR17MB4900
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfX6Hz2yvSnfexu
 JNVPTm0u/b0JHbVDRwy2OmTc2pYCXgZS+788QQgAYmDxYB5hai8Q6KNrrNBzAazWzrVARmXCCkq
 msJk+bUh1yHERfktUwqPf8TyhMWelmA20g2UaJqxyXQIIsXmzaQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfX06xsgEmoBlwN
 9l55jdKnFUJ0mVrfC7g2t+PSY65aY0amwlcmmEKTKmBBjOcSrnq5vUD6Fyy5+V3iJ/LDXl2uluS
 +7NZeqWxqYn//xque77aAYPblyLd4nI3mLUrLowU5ToKoFTR1zrh4tuwKvZR9XjI/UAehHM52fo
 3G2VjzLlVppn0knoLx68xDQ8Dkj3vtVertOQ0soeN9kumDgdFHaQPJSoepLeV8D4qoVEMzhBprQ
 wrS7TJafbCINZx/eXayTdrBpixn6GZckrhXqnDlu1B42WxbknvOG4HSMff6CKU6kk4YG/PT0ebJ
 ROQQb4KJadybecQZSq5UlC45qGlNmYieWjp7UOJ9rlSNTe9MKexX03urK6Wi8z89QRgTC/blUti
 DKSSL8QBw04wPiFtNYOeHrAPMq0NxxlxkaLLSfijbV4Pvy3q85Mo4DLWji6UwZTnDtMYcqPP6SK
 2Ny4R2cz0rWgbZIc/jA==
X-Proofpoint-GUID: f6PfojuCwvzfR6zTJ0ybYUHR7PCorVtO
X-Proofpoint-ORIG-GUID: f6PfojuCwvzfR6zTJ0ybYUHR7PCorVtO
X-Authority-Analysis: v=2.4 cv=HuFG3UTS c=1 sm=1 tr=0 ts=6a4d6c60 cx=c_pps
 a=pvbKGUK/Si0pumwNLfsG/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=mOSSRekXLlsqcmK058qe:22
 a=qq2s7GKWbMUuupIONFYA:9
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11840
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 21:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240407

This patch series adds a selftest suit for the go-vendor.bbclass and
fixes a couple of bugs in the go-vendor.bbclass and the selftest suit itself.

John Ripple (3):
  go-vendor.bbclass: Fix test file exclusion and license propagation
  oeqa/selftest: Add go-vendor.bbclass selftest suite
  oeqa/utils/metadata: Handle empty git repos in git_rev_info

 meta/classes/go-vendor.bbclass           |   6 +-
 meta/lib/oeqa/selftest/cases/govendor.py | 264 +++++++++++++++++++++++
 meta/lib/oeqa/utils/metadata.py          |  11 +-
 3 files changed, 274 insertions(+), 7 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py


