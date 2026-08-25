Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66048C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12588.1787621612735586640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NJwUusSb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P09qJH214504
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	NJwUusSb7ocWyxq1b6Gxkel9iT1TxgAqqJONHntNgxcYwipPy6P0sRcpnAaor1i/
	XtVIgYUy/6bi6DHxko8qrN8va90EBZuKX/V7d7t57NFnMORwWFZcEJDvZYws5w3J
	DG3beTbbJcqACDTIGnA9uZG4C+gUkGFbVY847Jd0+HYuXHuoDLtQm5yoiZkFy7rq
	Fj9llZZV7aNvJCqiJ7t8T5XRaupNQCyKaU8YgpqZUFqdPJ3T0c0a5BIBBDIC+e59
	Ig9fRHxzN6O4dnseo683IRvYGwS0DJY0Q1YcbsNVv+wdMfjIlLclhTSPjUWqyEoB
	Ms91TgxsdDWE4xU7vW9lAQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkfyx-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQw7cOpk7/kdxzHmSXpwMpaIuYEVAaOj3u/JQDtieNQT2X1XUEyn0YmuiZh6cr7yuzGceOYgmA9SAt85DePynLuh2AdeLzxhp8unprQ7xsAW1BiMxFYeB+OkTzanKjHaZa+8K7lbjCripwPGsVa6UckBlpJESmSSuUMR/USSDTYoNVIQgJ3upjbPtdjX9NFmQAv1o5r6y+h30GLYZhN0+TrIt2HjIH6LN6sqAn5NY7tV22ce4QSkpufWPVmj12Ex68KoGlHZ3JPzHpYHL0Zoa33uB72vx2tbf5U08WSEQGe06M7LB5pJE5ufT7Q1svZ0w6sUQ+RwkoTcTvpq3UVVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=nX6KIa+Hou1RuyrjN/UtNDQrvB8D31f1BWhh7h2RVBa4ibHAtlR61uNX4KJtfUiirfSr5wabkjJIChn5HJHGk4RiN+agegIsffm/w9+/1e9derOvS6laDmofgNHNPqn+NrFxvEvtFk3mnwIZA4nvqhnRkwZPvB1+sX4GKaTDiIpg7S7VLWitdEKL52K3siVQfgQXb63Fzdu6bPmt4mbvET7ClKhoe141awpfJjJ/hF7JZ962s1ajZvUPx6EhdUs5V2mgvP9Qcq51uBnRxbEoX+sY8KNz53FYaoQfJNO9W60gVFZf9JmA5/RaHEwzOeAiLB9MLzczWVdzJR5Xq7r6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:29 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:29 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 05/14] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Mon, 24 Aug 2026 18:33:03 -0700
