Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3D8C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 04:53:09 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37887.1782881583613887333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 21:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DYxd6FN0;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10981; q=dns/txt;
  s=iport01; t=1782881583; x=1784091183;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i9WeODKE4X3KCmvCRM2wljc/vU3OXDZYza/089wSM9E=;
  b=DYxd6FN0kYZkw8ybRUqPKKT9CgJEBhedqVi09LlhcXYiVNGZ8ctJn94x
   4QWQJLlU1F8YY1ued/kfhsjVlo4/vbqZIsnz3QvRSsxIiYz8SOVLR3Kip
   /Alnw9mqLpzBMXhP0ouDWFqwgrkJFJyGnPNlkCxSSwIMdap0Z/XaZKPGW
   CNPlvZom8R1r22COZI8WlmyHPrTomaVgQiiRTqrDDiNJa06G1Lmp11qxs
   TLTMYUdUJcW9jvm6qGtnB3eo2bzTPKWXkt2qL9jdG8KtWaOsnfKD9Uc71
   6j7/TPpMgFmvVm0MVcvzMI9kyPMohVpH9sS8QC/uHx+tvwebxKiVys2y7
   w==;
X-CSE-ConnectionGUID: JhCTWWajQ9aY/Qq2m3T7FA==
X-CSE-MsgGUID: ftr6hGi+RGamei1NB8VeKw==
X-IPAS-Result: =?us-ascii?q?A0BHAgCunERq/5D/Ja1aHgEBCxIMggULgld0X0JJA4RUk?=
 =?us-ascii?q?XSeHhSBag8BAQEPRA0EAQGCEoJ0jU0CJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECASYECwFGLAMBAgMCJgItIyGDAgGCcwIBE?=
 =?us-ascii?q?Z4flxcaN3p/M4EBg2gCQ1DbLAELFAEFgQUuhT+DHAGFAlsYAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBXAKBIwQhg3OCagSCDRWBDIFaGAaDJYRihzVIgQIcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+FzRYGwcFgR2Ba4EDhHojHwM5f4EwdVhmFTA1gQIBE?=
 =?us-ascii?q?h4KgVKBDAMLGA1IESw3FBsEPQFuB40PFw+BOTVIBwGBDQErIAJjFIETDwILA?=
 =?us-ascii?q?ZMiKo9sgiGhDwoog3WMIZU6GjOFW6URC5h9jgqWUIRogWg8gVlwFYMiCUoZD?=
 =?us-ascii?q?44tCwuDYIQHgQzIESQ1CwMvAQEHAgcOAwuBaJAAAiYHgU4BAQ?=
IronPort-Data: A9a23:woSHoKKPI4x7q49BFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgzYCz
 WZNXT/SMvqDMGOnfN0nPo/j/UpXvcXQzoUyHAsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnR0
 T/Oi5eHYgH9hGYtajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1MDGoKArIR+N8mCFAJz
 OVCLWsxMT6q0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLo3kOCuiXDlfhVTqUmeouw85G27IAlZjeC2aYCKIIbQLSlTtkiEv
 DzG0GW6OD4TMdGekByvokyhpfCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:17/bdaHwtJhWWBQUpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8/
 xG/c5rsCMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOkdK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:oEbvBG5pWC2F2WLZNtss1k4/Jv8ae3/knX7hZHahU2MydOK7YArF
X-Talos-MUID: 9a23:dtLgVwu/l5Bf4adRyc2nii14asdH4ueUJ0kInJRfnePUCyFTJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,235,1774310400"; 
   d="scan'208";a="503127222"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jul 2026 04:53:02 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 3FE4B180004B8;
	Wed,  1 Jul 2026 04:53:02 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id BC420CC12A6; Tue, 30 Jun 2026 21:53:01 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 1/2] cups: fix CVE-2026-27447
Date: Tue, 30 Jun 2026 21:52:53 -0700
Message-ID: <20260701045257.41443-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 04:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239927

From: Anil Dongare <adongare@cisco.com>

Pick the upstream fix [1] for CVE-2026-27447 as referenced by Debian [2].

Also include the two upstream regression fixes that followed the CVE fix:

- CVE-2026-27447-regression_p1.patch [3] fixes a cupsd crash when the referenced
  user does not exist on the server. This regression was reported in
  OpenPrinting/cups Issue [5].
- CVE-2026-27447-regression_p2.patch [4] fixes unauthenticated print policies for
  non-local accounts. This regression was reported in OpenPrinting/cups Issue [6].

[1] https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb
[2] https://security-tracker.debian.org/tracker/CVE-2026-27447
[3] https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562
[4] https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0
[5] https://github.com/OpenPrinting/cups/issues/1555
[6] https://github.com/OpenPrinting/cups/issues/1557

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |   3 +
 .../cups/CVE-2026-27447-regression_p1.patch   |  46 +++++++
 .../cups/CVE-2026-27447-regression_p2.patch   |  58 +++++++++
 .../cups/cups/CVE-2026-27447.patch            | 120 ++++++++++++++++++
 4 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 194b9c2638..49b828506a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -21,6 +21,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
            file://CVE-2026-39316.patch \
