Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD13C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:39:26 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29449.1787683162818111389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jToJDaPB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202608251839217ac60f165b00020785-pnloqe@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608251839217ac60f165b00020785
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 20:39:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5hDsqwAHHRrs9xy2dP9F+vnoTXVAtReA7Is4vTcif5A=;
 b=jToJDaPBi4hws+h0h+aXZ3wj3E7xc38ez6Bwm3aLRB64Jttt1zNaaHDGTIuSTm84HKzLeX
 kkA4AaEh7e6ctzYkfR9zlyxpyGxBdUfRGQfnrUu9LgXNVDagunF/8i38kLPqeWo/mNHa9Up/
 BzmvxtDQviqhUpza4Z2tJL7LNIzCVKejUqm+V0OepeCdMfpwzja9NCL1MH4NrKXKEPKilv5w
 j/++AbPoMCQbXxAaBnpEhPwML9yiTnj0fIKW+1Ka3E2OnoIwUXEPn4MtfOcT4LhHjMeMM9Gq
 CaZWLkCkTGI9quhP6ulTfeNQwmMr1nU5Mm7lOWbjyno2KTBwoMx5ZDew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 4/5] curl: patch CVE-2026-9545
Date: Tue, 25 Aug 2026 20:38:52 +0200
Message-ID: <20260825183853.1017950-4-peter.marko@siemens.com>
In-Reply-To: <20260825183853.1017950-1-peter.marko@siemens.com>
References: <20260825183853.1017950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244259

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Also pick additional patch for a clean cherry-pick.

[1] https://curl.se/docs/CVE-2026-9545.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-9545-01.patch          | 157 ++++++++++++++++++
 .../curl/curl/CVE-2026-9545-02.patch          |  67 ++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9545-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9545-02.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9545-01.patch b/meta/recipes-support/curl/curl/CVE-2026-9545-01.patch
