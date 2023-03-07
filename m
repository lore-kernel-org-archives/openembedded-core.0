Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DB5C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 16:38:05 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.20313.1678207080641869177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 08:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q3/BWNmS;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso12398308pjs.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678207079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYC21FcT5xays8ong8ahi3aiFru++iLDsHA/ZEHgR7E=;
        b=Q3/BWNmSr4on5MC6GH84JBxFFxPFHMb6evGXb07+6+bEoGfEsAzlmMUG3KzU6i+rxL
         /a4zQW7QvH+8lGUwXtJM+I2ryeMyqubgISQxPoEpy2FrdV9zL6+939OWzBvq5hMhVtkr
         ARsRt28esoq6tNbhrAnIO2iEJOjg5F0YLVR8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYC21FcT5xays8ong8ahi3aiFru++iLDsHA/ZEHgR7E=;
        b=7A4MzJj+L5JORe3ETb97wg/rZjjYdZAlF/7CHUc9Du7ecd/x2GPeunp/IN1O+pVgvm
         zeQlZpOr0ihaPYnhpP6baLDyVlkzF1XtfZfbTifJogBH/D3E6NMG25OE7nGAgA4x1vgI
         P6FRf1hBN4JLXzBL7cSEIfyWwcO2T2U14wd7RED7ARMwn9L7jVrfW/CvkItQgxitppnH
         D+pqsnjvWbc8vUOJg0V6k0ADcOqZ5oKikZEOKyoNP2XuBJddFbHn4zmth03uCxXLNCTn
         oqkhiblwiKDVqi8eR/5hkksfbdsqivq+pOtojHO4vovb6ZCxVcoYNQ3K0rXlqehkHSUz
         dnuA==
X-Gm-Message-State: AO0yUKWfxoJPCSg5lwPubG/t4oF4lCvy6R6PW2mVn8gnFaf/W/Mcc3M1
	ZV3D506o1LRZCciU0jDuQqcGI3zmrbUlE3UVtyw=
X-Google-Smtp-Source: AK7set9rfjkRciWwjFUTVfiuFr9xkzCLeLBwL6Yc7Y5Zt5kbDoNENsFgN3lTeNQ8/QTTJQxsyr+CJw==
X-Received: by 2002:a17:902:bb8c:b0:19e:72c9:7ebf with SMTP id m12-20020a170902bb8c00b0019e72c97ebfmr13066047pls.6.1678207079359;
        Tue, 07 Mar 2023 08:37:59 -0800 (PST)
Received: from vkumbhar-Latitude-3400.mvista.com ([115.96.165.198])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709028f8f00b00198f1de408csm8607655plo.268.2023.03.07.08.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:37:58 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gnutls: fix CVE-2023-0361 timing side-channel in the TLS RSA key exchange code
Date: Tue,  7 Mar 2023 22:07:49 +0530
Message-Id: <20230307163749.1601747-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 16:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178115

Remove branching that depends on secret data.

since the `ok` variable isn't used any more, we can remove all code
used to calculate it

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../gnutls/gnutls/CVE-2023-0361.patch         | 85 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |  1 +
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index fb06337efb..fcd9af05dc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -22,6 +22,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://CVE-2022-2509.patch \
+           file://CVE-2023-0361.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.25.1


