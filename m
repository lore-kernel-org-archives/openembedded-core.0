Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B6DC54E71
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:13 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.34065.1710728530095333962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UV1d0NN6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c1a1e1e539so3340545b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728529; x=1711333329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKjzlhYoDKfqgh7zmaoOyL0VFCPr9gmpuJw/XRCYONg=;
        b=UV1d0NN6iYke+Ig6i1G9cd2P1tcKPE2ESoNtvDtD2GcyDQqXkk8Vwi6TBm382LmXQC
         FyeBO4xIGfEyOAnNnacpJEz+iz0RiTQRlhC86bQnQ1ppSawB/pfiICSUDBrK4swNL0O+
         tzmQxrJtTz2SgN8XwR6uy0f6fKuu1XKMlpBNDZQti3jb1E8e9S0ZQpv+OLn+f2RJW8PO
         U1P23DyjYTW10OifstL88tXu78S1QhhKBSQXcLc4J7UQDaaxy5Iuy++B/HwGDkWMzY9n
         OXzGon4XlHeokFoeZBHhB7QsULNVA1j8Bqmascy0Ykpm/BL+eC46RrjxUuYR3NpYeT8K
         fZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728529; x=1711333329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKjzlhYoDKfqgh7zmaoOyL0VFCPr9gmpuJw/XRCYONg=;
        b=BduBz1kqaVR3gFHZ+hyCqb9m/LkqL/78ruiAWvosNKBUOLSWB/GZKbLzbvL4WjZTaw
         ubM+aMW6KcPXccddD58ZTqWsuD7Hu9OysIVgHVu5r7pxsDqQIUD7FbfENsCtNXl30lQY
         GpmL2h81qR9S/9LeQtdZRa3GBOjc+kRnLQ+5RFtcR+EKPHdebZQYj2z6N1Ifx/MchGNW
         LbKWjZWuBuG2MTLbcHc4XkX3RaJiKziqwcDFHDmQzL8vvghRUsvHi8XNnAGLAVnakBKh
         mjCD2OwGOmy+uhCaucKqYLQdip0SMGYib6ZN2je8qwjNnzooa4s0g81IJYyCwpeTHH7Q
         4uiA==
X-Gm-Message-State: AOJu0Ywyg+/CrB39wIbPxFGRlfaIGQZamp2NGr9JxhPmLNjhXkSeqcVB
	g55TGXtIjO3K91UtE9QUuo+hrotb7DcaKCi40WOtWvtvrDc/Gz7rfHFpp5hWRTONHLizozleXkb
	tqWafPw==
X-Google-Smtp-Source: AGHT+IFA8smF0PllqRG4qOjNKsOKV1OxD3CVnvoi6u9BcM/S5W8Y9KwVAgNF50qvtI+EZomY3OyYsw==
X-Received: by 2002:a05:6808:301e:b0:3c2:57a7:868d with SMTP id ay30-20020a056808301e00b003c257a7868dmr13049720oib.18.1710728527594;
        Sun, 17 Mar 2024 19:22:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/14] wpa-supplicant: Fix CVE-2023-52160
Date: Sun, 17 Mar 2024 16:21:46 -1000
Message-Id: <7d0e3f31d2193b2b13a9fe3f368a172f4eaa7c48.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197278

From: Claus Stovgaard <claus.stovgaard@gmail.com>

PEAP client: Update Phase 2 authentication requirements. Also see
https://www.top10vpn.com/research/wifi-vulnerabilities/

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57b6a329df897de69ae8b90706d9fe37e0ed6d35)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...te-Phase-2-authentication-requiremen.patch | 213 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   1 +
 2 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
