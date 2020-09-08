Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.12292.1599533860058609082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 19:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0882vcrq018414
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Sep 2020 19:57:38 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Sep 2020
 19:57:36 -0700
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] gnutls: CVE-2020-24659
Date: Mon, 7 Sep 2020 19:57:36 -0700
Message-ID: <20200908025736.126578-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backport the CVE patch from the usptream:
https://gitlab.com/gnutls/gnutls.git
commit 29ee67c205855e848a0a26e6d0e4f65b6b943e0a

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../gnutls/gnutls/CVE-2020-24659.patch        | 117 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch b/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch
new file mode 100644
index 0000000000..1702325e66
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch
@@ -0,0 +1,117 @@
+From 29ee67c205855e848a0a26e6d0e4f65b6b943e0a Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Sat, 22 Aug 2020 17:19:39 +0200
+Subject: [PATCH] handshake: reject no_renegotiation alert if handshake is
+ incomplete
+
+If the initial handshake is incomplete and the server sends a
+no_renegotiation alert, the client should treat it as a fatal error
+even if its level is warning.  Otherwise the same handshake
+state (e.g., DHE parameters) are reused in the next gnutls_handshake
+call, if it is called in the loop idiom:
+
+  do {
+          ret = gnutls_handshake(session);
+  } while (ret < 0 && gnutls_error_is_fatal(ret) == 0);
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+CVE: CVE-2020-24659
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls.git]
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ lib/gnutls_int.h                              |   1 +
+ lib/handshake.c                               |  48 +++++++++++++-----
+ 2 files changed, 36 insertions(+), 13 deletions(-)
+
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index bb6c19713..31cec5c0c 100644
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -1370,6 +1370,7 @@ typedef struct {
+ #define HSK_RECORD_SIZE_LIMIT_RECEIVED (1<<26) /* server: record_size_limit extension was seen but not accepted yet */
+ #define HSK_OCSP_REQUESTED (1<<27) /* server: client requested OCSP stapling */
+ #define HSK_CLIENT_OCSP_REQUESTED (1<<28) /* client: server requested OCSP stapling */
++#define HSK_SERVER_HELLO_RECEIVED (1<<29) /* client: Server Hello message has been received */
+ 
+ 	/* The hsk_flags are for use within the ongoing handshake;
+ 	 * they are reset to zero prior to handshake start by gnutls_handshake. */
+diff --git a/lib/handshake.c b/lib/handshake.c
+index b40f84b3d..ce2d160e2 100644
+--- a/lib/handshake.c
++++ b/lib/handshake.c
+@@ -2051,6 +2051,8 @@ read_server_hello(gnutls_session_t session,
+ 	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+ 
++	session->internals.hsk_flags |= HSK_SERVER_HELLO_RECEIVED;
++
+ 	return 0;
+ }
+ 
+@@ -2575,16 +2577,42 @@ int gnutls_rehandshake(gnutls_session_t session)
+ 	return 0;
+ }
+ 
++/* This function checks whether the error code should be treated fatal
++ * or not, and also does the necessary state transition.  In
++ * particular, in the case of a rehandshake abort it resets the
++ * handshake's internal state.
++ */
+ inline static int
+ _gnutls_abort_handshake(gnutls_session_t session, int ret)
+ {
+-	if (((ret == GNUTLS_E_WARNING_ALERT_RECEIVED) &&
+-	     (gnutls_alert_get(session) == GNUTLS_A_NO_RENEGOTIATION))
+-	    || ret == GNUTLS_E_GOT_APPLICATION_DATA)
+-		return 0;
++	switch (ret) {
++	case GNUTLS_E_WARNING_ALERT_RECEIVED:
++		if (gnutls_alert_get(session) == GNUTLS_A_NO_RENEGOTIATION) {
++			/* The server always toleretes a "no_renegotiation" alert. */
++			if (session->security_parameters.entity == GNUTLS_SERVER) {
++				STATE = STATE0;
++				return ret;
++			}
++
++			/* The client should tolerete a "no_renegotiation" alert only if:
++			 * - the initial handshake has completed, or
++			 * - a Server Hello is not yet received
++			 */
++			if (session->internals.initial_negotiation_completed ||
++			    !(session->internals.hsk_flags & HSK_SERVER_HELLO_RECEIVED)) {
++				STATE = STATE0;
++				return ret;
++			}
+ 
+-	/* this doesn't matter */
+-	return GNUTLS_E_INTERNAL_ERROR;
++			return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET);
++		}
++		return ret;
++	case GNUTLS_E_GOT_APPLICATION_DATA:
++		STATE = STATE0;
++		return ret;
++	default:
++		return ret;
++	}
+ }
+ 
+ 
+@@ -2747,13 +2774,7 @@ int gnutls_handshake(gnutls_session_t session)
+ 	}
+ 
+ 	if (ret < 0) {
+-		/* In the case of a rehandshake abort
+-		 * we should reset the handshake's internal state.
+-		 */
+-		if (_gnutls_abort_handshake(session, ret) == 0)
+-			STATE = STATE0;
+-
+-		return ret;
++		return _gnutls_abort_handshake(session, ret);
+ 	}
+ 
+ 	/* clear handshake buffer */
+-- 
+2.17.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index cc0454a561..51578b4b3b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -20,6 +20,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
+           file://CVE-2020-24659.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.17.1

