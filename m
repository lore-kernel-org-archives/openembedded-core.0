Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B551CC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32438.1792040632080522820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NoJvJCPD;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a02718da81so38469515e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040630; x=1792645430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Au6EcgKK9qiy2aV1MpBay6nsK/H3a/qx4G9C++DnRk=;
        b=NoJvJCPDpF0KCpmaKGFplgHiD9Srnu0MuSGecODL7W9r2pxMmHbj5T7BfH66ujjS1b
         IkHPUVfX65NrG6C/fgEzhYh2uxZqKswKqScQU4g4r/gacFM33Y9Ic+SI8YU+qJrTNb90
         uZMK1eNiaLIAgS8K/bubBzF4+AL07YVLdDTWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040630; x=1792645430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5Au6EcgKK9qiy2aV1MpBay6nsK/H3a/qx4G9C++DnRk=;
        b=hD7857sUNHnotV9qtePzWPjRAdcyFqLonEZbzTNf9q36Em3WeQCKKg5vGh2W32xGOk
         tVxdNybsWr+mvmUvso8JHIpcP5brxo+oIQpKnEmi2YKFa4oo4BGvUiiXqBfxyRUqKjri
         xOih734oe7S/z/N/xphSgQ3d/msH6JaRkD1y2EJBKJ+ZydXDLgpudMdSAobjSnB1wq+m
         CkDeGUxpKG4uxtPyhIkAJJII/LykfcwHj000vLPpbqhudAt3RYifAH7nqHEEqkA69OyY
         ZQPjKl4sLaA7hQMimljow8lBajt8HpQT2+LxilH1IQTV0WFBiWfdsvV9lYXISP6NYYcq
         83jQ==
X-Gm-Message-State: AFq9FYKzq8D0Vu4h0kWn3xT9puQjRnsLKKOL3tH+W+vcEXlsRKFBjsct
	PjqOaazUA9Mpmq326S8lSrIRYbGLdF+anFQG3myxnBoI7NslHC/fGX+cG5i+lYIfNJZ1AVJglcB
	SGPZuitQ=
X-Gm-Gg: AYBFou2yulb0paBlP2kuJR3JClMXin5ovdBMDzVdDhIqnc0fB/yYcCWoatP4v6132HA
	/alyoaH5LMRisA/ChKkQYNjB4Si2qu8fsT7PR6iR+0LlCY5g/VE4nI9T0wHmh09FvIhX6VK2Cug
	Vd9kKZkvVOoi4IFuZE7TVg4BV7ua/MhZ7DffKLti0vo7TZKXssXXOaxMcMZqmNjlwITDLwj2Y+D
	vAPFRoFAnC9SrS92I5b4P4Vi4XRqiEZyodpBYZg/sE6sbkWFITfYOv5rLO3L0xrRwBCS+OcYZEx
	1zaBipi3TcCKG6zXBpbTGnkVZvW5QjUuxgedMDfhplBlYLYGUC358YAo4+Df0WKk85jPOyR31bd
	mdDH6b/xnp7HufVtxD5x82khLsT921gxPZylM9EhjD7nF7GP9PRzDw7eltG5XBYPVHuN0ptZxqp
	xiy20yyH9ikzNfTbm3D+cGmn6OWTgjLdnvGoQwsiRECU98n9Hid5YwiBVEWIPjfYzNK9owNvTFW
	l9IFtzEOpDG3XIbLnGPtEXMwxlimsKLAqcVFNh6HEomwKjWjAuV3mZWHdGpp4lCmZWN6yvsR0m3
	GmC68RZW
X-Received: by 2002:a05:600c:19ca:b0:4a0:2484:2800 with SMTP id 5b1f17b1804b1-4a18e4464famr343319725e9.3.1792040630165;
        Wed, 14 Oct 2026 22:03:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/55] libxml2: Fix CVE-2026-86142
Date: Thu, 15 Oct 2026 07:02:42 +0200
Message-ID: <a74451908109e3d0f01767ae20addcb099e0c1b1.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247817

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/6b3a736c0edc74ceec3d82f5252499d7911b3a58
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86142

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-86142.patch       | 40 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
new file mode 100644
index 00000000000..33081886492
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
@@ -0,0 +1,40 @@
+From 51f0e78349cbbc9081f14e02f440733e5880fb3d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 09:32:43 +0200
+Subject: [PATCH] xpointer: Check overflow in xmlXPtrEvalXPtrPart
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1113
+
+CVE: CVE-2026-86142
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/6b3a736c0edc74ceec3d82f5252499d7911b3a58]
+
+Backport Changes:
+- Use xmlXPathErr(ctxt, XPATH_MEMORY_ERROR) because the Scarthgap xpointer
+  implementation does not provide the newer xmlXPathPErrMemory() call shape.
+  This preserves the XPath parser error state as well as reporting the
+  allocation failure.
+
+(cherry picked from commit 6b3a736c0edc74ceec3d82f5252499d7911b3a58)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xpointer.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/xpointer.c b/xpointer.c
+index 6e1e5f46..f5457c9f 100644
+--- a/xpointer.c
++++ b/xpointer.c
+@@ -956,6 +956,13 @@ xmlXPtrEvalXPtrPart(xmlXPathParserContextPtr ctxt, xmlChar *name) {
+     level = 1;
+ 
+     len = xmlStrlen(ctxt->cur);
++    /* Overflow in xmlStrlen */
++    if (len == 0 && ctxt->cur != NULL && *ctxt->cur != 0) {
++        xmlXPathErr(ctxt, XPATH_MEMORY_ERROR);
++        xmlFree(name);
++        return;
++    }
++
+     len++;
+     buffer = (xmlChar *) xmlMallocAtomic(len);
+     if (buffer == NULL) {
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 240e8fe670d..ec4b41bde53 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -36,6 +36,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
            file://CVE-2026-86141.patch \
+           file://CVE-2026-86142.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

