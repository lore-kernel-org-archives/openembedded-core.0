Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5454C88E7B
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:51:00 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20193.1789469456437357951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HhU6+GD/;
 spf=pass (domain: est.tech, ip: 40.107.130.0, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF5PwBP1X5att3MiT7iStp6eBdZvmmTTxI6SwN2uID2yGWwuuC1Zp4b7/4OSWpgPW/pPLZtk5BwKvMiJP/DiQM5tDdrUkv9dZ7ciAqcrQrkef3xQbpFS3PQTIrZeXDamMs+sQs1kdjBNHXn1xJZJrR9rv5TnysWCNIPmmdl6OiFGmIWdrnmC6lUUnfiNcX7gU3GSgqMq+ndQr0MPVeoydMH88sMD9rNSb2d5IbPQwbTQNle/2hiyK5tjUZrtxuSRzmX/32dFoRcjVdg1dAy1fgPucxz26j3wOAMXLofHC47BvIheNeFfu2KIsgx86O7rnrKkSRTBP1lTPKuxjedsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdG3s/TPOZQ1NqzpN8Gphscfgr1HVtfj1q3tWpBtX04=;
 b=lzPCUPur4/JD3IowjS/g6PyDLEBRwJbUaVATC7OJim2GbI5TBigR8tB9NoFOB2wtoXIxQstZyyUTsLQyDQMaLBqrqscFUCQ2/leXx03qnOlngN6KbkQ3PTjgzg2XF0KE+8zaMxhskJDDFzSmRpF9ghXbibHo8RVQ45oE+BicSgyICu4fQBwHWYtJxwzBbRc/mhvVEvFyXKGnh2VaYnJhZBXgtyH7q0Fgx1K5j2KslDtTXA/ct9nBtt9khLXroO4uYjoAxogwB3g52RHhNxqwc6FpYaiGv3prnhF3IKFiDX/pom2zs57gEBn0CQ9qNg/EGyXARZDXLIPuPUyqCNetcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdG3s/TPOZQ1NqzpN8Gphscfgr1HVtfj1q3tWpBtX04=;
 b=HhU6+GD/tQCOQIO9byS4ffUwYXx65J9YvCGFGIXsjAX1q4rGsn6IyMTP5crKZ6wM300+TOF4q6FywV+sK+vnhHWF1Hz99aRu7XRN7emguk5/nsHSOnolVfMpr0qBrdjjZdbTL8uio44RSr7b/zrjzllaXXIblOYGn4gHAmhfxGxUrzbOGHkTLGrpk/La3c41CzgkyNkjolIFzcc0MtPdSTYOk5EZRbY0N71785KxHSXpuZlf+7hDOI0TZ59abV7EoOyNBbc5HRdOhYqd72wKQsuZ+hdikr7WNMkm9fV3ufiA7nHLzhoOKJh8ETFZ9dUbVYSUJvP4gzxegYpuT96f0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM8P189MB1156.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:244::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 10:50:50 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:50:50 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] npth: add ptest support