+           file://CVE-2026-27447.patch \
+           file://CVE-2026-27447-regression_p1.patch \
+           file://CVE-2026-27447-regression_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
new file mode 100644
index 0000000000..bbd44913d3
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
@@ -0,0 +1,46 @@
+From c4c0a46b266bd227fa3925ad08556a620da342ae Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 22 Apr 2026 12:40:14 +0200
+Subject: [PATCH] Fix cupsd crash if user does not exist on server
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562]
+
+Backport Changes:
+- Rebase CHANGES.md context to the CUPS 2.4.16 changelog section.
+
+(cherry picked from commit 6d97ee39fedf12a7a5429a74f4156ef9bb67f562)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       | 1 +
+ scheduler/auth.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index d591ead..16e9527 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -7,6 +7,7 @@ Changes in CUPS v2.4.16 (2025-12-04)
+ 
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
++- Fixed cupsd crash if user does not exist (Issue #1555)
+ - `cupsUTF8ToCharset` didn't validate 2-byte UTF-8 sequences, potentially
+   reading past the end of the source string (Issue #1438)
+ - The web interface did not support domain usernames fully (Issue #1441)
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 3e7041e..d5f564e 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1835,7 +1835,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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
index 0000000000..69b7ea962c
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
@@ -0,0 +1,58 @@
+From 6a712bd3b5236df3e1bd145e89ea1108fb860d8b Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 24 Apr 2026 14:06:06 -0400
+Subject: [PATCH] Fix unauthenticated print policies (Issue #1557)
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0]
+
+Backport Changes:
+- Rebase CHANGES.md context to the CUPS 2.4.16 changelog section.
+
+(cherry picked from commit 849fba7d7a1144e48d45c5e6ba2504765912ece0)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       | 1 +
+ scheduler/auth.c | 7 +++++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 16e9527..47b394b 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -8,6 +8,7 @@ Changes in CUPS v2.4.16 (2025-12-04)
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
+ - Fixed cupsd crash if user does not exist (Issue #1555)
++- Fixed a regression in shared printing from non-local accounts (Issue #1557)
+ - `cupsUTF8ToCharset` didn't validate 2-byte UTF-8 sequences, potentially
+   reading past the end of the source string (Issue #1438)
+ - The web interface did not support domain usernames fully (Issue #1441)
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index d5f564e..7e211ff 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1835,8 +1835,9 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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
+@@ -1850,6 +1851,8 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
new file mode 100644
index 0000000000..b73377ce4d
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -0,0 +1,120 @@
+From f792687607462386ea3778fac5e0394da09c8a72 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:04:21 -0400
+Subject: [PATCH] CVE-2026-27447: The scheduler treated local user and group
+ names as case-insensitive.
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb]
+
+Backport Changes:
+- Rebase CHANGES.md context to the CUPS 2.4.16 changelog section.
+
+(cherry picked from commit a0c62c1e69604ff061089b750073199fab5a1beb)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       |  2 ++
+ scheduler/auth.c | 31 +++++++++++++++----------------
+ 2 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 78a9a94..d591ead 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -5,6 +5,8 @@ CHANGES - OpenPrinting CUPS
+ Changes in CUPS v2.4.16 (2025-12-04)
+ ------------------------------------
+ 
++- CVE-2026-27447: The scheduler treated local user and group names as case-
++  insensitive.
+ - `cupsUTF8ToCharset` didn't validate 2-byte UTF-8 sequences, potentially
+   reading past the end of the source string (Issue #1438)
+ - The web interface did not support domain usernames fully (Issue #1441)
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 18ac443..3e7041e 100644
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
+@@ -1184,7 +1184,7 @@ cupsdCheckGroup(
+   group = getgrnam(groupname);
+   endgrent();
+ 
+-  if (group != NULL)
++  if (user && group)
+   {
+    /*
+     * Group exists, check it...
+@@ -1198,7 +1198,7 @@ cupsdCheckGroup(
+       * User appears in the group membership...
+       */
+ 
+-      if (!_cups_strcasecmp(username, group->gr_mem[i]))
++      if (!strcmp(user->pw_name, group->gr_mem[i]))
+ 	return (1);
+     }
+ 
+@@ -1209,25 +1209,24 @@ cupsdCheckGroup(
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
+@@ -1837,7 +1836,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+       if (!_cups_strcasecmp(name, "@OWNER") && owner &&
+-          !_cups_strcasecmp(username, ownername))
++          !strcmp(pw->pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+       {
+@@ -1849,7 +1848,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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


