Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19308C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 22:27:01 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.21841.1713047210781766819
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 15:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ea2daEXk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202404132226479ecfeb32a354dcbeb4-ccvnec@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202404132226479ecfeb32a354dcbeb4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 14 Apr 2024 00:26:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZVn+az3eg9S8gDWyMHzhIq0tDoP4z7GTIvYnJ3Cm2+4=;
 b=Ea2daEXkEcpTshsUxWcxj+3+1T6O8Bdf1cHWIt285lMqkLLben31VEll5JQ8HqYDFIZCZg
 xm/HplBUsKiIu+H3R4Ci5duw/9ntqbPQrHaRg74Kt9QENlbpNbROlQcmidGCNtaHYqIrX54K
 Ss11RxdF9nHknIMUVWbWyq3norbpM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] openssl: patch CVE-2024-2511
Date: Sun, 14 Apr 2024 00:02:16 +0200
Message-Id: <20240413220216.1520282-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 22:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198202

From: Peter Marko <peter.marko@siemens.com>

Patch: https://github.com/openssl/openssl/commit/b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d
News: https://github.com/openssl/openssl/commit/daee101e39073d4b65a68faeb2f2de5ad7b05c36

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/openssl/CVE-2024-2511.patch       | 122 ++++++++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
new file mode 100644
index 0000000000..8aea686205
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
@@ -0,0 +1,122 @@
+From b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 5 Mar 2024 15:43:53 +0000
+Subject: [PATCH] Fix unconstrained session cache growth in TLSv1.3
+
+In TLSv1.3 we create a new session object for each ticket that we send.
+We do this by duplicating the original session. If SSL_OP_NO_TICKET is in
+use then the new session will be added to the session cache. However, if
+early data is not in use (and therefore anti-replay protection is being
+used), then multiple threads could be resuming from the same session
+simultaneously. If this happens and a problem occurs on one of the threads,
+then the original session object could be marked as not_resumable. When we
+duplicate the session object this not_resumable status gets copied into the
+new session object. The new session object is then added to the session
+cache even though it is not_resumable.
+
+Subsequently, another bug means that the session_id_length is set to 0 for
+sessions that are marked as not_resumable - even though that session is
+still in the cache. Once this happens the session can never be removed from
+the cache. When that object gets to be the session cache tail object the
+cache never shrinks again and grows indefinitely.
+
+CVE-2024-2511
+
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24044)
+
+(cherry picked from commit 7e4d731b1c07201ad9374c1cd9ac5263bdf35bce)
+
+CVE: CVE-2024-2511
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ssl/ssl_lib.c            |  5 +++--
+ ssl/ssl_sess.c           | 28 ++++++++++++++++++++++------
+ ssl/statem/statem_srvr.c |  5 ++---
+ 3 files changed, 27 insertions(+), 11 deletions(-)
+
+diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
+index 2c8479eb5fc69..eed649c6fdee9 100644
+--- a/ssl/ssl_lib.c
++++ b/ssl/ssl_lib.c
+@@ -3736,9 +3736,10 @@ void ssl_update_cache(SSL *s, int mode)
+ 
+     /*
+      * If the session_id_length is 0, we are not supposed to cache it, and it
+-     * would be rather hard to do anyway :-)
++     * would be rather hard to do anyway :-). Also if the session has already
++     * been marked as not_resumable we should not cache it for later reuse.
+      */
+-    if (s->session->session_id_length == 0)
++    if (s->session->session_id_length == 0 || s->session->not_resumable)
+         return;
+ 
+     /*
+diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
+index d836b33ed0e81..75adbd9e52b40 100644
+--- a/ssl/ssl_sess.c
++++ b/ssl/ssl_sess.c
+@@ -152,16 +152,11 @@ SSL_SESSION *SSL_SESSION_new(void)
+     return ss;
+ }
+ 
+-SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
+-{
+-    return ssl_session_dup(src, 1);
+-}
+-
+ /*
+  * Create a new SSL_SESSION and duplicate the contents of |src| into it. If
+  * ticket == 0 then no ticket information is duplicated, otherwise it is.
+  */
+-SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
++static SSL_SESSION *ssl_session_dup_intern(const SSL_SESSION *src, int ticket)
+ {
+     SSL_SESSION *dest;
+ 
+@@ -285,6 +280,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
+     return NULL;
+ }
+ 
++SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
++{
++    return ssl_session_dup_intern(src, 1);
++}
++
++/*
++ * Used internally when duplicating a session which might be already shared.
++ * We will have resumed the original session. Subsequently we might have marked
++ * it as non-resumable (e.g. in another thread) - but this copy should be ok to
++ * resume from.
++ */
++SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
++{
++    SSL_SESSION *sess = ssl_session_dup_intern(src, ticket);
++
++    if (sess != NULL)
++        sess->not_resumable = 0;
++
++    return sess;
++}
++
+ const unsigned char *SSL_SESSION_get_id(const SSL_SESSION *s, unsigned int *len)
+ {
+     if (len)
+diff --git a/ssl/statem/statem_srvr.c b/ssl/statem/statem_srvr.c
+index a9e67f9d32a77..6c942e6bcec29 100644
+--- a/ssl/statem/statem_srvr.c
++++ b/ssl/statem/statem_srvr.c
+@@ -2338,9 +2338,8 @@ int tls_construct_server_hello(SSL *s, WPACKET *pkt)
+      * so the following won't overwrite an ID that we're supposed
+      * to send back.
+      */
+-    if (s->session->not_resumable ||
+-        (!(s->ctx->session_cache_mode & SSL_SESS_CACHE_SERVER)
+-         && !s->hit))
++    if (!(s->ctx->session_cache_mode & SSL_SESS_CACHE_SERVER)
++            && !s->hit)
+         s->session->session_id_length = 0;
+ 
+     if (usetls13) {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
index 5e43fdc2de..3b253ddde0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2024-2511.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.30.2