Date: Tue, 15 Sep 2026 12:50:39 +0200
Message-ID: <20260915105039.38728-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0006.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::11) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM8P189MB1156:EE_
X-MS-Office365-Filtering-Correlation-Id: 0077eb2a-ae6d-4b43-13a0-08df131734df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0ctGcUpjaAUIvnU6K0Gc0ATRgHNR+y85xRSBE3PfgMPG9P6L8fc8LOcAd/V+a8cVmey2qV1xEwTheuT9PbuhYqbRsQFFzdDx2eyU+XH7HhpaoLIikNb4bHK/+8Lb/mXXIUkdeTMAG2xIT7GoimIh/OPD1o7Sr0Ye51wvL9KYWKm73Mred170Vr/haVDNfdnoVZcfxyhdwSRlXg+GpJlHcXV8vtpqzmB41SXybW5wlsgq2G9waMZ2xYyCqtNInAmEzbc6bcLgty+5+/R2TpcGXM622A/QM0RezDPwgqXaVUbbXWvxzgsKG+1Qa+9hdxEJVhOPapFns+reGZ0Zudp7Sw7pJS7HmJPHcTBqCaak2PgcLM2oFd5f6J8WkEvqS6rC6I3x4xneHUewuGA64+UhLPkAh7nuzEo/0OWhBiOyKniRXtuCFjn93OqH+D+HVzhKFRydwPTQYZFem1eRCeS/O9M1R+74IU4iYSjcjtIvMSID/uI1dhoiQZrUOZBinm/6f96/eLBcflU1rGWV8tK3ESqtTf3J62XCzBehKb4YRJTemEbN/4IqNsf1blMdnEPCRbSMg70efga02rryo8VpK+U7CVK4KzoV3ic2pCynA6Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xLWu/me9dm+brp7RDNXYqIuhyEt8MPPujjAjY3gB/bnQCVbhKn4XgVwm8unH?=
 =?us-ascii?Q?K4Vbdph84QocvUR8J5XYV1yiM298wSh7F/7leCPSOyjZiDPCC667bQ3q/Yo8?=
 =?us-ascii?Q?YMMTDW7zDe8N5zfQ9DEE8N5uZ+kI0+IJ2BCpoUU4sYS7PSKlhfvOiBL+AesC?=
 =?us-ascii?Q?16g57aqj4ROF9Sj81mXVbOAoGqYYvpJNICpto117jIpq/arnVoAtl52EaBEx?=
 =?us-ascii?Q?FN6lag5JYaLv5NYG9WUJbu9AfqGQyY0h0hbSXfKMwril3vmt2vwIPNrOzEtQ?=
 =?us-ascii?Q?/FjLrR1q8yQ6UwggPq6CEE7IITrCNIOUy4kf0/W1FN20yrUBP9/aV7Ktoflh?=
 =?us-ascii?Q?rpmxyssqWb4Ds/R+W98VDnnaPxhqd9f+tuxM7VPoYXGbh6BayA8/Rj3dhC7H?=
 =?us-ascii?Q?efdRtqtRQ+g//Z0IZiZLFlFAG4nyVxP1e/KIpYLU/TOKT0/itQZ8pgZ5Eq7e?=
 =?us-ascii?Q?mU1zQchsCWqxUF+ITAW22VKnDzoAx+q8p0Fu/LnyBgqY4l38P6pyZQiklj1n?=
 =?us-ascii?Q?sC/2hIZnnst5vEUnr6RxnETtfZ6SFpm+TCzPb02sMrbQhhcxmbdZ9kKaQ+2w?=
 =?us-ascii?Q?ynX0ZGKWbFBR0+YWamKHvx+DjZfo6SB3eKZ7qFy4XRWt1FbSeAiTWWAHZvwt?=
 =?us-ascii?Q?cuwE5xV+GqQl2nkx7YrWaz4qwDtXt+StKCl/cB61YLXgZvv7HQpdrF/qY711?=
 =?us-ascii?Q?rwk07rY3LfJaI69hWMS6XiN4x6ONinzGTsUtf+39n9RnTNQLWy5xUu+/3Jm+?=
 =?us-ascii?Q?GKZuQdjCHUNd7FnpsoOGnEqJC6iTS6K/a/1qz1XgnGIgUP1P2Xr/sJYHuraj?=
 =?us-ascii?Q?KlKkQRPp+thGaZojuJG/7l9a+agE4tTrcaYZt9kkbwfG+IKMYo/0yaiR+Gut?=
 =?us-ascii?Q?CMA7kaw5EzGlC92+VmVPjcPy3uwy+GwKiRBC0qbT2WqMSsKQdDoD4HE7/6Y4?=
 =?us-ascii?Q?KISpzeU1BGXzNi8yPSFEC7y88ojvIGA4ZJqYFfoxSVB0rQONiT7p6SzwFE5g?=
 =?us-ascii?Q?woac+3oQc2zBJdA03uPVagBCVNDAwz8u0oWuZoFv9qf4nFhX4YISjQZQGO0E?=
 =?us-ascii?Q?2q7wxOERVxoHrF6EvNZJCdBSwskzeErLT5yjR2HbHjf+DgID1qCLC+WCWcSR?=
 =?us-ascii?Q?SqSsZLb0OoW7keR0HEiuUxwV/OJcSkGxmXWlSovzevDibZxag8pnwkC65nnY?=
 =?us-ascii?Q?24Y9GWLM65D9MtpBCNFMSD0o3aaD7oEEdSIWER5hwNcaPjTU3GVQYZz5bMUZ?=
 =?us-ascii?Q?XO8qfGircYeHe+wwt4LFdK2wCnue87O5TF5xhJqEqbdv33/qLsw5E6NxIlKA?=
 =?us-ascii?Q?cq/AhmzcNDJuxhgKldap/yrlfxhFuICr4AoOYspOyaeL56ddeYe/T3oo9ucd?=
 =?us-ascii?Q?/qV6symROmFcHbtWvBiHadHVcozkKEjTBXoZ9NMS+C5xLtv8PnibAebciyo5?=
 =?us-ascii?Q?RpDq0qgEVnvlE4JpFSIntc7eBMjVZLuM4S7I0t3RAA3GkvXJFSSrxMJiJv4i?=
 =?us-ascii?Q?Z4eY7htp3Cf6tMlMNsLrrmruhDRadrCSEybJ4yCmwf57PCWEl681TBqcZnXS?=
 =?us-ascii?Q?GGvi5F+aarzYlpo7VTaJLnVXgghYxJo7XTsRfC9olF3IWc7g8tSedCzmALie?=
 =?us-ascii?Q?XNwCMVzW3KWgDfRuE6hwy/hsqMnWgdlFcLuKYAN/eLnvj8/tjZpz7fAuPaze?=
 =?us-ascii?Q?/7N23eVZ8g73nLZCZtMLYGUuc2gqneDF0RCXCvw6ZYZVu1bRSEb/pI2rp/OI?=
 =?us-ascii?Q?BHiblBxB7w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0077eb2a-ae6d-4b43-13a0-08df131734df
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:50:50.2815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7gn5M/9FWTIvGjmDA6ZHKVKRYvO2WReS03963lQsDt6UShQFyhgS4tZ0QVzNIqrItpMjCrEIo51g7FpwqfamQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 10:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245838

