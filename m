Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web08.13183.1623163452359955111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GiZiErMB;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id v22so21770785oic.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xs3TWh/5MGxy0lU47O1Xy1sSiRb4+MwpmTEeN/Ipib4=;
        b=GiZiErMB57p0eaMnpmvc6dgdAn4wnSvoVLZUthm4LHrPytZTq9Ev5fUFB4aB+XRHNQ
         Kv1pIcN1d+ZFrJ+LYXwZ9YSfZkQenGettwCtLSNbmnMbogIG+kes5QlDjeERB9jz8+Ly
         I9G2g4r7eB4VjzgbnKRHRNEFEawUz79DEh9+x7mNYQ5u5Lj+4/cR6Qgy0q6gBbCq1MzZ
         fuLId5Fy+jud4C8fcVrG0WWZS1BpJPoRs9KmlCBlj1myTPYWl8Z2+diE5y6+qZFJ/bY9
         jvX0JVvMuupr1vgQZUnQ9rJ203cM76Mi24ueYHY6twDKfsmIyCY05ducKIPlLIJpV8cp
         V9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xs3TWh/5MGxy0lU47O1Xy1sSiRb4+MwpmTEeN/Ipib4=;
        b=JTD2dm5qMg5fOHgaM+FOXgl2yYsvN0E0iCaX6XNFwBhaiY3m/boNRjBAxrJwC4twr2
         9ZXfe0IUbbMuOGZj53uLc5pDPzYeKJJ+fq8akwX8osGAJ55zwdk4bWQg9q8XU10pHg82
         XbxeXpS+l43aB1XrIneS4v3FKl2ZZ2WTxEmrNIZrvqRr2qcmKnfiJDCyLID2Y+Q6jQJF
         1kyaW/WTAQ/I5KOY7MMcoBMHoqeJ3nw+TLdIjCLhve4H/S0fFtzja+tCbVPMSreX1BjJ
         2lHTJOtkakNimEzBmJv5E4lFrad5b/dXFxct/1yeRQqE5DFBRkfu/t0+vg/q0VvgCqPk
         6krw==
X-Gm-Message-State: AOAM532Y3EDVyp2XJGsCA+575b8eMv7RPCD0TEBmOSDnPt/ToNAlmiok
	q8LIDKvQ9+COtClYlnhnaTx+Y8Iya8KJMJP74hs=
X-Google-Smtp-Source: ABdhPJyH1jlGtSweyxUbYzjoV801iE6I42SMOYb2lZWk8MX7XvCwNdhVS2gsRdjAK0ACLrserz7P0A==
X-Received: by 2002:a05:6808:1142:: with SMTP id u2mr2921300oiu.101.1623163451044;
        Tue, 08 Jun 2021 07:44:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l10sm631979otj.17.2021.06.08.07.44.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:44:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] gnutls: fix CVE-2021-20231 CVE-2021-20232
Date: Tue,  8 Jun 2021 04:42:31 -1000
Message-Id: <38a0c77bf576caa3ac54934d141e489599d1b906.1623163071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623163071.git.steve@sakoman.com>
References: <cover.1623163071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2021-20231.patch        | 67 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2021-20232.patch        | 65 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  2 +
 3 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch b/meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
