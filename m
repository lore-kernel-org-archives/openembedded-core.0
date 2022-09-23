Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA5DC6FA8B
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 03:19:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.3713.1663903147509621152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pOMEPG/O;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6265d6c148=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28N3DMb7023791
	for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:19:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bVM1omhp69v4ad/zcV8kaBqI4ve+uQoWgB5DPNQoRP4=;
 b=pOMEPG/ON/DeYOeR1ZGsgpZ+Zbm97Bztoc3wTwNu0R4z1XD/TOp2cYXNXuJfl89jLo8r
 DWhDlevMbmfqLyRBdDfS54sFhLH7nSi2yWMblKHHkP8RiLjnTiN6fF8j4XQJ1VNR0J8S
 KcbVDQRiS+RTNaR8/EZDnj0husJYxte5RpIc0aZXfclHUq7cGjc0tDVc76+DLCa8W0Rg
 NXxMZmSCmV/kIlySVKTGO0t1zavVXhxTRmACy6jkCXbm/gOlEM29zyOLFRcQ/Ut9hYWF
 6vX8LPrAR31nSkDAnZjRUGqXlpJonBsvE0brLC8oXxHm2hreOHq346domjB/GC7e/75W +w==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrkmp8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPwIkU8ymsW9W9ikaVY4q69mnniGhrtApycY6mh+aZ0V3W+33ilLx7T8dnIHxKMFQh6l/bykUkiil528pLt3grtJ216BDQbkgFmcdX9lFnuN+Iko+LRtB84Qotop0w4rRkB8bgawEV57R9Py3f8Z2Me/VBRDyRSEWw0AbGDZq1vPkRsQ5OK6uHIVrdhJyRyI68M5A+F4jfff0uTuEvgxvkG5cLjgbrEce71bzj+naJUWaQ+GiTcXIVNqEdjJ7YO/GyXYtMz4KstbAV4tLdCgTtTCe/+8Zo62fWK7FoEXUm3La/cpLJAw9ryKiAzceBb+tF4b4Py0FYVmVRw/joKhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVM1omhp69v4ad/zcV8kaBqI4ve+uQoWgB5DPNQoRP4=;
 b=SgpJsxjJZaO/eAbEfi8X0X1Vq+jiVKuqINUbIbptC9eL2NCgpAU0/Yqlh5YHDqF57WmZEJw5O63sTkq+WbosqAgIZEOO932dg0BhLh0UVZKlM1H5JQSolUAbAnz/F4m9cAl2mAzw4vVw6Qv9VtzIO6LamuC1ZKNP4x48sAGE2GS5Hi2tGz69A/MJF8OdM+4f3LLkDlQ6r74eq2YAJA5aqgCsz6YFaNENRo88D2DxkS4QGqBtPUxlWOO2VZDC5KGZc2T3G0iZac71PgJP5vktRe704ocg/oFIVN2UyBR0L6WUCZ2G40W7gig6gVZKk3DnXmzuemm5R8gmmdafnHy8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Fri, 23 Sep
 2022 03:19:02 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::8450:fa99:720:1865]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::8450:fa99:720:1865%4]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 03:19:02 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-tools: Disable ptest for qemuriscv32
