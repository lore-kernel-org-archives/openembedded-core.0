Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D312C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 20:56:38 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.52])
 by mx.groups.io with SMTP id smtpd.web11.6190.1748897796111595624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 13:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QuwI+7WP;
 spf=pass (domain: axis.com, ip: 40.107.104.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idRZwuwEMwW/rGBgKoaHk5bvwkMRRon/Fel39K0u1IckXclKv5qTBT9OZNg1dGtazEEuPjoZOwYPqcZQpe+YwrC5Pm0tSrgVblWCCAg3k3UyuKsbv+5WkqbJn/1qUQXYh8MvFF1quhjqDHZGefkSze+yxUR4OJe9eFloMyhQsrhUhF7d+RVNwQucXV9HDQppdXqoTJiv1QZAnQKmUswIl/rJqRunWEumSHL+fAKlcY27b0IcboDlm/eH0wPq59Nl998Nwn89TmY3O8DuNKNB64PkcweJ8YvpNDNeTen2bY3ylNeoMbPSZXs3L/FtvgtGnYVp+Ddu54VdwycWziLbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29RIaMtHtJpndvCX8lLRcAMt6Up6d+Thq4CCltkGjHw=;
 b=hGCpgFmQbatvpnsQlmsEqBlzBFD8Pe4SA3MMhh/8cW7oEFxV+UhGN3mFiBFEARlku6/+jPxgDRC7jiJO8M3hXWQ/BZLL8A68XeZ9F0KiKVGsfpqt+v6O9iVjyrzskTQPF8UjP2ekgs8LDRkHPm37hs+Wugoiokv3N34Hd9NMBSLgAm3v1iaaeLwSnqCzgOOq2SdAPkY+DN26DHnGybNIXUooBrziJo1EFr28U8v+xijD1c4mzO+ZlkW0hoSVseP+jTG1/ci8U44lfMisULoB+7b07736DwwSN1PepFhPgjOgsaXSVn+ZgklnKG5GwTV8FzmIAx5hN44S59XOySvEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29RIaMtHtJpndvCX8lLRcAMt6Up6d+Thq4CCltkGjHw=;
 b=QuwI+7WPMPzZpRH5N3dS7N/ytRTZZ7zGolbBJQ7swNk7fR3x/c/rMrbhu21hPwmWecZn5qiYb9AjhcDo7hVbuKpmcalgTB1cWi3Kzz98dgQVZr1AQ3muPrOlNUUdnPVWNjndvnHO25/arMamgwVDfAlXs+uOFnhBeLQCglb6ZDU=
Received: from DU7P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::10)
 by AS8PR02MB7286.eurprd02.prod.outlook.com (2603:10a6:20b:3f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.18; Mon, 2 Jun
 2025 20:56:31 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::b) by DU7P190CA0026.outlook.office365.com
 (2603:10a6:10:550::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Mon,
 2 Jun 2025 20:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 20:56:31 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 2 Jun
 2025 22:56:30 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 2 Jun
 2025 22:56:30 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 2 Jun 2025 22:56:30 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 9F3EEEC8
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Jun 2025 22:56:30 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 98A0B12041E; Mon,  2 Jun 2025 22:56:30 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] m4: Backport a patch to build with --disable-nls
Date: Mon, 2 Jun 2025 22:56:03 +0200
Message-ID: <20250602205614.781885-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AS8PR02MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c583ea-c43b-4e15-b72e-08dda217f3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JUyDOTXzSBG1RRlxdsjMCPiv4lGKS9t2DvXRCLqKgWkmYQz5AmQMsDtd6fzZ?=
 =?us-ascii?Q?jRoET6hfH802qPYQbOrh4l7iCH+H6R0rfnuoPaSezpmLN8ywST9Y3aWz3dIo?=
 =?us-ascii?Q?TJGWM3IrI0VK8jyHJPfYSlmZbs/HvCgN/fwVD4f4pUMe7aMCwmSmBY9x4oGI?=
 =?us-ascii?Q?yfcb94Nb9bviG6D3ZZoh/AXDnvl9rfFlHLTC5HIsYc/JWLQVJsSXXm/V1rND?=
 =?us-ascii?Q?5nAw/Cnwbpn2ta4Pbuccxn+RhePTKvacR0JyTqfakd6Cu+Zky+08ipeZdU7H?=
 =?us-ascii?Q?5Lzll4rAxFr77EcOwbfYiEnRFFExlk/ukXTEMGP2l2xfDxG0EbmDXQPLjrMN?=
 =?us-ascii?Q?JUFTWskYXnD3V542KvEGiiOrWSBkgwpIelh6NDWS2gQbjZQSdZ/AVBXK20a2?=
 =?us-ascii?Q?/9uAIdYCmNpVh0V9WkfgDGKaYQ8UfbuVStc2OxuqNtD+rIhUt/NP11CzB4Nf?=
 =?us-ascii?Q?azgWcrnKlQh+46FYpTUl6NTuIu+TUmZmcGQ0g0Neg8afMgWpy/Y/EVj6pIE5?=
 =?us-ascii?Q?b/s90fNLYafkDIMwtuAH4n5eFleXfLsfr88WkaYB4GbxltXnHrreClURWy3o?=
 =?us-ascii?Q?WOXCzKB+WcwEOUUCggF5ybU8t2zJHVc0vIt8PZru0ufaUzwTzfH7+iLryPDv?=
 =?us-ascii?Q?p5bpkhtd8guV46jasW8ITBkjRqKkU7uReZvAmiHKu7TJa+clPm8ghnpAiZz2?=
 =?us-ascii?Q?NCrq+m/ovuH3s4gcF/sQlh1Ur7fiukbuzLObzVenb2NwutoRwpxEH7431FUO?=
 =?us-ascii?Q?WMf806pRDyWmWkOq/YS4buT5rWm/i5pfG6jMgC4x1Ih7pIZoEC8O8WjZrfQS?=
 =?us-ascii?Q?im+bojs1bq0JDKoe7xfm18uks7Utc+VmyYegtucmttJCLZUTU2zJJdb4w6Ev?=
 =?us-ascii?Q?2T532hd23A/+I8hykFHWKm52wyJ9Amt/QLBTHWgZrCJeY8fKE/5CAaaeWoI2?=
 =?us-ascii?Q?xMkLBIpCVbv4gI/dVj8dXJRqwEZgMPvAwbxLv/8nSt0z1H0NERjwpXnRrugu?=
 =?us-ascii?Q?6MR1usbClEXKGd8AIQxlrc30qT3mjqXD1iB1kOshcT/86jLp/ZCMyKc6nDo/?=
 =?us-ascii?Q?CPS6ChCdLuJiy3Ft38Ke8jMTW+tR1Mr2EqGL8rjmRVoCPQBh720+dkU6iCp4?=
 =?us-ascii?Q?s/pdz+q3GWw80YDrfXFayi15+Pv4fT38ZB5ien0hhHnOxufLQuxEVS+HAMzs?=
 =?us-ascii?Q?QpKODVVm+DtXOyrR95GTiBX/fiqA52VXduqaQa7a2ArvloZ0t9ERqmt/3RC/?=
 =?us-ascii?Q?oke1n69wjF5XuLPP7VFU0I4g7weP0fPVS2dkS/dMKCDEWrUg+R2XwqfH+aNL?=
 =?us-ascii?Q?UYqWHsHSCvZjM7fF9RKL9LOBjCbicvi2lYdIPDl9rfnNlOvkRK8IlWLnFoT2?=
 =?us-ascii?Q?feQwOo7PbqYTgTnWuqRIFW6EcOYUmL4a9X4NOsvNgk3enxStfsiQN4MAqI3t?=
 =?us-ascii?Q?N+aWuas1q6Tdckh6A+Jw7Ft1MxUeGmdO+iOs86twJRcV+12AGvPUNk7RUosb?=
 =?us-ascii?Q?6h3qa0YIM/I/V6pEFf440VxFx7Di04HepuasG6BIKwvXTJ7Fy0xUOMbnbA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 20:56:31.2522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c583ea-c43b-4e15-b72e-08dda217f3b3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 20:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217732

