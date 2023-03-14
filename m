Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948D4C7618E
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:22:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.11665.1678807354700699602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Acv8NiUz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so8034944pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678807354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z45Xc4r+Cnn6p4s9cUysbE4LW8gxP9Z/6ppTXFpyPio=;
        b=Acv8NiUzcRtgk0cI3siGe43SsW1AjGmyu4ueynzRC0O30VQNDfheTfPRze9pk9Vn6e
         cc70XO2OdKOvZRRKF+B3FQVctcl+Mxrmd7mexsyDsHm6vNdTQJgXSdBnqfQ7alZstjIv
         QMgouhkYLzeMD3Y7k3Y5FjXqEa8TlGtQUsCf0brphrKCCFHR8KxCM4WpNGslgbdHFovG
         ON6XlkG4kK9hnMSYw/rVD6bd7AwKmg7CtOy6Ck6hWtg0WfCwlkdHYMa+VmS1AIaIkHgo
         hgkSoBRAPy+WvxLYdNNhxKOaWL1gxCnkitHbvJvN1auA84XO8WIMhmq4r3Wpvo8YJMaq
         MDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z45Xc4r+Cnn6p4s9cUysbE4LW8gxP9Z/6ppTXFpyPio=;
        b=Nabw82uRcpdTwexxpT+9YSr1uQ4kxAvR0dxcNV+hao9WMZvZ+QMSJ4ND3tvmHRbDgv
         qyMdSPn/jmgB343CavJf1aaRtvMhTaiy9x5zrW8WgQhgwPqnn7qKbX0ff/OXYGAV8Ac5
         rPW6TPxHgN5adcm20/Ctyls+izkpu0fAJx863Jbbw8feRP4eDO4pDIWjjT7P+4ccs0oB
         xYpLQZQzuMbjCtPSW8bYCDL/txFmXny2dohXKOhOno/08sod6koZ2TiNWRswDtvl5RMP
         pgpMkpPnMX1D+8CBfqeKrKZq4h0CWHO8HF/bQ1FTqnLEUBgI1HEe0AiHyFc4Am+YoDKp
         XE6Q==
X-Gm-Message-State: AO0yUKVBrX0qQHTxMkGtNfQngq1e/5u1hSp5gkQzI6TEbEoUEr+YWVXm
	8qHNwCqeboNnBuA9SkHD0bMzBeelTO4dpdAaG6Q=
X-Google-Smtp-Source: AK7set/zLATL0hRu1pxE6N4Mc4gvIpjJ6a+SqZkzn1lwlfpuEsA3U9Bk2tA26DXzq0WmUSPnFpm/Nw==
X-Received: by 2002:a17:902:b487:b0:19c:fa22:e984 with SMTP id y7-20020a170902b48700b0019cfa22e984mr34432151plr.48.1678807353595;
        Tue, 14 Mar 2023 08:22:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a284d00b0023d0e743ff6sm1871977pjf.3.2023.03.14.08.22.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:22:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] gnutls: fix CVE-2023-0361 timing side-channel in the TLS RSA key exchange code
Date: Tue, 14 Mar 2023 05:21:50 -1000
Message-Id: <5b8a3601ebff7a0cdfaa50d7a0b5e384a7e2514c.1678807105.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678807105.git.steve@sakoman.com>
References: <cover.1678807105.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178502

From: Vivek Kumbhar <vkumbhar@mvista.com>

Remove branching that depends on secret data.

since the `ok` variable isn't used any more, we can remove all code
used to calculate it

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


