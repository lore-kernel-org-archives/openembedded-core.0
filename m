Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D4BC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:39:06 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46178.1789986256745064492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=LHxLuo+w;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.59, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIp9HkYahjVAclMvYBUomoVOb/YjemEejm+h5JK+TdgQ2HG+K+FMy6KzyGjkAK95TKzGOg4lQQ7FyDAGF5ZCHh6S1iuxvLi7k9CInQ8THIgEGCWIP8DIK8cm/amtTt4Wdzn5XA6SawRyKDRTJ8bXH3Q9EZqXrjPZA+aMKirobxW5Ief2AJ8B2iX8FqXQUpQWvS6ikdbnkAva6BrmOGRMnDbe0+7qUlQROR/HVlsrpQe4fMr4OIHybKUAvkJDlhGfDUtdVkTfJZwNG4OsV2ukI7vLUY//w1EwelYcHuPI+UyRDhRDD8F/WAfJnBsishGgRbvXC3CagA8A1snAWaVuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuasWM2Mt7zbFZ4r7nOy2O+3etPMxYoXap84gmmkAtc=;
 b=IUKlO8KiLsfTyqyIueEST0o/Bko8KcpalI4a3Ib3Kiz1KLAPQo7bDHRrKuMqgpS8usNBQ/PzHwBnjqHk1eIR6zbjyf3Cqpcby06PLr9EakuYtKaTx++PgL4GSIAysX1srZFlLIZQ+snkv/zMtC1NCYGRVbro099cVgyH1//+DBDncs9OE/vWu2xC6tDin9HHCtuyAqkLHdEwgZxPp/0nRiUghx0eg/JmM7SAQLjEu5ZItPr2nb5C1N9DqNnLlmQeVtxS62depQT3wt5HELd9Q6zRglb6vbyseucax8zgcT3GUSGU3I3DSSXFEVuxbxPoTabW7kMs+aKMdIbgZ25/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuasWM2Mt7zbFZ4r7nOy2O+3etPMxYoXap84gmmkAtc=;
 b=LHxLuo+wr6ju6dkwAKiAEPV1EaiRYp28+Viv6z62hE2CO2oTQyLqG+ODY7Qf5vQC3IqRBuYOz9lLgXTUMiZYL62uUWpKTYQW7I/ONB4LPJehjir1IyBOSs2PqNehiLcHdFxSUsilXf/05VarVprCrnQSryIXyPD8G0nl6DNXJMPPPzKfLuYGxcliEYyPSEvarcKzfOJ/XZ7EC+Et99aG/Q1I/0uH+bBCHHS/WdsJPnFGHXaJSSJp53/m9Xuc5ps6DNh5wMj/KRpaLeS12BpKGL9KFAo+yemP4me+Op6rqvrU6N9tO2RtqA/L4lhqUBUJxmUBnoo3xNQp1EPqRJqg1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::9)
 by PN0P287MB0473.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:08:40 +0000
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504]) by MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:08:40 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][wrynose][PATCH] alsa-lib: Add ptest
Date: Mon, 21 Sep 2026 15:38:29 +0530
Message-ID: <20260921100829.1107581-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PNYPR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25d::6) To MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:148::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAYP287MB3754:EE_|PN0P287MB0473:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a9b7bf-8776-447f-f9fb-08df17c84f50
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|56012099006|6133799003|55112099003|18002099003|11063799006|12006099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xmOZFJhHmO93NKBnzZQTmDm+tPgLbuAdGD3qAgsReRiFejFv9XvhwLdrVZxp96JduaLYSerZuQ4Dn3gAhU6yIWYDkr8PG6ZiCCObUOWDgjmpeOKgmklD++za3xFNhlRNzGuuQq/xJAfzPw7eQnmswOUjTcWwcOd0qrD448YvGh2yCs1SkBeOaF5ykT7Gy1XCkbYJE7PeIQ1KMG8mUFTHl5SQEO91xN0YI0GMIf2qbglcHKNJRb5LUo0z1ZQaLWTAsO9mxDE1lmQnuzb3743vu4LPVpcPSBvfEB3MQs71G5eXbfyuuIaNCxh3TM+x8ZlsD2gQID80FJ2IkELtGJ2nfCDFTkDcUN4Ch7e4lz/DKQ6ckHEFd1MGpOe4DxtBuim50SkRI2VnKykXaElSzk2mOS6V2cTLZZ+oPjmNTsW87amm+EeNCOX+720peeO2/i3QGBwFaHYhMGNc3ZZyWJEVH8LBCeAx7u7/gwYLxVHYvES6Cy41r/YPg9UfcWwlFyLDfU+2EPGFnV13zfXObI+oLaC/4mj7X7w9LK2n6T6BMBs+88xuBPHHlwT5+zO4RPK0jgNiVVDVhWjsxRBdzyriOWtpntSja5CJctq7PptUOxsTk723+fYJMbfdG7sEGzg0f0IgEaMZtmIOH+dNalbX9AiPAoBxwIddIZxJHRI3Kvk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYP287MB3754.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(55112099003)(18002099003)(11063799006)(12006099003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+vROrhyUlmq7vm42K6jg4/+u7sRoB6A2eGwpxDV66o9zExFHoAtzFGSDqxSX?=
 =?us-ascii?Q?nerUqBOkmFupG15+m9IQlObgtCi8Kg+/Tk8gDLKVZtfTk9xe+83eCdMe4sPZ?=
 =?us-ascii?Q?UbpAFgKMFsycUNcrKhHqGbxQk+q7WOij0Go4tiv7XmIKwC7NX440Uq2X8hN9?=
 =?us-ascii?Q?RmkYRzei6rX6XvVEtA9CfDyPFdyPLSVjyxLnQa/NoEIS4RgU7jZk1HmvKnSS?=
 =?us-ascii?Q?YvUV/eeKDK8YHCN0viy5RAMDV1pAV0odAcKH7YK/uukhXm6x3jysSgdQYcAM?=
 =?us-ascii?Q?WI/YEnSk/9uK75s/3i71HPrlAkobhemwLBHhPYcW/Dk9/m/R+sATSkYK00nU?=
 =?us-ascii?Q?2g49hJBF7XWvK1bdKb44qNabqpJvRc46DLpJxRA/yN4f18fbKcloO8P/FoVQ?=
 =?us-ascii?Q?81DZBxjH4YqpzZ0IQMRlMEdjDeYn9uKqCcfcDkNNeE/timX0Fvus3UHCSazm?=
 =?us-ascii?Q?0L+K3HvTwlQsFn/GZJpcz59+BIFE0qrwTTYBRTMLu/rKpIbfCdQWuRJj0a+L?=
 =?us-ascii?Q?MdLQiTw7VWNZ0fj10iRwX4DTs7CxckM7+TJYaRMiMztd9zoWinqdGYw8XLZ3?=
 =?us-ascii?Q?fTvgJGJVGt4ELeqf1tfs0iWe3+rwV+aUHFcqmM/aSZN3K8Mr+w5fY/UfKRd5?=
 =?us-ascii?Q?fLhyphUVX77yKyGvw6lFJmmXMGxGndnrJ67MupshknhnSnvdUtKTr+K9b2z/?=
 =?us-ascii?Q?TXrOTeLLafPbM2HInXZEg9xOgrMQtTM9dlQwY+kSaD9g+kbi9ttlBOdF/at+?=
 =?us-ascii?Q?/fEygbj+4yI1p7QV6V5BwI+z6liQejA+BiOo3qA53MjQpKej5FrbViqqVkFt?=
 =?us-ascii?Q?JuN9+spWU6oI8yu0V9iEPuqCJjzIbuMCd29GsJz/PvRv2J9rmtWcETWQ8PGZ?=
 =?us-ascii?Q?H2uRjaKyIHgw6WtotGEjfG5vJoN/VWT01/7it8Gfu6M1aOzBFuTRC5payz2p?=
 =?us-ascii?Q?yX43eb7zyTeNp5Tw8GJ5MmUd1RfRbQ/8ls6Ye1YEPYnfwjY2PGdDQa9GoaRu?=
 =?us-ascii?Q?Dekn+8/BpTANdATSuE6laDfKOCH7Z3L5tCRAF49ZrqtNa4ri+Ws2UCEoTC/k?=
 =?us-ascii?Q?IwLBbJF9jDfW8Dq9UUzSRq+Wji5HaVJSC5MhF82tT6I4Z+uU1fBaJrPfgLjl?=
 =?us-ascii?Q?Zfg2/lAdvstHShAmGSkKJXkCnshzRNPDsY2aFL7VjGmrT0uWCVssXZJBGOEp?=
 =?us-ascii?Q?YyZFUZ9CKgNJ5dZzWsfvqVSptOfzlFl8NnTHPoR/ctQsqtfUqCwHhfNnj48N?=
 =?us-ascii?Q?fHhVF3+6D0NXxOOh7S1nXnD/PSF1eYFOhF7Qmg+nXo7D1R9BtNp0/sui5J3X?=
 =?us-ascii?Q?he/m4FLchUxir+cSy/kgnkDPDaQo5/7/abn6qPC/6NSh9pPEUzPSbsuHd+Bi?=
 =?us-ascii?Q?E0pczi7xzMA16v1gDpne5j0hMZgd0c0k6tntdcjY2BhGXCzMQUAmzEuKK2cX?=
 =?us-ascii?Q?AcpM5+B3U2fU1nr5EO4rbikVnPk3oHW90zJabeoRGhHnwh0wF2qZrriry8Cf?=
 =?us-ascii?Q?7zPGuakIic1wkV+HYOg1B7QN+6+pOmjBIEbQFCoSw7MnKfxpldgHdxw6D0lH?=
 =?us-ascii?Q?Zca823Vk+U4kBd40h6UXzRknSSKvyxgQyQk4Ct/VEaLaP7CNIvT+ZtfHt+MG?=
 =?us-ascii?Q?kOJ1LadBrpN0w18ojxH3IJd6EUkJ0KaxtDFUNfzkCt0weJdwHcNvCfzAkuAo?=
 =?us-ascii?Q?RWH6HzKMgoOTmQv6VuU7cVqtJagOgxg1w/hezEkYpGlECEMrcjHkt3HPOCsU?=
 =?us-ascii?Q?8Nthcyheb8vsEsf1vbF7H+b/WPB30ME=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a9b7bf-8776-447f-f9fb-08df17c84f50
X-MS-Exchange-CrossTenant-AuthSource: MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:08:40.3384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXwGWhOoPGJzy/u+d1m+Mr2HSi8PGHpOr5H/tO8gYNFSDyOrDYn2OLeOu7pTK72MtZfijwrO9Xwrx9WJDMl10OxN4+V0Ldf4U/yzXfUPYos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0473
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246316

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


