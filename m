Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06422C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 13:09:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13809.1741957744114091354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 06:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51682306ed=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBHvF3018659
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 13:09:03 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bxxp9d6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 13:09:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmxFA+cqdjGwWEMUalQ6D9fpsrlvwjB3nKHzaVWFw7/Z2TcrkfDW1E7uJkmXlYjpC2bwMw5j8VeTkvu18y0gQJ2wZ+lpBwakFO0iOiaYm2MzU15gNanem7RofzVmQ+U3lDMNkfd4ExXt+jy0ss4kiFH5NjEmTsJwhPwJ0jGoeDbzS4hBjgELm+Ymo1ViGDjC53yzmYGQlcQoz2n6QyYAmSaBF/Sg+ZVDkJour2Ao2p2Lxs5rrybheJAFKL7TqsOZi5HPDWmzmi9fKXF+2jUy8BpSSMJVRV6XZqjpoNenR02sMfGkYp8a9NQxgUX9M9+vvXrwuRciqLEmtRZ4TjXBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJDh9pnu8Uygm5q+x7+S5O1yW9p9j2XblvKsfXWjeAY=;
 b=r6GDX32nxptXl9cRuSuPyYUOWP49qGHsktMVoxJwLt5fqBMlx+SV1GC50b8+/X3+xqIkZhxPG9EPtrR8yPC0U4iYN+OrPCHCVjiH771R1uEJiEL5iX231lF6mYjgyqqsx9i0E+Fv3xvGXdtQZ+ZY2jlTc2LnHkYUc18rPMxoSAUgcOcssoq0Ui+cX3UJ89fokNv89bW5hnonFnrVrgnVcRseTnE6T6y9gilcc7hxZ2zxBoaWnsoTmapm1CNQeMTpBSkNxCbdbg7NcBULb/T6i+6Onjw9PR7qzVgL6Yf0v3Z+Eldv7FH9UhpMHB+WWEZn+PmLM4VR1fFvnkY/vQ/IOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:09:00 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:09:00 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v6 1/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Fri, 14 Mar 2025 21:08:40 +0800
