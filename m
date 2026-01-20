Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E33D2ED1C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4167.1768908273991089872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2j6xkd0/;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4271513f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908272; x=1769513072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90ZvZMaaJ1sabYIEZdeZgTGC8ZA4Xpf9i/L6Cdqd4KU=;
        b=2j6xkd0/UREaRSSeYOwQnq5IewV2uTWFUmUwIjWur0pB4cjdvNco2PlbhpbM0aTYzn
         vg3szQC/TYt9CUF4BFhKyrnvDcjL7MC/ZS5pDa7Rmwh4U/3w9PWequHjxU8yQe6HYCTA
         S9IumUNzLO43PahQIUtyjVCZAsb6oxUsc3gxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908272; x=1769513072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=90ZvZMaaJ1sabYIEZdeZgTGC8ZA4Xpf9i/L6Cdqd4KU=;
        b=FX98mg8E/5PJDC4YJ9RsR4FZJY1uSI0/kkS+xO7rdORUsUV21DRgLCYrk3rh6DPSiA
         sWW87LQG8WGl8ffD9VFz7FLrLq+2Z/K88R9A5FAdZeWj6cdd8qPyvGZYo0Yu2pM8tekn
         Wgvph8Y9xKl5quHtdbBb692y6lW/9EkHpuVw6GJWFxlIVCa+HDnn0rKoicOCfHBOSvVj
         +91Lu9tCvK45cOu5O/60PoAu7rC4SNLfsugkvorQMktckuZIFHO5en+ZE4SLnfL8JRFb
         4zV0u8Y/JYBr+AC3QRelk7oDOMDowWctgbrK8j9MoPJ8fa7mI7VutNZVteHK/BXOd2Ij
         fWVA==
X-Gm-Message-State: AOJu0YyhxfXww6MxO87DH3vfCFzIHyHMv53inSjH409dAqmnZ4nt9cJW
	V7fLY7vrpXVNJ3zQ8WbnhJp0Hye0H58Injd145xGEzoN9ude9+JV8cNgAelLemuJjMX2OukAh1I
	VlmsP
X-Gm-Gg: AZuq6aLpAoQ++fLeNGQkVDA/khsKSCT0cGLadnbTDPRhM4aJVb0PyN+QEagAZ+NK/A1
	safnPgjSvVnsajNrFy8kvxQSQZlnJta4j87kx4ctRao3ZthI3WJ3rOg/6nnfnK5KvacJPYuFhkm
	BMawGsVgS2smqtsxKvsZFZlkqm5kBjXy5j7NHpTpOzaI0Vp+oWEq3rKGgc1Zk2JwiAJU1CHCL2Z
	hAH/9FI5KOaAkW6vzJ+mb/L/mVWuV6C2RA1LJuT3AoeOxnLtFr6ps0aiw9DSDsRbmgTxTId6h9q
	FSS1zqaE714gxm7jBCexwKiIRBKs8uaUW9FnNOK/7O42kQxTLyPkYfO+2t1HreXrtY7ksEtq4nC
	Dr9ymHWAs5dDPXNcgYdYU5vmBGTq+nVDe4+wZeFzNZDyNn1FybGz2fBv7OpTD4GSNXQwzyCkPMg
	iLd14iN7rtqr4FPG9XEs6/ImWPuwLeR8dzpOp2Sz4Pao0i+8eGNp66JUaBaXXLnf8413O2e26IE
	7aSSf+FlZwJ4JEA2LQYPAmWkYjxranC
X-Received: by 2002:a5d:5d8a:0:b0:430:fdb8:8510 with SMTP id ffacd0b85a97d-4358ff3212cmr2468319f8f.24.1768908272127;
        Tue, 20 Jan 2026 03:24:32 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/15] curl: patch CVE-2025-14819
Date: Tue, 20 Jan 2026 12:23:57 +0100
Message-ID: <2aa6e662c52bddae3d64672d498e9841d51c19dd.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229672

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14819.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

