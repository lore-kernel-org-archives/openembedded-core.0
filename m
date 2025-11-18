Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089B0CEDD8A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 13:41:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12675.1763473287702425404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 05:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LAm0ckmQ;
 spf=pass (domain: est.tech, ip: 52.101.66.45, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdelXvJtKuJ3MLVhJj+2emyp9IW2PQuNlutOvcsGEvRO4mIUgJ/o3l+5GGV6nN5ZfYSWDLjO9pRTWpiCtBBscVFmTpVT1UjdG45GCZE6qz0RHul5lwOEOC+TOpjXpk6XvTW37yN4r+LKdFNgVkRlJ1bdVzSprXSf9pFy+ivcryVMItFJ4YiB/EtCN69QN2gkus2gvPXMsgFmX7nt1+2crzgrMG5hKZHfHIhIq9GCEt2b2s6t5Ma2Bd/4iyeQolT0ZmfV3fwi9szUwv5RkecP0CXGhKU3Z69NB9aiTyRrl9O06hRI+tSOXI45WnM787pPJ1/qE0uJv1FHnZnWf1PDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IwlNJAxUiFTAnE+salI451Y4jxm6YCTNoDxtPhirpE=;
 b=pMWV97mYefrLZmF5z4kCKwDJjXga9OdSTKSme3kYjZg6//HrTlgpYOfVf2Olpowy6/BMmCVQBbRpRfEX+JKWH2H1vBUZRh4io2Nc66EELqSGRr9ZEzpqKd0qGc1N2Rgfw8yAeM3Xm49F4wxMbxDpk5WMxJLocMF9WZAWn/fIkHJ2x/M3fyxe+7d34KQLZO2P5dj/G8StPTjn3zpJmFmBPhOkK3lAjeBRcdsC2DaSSdK2388vNi4/zriOTzVLv1Z2IvRRXOF74zF5I36I9wDOITaetvGAE0TmN2XgVK/O3LDxxj85kTHgORYE6mLfR3nYtJPyhCJru0QileB9mNnDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IwlNJAxUiFTAnE+salI451Y4jxm6YCTNoDxtPhirpE=;
 b=LAm0ckmQHUu7KLkKEF864gLNc2WLDINj90MjHZUVHDdijeJhQueZUGR+YMgqMIgr/D4U+iqpRqi5htLsGxSpNjOxH0ICT9+sv/JJ+6OkEiQrVP4ZBaxdQnl0wv/TGHB5S9fxSnG4VOtcS/3m6cdYhO6HxNk7yl0LNfe4m7kcwJ6pDuRf7q3pvhw9MqB0nCfgBhNWs0SH9aYTAc7jc6PGvuAceMC+tmTx+SJhLzI6PaYcEE4bxc+vspCn5s0ZD7H8Xqd8+Rx06B6dP2kWMhzVQ1BSVDYx3ddwnVWg2+DcVFyCseE58/6jtGyQTT8cldJ28H3v6d7Zdca4JyAKxyvKPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by VI0P189MB3176.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 13:41:24 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 13:41:23 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2 2/2] libcheck: add ptest support
