Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B874CDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:31:03 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18586.1782214253718627716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CQBPnbw4;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10427; q=dns/txt;
  s=iport01; t=1782214254; x=1783423854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DNSuanVqVba8A2ASPAE4ycw55Swy3lcEO2HMh/TobYI=;
  b=CQBPnbw4YpgReYj03vZlScpM7wKZFBWGRM5lhxzRxKmXRacNOKFG34Ta
   LjNJB+VGmyBwhI5a0omvFVPQjHkKveByUPe8o6zGKRycvQCG4pvB16tVZ
   ocWnbo0mwpC0ILo7rIH77yHJg6rxCXL5HB/f8Y4Tp9zQOljRcK1CoMWSz
   3RpDVn6x/HJyx6SOqQ5G2PnAtDubIWxBnUbkw5P6FRvbF65he4agOGmvy
   Ar2fs8bRg/JpHPADEi7iuyMCyYyK/O4w0FOaNkgLrSzna/w5TYj/998jU
   qGBfG9kfCnzURXmElHAP/Vo2vYqUAW84xBxuGqNORnz2bJWrok+HphjCz
   g==;
X-CSE-ConnectionGUID: IbwCVQ1kTP+bvAXgwcGyaQ==
X-CSE-MsgGUID: OAFfcqxjQruwWlc/Xir7MQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgCDbTpq/5T/Ja1aHgEBCxIMggULgld0X0JJA4RUk?=
 =?us-ascii?q?XSeHhSBag8BAQEPRA0EAQGCEoJ0jUwCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECASYECwE0EiwDAQIDAiYCLSMhgwIBgnMCA?=
 =?us-ascii?q?RGcVpcXGjd6fzOBAYNoAkNQ2ywBCxQBBYEFLoU/gxwBhQJbGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWDaYEFgVwCgSMEIYNzgmoEgiKBDIFaGAaDKYtgSIECHANZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPhc0WBsHBYEdgW6BBIUCIx8DOX+BP4EkZGYVMDWBAQERH?=
 =?us-ascii?q?wqBKwMLGA1IESw3FBsEPQFuB4xaFw+BOTVIBwF6EwErIAJjFIETHAGTGwcqj?=
 =?us-ascii?q?2yCIaEPCiiDdYwhlToaM4VbpRELmH2OCpZQhGiBaDyBWXAVgyIJShkPjjiDa?=
 =?us-ascii?q?4QHgQzEfiQ1CwMvAQEHAgcOAwuBaJAAgX0BAQ?=
IronPort-Data: A9a23:P8q0XaoOlF9VhapAZDH+vVplQNdeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnXPa3ZN2byLt51OY229ENVv5bdmtNkSAVt+X8wF3tBpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8kg35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sd9Hkpwz
 KUbFAhOZA6qt+2py52qQ9A506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzRUr1SarLA6y2PS1wd2lrPqNbI5f/TWFJUFxh3G+
 jiuE2LRJTg0OteG2Ti86G+zuevE2hP6Qt03LejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:xAJiR6AdUy/WmO7lHemO55DYdb4zR+YMi2TDGXofdfUzSL39qy
 nOpoV/6faaslcssR0b9OxoW5PwI080l6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVyYygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:galavWEa1Zf3P8bOqmJG/lE/JPl8cUHlj33OCn+3Fm1GWbSsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ayv6OYA+Vx8FCkVA4GsWNHEiQf+BBzaqlEVAPqI8?=
 =?us-ascii?q?bpPaAPmtAOi3CqQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="498803642"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 11:30:52 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 70D4A18000269;
	Tue, 23 Jun 2026 11:30:52 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 1607ECC12A6; Tue, 23 Jun 2026 04:30:52 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 1/8] cups: Fix CVE-2026-27447
Date: Tue, 23 Jun 2026 04:30:25 -0700
Message-ID: <20260623113037.28968-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239355

From: Anil Dongare <adongare@cisco.com>

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

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |   3 +
 .../cups/CVE-2026-27447-regression_p1.patch   |  48 +++++++
 .../cups/CVE-2026-27447-regression_p2.patch   |  46 +++++++
 .../cups/cups/CVE-2026-27447.patch            | 120 ++++++++++++++++++
 4 files changed, 217 insertions(+)
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
index 0000000000..85aadfde00
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
@@ -0,0 +1,48 @@
+From 6d97ee39fedf12a7a5429a74f4156ef9bb67f562 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 22 Apr 2026 12:40:14 +0200
+Subject: [PATCH] Fix cupsd crash if user does not exist on server
+
+CVE: CVE-2026-27447
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562]
+
+Backport Changes:
+- Adapt the upstream CHANGES.md section for CUPS v2.4.18 to the
+  downstream CUPS v2.4.11 changelog.
+
+(cherry picked from commit 6d97ee39fedf12a7a5429a74f4156ef9bb67f562)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       | 1 +
+ scheduler/auth.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 0da2c55..59c131e 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -6,6 +6,7 @@ Changes in CUPS v2.4.10 (2024-06-18)
+ 
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
++- Fixed cupsd crash if user does not exist (Issue #1555)
+ - Fixed error handling when reading a mixed `1setOf` attribute.
+ - Fixed scheduler start if there is only domain socket to listen on (Issue #985)
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
+
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
new file mode 100644
index 0000000000..1d44306be0
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
+- Drop the upstream CHANGES.md section for CUPS v2.4.19.
+
+(cherry picked from commit 849fba7d7a1144e48d45c5e6ba2504765912ece0)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
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
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
new file mode 100644
index 0000000000..77a26dae64
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -0,0 +1,120 @@
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
+- Rebase CHANGES.md and scheduler/auth.c context to the CUPS 2.4.11 source
+  carried by this recipe.
+
+(cherry picked from commit a0c62c1e69604ff061089b750073199fab5a1beb)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       |  2 ++
+ scheduler/auth.c | 31 +++++++++++++++----------------
+ 2 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 4a2e25d..0da2c55 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)
+ Changes in CUPS v2.4.10 (2024-06-18)
+ -----------------------------
+ 
++- CVE-2026-27447: The scheduler treated local user and group names as case-
++  insensitive.
+ - Fixed error handling when reading a mixed `1setOf` attribute.
+ - Fixed scheduler start if there is only domain socket to listen on (Issue #985)
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
2.44.4


