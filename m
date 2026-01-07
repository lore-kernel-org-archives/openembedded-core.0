Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CE4CF6C19
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:15:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2275.1767777348067354696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=I1ILiykG;
 spf=pass (domain: est.tech, ip: 52.101.84.20, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxy1TiR6WTcFx8Hg3qZMik4UjIT68Kcmj/5jgAxV5MhjWSGdwq3b+1z1Y0IbeVoaaAIy4+gT20ZRw1vifQkMZm141Eouofv9hPHrtPPRosiVYEh131jPjriDe2LzyjnzaRz7fLtn4GabkDh4MpZKyAcoTTHJHRLd5JTlhp953mN0i0KNV8eqwFww2FZCDtk0R7/K/TgLsu5IhiOmtf6RWyvu93VCCG47eckT9EKQGHyiYRoVCyhu6wSsdhWHsPB2cdDQ/xj4Vd+sY9IKhW6elA2Y7iHFol49UkOrqB1CKFkAj12sMQ3KNz2DCpy6RLId8MV8QKeQUVhHpP54Y7x7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzGSWXjjeyPKJ+8lrdZEFSKEiguW6jeFu72sB0Jr62o=;
 b=uoqqp0/L5imukMJ1yzHJdEP91vr2Ob9H0o35U05dz+H3C/yTqANR/zBwiWvnDuBefwPaVplEnp0GFwfIdni91HAwnI8KMlUaf9QMEhvgBeQLCMppc3UHIuDFVchH4tJq20T0gXSj1ZDDawSZ5lU1RQN5GiCNNdiHGMpLyN47ksFEo9THKe1s/on/rCiUsabH51jMt3/46RX/JCB3J5Tcwj5YTr3N7//OxEZj/P1/2BZ0Z6XqaKBEmI0uuoksws4OUC4TmDp6T4YJs5TgKVthuZvc3ltZjM9sDf7eAV0IfpdF0FCMio3PhjAkwjMi9r85pACLOrP2kIikruPB8c7Ikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzGSWXjjeyPKJ+8lrdZEFSKEiguW6jeFu72sB0Jr62o=;
 b=I1ILiykGhCCF+GgAANBbZ95psvQaj+2C2yqYu5/9iIwoG97lmQycMm6K1pFol77TXSl2XUNQzkDfCtzMyGFO/VHgGSXYM1+TqjD8qcVNfNhgiJHSS2Nz9cNzog40WC4aRSB+hhPwfTR/kIio+ecd2J/6+FFcKhGir1jTC8xWvJ2PAc0YD2HZLHHMHIWJcHert0A6zC+qyjdF7qIqCvbpLzunqZHtv0GhwviK7IoOtEDnT/Se1gNIeIHU62VTNk0IYq0YISZjXWSHTxbwmH9w8cUpqefUmAjH3jhyZED5K28zTc/Oog2fk0Mk6yz3BLujVPbzeD1vFpZisZOYY6pbdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS8P189MB2022.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:509::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:15:42 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:15:42 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libcheck: add ptest support
Date: Wed,  7 Jan 2026 10:15:37 +0100
Message-ID: <20260107091537.18096-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114014145.23826-1-pratik.farkase@est.tech>
References: <20251114014145.23826-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AS8P189MB2022:EE_
X-MS-Office365-Filtering-Correlation-Id: 83366671-1394-4457-5cf6-08de4dcd5523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CEAndEJymr9j2hclcI89KzrxdlLsrt3YlI7O2UTURnlnvTBoxwt6Hnj/Eqlx?=
 =?us-ascii?Q?yI1Nv7rTBCy8nWbNaxdR2iqpSfSsYMCXg2Q1zacTCe96VEjTEwXwed7WXJCZ?=
 =?us-ascii?Q?niPxPDJJZCXtR8iBRLQVbPksI4fKI70QUtYd+tuQB5tm4dhccD9s85TkbU5S?=
 =?us-ascii?Q?JcohU9aQWWVDq+1mjNQBGFzl2jLFZqTlSZ/9TTY4YAqCb/M2085UQNCOqpdD?=
 =?us-ascii?Q?CNlm0muzMHeV8Fw1y91NWZdOSxyV/MoywTFRauJj+8sHGjaVSNvNv9tX9ULM?=
 =?us-ascii?Q?tYFUdfyHw4tZKXSOq67UMUWm+mrofyFc9EZElqrXXm8Owy67ktUJSdgFgq2V?=
 =?us-ascii?Q?MkV29ByfXCSL9w6s7CyKcUsCHHOBy17kvg4A79ZMlF6QzFZ5KBUN2ogAtbLt?=
 =?us-ascii?Q?oQmIiqjfQgkY+CpkAxkwbzZmO0eYIdhb1LvLONvqI/TIFViZNi1u/Lz2v6x4?=
 =?us-ascii?Q?4vWgh6DqUQBE+UkKAIJOpwSJ8G0Ev/kHtEoD33M4bkelkd18winY3I+XLst1?=
 =?us-ascii?Q?sDYAk4wI2CKzfZEiX6GtdpMKi0XVhcefuG3vtaYsAFcx8ffLdr8r/NMFxbm6?=
 =?us-ascii?Q?84JgNlQz22Pi41xbji22aUN7ROWL6VXwLwgWaZZom2zm2tpcBsFtLrJNwWh/?=
 =?us-ascii?Q?Rs/RZEJ1GgVyFPn9w0iPh0sKkaAkjBXD1Ubne0PnAQ65oBjTMKmYcUm05k2I?=
 =?us-ascii?Q?bLiDGmXi68TxN76duvlIORNasETEiIXMzD+Q09b1zX/nVPZQIb6k1Ah33j+h?=
 =?us-ascii?Q?vxoDHNtlxhR5rc3RkWs5tnJcP7LxlSbScM08Bc3gM1rQbVD5SQ/lR5psKh7T?=
 =?us-ascii?Q?Ksu9pbtK/bghc5Ml+f+mVUgRNgATGAUj9dCSW+4VUdRymmPMJ0WiDiEUtZPw?=
 =?us-ascii?Q?5WlRHUmcR0UTt9glTnFEjGGZCULo7EytwS8+qziB+9IiDWYPn4kx4ONexPUy?=
 =?us-ascii?Q?9ALgLrqmS8IDCVEDavz8+g032ownQyKQ6TOLex7Xfj2sVwdovTmezQGxcJo/?=
 =?us-ascii?Q?zW1Hv+3pZPfQKnum9kqNhqGnHIRwwYuPm+LD+C0tkHs5bHgm/hVa/vA6lCyO?=
 =?us-ascii?Q?abWF+3LVxQz9NuoMasKNYMK7IlpZUJ6ENofbry85/RPQH21hVib+J46ngnfS?=
 =?us-ascii?Q?JhZ+QP9VWM2WN6D5wofmMn3S9YipI3+f+MCqxiebLnXAY6SgyhaLmP95t4Kb?=
 =?us-ascii?Q?6USQJ+fiC7A0bNmMCStYLpbUg069Sitfq1H5m4sP9NASz1vzO/MVk+DouTXA?=
 =?us-ascii?Q?Bie80xwuBtmhKQm/ygXKRu/t/3WVKWmuny0xvn/upQeOiH7Uk2NJYuyfvBYE?=
 =?us-ascii?Q?qFaGufye4dyWFjHC6Mo+off+1aVaWrMgA9n0lebipx+guAUNWQC8l2LkA5AZ?=
 =?us-ascii?Q?cPtuqCdmgrqHEfyprC2R5t3MzqIDycY34W0ro0PEZUn0Z4fdLg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RCfvpZ4dSJJVYP8avD2wz1PEuXGo7y5afhaErbfcLnsDFsmHD7+2vYHQsAp9?=
 =?us-ascii?Q?N/efUXDAraH5AfGQIVHAlLBt6NG1k4tRUVgaLb+tpX96ngD2u8o8ivTMK57I?=
 =?us-ascii?Q?dsSd9symfGmv85LUWGGqUtAWIfXmVkB7ItRfiqdDRQoFCIhTesY9Yeso9niU?=
 =?us-ascii?Q?D5oWpCTVliY+q145bTdMx0wPasg9PKXtStBLyK4gf3pnNqQIg0PQECA26JfE?=
 =?us-ascii?Q?vPQncZWnTKR6Gsuhjo1Fxo72aqip2R75EyypJvDq5W1DLDY32F0xDe7hO34u?=
 =?us-ascii?Q?TYfu9bterYle/MUUBWT2HPNiqVKFkD5VjQ1h8pkqubAxWir0d/w0Uu3RV9AV?=
 =?us-ascii?Q?0gZmBmVLtfnqdvWLhhW1yNuvD9ac0g02/7Mo0kqTdlAFXSn/I91i8XntVSXl?=
 =?us-ascii?Q?cYgVeDMy35kxjYd5d4EoXG8a0H1XfCp+xOTRE0eUdjvqlaz8GZiXIUVaftvC?=
 =?us-ascii?Q?dkwybuB49uTAK2avNdYKye+/V/DzbkVYtm2H14Bin9T8h8PUCYMxrpYEDXxA?=
 =?us-ascii?Q?YwZ/5on2d1/yZ4hDY6rV2iFyle0L4ESTL01ostFtAPb27XsmR9sdZircm57o?=
 =?us-ascii?Q?pTAny49u6MwMKKtVkUpTb+8d0iuGqTab6hBJ5HuDrTh8n9dII/3jtMj9UL3Y?=
 =?us-ascii?Q?5FwhA2u4buSdZww5UYFxnRfkZ96FDmTZ3Da21e1AJo4eaEOQ8kbTA14Zjhq0?=
 =?us-ascii?Q?5YViRQOxUsYCzcdvUR+zdR2hYRiFrjyWoaGg0dJi7ShsrCg/4edCqgQJgElL?=
 =?us-ascii?Q?dAiKWCUgeZr7XrweTwox27YdEUkBY0NvndpuAT7/7W0iiYOr9phxSQ9pB3XO?=
 =?us-ascii?Q?njazYsRbtk7cuUVxn4MAejpenrJ3pzoAeY6qFVcAnfblNCkJ4p6wbVu1LrsY?=
 =?us-ascii?Q?vwUFjn3UAGG9n6+aMxUloeiON3rf7VB+CYt6XMSJAlYh4BoLg9QnZ6CkFChA?=
 =?us-ascii?Q?tuMa05MFJ0mq/1B/B2ISY94GCmfk1qXGiL9+w4Mv188ofOq+emRou5/4iPKw?=
 =?us-ascii?Q?ec7BeJhmKcWthOOTTk+UOn5s9r+/tmXDk/WWvB7XxnxcoTf9qiL6ND0ci5iM?=
 =?us-ascii?Q?E4bXKHIC7poleuGwkCZwG285C1bwZ+vJqDSXu69w9Zc4EGYisgX8RdwWbXtj?=
 =?us-ascii?Q?mzPryQCQWFjTUaXDtTllOmQ7YcX+OuWBfahx5smbhpX9pMWxZxLJjAAVaJl5?=
 =?us-ascii?Q?U5hJ2lco7ql38TCA2cNQbdm2NnZAOUG/Q/4meUckuQ+kcgAQR6Gvkiw6XGiQ?=
 =?us-ascii?Q?lMvpI5liwD9FWxECiDxFGntyX/3f5/zdit1j2fHEnSKXUMg8tL4ED/p4vF7N?=
 =?us-ascii?Q?yegAXRqpXC0idqjQkMwnYtFZdKGMrtm5EvCI7dur0/3JEV1v4H4jGZyJMxiN?=
 =?us-ascii?Q?36g0sZ2N3KD4vKlkyOCcE17XXXssVv9Hh1obH+JS8ZVjZfsIuTkMJ/Wv/CJV?=
 =?us-ascii?Q?iaxjH+d2Xgs48bTp4cZ27rRum6B30JLQVevrXxRcy3pUteDGHOyccr4DmZMD?=
 =?us-ascii?Q?Ww6qmSoZF53X4+M4orD4K9VU6hwNAC5E6W/puT+e3eC+7eOny2EAS+no6z0e?=
 =?us-ascii?Q?PokqV0KSgqJLZUgQMrAURsB9k8z2vvEd0/26K90nAyysie6hnPg3qf66Cl8r?=
 =?us-ascii?Q?q38bQSswKnvI0nPEROJ4bd0x99gXhOhBBxRRwm/lHY7DvAEp11e91aR9pypA?=
 =?us-ascii?Q?IL+DTAWAd3FPZLO0XGav/2sxhtbBuESavp1WoAzugdktXD9ixI7obZKJzPEB?=
 =?us-ascii?Q?krloxmy94A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 83366671-1394-4457-5cf6-08de4dcd5523
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:15:42.6261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPvu6sta2seOW6yduiGn2dTuRXFhr2B3KMRntAAyyhdQdVeCJpL5AUT472ONzCCUPqkL8JubISfYiP7UKw+N2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228964

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

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v2:
- Merged duplicate test loops in run-ptest
- Hardcoded binary list instead of dynamic detection
- Use *.sh glob for installing test scripts
- Use ${TARGET_DBGSRC_DIR} instead of hardcoded path
- Removed redundant RDEPENDS
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


