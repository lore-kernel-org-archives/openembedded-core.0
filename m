Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471C7CD5BD0
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 01:12:54 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1695.1779930769443608912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 18:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=akICfHe9;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7764; q=dns/txt;
  s=iport01; t=1779930769; x=1781140369;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qdcL39SGWrFDSWphVnwjAmkEUuOu6qNbncbK0fwa6PI=;
  b=akICfHe9qqzUQyVjbyjomV0MAb9hDukRwm/J9hqERdpoXlf404JB0dMi
   Bnqh9OHJtwCV0ff6ODksSmW/hZ9PXpclvbHtoB5V6Z6XBCa1NUx4zOhAy
   5I2TGfjF9wDjyG9/iontFT10LpGL//aoMnvHx9/4/8fS/PySdQ/sAHqWg
   vexQowQeYkjGn75GfKIlEheztc8Mgk1Udh+l8zKi2E3NqKAPE7tgCLWjW
   r33F2JEGo/6jO5ZXNs4tFyCnKhTr9NH+FqQukypiDS64C3Nur58GvCJUz
   z7NkFi6oAPdk02io0uuCIo4pXLswN3IsKCOV1stC4hNzOh3pMSSfCLILN
   g==;
X-CSE-ConnectionGUID: ATH5g7YTTZuT3L4uOHSEMA==
X-CSE-MsgGUID: G/yhG4cOSISlArG1F0lM1Q==
X-IPAS-Result: =?us-ascii?q?A0AaAADalRdq/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBghc/cl5DSYxziVieHoEkA1cPAQEBD0QNBAEBhQaNNAImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBNQFGLAMBAlojI?=
 =?us-ascii?q?YMCAYJzAxEGswWCLIEBgmaCF9soAQsUAYE4AYU+iB1bGYNcgR8nGxuBcoR9g?=
 =?us-ascii?q?QUBgVsCAhiBDYZ9BIIigQyBXYM0igdIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQsbBwWBS3ZyaoEFhRgjJgNOgS2Bf3ADCxgNSBEsNxQbBD5uB4p/G?=
 =?us-ascii?q?g+BZkwBPRs2AQckIGUTA3AJGCSjMYIhnkqBBoE+CiiDdIwhlToaM4VbpRCZB?=
 =?us-ascii?q?o4JlWdohGiBaDw5gSBwFTuCZwlKGQ+OOIEfAQKCSYQHgQzFUCcyCzIBAQcCB?=
 =?us-ascii?q?w4DC4FokAACJgeBTgEB?=
IronPort-Data: A9a23:SVI5R6tFLw+Dl70mIDZZV6dyLefnVAFfMUV32f8akzHdYApBsoF/q
 tZmKT+GPqrfM2Xwe49zO9iz80xX7ZDWzNFrHlc6/yA0Ei4agMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs//Z90s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw09pXXG4Rx
 MAkGi0xNTTfmsWW+5+eY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtOYH49tL/Aan3Xcz9RpFWTjaE2+GPUigd21dABNfKJKoLaH5kOwRjwS
 mTu0CPoAj5GP/uk6AGB22iD38GXmQaiYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:PpoNH64zRICRes8UCgPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3AmBNX32t11CvEtH8uqN7l+Xij6IsMTl2AwyjhH3O?=
 =?us-ascii?q?KFFoybOGIbn+r1YZNxp8=3D?=
X-Talos-MUID: 9a23:JnpU3gQ5D+paIBHERXTDwyBiG5tjxJ+PM0Qki7pflZGAEHVJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,172,1774310400"; 
   d="scan'208";a="486824376"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 May 2026 01:12:48 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 51F2C180005C3;
	Thu, 28 May 2026 01:12:48 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id E8429CC1288; Wed, 27 May 2026 18:12:47 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] go: split CVE-2025-61726 regression fix
Date: Wed, 27 May 2026 18:12:39 -0700
Message-Id: <20260528011239.528751-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 01:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237675

From: Himanshu Jadon <hjadon@cisco.com>

Restore the originally submitted CVE backport and carry the ordering
correction fix separately for internal/godebugs.All as a separate
regression patch. This keeps the security backport easier to audit and
makes the follow-up fix explicit.

The ordering issue was introduced when the existing backport patch was
modified by commit [1]. The same change also dropped zipinsecurepath
from the patch hunk context. Restore the original hunk context and keep
the ordering correction as a separate follow-up patch.

Keep the regression patch immediately after CVE-2025-61726.patch in
SRC_URI because it is a direct fixup for that patch in the same file and
hunk area. This is safe because no later Go patch in the current stack
modifies src/internal/godebugs/table.go, so placing the fixup here makes
the dependency explicit without interfering with later validated patches.

