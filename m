Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FC1C87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:06:03 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.43863.1753902354364279965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IK/m9k3Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2402b5396cdso1317635ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902354; x=1754507154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b56LONlfoU/cv08FEw8TXJbqncYEoe1+azs0knyIK7s=;
        b=IK/m9k3QYQWJ7IM3s1ctpVnlE5bsB+8qsDRCenMT1lmndsAd7kut97LbjVI/Yh5LRD
         MA6jq+944JQGhh36k/PgGq2UmHwZgPKsrG0rsBWp9b8mO/76JpSAZ6gTviTqkC1ueBfX
         T7uy/j5DgAZWIpTTprHnJhPyr4mBlL/Cyh3JOu2y0CjQg5MKUStV+wr3X1IrzR++Y65Y
         FeR/c0OaVNiYELWfQNS8gtclRFQZ+8WbSur+kLRH/lKZYrb9bcLihIvxE+AG/OFH/vRw
         PfWWdFsBeYvBezbnFUAQeNLL+EIsTp7t1tJikw4CiHye+JQSSa+yOmlrbZBoyXpK4U3m
         moQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902354; x=1754507154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b56LONlfoU/cv08FEw8TXJbqncYEoe1+azs0knyIK7s=;
        b=r7aBgNTFVCEtnk5PsDql2WvzD+aPILbiNujbLuo7IKwSpZ3s/OHDlbsPtXtU1l5H+C
         79DdTe5ahDb7tlkvpXy7c1ByLQW1FtQpNRXQ9AdeIblaIIv8AFveFzU9veeN4I1+PE0+
         KGrtW3qRIkn+j48GPHRSca4EgXJUt9tWj66PeG9pQWfy9bckp4+t4DBkhyqu54DFsJGi
         E+DvYc6iefm1o3W5sIy+YXcPLbf68pMiUxRIpjE+hAa+O9ptVo1rgoveFNKDF6/JVSQU
         Bri26DDJvW5jIca86qdUsC1Mq0Cqw+GQA74He6d0AZZ2eAdNNqsuWRwghjM1lQPpheyL
         4c5Q==
X-Gm-Message-State: AOJu0YwhP4pAx6/sq7hkVDCxcGy/Rbd9MK+92Hig72XVg7tRk17JFJEP
	sFpRTEWiiZLw/wd2wWVrY+/pPqzaJFRvIreA8G+P3AA3uNln+Kgg0e09ZldBImDb+6CwQDPvYog
	x2s6C
X-Gm-Gg: ASbGncuHLVNvA34eWksrVeJlODVknZFo8O77HCFo0IfaD5yxz/R9UmLrpx3o4KUnQ9t
	3I8ve6TA2zEd39tO0zrLVy8st4ADPypbvq/gRXaNiW/RQdkWeYR9Pvhk3b+9fPBs+0NTmLE68it
	sF1gn4zd6g74tZ4GIRG+g98iNSBCUXQ1rxrqOzWcvdoFcBQZdoIpay6cqJqFLYPe6zfcAS05xTl
	HS/MlP7sUlyi4a9bNMbkBEH0ZlAun7mJ2mLTB+h9z04narUSodqpLBurmzdpQdCyJtZOd74MdRR
	lJvwouHuzuxXh5jDVYkNP5fTtxVWkBOv/sX3TKdgHGrL0HhdCC0IzopzXFA6R9uweTUIlm1eSzw
	FbvKC6AQ96KDa
X-Google-Smtp-Source: AGHT+IHaY/EzmLpV/0ZtmQs5fpsd+Y5+kYSdEgzs1vj/SCpilPL+Ck4DPisc6Q26BYHCSfNipOVwoA==
X-Received: by 2002:a17:903:2290:b0:223:65dc:4580 with SMTP id d9443c01a7336-24096b480d3mr67794365ad.52.1753902353160;
        Wed, 30 Jul 2025 12:05:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] gnutls: patch CVE-2025-6395