new file mode 100644
index 0000000000..6fe7a21e33
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
@@ -0,0 +1,67 @@
+From 15beb4b193b2714d88107e7dffca781798684e7e Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 29 Jan 2021 14:06:32 +0100
+Subject: [PATCH] key_share: avoid use-after-free around realloc
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+https://gitlab.com/gnutls/gnutls/-/commit/15beb4b193b2714d88107e7dffca781798684e7e
+Upstream-Status: Backport 
+CVE: CVE-2021-CVE-2021-20231
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ lib/ext/key_share.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/lib/ext/key_share.c b/lib/ext/key_share.c
+index ab8abf8fe6..a8c4bb5cff 100644
+--- a/lib/ext/key_share.c
++++ b/lib/ext/key_share.c
+@@ -664,14 +664,14 @@ key_share_send_params(gnutls_session_t session,
+ {
+ 	unsigned i;
+ 	int ret;
+-	unsigned char *lengthp;
+-	unsigned int cur_length;
+ 	unsigned int generated = 0;
+ 	const gnutls_group_entry_st *group;
+ 	const version_entry_st *ver;
+ 
+ 	/* this extension is only being sent on client side */
+ 	if (session->security_parameters.entity == GNUTLS_CLIENT) {
++		unsigned int length_pos;
++
+ 		ver = _gnutls_version_max(session);
+ 		if (unlikely(ver == NULL || ver->key_shares == 0))
+ 			return 0;
+@@ -679,16 +679,13 @@ key_share_send_params(gnutls_session_t session,
+ 		if (!have_creds_for_tls13(session))
+ 			return 0;
+ 
+-		/* write the total length later */
+-		lengthp = &extdata->data[extdata->length];
++		length_pos = extdata->length;
+ 
+ 		ret =
+ 		    _gnutls_buffer_append_prefix(extdata, 16, 0);
+ 		if (ret < 0)
+ 			return gnutls_assert_val(ret);
+ 
+-		cur_length = extdata->length;
+-
+ 		if (session->internals.hsk_flags & HSK_HRR_RECEIVED) { /* we know the group */
+ 			group = get_group(session);
+ 			if (unlikely(group == NULL))
+@@ -736,7 +733,8 @@ key_share_send_params(gnutls_session_t session,
+ 		}
+ 
+ 		/* copy actual length */
+-		_gnutls_write_uint16(extdata->length - cur_length, lengthp);
++		_gnutls_write_uint16(extdata->length - length_pos - 2,
++				     &extdata->data[length_pos]);
+ 
+ 	} else { /* server */
+ 		ver = get_version(session);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch b/meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch
new file mode 100644
index 0000000000..e13917cddb
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch
@@ -0,0 +1,65 @@
+From 75a937d97f4fefc6f9b08e3791f151445f551cb3 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 29 Jan 2021 14:06:50 +0100
+Subject: [PATCH] pre_shared_key: avoid use-after-free around realloc
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+https://gitlab.com/gnutls/gnutls/-/commit/75a937d97f4fefc6f9b08e3791f151445f551cb3
+Upstream-Status: Backport 
+CVE: CVE-2021-CVE-2021-20232
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ lib/ext/pre_shared_key.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ext/pre_shared_key.c b/lib/ext/pre_shared_key.c
+index a042c6488e..380bf39ed5 100644
+--- a/lib/ext/pre_shared_key.c
++++ b/lib/ext/pre_shared_key.c
+@@ -267,7 +267,7 @@ client_send_params(gnutls_session_t session,
+ 	size_t spos;
+ 	gnutls_datum_t username = {NULL, 0};
+ 	gnutls_datum_t user_key = {NULL, 0}, rkey = {NULL, 0};
+-	gnutls_datum_t client_hello;
++	unsigned client_hello_len;
+ 	unsigned next_idx;
+ 	const mac_entry_st *prf_res = NULL;
+ 	const mac_entry_st *prf_psk = NULL;
+@@ -428,8 +428,7 @@ client_send_params(gnutls_session_t session,
+ 	assert(extdata->length >= sizeof(mbuffer_st));
+ 	assert(ext_offset >= (ssize_t)sizeof(mbuffer_st));
+ 	ext_offset -= sizeof(mbuffer_st);
+-	client_hello.data = extdata->data+sizeof(mbuffer_st);
+-	client_hello.size = extdata->length-sizeof(mbuffer_st);
++	client_hello_len = extdata->length-sizeof(mbuffer_st);
+ 
+ 	next_idx = 0;
+ 
+@@ -440,6 +439,11 @@ client_send_params(gnutls_session_t session,
+ 	}
+ 
+ 	if (prf_res && rkey.size > 0) {
++		gnutls_datum_t client_hello;
++
++		client_hello.data = extdata->data+sizeof(mbuffer_st);
++		client_hello.size = client_hello_len;
++
+ 		ret = compute_psk_binder(session, prf_res,
+ 					 binders_len, binders_pos,
+ 					 ext_offset, &rkey, &client_hello, 1,
+@@ -474,6 +478,11 @@ client_send_params(gnutls_session_t session,
+ 	}
+ 
+ 	if (prf_psk && user_key.size > 0 && info) {
++		gnutls_datum_t client_hello;
++
++		client_hello.data = extdata->data+sizeof(mbuffer_st);
++		client_hello.size = client_hello_len;
++
+ 		ret = compute_psk_binder(session, prf_psk,
+ 					 binders_len, binders_pos,
+ 					 ext_offset, &user_key, &client_hello, 0,
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index 903bb5503a..0c68da7c54 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -23,6 +23,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
            file://CVE-2020-24659.patch \
+           file://CVE-2021-20231.patch \
+           file://CVE-2021-20232.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.25.1

