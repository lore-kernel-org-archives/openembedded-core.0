Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD85C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:42:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18133.1752658928860236486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9292e0fab0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G5UcLB1432253
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:42:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxhpga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:42:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maoDouqoy82v4zT4Qx+yIAyQrgT712Rc0t8NzvHEbAY0kzKbjglyyUDdVzifF0FToBU6OTtFysdpiylaQ/ZPbTWmmsEqa1IFSCuvrt0CGVgEF5obn/10ByaO/8wsKJLIFhCicTwTQVAN4I/pYHx7TgRdE0JWExaGZNaCo459IMFm0Hc3zg4xsUFAyzkH/TTLMREWF0OULlyg1oIecpCmzdIJKs/8qZYVo4niLUvRBAajRvvSq0eINSzRQgteaT9e4pLKKKx+4HS6wQe5PlWY8SjzZoLuNsKqB3ZdlP4NShkw9pDtAoZuAEm44d5+ce5P79g/g3n5Y2Y/N2D6R5ShiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIRKTRJ82O0jammh/02MyawDq+f88u246Eu8rEox8+c=;
 b=p4hSHqyGotHvTSV269XkECXvQv4eSUcazw2U4HR0l9Rw4VtJApi5E7kx9BkAvDtZLblYipu4t6k3XumVNTOPG2nPilKffWFJdkxoUcixVGIuSv/d6rlVrDUs3FvaXte9H2Vidi586wBhYgmtn3OF3FTgrcCeJ3hWKD0c+HEDKjLu5ArNmm01/rNfRinciC+zOd5OU8MGuueBi6JRLE4xIFy9Gg+nw1Lsn+zrGVtwvd6VaJ8o+EPQoRNNgt5r/z8TEqJfGTkDKIw563BmiQi42TmWUsFurbb4+g05uyFVdJQRk7fBcHcO9+aYJyINSRiaqclgq764ITThwwyhgSurnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 16 Jul
 2025 09:42:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 09:42:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH 1/2] binutils: Fix CVE-2025-5245