Date: Tue, 18 Nov 2025 14:41:18 +0100
Message-ID: <20251118134118.29882-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::6) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|VI0P189MB3176:EE_
X-MS-Office365-Filtering-Correlation-Id: fa73503b-e264-44fe-a23c-08de26a82a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Icj8JegSbSx9W5rMAFVa3NDAi3UapJPWNs0paTVRS7PJ0K7Es9j22eZ+eNcu?=
 =?us-ascii?Q?DhtM3r3osYtoFe5WPMCoBWxG/x6yj0UGQETIzFhdJPN4VNSD/z8WKqVKzBoR?=
 =?us-ascii?Q?8F/T/t0OWJBSuNDlIw1+JZ5Vk1I0nwFCXv8sQdQ9HXPSvLROLsHolgHpKrmq?=
 =?us-ascii?Q?8JaipcgS7LTGTcMqWXl/gV0nR8qzBgQuV0ytj5BlI9ZNIPDmyoheN0hj4fPR?=
 =?us-ascii?Q?herZDQC81PxxTHxpFOjxCJm2x0xqXyRNA1QbLLEALlVxTVngrme9akwe5t6L?=
 =?us-ascii?Q?ot2W3ghhJ/7KU21i0DQV+KTohW8YFvhfGfcaW0YgWmeJl5VYKiabSsw2/oNq?=
 =?us-ascii?Q?Jilq0w3Kywk0Fuy4lNxfM3NqWTNM03fqb4kWqNUeTpe+RjnrcQqY+9/ZARKv?=
 =?us-ascii?Q?AmSepXoK73EK9/TbDvcPx/co89sPnxWNZRxKZi+XrDAwjqU/E3KyEA/yp7Ff?=
 =?us-ascii?Q?BkHFeQG2/x+m6aQ+Pb6br9VqAsCY3MNh0s4WIJW14IBkvA0hLBxpZJehURqx?=
 =?us-ascii?Q?ZEtcvGgc7IDXVn4PHjRqTJH7NJj1ZpVmrm1o6jZit0/rcYQ3wrifBweg1mIS?=
 =?us-ascii?Q?tzPYB8yAX1zag1jNND21ftYwsiYbWUb9M+1wN9vZPHeEjtY/Ph8qqQ5UD6lR?=
 =?us-ascii?Q?ZRmBAdnW9J3u5l4cLn9APzGXVMjMcsUWSXtqV8XPJr70cz76V8BkSEPUNXW8?=
 =?us-ascii?Q?wRiJzvZB/zhxhXAewgZCmWGass7WAPge9Ew5Gc+BNVsPA+jZyRFCwuaQQhJa?=
 =?us-ascii?Q?giSbxRfu+y+nNre66Ol6zpbPnkqj7v6E0MZFlwASCzYDe+0wYn/wZWU1XVnk?=
 =?us-ascii?Q?fxWLvpqV8ZaY2CF+C+so2KshFchGryy4njqiNvKxWH3B68zaG8CAFFamxABb?=
 =?us-ascii?Q?mPrpgoP1GLansBlUzr2wX8Vaorw35CJmleLtHBmZGpba9FV5m1dZsyeMxfBZ?=
 =?us-ascii?Q?hEPQSopAbPu09OkIc2tWgvQLOEtVqIRv44XTogHCDGD7K7PPcOKHAefm60ps?=
 =?us-ascii?Q?0GHFXNW9829QFlKv+Btnk1dI17dp1HpPolNtZ+4iDO5lzKCXhHqqEjO4Gon1?=
 =?us-ascii?Q?gXetkP/ZoLYUjGybhVrNWKNLESplkgnPeN6F6lkYG190hOB1MOtfIKWNRBry?=
 =?us-ascii?Q?ygWBV7v0PlDvnzhyuVJ2HPnJYmQ3OEMnkGMDM3BeiSKqWpp0HhdYLgEpOEuJ?=
 =?us-ascii?Q?g8La4QdzrQcXU4S+a8w4vHtnxgRnaUDxbUHcOmry6bMj4BeHRk2flmsF5dat?=
 =?us-ascii?Q?FuX6ZeHZJtJbnq4KctSG5Sq5jaLmFOmlxWOsIh7uC8X44znLaWV+7weH+BEq?=
 =?us-ascii?Q?GZ0G+6Zkc/WTgnXKVGxJp+4LSEPsy6bpRj/HZk7jvBYPUeb3pFoHiCutfRm/?=
 =?us-ascii?Q?V9KC0FwspmtPqFTcoAUZt8CmrTVy2duGEIfmj1q6KWWZfYv2bg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8vT7kwrnE0Ipg6VVVXhABOCdn4RZJKBnVOGq651XmiTZWMNubEWf06TmSiZ8?=
 =?us-ascii?Q?ipZ0Euyv6tSUwEq7HG9m4a5VsYOkmsujfBZhnazo1jfYq5oynfSZ5dytEjqU?=
 =?us-ascii?Q?O7BIuNMbgs8gh+EarIrRyZxVcyon3G65UjLGdZAK2O/ap2iXpGMSN3nJe56Y?=
 =?us-ascii?Q?HjYTrEFOx7GTfIogxbM/p+yPYXUDGhEdlQ7/h3RAJ/+M8qEaxiCqoVFjrnzz?=
 =?us-ascii?Q?B6bBzyjum0tmDy+FQ2FCLt+bbG+nAZ/9PXmFqSh0Fp+DLNWEEBVPe6py4fOt?=
 =?us-ascii?Q?gTn3B9UncfpDTDOhXdl2FjEx1+H5F7onG4q7tV65SVRekfbYZGvgWpAaaZil?=
 =?us-ascii?Q?Etft7YfCZv4+AaejPp9GWi8gYM80K7jvbecE+zDb98X45vpGxtyBbu4ECXFC?=
 =?us-ascii?Q?BtqmIdrxWl8vOOM26KPGumV1ZfM1IpOmsMvTpdOdycw9CJYLKaDDXRsB+MdS?=
 =?us-ascii?Q?eo/pxhwo3Pc1fYyhsAq45K4r6raJ0YvT/Cepu+MFj+vyLDngu7rSSkWObUCX?=
 =?us-ascii?Q?1DmpZpBFQBol2p0bGtuepJTdYqkaBOd6fQIo7jbq1XNiUC6tAirfrwWPEg9s?=
 =?us-ascii?Q?YYmJu/HqrhyFT9PN2iw9t+tWZY3GCKUnfuG8+qouLlqnw86TRJquqFBnLyxz?=
 =?us-ascii?Q?/SSLDk2clvhNEcZwtdj+LDFX+ZZbTh+nym+RtRTfZZqNxfeUhb4nmp9yDT+j?=
 =?us-ascii?Q?JFjxVAcrgB3DcdCXZox7gtOomwde2dbu9dTTke1eZpZBg+KrjfVy3863Y2aB?=
 =?us-ascii?Q?BrpeF/JDKz9b/JbDMrCd1ZgS912T7GPviHLKfpQXDna833yc6rTMPDrRpIkK?=
 =?us-ascii?Q?oiorlzPoVKpNrBHTy08eZTXFE8hzRC8okCcrn6APnsPBYqT/sodwPyI2CjED?=
 =?us-ascii?Q?zk0GJeCEHkCYzUDQ0+jpHghsaNPjaxY6zaj+uKQoWuXWLechZSPK5i4EyX7U?=
 =?us-ascii?Q?6qr9x+bHJ993a8CACgZ+N3jO8lAdhnVdeXCUqX1MTFelwiE9iH6FfnooJvsr?=
 =?us-ascii?Q?cQ16zjcEAI3kNyaly/czC/8jSRwYPnVQ9pdGoAObaexKO0EtgGA1CK6450XO?=
 =?us-ascii?Q?BQ8NTFdrNjaIy176nBszTFcKb7jXg5L1b2L30/p/UeJ81H9QdckfC86QwlMr?=
 =?us-ascii?Q?xLr4x4Jk4zSmvRXY3oPxFpAxME9XCfqo5Sr/f7Po0dU1HAq6IEL8BrBCAbSM?=
 =?us-ascii?Q?DB/xKmuqefnpxkbfQ3qnUGC/WV5Rut3ymKheBPou6YW56wA3bPOUq2wKI4fU?=
 =?us-ascii?Q?I509S6y1v2exPOEMfMERCnXfsLXp2UuRHn09izzOuF8emnCuodyYNXJQ5bI0?=
 =?us-ascii?Q?N1BLa4eCokYJvUN5/8XnmL6LLGABZ7w02Vxy3Iqc4Aw3aDxMB02Idk6kKwx/?=
 =?us-ascii?Q?+UxoNIAJT6EBYrJZ6JKzCwc/pgt/C7aRIjjOW31BX6iiWruinEkUggHVqiOc?=
 =?us-ascii?Q?lrCByqWiYQqJhTXeEC9GoVVXY1iw12qrP1sXn26wpaKpPQhYEfG8cTtuFKVs?=
 =?us-ascii?Q?4kovJizx3lXzeBIKgamiYUJmciBn5XKmHdiijh99qSYg4ycNnBmv+4qGGdP1?=
 =?us-ascii?Q?9kTecWjipNwI9MWM9TtzMUkudt72ER8NOmP4a4KW/eS+UF+Im3ByDCxn93fS?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fa73503b-e264-44fe-a23c-08de26a82a18
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:41:23.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cr9BNVhildBBX16qRqmks/G7OAj+IPthWXCOr7MV3BZP5GtHEMyeUIOEuV44rHJPzSjZuc/dfGz5sMobSwe02Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 13:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226526

