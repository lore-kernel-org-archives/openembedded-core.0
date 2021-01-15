Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.1801.1610703952164923422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 01:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UToDd2df;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz0cG1NEdTLD36nFmu0wgLFkYxYwI3Y5BxsjccUMBiRh8DeBClwfWxKblDXQN+e6cXxGg+rbNmlvaHPbWosFkw2R8LnuErMa9Zfu9XjDjGLPi7+0rvZU1r8O0zGSxmrQNVL88cUxizNRULMblwH0tJz1xkmsQH+iQynuDcOTYFigFxIMoYHsngngB9Bmn5AYHhBFetkH7uVM8pHzHsJGOnxnfLQTfZjfLz89kvtS+nroPj6NQ7oq/eqJaR05MseScjiICn1pexnbflGiT0W4betCHKo1C19GwrxN5zrTMTe5QnL00g0PbuQzdccSxSQnpcNW6mHQIjongvbTnd0//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uL2eh/do6tfAKQ82r/vOwEwVj8oQi7hHLUIZJ4QGQ14=;
 b=hjufaCwElchqKN1UTOnHR/0RcSKW4ukqTufruswjhL8Ni9SRevbmmygex3rsad1iD7DhkyWIzHR1j7b+6TM6l0fza4ijwX/fdH5CBn1Qr88JQ1XN97gLTTMdKzUDgY8/oazrOTtZsgLfc2dvg0v9SJq1WyIXJkNRrwi7xaDlL5yVyQUkYgY84D6uRvtEFgczNwuaFjgdOYCHQdEJprx31i0r2+oYR2FJuCiryHEy1b33qtklk2pRCwe8kYA6XOLaUdnAfTkQsXmGrF3DdyaxZ80e/lDhP7Zex9X6+TZL8UvhVJsCK4/2oQCNW4d2eg1oacvuuuJjZFjGTX7z84jt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uL2eh/do6tfAKQ82r/vOwEwVj8oQi7hHLUIZJ4QGQ14=;
 b=UToDd2dfzlhpWgInNwte7H2i27i8TY2nW7C0B06xdqC1UW21fDHB0VjVDzo32pn74iQNWNDvpSlB90hXJDdTBfkZL8yDbOc0+KTdYK7TVsHsDNbVkIViqxMMKlyapKCmwZLfqiLUEESuzKmQUcqY2LM6EFsz4yIz1GneMpIRz9w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4369.namprd11.prod.outlook.com (2603:10b6:a03:1cb::25)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 09:45:51 +0000
