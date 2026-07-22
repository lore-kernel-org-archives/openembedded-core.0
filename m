Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5954EC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:08:48 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44372.1784714908771345532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dnpf56VI;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7051; q=dns/txt;
  s=iport01; t=1784714908; x=1785924508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/iSkeLDFxt3vSthYZWmgGlqxv8POAAqNg9e8moFJvwI=;
  b=dnpf56VI+NXhlQLknWAtcF47VhUVTCmxDq7hNriYLKo4U0k+wQyfR4Pl
   DSENgBgKaU1nfYFKf1QhlK3z0Gc1Bk+zNwhpfWVPQQKoVF4EKp/kmPnVe
   XxtZm0gMHXjw5d5bzBYDP/3gUIUlerVh7fMgO+pqSqEnQwWBaWzEMWDPr
   5RR2c01okUQdbD9O1L3ve0ZdAXkDzN4CxRwduxx6Q4bSagiRPPZdSBOzl
   gNcZppKTGW0HP/ooxcubMensgkLqkLOnnZMrYcOY5RIS0NZjmkPm0J+Xe
   m40MxxpTcErsQxeKKHHQk9xUx2nv4Nn0x8HS5+mMqb0kNaKQMrQWr9r0H
   Q==;
X-CSE-ConnectionGUID: ioZCTN+eSK+6W/t8+UbTmw==
X-CSE-MsgGUID: /XlNgSIwS1eGI/TXXYgQ8Q==
X-IPAS-Result: =?us-ascii?q?A0BFAgDClWBq/5H/Ja1aglmCV3ReQ0mWSotnkjcUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhQWNWQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBNQEYAS0sAwECTwsjIYMCAYI6AzcDEcBsgiyBAYMoAT8CQ?=
 =?us-ascii?q?1DYSQ2CWAELFAEFgTOFP4J9hSNcGAGEfCcbG4FyhH6BBYEaQgGBJASGfgSCD?=
 =?us-ascii?q?RWBDIFaGAaQIkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdg?=
 =?us-ascii?q?S6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDAwsYDUgRLDcUGQQ+bgeNa?=
 =?us-ascii?q?SOBc00BgQ0BByMBgRgrQQdskmOSSIE1nmlxCiiDdYwhjz6FfBozqmwLmH2OC?=
 =?us-ascii?q?oQJkkeEaYFoPIFHCwdwFYMiCUoZD44tCwuDYIF/g2XILScyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAgX4BAQ?=
IronPort-Data: A9a23:s2pBOK0cQkmMvARyEvbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2cDm
 mVLWDiGaKnbNDfzL9siPN6y/E9TuMPQmIViTwo63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDUYEFrE+uetMIiIQy
 rsEeHMwZCyGmLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjOm8a4SPJ43SLSlTtgGoo
 kTJxEXmOUgXG/3Y9Qq1w32V1taayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:L72dB6+e6rkKM10RliZuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:RaUz7W5MTsvbmCmN7tss9UkmMfwDMXDm7zSOHAikWSVUQoGQVgrF
X-Talos-MUID: 9a23:WbWyXgWkFMC2XEPq/HjcgBdtD+Z32P2jJ2FKraU2isa9ZRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="499362590"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:08:27 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 9580218000472;
	Wed, 22 Jul 2026 10:08:27 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 3FF6BCD144D; Wed, 22 Jul 2026 03:08:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469
Date: Wed, 22 Jul 2026 03:07:51 -0700
Message-Id: <20260722100754.1568842-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241645

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

It also includes the upstream follow-up fixes referenced in [3]
and [4]. These correct the trailing whitespace check introduced
by the original fix and add the required <ctype.h> include for
isspace().

