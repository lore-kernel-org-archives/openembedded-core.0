Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108A9E77184
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 01:29:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.96450.1734485383569550720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 17:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2082a9dab6=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHNJiRc002613
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 01:29:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h1093w8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 01:29:42 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BI1TfdW030570
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 01:29:41 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h1093w8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 01:29:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgDbMPpYMBSTeoMdcYLR0zvY6zmRtCNNgS274xifUCcNQOjdUQ00ZRnOmWFHVJUQJ5PNVXD2kp5/84/v3PRhp4n4yPofN/4cZnFY9CST1feMevTgX84qxyD84FykN5sHbYaupBQ/L67mCbdno6Vm7z0tkKuGQbikEJbOSrSGXQtYvQ+KJPaDjKsfa90r95HaTcnNsAFsatsJC9hWRSocZIvLfY+bTEstH2/pRqugWBmgNp/rwGiS+LJPyoB7bxOazqLYoBJhmKk1X4IRK2wEapFC6mcqH4aJlB0oE9mwo1uw93nlTD37QLuAVOWqlH8QageHK2qkXIkudQCo1J923A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nhiA0z24/nXve9PqI029FYyTLoGnYfU9maVVM+R40E=;
 b=gaMAiP2wM7M0I1/i9jnUmWWxDrjd2vIboWI4Acw5/5HCxX1g/3AJenOAvBpVz5pAS73TmBp6Tjm2DqhXpxyGGns+vMU9wUT9xETkqR5cPeERtpPh09M4/nZTsw1hDr1Y+lFVMFbV57h7DSvcgxSTZGNh97K4EKySKvbHKfEOQZsGJHVaT2gGev/Pa0WC9ttNVXywSctzKYsbxBtnVKagFEKoU6vLKWJDTHF6iwxkQSuA78zxow4R8BBgazWOUDDhglhQfvWa2XESMCpWlnagvAwGFsRvO7/o0E+BVHcX6/hbfgyyWaA6JSW8GdDlOnakf92cgLwXOvbaGENsJHrl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 01:29:36 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 01:29:36 +0000
