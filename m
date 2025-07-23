Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EFDC83F25
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 07:38:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8374.1753256331292765312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 00:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9299729994=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N53bRp2132853
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 00:38:50 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqv1vj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 00:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7Ka6hWNPIzbLCgDBLzj6kciEaul6GcOiQxUXHBrnhJaY2bftTDoJdRpPcgC5qVwJAZB8s42GUgaCuv099lCdccKXFPX2WtcSEkGuNKsmYOSzSJkUFl9I2Rvwy17hy+An21nbCIAMqqGqysr8qk4LQZNXkJNr0aNpeD0B+qT2mts4WLSB+X43l1fQtvzFfpVYVTjjoZ301B8puZy6V11os+bOBh+gBhkB6OZOR12SQ3v1jvNMDl0hGhuKPIiR1N5ya8RmOjK2l9RFTT81rhSziI669yL03ibM46BbJrTIWfq/oYDemYsYMLQ9CWVITWRiQtGkg4S986q9IvbWWs34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml4MCUtPEnwI03deBNXzOh9oxEUpMa21q0lIvlj0mb0=;
 b=Ape/x09O8Iev++dedr3CTwfKH3WmyntTyytFuiSLjMnM07ZywVvoRwOioWFxFYjuu46qQ3aBp+P+gsEW4UC4dig2cy9+qGdS6UVSuU5C8HdnpcJU1dYM+5Sqn5/ydldgTtoeazbhUOKxCIPRGuf6LZnDtJ954tMaCQFjbdbi6DrzkstinkDW8Mpw1NUuEdk/s1pT/1guoBQpu979SQruNOkfeudJAGnHKtv1Ynh/jj4SdlBx6rApJLWnflHCkdYAJbaC9rZg6oCYgH7H0a1SaPctDfB24zmR5TajMkj6vx+EYqQCjG5w/vJxGTrHITxEdELCTdKn7WW6V5dr3j8CJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB5826.namprd11.prod.outlook.com (2603:10b6:806:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:38:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 07:38:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3] kernel-devsrc: copy arch/powerpc/tools contents