Message-Id: <20250314130840.84700-2-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314130840.84700-1-bin.lan.cn@windriver.com>
References: <20250314130840.84700-1-bin.lan.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SJ0PR11MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d28f15b-8a6f-4be1-1292-08dd62f962a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oHgEStRxU46qQKJGHISS3epyqsbzUtXez/D7Piwpmd+tEkQwMwz0DVw2Prom?=
 =?us-ascii?Q?0c5x9R7u0xqBRXk2gTy9vouR+Qp1oVr8xv+hG9CsGEW8VRDxU8TR8pw9q7Ih?=
 =?us-ascii?Q?k5fac2Ic4+WFSwhv5SsuAyL6XjmE07kEe4tWsyqaS7EU5ZwV5i3RJfz0VhN1?=
 =?us-ascii?Q?6KYYb52Rnv4IAlNsBeXCtu57cYzZJBFd8ph6n04+Zgrw1ufXX/fgUcLSWFX5?=
 =?us-ascii?Q?4guGZS3i9/+qt6JJk1wwr+O9BdsIjjHzwa8vgV+McEboOgF2jWL1W4LeBt0H?=
 =?us-ascii?Q?+TwkH6/ZunZbYM0H/6GkRFlK068zpVzqZWJixfAyuto5NwG94bNvdbPNtzPE?=
 =?us-ascii?Q?PUGWQg2QzR0ElM7GF/MGOppSk7sI4q9eK9ofUeH/V0kEyRKJMM/aHKX4nSOE?=
 =?us-ascii?Q?R0H/hF/MnawvwpH2W1m7tD9rmFZEL+LjQoVJpCdFKhW3NkWTBxC9SjZPcm/I?=
 =?us-ascii?Q?2ON6ov9fRSMfr9z/ndeN/VtYVNCc7e5+lSDMaeKlN8bHaIZHmdJ6xhTZ/C+P?=
 =?us-ascii?Q?0VQ8+L+USRmMDio7g2bzwRzdf7AsdPpNpP3l8fsclqXlYdozdz49IzjgLym4?=
 =?us-ascii?Q?6P31M8rZAw3z/lP3uU2Dyezkyc87Yn0XoaCFeye7mwfs2mwyRZ790OWbrBup?=
 =?us-ascii?Q?TlpdLO3LxKZF7F3UXaIZSCvggKqkLvU6hw+10UzvVFSIa3jAH986qxzxM31f?=
 =?us-ascii?Q?5I6F53gCMPCCQmc0y4yeHMHCmjqIhA9y/y5wQS90ESIKrRtxc0Zhyg365xbO?=
 =?us-ascii?Q?dtdCaHRlYBe0F50siB50F9/BN1ODolIaQlUWUTbxDgKITguDuW9WobeNO4oM?=
 =?us-ascii?Q?l1Mu9OF7SNPivJWF019VUoVdMIrAFa4vkJl5Vovj+EoNhf7RH1L7aBmwJvIe?=
 =?us-ascii?Q?zwWHWCAlpSo/We/h2vMN9/Z0BfEdklSvRKgwvWWOQDy65vx3w9U0HNVyUXnZ?=
 =?us-ascii?Q?sKyUQalwPbB6p1CSKIJRQM9A1BVA24nCs0Z8uKhlQWP5ePvQtSsOwYaAzhqH?=
 =?us-ascii?Q?fK5xRCGVFCnTCgNvWY5Dy93kHAO2EhP0eNNoSOl5NjBC6y4VWoMMNhqPBDGm?=
 =?us-ascii?Q?F93knxdGkNkevKaev/ZqDphIJ1cj27r7BqoQ+PB6QgoZVQtbO9jYarhnb5fL?=
 =?us-ascii?Q?rNEFUvAk5C4k8+q1NyLn4PqLN3MXeiRG+xoP1LOe5yLjiIFs8eidwa872W5G?=
 =?us-ascii?Q?UCO+pDfZM9tWn5gj6EFKqK4UznZaYllQBeYPWqLHFNkic24Bo6Q/MbKn7OYQ?=
 =?us-ascii?Q?Sxap6DCt8fnDEOZKS5fCoPvr5a4i284rQLA3vWRSb1D9LRsOEz5gnwvjD3bB?=
 =?us-ascii?Q?f30s1ZFD7RapmQ+PPWQBc1HjjZpPnjL5q3DikFRZywIiQELzSHdKpoPEapQ/?=
 =?us-ascii?Q?twDFuAmnnthNm3Rcwab9k4VCRihnDxiAB5CmJlDKKGLnLXUdvQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vrs1iNXTXR4dBobaSr67yRfcTN81Bxssp56HD+984AKJCFvud6m6jRr6lUvk?=
 =?us-ascii?Q?zShwEg4Dm0Ogvc3f95AOBRPwSciNaqvy6xG9uGmcWpXMUT7zpnHXzBO7/apw?=
 =?us-ascii?Q?dSGZ/i5OLi4fIy/jQBo6d9lajLpFO9BQOBNPHprsZxWxWbo073eTzzsGDJ9j?=
 =?us-ascii?Q?t1TkPFDBbzUmyfRuvigJkzE9w7pFUM5KYoDOhZMBVMur1d9AlOZ/Z46PUBPB?=
 =?us-ascii?Q?cnA+IkrZHCrSeRJErvMjD3hKgS58RQc7RYSLXzc2y4k3G1fQ/9aRmaRlhf+Z?=
 =?us-ascii?Q?uxKUbIpIuGTuKvmCMRNmKNaU20tSEWdPgKTEIqrNeY21bR576fpCCECiqM7D?=
 =?us-ascii?Q?yKmpZi3bUmxtoh1SiWzPgiy4sMlC4nRdqoxw5phxRZt5ky0Yse4u8BW0eC9K?=
 =?us-ascii?Q?YJ6+PtJaT48dLTu9X41MTQibk3C8aCTykUtjmic1zdHcky+EnG21Bb4Koiam?=
 =?us-ascii?Q?KYxjJgSupUzeN/1AfEUG88964S77wf8l+81kZWKKYYVPFWrMpZ/mqGoSJtui?=
 =?us-ascii?Q?HAlal3iZfkmlTCZErAWqukRa73j96eiCQMky1JwKUYAI0rwbn//9eQEU8dF6?=
 =?us-ascii?Q?NKwnnm9GL+eyjo2wba5r/OUkOEWdp5T90b6RnhOAX+64beNmAjVbl7CRSFrh?=
 =?us-ascii?Q?M1bwzr61eQemyHflrDvnW1qo+woOQ//u7V5vrJd8nuEDRkttKraOLM9feXp2?=
 =?us-ascii?Q?cmgLZFp1ZqtiLx1aUbKa3kLYHuHlCVaPTNPorfJSs/XI8/n16Lj9aNeSQ3UL?=
 =?us-ascii?Q?ro7mq7T7JILbP/nrQsKjCbaJr8tPG2KrGTRWzmUh+n+assrtJWA9Z3p7WdYx?=
 =?us-ascii?Q?3nYpWZjApXxrZWboPqTSz0EmcVSdmqtqKCjNh9erqgnuEw51DhtvppPHMY6t?=
 =?us-ascii?Q?EhEWb1n/ebpbv4IdEzeIVCPcZtSMdNg71n6cofFvGbJpt5M737ztsc5htxt1?=
 =?us-ascii?Q?H+CE+wlspUO56yQ8E8lb9i0C2H/py5jKsW7i6tCWVCDMEXajNs7YjeS3Ug1j?=
 =?us-ascii?Q?jzoj1KJvGrUeWr0iwR+7iadt1lsJl7SjI63UxAO4frvT3gBzRwfBXw8A+5jr?=
 =?us-ascii?Q?CgCjFa4JoH0q0G04SvVfhDBCZtcApIMVcZDtXw38SnpSycEb78xRq2zj2wZw?=
 =?us-ascii?Q?2ouw0LRF/aIkjSyViEGCc2AO0jBXI5TSNau/PPKVVzfhFqjQW5TLAbWuNtYl?=
 =?us-ascii?Q?55xrhORuj3G4Gx15MtqjIcnK7+vCU3FxWJmFJruweUhOp9VJ+ULroDCzCpV7?=
 =?us-ascii?Q?+dAm4W7+NoxhE4DgMGtK5zCvJq5oXAMr/2sqVMxUxsradmvg8mBuTDf+dGTe?=
 =?us-ascii?Q?0KUQbFo1L4eZaNgXbspe6OljMiaqWz8yclyH64jmoBAS/YXk89HllN1L+1y3?=
 =?us-ascii?Q?R8oJMVWL5RgenTAptTF2MCdMEHt7Pf1lW32syUArPuOq//9uwDO36WPaGgVs?=
 =?us-ascii?Q?p+XL866T1ikzXuRrJyxfgwkScLGvq0wcFRO/JlzZ5NyYaL0PRLEDirJLZusM?=
 =?us-ascii?Q?gCHC4vfcorCouxJCXHf0FqwPzb/WPNcV0TrYoILiiE+ut+tG5TOQot4wH7Uq?=
 =?us-ascii?Q?dJk5jYi5KFP09bXpQWxe/O6R28s9gYN4KFPAVL0Xo/WlsmLKzLQjyDORrG1n?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d28f15b-8a6f-4be1-1292-08dd62f962a7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 13:09:00.2153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhceroWqlD0YvRl6Tl4BHG/bZnv9BJy4Z2xqO0pYhDBFKqEnn7nnlHzWLPHNhofM0J/3sracEyWIL/C0KzjjdpQzi4MR/VEpmHTlgpBiLyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
