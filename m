Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576A2C021A5
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:55:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.5694.1739429699386479075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g2eDIdZZ;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f48ebaadfso9575275ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1739429698; x=1740034498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UuCLvw/7bYFr6aQcPBO5AD+j/hQ2EqMKBG7AA0fXazM=;
        b=g2eDIdZZ12qLHvkyYhkO0ZLQmfheOxfppt/Iy/Rk9lLC0l7+uimWG3V3O4TBBIjK8r
         85t+3mimkaQe1K6i6lKQGZOSet1aKymthlDVQ5UxTIzSOLiiTmmsHTT5P98mSkWFS1jV
         M1cRffDGdnenrsBQVqY/WQFx2EKcRBwAO2U/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739429698; x=1740034498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuCLvw/7bYFr6aQcPBO5AD+j/hQ2EqMKBG7AA0fXazM=;
        b=AlcnRMH/Qjo7m0kZZr0/XzSlhY9pk39Efo8J3/jdqnB4ShcyDsGVd65vkCuLINzRWB
         tykB423Qyn6YqxtZM5lOAsuVEYZD5TVv6s5Uw8ELG/5e25SaYW4k2cis6MKnlBbU9U9M
         qy/vW6FTi2fJAnqtJLHxSMWDcUjL25rPBzhnO6GewksNeaoY63bO6OsITSUwIl3pg2Ep
         p9Oll3UWK3ag9rd+Jy2WqbNUDCBpCKf2+FVISfuPwjjtBVdq/TKEJ6ILYc1JcJTasAJT
         RlwVzp321vc/Vj3RZV3SfuL+79riKhDh+0lLeYzrkVrWUd/8JxRbayg1DmA9TtQcx0fK
         92nA==
X-Gm-Message-State: AOJu0YzxaakroSxJNy/dCpCyNAONkyKe9p2OW79Ot0zDAEVhGTJmOw2k
	NsMbPGPgYsY89Ofx39jfrdkoP+sO7F2vlLlzjMLXmOVC6HM5+WBULOZkAVXvTxfF7OJ8vocG3FX
	s
X-Gm-Gg: ASbGncupKMx6bev0s9bNtqyChMxUgh1jjBdC1dBmw43f93Muqc2vpf7C8x3MyhaBWtL
	lszETRIeRmKrsBCcBY01PYkrTgSrnX45Fw4F0zKTC71ebjE8ETD+rV0IjEHTV2clahrbHvuohMD
	CRGdJwW9JZ0NmqQuE7SpzMskeATyVM+zmkgmXmXr9wyxlZmNSXRno6eSzQUxDueFr7VcRqwBkg3
	MweLtKS0KyzdetkLsNPbXkMhi2uIovxTCm+XeBGb9oplVUBkITj7QibvJy1pf8bJhqtTrG+3bJe
	waq7TJ/ubMqnaXZnPbNNPqxa4S4b
X-Google-Smtp-Source: AGHT+IFTilRtrOKotkRvY5X7Qn4M4myRIkIFh8bCekyZ/FlQOwgHdP5VO1v/VEmGvI2vkPOG+y5Qjw==
X-Received: by 2002:a05:6a00:178d:b0:725:cfa3:bc6b with SMTP id d2e1a72fcca58-7322c3754admr11071190b3a.3.1739429698282;
        Wed, 12 Feb 2025 22:54:58 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882c:7b82:d7b:bcef:2304:ec71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e318sm567033b3a.96.2025.02.12.22.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 22:54:57 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libxml2: Fix for CVE-2022-49043
Date: Thu, 13 Feb 2025 12:24:47 +0530
Message-Id: <20250213065447.706872-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211302

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/5a19e21605398cef6a8b1452477a8705cb41562b]

Reference:
https://access.redhat.com/security/cve/cve-2022-49043

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libxml/libxml2/CVE-2022-49043.patch       | 38 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch
new file mode 100644
index 0000000000..25c7bc847c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch
@@ -0,0 +1,38 @@
+From 5a19e21605398cef6a8b1452477a8705cb41562b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 2 Nov 2022 16:13:27 +0100
+Subject: [PATCH] malloc-fail: Fix use-after-free in xmlXIncludeAddNode
+
+Found with libFuzzer, see #344.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/5a19e21605398cef6a8b1452477a8705cb41562b]
+CVE: CVE-2022-49043
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xinclude.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index e5fdf0f..36fa8ec 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -612,14 +612,15 @@ xmlXIncludeAddNode(xmlXIncludeCtxtPtr ctxt, xmlNodePtr cur) {
+     }
+     URL = xmlSaveUri(uri);
+     xmlFreeURI(uri);
+-    xmlFree(URI);
+     if (URL == NULL) {
+ 	xmlXIncludeErr(ctxt, cur, XML_XINCLUDE_HREF_URI,
+ 	               "invalid value URI %s\n", URI);
+ 	if (fragment != NULL)
+ 	    xmlFree(fragment);
++	xmlFree(URI);
+ 	return(-1);
+     }
++    xmlFree(URI);
+ 
+     if (xmlStrEqual(URL, ctxt->doc->URL))
+ 	local = 1;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 94b3b510ae..ecaae0b436 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-45322-2.patch \
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
+           file://CVE-2022-49043.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.25.1