Date: Wed, 23 Jul 2025 00:38:04 -0700
Message-ID: <20250723073804.3239691-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: c32163c6-381f-49e3-a635-08ddc9bbf646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H6rnz8SIzmMl0a3GZ/ehN8Oa/tHc+sMwypxoBPMHG+ZC0n+oajAGjGSfTati?=
 =?us-ascii?Q?R2F4ZaiCjz6KQKNDgKHYjzkiGTDzSvWyc7/bTVkikFxnml8FxBNEOFb5NaiB?=
 =?us-ascii?Q?aDfiYQhuIrfDpK8d9KlASEWSQQvg7/rAblkAa/27SuQb0EBbPun2DIBfElB3?=
 =?us-ascii?Q?9u/fcYm4fN4rKVAnAYwNFoUeVLhgDPb+hPHCGSnnjGkhW0qNwRQtHZgLK01o?=
 =?us-ascii?Q?WcNtF0bz16TucfivQukDJbPSjhuEnb6g2E01rau/HX5RLLZCn+TqwZO1ENOu?=
 =?us-ascii?Q?JMxzsYmr04jSiqF6N7OmdWKhQVaWFWqG1vXjEatGzIqTewj/YWy7xenyTiEz?=
 =?us-ascii?Q?pRofXA6QmFokGX4hG2nE8N94sm37YtqaLQwq+3CnxnubNeEvkgcA0uP8PNSN?=
 =?us-ascii?Q?iFc/UqbU/AU/vO0QVVg4cE1SXHCuyrDuJWDlU7/MDRxfqokUWIs3wTYy6uFv?=
 =?us-ascii?Q?B8hKvLbjDiBJIPjDBIv+ORYFG4DdcHQAANjSiYsr+FStibq35MmXn5oYUQM4?=
 =?us-ascii?Q?qFexIm4SpnixML6vGXiZH2/S+JFtAPt4ycV0R3YkzDLsOGk+Pd/8KjCvQTJy?=
 =?us-ascii?Q?rcWgTdfCXJPWSOS11e73YaG+V+F08ZzlFiPx9To3P0fo1MCTzsbXyPX6D37X?=
 =?us-ascii?Q?vKAgu3bjEM+/RBQMgS549JU9W5RKU7EiGRfMk/JYScGHoSNGnJcZrOPAEy+W?=
 =?us-ascii?Q?L2BDqRmONDSAU2iVAmz9PFfei4Kw6fBDmoqm+YuUC/bj70P9OpHyKTYElJbE?=
 =?us-ascii?Q?kFgDg+N5sAN5tZ7oUrhIpT1KR5/t5NWEBBve/RcSu1L0YTIyPhal4/Gj1pYu?=
 =?us-ascii?Q?ipWbb0kq6gDPfBZ18tOunKZKVwZ4VYGagO1AHyFxTENy1JMu0yTbI5l8f7A0?=
 =?us-ascii?Q?t2/afr8OK6LCSQ5szj1OLx0xTWaDefwm2MTgS+0y/CjoB3nTYQkqHJyBdOmf?=
 =?us-ascii?Q?fzwaFJkbTiKt8hp6bXlcVoVGyeyQ/w7tFYj/d6dBiXl5mxgjtxom2yupt3Dg?=
 =?us-ascii?Q?bZKALtqTQ5SLaqvJasrp4fkjGmJsurraxZ/O5lmkE+Y0ejrcRIN8U0ijUrGO?=
 =?us-ascii?Q?0HEBiE7ZN1KUYvx55pjDVNbCR4YeVRpEbG2ahOxm/Yjw9hjlDmksc4xm7fLy?=
 =?us-ascii?Q?DqJvXmrbK4uxSPEpWDfrLQlafBvMngfuiGoCxNC7ax5ECHIXh/H6GX2Lbe7I?=
 =?us-ascii?Q?OxnJ84YnxolVBbLtIbMmmmWJWOo/hFPhCDQrf5wg8PMHLV2ZNWUkrA/UH3aR?=
 =?us-ascii?Q?eAtqzlW325m2+BojsmYl6B2agfaGTtNjoBDN6aZeodOnHrEnDsmLear7LVFJ?=
 =?us-ascii?Q?7TnrjDY1q8NbdsDvMuGJZ8D72qxsyIquXL/Sf8kL+1leTGnQRI+2m8VRU9el?=
 =?us-ascii?Q?BZsjptV6o9HDYhzhpPnd5JuegUwQ1X7JnO+oENsZV0fw0GIrUS6QNxj7uhKm?=
 =?us-ascii?Q?/w5D8+MncWnJtC09sAZLFwvrwzlE6MfBK2PmZVTUjim0l34blp583oAv3gVS?=
 =?us-ascii?Q?sZcacd3/cbiC1Qg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YnLtyPHfQ01ZfRjj07NdMpsIuUaQj+32zciZJXnoxOTkr+kR3BJE7dG9tHhO?=
 =?us-ascii?Q?GVr1jdUJPzzNzHZztHE67IdquK+6iCTdG3HQGYEmOPP+UTUlRLSmiz2w6FQu?=
 =?us-ascii?Q?9dX3Xw8zO38D41SiuY6RlShUrTRx7299IOYWXLcGG4z5wx9cEU4ga434DTkj?=
 =?us-ascii?Q?gf80JGcah0DNv69f3f9o5yjbNXbr6S6QxTDqD+CcyvlJQgpykBugCn5CXFxO?=
 =?us-ascii?Q?6BPLiy2eBQtQwrQGIv0djJRt1CZwtAKhGjIjhd4dxkVBIJ6B/t6K0bY/dUN2?=
 =?us-ascii?Q?6eZQFixIKZbDar3w26lV6AXs+6BF329fk7dye4n0Soer9q2RykVKLbTZ0d2n?=
 =?us-ascii?Q?ARvwHZ6MiqTZkBz981459y4wCVHdKoyvp722JOI4S4B8+KkobitzxE6QEC9x?=
 =?us-ascii?Q?SuXlumnUg4icRLYmg5q3CjLHUy633dx/ewVR+QVAvEvrOkSJC91758l7a7Qj?=
 =?us-ascii?Q?stNMVb6SqIHoyr3RNikLerhA+0z3vP16CEkZqd8q16ZdqSes3pQhPQkSXiim?=
 =?us-ascii?Q?9IDLJMPit/FiV3l2gF4VjUSZLtHtTIcelGwnqdekH9Q4MYeFKEHdtCYpHnQP?=
 =?us-ascii?Q?HoZLXAgyG/rgIs8sdNWbxroSiPVrr9lk3yGHA8/W/0fE7lDSFjTjvIlF7nwf?=
 =?us-ascii?Q?59qf2I7l84Hsd907dSkgsqn7R0uMX9V7I3BcEDLAIaxIQDJDndLUdxckrx2X?=
 =?us-ascii?Q?ZyS6auchb5pFgzkRIJqeUvALXSdkNiCD+o1KhTS9yc7AmgV/yKx6eTOxWliv?=
 =?us-ascii?Q?ov4BTzgZ2L6Ov6X8hKvGhzSbtD4aNXyPiPxhLilezIh7Cf/EQJE8C+aedxCr?=
 =?us-ascii?Q?a6lNeMOjXqRFujN0KHQK3vWhi9ZToquXcBK23DO1f/o0T21Wul17G2bHB0HQ?=
 =?us-ascii?Q?KZwXF3bh7Q+BLyBWNujYcfmuNgZ2rWXHU+tYytx4xFGgNSsrOfJBaIGu6vYn?=
 =?us-ascii?Q?PHbgd8Wvp0kSMObVdIFXU50jNylJtDTWcdAtcP5h3etw6sDdLu/K8kfWwgQf?=
 =?us-ascii?Q?SM4AZOfqvfMxoGVcONeWr/RdQjIrk51XcBnCK1u6PMQGxO4R2vX4jsVr+96K?=
 =?us-ascii?Q?mKIqHfFHwTe8AazKwZhENHX/h/plvOzPjOZGX+s5GQHYYZL3ZmmCq6FuConh?=
 =?us-ascii?Q?ByLvosLRqfN9thzdPmzOiJ2TCQkW40btXzOz6DZ1OZTjGhqehCBy53/Jlyo2?=
 =?us-ascii?Q?tYq5QRRE6SEIVfTHt9ZmBS2Afga1ZRPnnY82qCfjsdXkDVwvhW6bqLmaYTJO?=
 =?us-ascii?Q?cDjGxv9va6elfqHkRzi11ot4BOYSQOWeFHMrnO2c7e9P90SNMB1pkG284E/X?=
 =?us-ascii?Q?ZOZDCxN35GQ8d3WICBfj2k/COe1zniFgTuzqUHPlI89kNhzaKIR5HfdAZgO9?=
 =?us-ascii?Q?Wpw1a1krAN6v+ecqJDTnmkA43DnNqBT4hSn3z4x0PuZ23L3SxUyOkbvrmgqW?=
 =?us-ascii?Q?kXDxKh/017iY/+Q6GN3M234L7eFIRifaqwBbc3WktApwRZG7tdHZAHb/u228?=
 =?us-ascii?Q?+ce16NFXiwxW2DC7OMECclKuJNcw7psmeqn8//JUsCvqJN+KiTjcuucIPgkk?=
 =?us-ascii?Q?+U9FM3FziDEBjyw0C4X8/W0rYfyJWUAr9ypt29Q6WJrxTlXSRqu1C3P/oKWt?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32163c6-381f-49e3-a635-08ddc9bbf646
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 07:38:48.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpo5yAeq6hwavP/n+BuBwDOQtNEaazJ0FlRQ4JFH+6c1ow4S3MkXjD4biNSaHNcZvLHgLmpwqbYrdcj3dlLYXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5826
X-Proofpoint-ORIG-GUID: 7m_Vie4y3scjaig6vLiVd-oC9UkBiDdt
X-Authority-Analysis: v=2.4 cv=coubk04i c=1 sm=1 tr=0 ts=6880918a cx=c_pps
 a=00uhA2iMQE1K7v6Psv3cpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=9upppy8qrwEBI3FsaI0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7m_Vie4y3scjaig6vLiVd-oC9UkBiDdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA2MyBTYWx0ZWRfX3BuSSbFlAEj6
 mJOt5BwhNP86jcuS5IicjNzvrpdn5LX+uY94q5numwWp+xLQQ51Us7JklfOt648bsYKVN9AjBuG
 msIBwef9Y73pgpynK2JhUCLbiDGUS7aA3Z1FfV4FTN5eYsm7oI6UXywkIUqHvHo2GsZVKRU1P+h
 nWe6bkamH6DS6JJtpggX+mxCVbDYL+WnSnLfBKm6fYNDYAEgzs8oR3PpWsexuwpfM3+En+iNloC
 DfYzuhAjCIfpmoSq2Yed1i3zddgKVoXEuHGMMTmmJV/SdQWQ7GSsOW/WabPa2nGMxRCOko0cPnQ
 Y81E5vZH6nUq0p98uX5o2skW/ye525FZmLdkz6iyndBcOeg4xsKgajYuYd2N9dzmD5mV3Ooz6Sw
 lW2Fk4gS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 07:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220795

