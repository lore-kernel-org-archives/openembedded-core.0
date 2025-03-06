Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4F9C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:48:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10265.1741258127637526023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5160fcc99f=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5265lx44013996
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 10:48:46 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux1w72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:48:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiJjkiVu6V3fh9QHnngnZJvkSXkimuSalbM7nfkKh3siOFe2YIcIAJ8V5psSssKmNgAico3YZxfqPfeo2QWnSKeKK+sLIWz+SZ4RFyrkWXEKpPcC+jGz4OT92At4jDzJmTieXmwjT7u5x1lRgpR6a4w6GMJO5wV7OKzeBXxKczQbHpOYxl/8vqwjGI+Xz7HDxC4RBqzyFWd+G76M4835mBt8GMZeAXcDkcbSYGAsDoXqp/Arx+GXK4juy6v9QPy2FHl0qQmArAWfEkR3e2I1YY2YxjEUpYrvZjk2+bPMA5PaoMKsrdfAbzHQ9CzC1HO69ByH24b3ADEcqi7GkgeqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fucit/U4hsAyDXGQbhW7vsPnttDLfFBhGR4erhGDIkU=;
 b=pgfV65pXNoCIzM+pe0TALb8mPiDN/JcVb02Q3hXNdrEC+XakXX2RHqTUZfHPCrXEy3DSXbjhzlqoG/FLQu/5k0f3oNWZvaOxdVYLEZTNWREw74f3ib0/tDYk6nuDMTNro3SqGzIwc480buBSU4GYsEMldW0yqUkHDOHyvuWAzOMrWI+6vdZMiAv9bS0ijSRB04bljK5Seg25NhGK1M1XWHzRG6myQOxtETQI/kV/8LYnqDFJykTNo4p6Dki8RFbMDfQytrLC81/8TaZZCMLyvQYd2bi466LO1yPE07At6SH8WB5WvdDRBVgNMhL3MDAqqtUoRLvMns0HvFiTfFUTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 10:48:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 10:48:43 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-0840