Add package test (ptest) support to libcheck recipe to enable
running the test suite on target devices.

The implementation installs:
- Test binaries (check_check, check_check_export)
- Test helper binaries and scripts
- Shell script tests that validate various output formats
- Test configuration files

All 9 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libcheck/ptest
PASS: check_check_export
PASS: check_check
PASS: test_output.sh
PASS: test_check_nofork.sh
PASS: test_check_nofork_teardown.sh
PASS: test_xml_output.sh
PASS: test_log_output.sh
PASS: test_set_max_msg_size.sh
PASS: test_tap_output.sh
END: /usr/lib/libcheck/ptest
STOP: ptest-runner

Note: The test_vars SRCDIR path is set to /usr/src/debug/libcheck/0.15.2/te=
sts
to match the debug source paths embedded in compiled binaries.

Changes in v2:
- Merged duplicate test loops in run-ptest
- Hardcoded binary list instead of dynamic detection
- Use *.sh glob for installing test scripts
- Use ${TARGET_DBGSRC_DIR} instead of hardcoded path
- Removed redundant RDEPENDS

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libcheck/libcheck/run-ptest               | 24 ++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               | 28 +++++++++++++++++--
 3 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 06d113e264..3cd5f244be 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libcheck \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-support/libcheck/libcheck/run-ptest b/meta/recipe=
