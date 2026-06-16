Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1D5CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 02:36:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.145894.1781577374127236973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 19:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kb5r0W2D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06275c4eb3=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G2SL6G2480743
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 19:36:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=osAWtIYsD
	XgcsTvYsHuSF4zaorQgLD8RXItQDjP+Yh4=; b=kb5r0W2DrCwI/vd++ceI2U3Gv
	HYSL5PuP2kNJj8YFoElPgUnxTVhJuMyPinO9+n/s+7Eq2P2F8ie1uSoIdwg/ZeyH
	aydCseJ60MF6F7cmVOpSCWIYz1yg3OvrQeD5ibSBe9jcNoqs0nt48CiP1a/7FKZK
	qcbpbf59k4zUbPfeMGkc0AEFJRgWvJ+md9MwZLwcuvePdfEWWelRNvdHGaal0Q5X
	ZAfJl68izkFh6QKvGtR8dri7VrNlWgGYGIHAXghXRJrV1PH4ZbpvW4CaVCTKLOEv
	TJkPHmDZhfxMPaGxiXAmjz9GYhXfIN9grBKxcpDWLo+VfRjoew1eROlOEiolQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0br8s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 19:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNzkY+TRhTA926as/vnwOEnn6zfbVb1Zo808KBuwRojhLcFimCS3l36867eMROsnpZ1qXDWvv7p0AcUZ2xAYHW0OC6353u7FcMjiGMi3CUey/aCMfiHmjDNHrE6thP0Hj89xq737excZgGOy9ld1EQKu2GXlXqS6Qu1hRouPfDrEyKwklc0kcyvfXcxxIDAUy6WBGizNT7wSbnUzz4/4rRvCcJmSMYTs4MxKbUVdFhQ7SnefTWMNn7Ny3q6aMuy+TegyNV0kKeN/Ao/owjb3yYEv6WLxM7/ue7i0W+BmNc21uhP5T9WVoIj2uxXIWGQHESlkOI99vbsjSw77UB01Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osAWtIYsDXgcsTvYsHuSF4zaorQgLD8RXItQDjP+Yh4=;
 b=VtdnEZjy4+qiBNBV3XemOdec6VhxXQQojNeKt4gij7GYVktFFHYE3gILQo6aYMXhiwec8Y0wFf67nw55qtbpL+WFEOT25Fmqc2pG1SKzshKtgGJlxnNWsXeAHUx0jxTmv4VIu1R5EkVwa7m/V6kP2JPLuWofrRXJC4tFPF/vrotw554TEB4M6r3pPVLEomNKMrNzE7Rl2HyPojymixii52mLIHwLzETkOcR3xfGZzPAPHXLFIAoEoL1zYtwbpTYJrzRwvPWJ60ukMTQTACK4sf+UT7s3PvUw9+Ds0rz6441ZJGtMZmeUi0CZkRCN9u9nnb7jqWVASZqUvW8GgEZ3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 02:36:10 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 02:36:10 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][PATCH v2] libcap: add ptest support
