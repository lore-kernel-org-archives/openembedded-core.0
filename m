Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737DDC9830F
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:34 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2818.1790154686337391472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dqgqEpI9;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ecdeso582253f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154684; x=1790759484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q58tnZgvfmr5l/mNDQwSBOb89lI+xqNo+TgnJwg0S/U=;
        b=dqgqEpI9KyB1a+dtv8Y3kp1SP2ep3e5MwdzlTH3suTrq4cHQvcyhDPuTBPiuAqObnC
         ZqqJ3xwcz1+9aiqf216qFu9zElCFQiJu+jQAE3ztlKuID4rTKn4wPn3ry8K3r8J6b0lO
         S8dpTWia5gov4dZYsEzw2TwffSOzUO2ofcj0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154684; x=1790759484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q58tnZgvfmr5l/mNDQwSBOb89lI+xqNo+TgnJwg0S/U=;
        b=dJgmIRfLFJ34CFD2ZWKy0UjxwS3EHyME2/sqiAPteN4Witb0D88dMYM4J6LHN5DnPa
         buM42lPNmnMCmLK2jOagRmJRZGHzYSB2WI7TMBFnTjLR0VbFQ8BB19se74wbbVAmpEiL
         cJdg3Jczix8NTqUPLAhaYkyudEYNQVmWPUyIuAeQnsVsP7g4sWMpJG8ur6kAFZhZpSvc
         QVxBORjgVe86OEQHmH8Zh5ZJmWEVkXp/WJQwO9Y/0YKX5fOUc8LEtywYcaBwua4AyMWI
         aJ2TBEd57cyK1ep+tBka+Q2KzKWhPLZkfAsEY9v3mZdCqkKcb0/Vki8RHkYjgDAtQp2u
         2MSQ==
X-Gm-Message-State: AFuF++l1fAEr5VzWdxIPEtDdvzfMKJ37cW4FR379/FKsUOcFqGkr7gIP
	/3eRxzpUoigPbn78QpDipCin9zeGUL2LzdMOqSfw1ejcbRpE+a7rGSz7zLnjD4bMNkPLf4FJ/id
	JE9U9P3I=
X-Gm-Gg: AYBFou3E2buxZRoBeUrfjeglVug6F37pt+pmXWzIe0OvFFOaXKuENLleljgcBwQoJ7+
	1aEP576jezJq+ik7Um49l4yEY+VY4n/zX7TKDDyMGtr1oYo17mrTao3hJG78scusWadJJj/0uBz
	Q4EZq90D2O8HsrwRN7IKPoTY37KX8x/J0beFlrSrSEGDiD1LyOrzvaDMEH/W4g83qlHlmxeedbb
	SsZvwxCsaK+EuaHr9QybvdCM18UPPowMUc9KF9rZ1uxBOEnMM85cWwGFOfPei0SPJF6Ijo4CURq
	9rVkg7iZkFbaztUpHfBN6dD0z1QqedTuZhQx4N2hoCZnZj67lojq2QGMl2f/TBUCe1lt9ydHMzb
	ZcopcsRD3UgRRtILbAgrxU1j3BtS6pySvaPp9+xoYfaImIYh+ITOUsHDYlN9FiOX7GVpVZZUPoU
	O/gBdoa4SrZuUw6NvUPeKB1lguXdc6HbgbHPJ930YohWB9WkHmryqMdituiAnME2RwsDWINTZ5S
	w5cELfPvw+HnBabXADreOb8nTX7CVsMp57DDBv6WJb3ES3XqOwEtCcU26bCoaoY6sxU0GZxwsY8
	LWkM+XY=
X-Received: by 2002:a05:600c:8b64:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49fdee0a0ebmr22001505e9.4.1790154684519;
        Wed, 23 Sep 2026 02:11:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/48] gnutls: fix CVE-2026-33845
Date: Wed, 23 Sep 2026 11:10:09 +0200
Message-ID: <a624b5ffcb02b5ec566ccc788106391cf1084b5f.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246469

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-33845.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-33845

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e87d0415413

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-33845.patch        | 190 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +
 2 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
