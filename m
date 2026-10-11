Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D07CA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23458.1791708098862697627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tWoE9z0T;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso864132f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708097; x=1792312897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RJXo6hANb+/pGk36L0UqITkH6/wLY3pz5vtCa0GqhiU=;
        b=tWoE9z0TKk/LEi5MRZM8cs541EkzgcYJECarXgw9HXhm4ZMlcBCvGIUbMOowzkfLR8
         DdMmrzkGVqC6ngCZwpaQTqGkdymPjD5wyXun3+F4hYnqjLhiIm7YswUXtMgmLTqeoeWQ
         3Ifwg4ZqhZp2TiASQhYWFFOYl2tTNM6efyLVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708097; x=1792312897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RJXo6hANb+/pGk36L0UqITkH6/wLY3pz5vtCa0GqhiU=;
        b=KGAjfo4/oUMgg9Uh3fpF5bF4qH39p1PT4/elqIuu23n1pLmHNE1nF9BuTTjkvH6Emb
         15Yuf92O7154tXIsJBTZqDXOwtoBTKLvi7CPzE46ZhBZqC6oaAJPYglCkATpYFTEotGs
         cfrms/0Eh5GTSffNA9QhCi3KA3TWi4fcTk1WxEhd+lRZgMEzYgIqHeD/3hdOUDbXxr+L
         586lXlBcC7S1VIltpfC/zBLtre9lA+ax8BJdYrl/qD6xYRom9hz7pvlFzWLZClu577GM
         Rjv0qigXSihJ/rswqI7Qna/So55KGwv7Aptloel+f/FEpfvJlRXY6fJeMtyMDPGPkYBq
         ezbg==
X-Gm-Message-State: AFq9FYIpV77oaxOH7/2+QUXHTSbLPntlCSSLB2h1Q5uQ884ub5Z6eXnb
	38u0Q5QphslYVIe3ULF31mU+6cBr5Djsh4xurWn/FbrGILurWmJX0gZsjRuB7zVNIQXRbDngG4q
	sm7c2pMQ=
X-Gm-Gg: AYBFou07eij5Ksy3YqwbGR3QMHbh/UU2V/kEkKboMYZyqQrk6f9HpKYaYL30g2+fA4D
	1Q1vTSxLAvM1gecbf/hgr/veG5snTdMdD7RlCVCcSCvsUNNkQQ/xfpuCw4tD9nUQApfrkpG/1BH
	rubXkVHVNkVvLw0hCeoxk2mnO/Gl+F6Hk7G2NzV7G1EQoJzQiFLKzFO4/UDCv4PyRAcrOomyETC
	FRU8JmCR7dpOoZL4ngGTOChLXNBhH4vHRkMFqNzajZgeoyTm2oyEZLK50Um94cIxK/vqTvf7Cxa
	/2MZtOjpKeybczEXMcLMjZtV7cfrjMxe2um/Pt8xcQgnOwcalLhU9SFoitg22yQiM3C5dTJbkUm
	K/ToU8SMBKzhe0cfV6I6y5O32oJmVww1M1N/720eqZZBpOPsZF8YOGElMb5wJU2mgR2KWuiLUyJ
	DBWfF7pRFEYXnGZrz+KgXHRzmS/7fL1H5zvQ+eEEhSQU+InAgO+vaq1Hon+OBXq09Xw0ta4HXqS
	gbkw1PzCaOij0Cmj/UhOYrpOSbedMiR8EvFz3tbmR0qGe+pAMwtt7k1+D8CZoPGvAEbSywRlg==
X-Received: by 2002:adf:e183:0:b0:487:490:8391 with SMTP id ffacd0b85a97d-48dbaadd94cmr11179495f8f.16.1791708097058;
        Sun, 11 Oct 2026 01:41:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 56/60] libpcre2: patch CVE-2026-89157
Date: Sun, 11 Oct 2026 10:40:29 +0200
Message-ID: <08b716da1674d64eafb3a4bf7c7d5b9bc6a33138.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247565

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] and [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-89157
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-q8g2-wprr-34m9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/CVE-2026-89157.patch     | 61 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89157.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89157.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89157.patch
new file mode 100644
index 00000000000..fa525c79d87
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
index 7d027e90eec..bbe37573215 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89162.patch \
            file://CVE-2026-89161.patch \
            file://CVE-2026-89156.patch \
+           file://CVE-2026-89157.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

