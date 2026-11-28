Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5681.1795866860504881746
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 03:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=W0GPoPFe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202611281154183803935e9900020711-pjoeuy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202611281154183803935e9900020711
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Nov 2026 12:54:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hqxS/pLpvb6lJfoJ90qfoR/LMbOsULFzHrd/FH9fFSk=;
 b=W0GPoPFe1qjW/hGY11sbXuOE/RxS6S0nHaneKXK2ogOGEgk0AnccHvesvUqEWsl6vZ0Xot
 RO6vGWzEIe/CCicmXw4C0+VmPXpXBP7h+bP6TMeaS2D1wVaRGMipMqgWqqkhJpQaFduKj3BD
 4qPEMz9V5h0Fh+3KMRRy3KYKb2Gc7eIyKSzcQykzRXlPeVI5YaAvbI1i+G4SU02ggSn5p/2H
 ewZFQ8yk9ceNnZ3XMDq2wXKv2xGwdxCuoze5nP9P7ngjJJ3f05vS84f3xfKwQGXnA8sbplLT
 WbMXM/hdmsOVqS9refovBRLfA0qE4tbZKF8+e93Md3tuKTmxlRd/28Jg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 3/3] gnutls: patch CVE-2026-127231
Date: Sat, 28 Nov 2026 12:53:35 +0100
Message-ID: <20261128115335.3079626-3-peter.marko@siemens.com>
In-Reply-To: <20261128115335.3079626-1-peter.marko@siemens.com>
References: <20261128115335.3079626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 11:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251491
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gnutls/gnutls/CVE-2026-127231.patch       | 57 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-127231.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-127231.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-127231.patch
new file mode 100644
index 00000000000..212b206571e
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-127231.patch
@@ -0,0 +1,57 @@
+From 95256a91bbf1e5f15f75bbd0454c7b05f7b4858a Mon Sep 17 00:00:00 2001
+From: Xuqing Yang <rigelyoung@icloud.com>
+Date: Fri, 21 Aug 2026 22:43:29 +0800
+Subject: [PATCH] x509: make name constraints deinitialization idempotent
+
+Clear list pointers after freeing them
+so that an allocation failure while reinitializing name constraints
+cannot leave dangling pointers for a later cleanup.
+
+Fixes: #1906
+Fixes: CVE-2026-127231
+Fixes: GNUTLS-SA-2026-11-18-3
+Severity: Low
+Introduced-in: 22cba2f35742cef9137de8f1bcbde6ef15e2e979 3.8.13
+Reported-by: Xuqing Yang <rigelyoung@icloud.com>
+Signed-off-by: Xuqing Yang <rigelyoung@icloud.com>
+
+CVE: CVE-2026-127231
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/95256a91bbf1e5f15f75bbd0454c7b05f7b4858a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/x509/name_constraints.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index dc6c33d9d..6769c4502 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -432,10 +432,14 @@ cleanup:
+ static void
+ name_constraints_node_list_deinit(struct name_constraints_node_list_st *list)
+ {
+-	if (list->items)
++	if (list->items) {
+ 		gl_list_free(list->items);
+-	if (list->sorted_items)
++		list->items = NULL;
++	}
++	if (list->sorted_items) {
+ 		gl_list_free(list->sorted_items);
++		list->sorted_items = NULL;
++	}
+ }
+ 
+ static struct name_constraints_node_list_st
+@@ -1161,8 +1165,10 @@ cleanup:
+ 
+ static void name_constraints_deinit(struct gnutls_name_constraints_st *nc)
+ {
+-	if (nc->nodes)
++	if (nc->nodes) {
+ 		gl_list_free(nc->nodes);
++		nc->nodes = NULL;
++	}
+ 	name_constraints_node_list_deinit(&nc->permitted);
+ 	name_constraints_node_list_deinit(&nc->excluded);
+ }
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 7bb32505451..eb852035e13 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            file://CVE-2026-127039.patch \
            file://CVE-2026-127040.patch \
+           file://CVE-2026-127231.patch \
            "
 
 SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
