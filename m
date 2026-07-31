Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BE7C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:56:53 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.657.1785477406296769358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Czgfb5+x;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6993; q=dns/txt;
  s=iport01; t=1785477406; x=1786687006;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/PxpxLEjByYVxwpYuE3zKfVQ4wPdt2h0mb/4CxJaAUU=;
  b=Czgfb5+x8gXb28VRTrS+IFUn8bU77ZZCbFqoevLBz6fOvoaJhkPFS39x
   TlFHanElnRrlv/o4QuLDHyZqsNzlPiMZaX9fiLAF/w5wDNsH5Oz2RuKW1
   7dXkhteA5uRE1SKdFA01XgUJdmxNcvAqHJQgaWnYbDgjdwKfqYBLOGXFB
   05Z0VpV+EQqTxYaWtAh211jkZt7vMFU7hIBlslJCpnhajMz403iTguCx3
   f0L1g9m73TaEl5vkpjxeM+7jzCpFmZtJ2Q0zI7OxbFuuqigVZ3vnkZFYy
   grXtbJ5/QXe9itKw5B251Lj4BkEJTxWFW7VzOjdQZJ2jFZX96qz/64f9M
   Q==;
X-CSE-ConnectionGUID: kCBTY7v+S4G3n2W9x9dMYw==
X-CSE-MsgGUID: zJBzR2p0REWo0gQzljqDgQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgC2OGxq/5H/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOBE50IgX4PAQEBD0QNBAEBhD9GAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgRCIMCAYJ0A?=
 =?us-ascii?q?xG6NBo3gXkzgQGDKAE/AkNQ2y4BCxQBgTiFP4ggXBgBhHwnGxuBcoEVgnN2g?=
 =?us-ascii?q?QWBXAEBiCUEgiKBDIFaHoQrjBJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBwWBHYErL4RTIxk2fIEvdUp1LWoSF4EagzECgl8DCxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB41pIII+AT1RASuBQxGUF5AWgh6hEgoog3WMIZU6GjOqbAuYfY4KllCEa?=
 =?us-ascii?q?YFoPIEoHwsHcBWCbgEzCUoZD44tCwuDYIF/zEM8NQIJMgEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:OosQA6ARmq/SeBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDpw1DwAy
 TQcWm6EOvuDNmv8Ldh/YIm+oU0PscXWn4JlOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD+g2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwN5EMHBpI84jpsksBztxp
 OxJJBU8cUXW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEojuOwbYSOJbRmQ+1HvGyKn
 Djep17UPRZCO+WNzTic3n2V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:JhS08q9gUsxeKK2mzS5uk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:R+C+pGGS3tmFx2NlqmJk32QoK587MUaB4yzWeXDpGTdlbYyKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AmdpGHA3GfB8cdoEVIzx9CGPbPTUj8YaEGnpXic0?=
 =?us-ascii?q?8lvaDbSNJKTOflRi4e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="516355637"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:56:45 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 1F4AE180001E4
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:45 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 37D65CC037D; Fri, 31 Jul 2026 11:26:43 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 01/10] expat: fix CVE-2026-56403
Date: Fri, 31 Jul 2026 11:26:16 +0530
Message-Id: <20260731055625.4187716-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242398

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
[2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patches.

 .../expat/expat/CVE-2026-56403_p1.patch       | 81 +++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 52 ++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
new file mode 100644
index 0000000000..8c9860c6e6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
@@ -0,0 +1,81 @@
+From b689559597116ee75a633453e2f7177c8541b04e Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 20 May 2026 12:12:10 +0200
+Subject: [PATCH 01/17] lib: Protect function `storeAtts` from signed integer
+ overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648]
+
+Backport Changes:
+- Adapt storeAtts to the Scarthgap 2.6.4 loop and URI allocation
+  logic while preserving the upstream overflow checks.
+
+(cherry picked from commit 12dc6d8d3d65f79471a94d8565f6bf1cf245f648)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 9bc67f38..df92a3ca 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4226,26 +4226,32 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     return XML_ERROR_NONE;
+   prefixLen = 0;
+   if (parser->m_ns_triplets && binding->prefix->name) {
+-    for (; binding->prefix->name[prefixLen++];)
+-      ; /* prefixLen includes null terminator */
++    size_t candidateLen = 0;
++    for (; binding->prefix->name[candidateLen++];)
++      ; /* candidateLen includes null terminator */
++    /* Detect and prevent integer overflow */
++    if (candidateLen > INT_MAX)
++      return XML_ERROR_NO_MEMORY;
++    prefixLen = (int)candidateLen;
+   }
+   tagNamePtr->localPart = localPart;
+   tagNamePtr->uriLen = binding->uriLen;
+   tagNamePtr->prefix = binding->prefix->name;
+   tagNamePtr->prefixLen = prefixLen;
+-  for (i = 0; localPart[i++];)
+-    ; /* i includes null terminator */
++
++  size_t localPartLen = 0;
++  for (; localPart[localPartLen++];)
++    ; /* localPartLen includes null terminator */
+ 
+   /* Detect and prevent integer overflow */
+-  if (binding->uriLen > INT_MAX - prefixLen
+-      || i > INT_MAX - (binding->uriLen + prefixLen)) {
++  if (localPartLen > INT_MAX || binding->uriLen > INT_MAX - prefixLen
++      || localPartLen > (size_t)INT_MAX - (binding->uriLen + prefixLen)) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
+-  n = i + binding->uriLen + prefixLen;
++  n = (int)localPartLen + binding->uriLen + prefixLen;
+   if (n > binding->uriAlloc) {
+     TAG *p;
+-
+     /* Detect and prevent integer overflow */
+     if (n > INT_MAX - EXPAND_SPARE) {
+       return XML_ERROR_NO_MEMORY;
+@@ -4273,10 +4279,14 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   }
+   /* if m_namespaceSeparator != '\0' then uri includes it already */
+   uri = binding->uri + binding->uriLen;
+-  memcpy(uri, localPart, i * sizeof(XML_Char));
++  /* Detect and prevent integer overflow */
++  if (localPartLen > SIZE_MAX / sizeof(XML_Char)) {
++    return XML_ERROR_NO_MEMORY;
++  }
++  memcpy(uri, localPart, localPartLen * sizeof(XML_Char));
+   /* we always have a namespace separator between localPart and prefix */
+   if (prefixLen) {
+-    uri += i - 1;
++    uri += localPartLen - 1;
+     *uri = parser->m_namespaceSeparator; /* replace null terminator */
+     memcpy(uri + 1, binding->prefix->name, prefixLen * sizeof(XML_Char));
+   }
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
new file mode 100644
index 0000000000..88cb66c546
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
@@ -0,0 +1,52 @@
+From 2855ce68a1ce9732267c06734427930364ab66c1 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 22 May 2026 00:43:52 +0200
+Subject: [PATCH 02/17] xmlwf: Protect function `xcsdup` from signed integer
+ overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15]
+
+Backport Changes:
+- Add stdint.h and convert count and numBytes to size_t because
+  Scarthgap 2.6.4 lacks these upstream prerequisites.
+
+(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index fd4fc3f8..7bbdb303 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -45,6 +45,7 @@
+ 
+ #include <assert.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+ #include <string.h>
+@@ -304,13 +305,18 @@ processingInstruction(void *userData, const XML_Char *target,
+ static XML_Char *
+ xcsdup(const XML_Char *s) {
+   XML_Char *result;
+-  int count = 0;
+-  int numBytes;
++  size_t count = 0;
++  size_t numBytes;
+ 
+   /* Get the length of the string, including terminator */
+   while (s[count++] != 0) {
+     /* Do nothing */
+   }
++
++  // Detect and prevent integer overflow
++  if (count > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   numBytes = count * sizeof(XML_Char);
+   result = malloc(numBytes);
+   if (result == NULL)
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 3581d94fac..de03bab4ab 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -61,6 +61,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-45186-05.patch \
            file://CVE-2026-45186-06.patch \
            file://CVE-2026-45186-07.patch \
+           file://CVE-2026-56403_p1.patch;striplevel=2 \
+           file://CVE-2026-56403_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


