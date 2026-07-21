Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C58FC4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:38 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29035.1784655748905206779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DqgMRgey;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9855; q=dns/txt;
  s=iport01; t=1784655748; x=1785865348;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2gAfCFzTEHFhNb3NwX4tJUgnVbWdEhCzIFAZjl3RTwc=;
  b=DqgMRgeySFg2DJiTewB3xEufU3MQL4B+PX9RZaVMbJrSBQrZ8PYimCyy
   bAgQRokFEWzFjwqO1juxbienvXWtbabT4aV+HcM7uY5oZM0jDD6XVVoV3
   wR29S1Kbu2nFXMEaQhmHUnNo21CX6bRvrQo1XIMyMue4w2T6/CEJJ9/5P
   1hX1E2mT2mgZUZzISa1pxhcHq3rXhaCFiNeQRnGdva4MJUOp994qj5ECL
   2CC126kR3ooyAGktYf3bHtCaOxv1OcsDwVbJFYAzVNcZol8TGz10gYaSc
   dA/+0sEr0YjJemzAUZgSTqeEYpRP45comD11+zOjZ4Jz8SYP3SvF3tQkm
   Q==;
X-CSE-ConnectionGUID: A+bbFt8mSUCXLd0Ce1BZMA==
X-CSE-MsgGUID: +lVFJ67nQlmPDUM2rIk19Q==
X-IPAS-Result: =?us-ascii?q?A0BHAgD/rl9q/5L/Ja1aHgEBCxIMggULgld0X0JJA4RUj?=
 =?us-ascii?q?1KCIYEWnQgUgWoPAQEBD0QNBAEBghKQTAImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaASkECwE0PgMBAgMCJgItIxkIgwIBgnQDE?=
 =?us-ascii?q?ahnlxcaN3p/M4EBg2gCQ1DbLgELFAGBCi6FP4MdAYUCXBgBhHwnGxuBcoEVg?=
 =?us-ascii?q?nN2gQWBXAKBIwQhg3OCagSCIoEMgVoYBoJ7gXSCBokaSIECHANZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPhc0WBsHBYEdgS6BAoRuIx8DOX+BL3VKdy1qEheBJ?=
 =?us-ascii?q?oIUgToCVQMLGA1IESw3FBkEPQFuB41UI4E8NUgHATxRASsgAmMUgRMcAZMIG?=
 =?us-ascii?q?iqPbIIeoRIKKIN1jCGVOhozhVulEQuYfY4KllCEaYFoPIFZcBWDIglKGQ+OO?=
 =?us-ascii?q?INrhAeBDMcmPDULAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:C5E7xq8pOKGgv6JiCE79DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jBNDG6DPqrYYGr9c48gPYWz9EMAucfdy4VkQQVk/C9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThNs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kffocS1PonBFpz3
 sw8JGgmY0mptceflefTpulE3qzPLeHxN48Z/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Mn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYOOJIbRHpwJ9qqej
 iHCwUrbXE4cDdia8Ra41yi2p+yWzBquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:IBlk2Kqhu4W83rzLqF8pHXwaV5odeYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc5wx+ZJhNo7290cq7MBDhHOBOgLX5VI3KNGKNhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:CMj4XmBSExAho9D6EwAk/kQ6BpAgSUD2/FPce2S1UExbbZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Ayj5OYgyJjbABg0JLpDCAGXVVxFmaqOeqNm4vz8o?=
 =?us-ascii?q?Ags2BDQBNHm2HrTfuE7Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="513623314"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:27 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 691F918000203
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:27 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 82A85CC037D; Tue, 21 Jul 2026 23:12:25 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 1/8] cups: fix CVE-2026-27447
Date: Tue, 21 Jul 2026 23:12:10 +0530
Message-Id: <20260721174217.229620-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241559

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream backport [1] for CVE-2026-27447 as mentioned in [2], where
the scheduler treated local user and group names as case-insensitive.

Also include the two upstream regression fixes that followed the CVE
fix:
- CVE-2026-27447-regression_p1.patch [3] fixes a cupsd crash when the
  referenced user does not exist on the server. This regression was
  reported in OpenPrinting/cups Issue [5].
- CVE-2026-27447-regression_p2.patch [4] fixes unauthenticated print
  policies for non-local accounts. This regression was reported in
  OpenPrinting/cups Issue [6].

[1] https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb
[2] https://security-tracker.debian.org/tracker/CVE-2026-27447
[3] https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562
[4] https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0
[5] https://github.com/OpenPrinting/cups/issues/1555
[6] https://github.com/OpenPrinting/cups/issues/1557

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Refreshed the embedded source patch context; no CVE logic changes.

 meta/recipes-extended/cups/cups.inc           |   3 +
 .../cups/CVE-2026-27447-regression_p1.patch   |  33 ++++++
 .../cups/CVE-2026-27447-regression_p2.patch   |  46 ++++++++
 .../cups/cups/CVE-2026-27447.patch            | 108 ++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c7475d2b81..ec9392b73d 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2025-58436.patch \
            file://CVE-2025-61915.patch \
            file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
