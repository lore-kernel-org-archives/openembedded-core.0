Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C7CC87FCC
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 18:01:31 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.64534.1753639287556968931
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mL/GPTud;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250727180125090eac2856df781d46-enctcu@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250727180125090eac2856df781d46
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Jul 2025 20:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=unSSrS7/H1Kz7q67feHyS/nWyQRmaYunIA8URkvhWnY=;
 b=mL/GPTudQDlzXbAHvDI+p7CwOFNdebmQd8kBRCv6pvHeZYOkCQcUciqNdphwWnO8mIJOYu
 yUFA1oQ3/19u1RL5p3j8sQpehPlqW+4jzVBi0BRILpXAbX4qG3d8zyUP7PvCTZY4QaNWOV/G
 omB7CMy0b/Cva9gXzRz+HNL9wQAZPmCJFuql3voMNxUzSyMk/u6vxFSH+bOvpL3954RX7O37
 h9aaU5JZnPG1LzzEYYcUiUkC5pMxV8d5gmDux0055rrmoKk81MojIVEWHpU/iWL7fVYXtIfJ
 npiOfX0zFKDku/NczUJ+Zop1/AZXdpgsBfczv9LT44bUBDQUREm2D08g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 4/6] gnutls: patch CVE-2025-32988
Date: Sun, 27 Jul 2025 19:59:55 +0200
Message-Id: <20250727175957.67078-4-peter.marko@siemens.com>
In-Reply-To: <20250727175957.67078-1-peter.marko@siemens.com>
References: <20250727175957.67078-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 18:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220967

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gnutls/gnutls/CVE-2025-32988.patch        | 58 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
new file mode 100644
index 0000000000..4779787bc3
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
+ * Version 3.7.4 (released 2022-03-17)
+ 
+ ** libgnutls: Fixed double free during verification of pkcs7 signatures.
+diff --git a/lib/x509/extensions.c b/lib/x509/extensions.c
+index 6c2da8fd1..e8be12eaf 100644
+--- a/lib/x509/extensions.c
++++ b/lib/x509/extensions.c
+@@ -805,7 +805,6 @@ _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, oid, 1);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
+@@ -814,7 +813,6 @@ _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, data, data_size);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 65e42c00c2..33553e617e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
            file://0001-x509-reject-zero-length-version-in-certificate-reque.patch \
            file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
+           file://CVE-2025-32988.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"

