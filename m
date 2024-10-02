Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615D6CEACF3
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.6945.1727874790843829295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j60nYs65;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718e2855479so4721027b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874790; x=1728479590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cH9CJshs61j8evHKUtxNwo/svj+deLJ6CCjg9oaoVk=;
        b=j60nYs65CPiTt5lInrc+RhnizIB851Vajn8D3bh5xm12qE4vzWMIelRcjaQYJjDOej
         YoRtOyK4J8Hc5KuTHqzbVZAuklO0P0N7HnhPP9sR8RXXlokK7Be1Un54GZi1L13MoH3U
         YGhrOd1pyAuSZcbo5KQ6hugpJBl56tvmFnUzeeWh2d6HYRGESEh1dm5xnHmjFT6iLScV
         wIgo57k0YHEe6NS0MFFkb1DA4wfGj7ChDzpsqDNnfqnZlSx/l++p8FO/v9y6iG1jQvnl
         H8UV/xk3K8lTtPsGYEbAst4FLn3CE9QCVfXvGOcPAU/6J08pnyPNT+CY3Zc1jAsQkN1w
         4eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874790; x=1728479590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cH9CJshs61j8evHKUtxNwo/svj+deLJ6CCjg9oaoVk=;
        b=bJ80NpFZXsrLD51AHuOG6OIk7ep2oSn39uEfL2oMZSLQW0npF8r8psIkJAzDilhGqq
         lxQlHC7tm2s4rBBnqksquP7nbe7+/Ry1jgAh12roltbDK4Hxh3SIawNIgq2W/tb/bB9h
         KQvx9u84UA+RBRm0sQqTnD2DP/F5W4voR0Ged0dVdkPfhoT4R1tpkqVXz5+Uu2gvAQJV
         3giZCXT6nJ8JuFd1eZi7EYdlYIg2ePOwIBXxmEwQH3geMoARdsn7SelYtiioZEa+Gy0A
         wDvLlo8rBlFfO75WgQDsqwfjh8trFxePneunPVoM4MBmoaNeq49Qif/o8ZK5ry5L/ehR
         qu5A==
X-Gm-Message-State: AOJu0YwbRGfBfNTuV+RpYiAeFbWSwBr9lEKWvM8Gjo0YXhoYXSVIk1/b
	gpdlbh0seVUpN2HWeVlu4uTyFZvMpPe5+g3ppEyI9ITDEJXN5iz85DxW6Izu8HgXNM+lHwF0iBB
	QacM=
X-Google-Smtp-Source: AGHT+IFX8mTA4KcQY16tEa3EJJbzjD7N4E1k19Lt6HLb92WzOvdfPeemG0Po6WiKZQjIHHjCDsAXug==
X-Received: by 2002:a05:6a20:948b:b0:1d6:c990:74cc with SMTP id adf61e73a8af0-1d6c9907504mr3647561637.1.1727874789533;
        Wed, 02 Oct 2024 06:13:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] wpa-supplicant: Patch CVE-2024-3596
Date: Wed,  2 Oct 2024 06:12:44 -0700
Message-Id: <6f65fd4d98b5a5dcd410b2dcfeb2e6f229c3b973.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205188

From: Peter Marko <peter.marko@siemens.com>

Picked patches according to
http://w1.fi/security/2024-1/hostapd-and-radius-protocol-forgery-attacks.txt

First patch is style commit picked to have a clean cherry-pick of all
mentioned commits without any conflict.
Patch CVE-2024-3596_07.patch has hostapd code removed as it is not
present in wpa-supplicant download tarball.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wpa-supplicant/CVE-2024-3596_00.patch     |  82 +++++++++
 .../wpa-supplicant/CVE-2024-3596_01.patch     | 165 ++++++++++++++++++
 .../wpa-supplicant/CVE-2024-3596_02.patch     |  62 +++++++
 .../wpa-supplicant/CVE-2024-3596_03.patch     |  37 ++++
 .../wpa-supplicant/CVE-2024-3596_04.patch     |  52 ++++++
 .../wpa-supplicant/CVE-2024-3596_05.patch     |  51 ++++++
 .../wpa-supplicant/CVE-2024-3596_06.patch     |  46 +++++
 .../wpa-supplicant/CVE-2024-3596_07.patch     |  67 +++++++
 .../wpa-supplicant/CVE-2024-3596_08.patch     |  47 +++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   9 +
 10 files changed, 618 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_01.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_02.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_03.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_04.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_05.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_06.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_07.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_08.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch
new file mode 100644
index 0000000000..7a8197d2b4
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch
@@ -0,0 +1,82 @@
+From 945acf3ef06a6c312927da4fa055693dbac432d1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 2 Apr 2022 16:28:12 +0300
+Subject: [PATCH 1/9] ieee802_11_auth: Coding style cleanup - no string
+ constant splitting
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=945acf3ef06a6c312927da4fa055693dbac432d1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_11_auth.c | 27 +++++++++++++++------------
+ 1 file changed, 15 insertions(+), 12 deletions(-)
+
+diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
+index 783ee6dea..47cc625be 100644
+--- a/src/ap/ieee802_11_auth.c
++++ b/src/ap/ieee802_11_auth.c
+@@ -267,16 +267,16 @@ int hostapd_allowed_address(struct hostapd_data *hapd, const u8 *addr,
+ 		os_get_reltime(&query->timestamp);
+ 		os_memcpy(query->addr, addr, ETH_ALEN);
+ 		if (hostapd_radius_acl_query(hapd, addr, query)) {
+-			wpa_printf(MSG_DEBUG, "Failed to send Access-Request "
+-				   "for ACL query.");
++			wpa_printf(MSG_DEBUG,
++				   "Failed to send Access-Request for ACL query.");
+ 			hostapd_acl_query_free(query);
+ 			return HOSTAPD_ACL_REJECT;
+ 		}
+ 
+ 		query->auth_msg = os_memdup(msg, len);
+ 		if (query->auth_msg == NULL) {
+-			wpa_printf(MSG_ERROR, "Failed to allocate memory for "
+-				   "auth frame.");
++			wpa_printf(MSG_ERROR,
++				   "Failed to allocate memory for auth frame.");
+ 			hostapd_acl_query_free(query);
+ 			return HOSTAPD_ACL_REJECT;
+ 		}
+@@ -467,19 +467,21 @@ hostapd_acl_recv_radius(struct radius_msg *msg, struct radius_msg *req,
+ 	if (query == NULL)
+ 		return RADIUS_RX_UNKNOWN;
+ 
+-	wpa_printf(MSG_DEBUG, "Found matching Access-Request for RADIUS "
+-		   "message (id=%d)", query->radius_id);
++	wpa_printf(MSG_DEBUG,
++		   "Found matching Access-Request for RADIUS message (id=%d)",
++		   query->radius_id);
+ 
+ 	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 0)) {
+-		wpa_printf(MSG_INFO, "Incoming RADIUS packet did not have "
+-			   "correct authenticator - dropped\n");
++		wpa_printf(MSG_INFO,
++			   "Incoming RADIUS packet did not have correct authenticator - dropped");
+ 		return RADIUS_RX_INVALID_AUTHENTICATOR;
+ 	}
+ 
+ 	if (hdr->code != RADIUS_CODE_ACCESS_ACCEPT &&
+ 	    hdr->code != RADIUS_CODE_ACCESS_REJECT) {
+-		wpa_printf(MSG_DEBUG, "Unknown RADIUS message code %d to ACL "
+-			   "query", hdr->code);
++		wpa_printf(MSG_DEBUG,
++			   "Unknown RADIUS message code %d to ACL query",
++			   hdr->code);
+ 		return RADIUS_RX_UNKNOWN;
+ 	}
+ 
+@@ -506,8 +508,9 @@ hostapd_acl_recv_radius(struct radius_msg *msg, struct radius_msg *req,
+ 			    msg, RADIUS_ATTR_ACCT_INTERIM_INTERVAL,
+ 			    &info->acct_interim_interval) == 0 &&
+ 		    info->acct_interim_interval < 60) {
+-			wpa_printf(MSG_DEBUG, "Ignored too small "
+-				   "Acct-Interim-Interval %d for STA " MACSTR,
++			wpa_printf(MSG_DEBUG,
++				   "Ignored too small Acct-Interim-Interval %d for STA "
++				   MACSTR,
+ 				   info->acct_interim_interval,
+ 				   MAC2STR(query->addr));
+ 			info->acct_interim_interval = 0;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_01.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_01.patch
new file mode 100644
index 0000000000..dab2eedd6a
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_01.patch
@@ -0,0 +1,165 @@
+From adac846bd0e258a0aa50750bbd2b411fa0085c46 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:11:44 +0200
+Subject: [PATCH 2/9] RADIUS: Allow Message-Authenticator attribute as the
+ first attribute
+
+If a Message-Authenticator attribute was already added to a RADIUS
+message, use that attribute instead of adding a new one when finishing
+message building. This allows the Message-Authenticator attribute to be
+placed as the first attribute in the message.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=adac846bd0e258a0aa50750bbd2b411fa0085c46]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius.c | 85 ++++++++++++++++++++++++++++-----------------
+ src/radius/radius.h |  1 +
+ 2 files changed, 54 insertions(+), 32 deletions(-)
+
+diff --git a/src/radius/radius.c b/src/radius/radius.c
+index be16e27b9..2d2e00b5c 100644
+--- a/src/radius/radius.c
++++ b/src/radius/radius.c
+@@ -364,25 +364,54 @@ void radius_msg_dump(struct radius_msg *msg)
+ }
+ 
+ 
++u8 * radius_msg_add_msg_auth(struct radius_msg *msg)
++{
++	u8 auth[MD5_MAC_LEN];
++	struct radius_attr_hdr *attr;
++
++	os_memset(auth, 0, MD5_MAC_LEN);
++	attr = radius_msg_add_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
++				   auth, MD5_MAC_LEN);
++	if (!attr) {
++		wpa_printf(MSG_ERROR,
++			   "WARNING: Could not add Message-Authenticator");
++		return NULL;
++	}
++
++	return (u8 *) (attr + 1);
++}
++
++
++static u8 * radius_msg_auth_pos(struct radius_msg *msg)
++{
++	u8 *pos;
++	size_t alen;
++
++	if (radius_msg_get_attr_ptr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
++				    &pos, &alen, NULL) == 0 &&
++	    alen == MD5_MAC_LEN) {
++		/* Use already added Message-Authenticator attribute */
++		return pos;
++	}
++
++	/* Add a Message-Authenticator attribute */
++	return radius_msg_add_msg_auth(msg);
++}
++
++
+ int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
+ 		      size_t secret_len)
+ {
+ 	if (secret) {
+-		u8 auth[MD5_MAC_LEN];
+-		struct radius_attr_hdr *attr;
++		u8 *pos;
+ 
+-		os_memset(auth, 0, MD5_MAC_LEN);
+-		attr = radius_msg_add_attr(msg,
+-					   RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
+-					   auth, MD5_MAC_LEN);
+-		if (attr == NULL) {
+-			wpa_printf(MSG_WARNING, "RADIUS: Could not add "
+-				   "Message-Authenticator");
++		pos = radius_msg_auth_pos(msg);
++		if (!pos)
+ 			return -1;
+-		}
+ 		msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+-		hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
+-			 wpabuf_len(msg->buf), (u8 *) (attr + 1));
++		if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
++			     wpabuf_len(msg->buf), pos) < 0)
++			return -1;
+ 	} else
+ 		msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+ 
+@@ -398,23 +427,19 @@ int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
+ int radius_msg_finish_srv(struct radius_msg *msg, const u8 *secret,
+ 			  size_t secret_len, const u8 *req_authenticator)
+ {
+-	u8 auth[MD5_MAC_LEN];
+-	struct radius_attr_hdr *attr;
+ 	const u8 *addr[4];
+ 	size_t len[4];
++	u8 *pos;
+ 
+-	os_memset(auth, 0, MD5_MAC_LEN);
+-	attr = radius_msg_add_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
+-				   auth, MD5_MAC_LEN);
+-	if (attr == NULL) {
+-		wpa_printf(MSG_ERROR, "WARNING: Could not add Message-Authenticator");
++	pos = radius_msg_auth_pos(msg);
++	if (!pos)
+ 		return -1;
+-	}
+ 	msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+ 	os_memcpy(msg->hdr->authenticator, req_authenticator,
+ 		  sizeof(msg->hdr->authenticator));
+-	hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
+-		 wpabuf_len(msg->buf), (u8 *) (attr + 1));
++	if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
++		     wpabuf_len(msg->buf), pos) < 0)
++		return -1;
+ 
+ 	/* ResponseAuth = MD5(Code+ID+Length+RequestAuth+Attributes+Secret) */
+ 	addr[0] = (u8 *) msg->hdr;
+@@ -442,21 +467,17 @@ int radius_msg_finish_das_resp(struct radius_msg *msg, const u8 *secret,
+ {
+ 	const u8 *addr[2];
+ 	size_t len[2];
+-	u8 auth[MD5_MAC_LEN];
+-	struct radius_attr_hdr *attr;
++	u8 *pos;
+ 
+-	os_memset(auth, 0, MD5_MAC_LEN);
+-	attr = radius_msg_add_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
+-				   auth, MD5_MAC_LEN);
+-	if (attr == NULL) {
+-		wpa_printf(MSG_WARNING, "Could not add Message-Authenticator");
++	pos = radius_msg_auth_pos(msg);
++	if (!pos)
+ 		return -1;
+-	}
+ 
+ 	msg->hdr->length = host_to_be16(wpabuf_len(msg->buf));
+ 	os_memcpy(msg->hdr->authenticator, req_hdr->authenticator, 16);
+-	hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
+-		 wpabuf_len(msg->buf), (u8 *) (attr + 1));
++	if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
++		     wpabuf_len(msg->buf), pos) < 0)
++		return -1;
+ 
+ 	/* ResponseAuth = MD5(Code+ID+Length+RequestAuth+Attributes+Secret) */
+ 	addr[0] = wpabuf_head_u8(msg->buf);
+diff --git a/src/radius/radius.h b/src/radius/radius.h
+index fb8148180..6b9dfbca2 100644
+--- a/src/radius/radius.h
++++ b/src/radius/radius.h
+@@ -240,6 +240,7 @@ struct wpabuf * radius_msg_get_buf(struct radius_msg *msg);
+ struct radius_msg * radius_msg_new(u8 code, u8 identifier);
+ void radius_msg_free(struct radius_msg *msg);
+ void radius_msg_dump(struct radius_msg *msg);
++u8 * radius_msg_add_msg_auth(struct radius_msg *msg);
+ int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
+ 		      size_t secret_len);
+ int radius_msg_finish_srv(struct radius_msg *msg, const u8 *secret,
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_02.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_02.patch
new file mode 100644
index 0000000000..02e35bd6de
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_02.patch
@@ -0,0 +1,62 @@
+From 54abb0d3cf35894e7d86e3f7555e95b106306803 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:13:32 +0200
+Subject: [PATCH 3/9] RADIUS server: Place Message-Authenticator attribute as
+ the first one
+
+Move the Message-Authenticator attribute to be the first attribute in
+the RADIUS messages. This mitigates certain MD5 attacks against
+RADIUS/UDP.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=54abb0d3cf35894e7d86e3f7555e95b106306803]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_server.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/radius/radius_server.c b/src/radius/radius_server.c
+index e02c21540..fa3691548 100644
+--- a/src/radius/radius_server.c
++++ b/src/radius/radius_server.c
+@@ -920,6 +920,11 @@ radius_server_encapsulate_eap(struct radius_server_data *data,
+ 		return NULL;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg)) {
++		radius_msg_free(msg);
++		return NULL;
++	}
++
+ 	sess_id = htonl(sess->sess_id);
+ 	if (code == RADIUS_CODE_ACCESS_CHALLENGE &&
+ 	    !radius_msg_add_attr(msg, RADIUS_ATTR_STATE,
+@@ -1204,6 +1209,11 @@ radius_server_macacl(struct radius_server_data *data,
+ 		return NULL;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg)) {
++		radius_msg_free(msg);
++		return NULL;
++	}
++
+ 	if (radius_msg_copy_attr(msg, request, RADIUS_ATTR_PROXY_STATE) < 0) {
+ 		RADIUS_DEBUG("Failed to copy Proxy-State attribute(s)");
+ 		radius_msg_free(msg);
+@@ -1253,6 +1263,11 @@ static int radius_server_reject(struct radius_server_data *data,
+ 		return -1;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg)) {
++		radius_msg_free(msg);
++		return -1;
++	}
++
+ 	os_memset(&eapfail, 0, sizeof(eapfail));
+ 	eapfail.code = EAP_CODE_FAILURE;
+ 	eapfail.identifier = 0;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_03.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_03.patch
new file mode 100644
index 0000000000..c4aa40c811
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_03.patch
@@ -0,0 +1,37 @@
+From 689a248260c9708e6c92cd8635382725a29e34ca Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:16:12 +0200
+Subject: [PATCH 4/9] eapol_test: Move Message-Authenticator attribute to be
+ the first one
+
+Even if this is not strictly speaking necessary for mitigating certain
+RADIUS protocol attacks, be consistent with the RADIUS server behavior
+and move the Message-Authenticator attribute to be the first attribute
+in the message from RADIUS client.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=689a248260c9708e6c92cd8635382725a29e34ca]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ wpa_supplicant/eapol_test.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/wpa_supplicant/eapol_test.c b/wpa_supplicant/eapol_test.c
+index e256ac50e..57082e4b8 100644
+--- a/wpa_supplicant/eapol_test.c
++++ b/wpa_supplicant/eapol_test.c
+@@ -194,6 +194,9 @@ static void ieee802_1x_encapsulate_radius(struct eapol_test_data *e,
+ 		return;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg))
++		goto fail;
++
+ 	radius_msg_make_authenticator(msg);
+ 
+ 	hdr = (const struct eap_hdr *) eap;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_04.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_04.patch
new file mode 100644
index 0000000000..ce499ce8b6
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_04.patch
@@ -0,0 +1,52 @@
+From 37fe8e48ab44d44fe3cf5dd8f52cb0a10be0cd17 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:22:43 +0200
+Subject: [PATCH 5/9] hostapd: Move Message-Authenticator attribute to be the
+ first one in req
+
+Even if this is not strictly speaking necessary for mitigating certain
+RADIUS protocol attacks, be consistent with the RADIUS server behavior
+and move the Message-Authenticator attribute to be the first attribute
+in the message from RADIUS client in hostapd.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=37fe8e48ab44d44fe3cf5dd8f52cb0a10be0cd17]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_11_auth.c | 3 +++
+ src/ap/ieee802_1x.c      | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
+index 47cc625be..2a950cf7f 100644
+--- a/src/ap/ieee802_11_auth.c
++++ b/src/ap/ieee802_11_auth.c
+@@ -119,6 +119,9 @@ static int hostapd_radius_acl_query(struct hostapd_data *hapd, const u8 *addr,
+ 		goto fail;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg))
++		goto fail;
++
+ 	os_snprintf(buf, sizeof(buf), RADIUS_ADDR_FORMAT, MAC2STR(addr));
+ 	if (!radius_msg_add_attr(msg, RADIUS_ATTR_USER_NAME, (u8 *) buf,
+ 				 os_strlen(buf))) {
+diff --git a/src/ap/ieee802_1x.c b/src/ap/ieee802_1x.c
+index 753c88335..89e3dd30e 100644
+--- a/src/ap/ieee802_1x.c
++++ b/src/ap/ieee802_1x.c
+@@ -702,6 +702,9 @@ void ieee802_1x_encapsulate_radius(struct hostapd_data *hapd,
+ 		goto fail;
+ 	}
+ 
++	if (!radius_msg_add_msg_auth(msg))
++		goto fail;
++
+ 	if (sm->identity &&
+ 	    !radius_msg_add_attr(msg, RADIUS_ATTR_USER_NAME,
+ 				 sm->identity, sm->identity_len)) {
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_05.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_05.patch
new file mode 100644
index 0000000000..44113afd4a
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_05.patch
@@ -0,0 +1,51 @@
+From f54157077f799d84ce26bed6ad6b01c4a16e31cf Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:26:58 +0200
+Subject: [PATCH 6/9] RADIUS DAS: Move Message-Authenticator attribute to be
+ the first one
+
+Even if this might not be strictly speaking necessary for mitigating
+certain RADIUS protocol attacks, be consistent with the RADIUS server
+behavior and move the Message-Authenticator attribute to be the first
+attribute in the RADIUS DAS responses from hostapd.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=f54157077f799d84ce26bed6ad6b01c4a16e31cf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_das.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/radius/radius_das.c b/src/radius/radius_das.c
+index aaa3fc267..8d7c9b4c4 100644
+--- a/src/radius/radius_das.c
++++ b/src/radius/radius_das.c
+@@ -177,6 +177,11 @@ fail:
+ 	if (reply == NULL)
+ 		return NULL;
+ 
++	if (!radius_msg_add_msg_auth(reply)) {
++		radius_msg_free(reply);
++		return NULL;
++	}
++
+ 	if (error) {
+ 		if (!radius_msg_add_attr_int32(reply, RADIUS_ATTR_ERROR_CAUSE,
+ 					       error)) {
+@@ -368,6 +373,11 @@ fail:
+ 	if (!reply)
+ 		return NULL;
+ 
++	if (!radius_msg_add_msg_auth(reply)) {
++		radius_msg_free(reply);
++		return NULL;
++	}
++
+ 	if (error &&
+ 	    !radius_msg_add_attr_int32(reply, RADIUS_ATTR_ERROR_CAUSE, error)) {
+ 		radius_msg_free(reply);
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_06.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_06.patch
new file mode 100644
index 0000000000..9a284b5261
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_06.patch
@@ -0,0 +1,46 @@
+From 934b0c3a45ce0726560ccefbd992a9d385c36385 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 16 Mar 2024 11:31:37 +0200
+Subject: [PATCH 7/9] Require Message-Authenticator in Access-Reject even
+ without EAP-Message
+
+Do not allow the exception for missing Message-Authenticator in
+Access-Reject without EAP-Message. While such exception is allowed in
+RADIUS definition, there is no strong reason to maintain this since
+Access-Reject is supposed to include EAP-Message and even if it doesn't,
+discarding Access-Reject will result in the connection not completing.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=934b0c3a45ce0726560ccefbd992a9d385c36385]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_1x.c | 11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/src/ap/ieee802_1x.c b/src/ap/ieee802_1x.c
+index 89e3dd30e..6e7b75128 100644
+--- a/src/ap/ieee802_1x.c
++++ b/src/ap/ieee802_1x.c
+@@ -1939,16 +1939,7 @@ ieee802_1x_receive_auth(struct radius_msg *msg, struct radius_msg *req,
+ 	}
+ 	sta = sm->sta;
+ 
+-	/* RFC 2869, Ch. 5.13: valid Message-Authenticator attribute MUST be
+-	 * present when packet contains an EAP-Message attribute */
+-	if (hdr->code == RADIUS_CODE_ACCESS_REJECT &&
+-	    radius_msg_get_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR, NULL,
+-				0) < 0 &&
+-	    radius_msg_get_attr(msg, RADIUS_ATTR_EAP_MESSAGE, NULL, 0) < 0) {
+-		wpa_printf(MSG_DEBUG,
+-			   "Allowing RADIUS Access-Reject without Message-Authenticator since it does not include EAP-Message");
+-	} else if (radius_msg_verify(msg, shared_secret, shared_secret_len,
+-				     req, 1)) {
++	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 1)) {
+ 		wpa_printf(MSG_INFO,
+ 			   "Incoming RADIUS packet did not have correct Message-Authenticator - dropped");
+ 		return RADIUS_RX_INVALID_AUTHENTICATOR;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_07.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_07.patch
new file mode 100644
index 0000000000..177c6f81e6
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_07.patch
@@ -0,0 +1,67 @@
+From 58097123ec5ea6f8276b38cb9b07669ec368a6c1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 17 Mar 2024 10:42:56 +0200
+Subject: [PATCH 8/9] RADIUS: Require Message-Authenticator attribute in MAC
+ ACL cases
+
+hostapd required Message-Authenticator attribute to be included in EAP
+authentication cases, but that requirement was not in place for MAC ACL
+cases. Start requiring Message-Authenticator attribute for MAC ACL by
+default. Unlike the EAP case, this can still be disabled with
+radius_require_message_authenticator=1 to maintain compatibility with
+some RADIUS servers when used in a network where the connection to such
+a server is secure.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=58097123ec5ea6f8276b38cb9b07669ec368a6c1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ap_config.c       |  1 +
+ src/ap/ap_config.h       |  1 +
+ src/ap/ieee802_11_auth.c |  4 +++-
+ 5 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/src/ap/ap_config.c b/src/ap/ap_config.c
+index 86b6e097c..cf497a180 100644
+--- a/src/ap/ap_config.c
++++ b/src/ap/ap_config.c
+@@ -120,6 +120,7 @@ void hostapd_config_defaults_bss(struct hostapd_bss_config *bss)
+ #endif /* CONFIG_IEEE80211R_AP */
+ 
+ 	bss->radius_das_time_window = 300;
++	bss->radius_require_message_authenticator = 1;
+ 
+ 	bss->anti_clogging_threshold = 5;
+ 	bss->sae_sync = 5;
+diff --git a/src/ap/ap_config.h b/src/ap/ap_config.h
+index 49cd3168a..22ad617f4 100644
+--- a/src/ap/ap_config.h
++++ b/src/ap/ap_config.h
+@@ -302,6 +302,7 @@ struct hostapd_bss_config {
+ 	struct hostapd_ip_addr own_ip_addr;
+ 	char *nas_identifier;
+ 	struct hostapd_radius_servers *radius;
++	int radius_require_message_authenticator;
+ 	int acct_interim_interval;
+ 	int radius_request_cui;
+ 	struct hostapd_radius_attr *radius_auth_req_attr;
+diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
+index 2a950cf7f..dab9bcde3 100644
+--- a/src/ap/ieee802_11_auth.c
++++ b/src/ap/ieee802_11_auth.c
+@@ -474,7 +474,9 @@ hostapd_acl_recv_radius(struct radius_msg *msg, struct radius_msg *req,
+ 		   "Found matching Access-Request for RADIUS message (id=%d)",
+ 		   query->radius_id);
+ 
+-	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 0)) {
++	if (radius_msg_verify(
++		    msg, shared_secret, shared_secret_len, req,
++		    hapd->conf->radius_require_message_authenticator)) {
+ 		wpa_printf(MSG_INFO,
+ 			   "Incoming RADIUS packet did not have correct authenticator - dropped");
+ 		return RADIUS_RX_INVALID_AUTHENTICATOR;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_08.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_08.patch
new file mode 100644
index 0000000000..e23d1e0047
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_08.patch
@@ -0,0 +1,47 @@
+From f302d9f9646704cce745734af21d540baa0da65f Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 17 Mar 2024 10:47:58 +0200
+Subject: [PATCH 9/9] RADIUS: Check Message-Authenticator if it is present even
+ if not required
+
+Always check the Message-Authenticator attribute in a received RADIUS
+message if it is present. Previously, this would have been skipped if
+the attribute was not required to be present.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=f302d9f9646704cce745734af21d540baa0da65f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/src/radius/radius.c b/src/radius/radius.c
+index 2d2e00b5c..a0e3ce399 100644
+--- a/src/radius/radius.c
++++ b/src/radius/radius.c
+@@ -879,6 +879,20 @@ int radius_msg_verify(struct radius_msg *msg, const u8 *secret,
+ 		return 1;
+ 	}
+ 
++	if (!auth) {
++		u8 *pos;
++		size_t alen;
++
++		if (radius_msg_get_attr_ptr(msg,
++					    RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
++					    &pos, &alen, NULL) == 0) {
++			/* Check the Message-Authenticator attribute since it
++			 * was included even if we are configured to not
++			 * require it. */
++			auth = 1;
++		}
++	}
++
+ 	if (auth &&
+ 	    radius_msg_verify_msg_auth(msg, secret, secret_len,
+ 				       sent_msg->hdr->authenticator)) {
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 696176907c..f5e9dce17c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -26,6 +26,15 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch \
+           file://CVE-2024-3596_00.patch \
+           file://CVE-2024-3596_01.patch \
+           file://CVE-2024-3596_02.patch \
+           file://CVE-2024-3596_03.patch \
+           file://CVE-2024-3596_04.patch \
+           file://CVE-2024-3596_05.patch \
+           file://CVE-2024-3596_06.patch \
+           file://CVE-2024-3596_07.patch \
+           file://CVE-2024-3596_08.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
-- 
2.34.1


