Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9B6E67495
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 04:34:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74318.1766378067409809139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 20:34:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KC760Tc3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451276127=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM3ToI8901611
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 20:34:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=fTdQijElr
	NWPK8YOsaK2rqo8UdEA0MAxxmRqXAwcMQk=; b=KC760Tc33tFbbSlAtMAQrsc4O
	h/jdLD+o0lPfH5oFyRiceNcKQsKYW1Y93AztlzxRlhuHmOmbFBMps9R5SuwhH6mm
	HiYTGzYYZUBumJWrX9PDUN0d8/Gs37U8b+tEeg6NtnMSmWvNbtth3Gd8dfOfsZJ0
	Y82D27rR+wGnCE3eGsJsRejI9M6PsD2+Rl4eGJ7aJQQq9FTSb05CKMMZ1bwXLukh
	sWLhb70qUICpmKf6q2hVT0ab0nJvRhLq5ZgZ3HPjFRo4VlZ3gwwK7LaMZfAa3qXu
	fyIGIhcshIRdcNFJVoVaRv5p2pBc8bauKSwv5HNciFa5BHWObr9OBPvQ5DBlQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4s7u9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Dec 2025 20:34:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNwc62DliyLu6fnTFYmmtHFXgfhF+c8tr9GPEUPFTXYlmjugQ20o0F/U0YUoncDcu702aD2UPnsLDePPnj9EIijo4h94T5WHbtTXu5a5qHf7+vnYF/5+PPCJetoQVh2Kr3H0/ctzgCVnl0XSwtNDrmGjYsPTf1wW1g6IaXPL79RteMz4qCJoHaKjOGRhtJSs+kbqwNIbT63tgOcqlSMHWAL1BB0iEaRqQA7NUyFYEbREY8BCztCq3lSLNTDwyGH/eqMpiJ29vF6zRcM8H2MtKNjkWmEqJolShoz2qawXzmYkMic4Bm3+XRlNtoXMtUnCqS9kxWFx/p2O4dd7RHoDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTdQijElrNWPK8YOsaK2rqo8UdEA0MAxxmRqXAwcMQk=;
 b=fYUEtzGt151X0u1R1A85NQDg4VP7HhC4tn11iWYBEcpg3aTQW5CVhTWsNCazBASFE6otK0TTz8Ffbgx/7ndiJALUxXCHRGyNWtrN+FEFkO+gnY5ZpyXSf0lXsd3o6TRmip/lrYWPMXSNzTf57MxQYOzfa8eBWk3VRxA57MUvD/BI24ItXsBtRv1IDbODsVUhs5rACa8J1g9vTB59cqq2tnXdBIvLe9B6QuQZFiNBjNqoMQFVFA2/ZdKbhqcevrkXG5X5iwmV34a1L+l7GXR7gvh30p1wc95/I6Q8TZ+eEoAQqHzg1t32PTzUrMt0NBNMNZ//N5sRIIT82xSEaP2evg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 04:34:21 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 04:34:21 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [whinlatter][PATCH 1/2] binutils: fix CVE-2025-11839
