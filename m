Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E065EC78843
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.18269.1726839561004786354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IxTlJ3RE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71971d2099cso1551380b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839560; x=1727444360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCKZt8LkijkNyf8p66ruVew7pcWgkVYs0FQs4nW2TEw=;
        b=IxTlJ3REroEKBmuMlTHhJeD1LPwaHqp0i3BKWKtNv7xHfXxiZHxetPPbAso/IpOarC
         dR0nrXOLm+vhTwuBBJAred4U/5ze5iZ8dwogwhBI5IJSORn5n9aBm+hO8+lZ+D4oGeLK
         f9bduly0RH2jTp7RmJOYMsiG/rcNxPDh7ZkR3ZIyc1HFpMqcU1Roxh/HEdHOeInwWwMP
         uQKUCTvDNhYPjKe67VzxFYb63fQ4voekmFFCkm9Kg48p0L2AAXTGp1xiaKc3rbH1DlXE
         0QnsO2BRnivSnnQS5cLnunmi4aqFCHzfcXlZMsafqirM2JsKsCYTAhxYd/VYTD2oqlbF
         Dy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839560; x=1727444360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCKZt8LkijkNyf8p66ruVew7pcWgkVYs0FQs4nW2TEw=;
        b=vebyw0QDw2OqWrNCFgAqby2C87SoeJPBl1CB7nCAWYz/fLmrVKk+kAzIILjZkuOdVY
         Mz0ZuOiWwtSi4JHmaTBSK0GZ6AFA8W6aeUhJL5mhO/aS94MSKaupP4hF1oP5drlVfC9+
         +Lv3+JfjSQl2CCaU6eH0FI43y/hxIweLd6nlvoiuv5rkhaO52DoYDNm2ZusguQEwizrN
         HV4RrhHz2MvY4MDyQxOxyzg2dQyziIxChNfzXBXWXSkISspDTLbguvv2SSZuMI12iRer
         /IfG21cPJLaODsfyvoPetcMId8nGYNyQgff0bBiaCYo4iaP3QfyP4sel+u0UGvRpPGTG
         2ILw==
X-Gm-Message-State: AOJu0Yy3mlXZd07W9LZfPzKwbD4FYwf3Qdb7Lw0HZEYRu1eRb059dr34
	iBKYzJkuJ0gk/43iH78IRUC99GP25BF3YcFfwLKzaFuqlah+PLTUsYNO2RzwJ1wPt5xl2tuwoaH
	d
X-Google-Smtp-Source: AGHT+IGUJo7si8pSqwF0KLOKGJsN92RCWUJBBbctj8l7JmbPCeDyK0sgzoF5fI6jtX+4IyIJZS6QDg==
X-Received: by 2002:a05:6a21:58b:b0:1cf:1b7d:8481 with SMTP id adf61e73a8af0-1d30a987fe9mr5034817637.32.1726839559919;
        Fri, 20 Sep 2024 06:39:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/16] Revert "wpa-supplicant: Upgrade 2.10 -> 2.11"
Date: Fri, 20 Sep 2024 06:38:59 -0700
Message-Id: <79ed0dba62404b9de3cd97bc861dea8779416afc.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204740

This version bump adds new features and should not have been taken.

