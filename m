Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DB4CC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32439.1792040632488169633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hxTpfO6r;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1289088f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040631; x=1792645431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2MsxUOGpqxCiQ+ki+0YPM4KWGRFCkYFNaWNQTEMzAEo=;
        b=hxTpfO6rz78ZNtTFDCFqrm+WaqvLaK4k3yv/3JGB1Vymxh/gP0oU7Qwx6K4+zolaP7
         74K+o62H9jAFKyfDurb1s2w5r7jgaeRJDe5oBsv4Io+NZRpC81W78c/MQb82J9/k19/A
         b/v9Xp5PGxjTjZQoLDH+uj8a3uO2/PTODB42s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040631; x=1792645431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2MsxUOGpqxCiQ+ki+0YPM4KWGRFCkYFNaWNQTEMzAEo=;
        b=1v6FXyy8olNvgeYUh7pizINj1dKlVeQTLZbWHtfbawkK0+ClEoQie5hKTTV34/R/wf
         +drazWJ+cwqNQ6kAAEhwmzUeu2B5+Y3LMfPsZmYevwXR9cpks07EjK/Cj3FmjaQ+Ezo+
         6U0Nbm7zyb9IrOZrkEUj8qFZE/N0bG9tLdYhrEv81RMM5n7KXZ6pKxstlCP09HHdlTc7
         QmYTBV9COYDk8QsGFnfrJVf8klzzjyLZe5FZI98sZc5cDpMKkyamwW81cjs9Cncdmtqv
         nSg1IWQ5e4KPrSRHeZUHZFhUk06jil9QRLtBDNysCJydr6NcX/P9DNiSBunsPLkKXZtW
         vpOA==
X-Gm-Message-State: AFq9FYKHmYb7cd3eISh4210PefWyKpiqnUQ+qWQik+5L3gznekszdOwJ
	4zA3Q6KODUnBWGbDptNho3OlMJXeNaehH2BRqQu04nV2yCn65e51KbzI/3yOKsHBIoHR7szBgk0
	1mjOt7IY=
X-Gm-Gg: AYBFou3/jCvi1FRrCJs8tovznQgommEKv8uHOHhTYKfksNCw0Sw9873D9fFuTsXzo6J
	inBsiSkuHDxel1xVX1hBVuRRqu41KkavADwX4MI4YDT1nAAfS3nQJnNuuW5Ww8eVfeBniCBKBoP
	vCSjOyDPgGwgZzbE3BNovNykytvjSIM5tA9GMImWFUjzcFSLwXIV7H5KD9vpIG8admskPqsUqGt
	RcxAljbwayklKGyw7/pAz+76uRe2j/Dn4Vyy46p88N7X2HE6lC2+6hzU5BtsyWJ4SCoPwQv342v
	b2g0H/BPharCkrDLM3Xqkl1nnAQNdNOGN4uKd+Ug1ReryoK/WF2MJ1x6OwtNYrh6khLUHKiN/dO
	AnUI4pXl9XpjIVWyak1TkNK4LRdMBmqv/Y+AS2TGEOH+3skMKRf7+4NlJcgORxOxMcVI8f71wSh
	hCioB7sKpLTamSOA8zjlYKGDXawZuvTLnRmYqlVOl5ksCk/vhqrRUqlbjPghFI9aSkP1RBe/M3N
	Qtz2A7Te+cuh1GpjXrLnpQty1DSVTD83HjnIVoKex7VrecuLTLb0ZyFBu+CgVmuTfmixyAe5Yc=
X-Received: by 2002:a05:600c:19cf:b0:4a1:7b56:1151 with SMTP id 5b1f17b1804b1-4a18e48f00dmr352213425e9.18.1792040630692;
        Wed, 14 Oct 2026 22:03:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/55] libxml2: Fix CVE-2026-86143
