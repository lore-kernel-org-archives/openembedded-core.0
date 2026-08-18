Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF15C5DF84
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:29:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7636.1787056158598812296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 05:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FMhnkdg9;
 spf=pass (domain: est.tech, ip: 40.107.162.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jryLWd/Nuzef3Lyg7PljcmOM7ABeHE4NGouusrzFeBcBmXfymAkf2l4EcnYFOCo6ajbMsEnqky/1J9NyYzE2TnmmVlQ/LjcPeXJ6nGuAOmn95mmkGmZUDLdbN8VjP9KDEHxjj+JDncqfquqVpSuBc+S/Xre/0aQ+Pdh8ZVya13X36q8p81qsKCwaNkQLqy+A8vORF0I0Jm3W7xFrYVyYsKzcIMlI8IbhmYGBYzdQE5fdkBohZ7nV3KECbaRaBGkAlxAgtLbI2yjeKgo5lNVUh6/p56CJRAKdeeYK9dPMjouZqbaxzIwjDC6JorzfOumts3WbdzujAQ60kioHyoTcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeSsmTMFc2CU3PI9sHDSVjRv0Q5aFH48XiVydhu7WTw=;
 b=yYXyjXPIAVM1Tzx+M8DQ38UxBm0dtCQdVsSy7WhgC5L6ONADw6CCDS38TAhSXXpEKl/3s0cAy2hquqTYsucVSBO+t51is5gMK+slY02/Bu86E2NARZwqrazAeu17CqiV3MM4SohuHdnPaDcYvAX4kpdUofnFpApKHJ5EihhAfQ/tx1MsNNRGddzA+CTbXwCnQQhxGzgWWJ5kKMHdQMfI+NFqgXcPGlNQGvV0rQIFhxTHPU0PVY4JpnVCzNRf6FbL6rZDK29CYWvr1TwqZF8MdO+I1CwvGsNY+QOA8B6xpDTicnlBZZXgWBKeatmeytjQoJwGzVxeCzn8QKmK7bhHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeSsmTMFc2CU3PI9sHDSVjRv0Q5aFH48XiVydhu7WTw=;
 b=FMhnkdg9rnDqNXzcKCaVd4OIT7hyzwAn4nxB5wzcMyrEBsYMUi8W5x3FJt9pXLre+ADmUcbRLs8UFySUNej1nO4ouzdhVBeTrtK48zhP2kaThl9MWr1ztWfprWkWYuvFfMksGjnkiztOdiaFRYqR+6+LsS9xKucbX9IFtl3WmYvFIuGLcQrU/EdkvXVggeNpMO/MaZ0hC6TTpN9pZ8wcvMx/g9gAhnJgyicOMBjJ6WEoRwsodX67ZpwoIjbG+18yJbRlk00tx7RobzPB56fqJRIRJz0d9wzZJzPOvbIqSgTwo+eCUQfFUiikSonjhVNR/iKvB2jhLFq9xxqPKfpRxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0796.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:29:13 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 12:29:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] libtracefs: import recipe from meta-oe
