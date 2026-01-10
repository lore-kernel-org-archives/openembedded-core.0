Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897E4D277F1
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:15 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12827.1768066626224847114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SjAZOoO7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202601101737085cee645c220002077c-fgxo55@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202601101737085cee645c220002077c
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=m58FGAU1Ls4a40ivE7Y3Fk7S4BfIZRPFv2Puh0oU8j0=;
 b=SjAZOoO7h+zKpQUkw62BNdadPpsPodUjjta4JTWmPNGLdjWaSVxyr4LAHASmMlkaCif2TF
 JLlAZkPbK/7wXNq+La0L4BXwTOsw0KWmaEMc6SZaixHXWL2+eZ7bp75dhVTqmunA4gYGFpUo
 NETYrluSofwi3qZIxI4Z9u0uX95wPoSWJ51IFcsVF/ucmfn/TVi4p+coXfnmCesJ0gOJoyDw
 kKPRnpbK18DpRJtMTb8SBo3i9XuOrUurSZy1VNWwscgVyGkEZKt6Rb5huL68Lo7bnLatoL/V
 hQi5agh8L7WWMwoikaBH90Z1J2NZs/nFawGvAdCNBepqr64J/2tgsmrw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 4/6] curl: patch CVE-2025-14819
Date: Sat, 10 Jan 2026 18:36:37 +0100
Message-Id: <20260110173639.1643322-4-peter.marko@siemens.com>
In-Reply-To: <20260110173639.1643322-1-peter.marko@siemens.com>
References: <20260110173639.1643322-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229155

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14819.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-14819.patch            | 73 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14819.patch b/meta/recipes-support/curl/curl/CVE-2025-14819.patch
new file mode 100644
index 0000000000..204f1d48f4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14819.patch
@@ -0,0 +1,73 @@
+From cd046f6c93b39d673a58c18648d8906e954c4f5d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 17 Dec 2025 10:54:16 +0100
+Subject: [PATCH] openssl: toggling CURLSSLOPT_NO_PARTIALCHAIN makes a
+ different CA cache
+
+Reported-by: Stanislav Fort
+
+Closes #20009
+
+CVE: CVE-2025-14819
+Upstream-Status: Backport [https://github.com/curl/curl/commit/cd046f6c93b39d673a58c18648d8906e954c4f5d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/openssl.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index a7f169d641..7563d9a090 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -3560,6 +3560,7 @@ struct ossl_x509_share {
+   X509_STORE *store;    /* cached X509 store or NULL if none */
+   struct curltime time; /* when the cached store was created */
+   BIT(store_is_empty);  /* no certs/paths/blobs are in the store */
++  BIT(no_partialchain); /* keep partial chain state */
+ };
+ 
+ static void oss_x509_share_free(void *key, size_t key_len, void *p)
+@@ -3594,12 +3595,16 @@ ossl_cached_x509_store_expired(const struct Curl_easy *data,
+ 
+ static bool
+ ossl_cached_x509_store_different(struct Curl_cfilter *cf,
++                                             const struct Curl_easy *data,
+                                  const struct ossl_x509_share *mb)
+ {
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
++  struct ssl_config_data *ssl_config =
++    Curl_ssl_cf_get_config(cf, CURL_UNCONST(data));
++  if(mb->no_partialchain != ssl_config->no_partialchain)
++    return TRUE;
+   if(!mb->CAfile || !conn_config->CAfile)
+     return mb->CAfile != conn_config->CAfile;
+-
+   return strcmp(mb->CAfile, conn_config->CAfile);
+ }
+ 
+@@ -3618,7 +3623,7 @@ static X509_STORE *ossl_get_cached_x509_store(struct Curl_cfilter *cf,
+                                  sizeof(MPROTO_OSSL_X509_KEY)-1) : NULL;
+   if(share && share->store &&
+      !ossl_cached_x509_store_expired(data, share) &&
+-     !ossl_cached_x509_store_different(cf, share)) {
++     !ossl_cached_x509_store_different(cf, data, share)) {
+     store = share->store;
+     *pempty = share->store_is_empty;
+   }
+@@ -3657,6 +3662,8 @@ static void ossl_set_cached_x509_store(struct Curl_cfilter *cf,
+ 
+   if(X509_STORE_up_ref(store)) {
+     char *CAfile = NULL;
++    struct ssl_config_data *ssl_config =
++      Curl_ssl_cf_get_config(cf, CURL_UNCONST(data));
+ 
+     if(conn_config->CAfile) {
+       CAfile = strdup(conn_config->CAfile);
+@@ -3675,6 +3682,7 @@ static void ossl_set_cached_x509_store(struct Curl_cfilter *cf,
+     share->store = store;
+     share->store_is_empty = is_empty;
+     share->CAfile = CAfile;
++    share->no_partialchain = ssl_config->no_partialchain;
+   }
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index ad9b7c9ab7..948769e0fb 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://CVE-2025-13034.patch \
     file://CVE-2025-14017.patch \
     file://CVE-2025-14524.patch \
+    file://CVE-2025-14819.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

