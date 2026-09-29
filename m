Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBACCA5FAC
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 20:51:21 +0000 (UTC)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6788.1790715071538312053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 13:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sFT+pwpv;
 spf=pass (domain: gmail.com, ip: 74.125.229.12, mailfrom: jason.stasiak@gmail.com)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so5287894eec.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790715071; x=1791319871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D/YOUELBqwzIJWCEAxxeBLqes2cXsFp+lYo+9DBnHx4=;
        b=sFT+pwpvRKhkXdrjmzC0jU1n/o+4B0pY9GHYpRhUpusII+3n5Mk7oWA3CAI457Fpgk
         Z8/pCpIk0JO0irq9rfOzDY8IiMT3xGuJkAeJn5uIxwQp8oEBioSifCF1SmQefgPulLjk
         j4cVN8oyh6att5Mqre+Ms1BTAvxfL1uPv2cQb3bzrk55RWbDm59IRGcfItkTFIUqbjcj
         4+hPo+AxICM2ucX84NfLyIENAmEbWrH4+eCU5ufh8fGx1FO0vd2A7zyQsGnn42v++h8i
         yzsbPvnyFUnzE4ZwVl5iET8y2casCdmZWWM35D1sFCm9L0nQ4IAheYMmqhny8Kwk1g8m
         DFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715071; x=1791319871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D/YOUELBqwzIJWCEAxxeBLqes2cXsFp+lYo+9DBnHx4=;
        b=KT6UunVM2T6UWdtFjbHo7FRTB5Lottu1ldeEXE7qEZDwt/99Fw+B6/V92R/M5JFQGD
         D/3tDHNM3N3EVzhCgE3nF3TCFyae9O3ympwGRSdolAiO3sphn+gHK6Cv/l/BRFPhOLls
         pf8Syoo+Mul7S+1JoLLUSN/gw1hzh03eSNQnI0yyz+8B6KAHMwr+9hFtQq9qmWOi+i0C
         C3V7LyMpir5AUAeezDvOUPJSwi1xrlH87Tiw+Nze3nl5fpTzuun7NL2QlK+4hS+idAOf
         kg9d/rQL2QvAoHlGHzub9d6NmUBQeQd59rfxZiGpzsCp31XSABC16QKNCbk5z638XRR3
         btnw==
X-Gm-Message-State: AFq9FYJL+nQd30Y6wjWsG3ZJVwmqrvP0Qda9mhuKNGAQFUD9JC+pbLSw
	u+MsI4qDsbvr52AaFXzmFOJ87g4cxJFhunKH5X/Tf2WLWBQBnneg0JQTBZpafA==
X-Gm-Gg: AYBFou09jpivd9oPb9XtYiTUlSNl8ghdjEtvIl0FiDeq/lf32vYyIrHTtDrppQW60zC
	xBcIHwbiqouqKkmjGYnyDzzI7pj2zWk6wkFBx3TaDVeFnAE0Q4VEjUeVgWI2ENAr4Tp865AdOlG
	EiN4Kr3wIajrLGQKiucbcOT3HxWCzpZHdAdZmdls8gY1TI2jqMjCa3i+HZBcACtUj07rpgyZ2WN
	y51bO/dlSvMANJJ+uvdTRiqbqaj4qev9DJi7wB3MDmxk9l/eOaqexIYL2/owgkvSkp+hGFWDcfW
	DFh+cmwl3m4bB1BI/xjaG64VFSltZpA/Wdzx3mhY9yliMLibq8Sq6zv8KExnjrrvWrUc9T0RloE
	leLchiEXyNC+iwR8+JSTBbKIqef8oO3d8W/ajgjBGwRWag5DBIy71mdEGrRqV+nNdnQN7m3vEWS
	Fy8dLH1O8dpi+aZbsj07elJkA2qBDvBS4P1X8U5VTwXQKsOlzKiHKm8NdwXRy/xiQWmkAHbxgpf
	Beri0Vn9AF6udiPGgDtNez9w7sGnHs=
X-Received: by 2002:a05:7300:8424:b0:341:67fc:98df with SMTP id 5a478bee46e88-34c63bfd133mr597292eec.12.1790715070757;
        Tue, 29 Sep 2026 13:51:10 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9b64sm2655843eec.6.2026.09.29.13.51.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:51:10 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/5] libsoup-2.4: fix CVE-2026-1539
Date: Tue, 29 Sep 2026 13:50:51 -0700
Message-ID: <20260929205055.2403390-2-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929205055.2403390-1-jason.stasiak@garmin.com>
References: <20260929205055.2403390-1-jason.stasiak@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 20:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246894

Backport fix for CVE-2026-1539 from meta-oe to OE-core.
Update CVE patch to restore the auth-redirect proxy validation
unit test from the upstream libsoup3 patch.

(From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)

Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
---
 .../libsoup/libsoup-2.4/CVE-2026-1539.patch   | 104 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
new file mode 100644
index 0000000000..e8c9ee0583
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


