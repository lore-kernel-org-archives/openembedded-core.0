Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4DFC7EE2D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:14:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2674.1750432481034225125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B74116F2;
	Fri, 20 Jun 2025 08:14:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3516D3F673;
	Fri, 20 Jun 2025 08:14:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: christian.lindeberg@axis.com
Subject: [PATCH 08/12] oe/licenses: move tidy_licenses from recipetool
Date: Fri, 20 Jun 2025 16:14:25 +0100
Message-ID: <20250620151429.3210879-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620151429.3210879-1-ross.burton@arm.com>
References: <20250620151429.3210879-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 15:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219135

This function, to tidy a license string, is useful outside of recipetool
so move it to oe.license.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/license.py           | 15 +++++++++++++++
 scripts/lib/recipetool/create.py | 11 +----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 6f882c3812c..6e55fa1e7f6 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -462,3 +462,18 @@ def skip_incompatible_package_licenses(d, pkgs):
             skipped_pkgs[pkg] =3D incompatible_lic
=20
     return skipped_pkgs
+
+def tidy_licenses(value):
+    """
+    Flat, split and sort licenses.
+    """
+    from oe.license import flattened_licenses
+
+    def _choose(a, b):
+        str_a, str_b  =3D sorted((" & ".join(a), " & ".join(b)), key=3Ds=
tr.casefold)
+        return ["(%s | %s)" % (str_a, str_b)]
+
+    if not isinstance(value, str):
+        value =3D " & ".join(value)
+
+    return sorted(list(set(flattened_licenses(value, _choose))), key=3Ds=
tr.casefold)
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index f0584d84701..0a6f59810ce 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -18,6 +18,7 @@ from urllib.parse import urlparse, urldefrag, urlsplit
 import hashlib
 import bb.fetch2
 logger =3D logging.getLogger('recipetool')
+from oe.license import tidy_licenses
 from oe.license_finder import find_licenses
=20
 tinfoil =3D None
@@ -951,16 +952,6 @@ def fixup_license(value):
         return '(' + value + ')'
     return value
=20
-def tidy_licenses(value):
-    """Flat, split and sort licenses"""
-    from oe.license import flattened_licenses
-    def _choose(a, b):
-        str_a, str_b  =3D sorted((" & ".join(a), " & ".join(b)), key=3Ds=
tr.casefold)
-        return ["(%s | %s)" % (str_a, str_b)]
-    if not isinstance(value, str):
-        value =3D " & ".join(value)
-    return sorted(list(set(flattened_licenses(value, _choose))), key=3Ds=
tr.casefold)
-
 def handle_license_vars(srctree, lines_before, handled, extravalues, d):
     lichandled =3D [x for x in handled if x[0] =3D=3D 'license']
     if lichandled:
--=20
2.43.0


