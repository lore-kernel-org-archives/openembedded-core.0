Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4E3C87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 17:51:01 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.64351.1753638659736746645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 10:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Adm0rYc9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250727175057cd71c792fcd027ae66-a16cr_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250727175057cd71c792fcd027ae66
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Jul 2025 19:50:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2S/17yCVJS71cekzU26SymGi/6inzj3Smkrp2rDucbY=;
 b=Adm0rYc9zAqe40DJcebSYS9JGsvTUcjKbCIhCVEm50H/MCkBw6DuLI/i+Lpp3bsfI/ZVO6
 JY/v3eKlPEyHZO4hbBGGbXo5Ob2TKrgOswmH4ZyRAXMUy0z8jJYhoBB5LCxrszpEO4dtJ99H
 9QKDv7fhAIxbcDRP+ZH4mAo/2Q6qpyblL80YSPm2Ix0zdTAkYxYeCAljAPWj0BUrtsg0dr9F
 ML4OFhd2myiWMmNDnzgkMHg/R2qVMMs99MRBmBChdskCwMzcA3b/Q9Qb8YbZ2j00KYNnG4tc
 UzNFlOzbVTBik/5ga6rVhvdWUBM7zXKf3DbBXjCjw0LDNx69b8PXxMYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH v2 4/6] gnutls: patch CVE-2025-32988
Date: Sun, 27 Jul 2025 19:49:17 +0200
Message-Id: <20250727174919.4188529-4-peter.marko@siemens.com>
In-Reply-To: <20250727174919.4188529-1-peter.marko@siemens.com>
References: <20250727174919.4188529-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 17:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220961

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gnutls/gnutls/CVE-2025-32988.patch        | 58 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
new file mode 100644
index 0000000000..007dfb2309
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
@@ -0,0 +1,58 @@
+From 608829769cbc247679ffe98841109fc73875e573 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Mon, 7 Jul 2025 10:44:12 +0900
+Subject: [PATCH] x509: avoid double free when exporting othernames in SAN
+
+Previously, the _gnutls_write_new_othername function, called by
+gnutls_x509_ext_export_subject_alt_names to export "otherName" in a
+certificate's SAN extension, freed the caller allocated ASN.1
+structure upon error, resulting in a potential double-free.
+
+Reported by OpenAI Security Research Team.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2025-32988
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/608829769cbc247679ffe98841109fc73875e573]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                  | 5 +++++
+ lib/x509/extensions.c | 2 --
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 025e05148..ff289fa75 100644
+--- a/NEWS
++++ b/NEWS
+@@ -10,6 +10,11 @@ See the end for copying conditions.
+    and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
+    CVSS: medium] [CVE-2025-32989]
+ 
++** libgnutls: Fix double-free upon error when exporting otherName in SAN
++   Reported by OpenAI Security Research Team. [GNUTLS-SA-2025-07-07-2,
++   CVSS: low] [CVE-2025-32988]
++
++
+ * Version 3.8.4 (released 2024-03-18)
+ 
+ ** libgnutls: RSA-OAEP encryption scheme is now supported
+diff --git a/lib/x509/extensions.c b/lib/x509/extensions.c
+index 6c2da8fd1..e8be12eaf 100644
+--- a/lib/x509/extensions.c
++++ b/lib/x509/extensions.c
+@@ -754,7 +754,6 @@ int _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, oid, 1);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
+@@ -763,7 +762,6 @@ int _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, data, data_size);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 2a73a1e3d8..9644f3c50e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
            file://0001-x509-reject-zero-length-version-in-certificate-reque.patch \
            file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
+           file://CVE-2025-32988.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

