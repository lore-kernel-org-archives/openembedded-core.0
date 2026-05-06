Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8918ECD3424
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 08:05:17 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13465.1778054708955494513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 01:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PyTo0NZE;
 spf=pass (domain: est.tech, ip: 52.101.72.12, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSBcpYWFuwkoMUsbHGxeQSxNYjFuG2Se0ufC149kj63EDjcJHE+cazHhzn7p/zysIReBEwzm4Y/AQgpcKE/2oR9nh98IPkPIVOca7p0Q2sJJRwUFVCq8XQ2qmK5LFAKHGRyYss2w0eZ+UQJHatrd7+tT82s/yU0wt4kukGPTIhRSpibECSGz+FpFpxz1ASocbqZK+ykzQRtL8NgRroQbSeE+v7Z9xAkG6C/SqCI97XlY0Cm83ddVKUqcuokCfyClhLG7urMmGv9HmRET5+T6pN9b/+ye9CnMkPDpvOIJ93RDq4lFzx793UYLSj1iJUlHIpmOkTUVDm40VnXTLS7c+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6+ez+OQVm17pE1xw4p1DWvFBte6G5rASuuMcsl7UAk=;
 b=ScLJO0p0Bs9omBlJNbhyzk+QEiRTpu7Tsgwp2aaJL0/u/3k+cUSPzLc3OowEPr4epzegvTshF8k8jLRddFMazIVOhvQuAJ4gvhSsy4Fcp+oscOfBJrBhU0wF8SVFFn8DAuwI55CzIUCwJ4rxL46XRAWiqR2j0ZVm2+7S1z54UCRA2nPsdHEGFGqH5cjin09xttRifiNVrW92wl7E3m8W4WHUMXVa/6Ms1dRL0dUjELJG0wTyXE4W/EuE7upNxBPLOZwYOLiNvGhJg7+4lOiSosFZUb4+CiyKv1XghCLmQ1w/+bflomPBHlGQ564UHw414wXTnt+vto1PiBtbNgYy0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6+ez+OQVm17pE1xw4p1DWvFBte6G5rASuuMcsl7UAk=;
 b=PyTo0NZES+nScXD3oUKJlKfBBzDkZgfZ0g746l6FLJHJ/kueYchb4j6n37hCdBVOuyNTzwZpe2sez1xIZhQw9iw03D7/vfRX1nYB/fNYdbS7syUSaL1eWdyX4vvZd+o8vgdaWDP1z0EWzhO/yLFABmZdymiWPA1YU6V3+CtwFA1IQqT8P/VHG8YNYuYK2HM2BAZerDFbHIszWkN1nvVaOlzj5OqXu6F4jPQXtfXLaojY2ApJATjaWbzSi0umqTYUQNZotpQ4EfcNiwAvtOGtrsVbDO3d6MVM2mBFjGHMp3YnZmEXMbNXInTAmqOiG14K5OUuLBdxFv51UzVGI/aKqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV1P189MB2674.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:05:03 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:05:03 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libatomic-ops: add ptest support
Date: Wed,  6 May 2026 10:04:59 +0200
Message-ID: <20260506080459.21650-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::13) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV1P189MB2674:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ad0739-81f1-458f-e037-08deab462d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	oW0MdrfA73MpGLaTwVOY5t7rtqJ1XhUmvcLlYLQiUbAYblY8CYXyN2B+oMaJrVbvCCYrey3J0Btym3upn9OrP/DFHV73nDmKl3ManTlYgbjutiDsXdv3YH77aWwS0UofMVWfBrytAuFIAkqURDME7IYTHPLGul4PI7NMwqqhNmYXcZNmKvBQZVX0TgI8cmj8znf1ocQOA+GdChn473dBm4tqYV0Z2kYF1u/ceITD1lAUklqkhV6G5YOg+3cWuoVXbJ8eb3Yex24jELuq9sbvryCyi6QzZ51pAre/Dnr1lJisnG9IosXaIT/ZqVKjYkynf1lLTODgkyeX9K5m/93y1GsOS5Ale/rc7LOFsGlES9FdHJtwtEKRhy4II2fc/lcSKGRjN8SGsZ595SDrM3z3phH46yq/388qvMFG4yUVif+Bk22NI4aL/fdRFo6sC37X2fU0ED85DMdR0dck2ZqXHfwTqfBI++JIoZjNWx+GjX50Y4hHNxNGKsQOMt4omJ/ZOVspurdXAlsXGNVkPsrrqdHAT1TohanCARYxSH5Pgh9Zl5h/3BxEnITkB0AVdAyIp9dkb8QnDWsR2lJtz7l2Y7CfwSNkhlLphTOyGIN5kaB6K9Eb5c+FzhdiF1LYw+elO5aY0h6nktQ9BKi/W2nOaEuhTKi4JiZ+uW1buh5nQ+xR01w29KH/lgvekwLXdS1A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dRqHVn3Gs5Tb2+hzO6JUX9LjfvhzAsw2LYfLktxSVwyK/iNqp9MRYBRdJXKr?=
 =?us-ascii?Q?IgiLpiOOp/fYHvNoVet+x5pWYx7ncGbGyut9LCizZ3QPIrIvKAIwWPCdIR/R?=
 =?us-ascii?Q?Pq9wtzZ1ARS/n491GYolQcazYA/3iqN9kCkDAgWa9EsyLj/WwO+2WV2Gcupi?=
 =?us-ascii?Q?ebGBMqT2LUtY3EZ5bbsKMZeTVlhED/rTgGJ8sFeOkMZ5eX7w3jkVLrhe8q4n?=
 =?us-ascii?Q?BwM2EiR+kdGphQpjvuWqfdB/X053KfHHLuFFofIaJ/z7mldq4ezggM5DHErP?=
 =?us-ascii?Q?dI1x1TrlGNPunh2OzIMzNj5TmCb9d8xHzA3Ig4hg8C4xEI4LvCsbsd2FJ8lY?=
 =?us-ascii?Q?S7MheOsAp0U/CBmnxU7IdpQPF/wuW05eLdLUYG8fWeIteYKLG+AQvvB2m4Cs?=
 =?us-ascii?Q?qlK0dtrQh1M2I5l/6UyPRd2tpC+KWW5ux1ROHs4C1jYD894I06lRp8/g9g/I?=
 =?us-ascii?Q?7aUYy8R1tZmA4J5OL9S36yaq6CiCB6D8luZTYP2OUZAhGHrzeb3e+ApLgfyU?=
 =?us-ascii?Q?ADLApO4YIVBmrxgzAoJ/bhFUEKKUR98RLFIKNgzA2SgDlp3E/S3ur5VoT+yj?=
 =?us-ascii?Q?5x8LTBM7NS2aKQ9MVDjrJIPxWIt3QNurr7ksrH2xH9YoXnUrbcmtDIpi6XtI?=
 =?us-ascii?Q?MO0sfklO3mvPaXT4QAXWv4KpappHqODUjhiGQYwhMevxFe7c6OIy8iLFJBYj?=
 =?us-ascii?Q?XMtXrbfVHyAmLHM8OCV04hRPCo6i4UgX8HI0MhwlUBKQ8t4VBQQrOJiKvNPK?=
 =?us-ascii?Q?kIFDGuGKUcG0OGPuPdQ9wqeKBu+go3yna8jVMrkkc5Go4+vbupFBkcwzvgLp?=
 =?us-ascii?Q?3l6sJa1U9XjsOkfxMFe/ey5HZQ3cIYiHb3uWvdX1e1b3lzN2OxHyJz7rjR4k?=
 =?us-ascii?Q?dXEZ0PzrQVb2RAqShR+F4Wk4k+LjJo5CqfW/3SSgKP4u9bemxXUxYp30h+iy?=
 =?us-ascii?Q?RjWthSOSRJrNd6DLi1y1wfV0XAR/RYeQXT92AF/GYhlbIf9mA9KRi9iUV6vN?=
 =?us-ascii?Q?ZqciG2PkCcm0SIdAbHN4b0zMB8NWbBAOP3T188gQIZIg9U6ale+6Jmq0IkzV?=
 =?us-ascii?Q?78v0m/n2noXnX3Y/M29O/4hp3z3lWaUsWdamUBs9h6OhB3u7uJrAw2uphzkj?=
 =?us-ascii?Q?F4QSXNwephNQW4zeiX0S3LLBmoCP5ivwrOp8sg0Ai+9Gh8sQkWpjJCkNwvjH?=
 =?us-ascii?Q?XU/LfdgZ9HH0C0pKKFzx+UsEmD5f01KLfXDlnHXBZ2e5ORdSFCPKNYwtVr0T?=
 =?us-ascii?Q?KRsr5E3BLb+f9WfCQZvZSI8y/kv3rGXqR9+8gK1GTpqJvg8xo9ldFKQssv09?=
 =?us-ascii?Q?GGDhYXU2dPszNc24WpUWuIhAp4da+1Xbmm93k2++GGZwa0Xs/1JCFG5r6RpR?=
 =?us-ascii?Q?1Cp+wSTRRRLw46JeFDD5Kmwtv3n4baLqU6si8N9ICbUJS+5YhB7Q6MOYJumx?=
 =?us-ascii?Q?pp4qs9eQVgQxs9MXbO6K3sliSsJ+QCQIQoZiOum3gAE4+fH9SpicunYbO2Lk?=
 =?us-ascii?Q?d1PXgImSOEDN0m0Mrm/huLhIph8eVeHOv2TMYpwK5VeKG40nRsUphuEE2BV4?=
 =?us-ascii?Q?nirmNwh2aDVZC0Dw5qMIkK/2eHobG7QSZSdn0zFmmZF66NsfdFoO6BClAnvw?=
 =?us-ascii?Q?6TxOhroWHqRVE1JAvD63SD+hUTVWWsaIiMbWCENMwvAJrc6zo/5NuKbUzyN1?=
 =?us-ascii?Q?y0GM2zcB11GeF11wmrj10tzFf4YBY0rc/9XlKl2bW9Qd8twt8j1bnayG8Zhh?=
 =?us-ascii?Q?YsXA+2dRyQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ad0739-81f1-458f-e037-08deab462d3e
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:05:03.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOm+mUNLgyh4CBdz3y5f2g+2IZ8crT8NFRc3v2s9xx/KXnUdNctV/j724efDQBf/NdgOUqU23h/N1WZSwv0lNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2674
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 08:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236532