Date: Sun, 21 Dec 2025 20:33:56 -0800
Message-ID: <20251222043357.366484-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e2db22-8a4a-4925-e8a0-08de41136080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fTFpQb9q1/GOA806GUfH1w9yg3KhpDF9Sa4Uo/85YBjk9D01n1eiBvRzUyOL?=
 =?us-ascii?Q?z5Lc1yNQ0JgMjPidIakiy7MSvHcJ/02GoVJrUmNpAS2MqCYBG+cGuvEUlc/I?=
 =?us-ascii?Q?o/SmhstmNPSEtZwI+du1MqQ+yoM1BdB9ZtNW+hOUEDaSi1eIRxjL65rEiyWR?=
 =?us-ascii?Q?2x72E2EPuXkQg6+KWzf1H019x11Vs8VNhMr2zCGdhue82yJyQA8ln1jB8vIZ?=
 =?us-ascii?Q?JIPwozBF0ji0AlHtFXDdnFlKKVSXeSxkCr+kulcid5TJ/0mSB/lHHq1Tdh5o?=
 =?us-ascii?Q?+HeW2UarArP5dODjAPHwUMLeEuYZJI+GVdkFQegvDKHDABDaISBHFTjsD/+P?=
 =?us-ascii?Q?pDhxMMjCu4cCLicOKi5LTYOv8xBozvhPn+VcGwX6gBZNhmZtifyH21pSKlW7?=
 =?us-ascii?Q?thc8wqLVjLqwTzjL2tS5vTnJ972lVvCxD4BHdtPc7FP+/c7Btq4VJDHzeqV5?=
 =?us-ascii?Q?ettsHIIJKXcalxS+6VjcTwU4dxtiutkBQa4MnqqBbG7RdAHdKX1DQC0Q4wUo?=
 =?us-ascii?Q?3gADvW8OEO5ejpgKYzisLrMh5j5GMe9fBluf/ho+cK9lLoyMxFfFBSwwvaCj?=
 =?us-ascii?Q?BMz3xuyIDUePOdXuiH9v0t7s3+tQRwHPvRtES8jif5SaMlo9TgXHgV1IEmOu?=
 =?us-ascii?Q?gS0LNVVq8VpssD0iLQhXuORnm/Gvu38z6yMoWi2fIZKPo9rozJkUGliI2/+E?=
 =?us-ascii?Q?h+ZGOyQtQA2QkFN7wWC2Obpd70zVgc3j/ptfLz43PpWNffIpoHz7ye96UUog?=
 =?us-ascii?Q?CNH6CITfbjOIlkc+K/Hsv174IinqY3h0P1BeHIx50+WxCdE2Emcmz0fN21Tg?=
 =?us-ascii?Q?YeNz9byATfgLozs1WAUVYUClxbqTjRjuPS4nR4T/U7t/KHGl4hYqrIvTUuDb?=
 =?us-ascii?Q?i+htYRQ3fUVakwh+4JPQZX/EakFKlsiHCI3m6j5V6yVj0lyby8pFhAeVhCvq?=
 =?us-ascii?Q?qrMu4JUaxc9D+7ZY81uvjeFTu2A4kG8K1vBUsWNZCdttmJ9JlCtP35FtCbMx?=
 =?us-ascii?Q?ubfSmf1jTcRiRxmIV2l7iURGCuyOfrZAohcntCosfmYl7yM+xpuUsXjv13NI?=
 =?us-ascii?Q?wgVPbpwyD7cMUFUU+3ezl+PgdQwgJkcjEV+Bais3TiELaTqTdB6TGouZ0KVq?=
 =?us-ascii?Q?lqSNMW+rgQsnmOHnDu+fuEkp3+ZTYPKbCPuDPQJskNR9oUHAZg29f64BYbB4?=
 =?us-ascii?Q?G+yUHdT+f1S3wKBByG47+gIMnyB0jebPo/uex+eabWmkoKTKgm3H+n5g9gcn?=
 =?us-ascii?Q?k1B5NJriKRCKOe4iKRfE9CbpWsYoiidKXhwzZtXEkmUeu4Hf6eGblT8u1COw?=
 =?us-ascii?Q?q90xR5wcSd3skRHJ8JkMlVXeYzWW2+oAPpyy2fsIOOEGS/wgO8QCuIgFK2w6?=
 =?us-ascii?Q?ll25n9ZSkg53CaCT6sm2O70sB14Yxd/ydkrPYjqrbM1LoeFx7F3xLjc4H1UT?=
 =?us-ascii?Q?5xamfsAlKw9zTrgGZOt9dZ8Al5jZ8vGbEN09NxKIgPA8SOIkpuoFlw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qew9g3pqhAEwNqkbxjJACClgetVWPfHunpcQOKGPVnym3sZDv7gCwYWFNzuM?=
 =?us-ascii?Q?p65TvUBV3MqAdWeppKmpg4PArprGIiuK8CJ8cz2hFKOw6JpAHxyZNy4/Xm/3?=
 =?us-ascii?Q?EoDUiuiwK86U1Z9NmUYmMx2xrhYsKdqlGu2uBc/9cBY8rQVlxoSpi0QiPvF5?=
 =?us-ascii?Q?haTZT199JYEjStbvtGPwBep6IZXwJWEb01FIPckGJM84Av3L8TgtEFvc+zmy?=
 =?us-ascii?Q?ee8tS906dCU/I4ND6yUrYQ6r+G22JWD0MhTLXYSW/I4tZGDt4tnjGdOSbSJY?=
 =?us-ascii?Q?4qGZSUx2FSY71wOHgoBNX3Co3b/S7jrYUWSrA1cr1Y8p+as7F9lnUTCLX4Ze?=
 =?us-ascii?Q?WmDiSiCsejsZdaYbLQuihwkNUBpxExmDlbCnjwngBcQyu00Pg/iQh4LxrI5k?=
 =?us-ascii?Q?LSeistUbUBMDrBW+aVMB81moOXmrmq4SrwX+wM7F9WWSHTZo1pWBUd2pIyw/?=
 =?us-ascii?Q?nAN4xh3eYIbyceUxXXXv81GusPphfeu41HFAa5m7jeGa4lJK9f1I0IKR1c7M?=
 =?us-ascii?Q?p3eH7mO/9iKEFpkpSH+RjHQQE23Z8w/s+3AlUZbcWg1F60B/Atf5C5d/wjOe?=
 =?us-ascii?Q?NDhyDYXn/nhmv7iyWfE9mNKg9+zoXSpTVyF0kYjpTar43IXerG761Y6KrwrS?=
 =?us-ascii?Q?+9E4QscjtjuLV2IYXPE0sr2GI70Y/GEXMgercWjoKaL+zQTA20eio6LtJeCQ?=
 =?us-ascii?Q?W3DSIQ7jPkstg924Cz52ehmE67QqUr6GC669AxaetPdruXrDgD6JVPU3359m?=
 =?us-ascii?Q?c0YCHkyU8jIColk6TmtoXLoKiAwzvqDCoThY23lT2IJDBOk8PFHnYIQl18PA?=
 =?us-ascii?Q?BlyRWNdbbROMBcrvdzSKPku7+8MqXZJTwcIYr+P2rs6G1FGMfDfmvG7mq4oW?=
 =?us-ascii?Q?cuwv2ffDjIf21wskam7fL73R8Q2hW6ucnsh3yCRz+hwS2zXy982JW6ObdwUO?=
 =?us-ascii?Q?IUmHkoJX6WHRfiYeCXqoCT/Y96Cjhpo1OhQqpLgfAdLZ5Mg56f+7xXcxnzqE?=
 =?us-ascii?Q?XwV1NWp5CfVUxsN2cWuQsgJALN5ExXpMHVNz4aCzfsi5HBAMohS86hq0jjwT?=
 =?us-ascii?Q?JyXStg2vme6KQhYdfRyf+PoMQ4tZ4yJk9jFbFjhsx1Mi1eIEKZiufkW5gmcX?=
 =?us-ascii?Q?z8vtgCYUhQ9M9O3kZgRbRlRHh8tDq494MItpDeBgw9hGOfdFtSKkHIK6J2nG?=
 =?us-ascii?Q?GXBFrVlGD0mg9X6NUGTJyhFTmLVu+DY7lJ0OcwQHhxBDDwY82MbDeAI+oXjp?=
 =?us-ascii?Q?ejpv8HVJBZT7vPE589G7Y4YvQnTBPiliC1oJCXTegJzMppZNb8mjG9rafj27?=
 =?us-ascii?Q?PoAkMuXWqqIvOhQDVv520nfRzHMAa0paKHCiyDzGZxWHK6OwdzxlSZe/+GYU?=
 =?us-ascii?Q?aIc+mcqw7h6cAC23kmh3aU+ZbPxLxBW2BjvJReRsjLl/q9C2Lx45k0tIezzA?=
 =?us-ascii?Q?nifslQAKwIZrhyonN3pb2GnBcntaibdg3UtLC/dY+6Js+h5cfJDLhUlm164K?=
 =?us-ascii?Q?NJTseOKQMlB2YS0UGiCi75SkMQmOjAbfB/AbSfNAJjD0wEuxURMyINyG42Qd?=
 =?us-ascii?Q?untF64SEWOtnggbDRuiSinMWjCSX7Fv/oaBUUlK20/F/mjex3vueHW9iAhAW?=
 =?us-ascii?Q?fMnPn6B1Dmex0McWRboKYb6CBz7EzVws/ha7qnefBbjTWQKsD4SJiXdX7o50?=
 =?us-ascii?Q?t6dJV1Uq15moH0zuI33KS5EuVMURfb+vGJUJpvbh+cGyf9xtJhZCl+Kc5Wj/?=
 =?us-ascii?Q?PUSRUD1hNLFkpRoVmZEBckJOqTATNmo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e2db22-8a4a-4925-e8a0-08de41136080
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 04:34:21.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsVK+eLSi5FDeNfRsXykyTawB6NaITTiZT5H+4/Hw9YWRW6DmazDcIz7jRov7QlCWn+6UABJefaZ3l05rXdZ2gouYCeF6sV1eWouAmWxYwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 6oRduQLPPO6NjDMqNhgKQnLT0CGfnu1b
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=6948ca52 cx=c_pps
 a=ubW7OWQb4uJshPNbXurJQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=dHwC8glK4a3Alx4pFYEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAzOCBTYWx0ZWRfXz9V5tYb7JDBO
 DacrVXBbOGKphVMyP+2waUi9wUj6/tquy1uaFgoFdkINrxQ8yrV4NTP67gdIv2RUTSQtG1DA8R+
 rAvC56y/S01yTID6m+bW5xAemlmioMskwdOVefTt3UTdircw5iahR8Y0Vbf3nhbR8ESBj6pTfJ1
 t/6aETltmB5hW3AoBpiXMvkxULQE51ZAw485aScGmnMbyB4avLn5KypXu9XLMmh37wLrzx+lSca
 ggm/hp3c0l4VHC64BQak6Xe9yW5+5+DxuYbRN1Kdd4oeiFLJSEejxMQfV7yE38V1VTWgFQbui4y
 Wsxbw1uURDd+piykrFO3/QuvROJvTmYTlqqpMj6aM3VrvXBfC8n7r4Uj8xNQ5I3VUmkn75qO9vS
 46iPWAQgTGE2KtXnRHrZGPcZBChl4Nax6Eq8cXLibbvTTnIVf640HcDPv7hPRukBtU1kcCvqL9M
 HX2bHizlFa7p12i1rOQ==
X-Proofpoint-ORIG-GUID: qIQ6dtGknlM29DL1KVl4fb1wt-YHsiQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 04:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228281

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
index 680ba82e86..2f61c9377b 100644
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


