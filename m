Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4CCEE01F8
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64838.1767104184705403133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E3aDqM0o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUAfq7x2320892
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=; b=
	E3aDqM0oFrUNDjnd9sog58q1dS2yGqbJ97ZxQJr5iEOPC5YMtBvh+SbVaJHkd2vX
	7PFB1GNDvp4gZJxBTnRis8Hu8Dl0SmGBRUt9g9N83Piq5xMwcQ+E+S4xS9KMl1P5
	DEQlcIFVUeCLz8wOkU6opQix9Kvm7MnAXEbPdq2ULHsmgyU8zpRW1f0rah4zjEZg
	iD/MjAW8rXw+3lmJyzWO1PPnB51HqZyMJFmFQzbL3kgGtCTKDb6j48agzDlMlAFs
	V+dIjCLupilQsF4Cwv0nBiYG1r5kkAHFJoe85cXD7wkm7l4Kx5WY9WgrY6zOGiS9
	PN2i+WTdHF2KDfRyULhKWw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxtxsa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAxiWgvmerVwobygOTOHaH9UJRAd9AjG2kLi4nU41Iz6kXXM47AUaj948tmgi6AFUEW5FZbo2hNioAvb9D4lNN7GdF9mI9Ue/fp8CaJsT9kMr3FT2qsUGDcwHQlcvMv+6ORdU10tGuu3iOW/mvPQvgsQQDybIGYbRxvKoYiHMbpd5888PdwCZ+8lOOA2lzt1wm8bb6lHnRuepKhuZsfcIBRpY8/AbEPBe3ZiSD5bnQU2KBTntky+PSW8w5c/MWXLUQ1CgWuqV/LZriBleF+Z+UtK8I0uJvMnqEMgqOr8CurIcg79jROPvmo/xuA5u7/37jm4QYIKKJjbDELeGrrNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=;
 b=zJGcOVlzYADjjFHs51tR5Nd7SJ8wnDx0G9zWtZMgNPapvAiX4/pOloBngg8RE3bZw+wMSw3xyVyAodJUJ4HqMss7RWeqw+W2ROR9NUEsrcTP5nKXkqBsxuqljwrQqqKE2I3vD8gt9ARRoZc9DjM+FECb2MJsbusogJcznuba9ALioa1ze/JOxW1iG3oQccCsqhlqhuENGssk7ShYU14yAQ/3sVFj2M+Efveuc0wPVx+ij4+VsKHZYad++Agfcw13TXWLHe2Hw/E21ZmIJZvoOPawHtcjzaPE85YXx3CVenZdxNSdytuYR30ngpuzjxQLnBZTTZTBlvH1sOj7dJV9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:16:21 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:21 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 01/15] bindgen-cli: extend BBCLASSEXTEND to include nativesdk