Building with USE_NLS =3D "no" results in the following errors:

  lib/spawn-pipe.c: In function 'create_pipe':
  lib/spawn-pipe.c:218:7: error: format not a string literal and no
  format arguments [-Werror=3Dformat-security]
    218 |       error (EXIT_FAILURE, errno, _("cannot create pipe"));
        |       ^~~~~
  lib/spawn-pipe.c:221:7: error: format not a string literal and no
  format arguments [-Werror=3Dformat-security]
    221 |       error (EXIT_FAILURE, errno, _("cannot create pipe"));
        |       ^~~~~
  lib/clean-temp.c: In function 'create_temp_dir':
  lib/clean-temp.c:234:7: error: format not a string literal and no
  format arguments [-Werror=3Dformat-security]
    234 |       error (0, errno,
        |       ^~~~~

Backport a patch from gnulib to avoid the problem.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/m4/m4-1.4.20.inc        |   1 +
 ...gcc-Wformat-security-warnings-with-d.patch | 133 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wf=
ormat-security-warnings-with-d.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools=
/m4/m4-1.4.20.inc
index 2ea3a9bace..0640395050 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -7,6 +7,7 @@ GNU M4 also has built-in functions for including files, run=
ning shell commands,
 inherit autotools texinfo ptest gettext
=20
 SRC_URI =3D "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
+           file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-=
d.patch \
            "
 SRC_URI:append:class-target =3D " file://run-ptest \
                                 file://serial-tests-config.patch \
diff --git a/meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wformat-s=
ecurity-warnings-with-d.patch b/meta/recipes-devtools/m4/m4/0001-gettext-h-=
Avoid-gcc-Wformat-security-warnings-with-d.patch
new file mode 100644
index 0000000000..6fad05041f
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wformat-security=
-warnings-with-d.patch
@@ -0,0 +1,133 @@
+From c4dc0ab4424fca31635b7837b1c180f7d3df8ede Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Wed, 28 May 2025 15:14:07 +0200
+Subject: [PATCH] gettext-h: Avoid gcc -Wformat-security warnings with
+ --disable-nls.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported by Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com> in
+<https://lists.gnu.org/archive/html/bug-gnulib/2025-05/msg00225.html>.
+
+* lib/gettext.h (gettext, dgettext, dcgettext): With gcc in C mode,
+define these as inline functions.
+* lib/sigpipe-die.c (sigpipe_die): Use translated string as a format
+string, relying on the format string checking done by 'msgfmt -c'.
+* lib/xmemcoll.c (collate_error): Revert commit from 2025-01-17.
+* lib/xprintf.c (xvprintf, xvfprintf): Likewise.
+* lib/openat-die.c (openat_save_fail, openat_restore_fail): Revert
+commit from 2024-12-10.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gnulib.g=
it/commit/?id=3D6e5015dd557b20ae4a0829c4bf78480ce2f4cb04]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ lib/gettext.h    | 49 ++++++++++++++++++++++++++++++++++++------------
+ lib/openat-die.c |  4 ++--
+ lib/xprintf.c    |  4 ++--
+ 3 files changed, 41 insertions(+), 16 deletions(-)
+
+diff --git a/lib/gettext.h b/lib/gettext.h
+index ea0c27e..bb3d975 100644
+--- a/lib/gettext.h
++++ b/lib/gettext.h
+@@ -59,18 +59,43 @@
+ #  endif
+ # endif
+=20
+-/* Disabled NLS.
+-   The casts to 'const char *' serve the purpose of producing warnings
+-   for invalid uses of the value returned from these functions.
+-   On pre-ANSI systems without 'const', the config.h file is supposed to
+-   contain "#define const".  */
+-# undef gettext
+-# define gettext(Msgid) ((const char *) (Msgid))
+-# undef dgettext
+-# define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (Msgid=
))
+-# undef dcgettext
+-# define dcgettext(Domainname, Msgid, Category) \
+-    ((void) (Category), dgettext (Domainname, Msgid))
++/* Disabled NLS.  */
++# if defined __GNUC__ && !defined __clang__ && !defined __cplusplus
++/* Use inline functions, to avoid warnings
++     warning: format not a string literal and no format arguments
++   that don't occur with enabled NLS.  */
++__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
++const char *
++gettext (const char *msgid)
++{
++  return msgid;
++}
++__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
++const char *
++dgettext (const char *domain, const char *msgid)
++{
++  (void) domain;
++  return msgid;
++}
++__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
++const char *
++dcgettext (const char *domain, const char *msgid, int category)
++{
++  (void) domain;
++  (void) category;
++  return msgid;
++}
++# else
++/* The casts to 'const char *' serve the purpose of producing warnings
++   for invalid uses of the value returned from these functions.  */
++#  undef gettext
++#  define gettext(Msgid) ((const char *) (Msgid))
++#  undef dgettext
++#  define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (Msgi=
d))
++#  undef dcgettext
++#  define dcgettext(Domainname, Msgid, Category) \
++     ((void) (Category), dgettext (Domainname, Msgid))
++# endif
+ # undef ngettext
+ # define ngettext(Msgid1, Msgid2, N) \
+     ((N) =3D=3D 1 \
+diff --git a/lib/openat-die.c b/lib/openat-die.c
+index 3fbb5d8..79a5b23 100644
+--- a/lib/openat-die.c
++++ b/lib/openat-die.c
+@@ -34,7 +34,7 @@ _Noreturn void
+ openat_save_fail (int errnum)
+ {
+ #ifndef GNULIB_LIBPOSIX
+-  error (exit_failure, errnum, "%s",
++  error (exit_failure, errnum,
+          _("unable to record current working directory"));
+ #endif
+   /* _Noreturn cannot be applied to error, since it returns
+@@ -53,7 +53,7 @@ _Noreturn void
+ openat_restore_fail (int errnum)
+ {
+ #ifndef GNULIB_LIBPOSIX
+-  error (exit_failure, errnum, "%s",
++  error (exit_failure, errnum,
+          _("failed to return to initial working directory"));
+ #endif
+=20
+diff --git a/lib/xprintf.c b/lib/xprintf.c
+index 4d9a3e5..790af53 100644
+--- a/lib/xprintf.c
++++ b/lib/xprintf.c
+@@ -45,7 +45,7 @@ xvprintf (char const *restrict format, va_list args)
+ {
+   off64_t retval =3D vzprintf (format, args);
+   if (retval < 0 && ! ferror (stdout))
+-    error (exit_failure, errno, "%s", _("cannot perform formatted output"=
));
++    error (exit_failure, errno, _("cannot perform formatted output"));
+=20
+   return retval;
+ }
+@@ -67,7 +67,7 @@ xvfprintf (FILE *restrict stream, char const *restrict f=
ormat, va_list args)
+ {
+   off64_t retval =3D vfzprintf (stream, format, args);
+   if (retval < 0 && ! ferror (stream))
+-    error (exit_failure, errno, "%s", _("cannot perform formatted output"=
));
++    error (exit_failure, errno, _("cannot perform formatted output"));
+=20
+   return retval;
+ }

