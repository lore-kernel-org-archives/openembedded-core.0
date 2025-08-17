Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2BACA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:15:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.web10.60140.1755461707244815663
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ekpSeZ4f;
 spf=pass (domain: axis.com, ip: 40.107.162.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHebN8fWd4PkM4CusdWNXkVfKRuXB06Fr1ZQxyn7/0LuXnKuJle2rXLjZBYeWaoqBC9OZMdL9nMMP8urwou0WbUGDAycRAwYFbf4RfYihc10NVVT0AbGu+C5kD/6aFGXvfVFMtgNsBNpa/TISrlSp2MYfSS02dQMmScDEGLrSS4DYf10HmnHJ2Ow+2s017BHXbDJK/5MERfzUXmzlzd1N1S12rCmtCBJyNTVAMJEtkMpH2yX/M2O2dn5cUZGvvdheo42IoskeiE59Rl2Wqxn5QumVlCZuhL/5jO6RwWtdabx6PvEnOHxtOBc1XCqhx0zqatPmrZv9JPHaiqs8U/jbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/WlRvx2t+sNxAr3j4t4PN/qWNcJO37agaNuZktS3zA=;
 b=mcFrcdXJ7sc7XAAzDjcBijvxOGTm5g/vrGhWWSo8Kyyo97heTLavmcWabBEXGfh1pYU1jkZBfupEmqtO3up/DHmgIE599y/KQw3Op9igS1K9lgal5KCaso9Ve1eGmr8+3/2JTudhGCY/vRqLcAVxGozFzLd5MsMqwPf9mIp4y5yh0/Dcut5wXPvAR/Qs+iP04evx5xYpr5D4K0MJeRjbWFmTjaRy1MsS9N5yzsIS2kMLSE8/LPJa7Q3N41gEAJyXGXoMa/HUpu6Fe7dJJykzjxmsa9jp+2bC7fIkQ9NDnDppvEFhWJ9/aJCWUN20C5TFQrA32FNYauxWfX5Le2Qc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/WlRvx2t+sNxAr3j4t4PN/qWNcJO37agaNuZktS3zA=;
 b=ekpSeZ4fMBqsDnxKw/Mwyn+xA0qelF04TJbsgHLrs0ucThnM5gmjPukf158kw9GQVjZL249cMx+PLTQL6tLFFQi1//MthA58l3leGjXY3C2qXadR9aVQzRiJQYOTpt6TlLrRN6QSmseY12WL0gLYnChyGOgtiYI6NHlkmlSdbFM=
Received: from DU2PR04CA0269.eurprd04.prod.outlook.com (2603:10a6:10:28e::34)
 by DU7PPFDE370A5BB.eurprd02.prod.outlook.com (2603:10a6:18:3::ce0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Sun, 17 Aug
 2025 20:15:00 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::b5) by DU2PR04CA0269.outlook.office365.com
 (2603:10a6:10:28e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Sun,
 17 Aug 2025 20:15:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sun, 17 Aug 2025 20:15:00 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 17 Aug
 2025 22:14:59 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 17 Aug 2025 22:14:59 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id CA92823BB
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 22:14:59 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id BBA6C1203B4; Sun, 17 Aug 2025 22:14:59 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 1/2] systemd-systemctl-native: Install systemd-sysv-install
Date: Sun, 17 Aug 2025 22:14:57 +0200
Message-ID: <20250817201458.2461468-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|DU7PPFDE370A5BB:EE_
X-MS-Office365-Filtering-Correlation-Id: cca96702-bd3a-426e-751e-08ddddcabe59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AWVrJWAZyNyZTDfjar7TiGzXUQEl49Zh1+YpCfjwO/Wxxn9/fsNPvKCy5gFn?=
 =?us-ascii?Q?a+mMZK5FYZlZpAsAU6TQtMgfsUEfxkpSJYZKCywsnznIi/xd5SnyMVi+C3hb?=
 =?us-ascii?Q?UR0JX6Hsx9wkDfxduiW4dFJJ/3+CDVGOm35HX7YLPQWXdthXyVVJEJnV1bQL?=
 =?us-ascii?Q?4QtfBXZxLuJgTJOcHAKxMs3D78CLhsobY6pqNTxl+7q8mU8B53/UIRn8SHjY?=
 =?us-ascii?Q?MhVj3H2dddWM59nO4RVEmr0PydZR+4hADevrwLegqVQR7bVYCXfI5MsMOBJe?=
 =?us-ascii?Q?Yy/wb4Xf6NDvJI+0o+xADa/c8cYTztBSsWi1LZliW5e5dVWPJ3AcKE4z4blW?=
 =?us-ascii?Q?Sm+3ULcIRCvjopaOjYB215FPshss4jki/QAQChJz2uIXEQWSgDdB9JVq4fNl?=
 =?us-ascii?Q?wq0QfFYSH9wbF6WVoPoB7W6T/G4K0iqCYSqvXswPKOTp+WVGkLp2/NArNJzv?=
 =?us-ascii?Q?dGaiO3CfP2JCQB2HWvzMTBBlf3Al2FZXv16SVKmWhJACbI+7fJ8diyaSbFUj?=
 =?us-ascii?Q?zbcSbj51R6DAj2k0EfU8I+YYEIbh9yAeEqn3aDLwKizHyDkl28R5O9RfHbdG?=
 =?us-ascii?Q?CxOm1NU16N/04RXNjsXjt+2ylB/AVhUoJEoR9kS4smf69z+Os5TSUEl18o9M?=
 =?us-ascii?Q?EtBKn6RX/BZWttu+JylS1wew9xSoXTcEFbRaWM0qfFt2tUO7lBjvhnmexX56?=
 =?us-ascii?Q?mvwROOVj6uHUwtlO7bFQVInoWM7Ud/kl9QjD5MHpN3qAsvc6ovoIu5jJKNcS?=
 =?us-ascii?Q?nTXdXOtFvOwVs/5kcefiKLNnqq6JpohsRzB5FuDrHBgu7iDwJuGofYDGJNML?=
 =?us-ascii?Q?9iAmdiUzltqmz3JZRCab/E/QwFKeERNz6magBSHTfbPNGd8gR121grsPONAk?=
 =?us-ascii?Q?Ru0chLOb8cnGXwNvm/dmVf+20U+VKXvZJsXRdQwAMPt4/xpxJITG6ZuqXoR1?=
 =?us-ascii?Q?c4OrYK1UGkkYfJgE83xQwsGlJRKV7a/ycs1zIm/wvHJi3Hqiz5DlrLTuqSI2?=
 =?us-ascii?Q?fiG9N3OddcLMdoKHJlruaCYSdsEgWUIq2ogtrrLUb/sanxEqk2mEr3f9T6DO?=
 =?us-ascii?Q?6HW926VUUdHoldxZNtanwxR/Ex1whmz67XbueFAaN1N9407BgMleWZPepi89?=
 =?us-ascii?Q?NJFAacRq/PoDh8T4pao6D4GalM7/uY7XimHHoNZtsQPaqLRqnTx3/otAaoiW?=
 =?us-ascii?Q?yC8KTgAMfHvGtF47Nv55KO6lXNY1BM30tsYHk+JRiP9IsNdu86vHFx01K4lD?=
 =?us-ascii?Q?21drTeIGtmQdZfnJT4rcjNbwX8vdLn2ZeTk1vmQVKPZwA/NcUsUrmjP652XF?=
 =?us-ascii?Q?j6AIrtqo9Ii1Bwqi4iRgKK2ExmFfQDJ1YvOV5gzmo0xYLxHlwPN1MmNcbBxh?=
 =?us-ascii?Q?wQ0cfKgVEMlXAoW7EVUqqX01w4+BAI/5018GfkcVquWtHfK/XCyUkm17Tbtl?=
 =?us-ascii?Q?F+B3mFCaQUNpdyvS+c5fymwqCEDXOTy5AR3IBnZebEjiTZ/NMxaZhw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 20:15:00.2583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca96702-bd3a-426e-751e-08ddddcabe59
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFDE370A5BB
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222014

It is needed when support for both systemd and sysvinit are enabled.

This also adds a patch for systemctl to allow the path to
systemd-sysv-install to be specified in runtime. This is needed because
the hardcoded path that is built into systemctl does not match the path
to where it will eventually be executed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New.
PATCHv3: Change the Upstream-Status to Denied.

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
+Upstream-Status: Denied [https://github.com/systemd/systemd/pull/38614]
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

