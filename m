Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB42410D14A1
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 11:13:13 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48575.1774868725874851644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 04:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=UEAxmDRz;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.43, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmV4y1eUgnkh84aas3PaQLVOTAstGb6QmhDwS/7U4ltVM3LHoCoS1lMvictxaN1LRif539j9AZiRgk9R1M/zz3SoY/fdDDJMOAgSlpbubxXG0xyW04FKrfiKJpXdJVK5cVa0vVFmmGBAsSRyR8Pkv18xsTxIJ3iGGYOOL7Sdy4L1jf0ZeustT7ohKtwUuxApuw+LVKVykcnWx3jFaNCyvO5ng/ywoK6+bCp6TnPnpFwV5mhGCdiOiNDqGWRM9QWx9fp9BcvN2fPcQ5KInWH6wG+FQ5x8RjCIiFAHrv6VcWIVPN4R1u4KDQE6n9ffEljpCnxm0NR5StOpywml968pWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ba8qOJw5fBaqHYY/S7eIAsDb6qXNE0LExJvFREUb01o=;
 b=ezFokzU+5JRwQgU/ZIQ+sR6iSzo9KbP2sKGfJhH7QYHBSbmh8j6LtnActTPkIGBrT3zEWJSHlUs182hST+WCtnvhxuHqJgaZ6vLvW+hbokT0UqUNwGXmpJpWBB09b7mW5D4waBzcuR3DqYbsk6xnoRk5MdA1hKQN7cxj++NQF/xzXlSehOGWbYB0xV+tlaKWwxay8QAfEQQ0AbTQ34Zajya3JkQr1ijeJy3zfGiaDnKCDeIiusdRzINtX7s1uopmBDrRjYB7pdwlAzLT8OPRS+FAy2gmsia2U/UVeZpNLqEvCQnaloe2sa8bzTeIm4jzORot9QuatYMxB/JIcC7p7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ba8qOJw5fBaqHYY/S7eIAsDb6qXNE0LExJvFREUb01o=;
 b=UEAxmDRzPdoYtc92XU7Tj8iiyf20N7aB1Fy9rYnfkGKy7ItVmQacIP5qrHDK2m7NDDVSyaTG0XlOPp4AyZdx7P8ne74Cc+tNfr0yrU1BKaWcDwXtrUwsJsXUK3iZXECuo///F0JMPwa0MJoN4r/OtJGZkmraTvmu5MGqn5Ig8q3skL2aZgT7bHh6ajpQV5xcf2PNbZ+27fspPpy3mkLY2AZdJiYPBH2q+TEy/V7EwzBbOVUBESr9gVwRSlsFbZTaudcUpjQULN/+IS8/ObZvf48dkMidj+0d6rz4IW5KkvZI4FXrc2PjSKuMQs0h+wxutnXAIOz2z6PphZrIp7ag3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by MA5P287MB4061.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:05:20 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:05:20 +0000
