Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DB7C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 06:44:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1399.1678257882938308517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 22:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=L7kmLTdw;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id x11so12238788pln.12
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678257882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmZddZJQXXEUET992bG90nj7fUrmIyAg+R+Awn8oIaQ=;
        b=L7kmLTdwiT/ECBnnKms48/lPpftp4GYKwfV4/+rHhNqFVTI9KuhZhG8aDiegFImSUN
         KWl2RubMh9d34W4DUHjZ8ehWm1iYVeYHenzKQ5/mL6BA0GIWlJWe/DDPaCfIfFBHgnaT
         Kv7wFzzWxUAipQXFITu7unzeqB0Gg2mBMKTmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678257882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmZddZJQXXEUET992bG90nj7fUrmIyAg+R+Awn8oIaQ=;
        b=aJORLXgv8bgU30l9fjtQ9Pq1Ato67oXacU2H15/74TZcKtTwHD83PkXHgn5RfgFMB9
         CRDPpheyTes07d562rm3pOobjlDO3lF42M8abDuZsWXSlnbmtcZXZuN/EPp36PJIGsYm
         cqSGjrUTorxD8d5ccg/Q2PAn3gzQGHM8nJcr9hMTqGBGUBcQtVXAqZLfP5Pn2/lmTxwr
         x1QQoZVAANQ11XCYHTUKM4ArSb/G+PyQI8zP4D/hupAEttBHCAfc0wGLmOSQ22z3Fr7a
         EX2EOK55g0t9udonMTsXSazSScy5lC8G99oVLK6OgPWkhmhGq8/lKtU+LncmMG/PlbsB
         QlHA==
X-Gm-Message-State: AO0yUKUcy6IVXDGkXTmDL3GrM9HXXjZo5CVgPMeEKeywoBgHoqZ3KH+R
	Tb5A88V6REsBqBbWdrMLJiUGZkq0pxR0ccCAVMA=
X-Google-Smtp-Source: AK7set9Fie/bQP+EjeCR1PNzWFtqqebuterj/W2Wu5U4aoQfFIrHMbrJFUWpzL8bpdk+GRCOWsnalA==
X-Received: by 2002:a17:903:244b:b0:19c:c9da:a62e with SMTP id l11-20020a170903244b00b0019cc9daa62emr20424441pls.54.1678257881814;
        Tue, 07 Mar 2023 22:44:41 -0800 (PST)
Received: from localhost.localdomain ([115.96.165.198])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902ce8300b001967580f60fsm9317444plg.260.2023.03.07.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 22:44:41 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] gnutls: fix CVE-2023-0361 timing side-channel in the TLS RSA key exchange code
Date: Wed,  8 Mar 2023 12:14:30 +0530
Message-Id: <20230308064430.616932-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 06:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178154

Remove branching that depends on secret data.

since the `ok` variable isn't used any more, we can remove all code
used to calculate it

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../gnutls/gnutls/CVE-2023-0361.patch         | 85 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch b/meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch
new file mode 100644
index 0000000000..943f4ca704
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch
@@ -0,0 +1,85 @@
+From 80a6ce8ddb02477cd724cd5b2944791aaddb702a Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 9 Aug 2022 16:05:53 +0200
+Subject: [PATCH] auth/rsa: side-step potential side-channel
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+Signed-off-by: Hubert Kario <hkario@redhat.com>
+Tested-by: Hubert Kario <hkario@redhat.com>
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/80a6ce8ddb02477cd724cd5b2944791aaddb702a
+                           https://gitlab.com/gnutls/gnutls/-/commit/4b7ff428291c7ed77c6d2635577c83a43bbae558]
+CVE: CVE-2023-0361
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ lib/auth/rsa.c | 30 +++---------------------------
+ 1 file changed, 3 insertions(+), 27 deletions(-)
+
+diff --git a/lib/auth/rsa.c b/lib/auth/rsa.c
+index 8108ee8..858701f 100644
+--- a/lib/auth/rsa.c
++++ b/lib/auth/rsa.c
+@@ -155,13 +155,10 @@ static int
+ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+		   size_t _data_size)
+ {
+-	const char attack_error[] = "auth_rsa: Possible PKCS #1 attack\n";
+	gnutls_datum_t ciphertext;
+	int ret, dsize;
+	ssize_t data_size = _data_size;
+	volatile uint8_t ver_maj, ver_min;
+-	volatile uint8_t check_ver_min;
+-	volatile uint32_t ok;
+
+ #ifdef ENABLE_SSL3
+	if (get_num_version(session) == GNUTLS_SSL3) {
+@@ -187,7 +184,6 @@ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+
+	ver_maj = _gnutls_get_adv_version_major(session);
+	ver_min = _gnutls_get_adv_version_minor(session);
+-	check_ver_min = (session->internals.allow_wrong_pms == 0);
+
+	session->key.key.data = gnutls_malloc(GNUTLS_MASTER_SIZE);
+	if (session->key.key.data == NULL) {
+@@ -206,10 +202,9 @@ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+		return ret;
+	}
+
+-	ret =
+-	    gnutls_privkey_decrypt_data2(session->internals.selected_key,
+-					 0, &ciphertext, session->key.key.data,
+-					 session->key.key.size);
++	gnutls_privkey_decrypt_data2(session->internals.selected_key,
++				     0, &ciphertext, session->key.key.data,
++				     session->key.key.size);
+	/* After this point, any conditional on failure that cause differences
+	 * in execution may create a timing or cache access pattern side
+	 * channel that can be used as an oracle, so treat very carefully */
+@@ -225,25 +220,6 @@ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+	 * Vlastimil Klima, Ondej Pokorny and Tomas Rosa.
+	 */
+
+-	/* ok is 0 in case of error and 1 in case of success. */
+-
+-	/* if ret < 0 */
+-	ok = CONSTCHECK_EQUAL(ret, 0);
+-	/* session->key.key.data[0] must equal ver_maj */
+-	ok &= CONSTCHECK_EQUAL(session->key.key.data[0], ver_maj);
+-	/* if check_ver_min then session->key.key.data[1] must equal ver_min */
+-	ok &= CONSTCHECK_NOT_EQUAL(check_ver_min, 0) &
+-	        CONSTCHECK_EQUAL(session->key.key.data[1], ver_min);
+-
+-	if (ok) {
+-		/* call logging function unconditionally so all branches are
+-		 * indistinguishable for timing and cache access when debug
+-		 * logging is disabled */
+-		_gnutls_no_log("%s", attack_error);
+-	} else {
+-		_gnutls_debug_log("%s", attack_error);
+-	}
+-
+	/* This is here to avoid the version check attack
+	 * discussed above.
+	 */
+--
+2.25.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index f1757871ce..0c3392d521 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2021-20232.patch \
            file://CVE-2022-2509.patch \
            file://CVE-2021-4209.patch \
+           file://CVE-2023-0361.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.25.1