This reverts commit 35c2b5f56bca789b9723a144fda0a130a67a860c.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...all-wpa_passphrase-when-not-disabled.patch |  33 +++
 ...te-Phase-2-authentication-requiremen.patch | 213 ++++++++++++++++++
 ...options-for-libwpa_client.so-and-wpa.patch |  73 ++++++
 ...oval-of-wpa_passphrase-on-make-clean.patch |  26 +++
 ...plicant_2.11.bb => wpa-supplicant_2.10.bb} |  10 +-
 5 files changed, 352 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.11.bb => wpa-supplicant_2.10.bb} (90%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
new file mode 100644
index 0000000000..c04c608bde
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
@@ -0,0 +1,33 @@
+From 57b12a1e43605f71239a21488cb9b541f0751dda Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Thu, 21 Apr 2022 10:15:29 +0100
+Subject: [PATCH] Install wpa_passphrase when not disabled
+
+As part of fixing CONFIG_NO_WPA_PASSPHRASE, whilst wpa_passphrase gets
+built, its not installed during `make install`.
+
+Fixes: cb41c214b78d ("build: Re-enable options for libwpa_client.so and wpa_passphrase")
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Submitted [http://lists.infradead.org/pipermail/hostap/2022-April/040448.html]
+---
+ wpa_supplicant/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index 0bab313f2355..12787c0c7d0f 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -73,6 +73,9 @@ $(DESTDIR)$(BINDIR)/%: %
+ 
+ install: $(addprefix $(DESTDIR)$(BINDIR)/,$(BINALL))
+ 	$(MAKE) -C ../src install
++ifndef CONFIG_NO_WPA_PASSPHRASE
++	install -D wpa_passphrase $(DESTDIR)/$(BINDIR)/wpa_passphrase
++endif
+ ifdef CONFIG_BUILD_WPA_CLIENT_SO
+ 	install -m 0644 -D libwpa_client.so $(DESTDIR)/$(LIBDIR)/libwpa_client.so
+ 	install -m 0644 -D ../src/common/wpa_ctrl.h $(DESTDIR)/$(INCDIR)/wpa_ctrl.h
+-- 
+2.35.1
+
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
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
new file mode 100644
index 0000000000..6e930fc98d
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
@@ -0,0 +1,73 @@
+From cb41c214b78d6df187a31950342e48a403dbd769 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Tue, 22 Feb 2022 11:52:19 +0300
+Subject: [PATCH 1/2] build: Re-enable options for libwpa_client.so and
+ wpa_passphrase
+
+Commit a41a29192e5d ("build: Pull common fragments into a build.rules
+file") introduced a regression into wpa_supplicant build process. The
+build target libwpa_client.so is not built regardless of whether the
+option CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because
+this config option is used before it is imported from the configuration
+file. Moving its use after including build.rules does not help: the
+variable ALL is processed by build.rules and further changes are not
+applied. Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not work
+as expected: wpa_passphrase is always built regardless of whether the
+option is set or not.
+
+Re-enable these options by adding both build targets to _all
+dependencies.
+
+Fixes: a41a29192e5d ("build: Pull common fragments into a build.rules file")
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+Upstream-Status: Backport
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+Signed-off-by: Alex Kiernan <alexk@gmail.com>
+---
+ wpa_supplicant/Makefile | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index cb66defac7c8..c456825ae75f 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1,24 +1,29 @@
+ BINALL=wpa_supplicant wpa_cli
+ 
+-ifndef CONFIG_NO_WPA_PASSPHRASE
+-BINALL += wpa_passphrase
+-endif
+-
+ ALL = $(BINALL)
+ ALL += systemd/wpa_supplicant.service
+ ALL += systemd/wpa_supplicant@.service
+ ALL += systemd/wpa_supplicant-nl80211@.service
+ ALL += systemd/wpa_supplicant-wired@.service
+ ALL += dbus/fi.w1.wpa_supplicant1.service
+-ifdef CONFIG_BUILD_WPA_CLIENT_SO
+-ALL += libwpa_client.so
+-endif
+ 
+ EXTRA_TARGETS=dynamic_eap_methods
+ 
+ CONFIG_FILE=.config
+ include ../src/build.rules
+ 
++ifdef CONFIG_BUILD_WPA_CLIENT_SO
++# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
++# being set in the config which is read by build.rules
++_all: libwpa_client.so
++endif
++
++ifndef CONFIG_NO_WPA_PASSPHRASE
++# add the dependency this way to allow CONFIG_NO_WPA_PASSPHRASE
++# being set in the config which is read by build.rules
++_all: wpa_passphrase
++endif
++
+ ifdef LIBS
+ # If LIBS is set with some global build system defaults, clone those for
+ # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
+-- 
+2.35.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
new file mode 100644
index 0000000000..53b0fcdf53
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
@@ -0,0 +1,26 @@
+From d001b301ba7987f4b39453a211631b85c48f2ff8 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Thu, 3 Mar 2022 13:26:42 +0200
+Subject: [PATCH 2/2] Fix removal of wpa_passphrase on 'make clean'
+
+Fixes: 0430bc8267b4 ("build: Add a common-clean target")
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+Upstream-Status: Backport
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+Signed-off-by: Alex Kiernan <alexk@gmail.com>
+---
+ wpa_supplicant/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index c456825ae75f..4b4688931b1d 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -2077,3 +2077,4 @@ clean: common-clean
+ 	rm -f libwpa_client.a
+ 	rm -f libwpa_client.so
+ 	rm -f libwpa_test1 libwpa_test2
++	rm -f wpa_passphrase
+-- 
+2.35.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
similarity index 90%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 03e4571cfb..22028ce957 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -5,8 +5,8 @@ BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
-                    file://README;beginline=1;endline=56;md5=6e4b25e7d74bfc44a32ba37bdf5210a6 \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=f5ccd57ea91e04800edb88267bf8eae4"
+                    file://README;beginline=1;endline=56;md5=e3d2f6c2948991e37c1ca4960de84747 \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=76306a95306fee9a976b0ac1be70f705"
 
 DEPENDS = "dbus libnl"
 
@@ -15,8 +15,12 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
+           file://0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch \
+           file://0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch \
+           file://0001-Install-wpa_passphrase-when-not-disabled.patch \
+           file://0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch \
            "
-SRC_URI[sha256sum] = "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a"
+SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
-- 
2.34.1


