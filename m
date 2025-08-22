Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB7BCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 07:12:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4144.1755846767446598361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 00:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m5xK41qx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=032937f5a3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57M5PMSJ1241200
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 00:12:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1XNYN5SiCLaF+fP1Br2kHThVPk6issHVdhRXeR0jRA4=; b=
	m5xK41qxceu3Z4ith5JyvIjEk1dlZI/4aK2+zMK3B1bTsEeqZag7WygtKejcCicd
	s041PpZs1MJ5PSBUsjmBfy0fGlbaeq7XJJygD1sBvxMxXJFQQUbLFyF2DRn89Hl2
	O3NY0R+N08pe/cN6TRQevXhNW3FOoyZ/qJdhC1IlVE07Q/f95Cbaw6yaudSJ25Tj
	DV4SD1LqWG1tLvkl8vP6h4L1RA7Yt4XyPaINLX8wcDk3nRWwrpxoBEFhT7VgwnC5
	0k5hDnWf7csELpfj9ohBsD3Uz923JRFeoR434/RtbOqj38Y5XZK/+5mbL361bmHB
	nE0p2E1Zu2DEB77dV8xg0Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48p7pj8w3d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 00:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEzt7JPqZkY28tLP7nMkb17cTKGh053twuwTIGOcmp0h0xK+jZkNhHGp4DmuT4g+Z9jOFmuR8wzJqfD2Sgpmd8EF8pvMvPYT2GkGwtMi8IyrqPDYY8FSJZ5OCOu5PIwpSSDcqtHC9krHHxPpwXCRBce22QoTwc6rKZ1CKLG+Mi64m2Ka0bV9nMfW2WHZFayc45wxMh137iIPiuVaALSIp7I8q/u7twN7EHRCewEVsyb+agNOVv8tGNU5heLJ60XBbwBQyicuJ6/W6SDBqnEc/Ve4/Eftg+NbPFungrAgr5ibTGlcXvmFUU7cPwBE+ie2sDUMa574H9pPvNADxcKnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XNYN5SiCLaF+fP1Br2kHThVPk6issHVdhRXeR0jRA4=;
 b=L+REBK7UTVJGhTkPymFnrDjzrPMwyKvbkQx88aS9y1lrI69scswmBv5bq9DiR1KDjatWMrxWaCTGTfCn83gMqcbEEZWFRbguq1OddatukJPhoD8wInJy5DE4JBRbKJxogHSVT3/IZriTJWYLVnZSlRezoyJgAfdTWool1uBv3knE3i8mcbz2p+zycpc9A2eF71zFjfkQG7+7M2WH4ZkJqguFifIWSkRlohRvZ/z7F3tsJaoIcdwc9mzn/HGBrytN7rQrwW4gGDUIZquDNGh5JVBV7CEc1MUfq2DeEIoBp4fTB0rZlnWzIFhoxnlEdSFGsLFI57zhD0agsNlDqp4AxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 07:12:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:12:45 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 2/3] oeqa/selftest/cases/gcc.py: Increase QEMU RAM to 4GB
