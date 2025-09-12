Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FBDCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:57:26 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.49])
 by mx.groups.io with SMTP id smtpd.web10.20415.1757692641537686329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=AlS+PWxl;
 spf=pass (domain: axis.com, ip: 52.101.65.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9rBkdthKhdsc/Hj1PAuThh06pb68RrHk7ZJUKvPnkmJZuza/fb9rMIKjtUfMSfQuSdTPKkoSExTktMhijFwimnm7u2WTldIh75l+tssNHyl2T52HFiXtFyQy0qO11sJFAalOu5SP/uGrlcWVRragZj/7ki9n1FglBatwaiyxNjHl0dgUZhxElzO1u5VDcFUYW7XImHYMr7k3xMVo0B006S7Bibm7nsnjHB0XPuiYQ/p36ClCS4/LiufXbo2p4mVc8VU1HFPKjOZDoSfl6hSDuYFa59LXQn7ifzBB5H4ySo7r2fBdRUaNutqewP0GScCdhRYrUyfn9NV2lvSReufgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J9XXNhDbwJMQNfAkU0i34g+plD22ot6yPzIMrRHjGY=;
 b=sDjO1lLwFdCmeU/CQosY71FOpZIDplF+GXxjAnwC9OjqRF3trWYNFxQOvLfC0Em8y/TGj8d/oqO97nYGOVZrnewxs3amjt8UGA2k1YkzV8PtJDH/JB91BWofiJRIx3FhEKdZ0yvH+Xxo4yly5/wqMnqAdOFdimXGpTJnDWcWoAwtCfZ/uT4GwYLkO9K5axh6FwGg3vBaAe0V/dgMLXHpjyb+lGvk2r6xWkd8DIbLuIPZXpvy8WLCPwh+5zan5PsTSNHjKVDVRXv4TsoSnlwaSp8mQ0n5797UBGdGRELbz9QCdKyzsv15I/Zc/A30ty3fCpYN89Th1+fq19asY0A3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J9XXNhDbwJMQNfAkU0i34g+plD22ot6yPzIMrRHjGY=;
 b=AlS+PWxlFlJiN7IUrFrhtoD5FFJtJi+cbeFPMzpTcDpUQXWZD/66nbMjsbiYlNZwCcreCWIBd+oF1D1fr0JWSRvNg+GMWupUk3O947LYqdETFq/I3Tfm8GoL8tb+5RGiMh3hvKqs6D2NocwdYTkHx7ry5esfIO+39Gkk3mVaqXk=
Received: from AS4P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::18)
 by PA6PR02MB10814.eurprd02.prod.outlook.com (2603:10a6:102:3d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 15:57:16 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::f5) by AS4P189CA0032.outlook.office365.com
 (2603:10a6:20b:5dd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 15:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 15:57:16 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 12 Sep
 2025 17:57:15 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 12 Sep
 2025 17:57:15 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Sep 2025 17:57:15 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7EA841EAB
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 17:57:15 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id F1A911204AD; Fri, 12 Sep 2025 17:57:14 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 2/3] systemd-systemctl-native: Install systemd-sysv-install
Date: Fri, 12 Sep 2025 17:57:11 +0200
Message-ID: <20250912155712.3340513-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912155712.3340513-1-pkj@axis.com>
References: <20250912155712.3340513-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|PA6PR02MB10814:EE_
X-MS-Office365-Filtering-Correlation-Id: 242e5c28-ae3e-4ef5-072e-08ddf2150bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uE4wrJ08bgJ8dTeZpL1HyBdfKABAGPdyKHh2fz6vGYYz4q87GjCQtKq8TkvM?=
 =?us-ascii?Q?96KaNBgBaM7ndUTrjRszLZ1iKUqLUZncAxN5cnqGCmnIEAalEaQMTTCwfzHu?=
 =?us-ascii?Q?cBOw3tX1POGo9oy4KmV713xoy42UweH4+5R7VSu3+nTskh4lV8GZTvk4RdBJ?=
 =?us-ascii?Q?QGDWN6+hwbveOTjKIOgICx06DUf0TuSChZec9LuDjmmKqxjAfHkLNHLY4Lyo?=
 =?us-ascii?Q?2LdQmHvt5CnPezrm9ou4rWvbRobgW8v96FjAkqm34/HWu6FVultKX9f1VlD7?=
 =?us-ascii?Q?SZrS6jrFdTql/gdzHT4D9l8wYgDifRGfTV6KZkvIH0oYi2nv4PhhcFhi6ajd?=
 =?us-ascii?Q?2NMfqEQy116dT/Xz2cXvZTNPwDWmLK7XGIEI/vLzM3TPsZZzAxnJhdUhG2yQ?=
 =?us-ascii?Q?niF6hQWCSj5IFjYQVSPj7/fRI2EL68SZQjdBr+HomoF+oEGZYm81+7EUBTou?=
 =?us-ascii?Q?Iy4iZ4vCSva12MYYrx4RanfRpQfNNtxllPrAVdAfi5o8UyovA/K+xs3X5FPY?=
 =?us-ascii?Q?Bk3f3nDjZuvch/Nsyu1rRku0/wlwXMnNGbP9hmLajm6TkvpxzhPN97VZRtOB?=
 =?us-ascii?Q?mSBgJLyrcg2Qr1fPtpNZG0zx/s+FALDHAYljJsLo85xyCgQC5omFrp2EmgKl?=
 =?us-ascii?Q?3wOqbWhmvAg7fQdNd34jTGBxWMyuyN0MdCfhtolWp/pFTM/0ZNbDB41Iza5r?=
 =?us-ascii?Q?EsQ72vSuR3aQx1uzx+OquIqdEs18YggpRlqBVpwQxmAF5ljvvZTXACo76T6s?=
 =?us-ascii?Q?QYKfQMY+bHu/aCgP6RIwPpWUK9RBzfJogpx9iJs5Abu80oSxhcY3XhkTWeWB?=
 =?us-ascii?Q?rLxZwoaPMVC7+UhSu9dPXsBPnnWO4jq2s+y5ciVBH10vneTeRHPLI704XpqE?=
 =?us-ascii?Q?DIHwrp9TOf0lPTTmO+1HWmU/jGht6YfwEAjQB/d+PyfTce5OE9sLnU95myFu?=
 =?us-ascii?Q?C4bVvP6kf0NZs8MfIItJN+F7lIis3Sz7Yug6X6eHf/PiBpV0+774mc1dTt+z?=
 =?us-ascii?Q?LoEogZxX7TmWjsH410ipkO578DzdY2yl7iZiwJ11md4hZXJ7feRT72rAvBZw?=
 =?us-ascii?Q?eHJyg1Bz4N9zNtbvMpJ/1ZrFmCQZ4JY5jEVD0egTUKgYLEnMNEx4AlD7OLAo?=
 =?us-ascii?Q?2Rd5H1PvO8n35n6ITAGzsemTdOpf0zBlP0jcpcgZU0vzQESS3MnvTaYleNYr?=
 =?us-ascii?Q?ajS6iCB+kQoLSq0Vvtqna9xQ18DwzOPjKjumljjPsBKO6kLMoxftQB1xR9C0?=
 =?us-ascii?Q?Q7xOnVQZAC7I504mxROtmMMfP1fIH5Ai+OIsbwoBHLGoiSC1XlfQV3bhCuut?=
 =?us-ascii?Q?rl3/7nENlotd2C0+1SXAGkceJbwaU8uZO5nWaQNVJsF2YRc/uyq1j4bS0gyu?=
 =?us-ascii?Q?K3dWjIFCzHem6o8Xs/Kh9C2GrCYuUcE1Q2jPI0AryHCdXR88UcPYqjN+PHej?=
 =?us-ascii?Q?nfci6jHpYia1YTXGmws6KwN1a8rQ4iQYLwPbpE08ii9k49Vjz+g823PPnqkN?=
 =?us-ascii?Q?4HfUxKpz4P8PaaP4AEIgCrWt0UNjuvqlM26Y?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 15:57:16.2041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 242e5c28-ae3e-4ef5-072e-08ddf2150bc9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223325

It is needed when support for both systemd and sysvinit are enabled.

This also adds a patch for systemctl to call systemd-sysv-install
without a hardcoded path and instead relies on finding it in $PATH. This
is needed when calling systemctl from a recipe sysroot.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

Compared to the corresponding change integrated to master, I have
removed the comment about upgrading to systemd 259 as that will never
happen for Walnascar.

 .../systemd/systemd-systemctl-native_257.6.bb | 11 ++++++
 ...ll-systemd-sysv-install-without-path.patch | 37 +++++++++++++++++++
 ...implment-systemd-sysv-install-for-OE.patch | 13 +++----
 3 files changed, 53 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemctl-Call-s=
ystemd-sysv-install-without-path.patch

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
index 041a040a26..4486edf651 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
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
@@ -14,3 +19,9 @@ EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
+
+do_install:append() {
+	# Install systemd-sysv-install in /usr/bin rather than /usr/lib/systemd
+	# (where it is normally installed) so systemctl can find it in $PATH.
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

