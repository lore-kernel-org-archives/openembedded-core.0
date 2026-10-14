Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BAACC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 16:12:34 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17957.1791994353599196132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 09:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jCanQmLa;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: jason.stasiak@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so3069392c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791994353; x=1792599153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fJ880M6/1Z0827ccc4DYh9lbkaQsCyAPB8UOtd2b+aQ=;
        b=jCanQmLaXKueHhg1rDmmCal7B3onX6SZg+OlLKeWefc4pqtj9zPqNFsZycKyveYRjK
         URK4ynkp6HIpYJFzScWK8yimPtfG+spdFWvcqmDe9xlpHXyBrdJtk1YMt9p3qmwbtfkN
         3tCGZL7oG2VQn+CkQyX8F7mm7qYVVMVKhkAih8j8ud8sLN1xNUmAPFluG5tykfNwr8J9
         TaNcg7QMcFrELMhtatvDJ3wwGkiDUjZfcZyYnn7Pe8WSbtmSIEJ8W2q98IWlYAsHdO1q
         WMLWHzpA/TY5wTutUrlALpAWWKo3Koatlmhpb45vbdL59rf6hfKdQHvI4VweGWhsolCv
         ybjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994353; x=1792599153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fJ880M6/1Z0827ccc4DYh9lbkaQsCyAPB8UOtd2b+aQ=;
        b=yraWOilgeLH90I7fIiHJ7VdEwPrZsMiouAzinEFhDfekxeF/oYkcASYp1goPeGJ3ZT
         l25KPki50IJvpkLNE8wuxKAl/HVyItzEv8FUbIjVp5+izVl1YBIcNSCbDVwvaQkNGKCW
         guXiTSQBmKUPA4h6GDkbiH6p47IrIBu94nHBbWRrmzyc9fV+Bi+IvyGIjsPulL8ueMim
         pYx7SLj/+RoYegnmOE1TEdTxL+7aX9v+ZDD9xZ5clSYXcd/rG5/FYwJ5tTZ08Q0suypS
         wN9++k9gqmGmF1VJS8BE5nJPPnqqK3XJ/rpuIT86qcjfRE7NXGTKw0fPzGaY7agxsQNL
         UxdA==
X-Gm-Message-State: AFq9FYJ46o3EZA2dKWxRjwSoIEdz5gh+qq0v8O2rBuscg5C0hr+jfAh1
	DTv7q2UwweRmJlY8uuimkuot3gPUnCvDXTGdgfodQj9WOALprpDWTxrsoPnwZA==
X-Gm-Gg: AYBFou2wDBRc4eQesnCtZcirDrjk0C4PIWXXKDecuuLGUqjea7RsqSjvJ1qB8xxPdq0
	xVUSHD7WWZ9G0b61iLDAU9h6OBDxSA3eoFM12GKESSVTMRZMXQdHq+bKAMUQu/vYoO6BTQsLdsi
	4rIg41qrOU0gKL6KQ6S5ryz+4xUo0oqXPFr5yHsq8DWSTHg4ihcR623ZKiiAdLuKfyPN6zuGQxQ
	mEOp0YEDdPWJvUequqC2I4OrPrmU5d31KHIPMucJA9vSwDsF3SKqc0SFHiT5Fpz0v9bQpbgaKbK
	JCk0cpDdQFU1j3HJmC2LW51oTgxjkwEOJh/iCboA8H4QO2Wsi2hMaO9qoYK/5uuJ0wkGFzzYxLy
	S9jIGFucBJAm3AKmE7YCKmWSjEuEadBxzQ4Xd6vOFw2ejhP1Ca/bAJ1w0YgIu5dmz+3xJKJ3Nwi
	cxau2vF6em3HITu+06+LDsZvFzWHRVOH2D4kj6bCE7S5tSYjd9gnPai1dJteY4aSSF8deTxbNbh
	3sYVqxBns/J7ccL91RM
X-Received: by 2002:a05:7022:3f0c:b0:151:2e62:fe8d with SMTP id a92af1059eb24-16a5dcf817bmr24141144c88.9.1791994352531;
        Wed, 14 Oct 2026 09:12:32 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm36006426eec.19.2026.10.14.09.12.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:12:32 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 1/5] libsoup-2.4: fix CVE-2026-1539
Date: Wed, 14 Oct 2026 09:12:05 -0700
Message-ID: <20261014161209.2227316-1-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929205055.2403390-2-jason.stasiak@gmail.com>
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 16:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247783

