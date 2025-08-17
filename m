Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8171CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 19:50:22 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.web11.59425.1755460218587034463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 12:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=N2k6oXa6;
 spf=pass (domain: axis.com, ip: 40.107.159.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO80y05BwKYZkFg+F+88zDoe2z2Js57Tq6AwlXt4hsdfoMLtU9iRm75JJ5l4PupXPIOqsaumxQWSEJDAA8Jd7QRd5PxDFtdsR1Lp8k4o9DkhqPov+heHEkVS6Cm2gT/x6Wd1D5CltkVg89QvplWJUbTSIimDKklm3Gb8pF7dLPGgLpE/WAQFx/gkckZktTLUVs19DAyquruO+U1aR4Ml1DZ7eYwtujbuukCzMqMFMlKYFALd2O7G1U4D6mWQ5WuMp1/6E2+mYCXYrT1V49bd9itPpcuuSx7bBaKBdwD3QONMGWGwYYe6h2J187+tqOmgoM4TCFgt90jNJQmOWrGZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBVepAC8wFcoF5AwKu9iDjjVlQzxkvpwhtJfO5+6PVQ=;
 b=F1LMEkb5wARXvLuc/oiZKjxx6NbJ1Q3oznR0lOfJd8nk5WXGEy8nBvsx3l4w5H6cSEDC95NtFaLMsv3BrBHQWejPdFb0wtXD5lmFyw2n6uEOxIvlaNWPN/ytOS3luqPXelU4033ZOxilkykCU7McjY3M9g+bbh+BuFaskBta6X3T18N0OVY2bROvH+B9YLca4tRvBN6KTUOwA/PsQQFC3dFNH30txlQTpDAN4t19gEDiIkU+NN5zJ7Xr9ma5qVXskhcH7f0jxakAq7yB5y7M/lSMtphULz9bpL8w4fGQ1cYiMfwYNiEVGQlO6pzhHAKelKcfAVTTguR6RbUPV9BJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBVepAC8wFcoF5AwKu9iDjjVlQzxkvpwhtJfO5+6PVQ=;
 b=N2k6oXa6aQbDOYTV+IQF4GVRlEEZtOBeRc9Wb427mMeBfLjv5d8ISjva6UlRKDsLNC1x09BOiM6L2pi3xr223y9ynZ6sk7F7yW4+KCn2O/wVbri/ZiAksOjydGEo6F2vHciFin/tRbm8F8o+cQVK62kA1jrVTLSmQrlsPkI66xg=
Received: from AM0P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::29)
 by DU0PR02MB10339.eurprd02.prod.outlook.com (2603:10a6:10:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.21; Sun, 17 Aug
 2025 19:50:12 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::ee) by AM0P190CA0019.outlook.office365.com
 (2603:10a6:208:190::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Sun,
 17 Aug 2025 19:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sun, 17 Aug 2025 19:50:12 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 17 Aug
 2025 21:50:11 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 17 Aug
 2025 21:50:11 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 17 Aug 2025 21:50:11 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7FC4323B5
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 21:50:11 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6FA9C120683; Sun, 17 Aug 2025 21:50:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] systemd-systemctl-native: Install systemd-sysv-install
Date: Sun, 17 Aug 2025 21:50:07 +0200
Message-ID: <20250817195008.2455455-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|DU0PR02MB10339:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bfd98a-8517-457f-5078-08ddddc74745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BbrFiCayHVS1JqeJLugL7O9F5RNVt0GZh2l7Wl/FMocFEqDlJhNHztCX29KB?=
 =?us-ascii?Q?rAEFjhpJBEDmEzllW7i7v5Bz/mumd0lZGLmsb0ZyzT66UOYn+oAW518JocLR?=
 =?us-ascii?Q?NsaObXeosEe4dmleHDjrkCRQnS9sQ3jPyp5XsMTJlpAR6LSDxHGwpe8Jf5UQ?=
 =?us-ascii?Q?cjzEraFkEubFtFlYchuRsB2l1dajDA6PDiBUnPGShi1gHqa3gGUKeGBbnW3A?=
 =?us-ascii?Q?m5MC6lap+xaLCZGezq+Xh4pi4fzJT65D6quLEbKhy67NaxlprMGam+hCMOhk?=
 =?us-ascii?Q?eUGZJtYgg+hu2OewJZSGtyYO29C1iFC/IXVz8bw71eZIkYUwtEaz5vx6KeGp?=
 =?us-ascii?Q?hzU0K7ccGmG8TtDnJsa83o4icBKa1PpNKAOvlUznsLoKtERzomeqjJKzaVYr?=
 =?us-ascii?Q?TktanRcuEddxoHly2z5KM9Mb33m3jkcCo9EMUFqFrWAVdydRIN2gRLoojQ0p?=
 =?us-ascii?Q?fJgWZAGe/ve5f3idKPq/bA1Ih+MS96YiykdVWbWc4mxwDO59OpaNdiQG9CjY?=
 =?us-ascii?Q?yVzdyhTK59MxrKxL42sXKRb7AMgATHJNkHEU3RJjA98Xs3rUs8XNkWgmHvaD?=
 =?us-ascii?Q?GZCsDMpEq0yqNGrYIYZTi/K15hsX7hP6nUs288Mw5YBy+fErWGT3qg31KCjV?=
 =?us-ascii?Q?pT8VDSh4PyGIYHoWI8mgTXMAp6j0xRU4CGfXZgab6hbb73u4GIA4CPv5hbwH?=
 =?us-ascii?Q?//1RzywUn9cEhgBB4xQI7KULVl40qV0pxW4G6TXRBMH07XCfu824ZsIZ3O/0?=
 =?us-ascii?Q?gX8V/89m7GwE/8h6ptjcxPA33watZEsFaWT3Qq43XVCvNRXQG10Msp1dEIH8?=
 =?us-ascii?Q?D7JfupunzuDKi1+FWNVZzjnC9w6la7n6J2JXpeA2ysuRz1Yw4AdrIZbv3INA?=
 =?us-ascii?Q?uAFwSPRyd9KdWSHjT9H+3qbZBMDMbisgsE1DzBQbETdHdOhn417czKnra9bJ?=
 =?us-ascii?Q?Ew++zUqsOBCrp60Cb+y9siIi6gYwnQC1TEl+2CUaXjVHSB0AgTXgzFxREUSq?=
 =?us-ascii?Q?1lGoqnki57lvzPg8yl/m2RhL0UgPVsYTZwkvRvmzmwo2SMctGLofuLXT+srp?=
 =?us-ascii?Q?KgEFT7a2mMdiAFE9hiTR+NAx+hP2srKI0Cki5DeTpTnm+XcdCV28q7VQ70p/?=
 =?us-ascii?Q?OAISSM4iOE1Y71b0KqOWthOaQCaNCscWL2U6aLwZjoWgGniO3cqD/iKtoE5P?=
 =?us-ascii?Q?Iwq7/7/Qem8wOSuLsz096lL46HK1u2kwWMdtXFfk2K3qH0u8P2pMQV2a31on?=
 =?us-ascii?Q?UQ2ApLBME912xTtPFtCtR+4CP8SRa3TFnhDScDS8ZP5SKfPbzp9QKriuxgZx?=
 =?us-ascii?Q?2jzFr6PQsWTNbBSXZJcQRa4EwZvYCKvxGkGVQ46fUpbZPUNswNPLRneFWtl2?=
 =?us-ascii?Q?zxRnFjbJpwETf9IBaJehEQYLiozPoB0bTbOACnzg81XzrkAu2GtiJvOUpQ0L?=
 =?us-ascii?Q?qPK7mKqJL70lEjCLVAKaquPckyLEcrcdv13o/8SSlIlYiXogwHfLMQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 19:50:12.0019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bfd98a-8517-457f-5078-08ddddc74745
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB10339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 19:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222009