Date: Thu,  6 Mar 2025 02:48:06 -0800
Message-ID: <20250306104806.3832805-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:510:324::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: d70b6030-ca62-4901-cc69-08dd5c9c76ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w2WShcyvnzOoLkPvcgxItZvkkbBzL55YYQ9LHcB2iNQ6WNlVVrB8+x6H5lCm?=
 =?us-ascii?Q?dliNoGqGePNJQIr4bX3BF5aoEHJeOIo7KdcJOZbaa7cdiOV6ounj58UPFgMp?=
 =?us-ascii?Q?/SlhtTSPJntc97AM5am2toRjugjYPwukvyYqjgr4+PQUya67QYqgen9q1aE2?=
 =?us-ascii?Q?1fYYbgCBmtiDZZy/g+jl4oGmWeei8Czf/XEiE3CyTc/wbg2dcH9sgQw2vj4J?=
 =?us-ascii?Q?D+QeQ0YYZQUHULAyXn+ESGDXjpFU6k+85ahKZISYnsPwT4b4X5JJlRZC0Tet?=
 =?us-ascii?Q?qErlVnrf5SEclhCnxx+ZRXXRPbq5En82U/xwFb3pdFvuFn4ig1UZM6lEO2zC?=
 =?us-ascii?Q?Hi0KPc/9rnQpP1O9vJPZKjMrUhowN3X86nn4Puz17gCk3LzXbPzp9SlphUQb?=
 =?us-ascii?Q?/KImG7Z9gBT34mJx/AKUHlrOvY8UZHUeegdL+kK/m5Cb+LLkgJW/RS6J5CW+?=
 =?us-ascii?Q?1GNanNS9JJi9CJ4si7OO6Ee5l/v9E5YcQ6XzlFiGup1F/3S1+YdgnJz8MjSS?=
 =?us-ascii?Q?q5irN+YGfYjK+xYTl336uwtU185VnjfowJJCXQSsV/IBP8a5fkL5m1O4Vffd?=
 =?us-ascii?Q?MbcBrvWq35xq7Y3Q1L1iunEZqKyLxsE0VqcBPPHtK5wCWl3KwPQHUw3mtjFm?=
 =?us-ascii?Q?rWs2/fhjFU/TgaVFo+aWXBj0jCbGqsyMsqbRrPvfoKIHVUWna6eXgqiEG1he?=
 =?us-ascii?Q?NPp6p7tZRpDOSjly1blOmuaf11r8sj9lGtmRBtuERoVROqNS9achu79yM697?=
 =?us-ascii?Q?xoJ9sHvZY4kkG2UC1zcsArh4pc+qSf1qgCt4EE2/dqbtTedTaamcaLZonDD+?=
 =?us-ascii?Q?Ut4hbN6fItZl6U1LvZEqOBSpVu71hxv2YvoWL/D11ztCiYE8Ud7DxchGPuQP?=
 =?us-ascii?Q?o1b3qByRMwwVH7os9gyhTDncw/beaPgpwPqGfYgrSb0es4Bbk46/1tOLwlVs?=
 =?us-ascii?Q?0Fh8saUTAwKezDRLa65WDYKhBHSIHl0BWASNxXZL9zcgcSuXycmPEDO+WCNi?=
 =?us-ascii?Q?wolOFnsDYE2HVj30a9sLJ2ihlwuSAOjb0kJXCQS/B8pZXZGCgOr0mOeVo/hM?=
 =?us-ascii?Q?eZRem9uljSkKofWMFT3udpuLfesbb1xzplaCUQaleg8agGnNTfH0fT3k0O3G?=
 =?us-ascii?Q?S6wl3NHgRbb1c1DkFvVzQfUMfFbsAyDjsrfYpjDu6EI9Uv+zhMGCzSkKNi/e?=
 =?us-ascii?Q?7uxcZAAZBT1FyeSUOuNwUJLukmPEI8Log8Gn5YovGzBq0f2IeRbHAYH2tfbW?=
 =?us-ascii?Q?DiNSBLeMrwDh0S5FIcv/Q26YXp9fnC2tTPu55yMc8UAI+2AVRoRpcamCyqJE?=
 =?us-ascii?Q?B0/3IbVH/79QcWdeqCJOshQoVcjaP6zGypANNp4nPdPfW8E0u7oAIDctAX1T?=
 =?us-ascii?Q?e9xIO6heLH9+icy6AYjIqbroPEZI180Nm3CoJK21nq6KUwwHmg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PqdjaaNzP6/m4uTeSNwcuSKuMXCMB48VO1iXpwpTeORa3qi+R/ahjybfpL09?=
 =?us-ascii?Q?C0o8nd4zRscInPNrOyWK99gjfTKr89HZXIuD8yTQubewjfNkIAzha87La3LZ?=
 =?us-ascii?Q?cpc+GgHKTlB/IChjwhbwiqhMZ6iZPg/Fb37FfBoGQVJV9Aj2OFrbCrqL+9LK?=
 =?us-ascii?Q?jjsp6IQxmHj1KQFCItmy8AABI538sDGDuWMgVoIg722XeVhQsCVi7qneN6l/?=
 =?us-ascii?Q?joGC3PFCvJw2zMf7fpme3LGvTr95+Jbb59fh1j1a1Ybca3PoMWAzOvYABWDK?=
 =?us-ascii?Q?nJrAbXbzt4yOrm7dpNDa9wjmrD48cCI795EdCygYR+Tz7L/iI6cpwMjkEEQL?=
 =?us-ascii?Q?9/Dq0Biy72HZdvnqmoKH2khvsBdwc2AxJk7odwvBdm/hbl0IwY1VOO7T2Svg?=
 =?us-ascii?Q?IYYdZK67FN1WbpBXHlyvdjUSlY5xqFMTND17TvjV1p/ca2DBHPJVv/VLR8E4?=
 =?us-ascii?Q?QYqo+j+8P+LnsmSRPAu9/6iAsYctiUXP/fv28hNGf3lWyT2IGcx7sQwAtPro?=
 =?us-ascii?Q?EeuxsukIysBxnY9kSh3VxwI9C7H62YL64u1kGxeV8vUjlZcUDsC6JoPMedV5?=
 =?us-ascii?Q?SB/Y6LxwiPp/jGeVTWkRx0mviBwk5OxPRguDxsKJowLgJUjR1ofUXe2kEtVg?=
 =?us-ascii?Q?oL472xj7PFIUPb3Vc8oP3kq5cErg83WhPi/V+DjbltTfEBoY8EzVil0HcAUN?=
 =?us-ascii?Q?2EdRW+BSSJwhS5izWSH+sGnKK1yjxElPOz854YsNh0GkW1Y205z+4R/qKXVb?=
 =?us-ascii?Q?SKkZRiW2Ogoiou7DyIO9X5+twVjL+zqyb2oQkPL5BG0Z+Zm1H0giExwHZ0fs?=
 =?us-ascii?Q?BAu0vXSNQog1VWwpQAiq7UtVZanFZ6xlt+jzoNQN1gNUwk4td9EDoLWELPSR?=
 =?us-ascii?Q?pp9v186cX7ib4p/XQsEDO86CW3gjpuHop7Eonp0EfZSsezhvLSp9TDo+qdD+?=
 =?us-ascii?Q?YjpxWGAepfXpTp0HuE2FO7LeQfRAr182MvMz+ojIDQD2YzA9v8lj2QY08Eoc?=
 =?us-ascii?Q?1qTfC7z93eH+gmWMpjXSMLeOuAdRFhPFqgZ9IMf42f+22HHPbp8FPVBda3fU?=
 =?us-ascii?Q?mlK4lsjX2FXo8bOirMMUNvEOv5ssI1uoX6xSJguvUfdwQsJBjm+HSxu5WaGw?=
 =?us-ascii?Q?b0yBQBbakOXq9ouItyTzuoZMTSvIvwRLfOyEY5nYrh/Ujwg0oL+eOfL5IpS1?=
 =?us-ascii?Q?Rtrx2oEo5XMKrhZ/FcfcXqh++TSYq7Gd6Rwr8OfMuxhGN/FINW9YAVYafi80?=
 =?us-ascii?Q?qe8iMukI/3ZurFFASokS9hpbLgvF/aupu4lMnljqBiiQ2De71oVFtvLbX0+9?=
 =?us-ascii?Q?zCh7hfXi2cO9x4yQrg0fb+dLZaTpI3I1uM0ARPhjpOPT7yIazuYZVDSkUsY9?=
 =?us-ascii?Q?U8yhJKBD0r7Ct4VZX+mh8gAEKVxNWp+jJIpAPy4TeYDHHJK+xCIdhNGQDdK0?=
 =?us-ascii?Q?L5PkF7jdOHBWVAUuKzLvY45Qx7MT+LtYh2hoyMiogdR7IQVjKoEWM8DMvkju?=
 =?us-ascii?Q?tfUlhdxKUWYigxxtazHWWWKFCS8BRcObfx+6zq52p/T/Fy8ki53nBs0n7U0x?=
 =?us-ascii?Q?urYTEQa9tdSffm4HGLxz+6xemw1KN0p6D1IIoMGr6NPBeRzUiKKn689In0rF?=
 =?us-ascii?Q?1IRCfDeF9NeQWPZqa2yUQxc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70b6030-ca62-4901-cc69-08dd5c9c76ee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 10:48:43.7769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWxhl/Xi/XT5BhknlBRXPxxFrH1oOt0N3Xup5LLDXvny8t0dsO7zZAmgwulWCdxGdTAi8ynx9zcm1yqhBH7ID67KTqC6dNVVYm43l43C40HdfljK9NyUpIOXryEyiMeh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-Proofpoint-GUID: gWjyLO70OGPynbg73Ep-H54qSuJOaBFk
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c97d8e cx=c_pps a=SmJf4+RRogz8lGj/IwyRsg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=EP7FMzEbL1sSnpCfR7wA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gWjyLO70OGPynbg73Ep-H54qSuJOaBFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=918 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212382

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32560 stack-buffer-overflow at objdump disassemble_bytes

