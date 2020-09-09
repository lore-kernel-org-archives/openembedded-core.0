Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.8819.1599639108595533702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /VBt3RaSgFJwM8aSq7rZVYcrZNidt/yTSGN4hTptKZsc0nSqzOh/XabGuFmGsx1QwMCcJ9Oyiz
 6IFyBbNgAsKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767040"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:41 -0700
IronPort-SDR: /AXzISiBl8KIiWhK95nX6npC1i6A2hImsh0gefKoDO7QU2sYSOKFlcIrHoWfq1mMPSHZQK6zUA
 wVecUa9PhiAw==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371110"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:38 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 11/11] gnutls: CVE-2020-24659
Date: Wed,  9 Sep 2020 16:11:13 +0800
Message-Id: <d3c46c74880c0fb0e569bc228f1ba1c0cb498ebc.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the CVE patch from the usptream:
https://gitlab.com/gnutls/gnutls.git
commit 29ee67c205855e848a0a26e6d0e4f65b6b943e0a

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gnutls/gnutls/CVE-2020-24659.patch        | 117 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.13.bb  |   1 +
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.13.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
index ab537981ac..2ed012f9d6 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2020-13777-a.patch \
            file://CVE-2020-13777-b.patch \
            file://CVE-2020-13777-c.patch \
+           file://CVE-2020-24659.patch \
 "
 
 SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
-- 
2.26.2

