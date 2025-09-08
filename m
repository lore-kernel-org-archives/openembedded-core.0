Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6859FCAC583
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 16:05:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.web11.1581.1757347513143407911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 09:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LAdE85Up;
 spf=pass (domain: axis.com, ip: 52.101.65.62, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJohGIsQ7RgZO9TIf8KLS+3wHIuOtg8lAgz31bD/Uu4HmXuqQ486UF6IWFCwMowhGazsy5OCurIpylublq/pbnxpxAoQPtXLfi+sHnhkHt8Tymx/d8Ogn9y+tt2HOKefSheLaz8nuDohV9QHlgsU/0pM3C9ZzwUYeAArSEMny7DTogxKzU4RzTOWoQQAzw8jWj4KGmUVa7NLAf8RkVDGRj+zMw10CulT9p2g1o2xEawrrZRstS/s1/a8qcmYcAY2a9myTRTFVVmjgHv6PTf9OpnwUTIHWJ0HxWs9hbB41CeuByruIOAr6Bph15iVet/yA/zSaLp87s7RL/XB9B4SzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1HNcMdvIswFCShjzP4e/j1XUvLrcRz5Xo1eeTHu56s=;
 b=EEDRAwE7atZxPb4r5K8gSVbg/5cHIBwsY/AqLULJyVXaa/8FILIDnF7ih/DgyIAZ7WvIBThJnFxuAUiH2wHm6kbx8XCAgSjQnWjYXIMEjJnCHWp3q/mieTq0rYYQw1bzftEoTSidzQmctw3zMjxDGi9qSHp7HgD6QIv6PbI0qZYoyKUiblhxZl0RsfK3zAp7PqeYpfn7IdHNds/1EtvDcpb6wS0eVbZlLia1uRsz/rlPRUHQBltfAzW96MC7uuTkBVcHyYT8Lzqs9pAI9g+10vWrt9doo6N9Ff6RY/bDlSvVz25bYstj52+TQ5n+RJK1XeFCbBQ2uQjGY6FiXvdmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1HNcMdvIswFCShjzP4e/j1XUvLrcRz5Xo1eeTHu56s=;
 b=LAdE85Upq7bXp5X9LFZFjEokmrFrco/ZtNqv0qRorJOcNnE/EqrWDAel872hROHIk8aCbqxPY0y5uzNamt9ykEdyZ02LVTRk/QgwiQJqBJWwCBzsneJlzJJE3C30hNAZNfjfKevy2zv8QbEnu1C6QvVR+MpPiZnCG8reGybifVc=
Received: from AS4P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::12)
 by DB9PR02MB7034.eurprd02.prod.outlook.com (2603:10a6:10:223::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 16:05:09 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::1f) by AS4P192CA0004.outlook.office365.com
 (2603:10a6:20b:5da::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 16:05:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 16:05:07 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Mon, 8 Sep
 2025 18:05:07 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Mon, 8 Sep
 2025 18:05:07 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 8 Sep 2025 18:05:07 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 392B319E0
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Sep 2025 18:05:07 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id DF12A1229BD; Mon,  8 Sep 2025 18:05:06 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv7 1/2] systemd-systemctl-native: Install systemd-sysv-install
Date: Mon, 8 Sep 2025 18:05:03 +0200
Message-ID: <20250908160505.3281600-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|DB9PR02MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b048947-fdb1-43ac-c429-08ddeef17b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RzZWwywcAt9Yg8ZwERsPU0DrtTsvqllX0u2bbtJxgJ2MBsHqmDhRAqFX0n3N?=
 =?us-ascii?Q?S6xXbg7o6NBdcHRl4FBK5F5ufHuKz0Ce3w0nrSW2WTlGIUcZOLlJehfe4E8T?=
 =?us-ascii?Q?al7ai5T0n8jU2P3N6HOc57oQLsOocqXwTUjl94riDQW428xHebbmj65PE6jW?=
 =?us-ascii?Q?cTMB2Y6lgBWVq6AOjmfYrcGYcx4EotT6dur11J3mV+sxmTD6609mD1rbrM6G?=
 =?us-ascii?Q?OLsOwmeoP9+NBR7s2siUF8lypRMVkqIurKmpM2hc+iKkYYCdSdsdHW/BU/GP?=
 =?us-ascii?Q?9uXrdHdm66FGvTZSLNdcsXQMW9Gn1wPnB70ZkwJ+DcV1/vNoNS7yxwFKtaAc?=
 =?us-ascii?Q?iGWrOd8qmqy1iuwdOTLgiypuy6kX0OKCo0I3sMjI27AmFaFqwbylVTzo0ngk?=
 =?us-ascii?Q?GauZz3N7qAesuUP5SyJ7qIh+ATWMmmE05Uqzlo6NvCvHff84eBDMZ7tq4Axr?=
 =?us-ascii?Q?Q+piBNTnL+/5B3pfTZLVjZ9jGeZP2H8XCw2QZviDthlLaxlo7GHrANsIyo3V?=
 =?us-ascii?Q?NJSjm+9l7k4ryqqSktHGqmMcwTOb4EOxFG83t4f2tj7jTx5SR/CozwiS7BY5?=
 =?us-ascii?Q?BztXW6tans7z/bgcX9NgjpLwQ4+YrEuJsgA0Knbiq30ej3ILTgJzO0zZSvKe?=
 =?us-ascii?Q?fmx24WgCxfNIDoTUPp2H6zLe0yYG8Pd34/PozfeAvzmrPuRuPea9k/omU4wV?=
 =?us-ascii?Q?6SwSbIVGrWIVUYXndPpSSiONssTpU2saoU5T917J9i95/tqNDb1KB5TwF+GC?=
 =?us-ascii?Q?iq4ZqzLRXksWukzL2awr76FU4XRP2ZpeoCcu1oRxTyygEM9leU3egEI/bhOC?=
 =?us-ascii?Q?pfShSQt7lN1th3TqRQdrTbAKf4JPBQF6hwhVeS8uoqTv7UjBcSqNn50shx8y?=
 =?us-ascii?Q?8eJRcztjGfxZ+bChZppwu9NGOOCrGJHGjYfjkc2iR0ffFb3zG07A7S4r9MLj?=
 =?us-ascii?Q?Nu99zLREmhM+1DZdOVpIpY7nG2tLEI8EYeMbEHF0XGsPaZEB4azKC+Zk5Grq?=
 =?us-ascii?Q?j/KA0JrG5C+04/LHr6P7U6pjG5F6JnaZcIf0XPKNIu9j97+baukJQDF/3PQk?=
 =?us-ascii?Q?mDgWkSfpUE57h0ccWgHsoCMPkwlbaWUPZjPQGrRyzQkaWU8nKbGpPZg5GNcC?=
 =?us-ascii?Q?qo6ONsaCpnqDXTuq0S5S8aDzX0t9N127WSRqq2AD3IBNTW1MyXH55LGE/4P/?=
 =?us-ascii?Q?JNqE5a1S7i8T1M0RnX9G6T2BhdALluHL7ZP+sMpwYQAv+qisBDOJNVL9zmUh?=
 =?us-ascii?Q?4ZV1TPGpQbc4K9ThcG5jaGPCCFzR9HqceVV5XabGcjZt1jS4hYE62ucdh2m5?=
 =?us-ascii?Q?xhx+0WtGsYaiNXEppEVBWPLgVVd5gQcryDsjXNSp8Y7G4K5CFNFTotZ4PyZA?=
 =?us-ascii?Q?pFUmYPH0+YTuuBcpECuys/mMqjf+hJtqmQr0D/suxf8pzTNElPjeH0PgLYFM?=
 =?us-ascii?Q?rHgjatz+UKAK+Aw7xdE9eUnNjMN+O5xNKVT7pitcrTsxfCXY8XGVSNMEGTg6?=
 =?us-ascii?Q?fQkm1BA8GAWBB9IGgwQJEN3KVHksd7EbyRTu?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 16:05:07.7988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b048947-fdb1-43ac-c429-08ddeef17b39
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 16:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223074

