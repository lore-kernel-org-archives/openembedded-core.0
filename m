Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366EFCDE002
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:31:04 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18973.1782214253689841466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ur4DjzUH;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10348; q=dns/txt;
  s=iport01; t=1782214253; x=1783423853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f2f2WVT77X3SZQ7w5uHVFZ7JyEqOET8iurrpyN9tNvk=;
  b=Ur4DjzUHnbLrVWuPgk1TyL7Cig/acTd4JrvKfRAuhgWUVYTZ+O5HBsc1
   NdIWyxG9PSGM42uNCj1lR5ym5u0ggXgUlFMAZ/88t5yIftSgxTcue0jwS
   oXKWFxwYkFtzgbDBiXoV98QlHm8ArLrCklbd2kcDVQq49xhvSU4hbHXLu
   QNiqiv77C/exPWvh+eRRlEAoBNOe74/2BvaS+f0WY/qsJe5YUTpJipgg/
   TPxsitX5f9j6ZZ4uujGZL/nSZAqkEAaiX7oh9r5y39Yqp734XV4nIWf23
   L4PpnI3pt+uBLYAxyDlGq42hku2hg6Gqh6XqgwzSver975uZKrRFuNI4r
   w==;
X-CSE-ConnectionGUID: YbtEW9UTSrKy24aEeiSEAg==
X-CSE-MsgGUID: 8MQbZtoLSqKR+K8MVyTRkQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgACbTpq/4v/Ja1aHgEBCxIMggULgld0X0JJA4RUk?=
 =?us-ascii?q?XQDnhsUgWoPAQEBD0QNBAEBghKCdAKNSgImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwE0EhAcAgEBAgMCJgICKyMIG?=
 =?us-ascii?q?YMCAYJzAgERnGeXFxo3en8zgQGDaAJDUNssAQsUAQWBBS6FP4McAYUCWxgBh?=
 =?us-ascii?q?HwnGxuBcoEVg2mBBYFcAoEjBIQUgmoEgiKBDIFaGAYyjldIgQIcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgR2BboEEhQIjHwM5f4E/gSRkZhUwN?=
 =?us-ascii?q?YEBAREfCoErAwsYDUgRLDcUGwQ9AW4HjFoXD4FuSAcBPD4TASsgAmOBJxwyk?=
 =?us-ascii?q?moxj2yCIYpzlhwKKIN1jCGVOhozhVulEQuYfY4KllCEaIFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+OLQsLg2CEB4EMgT3DQSQ1CwMvAQEHAgcOAwuBaJAALIFRAQE?=
IronPort-Data: A9a23:+F7kV69e871kpzWYfeSnDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2VODD3QbK6Pa2f0etF+a4+/80pUsMfcy4RnQFM4pX1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDhPs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kHN5E1xbdKPVpU1
 u1CdDkgYxG4qsu5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+hin75fDRCpXqepLE85C7YywkZPL3FbIuFK4PWG5kK9qqej
 jLjxm7LHhY+D8W883mmoleSl9P1nhquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:L6T0m69Hc8f28YqUbZxuk+AGI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykCsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfiLqWzLzM2f6bQ0/
 Gnl7F6mwY=
X-Talos-CUID: 9a23:BbjuGm6mG3aSU6aHT9ssxUQIN/90T0Hm1lTBeROxJGtoc5C8RgrF
X-Talos-MUID: 9a23:Mnk/FQWokxE0qtjq/G/JvTtQKMBM2L2NMgMuwbA4qvW+NhUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="498974647"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 11:30:52 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 7A6D31800035E;
	Tue, 23 Jun 2026 11:30:52 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 217ABCC12A8; Tue, 23 Jun 2026 04:30:52 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 3/8] cups: Fix CVE-2026-34980
Date: Tue, 23 Jun 2026 04:30:27 -0700
Message-ID: <20260623113037.28968-3-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260623113037.28968-1-adongare@cisco.com>
References: <20260623113037.28968-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239350

From: Anil Dongare <adongare@cisco.com>

Pick the upstream fix [1] for CVE-2026-34980 as mentioned in [2], where
the scheduler did not filter control characters from option values.

Also include the upstream regression fixes that followed the CVE fix:

- CVE-2026-34980-regression_p1.patch [3] fixes filter PPD keyword
  processing. The CVE fix parsed PPD keywords into a temporary array,
  but the loop did not advance the keyword pointer. This regression was
  reported in OpenPrinting/cups Issue [4].
- CVE-2026-34980-regression_p2.patch [5] fixes a get_options() regression
  where the option-value parser did not advance the input pointer for
  whitespace/control-character paths.