From: Suresh H A <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: sureshha <suresh.ha@bmwtechworks.in>
Subject: [OE-core][scarthgap][PATCH v2] systemd: backport patch to fix journal-file issue
Date: Mon, 30 Mar 2026 16:35:08 +0530
Message-ID: <20260330110508.1013370-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN4P287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::12) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|MA5P287MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e30258-f410-4cb6-ebc6-08de8e4c3b70
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|38350700014|55112099003;
X-Microsoft-Antispam-Message-Info: 
	AKJb1LfkXxQXLQi7FAPouv1enu7hYAttB6u9xvPjiYOtysqVezxfHrg6kAw9clGv8gkXWiWAnLePbWdFqQKy5Dnej41P3D2gUXYRxygOF4mzZfxGDlyGdTlNjgriayCx5CO4p/krKdToAzt3PQ7xPpPRvdd43txLmGn6RoDFXWyh1Yx2sIb+9ybUUBvOUvcn+U78lSvnK96234uBYNA5g+ka1YgWchigC3J45airM05rsg8CQesYeqJKiLrkVq7VXgvxMZb7ylpRAT4GiSl/BtWBRxHr4Q9/IbtFk1rWgjkd4oxU6eRFiU/YhsubUN0jyJ17lR6ymuz/9H1GxgKj5eE+/Xj2eUV8Au21dxPPBgwj3V6r+nKRhOpCtqGcbR+YW+NL/f1GSM9uXeueXp2BSItzmbxUnIwlPRE8PqaZbfDBdQxLlPk60zIiePbL8aeETlO/RMdE+ZkbuLnBl7Pr+IsvabBCkkHRykZvWRCHRXUi4faZlNeH7wUonAbUgl4zYlbuq2IukcujKuUMCOOdZ9Duhx1eNL05F85fOsHdQZYT/A73N3jt/j6adXNfgnKk+PQhWmUeyrUmOwmxuthPV3X9/0gcxvu40+KYYVUTvYWe19qtmieAXAuOtNClAFxkf/cY5+H7jNg0yHoSze2Ptu0QBcTyAad+ABuF8t6pTyFcHfCmsLioFOxqVyD+i/ucXqH16P31pmKEVqwtimAcCPtRFRO/dSw5B1yhbqoHS+Ng/APd8Ry+Saz1jCB3dWxqEfHjWt1B595cijudFeEFKzxpVLOt/hv1oZRM9yfWEBE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(38350700014)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uFVdwhXn/qClpjtA6PtHQDbf0EDq3JMXY+LgGmpE8KXXhpLwwzM2mOWghh4o?=
 =?us-ascii?Q?0lkyFftrKzGv9pOVLFMCbQji7CUBaZX0vduD5Br1xkNpcZfo5igp8e8qbVTt?=
 =?us-ascii?Q?4KJgMZXxPHvB6oWS0CIX5yKrHxn7kZnW/czxOM4YEd1qbm2RjV7fwg2kZBzI?=
 =?us-ascii?Q?39ep/Nwdb7ysAyHkysZb95R+FENwHruKDU2nMVhJRxNviAle8D+oLs4HTk2g?=
 =?us-ascii?Q?YMSnGOMI1M7bAnNFmsqJLTgdRIr12X4/d5aXwg7n9w1CbJfd1FMGYB9gHA6j?=
 =?us-ascii?Q?rDJdxgFTtqFrxZHqXYFp8rxoL/kk2OssO16+DZRh812+UeBu71fW4cl/Lsmp?=
 =?us-ascii?Q?2b+bHBn+rAOj9KNRdx0/C6qvZIKlSr5bHYBs7wyTvsONiyP83XC14Wk6sHi7?=
 =?us-ascii?Q?MVBYAO9QNGTulvKgUdaGFHwzqT9nEchZX6aqjEE7uHKQqSbVAskH/U2ujfAM?=
 =?us-ascii?Q?6jvLF5mTuh96Ty6JNKH/jiA+6M/XlHAJaXX4H1J/vGDrr9ghnaIwHe9N0KZR?=
 =?us-ascii?Q?70VaO1UACzWhgUYQubRBNvIn94AhbclJvId9oJ312Xm97kUI0iEKM6yaWBfe?=
 =?us-ascii?Q?ZUK2pvJaEoK1uKWJyUb/YrkdrFNNOaNoReHxNml/+Ih84lpkncx2as/3lnoy?=
 =?us-ascii?Q?LLzf0c9tiVI4JuP2W6DXTmHznVt42r2cWcxBZcg1RHDQyvefZ6R6qYa1Qrm3?=
 =?us-ascii?Q?XFpCrYKJf0XM6hd2ZDbyldqa9jPnuPN7a+6qbDFuFyppIKskxoChY6X0l8cr?=
 =?us-ascii?Q?SDoE95JDe02X+UnpHIhzkah+LfTfGv5vYtZ7Xy/K5wrIS8fWkV9lIdu3ghza?=
 =?us-ascii?Q?TQJ2TGiCO3HdRtFND8HZpYUfc3xG5SZ1kMpesRvBlCLOZKdTY/68jmK4bk/m?=
 =?us-ascii?Q?pAe5Y5EAhoQUOR9WTuERc9ATxJ8a9Mu6umQeJimgkXIit4DC/hPB5RdlK0Qf?=
 =?us-ascii?Q?2JkeWS9mTEiC0kluJAWunBAH5SA86KluqXg9F67U7tuYmhKCJwjTgtXko3bA?=
 =?us-ascii?Q?rg+5IXQrKgqJ4lbiL9MYH1m6vyes9rlAql37Z3/6zIoVzbLzVXv4HjRI5rXh?=
 =?us-ascii?Q?NMjyNbKtmb226KVzI4kFKoTlkrMmzSqm46jOzwYCcvmwTF3dSndOewrhcl7F?=
 =?us-ascii?Q?jZx1Au5RrzSOOXpXRrwyNeXrzCwUdBaMn5aRE8EvtKSv/S6u7RS3eYt5v+l0?=
 =?us-ascii?Q?QbgFEOGiNA1XSX8N6r2gkHEuW1fvtUQVZB2nMsytAz7LhUcF8Zf9X8o2MN7m?=
 =?us-ascii?Q?8kpuz68PlEBH+qCom/fGIFomxoOupxivd09SPFZKm/CJTZQTcq5uAoJLg6Ux?=
 =?us-ascii?Q?p6xrjs3yoIcHonmxlePpCBD+7g/LTJLumd+MMhJuxNSrg2kiYqsAuGFc0AQK?=
 =?us-ascii?Q?Yx0EkfT/EAYs1n8tge2rvWnKmOmEaOOgg4XBwrgJbQVxzC9rjNXQ7M90CYj5?=
 =?us-ascii?Q?lRFdG+IkvT6QOWP0ZnKooWbqQesTXAjYxnuSdXsJR8wRxREcxg9FZ7Qccary?=
 =?us-ascii?Q?1j8/nAHKMl7IbDAwNf5pztON9XjRbWkT5cHGtWQVY7hpVv184oOHtiJLGyf9?=
 =?us-ascii?Q?BEwpBCEcsM2s0Rg99sDifLOHd9O6D67/H46oYKsm6JCVufi9NiNK6urT/wYb?=
 =?us-ascii?Q?invNnpPij/LPQUvZrWCuG0+3QF3/2T2PZ/JsqvZENDCWAkWYCi0mlmwlxrFx?=
 =?us-ascii?Q?ek60qD7d2lM0+iHRMR3edSq/Ap64nDnP1SjZ4L+ZB6o8RvTPzfujcpccTd5s?=
 =?us-ascii?Q?xA8EDrlxk3UqTKC+a+fTrBzTasqkKEU=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e30258-f410-4cb6-ebc6-08de8e4c3b70
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:05:20.0258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHj+xzIcBnNJZ/obGPP3q4O2WVmzIA7Uo0LkJBhXBuJ9axkvVOqWFGqA1/jRPrPXi/ZqBDd5fKDl0CbN/qqxaPXSTStXMFA7ttUvWskulTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4061
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 11:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234228