new file mode 100644
index 0000000000..620560d3c7
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
@@ -0,0 +1,213 @@
+From f6f7cead3661ceeef54b21f7e799c0afc98537ec Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 8 Jul 2023 19:55:32 +0300
+Subject: [PATCH] PEAP client: Update Phase 2 authentication requirements
+
+The previous PEAP client behavior allowed the server to skip Phase 2
+authentication with the expectation that the server was authenticated
+during Phase 1 through TLS server certificate validation. Various PEAP
+specifications are not exactly clear on what the behavior on this front
+is supposed to be and as such, this ended up being more flexible than
+the TTLS/FAST/TEAP cases. However, this is not really ideal when
+unfortunately common misconfiguration of PEAP is used in deployed
+devices where the server trust root (ca_cert) is not configured or the
+user has an easy option for allowing this validation step to be skipped.
+
+Change the default PEAP client behavior to be to require Phase 2
+authentication to be successfully completed for cases where TLS session
+resumption is not used and the client certificate has not been
+configured. Those two exceptions are the main cases where a deployed
+authentication server might skip Phase 2 and as such, where a more
+strict default behavior could result in undesired interoperability
+issues. Requiring Phase 2 authentication will end up disabling TLS
+session resumption automatically to avoid interoperability issues.
+
+Allow Phase 2 authentication behavior to be configured with a new phase1
+configuration parameter option:
+'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
+tunnel) behavior for PEAP:
+ * 0 = do not require Phase 2 authentication
+ * 1 = require Phase 2 authentication when client certificate
+   (private_key/client_cert) is no used and TLS session resumption was
+   not used (default)
+ * 2 = require Phase 2 authentication in all cases
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2023-52160
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=8e6485a1bcb0baffdea9e55255a81270b768439c]
+
+Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
+
+---
+ src/eap_peer/eap_config.h          |  8 ++++++
+ src/eap_peer/eap_peap.c            | 40 +++++++++++++++++++++++++++---
+ src/eap_peer/eap_tls_common.c      |  6 +++++
+ src/eap_peer/eap_tls_common.h      |  5 ++++
+ wpa_supplicant/wpa_supplicant.conf |  7 ++++++
+ 5 files changed, 63 insertions(+), 3 deletions(-)
+
+diff --git a/src/eap_peer/eap_config.h b/src/eap_peer/eap_config.h
+index 3238f74..047eec2 100644
+--- a/src/eap_peer/eap_config.h
++++ b/src/eap_peer/eap_config.h
+@@ -469,6 +469,14 @@ struct eap_peer_config {
+ 	 * 1 = use cryptobinding if server supports it
+ 	 * 2 = require cryptobinding
+ 	 *
++	 * phase2_auth option can be used to control Phase 2 (i.e., within TLS
++	 * tunnel) behavior for PEAP:
++	 * 0 = do not require Phase 2 authentication
++	 * 1 = require Phase 2 authentication when client certificate
++	 *  (private_key/client_cert) is no used and TLS session resumption was
++	 *  not used (default)
++	 * 2 = require Phase 2 authentication in all cases
++	 *
+ 	 * EAP-WSC (WPS) uses following options: pin=Device_Password and
+ 	 * uuid=Device_UUID
+ 	 *
+diff --git a/src/eap_peer/eap_peap.c b/src/eap_peer/eap_peap.c
+index 12e30df..6080697 100644
+--- a/src/eap_peer/eap_peap.c
++++ b/src/eap_peer/eap_peap.c
+@@ -67,6 +67,7 @@ struct eap_peap_data {
+ 	u8 cmk[20];
+ 	int soh; /* Whether IF-TNCCS-SOH (Statement of Health; Microsoft NAP)
+ 		  * is enabled. */
++	enum { NO_AUTH, FOR_INITIAL, ALWAYS } phase2_auth;
+ };
+ 
+ 
+@@ -114,6 +115,19 @@ static void eap_peap_parse_phase1(struct eap_peap_data *data,
+ 		wpa_printf(MSG_DEBUG, "EAP-PEAP: Require cryptobinding");
+ 	}
+ 
++	if (os_strstr(phase1, "phase2_auth=0")) {
++		data->phase2_auth = NO_AUTH;
++		wpa_printf(MSG_DEBUG,
++			   "EAP-PEAP: Do not require Phase 2 authentication");
++	} else if (os_strstr(phase1, "phase2_auth=1")) {
++		data->phase2_auth = FOR_INITIAL;
++		wpa_printf(MSG_DEBUG,
++			   "EAP-PEAP: Require Phase 2 authentication for initial connection");
++	} else if (os_strstr(phase1, "phase2_auth=2")) {
++		data->phase2_auth = ALWAYS;
++		wpa_printf(MSG_DEBUG,
++			   "EAP-PEAP: Require Phase 2 authentication for all cases");
++	}
+ #ifdef EAP_TNC
+ 	if (os_strstr(phase1, "tnc=soh2")) {
+ 		data->soh = 2;
+@@ -142,6 +156,7 @@ static void * eap_peap_init(struct eap_sm *sm)
+ 	data->force_peap_version = -1;
+ 	data->peap_outer_success = 2;
+ 	data->crypto_binding = OPTIONAL_BINDING;
++	data->phase2_auth = FOR_INITIAL;
+ 
+ 	if (config && config->phase1)
+ 		eap_peap_parse_phase1(data, config->phase1);
+@@ -454,6 +469,20 @@ static int eap_tlv_validate_cryptobinding(struct eap_sm *sm,
+ }
+ 
+ 
++static bool peap_phase2_sufficient(struct eap_sm *sm,
++				   struct eap_peap_data *data)
++{
++	if ((data->phase2_auth == ALWAYS ||
++	     (data->phase2_auth == FOR_INITIAL &&
++	      !tls_connection_resumed(sm->ssl_ctx, data->ssl.conn) &&
++	      !data->ssl.client_cert_conf) ||
++	     data->phase2_eap_started) &&
++	    !data->phase2_eap_success)
++		return false;
++	return true;
++}
++
++
+ /**
+  * eap_tlv_process - Process a received EAP-TLV message and generate a response
+  * @sm: Pointer to EAP state machine allocated with eap_peer_sm_init()
+@@ -568,6 +597,11 @@ static int eap_tlv_process(struct eap_sm *sm, struct eap_peap_data *data,
+ 					   " - force failed Phase 2");
+ 				resp_status = EAP_TLV_RESULT_FAILURE;
+ 				ret->decision = DECISION_FAIL;
++			} else if (!peap_phase2_sufficient(sm, data)) {
++				wpa_printf(MSG_INFO,
++					   "EAP-PEAP: Server indicated Phase 2 success, but sufficient Phase 2 authentication has not been completed");
++				resp_status = EAP_TLV_RESULT_FAILURE;
++				ret->decision = DECISION_FAIL;
+ 			} else {
+ 				resp_status = EAP_TLV_RESULT_SUCCESS;
+ 				ret->decision = DECISION_UNCOND_SUCC;
+@@ -887,8 +921,7 @@ continue_req:
+ 			/* EAP-Success within TLS tunnel is used to indicate
+ 			 * shutdown of the TLS channel. The authentication has
+ 			 * been completed. */
+-			if (data->phase2_eap_started &&
+-			    !data->phase2_eap_success) {
++			if (!peap_phase2_sufficient(sm, data)) {
+ 				wpa_printf(MSG_DEBUG, "EAP-PEAP: Phase 2 "
+ 					   "Success used to indicate success, "
+ 					   "but Phase 2 EAP was not yet "
+@@ -1199,8 +1232,9 @@ static struct wpabuf * eap_peap_process(struct eap_sm *sm, void *priv,
+ static bool eap_peap_has_reauth_data(struct eap_sm *sm, void *priv)
+ {
+ 	struct eap_peap_data *data = priv;
++
+ 	return tls_connection_established(sm->ssl_ctx, data->ssl.conn) &&
+-		data->phase2_success;
++		data->phase2_success && data->phase2_auth != ALWAYS;
+ }
+ 
+ 
+diff --git a/src/eap_peer/eap_tls_common.c b/src/eap_peer/eap_tls_common.c
+index c1837db..a53eeb1 100644
+--- a/src/eap_peer/eap_tls_common.c
++++ b/src/eap_peer/eap_tls_common.c
+@@ -239,6 +239,12 @@ static int eap_tls_params_from_conf(struct eap_sm *sm,
+ 
+ 	sm->ext_cert_check = !!(params->flags & TLS_CONN_EXT_CERT_CHECK);
+ 
++	if (!phase2)
++		data->client_cert_conf = params->client_cert ||
++			params->client_cert_blob ||
++			params->private_key ||
++			params->private_key_blob;
++
+ 	return 0;
+ }
+ 
+diff --git a/src/eap_peer/eap_tls_common.h b/src/eap_peer/eap_tls_common.h
+index 9ac0012..3348634 100644
+--- a/src/eap_peer/eap_tls_common.h
++++ b/src/eap_peer/eap_tls_common.h
+@@ -79,6 +79,11 @@ struct eap_ssl_data {
+ 	 * tls_v13 - Whether TLS v1.3 or newer is used
+ 	 */
+ 	int tls_v13;
++
++	/**
++	 * client_cert_conf: Whether client certificate has been configured
++	 */
++	bool client_cert_conf;
+ };
+ 
+ 
+diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_supplicant.conf
+index 6619d6b..d63f73c 100644
+--- a/wpa_supplicant/wpa_supplicant.conf
++++ b/wpa_supplicant/wpa_supplicant.conf
+@@ -1321,6 +1321,13 @@ fast_reauth=1
+ #	 * 0 = do not use cryptobinding (default)
+ #	 * 1 = use cryptobinding if server supports it
+ #	 * 2 = require cryptobinding
++#	'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
++#	tunnel) behavior for PEAP:
++#	 * 0 = do not require Phase 2 authentication
++#	 * 1 = require Phase 2 authentication when client certificate
++#	   (private_key/client_cert) is no used and TLS session resumption was
++#	   not used (default)
++#	 * 2 = require Phase 2 authentication in all cases
+ #	EAP-WSC (WPS) uses following options: pin=<Device Password> or
+ #	pbc=1.
+ #
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 46604045da..22028ce957 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch \
            file://0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch \
            file://0001-Install-wpa_passphrase-when-not-disabled.patch \
+           file://0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
-- 
2.34.1


