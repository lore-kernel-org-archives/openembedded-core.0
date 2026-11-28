Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5764.1795866880502030117
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 03:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gKpcbPj5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202611281154389109ab52be000207b6-vbyedh@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202611281154389109ab52be000207b6
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Nov 2026 12:54:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qJY8WlhzQY3zBI+BeBlWfibzHYpoEEj2N51X0TosjwI=;
 b=gKpcbPj5H9paftj/4Q8+XugUoxD3eoVpIPVkpNYooxm68k92Zwo1+W3oLMk6dMSA1010Ld
 pc4oLXstittYuUM0Em6JRcUWQBGOPSgO6dxrYvqI8Js41MykzXCoIHhB8NtUqKVIAqW0f0T/
 GmrhH4lgb3MJTb8rxDHt/g5EK/BMqgBdjXz49zksQYdGvgKQAZRUkl92w/ip0iv7vo5OqOeO
 iy1ymLdmC4mq/hP7/cvtFKmunoG42+Et6tDd8kjIE7LsZphwkACMO2O8iz45i0SyQ0CE5HsI
 U7XrQhEj8SZv8U8axPbA47MZDHExP7jGm5ds05U8aH8fZCrzzy3wX8Zw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/2] gnutls: patch CVE-2026-127039
Date: Sat, 28 Nov 2026 12:53:57 +0100
Message-ID: <20261128115358.3079735-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251494
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gnutls/gnutls/CVE-2026-127039.patch       | 65 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-127039.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-127039.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-127039.patch
new file mode 100644
index 00000000000..798aaa20140
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-127039.patch
@@ -0,0 +1,65 @@
+From 0cf60141ca2c1289e96847261ff355010cb6f3a8 Mon Sep 17 00:00:00 2001
+From: Zoltan Fridrich <zfridric@redhat.com>
+Date: Mon, 4 May 2026 11:33:15 +0200
+Subject: [PATCH] _gnutls_pcert_to_auth_info: always zeroize cert list after
+ cleaning it up
+
+Fixes: #1863
+Fixes: CVE-2026-127039
+Fixes: GNUTLS-SA-2026-11-18-1
+Severity: Low
+Introduced-in: bb3bc56370e3b291219695bec5d4e1cbfc3241be 2.5.9
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+
+CVE: CVE-2026-127039
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/0cf60141ca2c1289e96847261ff355010cb6f3a8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/auth/cert.c | 21 ++++++++-------------
+ 1 file changed, 8 insertions(+), 13 deletions(-)
+
+diff --git a/lib/auth/cert.c b/lib/auth/cert.c
+index 71f87c237..fbdc84036 100644
+--- a/lib/auth/cert.c
++++ b/lib/auth/cert.c
+@@ -83,31 +83,26 @@ enum CertificateSigTypeFlags {
+ int _gnutls_pcert_to_auth_info(cert_auth_info_t info, gnutls_pcert_st *certs,
+ 			       size_t ncerts)
+ {
+-	size_t i, j;
+-
+ 	if (info->raw_certificate_list != NULL) {
+-		for (j = 0; j < info->ncerts; j++)
+-			_gnutls_free_datum(&info->raw_certificate_list[j]);
++		for (size_t i = 0; i < info->ncerts; i++)
++			_gnutls_free_datum(&info->raw_certificate_list[i]);
+ 		gnutls_free(info->raw_certificate_list);
+ 	}
++	info->raw_certificate_list = NULL;
++	info->ncerts = 0;
+ 
+-	if (ncerts == 0) {
+-		info->raw_certificate_list = NULL;
+-		info->ncerts = 0;
++	if (ncerts == 0)
+ 		return 0;
+-	}
+ 
+ 	info->raw_certificate_list =
+ 		gnutls_calloc(ncerts, sizeof(gnutls_datum_t));
+-	if (info->raw_certificate_list == NULL) {
+-		gnutls_assert();
+-		return GNUTLS_E_MEMORY_ERROR;
+-	}
++	if (info->raw_certificate_list == NULL)
++		return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
+ 
+ 	info->cert_type = certs[0].type;
+ 	info->ncerts = ncerts;
+ 
+-	for (i = 0; i < ncerts; i++) {
++	for (size_t i = 0; i < ncerts; i++) {
+ 		info->raw_certificate_list[i].data = certs[i].cert.data;
+ 		info->raw_certificate_list[i].size = certs[i].cert.size;
+ 		certs[i].cert.data = NULL;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 7f7f9c9c05f..bb0c0881d65 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -62,6 +62,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42015.patch \
            file://CVE-2026-5260_p1.patch \
            file://CVE-2026-5260_p2.patch \
+           file://CVE-2026-127039.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
