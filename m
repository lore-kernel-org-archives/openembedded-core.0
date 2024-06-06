Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90807C41513
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 12:20:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12910.1717676436427707118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 05:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=68873e2400=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4563mMjn021165
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jun 2024 12:20:35 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxd8aj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:20:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TggwFYg2fXUbB+cXK+fpA0ZEH/RQ3DjQ7kKYnP+ydYq1R6db0WBCNF+ra9fj5czEsMdeIcmcowPGAqRUEoKsCfPdE2HwF9b4+3rm3xX7wYBdp8jiCObgMOBkocUMrq7Dx2d/0mkpFLXE8tXld4v2br4xkpnWoSQg0KxwsMo99MSHMcT/DZvtOMML04clrMiNrfUiZiVBpNuNbplJSsuws+b+ojhJ736Fhg7jqgbwoGFExNGxNOfKu3RKvH6jZQCMz5GiA3T37tCoPVjsftPUT1OMc7FMgxfCWJfc7Dv+xwgQmBBco8+hWMV69GQGlegJQlTJYTxR6inmul/6kIsxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqKr6/hShdqMKByR+J46Y72t87WBe8THmylAcl04r0U=;
 b=ZAntZcW30zbcmZcDpI2SODfmK+fatsjRdsAh+/9O5apI/59pE55tsiIGDWshYgDguSLUx8hWXaaYYHbJtwFYHizGef3j9okyoOl0LVQw0COQ51L5Mo5FBI9Ch3Ny1TkFtmzIWCdHujIeEyB1dvIlICvzxarDUSzfE+BEakIcNnT/eeu6VzRYKM2HbSTgTWf78NB4y1Iv4KgIiO+/gJIMpjWxl/KX6rtaPcSD9mJrnbr+tX/4BQswKUILxt7cTrhL5IhbZzJLRoyMcPwPvqwrp3Psf3Qx3eCNAmPF2Ats4xgeHUwe//PSJ7QmhHIXE2yWnqrCDk20SnRv8aFI3hHPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 6 Jun
 2024 12:20:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 12:20:32 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] findutils: upgrade from 4.9.0 to 4.10.0
