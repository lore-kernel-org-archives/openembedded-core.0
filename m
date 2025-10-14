Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4A4CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:49:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18583.1760453369474061831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T4QxI0eW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5i9DJ2987171
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:49:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6aa/IKl/rAK3BaBqlcnmh0eZDt+ZJh9gG593QiGmWOI=; b=
	T4QxI0eWBUCTI2x480h2n/WPC33T19ZXsQ1j9Uk/LVhoQZtRarVAlNPOxTGcwSu9
	bC5/Z9dcrpOzHZvULQV0DDXfydVsuSogG3wWN0ENK4J19QT1rn+pRIjijyG6vz63
	a0nJkEcxgxJ4K/vEz58dcBEo5C1WhKFc8SsliQa82xQmeXb2z5ahpkOjryndCUjA
	bdVzRvumVXzwlH5No7wNOO/uMxdizhCWoDB7SRinRq6qjYv3AjrqoE8EpByG7VfR
	It9jKTdGcWlm6RRUQFj/g9fKvs/Uh59YA1KdM/ZcOfn7DOYYWt4apDZMXdZ5zlmE
	s2FNrDFB53AYD0TXhIuTBg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013058.outbound.protection.outlook.com [40.93.196.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1k47x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h33T2BuzmAVaOaZJeIdmyGl1/nfxdrNZCs1P0fC8nI8EdHMsLN9c4+rqJIILhXhZdzlLP3HH5JamlJqSE2PHHk5oDMyEwV3/FXx/H2r6/+OgmSSP2U5KGLAvhj65h3BDA+ToVGGBfacCXOBQcORcM1QKs0iazTCseUxR9VsYf2S+7L6C0jzURS+YXm8PDnta+mlw7wYbZzk6YHCSjKa/UtrjxuTH6ED5S9qhkzm8SJlfqip6dM4MvS0QBzpsnIW39+kS2wj3M4gEs/mbRiuKo7PsYZAiTFrwQ7JfWXKlftW6h7fQEVoFuJX4JFRl9N77Y5IyhzlWih8I/03ibepMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aa/IKl/rAK3BaBqlcnmh0eZDt+ZJh9gG593QiGmWOI=;
 b=W+F6OseP8mSZsVwc3oiabNvgKQDGZBZdBy273OX6cVwO66krtU1xv19MIxbKx7xgxtGku+Hn7oIaC1mXrmMda0hAUOK1Z0EsU34hrOoaHIZMMOfq1bDQcTwjP0PjjgXtsMWFRfmATiqiOv6tuWuIVxs4IQLUY8rMC7cltKkrG/KBtgtFXsr5jRzo7yc9UCHxYxs88W8fLjIl8lm0rFuUEWv3+KzKVQBsi01fQsQJdzvudWZJQssTqk3Pc9moz+e6c3eXjWCO8bGWERXRTv1MIzUt4VYwJdGWFapUZp7s0RVV1JlNug4i4N3YkzAV51Rgt++UOiGXfyS1HL13tAZfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:25 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:25 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 02/11] glibc: pthreads NPTL lost wakeup fix 2