Add ptest support for libatomic-ops, running the upstream test suite
which validates atomic operations, generalized emulation, pthread-based
fallbacks, lock-free stack, and memory allocation.

Tested on qemux86-64 with ptest-runner: 5 PASS, 0 FAIL.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libatomic-ops/libatomic-ops/run-ptest     | 12 ++++++++++++
 .../libatomic-ops/libatomic-ops_7.10.0.bb     | 19 +++++++++++++++++--
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libatomic-ops/libatomic-ops/run-pt=
est

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 920e63e4b4..1ce8eda46d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -31,6 +31,7 @@ PTESTS_FAST =3D "\
     json-glib \
     libarchive \
     libassuan \
+    libatomic-ops \
     libcheck \
     libconfig \
     libconvert-asn1-perl \
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops/run-ptest b/m=
eta/recipes-support/libatomic-ops/libatomic-ops/run-ptest
new file mode 100755
index 0000000000..355908b85d
--- /dev/null
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for test in $(find . -maxdepth 1 -type f -executable | sort); do
+    testname=3D$(basename "$test")
+    if ./"$test"; then
+        echo "PASS: $testname"
+    else
+        echo "FAIL: $testname"
+    fi
+done
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb b/m=
eta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
index c31ccac7b0..9971124213 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
                     file://LICENSE;md5=3D5700d28353dfa2f191ca9b1bd707865e =
\
                     "
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz=
"
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz=
 \
+           file://run-ptest \
+           "
 GITHUB_BASE_URI =3D "https://github.com/bdwgc/libatomic_ops/releases"
=20
 SRC_URI[sha256sum] =3D "0db3ebff755db170f65e74a64ec4511812e9ee3185c232eeff=
eacd274190dfb0"
@@ -19,6 +21,19 @@ S =3D "${UNPACKDIR}/libatomic_ops-${PV}"
=20
 ALLOW_EMPTY:${PN} =3D "1"
=20
-inherit autotools pkgconfig github-releases
+inherit autotools pkgconfig github-releases ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    find ${B}/tests -maxdepth 1 -type f -executable \
+        ! -name "*.la" | while read -r t; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 "$t" ${D}${PTEST_PAT=
H}/tests/
+    done
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


