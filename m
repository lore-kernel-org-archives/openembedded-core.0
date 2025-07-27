Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AACC87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 15:28:10 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.61917.1753630087472451493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 08:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ndyVj6Os;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250727152805cbe7fa305ebc6fa843-zbs42x@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250727152805cbe7fa305ebc6fa843
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Jul 2025 17:28:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hxWQJdBGFfWQ5pfdfup9Rd4PNxUC9GUs/miwq8RbeHY=;
 b=ndyVj6OsCUZVT4Vx5tmqqUyQMMNuMKAML97oOxHfeuUsek0hrVSaEi4Sve0imvDOpQaHTz
 RRhfRDbFOm+nZ+C2hrSXskJm8YURA+3caJ8ckOjyIpDZoOGLeSssaq9Isil4WYK4JpMP5tdb
 zmUN85sKzIYKr+JjP76fbVCeMdDjdfaPORyhDV7krNcr/dm25FnZYDjOF2Cgbc7mB7h5pqZU
 ocds1tPCQCDUcyySDAA7DRowrsZdq0SpVtF/myhnnb2z9OR7BM5JGuWQl+dZgFzn+63IPkli
 UfbQLDdhQTUQysZLKGTZzaIfZ1rAL38VdaDGn+mn+7TFo5nJGa6fnlQQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 4/6] gnutls: patch CVE-2025-32988
Date: Sun, 27 Jul 2025 17:26:56 +0200
Message-Id: <20250727152658.3852964-4-peter.marko@siemens.com>
In-Reply-To: <20250727152658.3852964-1-peter.marko@siemens.com>
References: <20250727152658.3852964-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 15:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220950

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
index 0000000000..97839db269
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
+CVE:CVE-2025-32988
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

