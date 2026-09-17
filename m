Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3189CC982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1699.1789682900335825205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mDPAVWhp;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so541985e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682899; x=1790287699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7HQ3NbKdyxyer5ZP0mDlp7aQgKZf68WgcCmQEi49HhU=;
        b=mDPAVWhptH5vRbDd0BbwVV94nCEQEBAT5vItBVEuG37W+UrQEkeeLlP7C9bUCdw2oN
         Wq3ouc5CPi+3YZvLQz1EWCMjfSVxGHEOUO+QidMlzsuxhhG8vVVJRjq2/xtxs/7TCdcL
         xXuRScS27iB2CzmA4Ixo3bYh0Ej73uiEEW8/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682899; x=1790287699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7HQ3NbKdyxyer5ZP0mDlp7aQgKZf68WgcCmQEi49HhU=;
        b=Cc0I7dJiyg9gJ4x0dvjRk0HIdWR/0cm2V4T7icXq18GRNZSGA/CYYGcvQqgX6zgR4k
         jmsTEXk16eX+0HQRFU0EqLYVbrwJWwCiTV5uL46io8OaW9ECDRBCPh+JOcmA/2N/0IAk
         oITrkfA4bLsH+BWGSaNdPTbkmVrxt9xzQk0zYDsuQSLG+lR1vpQM89TXQF9ZhaQm+Ty+
         qnBMeD5yWS/QUoY9Jro5QpAw0RHBsPyAGGboniax/BBWTd0kyVgFzYayDGBj5uw4qmA9
         xmC4682/2R9MRCuF/BOsQj7kZDmlw9hG9+cSq4j/2SddpBbTY2UvqjzoC+QIBy87dYDZ
         AYYw==
X-Gm-Message-State: AFuF++nqTNPy9SM9H8PEZRIiIXdBkXFctHvy+H4AvkFrNs4a9qYYeE4h
	9LgSZhUY7lgb+Ei0jINhexZmOO5ZrJRfMXv2Dr9gCpUUVcY/Luyt7Q3bgd073YMvL7iX5bYRF4h
	zvQbxiHs=
X-Gm-Gg: AYBFou0yX55sa52jwxxXsxBDcqzq22kuGPdUdkS/76wrZvSgX0AWBy+DWwOBHMcks+X
	wYMfgPJQKTThDPnvsG6mvLi8A4SNkQhCPfouv2ELTp2J/O5kheqvdal1OkCS/lXte7zFjiAwW1V
	Pjx3K8hxzQfwcOOti6OfqORdY/WxO7pXTzCChX1erIt7og4sjq2SQB4IUf6rq52iquwA+Riv4dI
	JE8uzeriGu8y/ld9RN0h3+JNsyJyG1Ylb1qaDMWKzrXujFJKOujMHSPf1wX4jLEjwNMcD+NIYmb
	h/pnABKZY5EN1+3AtFWx/KFVNey4vJCOI/R681qCR3SUowiswDyYwfSIFp/D9YpFeJwvsOgJPMA
	jSCnhPFlibufsTxb99zatIsxgmfv4ked6pm+6UC2T7AhtF9hW6TqtXbWUJW3p3tFBqLSA1pjLnp
	PvDbPLAZcOCJCxlG7BvpWurrbAM1BhtNlKpY/4QBBdnWw1VzsJVuZ7IUpcOG9ek3cPJ6603dAwc
	XOoqOHoefVPsTaHf/PereAJ5DQGaqGx5k8u/uqDsDPwfUBKz9QynxFIgwdtK9rte/eRSyENGwMV
	6ec7dpQI+A==
X-Received: by 2002:a05:600c:1c01:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49fc5753eb2mr3757075e9.22.1789682898519;
        Thu, 17 Sep 2026 15:08:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 54/79] curl: patch CVE-2026-9545
Date: Fri, 18 Sep 2026 00:06:39 +0200
Message-ID: <5afccc91ad2a4db1428241fa848bcbb471853b75.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246149

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Also pick additional patch for a clean cherry-pick.

[1] https://curl.se/docs/CVE-2026-9545.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-9545-01.patch          | 157 ++++++++++++++++++
 .../curl/curl/CVE-2026-9545-02.patch          |  67 ++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9545-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9545-02.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9545-01.patch b/meta/recipes-support/curl/curl/CVE-2026-9545-01.patch
new file mode 100644
index 00000000000..5325c51e5e7
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
index 00000000000..4fc60eb5c9a
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
index 4f28b63a746..3695f8d083d 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -32,6 +32,8 @@ SRC_URI = " \
     file://CVE-2026-7009.patch \
     file://CVE-2026-8925.patch \
     file://CVE-2026-9080.patch \
+    file://CVE-2026-9545-01.patch \
+    file://CVE-2026-9545-02.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