Message-ID: <20260825013312.2695028-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bffc3c4-ae0a-4961-ec5a-08df0248ddef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|22082099003|18002099003|11063799006|56012099006|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: 
	4RmXhCJNkNlSR9qlHDoVTs1rk+50Lfso12SVdRIjY+iVmIsNYnHDCiF4Asl7CAw6XQmd1Y3Pc6i02/6brs68p5v/ALnqPeGCZrdsdd0Gmy12xh+Odxmk7dXYWCFyfCY9o5PK34hM2VB8It/Utr3gTOQmZ9Gh+jClvtlyufqnvOkN33iqv17ZM2/Nz7O4Ikl6Z5eJf7OT9LBMcYZg2eaBXT2j9omQ+yfYrvIFgosJ/y5MOGQsdpWkT9C0HSq7tEK/0dhaR7btj+ROUGlkO7cEEgAYbm1wmPBCHQM40MiL0vy0gGEzKyWUvfQpCKjTsqVmyX4adYJVlCdofXPXxqM3aaGZBWZxjr/7fTPmpdJNQgodAhmPfeD7Ki9XtsWN1O40zdF3KpXW1L9n12kEnenKwgEGQCzVKhTZDxvmVlgXr7We4BDc4QUNMJB4npd1HxIog2HC91Xh2X82F5ZVE95nXFZQtECIvH2CpaRMMOAuMZ7COEqXRUxhGjZ+erYGvuinKakZdOSu2Fs9hzFWn5E+kuct+1OiZqvrwgogQNnU+47Kn3g0owcPCooxZt/126a+C6JnxMrsKTkkTQJ2XQtwHISF/9ERp3Aieeqd8ZbjIPmegEqvl68wqz3dwYH06Al4lk6clU5wQS1/uhanxdQG8ooqIL5f4YTYyEFaJRod6Q9sS6FeaSJiQYfhM9OWr0OLvwOcYnFSzapHdmPi05DdCDBkEiY0gizIGfICi8HVOoY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KxGVAFYBgevpgDtLMQDd5AGDz45siIzjt9Nts+SmlOgRvV5GxUuzha+ZF0yZ?=
 =?us-ascii?Q?g9G8iu2rM3t1vfpYq9mkTL4sU2NFN43pwprS5giCmHZBXH33XX1UC183TkF3?=
 =?us-ascii?Q?7zK5KhZ9wTSJg8nSsUXmyWfLEyJ2Ms00BpfrE3OFjCK6pTtg2XljGrLvfDeN?=
 =?us-ascii?Q?Otnic0ianNBmVUqoDKHWVpizrXpIklPjiwAWEofLqygOlS/DnTJ/ay8R49mZ?=
 =?us-ascii?Q?r/WXNIjf6k97dkfPV52xI78YETM5egD2t6qMWdwUlG4WHnC5tTLxpaO5948e?=
 =?us-ascii?Q?JTJntjzh2w1EF1LCVo4ocpzJCyaBz6RptfoFCY5of2tva28qVHnBWrvpGiZz?=
 =?us-ascii?Q?HZ9S/iL6c2WsXbacNqojzUqandEIlwObi4YyW153c5+3bJFur+zdoLnMF7xK?=
 =?us-ascii?Q?BecdMA38PEbm+HJEi60mWQagtAH9UdrRKe6IXzQzOMUD4aFUIXDpcI/+1J9T?=
 =?us-ascii?Q?15zh2/YXU/Q3i55cNDQrAtHCtemsXlDmP5FdqIDtoK8vST7x/ZZwmYLa1TE2?=
 =?us-ascii?Q?VU036Atvh+Ezv4DsJSC/S1LiFP0YNBQpBrByFZfAHffZUdeYWJZOSTrprzT/?=
 =?us-ascii?Q?ewh7GzdZLm4yMI529FAW+48iECTOJSGCFEk9mKxmAYxNOMZho7CqwvyCRaxb?=
 =?us-ascii?Q?B946AZLGi0LBOOSzLy3KPY8jRSGiX+/NzFIbqOh2srBSkmFaW5CWjEl5wR4F?=
 =?us-ascii?Q?DmfRDuegAe18pgFdpW111FOTTSF9+bd2ISLft4ZWqXg+DXGYIbZs/hUpZiZN?=
 =?us-ascii?Q?hf4Wnp8likGssDRt/fA2VT22KFjq9jm8SXKd4aFlR+gfzcP2ysgzUQNRan1s?=
 =?us-ascii?Q?o1sdrHAzruPBviXD7MJM6KQapjFSp+B6Z0FzkyfuWlOJ1Q980y/TwgR/mc0k?=
 =?us-ascii?Q?ZLC1EFwLIONaaxLrgtjwtHkbs27mhjibbR2zqCn2h6EE8oRuKQE3BhQzYyRh?=
 =?us-ascii?Q?BcFMOb1mNgTkT1wrOqwUDQls4mkYw+7fsWDd72hV/vgG9lil942tu20TBebT?=
 =?us-ascii?Q?mrDSp+ijZjfPwusaJ18WBV6C5n4z0xTU6iFzbamkI29lwD3jGTqi9J2OULl9?=
 =?us-ascii?Q?XH8P9BLI3r2UyFpj5ID6Vwk7WVlqyDtY2c7Y3Iy5VimjZ4yqpwl7/lZPDb8z?=
 =?us-ascii?Q?dyNBfyLQM+wW2PH6rBNEByfx7NXV1mIJ4pdmgQaspoC0/K41E9DGV0jJ+ZoT?=
 =?us-ascii?Q?nl9woQcI+/kOrg9UyKV2KSStRfylX4J4YI867g+AH5sXXecVgvNP1PeEMHKv?=
 =?us-ascii?Q?6KngVgrJaW+hplaoKym/TJsmGaiJCPTgNl/HKdQtnDpBuJbPJVHIVhiwjGg1?=
 =?us-ascii?Q?U+/emDrJd4U4X6r8M+TeO8ecyvDANOLgIJPnT1/+ImVF2zbC/auJSUpI0WSY?=
 =?us-ascii?Q?mg58BY0hJfIR7oPFR3UwSJnX7Rjl6mqv+he9iBv0wEhyJfpkaLy15p9Rz3Sf?=
 =?us-ascii?Q?J/iNupVlTCyf851yOiyGh7jTs+MZMz8lFKzRi5qov0nNI4aXNNtDo4EROGbs?=
 =?us-ascii?Q?fQ3181IzqIZNlwQqB5gBIgDv1yBFN0JReIbXv0S0QhIehQIbqVdlfS3kfw6d?=
 =?us-ascii?Q?+fv/FAomAb9xELeMWkKnenYH5VpCkM2U8Y8LS4yhxHKWno6UalF06RrQ4lZb?=
 =?us-ascii?Q?wlsrOpVZ85SxeDZJld5iHG5tziEYfliDnlw3rlydLQS+IvRFByrMOiSQPCGs?=
 =?us-ascii?Q?GCQmJ1F2w9Hmly+hOsX3SB48dLeEdSQkGYvJFclcf/fxeF06+63K+PZvkTFv?=
 =?us-ascii?Q?Vt0d+KRuRgtd5Z0tx/MgHFanfhyuJqk=3D?=
