Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66726C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 05:35:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43346.1744608918017556911
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 22:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5K7td015814
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hkvj-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjAk1Cy5tIHurOv08UIR+PKkRxy20X/MuH+s2wFqTYnVo6xLjKpzClRaQ9E+1g0UlF6PdhvXDSoQLQXAbNHbgczNVVbU6pXrj8fCqCkeZOcENAOivT24IJOLfChozovXhTDqCZ2bPl2oV7SC0fDn8vMk0SHQH60ODeuCwmhEefL6YR6iX8XKDIBmolFZv2V2my4Zwe4oDZv85LmYExOXEPA/Sw3BBoLsvneaANG4JpYU9csLy7PUX6mWUn8G9S6YKlZ0179tgllI9QJYzefCsEGXjlBzSNJmsRjW6sEnb8SO80kCtMjIHqHOQxDMM61KjS3SlucyPt8ZFep8tCmuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZnaNqMprSP0zsdqUjFyH1cobSGcvHfSOryOKDcYr3k=;
 b=RGSnqPz34H448vRi1QTZ3nfV41obpTJa+DXolLVOu5DD5sjsoltmYflvmNJ+vc7agA8StFth/Tq2x8t+qtML2gVPF23R6iNK6YTWN+9AwyNjXGpn2yx6TvvRnzTTp4+USSlazYQ4xD0X6PN6hyWXHiliD6RajuWJbdNQkVCypoNk09dkc+TZIQIWfe7EcGzqVDDIeL+jUXJtKhxkI/U1YT08XZskGU5piVk78X2Cdk7uadFo564idi1d+CPrt6OeHuA+X8AOqCqUhuV95qYHnWBNuctNlxTgZ4bXj5JMl2rdHB4ykYKb2kLYSHindkBBwZ6Kb3iFpFdkEkfhfDuDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF066A3CD44.namprd11.prod.outlook.com (2603:10b6:518:1::d07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 05:35:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 05:35:11 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3 5/5] lib/classes/recipes: refactor qemu.bbclass functions into library functions