It is needed when support for both systemd and sysvinit are enabled.

This also adds a patch for systemctl to allow the path to
systemd-sysv-install to be specified in runtime. This is needed because
the hardcoded path that is built into systemctl does not match the path
to where it will eventually be executed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New.

 .../systemd/systemd-systemctl-native_257.8.bb |  16 ++
 ...sv-install-to-specify-path-to-system.patch | 144 ++++++++++++++++++
 ...implment-systemd-sysv-install-for-OE.patch |  13 +-
 3 files changed, 165 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemctl-Add-sy=
sv-install-to-specify-path-to-system.patch

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
index 041a040a26..6030ab7acf 100644
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
+SRC_URI +=3D "file://0001-systemctl-Add-sysv-install-to-specify-path-to-sy=
stem.patch"
+SRC_URI +=3D "file://0002-implment-systemd-sysv-install-for-OE.patch"
+
 inherit pkgconfig meson native
=20
 MESON_TARGET =3D "systemctl:executable"
@@ -14,3 +19,14 @@ EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
+
+do_install:append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d=
)}; then
+		# Use ${libdir}/systemd rather than ${systemd_unitdir} here
+		# because the latter is affected by whether the usrmerge distro
+		# feature is set _for native_ (which it typically isn't), and we
+		# need to know the path to systemd-sysv-install in the
+		# systemd.bbclass when building _for target_.
+		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${=
libdir}/systemd/systemd-sysv-install
+	fi
+}
diff --git a/meta/recipes-core/systemd/systemd/0001-systemctl-Add-sysv-inst=
all-to-specify-path-to-system.patch b/meta/recipes-core/systemd/systemd/000=
1-systemctl-Add-sysv-install-to-specify-path-to-system.patch
new file mode 100644
index 0000000000..fb79ceecc6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-systemctl-Add-sysv-install-to-=
specify-path-to-system.patch
@@ -0,0 +1,144 @@
+From eb02a1bf3bfcc73302c7849cedfa756799168c5d Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Thu, 14 Aug 2025 22:48:00 +0200
+Subject: [PATCH] systemctl: Add --sysv-install to specify the path to
+ systemd-sysv-install
+
+This allows the path to systemd-sysv-install to be specified in runtime.
+
+The hardcoded path to systemd-sysv-install in systemctl causes problems
+when they need to be run from some other location than the expected,
+e.g., when used in a sysroot.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/38614]
+---
+ man/systemctl.xml                     | 13 +++++++++++++
+ src/systemctl/systemctl-sysv-compat.c |  6 +++++-
+ src/systemctl/systemctl.c             | 11 +++++++++++
+ src/systemctl/systemctl.h             |  1 +
+ 4 files changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/man/systemctl.xml b/man/systemctl.xml
+index be9fa4803c..ad1bbaf1a1 100644
+--- a/man/systemctl.xml
++++ b/man/systemctl.xml
+@@ -2885,6 +2885,19 @@ EOF
+         </listitem>
+       </varlistentry>
+=20
++      <varlistentry>
++        <term><option>--sysv-install=3D</option></term>
++
++        <listitem>
++          <para>When used with
++          <command>enable</command>/<command>disable</command>/<command>i=
s-enabled</command>
++          on a unit that is a SysV init.d script, use the specified path =
instead of
++          <filename>/usr/lib/systemd/systemd-sysv-install</filename> to c=
all the
++          distribution's mechanism for enabling/disabling it.</para>
++        </listitem>
++
++      </varlistentry>
++
+       <xi:include href=3D"user-system-options.xml" xpointer=3D"host" />
+       <xi:include href=3D"user-system-options.xml" xpointer=3D"machine" /=
>
+       <xi:include href=3D"user-system-options.xml" xpointer=3D"capsule" /=
>
+diff --git a/src/systemctl/systemctl-sysv-compat.c b/src/systemctl/systemc=
tl-sysv-compat.c
+index cb9c43e3dc..96b3c451f0 100644
+--- a/src/systemctl/systemctl-sysv-compat.c
++++ b/src/systemctl/systemctl-sysv-compat.c
+@@ -3,6 +3,7 @@
+ #include <fcntl.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <unistd.h>
+=20
+ #include "env-util.h"
+ #include "fd-util.h"
+@@ -132,6 +133,9 @@ int enable_sysv_units(const char *verb, char **args) {
+                         "is-enabled"))
+                 return 0;
+=20
++        if (arg_sysv_install && access(arg_sysv_install, X_OK) < 0)
++                return log_error_errno(errno, "%s is not executable: %m",=
 arg_sysv_install);
