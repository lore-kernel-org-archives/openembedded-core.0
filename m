Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A398C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 06:06:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.55293.1753942017053273797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 23:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0307adb34a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56V5FCBJ532425
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 06:06:56 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4881gsg1wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 06:06:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1773fhoIW83Z4894ScyQ/a6afheSEOd+GuUpv/Bi6lVB9aCP9Oj+E4qewKYNuK7r+1lzRDS7GScKwIEAdICY+QcSQrAVVixSpR7hc0rdzi8RMGI5tSP38Oh1Y055mtf2JKg4UY4AN/Yh9Zl8pgP0VLhAkhuA4ZkboQPVsr2WDL7YcFAmMY+U1AzTmTI11J98gL8MSZP5piD/ZuSQWvXo4a8IEBaH0nXiFLXawSEwL3/vemsTVNQXnvLQWqm54aNSq0gDqxAlhBCy+u4og3F8mB/stUdAfnvmcblGsP7ftwnaAdMuytvkO33JIy5bi8MI2v6ottSx1c/ccVJdwsyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5FcMwH/HNotaHdQsrM6wSQiXfQULZ/KFSEwUvLRm18=;
 b=TmjMgCBk7vjANCGgE3EyiRotRLz1F7F24dDkELvW8VTAW6wR5h3Dv97+F6Ol4UHl16Ko2kUWeUoJmNoti835P8qE4Tuq2PXNEHrkoFEc6od0BdlSIPFSfWo6Zeu40YjUlloPVXZl7acEFRtCUBaHzU5KeWudwNTOd0oGuGQkUyzkZbInp5otgsOBRMiVEmnIz34YRIXAYOhg4hxTH/h0f+Xzdg/rXKWJQtVKUubi1D97f3WijMwYGPyTdbKVzhqI11lM+oPv+TbGhTs2OrAJ7lAXKmLq3rr25iTG/grA+3ThJuBf0JekH/DynRbIRGt5Z3WlD44qKD9qFT1RVYPnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DM3PPF68472F2DC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 06:06:53 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8964.023; Thu, 31 Jul 2025
 06:06:53 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][scarthgap][kirkstone][PATCH] avahi: fix CVE-2024-52615
