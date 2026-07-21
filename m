Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB5DC44537
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:48 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29022.1784655757297440321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O9TZ30yb;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5893; q=dns/txt;
  s=iport01; t=1784655757; x=1785865357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IyOgVwZSjFD/XTBAjkRmiNyjySLkpTwvcHBEdTYHutE=;
  b=O9TZ30ybMlTmiDJzq1EHq1w63G9VYwyD03hRsqNjjZzRfx6Mm9phD5mN
   PUcssz46eF+/mq2YBZS9WZYe7rcSDQGw0NthfthPhiESL6MT1KiVi4rkX
   UH/2vIprsqk6MagfcwNG9tfSdyE/YOOLpAg9GyCHYgL4n3gVfQA0SfeKx
   AQhDWDnT1v0etIFY2jkmXojeuuPMQMMXXyzJDTkqGdyz3/wUe3uz/hJ/Z
   k57TaTOus3w036mCsC/inPYPC4K0M0zfEE/c3SLf1dpYJwtCYnZyNjFBU
   NCxuyLzW8oNwuqCdmU+RsmUps55LmdDnoCldhnnbpSPEvduN2wZa1PVSu
   g==;
X-CSE-ConnectionGUID: BY84AUbQSTiGK2KieFwAsA==
X-CSE-MsgGUID: t62VkU0mT7i15qV1U50hdA==
X-IPAS-Result: =?us-ascii?q?A0BNAgAVrl9q/4z/Ja1aglmCGD90X0JJA4RUj1KCIQOBE?=
 =?us-ascii?q?50IFIFqDwEBAQ9EDQQBAYISgnMCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBNCIcAwECAwIJHQICKyMIEQiCK?=
 =?us-ascii?q?lgBgnQDEah5lxcaN3p/M4EBg2gCQ1DbLgELFAGBCi6FP4MdAYUCXBgBhHwnG?=
 =?us-ascii?q?xuBcoEVgnN2gQWBXAKBI4QYgmoEgiKBDIFaGAZPgiyBdCmBXYkaSIECHANZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0WBsHBYEdgS6BAoRuIx8DOX+BL3VKd?=
 =?us-ascii?q?y1qEheBJoIUgToCVQMLGA1IESw3FBkEPQFuB41UI4FxTz0+EwEqAYEDAoEnH?=
 =?us-ascii?q?ZMIRI9sgh6hEgoog3WMIZU6GjOEBIFXnWGHMAuYfYJZizGWUIRpgWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD444g2uEB4EMxyY8NQsDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:mPtgAq+j1pbB/XrzHUM+DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jROCmvXa/bYZ2Ojc9p+YIi0/UkH7ZOHydc2GgZkpH9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThNs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kcDN1E09t9OFpy9
 NM7chMMYz6crvmflefTpulE3qzPLeHxN48Z/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Un1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbIuEIo3bH5UN9qqej
 n6YpVr6P0kfCIOekGeczCuR27fPkQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjNCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Za/OsKnkf5vjRj83Sz01SPb8uSTpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:JAJZrW2PeiLbPP6d/It8gbxfMPF1LlTgxk7rH06XKjxKSbC7VnaL0fYx
X-Talos-MUID: 9a23:SyZdswQ1jUzW5DhHRXTw2mtcN/ow5pjxCRlQiKtfhpTcNSBZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="499099280"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:35 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id EEB0518000617
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:34 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 19F7DCC037D; Tue, 21 Jul 2026 23:12:33 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 3/8] cups: fix CVE-2026-34978
Date: Tue, 21 Jul 2026 23:12:12 +0530
Message-Id: <20260721174217.229620-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721174217.229620-1-deeratho@cisco.com>
References: <20260721174217.229620-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241561

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/730347c5bbd5e1271149c6739aa858c0c83a7568
[2] https://security-tracker.debian.org/tracker/CVE-2026-34978

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Refreshed the embedded source patch context; no CVE logic changes.

 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34978.patch            | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index f74bcaffab..5e272dbcf6 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
            file://CVE-2026-41079.patch \