[1] https://github.com/OpenPrinting/cups/commit/8d0f51cac24cb5bf949c5b6a221e51a150d982e3
[2] https://security-tracker.debian.org/tracker/CVE-2026-34980
[3] https://github.com/OpenPrinting/cups/commit/3f2bdc293243bca938c6de23ba50e6d783189629
[4] https://github.com/OpenPrinting/cups/issues/1562
[5] https://github.com/OpenPrinting/cups/commit/52cfb028dc211a0fd9ba6fe6eba6d482ccc6c9af

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |  3 +
 .../cups/CVE-2026-34980-regression_p1.patch   | 31 ++++++
 .../cups/CVE-2026-34980-regression_p2.patch   | 75 ++++++++++++++
 .../cups/cups/CVE-2026-34980.patch            | 97 +++++++++++++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e06bbc0a2a..dc5b971195 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -24,6 +24,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
            file://CVE-2026-34978.patch \
+           file://CVE-2026-34980.patch \
+           file://CVE-2026-34980-regression_p1.patch \
+           file://CVE-2026-34980-regression_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
new file mode 100644
index 0000000000..9290a0e637
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
@@ -0,0 +1,31 @@
+From 3f2bdc293243bca938c6de23ba50e6d783189629 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 28 Apr 2026 17:42:41 -0400
+Subject: [PATCH] Fix filter PPD keyword processing (Issue #1562)
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/3f2bdc293243bca938c6de23ba50e6d783189629]
+
+(cherry picked from commit 3f2bdc293243bca938c6de23ba50e6d783189629)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ scheduler/job.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 895b2d9..915ba94 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -5419,7 +5419,7 @@ update_job(cupsd_job_t *job)		/* I - Job to check */
+       keywords     = NULL;
+       num_keywords = cupsParseOptions(message, 0, &keywords);
+ 
+-      for (i = 0, keyword = keywords; i < num_keywords; i ++)
++      for (i = 0, keyword = keywords; i < num_keywords; i ++, keyword ++)
+       {
+        /*
+         * Filter out "special" PPD keywords...
+-- 
+2.43.7
+
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
new file mode 100644
index 0000000000..73846cb8a3
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
@@ -0,0 +1,75 @@
+From 52cfb028dc211a0fd9ba6fe6eba6d482ccc6c9af Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Wed, 8 Apr 2026 16:42:48 -0400
+Subject: [PATCH] Fix get_options regression (Issue #1532)
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/52cfb028dc211a0fd9ba6fe6eba6d482ccc6c9af]
+
+(cherry picked from commit 52cfb028dc211a0fd9ba6fe6eba6d482ccc6c9af)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ scheduler/job.c |  4 ++--
+ test/5.5-lp.sh  | 10 +++++-----
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 6b9d366..cf019e1 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4144,7 +4144,7 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	  case IPP_TAG_CHARSET :
+ 	  case IPP_TAG_LANGUAGE :
+ 	  case IPP_TAG_URI :
+-	      for (valptr = attr->values[i].string.text; *valptr;)
++	      for (valptr = attr->values[i].string.text; *valptr; valptr ++)
+ 	      {
+ 	       /*
+ 	        * Convert tabs and newlines to spaces, filter out control chars,
+@@ -4159,7 +4159,7 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	        {
+ 	          if (strchr("\\\'\"", *valptr))
+ 		    *optptr++ = '\\';
+-		  *optptr++ = *valptr++;
++		  *optptr++ = *valptr;
+ 		}
+ 	      }
+ 
+diff --git a/test/5.5-lp.sh b/test/5.5-lp.sh
+index 25e9d65..fe60890 100644
+--- a/test/5.5-lp.sh
++++ b/test/5.5-lp.sh
+@@ -2,7 +2,7 @@
+ #
+ # Test the lp command.
+ #
+-# Copyright © 2020-2024 by OpenPrinting.
++# Copyright © 2020-2026 by OpenPrinting.
+ # Copyright © 2007-2019 by Apple Inc.
+ # Copyright © 1997-2005 by Easy Software Products, all rights reserved.
+ #
+@@ -72,8 +72,8 @@ echo ""
+ 
+ echo "LP Flood Test ($1 times in parallel)"
+ echo ""
+-echo "    lp -d Test1 testfile.jpg"
+-echo "    lp -d Test2 testfile.jpg"
++echo "    lp -d Test1 -t 'Flood Test N' testfile.jpg"
++echo "    lp -d Test2 -t 'Flood Test N' testfile.jpg"
+ i=0
+ pids=""
+ while test $i -lt $1; do
+@@ -83,9 +83,9 @@ while test $i -lt $1; do
+ 		j=`expr $j + 1`
+ 	done
+ 
+-	$runcups $VALGRIND ../systemv/lp -d Test1 ../examples/testfile.jpg 2>&1 &
++	$runcups $VALGRIND ../systemv/lp -d Test1 -t "Flood Test $j" ../examples/testfile.jpg 2>&1 &
+ 	pids="$pids $!"
+-	$runcups $VALGRIND ../systemv/lp -d Test2 ../examples/testfile.jpg 2>&1 &
++	$runcups $VALGRIND ../systemv/lp -d Test2 -t "Flood Test $j" ../examples/testfile.jpg 2>&1 &
+ 	pids="$pids $!"
+ 
+ 	i=`expr $i + 1`
+-- 
+2.43.7
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
new file mode 100644
index 0000000000..286e9cd517
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
@@ -0,0 +1,97 @@
+From e206c7643a7574cab2e9457eac4c9f755dbf44ff Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:45:13 -0400
+Subject: [PATCH] Filter out control characters from option values.
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/8d0f51cac24cb5bf949c5b6a221e51a150d982e3]
+
+Backport Changes:
+- Rebase CHANGES.md placement and scheduler/job.c option-handling context to
+  the CUPS 2.4.11 source carried by this recipe.
+
+(cherry picked from commit 8d0f51cac24cb5bf949c5b6a221e51a150d982e3)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md      |  2 ++
+ scheduler/job.c | 41 +++++++++++++++++++++++++++++++++++------
+ 2 files changed, 37 insertions(+), 6 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 7e24840..9863c17 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -9,6 +9,8 @@ Changes in CUPS v2.4.10 (2024-06-18)
+ - Fixed cupsd crash if user does not exist (Issue #1555)
+ - CVE-2026-34978: The RSS notifier could write outside the scheduler's RSS
+   directory.
++- CVE-2026-34980: The scheduler did not filter control characters from option
++  values.
+ - Fixed error handling when reading a mixed `1setOf` attribute.
+ - Fixed scheduler start if there is only domain socket to listen on (Issue #985)
+ 
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 822a247..895b2d9 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4121,9 +4121,21 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	  case IPP_TAG_URI :
+ 	      for (valptr = attr->values[i].string.text; *valptr;)
+ 	      {
+-	        if (strchr(" \t\n\\\'\"", *valptr))
+-		  *optptr++ = '\\';
+-		*optptr++ = *valptr++;
++	       /*
++	        * Convert tabs and newlines to spaces, filter out control chars,
++	        * and escape \, ', and ".
++	        */
++
++	        if (isspace(*valptr & 255))
++	        {
++	          *optptr++ = ' ';
++	        }
++	        else if ((*valptr & 255) >= ' ' && *valptr != 0x7f)
++	        {
++	          if (strchr("\\\'\"", *valptr))
++		    *optptr++ = '\\';
++		  *optptr++ = *valptr++;
++		}
+ 	      }
+ 
+ 	      *optptr = '\0';
+@@ -5394,13 +5409,30 @@ update_job(cupsd_job_t *job)		/* I - Job to check */
+     else if (loglevel == CUPSD_LOG_PPD)
+     {
+      /*
+-      * Set attribute(s)...
++      * Set PPD keyword(s)/value(s)...
+       */
+ 
++      int		i,		/* Looping var */
++			num_keywords;	/* Number of keywords */
++      cups_option_t	*keywords,	/* Keywords */
++			*keyword;	/* Current keyword */
++
+       cupsdLogJob(job, CUPSD_LOG_DEBUG, "PPD: %s", message);
+ 
+-      job->num_keywords = cupsParseOptions(message, job->num_keywords,
+-                                           &job->keywords);
++      keywords     = NULL;
++      num_keywords = cupsParseOptions(message, 0, &keywords);
++
++      for (i = 0, keyword = keywords; i < num_keywords; i ++)
++      {
++       /*
++        * Filter out "special" PPD keywords...
++        */
++
++        if (strcmp(keyword->name, "cupsFilter") && strcmp(keyword->name, "cupsFilter2") && strcmp(keyword->name, "cupsFinishingTemplate") && strcmp(keyword->name, "cupsIPPFinishings") && strcmp(keyword->name, "cupsIPPReason") && strcmp(keyword->name, "cupsMarkerName") && strcmp(keyword->name, "cupsMaxSize") && strncmp(keyword->name, "cupsMediaQualifier", 18) && strcmp(keyword->name, "cupsMinSize") && strcmp(keyword->name, "cupsPageSizeCategory") && strcmp(keyword->name, "cupsPortMonitor") && strcmp(keyword->name, "cupsPreFilter") && strcmp(keyword->name, "cupsPrintQuality") && strcmp(keyword->name, "APPrinterPreset"))
++          job->num_keywords = cupsAddOption(keyword->name, keyword->value, job->num_keywords, &job->keywords);
++      }
++
++      cupsFreeOptions(num_keywords, keywords);
+     }
+     else
+     {
+-- 
+2.43.7
-- 
2.44.4