Received: from BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::2d75:bcae:f805:57db]) by BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::2d75:bcae:f805:57db%3]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 09:45:51 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] apt: add nativesdk support
Date: Fri, 15 Jan 2021 17:45:35 +0800
Message-Id: <20210115094536.18651-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20210115094536.18651-1-hongxu.jia@windriver.com>
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To BY5PR11MB4369.namprd11.prod.outlook.com
 (2603:10b6:a03:1cb::25)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.7 via Frontend Transport; Fri, 15 Jan 2021 09:45:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bf16596-83a7-410a-a90a-08d8b93a5824
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5040:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50407FC48B86C0229D2E01E594A70@SJ0PR11MB5040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dZnOxAuQ+VJuP9qe0V0QyVsbPf0pKgRDlNJC8req7u5ERMqpkInt62fIjXtv9nyrbbnTT8hy1mAFZgsKst/+wjFklPxcxtU1w1RxNMipCgP8mNmc7JJ6JvMM6qPXK8DGpbAEk8q4OSo40bfZkQZVkmr/XaOfUSLDKdM0nOd9L+GZAC5DTI0f8j+cIKwsWeqOWUCJY+nY2YTzaPICncdEfOh5jiVkadyxDPF7kDHgl8FOlvh56UsgHlNcb5IhX/hrcg5I4BimpST0/t1DSZ8Pen4JE2lt8rvxWzco4XRhouqU6sloJo34A/POywtZQ9eUtvU8UMfk0L1jK7PKj5wCI3FG0HmWlBT46EEeAJeNV2C5d4f10Vxhu5X+B7rcMkismkX1ERvpEYqu4/2OnOsTfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4369.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(6512007)(66946007)(36756003)(316002)(956004)(66476007)(66556008)(6486002)(478600001)(186003)(86362001)(8936002)(2616005)(44832011)(83380400001)(6506007)(16526019)(8676002)(5660300002)(26005)(2906002)(1076003)(6916009)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?zr9oaeWEeVEtfRWNGyg4Fm9UI5x5qu7APf/EvbKcmuZbr/vjcF1NAk5Y31Zs?=
 =?us-ascii?Q?wsmOzCCCS43jKOGB5QsAXiVnRfibJyAfJwHNQ55BwDuAKaJXvSRSgaWc2k05?=
 =?us-ascii?Q?xyxcKAZTmxIebY2Gpf6afCrhaGg2t6AOX/yu4Omp6FPIRzpWd7vqpUIP5Lvm?=
 =?us-ascii?Q?9wRw12E7ZSc0dMjugjjIZfRPC2NUcyvvRZXbasozViytrnesmjVVNilEuEZo?=
 =?us-ascii?Q?dxfw2CJ+ICUoKaJscmjZ/bIj+A5T3HYOcTCDCJEk4TCPeq+r9UxpbX0RW/j/?=
 =?us-ascii?Q?PjoA8+kyf2c5EiQ6u5kG7zlLlOo7zhBrpyQPG5sbArmdgZ2NECjU/dwTKeTT?=
 =?us-ascii?Q?TQVx0FnetZ3+nlj1MqgPZTZ4iYyvWN07OsiT2NdwabHkVtgpBLPR/1jjEkep?=
 =?us-ascii?Q?lB1vu1G7E2qNusYk4JL0PHmVHUbBjMlX6Aj1V7Wzmcq4dw4VVu9/vYCRb9XI?=
 =?us-ascii?Q?6U1Qw/INzhJFvk08h37fYECJMzx0yjxzmkQIwHhNuOHI/WQ7ixvIa9cmnvKe?=
 =?us-ascii?Q?mOvLJHeU1UiC5Y5RxObiQYHbNbhWamalcsLWFJuXlEJJCFHd6DliVIK0uemG?=
 =?us-ascii?Q?tXXWHbpubPeBgvU1rzTjUE32dA5JeTNOpEz7b+AKYGXKa6ZnoaSyxvokHmhu?=
 =?us-ascii?Q?sYgsv4EjOYCkjBjO+c/QhAAPbq3EOG6yqzH7WLe2rVuMW4JqcdcItXWVYaII?=
 =?us-ascii?Q?M8mCatrUfrSP7eObZWOJSwmpRZ3nnDkYr60D/j+1uA1EaHgxjrQFaVnOabLo?=
 =?us-ascii?Q?Hej/pwHH4FuUlL3YuejOup24q7y5KZNzmLMRDrg0cZKh6TZfIxO0UJS9OtO2?=
 =?us-ascii?Q?Z22yYikUDHZ4ze4Q5chspg/e5qbHqqG2KXSYWwytGyGun4jAQp8nUOt4Hjja?=
 =?us-ascii?Q?UJ2i7g9mSqxnE9CHCpDFHYocDf1b57gL6hrVH0biC9mJYQELeJoEm048anNp?=
 =?us-ascii?Q?UO9RE9jbrbJ8HOM1RTKWTzPIlufMk5huwYqZx78dPkDeuS2D6DCkQKWAJ9ec?=
 =?us-ascii?Q?64hR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf16596-83a7-410a-a90a-08d8b93a5824
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4369.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 09:45:51.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFtodiRenFG7mIqgjnH3Cn+tClOQuRDpI+TXSbVuP60CyKnTCK5EPy7VdHDaI/EkIzy7TIs6ejNiUgzmOGmQDApFGyDYki+gTImbUXyrql4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
Content-Type: text/plain

1. Add nativesdk support
- Apply the same patches of native
- Generate the same apt.conf.sample of native

2. Create user '_apt' to fix apt runtime warning
[snip]
$ apt update
...
W: No sandbox user '_apt' on the system, can not drop privileges
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/apt/apt_1.8.2.1.bb | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_1.8.2.1.bb b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
index de0e150a2e..57bd7ca600 100644
--- a/meta/recipes-devtools/apt/apt_1.8.2.1.bb
+++ b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
@@ -17,6 +17,12 @@ SRC_URI_append_class-native = " \
            file://0001-Do-not-configure-packages-on-installation.patch \
            "
 
+SRC_URI_append_class-nativesdk = " \
+           file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
+           file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
+           file://0001-Do-not-configure-packages-on-installation.patch \
+           "
+
 SRC_URI[sha256sum] = "6d447f2e9437ec24e78350b63bb0592bee1f050811d51990b0c783183b0983f8"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
@@ -24,9 +30,12 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 
-inherit cmake perlnative bash-completion upstream-version-is-even
+inherit cmake perlnative bash-completion upstream-version-is-even useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --home /nonexistent --no-create-home _apt"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS += "virtual/libiconv virtual/libintl db gnutls lz4 zlib bzip2 xz"
 
@@ -41,7 +50,7 @@ do_configure_prepend () {
 FILES_${PN} += "${prefix}/lib/dpkg ${prefix}/lib/apt"
 RDEPENDS_${PN} += "bash perl dpkg"
 
-do_install_append_class-native() {
+customize_apt_conf_sample() {
     cat > ${D}${sysconfdir}/apt/apt.conf.sample << EOF
 Dir "${STAGING_DIR_NATIVE}/"
 {
@@ -94,6 +103,15 @@ DPkg::Path "";
 EOF
 }
 
+do_install_append_class-native() {
+    customize_apt_conf_sample
+}
+
+do_install_append_class-nativesdk() {
+    customize_apt_conf_sample
+}
+
+
 do_install_append_class-target() {
     #Write the correct apt-architecture to apt.conf
     APT_CONF=${D}/etc/apt/apt.conf
-- 
2.18.2