+           file://CVE-2026-34978.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
new file mode 100644
index 0000000000..cabcfe257a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
@@ -0,0 +1,107 @@
+From ab6ab965de6890aed4df39c97f7cd708fd5cb00c Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:18:26 -0400
+Subject: [PATCH] Fix RSS notifier.
+
+CVE: CVE-2026-34978
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/730347c5bbd5e1271149c6739aa858c0c83a7568]
+
+Backport Changes:
+- Rebase scheduler/ipp.c subscription context to the CUPS 2.4.11 source
+  carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+- Omit the upstream scheduler/ipp.c copyright-year-only header update because
+  this backport carries only the functional changes needed for CUPS 2.4.11.
+
+(cherry picked from commit 730347c5bbd5e1271149c6739aa858c0c83a7568)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ notifier/rss.c  |   20 ++++++++++++++------
+ scheduler/ipp.c |   12 ++++++++++++
+ 2 files changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/notifier/rss.c b/notifier/rss.c
+index f17e1494c..250ad877e 100644
+--- a/notifier/rss.c
++++ b/notifier/rss.c
+@@ -1,11 +1,12 @@
+ /*
+  * RSS notifier for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
+- * Copyright 2007-2015 by Apple Inc.
+- * Copyright 2007 by Easy Software Products.
++ * Copyright © 2020-2026 by OpenPrinting.
++ * Copyright © 2007-2015 by Apple Inc.
++ * Copyright © 2007 by Easy Software Products.
+  *
+- * Licensed under Apache License v2.0.  See the file "LICENSE" for more information.
++ * Licensed under Apache License v2.0.  See the file "LICENSE" for more
++ * information.
+  */
+ 
+ /*
+@@ -80,6 +81,7 @@ main(int  argc,				/* I - Number of command-line arguments */
+   http_status_t	status;			/* HTTP GET/PUT status code */
+   char		filename[1024],		/* Local filename */
+ 		newname[1024];		/* filename.N */
++  struct stat	fileinfo;		/* Local file information */
+   cups_lang_t	*language;		/* Language information */
+   ipp_attribute_t *printer_up_time,	/* Timestamp on event */
+ 		*notify_sequence_number,/* Sequence number */
+@@ -111,9 +113,9 @@ main(int  argc,				/* I - Number of command-line arguments */
+ 
+   if (httpSeparateURI(HTTP_URI_CODING_ALL, argv[1], scheme, sizeof(scheme),
+                       username, sizeof(username), host, sizeof(host), &port,
+-		      resource, sizeof(resource)) < HTTP_URI_OK)
++		      resource, sizeof(resource)) < HTTP_URI_OK || strstr(resource, "../") != NULL)
+   {
+-    fprintf(stderr, "ERROR: Bad RSS URI \"%s\"!\n", argv[1]);
++    fprintf(stderr, "ERROR: Bad RSS URI \"%s\".\n", argv[1]);
+     return (1);
+   }
+ 
+@@ -209,6 +211,12 @@ main(int  argc,				/* I - Number of command-line arguments */
+     snprintf(filename, sizeof(filename), "%s/rss%s", cachedir, resource);
+     snprintf(newname, sizeof(newname), "%s.N", filename);
+ 
++    if (!lstat(filename, &fileinfo) && !S_ISREG(fileinfo.st_mode))
++    {
++      fprintf(stderr, "ERROR: Local RSS path \"%s\" is not a file.\n", filename);
++      return (1);
++    }
++
+     httpAssembleURIf(HTTP_URI_CODING_ALL, baseurl, sizeof(baseurl), "http",
+                      NULL, server_name, atoi(server_port), "/rss%s", resource);
+   }
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 2d80a960e..2dc7376c1 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -1985,6 +1985,12 @@ add_job_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") != NULL)
++	{
++	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-recipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag == IPP_TAG_KEYWORD)
+@@ -6010,6 +6016,12 @@ create_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") != NULL)
++	{
++	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-recipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag == IPP_TAG_KEYWORD)
-- 
2.35.6