+           file://CVE-2026-27447.patch \
+           file://CVE-2026-27447-regression_p1.patch \
+           file://CVE-2026-27447-regression_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
new file mode 100644
index 0000000000..d581ee36fd
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
@@ -0,0 +1,33 @@
+From 6d97ee39fedf12a7a5429a74f4156ef9bb67f562 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 22 Apr 2026 12:40:14 +0200
+Subject: [PATCH] Fix cupsd crash if user does not exist on server
+
+CVE: CVE-2026-27447
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562]
+
+Backport Changes:
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 6d97ee39fedf12a7a5429a74f4156ef9bb67f562)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/auth.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 1678a29..4798e86 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1810,7 +1810,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name;
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+-      if (!_cups_strcasecmp(name, "@OWNER") && owner &&
++      if (!_cups_strcasecmp(name, "@OWNER") && owner && pw &&
+           !strcmp(pw->pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+-- 
+2.43.7
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
new file mode 100644
index 0000000000..e46db92c76
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
@@ -0,0 +1,46 @@
+From 849fba7d7a1144e48d45c5e6ba2504765912ece0 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 24 Apr 2026 14:06:06 -0400
+Subject: [PATCH] Fix unauthenticated print policies (Issue #1557)
+
+CVE: CVE-2026-27447
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0]
+
+Backport Changes:
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 849fba7d7a1144e48d45c5e6ba2504765912ece0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/auth.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 4798e86..1dd520d 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1810,8 +1810,9 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name;
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+-      if (!_cups_strcasecmp(name, "@OWNER") && owner && pw &&
+-          !strcmp(pw->pw_name, ownername))
++      if (!_cups_strcasecmp(name, "@OWNER") && owner &&
++          ((pw && !strcmp(pw->pw_name, ownername)) ||
++           (!pw && type == CUPSD_AUTH_NONE && !_cups_strcasecmp(username, ownername))))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+       {
+@@ -1825,6 +1826,8 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+       }
+       else if (pw && !strcmp(pw->pw_name, name))
+         return (HTTP_OK);
++      else if (!pw && type == CUPSD_AUTH_NONE && !_cups_strcasecmp(username, name))
++	return (HTTP_STATUS_OK);
+     }
+ 
+     for (name = (char *)cupsArrayFirst(best->names);
+-- 
+2.43.7
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
new file mode 100644
index 0000000000..1614faa7f1
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -0,0 +1,108 @@
+From 37b8a4387864eded1a15a45db8950a23e5c610d2 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:04:21 -0400
+Subject: [PATCH] CVE-2026-27447: The scheduler treated local user and group
+ names as case-insensitive.
+
+CVE: CVE-2026-27447
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb]
+
+Backport Changes:
+- Rebase scheduler/auth.c context to the CUPS 2.4.11 source carried by this
+  recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit a0c62c1e69604ff061089b750073199fab5a1beb)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/auth.c | 31 +++++++++++++++----------------
+ 1 file changed, 15 insertions(+), 16 deletions(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index d0430b4..1678a29 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1,7 +1,7 @@
+ /*
+  * Authorization routines for the CUPS scheduler.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -1159,7 +1159,7 @@ cupsdCheckGroup(
+   group = getgrnam(groupname);
+   endgrent();
+ 
+-  if (group != NULL)
++  if (user && group)
+   {
+    /*
+     * Group exists, check it...
+@@ -1173,7 +1173,7 @@ cupsdCheckGroup(
+       * User appears in the group membership...
+       */
+ 
+-      if (!_cups_strcasecmp(username, group->gr_mem[i]))
++      if (!strcmp(user->pw_name, group->gr_mem[i]))
+ 	return (1);
+     }
+ 
+@@ -1184,25 +1184,24 @@ cupsdCheckGroup(
+     * belongs to...
+     */
+ 
+-    if (user)
+-    {
+-      int	ngroups;		/* Number of groups */
++    int		ngroups;		/* Number of groups */
+ #  ifdef __APPLE__
+-      int	groups[2048];		/* Groups that user belongs to */
++    int		groups[2048];		/* Groups that user belongs to */
+ #  else
+-      gid_t	groups[2048];		/* Groups that user belongs to */
++    gid_t	groups[2048];		/* Groups that user belongs to */
+ #  endif /* __APPLE__ */
+ 
+-      ngroups = (int)(sizeof(groups) / sizeof(groups[0]));
++    ngroups = (int)(sizeof(groups) / sizeof(groups[0]));
+ #  ifdef __APPLE__
+-      getgrouplist(username, (int)user->pw_gid, groups, &ngroups);
++    getgrouplist(user->pw_name, (int)user->pw_gid, groups, &ngroups);
+ #  else
+-      getgrouplist(username, user->pw_gid, groups, &ngroups);
++    getgrouplist(user->pw_name, user->pw_gid, groups, &ngroups);
+ #endif /* __APPLE__ */
+ 
+-      for (i = 0; i < ngroups; i ++)
+-        if ((int)groupid == (int)groups[i])
+-	  return (1);
++    for (i = 0; i < ngroups; i ++)
++    {
++      if ((int)groupid == (int)groups[i])
++	return (1);
+     }
+ #endif /* HAVE_GETGROUPLIST */
+   }
+@@ -1812,7 +1811,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+       if (!_cups_strcasecmp(name, "@OWNER") && owner &&
+-          !_cups_strcasecmp(username, ownername))
++          !strcmp(pw->pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+       {
+@@ -1824,7 +1823,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+         if (cupsdCheckGroup(username, pw, name + 1))
+           return (HTTP_OK);
+       }
+-      else if (!_cups_strcasecmp(username, name))
++      else if (pw && !strcmp(pw->pw_name, name))
+         return (HTTP_OK);
+     }
+ 
+-- 
+2.43.7
-- 
2.35.6


