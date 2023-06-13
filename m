Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C96DEB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 19:31:31 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web11.93.1686684682005766658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 12:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=QtQSFsWE;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3034; q=dns/txt; s=iport;
  t=1686684682; x=1687894282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KpTKu+I+tvBXDz66D5Aa2/i2rmybF6S9vuPwfhg/Uw0=;
  b=QtQSFsWEbHjKPLQByqhYrbS0sdrtE332+rST5dwwLMKbdalXBQu3IVzX
   O3Llgs1kWbFeZG8w6Sw0cKsmGM5CAX4wiAe8ohDLctR/hsFpywXcpPBGL
   OS9n9IiCern9uPcu5ig1hXIsGCJDTg8bYQR+vwB1iS/2Y0QYHdIwBGC1A
   0=;
X-IronPort-AV: E=Sophos;i="6.00,240,1681171200"; 
   d="scan'208";a="72106845"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 13 Jun 2023 19:31:21 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 35DJVDgq031635
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 Jun 2023 19:31:16 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id B1FA4CC1295; Tue, 13 Jun 2023 12:31:12 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Sanjay Chitroda <schitrod@cisco.com>
Subject: [OE-core,kirkstone][PATCH] cups: Fix CVE-2023-32324
Date: Tue, 13 Jun 2023 12:31:10 -0700
Message-Id: <20230613193110.2731585-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 19:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182721

OpenPrinting CUPS is an open source printing system. In versions 2.4.2
and prior, a heap buffer overflow vulnerability would allow a remote
attacker to launch a denial of service (DoS) attack. A buffer overflow
vulnerability in the function `format_log_line` could allow remote
attackers to cause a DoS on the affected system. Exploitation of the
vulnerability can be triggered when the configuration file `cupsd.conf`
sets the value of `loglevel `to `DEBUG`. No known patches or
workarounds exist at time of publication.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-32324
https://security-tracker.debian.org/tracker/CVE-2023-32324

Upstream Patch:
https://github.com/OpenPrinting/cups/commit/fd8bc2d32589

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 0acc5c575e..1b87d47a49 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2023-32324.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
new file mode 100644
index 0000000000..40b89c9899
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
@@ -0,0 +1,36 @@
+From 07cbffd11107eed3aaf1c64e35552aec20f792da Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 1 Jun 2023 12:04:00 +0200
+Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes CVE-2023-32324)
+
+CVE: CVE-2023-32324
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/fd8bc2d32589]
+
+(cherry picked from commit fd8bc2d32589d1fd91fe1c0521be2a7c0462109e)
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ cups/string.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cups/string.c b/cups/string.c
+index 93cdad19..6ef58515 100644
+--- a/cups/string.c
++++ b/cups/string.c
+@@ -1,6 +1,7 @@
+ /*
+  * String functions for CUPS.
+  *
++ * Copyright © 2023 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products.
+  *
+@@ -730,6 +731,9 @@ _cups_strlcpy(char       *dst,		/* O - Destination string */
+   size_t	srclen;			/* Length of source string */
+ 
+ 
++  if (size == 0)
++    return (0);
++
+  /*
+   * Figure out how much room is needed...
+   */
-- 
2.35.6