Date: Thu, 31 Jul 2025 14:06:42 +0800
Message-Id: <20250731060642.3366109-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DM3PPF68472F2DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a49e414-aef6-4a65-6ee2-08ddcff8725d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2KLwHN6OVkAAHz+PGrZc9v7ENDXGRoUZvEaOAvZDxg4TlJwsAKH5IyiVWsOK?=
 =?us-ascii?Q?SDXAH1UQ024I4HyNvxWB6lRHt9y33NprEzJ8u0Rt7O6qNY7iW4+9aYu9fCtI?=
 =?us-ascii?Q?sSxoV80qesFLmlAHUK53JQ8GalmgIgus6k6WBVhBV3iV9vN3WyhJpUhfX2OU?=
 =?us-ascii?Q?UzpDpuX06PGUVopcT/d+NkFy0Puz+i4YNknAA+wlxH7JNkniyWcsJlG04ejR?=
 =?us-ascii?Q?VsvfsdfDZG2XAzP9EGShd/34G3NT9XKXvYopYmY8D4R+by/8AT7Ef6jDjE3I?=
 =?us-ascii?Q?+onPnFxxz/tIxOdO2Dv7MRHBnCufeCYvsn1sqX8kYbfClfezF3NoGmihNKPe?=
 =?us-ascii?Q?Wf6kxMW42r4+M+FA+xw5p9yKiBB9ImA+KF/g3JOl60WWthAJsMyi758QlSAc?=
 =?us-ascii?Q?IYd5pT6bSj6nna2gTwpU5K1DkC5I/BF4ja0ZLSpQe022agTpUVTKjFJO8Ge1?=
 =?us-ascii?Q?1l1pbEEcDOlntzLhbDevzS/CgJuNtkwm4aOXrKKVLx69A706IohsXi7R3bmV?=
 =?us-ascii?Q?Kt+ZWPxnb+0U3of6SfLo/mxFbAMf6R0iTw/4AHu4+T7rsmBpwNbkKzJ/kTCd?=
 =?us-ascii?Q?AyKwuJ5Ug5uayFp9ah6sSzZ8BgPejvpQO4qfTiW9o7D2EyhG6crPiPFzSlsn?=
 =?us-ascii?Q?0fEmYugfzH5gKFVwJcBcac5QbsV5mZO5HtZXPnjOCOiV55Ab95dvq8U94BYs?=
 =?us-ascii?Q?McuLATTxMZd/yINwDGbkRZ75yDgvr56nlXvroKBqELDjBZNpM9it1NMiViWI?=
 =?us-ascii?Q?LpzzqzMTKVMeVzsDoGPzJonoWeuAfQjAeebmnS/V/j7FfVfFMHFiB2ohqUTq?=
 =?us-ascii?Q?Ll/04yetq6b4MMncdLIqfpGhSeC0DmHbgNV/r5bY043BORTvsx4msUFpkQWo?=
 =?us-ascii?Q?nbJ2su3dMUBaxjxLJy7G2R0Jb6N36B3x58aGusN2EFhrnEKgmvR4gJ0qF0rQ?=
 =?us-ascii?Q?7ioUWY/9WN57JT/SBZEHbpDut/jp1FKhnyqANsRk8cW/xpfDBX7b/iwK0ea9?=
 =?us-ascii?Q?6WZJI7X4AQMROUf02nl6VuhD/cD2eAIq0BZTnL/ca5yz9+wAOOdnhGmZCMvd?=
 =?us-ascii?Q?7SpYhlVHvSk0xvLfu9vE3sQ3m394ub4gDvAGqVeTzrh8vECpASKxM+rad6oP?=
 =?us-ascii?Q?Tp2SaiuBKvHGlWEKh/pAiuBUtDY9rOVWAooEJKUn3i8w1sOsKwMwiYDl4NSu?=
 =?us-ascii?Q?gdXPaaO5qFLFQI8DH1HL7coL10TxugmRrfnjIqDe+8KEQeweADbahHmBk1rV?=
 =?us-ascii?Q?ZVtZZQlpfo+12yf/odP/n5U+gDOw69C11G59blrSPCihhQVYMSiGtSMQI+JF?=
 =?us-ascii?Q?QU4C8gSL5KP57UVc0oyg+x86fYS2Ooo2vJKzB6k5a6gi6ErasU2tt3fQAlBo?=
 =?us-ascii?Q?RxtFYIAIlUka18bN4iSGnwZnya2dRrF5mc797Ac6m2Nsz3th6D4qhNkz37bB?=
 =?us-ascii?Q?ViteQwRcOHxppO/ItXfn13HfE49B6eQSW+UTIIwBlCkxx5CQAoFl/hpSMCQ6?=
 =?us-ascii?Q?uV80XJmjpKrG6bY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EurHqWPDIE0BpbGj0v1Bq3i2V/x9TbYMoz6ae4ZbRNLhioHLbBZUeCah7f96?=
 =?us-ascii?Q?WCS+1LfweWqUY8PsEgt0JzfDGZ+dhbMP6a9gRH0n1IIPJD4Dp9WL/ggO+cSY?=
 =?us-ascii?Q?5JmtUDdNHuaGH+77aH1gzef8MnMnKHpdei1Jo9zv5NfS8UmjL3Z06bTR7At6?=
 =?us-ascii?Q?kkTwtMUBccHYBArz1FqWKKdUv77FJBMtR4GPVxeV2hsGjQTjctPY4jIxtXKw?=
 =?us-ascii?Q?7N9dgJe5rh+Hi5QvPmaRzMTnKCWAc8bFMsQfnrusPMJpB1EV5p5+Jzkq4OqG?=
 =?us-ascii?Q?GxMAt4/oBNrVd+g+TYo2mxapRSuMUnpHvx3z2gmmUKeMUmCFXu1/YeFAKbfP?=
 =?us-ascii?Q?4Jyday4fdUsMC4IEmDbLzaRRofcT2xEJg3zzQwMmcs0amHSNWiof+fLiLadB?=
 =?us-ascii?Q?5YEJv6myf27iGmqdq83XSfw1HCZFKtS0MujxtFhNRDFYE9nQhE4CR1ZAmqD8?=
 =?us-ascii?Q?+CsHkKoh0juFfdFnh2LHkIw5C3PkApRtVBFqJxW+tqA0h3GAryjJW4pnQu0b?=
 =?us-ascii?Q?GfrASx1IrX3lVyRInHXrdxVGaLjmsP7TPm3Fxjsroq18fcwE4mwo/bR2I526?=
 =?us-ascii?Q?sTs2hH6rXyyaAbe3OrruJoO9sF5/KoxwbVIRbx4cfrfvy2+tyHFK31AZgNc0?=
 =?us-ascii?Q?TC6+TH7VhAmfTl1tph4xAzs74GyBsKV5KQ+iWf3AcKtooZWrf+JZpSeF13IO?=
 =?us-ascii?Q?+c5fPk+GcoCo6ICONV4Ybe7ayDcpMkXq9b/cijdOmPP4PZXjHIGb+PXehkf0?=
 =?us-ascii?Q?w6h3oc3LTVJfMuVZEMPlF0h643+bm4+BZLWlKaJ5XoTQMuLhQUvBdeczuefr?=
 =?us-ascii?Q?Vea83kIuaBi4Oe1LMIAiDm0omW15RnwbPePbmo4jDO4Y6jwzft8wenVJL7O1?=
 =?us-ascii?Q?/61OCcgszk69GfC0de3alYrXOFc7yvb97pZuOl+cS8AtHG3fmyNWaWqnJoF9?=
 =?us-ascii?Q?9i2n8Gn3232RQBDzEWSPaLdXZeXjuC8gXlGNBHBDYEjdoXgBKnfFULsgeZfi?=
 =?us-ascii?Q?5BmWG/j9nj0mOsLrZUawfp+YP7g23vvM17Fea7nkg625+Vvx7lOfb/Cvyz+o?=
 =?us-ascii?Q?jQCg07fm9mX4fCScy7lHNcAi9SH/5z1wifKMTEmHObtJXpMxWRKAQZ5qXb9n?=
 =?us-ascii?Q?n7B1mcEU+60zXRhk7oPbbMyaV5vhp1SfY+IXp/bMY1eqWl/lRTGfy2WsIMFA?=
 =?us-ascii?Q?f0hBm6ogQB++szxWSSNZm5+CyJbIX4LInYwX3MzUJvWIIFA7NXgUb0GVX22Y?=
 =?us-ascii?Q?xJFHK1mVLx4OBE/gm/MhrIbGzD06+vMWUjkm4aUakABA6SGdEmEAaPwdLmUy?=
 =?us-ascii?Q?O+1bso5Xdu7gE6ei2GQ4yqSfsOgWfWGuofta4HGXBlDrbjKRtl5v8EgAqVU1?=
 =?us-ascii?Q?+sL2re/3cq478ErP2ocs9aV7o2SBFmH8rY0yedAnKDaQ6qBHYa0vXYGUDAuP?=
 =?us-ascii?Q?PhqVWTvzO8MNKYesQ/ZGPpU/MwPVNxCPGr2zfypQhcfqru/6UZiStfem+uCQ?=
 =?us-ascii?Q?Ae6Lt2lfaUZ0ZQ7XHZTUwMQ3cjgrO0gs+u6ru5++xiVFJctukx8dUm9ST4qT?=
 =?us-ascii?Q?WRKF0M6jdcmRh4UXWVYd1WtXGq55HZsDRZxp8E2xpaDqsnFwuKFDkEuoUIXD?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a49e414-aef6-4a65-6ee2-08ddcff8725d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 06:06:53.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22pzlvxrgLv3j1qpn91FFm5AAVh4+01MYGo+KK6OVAeRC9+fRwF8siLSpirh1dGsvymE1Ht6E6nfVKksPk0TRtVAgVUnyvu6KHWx80F43IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF68472F2DC