Date: Mon, 15 Jun 2026 19:35:45 -0700
Message-ID: <20260616023545.4113764-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|IA0PR11MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7bbffc-db4f-4b08-c5dd-08decb5006b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|18002099003|38350700014|56012099006|12006099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	vmPF56v7Ueq7cHzu/tZzTgMLqpiMEkMujBJYKWQ0RBG4AMSem6spfxvqQKjxp6rSQurJvIgLDIi/HMG9C7VNRglpYqmK33JPRE/RqPqf2B7RhapzHsyxIU4LONE6swmJT8OMIQiB6aO1E+jp0vVbTc6mIFHSa/gUrTo/hiYxnci1UTEye0jmQ+ZBaOqyco/ouPw4VZZqMvjUfBZLBfq+1iAmCyA2slJHj6VcAQ8u4IEWv+D2KtFlsSfCOGH5AgcrHj1iC5+8OTmZDK9fNgfV7/WF/GKhlNKlNmAbyr4k0o3zC9p4elqWcitrzSMFBIUpho0gLgm/SyzxFoOqE8P5NvQE+MyY61kHLw3CkMbb1zUl+QgJJAtE+sibnVUwvd/6d92dM0opl9rdZgCpo68MY+4mdTV+KHzl9noudvhdhN8iGkCzlTozQf+0owxy9RZY44aNgSgIiLEhllHKxJPuhJEnbeH+/55sed4HPa8LSLg6wdGPwBu6Ex1x/iqd1s4WHTigUe2IHG17DQ5EwZoJGt+UyKi/SVbAP2ev/WuQSc0lTxoYorbid2Hxk9ft0v6zKMeygNz46SSscts2BtDZQCJbM0qUcpJ5pbe/wUQjjAN2IicUNMBwAWEVvjwnjLMQ7QcB15fKlnlXjOTMkwCmqMhxU0p4/4qJwnotJ6c+4fTZInDzpcE12uGnVxHJiQsgkNfQnBpp8seQEG1/LsASSSSwh/PyrLVxSGVjeEjdZQEgya2Dghch6mcEtXuYbNx4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(18002099003)(38350700014)(56012099006)(12006099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gc832sSHsMnCHpAfHm/TYH4rJXYUJgDyd5CC63W9N8WEKsTqWdT+5zJsKrkI?=
 =?us-ascii?Q?pWUJnXaF2r9u6tvky1WaVswlQtxGwfNt4NbEGxUCJveduQpyUDGploJTS+iU?=
 =?us-ascii?Q?yP1bTFDGFY+w4i9f96Qb/5FPXd9Syz027SehQf8MLF79uoh/0LRVyU3KDMsN?=
 =?us-ascii?Q?ErBh96wTxe9anegOw+OcuzBnYk/MFZdJSGgSGzEV9zXS/ryPe3C5ZD/1Rojh?=
 =?us-ascii?Q?7rj8fOlAJ7Msok+sfNFlyVtu9Zm2CS8iQTsQbDFNkC7bNSghubUnx4zKslUm?=
 =?us-ascii?Q?EL6Pt1hTjUIm4Qy/27r+zaQEzM9UcLHrjZ9ElHctL7jtgAR7z4cevIXg84u0?=
 =?us-ascii?Q?BM/7/VFFys8urEVmzEnnsqhsPedzBlCSg67LNcRvPzJH1B+GPwg4foQ4eNYp?=
 =?us-ascii?Q?I6Ey+ietxPN3uzeIOxCAQjTm9JxZUbVpKhfwVW/d1bE8PRa2ZauBWMBwtW+7?=
 =?us-ascii?Q?EEiPT0pILfKYqR+2yw/YX0GuOh3DRaGq/cth0lQe2rgkwACRh9nXz5C9HomR?=
 =?us-ascii?Q?51e18JySYjsa8ZR86KbGnK4fKubuXnHOt9A7AicQU91c9jf+1fCeCDYxqeBa?=
 =?us-ascii?Q?4Q9h3rY1UV0lhHcP2n2wTg9Li6pqC2aCsb+VVKjLtsw4Bj8UelX4rqedJqnB?=
 =?us-ascii?Q?famT5lm5TbYs+yWbXeC0727RkUAElbVurzybac+yRo1i4fjFdKP08IDiNBcS?=
 =?us-ascii?Q?Ghc74KP/mXR4visNAkKSnc9tI5O1NI9frPQ+OFHJ4kAzbNkANgmN6wSWigGj?=
 =?us-ascii?Q?05JLq7NbVun9EkaujRYk6udQfjYjAj/ZQOo2eUzXQM6F9avIVov5q4A1MGBj?=
 =?us-ascii?Q?cP5isFQgIWF0MmNMFXCNTuoSq7emAji4Oj1PCjHRNGSLP+13ORTBN+CZ1R74?=
 =?us-ascii?Q?OHN636baOd+uD6JqR+8N+Nb4jjnDQbrrhsNCTVlO9NqXoC4ircyVNcf+tQ8l?=
 =?us-ascii?Q?wyFA2QbpCoIAPmraGMAgYCf84WUYzppB7GEl0m3p1lHlJzhNW8GzdHUm/25K?=
 =?us-ascii?Q?BCgjSCOfT52L1hmAEOE9lZl/vPqhxwFa3BRt8+4nVqwzi2nNPYCDMg+iVcRi?=
 =?us-ascii?Q?7CQZWeXbG8BNm6lwVLBr2Tefhff4YGgj1gDx3q0txeEf54AcdAnWu3EGsFV3?=
 =?us-ascii?Q?A3/xKx5G+j6h63RRw3/cUTeSpzB2gfIZddvY8UG6/skzzAtiuY/xUcmIu0JT?=
 =?us-ascii?Q?T1a5YUufWEtvSBKM8kutKe1FbGsguAUlbpLNEvzv13LOfqJ0NT9EkbyxfLq1?=
 =?us-ascii?Q?BY+dpYUAn/EhljRPm2nMMIxADBqTm4RRc/HLldEWoRhC51D6SkavRwIXGpKH?=
 =?us-ascii?Q?UJ2sYMZPWbDEJi4l1t9H18k2mSislfK92XYtO3DR9lyYgSLfvt8Yd2VYnVcI?=
 =?us-ascii?Q?Ic2e9ZSVykYes58DWozpJiSYnSn/BB7cE9QWkMzhPDMnSWewN/g/ZYK2OG7Q?=
 =?us-ascii?Q?TXBmwMK9LgpXPhfIaYqYrYOAz+zv697dt73ApnMG8DjJBqc8I53qgR1eBPQP?=
 =?us-ascii?Q?vhj4hpVy4CWtP9YpyX3sdKsOaT2RWz+n0K2exfeAk0RoBameF+OBHPyiT0S6?=
 =?us-ascii?Q?YgihtjY/af8ZyOaJ0Pymf5AOplojfZoGz5EgbS0jRUQT9M0kFlEj04xZib0F?=
 =?us-ascii?Q?cxn8ihIj1O57jgthqiPrI3I//BDD6nvbkD/OaMO6K4iQbnQdNb/Eg7ho5OBs?=
 =?us-ascii?Q?xdFU7iUKj9buEkQ9+1QqJaASlgmyVS6AEQxby1IRmnpirwr72qOlHif5AOnc?=
 =?us-ascii?Q?3BIDLDXIjyO0yE1c4FYGdt5/MZXuuVc=3D?=
X-Exchange-RoutingPolicyChecked: 
	TCyBxRlMGO9hFPK/ZI2mYDkndT7LYlpr4XoyJdl/YAlbavdGXUQIkKjRTNS8y45l9Cc/V7V2wB+lqPQ3y28+uLiLEo8rnj+39z1BmWlQcw+wWjFnqib8hTueI4q9qRRDbxvPtItlDoG8QaCz5jjhAvjy9VxmK32x1S8pQ9TGnDzfSGECZilSGrSB5N0vw8zlGUCariV5U3vK9+slvNMkmCiKxB3rMARKJKAOsosoelrHmgEp03iIg8nypFeKpzJK1LxSdlet22lRwMG10nuRd35oLKwBxcKd0A7x5oeAhV1R5hZvOat9rpORfo1GIoGr3E1IMXnMw2Jt9PY4ytUS1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7bbffc-db4f-4b08-c5dd-08decb5006b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:36:10.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfeQFsnl81gVwpd0Knj0paK0CpIa39ZoL1gwyGKmj9gLFRQWxkXCdrITkY/NdIC3WWFR+pPuWcYrC0TfPu4dqEMHyZHb/9SZyiS36Q0860w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7744
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a30b69d cx=c_pps
 a=UPJ12yLMGL5ZZCNrBMA7tw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=Q7LFDE9GamHE2BZ3A4wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAyMyBTYWx0ZWRfXz86rw2+2Jwyu
 rCCOTq/kVg4Q1YktCRjjUqEDWT0BKNemK/8C0HI4VP6RcOlIXBXT/DLJOYWx27ogfP7JC1fTq8D
 beKizvlMU4b7eeCkAZK4QBBwSaP+OfU+EdcV+gWnBs2paa6fcPd1HzRIt+CDPOQfSvu3gFG2vaS
 VYc/aXa2j1VR4e1a4NyAXaG4UxaiqHduKw21/zMpBYFAsN6wlExJANdQGYntpgYY9fMQ2ZphIY+
 g8J7eiOE7oxNNBIHeI4hYonWyNbZw98FSX4ASjqu2IDckU8wGpWET5Uq9XPkCQjHffXoOSqkhU0
 MXAZmHEpVSCLB/U1qudHVrtZkLv+oKdMZFcggmj/ArXNDmVJ/frP+1q7IjaFYebQCLZ17mW764V
 ezqbDUGDxA7p/yBFgNbyM9dBPl2Zps7GREyFrYqg+T/DdYvv1R0fN2V8btZebHiqe3EAxasvIBE
 nZE8YZp/9To5OgviYZQ==
X-Proofpoint-ORIG-GUID: TSq2K_rTWRU8w86NaS1IWfZlEUtL6w39
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAyMyBTYWx0ZWRfX6uEAN1MElrZ6
 V40Nub2Jc4SyoFAJgqQl7hVIQvTnZ2Z2XDTSn0LOy6OWWrl8FK/UeuTjoi2AbI8O87Qjie2Vl5Q
 M9+NPyUqqb2/3epPc4pVRrDBVdDNqAHhnzmmaTjoxtGXUSXAKYZV
X-Proofpoint-GUID: TSq2K_rTWRU8w86NaS1IWfZlEUtL6w39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 02:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238862

These ptests include a subset of upstream
tests that provide functional coverage of core libcap and libpsx
behavior across target systems.

This approach is preferred instead of using libcap's quicktest.sh
script because the later assumes the upstream build-tree layout and
has too many dependencies not available after installation.
Quicktest exercises a wide range of kernel capability features and
environment-specific functionality that is too comprehensive for ptests.

The ptests include the following from libcap/tests:
uns_test, psx_test, libcap_launch_test, exploit and
noexploit. cap_test from libcap/libcap is also included.

These provide coverage for capability manipulation, libpsx
integration, launch handling, and basic security validation.

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---

changes in v2:

- Removed libcap_psx_test from ptests
- Added bash when installing ptests
  
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libcap/files/run-ptest   | 25 +++++++++++
 meta/recipes-support/libcap/libcap_2.78.bb    | 44 ++++++++++++++++++-
 3 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3f42f908a..1254a9e204 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -31,6 +31,7 @@ PTESTS_FAST = "\
     libarchive \
     libassuan \
     libatomic-ops \
+    libcap \
     libcheck \
     libconfig \
     libconvert-asn1-perl \
diff --git a/meta/recipes-support/libcap/files/run-ptest b/meta/recipes-support/libcap/files/run-ptest
new file mode 100644
index 0000000000..2d7b656fd3
--- /dev/null
+++ b/meta/recipes-support/libcap/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+EXPECT_FAIL=1
+EXPECT_PASS=0
+
+cd tests  
+
+for t in uns_test psx_test libcap_launch_test cap_test exploit noexploit; do
+        output=$("./$t" 2>&1 )
+        status=$?
+
+        expected="$EXPECT_PASS"
+
+        if [ $t = 'exploit' ]; then
+                expected="$EXPECT_FAIL"
+        fi
+
+        if [ "$status" -eq "$expected" ]; then
+                echo "PASS: $t"
+        else
+                echo "FAIL: $t"
+                echo "$output"
+        fi
+done
+
diff --git a/meta/recipes-support/libcap/libcap_2.78.bb b/meta/recipes-support/libcap/libcap_2.78.bb
index 782ad02665..85cd8004f1 100644
--- a/meta/recipes-support/libcap/libcap_2.78.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -11,16 +11,20 @@ LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
                     "
 
 DEPENDS = "hostperl-runtime-native gperf-native"
+RDEPENDS:${PN}-ptest += "bash"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
+SRC_URI:append = " \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] = "0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-inherit lib_package
+inherit lib_package ptest
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
@@ -62,6 +66,44 @@ do_install:append() {
 	fi
 }
 
+LIBCAP_PTEST_TESTS = " \
+  uns_test \
+  psx_test \
+  libcap_psx_test \
+  noop \
+  libcap_launch_test \
+  exploit \
+  noexploit \
+"
+ 
+do_compile_ptest() {
+        oe_runmake -C tests ${LIBCAP_PTEST_TESTS} \
+                AR="${AR}" \
+                CC="${CC}" \
+                RANLIB="${RANLIB}" \
+                OBJCOPY="${OBJCOPY}" 
+        oe_runmake -C libcap cap_test \
+                AR="${AR}" \
+                CC="${CC}" \
+                RANLIB="${RANLIB}" \
+                OBJCOPY="${OBJCOPY}"
+        oe_runmake -C progs tcapsh-static \
+                AR="${AR}" \
+                RANLIB="${RANLIB}" \
+                OBJCOPY="${OBJCOPY}" \
+                CC="${CC}"
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/progs
+
+	for f in ${LIBCAP_PTEST_TESTS}; do
+		install -m 0755 ${B}/tests/${f} ${D}${PTEST_PATH}/tests
+	done
+	install -m 0755 ${B}/libcap/cap_test ${D}${PTEST_PATH}/tests
+	install -m 0755 ${B}/progs/tcapsh-static ${D}${PTEST_PATH}/progs
+}
+
 # pam files
 FILES:${PN} += "${base_libdir}/security/*.so"
 
-- 
2.49.0


