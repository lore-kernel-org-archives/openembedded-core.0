Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A9FC5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10403.1787155062542026669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aNcxEhYr;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so989452f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155061; x=1787759861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WBcWFjRaopoqKclo2aClG+cX18hNPxxy78GgmpsMBB4=;
        b=aNcxEhYr1pyVd2iFLJ8DmmBjNt3RS632bjGyvi9btIlVmZQ0ODjQghIUWCmwf56Vnw
         t/PMBQuxPeajULVonyS7J11obCb+x7mKgChRXRnxKCQdJ1J7jYwEzGxJDLnHNhyiMXLn
         QHpvql9JYBqZ/w2rh/rjXFkQ+v0A+ZkEHd9IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155061; x=1787759861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WBcWFjRaopoqKclo2aClG+cX18hNPxxy78GgmpsMBB4=;
        b=CitHvPIaMCzxpb8ye9aPCSyL3lN2G7VnqAl8xTTbNkZZSiMry+37gru0EI363uIxPs
         R9McpW49ML9PkK+91NZrwi/rNyxAc19dRsRefKLWeEALAJKHz9rxLGQ4KGgC1ru/6LsS
         ey9nrrMSqw/sBVuLHb7GV3aZbuUr4DYmdDlifJCFDGYZvEHA2qqb+rUOK9mQ9du3CeWO
         Z0n7SwAon6d9yC3xqw2/+KoDNyabqJxL/ecxJ/iq+S94d5OQotxjucde1VN8G5FXQYLv
         oNvnh6rVR3JTxabb6qZS+zvafCX9/YMO2Poy4K8PuQyMl6HRQ/qc+k26jAzpoLxYa/xf
         eN3w==
X-Gm-Message-State: AFuF++kwpNJ/6/dP0h2A255uini+H6ZXnlscntaR1x3nop75dVRzym/5
	n7scHKFnUFpsgXfJ1xBhlZ4qEt5PiyyTbwromcY+mHeKRuMU0WEH2aFL6mgOkooex+GpebZ36p7
	/SvgH+6E=
X-Gm-Gg: AR+sD10GYHoCZGvHmG8gNpWVZjoQw1a9NYipSJL6tWQB0JS2o+HguK7zIWENrX6r45j
	XcmbKmEk2+DehWjnFqj1DJvZbY6MRXDfl9V9iXnfnLpocd5cDLwHBkYHRjggXaNvYKN3WFC9enB
	FOk+GuJdpL9VnJMgla380hNn7tUjmxSirZbzeREdMcXoZsMsySUj/roa659Sqfc35JmOtPdyZMh
	A/3BRK+HZIjURfViSxbdpWgnW0Zn/e8KW4ufy5Kv3Lk0m8IL72JDdxZFd2MNWjbTMkbeXFteOqC
	7h3bon5yq1PUW2slrmSvdvIC8OsI2qoleOzuL1SYjfLYv2L8o2fWgOW8tJpSyNfh8bUifUx8l7o
	IdJ6tLVbGHCoeJvUElZyf9VcCw28ZjorWEU9B/B1f7B+Vw9BN+e6M+O1/lyjm6pX2E/K4MA6rto
	cAArJVk1FnsZkXDZ+tDW5PRlOh5tIZcmRsqKPmTd5h7iUMDAd3d2P4GO3p+HoQk+VaOHhGRykAh
	EI+wjsJUq68OsltT6SRtXf2d0sSf3gCJMebKN6rQBmNwyxZtSX5XnwdGFfe4XVKSNilfp5q36TO
	b83RJWSyHjVlqhX7SRiVS9FwrqXU+kLaxWMbG9lk
X-Received: by 2002:a05:6000:2f84:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-482b1feb260mr9772733f8f.17.1787155060689;
        Wed, 19 Aug 2026 08:57:40 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:39 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/37] gnutls: fix CVE-2026-3833
Date: Wed, 19 Aug 2026 17:56:37 +0200
Message-ID: <e454e2ddba700065b7582757331a573d51e72e3f.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243742

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-3833.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-3833

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7ca6d962c5