Date: Thu,  6 Jun 2024 20:20:13 +0800
Message-Id: <20240606122013.145187-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606122013.145187-1-Qi.Chen@windriver.com>
References: <20240606122013.145187-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:404:14::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 317a2878-23ae-4787-68ca-08dc86230f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l2JXJCoYkP1hje6+NPlo1H4i35iJI7sTBtgKx4a2NrmeG7a6uZ+hZuJFEtLG?=
 =?us-ascii?Q?30ZEuMCdRLNmKOnDKmbS0qtWeOuU+Z2P0Z8sVacb6vJTPuaFKUmDSj/NTYzp?=
 =?us-ascii?Q?xsjpOgHlHEac+BK987zOt1DB3Cnh5VvWnSdfhSO5piRmLn+b48bnJ3eNkm3g?=
 =?us-ascii?Q?pPelTDRQXUSc89Ptm447T6fWgVpXQhuzE9ck4AODh1A2dwyN2DinDJht1BLF?=
 =?us-ascii?Q?OBoxHOAmIWdqYRdkK9RqTqT9pV5dxvTACwJr4B/ikOFmEux+WEKY4tH8ZEHq?=
 =?us-ascii?Q?s8Bc7MRoMQeMg/9xmsJ8tIN/vCJiT64gkalXRM1OT0Is0VY+7x2jPghEYvFS?=
 =?us-ascii?Q?PTt/KPlwkE0NPKtEY702rl55WxcVjlsGUmvdYOvToh0c8129JOYzcLE0aWka?=
 =?us-ascii?Q?1VWgK5apz0B3M6iLAFR0vfqb+gxNwRgopSYFe3eAiWxJljN3SOJPwi8a9Tf4?=
 =?us-ascii?Q?YKCL+k6bRv8ynhmMVn8DLMO49TMV1Y1GoBv+oBgME50yKTJ+i3xo8YjzkvvE?=
 =?us-ascii?Q?2nhZtw7ytMJKQ+mVr2EP3f0WhqWDUn9+iSEQsIMNJIaRVzw47tcv1nvbvMuR?=
 =?us-ascii?Q?FS7S0nVNysmvXFIB7C4nSR0MQZEutvDPZGGN1DhaExOwDqKEVxBcd2lS47I6?=
 =?us-ascii?Q?f6fjZNk6o8JthqsSu5zTsdIgQPJk6Kvcwyz2FheC7JmBVTPq0OUZl2nTRZ6O?=
 =?us-ascii?Q?OcD2AeoP70we1tAP4Yt684z9otzsir9j8AvPzW4pxy6VbvOk6XXUjgbEjH7M?=
 =?us-ascii?Q?CDUw2gyw9fCTMpMwPDP+zUQtGsFrj5urDvtSLbFpKSH+Mi7ZfJiYy4symmaf?=
 =?us-ascii?Q?lzj+YSY47MYrgyM7vXy2ycfPJBi6CdZ6jYJa49z9kxNayp5q5ze7niVZqPwh?=
 =?us-ascii?Q?82VPUyiRDEVCZmx5coPfX04on7m7EyNaTh4b2KGKh8ZoYb6ZDu/TRnp0/dPb?=
 =?us-ascii?Q?P+m+7m5WznP49yyBH1ZhkB1q2zIw+JebPdA3wITa9m/WdwQGj9+rrDe/v0cr?=
 =?us-ascii?Q?EFx9eBrlRuvUN1esqS0TAFoCqOoVIKLRstJ1uPNKfG06BaNY/Zmxwr7iNHbd?=
 =?us-ascii?Q?w3hHWF5CBvn9G4SubSNJ0mlj4peC79UiNFO5UCiRZ3//YzJF0V5/Y0yaRNup?=
 =?us-ascii?Q?gxIjQiYCSDXxUOCv6EEaW9i8jWv3IcCMs0oKnol/y02MO62KBpDAsoVSkUSN?=
 =?us-ascii?Q?vX+YLSuRunRIJ5NlEZEb1+OUUdjBlD0qBFfZbfTqhBJvUduFmt1ZDt8KcDJd?=
 =?us-ascii?Q?Cd5w63uJcwvTVjyKXTWAphANpbz9Mhsq8xTvwsYvA6UtnGNyo/S9siTZEw9X?=
 =?us-ascii?Q?MB61FXA0jiQZMjGzs0JrcT3y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DcA8EaQ4SDfaBFZwgjC1WlWzYEDWaZ+xFJx3WU9uqyB81EWSp7kS6zxVaK6T?=
 =?us-ascii?Q?Dl924R1D9WGMCtLTVepX8NjHb5hUNnjTOwXOtfo0e6f79+n8C9yMmnKHlpmv?=
 =?us-ascii?Q?HoA5KUvfwPPqkdv8w610ORxFa0QENB75B6yuuYUYGaOT978c+YC8nGZnbMar?=
 =?us-ascii?Q?uN3/5Q/VUJ28Wx5jOILglrhwjVl0dRl40uXFqryJbgaMuEAu4nIAZ8DnqJ+2?=
 =?us-ascii?Q?6ifJiE9+KGBrJPHLdQR34/WcyN6R4BmNUgTrUax7IXTaRcTEXHHuoAcJrFNu?=
 =?us-ascii?Q?e41tFfr5/bzPZcmVG1YniR6J6vlPI44Qb3FOVfMOyo4wz5SsxBvYjoPR3kYD?=
 =?us-ascii?Q?MJcf+IpB49gKbmCUAhyLAxSn9YsVDs+gGxWod6SdqFQ2tjiHbE2/H8sAV2pU?=
 =?us-ascii?Q?nE+NJJNrilSfGAWQwgp/qEAVdRvoj1p7jjw1xwofD/E2Deezifp5Rb8gGly5?=
 =?us-ascii?Q?6Uv6pWn6PNgh5dtBNX1l7mbZDohxWdR8BzF8GCvsqCzDFVVRus4no6KxI+OV?=
 =?us-ascii?Q?iGshfhRc1jigfiZNUE7OBTlCTW6cHC0IYKwgBiNbSx43DfjI+eiow0Hr+pJA?=
 =?us-ascii?Q?/PWKO/IGX9+eYojQaQteoj4yEBn8hz9AFDoxyGEWnqzDm4mECVMjCeQ+SLfg?=
 =?us-ascii?Q?z36FS8cT+whxAbe272M1V6GbUE9tTdlPqARlrRpVWDCkwr00+8J1l4fOOvSE?=
 =?us-ascii?Q?SM06HaJCWidgF6gOckbowAMtm5E0FRWRhtz+U4JmvrX+Lia9pLrzawbP+Nrn?=
 =?us-ascii?Q?Rxs+I+VkJnIyiH2hGXHAj27ucTpgk4naUt4nBZ1+W0aHDC7c1TJGmbTuwxTU?=
 =?us-ascii?Q?EyMGS3fSxErb+V1MqhKiq1FEXtlYF0ZfFdWun1cbBAXpL7GjQ1xZd6qkMlrc?=
 =?us-ascii?Q?zLrrurXhf8Ma8NFxgdb8NZABB+bu1o4/l0qJAp/dCZP7HXycBAvdcPFZlBCo?=
 =?us-ascii?Q?UfWZomkxLESK97giHRM/Js8q+cTWSgQ7fCaZnP9LZomi+ykVGbwPdUdLd4WL?=
 =?us-ascii?Q?1MjVxJ/XKnL3KIbDU1yJ+ox82QG1hTWWvsUYGSFWfheftAQTWGyeh+vw0Fxw?=
 =?us-ascii?Q?HvNmF9Ar6OqEIgO13ZfBZxN1wyRstcglQetJr/oxqB9YDxOM01vcXFJk5C9m?=
 =?us-ascii?Q?sTMrZIEh5psd42EoS8mUiKy4OHjiIqLXQEcbV2KjQ+vKfq9wjH+y9DNDj+/T?=
 =?us-ascii?Q?K+OKJjjW0vOO101MfEdQHltmIAHGhErMGomOwehCtREcXNkwkTbDieb5j/5V?=
 =?us-ascii?Q?js3j68GOrDMBShqPBKO9fYcshtVm1aZVfBfW7irlRijRKWPC9ncd11KuqqxO?=
 =?us-ascii?Q?w6S3jw9a4VL0pUVfjrVhpiI9REYCgwfL5hseVD2SgssnmubXvO1AHx2p+obm?=
 =?us-ascii?Q?UB/Awry1owL3S2s91d4Mck9Qa1yqqdXmd3kV5k60sDKeyovP1JDQWiySUxNW?=
 =?us-ascii?Q?VE6w08JBpujuu8c4oZL+Yxf+nvjsF4PZZsYk6bS1DcCMZnTFBlLweu8ftlS2?=
 =?us-ascii?Q?DLMk5/oErWX6ED+WLcSRLp4YLmxrgeUpsg6/FQ7XHFpw7p3Ca3nWQtcO9eFK?=
 =?us-ascii?Q?+ZQOa876i6OrnEPb9HXnzGslYSOkVQUULv54+AtT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317a2878-23ae-4787-68ca-08dc86230f2d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 12:20:32.2876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYFrrze4jm64kzSqPaWW6fr39St2O/uniL0l5NK6NmOXgYdWcWk4hb2OY2GjyWQ7t56PaulnFHkjAfxjS/MV1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
