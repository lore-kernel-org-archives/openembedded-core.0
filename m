Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFA0C19F53
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11724.1713948186426477783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j5iS+VS1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948187; x=1745484187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YH8tOv/xzJKF2a3ocBlxgR0mS2xqxUy/U5/bchpGS/I=;
  b=j5iS+VS1Mj4+IzTy3a/02OrAzdwwNPYKrgb66klGm9lY19HbwnXi6eem
   n9e4nBsV+q5MQZVVXISY7ZoKwpMGEAPKdWJrnbP93d5bOSmYnfZMVPNcS
   Bf5xJCyVbAgGg6fScp7t3uo5tI15qtcMmMQkWJKYyhjhNVodR96HEYMtG
   wLpgIvvT1QHAfr9sQDpuA94PiKuIkmbxq0Xf2k3UW12GE8CXglOMnfTx1
   5/xSW0E/pvbWKi7i2XNlzI5yK2YIiqm09AOhVzVQJM9SxMB/tGmAxn9hw
   Rvc2E11Gx/pQFZr1dHCxHWpmuTge/vqb1Fl+5uqt51Ig7iL8Vn45/R1ev
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156433047"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156433047"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:04 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20E9AC53CD
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55875B9756
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E259F1EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8C4FF1A000B;
	Wed, 24 Apr 2024 16:43:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/38] openssl: upgrade 3.2.1 -> 3.3.0
Date: Wed, 24 Apr 2024 16:42:12 +0800
Message-Id: <1713948152-13501-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--15.102500-10.000000
X-TMASE-MatchedRID: 82BO9bqjodKjz0nOeth/yTo39wOA02LhcDzcoONn/M5MjJKuXxh7ttY/
	hgbdWWH6XE3LyuW0+wgSuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKaeVUcz8XpiS9E3yuY9BGW8rl8eCd8viB1T7Td
	r4xDxETZJuj05Xh1XatAMgxjhokNQem6t5POZ8lB1kSRHxj+Z5o1w71GqO6rlihF8VC1pMMsWPk
	qE2liZRIhQJ2uth6aAUcjRQHTlUIJdW3P+FD/5OutvHF25zoU9jibYbm9O0sEENV4Lwnu7BI+G7
	5C0Bkulc9jylaywpkEo7SH8hmYCaUq9vuuyb5cORgPzABkqxIBQK/sD1nu4xtEh/ibLfCukDi63
	s495/bMcXhwnugUkoY018kD9GAOEC1Snffkn6a6jbQtmGrUiJa9qiaDSLgo2pTkI0HK8zpew6pG
	OSdYi8WyXEB937q1d5OPD8XJFfpB8TzIzimOwPa9+JVKonO7cNX1NatttCayq2rl3dzGQ1WRPZZ
	hsAEo9+w/HIYobqoRExqnbIBjrsAw0AQcbKajeJet+0uNHyQg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198663

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2024-2511.patch
revmoed since it's included in 3.3.0

Changelog:
 https://github.com/openssl/openssl/blob/openssl-3.3.0/NEWS.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssl/openssl/CVE-2024-2511.patch       | 120 ------------------
 .../{openssl_3.2.1.bb => openssl_3.3.0.bb}    |   3 +-
 2 files changed, 1 insertion(+), 122 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.1.bb => openssl_3.3.0.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
