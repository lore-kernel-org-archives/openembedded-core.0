Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA0FC9830E
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 05:54:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6877.1790747697723269253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 22:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p/aAHp/w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47337851c1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U4AJYK2203275
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 22:54:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=z276NT825
	seMnR8MHGVFsTq1gKIKcRCMRJV15NTh9KM=; b=p/aAHp/wxXeZSmcOs2ZXbfVJ2
	FSHwZwkxeNVZTOQWLhqBnXlN5T1fkYpl4JggoNfqm918HAQnHOrS95SSSp0tKTb/
	5tIC6Nw6FQGYDLaXndV1FezD8SrB85Ext+k79BXhMalLnYDwDNp43a5FRtqn5baH
	4Re3qO+vb0JiSET8nth9hsmhIxsXqGMqL1J4JsA+f7cJhFjva9JhN2SG3KTkfT8M
	SkAM0KjdWJ1DKjyG5oOPvTIQ8y2ANfX7+eEeGX5/X9rgTgSYfn1hlzEF71ubovPq
	9H12LaPznrVvkFeIALsDljCSx0q1hpHRbJVurT5VCgGAry70aQaVmdZ0CdRBA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020073.outbound.protection.outlook.com [52.101.201.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gxdjgwpqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 22:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIte8HBA9Z2IXjRU39vSUw8UGeoZxI1JLPq5WQh4iuzvM9tvNrsyRD6872pyWZvpuqjqHNJy4X9W4co+FenRLJPQqzwSNSbPpCVeGkVIFElHU8YgYKni6tp3Ytw6gW5yIfR2irRZxnAMd85R9+Y4TDxXddHWcZ68fTdd32O1vIPiUaoPDA+/HxuQ2925Ey/tlAQr2Fd1OaGPfAecf4n3aKLWBZ9dsHy6soh8OblPU/enyTtWSST9Ay6Rf71Jlfdom5m/WHFX84beBEjdTeUQ3lcMcEBBuQXwLuxDBp59Pnhc4FpMCYsAqVjRjpOqfvAbBBeHlmTmdkgb48cR8pdd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z276NT825seMnR8MHGVFsTq1gKIKcRCMRJV15NTh9KM=;
 b=p890Kg3N+Z+hzoGfiT+9pTXbM+YPZjDROX9E57FvrKCR15Y6Ki8Yu2rQw9r3SmtFrdVZp204mFW6/L5dF4O1tIvzgBIrx44TugQ0EEL5kYdRXoSYF8mEmw0H7X8wDy22lGA5/XwDC0wec7eAuUNnqPeKov0ZPty+JUVjZboXEDaztL1AsEn8IfA6/JwlzpVmMpxndyPR2UeYqMzN0SK2o0I62qbYYEawgA6FacAc6PYsPaKr/nJU3PjE4smhPmHpPY+iXo0d68iJkLfGEdZGGP3nardgVbxs0LuYrPqO+iGWznYMioILZYM9ubSyeYIN5fvfeS6340g6zp148V7AeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 CH3PR11MB875824.namprd11.prod.outlook.com (2603:10b6:610:361::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 05:54:52 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 05:54:52 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] ptest-cargo: fix quoted RUSTFLAGS passed to cargo
Date: Tue, 29 Sep 2026 22:54:37 -0700
Message-ID: <20260930055437.1584781-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|CH3PR11MB875824:EE_
X-MS-Office365-Filtering-Correlation-Id: b90210d0-fb9c-44ba-5b06-08df1eb7583f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	SB6P0ANeo2fwaO/eray3ZUHRq+QNi8DFxkC9LAN0Ii9Ir3rQj2anRTuF/fiWEwShIj2oJ7PrxKPM+EV6xfv1blOHc7r6TeS2MThSI6aDvvf2PtQB8o6IiDTmtPzIn1Euv814UvuH2nkpE0fRoPujFi0Mdys3On1soGDlFm7vK1ogo1L03BY3xTRlfZV7LcjebTu+evE58qFsoOWcDJV8SDPSJCYt6/5I0wUH8s6AIpwbX7UmmbU5/TDL+0cT+1JZg/rM6RucsP33RGru/GskPdWFRLYoP2tycCrC2uNGMS1zPP6pQb8CDrQ35DP0gmRNgDD1rNRi+WyWVG60FzHq92TAFZnXcwKzzxOcJlvhyNoWKF7GwjWssSqtzNejNflCbInG3P704O0YUPdipv6yySqHA1zgfzVEx/V7v4R1iioIUy63oXvcM0YQMfDjYygZb6TqLRgzyuuEXzprtXJz+6e97qZ98u8RDhDDAYSQ8tEqrEApV/OPt0hkEq6RsNx/+3sHPlcIr9eyDR7vkLToy8IIaaLPzPHlKR6imZpPbfWCR+LsNWq3ljyq517tE4CHfN5OFpG7aCATFLPu3REHAiqRPzDaCKGTxOiv/FE76rtiLczFlg/9PbQuIoPv0WEt34bOl39ZDFv98XkkL/khSyXDdiR4ixtPdXdo5h/KSXvDEQxMBkrS2TweY9j07+q8o7mRC5pgNpp9+oS0Vs2cyUMFvmjyV0BIghkIevk1v/w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Apc5j7bDjp88tCfN0338VXNQgKTHSBIrV/NINMkFuodE65894S9uJ0f7xln?=
 =?us-ascii?Q?6NR+hpqvo8GPD5cKO4iV0KU1rm3FsntWirUUfCBGYIPVzmi0aozZ6Z/lQe3G?=
 =?us-ascii?Q?PNGHnlNJ+gKG/dhLnF5vJBPIpJ6Fk/qXzbOY0OenkmBEM88BDAkFtxP82kTZ?=
 =?us-ascii?Q?Cz9OcB+oidTOV/ZoC4l3hQR8Yt6XKadYK20Y2lNWgfY2zxry1MUE2Surj+Pe?=
 =?us-ascii?Q?4Ygrci75QxHuGqeMqfT+jwXvPjGYDTGsZmNB1pmvl2hWB+yTeWcHdb9tOWV2?=
 =?us-ascii?Q?U3wwnOh60D5ta+96szHpCCPDmCg5uPycZpBElDksNGOB/GekxeHt5YSJEpQc?=
 =?us-ascii?Q?h5r9lT3ji0FhiVhxlaD/u7r7vUqq1C0ZrAT3bXlQHF+RNnE+7HgHnLoV68IY?=
 =?us-ascii?Q?p6gB0vfHZXRI+nAvP1NKFJBFj13ykOegauk7NswSfHxsumHQTIwAJRpSQcOj?=
 =?us-ascii?Q?bbzdZOtZVsMMidea7hSjMLOj0G9WjUqtS1q+DmF1CKuPeWzNfGNeZKGJGzWz?=
 =?us-ascii?Q?e4+aN4wr/bnV4NbRVeV7eicycXYypY83GLhvkF9I+I0rgPItONu6vsrbgYJ4?=
 =?us-ascii?Q?NidvozqsgA0C6jin/NnFFEJIYdjMuxEkGmHai4y2NWafm3H4Q++U8EWpQi2V?=
 =?us-ascii?Q?8uUpHMKhxDqA8EsvjxsPbWAIUL4UE+6otttJKVxzLehrIePllMjQ5RRyzREC?=
 =?us-ascii?Q?UWFqBHzTh1h+vIHjA1lvQThDyybuPLDw9ZzJXnMlx9MPJC5cBmx0MFoYEVRJ?=
 =?us-ascii?Q?kxjHDiAQt0j0SpXfb+SIVMCTEsl2H0QnunSEyjCITgkEM9e9Q6bQ4iRgbxxS?=
 =?us-ascii?Q?VhPm+3Pumjdwx644JaKvw0fR4g4P+mD+PhmQ6gWbCTAgPQ/XH7ZiN9o2Bqoo?=
 =?us-ascii?Q?g0Qvldl0EmkmLeDxCHeJyXFdHcrYqm2gA/tEZT5alttlEc1uKyZv8w+5DpqI?=
 =?us-ascii?Q?ACUpfJjUWaeJwMQ6NS5EQtmQZnwcEc+PyedMVhyF9ZbOIMwJgI9mijW4FkoR?=
 =?us-ascii?Q?apBSEklfbpVArNlxztiB60G5Sm0zyigiT3SKWIfat2YQzbzYHCjJDcXawDSd?=
 =?us-ascii?Q?YKtP9bBpjM3cu+M9/7L+XoHA/PSVAI02NGeU+GKvm2gkJBN6KnHfzisYRaq3?=
 =?us-ascii?Q?2YDd2zg1y2CqZlgBI77njfSPgbKiN4c78TplblwxmFOHfZxwwHr2W9X3EXP/?=
 =?us-ascii?Q?wLViPsfp3Fv7y3I6zxQXgy4DihcXyROEtHgPTwV+kR6gmbY4BaAKhc2N/+Jt?=
 =?us-ascii?Q?Q9gHqfZVtCk5c1FB1FV4witYGF1t0Vrh+shdLtKIq0S0Gs+FDVIxpnyE3y5a?=
 =?us-ascii?Q?Hg5wu1Ntm/75Z7TrEIN/DggKyawfX20Ny0NO/11cH1zhaMvzx8ZXsj1Cgem6?=
 =?us-ascii?Q?K8KIAWkA60hYHXjZljsJIaEW/Tawp5h2Se36dIChdWIfLQyJf0j6+uEOXc40?=
 =?us-ascii?Q?FySmhJCx2o5CGfZpe7ReyIitJsB70Tv6LaZCNici0xlKOeJUZZ6xWKcSm4rI?=
 =?us-ascii?Q?rRRSAWhNSJCR0tMX0E6VWamxecZ+EaAcKP7oVVW19oBc1+VKC7oUGs5VSULF?=
 =?us-ascii?Q?Z3t8TvZaBf/iXR4+TGYLoIE3qiqEIX3Yq8Sn+RrvDjezakyRHTU86T5nYomM?=
 =?us-ascii?Q?0B9FXCEgzlvdegQyaQyGkNhI9kMn8T5TvOROrRA+0YWVtHEStKHYemh4QNMh?=
 =?us-ascii?Q?/Xr8MBvAK2Q0XlhT3X2hlwJkvNGp9rhXiyhZ0RI8Dj5EKvjxsmglnWv5kTs7?=
 =?us-ascii?Q?KGE7dbHQC2GKsU0hHve3Rkc5NASLmtI1QURuxYnyFd8uiFvbhtAm?=
X-Exchange-RoutingPolicyChecked: 
	qbML59Pdz2R9jcRUjFj06Iz/aM+yYkHYYQ6K6QnMFdDOqe13QgFnENiAfzkuL7YwkSxrTo6WqrSrc6O2oIZyv/gdhqSQ4wogO78N+YF6pq21T2jEwq5s1hdGNbqhKSGhSPw3b2eTawwukBUoKUYCrqzMRZKkzzxwLBi3dy/HntFfeCYUvbXbcrZ4iIX/CSfq6CD7kLPUA/lggUcdEV2/W2oZemakMYJuyP5L0avte2lOZ0ZenR09L/Sxs45wydkOCahNnC3ERYm3lAM8UZJKty84SGqEWrmvLqa6JM+oUH4b2gwTFM/7fjLZVdHO5FA+QLMKaUrqamB1MZjFvjpPyg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90210d0-fb9c-44ba-5b06-08df1eb7583f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 05:54:51.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPLMWs9cS2LjJEdV2DRCBkoPyR/2dc9dR1jkt579vvnP/jCOxMlbva46J4GRBTElAlyNrRuBpLrwxEd7fcLSBGYXu9qXOk1yLPzVwEB21e17N1vriy7xIbGwDFoblh9n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB875824
X-Authority-Analysis: v=2.4 cv=C/F8WgP+ c=1 sm=1 tr=0 ts=6abca431 cx=c_pps
 a=kTz8n/oXhugbiFfz+wFpMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=nnJR0A74kF6yyR4Gi8sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _zHsXWqHiqTithwuk8n5SXS-AGriDgr6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMyBTYWx0ZWRfX2X6iDecUOh9s
 X0R7EyYD+8l5kZk6RAC3nJuKnixKsJQkTRKLi9KI+H/PboFh/ms07EuvaXXp9752FMlclcwzmk2
 Htgv0bopqUrhOwuoLZBM+e+WwtzkgiK56ppimitEMb7AO7DCYr6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMyBTYWx0ZWRfX/1JGf7D491i6
 HTi3t5kyhdGXE5OVDV39NOSqmbEcRTHfb4S8fayMWfPeCw6sP5SMHGDxsateydFykxnpKCPsa2P
 uwXrQ3nw5ohtxusTUiHxDl9Xxl72UO7OuZv/Ms6IMA6o5Q+euJN7QAUr7zwo6RuDmOg7YcbTq9r
 iyEmOYwx/vZPtix5cF3zwPPbCumuKcv3APjxb47kApGRHO2VUB8j+eiHAnp6iY82mXZx12YUbXl
 Wu2wsFr3/TXaGrTpFeed6QlEbAmEdyqnZXVaE05ONse8l91ZJwunE8rPRhuZZozSevNTapii5Ax
 2Tj81XulwS5xhnT6lXf1JPskwMgjbXcxjAu1XdVorTRzioGFSIIE9sRhchPVCpQO2Ng12sYdeER
 vGMW3MjszVA4PUBDgNZ+hJFyQgpqOjvY3Ae87LMYCz0z2LqiW5BFDg8HeJIxXd72towj5czvW19
 ebSDl/HgaojauuTt0XQ==
X-Proofpoint-GUID: _zHsXWqHiqTithwuk8n5SXS-AGriDgr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246914

From: AnnLeelu George <AnnLeelu.George@windriver.com>

do_compile_ptest_cargo passes RUSTFLAGS directly to the cargo environment,
bypassing the shell. As a result, BitBake's shell escaping is preserved and
can cause quoted cfg values to reach rustc incorrectly.

This can be reproduced with:

    DISTRO_FEATURES:append = " ptest"
    DEPRECATED_CRYPTO_FLAGS:pn-openssl = "no-des"

OpenSSL then defines OPENSSL_NO_DES, which openssl-sys emits as an osslconf
cfg. The resulting RUSTFLAGS contains:

    --cfg osslconf=\"OPENSSL_NO_DES\"

The rpm-sequoia ptest build consequently fails with:

    error: unknown start of token
    error[E0765]: unterminated double quote string

The normal cargo.bbclass path is unaffected because RUSTFLAGS is exported
through the shell, which removes the shell escaping before cargo sees it.

Parse RUSTFLAGS with shlex.split() before passing it to cargo so that the
value is normalized in the same way as the shell-based cargo path.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 62444e9cc6..bd1fc4583c 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -11,6 +11,7 @@ CARGO_TEST_BINARIES_FILES ?= "${B}/test_binaries_list"
 python do_compile_ptest_cargo() {
     import subprocess
     import json
+    import shlex
 
     cargo = bb.utils.which(d.getVar("PATH"), d.getVar("CARGO"))
     cargo_build_flags = d.getVar("CARGO_BUILD_FLAGS")
@@ -21,7 +22,7 @@ python do_compile_ptest_cargo() {
     manifest_dir = os.path.dirname(manifest_path)
 
     env = os.environ.copy()
-    env['RUSTFLAGS'] = rust_flags
+    env['RUSTFLAGS'] = ' '.join(shlex.split(rust_flags))
     cmd = f"{cargo} build --tests --message-format json {cargo_build_flags} {packageconfig_confargs}"
     bb.note(f"Building tests with cargo ({cmd})")
 
-- 
2.49.0