X-Proofpoint-ORIG-GUID: 374yXZlG0Uo9vOatRyNU_nXlpN-_avEn
X-Authority-Analysis: v=2.4 cv=C+PpyRP+ c=1 sm=1 tr=0 ts=67d42a6f cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=pGLkceISAAAA:8 a=7d_E57ReAAAA:8 a=XIzVovBty1zWdf5VwuEA:9 a=_PE9Q_0Z8bzuyU0-:21 a=BBahhS0D0WQA:10 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-GUID: 374yXZlG0Uo9vOatRyNU_nXlpN-_avEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 13:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212843

From: Bin Lan <bin.lan.cn@windriver.com>

Refresh 0001-Make-manpages-multilib-identical.patch with
correct number and upstream status. Create a new patch
0001-tests-fix-test-applications-in-cpp-common.patch
to fix test applications in cpp-common are needed to re-build when
running in an embedded environment.
0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
for the commit log is not very accurate and the line number is changed,
is replaced by 0001-tests-set-the-correct-plugin-directory.patch.
Use 0001-tests-set-the-correct-plugin-directory.patch to set the
correct directory of plugin shared library.

Copy the trace files (*.ref) the metadata files (*.mctf) and json files
which are required by test cases from source directory in
babeltrace2_2.1.0.bb. Add character set conversion (gconv) for UTF-16/32
encoding for test cases. Set the correct test environment variables in
tests/utils/env.sh when running in an embedded environment. Remove
"GREP=grep SED=sed PYTHON=python3" from the file run-ptest for these
test environment variables are set in tests/utils/env.sh.