Tested with ptest:
Before: PASSED: 369, FAILED: 0, SKIPPED: 17
After: PASSED: 369, FAILED: 0, SKIPPED: 17

(From OE-Core rev: c4d9e204adc134b1d7d2b3b8ea9bbfd6fd33e5f5)

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-3833.patch         | 90 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
new file mode 100644
index 00000000000..a92703bb26d
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
@@ -0,0 +1,90 @@
+From 47f495820c5c049933563e869e931a2180e0a428 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 16 Mar 2026 15:29:40 +0100
+Subject: [PATCH] x509/name-constraints: compare domain names case-insensitive
+
+RFC 5280 7.2:
+> When comparing DNS names for equality, conforming implementations
+> MUST perform a case-insensitive exact match on the entire DNS name.
+> When evaluating name constraints, conforming implementations MUST
+> perform a case-insensitive exact match on a label-by-label basis.
+
+Domain name comparison during name constraints processing
+was case-sensitive. For excluded name constraints, this could lead to
+incorrectly accepting domain names that should've been rejected.
+The code for comparing domain names and domain name parts of emails
+has been modified to perform case-insensitive comparison instead.
+
+Reported-by: Oleh Konko <security@1seal.org>
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1223
+Fixes: #1803
+Fixes: #1852
+Fixes: CVE-2026-3833
+Fixes: GNUTLS-SA-2026-04-29-5
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-3833
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7ca6d962c5]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/x509/name_constraints.c | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 04722bdf4..dee045d25 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -35,6 +35,7 @@
+ #include "x509_int.h"
+ #include "x509_ext_int.h"
+ #include <libtasn1.h>
++#include "c-strcase.h"
+ 
+ #include "ip.h"
+ #include "ip-in-cidr.h"
+@@ -80,7 +81,7 @@ enum name_constraint_relation {
+ 	NC_SORTS_AFTER = 2 /* unrelated constraints */
+ };
+ 
+-/* A helper to compare just a pair of strings with this rich comparison */
++/* Helpers to compare just a pair of strings with this rich comparison */
+ static enum name_constraint_relation
+ compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_len)
+ {
+@@ -96,6 +97,22 @@ compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_len)
+ 	return NC_EQUAL;
+ }
+ 
++static enum name_constraint_relation
++compare_strings_case_insensitive(const void *n1, size_t n1_len, const void *n2,
++				 size_t n2_len)
++{
++	int r = c_strncasecmp(n1, n2, MIN(n1_len, n2_len));
++	if (r < 0)
++		return NC_SORTS_BEFORE;
++	if (r > 0)
++		return NC_SORTS_AFTER;
++	if (n1_len < n2_len)
++		return NC_SORTS_BEFORE;
++	if (n1_len > n2_len)
++		return NC_SORTS_AFTER;
++	return NC_EQUAL;
++}
++
+ /* Rich-compare DNS names. Example order/relationships:
+  * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE y.b */
+ static enum name_constraint_relation compare_dns_names(const gnutls_datum_t *n1,
+@@ -121,8 +138,8 @@ static enum name_constraint_relation compare_dns_names(const gnutls_datum_t *n1,
+ 		while (j && n2->data[j - 1] != '.')
+ 			j--;
+ 
+-		rel = compare_strings(&n1->data[i], i_end - i, &n2->data[j],
+-				      j_end - j);
++		rel = compare_strings_case_insensitive(&n1->data[i], i_end - i,
++						       &n2->data[j], j_end - j);
+ 		if (rel == NC_SORTS_BEFORE) /* x.a BEFORE y.a */
+ 			return NC_SORTS_BEFORE;
+ 		if (rel == NC_SORTS_AFTER) /* y.a AFTER x.a */
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index d27d2cfa748..676c5c6f940 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -45,6 +45,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-9.patch \
            file://CVE-2026-42009_p1.patch \
            file://CVE-2026-42009_p2.patch \
+           file://CVE-2026-3833.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