Date: Tue, 30 Dec 2025 06:15:26 -0800
Message-ID: <20251230141540.1974380-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4206249b-c5c9-4e99-640f-08de47ae01c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9um2kvV7vyQ13hIw8tkSy6X8Ho1TJzy0VOGKWh+n3R8wRcu8IAxszm4C8Vlh?=
 =?us-ascii?Q?TheF1e06XXEZGcrt7ZG7jJnHu+k0O2UZcCDTWSdMSh0lEZ2SIOdJNXpzCOi5?=
 =?us-ascii?Q?MLTZgYYUd1sy0sm66Bb6qtWAxHTiQVQe7NGni1irXigfkoTJB9cfs4NbNrD4?=
 =?us-ascii?Q?iGC+yk6m+LxlV6uoLTq/k+8jJBSrZlputfIUqFmeTSeDJr3BCEnOsMH/06m/?=
 =?us-ascii?Q?hy7a7eIRYOxe6xiUC9RoXHaVV6hoBlPTRww893FSMJzOyfuWDysmbpWUaC9E?=
 =?us-ascii?Q?vt9pl9X7gKwl6Yv7CCrpCqxX7ze51N6s9pekxIN4kT7cRTcBr8kaJDMqA9u+?=
 =?us-ascii?Q?+X+EYUa9aFpFlVzhM/yKCjMDSrzZ0OrUGoE3cK4ru8MAtfVBJmt0TThK+8bO?=
 =?us-ascii?Q?2p2SW9tuw7jPfkGqBdAh28fb70rUnBoc1s70LFkc7wSQ4Ulv503bqI+mND6y?=
 =?us-ascii?Q?+qesCp4sm/1E/jyj6ld5ngzSsass0MNEvV6jwtanOt1HGekp+lIcmvZ3WW5l?=
 =?us-ascii?Q?dVhrFwFejfgr2SRQOUIcbW98zd4lbaiFtNBQQ6f9Ysh0LF8yDN50vP/MfYFl?=
 =?us-ascii?Q?8n6FlRUvKHeSFQT46LvF0sR4V3vZAZl/a/cg2lO62je7wj470YFWCqXt2KO6?=
 =?us-ascii?Q?cyaNteyBR5ZfxXODo7CzdSK+G3g8PsNkQhK5FjiHPMm1QH/6GDfI+eqtu0Ig?=
 =?us-ascii?Q?hMqgEehr/MYxmGL8w8Jqwfru5zTV/YC16W9TqHPhJZqEtX8nHZix1CGtjbYF?=
 =?us-ascii?Q?fF5zEUIzsrxAIBq1qbfBbTPSTBivoCanPQccTy+V5VENaySOMQOXSeRpA/aH?=
 =?us-ascii?Q?TTuvT43cAEAJG+5+jEDnp6XWStBhinV7/WuZO6D9A0e4iNV8NjP3IEkL+OpR?=
 =?us-ascii?Q?IcymnJNCQiuCyCqd9GCFumT70u2g9EO0G7AapemnsdeahA4WRO4kxrqZsCTe?=
 =?us-ascii?Q?aBOHNR1Y+koTtvb9wcNV5OZ5mVW/fD1yzW9jAG98Pqhgb+ilafjW5Lcu4mja?=
 =?us-ascii?Q?/Ui3iSSV7CfnXbycd5EWic0zeZZTf3IDvDIZkp26CFBC1ExHqe1o8k4Y8zoM?=
 =?us-ascii?Q?Bm8tV13BHr2hKSr3WcEKfrSkvp5LzBvQofcyBR759KDCQmYeOKExQ83vjVks?=
 =?us-ascii?Q?APfDNWtm8fgLC49b4Ne+SUS6z5M/yB6zq+qbyvMxVc0ZWNPzITuOl5Azvi0d?=
 =?us-ascii?Q?oRlfUgDNYoOfZqOWpjlOvt5ZiYX0y5uPg+N+RhdjdIMloN8kIJ7TohS6axIE?=
 =?us-ascii?Q?s7T38EIFG613+1d9mCHFE9DgAgd+hO1fetNaBf/qs9bJK9E0ad/CnZOYm3CJ?=
 =?us-ascii?Q?i2g2hXpBYlszUhWMLxD+VjbpR5QtyofHqA9u/8Tu5SesVEt45LMIQi6Dn+s1?=
 =?us-ascii?Q?Sgg4cSMCgdm8jLm+JZ80uAWMtFs129+B8Wa5AWs+9QoS6CvSEeB5l9h4p/19?=
 =?us-ascii?Q?SM2jV6NLd7/UU9YkRKAOBuRn/cn7w43GmvSXq08FQH02kqyJRrzb7IQTEyp1?=
 =?us-ascii?Q?0FG2wokU5wK61/eeogVXeIL1nIDzkbrUB8pb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vdSBkZt8l6apGfWORMky1eFPelm402+++b94QUOI7PnVhsjjKs00EaQxX7XV?=
 =?us-ascii?Q?aIxCN1VG7L5CRdSR4e7QAaiCvK5pvFRUpCnOroNSXIr6TaEtAm17dC31Ii7p?=
 =?us-ascii?Q?zOhjCWQkjz9tslUT9ZiechT/2RYS235tXaUOS2Bhnf3rIQFo8zZCKn1OlD5w?=
 =?us-ascii?Q?Y+/1791w3AeCDHb1HE+53ATjL75a0u5rxTi8GopsXlRLbEqswqUiduQ1S/Xg?=
 =?us-ascii?Q?jBbX9XuD4sQwZlhIeKBTSshpZ1acCPtwMjt3OzCQK51OnUYLiqYaybY1RGH+?=
 =?us-ascii?Q?MFRucXXup1jBpg6wIggsKBDwMTmWWtCd/F2JBc2RzENgIvTToYarkwbzpmBV?=
 =?us-ascii?Q?zxMnViv8jd/hMWKn/6oGZnNxXjUpA/ZAPje2rvUV4iIUbSdYEXM30YzXoX03?=
 =?us-ascii?Q?dbe+UKZaLJVmwjYtxECoAqtGWGVV0eRPTZ9QoIFT7hoHrwyJ7+Ar5lLicYK8?=
 =?us-ascii?Q?UXuKPlBK08gy0GpGs/huV7SaKp4xVoIDJ7uGK7MELSvGLvOzozlsGA0BIYeN?=
 =?us-ascii?Q?Ul5jNoASxBPdWyUqW4NlnZcmfRh2DcHQyizHp76bNnUlzmy8/nL99MjGaSAO?=
 =?us-ascii?Q?rrVfjK41GPQo+tg1rZp+gPJxdcNlh5AQtG1y+SFe48jztfUa9UFO0H5ITnwE?=
 =?us-ascii?Q?mCsFhBugpGdLmE5UoaT6e3uFqGQ0AEvQoBfZG6iI2BfwPSZiJN86AI5/UVc0?=
 =?us-ascii?Q?Tv3euG3s0L9Zn/4nXAP4sgoL+DVOr4qS+97Keh+BBn4vTcBUH6+VI3Uwey10?=
 =?us-ascii?Q?xMv2ZkfYFF9fU32FAuINMlclO2e6hNJFURxO1HEFoFyE8KAM10fnu74aUQ0I?=
 =?us-ascii?Q?cQqK9tG0Qdx9uCzzRUVLgDIG+XKEtq+8MNw2LrzBv4bdi0Qy56DOPQm4vCi2?=
 =?us-ascii?Q?OcWz8XLLGw7QGCARgJh9t+MnR6bGX9kmKDpgG5WI5WowcNGa7eDUwHnTS05s?=
 =?us-ascii?Q?qm2y5JIWkVLIgp5+zo+OUhuSVstiFv6ZcH0cTZnzGGmRnZEHKhUuEcuBK8J6?=
 =?us-ascii?Q?FEgiSNEZm5g5C0ulZXeqJGWzKcmXqs8PSfo5IAS5yXd21JbGKIrWiuthaw3g?=
 =?us-ascii?Q?Q9Atu9JP2OJz+wtnHfRJww/1X1k/9tfZG9VPIVxRnSFvF/fts8x0rHD89vFm?=
 =?us-ascii?Q?aHxGWGYXkV9nQyT6ejkBNvCfCDqJj3YOI8TiPDwmPF7S1n5BO+6b4rMCIAWh?=
 =?us-ascii?Q?e8tBbQa1NUuauojZcfS/DAchfOFWIQobeDI4JIIKrd1MYnzHZeFheIaEd5X4?=
 =?us-ascii?Q?sh1rJRe9ej0p1d0BRPkBhW51hQEpC4UaLwAqU8kAdpn3Vts+HcwzB7WXu46g?=
 =?us-ascii?Q?GkDtXmhIxdFT3bGFdtngwWtSsHJ7rpiG95lPLFScAUtttueGDmOj41cL6AfH?=
 =?us-ascii?Q?H7yjyMl/469mrASBo+Mz2GJl/616sax1IP0ofAKS9Q8CdE6ZE8tP2VAlDMby?=
 =?us-ascii?Q?bZcpPm6N6fe7sc4bBIa/wwjqsKbCIkWHHGQ/5k/+tZOqmBMNkKOsUl4gjqGH?=
 =?us-ascii?Q?dpwIurrt5G+a/muzfv+ei0u6vLDYN+XfeIRABXqDhhTFSjA9mBPXy3auDmYq?=
 =?us-ascii?Q?K64sTzCauNoWRjP5W6q2YfCsbIDH5cduE6RM1JaSKq3nByXJCAnNOwekP0HC?=
 =?us-ascii?Q?OC2mKn8kj8eEWWkV+UBbKDCbgHja12+Cz1pKtHFpod5KrxkHw5ver0FgQwFL?=
 =?us-ascii?Q?l84kRG/nl3Rd0wvohz3kQmtl5j59tGAXwBecLDafthwnvCnIBdiGNZkHM8Qq?=
 =?us-ascii?Q?X1y57N70gxDkaLMKBznwBaOYbk4T7oc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4206249b-c5c9-4e99-640f-08de47ae01c9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:21.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyAfnx+Hw2PIT7AZcQGwMIpSlARMknJSneaks4ViXvjjkFSh0d+d9QSoDud2v8H0w2J0mi4IuKL35IqRv+pw8GGVNtk4ccTpf+seZsEp31I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX6td3C8Z40EQW
 8/umE3lJD8TCZfwMDF3zaOaQozW+qd4P+aBu/pfA7wDm+rAat9JIqTtuISw1GPRZuZf1EIk7wkA
 PBfECH5bBfoLJXZ9Ol9YDTuB9w6GQwMmNcNGiXkuqg/7CGdmkxCMqoLWgpZ2DapaaMqdBmjK45c
 cSgPh6yrIVpj0yy1BEqTjkJd+OMAY3DBKoforSnwicEGUJylOgCUsJP3f6RR/ly5lDhN8tORFRe
 4X0W2i1mhXhg9Xzqh9B+gTvS5bYqyUnvV7xoZT0W/l8tJiwAqhnyvxbd4kZfvnl1lk18cBGoHKX
 ShZt79q9jiDp/nwRpDs9T3nsak1Mz/5qXTwbXJKTbOYa/oyJkYbF6QbGgOvNvKYNOiHbhrY1Bst
 UPG1vAqGCT+u/tQjoVNwcvy4QMRvxIx0FGNVzBg4GYu6hmfEmituC9p9uLMGYx0pRRdwTnAJq80
 lhg/AJhgdAGCdh+y4Zg==
X-Proofpoint-GUID: PDFoXnW69REN0hJMw7O0QH-9nerYCdy7
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6953deb7 cx=c_pps
 a=q0do3moUNMjvKVsQ3EtoVg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=giED5mSNaOMbM826fEsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: p2Ym2H4U_7lidbrnBjDuMr0hE1rMHh0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228667

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To support building Rust bindings in the SDK environment, bindgen needs to
be available for the `nativesdk` class as well.

This is required as part of making Rust available, where bindgen is a common
dependency for generating Rust FFI bindings from C headers during cross-compilation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 2f3ec04e82..72dadfe52f 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -15,4 +15,4 @@ do_install:append:class-native() {
 	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