License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.0 PSF-2.0
Babeltrace 2.1.0 is a major change. Babeltrace 2.1.0 is released after five years
of development after the release of Babeltrace 2.0.0. The licenses did change
significantly.

Changelog:
Babeltrace 2.1, MIP 1 is available and adds many functions
to support CTF 2 features.
The Python bindings wrap all the library changes in the same
systematic way as in Babeltrace 2.0. Add type hints to the
public API to assist with static analysis of your applications.

Details about the 2.1.0 release:
https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 ...001-Make-manpages-multilib-identical.patch |  12 +-
 ...not-run-test-applications-from-.libs.patch |  28 ----
 ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
 ...sts-set-the-correct-plugin-directory.patch |  30 ++++
 .../lttng/babeltrace2/run-ptest               |   4 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} |  38 +++++-
 6 files changed, 200 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (66%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index 2401b176e6..c2b76b1ed5 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -3,17 +3,20 @@ From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Mon, 9 Mar 2020 21:10:35 +0000
 Subject: [PATCH] Make manpages multilib identical
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.lttng.org/c/babeltrace/+/14222]
+
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
 ---
  doc/man/asciidoc-attrs.conf.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
-index ad1183f1..e11c7031 100644
+index 88fb13ce2..27858b720 100644
 --- a/doc/man/asciidoc-attrs.conf.in
 +++ b/doc/man/asciidoc-attrs.conf.in
-@@ -1,7 +1,7 @@
+@@ -4,8 +4,8 @@
+
  [attributes]
  # default values
 -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
@@ -24,5 +27,4 @@ index ad1183f1..e11c7031 100644
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
 -- 
