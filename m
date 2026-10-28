Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2915.1793210766000484907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 11:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=IqaT7nhT;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.39, mailfrom: upstream_ip-sh@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFryVAn91F+kuGzq5R4ak/A6M18jKn7QaUIIl1tu+LkVJdavt6Mf74dto6XQcX07a1ln5vAKG0JVvGvRrs5UWOCoJnpY6kg9lhh0sucWj5SdmHT0a+aus2LsPsHw//qHGQF8f76Xx1pZ7HxIb6O1EeOR9o9v+fC2fX0Mc8JtzRm20FDlT8NFEPFl24ufhZ/tn0hWy/3LpUiVZiBeVLSAyVhJASv80DJrauuPNRTHpNy0LPavM0kjgBm8nET4fcfzKQbymRcOgqMraSBQYAsgXVrxTQWh7BwKW84fFahwJ5NDtkHGdCCawmXWRnwQ3wJhWAa2wawDhdC83084AH9Omw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo//FaS69XEA9ws1WE+w9oVB/CoL8gb+2HiX9e1Q870=;
 b=u/uUmjQIe80LoMXL6Z6AB2uWZKtT49zGpfdNenunIvz9lFBysfQifbeLwWziee/66xb5SrFgjyVJZiJ+KCgV/gHvg/Q09z/5Ne1biYaHUsZxej3F1T/xguaoGdX9GdQh7+trww3YxHgTVldr4oCgxa/AoG/yCw7Mk3VqWlEgGhl+pwniLgVJVofC+V6pjBiONE8AV+r6vPJDorxIuLwAdH1b5TmPTekirvmWYp1ytceIKX29zOaQnUknnI6E604dgxhnCAEaPWwBtAqQcsDIzd7n5irCxlGsKB0f3fogSAXNjX13CgOd/fkMNjy8pk54EU9VLeT8zwHguP4XFaLXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo//FaS69XEA9ws1WE+w9oVB/CoL8gb+2HiX9e1Q870=;
 b=IqaT7nhTUlPNX9XXgezSyFWcnjjqyh7GZrJSjk+cWkj3Q15TflUzRLNugfA4GxrpTVjgsBQj+MbuFWzXmMb6WXzD5pNvFgT5L+zJ3PpsfTsZ7awmk/U7LsspAaPJghYWnHlfDIqN2JEEcLnKbfwNbDOB+wVeacias1q4ze6PzcZTqOpZ4sZDmw1m6bb21o4BeAE7tCNZwJDbtozjirM4tx2q+kCuYQfJwWer4sNs51qnvjdai0MQb7+5ZCGeNE96vdgUbl0ZcZamN/5TTBayET+geLOBaQYVtarAcl0bw9BuIdPlHYFb3m15RPM8v6i7wbZIWGkOmRmWbmsOshC5ig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1a3::20)
 by PN3P287MB0244.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 17:51:21 +0000
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14]) by MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14%2]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 17:51:20 +0000
From: Suresh H A <UpStream_IP-SH@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: [poky][scarthgap][PATCH v2] systemd: try AT_EMPTY_PATH for access_fd() first
Date: Wed, 28 Oct 2026 23:21:12 +0530
Message-ID: <20261028175112.1623080-1-UpStream_IP-SH@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::7) To MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1a3::20)
Return-Path: UpStream_IP-SH@bmwtechworks.in
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUP287MB4780:EE_|PN3P287MB0244:EE_
X-MS-Office365-Filtering-Correlation-Id: fe965da1-4990-4d08-f93e-08df351c133d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|261028144727099003|261026140227099003|38350700014|11063799006|56012099006|261026121527099003|261021121427099003|261022075727099003|261009223027099003|261022105027099003|10067099003|260925021311599003|260925021911599003|260925022911599003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: KPNtIBXp6MsiyQD9E53KHB1YI51tPUTfOBhM6dEJKZiMSSM6E9CRiwMbsbIDrGMlGFN+B5zVwWCqiJkrN4ExgXREROqCi29020NB3LvxoyRdFjivo464QNRhKcXeXc85Dm5aQZ37kaouHV102Kz0ztB+WGl429XFEP4NbnJ62gff3hkkY2GkgP+RPG/GE6nVzpJWKwK/OJmQes2uzeJo6Anzepytar36ZjTrlhwGYbFJtJc5zIVNDBesbvKRhqeOb8ZezkQ6DoYs0BieKF75sHvJLYZaj/ar/vgLf8mc4sskkDosVI5tXSCnWQeA1ie0dKuX8DNWkmNdqRDcTlBYqasZBo8U8uVChs08TCMy4uAlVc29sx+XpjV/j7lUY4jIDSJR/BBuhJXFu4TSBDOjhjSldXx4V2zsz+iP6djASyR7aA3lW0qqtArkQE3nyUmKisHifdWCrMaV7CCGLffSLckFiDKM66I+7kIJVldXHowRtx8a33vgpErUTV8ntkb43e/b5CMnLVJ2kZnWv/VvxthBcUZhheqU0mFuqtFVbBqhoTlLlOU6zsoKpWZmHTCLUbRwzAWK94/nYU5fVRdxtGGGyRRIQWhDWFZFGTQ/UWfwoC4wYgMXVSPgkPRVSVxFX3RGofn+mAsRG/f1YNhSk+rYZyWqfhw/3JwUvBMz75ly+9ouCSqV9yrhwu444aaSSGVdkpBbJIl7BB7t3s2pqAL0KslBr8KAGL7+ELZhFjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAUP287MB4780.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(261028144727099003)(261026140227099003)(38350700014)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eELcCGK14Gi0eN+2l3bSO3GIRSBSWjzsawP4XB9OWoJc2W3/vTUuu9hcD7Ud?=
 =?us-ascii?Q?zeum4Kqwu/Iw448rO9o9zhxkXagO6C7liWQwKcjw6eMyAKs/0gzkRfK+bKJv?=
 =?us-ascii?Q?cud0/63Vl+8XsPKpA4Q5G2ks82xTCQcQBFiJNyd2O3yZBx+p4g0jlNwUPbOt?=
 =?us-ascii?Q?weHEr60KiRWiX1t8gmrlMsUs/Y+SNMJFpRLPohHN9vJQb+IjR2zE3LZznmjH?=
 =?us-ascii?Q?QbENQoygQfDbKpLE+w9VI6Ron3A9SRqFjmLtcDLT4iCZ3CPYhJTpY/13e5aP?=
 =?us-ascii?Q?CgRYElRbbi5UkKOEqaiInYooV8XxwzuMAveGqUvhovADXpTLNZI3Cz7IZOxa?=
 =?us-ascii?Q?ovXT8bl2X5bvUI/6jVA81rRJbP0POWRbdSVU5rMMGihmajEgGtXetE4WSQuY?=
 =?us-ascii?Q?qx810afV2U5O2J+8TCPWm8HFDL+e3bj/uxJSFqNoSvJD0YUZnZ+yAyQk5S3D?=
 =?us-ascii?Q?vC0NejeB3pv38eR1JKOg5pdj+NgJOozOOwtihQIUl+bHUB8zvNakbrDylLkM?=
 =?us-ascii?Q?cpPaoNVcgJvpuozimIyCcTZWwmFz0Sr2Xcbz3qtR2hd7Uv4bdz4anEL/yWtq?=
 =?us-ascii?Q?ac6aEdQm4A3/uy/QSm09ChjmqU8Ue+0frVGfJyNdyiQzMz2c2E/tE0452CNy?=
 =?us-ascii?Q?LaHarGbQillLyknzsN+2/HVH2ArelpCppJ1dsC1xx4uX4gdnbaMkcMWnFjPI?=
 =?us-ascii?Q?VZB5tJFqNOEGvY1VXDuE5PUSFOF74lzu7+ofZxasfDnHNs20pZd3JKEXVCRj?=
 =?us-ascii?Q?F51cGGW8u6EQD9qEvj1vMUsuYyJv1Sfy5qwbEz7Mwyp82/UzutU2gWfO0jbD?=
 =?us-ascii?Q?SLXOD5IHhqISKHdjZ4vC3NmQKnwxGqAKeCCCnrAZMD9e4IU1vVEqEawMrVmW?=
 =?us-ascii?Q?BQORrTxFwAlQTJIKa+2+Z43YE/Mu+xAgSMabuJmwqxo/gL2MU/kHgv3o2Cfx?=
 =?us-ascii?Q?GrxaGijQeJysf44qZAx/Q74eguK4G3KDr+rAKvWaYXEYvWr1RxAm57k0OiGU?=
 =?us-ascii?Q?VO8jMnGklxFIaksfwU5FGLBBxmtfrBms2RuQdgMKJE2OPux2vn/AGMMTVtwL?=
 =?us-ascii?Q?R9D5kEZxygBFos+ernufLz7KgRpMSqTZyj99g0sH/stY6TIOZ8UXyzjvOROn?=
 =?us-ascii?Q?sH1OKdty7KnOSMqdbrwdfR9n38khsLhg6YXleVAr8MAGVLiKs+pW5383OdlN?=
 =?us-ascii?Q?2Rmnku9oCjaF+CMviHpGU7lcB/hzswp4GUL+3vSoo8nKKaZc9U1dAQoAi7aF?=
 =?us-ascii?Q?a6p5pYXNKp/OIUo6O3MfM6CBMBw8nck5WjlxX7U7j69m1GJseUgbulfFTvDU?=
 =?us-ascii?Q?/24W6Ekap9T4TQ7oya0yykCKiHiG9JZKW/fM4+G5TXATfzXjCW1YANLcpx46?=
 =?us-ascii?Q?3aRIvR2/w4zaFRLYxycLQTUHoErpTYIvbOS7PCBu9zce7eZyNnw3scHMP/Om?=
 =?us-ascii?Q?grRoSMt56IK13YxoiFK3gUieRHK9gJU3bBuhrfzMqVFztywxUA6H4i/m8+l3?=
 =?us-ascii?Q?jgCBWmhLOlodv4nD8LgcsCxg0mgjuJd9Xf8cEjjtBUSPbfZkLQGwtHJBQOFk?=
 =?us-ascii?Q?HxP9VNf7XhlVcjyyUf5LlpOXS33fFbDT5F9q9TnGHXsqKRLuJEw7LxzK7WMc?=
 =?us-ascii?Q?Qz/U8hih8YL79oXoeX44a9m3Tefllh75jW4IwXZXUNYNqOxUlgrY9NQVrqfH?=
 =?us-ascii?Q?oSQicW7yjUHpAZjaPVdmRXT6rNdQYjlDPcb4+egLgg9WWUkX6Zn3XpMdOEEL?=
 =?us-ascii?Q?IkREtsv/sr/VCCQ/uM6elvMyUAWggRI=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: fe965da1-4990-4d08-f93e-08df351c133d