X-Exchange-RoutingPolicyChecked: 
	v42w72OXe0YCXL8uo9BZR+G5BDBW1y0QZjLooyuJrKWeW7zoyR/1e9JYNBM5V50c5vtc56RLfQld274dTRRSTHOqXfrUHKWHl5H+wQ8uCb+5MLZNH7WNjFfxbkM5GYxJVYIUKWI9CuSrBc3bFWV2nx6eBVJ25R7PR5//E2rOQKzD6LZc0CuOYEEbJDzIwKCZqzZuhkJ6mw+czcAq4o+u4VxStQev4rH5nWojqSQ07/AVznrCoV3wddaYGSD4FYljc7F1ppBKwKZD+U7OCQOLZ+kJGavk1fODBUph5O9L1twKk/oLLylyyubqpGXw3wQSnE7coOOElqJO+EsW7xer7A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bffc3c4-ae0a-4961-ec5a-08df0248ddef
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:29.5314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNqiSzIOt+YPzgujwA+iCJWMYqO7IGvWuRf70Zwl4pau2PP0xviPVZprJT3oSUr/JlTIUfIlAyur/mM8fYb1Bm55x4hcyCRYUAfwm0kZj0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: KOKxO_fQINwK7a8goIQwzhiI1SLqaJkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX2YxQOGo7aQLm
 mlbgErxEEQXYFm4oQPw4eexs8j32ff29ymerRI0TNyMHwXnCkg9Mknpf/2NJfei8KvKekJx39yA
 jIxyph19+IVfduX8p46ZpNUfuoTrdLnX/mf+SPQ5fWAYbzN+5FOPi3RA6YRf9Pb95giFerrFk1V
 YDglYjbl0ENV6/3+wWB/a8TtJTw+qNC/k/ZkXMKT/+yHaHMRq3vgHfFz3ZaYxxBeEsljy7UtPeI
 bN+oIeu1L9+592jWUOI4aPOUgQaaMc8SIz47YQVwgY34qjd/M1JQs81qDGExlBkk+zdftynHI3v
 96GczBVKsW+wvqdnRXeEwvarKQKDweSpsAcMdme4qJjjcii4ULSa6R4zSSohJRP/NANEY5OTFQ9
 3ux7JYp/6fLIeQkyK28/tqshIVtYQDcmmATJu90cVWdF3F4HWEZBL8ACdzfYtYk7eRWJiX+6YFH
 Wj2JRX8UwExSefTJPkA==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0ec cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yTfiCMdNjR4p1N9JhrR76Zf2UNYhxgjY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX1DScJJPDvVcp
 D8Nc3IhksDSB2jvF6bTdlfcAdOzNeEB5rgcwQr0rjljmAzZ6tCfvn7IezbSrl9HwMJ0J4i0ygr8
 7CkcPU15aC2R7Q6q9oTo/SOdJJH6/1FfaKSf2dCKDRyDaGtr9Bon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244177

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