Date: Fri, 23 Sep 2022 11:18:44 +0800
Message-Id: <20220923031844.1630492-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::24)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|MN0PR11MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a86dcf-1307-4b5a-e126-08da9d125d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V3sOprv2tevKzdJvmj/hJQbKfKXBkfgGLfa7+TD4Qy6wMR+dDvogiIpwavO06xtmFCk+tLEZhqB4XszrmLZJZTwNn83I2EFkWQKU7oGbeyJ3MgGNSsiWb8EfII7x7pYMQQSxEnM3wiEq2vw9m5Lo1IpCE/PS2ncxQiFwrIrJMt07+jWcMwZb+POCXElpZTDEESaTurMwjJLHuMYa/gfCBJcACklRGubwe+nvoPnxg7MPh5j0Q1Kl6jqC6c5Oo3YQx9oVoneRmrmFBns85nYv/Blmbvs6sIlA7ov1nAbPRb3W+SjkekkXVrXE1e4iJXegQai8H62N3aS7Uy/RvV6xDWDIVdSRg0OLgiq4Ewf+nOw3xvN/oXWsz5xP5CCuB5AGiVn2p5XZHFTh7bCnVlMjVyljP3Od2dSxaaxiNBwCE4NVmN36Bb1emK0cC1lDQMqzeAGoupsFwVGS6nvpRMx47Cc+BSLgz+D8b99GQiXFdSHuEps0h6BvuozR5OYO/iS651nDqbjuB+RH4mNrd6J/V3r9x1lq1LhtRdjcb8Vy3QtgWmMlh6OsE7qHxSzFemdVA0OhJmB6D0PwttE8BbxZTz/e9pisAwu78Fm2Ip2eLV6rVrw3zb7YibY/b38ZgMeW/8yKgc+zpss2sKwZgEsexgxNyqUkBk/JSG9A+0Uo0u2yg+gU2GLGgVrf+0610VoUn51WDE7i+52qVKHIIo5w3t2aRTHddEfYViArmzQBi7FemwxS5P4+KSHFA9AHbeIdVbfLDLD98GHVabnxZMoHq5peDoOhinm6pzw2mwcsSsA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(451199015)(966005)(2616005)(6486002)(36756003)(2906002)(186003)(478600001)(8936002)(6916009)(1076003)(86362001)(83380400001)(5660300002)(41300700001)(316002)(66946007)(6666004)(38350700002)(66476007)(38100700002)(8676002)(66556008)(26005)(6512007)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YzlJ4bxWzqZ1BggrYbQu81jSPt5Sw7R0dVhWPcTOcAlNWibAV7O2T7Kopwkd?=
 =?us-ascii?Q?fH9JHHp3EkYkOjG6bxSXOhcMILBHkS+IUw31l6vp712SnyV/74qkmLhvJ7DO?=
 =?us-ascii?Q?qoNatta7uEDLt2z1h4igFVRncOCDs3IruSk7Y/9gCkNaBSaKDHSGertexMji?=
 =?us-ascii?Q?8AGUXekbxX/GuItBM7jZYlR8ar37B2xi6f+NEE5fG0LdHYKyk0YRReg2L6HK?=
 =?us-ascii?Q?6NWLvoIFmjlIlvES++xLR9wTsH6ldOfsH4D1Qh4AmiejQBAEx279CwRP0cq0?=
 =?us-ascii?Q?QoSD37YfnnmZiJh0bhFRmThb66vYd3e+8iM9IedlzKBhgUG3PgpGAyd5Zed2?=
 =?us-ascii?Q?FBYGBHhWnJkreJpRiDVFO5c1qFs77K5B2iNHq5Z9uIgGeoH2eCQVCOe+fZbo?=
 =?us-ascii?Q?efSJb3uh3tLbO2EMLNKt8ruBrsU/E/nQ3dUY5JifqdxgweDqqgAIQh2pD0Xb?=
 =?us-ascii?Q?WGWtENgphaOgf15kCc9VJuyUYyBkJNOQSARBKKA2G260S8W/iP21TGEDTB4n?=
 =?us-ascii?Q?Lpzs1XxiXCj5cfDEK1IJGt6a9SWmjL58Ne91Dne2do8ZlB4+KAtGJ4aOVwyt?=
 =?us-ascii?Q?Q2YVnZlcA2ZV39VvqnqilD90hnLY9X0/HQU2RWmk7arJFKPasOix6xM9sY/n?=
 =?us-ascii?Q?zBSQ3BNVHBNfX1uR03NGYfz3Q2RVZw8oj53q4lb2ASbra6QfUzidEE3SCaqS?=
 =?us-ascii?Q?hh7Wo0wiKctNzbhYpm3p4lKgZu6/m6lfbgTfQO/rQZ39M61Uz1W87RO5moVO?=
 =?us-ascii?Q?dhkHJF4tfcNbV7Sn/3i4qxOpXhKTeXJZRL1k/iSQxQBMs2WfP6rkBLCGOB59?=
 =?us-ascii?Q?mQWJGjLlaRdmcHFb+SVamZ5i7dh08qQ5nQjG8m4gHBUm/7ZwNX4p1KXlQbso?=
 =?us-ascii?Q?8XXnnxuNKrUCadNuk9537OgfbYo3s2OSjv234W3DGSFZt4S17UA+btBkGX8g?=
 =?us-ascii?Q?dJMuBL0NKx2QTVUPqv23KstEQmmrkmiUJMBKiehvYNX2CZiUDA/+JOnGo+Fj?=
 =?us-ascii?Q?2fTw5Rtmb3zftQHPQwTa2vE85jp0Hi5VwvGsQhA/iW0n/bZeEG4NtZ3Rwze5?=
 =?us-ascii?Q?tGf7k2tTWMLD51/3XNlmb3Om9I+KESx3Vgot161ZJzYsEcSYYdCgza0zPSz1?=
 =?us-ascii?Q?SqMEze2timRSI2KaaKAjEeD/fYf26bgIMBZuRfAdbNbjEChLrSwUUEegK5Fi?=
 =?us-ascii?Q?q0KAtJl7VLFC2B1dNLz9pMuEeecLvsBC0hDbHC4SYixdwLhrMTBXLwLeZDq+?=
 =?us-ascii?Q?vFKjlSKH5nHEeaWr2bAo6YweCfWcSt+Qfuq7Mdx0qbtutn0gOYfWhpLuDwOC?=
 =?us-ascii?Q?gwEZSElAKltNq7I+o6W/S0Ftl8cKhbknwdn3SS8muPsD5gDw/reQjv1DYxuz?=
 =?us-ascii?Q?csn5ATaP+bOQaCnhMZ6JG8yNc5/COW8SqTvYFtgc6ylrMzyX506Ct4Km/xCK?=
 =?us-ascii?Q?WOkBuV2E4uVSNAjwDXNyFSfXP7HkkHND1pPD0gQ/4llbeJIz/+OvRF+A7cTs?=
 =?us-ascii?Q?dnoEX6Gs9e3FHjGFlBBU5AfdzF3WpUzXLZ4RwUtUqdAl2pihezuCOoMO+USz?=
 =?us-ascii?Q?M9VIOwPMNyp6oKtAaITswO+axi5CmpdVAOm4XsuC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60a86dcf-1307-4b5a-e126-08da9d125d1d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 03:19:02.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dhGTbiuK3HF17orc7r5+xEZLkYGzWe148kzZMnEtj9+aVFYR5U0gaCHIraw9bPz6fQU0/N2VBVtbZ1MfEV7XCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
