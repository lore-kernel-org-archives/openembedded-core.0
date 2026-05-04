Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114B0CD342F
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 19:53:27 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23684.1777924402531647596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 12:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YvsBRd+A;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260504195320a757c3a288000207f3-zcerns@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260504195320a757c3a288000207f3
        for <openembedded-core@lists.openembedded.org>;
        Mon, 04 May 2026 21:53:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LqIAsTVbY8bx/Q7SEvLow7JMMUTgqYmkDqi7LcA7nD0=;
 b=YvsBRd+AemWby0YxPXuqFMBPo6UlJLas+OaK2mPQIScs5h4RSswh64bfU1JbAHVTODn0Uh
 w1uni6LgNWM6KbUqqatMDMZ77NTxiSoClYDRmk3MciVwh0Zp9KzNhVqP3u/bucFwmHukbeQL
 taIKwtrRAvb9epAskW5Afc84bOvsEFQue1y8knOSDMtQUZUaQlyCqx+esaaWMWfzBxpi2qXe
 hC3wx9l0H02EopfRtLccCnu1UWUL5Z3B1aOAl2XSiF4GlLP+D0G+96MWecMckTxtXxo3BDi1
 DOnfY5BLWzu43jMZQ0othJQi6kRuzp0Mkpk6FoLNboc7LE9HK0NMcvHg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/5] libssh2: patch CVE-2026-7598
Date: Mon,  4 May 2026 21:52:44 +0200
Message-ID: <20260504195246.1190112-3-peter.marko@siemens.com>
In-Reply-To: <20260504195246.1190112-1-peter.marko@siemens.com>
References: <20260504195246.1190112-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 19:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236455

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in both NVD and Debian report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libssh2/libssh2/CVE-2026-7598.patch       | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
new file mode 100644
index 0000000000..314e6af370
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
@@ -0,0 +1,56 @@
+From 256d04b60d80bf1190e96b0ad1e91b2174d744b1 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Mon, 13 Apr 2026 11:18:25 -0700
+Subject: [PATCH] userauth.c: username_len bounds checking (#1858)
+
+Return errors when username_len will exceed bounds, fix existing bounds
+check.
+
+Credit:
+[dapickle](https://github.com/dapickle)
+
+CVE: CVE-2026-7598
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/userauth.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/userauth.c b/src/userauth.c
+index f8e02651..43d9ab9b 100644
+--- a/src/userauth.c
++++ b/src/userauth.c
+@@ -80,6 +80,12 @@ static char *userauth_list(LIBSSH2_SESSION *session, const char *username,
+         memset(&session->userauth_list_packet_requirev_state, 0,
+                sizeof(session->userauth_list_packet_requirev_state));
+ 
++        if(username_len > UINT32_MAX - 27) {
++            _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                           "username_len out of bounds");
++            return NULL;
++        }
++
+         session->userauth_list_data_len = username_len + 27;
+ 
+         s = session->userauth_list_data =
+@@ -307,6 +313,11 @@ userauth_password(LIBSSH2_SESSION *session,
+          * 40 = packet_type(1) + username_len(4) + service_len(4) +
+          * service(14)"ssh-connection" + method_len(4) + method(8)"password" +
+          * chgpwdbool(1) + password_len(4) */
++        if(username_len > UINT32_MAX - 40) {
++            return _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                                  "username_len out of bounds");
++        }
++
+         session->userauth_pswd_data_len = username_len + 40;
+ 
+         session->userauth_pswd_data0 =
+@@ -447,7 +458,7 @@ password_response:
+                         }
+ 
+                         /* basic data_len + newpw_len(4) */
+-                        if(username_len + password_len + 44 <= UINT_MAX) {
++                        if(username_len <= UINT32_MAX - password_len - 44) {
+                             session->userauth_pswd_data_len =
+                                 username_len + password_len + 44;
+                             s = session->userauth_pswd_data =
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 0d1237852f..e825c8c5bb 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
+           file://CVE-2026-7598.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

