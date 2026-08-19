Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE3AC5DF8F
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10318.1787155063138032327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LTY/ZCb8;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f84023916so1112654f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155061; x=1787759861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uq3UEkqr17QI1POwkuSPeF0sIY76CigrlVRmN5WHN/c=;
        b=LTY/ZCb8INQgYPO/2nJRdsFwHtTzZR1tMBQwhkOhzQMTaPE4WjMjUYdwbb3OH9WRK0
         I92mqMihB7YPuTVuXSQlVKddnRXM1Gafwf6Gcs4B/sabLCSVZJG1eC1+CQOugLSPi0se
         YSk+tZ20mV3v4BUs7J7tvFpv2xI8xUEUkZF2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155061; x=1787759861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uq3UEkqr17QI1POwkuSPeF0sIY76CigrlVRmN5WHN/c=;
        b=lKUy4gfYyLYqckP3vEDWFw6oU0Ll451W4pbMF/t63NUqRH0ClaKGvHcluZTqS0MV8W
         rELXyGFNq7kBGek7SecpBVGpNQvBpJ65Tnf8XW84ArlEW753n6JZeymDdsw1zrjLHTb6
         V0R0DJCDWYdC716+Ebe7DCUujAKfsiHzefc9YKC7cyWyZLzlkPpPOSqyi6nKuUGvkE7T
         gjva1W87oMeIxcP3mbOsPh9M9ckiMFw5soQENHu8EJc7awKw+Du2bpdwAZBITppqMXfg
         KvDozyHjWMfRZJF9FOyQ7YnYrFpCLqXfcrcTv/Av1E/ob0/7QPEY8SaqhOEZ47OefYxR
         9zsw==
X-Gm-Message-State: AFuF++mzVqkeVHrMAwk4zgMKstQ2qAqfEqiJh157t9sbqTFSwefMkjv/
	x9Ead470+mx1/li7QVSudCNs/pIoJfnV4mXPeU2l2rPLrQ/YHgcIHimrY0pwEKACMmbupp7sLPb
	VphYcjX0=
X-Gm-Gg: AR+sD10622AC1K6UeCJ9FLPbL+spgHYEkTbYWO1xxtV5uV6dwg14TO+2jUwiUqjhr6W
	cje/NPWrjPOhFodzQk7TiXaltMMFdqyx6amYCAlqiRsA3mJ/QZJSOxF2JtDzDUjVcAZcydWzQjj
	cl5oRQobHhtqQKfHkQZUjSuGv/zBb4yvDYdrr+HvY1T2vL0FwFAZxImmKPgUyXrD1VMosEbMDoz
	3UhJ7QQa0sPSb/df3pb79uEie8bCOKD3uCbrnid52tQyKN7x0k2HJ2CemrLRv+oOZ3fpx0mgCy3
	/MUGZy58HrQk8lSJjMVKyCrx8de8x5Wvh9s6kK5YXmpuZ8CEHqzv4C4f7Ztd93mZg5lpN6IWh/8
	lLpGFIPhyXv70J3SOEC7+6YRHZj3840cvMkd446OrcMCDZtSe3lZZzax1PASKKsaH+jE8F7hZY0
	NOLggk6MEEMYmHivX3uYsrva1VNc6xl1b/29eXHhsphtW5ZXkumKWmRw0uZVHkqIFCXBAKDuuHV
	Kwhlz0bfrOM3YzuhznCL8Hf/C4D20jQWVAq/7J0Q0jq5gyXP1FhM24DHU2vVWHvCpl165WodKxv
	k756gM6Ox52ZYGiqzAuksczm9nU/FtboH8aliWJJ
X-Received: by 2002:a05:6000:1846:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-482b1fe83d6mr10575603f8f.17.1787155061295;
        Wed, 19 Aug 2026 08:57:41 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:40 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/37] expat: fix CVE-2026-56403
Date: Wed, 19 Aug 2026 17:56:38 +0200
Message-ID: <ca4dd4814a36852b811be782cf0638208ef081b7.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243743

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
[2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403

(From OE-Core rev: a9e124fc7c48291392676a3cf26cde4acd660fa5)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56403_p1.patch       | 81 +++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 52 ++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
new file mode 100644
index 00000000000..8c9860c6e67
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
index 00000000000..88cb66c5469
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
index 3581d94fac4..de03bab4ab7 100644
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