X-Proofpoint-ORIG-GUID: pycQflRdECb0i0kiRz9ddxLRZKn80xwi
X-Proofpoint-GUID: pycQflRdECb0i0kiRz9ddxLRZKn80xwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200399

From: Chen Qi <Qi.Chen@windriver.com>

autoconf-2.73.patch is dropped as it's not needed any more.

The run-ptest script is fixed. Instead copying function definitions
from init.cfg file, we should just install init.cfg file in the ptest
package. The coreutils-getlimits is added as a runtime dependency of
the ptest package because the getlimits command is needed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/findutils/findutils.inc |  1 -
 .../findutils/findutils/autoconf-2.73.patch   | 24 ----------------
 .../findutils/findutils/run-ptest             | 28 -------------------
 ...findutils_4.9.0.bb => findutils_4.10.0.bb} |  6 ++--
 4 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
 rename meta/recipes-extended/findutils/{findutils_4.9.0.bb => findutils_4.10.0.bb} (78%)

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 03cf2a8d72..ddcc05750b 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -7,7 +7,6 @@ BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
 SECTION = "console/utils"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
-          file://autoconf-2.73.patch \
           file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
deleted file mode 100644
index 63728b5f91..0000000000
--- a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-The gnulib largefile macro needs updating to work with autoconf 2.73. Rather
-than the full code:
-
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=f91f633858cf132e50924224c50d6264a92caabb
-
-Just tweak the exiting code to work with 2.73. The next findutils upgrade should
-update to new gnulib
-
-Upstream-Status: Inappropriate
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: findutils-4.9.0/gl/m4/largefile.m4
-===================================================================
---- findutils-4.9.0.orig/gl/m4/largefile.m4
-+++ findutils-4.9.0/gl/m4/largefile.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/recipes-extended/findutils/findutils/run-ptest
index ec71583c51..3dec117067 100644
--- a/meta/recipes-extended/findutils/findutils/run-ptest
+++ b/meta/recipes-extended/findutils/findutils/run-ptest
@@ -10,34 +10,6 @@ export built_programs="find xargs locate updatedb"
 # this gets substituted by sed during build
 export VERSION="__run_ptest_version__"
 
-# define missing functions for tests/init.sh
-fu_path_prepend_ () {
-	path_prepend_ $@
-}
-
-print_ver_ () {
-	:
-}
-
-skip_if_root_ () {
-	[ $(id -u) = 0 ] && exit 77;
-}
-
-require_root_ () {
-	[ $(id -u) = 0 ] || exit 77;
-}
-
-expensive_ () {
-	:
-}
-
-export -f fu_path_prepend_
-export -f print_ver_
-export -f skip_if_root_
-export -f require_root_
-export -f expensive_
-
-
 for f in tests/*/*.sh; do
 	bash $f ;
 	case $? in
diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
similarity index 78%
rename from meta/recipes-extended/findutils/findutils_4.9.0.bb
rename to meta/recipes-extended/findutils/findutils_4.10.0.bb
index 074817df27..57f77de16f 100644
--- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "bison-native"
 
-SRC_URI[sha256sum] = "a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe"
+SRC_URI[sha256sum] = "1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5"
 
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 # http://savannah.gnu.org/bugs/?27299
@@ -15,13 +15,13 @@ CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 
 # need od from coreutils for -t option
-RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
+RDEPENDS:${PN}-ptest += "bash sed grep coreutils coreutils-getlimits"
 
 do_install_ptest:class-target() {
 	mkdir -p ${D}${PTEST_PATH}/tests/
+	cp ${S}/init.cfg ${D}${PTEST_PATH}
 	cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
 
 	# substitute value in run-ptest with actual version
 	sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
-
 }
-- 
2.34.1


