Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B88C83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:06:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.8381.1751619962057090637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bpS+vuWL;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-237e6963f63so5372625ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1751619961; x=1752224761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TdkYktev4swcqR2fO4A3fr35x0bDlIudcq8wErX9Bw=;
        b=bpS+vuWLm+GlvBjSqtifFiXtNlAZYXUFZ6VNzbQUK+9b0kIpiSUDnJfBQp8hJd9bKz
         Qk+bIDd+Q1jad6E8LlVVGm8MSL/MYyPcrVO+QKQEDdnM+KYkCp6wIc5Qv2TLQU1aPE9j
         74oADHabFWcgaYSiCfmg5L070pGSNGY2Z68rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619961; x=1752224761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TdkYktev4swcqR2fO4A3fr35x0bDlIudcq8wErX9Bw=;
        b=ohaAuXSxWhQUEJ9rMhO3q5CaMiEZEcJS31Fr2rOFq/jJ6blyqwiFFxqmS6hpg+zbrS
         xqMCa2kq6IOCodDAmHy/YfyigjA9UBc/2AHz8iGGdOYms3hvCV4vNE47DAgQkhjjnnx1
         UCnDx0ozw26bW7UCSN9c2qup+iX0ltRPogYLbH/sBokKQ0esx42UWTOsJpeJO9KahZgf
         HWqGl/vdA521oNAyBJNw1oQGMfYVFKCiG0edduOcBEfo8y4Zi2iCItQhPT5NmLuEYJgK
         ilrAhltKcWAv+0erXS6EoTlaXeIjfZq8PD84ZxwcoeReo/Nt8xegXvCD0XFlZLZJYVYi
         tnlQ==
X-Gm-Message-State: AOJu0YyHrn90I15xaEOASxfnsn2sPdD7LIpyhl2hAlilsCoI/G62M7dT
	r7K/Wu2ePES6QKMluAIeSP5829fU5TfVtTOMKgW5Um9czjOxoqBUdch5mUw7bLg0RzOBAQkKLJ+
	KnPbi
X-Gm-Gg: ASbGncvia41M+EXiDrxvE9ZF7Y5R0HwNAeNMM3MZPK4BjBgXuToZcm/pwjIKRjMbC6y
	92glE4NOgdUWwHR/GvKuky31uOKsUUtqQQX8BxeYwQGqXhJVRkE8gKJwKFh9YoHUJ3Eyz3nm7DB
	CHmVOc51l89zXOBRGf1aFE5IUPihxCYgTMR+EGD+TCwIz0zeZXg4bcMDiJ8S0CkeiWGbDn1z4MP
	06SjQMsAQ5nVgavvBVqItuaI/Tv2CRDSLhb4WBfTH1RnnWQ6cJ09Te5hKpn9z1tGcomH5t1J9Hn
	uPZc11f0jyZgwWAOvk+oSNPtu1SFrOz+dJgdv1aY8UrllM0862Z+I3eEIUTHM1+BCuWTO+Dgin0
	=
X-Google-Smtp-Source: AGHT+IFIxemZ+CGriAi1eZ1Lv+XZRBLJvCF92RMhbJ6Iuj5bq736Ahb9EH/7/tMZhx9FOhZHoX39rw==
X-Received: by 2002:a17:902:d511:b0:235:779:edfa with SMTP id d9443c01a7336-23c8754b163mr22985035ad.32.1751619961293;
        Fri, 04 Jul 2025 02:06:01 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459e14bsm16512325ad.228.2025.07.04.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:06:00 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libxml2: fix CVE-2025-6021
Date: Fri,  4 Jul 2025 14:35:42 +0530
Message-ID: <20250704090542.619026-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219906

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 56 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
new file mode 100644
index 0000000000..e28a9edb74
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -0,0 +1,56 @@
+From acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
+
+This issue affects memory safety.
+
+Fixes #926. 
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
+CVE: CVE-2025-6021
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tree.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index dc3ac4f..f89e3cd 100644
+--- a/tree.c
++++ b/tree.c
+@@ -47,6 +47,10 @@
+ #include "private/error.h"
+ #include "private/tree.h"
+ 
++#ifndef SIZE_MAX
++#define SIZE_MAX ((size_t) -1)
++#endif
++
+ int __xmlRegisterCallbacks = 0;
+ 
+ /************************************************************************
+@@ -216,16 +220,18 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
+ xmlChar *
+ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 	      xmlChar *memory, int len) {
+-    int lenn, lenp;
++    size_t lenn, lenp;
+     xmlChar *ret;
+ 
+-    if (ncname == NULL) return(NULL);
++    if ((ncname == NULL) || (len < 0)) return(NULL);
+     if (prefix == NULL) return((xmlChar *) ncname);
+ 
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
+ 	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
+ 	if (ret == NULL) {
+ 	    xmlTreeErrMemory("building QName");
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 2eea65732b..1ecac70b4c 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -20,6 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
+           file://CVE-2025-6021.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.49.0