It is needed when support for both systemd and sysvinit are enabled.

This also adds a patch for systemctl to call systemd-sysv-install
without a hardcoded path and instead relies on finding it in $PATH. This
is needed when calling systemctl from a recipe sysroot.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New.
PATCHv3: Change the Upstream-Status to Denied.
PATCHv4: Add a Signed-off-by to the new patch.
PATCHv5: Always install systemd-sysv-install.
PATCHv6: Completely reworked the patch for systemctl.
PATCHv7: Add comment indicating that all of this shall be reverted when
         upgrading to systemd 259.

 .../systemd/systemd-systemctl-native_257.8.bb | 14 +++++++
 ...ll-systemd-sysv-install-without-path.patch | 37 +++++++++++++++++++
 ...implment-systemd-sysv-install-for-OE.patch | 13 +++----
 3 files changed, 56 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemctl-Call-s=
ystemd-sysv-install-without-path.patch

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
index 041a040a26..a37c9035ed 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
@@ -1,9 +1,14 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
+
 SUMMARY =3D "Systemctl executable from systemd"
=20
 require systemd.inc
=20
 DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2-n=
ative"
=20
+SRC_URI +=3D "file://0001-systemctl-Call-systemd-sysv-install-without-path=
.patch"
+SRC_URI +=3D "file://0002-implment-systemd-sysv-install-for-OE.patch"
+
 inherit pkgconfig meson native
