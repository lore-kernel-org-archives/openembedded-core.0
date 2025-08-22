Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0976ECA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 18:20:53 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.web11.1257.1755886848386289118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 11:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=NsvxULlG;
 spf=pass (domain: axis.com, ip: 52.101.69.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvAAKrPGJeWz5odn16Quxk+1U5zRlyvYNlSxhiQ9B2v7dnvNtUw08JPiCAnF4vw0ZBVyb+5ZbmYIbyU8ININ0NwkjB6KOkwqnqZqWYkiU61dBXycpzk1mCHZ+jKNddF7jSpxTbEH2NOo7ZYbVlw68RSfEvw/OEKuzvzay/HFqGm2ZEXmDFnFK2eo2TYBejS1hRIqwg5YT7sIDBVtOW7TwxUZTsfO3e+MVa1ZZ2io6I5wnw1GPT8iY3HnaZV6gDOaXAAqb5gHh5yvbf6samM6on2658bapI1yk7y5SU4iwJwXsUpgvScM5EO1SwWWKCgZsMhieuEMyNYv55NRZD8YjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owr/n4LEmv6hxzh2YQ8ZW7Ac5jy/E+gaTSTu8cF0DvY=;
 b=PB4ZaxyYUOSi5a3CqdE85k2xp7NhaTl0t4PE8jynYqBQJJDda41dxDSy1/f/PpCprqCbDohRg1XM58/1QDh8JKB4Cmfn4SgHd4M80m/VTDwojmQIVKzO6AKusfVb1iGz7BsqKYc0xBH6CqotNHkhWoSaBxQdGiFy91foZ/nx0AyiL/ZgXpXX1o1MMfgjdmfyMrZ+teNAABor2YSU2BbkqHpYdWRdgSRvZBl5b5Ez7ejQgzEDbtUaotgqJ7PUd4sDbyaZKyFU11+JNrYA5pcmkbanZ7QAhVxzSH8/M+c9x8cEftSsmZGB1HLZIhoPGRLsuVkazrOEEGEcKQJx0bdjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owr/n4LEmv6hxzh2YQ8ZW7Ac5jy/E+gaTSTu8cF0DvY=;
 b=NsvxULlGCYofdYhEiVxgD6kbMszneCf5JNpYK6T8m6DOxChR3QeasOGiIICCZC9czhZy5aLJaHij7HpnXADDWuUFgLnGH/ILxSONBPXQ6gG+C6wmfTpus3mcgKgg6GIsOpFmGNNzRvs0/50Xa9zDdzq8UvUOdm4zvb802uBdbtc=
Received: from DB8PR03CA0036.eurprd03.prod.outlook.com (2603:10a6:10:be::49)
 by DB9PR02MB6748.eurprd02.prod.outlook.com (2603:10a6:10:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 18:20:42 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::83) by DB8PR03CA0036.outlook.office365.com
 (2603:10a6:10:be::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 18:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 18:20:41 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 22 Aug
 2025 20:20:41 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 20:20:41 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 75BC73213
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 20:20:41 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 61ED4120312; Fri, 22 Aug 2025 20:20:41 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv6 1/2] systemd-systemctl-native: Install systemd-sysv-install
Date: Fri, 22 Aug 2025 20:20:37 +0200
Message-ID: <20250822182038.1295769-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|DB9PR02MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 55735fd6-b033-4fac-2873-08dde1a89a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5aimwhb55ggHqJ1/eQYUCoCwsEL1zG/JyAa6TaNMHAs5Bz7sDThdwh78l708?=
 =?us-ascii?Q?N0d5oY4W/sOc+pV/Y5BKmztr7P4cYmj3DvO2kcZugggrNmBBRmuPLEEX5QJl?=
 =?us-ascii?Q?WcR8i6CXE8fuUhwDJEZqbCDIZC3bPn9Eb6ze8uGx2sMsy7pSVFhxkUZKzXBr?=
 =?us-ascii?Q?0MIYBGBBi3AY1Z910gz90Hlsrx+VVfWdXwl2g5MNXE2meEmcqz0aIwSd0i4P?=
 =?us-ascii?Q?ELTVpXgJgrRW1i2JdRekdxatzWjFxF5vUNTQE3LhIlPD7gU8vY60Cpt8Ps/W?=
 =?us-ascii?Q?4/LIc9M1gDBsxV/CV+hZT7toKaOiZrjj0bIjJ01iKc13mCKWST3hb8AlLFDW?=
 =?us-ascii?Q?lg9ScCFlrd6YCHObU1vw0uKLQ8Z+y42JBZ5hJoI9uUzJHb0gTlN2kDtWpwHG?=
 =?us-ascii?Q?37A6rS4UfOdPAVX129huyBJ0qxkyoBbjlPRE+kLWSVsOFvg1uAtaipTXd2F5?=
 =?us-ascii?Q?bNofeNlUjmshOQ8mr9bOPtGAQXIdE1Bzbj54dMiTyhKg3X+o4ElNgWhukri0?=
 =?us-ascii?Q?OOqJ4LNBxaG/WvV5OZgwKSLg8uzI/c6tRr8Iv9qB1HvhFVfjOyLLufVw7QfL?=
 =?us-ascii?Q?Lmc7AQebix3NaIiEkTrt9/gkmGwzj6a4nkBdF7ix7a7TaMDNOkEutdsZseOl?=
 =?us-ascii?Q?07b/WPumHDY3bhl8SpXY28z6U3fkoDZWUEdj/UFeA4SP1wqGVIo68z5hpZvn?=
 =?us-ascii?Q?wLAggTD+7ZsGoMzMCX319qLzi8FaDYkXTlbBLn4tunDSJpaj8jx9djO7Q9gt?=
 =?us-ascii?Q?xV50XN4T8OlyvtwzDox2wKpc0Sqd8fx3zbaK0xIQO+dABonNu2CVDheG38CN?=
 =?us-ascii?Q?9/wnkluoAFbdpi0LpBUe9FmKQ/SxOY5pQ88Rf/+jTtljoG19+GN2ED8GZ0mO?=
 =?us-ascii?Q?FJMeS6b8klfMU6jkWy5rCZlzYIOjZ+CclAN8V7jaaAHgMBVJVa9V5HJ5fMVa?=
 =?us-ascii?Q?jSFh98RidASmJseDvC5Um7rOVPiYrU5k2bFv9WKlCI5q4c7RBbrFsKR3vM4t?=
 =?us-ascii?Q?RtEV7Li/QjyAUrHwVv7RMZn5yQXCmW+HYQhKZIx6Phq/A5CHHaZeKtSNKPRJ?=
 =?us-ascii?Q?aKMLN3ZlFw3hsnk7VLzZ6Tv74pPfkRmYGYqR0N5iT3n5YEsmljX50VIE8HYp?=
 =?us-ascii?Q?A3goetAkWkOol6oVQ6WYlP2GxhhxD+ub2LYP8pwpia0zHuG+duGR6yD3jTVt?=
 =?us-ascii?Q?5m0TdY1lH8CHQ02tfv6gK/mtz6txjf6eLsYV8MX24Zw7EnwQems93vISDP+V?=
 =?us-ascii?Q?4SVONKB29ba0Uy5DG4vLURYPn9GwfbNpblQ6vawO6TYNli2t1OxIYs6QaZHX?=
 =?us-ascii?Q?SLUNKHBBzZsKGpP0azIdANxio+lnw/yhZY+BgdNOU+jqamqLey1U7bgrB5k+?=
 =?us-ascii?Q?rYcciJdE9ywIvZrxpiux6frdProY7Ktns7sh5fXkIUH84XvcXoea2B7bIlM6?=
 =?us-ascii?Q?pi+9OCnMdWp7PGsWP1bF/GdWcmK6ro2KCtg40k0B1Pdcx+9h+Ssg7nvT2HtW?=
 =?us-ascii?Q?ts1w21faR/BlzRozHru+cdKyzb+0Mh0UnoX4?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 18:20:41.8607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55735fd6-b033-4fac-2873-08dde1a89a7d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6748
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 18:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222341

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

 .../systemd/systemd-systemctl-native_257.8.bb | 11 ++++++
 ...ll-systemd-sysv-install-without-path.patch | 37 +++++++++++++++++++
 ...implment-systemd-sysv-install-for-OE.patch | 13 +++----
 3 files changed, 53 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemctl-Call-s=
ystemd-sysv-install-without-path.patch

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
index 041a040a26..4486edf651 100644
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

