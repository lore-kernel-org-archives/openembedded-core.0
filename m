Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABD5CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:47:19 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2868.1791571629450785577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nc9oP/7a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202610091847072e85052fd6000207e0-2twbt2@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202610091847072e85052fd6000207e0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:47:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=re2RK9DExSZfj7/0D6f5sPBSjtSErDC0uFZciew5esI=;
 b=nc9oP/7a3u7cnCXBRL2TRTdXjnxuWNMWwkqEzzb4hAA09B1XDgmRPdHEttWFRRKsddcTw1
 pgBWDZORiYvEaiRCUqE2gA6TqErJaz04jjU2Ub7xdLVupuUe1Q57/SD/bnwNZ+OEbwvH4XgT
 1jPpCg0X2VAg7NpBO4t9rkMcpGmNg8UQAzaxh0C0FY38vDvWTfyqXpoWNwfRNchYGDamJ/SC
 2BZln/vaaU+VLGU2X5OzjyKgpqD7Co2Vp7RDRHx5YQv9QvsHIX0Dp1fy2v0/85dpGtx4aKGU
 eRuLNAhZIlwYI9CItFgYIt/Dycm9R0zFtCQzaBAWQjQkgJt3mD438pZQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 4/8] libpcre2: patch CVE-2026-89157
Date: Fri,  9 Oct 2026 20:45:44 +0200
Message-ID: <20261009184548.2962197-4-peter.marko@siemens.com>
In-Reply-To: <20261009184548.2962197-1-peter.marko@siemens.com>
References: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247479

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] and [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-89157
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-q8g2-wprr-34m9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-89157.patch     | 61 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89157.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89157.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89157.patch
new file mode 100644
index 0000000000..fa525c79d8
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89157.patch
@@ -0,0 +1,61 @@
+From 8156b3989a82f2ddf9504d8248496e9b124be7f3 Mon Sep 17 00:00:00 2001
+From: Ilia Alshanetsky <ilia@ilia.ws>
+Date: Sun, 9 Aug 2026 07:15:03 -0400
+Subject: [PATCH] Use CU2BYTES for byte sizing in two allocation sites (#909)
+
+Two allocation sites multiplied by PCRE2_CODE_UNIT_WIDTH (the bit width:
+8, 16, or 32) where the CU2BYTES(x) byte-count helper is intended. The
+result over-allocates by the code-unit byte width: 8x in 8-bit mode, 16x
+in 16-bit, 32x in 32-bit. Subsequent memcpy calls already use CU2BYTES
+correctly, so no out-of-bounds write occurs; the over-allocation is
+leaked until the buffer is freed.
+
+Also guard each site against integer overflow in
+sizeof(pcre2_memctl) + CU2BYTES(N + 1) by rejecting N greater than
+(PCRE2_SIZE_MAX - sizeof(pcre2_memctl)) / CU2BYTES(1) - 1.
+
+CVE: CVE-2026-89157
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/8156b3989a82f2ddf9504d8248496e9b124be7f3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcre2_convert.c   | 8 +++++---
+ src/pcre2_substring.c | 7 ++++---
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/pcre2_convert.c b/src/pcre2_convert.c
+index ad7312ab..8a2b293d 100644
+--- a/src/pcre2_convert.c
++++ b/src/pcre2_convert.c
+@@ -1215,9 +1215,11 @@ for (int i = 0; i < 2; i++)
+   /* Allocate memory for the buffer, with hidden space for an allocator at
+   the start. The next time round the loop runs the conversion for real. */
+ 
+-  allocated = PRIV(memctl_malloc)(sizeof(pcre2_memctl) +
+-    (*bufflenptr + 1)*PCRE2_CODE_UNIT_WIDTH, (pcre2_memctl *)ccontext);
+-  if (allocated == NULL)
++  if (*bufflenptr > ((PCRE2_SIZE_MAX - sizeof(pcre2_memctl)) /
++        CU2BYTES(1)) - 1 ||
++      (allocated = PRIV(memctl_malloc)(sizeof(pcre2_memctl) +
++        CU2BYTES(*bufflenptr + 1),
++        (pcre2_memctl *)ccontext)) == NULL)
+     {
+     *bufflenptr = 0;  /* Error offset */
+     return PCRE2_ERROR_NOMEMORY;
+diff --git a/src/pcre2_substring.c b/src/pcre2_substring.c
+index f68b464e..a6f5277a 100644
+--- a/src/pcre2_substring.c
++++ b/src/pcre2_substring.c
+@@ -210,9 +210,10 @@ PCRE2_SIZE size;
+ PCRE2_UCHAR *yield;
+ rc = pcre2_substring_length_bynumber(match_data, stringnumber, &size);
+ if (rc < 0) return rc;
+-yield = PRIV(memctl_malloc)(sizeof(pcre2_memctl) +
+-  (size + 1)*PCRE2_CODE_UNIT_WIDTH, (pcre2_memctl *)match_data);
+-if (yield == NULL) return PCRE2_ERROR_NOMEMORY;
++if (size > ((PCRE2_SIZE_MAX - sizeof(pcre2_memctl)) / CU2BYTES(1)) - 1 ||
++    (yield = PRIV(memctl_malloc)(sizeof(pcre2_memctl) +
++      CU2BYTES(size + 1), (pcre2_memctl *)match_data)) == NULL)
++  return PCRE2_ERROR_NOMEMORY;
+ yield = (PCRE2_UCHAR *)(((char *)yield) + sizeof(pcre2_memctl));
+ if (size != 0) memcpy(yield, match_data->subject + match_data->ovector[stringnumber*2],
+   CU2BYTES(size));
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 7d027e90ee..bbe3757321 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89162.patch \
            file://CVE-2026-89161.patch \
            file://CVE-2026-89156.patch \
+           file://CVE-2026-89157.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