new file mode 100644
index 0000000000..5325c51e5e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9545-01.patch
@@ -0,0 +1,157 @@
+From 41aaac61e215a827619b896d5b8588200cfdae28 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 18 Mar 2026 11:37:18 +0100
+Subject: [PATCH] lib: always use Curl_1st_fatal instead of Curl_1st_err
+
+Curl_1st_err() does not return the second error if the first result is
+CURLE_AGAIN. This may cause errors to not become noticeable when they
+should be.
+
+Replace all use of Curl_1st_err() with Curl_1st_fatal(), which handles
+CURLE_AGAIN as a not-a-real-error case.
+
+Closes #20980
+
+CVE: CVE-2026-9545
+Upstream-Status: Backport [https://github.com/curl/curl/commit/41aaac61e215a827619b896d5b8588200cfdae28]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/easy.c              | 6 ++++--
+ lib/http.c              | 2 +-
+ lib/multi.c             | 2 +-
+ lib/url.c               | 5 -----
+ lib/url.h               | 7 -------
+ lib/vquic/curl_ngtcp2.c | 6 +++---
+ lib/vquic/curl_quiche.c | 4 ++--
+ 7 files changed, 11 insertions(+), 21 deletions(-)
+
+diff --git a/lib/easy.c b/lib/easy.c
+index 2c653b00e9..5a5dac4f56 100644
+--- a/lib/easy.c
++++ b/lib/easy.c
+@@ -1157,12 +1157,14 @@ CURLcode curl_easy_pause(CURL *d, int action)
+   if((send_paused != send_paused_new) ||
+      (send_paused_new != Curl_creader_is_paused(data))) {
+     changed = TRUE;
+-    result = Curl_1st_err(result, Curl_xfer_pause_send(data, send_paused_new));
++    result = Curl_1st_fatal(
++      result, Curl_xfer_pause_send(data, send_paused_new));
+   }
+ 
+   if(recv_paused != recv_paused_new) {
+     changed = TRUE;
+-    result = Curl_1st_err(result, Curl_xfer_pause_recv(data, recv_paused_new));
++    result = Curl_1st_fatal(
++      result, Curl_xfer_pause_recv(data, recv_paused_new));
+   }
+ 
+   /* If not completely pausing both directions now, run again in any case. */
+diff --git a/lib/http.c b/lib/http.c
+index aa34b5d14f..96e7b0de0c 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -4135,7 +4135,7 @@ static CURLcode http_on_response(struct Curl_easy *data,
+ out:
+   if(last_hd) {
+     /* if not written yet, write it now */
+-    result = Curl_1st_err(
++    result = Curl_1st_fatal(
+       result, http_write_header(data, last_hd, last_hd_len));
+   }
+   if(conn_changed) {
+diff --git a/lib/multi.c b/lib/multi.c
+index 482c160fde..685bb01f0c 100644
+--- a/lib/multi.c
++++ b/lib/multi.c
+@@ -718,7 +718,7 @@ static CURLcode multi_done(struct Curl_easy *data,
+   }
+ 
+   /* Make sure that transfer client writes are really done now. */
+-  result = Curl_1st_err(result, Curl_xfer_write_done(data, premature));
++  result = Curl_1st_fatal(result, Curl_xfer_write_done(data, premature));
+ 
+   /* Inform connection filters that this transfer is done */
+   Curl_conn_ev_data_done(data, premature);
+diff --git a/lib/url.c b/lib/url.c
+index a9ef60709a..cd06d6c626 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3875,11 +3875,6 @@ void *Curl_conn_meta_get(struct connectdata *conn, const char *key)
+   return Curl_hash_pick(&conn->meta_hash, CURL_UNCONST(key), strlen(key) + 1);
+ }
+ 
+-CURLcode Curl_1st_err(CURLcode r1, CURLcode r2)
+-{
+-  return r1 ? r1 : r2;
+-}
+-
+ CURLcode Curl_1st_fatal(CURLcode r1, CURLcode r2)
+ {
+   if(r1 && (r1 != CURLE_AGAIN))
+diff --git a/lib/url.h b/lib/url.h
+index 09bc33390f..0afa7eb26e 100644
+--- a/lib/url.h
++++ b/lib/url.h
+@@ -92,16 +92,9 @@ bool Curl_conn_seems_dead(struct connectdata *conn,
+ CURLcode Curl_conn_upkeep(struct Curl_easy *data,
+                           struct connectdata *conn);
+ 
+-/**
+- * Always eval all arguments, return the first result != CURLE_OK.
+- * A non-short-circuit evaluation.
+- */
+-CURLcode Curl_1st_err(CURLcode r1, CURLcode r2);
+-
+ /**
+  * Always eval all arguments, return the first
+  * result != (CURLE_OK|CURLE_AGAIN) or `r1`.
+- * A non-short-circuit evaluation.
+  */
+ CURLcode Curl_1st_fatal(CURLcode r1, CURLcode r2);
+ 
+diff --git a/lib/vquic/curl_ngtcp2.c b/lib/vquic/curl_ngtcp2.c
+index ea79eaf747..04f660ac63 100644
+--- a/lib/vquic/curl_ngtcp2.c
++++ b/lib/vquic/curl_ngtcp2.c
+@@ -1461,8 +1461,8 @@ static CURLcode cf_ngtcp2_recv(struct Curl_cfilter *cf, struct Curl_easy *data,
+   result = CURLE_AGAIN;
+ 
+ out:
+-  result = Curl_1st_err(result, cf_progress_egress(cf, data, &pktx));
+-  result = Curl_1st_err(result, check_and_set_expiry(cf, data, &pktx));
++  result = Curl_1st_fatal(result, cf_progress_egress(cf, data, &pktx));
++  result = Curl_1st_fatal(result, check_and_set_expiry(cf, data, &pktx));
+ denied:
+   CURL_TRC_CF(data, cf, "[%" PRId64 "] cf_recv(blen=%zu) -> %d, %zu",
+               stream ? stream->id : -1, blen, result, *pnread);
+@@ -1788,7 +1788,7 @@ static CURLcode cf_ngtcp2_send(struct Curl_cfilter *cf, struct Curl_easy *data,
+   result = cf_progress_egress(cf, data, &pktx);
+ 
+ out:
+-  result = Curl_1st_err(result, check_and_set_expiry(cf, data, &pktx));
++  result = Curl_1st_fatal(result, check_and_set_expiry(cf, data, &pktx));
+ denied:
+   CURL_TRC_CF(data, cf, "[%" PRId64 "] cf_send(len=%zu) -> %d, %zu",
+               stream ? stream->id : -1, len, result, *pnwritten);
+diff --git a/lib/vquic/curl_quiche.c b/lib/vquic/curl_quiche.c
+index a9a5ae6b99..4e8788aa1e 100644
+--- a/lib/vquic/curl_quiche.c
++++ b/lib/vquic/curl_quiche.c
+@@ -918,7 +918,7 @@ static CURLcode cf_quiche_recv(struct Curl_cfilter *cf, struct Curl_easy *data,
+     result = CURLE_AGAIN;
+ 
+ out:
+-  result = Curl_1st_err(result, cf_flush_egress(cf, data));
++  result = Curl_1st_fatal(result, cf_flush_egress(cf, data));
+   if(*pnread > 0)
+     ctx->data_recvd += *pnread;
+   CURL_TRC_CF(data, cf, "[%" PRIu64 "] cf_recv(len=%zu) -> %d, %zu, total=%"
+@@ -1144,7 +1144,7 @@ static CURLcode cf_quiche_send(struct Curl_cfilter *cf, struct Curl_easy *data,
+   }
+ 
+ out:
+-  result = Curl_1st_err(result, cf_flush_egress(cf, data));
++  result = Curl_1st_fatal(result, cf_flush_egress(cf, data));
+ 
+   CURL_TRC_CF(data, cf, "[%" PRIu64 "] cf_send(len=%zu) -> %d, %zu",
+               stream ? stream->id : (uint64_t)~0, len,
diff --git a/meta/recipes-support/curl/curl/CVE-2026-9545-02.patch b/meta/recipes-support/curl/curl/CVE-2026-9545-02.patch
new file mode 100644
index 0000000000..4fc60eb5c9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9545-02.patch
@@ -0,0 +1,67 @@
+From 7b9613fa9b1a5e04301a3920eef58e8138dad05e Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 21 May 2026 14:21:59 +0200
+Subject: [PATCH] ngtcp2: fail handshake directly
+
+When certificate verification fails, error out of the handshake
+callback, forcing ngtcp2 to stop processing the connection any further.
+
+Closes #21712
+
+CVE: CVE-2026-9545
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7b9613fa9b1a5e04301a3920eef58e8138dad05e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vquic/curl_ngtcp2.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vquic/curl_ngtcp2.c b/lib/vquic/curl_ngtcp2.c
+index 4d27ebc0c1..fb7fd61889 100644
+--- a/lib/vquic/curl_ngtcp2.c
++++ b/lib/vquic/curl_ngtcp2.c
+@@ -504,7 +504,7 @@ static int cf_ngtcp2_handshake_completed(ngtcp2_conn *tconn, void *user_data)
+   data = CF_DATA_CURRENT(cf);
+   DEBUGASSERT(data);
+   if(!ctx || !data)
+-    return NGHTTP3_ERR_CALLBACK_FAILURE;
++    return NGTCP2_ERR_CALLBACK_FAILURE;
+ 
+   ctx->handshake_at = *Curl_pgrs_now(data);
+   ctx->tls_handshake_complete = TRUE;
+@@ -512,6 +512,9 @@ static int cf_ngtcp2_handshake_completed(ngtcp2_conn *tconn, void *user_data)
+ 
+   ctx->tls_vrfy_result = Curl_vquic_tls_verify_peer(&ctx->tls, cf,
+                                                     data, &ctx->peer);
++  if(ctx->tls_vrfy_result)
++    return NGTCP2_ERR_CALLBACK_FAILURE;
++
+ #ifdef CURLVERBOSE
+   if(Curl_trc_is_verbose(data)) {
+     const ngtcp2_transport_params *rp;
+@@ -1463,6 +1466,8 @@ static CURLcode cf_ngtcp2_recv(struct Curl_cfilter *cf, struct Curl_easy *data,
+ out:
+   result = Curl_1st_fatal(result, cf_progress_egress(cf, data, &pktx));
+   result = Curl_1st_fatal(result, check_and_set_expiry(cf, data, &pktx));
++  if(ctx->tls_vrfy_result)
++    result = ctx->tls_vrfy_result;
+ denied:
+   CURL_TRC_CF(data, cf, "[%" PRId64 "] cf_recv(blen=%zu) -> %d, %zu",
+               stream ? stream->id : -1, blen, result, *pnread);
+@@ -1789,6 +1794,8 @@ static CURLcode cf_ngtcp2_send(struct Curl_cfilter *cf, struct Curl_easy *data,
+ 
+ out:
+   result = Curl_1st_fatal(result, check_and_set_expiry(cf, data, &pktx));
++  if(ctx->tls_vrfy_result)
++    result = ctx->tls_vrfy_result;
+ denied:
+   CURL_TRC_CF(data, cf, "[%" PRId64 "] cf_send(len=%zu) -> %d, %zu",
+               stream ? stream->id : -1, len, result, *pnwritten);
+@@ -2717,6 +2724,8 @@ static CURLcode cf_ngtcp2_connect(struct Curl_cfilter *cf,
+   }
+ 
+ out:
++  if(ctx->tls_vrfy_result)
++    result = ctx->tls_vrfy_result;
+   if(ctx->qconn &&
+      ((result == CURLE_RECV_ERROR) || (result == CURLE_SEND_ERROR)) &&
+      ngtcp2_conn_in_draining_period(ctx->qconn)) {
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 9de6b1c4dd..e228618cc3 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,8 @@ SRC_URI = " \
     file://CVE-2026-7009.patch \
     file://CVE-2026-8925.patch \
     file://CVE-2026-9080.patch \
+    file://CVE-2026-9545-01.patch \
+    file://CVE-2026-9545-02.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