Date: Tue, 14 Oct 2025 07:43:38 -0700
Message-ID: <20251014144347.536537-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cba65b-2a2b-47e0-3809-08de0b302b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sWQ5Y4dlSsTjZ7USD/ajpNQd0SaOp25+dhIJcNxMcYNdCWNNlzLOyMsunP+j?=
 =?us-ascii?Q?QaHvekiiUWvT2Qw+BGh+mvQGWHi2JbqdbslTQxBRj+fIrZh5rQOQOps1HT0n?=
 =?us-ascii?Q?bkbje/rBWIH4kF5Z+2buGsRm7fPVY6EwJiquwYcgSEGruPjlo4IQyV5L2kq1?=
 =?us-ascii?Q?oko4alBAOKC7QB2RVAhOFijMRj50FAT8ey3mKTNL+hbFyH3IrM1w2M78zk8y?=
 =?us-ascii?Q?gCXIbkErCwdM+hR/3e+GWStaVzQUpzP2F7pLLUHhXLlWZz+7P8lAo543Hfw+?=
 =?us-ascii?Q?1Ekuj17iw0qrmj+HJKE0yn1fH+LU/SkdoeWx/bJcxr7j+WyFdnFjY1x/LzqR?=
 =?us-ascii?Q?7J93vw9TbMBBf5GBINBY0oCinZZfSLxCqdD2+tIoR+nMBPmgcGLzBby9hh8J?=
 =?us-ascii?Q?fJhiZpx8rGp3Ri94X5zAg55nOXYkvOfE8Xx/amymE9d1dHArrPNRUoM7n9bc?=
 =?us-ascii?Q?ZaKJ9Cv7CJFtDYDA3kMTeeTXoVm1zV4LmhlVSLQ+hWR7KiZhK9JPuo48U1VY?=
 =?us-ascii?Q?7+DWXjJ98uXuTW/ZFn0Q5B7D/Eliwax/ErBGni0mB2FvfcYQLzg8dg5yO1G2?=
 =?us-ascii?Q?8WNnwIlB5e0GNjDHV9VgfEyV2dPDOt2PthFdBKi1kTOxYL+/Tc6T/AxxdUZd?=
 =?us-ascii?Q?W7f8YLnAKZuFtqKkHlwSMJl7nUko7H71pJtX2ZrMQi9zw4gHp7UdMc4nRLKb?=
 =?us-ascii?Q?W/sagJppMxPgNytGbXLV4XntbKRXlSzzJmt7gCid2d4Izhsx7xOvF4A5yxVh?=
 =?us-ascii?Q?2Fe9idhRB3Wj4m7vREnIr0y3O+Qt9h4B3AjqLAXWr8kAbdwu7GmZT/TtDt94?=
 =?us-ascii?Q?KC57xkKpsgpG/YNmwAmMbc7wE0yxUFVrXSz09Xa5J+NGN/gA8emdCdmu0rSQ?=
 =?us-ascii?Q?K2Sv/vmjeXj3kqgwPLFNLbPEgN5TNHn82PrwDZnsFDw9y8jWO+OOmk9S0UIO?=
 =?us-ascii?Q?zZ870k62IBjwLsNgbX4kaYaf9fy6thZFwqoJC/sUAlXX9OigYyIBm+FBz6pk?=
 =?us-ascii?Q?XHKIZ0GccSHt4ea746lhju/inpqrc9mtsNAelOtW5PbTSbsdh1arOQkVAJo0?=
 =?us-ascii?Q?p7rfinLinJT57Ucg60FVn3hA3LYC2REJINc3qmKTSNYiR6VD5/yHYhBsS9eh?=
 =?us-ascii?Q?bomIHPkt+24uqYxgrVjQHL19mby6aTEHVHdlg9oqAQ5QBx9A/pa4TzEZispD?=
 =?us-ascii?Q?1hB/Wwi/cIf1BqPgVSLq8WyU6ALaeV9unKg2VN76JgNpdP56qpijKea7swpN?=
 =?us-ascii?Q?8Qs1NucDS1lLQPjOwpz6KiFfvNxz5vFIUm+XgpJ38Szh0BwBluH9CkJq8/dW?=
 =?us-ascii?Q?4D+p+tMA49Jaj3KQfKg4L8Ff+pz4dzZrVVUhXjTdKrGqKdrv5eP5fEeL++Ln?=
 =?us-ascii?Q?V+BQorPhOhaa4azpDuoQZYzQpMDdRyKFpmX1LnqGyZXRHIEJyPbPWUyOKUYW?=
 =?us-ascii?Q?7SVAcYjaQf3E+MR3uGVGMOHXM/1tbcR0w4FSZE1C74W0xaWSWC141w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T6H9k/gdKmcdEuhXrGf6xfyRHYcAsO1jLFpti6TAVvYfgIFN2wbdtsZTgOQJ?=
 =?us-ascii?Q?sF0i887m+cf9ZEw8CepyN6yKZNXks9Ayqz8UdVMiwAhCrXZKOnMSw90jhlzc?=
 =?us-ascii?Q?hwAxo2OprmCQ4Z6/DiFMFmXPExqknaAcHX2STDI8sAUscHyvmDGWKo7uBrtm?=
 =?us-ascii?Q?hrt6M7Vjr4mdU8pRIhmTIbUZ4rRzyiniULCo7RuanootC4BSw0jARtdLPn4F?=
 =?us-ascii?Q?CYNh8imuDTR3VPoVDItiPyPnkenH97HU9NIxlGIcDuZq2WJ7iz7dvxVYz+sC?=
 =?us-ascii?Q?QwtX617GKSQoOClAwfLg38mBTccIgnAKangs645uHjNpKDHn85Jj29EqCLb9?=
 =?us-ascii?Q?NU5Dcz1m1QkBt7BrF8MtO1PzzaWhVZOEU+YOUv6dWTVMriBGU1Jw8ZZ2g0p+?=
 =?us-ascii?Q?JTZlmpwzLvmnfAY7fTcC3Q4E1HrYpR/U1k7y10wUEW8h6ZGif/SGxfRVwuur?=
 =?us-ascii?Q?wo3Rnaa+zgB7imCMQiqOU7Sy1VpvDWYF/tIqZ1sTx/tUp87z261omi6Nj0FA?=
 =?us-ascii?Q?2ODOCgm3y5m9LvOlNobiWIgp+ns0JZGwSzTfA4v1QA7aNXYbdKmQMQpiKme2?=
 =?us-ascii?Q?3TsicStFlZW9CUYTlkcOBgDVdU9fvKhM5dcTvqkKiADH7T6GaWmflMtUVy+X?=
 =?us-ascii?Q?3vRhrnwLj8bVQRGCzfq/HUKimDy6hSQO6pDUqPx0uND2Cx3tpmMqLz37b8i3?=
 =?us-ascii?Q?h43NaHbLYzLIV4QiHpdZAmekeFernwvBO48FuCNqoy4zO7ecrLxnZZ2qTttp?=
 =?us-ascii?Q?rQk4ZDXU+wEhkeAbiaZ7V3ugxhYz4I1tzM1lR3nEcA1iCJs+v+Uu+vFpK0UG?=
 =?us-ascii?Q?2W9wUErk1Fyp7Gm2tVVIIHvuKOQFLZxaWIwfVuvnScde8n0HrygdzyiZxUYT?=
 =?us-ascii?Q?KZzNHybi7HY/olZKzuI411cLh9SbXhg96u3yHv+8+2ryhNbKgxq93dpDd2FP?=
 =?us-ascii?Q?yYo8Fy5KbA1hFSigtHBnzmNCdUKU+YPCvPL709SYn1pM68QAMwX4Z5Rl1vkT?=
 =?us-ascii?Q?RX38Y8C2BLGiB2MsddN/l3yK4eTFc25bc89vt97IQIacuh6FY+Erif0vsYQl?=
 =?us-ascii?Q?LsrTRAI45uNq7Gvl4Nc1LIJ7lwdCBYtkDVKZFk8ZrawHoDshcBPL73pkKqBL?=
 =?us-ascii?Q?nIOju+2W7IW3/FOQwp7bjChYltNERxB3/ldtE1bC/ATzuh26nYXgmujdsKEE?=
 =?us-ascii?Q?dKqUK9xBgSedaQMQ5fcFBR9Co9ZR0OyHds+DKoEcYVn3X4PZOdm7CRyx50us?=
 =?us-ascii?Q?S8PiOUhb7DfKFPPaq3R65/DvP/6I1UyH+t5LBJ1potQ5czqlHSN3zcYfSM4B?=
 =?us-ascii?Q?eFJveY3e464fD4hh2HArKZPj04nx4Joa4LZnu5WSQileUEyCJKPUtzwUQ2fD?=
 =?us-ascii?Q?aNV5/wvlvs0O9EpNpXYlqCRt3Id3Aq65ObxNKlBOLdvnHr3pwhjyOstojUPy?=
 =?us-ascii?Q?navNYrr1G9bgKRcSiUrF77nv5pxyom/+YvEHeqR7wSBvgk0HWyAwIEKV3ib1?=
 =?us-ascii?Q?299c2n+x+BwmLwqw42F3m1thM1afjv9qmyon9yh/NLYGPXrrQ7Aj07S+QcI4?=
 =?us-ascii?Q?R0DbCS/RGZqTMWj5TLzcYOSWYXJ0AToHnklxs1aeqH06DN34EJlp21JsudHG?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cba65b-2a2b-47e0-3809-08de0b302b76
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:25.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbg876cCyhPhpjKLZzQSjSdJcFVyeHQx3FIOtT8opEeVpZ3cxRJWWzYL2HF2KFjp+XDAdv8FNHQD/xxBVk9/IqdFVdkSzZhVkrJAUrDZfRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMiBTYWx0ZWRfX6MxQaaAxS6dy
 GmYI3DujkOPHkYdFqDMIbSdwbBeHk9wnrgJ48kjpgxnzcJ2GAUUgY0hQSdcKeCXsekGeDOUeQIt
 bYdPQoAXqhnshZ9hALUlaBpLXiFdmlYMmUxyKx6QFE7dkTCqIfxzmHGGCzxZVsivjuDvCvEYERU
 oL2HIYKjafTNRxhnrngT67J6jAME7SzKmkdqXnqqZQi/0ciQQZ4CFyhNXKjA0GDLZRK0Cf7oK/0
 V1rjb4l7q7V71rfGSB3TxxK8nNtAQmpPCoVn3BU5EtNYkGLFHVsdfHZQqVppbELE3fYfcEb4y++
 Gj9KGQ4+u2yP2BZ5TTopcMKBO/pU1Yuajo3clC8wqjWzqzPsBVImYGdo48KsiAEHFB8MoTqF80W
 Q7xDRCLZsNj8A93iigw2kWwSJjfPWQ==