new file mode 100644
index 00000000000..13d1d9bf821
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
@@ -0,0 +1,190 @@
+From d217d233d3eb5566a911dad11b639552d63acfac Mon Sep 17 00:00:00 2001
+From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+Date: Wed, 29 Jul 2026 08:54:58 +0000
+Subject: [PATCH] buffers: switch from end_offset over to frag_length
+
+Instead of maintaining an inclusive [start_offset, end_offset] range
+when reassembling DTLS handshake,
+track start_offset and a relative frag_length instead.
+
+You'd think it'd be a no-op, but it fixes:
+
+* 0-length fragments triggering completion if message was 1 byte long
+* a remotely triggerable underflow and an ensuing heap overrun
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1811
+Fixes: CVE-2026-33845
+Fixes: GNUTLS-SA-2026-04-29-3
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-33845
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e87d0415413]
+
+Backport notes: adapted to the stable branch, no logic changes.
+- lib/buffers.c: the local fragment-size variable is named frag_size here,
+  not frag_length as upstream; renamed accordingly.
+- lib/buffers.c: merge_handshake_packet() has no recv_buf alias in this
+  branch, so recv_buf[pos] was expanded to
+  session->internals.handshake_recv_buffer[pos], which changes line wrapping.
+- lib/gnutls_int.h: applies cleanly
+
+Assisted-by: kiro:claude-sonnet-4.6
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/buffers.c    | 59 ++++++++++++++++++++++++++----------------------
+ lib/gnutls_int.h |  4 ++--
+ 2 files changed, 34 insertions(+), 29 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..ad59e4f14 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -923,10 +923,7 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 	}
+ 	data_size = _mbuffer_get_udata_size(bufel) - handshake_header_size;
+ 
+-	if (frag_size > 0)
+-		hsk->end_offset = hsk->start_offset + frag_size - 1;
+-	else
+-		hsk->end_offset = 0;
++	hsk->frag_length = frag_size;
+ 
+ 	_gnutls_handshake_log(
+ 		"HSK[%p]: %s (%u) was received. Length %d[%d], frag offset %d, frag length: %d, sequence: %d\n",
+@@ -940,9 +937,11 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 
+ 	if (hsk->length > 0 &&
+ 	    (frag_size > data_size ||
+-	     (frag_size > 0 && hsk->end_offset >= hsk->length))) {
++	     (frag_size > 0 &&
++	      hsk->start_offset + frag_size > hsk->length))) {
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+-	} else if (hsk->length == 0 && hsk->end_offset != 0 &&
++	} else if (hsk->length == 0 &&
++		   hsk->start_offset + frag_size != hsk->start_offset &&
+ 		   hsk->start_offset != 0)
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+ 
+@@ -991,11 +990,10 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 			hsk->data.length = hsk->length;
+ 		}
+ 
+-		if (hsk->length > 0 && hsk->end_offset > 0 &&
+-		    hsk->end_offset - hsk->start_offset + 1 != hsk->length) {
++		if (hsk->length > 0 && hsk->frag_length > 0 &&
++		    hsk->frag_length != hsk->length) {
+ 			memmove(&hsk->data.data[hsk->start_offset],
+-				hsk->data.data,
+-				hsk->end_offset - hsk->start_offset + 1);
++				hsk->data.data, hsk->frag_length);
+ 		}
+ 
+ 		session->internals.handshake_recv_buffer_size++;
+@@ -1012,7 +1010,7 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		if (hsk->start_offset <
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset &&
+-		    hsk->end_offset + 1 >=
++		    hsk->start_offset + hsk->frag_length >=
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset) {
+ 			memcpy(&session->internals.handshake_recv_buffer[pos]
+@@ -1021,28 +1019,36 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 			session->internals.handshake_recv_buffer[pos]
+ 				.start_offset = hsk->start_offset;
+ 			session->internals.handshake_recv_buffer[pos]
+-				.end_offset = MIN(
+-				hsk->end_offset,
++				.frag_length = MIN(
++				hsk->frag_length,
+ 				session->internals.handshake_recv_buffer[pos]
+-					.end_offset);
+-		} else if (hsk->end_offset >
++					.frag_length);
++		} else if (hsk->start_offset + hsk->frag_length >
+ 				   session->internals.handshake_recv_buffer[pos]
+-					   .end_offset &&
++					   .start_offset +
++					   session->internals
++						   .handshake_recv_buffer[pos]
++						   .frag_length &&
+ 			   hsk->start_offset <=
+ 				   session->internals.handshake_recv_buffer[pos]
+-						   .end_offset +
+-					   1) {
++						   .start_offset +
++					   session->internals
++						   .handshake_recv_buffer[pos]
++						   .frag_length) {
+ 			memcpy(&session->internals.handshake_recv_buffer[pos]
+ 					.data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 
+-			session->internals.handshake_recv_buffer[pos]
+-				.end_offset = hsk->end_offset;
+ 			session->internals.handshake_recv_buffer[pos]
+ 				.start_offset = MIN(
+ 				hsk->start_offset,
+ 				session->internals.handshake_recv_buffer[pos]
+ 					.start_offset);
++			session->internals.handshake_recv_buffer[pos]
++				.frag_length =
++				hsk->start_offset + hsk->frag_length -
++				session->internals.handshake_recv_buffer[pos]
++					.start_offset;
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+@@ -1102,8 +1108,8 @@ static int get_last_packet(gnutls_session_t session,
+ 		}
+ 
+ 		else if ((recv_buf[LAST_ELEMENT].start_offset == 0 &&
+-			  recv_buf[LAST_ELEMENT].end_offset ==
+-				  recv_buf[LAST_ELEMENT].length - 1) ||
++			  recv_buf[LAST_ELEMENT].frag_length ==
++				  recv_buf[LAST_ELEMENT].length) ||
+ 			 recv_buf[LAST_ELEMENT].length == 0) {
+ 			session->internals.dtls.hsk_read_seq++;
+ 			_gnutls_handshake_buffer_move(hsk,
+@@ -1114,8 +1120,9 @@ static int get_last_packet(gnutls_session_t session,
+ 			/* if we don't have a complete handshake message, but we
+ 			 * have queued data waiting, try again to reconstruct the
+ 			 * handshake packet, using the queued */
+-			if (recv_buf[LAST_ELEMENT].end_offset !=
+-				    recv_buf[LAST_ELEMENT].length - 1 &&
++			if ((recv_buf[LAST_ELEMENT].start_offset +
++			     recv_buf[LAST_ELEMENT].frag_length) !=
++				    recv_buf[LAST_ELEMENT].length &&
+ 			    record_check_unprocessed(session) > 0)
+ 				return gnutls_assert_val(
+ 					GNUTLS_E_INT_CHECK_AGAIN);
+@@ -1302,9 +1309,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_session_t session)
+ 					&session->internals.record_buffer,
+ 					bufel, ret);
+ 
+-				data_size = MIN(tmp.length,
+-						tmp.end_offset -
+-							tmp.start_offset + 1);
++				data_size = MIN(tmp.length, tmp.frag_length);
+ 
+ 				ret = _gnutls_buffer_append_data(
+ 					&tmp.data,
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index 8cf9a8715..689dcdc41 100644
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -479,10 +479,10 @@ typedef struct {
+ 	uint16_t sequence;
+ 
+ 	/* indicate whether that message is complete.
+-	 * complete means start_offset == 0 and end_offset == length
++	 * complete means start_offset == 0 and frag_length == length
+ 	 */
+ 	uint32_t start_offset;
+-	uint32_t end_offset;
++	uint32_t frag_length; /* used exclusively in DTLS reassembly */
+ 
+ 	uint8_t header[MAX_HANDSHAKE_HEADER_SIZE];
+ 	int header_size;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 0aa1eef513f..6dbd11abaff 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42011_p1.patch \
            file://CVE-2026-42011_p2.patch \
            file://CVE-2026-33846.patch \
+           file://CVE-2026-33845.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

