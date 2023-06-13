Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190A8EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 19:34:41 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web11.173.1686684872614989971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 12:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=g+HK77Wy;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3053; q=dns/txt; s=iport;
  t=1686684872; x=1687894472;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NDtLLfo5zwIrzj/XU0KH3uePGl9lMbdfEsZ+zvGNRV0=;
  b=g+HK77WyssbhVtl3hgwGaAMK+yj46a2jNGSB2T9ic3lx4qqORG23HQPm
   B2j2mbYz/S+vAwsFbODdLFpPIfimRNaTIguYxoR3STX+lc1qIA1YdhSgl
   LoxucA+9bgglEBWHhXXAYaQiiGQf8gxszjFwrFOO4ttSjd0Qz0FXBIjpY
   M=;
X-IronPort-AV: E=Sophos;i="6.00,240,1681171200"; 
   d="scan'208";a="72477317"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 13 Jun 2023 19:34:32 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 35DJYVKC027444
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 Jun 2023 19:34:31 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id 2E166CC1295; Tue, 13 Jun 2023 12:34:31 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Sanjay Chitroda <schitrod@cisco.com>
Subject: [OE-core,dunfell][PATCH] cups: Fix CVE-2023-32324
Date: Tue, 13 Jun 2023 12:34:27 -0700
Message-Id: <20230613193427.2732816-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 19:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182722

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
index 21c56e1430..d6e7d95800 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch\
            file://CVE-2022-26691.patch \
+           file://CVE-2023-32324.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
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