X-Proofpoint-GUID: AZ6tKjSLWPlr8HZ4q1jwfbagBk0U16un
X-Proofpoint-ORIG-GUID: AZ6tKjSLWPlr8HZ4q1jwfbagBk0U16un
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ee62f9 cx=c_pps
 a=5YU8ENXygJz5UkgxsLF+dA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=-y7sjS4E6xoPhqQzj00A:9 a=NrfbpRTlr6kA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224831

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=1db84775f831a1494993ce9c118deaf9537cc50a
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002277.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-1.patch          | 455 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 456 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
new file mode 100644
index 0000000000..0f81f5b40b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
@@ -0,0 +1,455 @@
+From 0402999b82f697011de388f61bad68da26060bef Mon Sep 17 00:00:00 2001
+From: Frank Barrus <frankbarrus_sw@shaggy.cc>
+Date: Tue, 14 Oct 2025 03:55:17 -0700
+Subject: [PATCH] pthreads NPTL: lost wakeup fix 2
+
+This fixes the lost wakeup (from a bug in signal stealing) with a change
+in the usage of g_signals[] in the condition variable internal state.
+It also completely eliminates the concept and handling of signal stealing,
+as well as the need for signalers to block to wait for waiters to wake
+up every time there is a G1/G2 switch.  This greatly reduces the average
+and maximum latency for pthread_cond_signal.
+
+The g_signals[] field now contains a signal count that is relative to
+the current g1_start value.  Since it is a 32-bit field, and the LSB is
+still reserved (though not currently used anymore), it has a 31-bit value
+that corresponds to the low 31 bits of the sequence number in g1_start.
+(since g1_start also has an LSB flag, this means bits 31:1 in g_signals
+correspond to bits 31:1 in g1_start, plus the current signal count)
+
+By making the signal count relative to g1_start, there is no longer
+any ambiguity or A/B/A issue, and thus any checks before blocking,
+including the futex call itself, are guaranteed not to block if the G1/G2
+switch occurs, even if the signal count remains the same.  This allows
+initially safely blocking in G2 until the switch to G1 occurs, and
+then transitioning from G1 to a new G1 or G2, and always being able to
+distinguish the state change.  This removes the race condition and A/B/A
+problems that otherwise ocurred if a late (pre-empted) waiter were to
+resume just as the futex call attempted to block on g_signal since
+otherwise there was no last opportunity to re-check things like whether
+the current G1 group was already closed.
+
+By fixing these issues, the signal stealing code can be eliminated,
+since there is no concept of signal stealing anymore.  The code to block
+for all waiters to exit g_refs can also be removed, since any waiters
+that are still in the g_refs region can be guaranteed to safely wake
+up and exit.  If there are still any left at this time, they are all
+sent one final futex wakeup to ensure that they are not blocked any
+longer, but there is no need for the signaller to block and wait for
+them to wake up and exit the g_refs region.
+
+The signal count is then effectively "zeroed" but since it is now
+relative to g1_start, this is done by advancing it to a new value that
+can be observed by any pending blocking waiters.  Any late waiters can
+always tell the difference, and can thus just cleanly exit if they are
+in a stale G1 or G2.  They can never steal a signal from the current
+G1 if they are not in the current G1, since the signal value that has
+to match in the cmpxchg has the low 31 bits of the g1_start value
+contained in it, and that's first checked, and then it won't match if
+there's a G1/G2 change.
+
+Note: the 31-bit sequence number used in g_signals is designed to
+handle wrap-around when checking the signal count, but if the entire
+31-bit wraparound (2 billion signals) occurs while there is still a
+late waiter that has not yet resumed, and it happens to then match
+the current g1_start low bits, and the pre-emption occurs after the
+normal "closed group" checks (which are 64-bit) but then hits the
+futex syscall and signal consuming code, then an A/B/A issue could
+still result and cause an incorrect assumption about whether it
+should block.  This particular scenario seems unlikely in practice.
+Note that once awake from the futex, the waiter would notice the
+closed group before consuming the signal (since that's still a 64-bit
+check that would not be aliased in the wrap-around in g_signals),
+so the biggest impact would be blocking on the futex until the next
+full wakeup from a G1/G2 switch.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+Commit : 1db84775f831a1494993ce9c118deaf9537cc50a
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002277.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 105 +++++++++------------------
+ nptl/pthread_cond_wait.c   | 144 ++++++++++++-------------------------
+ 2 files changed, 81 insertions(+), 168 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index fb035f72..a55eee3e 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))
+ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+-  const unsigned int maxspin = 0;
+   unsigned int g1 = *g1index;
+ 
+   /* If there is no waiter in G2, we don't do anything.  The expression may
+@@ -222,84 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by setting a flag in
+-       __g_signals, which will prevent waiters from blocking using a futex on
+-       __g_signals and also notifies them that the group is closed.  As a
+-       result, they will eventually remove their group reference, allowing us
+-       to close switch group roles.  */
+-
+-  /* First, set the closed flag on __g_signals.  This tells waiters that are
+-     about to wait that they shouldn't do that anymore.  This basically
+-     serves as an advance notificaton of the upcoming change to __g1_start;
+-     waiters interpret it as if __g1_start was larger than their waiter
+-     sequence position.  This allows us to change __g1_start after waiting
+-     for all existing waiters with group references to leave, which in turn
+-     makes recovery after stealing a signal simpler because it then can be
+-     skipped if __g1_start indicates that the group is closed (otherwise,
+-     we would have to recover always because waiters don't know how big their
+-     groups are).  Relaxed MO is fine.  */
+-  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
+-
+-  /* Wait until there are no group references anymore.  The fetch-or operation
+-     injects us into the modification order of __g_refs; release MO ensures
+-     that waiters incrementing __g_refs after our fetch-or see the previous
+-     changes to __g_signals and to __g1_start that had to happen before we can
+-     switch this G1 and alias with an older group (we have two groups, so
+-     aliasing requires switching group roles twice).  Note that nobody else
+-     can have set the wake-request flag, so we do not have to act upon it.
+-
+-     Also note that it is harmless if older waiters or waiters from this G1
+-     get a group reference after we have quiesced the group because it will
+-     remain closed for them either because of the closed flag in __g_signals
+-     or the later update to __g1_start.  New waiters will never arrive here
+-     but instead continue to go into the still current G2.  */
+-  unsigned r = atomic_fetch_or_release (cond->__data.__g_refs + g1, 0);
+-  while ((r >> 1) > 0)
+-    {
+-      for (unsigned int spin = maxspin; ((r >> 1) > 0) && (spin > 0); spin--)
+-	{
+-	  /* TODO Back off.  */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-      if ((r >> 1) > 0)
+-	{
+-	  /* There is still a waiter after spinning.  Set the wake-request
+-	     flag and block.  Relaxed MO is fine because this is just about
+-	     this futex word.
+-
+-	     Update r to include the set wake-request flag so that the upcoming
+-	     futex_wait only blocks if the flag is still set (otherwise, we'd
+-	     violate the basic client-side futex protocol).  */
+-	  r = atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1) | 1;
+-
+-	  if ((r >> 1) > 0)
+-	    futex_wait_simple (cond->__data.__g_refs + g1, r, private);
+-	  /* Reload here so we eventually see the most recent value even if we
+-	     do not spin.   */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-    }
+-  /* Acquire MO so that we synchronize with the release operation that waiters
+-     use to decrement __g_refs and thus happen after the waiters we waited
+-     for.  */
+-  atomic_thread_fence_acquire ();
++     * Waiters in G1 will be closed out immediately by the advancing of
++       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++       which will prevent waiters from blocking using a futex on
++       __g_signals since it provides enough signals for all possible
++       remaining waiters.  As a result, they can each consume a signal
++       and they will eventually remove their group reference.  */
+ 
+   /* Update __g1_start, which finishes closing this group.  The value we add
+      will never be negative because old_orig_size can only be zero when we
+      switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.  See above for
+-     why this takes place after waiting for quiescence of the group.
++     case G1 will be at index 1 and we will add a value of 1.
+      Relaxed MO is fine because the change comes with no additional
+      constraints that others would have to observe.  */
+   __condvar_add_g1_start_relaxed (cond,
+       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+ 
+-  /* Now reopen the group, thus enabling waiters to again block using the
+-     futex controlled by __g_signals.  Release MO so that observers that see
+-     no signals (and thus can block) also see the write __g1_start and thus
+-     that this is now a new group (see __pthread_cond_wait_common for the
+-     matching acquire MO loads).  */
+-  atomic_store_release (cond->__data.__g_signals + g1, 0);
++  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
++
++  /* If any waiters still hold group references (and thus could be blocked),
++     then wake them all up now and prevent any running ones from blocking.
++     This is effectively a catch-all for any possible current or future
++     bugs that can allow the group size to reach 0 before all G1 waiters
++     have been awakened or at least given signals to consume, or any
++     other case that can leave blocked (or about to block) older waiters..  */
++  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
++   {
++    /* First advance signals to the end of the group (i.e. enough signals
++       for the entire G1 group) to ensure that waiters which have not
++       yet blocked in the futex will not block.
++       Note that in the vast majority of cases, this should never
++       actually be necessary, since __g_signals will have enough
++       signals for the remaining g_refs waiters.  As an optimization,
++       we could check this first before proceeding, although that
++       could still leave the potential for futex lost wakeup bugs
++       if the signal count was non-zero but the futex wakeup
++       was somehow lost.  */
++    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++
++    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
++   }
+ 
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+@@ -311,6 +272,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
++  /* Now advance the new G1 g_signals to the new lowseq, giving it
++     an effective signal count of 0 to start.  */
++  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+   unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 20c348a5..1cb3dbf7 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
+    signaled), and a reference count.
+ 
+    The group reference count is used to maintain the number of waiters that
+-   are using the group's futex.  Before a group can change its role, the
+-   reference count must show that no waiters are using the futex anymore; this
+-   prevents ABA issues on the futex word.
++   are using the group's futex.
+ 
+    To represent which intervals in the waiter sequence the groups cover (and
+    thus also which group slot contains G1 or G2), we use a 64b counter to
+@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)
+        last reference.
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+-   __g_signals: The number of signals that can still be consumed.
++   __g_signals: The number of signals that can still be consumed, relative to
++     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
++     31 to 1 of g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is true iff this group has been completely signaled (i.e., it is
+-       closed).
++     * LSB is currently reserved and 0.
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)
+    sufficient because if a waiter can see a sufficiently large value, it could
+    have also consume a signal in the waiters group.
+ 
+-   Waiters try to grab a signal from __g_signals without holding a reference
+-   count, which can lead to stealing a signal from a more recent group after
+-   their own group was already closed.  They cannot always detect whether they
+-   in fact did because they do not know when they stole, but they can
+-   conservatively add a signal back to the group they stole from; if they
+-   did so unnecessarily, all that happens is a spurious wake-up.  To make this
+-   even less likely, __g1_start contains the index of the current g2 too,
+-   which allows waiters to check if there aliasing on the group slots; if
+-   there wasn't, they didn't steal from the current G1, which means that the
+-   G1 they stole from must have been already closed and they do not need to
+-   fix anything.
+-
+    It is essential that the last field in pthread_cond_t is __g_signals[1]:
+    The previous condvar used a pointer-sized field in pthread_cond_t, so a
+    PTHREAD_COND_INITIALIZER from that condvar implementation might only
+@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       while (1)
+ 	{
++          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
+ 	  /* Spin-wait first.
+ 	     Note that spinning first without checking whether a timeout
+ 	     passed might lead to what looks like a spurious wake-up even
+@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     having to compare against the current time seems to be the right
+ 	     choice from a performance perspective for most use cases.  */
+ 	  unsigned int spin = maxspin;
+-	  while (signals == 0 && spin > 0)
++	  while (spin > 0 && ((int)(signals - lowseq) < 2))
+ 	    {
+ 	      /* Check that we are not spinning on a group that's already
+ 		 closed.  */
+-	      if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-		goto done;
++	      if (seq < (g1_start >> 1))
++		break;
+ 
+ 	      /* TODO Back off.  */
+ 
+ 	      /* Reload signals.  See above for MO.  */
+ 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
++              g1_start = __condvar_load_g1_start_relaxed (cond);
++              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 	      spin--;
+ 	    }
+ 
+-	  /* If our group will be closed as indicated by the flag on signals,
+-	     don't bother grabbing a signal.  */
+-	  if (signals & 1)
+-	    goto done;
+-
+-	  /* If there is an available signal, don't block.  */
+-	  if (signals != 0)
++          if (seq < (g1_start >> 1))
++	    {
++              /* If the group is closed already,
++	         then this waiter originally had enough extra signals to
++	         consume, up until the time its group was closed.  */
++	       goto done;
++            }
++
++	  /* If there is an available signal, don't block.
++             If __g1_start has advanced at all, then we must be in G1
++	     by now, perhaps in the process of switching back to an older
++	     G2, but in either case we're allowed to consume the available
++	     signal and should not block anymore.  */
++	  if ((int)(signals - lowseq) >= 2)
+ 	    break;
+ 
+ 	  /* No signals available after spinning, so prepare to block.
+ 	     We first acquire a group reference and use acquire MO for that so
+ 	     that we synchronize with the dummy read-modify-write in
+ 	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the closed flag on __g_signals
+-	     that designates a concurrent attempt to reuse the group's slot.
++	     in this case this will make us see the advancement of __g_signals
++	     to the upcoming new g1_start that occurs with a concurrent
++	     attempt to reuse the group's slot.
+ 	     We use acquire MO for the __g_signals check to make the
+ 	     __g1_start check work (see spinning above).
+ 	     Note that the group reference acquisition will not mask the
+@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     an atomic read-modify-write operation and thus extend the release
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) != 0)
+-	      || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
++	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
++          g1_start = __condvar_load_g1_start_relaxed (cond);
++          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
++          if (seq < (g1_start >> 1))
+ 	    {
+-	      /* Our group is closed.  Wake up any signalers that might be
+-		 waiting.  */
++              /* group is closed already, so don't block */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      goto done;
+ 	    }
+ 
++	  if ((int)(signals - lowseq) >= 2)
++	    {
++	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
++	      __condvar_dec_grefs (cond, g, private);
++	      break;
++            }
++
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+ 	  struct _condvar_cleanup_buffer cbuffer;
+@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+ 
+ 	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, 0, clockid, abstime, private);
++	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
+ 
+ 	  __pthread_cleanup_pop (&buffer, 0);
+ 
+@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+ 
++       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
++	 goto done;
+     }
+   /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+      of __g1_start below (see spinning above for a similar case).  In
+@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+ 						&signals, signals - 2));
+ 
+-  /* We consumed a signal but we could have consumed from a more recent group
+-     that aliased with ours due to being in the same group slot.  If this
+-     might be the case our group must be closed as visible through
+-     __g1_start.  */
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-  if (seq < (g1_start >> 1))
+-    {
+-      /* We potentially stole a signal from a more recent group but we do not
+-	 know which group we really consumed from.
+-	 We do not care about groups older than current G1 because they are
+-	 closed; we could have stolen from these, but then we just add a
+-	 spurious wake-up for the current groups.
+-	 We will never steal a signal from current G2 that was really intended
+-	 for G2 because G2 never receives signals (until it becomes G1).  We
+-	 could have stolen a signal from G2 that was conservatively added by a
+-	 previous waiter that also thought it stole a signal -- but given that
+-	 that signal was added unnecessarily, it's not a problem if we steal
+-	 it.
+-	 Thus, the remaining case is that we could have stolen from the current
+-	 G1, where "current" means the __g1_start value we observed.  However,
+-	 if the current G1 does not have the same slot index as we do, we did
+-	 not steal from it and do not need to undo that.  This is the reason
+-	 for putting a bit with G2's index into__g1_start as well.  */
+-      if (((g1_start & 1) ^ 1) == g)
+-	{
+-	  /* We have to conservatively undo our potential mistake of stealing
+-	     a signal.  We can stop trying to do that when the current G1
+-	     changes because other spinning waiters will notice this too and
+-	     __condvar_quiesce_and_switch_g1 has checked that there are no
+-	     futex waiters anymore before switching G1.
+-	     Relaxed MO is fine for the __g1_start load because we need to
+-	     merely be able to observe this fact and not have to observe
+-	     something else as well.
+-	     ??? Would it help to spin for a little while to see whether the
+-	     current G1 gets closed?  This might be worthwhile if the group is
+-	     small or close to being closed.  */
+-	  unsigned int s = atomic_load_relaxed (cond->__data.__g_signals + g);
+-	  while (__condvar_load_g1_start_relaxed (cond) == g1_start)
+-	    {
+-	      /* Try to add a signal.  We don't need to acquire the lock
+-		 because at worst we can cause a spurious wake-up.  If the
+-		 group is in the process of being closed (LSB is true), this
+-		 has an effect similar to us adding a signal.  */
+-	      if (((s & 1) != 0)
+-		  || atomic_compare_exchange_weak_relaxed
+-		       (cond->__data.__g_signals + g, &s, s + 2))
+-		{
+-		  /* If we added a signal, we also need to add a wake-up on
+-		     the futex.  We also need to do that if we skipped adding
+-		     a signal because the group is being closed because
+-		     while __condvar_quiesce_and_switch_g1 could have closed
+-		     the group, it might stil be waiting for futex waiters to
+-		     leave (and one of those waiters might be the one we stole
+-		     the signal from, which cause it to block using the
+-		     futex).  */
+-		  futex_wake (cond->__data.__g_signals + g, 1, private);
+-		  break;
+-		}
+-	      /* TODO Back off.  */
+-	    }
+-	}
+-    }
+-
+  done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index ca7f630699..15179899d4 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -62,6 +62,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0026-PR25847-1.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