=20
 MESON_TARGET =3D "systemctl:executable"
@@ -14,3 +19,12 @@ EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
+
+do_install:append() {
+	# Install systemd-sysv-install in /usr/bin rather than /usr/lib/systemd
+	# (where it is normally installed) so systemctl can find it in $PATH.
+	# It is expected that the use of systemd-sysv-install will be removed
+	# with version 259 of systemd and then this, and everything that was
+	# added along with it, should be reverted.
+	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${b=
indir}/systemd-sysv-install
+}
diff --git a/meta/recipes-core/systemd/systemd/0001-systemctl-Call-systemd-=
sysv-install-without-path.patch b/meta/recipes-core/systemd/systemd/0001-sy=
stemctl-Call-systemd-sysv-install-without-path.patch
new file mode 100644
index 0000000000..bf08dbe9b0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-systemctl-Call-systemd-sysv-in=
stall-without-path.patch
@@ -0,0 +1,37 @@
+From 34c8551a8b16bf235a1ebe8d9cb1a3474a7c975e Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Fri, 22 Aug 2025 18:07:28 +0200
+Subject: [PATCH] systemctl: Call systemd-sysv-install without path
+
+Expect to find systemd-sysv-install in $PATH instead of hardcoding the
+path to it, as the latter does not work when running systemctl from a
+recipe sysroot.
+
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Upstream-Status: Inappropriate [OE specific]
+---
+ src/systemctl/systemctl-sysv-compat.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/systemctl/systemctl-sysv-compat.c b/src/systemctl/systemc=
tl-sysv-compat.c
+index cb9c43e3dc..e44ef9f64e 100644
+--- a/src/systemctl/systemctl-sysv-compat.c
++++ b/src/systemctl/systemctl-sysv-compat.c
+@@ -140,7 +140,7 @@ int enable_sysv_units(const char *verb, char **args) {
+         while (args[f]) {
+=20
+                 const char *argv[] =3D {
+-                        LIBEXECDIR "/systemd-sysv-install",
++                        "systemd-sysv-install",
+                         NULL, /* --root=3D */
+                         NULL, /* verb */
+                         NULL, /* service */
+@@ -218,7 +218,7 @@ int enable_sysv_units(const char *verb, char **args) {
+                         return j;
+                 if (j =3D=3D 0) {
+                         /* Child */
+-                        execv(argv[0], (char**) argv);
++                        execvp(argv[0], (char**) argv);
+                         log_error_errno(errno, "Failed to execute %s: %m"=
, argv[0]);
+                         _exit(EXIT_FAILURE);
+                 }
diff --git a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-i=
nstall-for-OE.patch b/meta/recipes-core/systemd/systemd/0002-implment-syste=
md-sysv-install-for-OE.patch
index d8bb572261..98d050ceae 100644
--- a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-=
for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-=
for-OE.patch
@@ -1,7 +1,7 @@
-From fab8c573d06340868f070446118673b1c23584c5 Mon Sep 17 00:00:00 2001
+From 4a5602ede9881fd8e578a3c8bc40dd5df7c4d802 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 02/26] implment systemd-sysv-install for OE
+Subject: [PATCH] implement systemd-sysv-install for OE
=20
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/s=
ystemd-sysv-install.SKELETON
-index cb58d8243b..000bdf6165 100755
+index cb58d8243b..eff3f5f579 100755
 --- a/src/systemctl/systemd-sysv-install.SKELETON
 +++ b/src/systemctl/systemd-sysv-install.SKELETON
 @@ -34,17 +34,17 @@ case "$1" in
@@ -22,13 +22,13 @@ index cb58d8243b..000bdf6165 100755
          # call the command to enable SysV init script $NAME here
          # (consider optional $ROOT)
 -        echo "IMPLEMENT ME: enabling SysV init.d script $NAME"
-+        update-rc.d -f $NAME defaults
++        update-rc.d ${ROOT:+-r $ROOT} -f $NAME defaults
          ;;
      disable)
          # call the command to disable SysV init script $NAME here
          # (consider optional $ROOT)
 -        echo "IMPLEMENT ME: disabling SysV init.d script $NAME"
-+        update-rc.d -f $NAME remove
++        update-rc.d ${ROOT:+-r $ROOT} -f $NAME remove
          ;;
      is-enabled)
          # exit with 0 if $NAME is enabled, non-zero if it is disabled
@@ -38,6 +38,3 @@ index cb58d8243b..000bdf6165 100755
          ;;
      *)
          usage ;;
---=20
-2.34.1
-