Date: Wed, 30 Jul 2025 12:05:31 -0700
Message-ID: <3680d0e2021c609f624c2170b061e6696fd8254c.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221145

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2025-6395.patch         | 299 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 2 files changed, 300 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-6395.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-6395.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-6395.patch
new file mode 100644
index 0000000000..9bc98ef6e4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-6395.patch
@@ -0,0 +1,299 @@
+From 23135619773e6ec087ff2abc65405bd4d5676bad Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Mon, 7 Jul 2025 11:15:45 +0900
+Subject: [PATCH] handshake: clear HSK_PSK_SELECTED is when resetting
+ binders
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When a TLS 1.3 handshake involves HRR and resumption or PSK, and the
+second Client Hello omits PSK, the server would result in a NULL
+pointer dereference as the PSK binder information is cleared while the
+HSK_PSK_SELECTED flag is still set. This makes sure that
+HSK_PSK_SELECTED flag is always cleared when the PSK binders are
+reset. This also makes it clear the HSK_PSK_SELECTED flag is valid
+only during a handshake; after that, whether PSK is used can be
+checked with gnutls_auth_client_get_type.
+
+Reported by Stefan Bühler.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2025-6395
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/23135619773e6ec087ff2abc65405bd4d5676bad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                                  |   4 +
+ lib/handshake.c                       |  25 +++-
+ lib/state.c                           |   4 +-
+ tests/Makefile.am                     |   2 +
+ tests/tls13/hello_retry_request_psk.c | 173 ++++++++++++++++++++++++++
+ 5 files changed, 204 insertions(+), 4 deletions(-)
+ create mode 100644 tests/tls13/hello_retry_request_psk.c
+
+diff --git a/NEWS b/NEWS
+index 1334516c6..d800e83b0 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,10 @@ Copyright (C) 2000-2016 Free Software Foundation, Inc.
+ Copyright (C) 2013-2019 Nikos Mavrogiannopoulos
+ See the end for copying conditions.
+ 
++** libgnutls: Fix NULL pointer dereference when 2nd Client Hello omits PSK
++   Reported by Stefan Bühler. [GNUTLS-SA-2025-07-07-4, CVSS: medium]
++   [CVE-2025-6395]
++
+ ** libgnutls: Fix heap read buffer overrun in parsing X.509 SCTS timestamps
+    Spotted by oss-fuzz and reported by OpenAI Security Research Team,
+    and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
+diff --git a/lib/handshake.c b/lib/handshake.c
+index 722307be7..489d02194 100644
+--- a/lib/handshake.c
++++ b/lib/handshake.c
+@@ -590,9 +590,28 @@ static int set_auth_types(gnutls_session_t session)
+ 		/* Under TLS1.3 this returns a KX which matches the negotiated
+ 		 * groups from the key shares; if we are resuming then the KX seen
+ 		 * here doesn't match the original session. */
+-		if (!session->internals.resumed)
+-			kx = gnutls_kx_get(session);
+-		else
++		if (!session->internals.resumed) {
++			const gnutls_group_entry_st *group = get_group(session);
++
++			if (session->internals.hsk_flags & HSK_PSK_SELECTED) {
++				if (group) {
++					kx = group->pk == GNUTLS_PK_DH ?
++						     GNUTLS_KX_DHE_PSK :
++						     GNUTLS_KX_ECDHE_PSK;
++				} else {
++					kx = GNUTLS_KX_PSK;
++				}
++			} else if (group) {
++				/* Not necessarily be RSA, but just to
++				 * make _gnutls_map_kx_get_cred below
++				 * work.
++				 */
++				kx = group->pk == GNUTLS_PK_DH ?
++					     GNUTLS_KX_DHE_RSA :
++					     GNUTLS_KX_ECDHE_RSA;
++			} else
++				kx = GNUTLS_KX_UNKNOWN;
++		} else
+ 			kx = GNUTLS_KX_UNKNOWN;
+ 	} else {
+ 		/* TLS1.2 or earlier, kx is associated with ciphersuite */
+diff --git a/lib/state.c b/lib/state.c
+index ec514c0cd..10ec0eadb 100644
+--- a/lib/state.c
++++ b/lib/state.c
+@@ -206,7 +206,8 @@ gnutls_kx_algorithm_t gnutls_kx_get(gnutls_session_t session)
+ 		const gnutls_group_entry_st *group = get_group(session);
+ 
+ 		if (ver->tls13_sem) {
+-			if (session->internals.hsk_flags & HSK_PSK_SELECTED) {
++			if (gnutls_auth_client_get_type(session) ==
++			    GNUTLS_CRD_PSK) {
+ 				if (group) {
+ 					if (group->pk == GNUTLS_PK_DH)
+ 						return GNUTLS_KX_DHE_PSK;
+@@ -357,6 +358,7 @@ void reset_binders(gnutls_session_t session)
+ 	_gnutls_free_temp_key_datum(&session->key.binders[0].psk);
+ 	_gnutls_free_temp_key_datum(&session->key.binders[1].psk);
+ 	memset(session->key.binders, 0, sizeof(session->key.binders));
++	session->internals.hsk_flags &= ~HSK_PSK_SELECTED;
+ }
+ 
+ /* Check whether certificate credentials of type @cert_type are set
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index c2d226a00..e43faf10f 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -128,6 +128,8 @@ ctests += tls13/hello_retry_request
+ 
+ ctests += tls13/hello_retry_request_resume
+ 
++ctests += tls13/hello_retry_request_psk
++
+ ctests += tls13/psk-ext
+ 
+ ctests += tls13/key_update
+diff --git a/tests/tls13/hello_retry_request_psk.c b/tests/tls13/hello_retry_request_psk.c
+new file mode 100644
+index 000000000..a20cb0d96
+--- /dev/null
++++ b/tests/tls13/hello_retry_request_psk.c
+@@ -0,0 +1,173 @@
++/*
++ * Copyright (C) 2017-2025 Red Hat, Inc.
++ *
++ * Author: Nikos Mavrogiannopoulos, Daiki Ueno
++ *
++ * This file is part of GnuTLS.
++ *
++ * GnuTLS is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 3 of the License, or
++ * (at your option) any later version.
++ *
++ * GnuTLS is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <stdint.h>
++
++#include <string.h>
++#include <gnutls/gnutls.h>
++#include <assert.h>
++
++#include "cert-common.h"
++#include "utils.h"
++#include "tls13/ext-parse.h"
++#include "eagain-common.h"
++
++/* This program exercises the case where a TLS 1.3 handshake ends up
++ * with HRR, and the first CH includes PSK while the 2nd CH omits
++ * it */
++
++const char *testname = "hello entry request";
++
++const char *side = "";
++
++#define myfail(fmt, ...) fail("%s: " fmt, testname, ##__VA_ARGS__)
++
++static void tls_log_func(int level, const char *str)
++{
++	fprintf(stderr, "%s|<%d>| %s", side, level, str);
++}
++
++struct ctx_st {
++	unsigned hrr_seen;
++	unsigned hello_counter;
++};
++
++static int pskfunc(gnutls_session_t session, const char *username,
++		   gnutls_datum_t *key)
++{
++	if (debug)
++		printf("psk: username %s\n", username);
++	key->data = gnutls_malloc(4);
++	key->data[0] = 0xDE;
++	key->data[1] = 0xAD;
++	key->data[2] = 0xBE;
++	key->data[3] = 0xEF;
++	key->size = 4;
++	return 0;
++}
++
++static int hello_callback(gnutls_session_t session, unsigned int htype,
++			  unsigned post, unsigned int incoming,
++			  const gnutls_datum_t *msg)
++{
++	struct ctx_st *ctx = gnutls_session_get_ptr(session);
++	assert(ctx != NULL);
++
++	if (htype == GNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST)
++		ctx->hrr_seen = 1;
++
++	if (htype == GNUTLS_HANDSHAKE_CLIENT_HELLO) {
++		if (post == GNUTLS_HOOK_POST)
++			ctx->hello_counter++;
++		else {
++			/* Unset the PSK credential to omit the extension */
++			gnutls_credentials_set(session, GNUTLS_CRD_PSK, NULL);
++		}
++	}
++
++	return 0;
++}
++
++void doit(void)
++{
++	int sret, cret;
++	gnutls_psk_server_credentials_t scred;
++	gnutls_psk_client_credentials_t ccred;
++	gnutls_certificate_credentials_t ccred2;
++	gnutls_session_t server, client;
++	/* Need to enable anonymous KX specifically. */
++	const gnutls_datum_t key = { (void *)"DEADBEEF", 8 };
++
++	struct ctx_st ctx;
++	memset(&ctx, 0, sizeof(ctx));
++
++	global_init();
++
++	gnutls_global_set_log_function(tls_log_func);
++	if (debug)
++		gnutls_global_set_log_level(9);
++
++	/* Init server */
++	assert(gnutls_psk_allocate_server_credentials(&scred) >= 0);
++	gnutls_psk_set_server_credentials_function(scred, pskfunc);
++
++	gnutls_init(&server, GNUTLS_SERVER);
++
++	assert(gnutls_priority_set_direct(
++		       server,
++		       "NORMAL:-VERS-ALL:+VERS-TLS1.3:-GROUP-ALL:+GROUP-X25519:+DHE-PSK",
++		       NULL) >= 0);
++
++	gnutls_credentials_set(server, GNUTLS_CRD_PSK, scred);
++	gnutls_transport_set_push_function(server, server_push);
++	gnutls_transport_set_pull_function(server, server_pull);
++	gnutls_transport_set_ptr(server, server);
++
++	/* Init client */
++	assert(gnutls_psk_allocate_client_credentials(&ccred) >= 0);
++	gnutls_psk_set_client_credentials(ccred, "test", &key,
++					  GNUTLS_PSK_KEY_HEX);
++	assert(gnutls_certificate_allocate_credentials(&ccred2) >= 0);
++
++	assert(gnutls_init(&client, GNUTLS_CLIENT | GNUTLS_KEY_SHARE_TOP) >= 0);
++
++	gnutls_session_set_ptr(client, &ctx);
++
++	cret = gnutls_priority_set_direct(
++		client,
++		"NORMAL:-VERS-ALL:+VERS-TLS1.3:-GROUP-ALL:+GROUP-SECP256R1:+GROUP-X25519:+DHE-PSK",
++		NULL);
++	if (cret < 0)
++		myfail("cannot set TLS 1.3 priorities\n");
++
++	gnutls_credentials_set(client, GNUTLS_CRD_PSK, ccred);
++	gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred2);
++	gnutls_transport_set_push_function(client, client_push);
++	gnutls_transport_set_pull_function(client, client_pull);
++	gnutls_transport_set_ptr(client, client);
++
++	gnutls_handshake_set_hook_function(client, GNUTLS_HANDSHAKE_ANY,
++					   GNUTLS_HOOK_BOTH, hello_callback);
++
++	HANDSHAKE_EXPECT(client, server, GNUTLS_E_AGAIN,
++			 GNUTLS_E_INSUFFICIENT_CREDENTIALS);
++
++	assert(ctx.hrr_seen != 0);
++
++	gnutls_bye(client, GNUTLS_SHUT_WR);
++	gnutls_bye(server, GNUTLS_SHUT_WR);
++
++	gnutls_deinit(client);
++	gnutls_deinit(server);
++
++	gnutls_psk_free_server_credentials(scred);
++	gnutls_psk_free_client_credentials(ccred);
++	gnutls_certificate_free_credentials(ccred2);
++
++	gnutls_global_deinit();
++	reset_buffers();
++}
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 30d4342d00..8c8e08855b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
            file://CVE-2025-32988.patch \
            file://CVE-2025-32990.patch \
+           file://CVE-2025-6395.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.43.0


