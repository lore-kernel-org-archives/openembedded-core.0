Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.61])
 by mx.groups.io with SMTP id smtpd.web09.5269.1611295839845089272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 22:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g1dBuWjr;
 spf=pass (domain: windriver.com, ip: 40.107.94.61, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGtEoQmQP5msp+ihxCcjTq6JXFIyygMUMZd7VDGVmnLRT5o1L9ws8CHKGo1iif7IeyautZXirF7GScYuYhJDfGb4uqSCRH/DCqaeYvunL57vQXNplYOtywWLriQNpEf6WtXyy8rFZCJVoyPnTfN9WaRvRVOgcPt7OZQyBViy5Nq5VXLI5RYX0jyZX+CMQ+8JqcsjkDsV+im5w27Kd2wNGMd/O/0M7GjBpbNwGbOiZMcLzAPhJUi8aJTHvKKQBM3d9Mkl2V6xqiMytiqtNFD2vDRFKNEIJXfyV/AbZ2j01WVBdJ983PeQ3mwK8Fux8s4A7vQJsbzqWKdya9rNwtVWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umPx/FGtjkgSFxm7HWxLPh3jobp9PT/L8R1+XTL6MOc=;
 b=FHejcXYVDzX8q21Gi3p6krScAelFfbBEh+hvI3PhdgBwobg8EWGC+WCUqVXVk5j9hK7hdiCN60ilHpAbT2C5mbxS3fTjbtAn1FazxHaF+6cYSjm2C5mTFX8W2UzD+mDhj+v7qCbSr/3IjO4wscTYVD6Le9pebf8EMI9IK/Jbs3wa6JuZyjI7lgNKBHS88PyPCeLoaa4ghaV9HJ+S/qZek8Ppo7VLVuO17G92J+ZMKYvqvLW6cZ2UcOSVXWIwj7ZYufTKZmPd/aZ++jEgUvaWV0XDue4Kt+sZ/42Q+UHyijBH0v8uS/XZtCGGJvI7kltWhvwYZhK7EFOe90V6M0R6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umPx/FGtjkgSFxm7HWxLPh3jobp9PT/L8R1+XTL6MOc=;
 b=g1dBuWjrH8+RH59S9rBvbPlX2DnZnBoMMKulS1TL1Wp9FyfH3mRRY80A6ty9lw+A+0Hy1o67X08lWWX/pRJ3UEzDm3Fv5WIxXCRwYJNI+E+27r9o4OGRyJaES5BwmhB3pInUWvaJ7frkB64hSx5T38Jvik+xtfbCaviE/pi8RS8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1488.namprd11.prod.outlook.com (2603:10b6:301:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 22 Jan
 2021 06:10:37 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3763.014; Fri, 22 Jan 2021
 06:10:37 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpam: add ptest support
Date: Fri, 22 Jan 2021 14:10:19 +0800
Message-Id: <20210122061019.17032-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR03CA0104.apcprd03.prod.outlook.com (2603:1096:203:b0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 06:10:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b26133a-71fd-4504-2896-08d8be9c6fe8
X-MS-TrafficTypeDiagnostic: MWHPR11MB1488:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1488AB6723EEFD2EE994A5CEF1A00@MWHPR11MB1488.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7JS1cPlFBZjjhvnaetp9CAoV6BGsL+KWOq9akF8oX/Z0RwT3tNUV9otYC5gKEnjkbz/OUWjQAf4/8sOpb4XfcSu4J/K4n+fzliY6fIexrYx3Qroq1zKFB69UjB12GkkbLKRdIYR2e5etkQNhZWS8NsPZxt9dxNYwc+vfwrH/ZSJ5ZNXROwpn24vbluUePLHGbKS9ySJUnS7OdTfGUpgBbx8oP8BKgJJQEqAny1qTFuUAUArfzlu556ROw38I1AOJ/jjS/AN5h0O0WgZ9YKUqoROZj0j9FtqfXJes7EN77/U9BJgffHokyt986UW5y2TyKQRDTNldSbYZ61UDg4WigAp838wa+MpeVNcenBri/VsDwdlQ4JZcZaRkuVSNisHPAHHJABjIVS+ijR0gW1x4sEyQbq928SS6VLWS8cdQacE+7dwSmbwFRYzTmiOxpHgOsEMWoJcfSdAsKE5QGTtJ8W3dccgOvyMaMbEAWUWhOc4Hf1cDsG5LclR7+fKeu4r9THQj3i7wLHi6PAzEPEGiIQf4vPRHFQiaLmxglMMIpChlOkR73wHLPIzPMcNPIet49h2+JFdfAj1XrzMBIMiyYM+ecmYLcJTwHUpD+oM6Ugg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(6506007)(8676002)(2906002)(6486002)(186003)(83380400001)(66946007)(52116002)(86362001)(1076003)(8936002)(316002)(16526019)(6916009)(9686003)(36756003)(5660300002)(478600001)(66556008)(26005)(2616005)(6666004)(66476007)(956004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?BLgPB85soapMKfEG9h8hlRd+T3Rkz8Fp4MKq81OqP4X/D7ezpuxQb2IlFN9D?=
 =?us-ascii?Q?VXqMphJn7kYJATq0t933XNWwKf0lHsOGWI4+b6zzH4vtWVWhSTm1xqDo7KaP?=
 =?us-ascii?Q?sgZ/t2hxsDLlRJxIyjRjFC0S+U2EWNCAAey9bWfrbXNHiAuGEkZOlkf03L4O?=
 =?us-ascii?Q?A8Wt6CTuWu1MgBV0V0U8tXOLrB1Weip9GYzMHj5A3WyH9Cxef8STKCBsSlPQ?=
 =?us-ascii?Q?CiWuS+Fm2/OqAAg6nCeAjNXloLL3sZSCpE23DKgzv6hHfvQ78cXcmAKteHRo?=
 =?us-ascii?Q?c92jqA6Pt0ZDhEv+Xj0JW7FDe/3c990IjiRa2BjKZVnePHvP9O40uiHoTHS6?=
 =?us-ascii?Q?cLBmMmVZnGmqpea+JN2PvdkF9ZCpGuOHsqUXluKZgJ7zG6mbT+HEo5SYJiVb?=
 =?us-ascii?Q?EHC93XFWBtlw/nf5hNRndcDpPir+gbmN6kMqCytBGtDyAbKrktXalVDAHF3m?=
 =?us-ascii?Q?zepJ/UPfNW3G9V0l8S8Ce84w02XEkdTQV3pTfWZA20evvxG2wY176MwST32g?=
 =?us-ascii?Q?uhiFJ2e+xHM+flk2BylzZJfyc7pw9dvLEQLg1/Jeapq68BzYD8JtlotPdVEk?=
 =?us-ascii?Q?I4AQO/xY+SvcuOa2nQvu7ecmnGUru1oSd2zQbcoN+qUckZjMZt9gWkNpZ/on?=
 =?us-ascii?Q?eI+8RUMFr08cVJwSR7kgxaY5J9iyXqzx7EFIigbBoGq+ZvucZ3rSRYomZmb9?=
 =?us-ascii?Q?g9H8DvyI2SmXqW1CuXXZaA9kw9Mtd11h0lr3b3Uf33ZAgVJ1LFgxLW4jtZ0k?=
 =?us-ascii?Q?Cgpe+A8bnkWPp6HDuAUoWEv8JIQ6QRLLY4Es3fO4lzrIywf4eixJa7UCfXCX?=
 =?us-ascii?Q?jgtfZhSYTFEyLoC0qVLhzF6AbZ5AIPl5NUuu5unt5yOnKrinyRcEcDW+55sY?=
 =?us-ascii?Q?wQg2OVCowy4UkHqgAno5g+P0Fw16+b0ucL8knCcjBJ4J2UW3vWNM6juqYR/t?=
 =?us-ascii?Q?PtSzRJEFDGb7L7d7Z5Ee03vhughJrF4ua1vC3L8dRjvYJdKNJVX9N7eM7aGT?=
 =?us-ascii?Q?X5HP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b26133a-71fd-4504-2896-08d8be9c6fe8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 06:10:37.7493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dabJ6Z3FOxb0Q5Yd7JjWS+hWyiSw2xNx6bGGH/mX0988puJ/kbw7bHGQkk8ZfIruiPz/VtjU9mN5VGpT8L3Cmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1488
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add ptest support.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/pam/libpam/run-ptest | 31 ++++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.1.bb  | 17 +++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pam/libpam/run-ptest

diff --git a/meta/recipes-extended/pam/libpam/run-ptest b/meta/recipes-extended/pam/libpam/run-ptest
new file mode 100644
index 0000000000..69e729ce2a
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/run-ptest
@@ -0,0 +1,31 @@
+#! /bin/sh
+
+cd tests
+
+failed=0
+all=0
+
+for f in tst-*; do
+    "./$f" > /dev/null 2>&1
+    case "$?" in
+        0)
+            echo "PASS: $f"
+            all=$((all + 1))
+            ;;
+        77)
+            echo "SKIP: $f"
+            ;;
+        *)
+            echo "FAIL: $f"
+            failed=$((failed + 1))
+            all=$((all + 1))
+            ;;
+    esac
+done
+
+if [ "$failed" -eq 0 ] ; then
+  echo "All $all tests passed"
+else
+  echo "$failed of $all tests failed"
+fi
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index d6612bb936..f225487688 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://libpam-xtests.patch \
            file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
            file://0001-Makefile.am-support-usrmage.patch \
+           file://run-ptest \
            "
 
 SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"
@@ -40,7 +41,7 @@ CFLAGS_append = " -fPIC "
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-inherit autotools gettext pkgconfig systemd
+inherit autotools gettext pkgconfig systemd ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
@@ -112,6 +113,13 @@ python populate_packages_prepend () {
     do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
 }
 
+do_compile_ptest() {
+        cd tests
+        sed -i -e 's/$(MAKE) $(AM_MAKEFLAGS) check-TESTS//' Makefile
+        oe_runmake check-am
+        cd -
+}
+
 do_install() {
 	autotools_do_install
 
@@ -131,6 +139,13 @@ do_install() {
 	fi
 }
 
+do_install_ptest() {
+    if [ ${PTEST_ENABLED} = "1" ]; then
+        mkdir -p ${D}${PTEST_PATH}/tests
+        install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
+    fi
+}
+
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-- 
2.17.1

