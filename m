Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BECC79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:06:09 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24043.1789070762694860039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bi+7zTor;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca12086c06eso241550a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789070762; x=1789675562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4LIWfBpkvMPnbNgj4fOm4ZuHW5jJUCnqEHtQoBcuw=;
        b=bi+7zTorUSAWNZHOu6dLbZyxoV3pNyxbAJ9EhEvNGSfbDD7MoxQN2V8hrLatCN9AI1
         UzHS1WRXTJZbtAqpiT91USA5CevERIyLV59dA3s+zrMkIvs0nUhPCmnncxcLT1bi7djy
         KEPP8wXK2RTYE/hz+BqvY359YsPkdUyQEuUjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070762; x=1789675562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4y4LIWfBpkvMPnbNgj4fOm4ZuHW5jJUCnqEHtQoBcuw=;
        b=KAxDzoO6k53TM8sY6Iirw/06NXstFUxRZ1Z44rydaJZKy202qUnzr48kdd0VptVAuK
         Z0uerioNrea+8NobB4gFJ/HyEr0YGW9rFoahAJ+SYS78HAfwywXAjfl/b17cU8dVfN1a
         0c40AUUCOcOJdenzgT47mtdA/wJ4WOvE1kIww1RkKrjEcjtNhQIzjExH+/7/eJ+yVCIH
         pLPDY9nilnXk9hvFYqwODq42kczC7TN6atvxGA1/uFhSLqEh/1wzxqVt4zg0EXpX67lX
         HHxDt/8MBUI883vH6SX43HJuIi0M+hCFJbJCXTQhE5mhlyKX+ffFZla4jeoFmHLna1c2
         vElA==
X-Gm-Message-State: AFuF++k5FqlzU6oypwoZ/BqKYat2aKmGv36L2CDf4U4obfv695Pv6r2p
	/QDZCDOKZJjV5dNBWeoPO0+EjNcqn1noW7qWC499lKIG9xgIeOpUX/WGtxwL6VpqxPJF8GAa5nd
	m7p4t
X-Gm-Gg: AYBFou07136L5pMH1bPkxClQYYiFb78bq4yJuy+hWRaDACAza8keDOtto1lhEu/lOem
	l4gdzS0Q+yEAbEBQ9NJmy2s/9SLlULH4WkSF2wtFRUlJ5Mo4HinURiRbfs+c1x6PWY4GDNjpghg
	RJj5M9+/kgsJI1SaB1zTxP2xfNqjo2Nvagc0/OerXxLenvLHLM2wF2IICK0E9Zr+sqeRe4K1TB0
	7LGtKidJy9XHN2G+biKEv19XkicqcojKA48p1D70A3CynEYDG3bYzhuBNaGJ6IpybHuZVd+4CKU
	PZS+UJYk6j8UH8VXRvO0fQSlaKKL9oolJVgm5/hD6/wF1tpvZZraxaNzJprYTedUqo+t9hZ77DS
	nYi9zBlUVJZCeDU52OK0R2xrjzto9lTtKguoezl4VcqhmTGpyey9/8du+ZNLg+yKIRjMAx57rcy
	FrVc724SWICixnDSsKJd79a/H+cuqMOkoTPVw4f4csn0hEeuz9Fx2A1e32+qAr1XRQ5oBRmm68p
	rNVBGj2ow==
X-Received: by 2002:a17:90b:57e6:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39d9bec3f25mr618228a91.9.1789070762041;
        Thu, 10 Sep 2026 13:06:02 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm527974eec.3.2026.09.10.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:06:01 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 6/6] libxml2: Security Fix for CVE-2026-86143
Date: Fri, 11 Sep 2026 01:33:29 +0530
Message-Id: <20260910200329.842463-6-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910200329.842463-1-sdoshi@mvista.com>
References: <20260910200329.842463-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245598

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-86143
[2] https://security-tracker.debian.org/tracker/CVE-2026-86143

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/libxml2/CVE-2026-86143.patch       | 61 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
new file mode 100644
index 0000000000..e3f1197e2d
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
@@ -0,0 +1,61 @@
+From 90f293ba74d28b1d570920382e707586f68ebf35 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 09:54:34 +0200
+Subject: [PATCH] xmlIO: Check for int overflow before calling writecallback
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1111
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/90f293ba74d28b1d570920382e707586f68ebf35]
+CVE: CVE-2026-86143
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ xmlIO.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/xmlIO.c b/xmlIO.c
+index 95d2715..a117228 100644
+--- a/xmlIO.c
++++ b/xmlIO.c
+@@ -3378,6 +3378,11 @@ xmlOutputBufferWrite(xmlOutputBufferPtr out, int len, const char *buf) {
+             if ((nbchars < MINLEN) && (len <= 0))
+                 goto done;
+ 
++            if (nbchars >= INT_MAX) {
++                out->error = XML_ERR_INTERNAL_ERROR;
++                return(-1);
++            }
++
+ 	    /*
+ 	     * second write the stuff to the I/O channel
+ 	     */
+@@ -3667,15 +3672,25 @@ xmlOutputBufferFlush(xmlOutputBufferPtr out) {
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
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 2869aa46ac..a15de5d353 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -36,6 +36,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
            file://CVE-2026-86141.patch \
+           file://CVE-2026-86143.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.34.1