X-Proofpoint-GUID: gXT_BNjh7mEWpob_D9RTQIX8mQ2geCIG
X-Proofpoint-ORIG-GUID: gXT_BNjh7mEWpob_D9RTQIX8mQ2geCIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Sep 2022 03:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170996

lttng-tools ptest requires SYS_ppoll and SYS_pselect which are not
supported by qemuriscv32.

Back port a not merged patch from upstream to be able to disable the test
build and disable the ptest build for qemuriscv32. This way the main
package can still be used or at least built.

See the following link for more details.
https://github.com/lttng/lttng-tools/pull/162

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-platforms.inc |  4 ++
 .../0001-configure.ac-add-disable-tests.patch | 38 +++++++++++++++++++
 .../lttng/lttng-tools_2.13.8.bb               |  6 ++-
 3 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-configure.ac-add-disable-tests.patch

diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
index 933c65d85d..2351df08b8 100644
--- a/meta/recipes-kernel/lttng/lttng-platforms.inc
+++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
@@ -15,3 +15,7 @@ LTTNGUST:arc = ""
 
 COMPATIBLE_HOST:arc:pn-lttng-ust = "null"
 
+# Whether the platform supports lttng-tools-ptest
+# lttng-tools-ptest uses syscall SYS_ppoll and SYS_pselect6 which are not supported for some platforms.
+LTTNGTOOLSPTEST = "ptest"
+LTTNGTOOLSPTEST:qemuriscv32 = ""
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-configure.ac-add-disable-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-configure.ac-add-disable-tests.patch
new file mode 100644
index 0000000000..05e976ec49
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-configure.ac-add-disable-tests.patch
@@ -0,0 +1,38 @@
+From 787978985d6ddd86561f16ad88a12e1570d3e46b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 21 Sep 2022 23:07:03 -0700
+Subject: [PATCH] configure.ac: add --disable-tests
+
+Allow the user to explicitly disable tests
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 5bfe791..a90e590 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -884,6 +884,8 @@ AC_ARG_ENABLE([bin-lttng-sessiond], AS_HELP_STRING([--disable-bin-lttng-sessiond
+ 	      [Disable the build of lttng-sessiond binaries]))
+ AC_ARG_ENABLE([extras], AS_HELP_STRING([--disable-extras],
+ 	      [Disable the build of the extra components]))
++AC_ARG_ENABLE([tests], AS_HELP_STRING([--disable-tests],
++	      [Disable the build of the test components]))
+ 
+ 
+ build_lib_consumer=no
+@@ -1035,6 +1037,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
+ 
+ # Export the tests and extras build conditions.
+ AS_IF([\
++test "x$enable_tests" != "xno" && \
+ test "x$enable_bin_lttng" != "xno" && \
+ test "x$enable_bin_lttng_consumerd" != "xno" && \
+ test "x$enable_bin_lttng_crash" != "xno" && \
+-- 
+2.37.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
index a814eb79f9..883c930cdb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
@@ -25,11 +25,12 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
-PACKAGECONFIG ??= "${LTTNGUST} kmod"
+PACKAGECONFIG ??= "${LTTNGUST} ${LTTNGTOOLSPTEST} kmod"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
+PACKAGECONFIG[ptest] = ",--disable-tests"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-do-not-strip-a-helper-library.patch \
@@ -37,11 +38,12 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://determinism.patch \
            file://disable-tests.patch \
+           file://0001-configure.ac-add-disable-tests.patch \
            "
 
 SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
 
-inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
+inherit autotools ${@bb.utils.filter('LTTNGTOOLSPTEST', 'ptest', d)} pkgconfig useradd python3-dir manpages systemd
 
 CACHED_CONFIGUREVARS = "PGREP=/usr/bin/pgrep"
 
-- 
2.37.1


