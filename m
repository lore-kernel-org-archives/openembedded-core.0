Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0327AE6C610
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:03:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96610.1766473409321074945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WraFHokY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4452694da9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3ptQV083540
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Vos3y97Ep
	8l4xXHEM/P3hAN1MI5uH6zXn1dmzka7PwQ=; b=WraFHokYRqSFm78H2zFpZ4PDC
	GGvR3oQljTGVcstUwXe+QrDCacaSOZnIScD/CeRVpHvxi17EpnKqCfZyKx01CFbw
	B6v9cOCZHjqxbnxeZ7/kFLjASTb/wReN9LDgf/JnH6MUxNgwYsHgqyeoNssgS/jY
	BMMBkdyvLUa/ikHDK9oUWZnyHRbV+XqpInjIcqtjpAl4nBxtxnxXCBrcesfOvhPq
	yDOktALJvB0uVy5yRQDk2ud/ghWlFGlC+qvy0ajL8KtCtYZn69qEKePEyeB69n1L
	v1wR4kO0SwB4EkU49AYYEyF3pryU+ZjyyhkUPxtkStcelgfBZA/SpS1kwQr8g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js72qau-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 07:03:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKvV6pTh6COvNANvpjUg0M1CCGy/tVfyg4sPZUVTGze0i8JAvUijTRTd+APLu16sNNmOuTVUymz3hK/OaGH0bpLZLD8s99Imr29ju71tqQGR38Rcp8YGaWIqzWGHtTWftTVYjWyF8ZKe3CqT+MP1OYjcJ1hl7JBJ/r1tppk/rgNN/UOmYJMFic4vjoetmrE3dL9DUPrTOkpDh61Rzo8ZWDalFTcSddH1jWVnZxsutCK5lYrxRu0AA++LTiyWs3Xjkr0PJFUW4QEW+K0/kSKTwFfIcMURNtouD1fVX2SGGPlqJj9kzO8p/BzyEJ9LKsbvcv3npxzaFnh1WpHN5R1IfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vos3y97Ep8l4xXHEM/P3hAN1MI5uH6zXn1dmzka7PwQ=;
 b=ptf50kEAv6LG6jETRXLa7ieAD4Qi9ofu5vPZFmAYb3GHCregngduFpL1/czhbhjxQmAW/3nkk2RxLe/eBLn6PHwzbxfJqn6+K+XsA0Msc2EkW3z1+A567CpPaER61o1fEQ9LRNW3tlCh2Buy290ChMzkDw/j7WzihngQK1Xv2R/9hQI2lvIO4oI1GSvhTkOB5kFoyUA2ixf4b9GqcqmXlgrIqwGuTJpniOXlNuXrEbXw4GRKIO2xQ1UCngHp117f6R4LZLVEqW1ll5D+bcQqX+5G02aCsNo4gTWqzF1k+bKnFaRhlMI7uHvfYfPpcKC6rZKAKuMuEmXdBQkcocRWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 07:03:24 +0000
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24]) by SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 07:03:24 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [whinlatter][PATCH v2 1/2] binutils: fix CVE-2025-11839
Date: Mon, 22 Dec 2025 23:02:50 -0800
Message-ID: <20251223070251.3052834-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::28) To SJ2PR11MB7599.namprd11.prod.outlook.com
 (2603:10b6:a03:4c6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7599:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4fef1e-8519-4073-e090-08de41f15d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PsbTW/kl1aLsvhGcGFowjQVQpTi0D9YytD33guhwMgBIBfu6yc0PkgIzZn83?=
 =?us-ascii?Q?Vbtmscq/EoeF8Ge3+UO+c12VRM8zaswguIP+0beQwYCOVOPZiXmFbcbsAde6?=
 =?us-ascii?Q?O+iyX0GorEErhEfWd11Vjmr6NREUwxZZc2GDjcDSLIn9vY2pH5AGSKhcxIQo?=
 =?us-ascii?Q?IZDgutMu0YlFmGfL0Xk6cDWVREBSt4loDt4L+r6YSmF6Y0kGcYWi8ipmAl9h?=
 =?us-ascii?Q?/oQ9tk3ieh8gqkMbENEpCLlyPoGCTdYDuPUMrxxAEEfxuw6zg6qhIou2pTjx?=
 =?us-ascii?Q?WNRDofTy6axj+ZtkSf43EpJcA2qQayg6dIQpuCpWKrxR6beGGHdYgOEh01+6?=
 =?us-ascii?Q?8NwgKlmYljSZq7T5nTfQvQiusBsv4HxwjnPR6vsNTmq5Gg1dsUhSOsLIkCNq?=
 =?us-ascii?Q?F2UMED2+Yc2XKRJwD19OKjdtYr0FzeRbAhPM2wpEGBK/3w5yon1Y7gFrnumb?=
 =?us-ascii?Q?DtEDZfN2kCiN4Quf78kScwuJCWj7zjmaoOpT/hAZq/iLPr1ltfXuvagSm4zs?=
 =?us-ascii?Q?rWp8AkOkbra3usUqctkE6ABkexcj5LLns+OODH+iQe9MFjlY26bwtLD0NCk5?=
 =?us-ascii?Q?3hiC3s85ykLmKE2oMZIGz5+1Jg1wv9BXVgt04kHQfgkkauao7/XQ8Ykl3scs?=
 =?us-ascii?Q?aLH2GRLx4I9KTovjMpvC2sEEk6PlL1Yl/897qXoj0BQH0/fXYl/zgaOCTJVV?=
 =?us-ascii?Q?qVKnfPrDIQwJMaNkEXf/A2CvtWVNoWyNzxOrY9t7rUaKKUME5iRvwZdbgsUM?=
 =?us-ascii?Q?cgdz+YzQBxegWSxjKq6ui0JL/mbfOX/aCfdA0yyA/rLnjQYo34aC3p3d8tWR?=
 =?us-ascii?Q?i++ZX+sXHDwTJDxk3H5tngqOi8eEy8wE+0i5VDOnIY+GvILdvgfwxQeNglhc?=
 =?us-ascii?Q?VDEbS8u26OuXCnlq1ZlbQlHXrvPcRgWlY/uv+QH0eiaweDOs0gMCWS2Yyuuk?=
 =?us-ascii?Q?F/ZQFyDRRv2koOVdZa7SBVSObOXWx0w++vfxeOAnn7pjgBhrC3c4aZfDEsj4?=
 =?us-ascii?Q?mVkl/sPc7JFaWIiXiLRV8vGwy/fkltuPV5L/jGFpcW3pIV9Yto89BJ0HdmTP?=
 =?us-ascii?Q?U0RuDBftsBSh4Wxu8gy5g5uqnLKt2gkfh6DE0Az7fa9MA3Vj40VoNWcctNxT?=
 =?us-ascii?Q?SnPXBKEbaAqDvq3TT8zxy0HHn8OuM+ZaW8tgPyML1dVxkR7W/4FK83U2siPt?=
 =?us-ascii?Q?8SuP6zGRC0FPnHuNyCfJPpYbkMCPCEZjsKFYd9K7cTEwGa2tKN5s6BW+2gKM?=
 =?us-ascii?Q?H1vs6O3JMxFRkc2KH890iA3SrPvefC8C1/hUioV2QBH+hda3TbmS4OrluXdG?=
 =?us-ascii?Q?P3n+lx8/DoBd8sCImy+BYkX9VsldO951wDSCaalwNZFaX5q3rpuf6QZzDi2v?=
 =?us-ascii?Q?SZa4IpdWj2kkGJydtdytNLEpZHggrrPnxAQBRC2/lcDIYlcrVQToBXW/iCCg?=
 =?us-ascii?Q?2TMbcjFZ6K69KoA16WdW21/bky9e82jXX3nMdUV7RoJWsd2JOUbRVkwocTY1?=
 =?us-ascii?Q?BZsPXIAcokQq8pfqsnVoNUzY6rGnSGpZjkX4ItLtsQqtqJmkOVmG7ptOkw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7599.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4jrLkO3xX1nJFvZDOOy1Ftkei1Bb5t0RgWBC61hN1JB8Q4DCYfZTsgc+zaOC?=
 =?us-ascii?Q?j9ammE3wv4538YoI9Jz2gEZdjmcT00Nt+6JDMbUSxyrLYcU+jLEjeHhSyCzy?=
 =?us-ascii?Q?oqzFL7YuG7q2fO+b1WxlI94ghuiwHN/UCDarTSYF+cxBat1I+F/UpK7bAKdL?=
 =?us-ascii?Q?w9bA0JNbCVXkqz4Tf+NgdDb4oF0jZS+Cx65VSmNLZx4IqhFDutC2kFZrMQ1m?=
 =?us-ascii?Q?KlsVvKZkjLZ6lO0FAvYAtM8a2crCky673XMQqsSDTpYCqi4EHKHp3ZNxmY9D?=
 =?us-ascii?Q?M0QDE/SZ3Dgd95DRa7hAt8bJocbenYN0IcRgZ3w0ntgwPBfA76auEn8rO4it?=
 =?us-ascii?Q?oC22Eil6SsXJRZcw4beP0BYs1ldhAhUCIXkzisdnPb6j11B8IPtynlvgMCrl?=
 =?us-ascii?Q?oJAQ80clnji/BkPh9jbhzMeZ8HBk+SdR5CAFeJJtPZhexPuvSolYrEWqkXdo?=
 =?us-ascii?Q?a9y+7AmHC83IcyepvjwHUS8UfUJ4Z868wNj9W0PH3zQK9o0PJsdmQFsjkmqt?=
 =?us-ascii?Q?CsgETnG9LzUQlwzMwrapuyU7mGVNYUAwZu2CSXgCewWccoVIFnqOubrxZYlK?=
 =?us-ascii?Q?fG2hDUckw+v4u6Uxjevtmjj1bij6cxh3JLzJzD1hYCQ0zpdVcS2rZjUEK0ef?=
 =?us-ascii?Q?b5kutPMm2abhyAAJfSVu3CbQTCyAJvX4HtPimCLQxINWVXy0yFWJ0WwF+Gmg?=
 =?us-ascii?Q?eDNwEX0oR4ekTxrpHJedXBr829qH96k106rcvWvBh+m+nu5fDnMEzY4hHY5E?=
 =?us-ascii?Q?rrrM+t3B7Z07cuXZaaColtvuI1tQXXy/EwBomgb7JsFuL0tx+KvOyq3YS+W4?=
 =?us-ascii?Q?ORV3lK1+uTI/V4RD6P4Q1EfJx5TWh2OFeLAQ6oH0Zgt0aXsmfn49BQ/Y8iuy?=
 =?us-ascii?Q?3kV6E0GBmfJZYzw7E1b68n6/AAL8tZkv9FPohYabKGppmYlA0ZOHp8hrq1w5?=
 =?us-ascii?Q?bE6D2iupqTc295qxy79/2Zi6KjsnSLCfDVPNNSmmcvRKLNXhps76s1PY52Ea?=
 =?us-ascii?Q?r+8Vh06MoCMLrN49gPBCbtJNeZ6QtwmRlSY1ZZ51KyJ43fY+1lp/Z2tvGcQH?=
 =?us-ascii?Q?Ym2ME8LH9wGAxEvefvJeHOkg6SxSXcge4flfXyYkthq3zfQwk2sDB8PIzfN6?=
 =?us-ascii?Q?Oxz1vW+Y9Al7WNV3ZYiBqCaVvGVjbonGIOdEs64ixJz3uKAQe0M0nmTfuu2p?=
 =?us-ascii?Q?wpngg3iFa73GjHWI5VTE+5eFePogeos+qr8v1ICwihYEN5zqdrI0TTqDyXqX?=
 =?us-ascii?Q?DMnqIOoEJD6UFryaMcdk86RgXnpznCp9NGZaV1V0SbXmy6d1To7Bu7AuZr23?=
 =?us-ascii?Q?gsgAFyipkS0KuPMm83l5M0lO7OStBqQy7xNnYHv0E7SHq9/7999+1JJn2Fdy?=
 =?us-ascii?Q?h+2PhdBBWwpA1BQfY5EC0lrtRtDDJi29p8elo1LL77k13oo7brBJpcF8LqYH?=
 =?us-ascii?Q?GnXad6tiTjGc+r8IS9cxUHiulT/a8hVfJtSRpRzZoxpcJu7XXpd9rkvceGd2?=
 =?us-ascii?Q?ZquwtmSDjmm7LN0CAc0XqiePIlGEM8VCgYwy+I8/fqnbmADVKS22MVgfIPiR?=
 =?us-ascii?Q?Txz/VBbO8EemkIv07yEr66I7cfcUb3vjEbIIk4fWgDZdwd58t1On3RyixL3k?=
 =?us-ascii?Q?cDwSh+u6pbUGJvMDL+ZIK9QOE44fh/Zger8obLwszIdPJyJ5OX/s5g1xB98M?=
 =?us-ascii?Q?ZtQJ92c5OYb2eygCtLP8t1X2pw8Ksduhq+PUEz1M1bNea5BK7ZQOPqdO4vmy?=
 =?us-ascii?Q?locgK2NqssgAqDkjV27PnUA2jNCpXis=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4fef1e-8519-4073-e090-08de41f15d25
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7599.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:03:23.9573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRb5z/ll1pSfpfcwMAU2fWDOH9ZZGU9Vud8zPAk+RBXE3ANByGFvcXsO9S9B0/TohAiWHDZckr0ECBxxKEs6EcWuwB037gSc3IvMWkv2tnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: NMQjCkU9VdTo3sFrVZxY_zMn--8Qgm3X
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694a3ec0 cx=c_pps
 a=h6NrD5D8j3GnK3ckJnoRDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=dHwC8glK4a3Alx4pFYEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6tdcsqwiT66vmtaiWp7eKgLTItJiFhO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1OCBTYWx0ZWRfXztu76FjCtZ8z
 T+LNOmu5A2NOwXbzYgHQYcQhOgrRQmHDo6eJHQLxAvhaYnz1WKo8J0K/HSbDpD6G62XxKJAGCa3
 yc4nxn+85tgP9UlguII92vWm7TpgECbDmizRFztncssZv9TG7hg3u5s1+TjPoiKNHdPS5UWoPnX
 +xY5L6QbHERe6SA8wnfPwlIoM1OvBE8btSD8ytCU6HZZWveSbpbLpW3ClleEPVAEOtzKpHNUPqf
 A5AVAfjxmbRI68RjP2Xdn5jgXB/8bpLoUAm+5CUU0IV2/Aqwr+4n7nbrFtYYS7F/yXqoe4Hi384
 RHj1ZQW2NFyHfs9cfE+UUMK+6u8Q8pEaT1cgj5Jx6wMQdkqn/dcIK2S6r8qCiihSpSyKYYNJ7CY
 G1JFUmBXuQskNqybmaercDkrNzd+v2qf5rlRg4SKQFF9VJ4eVen+ZBN8i8rkvJcbViFtuJS9dzk
 MIJHpx0L0OJ231TCbtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228450

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11839

PR 33448
[BUG] Aborted in tg_tag_type at prdbg.c:2452
Remove call to abort in the DGB debug format printing code, thus allowing
the display of a fuzzed input file to complete without triggering an abort.

https://sourceware.org/bugzilla/show_bug.cgi?id=33448

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0019-CVE-2025-11839.patch        | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 58964a6cfb..9ae0e72e60 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -44,4 +44,5 @@ SRC_URI = "\
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
      file://0018-CVE-2025-11494.patch \
+     file://0019-CVE-2025-11839.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
new file mode 100644
index 0000000000..7f2f6d553d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
@@ -0,0 +1,32 @@
+From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Nov 2025 11:49:02 +0000
+Subject: [PATCH] Remove call to abort in the DGB debug format printing code,
+ thus allowing the display of a fuzzed input file to complete without
+ triggering an abort.
+
+PR 33448
+---
+ binutils/prdbg.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
+CVE: CVE-2025-11839
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c239aeb1a79..5d405c48e3d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned int id,
+       t = "union class ";
+       break;
+     default:
+-      abort ();
+       return false;
+     }
+ 
+-- 
+2.43.7
+
-- 
2.49.0