-2.24.1
-
+2.34.1
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
deleted file mode 100644
index 805dde8064..0000000000
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
-Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
-From: Anders Wallin <wallinux@gmail.com>
-Date: Thu, 5 Mar 2020 11:20:04 +0100
-Subject: [PATCH] tests: do not run test applications from .libs
-
-Cross compile specific change
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Anders Wallin <wallinux@gmail.com>
----
- tests/lib/test_plugin | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
-index 652c90cc..1f817c50 100755
---- a/tests/lib/test_plugin
-+++ b/tests/lib/test_plugin
-@@ -26,4 +26,4 @@ fi
- # shellcheck source=../utils/utils.sh
- source "$UTILSSH"
- 
--"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
-+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
new file mode 100644
index 0000000000..87f94fb087
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -0,0 +1,129 @@
+From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Tue, 11 Mar 2025 17:19:11 +0800
+Subject: [PATCH] Tests: fix test applications in cpp-common are needed to
+ re-build
+
+Test applications in cpp-common directory are needed to re-build when
+calling make check in embedded system. The following error is shown
+when running test applications:
+make[3]: *** No rule to make target 'cpp-common/test-c-string-view.cpp',
+needed by 'cpp-common/test-c-string-view.o'.
+make[3]: *** No rule to make target '../tests/utils/tap/libtap.la',
+needed by 'cpp-common/test-c-string-view'.
+make[3]: *** No rule to make target '../src/common/libcommon.la',
+needed by 'cpp-common/test-c-string-view'.
+make[3]: *** No rule to make target '../src/logging/liblogging.la',
+needed by 'cpp-common/test-c-string-view'.
+...
+make[2]: *** [Makefile:1274: check-TESTS] Error 2
+make[1]: *** [Makefile:1805: check-am] Error 2
+make: *** [Makefile:1033: check-recursive] Error 1
+make: Target 'check' not remade because of errors.
+
+Create some new shell scripts which are used to call test applications
+in cpp-common directory. Then these test applications can run without
+actually examining the source code.
+
+Upstream-Status: Submitted [https://review.lttng.org/c/babeltrace/+/14213]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/Makefile.am                      |  6 +++---
+ tests/cpp-common/test-c-string-view.sh | 17 +++++++++++++++++
+ tests/cpp-common/test-unicode-conv.sh  | 17 +++++++++++++++++
+ tests/cpp-common/test-uuid.sh          | 17 +++++++++++++++++
+ 4 files changed, 54 insertions(+), 3 deletions(-)
+ create mode 100755 tests/cpp-common/test-c-string-view.sh
+ create mode 100755 tests/cpp-common/test-unicode-conv.sh
+ create mode 100755 tests/cpp-common/test-uuid.sh
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2a4022bc4..c79b77b32 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -129,9 +129,9 @@ cpp_common_test_unicode_conv_LDADD = \
+ 	$(COMMON_TEST_LDADD)
+ 
+ TESTS_CPP_COMMON = \
+-	cpp-common/test-c-string-view \
+-	cpp-common/test-uuid \
+-	cpp-common/test-unicode-conv
++	cpp-common/test-c-string-view.sh \
++	cpp-common/test-uuid.sh \
++	cpp-common/test-unicode-conv.sh
+ 
+ TESTS_LIB = \
+ 	lib/test-bt-uuid \
+diff --git a/tests/cpp-common/test-c-string-view.sh b/tests/cpp-common/test-c-string-view.sh
+new file mode 100755
+index 000000000..9c2ca5818
+--- /dev/null
++++ b/tests/cpp-common/test-c-string-view.sh
+@@ -0,0 +1,17 @@
++#!/bin/bash
++#
++# SPDX-License-Identifier: GPL-2.0-only
++#
++# Copyright (C) 2025 Bin Lan <bin.lan.cn@windriver.com>
++#
++
++if [ -n "${BT_TESTS_SRCDIR:-}" ]; then
++	UTILSSH="$BT_TESTS_SRCDIR/utils/utils.sh"
++else
++	UTILSSH="$(dirname "$0")/../utils/utils.sh"
++fi
++
++# shellcheck source=../utils/utils.sh
++source "$UTILSSH"
++
++"${BT_TESTS_BUILDDIR}/cpp-common/test-c-string-view" "$BT_TESTS_BT2_BIN"
+diff --git a/tests/cpp-common/test-unicode-conv.sh b/tests/cpp-common/test-unicode-conv.sh
+new file mode 100755
+index 000000000..df490b2eb
+--- /dev/null
++++ b/tests/cpp-common/test-unicode-conv.sh
+@@ -0,0 +1,17 @@
++#!/bin/bash
++#
++# SPDX-License-Identifier: GPL-2.0-only
++#
++# Copyright (C) 2025 Bin Lan <bin.lan.cn@windriver.com>
++#
++
++if [ -n "${BT_TESTS_SRCDIR:-}" ]; then
++	UTILSSH="$BT_TESTS_SRCDIR/utils/utils.sh"
++else
++	UTILSSH="$(dirname "$0")/../utils/utils.sh"
++fi
++
++# shellcheck source=../utils/utils.sh
++source "$UTILSSH"
++
++"${BT_TESTS_BUILDDIR}/cpp-common/test-unicode-conv" "$BT_TESTS_BT2_BIN"
+diff --git a/tests/cpp-common/test-uuid.sh b/tests/cpp-common/test-uuid.sh
+new file mode 100755
+index 000000000..8c65daa94
+--- /dev/null
++++ b/tests/cpp-common/test-uuid.sh
+@@ -0,0 +1,17 @@
++#!/bin/bash
++#
++# SPDX-License-Identifier: GPL-2.0-only
++#
++# Copyright (C) 2025 Bin Lan <bin.lan.cn@windriver.com>
++#
++
++if [ -n "${BT_TESTS_SRCDIR:-}" ]; then
++	UTILSSH="$BT_TESTS_SRCDIR/utils/utils.sh"
++else
++	UTILSSH="$(dirname "$0")/../utils/utils.sh"
++fi
++
++# shellcheck source=../utils/utils.sh
++source "$UTILSSH"
++
++"${BT_TESTS_BUILDDIR}/cpp-common/test-uuid" "$BT_TESTS_BT2_BIN"
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
new file mode 100644
index 0000000000..7ac7582ad7
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -0,0 +1,30 @@
+From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Wed, 5 Mar 2025 10:51:11 +0800
+Subject: [PATCH] tests: set the correct directory of plugin shared library
+
+The plugin shared libraries are put in test-plugins-plugins/.libs when 
+building in a host. test-plugins-plugins/.libs is not exist when cross 
+build. The plugin shared libraries are put in test-plugins-plugins 
+directory when cross build.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/lib/test-plugins.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
+index f83e42baa..939236393 100755
+--- a/tests/lib/test-plugins.sh
++++ b/tests/lib/test-plugins.sh
+@@ -14,4 +14,4 @@ fi
+ # shellcheck source=../utils/utils.sh
+ source "$UTILSSH"
+ 
+-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
index 71a9c81bfb..a0bf33b75d 100755
--- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -4,7 +4,7 @@
 
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
-makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD"
 
 exec 2> error.log
 make -C tests -k -s $makeargs $target
@@ -16,4 +16,4 @@ if [ -e tests/test-suite.log ]; then
     cat tests/test-suite.log
 fi
 
-exit $exitcode
\ No newline at end of file
+exit $exitcode
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
similarity index 66%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
index 6a0052f779..bf9df2a32d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
@@ -2,17 +2,18 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
+LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
-DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
            file://run-ptest \
-           file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
+           file://0001-tests-fix-test-applications-in-cpp-common.patch \
+           file://0001-tests-set-the-correct-plugin-directory.patch \
            "
-SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
+SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
@@ -32,6 +33,15 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld
 
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-utf-16 glibc-gconv-utf-32"
+
+do_configure:append() {
+    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
+    # is not created by the babeltrace2 build system. It is need when generating
+    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
+    # So make this directory after configuration.
+    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
+}
 
 do_compile_ptest () {
     make -C tests all
@@ -51,6 +61,12 @@ do_install_ptest () {
 	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
 	find "${S}/tests/$d" -maxdepth 1 -name *.expect \
 	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.ref \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.mctf \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.json \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
     done
     install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
     cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
@@ -92,6 +108,16 @@ do_install_ptest () {
 
     # Remove architechture specific testfiles
     rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
+
+    # Set the correct environment variables when running embedded environment
+    envsh=${D}${PTEST_PATH}/tests/utils/env.sh
+    sed -i "/BT_TESTS_SRCDIR/c\_set_var_def BT_TESTS_SRCDIR '${PTEST_PATH}/tests'" $envsh
+    sed -i "/BT_TESTS_BUILDDIR/c\_set_var_def BT_TESTS_BUILDDIR '${PTEST_PATH}/tests'" $envsh
+    sed -i "/BT_TESTS_AWK_BIN/c\_set_var_def BT_TESTS_AWK_BIN 'gawk'" $envsh
+    sed -i "/BT_TESTS_GREP_BIN/c\_set_var_def BT_TESTS_GREP_BIN 'grep'" $envsh
+    sed -i "/BT_TESTS_PYTHON_BIN/c\_set_var_def BT_TESTS_PYTHON_BIN 'python3'" $envsh
+    sed -i "/BT_TESTS_SED_BIN/c\_set_var_def BT_TESTS_SED_BIN 'sed'" $envsh
+    sed -i "/BT_TESTS_CC_BIN/c\_set_var_def BT_TESTS_CC_BIN ''" $envsh
 }
 
 do_install:append:class-nativesdk() {
-- 
2.34.1