[1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b6f7826
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
[3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c3f3bcf
[4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24fe00a1

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- Included upstream follow-up commit to correct the
trailing whitespace check.
- Included upstream follow-up commit to add the
required <ctype.h> include for isspace().
---
 .../wget/CVE-2026-58469-regression_p1.patch   | 39 ++++++++++++++
 .../wget/CVE-2026-58469-regression_p2.patch   | 26 +++++++++
 .../wget/wget/CVE-2026-58469.patch            | 53 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  3 ++
 4 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
new file mode 100644
index 0000000000..ecd8ea619b
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
@@ -0,0 +1,39 @@
+From 151beaf2210968aa38d7db61e788b1e33baf77b4 Mon Sep 17 00:00:00 2001
+From: ChenYanpan <chenyanpan@xfusion.com>
+Date: Wed, 8 Jul 2026 12:09:55 +0800
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix inverted
+ trailing-space check
+
+37a40fcb added an `end > beg' bound guard to prevent a buffer
+underflow, but accidentally flipped the condition from `isspace' to
+`!isspace'. The loop therefore walked back over non-space characters
+instead of trailing whitespace, collapsing any string without a
+trailing newline to "". Every Metalink/HTTP resource URL was wiped,
+so wget could not follow any mirror and
+testenv/Test-metalink-http.py failed ("Expected file test.meta not
+found"). Restore the `isspace' condition.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c3f3bcf]
+
+(cherry picked from commit 7b1cdecc49bc77bde220fc575c8a00386c3f3bcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/metalink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index 2d6e5846..d1b8af0b 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1061,7 +1061,7 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end == '\0')
+-    while (end > beg && !isspace(*(end - 1)))
++    while (end > beg && isspace(*(end - 1)))
+       end--;
+ 
+   new = xmemdup0 (beg, end - beg);
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
new file mode 100644
index 0000000000..cbb23050c4
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
@@ -0,0 +1,26 @@
+From 2dba5e3dcd0546a6b06be58da56fbfd151015967 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Thu, 9 Jul 2026 14:50:40 +0200
+Subject: [PATCH] * src/metalink.c: Include ctype.h
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24fe00a1]
+
+(cherry picked from commit 82d945ff5dc9942b78b2bf736aac298c24fe00a1)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/metalink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index d1b8af0b..9bea18f7 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -46,6 +46,7 @@ as that of the covered work.  */
+ #include "c-strcase.h"
+ #include <errno.h>
+ #include <unistd.h> /* For unlink.  */
++#include <ctype.h>
+ #include <metalink/metalink_parser.h>
+ #ifdef HAVE_GPGME
+ #include <gpgme.h>
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
new file mode 100644
index 0000000000..dd7eec0b08
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,53 @@
+From 566d87c1202acb4c36bdec7404abcdd40f85bcad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:32:02 +0200
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix buffer
+ underflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b6f7826]
+
+(cherry picked from commit 37a40fcb450153f69537c7cbc2a7a4fb0b6f7826)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/metalink.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index de2439c9..2d6e5846 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1041,7 +1041,6 @@ void
+ clean_metalink_string (char **str)
+ {
+   int c;
+-  size_t len;
+   char *new, *beg, *end;
+ 
+   if (!str || !*str)
+@@ -1049,7 +1048,7 @@ clean_metalink_string (char **str)
+ 
+   beg = *str;
+ 
+-  while ((c = *beg) && (c == '\n' || c == '\r' || c == '\t' || c == ' '))
++  while (isspace(*beg))
+     beg++;
+ 
+   end = beg;
+@@ -1062,12 +1061,10 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end == '\0')
+-    while ((c = *(end - 1)) && (c == '\n' || c == '\r' || c == '\t' || c == ' '))
++    while (end > beg && !isspace(*(end - 1)))
+       end--;
+ 
+-  len = end - beg;
+-
+-  new = xmemdup0 (beg, len);
++  new = xmemdup0 (beg, end - beg);
+   xfree (*str);
+   *str = new;
+ }
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index f0d3458462..fb77754965 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -15,6 +15,9 @@ DEPENDS += "autoconf-archive-native pod2man-native"
 
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2026-58469.patch \
+           file://CVE-2026-58469-regression_p1.patch \
+           file://CVE-2026-58469-regression_p2.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.35.6