From: Bin Lan <bin.lan.cn@windriver.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Subject: [OE-core][PATCH v2] gcc: backport patch to fix data relocation to !ENDBR: stpcpy
Date: Wed, 18 Dec 2024 09:29:20 +0800
Message-ID: <20241218012920.1952723-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 052c8ffb-de86-4355-ef54-08dd1f036e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ej2KprE6cKjwO6zGUEHaSiElZXyY67knGeXZ4VxPV9tWljaNwVew7spPHyNf?=
 =?us-ascii?Q?3JuVO1FwJWHRXIiCJ0melIadCue02jRgSpMf5fLJvpPLnBl2UWeLk5ZpTBcm?=
 =?us-ascii?Q?c4KYe31zyTETdvsgs8SrvGr1mLUGxvHSz2QTCEN4mswb8kSgW8yTsHicSWcc?=
 =?us-ascii?Q?yd60BE5NuBfMdcmEW/464VQata0VplC+Jzf+QMxc0hVR8pQoFtdB6bfg6A3w?=
 =?us-ascii?Q?LpUPWxPDbGuBZZ9Vw/w1TsmdL4FQTTaVDKQEYqtou6kglip6ASX7ZXj9YMSm?=
 =?us-ascii?Q?4rWQCg5OjcVQiotSMUW+Yf2JMIptevYx9cij1EZG9+GA0PCDIFhCMT5WYVoi?=
 =?us-ascii?Q?7KZWJWyeWIyeY80Z2e6uWwqY1YMHw8/+1K5527RLhyfcnXSW7BFcB0QE2Iq6?=
 =?us-ascii?Q?tXptpaAJ3q0w7Io6Dg/EejLObOTO/Jpk0d3I1Pb3S58J+P1r+kuVn96AQvfy?=
 =?us-ascii?Q?G3RV6e7AXxmyeKFbxFCdHUAKW9uASZqb234jlmkwkyrKFP6qf+efYEmFg01g?=
 =?us-ascii?Q?WRIDe0cCcwJ46kBSGDnxNc2WeCT0qf9bpFXkGbzsUY3Mg/IK1AfpOLKcJQPt?=
 =?us-ascii?Q?JlGYIsXiCy/6K3tUdav6SVYOVdjxYj+hEP/ZTMyFXQv68QE1eosU3NGRPMUz?=
 =?us-ascii?Q?aIxau857jLQjf6jHw1aDgIVZDTaMcNMkW9FuZqqAt1YsnVvDNvbUIqSGLLCR?=
 =?us-ascii?Q?9cRVVjOgkBWpFZBA1xhulbDW6IwWOISFqWnkNd6fCpwgzxXPdstfj5L81aWq?=
 =?us-ascii?Q?DuW/TdScE/8C76JnsdcKOy6TC+VsII8e9Ti4l/fKCDlBk3mP27QCCpZdijFg?=
 =?us-ascii?Q?ckzxZMev2p/uQHPxbmQolgdeFZzEEPcbKw+JBK2az6b1YL8Rd1zAlrqj5soD?=
 =?us-ascii?Q?qJKHDajxeHyiWBtvEFu2r4N48wqt0toKnEY9dYDlyD5z5yVznjt6AdCVFO7S?=
 =?us-ascii?Q?0LTk9/DRj33iByE0nr/q2VQ0QkgR4nzW+uYjnQ5vzwXJxl9o8hapnyDvu3F/?=
 =?us-ascii?Q?AnT8qbfIkSjOu6JS6m1uUcoyWzFj8PL1TX1dw8wZFTMmvJyOItAocg7jO9rj?=
 =?us-ascii?Q?vH03RWA+1dPzXJilNYT2C+ttmOTskWVfRuP/ekB6FtHq7UWjDcO59ZnMT0Is?=
 =?us-ascii?Q?b+wDroUjU0NFIzfTX/pSuk5BGCYu/br9yy6cWA6kQVSFk968RXRKg0F4F31x?=
 =?us-ascii?Q?MLQFBwP4Lw3dj2hRBxTKpP5tLy5cPD0P+7NSd199z3/aORfNuVeXcgdv/78Z?=
 =?us-ascii?Q?lTeesKHtDPN6Ywzurmfb34dgfLBLUwqcVH1HqGhfWgI/PnJ4psASrSV0Nliu?=
 =?us-ascii?Q?Bxe4ROYbj5sNqLw2r3ewSjliRbNLs++tCp9rydvSS0gnBSbpPMvHTmk6APtv?=
 =?us-ascii?Q?Ra0TITuAgifSdEPpCXxuhrkBhhxljMoXpByRiBtKz0sRwfZTRg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hPjGrv+m/5aClfONtBDumOQ8zPprXW7AvHTNlOjfk3gI87kwSbEpEV1mmQfF?=
 =?us-ascii?Q?tOjWkmbjgmfUkQ/KbHaahZ96V63WUZfNW/5GZrAN2MulW+g+Aw52DxPZi3ns?=
 =?us-ascii?Q?pvJIjCUI9Erq66TeVKK+Md8fBPi9RhvBAdd22xfsOUl/FNDAcoIj/i7Enz+w?=
 =?us-ascii?Q?QYABMOUcMBcfAR9UAZ5Mn7bCZ3YGyB/0v+HYAeL9ZVu9vBVzqRlKlBu/qB0J?=
 =?us-ascii?Q?ig6pnrZIAu0bViYpHwru2Z896CnoPcLr0ikZpSIJxxuMxUSDMRjNs93dRbbs?=
 =?us-ascii?Q?VTr+rkfSRbeQJFRwmA90+hqrIVz/n6pCbZ+Aj7671TNIpm9FIhNsBFO94MYn?=
 =?us-ascii?Q?78psPEwtDPbvL0zsT2ZMtuTP3qT6fCNnjaqb98ajUXds2f0y0XrFXBz0nEGg?=
 =?us-ascii?Q?NLPRQQDsCVSSv0C8Q7JMka2jTRdw1jczb0zUsXQ5kHnkY/Xjs2bP1kafBggW?=
 =?us-ascii?Q?xPifWTPhzqWjIslL0EB3bgGJQfR8CRVgTm58ZFUVxf2yVrHEyi0HjP7mWd+W?=
 =?us-ascii?Q?H0zk64X8aMd+I5nE2MKRQQopA65wCS0GiWIu9XzSeVU9aUSpo/DYW8z2qMd+?=
 =?us-ascii?Q?01ULXuVqt6PQHJwjp00YW+Yne8ei/tF1HMLSY58rrtWwLivf+0Va/eg24WmT?=
 =?us-ascii?Q?ioY6UW5yeqz9Ta8caeMfeNROVsm/kPCx3aYlEcSY8l4XX8NEC5qbYPYtcYez?=
 =?us-ascii?Q?tDhwyg+H/coKVKanzMXCRIO9idOyWivvbz9hNarHnK4ZwCT3WKJRj3ZX92ra?=
 =?us-ascii?Q?8NU/p6tpF63viySo3S1wpIZR6WapdOP78CH824kboS7D2RO2W7HQbPP7cngE?=
 =?us-ascii?Q?dK5TlTSJv2CxWcXjNG782zfNQG18Q+4xcWXzWMjEcJabMkiCIfx5u6xpdILU?=
 =?us-ascii?Q?eYEw4TjsFnReanuduTqFU7ksiKX50Q7NUIl45lMV/xdsSogO4fOH3N+QpWd9?=
 =?us-ascii?Q?70plgiSfdqJ5X38HEeCzNaffAGxApO4YCpLYI06Meea7cgf5cOXp0bu4UxL/?=
 =?us-ascii?Q?PA2IHvKY/QfoqAY7et3rrOm+128qqftG7UvLybtnBV+7GoNcmgys5YX97WuE?=
 =?us-ascii?Q?QUr5TuePBwN021Yv7NnaxUu3T8PJdn+9O80tS3i8t3cEn9BSkYXewgCa/e/F?=
 =?us-ascii?Q?o8/S298Lu93AXs08knMJw/4u4HDvqPLH59aT3vHpOj7rqQo+tzhnFu7/dd4m?=
 =?us-ascii?Q?wJl6brdrtuG6+91QtctXeJv7d5LF/Hjq3HuTJY0N1kkUKexktDgYENWHkVUJ?=
 =?us-ascii?Q?6SRR0ChbAPpfsutLn9+gomrw+zAr/exdJ0SW3A/e19yYizwrQLdxQkWdSP+A?=
 =?us-ascii?Q?JYHGI1nOwZnriK/JfsyI7SxzWLFORQXOowSno3bWWH2MXsWXjHWjanmyGFXL?=
 =?us-ascii?Q?Hvy2Gm7DLahf6lQhdG1XoCu/2gl2FrkB38hFUahmRzg1Q1g+UnR0oGYm+BH7?=
 =?us-ascii?Q?FmHBZqfcEtGOPhJNcwGi9dfFZWhYkvoq6UFDUWBrC2vgmx/NG3joybKH1WoL?=
 =?us-ascii?Q?rvpCDzZpcgJyBfoir6E/UmEjZmTF/I7R79r+jFBmPDvdRbSeuMnCXN6OCqrt?=
 =?us-ascii?Q?ijES4IQ738cotxHMBvzi9m6ynVf/sgr+/C4g22uo001l75HjvSW6n1aAb6hA?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052c8ffb-de86-4355-ef54-08dd1f036e90
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 01:29:36.0028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi9bVlGOQ/l7VeKejww2/n4/bSDoc0Ohn6olrQuEKy0MgoZNXk/WxY64LC2Z7+D884lwKdq/erJKWBjB/aC2xHtz9XAZA5V/K9+65LeR1sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
X-Authority-Analysis: v=2.4 cv=bp62BFai c=1 sm=1 tr=0 ts=67622586 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=2TEoGLMWpZZl8GtFneoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PGJ7uHULzd2rfCuqSKaE4TOseW7eAhxt
X-Proofpoint-GUID: NTt4gDM3rJUi2S1IH8m5CJgmvCeDNLrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-18_01,2024-12-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412180008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 01:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208866

