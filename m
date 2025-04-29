Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E913C369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:30:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7914.1745900998904978828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7214fca01d=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T3AW5K016455
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 04:29:58 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1bvjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 04:29:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaS9x+r3NHEP66Jna3JsJFMgGRBHRrICePZuojN3l4tdBgxjcXteNLNslvpe922E0neGvr7NHV508zzZyeF2bcrUF+XV7Jjo6Ze0HoOH0ujY1LmE6JIrTTpcszcxNu0R5HPFMxlq5CGQilr+G5qk4nPARBZEj7Ql4MuSQ2uRZK/5oB4QJSwaR8rvcIKWqBgIZjEw1/GvftnzMEdc78uSmzu+bUD4DwgtwlRhZrcHeeBmvJODK2pdvpQUXZSDIymjPOAOkMvnnOFLa7xybgS0VfbZBwrKALFHeZAzrWIDWHYZY8jaoUnpub7FijJyXsfXrltKS0QLRixV7EQ4zt0h0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I2fEM4lTSGvP/2XM1Nv0ITUIJw6/lxpyGssrX2eitE=;
 b=NhpHBzqgdQyJhgh0QJS/7je1rZszcX+xgMOZMp1/KGtLTqJkyaQAfLCQXQ9xZH9tuVlvtvTzYWG9KV3iIEWrFjfiMFQU8IIMduwcW/NK3KDkmkAQbdeZ+BKyv1/aiMRR14xJyc3Du/M1Ydm9+iHGsBNTPvE1ykd782dpkeaIn7gMuzDzNmJrh3p5pz00+8j4wVAziWjBxweV/wq7NP/m2uw3dM+MM8k15o63pcg6ePpwHMNPQTD+oX8v2aVecByPH1dCQmguWfndUt76tG0QjvvErt2W6SYvpE70xFoiWrlQGZVeP44oWFesRTyIJbMpnYoRyPYZx8tJBZd6B6z+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 04:29:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 04:29:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V6] lib/classes/conf: refactor qemu.bbclass functions into library functions
