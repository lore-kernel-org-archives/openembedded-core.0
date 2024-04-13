Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E61C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 22:50:11 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.22215.1713048607842806974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 15:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VcU28fd0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240413225004d89fd9d9243b97d9d6-pdt6ef@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240413225004d89fd9d9243b97d9d6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 14 Apr 2024 00:50:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=GgOKKwQy/g4nAFxintwJLep0dxvRg+Ok1Bktf033MmY=;
 b=VcU28fd0zpMtKEqDC3/Uhm5xsEWQJp0lxKCd6MjhVSvgbFaaqtZDxXe5p3wAzylTMWe6Aw
 /HMbd9w7gaNNIX8nd/IUj1P5azpF3y0TVA9XeHJQmzocbw5Ole41x36f0AefNVFuqrOHZxS8
 EFJHWnjVwjVZaMMouVOAxBiX81OY8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: openssl: patch CVE-2024-2511
Date: Sun, 14 Apr 2024 00:49:17 +0200
Message-Id: <20240413224917.1772877-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 22:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198203

From: Peter Marko <peter.marko@siemens.com>

Patch: https://github.com/openssl/openssl/commit/e9d7083e241670332e0443da0f0d4ffb52829f08
News: https://github.com/openssl/openssl/commit/b7acb6731a96b073d6150465bd090e2052a595c2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/openssl/CVE-2024-2511.patch       | 120 ++++++++++++++++++
 .../openssl/openssl_3.2.1.bb                  |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
new file mode 100644
index 0000000000..8772f716d5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
@@ -0,0 +1,120 @@
+From e9d7083e241670332e0443da0f0d4ffb52829f08 Mon Sep 17 00:00:00 2001
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
+(Merged from https://github.com/openssl/openssl/pull/24043)
+
+CVE: CVE-2024-2511
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e9d7083e241670332e0443da0f0d4ffb52829f08]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ssl/ssl_lib.c            |  5 +++--
+ ssl/ssl_sess.c           | 28 ++++++++++++++++++++++------
+ ssl/statem/statem_srvr.c |  5 ++---
+ 3 files changed, 27 insertions(+), 11 deletions(-)
+
+diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
+index 4afb43bc86e54..c51529ddab5bb 100644
+--- a/ssl/ssl_lib.c
++++ b/ssl/ssl_lib.c
+@@ -4457,9 +4457,10 @@ void ssl_update_cache(SSL_CONNECTION *s, int mode)
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
+index 3dcc4d81e5bc6..1fa6d17c46863 100644
+--- a/ssl/ssl_sess.c
++++ b/ssl/ssl_sess.c
+@@ -127,16 +127,11 @@ SSL_SESSION *SSL_SESSION_new(void)
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
+@@ -265,6 +260,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
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
+index 853af8c0aa9f9..d5f0ab091dacc 100644
+--- a/ssl/statem/statem_srvr.c
++++ b/ssl/statem/statem_srvr.c
+@@ -2445,9 +2445,8 @@ CON_FUNC_RETURN tls_construct_server_hello(SSL_CONNECTION *s, WPACKET *pkt)
+      * so the following won't overwrite an ID that we're supposed
+      * to send back.
+      */
+-    if (s->session->not_resumable ||
+-        (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode & SSL_SESS_CACHE_SERVER)
+-         && !s->hit))
++    if (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode & SSL_SESS_CACHE_SERVER)
++            && !s->hit)
+         s->session->session_id_length = 0;
+ 
+     if (usetls13) {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
index c7134c54db..d37b68abbb 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://bti.patch \
+           file://CVE-2024-2511.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.30.2