s-support/libcheck/libcheck/run-ptest
new file mode 100644
index 0000000000..6523b1d146
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# run-ptest script for libcheck
+# Runs the libcheck test suite and outputs results in ptest format
+
+cd tests || exit 1
+
+for test in check_check_export check_check \
+            test_output.sh test_check_nofork.sh test_check_nofork_teardown=
.sh \
+            test_xml_output.sh test_log_output.sh test_set_max_msg_size.sh=
 \
+            test_tap_output.sh; do
+    if [ -x ./$test ]; then
+        ./$test > /dev/null 2>&1
+        if [ $? -eq 0 ]; then
+            echo "PASS: $test"
+        else
+            echo "FAIL: $test"
+        fi
+    else
+        echo "SKIP: $test"
+    fi
+done
+
+exit 0
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipe=
s-support/libcheck/libcheck_0.15.2.bb
index adf95f5040..e45c1d0264 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -6,7 +6,6 @@ segmentation faults or other signals can be caught. Test re=
sults are \
 reportable in the following: Subunit, TAP, XML, and a generic logging form=
at."
 HOMEPAGE =3D "https://libcheck.github.io/check/"
 SECTION =3D "devel"
-
 LICENSE  =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D2d5025d4aa3495befef8f172=
06a5b0a1"
=20
@@ -14,20 +13,45 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/check-${=
PV}.tar.gz \
            file://automake-output.patch \
            file://subunit.patch \
            file://0001-Fix-texinfo-errors-and-warnings.patch \
+           file://run-ptest \
 "
=20
 SRC_URI[sha256sum] =3D "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835=
eb1a52932fa20a"
+
 GITHUB_BASE_URI =3D "https://github.com/libcheck/check/releases/"
=20
 S =3D "${UNPACKDIR}/check-${PV}"
=20
-inherit cmake pkgconfig texinfo github-releases
+inherit cmake pkgconfig texinfo github-releases ptest
=20
 RREPLACES:${PN} =3D "check (<=3D 0.9.5)"
=20
 EXTRA_OECMAKE:append:class-target =3D " -DAWK_PATH=3D${bindir}/awk"
 EXTRA_OECMAKE =3D "-DENABLE_SUBUNIT_EXT=3DOFF"
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    install -m 0755 ${B}/tests/check_check ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_check_export ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/ex_output ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_nofork ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_nofork_teardown ${D}${PTEST_PATH}/tes=
ts/
+    install -m 0755 ${B}/tests/check_set_max_msg_size ${D}${PTEST_PATH}/te=
sts/
+
+    install -m 0755 ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
+
+    install -m 0755 ${S}/tests/test_output_strings ${D}${PTEST_PATH}/tests=
/
+
+    if [ -f ${B}/tests/test_vars ]; then
+        install -m 0644 ${B}/tests/test_vars ${D}${PTEST_PATH}/tests/
+        sed -i \
+            -e 's|if \[ x"[^"]*" !=3D x"\." \];|if \[ x"${TARGET_DBGSRC_DI=
R}/tests" !=3D x"." \];|g' \
+            -e 's|SRCDIR=3D"[^"]*"|SRCDIR=3D"${TARGET_DBGSRC_DIR}/tests/"|=
g' \
+            ${D}${PTEST_PATH}/tests/test_vars
+    fi
+}
+
 do_install:append:class-native() {
     create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
 }
--=20
2.43.0