Backport fix for CVE-2026-1539 from meta-oe to OE-core.
Update CVE patch to restore the auth-redirect proxy validation
unit test from the upstream libsoup3 patch.

(From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)

Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
---
Changes since v1:
   - Resolved malformed patch lines

 .../libsoup/libsoup-2.4/CVE-2026-1539.patch   | 104 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
new file mode 100644
index 0000000000..2682c35a42
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
@@ -0,0 +1,104 @@
+From 285faea567e1e2a95226201175dbf745a64a2439 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 20 Mar 2026 15:04:22 +0800
+Subject: [PATCH 4/4] Also remove Proxy-Authorization header on cross origin
+ redirect
+
+Closes #489
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/98c1285d9d78662c38bf14b4a128af01ccfdb446]
+CVE: CVE-2026-1539
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Backport the auth-redirect proxy validation unit tests from the upstream
+libsoup3 patch
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-session.c |  1 +
+ tests/httpd.conf.in    |  1 +
+ tests/proxy-test.c     | 36 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 38 insertions(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index fadd5cd2..4cad0946 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1192,6 +1192,7 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
+ 	/* Strip all credentials on cross-origin redirect. */
+ 	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
+ 		soup_message_headers_remove (msg->request_headers, "Authorization");
++		soup_message_headers_remove (msg->request_headers, "Proxy-Authorization");
+ 		soup_message_set_auth (msg, NULL);
+ 	}
+ 
+diff --git a/tests/httpd.conf.in b/tests/httpd.conf.in
+index 93fb7ff4..e190b6f7 100644
+--- a/tests/httpd.conf.in
++++ b/tests/httpd.conf.in
+@@ -37,6 +37,7 @@ DirectoryIndex index.txt
+ TypesConfig /dev/null
+ AddType application/x-httpd-php .php
+ Redirect permanent /redirected /index.txt
++Redirect permanent /Basic/realm1/redirected https://127.0.0.1:47525/index.txt
+ 
+ # Proxy #1: unauthenticated
+ Listen 127.0.0.1:47526
+diff --git a/tests/proxy-test.c b/tests/proxy-test.c
+index 1d68aa05..105a02a6 100644
+--- a/tests/proxy-test.c
++++ b/tests/proxy-test.c
+@@ -322,6 +322,41 @@ do_proxy_redirect_test (void)
+ 	soup_test_session_abort_unref (session);
+ }
+ 
++static void proxy_auth_redirect_message_restarted (SoupMessage *msg)
++{
++	if (msg->status_code != SOUP_STATUS_MOVED_PERMANENTLY)
++		return;
++
++	g_assert_null (soup_message_headers_get_one (msg->request_headers, "Proxy-Authorization"));
++}
++
++static void
++do_proxy_auth_redirect_test (void)
++{
++	SoupSession *session;
++	SoupMessage *msg;
++	char *url;
++
++	SOUP_TEST_SKIP_IF_NO_APACHE;
++	SOUP_TEST_SKIP_IF_NO_TLS;
++
++	session = soup_test_session_new (SOUP_TYPE_SESSION_ASYNC,
++		SOUP_SESSION_PROXY_RESOLVER, proxy_resolvers[AUTH_PROXY],
++		NULL);
++
++	url = g_strconcat (HTTP_SERVER, "/Basic/realm1/redirected", NULL);
++	msg = soup_message_new (SOUP_METHOD_GET, url);
++	g_signal_connect (session, "authenticate", G_CALLBACK (authenticate), NULL);
++	g_signal_connect (msg, "restarted", G_CALLBACK (proxy_auth_redirect_message_restarted), NULL);
++
++	soup_session_send_message (session, msg);
++	soup_test_assert_message_status (msg, SOUP_STATUS_OK);
++
++	g_free (url);
++	g_object_unref (msg);
++	soup_test_session_abort_unref (session);
++}
++
+ static void
+ do_proxy_auth_request (const char *url, SoupSession *session, gboolean do_read)
+ {
+@@ -433,6 +468,7 @@ main (int argc, char **argv)
+ 
+ 	g_test_add_data_func ("/proxy/fragment", base_uri, do_proxy_fragment_test);
+ 	g_test_add_func ("/proxy/redirect", do_proxy_redirect_test);
++	g_test_add_func ("/proxy/auth-redirect", do_proxy_auth_redirect_test);
+ 	g_test_add_func ("/proxy/auth-cache", do_proxy_auth_cache_test);
+ 
+ 	ret = g_test_run ();
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7e00cd678a..4fe1e36f03 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2026-1539.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.55.0


