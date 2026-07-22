Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83FDC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:13:18 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44566.1784715164841797827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jT6zbrSh;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7057; q=dns/txt;
  s=iport01; t=1784715164; x=1785924764;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rusFM8JAwHAlYkNKNTSCM4GqXkzqVTtxTU85Hat95CU=;
  b=jT6zbrShS0XJ2JFGcBbmUVJKkiy9cPKE7uDuvUzl7xPAXHulGM5BPLWP
   nLHWI3U7CNhEy9NvCgb+ixFupDP4ko00J5+Od9bZp47OymXWnTkOeZbzo
   stkSRC++mF3ACV7qweBKZfrylrzFoZB0fZO1wSMzbFFbLOD+ggPbglt2l
   ACvacg6ii5y0WR6oMx7KmI2cTm9XiFzdCz2GCVMjyzrtYV+PZixWDV1YU
   0KUY1WA0QhzxTtVIVzym0lr43mBeH+/vN0JwjOetdX8zN7yn8B5qRwLea
   FHYKpRM57A/aS1jmRzD5EJMikXVVwgtyg/LO7zkR5Bf1LWplFt0A4GPyA
   A==;
X-CSE-ConnectionGUID: VpLrQK4DQNqcEvwb6EJ92w==
X-CSE-MsgGUID: Ew/aCmBJR5Su4nkX7AGWUQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgDRlmBq/4z/Ja1aglmCV3ReQ0mWSotnkjcUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhQWNWQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBNQEYAS0sAwECTwsjIYMCAYI6AzcDEcB5giyBAYMoAT8CQ?=
 =?us-ascii?q?1DYSQ2CWAELFAEFgTOFP4J9hSNcGAGEfCcbG4FyhH6BBYEaQgGBJASGfgSCD?=
 =?us-ascii?q?RWBDIFaGAaQIkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdg?=
 =?us-ascii?q?S6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDAwsYDUgRLDcUGQQ+bgeNa?=
 =?us-ascii?q?SOCQAGBDQEHIwGBGCtBB2ySY5JIgTWeaXEKKIN1jCGPPoV8GjOqbAuYfY4Kh?=
 =?us-ascii?q?AmSR4RpgWg8gUcLB3AVgyIJShkPji0LC4NggX+DZcgtJzICCTIBAQcCBw4DC?=
 =?us-ascii?q?4FokACBfgEB?=
IronPort-Data: A9a23:ZmXSBKABNEvC+RVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDsm0mEAy
 DMWDWGPP6neYzH9c9x2bIjloxgDu5HWnd82OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/gWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE/e1KFngVYaEh3P98LH9R/
 6I1CmFXcUXW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVUqgOm3aICMEjCMbehK2U+zo
 0jkxTnCH00cN+zA4BW6z0v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvGS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:aws8g6uMqUutt6FQFpDxcX3x7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AUeeGdWs4iN63N8ixNudXhA1U6IsbalnH9VSMD3a?=
 =?us-ascii?q?eEG1EVqKfF3Kyqfl7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxzqtkA4CGYDJBXSLQHT9sszlxoxF/OOnI0Uns69?=
 =?us-ascii?q?bgNTYMy9AZB6yswmOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513892021"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:12:44 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id C991118000622;
	Wed, 22 Jul 2026 10:12:43 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 66D1ACC12A6; Wed, 22 Jul 2026 03:12:43 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
Date: Wed, 22 Jul 2026 03:12:27 -0700
Message-Id: <20260722101230.34771-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241650

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
 meta/recipes-extended/wget/wget_1.21.4.bb     |  3 ++
 4 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
new file mode 100644
index 0000000000..0f8e93c2d3
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
@@ -0,0 +1,39 @@
+From be4edfe6d30a9db8e51215f0232d31eb92d502ec Mon Sep 17 00:00:00 2001
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
+index 10d58cf7..9f969a60 100644
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
index 0000000000..940d63e00c
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
@@ -0,0 +1,26 @@
+From aa412523158313619dd04d49b6f769d639e7dcc5 Mon Sep 17 00:00:00 2001
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
+index 9f969a60..16933be4 100644
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
index 0000000000..96bcb62df7
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,53 @@
+From 2442499cc090e6aa804b0295fe9f881b78df2940 Mon Sep 17 00:00:00 2001
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
+index eca839c2..10d58cf7 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index b5f50f6c84..cb05ff34f8 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -2,6 +2,9 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2024-38428.patch \
            file://CVE-2024-10524.patch \
+           file://CVE-2026-58469.patch \
+           file://CVE-2026-58469-regression_p1.patch \
+           file://CVE-2026-58469-regression_p2.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
-- 
2.35.6


