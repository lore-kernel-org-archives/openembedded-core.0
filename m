Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334FDC4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:48 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29023.1784655759379911644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NQlBo5jX;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10065; q=dns/txt;
  s=iport01; t=1784655759; x=1785865359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UMvmSJeQegijvV2PdNSMeoBTCgKhkuwCNgBH5c/20LY=;
  b=NQlBo5jXJMTz4+XSxUWx1klv6H7vQHDNY6ncupGb7bvYT5AyNaon5lgH
   +TbaZyHFhBaq+/e1XDBtV1ahJSpEv6haNsOgLa8NjnQYxoBdGCzgu9wi0
   KWI4DdMUWsSZLk5vlEZMIa18ulhGAnPyg9mpWATKgN/OeOTIlKtoDXvBc
   VWWTka1zW336ddggMWc8S3f2eWETABfnT/yVm/iW9CsYJPxpNka1ABSO9
   5wjNRcNNTt+Y7164YUsbBigvU9hJdM/wt/nFpXvnNidN+YmkykZ2Sta6Q
   9w1IbcP+rWldbPWScwoNudLOkof5+1+P31iQUO2VTttx+IUn7cXyrF0Ob
   Q==;
X-CSE-ConnectionGUID: BLVW0MLHRoqGmROTi3gPFA==
X-CSE-MsgGUID: R4xoHP1lShS7UE6yFlCJ6A==
X-IPAS-Result: =?us-ascii?q?A0BNAgD/rl9q/5D/Ja1aglmCV3RfQkkDhFSPUoIhA4ETn?=
 =?us-ascii?q?QgUgWoPAQEBD0QNBAEBghKCcwKNVwImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwE0IhwCAQECAwImAgIrIwgRCIMCA?=
 =?us-ascii?q?YJ0AxGoZ5cXGjd6fzOBAYNoAkNQ2y4BCxQBgQouhT+DHQGFAlwYAYR8Jxsbg?=
 =?us-ascii?q?XKBFYJzdoEFgVwCgSMEhBSCagSCIoEMgVoYBjKEPYIGiRpIgQIcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgR2BLoEChG4jHwM5f4EvdUp3LWoSF?=
 =?us-ascii?q?4EmghSBOgJVAwsYDUgRLDcUGQQ9AW4HjVQjgXFIBwE8UQErIAJjgSeTJUSPb?=
 =?us-ascii?q?IIeinaWHAoog3WMIZU6GjOFW6URC5h9jgqWUIRpgWg8gVlwFYMiCUoZD44tC?=
 =?us-ascii?q?wuDYIQHgQyBPcVpPDULAy8BAQcCBw4DC4FokAAsgVIBAQ?=
IronPort-Data: A9a23:jM2g5K+TQpUTFvNdIuQiDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TEYDDqEbKuDZ2Lwc4h+bY/j9RlT7ZaAm9VlQANurS9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThNs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kcGbMnosNTIVtJ7
 NMdEhcxb0uMv8yflefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYOOIYLXHpkM9qqej
 lia72PZOkgeD9yklgeorGOCgsTtwwquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjdCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:DAzHQqkbEfXD0n+sgOPXur5Duk/pDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:z3g34259Z2Lli2pG3Nss3moqJZgAVl3ny27/JnWfNWcyR4W7YArF
X-Talos-MUID: =?us-ascii?q?9a23=3ASiQB7w49lsQJ61Ff3N4cHqykxoxSv7SpKHhUla4?=
 =?us-ascii?q?GgJa5GHJhFTO2rmqeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="513365341"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:38 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 1585B1800022E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:38 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 36EE1CC037D; Tue, 21 Jul 2026 23:12:36 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 4/8] cups: fix CVE-2026-34980
Date: Tue, 21 Jul 2026 23:12:13 +0530
Message-Id: <20260721174217.229620-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721174217.229620-1-deeratho@cisco.com>
References: <20260721174217.229620-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241562

From: Deepak Rathore <deeratho@cisco.com>

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
[5] https://github.com/OpenPrinting/cups/commit/da0ff58c041f7ee129c3c2c72fb14df1f1e4069a

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Refreshed the regression-p2 reference to the equivalent 2.4.x
  upstream commit.

 meta/recipes-extended/cups/cups.inc           |  3 +
 .../cups/CVE-2026-34980-regression_p1.patch   | 31 +++++++
 .../cups/CVE-2026-34980-regression_p2.patch   | 75 ++++++++++++++++
 .../cups/cups/CVE-2026-34980.patch            | 85 +++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 5e272dbcf6..7a8b845953 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -25,6 +25,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447-regression_p2.patch \
            file://CVE-2026-41079.patch \
            file://CVE-2026-34978.patch \
+           file://CVE-2026-34980.patch \
+           file://CVE-2026-34980-regression_p1.patch \
+           file://CVE-2026-34980-regression_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
new file mode 100644
index 0000000000..483d695a93
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
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
index 0000000000..739938c9a5
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
@@ -0,0 +1,75 @@
+From da0ff58c041f7ee129c3c2c72fb14df1f1e4069a Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Wed, 8 Apr 2026 16:42:48 -0400
+Subject: [PATCH] Fix get_options regression (Issue #1532)
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/da0ff58c041f7ee129c3c2c72fb14df1f1e4069a]
+
+(cherry picked from commit da0ff58c041f7ee129c3c2c72fb14df1f1e4069a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
+-# Copyright © 2020-2024 by OpenPrinting.
++# Copyright © 2020-2026 by OpenPrinting.
+ # Copyright © 2007-2019 by Apple Inc.
+ # Copyright © 1997-2005 by Easy Software Products, all rights reserved.
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
index 0000000000..c38cc2c9e3
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
@@ -0,0 +1,85 @@
+From e206c7643a7574cab2e9457eac4c9f755dbf44ff Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:45:13 -0400
+Subject: [PATCH] Filter out control characters from option values.
+
+CVE: CVE-2026-34980
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/8d0f51cac24cb5bf949c5b6a221e51a150d982e3]
+
+Backport Changes:
+- Rebase scheduler/job.c option-handling context to the CUPS 2.4.11
+  source carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 8d0f51cac24cb5bf949c5b6a221e51a150d982e3)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/job.c |   41 +++++++++++++++++++++++++++++++++++------
+ 1 file changed, 35 insertions(+), 6 deletions(-)
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
2.35.6