Date: Fri, 22 Aug 2025 00:12:26 -0700
Message-ID: <20250822071227.3304731-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822071227.3304731-1-Harish.Sadineni@windriver.com>
References: <20250822071227.3304731-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 63803752-d8d3-4370-6fab-08dde14b4af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uHV628FmHgC7n8S7g8zPVmOxN64wLwWDwLhJPPc+QjK2+IEwqT+szMKevo58?=
 =?us-ascii?Q?3h1xWpyhdgQxeRRbxPQW6O5ALWB/WLIj9YHmAu0GaiNmMKj2cItDgBpnaTo6?=
 =?us-ascii?Q?I/BoFgdfx4QdsA0wzximhi44WACkYhJ+Y5wDX1rUWUhekq0TkrvgQM72l6sZ?=
 =?us-ascii?Q?rxmzZcHsbmLOJVqYalr5KagPfy3cuP1Ka62kb4pmVDFqio41KoKxLA0A/zAJ?=
 =?us-ascii?Q?EGKkh5Had1PoHpNkF3nDfOKxx9GvOxk7pQRZMNZLaloGYNJHm1aaQW2VOlL1?=
 =?us-ascii?Q?8O3lbsGTJnvLnYoPJDgxH4LykrzeVn9T7n+LwPeCg3KZOo5qzDMy4LL7tNwq?=
 =?us-ascii?Q?8YQb3BIPRNovxsPhaiTvW6YgrYGudhppQFiku7tTpMIXN7fyrw06J+NYLaPN?=
 =?us-ascii?Q?ZaIsdBVMBCsm25tVre5WZMadXtFl7uGw+8uCca0SV9Dp4IJRNmrVMR+0hiU0?=
 =?us-ascii?Q?jTHQXgHWJau1JFVTgVzSjATFWvsp/ObIZdC9flVhUnBA0aff938juaCPrMQL?=
 =?us-ascii?Q?yWCUKIStBaP2g/fx9rz2sbt5tsReH73cu2u9Qjr2jBGshTNJ5HMzEuSgAx3c?=
 =?us-ascii?Q?Hu3AQmrR3jWaFJy+3aH/U6PYNhmVa4RsNyPW70QRIdZEOw0Ewzdys7Stg1R6?=
 =?us-ascii?Q?JACpaGWuPgLWphnNJkuvA89pZcDUN4dd7AYKCm0H1KSOx08pH17vi/2fhkCG?=
 =?us-ascii?Q?J6dEYIuugigUyD/1478E3ardb7xsQEFJFCUXNe/pSFJxXBK1W4a0MvEnt4ob?=
 =?us-ascii?Q?a6JpafaMKDBB0eBaJIXrzkqE9E5MmOUv0vNQljuKPmf/ztd7aompN+RDRlzW?=
 =?us-ascii?Q?Ua4PE/y60OPEjL7/I6uvlhz1L4pjoafXFNP0gC8yDBSOMwI129N7xUjUAlqf?=
 =?us-ascii?Q?Y7QCSlrwFD7W/IeO62bzAYL6Rs4vPiwS/LA+llsnoeQ9r15X8+GR3LlQ8QC+?=
 =?us-ascii?Q?jnqsaBIwqBfl2Ne6aiE/+tfnyGJdfb/RI+N3ad/CIsYNPGecETpYeWsGe9Ch?=
 =?us-ascii?Q?4eCwNqZVx3eDuZvsaaZSHtoJ+NaTxy4Wrov+SvrkyaIrsa+Qmp5dLT9ToCPj?=
 =?us-ascii?Q?X26ah0dyjWL/1u6D+Q9Ys6ajCk2pZXq0UZycobhZcQb3VJ4cNo936KYoH6XO?=
 =?us-ascii?Q?eNa5r7SEiVUjZZQEHGaBUNy7kNYRIfWZlIXAGVIYToKpbcSbUfZ/wFdKvIeZ?=
 =?us-ascii?Q?Wl+MtSvw6Ir4CXm0pReYIyBoTrWhKtDm3VjKmBNQJD2XW4iofcVv00aWa7s9?=
 =?us-ascii?Q?ZZxsTye9tYTldeY+qVAsm/0TqcbiU6XYwhm8Jw+81ooH1var6gqQX37OxVRv?=
 =?us-ascii?Q?PVUhfBYPpOXBPuJLlm56fB6gO2K1Xu1RY0Y+HG9y6neIlsE4LzrTcBZ6iM1+?=
 =?us-ascii?Q?JArr6vvIafqsxUiuFSq3zC44kxI79/8aV6HRnUK7pTFIW/CAbps3kVYoTAhn?=
 =?us-ascii?Q?H2Ix7upQAwYAyEgd8sVIr1/R+AGuSVxnYNijq/AiQT2qpMf8+eghYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GS2zuczcFyqwDNr5nDYcOfnKmxY/03E6Yjp8RDB5K746aDpyYA+Gq1FdcxNX?=
 =?us-ascii?Q?beglIAJYiLwLlMgaFSlMMDrPjfSoNMiHfZhrd9OQUDD/yj8fl67rSq+/mnln?=
 =?us-ascii?Q?EcmDD4p29aRiAJlSZaygFy1raT067hoX20y7CrUH8KRz3Yf5bvtXAZsS3/s4?=
 =?us-ascii?Q?d1MS1td/5XedWkhY2fD3xobwm26821IF7ypjZrjWjVFxyPMn/2amSCMiQdjd?=
 =?us-ascii?Q?wYgtIOfnMvmUhnKhIegL8UVwrWfXfFk3em0WLwAZWsWmLjjG4N53Uqplwt3A?=
 =?us-ascii?Q?1vA4RVd7z8BKqouKzmIy6Xjf7Q8cHBQzsxC6+yk5KxOs7Qpv6fsj5pRQ8dmW?=
 =?us-ascii?Q?DENEAY6h29Wru5JdcVU+lMrtlTbnkXIQMc+XBrP21gwFsveqCFi6JxbGowTt?=
 =?us-ascii?Q?nVqsHVGwY03pY4O3uSu/QBJFphRzpmWG0h4rIOqCf8Z1F/4/Kf9bzNTVENG4?=
 =?us-ascii?Q?jWdY2wv1464Y6YCP3svRaIttLSJEiVv+R1e1+CDL9d7bygbIlw6O48/Vf4qk?=
 =?us-ascii?Q?V0oH5SQevjzO+699zkEcrvgD7V6T3jlbrMhYlAb+GJGq0hlS/l5sqLFu8sgF?=
 =?us-ascii?Q?bj2022T3TODz0lg8F2SgjstrRM0zSDmrot+18A1GJtTT3JXT+ELCSZevwuLD?=
 =?us-ascii?Q?QUW9dBnhXBduWntEIOJcEv9uNK3AOpwtW0SKniM/Wyhv66V5SVS1f2lSfyGh?=
 =?us-ascii?Q?zk+O9hHD8pMD3qqcIwcWGbpsQT9h2h9Az6rSaUByGvmhaZGBCdCX/HYoGtgY?=
 =?us-ascii?Q?4fXtlw18tX04NOSL/ZVo1DGN4MDDLQPZtLCfODVmMxQJx0CBRcVDr3Cr+f+2?=
 =?us-ascii?Q?v9U+SMUtZ3mannbrUZIqepL7Pio7kZmNSSKTncfnuwIchC6xjE7b4UiQpd8L?=
 =?us-ascii?Q?gDK1bw4y5rhHv6r/MhHjEgC+p9ICz+wWxnMqmXq/pLaJQBP/9Mfj+u0M0IAX?=
 =?us-ascii?Q?3xW3uKkBiBdBo4GtyVGecvJCo4JCoO6mrvQQU6I2Pcb2WmVjPIyTvy7r2+hQ?=
 =?us-ascii?Q?zlQ+HVEHRl/KyEK+cSvIUEJoHMbvj4o6pP8HQGzVCt+8xauLiYVTQFxJ3QED?=
 =?us-ascii?Q?CgzBRNT37zspvz/g10fS5EO8xB5IaiC0Ys0vLPdsf6AjpQHQBBuCSI+wdQr4?=
 =?us-ascii?Q?iEot2LqPN5gBw4xp1QEf6MJps7o3+ml5YVhWI0QwGf1zVgqPAqiTnueK7Pjv?=
 =?us-ascii?Q?Jgn8/c5s3mz4nAytV4IyNMUQYK0fRzdRsvdB4vXSPN72CuGmEHV2kiZa4TAF?=
 =?us-ascii?Q?nfRTycti3j5NnSaUU8P6a4rEk0v4L1IkjC8eWk3LaN9a71iFBvAxbLisVj5D?=
 =?us-ascii?Q?e1rj0jyjf4XT/gVKu4hUL9HBYNIWvBvV2Q6p0HgxVwR5YEL5VCFGIsmMh9OT?=
 =?us-ascii?Q?IoBKLyq5LZX7PebcAGpOMgROtlCMQHUNhgwWdLL9pH09BuuQmdla2cdniwmG?=
 =?us-ascii?Q?fOHWDVsAf2Qgy6+kLXbYAJDTHsH7pu/RMjcXsapGKs9ntaXYzrk4RnO8SRFk?=
 =?us-ascii?Q?ob9uPQd7qNHVCufmuAaKLQ3j3AZeMOf/qEmIoJAA94RJdYJE5EarmZWOqX8v?=
 =?us-ascii?Q?gaCkAjh38fKQ9Okin5roOa0BhEALRgBvzpmJstIVczv431haM6rz4gERYuEP?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63803752-d8d3-4370-6fab-08dde14b4af4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:12:45.4106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WC3uQnztuG6ZR7jcwXi5Niv/S2be2NT7bW8+umQhGds9eS/CB1n3FWZwA8/ZNb1mn9p6BY0oaZva7uvSWMYkXX0bqWsQUMNHlCqT0e67IIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-Authority-Analysis: v=2.4 cv=O+RgfB9W c=1 sm=1 tr=0 ts=68a8186e cx=c_pps
 a=mBgp/6vq0jBVdDewdQNmxA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=jf1-vt5JTc_DrvcgX_4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4K_KHeJc9v4P2AOAOA-ugfmnqPeBO4cY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDA2NiBTYWx0ZWRfX3VlA3G3b5OJy
 NE0l9Qn4NYEdXii9w+I1S9Bh0EiIlI3h6zb96ONP4QM66XG7NkY86uqJIpQLjfcIYdEVPRVZXYb
 QZ4026xwJktQ5Evssb/XEDRLxuuG9u7Zx4RUViYlQWQlEH8u/KoDK+cav5cvM5ejbn99d7dPEoE
 cK9ZzcONLNOkTK9kPutsgKlktvjBQ5UNkQE8ZzBStIfqsCdPjyI6L7K12b2+6GMo/LPbuAYMHxm
 BjMfnqUH2tMDfUjSA9aPq+PpJgktFlx18+7EtepyIZQVc0qMvszSED3qGkbWbzkWpYffH0K9K3I
 WK6C+ekVHF3EpeyglIbstFNTtZk3khlH55uJX3pGmQxSNeFSWnEZQdqszU7Vxx/qfqdWo+AsMMv
 tNvE6W1VgIvuKie5lrt7i2HqYmuhQg==
X-Proofpoint-GUID: 4K_KHeJc9v4P2AOAOA-ugfmnqPeBO4cY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2508110000
 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222307

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The test pr61599-1.c fails because it requires more than 3GB of RAM.
This change increases the allocated RAM to 4GB to prevent test failures.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 1bda29a72b..eb8082db28 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -79,7 +79,8 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("core-image-minimal")
 
         # wrap the execution with a qemu instance
-        with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+        # Increase RAM to 4GB to accommodate some GCC tests that require more than 3GB 
+        with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams=" -m 4096") as qemu:
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
-- 
2.49.0