Date: Wed, 16 Jul 2025 02:41:52 -0700
Message-ID: <20250716094153.1698390-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 979ebf7f-735e-42ed-813c-08ddc44d0620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PzrAP1iclM9HIe8Nq8/OEuaEAe8zxLE90e250ICTREPkcp6LO4cRn6RIjq7G?=
 =?us-ascii?Q?Rfkjkp7yliKX9fHlpfHUJFrrSSqQCJMDRS7gw0cZ0g5ud6KOSHbAU4KlsdN3?=
 =?us-ascii?Q?vi6YD5MELHPKxkaoUd3WmHnnjAoyLHsIqsEXS3ZRdfk+gxpOXaRNVQDBF42z?=
 =?us-ascii?Q?tnAhpRP4LyWBm8VsN8x+YjRCvHfSQiEDxMX3KU+GP8BQxQhRD1VkI0e5K6GT?=
 =?us-ascii?Q?oGjypGEdqGTuxSwXwnPThteTxQWtgFm4/oW0p6c/dScjqKBGCnkaBkWBlXOL?=
 =?us-ascii?Q?i+c8AUtEU/2XqXw5KrZkf9AqR7OqinWV4rWqg1PuPN4jhlVy5wAxT1MpbYe3?=
 =?us-ascii?Q?DhH8adXB07fmxVJm2K8/h0ynNHes+34ToAhq7u3RZDveoI20hxhsis2JX3jJ?=
 =?us-ascii?Q?wpGvAOXSZpEmH/WlBAhWvEId2YNDSn4VLcSj39ZNJil0VVB2zBb1E1WyyNhb?=
 =?us-ascii?Q?U+FXiZgVkFwwCsbwCNvBzTc3GxleShUFThIutOmpb+m+Evi/9KtUbeecMM87?=
 =?us-ascii?Q?BJoOU875iuTnws+zLDo0ZpcFuJoEQi13dSB2ucwgNL+Qg9ghu8X6ADOial73?=
 =?us-ascii?Q?rxkrzQDmUz89wJGCzwrGSLpzR61xSgQ5/c9r1lBaQ+B4cEqY0ceqeBcgwEPQ?=
 =?us-ascii?Q?jV/JlpZirE2OnETnz71CScDK3n8QpwxcGlJFky4T04qD8DPOrS2+iyy53WTn?=
 =?us-ascii?Q?RoJg0CJ/Ri2y6QV0v8lz+P2J1kiHF8PURBGjQOdYyNQGXLZ2jzmCOFj7Cx8+?=
 =?us-ascii?Q?BLDwOOGKFmi/9czdN4aQ0Ys4dNR5Ahfi0Ntcp6TsAZRa09Lt55uWUtw0kXtA?=
 =?us-ascii?Q?0i6tUDAVvxNL/v0D25BlWv8XaZFS28sGqLjXHKiuwvEptLTyKxUw+0kdk2yy?=
 =?us-ascii?Q?BNeFvlmyXUr5b76av6kWEOobyFA20aLzStnuezWr7GcuHn0L/sT6fyZQUV8o?=
 =?us-ascii?Q?QGHH+k6civ8qjNF0fIQwthTjPCjlxZfNEJlqiOfwajd5CkYokQfUwSW8dFeu?=
 =?us-ascii?Q?OBKSiZZGxNqIT4U5Spvcl5TKhfYhqlJ2VnnnaL+vwiWMVT/TYeZLiNswn2/O?=
 =?us-ascii?Q?6uWtBqjjgUeNJrcRkJCakVfvQG04JVp/nofbzYpTf86uaxukz5AldvaoptKz?=
 =?us-ascii?Q?rOifO41+gb6qwgKvWG1hETDIPiFr4GE2GHBJyENlc0/q2vQgu9Rom4c5NF5o?=
 =?us-ascii?Q?LScdvEZxGY311HjrGvrSgcvJBVErgSdV0ezkL0oe1BtrLcwiUI4hMtRz0fEz?=
 =?us-ascii?Q?C1sW0D1VVkknP5iTFMVW524DZ2uI4n5NW7SYfWLi9alRHHFACNmB2geGAvDy?=
 =?us-ascii?Q?jsHglQMY3jahNkJ2GzwhSPP0DVPrqYx7g2LFsDKHgrQX10Ze67XzCZxhGyZz?=
 =?us-ascii?Q?YSn15G6nu4Xc06mSQ+0ga1md68/p4hXzZ3eAgO5Kwpzk3oXY3tVZ1DEWT+Lf?=
 =?us-ascii?Q?dFidgbgqdXzn52mRWrMcX4AiX1RGJglx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/yNH2qB9DfV4bItlpi40ub1hbDfIPQNgNu4sBhzG/pTJPbu4b7t6dgehZ1wL?=
 =?us-ascii?Q?BQfim3hOkxIsz1RQ6r0OiBA1T6EQvxhgJkw1r62cHWO4OX0PiuX0ETYhNyVY?=
 =?us-ascii?Q?oFfjRqcZJj2JHG7oPajRl+HUTnYpGBmF5qk4pIUnNq0qtWOsqgCVvcFLWcke?=
 =?us-ascii?Q?XTt/1T+K0ltbUCoC2P3ZOcVbKsFq7rFxQRce6wDLt/3FCkE+9y6Pn11FRSTs?=
 =?us-ascii?Q?rxK9HQWjs1YwJrgS7LQnFdQU6/mU7mWEqJnhaTZSoO00jBcZKngJrDnsGt0h?=
 =?us-ascii?Q?XfqBT7S5R9v8oVlUboGxIIGVPZxLp6VC7PcWLeHIa69Zlx7eBi5ExdoJIfZQ?=
 =?us-ascii?Q?SQKO0UaOtWqmk+Q9TnVO+9BLv5AgvC6a1XCyvUgKlsjILEGTqKXPO0mfYWfO?=
 =?us-ascii?Q?niGN68adkZwXDFNZzeYkiS8EVu2+noffBMUYQwYIt1yc7cf+1rNftXyF8m9O?=
 =?us-ascii?Q?37h2Zlh2JS108U4TKtlqm8ahEpgZ2nDlsdufU71f0ZOkNIZxVYB/UABZ9CoK?=
 =?us-ascii?Q?e6HAtw5YavKcLgStZHzeNhiLQapg3i4hqiLSwQMDQhoHTSrfmCY+tIvcfIAW?=
 =?us-ascii?Q?4Nu4eAIo0nve9YUnGeESJJILT47BBNAxmSwaD/grX1LbGke2KetkY/nuTSBx?=
 =?us-ascii?Q?khvPNKLXxIi5oCSX1TUbPs/fm4WBwwEsKr8Q97JpgjxCwSOb2SDbFkHaIQQi?=
 =?us-ascii?Q?jU0ByuvBg8HiDbVp/5QSjAV2ikFWDansClkp8rMSzYnkVbOaERYHHaNXT4HY?=
 =?us-ascii?Q?4zC4ktEmRzZ/sJ+SQL22S1lD+hFkVTLRw5j2qmGBuN6HSGsyHymSpyL8NO8Z?=
 =?us-ascii?Q?AEcl9j9B5w7TwXTWeCtQVeGRp5vNat4r6tVypQ0La/j4SxRhzcSbeGVgz6rI?=
 =?us-ascii?Q?JsHBAzzyrhC4xcxDIIjpQdEkboayTCzjSrycg5/6ckXU3eG7/1PamZPd2h+2?=
 =?us-ascii?Q?QS4XdYKKI6I0fQZiQssJPuZ6CkTJnDthk5lGR2HLle1ovUeO2YUzhY5E4SOQ?=
 =?us-ascii?Q?xLc4OlJNX+2b2oNE5AzNyPkLDpQhs+nOOPAhTK4vDkSvkbvONTwrUIbXrKzm?=
 =?us-ascii?Q?OoukP30mEmX/BhWUnEJElUIlGd2BwDuFHgtriUz8z+GroYrZMzryLMApOrQw?=
 =?us-ascii?Q?NekSIMYOsZpkC8VZprklV7wckgcjPo8c/T/h5bM7IZmmJJgFT/UkCK4mFuoZ?=
 =?us-ascii?Q?yaiWdDl99YsLpRvPyJCyMaPgRvAdL/I503LBN9WYaMLooE4kKCKywHXjjGYF?=
 =?us-ascii?Q?1iQAnnZdcsrSmoLHXzQNT/pR3KYMUyaJJw0umr18uqKRr3Oe0byH39Mmw1Gz?=
 =?us-ascii?Q?1CueXSLItqOwipcQtooOYwhe47UowoEmGruH+9ZqvcvhjH57pevAfTImvGrU?=
 =?us-ascii?Q?2XOK4DlewdHKYqqTrR/oxPZag7x/UqGRxHI08agq/KesBoSvxMLlPHOaaypd?=
 =?us-ascii?Q?1AP6eF9+IeDtpgTfugdx8/rzWjXC/2xIYRBhlVBqJiTIyzS11RaHpvMtu3cr?=
 =?us-ascii?Q?ocyOjlzb6Ak53kV8DhG8pDulhmLdNL3mV/PUGDXksr61wihZnstI4lGdeG9d?=
 =?us-ascii?Q?tYkJyEIBkvzCCcomGyJFNBlCVtITobjo7R6GNkVjIvaw9KkF2TMMerUraxNT?=
 =?us-ascii?Q?mTURx1eN+8uWsdrLiGAvrVs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979ebf7f-735e-42ed-813c-08ddc44d0620
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 09:42:05.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzBoAzPCTQ6H64FJ88pHwaU8XKj02WwhtwOtPxR/PVyVEYxuegvv1hJGQTF+ziQICXFhHlMH4eQIYNQ+ehPpquo1uT9CmF6uDyguseFzV121RyghaEfL3tKg/LkEaD0p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
X-Proofpoint-ORIG-GUID: 4Z6tcPaAqL48CKCQQUUi9MV-oysdQ2eb
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=687773ef cx=c_pps
 a=HM8KeKQHP11Uti6iLAcMXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G7adr3sDebAgiyP3PKIA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4Z6tcPaAqL48CKCQQUUi9MV-oysdQ2eb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfXzwwa504UWnQL
 KncNGitkBzuk/YR99SrOSlnWcdJdFpHvnY3XKlstSwVoFUNmuhUN2zUFi8/KvsAUbB9kTq3Pqpm
 c9gSBBE1dQQsDqeU6N/thBY0cQiiUnWRVfEN3om91lXk+gR3VuZWLXp8xt3S+zc/FFAgds1QOZz
 kg4AvE+B0f6+uS6rhIEMmE9yRql/1VGW/dAg3WjvBdI+TiNU3P6u7hzxoT4OGR3JlVPdbAO7Mq5
 YOYP/WWYFG/u7atbGdgnLcVZDSnnJSyyjD1XdAl1R5mm5/lVJGl2yK+KSNIN8j9cZ4KH0WF0AJx
 Kz7ZrRxN6y0qBl72eKo+aamBV+qWTOUmglmsr+n0gqb1t7WoOFCCLq3VN2OJGAG2auRacS1nG4N
 t7lWLr8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220441

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Backport a patch from upstream to fix CVE-2025-5245
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0018-CVE-2025-5245.patch         | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index e5df62b14e..a37f0bd27a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -42,5 +42,6 @@ SRC_URI = "\
      file://0017-CVE-2025-1181-2.patch \
      file://0016-CVE-2025-5244.patch \
      file://0016-CVE-2025-3198.patch \
+     file://0018-CVE-2025-5245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
new file mode 100644
index 0000000000..d4b7d55966
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
@@ -0,0 +1,38 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 1 Apr 2025 22:36:54 +1030
+
+PR32829, SEGV on objdump function debug_type_samep
+u.kenum is always non-NULL, see debug_make_enum_type.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
+CVE: CVE-2025-5245
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/debug.c b/binutils/debug.c
+index dcc8ccde..465b18e7 100644
+--- a/binutils/debug.c
++++ b/binutils/debug.c
+@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
+     case DEBUG_KIND_UNION_CLASS:
+       return debug_write_class_type (info, fns, fhandle, type, tag);
+     case DEBUG_KIND_ENUM:
+-      if (type->u.kenum == NULL)
+-	return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
+-				  (bfd_signed_vma *) NULL);
+       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
+ 				type->u.kenum->values);
+     case DEBUG_KIND_POINTER:
+@@ -3097,9 +3094,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
+       break;
+ 
+     case DEBUG_KIND_ENUM:
+-      if (t1->u.kenum == NULL)
+-	ret = t2->u.kenum == NULL;
+-      else if (t2->u.kenum == NULL)
++      if (t1->u.kenum->names == NULL)
++	ret = t2->u.kenum->names == NULL;
++      else if (t2->u.kenum->names == NULL)
+ 	ret = false;
+       else
+ 	{
-- 
2.49.0