[1] https://git.openembedded.org/openembedded-core/commit/?id=b670b11ff4845b64f861041681ace9c21db16eed

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-61726-regression.patch     | 49 +++++++++++++++++++
 .../go/go/CVE-2025-61726.patch                | 21 ++++----
 3 files changed, 60 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61726-regression.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 3fa421e223..c095e54fbb 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -33,6 +33,7 @@ SRC_URI += "\
     file://CVE-2025-61729.patch \
     file://CVE-2025-61730.patch \
     file://CVE-2025-61726.patch \
+    file://CVE-2025-61726-regression.patch \
     file://CVE-2025-61728.patch \
     file://CVE-2025-61731.patch \
     file://CVE-2025-68119-dependent.patch \
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726-regression.patch b/meta/recipes-devtools/go/go/CVE-2025-61726-regression.patch
new file mode 100644
index 0000000000..bb2b5ac439
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726-regression.patch
@@ -0,0 +1,49 @@
+From a92d36cef2c1838e58dd1ec51bd147bd94e916fc Mon Sep 17 00:00:00 2001
+From: Himanshu Jadon <hjadon@cisco.com>
+Date: Thu, 14 May 2026 05:40:12 -0700
+Subject: [PATCH] go: Fix CVE-2025-61726.patch variable ordering
+
+The backported CVE-2025-61726 patch introduced a regression in
+src/internal/godebugs/table.go by adding urlmaxqueryparams out of
+alphabetical order.
+
+From Go's source code[1], the All table from godebugs must be populated
+alphabetically by Name, and Lookup[2] uses binary search to find the
+variable.
+
+The wrong ordering caused Lookup to return nil for urlmaxqueryparams,
+which triggered runtime failures.
+
+Fix this by moving urlmaxqueryparams before x509sha1.
+
+This change was validated with docker-moby (original issue), where a
+container ran successfully and no traces were observed in the logs.
+
+[1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L20
+[2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L100
+
+CVE: CVE-2025-61726
+Upstream-Status: Inappropriate [OE-specific backport ordering fix]
+
+Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ src/internal/godebugs/table.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
+index 4ae0430..7178df6 100644
+--- a/src/internal/godebugs/table.go
++++ b/src/internal/godebugs/table.go
+@@ -51,8 +51,8 @@ var All = []Info{
+ 	{Name: "tlsmaxrsasize", Package: "crypto/tls"},
+ 	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
+ 	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
+-	{Name: "x509sha1", Package: "crypto/x509"},
+ 	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
++	{Name: "x509sha1", Package: "crypto/x509"},
+ 	{Name: "x509usefallbackroots", Package: "crypto/x509"},
+ 	{Name: "x509usepolicies", Package: "crypto/x509"},
+ 	{Name: "zipinsecurepath", Package: "archive/zip"},
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
index bdd10bc933..ab053ff55c 100644
--- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
@@ -1,4 +1,4 @@
-From bf06767a9ac737387eee77c7eedd67c65e853ac2 Mon Sep 17 00:00:00 2001
+From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
 From: Damien Neil <dneil@google.com>
 Date: Mon, 3 Nov 2025 14:28:47 -0800
 Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
@@ -36,7 +36,6 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
 TryBot-Bypass: Michael Pratt <mpratt@google.com>
 (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
 Signed-off-by: Deepak Rathore <deeratho@cisco.com>
-Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
 ---
  doc/godebug.md                 |  7 +++++
  src/internal/godebugs/table.go |  1 +
@@ -46,7 +45,7 @@ Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
  5 files changed, 85 insertions(+)
 
 diff --git a/doc/godebug.md b/doc/godebug.md
-index ae4f057..635597e 100644
+index ae4f0576b4..635597ea42 100644
 --- a/doc/godebug.md
 +++ b/doc/godebug.md
 @@ -126,6 +126,13 @@ for example,
@@ -64,19 +63,19 @@ index ae4f057..635597e 100644
  to concerns around VCS injection attacks. This behavior can be renabled with the
  setting `allowmultiplevcs=1`.
 diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
-index 33dcd81..7178df6 100644
+index 33dcd81fc3..4ae043053c 100644
 --- a/src/internal/godebugs/table.go
 +++ b/src/internal/godebugs/table.go
-@@ -51,6 +51,7 @@ var All = []Info{
-	{Name: "tlsmaxrsasize", Package: "crypto/tls"},
+@@ -52,6 +52,7 @@ var All = []Info{
 	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
 	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
-+	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
 	{Name: "x509sha1", Package: "crypto/x509"},
++	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
 	{Name: "x509usefallbackroots", Package: "crypto/x509"},
 	{Name: "x509usepolicies", Package: "crypto/x509"},
+	{Name: "zipinsecurepath", Package: "archive/zip"},
 diff --git a/src/net/url/url.go b/src/net/url/url.go
-index d2ae032..cdca468 100644
+index d2ae03232f..5219e3c130 100644
 --- a/src/net/url/url.go
 +++ b/src/net/url/url.go
 @@ -13,6 +13,7 @@ package url
@@ -119,7 +118,7 @@ index d2ae032..cdca468 100644
 		var key string
 		key, query, _ = strings.Cut(query, "&")
 diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
-index fef236e..b2f8bd9 100644
+index fef236e40a..b2f8bd95fc 100644
 --- a/src/net/url/url_test.go
 +++ b/src/net/url/url_test.go
 @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
@@ -178,7 +177,7 @@ index fef236e..b2f8bd9 100644
 	url *URL
 	out string
 diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
-index 517ec0e..88d6d8c 100644
+index 517ec0e0a4..335f7873b3 100644
 --- a/src/runtime/metrics/doc.go
 +++ b/src/runtime/metrics/doc.go
 @@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered lexicographically.
@@ -194,4 +193,4 @@ index 517ec0e..88d6d8c 100644
 		The number of non-default behaviors executed by the crypto/x509
 		package due to a non-default GODEBUG=x509sha1=... setting.
 --
-2.34.1
+2.35.6
-- 
2.35.6