There is the following warning when building linux-yocto with
default configuration on x86-64 with gcc-14.2:
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  vmlinux.o: warning: objtool: .export_symbol+0x332a0: data relocation to !ENDBR: stpcpy+0x0

This change set removes the warning.

PR target/116174 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116174]

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   3 +-
 ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 ++++++++++++++++++
 2 files changed, 449 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index 4f505bef68..1cf079ae75 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -68,7 +68,8 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
+           file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
+           file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch b/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
new file mode 100644
index 0000000000..5bede60816
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
@@ -0,0 +1,447 @@
+From 4e7735a8d87559bbddfe3a985786996e22241f8d Mon Sep 17 00:00:00 2001
+From: liuhongt <hongtao.liu@intel.com>
+Date: Mon, 12 Aug 2024 14:35:31 +0800
+Subject: [PATCH] Move ix86_align_loops into a separate pass and insert the
+ pass after pass_endbr_and_patchable_area.
+
+gcc/ChangeLog:
+
+	PR target/116174
+	* config/i386/i386.cc (ix86_align_loops): Move this to ..
+	* config/i386/i386-features.cc (ix86_align_loops): .. here.
+	(class pass_align_tight_loops): New class.
+	(make_pass_align_tight_loops): New function.
+	* config/i386/i386-passes.def: Insert pass_align_tight_loops
+	after pass_insert_endbr_and_patchable_area.
+	* config/i386/i386-protos.h (make_pass_align_tight_loops): New
+	declare.
+
+gcc/testsuite/ChangeLog:
+
+	* gcc.target/i386/pr116174.c: New test.
+
+(cherry picked from commit c3c83d22d212a35cb1bfb8727477819463f0dcd8)
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=4e7735a8d87559bbddfe3a985786996e22241f8d]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ gcc/config/i386/i386-features.cc         | 191 +++++++++++++++++++++++
+ gcc/config/i386/i386-passes.def          |   3 +
+ gcc/config/i386/i386-protos.h            |   1 +
+ gcc/config/i386/i386.cc                  | 146 -----------------
+ gcc/testsuite/gcc.target/i386/pr116174.c |  12 ++
+ 5 files changed, 207 insertions(+), 146 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/pr116174.c
+
+diff --git a/gcc/config/i386/i386-features.cc b/gcc/config/i386/i386-features.cc
+index e3e004d55267..7de19d423637 100644
+--- a/gcc/config/i386/i386-features.cc
++++ b/gcc/config/i386/i386-features.cc
+@@ -3253,6 +3253,197 @@ make_pass_remove_partial_avx_dependency (gcc::context *ctxt)
+   return new pass_remove_partial_avx_dependency (ctxt);
+ }
+ 
++/* When a hot loop can be fit into one cacheline,
++   force align the loop without considering the max skip.  */
++static void
++ix86_align_loops ()
++{
++  basic_block bb;
++
++  /* Don't do this when we don't know cache line size.  */
++  if (ix86_cost->prefetch_block == 0)
++    return;
++
++  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
++  profile_count count_threshold = cfun->cfg->count_max / param_align_threshold;
++  FOR_EACH_BB_FN (bb, cfun)
++    {
++      rtx_insn *label = BB_HEAD (bb);
++      bool has_fallthru = 0;
++      edge e;
++      edge_iterator ei;
++
++      if (!LABEL_P (label))
++	continue;
++
++      profile_count fallthru_count = profile_count::zero ();
++      profile_count branch_count = profile_count::zero ();
++
++      FOR_EACH_EDGE (e, ei, bb->preds)
++	{
++	  if (e->flags & EDGE_FALLTHRU)
++	    has_fallthru = 1, fallthru_count += e->count ();
++	  else
++	    branch_count += e->count ();
++	}
++
++      if (!fallthru_count.initialized_p () || !branch_count.initialized_p ())
++	continue;
++
++      if (bb->loop_father
++	  && bb->loop_father->latch != EXIT_BLOCK_PTR_FOR_FN (cfun)
++	  && (has_fallthru
++	      ? (!(single_succ_p (bb)
++		   && single_succ (bb) == EXIT_BLOCK_PTR_FOR_FN (cfun))
++		 && optimize_bb_for_speed_p (bb)
++		 && branch_count + fallthru_count > count_threshold
++		 && (branch_count > fallthru_count * param_align_loop_iterations))
++	      /* In case there'no fallthru for the loop.
++		 Nops inserted won't be executed.  */
++	      : (branch_count > count_threshold
++		 || (bb->count > bb->prev_bb->count * 10
++		     && (bb->prev_bb->count
++			 <= ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))))
++	{
++	  rtx_insn* insn, *end_insn;
++	  HOST_WIDE_INT size = 0;
++	  bool padding_p = true;
++	  basic_block tbb = bb;
++	  unsigned cond_branch_num = 0;
++	  bool detect_tight_loop_p = false;
++
++	  for (unsigned int i = 0; i != bb->loop_father->num_nodes;
++	       i++, tbb = tbb->next_bb)
++	    {
++	      /* Only handle continuous cfg layout. */
++	      if (bb->loop_father != tbb->loop_father)
++		{
++		  padding_p = false;
++		  break;
++		}
++
++	      FOR_BB_INSNS (tbb, insn)
++		{
++		  if (!NONDEBUG_INSN_P (insn))
++		    continue;
++		  size += ix86_min_insn_size (insn);
++
++		  /* We don't know size of inline asm.
++		     Don't align loop for call.  */
++		  if (asm_noperands (PATTERN (insn)) >= 0
++		      || CALL_P (insn))
++		    {
++		      size = -1;
++		      break;
++		    }
++		}
++
++	      if (size == -1 || size > ix86_cost->prefetch_block)
++		{
++		  padding_p = false;
++		  break;
++		}
++
++	      FOR_EACH_EDGE (e, ei, tbb->succs)
++		{
++		  /* It could be part of the loop.  */
++		  if (e->dest == bb)
++		    {
++		      detect_tight_loop_p = true;
++		      break;
++		    }
++		}
++
++	      if (detect_tight_loop_p)
++		break;
++
++	      end_insn = BB_END (tbb);
++	      if (JUMP_P (end_insn))
++		{
++		  /* For decoded icache:
++		     1. Up to two branches are allowed per Way.
++		     2. A non-conditional branch is the last micro-op in a Way.
++		  */
++		  if (onlyjump_p (end_insn)
++		      && (any_uncondjump_p (end_insn)
++			  || single_succ_p (tbb)))
++		    {
++		      padding_p = false;
++		      break;
++		    }
++		  else if (++cond_branch_num >= 2)
++		    {
++		      padding_p = false;
++		      break;
++		    }
++		}
++
++	    }
++
++	  if (padding_p && detect_tight_loop_p)
++	    {
++	      emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (size)),
++						    GEN_INT (0)), label);
++	      /* End of function.  */
++	      if (!tbb || tbb == EXIT_BLOCK_PTR_FOR_FN (cfun))
++		break;
++	      /* Skip bb which already fits into one cacheline.  */
++	      bb = tbb;
++	    }
++	}
++    }
++
++  loop_optimizer_finalize ();
++  free_dominance_info (CDI_DOMINATORS);
++}
++
++namespace {
++
++const pass_data pass_data_align_tight_loops =
++{
++  RTL_PASS, /* type */
++  "align_tight_loops", /* name */
++  OPTGROUP_NONE, /* optinfo_flags */
++  TV_MACH_DEP, /* tv_id */
++  0, /* properties_required */
++  0, /* properties_provided */
++  0, /* properties_destroyed */
++  0, /* todo_flags_start */
++  0, /* todo_flags_finish */
++};
++
++class pass_align_tight_loops : public rtl_opt_pass
++{
++public:
++  pass_align_tight_loops (gcc::context *ctxt)
++    : rtl_opt_pass (pass_data_align_tight_loops, ctxt)
++  {}
++
++  /* opt_pass methods: */
++  bool gate (function *) final override
++    {
++      return optimize && optimize_function_for_speed_p (cfun);
++    }
++
++  unsigned int execute (function *) final override
++    {
++      timevar_push (TV_MACH_DEP);
++#ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
++      ix86_align_loops ();
++#endif
++      timevar_pop (TV_MACH_DEP);
++      return 0;
++    }
++}; // class pass_align_tight_loops
++
++} // anon namespace
++
++rtl_opt_pass *
++make_pass_align_tight_loops (gcc::context *ctxt)
++{
++  return new pass_align_tight_loops (ctxt);
++}
++
+ /* This compares the priority of target features in function DECL1
+    and DECL2.  It returns positive value if DECL1 is higher priority,
+    negative value if DECL2 is higher priority and 0 if they are the
+diff --git a/gcc/config/i386/i386-passes.def b/gcc/config/i386/i386-passes.def
+index 7d96766f7b96..e500f15c9971 100644
+--- a/gcc/config/i386/i386-passes.def
++++ b/gcc/config/i386/i386-passes.def
+@@ -31,5 +31,8 @@ along with GCC; see the file COPYING3.  If not see
+   INSERT_PASS_BEFORE (pass_cse2, 1, pass_stv, true /* timode_p */);
+ 
+   INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_insert_endbr_and_patchable_area);
++  /* pass_align_tight_loops must be after pass_insert_endbr_and_patchable_area.
++     PR116174.  */
++  INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_align_tight_loops);
+ 
+   INSERT_PASS_AFTER (pass_combine, 1, pass_remove_partial_avx_dependency);
+diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-protos.h
+index 46214a63974d..36c7b1aed42b 100644
+--- a/gcc/config/i386/i386-protos.h
++++ b/gcc/config/i386/i386-protos.h
+@@ -419,6 +419,7 @@ extern rtl_opt_pass *make_pass_insert_endbr_and_patchable_area
+   (gcc::context *);
+ extern rtl_opt_pass *make_pass_remove_partial_avx_dependency
+   (gcc::context *);
++extern rtl_opt_pass *make_pass_align_tight_loops (gcc::context *);
+ 
+ extern bool ix86_has_no_direct_extern_access;
+ 
+diff --git a/gcc/config/i386/i386.cc b/gcc/config/i386/i386.cc
+index 6f89891d3cb5..288c69467d62 100644
+--- a/gcc/config/i386/i386.cc
++++ b/gcc/config/i386/i386.cc
+@@ -23444,150 +23444,6 @@ ix86_split_stlf_stall_load ()
+     }
+ }
+ 
+-/* When a hot loop can be fit into one cacheline,
+-   force align the loop without considering the max skip.  */
+-static void
+-ix86_align_loops ()
+-{
+-  basic_block bb;
+-
+-  /* Don't do this when we don't know cache line size.  */
+-  if (ix86_cost->prefetch_block == 0)
+-    return;
+-
+-  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
+-  profile_count count_threshold = cfun->cfg->count_max / param_align_threshold;
+-  FOR_EACH_BB_FN (bb, cfun)
+-    {
+-      rtx_insn *label = BB_HEAD (bb);
+-      bool has_fallthru = 0;
+-      edge e;
+-      edge_iterator ei;
+-
+-      if (!LABEL_P (label))
+-	continue;
+-
+-      profile_count fallthru_count = profile_count::zero ();
+-      profile_count branch_count = profile_count::zero ();
+-
+-      FOR_EACH_EDGE (e, ei, bb->preds)
+-	{
+-	  if (e->flags & EDGE_FALLTHRU)
+-	    has_fallthru = 1, fallthru_count += e->count ();
+-	  else
+-	    branch_count += e->count ();
+-	}
+-
+-      if (!fallthru_count.initialized_p () || !branch_count.initialized_p ())
+-	continue;
+-
+-      if (bb->loop_father
+-	  && bb->loop_father->latch != EXIT_BLOCK_PTR_FOR_FN (cfun)
+-	  && (has_fallthru
+-	      ? (!(single_succ_p (bb)
+-		   && single_succ (bb) == EXIT_BLOCK_PTR_FOR_FN (cfun))
+-		 && optimize_bb_for_speed_p (bb)
+-		 && branch_count + fallthru_count > count_threshold
+-		 && (branch_count > fallthru_count * param_align_loop_iterations))
+-	      /* In case there'no fallthru for the loop.
+-		 Nops inserted won't be executed.  */
+-	      : (branch_count > count_threshold
+-		 || (bb->count > bb->prev_bb->count * 10
+-		     && (bb->prev_bb->count
+-			 <= ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))))
+-	{
+-	  rtx_insn* insn, *end_insn;
+-	  HOST_WIDE_INT size = 0;
+-	  bool padding_p = true;
+-	  basic_block tbb = bb;
+-	  unsigned cond_branch_num = 0;
+-	  bool detect_tight_loop_p = false;
+-
+-	  for (unsigned int i = 0; i != bb->loop_father->num_nodes;
+-	       i++, tbb = tbb->next_bb)
+-	    {
+-	      /* Only handle continuous cfg layout. */
+-	      if (bb->loop_father != tbb->loop_father)
+-		{
+-		  padding_p = false;
+-		  break;
+-		}
+-
+-	      FOR_BB_INSNS (tbb, insn)
+-		{
+-		  if (!NONDEBUG_INSN_P (insn))
+-		    continue;
+-		  size += ix86_min_insn_size (insn);
+-
+-		  /* We don't know size of inline asm.
+-		     Don't align loop for call.  */
+-		  if (asm_noperands (PATTERN (insn)) >= 0
+-		      || CALL_P (insn))
+-		    {
+-		      size = -1;
+-		      break;
+-		    }
+-		}
+-
+-	      if (size == -1 || size > ix86_cost->prefetch_block)
+-		{
+-		  padding_p = false;
+-		  break;
+-		}
+-
+-	      FOR_EACH_EDGE (e, ei, tbb->succs)
+-		{
+-		  /* It could be part of the loop.  */
+-		  if (e->dest == bb)
+-		    {
+-		      detect_tight_loop_p = true;
+-		      break;
+-		    }
+-		}
+-
+-	      if (detect_tight_loop_p)
+-		break;
+-
+-	      end_insn = BB_END (tbb);
+-	      if (JUMP_P (end_insn))
+-		{
+-		  /* For decoded icache:
+-		     1. Up to two branches are allowed per Way.
+-		     2. A non-conditional branch is the last micro-op in a Way.
+-		  */
+-		  if (onlyjump_p (end_insn)
+-		      && (any_uncondjump_p (end_insn)
+-			  || single_succ_p (tbb)))
+-		    {
+-		      padding_p = false;
+-		      break;
+-		    }
+-		  else if (++cond_branch_num >= 2)
+-		    {
+-		      padding_p = false;
+-		      break;
+-		    }
+-		}
+-
+-	    }
+-
+-	  if (padding_p && detect_tight_loop_p)
+-	    {
+-	      emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (size)),
+-						    GEN_INT (0)), label);
+-	      /* End of function.  */
+-	      if (!tbb || tbb == EXIT_BLOCK_PTR_FOR_FN (cfun))
+-		break;
+-	      /* Skip bb which already fits into one cacheline.  */
+-	      bb = tbb;
+-	    }
+-	}
+-    }
+-
+-  loop_optimizer_finalize ();
+-  free_dominance_info (CDI_DOMINATORS);
+-}
+-
+ /* Implement machine specific optimizations.  We implement padding of returns
+    for K8 CPUs and pass to avoid 4 jumps in the single 16 byte window.  */
+ static void
+@@ -23611,8 +23467,6 @@ ix86_reorg (void)
+ #ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
+       if (TARGET_FOUR_JUMP_LIMIT)
+ 	ix86_avoid_jump_mispredicts ();
+-
+-      ix86_align_loops ();
+ #endif
+     }
+ }
+diff --git a/gcc/testsuite/gcc.target/i386/pr116174.c b/gcc/testsuite/gcc.target/i386/pr116174.c
+new file mode 100644
+index 000000000000..8877d0b51af1
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/pr116174.c
+@@ -0,0 +1,12 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fcf-protection=branch" } */
++
++char *
++foo (char *dest, const char *src)
++{
++  while ((*dest++ = *src++) != '\0')
++    /* nothing */;
++  return --dest;
++}
++
++/* { dg-final { scan-assembler "\t\.cfi_startproc\n\tendbr(32|64)\n" } } */
+-- 
+2.43.5
-- 
2.47.0