X-MS-Exchange-CrossTenant-AuthSource: MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:51:20.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVfqOfQa0NYZuNAp74viLOagJAft5jYybyRo7l3bnMhh6OnxzchXLk6ngYXrMhMCffB4Jfe6RTxx6re9KV0JmrYRyojRO1Z7jfFJ3iZ2PR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0244
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248827
Content-Type: text/plain; charset="utf-8"

From: Suresh H A <Suresh.HA@bmwtechworks.in>

Backport a fix to try AT_EMPTY_PATH which changes access_fd() to use
faccessat(..., AT_EMPTY_PATH) instead of validating access through
/proc/self/fd/<fd>.

This fixes a reproducible race during service startup. On
Linux 6.6 / systemd 255 (Scarthgap) based platform, affected
services may fail to start when systemd-remount-fs.service runs
concurrently and remounts procfs. In this window, access_fd()
can fail with -ESRCH while resolving /proc/self/fd/<fd>, causing
systemd to report that the executable cannot be located.

The upstream implementation performs the access check directly on
the file descriptor, avoiding dependence on procfs path resolution
and eliminating the observed race.

Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
---
 ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 34 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_E=
MPTY_PATH-for-access_fd-first.patch

diff --git a/meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_EMPTY_PA=
TH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0024-fs-ut=
il-try-AT_EMPTY_PATH-for-access_fd-first.patch
new file mode 100644
index 0000000000..268ace04c4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-fs-util-try-AT_EMPTY_PATH-for-=
access_fd-first.patch
@@ -0,0 +1,34 @@
+From 228d4c63102367a757ba4f31c49a148975607a72 Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Mon, 20 May 2024 19:33:26 +0800
+Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/32933/c=
ommits/c675851d5fd503c1ae5d244f041d43ae9e3ab79b]
+
+Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
+---
+ src/basic/fs-util.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 5bc7d2f..3a7ebd2 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -668,6 +668,14 @@ int unlink_or_warn(const char *filename) {
+ int access_fd(int fd, int mode) {
+         /* Like access() but operates on an already open fd */
+=20
++        if (faccessat(fd, "", mode, AT_EMPTY_PATH) >=3D 0)
++                return 0;
++        if (errno !=3D EINVAL)
++                return -errno;
++
++        /* Support for AT_EMPTY_PATH is added rather late (kernel 5.8), s=
o fall back to going through /proc/
++         * if unavailable. */
++
+         if (access(FORMAT_PROC_FD_PATH(fd), mode) < 0) {
+                 if (errno !=3D ENOENT)
+                         return -errno;
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-cor=
e/systemd/systemd_255.22.bb
index 84d41a86c9..1bdeb551fd 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -39,6 +39,7 @@ SRC_URI +=3D " \
            file://CVE-2026-29111-04.patch \
            file://CVE-2026-4105.patch \
            file://0023-journal-replace-a-bunch-of-assert-with-friendlier-c=
h.patch \
+           file://0024-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch=
 \
            "
=20
 # patches needed by musl
--=20
2.43.0

