Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B143CA5FD1
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12566.1768931676163057777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O5IkzNcS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6026i1135001
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=; b=
	O5IkzNcSPkmqIAeHzk57qqN4PNbduT2HcNAQUjV5bpUsxbznOmdb3yO/NvOOL2Oo
	yFjHYjNwlagwUk3oP8b3w6lllTjDo9nxdVy4euUPVLeijXNwY1EcY8V47sxJzxQN
	4wWwk3fiTxXu/+Go4LunJ2Ig6iO8MZvhlH4uwjSingRqeLrbM7YScZP7NWVhKVUz
	hTLiykkVXOFqz/YzdBeOVUUo1iNqWog/cK32R9uMeVAfq5Pe91F7VNFCszD95VUt
	5CkNCWkhXsHTLTL/nbI3+BoxA452uViW6nzuFOfJqQMXUoLcNtp7LIl8PuuVsGJ+
	HoALxa3/BRS8etpuujMrqQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d4bcqm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/1Z/hPYf6ZUCBCkgR3ediFhYgcZYSnBuMQOb3RNuVkQs7UiWFuXBf0Gf26tmGGZkXS6RqmfS59/fEl9821qcO8qLQRMSXPEDKE9E51vWds1lEQokupGCvDs9a8glwIgZuMznNqRlOny6JnB6E6bbmBq0WHthnaZ0dacJucnayiq7SKu0dNRcBCr74cv/L0rPXWMDIXLeYPZ4kys1vjtSE26ffTVd3c5+HIIAcAFFUxIfnkgHll1udOnNYLNpRb4/v+LPAIsdtlxbjHIH2RCeBnljP8Hvl76E6IePCE02zIvymJ36BqYVCK64Wu2ND/hjPB6mJwHe7cABAzI6eW+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=;
 b=TJQAfFMZ0MwKhr+x1ErEoSAb3844nfMGHNPluDEd5cWxAjRJtr04AQnpRC+hs2OISp4JlqLCJgUDfpf2NUDBeBToQBilelQ47st4Msl1XCRGei2A2UGoigM+3evVB8TodAvItR0gGvV3uXi75bKpq1Kt7zklPf/vgo9EVeLYBbb74oN2TDy6UAjeZkoAH63mgTe1glGEj1IQMqQWLkLWzhLitv2MO/GAAUf02XRIg4zK/mmLP37Qz5pS8A78G97APhVVZWIWmQzEKEUbZsU0+Q5hQTpI+R4HcCKD9xgJiy3bI+yqfpQmRFu7cLFTND6bkIF69sCJwpnf08W56T+VnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:33 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 12/16] kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation
Date: Tue, 20 Jan 2026 09:52:42 -0800
Message-ID: <20260120175246.2052341-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbe4152-e77f-4e3b-3e82-08de584cf7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rK6T7GKt6KhyvHV8cvddiMngmf7m4prrcqPrCvK/u2IImxtiHmQMBTQT3agx?=
 =?us-ascii?Q?rTluOv8PrIeuxl3DQQDSDjX1zSfPfyQrejvx31PlnEtdcrtY2Hcu7w+gVpQr?=
 =?us-ascii?Q?5BJmK0ZP/rSSmXBBeL9GzLGRAOi5wSaB+6eqwI0P6XuA9jLlo+5+RT3+O4he?=
 =?us-ascii?Q?uV+XUdgn+sNFmtq4nc+xIzB4lCrr0sGz6XFrjgfqxKBMhwYWlvwYFtBxycgM?=
 =?us-ascii?Q?9T+tJ7YDJNRl5s4eSVyf2iipEk8xeQonQgmRe50ZtksKlDxMfYwIEXyiNuFn?=
 =?us-ascii?Q?ZS8rhRMZzwi60o+25+asvVdVqx/mCWPZO24zzpxEat/jhMMa5S7QhJgU/KoP?=
 =?us-ascii?Q?oDGthCnfSCbwqIdDwrsA+oqfjS2dIwQ0w8S4OXPZtvaE9r8CJ+HonF08QwsO?=
 =?us-ascii?Q?NJRT3zdqwNbV9fqVmqad+STzjOrRvsdnIDtXHPJYt3qC5UMZjrt31XtPQmEn?=
 =?us-ascii?Q?FuWBITeGXJtIADjpPsCuvuk4KWwJNy5y8p4/UQh2TIY1moT3LjPBdIzkj2sB?=
 =?us-ascii?Q?vAIp7vIKMahFo5ftLsL+hsnYdPXl5pYs1/VcOYspREaikgBMwotPI1XMh0sr?=
 =?us-ascii?Q?KJykr2kLGwG8+23+EKmAI1UUd3jPCT2+tjqZk8w5dIhXMxIFyDUYZ54H7Xe3?=
 =?us-ascii?Q?jwgnLrPfQj84LZ3Mu+DIJCV7AlAZ4/QhL+Gz2LU5WBJKMke1AM5chTcn7jfq?=
 =?us-ascii?Q?8VN4Ru174f+yRsJZQw3WOXmTw57S/NGSEVCUOCU8ezt5SOFyGxvQP3ofo80m?=
 =?us-ascii?Q?oWAllW1qKtN+V7hBGgbDpWcak8N/R1iIVq7pFm+HBCdkkKbdpehXt1vXlFGj?=
 =?us-ascii?Q?Sw+3/Xb8pZt3uxdlCwown3BMyQmUqaQ10Xfaeb6J7GV900ZJY95SO2iDEyYy?=
 =?us-ascii?Q?OcUbrZ8WAJ2Yvuobs0Kq/VRviXhHJ8Sc+J1oC0ZphBk9/7HfGR30PInmyYEc?=
 =?us-ascii?Q?0qczrslop6QUbzqUBT/VXHBnrdnwhOcPuJNH60B3ChpIoYUVxFQ5vt1XLn8Z?=
 =?us-ascii?Q?/Jp7KXa46Wy2q+gxO9jxVvDSXBS4nejFUECsT9LigMW3Ld+jmWhufCuos1Oh?=
 =?us-ascii?Q?IHhnoKF61Z4yj0nkijEu3Qvyplhai93/GDsKgevMAPsV6Oc/aSLkd0naCBM4?=
 =?us-ascii?Q?URef6iho7pzmIPkVP1aKuIEoLOtHa57y9OWSjMz84I9LAfa1yEHviYXpUJ5o?=
 =?us-ascii?Q?ThC3/0GtnF3bH4hT27NAAVhac0tvA7TP3I9UekLPwIehWQo2VUSjsXwyxUM8?=
 =?us-ascii?Q?R2WMhFt/rcg+7FBHdLRGsOiAsFnQEazh8sm7dzP0wGnZbqe3NVh/VEw0p/i3?=
 =?us-ascii?Q?HG8+WT7vs6PQ2OxGSN8qEn1mcg1rEWbP0EfD51O5ZeYQ5cWvfJRhsKa02BzM?=
 =?us-ascii?Q?+1ut8lnM+ewuPOkTQ9qvAVpoH8pnaXpFurMcxg7hug5uF3aokANKHBraMwom?=
 =?us-ascii?Q?ZfPomgozQLBCdQ/WqSnqhb+W2qVHq/uVn+6Q1s4nhGSawQLXZjzGsTfrYOem?=
 =?us-ascii?Q?Yn6trWcD+rasXDeXIX3WPu1WDjpSHyOk45BSwJrPyOtTuAcW6yDDNTH8gBqq?=
 =?us-ascii?Q?gyM418INUM5wq30EOaradBVt0uMrxDSbm2biYY1YIL6xKY38r02sdR8DBeUO?=
 =?us-ascii?Q?zVfcmZCoqKe0iHmcQ1pPMsE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lZotHtgeNBYtmDNk9Jhv4Q4YbAHmAWi1i7QV2iQVZA38k47M/3vDIoQkvvkX?=
 =?us-ascii?Q?kc1saRD4Pu0OyRv3xX/gLltSHNMa52fHRlUvlVaCeBseksFNVKyw8u2dF5y0?=
 =?us-ascii?Q?aFksCq9jk1wgl03pScmATd+bo25iVhLT8TzauVPWuxhdehEY8o8a0gAlnMfy?=
 =?us-ascii?Q?GCuvtjsHaZ01YrK8Xaid1tTr+Cj1gUCZMT2PmzluTwV2BK6QUlpN0bX6sea7?=
 =?us-ascii?Q?cfhSsltSlufPeJmBu86AO1RMwjXK6PrfVT/QuW48GG55NIFrKzM0sMeWef+X?=
 =?us-ascii?Q?8J7RO5V3S9TB2gtAJeCx5N9uHgABbkbbL4gKS4QP0Q9GUcL56VikuV2j3LaK?=
 =?us-ascii?Q?WGi0VwiYVVzH4j+KTtT+Hj7gk8EfVWkyq1uEsgTcbjLyveiAde/dcBHXczQR?=
 =?us-ascii?Q?u/9iFdiCkbDcoc5vSXtYY/5ZMNKQXOi3ZN+2id7r5vANRJCX0rHgcgJaeFvt?=
 =?us-ascii?Q?b0xsQRrQyJ61bS/ewWT09U+d98lRCU8RM226eDFo7Vz6njDxJnodvwCSQRyj?=
 =?us-ascii?Q?cSswO+ZwDPJ7lo8yKLEtV+knWi5Wd44fkce433v01w5tFAnGDyr3Zu3HRKRV?=
 =?us-ascii?Q?5eOa1Ifmnd0ml8ty12Lhpbdzfd+QMMXZI2s4xP7EN1Bd4r4RBwY9+zK3w7+9?=
 =?us-ascii?Q?WJIt9Nz1myLJNb6PoBPyNS26XNXPQgByC9XnqQU87VBll/Gx+7eEeDRzJEtW?=
 =?us-ascii?Q?WWDw8FX5gWB0CmA/hyMORkO2mLqc+wG0zjcqK8abALnTxA6msB+yP166jFgn?=
 =?us-ascii?Q?N5bFOlXKlUtiONsu58O2jFnib07yv84ffnBcrEtTOhLZ7RNT5QPCmp/zhWSP?=
 =?us-ascii?Q?869dlaNx9rdY8Q6L1xbtFmjmDEG8/SZ6LhxMukrZ3SB9bcMTgFmVdwRXAdXL?=
 =?us-ascii?Q?K89dVAgCigKKERN5OiVcB6TQoCgcaOZBek6etf7LtdTELjPZFYKl5ZjaMLUm?=
 =?us-ascii?Q?T7STQ8k8T6a67KhSSkabbkYq51lucswQF+RLPjCF1vCuo7IkEuWpubLAa5x9?=
 =?us-ascii?Q?yXaqxjKukcCz8g9gQ2VBKr5FVfHDwjTqUXI208PKSc0RRr2sGRtz66EyooFF?=
 =?us-ascii?Q?zKx3mSAoRVp3IqaOTw/obub88dzA5Gktlzz5eomgogxTUBl7FOONOAC4HJ6v?=
 =?us-ascii?Q?3CTJ3t/fDodezS5EI5E0CPa5Q9tzQskph180UC96RFNfR5G7f6VJSYLZJfgm?=
 =?us-ascii?Q?v829btUgJswMOHlC4MO2Gj0HhyojVNHvnY9oR/9Gw5lBe9OZb4EuJBQwHdLY?=
 =?us-ascii?Q?0qchgBayhH0BPKCPoAwZDZ5ItKoYutiCUKOev76mvUass7/O+j7BA+dvHG18?=
 =?us-ascii?Q?TrHIiUN16RB73vV6PyJjqoycWnsYgNwrIjw8qk2tCdPx5a1uV9Ik3ZNfpwGX?=
 =?us-ascii?Q?Xc2sYhDe3coCz84eqA4Oa5uUavyO2j1YUyeE0IqWFJIJL+7affyCbUp6dGsG?=
 =?us-ascii?Q?j7qIed4f3seeaK9TNwPLIU0pwduHW/3pYMvD5DeUERB807XLZqesehXjNu5C?=
 =?us-ascii?Q?fT1lhoaR2TkdqxWKJTVUMI/fO6kQ5G6/St3+dFHmK4++WddAXdqK3K6qc2sY?=
 =?us-ascii?Q?Fxcqv9S6dEQxffbcSJo4D9b7uj50SrCD9MJey21adR2+yTXcGGuQIyEBrndS?=
 =?us-ascii?Q?HSvpV3zQdD8+Ik0XESMGS6XGVgzk+4GbuqE/OYKgWkHdDtPet7ENK9uD2sdf?=
 =?us-ascii?Q?XgvAAsECNWoLsv8J0BWKcU4QieGciTvRJ9jW1uZhnukVNZrmTO0xAn4XTmOm?=
 =?us-ascii?Q?ZwOKs8rrQnOKntdwrleGuZJPFpSpZ0U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbe4152-e77f-4e3b-3e82-08de584cf7a5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:32.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23sajer4QwiG8bYQYO8C934FfNHSeL37fQ7lQHBdVPtzWe+he7moHPsECRH1jpvnlYr2RDb7whKFy1osKI0CS6LOxeaio32niaoFSu0a5N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: c4emvRR4bq26FsXLHDRHdwrc2G2u4Srn
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696fc15b cx=c_pps
 a=z66bnWj0fqQOmAclyDzAfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=AXdspKuNlVAGVjIo0CMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oLkLMt2Cyx5dcBuFwf5H8S7r1FmgB7PE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX6QDS4YpxYB9z
 keTKDDSJqTxXgJ57OFM4dapDQjkGwWh3S3zaBS9DAOo2J1wstgz13c6dMcP+YqbIS0iohA0uyu5
 Megv9o2Iqe9XuWTdJVI6KYr7Db2LNb9gZUsG11OlEQ7OAy93uZQJc7UjmYCZk8yCJiIEFR/HpnB
 9y+zQjrjoD710RWOJKqDBU+I+P1Ppsl2NJAsIUTW1jFIi6OMhDi327FTrSyQZytLf17A1Bpli2/
 qQ6uHPn4n+HXyc4v5QUvoC+PaZA2LiY1qqP1MVu8a/Gu0wv2w/gFiq0So1mJWzLG4H90iJwJY6x
 wOi6gkAJ6Q3AUb2rHuZU+CrajqX/TPC9VKE883Fd9/ddoBTJ/OtAqbcARB0a9OKZRPjOvvm09eM
 0xWvnsATFAF1n93VCpmjLJtv3E7dZsjT2kAwTuUaB9UTaVYogCBNTNkJrmcJ4/Ni7w8rrsHB4Pj
 Vv8q1P/OG3XwdBjczNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229759

From: Yoann Congal <yoann.congal@smile.fr>

Publish artifacts from kernel compilation to allow out-of-tree Rust
compilation:
* scripts/target.json: target definition: architecture, ABI, compiler
  options, ...
* rust/: the crates compiled by the kernel available to
  out-of-tree-modules

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 30a10b0801..dfb8604a68 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -632,6 +632,24 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
 
+	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "false", d)}; then
+		# Copy target.json file needed for out-of-tree rust modules
+		if [ -e scripts/target.json ]; then
+			bbnote "Copying scripts/target.json"
+			mkdir -p ${kerneldir}/scripts
+			cp scripts/target.json ${kerneldir}/scripts
+		else
+			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+
+		# Copy rust/ needed by out-of-tree module (firstly for the core rust crate)
+		if [ -e rust/ ]; then
+			bbnote "Copying rust/"
+			cp -r rust ${kerneldir}/
+		else
+			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.49.0


