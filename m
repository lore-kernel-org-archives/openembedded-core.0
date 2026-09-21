Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6908AC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:39:26 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45981.1789986330970818393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=AjzHBCMi;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.12, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbinwSPfYZUsARMfZNPXrJRlSgu2yFEbKkFCDSwBd1g3MNpLjX7qs4eRQ/jH8eRIiq/cmVrp5LHeJwBIMmpzFAiARKtkD48rXPFdO9PZH6EIsoLvZqzP3iGpR/XhPyHDNggY2QBu1YKurAf7sv82Gc7Ws1McaDat69mkKE8sa+coCWvZK7/O2N0rbfno4vHXMP4BjAKkwijQPtTRKFEZdYV7u/ux5Us8U+l3U8+lDhAsgzGQvC0ZZNHRVfOJqL7OPEeJvDElBJoshfKX4CxnTPhpNW/cDfSxLcKm/hiwVf3nFHEwGLblR4h+j/keN/hG6tJhH/Pzw/eVf7SNveZDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuasWM2Mt7zbFZ4r7nOy2O+3etPMxYoXap84gmmkAtc=;
 b=NotN0Dijs5oePoryI2tpxyJLs+T3E5ZUZGhjPa3yI0PPvIFMBZ+KgImHoB2tRm7blWW4y+YnEERm9lPREaXrQpnuFkCA1EztLy7Nph8NlD3rUKb5AIQfSkpz9cEzzNPtDwoQpQ+DhVobha3BuMnD/TBwoBgYlHSLThmeas7i00i2p2bDgjCZMtNBCUEhvqJjFMCIy5GpjoiMxKrLMQlccJn0PN7s7vpXBea2X4c9ezqhlO39qVORoUPaAmTkvimiH9CpG9CClAHx1SYWTAwEM4IHuDNkUIq8oZZE8wByxs8dTvRu0+O209vrtfMa3JjB55TG2LK2H1Z8Zuv7XMQeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuasWM2Mt7zbFZ4r7nOy2O+3etPMxYoXap84gmmkAtc=;
 b=AjzHBCMiXXZttXOwWU4t/QAxVC7/pVl2RsmYtTKBDm4cwirI7rtzOd0095WXMzwZLpVCWsA+Xo8rvbVd830hpjr+rGoiTw8xqvyNKJrH9EukTr/nNAyAZnFIjKNxWjE8gOOEw4YlnGI0BXwexwTx+hrQPzeIf2bve1RAp1q9pfKM9WjSHZUh+VJqNn/UIYkTVWtYXMV7MUx2oW7VQGrq9GMPJWG41u5GD0BhFJCcO187PsTEzdTqUIxl8UYwz+5G8gQlwDS8wvMJ6Yheu4jy69po3M6jUMrMp6oFhWJOX3soZDvNEKQQnalV+OPrReRsbGl6CpeiKl9ASumUOMRF+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::9)
 by PN4P287MB4251.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:09:48 +0000
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504]) by MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:09:48 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][master][PATCHv2] alsa-lib: Add ptest
Date: Mon, 21 Sep 2026 15:39:28 +0530
Message-ID: <20260921100928.1107716-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN2PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::14) To MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:148::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAYP287MB3754:EE_|PN4P287MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 6270aefe-b861-49a2-8509-08df17c8781b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|56012099006|6133799003|55112099003|18002099003|11063799006|12006099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	FydMhUPxEN1uXFaDvt7Ylc7XKlK/e+HFw9ggPMhxYLAlYcEhjYmxCXNp+Eelw1UpPavbLFadD8df1PXyPtLQdChPaY1wH4+eSeyx5p0EjXygkmTXDRoXoPdSmgsQ3nkxZ8Ahure5EUIakkDbgDbWGNV6/1YDrhK5nyBK8XBtTAvnLwTyito9Ro2+XznN+3XzyRdt8UlnPE6QQHB+1Ni/TrDnoDuymTspYxicyGW/DYl2TcR6qPgGjiKI56nFq2SdCeuhsE0uSEEhqtAh8TZPiMlyCkJfR8SBSmt6K1SzEDEPIRQtQUDeswWXuAGXOfDmYb9gjuJy8gk80zMRr2v9fJ2j8kUh3e2KUI4fRYiYjK+0oFUnIhtYC9L+VnobZR3SA4X0ppdhWXunVUoiWCdBazUskU5DSXA5SN9UOAD9PI2SUZCuG6xF9Os/aBJzQyBF3seoT6HVUgjwc/q281/8ZK3sodGh/B2ZugK/UiQ9zhFo6kU7WyKraSkmAgT3qNH6xCZzxS2aFNuiBFx7DH8YB9M24gUrbfgsVvpB/pw5kmId4l66VsxbaZyo4u3e/gHpUlgmQIRo2DQkEVRM6gD7soZf2S3p6LzammzF9ujGnAJCYROwUk2iEd38nTM89AW/ShNazE9Afq0EOqV5YkBaqAJbpg2Ym6yDdMhRYtUiAfc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYP287MB3754.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(55112099003)(18002099003)(11063799006)(12006099003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h2aHpcLHVQStQkecF75Yv3k8eyPBaITUEpOpjfuRJW0bEHxZYpd76/ob4uXZ?=
 =?us-ascii?Q?dTnvbbRHoy35VLGMEHM4GK22AjHa4Ci4AhQqUeYhnWhdrxFFyqMgEuzWfOHI?=
 =?us-ascii?Q?RZWZKz9iNkEXgGik6EaWCMcCY3bwIcAFBIDCzUnB/qHgJPTtdMDj4A3md3Ru?=
 =?us-ascii?Q?C37bYb8ekBItEqNT1RuJ/hDY886aZtiGAzTw5rMlGd0EFVRFkIGwTcMnt3a/?=
 =?us-ascii?Q?5Fwz+41H7dzoVhNNP7rrvKPGLGBnBaqr2PFuI2+Yb6uQ0J1+3DZe8U2M9mfS?=
 =?us-ascii?Q?qn5K8/eaP2nPiCatS28fo3XR5vTIRJKpNxEsXbMrU4m9xpf0KKtuytEMZQ0F?=
 =?us-ascii?Q?YHmUVw1H4Z7aOC0KJfxYplqUy1ozuAZdHW7T1szi0W1m8AtGjNpWpg0LUQVc?=
 =?us-ascii?Q?Lsdj75XSL1fd9U0mV9hFoCDb8DYIso/g2fYO4dOZ5lQjR4Dn4hu68sIrHlQ5?=
 =?us-ascii?Q?KzB6UJhVNZIeGGUl5k23e1CO0t+HL+orP7/udWIwWEEWlq+LGR1Ix3ISPYDD?=
 =?us-ascii?Q?UTxu+v1MubAHdPPzFf8JAdNYh4zNWWVGorV4zxTt++yJAvYzGGA+YNy2d27V?=
 =?us-ascii?Q?O50NWL7Hmaq9HKDrOs/vrkdX0MdkF8MU5ZtyE4cmlR2VHHd7daSDp/ILwYHn?=
 =?us-ascii?Q?faBDGh7aQiGgrku9Mb3UYSSKuJEJdirwZ02KUtfy6SwelHxtdQHh76uQckZv?=
 =?us-ascii?Q?5Jm42SFLMgSbXrCywzThbt1tb7rQydk5etvAutltk1ceSCM4GmJ1j6yWwnGC?=
 =?us-ascii?Q?9SN8qMulNL1oTN8C3ftcoQB0oyyfXq9h5XGKkZfrOMLfnRccTn3FfcPG7c6L?=
 =?us-ascii?Q?KW0+7o1HvkPxKTHyljZ/lMOZRFlZKZ5N5HjG6OY0MFXzCv3CNTQ39pLoBnGq?=
 =?us-ascii?Q?qsrohNsWLD+IV+H20W6T795bMowSAdW5T6GNkbz0PRJQTjC9TgT4P5Bn2qLA?=
 =?us-ascii?Q?Q5nPHXzfYaJ7WxO6u/H5oDV47Enm49XPysQhJ39pPw4TtzUmM6iMGc9heTIR?=
 =?us-ascii?Q?eWLYYfqfWKBn/mGjtFhspGjT0rCH36absYQySc9eF+hGfjaasiLgBkDAFEH0?=
 =?us-ascii?Q?6O7lgHFlpvDBnbm40dam702VcE42yXvxdUkRAeDufuxrsbiXShw/YoxrpDql?=
 =?us-ascii?Q?DW1SXJIn7DAZKn6nKLmPh+ziGiKwqYqgJ9BmfFP0GYyTtzAPmxdyEGZSr161?=
 =?us-ascii?Q?5Nl0qS5qzZiIGC3LQgQddi0lBLF0+HheNtPp4D3D3S+wRPo4irJ7I4LCw3Tf?=
 =?us-ascii?Q?7e9POmOAM9nqFFpGl/fZAsxikxS3vJG0q/N+o3IFTd6Yj/iNSg4Gqo+G9Jpr?=
 =?us-ascii?Q?HPe0RYPyhOCndMJyaBhGnUo07EON0iT96HxsXtgtG2yovpGamsmpL1D5WRzD?=
 =?us-ascii?Q?pTDVtNG+SuQr0L7TJ8DtRHuQefiaNxCi5uz7YtPrB9IxwhOUupIHheUBbsAj?=
 =?us-ascii?Q?Hzi3oPfxH8B6/jz5AL7l1XTGPZYbf4SgbGJF6q06MEssU9Jr0dQ7Z/2BK2YY?=
 =?us-ascii?Q?C/Fe5nyJXa6xPuRV4Z9ZMemZP8UUwtrdweH+amJktDvljC4FqzRPSlE82vhp?=
 =?us-ascii?Q?w1lLzsJLiV6UZx9q+xxb+tY9nS9R19S/vQXcLUlREylMjguhLQ8J2BFyM1B4?=
 =?us-ascii?Q?BW3Kt/wpOmzo7P2WNaOuXC6f1Xm5TgSXuXnVjNqhyGSOoay0H0WsZG+noA9j?=
 =?us-ascii?Q?oBt4DjGDh1qint2eIw7CccyMa8sxkyF65hTuCM7Ec/kiKh3Nq4hrEBtGu3sP?=
 =?us-ascii?Q?qc77IC0qu4wOJTQ0JA4rHGcxcLxxhdg=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 6270aefe-b861-49a2-8509-08df17c8781b
X-MS-Exchange-CrossTenant-AuthSource: MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:09:48.6961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aS5hawtYy2fUZ758IvjaJZbSzD7KliVYF1tnYvA0+B8hsSzfkEjmHWcqywziIqem9cGFToHkoxiwOvt4JlxbxSfq9y3xouW9xFbKxdAFw6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4251
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246318

From: Sana Kazi <Kazi.S@bmwtechworks.in>

alsa-lib is a user space library that provides audio and MIDI
functionality apis for simplifying application programming
and provide higher level functionality

ptest executes below binaries on target:
1.config
2.control
3.client_event_filter
4.midi_event

The following changes are introduced:

- Add the required include path to CFLAGS to resolve:

  fatal error: alsa/asoundlib.h: No such file or directory

- Remove the test suite execution "make" call using sed to avoid
  executing tests during the build.

- Build the test sources using:
    oe_runmake check

- Install the generated test binaries through do_install_ptest().

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib/run-ptest                   | 14 +++++++++++
 .../alsa/alsa-lib_1.2.16.1.bb                 | 24 +++++++++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 4012be5f49..b525f6e3a9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST =3D "\
     acl \
+    alsa-lib \
     apr-util \
     attr \
     babeltrace2 \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes=
-multimedia/alsa/alsa-lib/run-ptest
new file mode 100644
index 0000000000..f6d3ac23df
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+set -eux
+
+for t in config control midi_event client_event_filter
+do
+    if "./$t" > "alsa-lib_$t.log" 2>&1
+    then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+        cat "alsa-lib_$t.log"
+    fi
+    rm "alsa-lib_$t.log"
+done
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.2.16.1.bb
index 1033250204..fa682f31a4 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
@@ -9,10 +9,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e=
631dd8edb7424769c7 \
                     file://src/socket.c;md5=3D285675b45e83f571c6a957fe4ab7=
9c93;beginline=3D9;endline=3D24 \
                     "
=20
-SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] =3D "f740db7f488255944ffd4428416ee3390a96742856916433df=
468c281436480e"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
=20
 EXTRA_OECONF +=3D " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)}=
 \
@@ -41,4 +43,22 @@ RPROVIDES:alsa-conf =3D "alsa-conf-base"
 RREPLACES:alsa-conf =3D "alsa-conf-base"
 RCONFLICTS:alsa-conf =3D "alsa-conf-base"
=20
+EXTRA_OEMAKE:append =3D " AM_CPPFLAGS=3D-I${S}/include"
+
+do_compile:append() {
+        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/=
lsb/Makefile.in
+        oe_runmake check
+}
+
+do_install_ptest:append() {
+    for f in control client_event_filter namehint
+    do
+        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
+    done
+
+    for f in config midi_event
+    do
+        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
+    done
+}
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


