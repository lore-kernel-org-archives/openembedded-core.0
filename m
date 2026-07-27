Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1D5C54F5D
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43750.1785192980646452714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=31XEp1SP;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so22442205e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192979; x=1785797779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EMOi7/T+pdSwLO7Kua/i2XnP5PwZNoDRSBsLD5R9v8U=;
        b=31XEp1SPGu+kFRxdVXBjNNRYA8gC+b12yrrKZZPoTMSEBWCOVJNdZe6HJ/O0VVTMKO
         KpS+rdY8/ozSiwWBzO6w/HOYLAV4iaDp0tIfOyV/IbVY94SQqsPqleyhdP/j4ZPjHC3i
         oMcefQof06v4D13uFjmGvMeAXciatdbAEF+T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192979; x=1785797779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EMOi7/T+pdSwLO7Kua/i2XnP5PwZNoDRSBsLD5R9v8U=;
        b=DXVSnxKhGFMoIo+rVerfeu1k8DH3T5s8QWxoYA1xB0ltKis14yuFdR1v3SlKafFRZu
         ylmRHh0cs8nFgoD1kZwVX/tcK+DpKJSq8yTFFqQs2uvxI7Je4j5UX3R59Bh+Xz/LWRc5
         NPDEVRDTDm3lqSJn2BG+ng1ZKV+CPevJrDy0zEQQT+aeX1o2cSSpEtv+GZ+DTO91g3TG
         xrUaJJ/fD3uHlh3L3OWkvA2uJmdLWzPdT1+XdZZlG470A8yqL4FHsu8/QCrSGohXgfbU
         3lkNvt8iJz1XNJgVpCXujKJRIv0pzZU7k8Jl8zz8l8xvKL185iI+V+2DpwIdX6UbxIw1
         PAqQ==
X-Gm-Message-State: AOJu0Yys6WBw+AJevYWYhCePbZ5uafZtu2rH+hixsNNFcC40uTo1Yb5i
	D/y40wUW7HiW/CT7Jy/+Auh07o+itib+X34hO6TWJS+YANSwUKf9TEqVRuPrbATBbxN/fOYlLl7
	PEY0LKis=
X-Gm-Gg: AR+sD10MeEa7+73DIzGGF8nnicoAleG9Xgh0/HAUrpeQOwIW6tuBeNik81GXod+nu+2
	H/Zq01tsJvrqS5rBpTa+94m9ZavdGAHrCGJmZxBjZ3OrPyKRsoLMA2/iDAeU1Z+Qz/p3DNhROBp
	eSqUncMQbzb71cVoxnHLl/ViLamsL9kmnBt41SlAyK0myfoysYPwFB6tDvurjHiKzg2w6yfCXKl
	8n053Eh/QLadQM8Jbw4wo9ZAt02iuaXjff6flT26Dxd8tFAgDmL12des38XuTdo+Juzfi63MIG4
	QjA4LhS9XlKt13OrTq7Q+VRq9mfkLRifWL4zCTA7J0GTwk3ZCBYpQNPQ05CquDziLdxksaKdf35
	g8+xqPGvMDSUSjGqfrsIxxOcQYJHqC957zSARkpCwf53bEpr7DlTvYtPRoIdps8f1grbsoEH8Ie
	1jeoByKV325iawVLfsfR5ByPwxcQ8ygPE+6Df1npTQqAm+jgm2pp3IWqheHb8pjRJufQW9uDAYB
	27rpg==
X-Received: by 2002:a05:600c:5253:b0:495:4732:1eb9 with SMTP id 5b1f17b1804b1-496c4fce74dmr9591115e9.21.1785192978785;
        Mon, 27 Jul 2026 15:56:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/36] gnutls: fix CVE-2026-3833
Date: Tue, 28 Jul 2026 00:55:26 +0200
Message-ID: <2001fccf97571e04a87769f02e76896bfc1cfcb6.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242120

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-3833.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-3833

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7ca6d962c5

Tested with ptest:
Before: PASSED: 371, FAILED: 0, SKIPPED: 15
After: PASSED: 371, FAILED: 0, SKIPPED: 15

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-3833.patch         | 90 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
new file mode 100644
index 00000000000..25ba126054c
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
@@ -0,0 +1,90 @@
+From 0af3e60734ade8e89e6bec6c2687164e273fcbf2 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 3085a62310a..3ad011742e4 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-3832_p2.patch \
            file://CVE-2026-42009_p1.patch \
            file://CVE-2026-42009_p2.patch \
+           file://CVE-2026-3833.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