X-Proofpoint-GUID: -I6TQZnHZbZlqSG2smPodgAq-WeY_rUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA0MCBTYWx0ZWRfX4aOd8nOS1/V+
 Yj+JDG4cBDoa8GmDcYqtx90PEQfkCxE6VNnhVAYKDdJaqNyXH9Zb908naz6FNNONw9/ww6WII2H
 rz01TI9T16U2VuQe3YoCWkloNN3yhu8FISjAWAez/Hc+cLnYmrKj/A7VdU+hbemw2lPdqEk03FK
 E7dVKyF3oGIQApDSs1NB9pFpnGc6T6EtzSkHOIUR/Y4umpB2GCbGHMk8x/GnUz1wMq9yn001DE2
 ExElwNAiWfxGOqJiRruVX/hOP68SE19LuiHIi8k0X4gvTCvlqLSOdDcB6sH9T49AcS8yVC2fxDE
 htHU/k7NLXai8cZ1aE3hZLjvLuigmaa4kkQoGN9BJSAsgj+xL41se0ouebbbw/Wf+xnQmvwoFZv
 ZnNLj8yF
X-Authority-Analysis: v=2.4 cv=cMLgskeN c=1 sm=1 tr=0 ts=688b0800 cx=c_pps
 a=B4bUw2QgNwGTCAXqIx8Ikg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=FLwAJfY-5Q4A:10 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=A2HaFPfzqYc8LxoZLAkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -I6TQZnHZbZlqSG2smPodgAq-WeY_rUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507310028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 06:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221174

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-52615:
A flaw was found in Avahi-daemon, which relies on fixed source ports for wide-area
DNS queries. This issue simplifies attacks where malicious DNS responses are injected.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-52615]
[https://github.com/avahi/avahi/security/advisories/GHSA-x6vp-f33h-h32g]

Upstream patches:
[https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52615.patch          | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 734a73541f..4fe8ba4d28 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
+           file://CVE-2024-52615.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch b/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
new file mode 100644
index 0000000000..9737f52837
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
@@ -0,0 +1,228 @@
+From 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 27 Nov 2024 18:07:32 +0100
+Subject: [PATCH] core/wide-area: fix for CVE-2024-52615
+
+CVE: CVE-2024-52615
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ avahi-core/wide-area.c | 128 ++++++++++++++++++++++-------------------
+ 1 file changed, 69 insertions(+), 59 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 00a15056e..06df7afc6 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -81,6 +81,10 @@ struct AvahiWideAreaLookup {
+ 
+     AvahiAddress dns_server_used;
+ 
++    int fd;
++    AvahiWatch *watch;
++    AvahiProtocol proto;
++
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, lookups);
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, by_key);
+ };
+@@ -88,9 +92,6 @@ struct AvahiWideAreaLookup {
+ struct AvahiWideAreaLookupEngine {
+     AvahiServer *server;
+ 
+-    int fd_ipv4, fd_ipv6;
+-    AvahiWatch *watch_ipv4, *watch_ipv6;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -125,35 +126,67 @@ static AvahiWideAreaLookup* find_lookup(AvahiWideAreaLookupEngine *e, uint16_t i
+     return l;
+ }
+ 
++static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata);
++
+ static int send_to_dns_server(AvahiWideAreaLookup *l, AvahiDnsPacket *p) {
++    AvahiWideAreaLookupEngine *e;
+     AvahiAddress *a;
++    AvahiServer *s;
++    AvahiWatch *w;
++    int r;
+ 
+     assert(l);
+     assert(p);
+ 
+-    if (l->engine->n_dns_servers <= 0)
++    e = l->engine;
++    assert(e);
++
++    s = e->server;
++    assert(s);
++
++    if (e->n_dns_servers <= 0)
+         return -1;
+ 
+-    assert(l->engine->current_dns_server < l->engine->n_dns_servers);
++    assert(e->current_dns_server < e->n_dns_servers);
+ 
+-    a = &l->engine->dns_servers[l->engine->current_dns_server];
++    a = &e->dns_servers[e->current_dns_server];
+     l->dns_server_used = *a;
+ 
+-    if (a->proto == AVAHI_PROTO_INET) {
++    if (l->fd >= 0) {
++        /* We are reusing lookup object and sending packet to another server so let's cleanup before we establish connection to new server. */
++        s->poll_api->watch_free(l->watch);
++        l->watch = NULL;
+ 
+-        if (l->engine->fd_ipv4 < 0)
+-            return -1;
++        close(l->fd);
++        l->fd = -EBADF;
++    }
+ 
+-        return avahi_send_dns_packet_ipv4(l->engine->fd_ipv4, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT);
++    assert(a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6);
+ 
+-    } else {
+-        assert(a->proto == AVAHI_PROTO_INET6);
++    if (a->proto == AVAHI_PROTO_INET)
++        r = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
++    else
++        r = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+ 
+-        if (l->engine->fd_ipv6 < 0)
+-            return -1;
++    if (r < 0) {
++        avahi_log_error(__FILE__ ": Failed to create socket for wide area lookup");
++        return -1;
++    }
+ 
+-        return avahi_send_dns_packet_ipv6(l->engine->fd_ipv6, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
++    w = s->poll_api->watch_new(s->poll_api, r, AVAHI_WATCH_IN, socket_event, l);
++    if (!w) {
++        close(r);
++        avahi_log_error(__FILE__ ": Failed to create socket watch for wide area lookup");
++        return -1;
+     }
++
++    l->fd = r;
++    l->watch = w;
++    l->proto = a->proto;
++
++    return a->proto == AVAHI_PROTO_INET ?
++                avahi_send_dns_packet_ipv4(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT):
++                avahi_send_dns_packet_ipv6(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
+ }
+ 
+ static void next_dns_server(AvahiWideAreaLookupEngine *e) {
+@@ -246,6 +279,9 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     l->dead = 0;
+     l->key = avahi_key_ref(key);
+     l->cname_key = avahi_key_new_cname(l->key);
++    l->fd = -EBADF;
++    l->watch = NULL;
++    l->proto = AVAHI_PROTO_UNSPEC;
+     l->callback = callback;
+     l->userdata = userdata;
+ 
+@@ -314,6 +350,12 @@ static void lookup_destroy(AvahiWideAreaLookup *l) {
+     if (l->cname_key)
+         avahi_key_unref(l->cname_key);
+ 
++    if (l->watch)
++            l->engine->server->poll_api->watch_free(l->watch);
++
++    if (l->fd >= 0)
++        close(l->fd);
++
+     avahi_free(l);
+ }
+ 
+@@ -572,14 +614,20 @@ static void handle_packet(AvahiWideAreaLookupEngine *e, AvahiDnsPacket *p) {
+ }
+ 
+ static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata) {
+-    AvahiWideAreaLookupEngine *e = userdata;
++    AvahiWideAreaLookup *l = userdata;
++    AvahiWideAreaLookupEngine *e = l->engine;
+     AvahiDnsPacket *p = NULL;
+ 
+-    if (fd == e->fd_ipv4)
+-        p = avahi_recv_dns_packet_ipv4(e->fd_ipv4, NULL, NULL, NULL, NULL, NULL);
++    assert(l);
++    assert(e);
++    assert(l->fd == fd);
++
++    if (l->proto == AVAHI_PROTO_INET)
++        p = avahi_recv_dns_packet_ipv4(l->fd, NULL, NULL, NULL, NULL, NULL);
+     else {
+-        assert(fd == e->fd_ipv6);
+-        p = avahi_recv_dns_packet_ipv6(e->fd_ipv6, NULL, NULL, NULL, NULL, NULL);
++        assert(l->proto == AVAHI_PROTO_INET6);
++
++        p = avahi_recv_dns_packet_ipv6(l->fd, NULL, NULL, NULL, NULL, NULL);
+     }
+ 
+     if (p) {
+@@ -598,32 +646,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+     e->server = s;
+     e->cleanup_dead = 0;
+ 
+-    /* Create sockets */
+-    e->fd_ipv4 = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
+-    e->fd_ipv6 = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+-
+-    if (e->fd_ipv4 < 0 && e->fd_ipv6 < 0) {
+-        avahi_log_error(__FILE__": Failed to create wide area sockets: %s", strerror(errno));
+-
+-        if (e->fd_ipv6 >= 0)
+-            close(e->fd_ipv6);
+-
+-        if (e->fd_ipv4 >= 0)
+-            close(e->fd_ipv4);
+-
+-        avahi_free(e);
+-        return NULL;
+-    }
+-
+-    /* Create watches */
+-
+-    e->watch_ipv4 = e->watch_ipv6 = NULL;
+-
+-    if (e->fd_ipv4 >= 0)
+-        e->watch_ipv4 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv4, AVAHI_WATCH_IN, socket_event, e);
+-    if (e->fd_ipv6 >= 0)
+-        e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+-
+     e->n_dns_servers = e->current_dns_server = 0;
+ 
+     /* Initialize cache */
+@@ -651,18 +673,6 @@ void avahi_wide_area_engine_free(AvahiWideAreaLookupEngine *e) {
+     avahi_hashmap_free(e->lookups_by_id);
+     avahi_hashmap_free(e->lookups_by_key);
+ 
+-    if (e->watch_ipv4)
+-        e->server->poll_api->watch_free(e->watch_ipv4);
+-
+-    if (e->watch_ipv6)
+-        e->server->poll_api->watch_free(e->watch_ipv6);
+-
+-    if (e->fd_ipv6 >= 0)
+-        close(e->fd_ipv6);
+-
+-    if (e->fd_ipv4 >= 0)
+-        close(e->fd_ipv4);
+-
+     avahi_free(e);
+ }
+ 
+@@ -680,7 +690,7 @@ void avahi_wide_area_set_servers(AvahiWideAreaLookupEngine *e, const AvahiAddres
+ 
+     if (a) {
+         for (e->n_dns_servers = 0; n > 0 && e->n_dns_servers < AVAHI_WIDE_AREA_SERVERS_MAX; a++, n--)
+-            if ((a->proto == AVAHI_PROTO_INET && e->fd_ipv4 >= 0) || (a->proto == AVAHI_PROTO_INET6 && e->fd_ipv6 >= 0))
++            if (a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6)
+                 e->dns_servers[e->n_dns_servers++] = *a;
+     } else {
+         assert(n == 0);
-- 
2.34.1