Date: Tue, 18 Aug 2026 14:28:56 +0200
Message-ID: <20260818122857.54302-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260818122857.54302-1-jaipaul.cheernam@est.tech>
References: <20260818122857.54302-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0346.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::33) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0796:EE_
X-MS-Office365-Filtering-Correlation-Id: 693eb1b6-3467-43da-2ef6-08defd24500d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	8HUGyvFZyjwP8pXQLwDfw7xrbNIyzUkuQEJWKfT06n9zykn4ZD2SRv3l44X9DrE8LtOBEIcgu4BeFb4ZAzrTnX6zGH592aNPHrl69NOWFeSl8JektMvSDafHEkCMvSJwlp/xmvddYYqcLZ3yucduE9YvXOMJjHlpN3BH7kgm+H3qvFhvS/z6JWrg7HV0LaZSVt9Uwlz70SAVErYmjsAtpgdnqGu7Oh5nYS4yqpPoKpEnHOKCxbB187zJ8EvWnfI0m2Fcteg9GKYMVn9G/O7zRxiN2al8wvR7Mo859tZ+wV2jWG67efxJtdSV9arb3UfKoQ5ckP4MN4KmWEA0bZjIFIaM9WXLgtDKK0ozk8BVSlk8YjXFre00UnzcH8HdCRCD9ZY/dlGyuGHwT0ucNKuOfRw6WD4df9HnA8T3456devwG4iNQdwluWNvn9u/4Nsl0M3OqIOvY2RH5WXb4nah4mcUu3EnWPinLutfdgo4GJ0C7mr5v8JBYM3gOFld/vSdcVWMu97HFVFVkSzZ2tRNwGAWwXBMBY+WWnLQp3bZIPnZJQDyD5gyWpFFVrKpb+CKlugIXdxnuoBLTPsgreHWT1fgWXJDJmU3wO1WO1Hy4FWwqCxDHjMIU4eby9x1AeiSCxP+T8WT0Uge4oBrJOkY/WZreRz5ZjDbk9BuVvq5CgnY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mB01Ct7Auhs9ltg2gwcMAZOC/606wLPb+++SU/+C3KvhO33QFL27gjyim8rD?=
 =?us-ascii?Q?TEgnnBIBJN8YmdAB2qNx41Yt+J/cH3Pd6uAS04/SaWZShSDTRYiiHeG3hExh?=
 =?us-ascii?Q?0xTjI+lbXSdGm9cr3WByvLPBpQrkHjo5fR068a0EoOb4wJ30fOGF1SzaGIkm?=
 =?us-ascii?Q?QIrvOfkKiGyIU1MIuoYEZncfnBlc0oqO5+WBcDX29Ib6Il7mJoJmuUJyOELB?=
 =?us-ascii?Q?RW5ef5K0oS+sD3x5KL0KMgKbMNnalG6ahi6lcPCjMsOJzz+L3ykLFadQHQHD?=
 =?us-ascii?Q?VRU1U9+RRMVBgmPQMQh9lpQD7ZWIfKCWh/9ZDuL+IRLlKTaHPvVMlNHTZECF?=
 =?us-ascii?Q?nhYYBHsmANlRfjYatpRDGkVCXxsxDa3dA9o1Cp2x2aIpyEjB+VNl2zEwJBHQ?=
 =?us-ascii?Q?wHLPu7QYKQywm3/gbMgHNcPtaZsToXU2koHxdkiXi1SKGnoUsEjTdxW3NFaG?=
 =?us-ascii?Q?xLRPbRvgF6zTZER6etcGTmfrt9M7vjVsMpT5a4AB7ytrCHzsLlWw/aABDQtx?=
 =?us-ascii?Q?y+psLSr6eva8zMG2fn8E1Y+1SvhWT+S7/tDSyTkY7CySIi3iLpbi51gRKpr5?=
 =?us-ascii?Q?s7U4KJWCMrwMBREFf0vAhsP7r2x84giWAEmP2+/WaHcti0aUfMP08FiaQ5lm?=
 =?us-ascii?Q?3/TzaBEp0yfMUF0ZeGJVcqtrRDwHR2Cc0MBLonW827cIq+8LlrwofVvcCBup?=
 =?us-ascii?Q?lV6NkoXX9GJyYK0T5S7/UCiXiLDbAr0sFJDeqnwwgu0UPluoQouRhoNrVPns?=
 =?us-ascii?Q?GGnbUmfnc0aLk3hPEml1vQoM17X2IZ2hOp2FIzfuRkQshSWm4uZwlG7a84gK?=
 =?us-ascii?Q?Qzr5QC7fhtBCK/FIIsozg35wxmz0c4yKSnNl5tDULNzJUlKvfb1dl7sUnEQd?=
 =?us-ascii?Q?H0rF6xj50QbCXi5Cdh4euDliY54Wuxv1hpKCgfm/iVPX+Zu33iYX9vuxqLwW?=
 =?us-ascii?Q?E6PzSUGs74m1YLniSHLvZDmZDD8LVoPkrmg5eD8u3cfbJoTq2Zc77JD0f8Po?=
 =?us-ascii?Q?5BYS07B1QGDRuK+HEcNfa7fyhSJxpv7fGt/UuAYKOEstPHsPXT72PhO1rZQX?=
 =?us-ascii?Q?NHl+17efiBLvSF5QKzuz0Tzjnh6sfr7D5S3H7W9nOoEvjB9EzB/gexPqrzho?=
 =?us-ascii?Q?ua7suktfH7XdoWxHrD2dK/229dE9J+iSKMWvaEE+b8YBG42fibdXF7icvzRz?=
 =?us-ascii?Q?hUAwQcr+s57T3gnMSkwCoE6YdL/YVqcy9Z9VnoAurMSniaWQ/RcWKS1591hO?=
 =?us-ascii?Q?S093RC9uWZwqnvhBhnwsC5mMX7xVHvJqvtvF3/Y/TnqAhScrglh79l0yIc8r?=
 =?us-ascii?Q?awv4cPh/U0C1c5SicQCqJbst4OwFwlDmJMO5LDV3dmy3/fY978b0hsa6Z8UB?=
 =?us-ascii?Q?tvE89rjs1TOaO5ZBkU+Vvrzz1HCce74OuRwpplWbKi7hei1ndSYrLS59UvsE?=
 =?us-ascii?Q?gYSs0lqYotJIXf6wMjiyNIr4AnW8x8ag76xERnpchKoZWSWNvU1EYpAi/+/T?=
 =?us-ascii?Q?lSfFDSUJewQ7sRFfkfmDYNf75hv5+YuZfiD2cMPs8PH6GCPg3TV4gE49YXZp?=
 =?us-ascii?Q?xHadVUeZlDtWtRUM2HAt4mtdcdZLs4q99p3WbmpH5yripNFaS3IwstbMqcLq?=
 =?us-ascii?Q?iTOIBpeb+ML4e9QwnhSInMZg3CMCid/tdyCQ47X8xrM3zXflH5nRAeGmUG0w?=
 =?us-ascii?Q?IEfJtKhkQGzsqtoAGzr4v4WiVzzdjJ8CuPu09P78jom0niHWAyj9d8lVwKEK?=
 =?us-ascii?Q?A8A8xh84Kw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 693eb1b6-3467-43da-2ef6-08defd24500d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:29:13.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8BXN7uQvA114MTjwmHCBFqoJcwBbKZfdOpuUgYHo2KAa8eggkR2tmoL3uzuPSrQj3TY4XUWtAIf3tt7Kkmio+kyk7V2KBFQr6EfAKU7G78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0796
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243679