Date: Thu, 15 Oct 2026 07:02:43 +0200
Message-ID: <fb571abf1473c04b869360faab38409471ab06c6.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247818

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/90f293ba74d28b1d570920382e707586f68ebf35
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86143

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-86143.patch       | 96 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
new file mode 100644
index 00000000000..98335f88fbf
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
@@ -0,0 +1,96 @@
+From 83259eee08067b547d2aaedd436504939b2c343b Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 09:54:34 +0200
+Subject: [PATCH] xmlIO: Check for int overflow before calling writecallback
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1111
+
+CVE: CVE-2026-86143
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/90f293ba74d28b1d570920382e707586f68ebf35]
+
+Backport Changes:
+- Change nbchars to size_t in both Scarthgap write functions before assigning
+  the size_t result of xmlBufUse(). Add the INT_MAX guard to both
+  xmlOutputBufferWrite() callback paths. The upstream commit assumes earlier
+  refactoring that changed nbchars to size_t and routed
+  xmlOutputBufferWriteEscape() through the protected write path; the existing
+  flush guards are retained.
+
+(cherry picked from commit 90f293ba74d28b1d570920382e707586f68ebf35)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlIO.c | 26 ++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/xmlIO.c b/xmlIO.c
+index 95d27157..de227d8c 100644
+--- a/xmlIO.c
++++ b/xmlIO.c
+@@ -3318,7 +3318,7 @@
+  */
+ int
+ xmlOutputBufferWrite(xmlOutputBufferPtr out, int len, const char *buf) {
+-    int nbchars = 0; /* number of chars to output to I/O */
++    size_t nbchars = 0; /* number of chars to output to I/O */
+     int ret;         /* return from function call */
+     int written = 0; /* number of char written to I/O so far */
+     int chunk;       /* number of byte current processed from buf */
+@@ -3378,6 +3378,10 @@
+             if ((nbchars < MINLEN) && (len <= 0))
+                 goto done;
+ 
++            if (nbchars >= INT_MAX) {
++                out->error = XML_ERR_INTERNAL_ERROR;
++                return(-1);
++            }
+ 	    /*
+ 	     * second write the stuff to the I/O channel
+ 	     */
+@@ -3487,7 +3491,7 @@
+ int
+ xmlOutputBufferWriteEscape(xmlOutputBufferPtr out, const xmlChar *str,
+                            xmlCharEncodingOutputFunc escaping) {
+-    int nbchars = 0; /* number of chars to output to I/O */
++    size_t nbchars = 0; /* number of chars to output to I/O */
+     int ret;         /* return from function call */
+     int written = 0; /* number of char written to I/O so far */
+     int oldwritten=0;/* loop guard */
+@@ -3572,6 +3576,10 @@
+             if ((nbchars < MINLEN) && (len <= 0))
+                 goto done;
+ 
++            if (nbchars >= INT_MAX) {
++                out->error = XML_ERR_INTERNAL_ERROR;
++                return(-1);
++            }
+ 	    /*
+ 	     * second write the stuff to the I/O channel
+ 	     */
+@@ -3667,15 +3675,25 @@
+      */
+     if ((out->conv != NULL) && (out->encoder != NULL) &&
+ 	(out->writecallback != NULL)) {
++        size_t bufsize = xmlBufUse(out->conv);
++        if (bufsize >= INT_MAX) {
++            out->error = XML_ERR_INTERNAL_ERROR;
++            return(-1);
++        }
+ 	ret = out->writecallback(out->context,
+                                  (const char *)xmlBufContent(out->conv),
+-                                 xmlBufUse(out->conv));
++                                 bufsize);
+ 	if (ret >= 0)
+ 	    xmlBufShrink(out->conv, ret);
+     } else if (out->writecallback != NULL) {
++        size_t bufsize = xmlBufUse(out->buffer);
++        if (bufsize >= INT_MAX) {
++            out->error = XML_ERR_INTERNAL_ERROR;
++            return(-1);
++        }
+ 	ret = out->writecallback(out->context,
+                                  (const char *)xmlBufContent(out->buffer),
+-                                 xmlBufUse(out->buffer));
++                                 bufsize);
+ 	if (ret >= 0)
+ 	    xmlBufShrink(out->buffer, ret);
+     }
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index ec4b41bde53..1363beba7a5 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -37,6 +37,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86140.patch \
            file://CVE-2026-86141.patch \
            file://CVE-2026-86142.patch \
+           file://CVE-2026-86143.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