deleted file mode 100644
index 8772f716d5..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From e9d7083e241670332e0443da0f0d4ffb52829f08 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Tue, 5 Mar 2024 15:43:53 +0000
-Subject: [PATCH] Fix unconstrained session cache growth in TLSv1.3
-
-In TLSv1.3 we create a new session object for each ticket that we send.
-We do this by duplicating the original session. If SSL_OP_NO_TICKET is in
-use then the new session will be added to the session cache. However, if
-early data is not in use (and therefore anti-replay protection is being
-used), then multiple threads could be resuming from the same session
-simultaneously. If this happens and a problem occurs on one of the threads,
-then the original session object could be marked as not_resumable. When we
-duplicate the session object this not_resumable status gets copied into the
-new session object. The new session object is then added to the session
-cache even though it is not_resumable.
-
-Subsequently, another bug means that the session_id_length is set to 0 for
-sessions that are marked as not_resumable - even though that session is
-still in the cache. Once this happens the session can never be removed from
-the cache. When that object gets to be the session cache tail object the
-cache never shrinks again and grows indefinitely.
-
-CVE-2024-2511
-
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/24043)
-
-CVE: CVE-2024-2511
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e9d7083e241670332e0443da0f0d4ffb52829f08]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- ssl/ssl_lib.c            |  5 +++--
- ssl/ssl_sess.c           | 28 ++++++++++++++++++++++------
- ssl/statem/statem_srvr.c |  5 ++---
- 3 files changed, 27 insertions(+), 11 deletions(-)
-
-diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
-index 4afb43bc86e54..c51529ddab5bb 100644
---- a/ssl/ssl_lib.c
-+++ b/ssl/ssl_lib.c
-@@ -4457,9 +4457,10 @@ void ssl_update_cache(SSL_CONNECTION *s, int mode)
- 
-     /*
-      * If the session_id_length is 0, we are not supposed to cache it, and it
--     * would be rather hard to do anyway :-)
-+     * would be rather hard to do anyway :-). Also if the session has already
-+     * been marked as not_resumable we should not cache it for later reuse.
-      */
--    if (s->session->session_id_length == 0)
-+    if (s->session->session_id_length == 0 || s->session->not_resumable)
-         return;
- 
-     /*
-diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
-index 3dcc4d81e5bc6..1fa6d17c46863 100644
---- a/ssl/ssl_sess.c
-+++ b/ssl/ssl_sess.c
-@@ -127,16 +127,11 @@ SSL_SESSION *SSL_SESSION_new(void)
-     return ss;
- }
- 
--SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
--{
--    return ssl_session_dup(src, 1);
--}
--
- /*
-  * Create a new SSL_SESSION and duplicate the contents of |src| into it. If
-  * ticket == 0 then no ticket information is duplicated, otherwise it is.
-  */
--SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-+static SSL_SESSION *ssl_session_dup_intern(const SSL_SESSION *src, int ticket)
- {
-     SSL_SESSION *dest;
- 
-@@ -265,6 +260,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-     return NULL;
- }
- 
-+SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
-+{
-+    return ssl_session_dup_intern(src, 1);
-+}
-+
-+/*
-+ * Used internally when duplicating a session which might be already shared.
-+ * We will have resumed the original session. Subsequently we might have marked
-+ * it as non-resumable (e.g. in another thread) - but this copy should be ok to
-+ * resume from.
-+ */
-+SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-+{
-+    SSL_SESSION *sess = ssl_session_dup_intern(src, ticket);
-+
-+    if (sess != NULL)
-+        sess->not_resumable = 0;
-+
-+    return sess;
-+}
-+
- const unsigned char *SSL_SESSION_get_id(const SSL_SESSION *s, unsigned int *len)
- {
-     if (len)
-diff --git a/ssl/statem/statem_srvr.c b/ssl/statem/statem_srvr.c
-index 853af8c0aa9f9..d5f0ab091dacc 100644
---- a/ssl/statem/statem_srvr.c
-+++ b/ssl/statem/statem_srvr.c
-@@ -2445,9 +2445,8 @@ CON_FUNC_RETURN tls_construct_server_hello(SSL_CONNECTION *s, WPACKET *pkt)
-      * so the following won't overwrite an ID that we're supposed
-      * to send back.
-      */
--    if (s->session->not_resumable ||
--        (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode & SSL_SESS_CACHE_SERVER)
--         && !s->hit))
-+    if (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode & SSL_SESS_CACHE_SERVER)
-+            && !s->hit)
-         s->session->session_id_length = 0;
- 
-     if (usetls13) {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.2.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.3.0.bb
index d37b68abbb..2cdaf4c75d 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
@@ -13,14 +13,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://bti.patch \
-           file://CVE-2024-2511.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39"
+SRC_URI[sha256sum] = "53e66b043322a606abf0087e7699a0e033a37fa13feb9742df35c3a33b18fb02"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