Date: Sun, 13 Apr 2025 22:35:03 -0700
Message-ID: <20250414053503.1180029-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414053503.1180029-1-Qi.Chen@windriver.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF066A3CD44:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f87a4af-6bd2-4b2e-0cd3-08dd7b162017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5mR9LEKwq55Q5e0UVpZft/K0uhUV0P2Flk7AKDJPhnlUqCLlZjqLAGf5vEzo?=
 =?us-ascii?Q?MoEknz4R5C/88YXLDtjN42qPl03ut4fGkwD22IJtqSYa8+0mQ03FN9rRiPUR?=
 =?us-ascii?Q?+QgldpJcH7MiRuNZVtYFimcL1w2G9OIZYIsl/lssf7qD9E10/soNQ+YqbFHY?=
 =?us-ascii?Q?5mD4MRSQ2DGpnNrtB+rnb7lBBHGc2j4RWwawNi1GwK7IapOlG5QG4Pvzse5b?=
 =?us-ascii?Q?JP4pJY5lQWG+PVeW2lCvWcwDMzSIbjT5erWzcRFeXqN7A2/enmlDi8VwEnvQ?=
 =?us-ascii?Q?utU4mLPfBqSfEA0CgNMihOE91Aha38Zfdj+dA1TsgFoQ0j1bqgMtJ3wCz+Oj?=
 =?us-ascii?Q?gP+5FPRrfxI+RDm+CtazMGFS+emBb5ExxSoDtg0fQtg/l8sbw8XSGIbq/gn2?=
 =?us-ascii?Q?vm+pAXTIdZreJcOvQaC4gh1wLGMD4ua6f06IBZG3RWoR3SRmCEZHCEDKBy7P?=
 =?us-ascii?Q?nXolsVW/zTAsPuqbHaHVMu4ncLz23Ru6Mt/ndU2tnHU0ECtYxrmtGRVHIJN2?=
 =?us-ascii?Q?g9FmhqF+22FikDYv05Qt/BynD3+rtl4jJF6ALF8Wq/lWesLAcEzoIz5jwJV6?=
 =?us-ascii?Q?8pVAfsou0mKoEA0dgf5p7cs13+QTElKBfoubg1t+1YZBYdTkJjbZqy8G+jS7?=
 =?us-ascii?Q?G3ycbS0G1WpELvOXl7EojaI7JWx4S9Nyw2FoZy2U8we/b3X2oi0JVQ55KkSr?=
 =?us-ascii?Q?mdneMltfZuSFQyw1/6MORaYAXf+Fy5ysRemFNJ2AN6WU9dwQg8JetYeQY1fq?=
 =?us-ascii?Q?P4A2N2+RVSf3NbVDZw8BIx4PZ5WrffjGUltnu6AhuTJukQUY+q4YEBduxXgz?=
 =?us-ascii?Q?oP9Eol7lAqvLP//HfNjQwWv/wyGGoaZpb2ZffxKu5ckBhUHx9WMa5CUtPQ5o?=
 =?us-ascii?Q?KwIW1lHdD3ISC4QINoSrRH/0r44p4fvG+rkIOEtdzHcrl5xCzb7V1Cmkh612?=
 =?us-ascii?Q?BpopY2zfW3UIzIkXeLckkZ2kkVFBzFHdstG7H/qIFwDGbrt6mKNl6RPt74gy?=
 =?us-ascii?Q?U+SrwFTIUBe+ejOqta6dl7XIxs1zmqgGxK3zJTWc0obbH+pb0T3qJv0dpjG/?=
 =?us-ascii?Q?GA1s0XdCWETT4x3TrZkgH5i0dAhW/ucG611bLnq36vOVYAynX081HvaakP1g?=
 =?us-ascii?Q?lJ9b6K7lKoZamNEzozXPGwGp0fBh+oMgrCDMVrL+kI1spvj9Y72G65uMMrrv?=
 =?us-ascii?Q?AGDJk3V0AtlW61bS5hjGtE+Eie4wZyUIiSTQB9QxMG+kiADtWzzMhG0vav5r?=
 =?us-ascii?Q?7yvNROCdUq52Owb9w2YNUUGA7vuEge8jQz0vEdQYDlrHOn+oIQgCJQkAQQz7?=
 =?us-ascii?Q?nVSSYZ7kHGGKmpw7wwMrZW6bOt5Cjpz648roGRZ1B01MMDtXmvuz9HX0OWfs?=
 =?us-ascii?Q?AnzMb0NXKz5UC+PCY4qXQeFSI630aTNLyzphjh35bKgFbLfcEpxDN3Jd5x18?=
 =?us-ascii?Q?AVlTkgWVFEgI8lvFRJ4bwbO89vPtVa4A8bVrTKf2GZR6IW7gFSfTbA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yqi2kDHTUt1p5dOLegwKqqZ5yWi9795RN+lcamUxeGVum3lZgRcHyNB2vqSc?=
 =?us-ascii?Q?G3aKnXIH548KwmSSYCACKQZO5hSrYOfJqpkLMVf2Z7Oe1Da1BXXT4FZbKPwy?=
 =?us-ascii?Q?R6Kp6cr4a41tOeI8hKg8MZalafzCo5cGBvRxdlyFahaDMWuqCtQrOMm4Q9O1?=
 =?us-ascii?Q?NmfUgtRULuOxjDMVbzPZUQ1NTbuwzu8CBiGKrNA1dZSQMi6cxItIpC7tfapZ?=
 =?us-ascii?Q?zGBpog2bEL7JF1a6Q9pymydN0fCmYfGpQ9IoUhVztBJZPDW5VzepQHA1KIto?=
 =?us-ascii?Q?RepuPlsZ27X+Qh7DLvW84Hv/B+AOaPzd5mlVZIpMs6oXvcfdtziHT8sfjFrO?=
 =?us-ascii?Q?yYsUCl3uGdHvGED55grUuKLYPshZNPLP25whISsIwTOvSW+exxW4psCBBFEo?=
 =?us-ascii?Q?ORUmBaeW0pMyY7YkK+Tw11rOugEAhmJIep1zBew6kapPMn9h9WPFXiEIsUfa?=
 =?us-ascii?Q?CQknjhmxpiAxnznSpYFDPJm0FvodirHQodEU1+szw2M3OBY6b0vnMroGRZdC?=
 =?us-ascii?Q?rdTSWyj5L1/dttANOTVB+wWtvpjQs8K7jobC/e8dOr+gx1vL9A6YqRsGiqca?=
 =?us-ascii?Q?wdd4qox465JVDyKrclZTBvDxQLskuY2l5vpWe+qYGcCNBt3syU3LUgobqj+2?=
 =?us-ascii?Q?Ww4R1aeRxrhedGfoR8z1Sy6hj5t3MkZ/ZiKQC5vgcNLIYfSQEF1q3byT6ygi?=
 =?us-ascii?Q?TA4DJynwH9fP2VE1VpRuHmJwJVSbN5sF7hontap4pQPoz25QGAH4bmqtGf+J?=
 =?us-ascii?Q?DEIrWS1xw61UNwgJIqyRNwSANy4CZtFjQTIDbwVgD33eY/nGGdGV1fu3u2vj?=
 =?us-ascii?Q?GSi0FXtAXe/EUzyhYD0zJL0HtdE6GRTT3D90OJCv08+8oWPvCattVroUuIVQ?=
 =?us-ascii?Q?Tt34KktiQZSUnX2LSBshao/DmBAEZwuZ/Y3w47VM1XVKM/V2MiG+s0EJsFSx?=
 =?us-ascii?Q?s0ygARPqu9PBlCGErplqc5xZ9pfNkseQy+4T2h0YrdMXqkwGa6b/oSXB4YGR?=
 =?us-ascii?Q?oyL1fMW8LvFO/GUqqEoHpNh5sh314weCZrMTrJKHaBGDAm9fbagNYzbsoIs7?=
 =?us-ascii?Q?XY3v3v6inMeS8KeN4fDe0wcQfiemrU2biDCl9a9gr0bP22t9ydRUixWn5aNf?=
 =?us-ascii?Q?BreAEaj7Yvq+yMesi/OPy0gfSFTcHJ2yh+s40WJukJmWp0PL9OznrFFL5nym?=
 =?us-ascii?Q?whar9qFHp8ApPVMQzIBcwUG5Cvhqa9TW8vs8K8YK294w+BQ/3VVDL3QC+pyW?=
 =?us-ascii?Q?jTH+yAuqfBLe6TLyAOXI1md8HpOhPwv/out0TLAC6raxv1wdWCsZC6RvuVpr?=
 =?us-ascii?Q?6FrUDktKIys/QGHltz5KVn90YCmXQkhQ2nl3ZpNxj4EldqU5nTLbSQOdCGYS?=
 =?us-ascii?Q?F+WcRrVwGAR70lGhmMAFuYqwZTVjdhkmbLPBuWwMiQ8YfhUwvYILWdNtGVjD?=
 =?us-ascii?Q?7KbL86kDFskwdsfbPecG+TIO2+6iahAqa2S0SZdXCBt4BkJFTOE6Xg/WUsLi?=
 =?us-ascii?Q?TF4Kz1na1p9yjAzZGI+ywj1BRb2RtdG3HrBBEtVi4pwCX6kIF4gL20IDOdO4?=
 =?us-ascii?Q?TKW9k2Y/A2mQ5kpdHkVWbBD8mCoJk5Q3/UXRD1VXayNODKKHZIz40geh+j00?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f87a4af-6bd2-4b2e-0cd3-08dd7b162017
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 05:35:11.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7Z5nRdQ7gBLFNSIoOlIMMpPCMzAyxqlh0aT6gXjSjDiv//C61JqCu11qv8hNDVUkroa+R1EiwuH7jt4oZfPbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF066A3CD44
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fc9e95 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=05caZQWP-9MGXGHOnJUA:9 a=ILrxbXL7mD7Ha1I0:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GD1oj5q6vL4qOt8uzB5vYKaHTkRYBEvS
X-Proofpoint-ORIG-GUID: GD1oj5q6vL4qOt8uzB5vYKaHTkRYBEvS
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214796