Date: Tue, 29 Apr 2025 12:29:40 +0800
Message-Id: <20250429042940.657961-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4e82fa-a6e4-46bc-9395-08dd86d67d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hw7Uknn5gAOczvlAt5K+RNawLlx+3YP0x22MKAVVQ7MQ2Wxh395A9AYJYn2A?=
 =?us-ascii?Q?PBo+A1/hrkK3fC4eUu5Wz1vDpf6iHWeFc7tLZirTbDt+Ir4k777nbnqqOvFv?=
 =?us-ascii?Q?LO03HBU3RRtLcFGcjDTM/Gf1ZC6bMXlfHFlu+vl1bB86L0TIuJ5sI77UWzct?=
 =?us-ascii?Q?1Ful/aCVt3qLromyu9x42fdNYJB+cO0bCjMuwWYsGacYUdyK2/6OxKSoZLe/?=
 =?us-ascii?Q?elVLENqSbU7QOs9isUXgdmkhsDoDb0EBd9uKm9f2cadogn64b9VjPYiKiv17?=
 =?us-ascii?Q?wt8BrpqWXJfGQc8wAXWZzHMatqBXtERyNyzKs43M0ZC8jKCPjrs8MFf3ZXAF?=
 =?us-ascii?Q?JYEB1XdKzCpIu01XilBisuh5nicns2EnB7JUR6u3VIjHLn8D9MgRR/WmEUcv?=
 =?us-ascii?Q?DpTCh29OL5maJOD4ioi1NtzBIkOtApxBq4e8+uU/ax3Yh86sKaoFsUDvicaE?=
 =?us-ascii?Q?VOXVUFQ+mdm8dpCtv+Iwwth5rFHcygFjaD6PwChoHoUDqV3a/surPujlZryK?=
 =?us-ascii?Q?dahjnGGGhZJbkCMCmfY82nCRaDXbtwju7iiOCsx/sdCKwnrq+Rn0NgNdCEji?=
 =?us-ascii?Q?NAAN3HVtPo0UMNz5qPPtwMMfnM91WuVXfiZk4Cdn7yX3t4t9gMg8fEeQAlEY?=
 =?us-ascii?Q?PJiEK/2n5NbbmWG5rf5++oS4zs16kwqy7+IMKZmr8kRYCPQGyL0GBJllPEC9?=
 =?us-ascii?Q?zHoIZ9q8bDmciic0JWaCCcrvLg21Fy4Ir9htYm3t5HRXOvR/tCX84Q5P4lXr?=
 =?us-ascii?Q?aulwtxMc8y+yIoaXngKHy9+0OBjZgM1QzVkW4rxzrdWDMaN3hxWeAIcAO8O9?=
 =?us-ascii?Q?Zs3JetlR/gXrUrkmh0ieAfexeLtitN2Y9vMhgoSZBnqTfRjgpMN/8aFE/qMn?=
 =?us-ascii?Q?CNhmz5G2SA6XqG9wDtTwIJJPbnSsDvkSk9KoRiMXHd6wKYhsqflxan/TfFV2?=
 =?us-ascii?Q?qe+OjlWr73m1OCAx4nxuSBDZ8fq3UsnGL5eY/rhALvpjzPaGdT0KsZkZ596O?=
 =?us-ascii?Q?5pRVWbYrclp7rPwQ+rwGjeMp/GAPlXF6Wol4/PDAHjF7q/6rm66ZINxMGTNL?=
 =?us-ascii?Q?fZ2beJM/95gD4BCGgj8Acvv9LGpcwomMEcuAfYSOaPpF1YpezjR/csiJBkAa?=
 =?us-ascii?Q?xi5cT3MEuMalDUrUPRWjyvIT+4FkMdHvl3ot1s1iaFglBc9ouuuJ/Mncg+1Q?=
 =?us-ascii?Q?093Ceji4pKjubA51iLR6B8bIeocE7VRZy5+U82nAJvVh1ef1WyY5uecwBwBH?=
 =?us-ascii?Q?3Xbt5D+uHzKvZVbyZWXlIIZvNP6mGxf0KYVqKNkqvPeCkEisojNdl1qeJQHw?=
 =?us-ascii?Q?qWtRDuprIzFJmkF46Su5wSqnDjeUg1+w56uhOmGEHewSQ63dpA6snuMYq5jf?=
 =?us-ascii?Q?PSeyi3Ueu8wr8Rv0fhxa+JapUZzgpyAqNgDhecZ36VPPb+tHC+fDdwgIe8Ao?=
 =?us-ascii?Q?L+v+UYFR5IoIlAUvPqkq++tvtXSFZ8JOTXiCxYBlzxnmIgTQAHHpBA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zdTBkpUp14RlgUUYLZdMXZAD/2Jb6372vgAdTPPu9Fspg+fp7lvZNXMlF7c1?=
 =?us-ascii?Q?EXlYW5zTF/cPzl7Au2JsmzX5AWITNew/2TCqNBMy23lAaJsmwmhzjeYbrqhU?=
 =?us-ascii?Q?SqoSvNVBzDeiDTkE1aZ+DwryODslWEuNgz4Sv8eiEYJt/IPX5w/HrR5Tph+7?=
 =?us-ascii?Q?HQf/wpADXoYA5qztACmH7jfq5ToiOaj7jm8MmUUUmD8oJNQneocudi09PVZA?=
 =?us-ascii?Q?izN+qEes3QdeOZ6DSQMe9rhbylnxCB1tkc24IhlMnGFJ5Y7A3Ra3vwzO/IYV?=
 =?us-ascii?Q?3SR3BJe0ol6XYnCK34CSEpo7TR8+NeIJvfSsv1cTOZqOELwI9pQ7CsbSBgri?=
 =?us-ascii?Q?81rEnJ8kbwCLGHXseceLJtXKXhO6p0ydMq51g0yXZPNra862Rs5eWH5NrM1T?=
 =?us-ascii?Q?E+Kr1SwPaJtLt6Dx4rR/pF40nBNpqZMrbP8PgnCMsO90z6rQ8MeK86I79bKk?=
 =?us-ascii?Q?7EYjwFQvoKHqPSJZPUKHm9jWg8Zxx4bAKsX+cPsUvGcIM8D8tAWlNzcasnxz?=
 =?us-ascii?Q?ZLoPp5J//NtJC709Xe66BmNyKZQO2By85Eo1lrM80oGKHUIwAc74N1MCO3H5?=
 =?us-ascii?Q?VWHSugJGTy1cD2CjjyelYTDSQkOsnJMJ5d/+IgYtVxKUDFEi2DTVsREJCUMb?=
 =?us-ascii?Q?iLK1crnac+hUrhkiaq7imZ6Dnrep414Vz9vXhfA5cm3KuVh87pt8gGZjpMYr?=
 =?us-ascii?Q?cjotayxcCTX4uNtE/DQQoXGCqjX4bLd+PON2yCTKZ3CsILBCXRagcaVVQDV1?=
 =?us-ascii?Q?/WKgJYD0Pyevk8rAh0NA53xo4RgwdbL/AYY1tqxylvQ1ZdFnnxNnYlEJooap?=
 =?us-ascii?Q?EwAvbtcPtjfONbhw73zFQiyl23uAsUu6PlOxbnI22EIr8tvc9UgzoMVG8N2V?=
 =?us-ascii?Q?3jIm1wtTIWF8kPvStz1vMTHJI17MEkvhGB4xIkXQ/Hqf/jZ89JyxTxoPegyI?=
 =?us-ascii?Q?zFqFxBlR3PXeutb4TVzRAMghyMCCLtRJVkrrbU61TYxlE/j2tG0gwCzm7Jt3?=
 =?us-ascii?Q?g+w4UI0M5Bd+Irxmdjt9mPS+dxsDZs3JrtGr/19I2RLevjx+lxru3/V7GXS/?=
 =?us-ascii?Q?uAg01reHDds0g5F0tvsem7GD2aNvHZF8jGH6bGlVxZ92xaa7EfpMDj8MmYr+?=
 =?us-ascii?Q?/PcLo64Dr6JkojQSFDuDSoBzm9z4Wxqe5L4mfREJLkPv4hqpeVwQ4JWs3F/1?=
 =?us-ascii?Q?azJ9Wz5/3pCFRGw9J5eu7zJy40r0Cp5KGEmuJlG/SXEaQh823V+1M3zwt80Q?=
 =?us-ascii?Q?H4CfMsVMMpQukAf9Z0wiQ3f4PXFe9Xko1vYycBFPUGgUYxgrQd0/12qVlKx5?=
 =?us-ascii?Q?EhgYM2Lrq4mK4fKAwH1kMTj4P/0i/NSyOxcijBM4RHkPRj5FkX6Y9zEMlSXv?=
 =?us-ascii?Q?iE0tT3v6jxe2lJP+zw+S/RQ+bvSOn1hcXzke/YaWfRKGo/N/Wvu5G9yastrc?=
 =?us-ascii?Q?UZXcDoOSE60IbESWq61TcQ1H0QqLCP4hwhxU2qMhW9QEt34KwzaqYYT1e7E+?=
 =?us-ascii?Q?WuEc44TRJt+qluf169ehTzKfDVJlZbhv0lXt4c32UAdQfT83vLis/pRd7ENV?=
 =?us-ascii?Q?abwQS2r5qrddmh3ReNOuP08hJJllgFV3PFEoXE5/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4e82fa-a6e4-46bc-9395-08dd86d67d51
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 04:29:54.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4gRLNHhulSs7X35SABmVTlurcW1C8F8V3QjO9hafMKiF0HXGYqdpEJLXCLtXhaXW0hQ2iVNyeW4LaGWHyYvhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=681055c5 cx=c_pps a=RoG0BMNHDmmKSZcrvsSD+g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=J2LgeTDbxvvCJw0laH0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GnMsEqObeAHBW8TiJWYHwOM21FXc2KxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzMSBTYWx0ZWRfXzUnT4+keBvNt DbOd76xpxYWExujDGOB6Vl7kxMZfATMZboFBMn3ipcPgI48cJQfbTqDlJXSNj6ac6E0hMxX9LFW e23CDym+eQQZZ3Nw/zaTNwSZ2wka/8xnrTjElOEkozsiYpNRutPvFTl93yVgjJF8n+23iUzR5mu
 H+z1iL0oG/EiCPeBUK3wHwx8a9X+uNVyaDef2C3ZIZiyUkKliAJ7hdHLbleP+BwWZuAtiwq1B3o 5976FDQullmKosADsPg+aJ4A3ZAh3T5ytKyBEdmigUdiL9v54PwFrvUgFsksS0Mzqb8Pec/wrRy 4Bn8ZjQL6y6j3TZeVOx15UrDe6wWmC5wavoUfb7afPk+G8lhVtmZn2gTdw+Bte5/zVARaLeTKA4
 ds+QfSorVF8/iw5jnT+N482JzxZZD5X+qZ1uHL2t8DzdEk3OihEvpUkKrOLkbfON/niH5vme