From: Chen Qi <Qi.Chen@windriver.com>

For now, using qemuppc64 as MACHINE and building things inside SDK,
we'll get the following error:

  ERROR: modpost: "_mcount" undefined

This is because after [1], MPROFILE_KERNEL is using arch/powerpc/tools/
contents to do the check. This in turn affects HAVE_OBJTOOL.
"""
arch/powerpc/Kconfig:   select HAVE_OBJTOOL                     if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
"""

The current MPROFILE_KERNEL for powerpc:
"""
config MPROFILE_KERNEL
            depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
            def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
            def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
"""

If MPROFILE_KERNEL is disabled, thus HAVE_OBJTOOL being disabled, then
FTRACE_MCOUNT_USE_RECORDMCOUNT will be enabled, causing this error.

The scripts are listed and copied one by one. Their names and the reasons why
they are copied are as below:
  gcc-check-mprofile-kernel.sh: needed by MPROFILE_KERNEL
  gcc-check-fpatchable-function-entry.sh: needed by ARCH_USING_PATCHABLE_FUNCTION_ENTRY
  head_check.sh/relocs_check.sh/unrel_branch_check.sh: needed by Makefile.postlink

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=abba759796f9b73eb24df9b734dd063839fc62e0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3d2eb3929e..f8563291d5 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -208,6 +208,13 @@ do_install() {
         fi
 
         if [ "${ARCH}" = "powerpc" ]; then
+            # Copy scripts that are needed by powperpc build, but don't error if they aren't present in the source.
+            # 4.18+ needs gcc-check-mprofile-kernel.sh for MPROFILE_KERNEL, for example.
+            # See https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=abba759796f9b73eb24df9b734dd063839fc62e0
+            for script in gcc-check-mprofile-kernel.sh gcc-check-fpatchable-function-entry.sh head_check.sh relocs_check.sh unrel_branch_check.sh; do
+                cp -a --parents arch/powerpc/tools/$script $kerneldir/build/ 2>/dev/null || :
+            done
+
             # 5.0 needs these files, but don't error if they aren't present in the source
             cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
-- 
2.49.0