powertop 2.16 requires libtracefs (2b133ed [1]). Since powertop is
in oe-core and libtraceevent is already here, bring libtracefs over.

[1] https://github.com/fenrus75/powertop/commit/2b133ed512c6852cf81cb98831b=
dfd585c0317bf

Changes from meta-oe version:
- fix SUMMARY
- add maintainer entry

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...not-preserve-ownership-in-cp-command.patch | 28 +++++++++++++++++++
 .../libtracefs/libtracefs_1.8.3.bb            | 25 +++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-kernel/libtracefs/libtracefs/0001-makefile=
-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index ecba7d0db1..30f3d510df 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -414,6 +414,7 @@ RECIPE_MAINTAINER:pn-libtool =3D "Robert Yang <liezhi.y=
ang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-cross =3D "Robert Yang <liezhi.yang@windriver=
.com>"
 RECIPE_MAINTAINER:pn-libtool-native =3D "Robert Yang <liezhi.yang@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-libtraceevent =3D "Bruce Ashfield <bruce.ashfield@gma=
il.com>"
+RECIPE_MAINTAINER:pn-libtracefs =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D "Tim Orling <tim.orling@konsulko=
.com>"
 RECIPE_MAINTAINER:pn-libubootenv =3D "Stefano Babic <sbabic@nabladev.com>"
 RECIPE_MAINTAINER:pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not=
-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libtracefs/li=
btracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
new file mode 100644
index 0000000000..7eaf29e4c4
--- /dev/null
+++ b/meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preser=
ve-ownership-in-cp-command.patch
@@ -0,0 +1,28 @@
+From ab6f78bfd6811c648ee71663cfc4dc8be151a519 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2022 22:50:56 -0800
+Subject: [PATCH] makefile: Do not preserve ownership in cp command
+
+Fixes
+ERROR: libtracefs-1.6.3-r0 do_package_qa: QA Issue: libtracefs: /usr/lib/l=
ibtracefs.so is owned by uid 1000, which is the same as the user running bi=
tbake. This may be due to host contamination [host-user-contaminated]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 7f4f5c3..1ba7b9d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -296,7 +296,7 @@ endif # DESTDIR =3D ""
+=20
+ install_libs: libs install_pkgconfig
+ 	$(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(libdir_SQ)); \
+-		cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
++		cp --no-preserve=3Downership --recursive $(LIB_INSTALL) $(DESTDIR)$(lib=
dir_SQ)
+ 	$(Q)$(call do_install,$(src)/include/tracefs.h,$(includedir_SQ),644)
+ 	$(Q)$(call install_ld_config)
+=20
diff --git a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta/reci=
pes-kernel/libtracefs/libtracefs_1.8.3.bb
new file mode 100644
index 0000000000..c010555b1f
--- /dev/null
+++ b/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
@@ -0,0 +1,25 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY =3D "Library to access the kernel tracefs directory"
+HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/=
"
+LICENSE =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749254a5=
1215d13f97 \
+                    file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50=
909238dbd"
+SECTION =3D "libs"
+DEPENDS =3D "libtraceevent bison-native flex-native"
+
+SRCREV =3D "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
+SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;bra=
nch=3D${BPN};protocol=3Dhttps \
+           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.pa=
tch \
+           "
+
+inherit pkgconfig bash-completion
+
+do_compile:prepend() {
+    touch ${S}/src/sqlhist.tab.c
+}
+
+do_install() {
+    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfig
+}