X-Proofpoint-GUID: GnMsEqObeAHBW8TiJWYHwOM21FXc2KxR
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504290031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 04:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215649

From: Chen Qi <Qi.Chen@windriver.com>

Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are
generally useful.

The qemu.bbclass is still kept, and recipes can continue to use functions
from it, though they have become wrapper functions on qemu.py functions.

Note that the QEMU_OPTIONS settings are still kept in qemu.bbclass.
This sets a clear barrier for people to use qemu user mode.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/qemu.bbclass | 42 ++-----------------------
 meta/lib/oe/__init__.py          |  2 +-
 meta/lib/oe/qemu.py              | 54 ++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 40 deletions(-)
 create mode 100644 meta/lib/oe/qemu.py

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index e9fe757c7f..f83faf8049 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -10,48 +10,13 @@
 #
 
 def qemu_target_binary(data):
-    package_arch = data.getVar("PACKAGE_ARCH")
-    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
-    if qemu_target_binary:
-        return qemu_target_binary
-
-    target_arch = data.getVar("TARGET_ARCH")
-    if target_arch in ("i486", "i586", "i686"):
-        target_arch = "i386"
-    elif target_arch == "powerpc":
-        target_arch = "ppc"
-    elif target_arch == "powerpc64":
-        target_arch = "ppc64"
-    elif target_arch == "powerpc64le":
-        target_arch = "ppc64le"
-
-    return "qemu-" + target_arch
+    return oe.qemu.qemu_target_binary(data)
 
 def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