++
+         r =3D lookup_paths_init_or_warn(&paths, arg_runtime_scope, LOOKUP=
_PATHS_EXCLUDE_GENERATED, arg_root);
+         if (r < 0)
+                 return r;
+@@ -140,7 +144,7 @@ int enable_sysv_units(const char *verb, char **args) {
+         while (args[f]) {
+=20
+                 const char *argv[] =3D {
+-                        LIBEXECDIR "/systemd-sysv-install",
++                        arg_sysv_install ?: LIBEXECDIR "/systemd-sysv-ins=
tall",
+                         NULL, /* --root=3D */
+                         NULL, /* verb */
+                         NULL, /* service */
+diff --git a/src/systemctl/systemctl.c b/src/systemctl/systemctl.c
+index 8c9fcb69f2..1e718e7d87 100644
+--- a/src/systemctl/systemctl.c
++++ b/src/systemctl/systemctl.c
+@@ -126,6 +126,7 @@ bool arg_mkdir =3D false;
+ bool arg_marked =3D false;
+ const char *arg_drop_in =3D NULL;
+ ImagePolicy *arg_image_policy =3D NULL;
++char *arg_sysv_install =3D NULL;
+=20
+ STATIC_DESTRUCTOR_REGISTER(arg_types, strv_freep);
+ STATIC_DESTRUCTOR_REGISTER(arg_states, strv_freep);
+@@ -141,6 +142,7 @@ STATIC_DESTRUCTOR_REGISTER(arg_boot_loader_entry, unse=
tp);
+ STATIC_DESTRUCTOR_REGISTER(arg_clean_what, strv_freep);
+ STATIC_DESTRUCTOR_REGISTER(arg_drop_in, unsetp);
+ STATIC_DESTRUCTOR_REGISTER(arg_image_policy, image_policy_freep);
++STATIC_DESTRUCTOR_REGISTER(arg_sysv_install, freep);
+=20
+ static int systemctl_help(void) {
+         _cleanup_free_ char *link =3D NULL;
+@@ -348,6 +350,7 @@ static int systemctl_help(void) {
+                "     --when=3DTIME         Schedule halt/power-off/reboot=
/kexec action after\n"
+                "                         a certain timestamp\n"
+                "     --stdin             Read new contents of edited file=
 from stdin\n"
++               "     --sysv-install=3DPATH The path to systemd-sysv-insta=
ll\n"
+                "\nSee the %2$s for details.\n",
+                program_invocation_short_name,
+                link,
+@@ -475,6 +478,7 @@ static int systemctl_parse_argv(int argc, char *argv[]=
) {
+                 ARG_DROP_IN,
+                 ARG_WHEN,
+                 ARG_STDIN,
++                ARG_SYSV_INSTALL,
+         };
+=20
+         static const struct option options[] =3D {
+@@ -543,6 +547,7 @@ static int systemctl_parse_argv(int argc, char *argv[]=
) {
+                 { "drop-in",             required_argument, NULL, ARG_DRO=
P_IN             },
+                 { "when",                required_argument, NULL, ARG_WHE=
N                },
+                 { "stdin",               no_argument,       NULL, ARG_STD=
IN               },
++                { "sysv-install",        required_argument, NULL, ARG_SYS=
V_INSTALL        },
+                 {}
+         };
+=20
+@@ -1052,6 +1057,12 @@ static int systemctl_parse_argv(int argc, char *arg=
v[]) {
+                         arg_stdin =3D true;
+                         break;
+=20
++                case ARG_SYSV_INSTALL:
++                        r =3D parse_path_argument(optarg, false, &arg_sys=
v_install);
++                        if (r < 0)
++                                return r;
++                        break;
++
+                 case '.':
+                         /* Output an error mimicking getopt, and print a =
hint afterwards */
+                         log_error("%s: invalid option -- '.'", program_in=
vocation_name);
+diff --git a/src/systemctl/systemctl.h b/src/systemctl/systemctl.h
+index 00405f4705..1db16d0183 100644
+--- a/src/systemctl/systemctl.h
++++ b/src/systemctl/systemctl.h
+@@ -105,6 +105,7 @@ extern bool arg_mkdir;
+ extern bool arg_marked;
+ extern const char *arg_drop_in;
+ extern ImagePolicy *arg_image_policy;
++extern char *arg_sysv_install;
+=20
+ static inline const char* arg_job_mode(void) {
+         return _arg_job_mode ?: "replace";
diff --git a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-i=
nstall-for-OE.patch b/meta/recipes-core/systemd/systemd/0002-implment-syste=
md-sysv-install-for-OE.patch
index d8bb572261..20a2f01317 100644
--- a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-=
for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-=
for-OE.patch
@@ -1,7 +1,7 @@
-From fab8c573d06340868f070446118673b1c23584c5 Mon Sep 17 00:00:00 2001
+From b9fb0368fa54655eccb086b4152f3a2824d2ad53 Mon Sep 17 00:00:00 2001
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

