Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9FBC5DF90
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10319.1787155064446924415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CjoPAtMe;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so14678065e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155063; x=1787759863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RDnQKNGHozSTLpDSOkxqi2+vsOJzmJwcxxNnUS6cyFc=;
        b=CjoPAtMe60qq9dQEF/oLcIRorKwEc0UN5yc//5tZaiEP1auuGaER/clNds98n7PKVD
         cAu4/1x5anRXTKH5UC7o6DRelOxKVm5X9HQUM+zstl+jlf4UvRu8AJFN2BdNoELIkXKV
         UNxjQcNCnrlCV1RzTwtC8IrQHjnyhXLkRA+Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155063; x=1787759863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RDnQKNGHozSTLpDSOkxqi2+vsOJzmJwcxxNnUS6cyFc=;
        b=QcnKm9pc+scZ5qrIlQkIQLjxKVzgqcpwbtNIP29yHwQvsf4IWQdztOeSAQ7z7yKtas
         Al7znoWu6UxoX/KNPvw5VZljA2H0bf7LExmc4Q+qij1hqj5U5Vw9lQOSKtKwqXhFDhs+
         7YhQzEmRwBWZM8WhXC1+S9NUUsZzc8g6qwb4T75slwOFNl5uRmp2gsa4h6KJua7P7UL7
         e4XVsnk5DjzhQDipQhAkp+/8u5dNQZwgWinpV5s3pz5wsLzrZafFXAKWQpS7KDGL/aT6
         SWrnLrRGw8UfGqmfBBzblsRSWRpVigXmGYxUTba53MwBzzg5oYO0TXhPbTmbLGyBQSB4
         vuUA==
X-Gm-Message-State: AOJu0YzL20mDOwXEN5z0PH4Wva6f6KMkzt2fjLvzlBnzodNntD6N/4T+
	k4bSziNQYaVJkcBRodX75lnQFRCJbSivvAOR61Knfm3cU5AUyD8qpDEYEZO9YSllx2eQWK43oSc
	pR6Wtejo=
X-Gm-Gg: AR+sD10q/dZRNuS7YxNVs0nokNHWOnyTB3ZunVmVbaGURcpZW8R1LlFfxAXRdSpIk5V
	qcO2RWx+2FO52jJCgkxQGOxQcitKz2lwRGOYqEzKP6YulQvTjZQ2F+UP7mZXacbHJ/o7XYroYN3
	ySj4ryQ5IcreBWrDgK6B+IOmYQyET/JKz3Ak58GSFdStuO+Ay2PP/khaXd6q/a6F98u9IvvA98O
	PhmUKbd98htitQIKsAC7fbDLHyD6EyJHINz2VY2Oi9/0VFSU7lkOkNnoPDtFO24cPx+opQ1J7IS
	UHB3ZGTolX0pbLmAsEUCP1a//+oREN1+IwdhfMnpxk6epU7YJjDHpQZ+I1wRlXOarFrlMtksglK
	HACGiVV+H+flTp/9yNwETgaRhciVlME98M/R7520K8na7ZdtmapO1yBrZDwlKMFAPK5EmefXeuW
	lZ+pIHfIvconJmOl3Pw8BjW1ql+w+oZl4dPIKj+rGCnf/69XPJaQ+NDYkRgwkcLi8qz8K0m1QhY
	aHNszaoaS7uQ78lMKT5cpdVraprs2mu99Y8KC78dYaWD+YA1/PavJOLNf/OfSIo5abfGspvsQjb
	MjuBz5OleMMZcWfmabOWs2C6AUtNy40T9s7f9+igiYzdJA==
X-Received: by 2002:a05:600c:4754:b0:499:7f38:d77 with SMTP id 5b1f17b1804b1-499aa1659edmr82514835e9.6.1787155062623;
        Wed, 19 Aug 2026 08:57:42 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:42 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/37] expat: fix CVE-2026-56404
Date: Wed, 19 Aug 2026 17:56:40 +0200
Message-ID: <2dd880612a13f4f56b181d903219184684797224.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243745

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56404

(From OE-Core rev: 5ac52606f2aae12323b29026e3d8af24a9c278bf)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56404.patch          | 45 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56404.patch b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
new file mode 100644
index 00000000000..bd5f99742b7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
@@ -0,0 +1,45 @@
+From d8e09a54fa9214e64d8e73057ca6918d08857022 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Thu, 28 May 2026 12:44:11 +0530
+Subject: [PATCH 04/17] lib: protect function addBinding from signed integer
+ overflow
+
+CVE: CVE-2026-56404
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164]
+
+(cherry picked from commit babfc48090977cbf7be24b2c48f6053dca75c164)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 12bbe23e..9d21e136 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4456,6 +4456,10 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   }
+ 
+   for (len = 0; uri[len]; len++) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     if (isXML && (len > xmlLen || uri[len] != xmlNamespace[len]))
+       isXML = XML_FALSE;
+ 
+@@ -4496,8 +4500,13 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   if (isXMLNS)
+     return XML_ERROR_RESERVED_NAMESPACE_URI;
+ 
+-  if (parser->m_namespaceSeparator)
++  if (parser->m_namespaceSeparator) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     len++;
++  }
+   if (parser->m_freeBindingList) {
+     b = parser->m_freeBindingList;
+     if (len > b->uriAlloc) {
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 7fe81749095..5e3aef3b7ea 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -64,6 +64,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
+           file://CVE-2026-56404.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