From: sureshha <suresh.ha@bmwtechworks.in>

Backport patch to fix systemd journal-file assertion on removed or corrupte=
d files

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-do-=
not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-tri=
gger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/002=
3-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..ad8f31261e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-as=
sertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
+From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 18 Jan 2026 19:15:31 +0900
+Subject: [PATCH] journal-file: do not trigger assertion on removed or
+ corrupted journal file
+
+When a journal file is removed or corrupted, then the value `p`, which is
+read from Object.data.entry_offset, may be zero.
+
+Note, journal_file_move_to_object() checks the passed offset and return
+-EBADMSG if it is invalid.
+
+Fixes the issue reported at
+https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/112cb=
c37906fb97afe0ad04164262cf62d0af5e9]
+
+Comment: Patch is refreshed as per codebase of v255
+
+Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-=
journal/journal-file.c
+index 08f3b82..633de5b 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -3305,7 +3305,9 @@ use_extra:
+
+ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t needle=
) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <=3D 0)
++                return -EBADMSG;
+
+         if (p =3D=3D needle)
+                 return TEST_FOUND;
+@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint64=
_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, uint=
64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, uin=
t64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+--
+2.34.1
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-cor=
e/systemd/systemd_255.21.bb
index 87e186bbfa..504d6cbef6 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -29,6 +29,7 @@ SRC_URI +=3D " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-timedated-Respond-on-org.freedesktop.timedate1.SetN=
T.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0023-journal-file-do-not-trigger-assertion-on-removed-or=
-.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