Backport a patch from upstream to fix CVE-2025-0840
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0038-CVE-2025-0840.patch         | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index e577a10cb8..26d0b570f3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -72,5 +72,6 @@ SRC_URI = "\
      file://0035-CVE-2023-39129.patch \
      file://0036-CVE-2023-39130.patch \
      file://0037-CVE-2024-53589.patch \
+     file://0038-CVE-2025-0840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch b/meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch
new file mode 100644
index 0000000000..b04e750690
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch
@@ -0,0 +1,53 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Wed, 15 Jan 2025 19:13:43 +1030
+
+PR32560 stack-buffer-overflow at objdump disassemble_bytes
+
+There's always someone pushing the boundaries.
+
+	PR 32560
+	* objdump.c (MAX_INSN_WIDTH): Define.
+	(insn_width): Make it an unsigned long.
+	(disassemble_bytes): Use MAX_INSN_WIDTH to size buffer.
+	(main <OPTION_INSN_WIDTH>): Restrict size of insn_width.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893]
+CVE: CVE-2025-0840
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 59f454b0..bd6180be 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -110,7 +110,8 @@ static bool disassemble_all;		/* -D */
+ static int disassemble_zeroes;		/* --disassemble-zeroes */
+ static bool formats_info;		/* -i */
+ static int wide_output;			/* -w */
+-static int insn_width;			/* --insn-width */
++#define MAX_INSN_WIDTH 49
++static unsigned long insn_width;        /* --insn-width */
+ static bfd_vma start_address = (bfd_vma) -1; /* --start-address */
+ static bfd_vma stop_address = (bfd_vma) -1;  /* --stop-address */
+ static int dump_debugging;		/* --debugging */
+@@ -2897,7 +2898,7 @@ disassemble_bytes (struct disassemble_info *inf,
+ 	}
+       else
+ 	{
+-	  char buf[50];
++	  char buf[MAX_INSN_WIDTH + 1];
+ 	  unsigned int bpc = 0;
+ 	  unsigned int pb = 0;
+ 
+@@ -5457,8 +5458,9 @@ main (int argc, char **argv)
+ 	  break;
+ 	case OPTION_INSN_WIDTH:
+ 	  insn_width = strtoul (optarg, NULL, 0);
+-	  if (insn_width <= 0)
+-	    fatal (_("error: instruction width must be positive"));
++	  if (insn_width - 1 >= MAX_INSN_WIDTH)
++	    fatal (_("error: instruction width must be in the range 1 to "
++                     XSTRING (MAX_INSN_WIDTH)));
+ 	  break;
+ 	case OPTION_INLINES:
+ 	  unwind_inlines = true;
-- 
2.43.0


