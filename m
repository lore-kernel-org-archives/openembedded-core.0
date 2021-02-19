Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.77])
 by mx.groups.io with SMTP id smtpd.web10.4980.1613714605324289178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 22:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OCshh0Lp;
 spf=pass (domain: windriver.com, ip: 40.107.75.77, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biXsG6Se53hYNiHUPvDCbLCA6fwInVd2oAT3kAgEjfHR0+zH32feg3W6LJ1zpxMkT+MqlfKTd/llPK+mghnR0Hqo0yRM4UJGIxdXrjWVgMHwlO9XKnlVpI6LtTv5YyjVhK5sGRfXU8/jRRfX03zsZ9hrt2INYTd55BSszKi3JD4yFYKeKHaTL4ztIdseSJTgPtPRVnWNG+xnE9efJ+DXIZLGR8GwyzTYofvPN5FVY8tpYSZbNwCDEkFcp66Lp+vvzglETsE2AOJqC4b/Wz03z3Jd7zxOw6PxU6wW+ehgIZGHKsEIq1FIFuVNoKcy/87Y8SS07IiGt1HzhJ1sJXtw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmOcS37hl013AD4veOoyYJtszUXnDTDwMeY2eoEmjtA=;
 b=anlfwVsRUYVCZ3lK59mQV87uGkt7IYgR4OrKJdNbg4bjoR4b/qssta13J7NFRv1VE+cpFv0Lz2Fc+RyZXD0SGY4SS/tQmrVjXDh59oSNWNRBE1ASe5wUdfBhZUoLyVc9RhZt959WkjkOSw8DtIKKjDosls6S4OLZJgm0dDxsnU2IeJJgykIxbzJqdMFF2sz5NbUCJUlp8Uy/sHHcJtuPg97YmxkonQvO/DLF98bqar2McbinY2LFs62RPiS6QqQfRU5BjrW+uIyXUT1jTupGzWZO8ZPAZjTWBIqRVYOo1ETN6HVaRjqX1OJCFJS/I+Mfr2b4Hlqc11bnDUgsoiuZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmOcS37hl013AD4veOoyYJtszUXnDTDwMeY2eoEmjtA=;
 b=OCshh0LpKRj0sIhM6htylcHgOzrVIHff5CFdliTax/EE2aH/6x7UDBRbNsK8JKBPd0DfS7tYbcwCfVhEJDZG3HDKxyHwmMYq4IaXBfb1EMgsWsCA9hF5UGQG28Yf+SVPSwyH5LrpswxZ1QRcC/YFLB6fhC7uVHMV9iMZ/TRn6h0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Fri, 19 Feb
 2021 06:03:22 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3846.042; Fri, 19 Feb 2021
 06:03:22 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libnl: add ptest support
Date: Fri, 19 Feb 2021 01:03:09 -0500
Message-ID: <20210219060309.27976-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::46) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend Transport; Fri, 19 Feb 2021 06:03:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6c97c4b-d4f3-4e00-90fc-08d8d49c0feb
X-MS-TrafficTypeDiagnostic: SA2PR11MB4970:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4970788CC7A574C4A6E6E8D380849@SA2PR11MB4970.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R8Ql3jaI+9ENpSyu8Ij5kOdV6Ng5mHnAQUCbhXsnAceMmuRaa9n/D6OioTmDcuBGmF/wh2cE8TEFHYF/LntZV3JP69ivMhyILeY71M0VSJt3WbmQV8XWFPTiQINV3+h01I1sTriJFSUODEIsJq6bPIiEZERzH88bo+u4yFs6M+lz7bHIRTosIzqm4YBsWSmvVq/YKrlg79Bxiphs9LT4Y8pTAubgO60jlvIhdZdtj+0v4zbbVl07vvUEPEwqo2kYidyPo7lmF060CYqEl/1teJkeZ/AeTLqF8kCforzsIiQ4BeTA8Sh2QiwjoCeT7aQaAwNKUil/fKYyRZqRh+jx6Ml+H8KdKjDNGMphv6t4tOZEMYBlEebujidh5w2AZG/3lPsqaAPSQ/+fxHW7WbL2DCyXV2sjxXdIqdNsBLpNkFIO95erEBhnzTZhoDkE/OOYt5t+IdZXGk/GnGbMotttD/Ojm4M2AvImvz+X5fyRKm6ozdS+bGfLRtD84AEbTgmCIznzmChxbcVk/5+ZmqYkQdmBiQsRBh43fHBIFmxBvmEPH9Lv1WZ3ldWHiI8lGylcFUyC5w6h0k+ltCuSflbiO3QMNqTs24PIsyDWwTpABtc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(6506007)(6916009)(316002)(52116002)(6666004)(2906002)(2616005)(6486002)(5660300002)(86362001)(8676002)(478600001)(83380400001)(16526019)(8936002)(36756003)(66946007)(1076003)(186003)(956004)(6512007)(966005)(66556008)(26005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3/1qqOSHtubcKyvXyUhUEO72ug3J3B02ZsPhR+xfmeGhRAIA+G5AmRP2gnm5?=
 =?us-ascii?Q?SnyqkNU7eYPIu7sLgNkebEzI0HWc61Xhgb1xBQzDg1PY/wei6+nU9oNExKND?=
 =?us-ascii?Q?WS6NDvPkd8ZWoa7OOnUEoZzkDy3n7RG+OTz6jgAdiNJX05MRLxvHw0M3dGZO?=
 =?us-ascii?Q?MD8EPovs+USKa4mr5hvUxxJd9IQaTlInYyoyj9d2wY/QNLUke72ttK4YP5x5?=
 =?us-ascii?Q?MF72QjZXpXnpvSGqJ7GnTdf/BP3iaiT0iiqMN/6RADsozv3Bz+pcXugjfQvW?=
 =?us-ascii?Q?VqLDcfD6GNSV+YwAlfDAZh12V+9/PDvuXd4RiPsWxa/8MGnff3tUP/jsOFpE?=
 =?us-ascii?Q?90LSQcpkqZNcGGF1ke57D9VgKVqVosJ0UZ9Idqr0aClG87l8HUCD/jQXjmGu?=
 =?us-ascii?Q?3QlpIYdX2JVxNnW7SuxsxWY5B4Z77pK89KMqYazlln+emcTtPaBk3CrPKW/M?=
 =?us-ascii?Q?O9SrNyyHbdgMt9QtfXMWN+ZY5cGrOJO/z1ltsCvfT3OYvHcOx/Eg02DA3ubW?=
 =?us-ascii?Q?oi3JArYJ+V8DfG/P+Iqn2Lmlt6kD44QeCxXx1oxZaI1GKRsDsQVJwwv1E7NV?=
 =?us-ascii?Q?teDUdySIBra8DbSoOqrpIgVWjax0MwfaAchsv94Dt6/CPfDKf1RFksLjpmHg?=
 =?us-ascii?Q?z2dWbukpDxq2dSjcn9R1dFFl/NXLmpq1vfEqKWJSkhgnT6LCZD4cwTsr2TQe?=
 =?us-ascii?Q?eYNzqY5Ie9HuPsDPDVpQPFihuxVQ0F+imXNUFxMYlh6TS4KVM7RQCeq/8Sbk?=
 =?us-ascii?Q?qmqUfOHxELp/Z8NqytB/ndq67qA2zS5rqwWZIWXmWhx8XC97yENi0niiVhfY?=
 =?us-ascii?Q?11vKML7Yi6BHOo4u861GP5B6DPglm2ARLqa88pvmVBWI40fg/MeKNSedXkoj?=
 =?us-ascii?Q?li+7bl3HSqfAgsShi4mjAC7/lqbOBJBEJ46G7WFBLhCuG5GKtowiIQjqmoW5?=
 =?us-ascii?Q?jkyaZwCWJryez7Xc3/UyfIXwL6F1ZFMjRALyCNAdtPB/4qQJWS52+pVO3VFS?=
 =?us-ascii?Q?xN/NKjbEWS57mpPv8podorgWZx5g80FM5ZD+uryaJ2sgBbo2EtVjTAVY1jIx?=
 =?us-ascii?Q?HMwBm+HO8HZl3WmhlMAzRxWnEopGuTIGx3W8nK+YzsQYJIvpnVriOiSYIsSQ?=
 =?us-ascii?Q?l/6nDCYUJb0Dl6J0tWVspI6FXvLPDIubxykkjPxzBgvF5WQgMQ2ZiZRSJ1P0?=
 =?us-ascii?Q?lAkf8I4iIJ3Y1i8SSqkt5JMLmN9q10z7JXyLyUVAftu6yvO2lAPnUat3S3/W?=
 =?us-ascii?Q?ng3u39JSs4CcwAl7E+dJmzZi0524/Z/oTel5KeAzkqdyyuk3D9FPLlQGKa41?=
 =?us-ascii?Q?s2FONulj36c4z0Ks3PHuMqym?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c97c4b-d4f3-4e00-90fc-08d8d49c0feb
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 06:03:22.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkdFmw3ho6vCqHlv4K4G74Mqph3STTpwKYCKLfssalCxH0t4VkTJhsVXnRD645zi/ro52VZbZMD1A6E5aDUn5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

All tests are installed, but only what `make check`
runs is run, so currently that's 1 test named `check-all`

`libcheck` needs to be present for ./configure to generate
the check* tests.

An issue asking about upstream testing strategy is opened at
https://github.com/thom311/libnl/issues/270

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../libnl/files/enable-serial-tests.patch     | 28 +++++++++++++++++
 meta/recipes-support/libnl/files/run-ptest    | 16 ++++++++++
 meta/recipes-support/libnl/libnl_3.5.0.bb     | 30 +++++++++++++++++--
 3 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libnl/files/enable-serial-tests.pa=
tch
 create mode 100755 meta/recipes-support/libnl/files/run-ptest

diff --git a/meta/recipes-support/libnl/files/enable-serial-tests.patch b/m=
eta/recipes-support/libnl/files/enable-serial-tests.patch
new file mode 100644
index 0000000000..8ea53f8748
--- /dev/null
+++ b/meta/recipes-support/libnl/files/enable-serial-tests.patch
@@ -0,0 +1,28 @@
+From b1476d89bf7a0bc6062438731ee4e9026696328b Mon Sep 17 00:00:00 2001
+From: Eric Xu <chi.xu@windriver.com>
+Date: Fri, 9 Mar 2018 03:38:49 +0000
+Subject: [PATCH] Add ptest for libnl
+
+serial-tests is required to generate those targets.
+
+Signed-off-by: Eric Xu <chi.xu@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 files changed, 1 insertion(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dfead98..2cc8257 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,7 +46,7 @@ AC_INIT(libnl, [libnl_version], [], [], [http://www.infr=
adead.org/~tgr/libnl/])
+ AC_CONFIG_HEADERS([lib/defs.h])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+-AM_INIT_AUTOMAKE([-Wall foreign subdir-objects])
++AM_INIT_AUTOMAKE([-Wall foreign subdir-objects serial-tests])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)], [])
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+=20
+--=20
+2.13.3
+
diff --git a/meta/recipes-support/libnl/files/run-ptest b/meta/recipes-supp=
ort/libnl/files/run-ptest
new file mode 100755
index 0000000000..e5c9eb0a32
--- /dev/null
+++ b/meta/recipes-support/libnl/files/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+num_fail=3D0
+
+for test in check*
+do
+    ./"$test" \
+         && echo "PASS: $test" \
+         || {
+            echo "FAIL: $test"
+            num_fail=3D$(( ${num_fail} + 1))
+         }
+
+done
+
+exit $num_fail
diff --git a/meta/recipes-support/libnl/libnl_3.5.0.bb b/meta/recipes-suppo=
rt/libnl/libnl_3.5.0.bb
index 9d0e1441a9..09d8c8611e 100644
--- a/meta/recipes-support/libnl/libnl_3.5.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.5.0.bb
@@ -9,19 +9,26 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 DEPENDS =3D "flex-native bison-native"
=20
-SRC_URI =3D "https://github.com/thom311/${BPN}/releases/download/${BPN}${@=
d.getVar('PV').replace('.','_')}/${BP}.tar.gz"
+SRC_URI =3D " \
+           https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.=
getVar('PV').replace('.','_')}/${BP}.tar.gz \
+           file://enable-serial-tests.patch \
+           file://run-ptest \
+          "
+
 SRC_URI[md5sum] =3D "74ba57b1b1d6f9f92268aa8141d8e8e4"
 SRC_URI[sha256sum] =3D "352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647=