-    import string
-
-    qemu_binary = qemu_target_binary(data)
-    if qemu_binary == "qemu-allarch":
-        qemu_binary = "qemuwrapper"
-
-    qemu_options = data.getVar("QEMU_OPTIONS") or ""
-
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
-            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+    return oe.qemu.qemu_wrapper_cmdline(data, rootfs_path, library_paths)
 
-# Next function will return a string containing the command that is needed to
-# to run a certain binary through qemu. For example, in order to make a certain
-# postinstall scriptlet run at do_rootfs time and running the postinstall is
-# architecture dependent, we can run it through qemu. For example, in the
-# postinstall scriptlet, we could use the following:
-#
-# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
-#
 def qemu_run_binary(data, rootfs_path, binary):
-    libdir = rootfs_path + data.getVar("libdir", False)
-    base_libdir = rootfs_path + data.getVar("base_libdir", False)
-
-    return qemu_wrapper_cmdline(data, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
+    return oe.qemu.qemu_run_binary(data, rootfs_path, binary)
 
 # QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
 # PACKAGE_ARCH, *NOT* overrides.
@@ -59,6 +24,5 @@ def qemu_run_binary(data, rootfs_path, binary):
 # enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
-
 QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index a55694669d..dd094a874a 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -10,6 +10,6 @@ __path__ = extend_path(__path__, __name__)
 # Modules with vistorcode need to go first else anything depending on them won't be
 # processed correctly (e.g. qa)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
-             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
+             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
              "cve_check"]
diff --git a/meta/lib/oe/qemu.py b/meta/lib/oe/qemu.py
new file mode 100644
index 0000000000..769865036c
--- /dev/null
+++ b/meta/lib/oe/qemu.py
@@ -0,0 +1,54 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+def qemu_target_binary(d):
+    package_arch = d.getVar("PACKAGE_ARCH")
+    qemu_target_binary = (d.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
+    if qemu_target_binary:
+        return qemu_target_binary
+
+    target_arch = d.getVar("TARGET_ARCH")
+    if target_arch in ("i486", "i586", "i686"):
+        target_arch = "i386"
+    elif target_arch == "powerpc":
+        target_arch = "ppc"
+    elif target_arch == "powerpc64":
+        target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
+
+    return "qemu-" + target_arch
+
+def qemu_wrapper_cmdline(d, rootfs_path, library_paths, qemu_options=None):
+    import string
+
+    package_arch = d.getVar("PACKAGE_ARCH")
+    if package_arch == "all":
+        return "false"
+
+    qemu_binary = qemu_target_binary(d)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
+    if qemu_options == None:
+        qemu_options = d.getVar("QEMU_OPTIONS") or ""
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+
+# Next function will return a string containing the command that is needed to
+# to run a certain binary through qemu. For example, in order to make a certain
+# postinstall scriptlet run at do_rootfs time and running the postinstall is
+# architecture dependent, we can run it through qemu. For example, in the
+# postinstall scriptlet, we could use the following:
+#
+# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
+#
+def qemu_run_binary(d, rootfs_path, binary):
+    libdir = rootfs_path + d.getVar("libdir", False)
+    base_libdir = rootfs_path + d.getVar("base_libdir", False)
+
+    return qemu_wrapper_cmdline(d, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
-- 
2.34.1