Add ptest support using npth's upstream test suite, which exercises the
core threading wrappers: mutex locking (t-mutex), thread creation and
join (t-thread), condition variable signalling (t-cond) and fork
handling (t-fork).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-support/npth/npth/run-ptest        | 12 ++++++++++++
 meta/recipes-support/npth/npth_1.8.bb           | 17 +++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/npth/npth/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index f01abc4a57..f8e8245bc3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -65,6 +65,7 @@ PTESTS_FAST =3D "\
     lzo \
     m4 \
     nettle \
+    npth \
     opkg \
     popt \
     procps \
diff --git a/meta/recipes-support/npth/npth/run-ptest b/meta/recipes-suppor=
t/npth/npth/run-ptest
new file mode 100644
index 0000000000..c5dcd1798a
--- /dev/null
+++ b/meta/recipes-support/npth/npth/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for t in t-mutex t-thread t-cond t-fork; do
+    [ -x "./$t" ] || continue
+    if "./$t"; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta/recipes-support/npth/npth_1.8.bb b/meta/recipes-support/n=
pth/npth_1.8.bb
index a354af2a7c..48f3b0b9e6 100644
--- a/meta/recipes-support/npth/npth_1.8.bb
+++ b/meta/recipes-support/npth/npth_1.8.bb
@@ -6,14 +6,27 @@ LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2caced0b25dfefd4c601d92bd15=
116de"
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
=20
-SRC_URI =3D "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2"
+SRC_URI =3D "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
+           file://run-ptest \
+           "
=20
 SRC_URI[sha256sum] =3D "8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35=
d149694e90ca3e"
=20
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
=20
 do_install:append() {
     oe_multilib_header npth.h
 }
=20
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests $(makefile-getvar ${B}/tests/Makefile TESTS)
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for t in $(makefile-getvar ${B}/tests/Makefile TESTS); do
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/$t ${D}${=
PTEST_PATH}/tests/
+    done
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


