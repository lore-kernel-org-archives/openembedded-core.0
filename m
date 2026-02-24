Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DEDE9B272
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21267.1771943099133048308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M0VE/0W2;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso48933525e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943097; x=1772547897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPuWQzdZf6pBkj+hVHddUrYzpKTxu+qNAuxGmm6yU2I=;
        b=M0VE/0W2qKKpEGiFhcS2R+EzmqgOdK0kOPOKCeOCBf6Zy8mNbetaEDO7rH1xmHDlh5
         FytoF35QfXPMDN5exoiUbSSPwhQDSDakNMwNNJ3QZhf7C/LrKM2dUFfh/gspzO9EZphE
         Z7VFqtuUyu4ywWjlUGb6vc+UVbKoW1VlJUHSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943097; x=1772547897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BPuWQzdZf6pBkj+hVHddUrYzpKTxu+qNAuxGmm6yU2I=;
        b=Q9JPsRGzpBfalLAcwMfk0eKU+2RXL7q7ClvgqfJ0uJsRZW/hjHzoJpLzvBuap4GT5u
         PdMi+0PDAa+itAWMeKXyet9GgYE9jlSO3NTQG95fGyTo/rJwBSaVKe2f/19sLAHAaoEQ
         fCiEXVhbT5knBm+jFsaYz5tLGOK/fEfEprEWw/8OfgA9ewEURMJn12lKAyLPaVcFIwta
         x6JHQT7dWF7WoGjTXITU8Vr4j7QgaTzwGSpO3QFVnfTOorkELS7cEungprISYm5GB64X
         5QxPF3Fpq/r2YDbaox0BB9mCtp6HSQAHxaHNWeTlr+gdVCPMwEStN3wBukF/7lqorDLW
         Bx4w==
X-Gm-Message-State: AOJu0Yxwfcej/MNTV6MR3iffY/QsyHhxEhRpWBp3yW1qEAayYGSZjTl4
	VGFd2zxbJIJq47bxSXS9BaxUXGg8U13DIJkRIstkUW+X8fZ+RNpDyQJqHSowFxv9o3EkFnt8wSw
	yGTKl
X-Gm-Gg: AZuq6aL5qSkxUAFEnnWmnokNe+pI8nD0rqZZHGffSycmrkErpGRdkwHiMWDO7HnyrGU
	D092JAfXJrk5Nj9tirr62GYwbSJUoWnFhS0N38Ym47xuquBIo1HWElPH3FyesW1kYYTQo7OJpFC
	EV9Bto033SXVhKAmxuSAiPsc41eP4aF1r1ZxDek2NF1khFEQ0KSxjJwQJ9gwQ6nyQrOW9htJ1S1
	BWIWYMv8HwMgXKerUdN+Gce470HMZnmmSWtqA6MrmnV46HZNyL81EWsa91TctoPc5vz2FCbQW21
	h7mVrQh4qHKb8WWAMslQY5tG7xMfKCfMeh2ggmC4T7lH2TStjAk48cS1WEhMym0Y+tMePjlAP6+
	/0OtP4M1UiCpLbqytMzFzrDzwmuwYCq+zwURkqfDSHtWzPnto05LV2IDHPuRTRaYHeoC717k2gH
	2CE2d4TWdd7k+du/HCk76JalIyV0Dcf4EONIQhmsVTf7n/X8ztmddIeh9BJtF76cDaemvpRsb+K
	SQAOeAB7svXj1HrssFEFH5W1eOfqrCWkw==
X-Received: by 2002:a05:600c:1396:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-483adc6aaebmr156115305e9.23.1771943097193;
        Tue, 24 Feb 2026 06:24:57 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:56 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/38] libxml2: patch CVE-2026-0992
Date: Tue, 24 Feb 2026 15:23:57 +0100
Message-ID: <c48f44cb3b0fc2f05d61246a989cf8fd49ea6eaf.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231771

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].
Adapt for missing xmlCatalogPrintDebug per [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/728869809eb7eee1b1681d558b4b506a8019c151

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-0992.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
new file mode 100644
index 00000000000..d7c0b47b339
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
@@ -0,0 +1,49 @@
+From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 19 Dec 2025 11:02:18 +0100
+Subject: [PATCH] catalog: Ignore repeated nextCatalog entries
+
+This patch makes the catalog parsing to ignore repeated entries of
+nextCatalog with the same value.
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
+
+CVE: CVE-2026-0989
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c60400f3ff18988d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ catalog.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/catalog.c b/catalog.c
+index 46b877e6..fa6d77ca 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -1279,9 +1279,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
+ 		BAD_CAST "delegateURI", BAD_CAST "uriStartString",
+ 		BAD_CAST "catalog", prefer, cgroup);
+     } else if (xmlStrEqual(cur->name, BAD_CAST "nextCatalog")) {
++	xmlCatalogEntryPtr prev = parent->children;
++
+ 	entry = xmlParseXMLCatalogOneNode(cur, XML_CATA_NEXT_CATALOG,
+ 		BAD_CAST "nextCatalog", NULL,
+ 		BAD_CAST "catalog", prefer, cgroup);
++	/* Avoid duplication of nextCatalog */
++	while (prev != NULL) {
++	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
++		(xmlStrEqual (prev->URL, entry->URL)) &&
++		(xmlStrEqual (prev->value, entry->value)) &&
++		(prev->prefer == entry->prefer) &&
++		(prev->group == entry->group)) {
++		    if (xmlDebugCatalogs)
++			fprintf(stderr,
++			    "Ignoring repeated nextCatalog %s\n", entry->URL);
++		    xmlFreeCatalogEntry(entry, NULL);
++		    entry = NULL;
++		    break;
++	    }
++	    prev = prev->next;
++	}
+     }
+     if (entry != NULL) {
+         if (parent != NULL) {
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index a72aff6c83d..bf3099c1f42 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -45,6 +45,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-9714.patch \
            file://CVE-2025-7425.patch \
            file://CVE-2026-0990.patch \
+           file://CVE-2026-0992.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