a7ed382b5e05fa"
=20
+
 UPSTREAM_CHECK_URI =3D "https://github.com/thom311/${BPN}/releases"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
=20
 FILES_${PN} =3D "${libdir}/libnl-3.so.* \
                ${libdir}/libnl.so.* \
                ${sysconfdir}"
 RREPLACES_${PN} =3D "libnl2"
 RCONFLICTS_${PN} =3D "libnl2"
+
 FILES_${PN}-dev +=3D "${libdir}/libnl/cli/*/*.la"
 FILES_${PN}-staticdev +=3D "${libdir}/libnl/cli/*/*.a"
=20
@@ -41,4 +48,23 @@ FILES_${PN}-xfrm  =3D "${libdir}/libnl-xfrm-3.so.*"
 RREPLACES_${PN}-genl =3D "libnl-genl2"
 RCONFLICTS_${PN}-genl =3D "libnl-genl2"
=20
+RDEPENDS_${PN}-ptest +=3D "libcheck"
+DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '', d=
)}"
+
+# make sure the tests don't link against wrong so file
+EXTRA_OECONF +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '--disable-r=
path', '', d)}"
+
+do_compile_ptest() {
+    # hack to remove the call to `make runtest-TESTS`
+    sed -i 's/$(MAKE) $(AM_MAKEFLAGS) runtest-TESTS//g' Makefile
+    oe_runmake check
+}
+
+do_install_ptest(){
+    # legacy? tests are also installed, but ptest-runner will not run them
+    # upstream are not running these tests in their CI pipeline
+    # issue opened https://github.com/thom311/libnl/issues/270
+    install -m 0755 tests/.libs/* ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.29.2