From: Chen Qi <Qi.Chen@windriver.com>

Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are generally
useful. Add a deprecation notice in qemu.bbclass so that we can remove it in
the future.

The logic of re-definition of qemu_wrapper_cmdline in allarch.bbclass is moved to
qemu_wrapper_cmdine function.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/allarch.bbclass           |  2 -
 meta/classes-recipe/cmake-qemu.bbclass        |  4 +-
 meta/classes-recipe/gtk-doc.bbclass           |  4 +-
 meta/classes-recipe/libc-package.bbclass      |  4 +-
 meta/classes-recipe/meson.bbclass             |  4 +-
 meta/classes-recipe/qemu.bbclass              | 57 +++----------------
 meta/conf/bitbake.conf                        |  9 +++
 meta/lib/oe/__init__.py                       |  2 +-
 meta/lib/oe/qemu.py                           | 54 ++++++++++++++++++
 .../glibc/glibc-testsuite_2.41.bb             |  4 +-
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |  4 +-
 .../recipes-devtools/python/python3_3.13.2.bb |  4 +-
 .../qemu/qemuwrapper-cross_1.0.bb             |  4 +-
 .../gobject-introspection_1.84.0.bb           |  4 +-
 14 files changed, 87 insertions(+), 73 deletions(-)
 create mode 100644 meta/lib/oe/qemu.py

diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index e429b92437..fcaa580a4d 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -63,8 +63,6 @@ python () {
         d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
         d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
         d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
-
-        d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe/cmake-qemu.bbclass
index 383fc74bf2..7b988f45ed 100644
--- a/meta/classes-recipe/cmake-qemu.bbclass
+++ b/meta/classes-recipe/cmake-qemu.bbclass
@@ -14,7 +14,7 @@
 # with this use case in mind this works very nicely also out of an IDE
 # configured to use cmake-native for cross compiling.
 
-inherit qemu cmake
+inherit cmake
 
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
 
@@ -22,7 +22,7 @@ cmake_do_generate_toolchain_file:append:class-target() {
     if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
         # Write out a qemu wrapper that will be used as exe_wrapper so that cmake
         # can run target helper binaries through that. This also allows to execute ctest.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
         echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
         echo "$qemu_binary \"\$@\"" >> "${WORKDIR}/cmake-qemuwrapper"
         chmod +x "${WORKDIR}/cmake-qemuwrapper"
diff --git a/meta/classes-recipe/gtk-doc.bbclass b/meta/classes-recipe/gtk-doc.bbclass
index 9d3911966b..28c0adba0a 100644
--- a/meta/classes-recipe/gtk-doc.bbclass
+++ b/meta/classes-recipe/gtk-doc.bbclass
@@ -35,14 +35,14 @@ DEPENDS:append = " gtk-doc-native"
 
 export STAGING_DIR_HOST
 
-inherit python3native pkgconfig qemu
+inherit python3native pkgconfig
 DEPENDS:append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 do_compile:prepend:class-target () {
     if [ ${GTKDOC_ENABLED} = True ]; then
         # Write out a qemu wrapper that will be given to gtkdoc-scangobj so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/gtkdoc-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index c06a2ce90a..b6094adbb1 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -94,8 +94,6 @@ do_collect_bins_from_locale_tree() {
 	cross-localedef-hardlink -c -v ${WORKDIR}/locale-tree
 }
 
-inherit qemu
-
 python package_do_split_gconvs () {
     import re
     if (d.getVar('PACKAGE_NO_GCONV') == '1'):
@@ -284,7 +282,7 @@ python package_do_split_gconvs () {
             cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
                 (path, i18npath, gconvpath, localedef_opts)
         else: # earlier slower qemu way 
-            qemu = qemu_target_binary(d) 
+            qemu = oe.qemu.qemu_target_binary(d)
             localedef_opts = "--force --no-hard-links --no-archive --prefix=%s \
                 --inputfile=%s/i18n/locales/%s --charmap=%s %s" \
                 % (treedir, datadir, locale, encoding, name)
diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index cbfc45b94b..c4e764e620 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
+inherit python3native meson-routines
 
 DEPENDS:append = " meson-native ninja-native"
 
@@ -132,7 +132,7 @@ EOF
 write_qemuwrapper() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that meson
     # can run target helper binaries through that.
-    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
     cat > ${WORKDIR}/meson-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index e9fe757c7f..5b5a26dfc9 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -9,56 +9,17 @@
 # existence.
 #
 
-def qemu_target_binary(data):
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
+python () {
+    funcs = ["qemu_target_binary", "qemu_wrapper_cmdline", "qemu_run_binary"]
+    bb.warn("qemu.bbclass has been deprecated, please remove 'inherit qemu' and replace function invocation:\n\t%s" %
+            '\n\t'.join(["{0} -> oe.qemu.{0}".format(f) for f in funcs]))
+}
 
-    return "qemu-" + target_arch
+def qemu_target_binary(data):
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
-
-# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
-# PACKAGE_ARCH, *NOT* overrides.
-# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
-# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
-# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
-# qemu-arm default CPU supports all required architecture levels.
-
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
-QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+    return oe.qemu.qemu_run_binary(data, rootfs_path, binary)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 501808204e..b6215fd7ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -896,6 +896,15 @@ ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_THREADS"
 # may fallback to using all CPUs
 export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
 
+# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
+# PACKAGE_ARCH, *NOT* overrides.
+# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
+# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
+# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
+# qemu-arm default CPU supports all required architecture levels.
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
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
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.41.bb b/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
index 3a2764e40b..d5e3a2cb19 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
@@ -1,8 +1,6 @@
 require glibc_${PV}.bb
 require glibc-tests.inc
 
-inherit qemu
-
 SRC_URI += "file://check-test-wrapper"
 
 # strip provides
@@ -22,7 +20,7 @@ do_check:append () {
 
     oe_runmake -i \
         QEMU_SYSROOT="${RECIPE_SYSROOT}" \
-        QEMU_OPTIONS="${@qemu_target_binary(d)} ${QEMU_OPTIONS}" \
+        QEMU_OPTIONS="${@oe.qemu.qemu_target_binary(d)} ${QEMU_OPTIONS}" \
         SSH_HOST="${TOOLCHAIN_TEST_HOST}" \
         SSH_HOST_USER="${TOOLCHAIN_TEST_HOST_USER}" \
         SSH_HOST_PORT="${TOOLCHAIN_TEST_HOST_PORT}" \
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 3257f86907..42f7f244c3 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -1,5 +1,3 @@
-inherit qemu
-
 TOOLCHAIN_TEST_TARGET ??= "user"
 TOOLCHAIN_TEST_HOST ??= "localhost"
 TOOLCHAIN_TEST_HOST_USER ??= "root"
@@ -41,7 +39,7 @@ python check_prepare() {
         content.append('process_multilib_options ""')
 
         # qemu args
-        qemu_binary = qemu_target_binary(d)
+        qemu_binary = oe.qemu.qemu_target_binary(d)
         if not qemu_binary:
             bb.fatal("Missing target qemu linux-user binary")
 
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 0f0505c66c..30835796e9 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -57,7 +57,7 @@ S = "${WORKDIR}/Python-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
+inherit autotools pkgconfig ptest multilib_header update-alternatives
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
@@ -168,7 +168,7 @@ write_pgo_wrapper() {
                 cat >pgo-wrapper <<EOF
 #!/bin/sh
 cd ${B}
-${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])} "\$@"
+${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])} "\$@"
 EOF
                 chmod +x pgo-wrapper
         fi
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 6d0e7883ad..9fe43a6ce2 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -7,14 +7,12 @@ UNPACKDIR = "${S}"
 
 DEPENDS += "qemu-native"
 
-inherit qemu
-
 do_populate_sysroot[depends] = ""
 
 do_install () {
 	install -d ${D}${bindir_crossscripts}/
 
-	qemu_binary=${@qemu_target_binary(d)}
+	qemu_binary=${@oe.qemu.qemu_target_binary(d)}
 	qemu_options='${QEMU_OPTIONS} -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir}'
 
 	cat >> ${D}${bindir_crossscripts}/${MLPREFIX}qemuwrapper << EOF
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
index ac5f4e9370..3110c151a6 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit meson pkgconfig gtk-doc python3targetconfig qemu gobject-introspection-data upstream-version-is-even multilib_script
+inherit meson pkgconfig gtk-doc python3targetconfig gobject-introspection-data upstream-version-is-even multilib_script
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
@@ -64,7 +64,7 @@ do_configure:prepend:class-native() {
 do_configure:prepend:class-target() {
         # Write out a qemu wrapper that will be given to gi-scanner so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/g-ir-scanner-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
-- 
2.49.0


