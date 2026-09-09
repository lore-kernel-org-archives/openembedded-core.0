Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F54C79FBE
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6336.1788939021550095561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2kBjFOdM;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-485abf3b93aso226844f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939020; x=1789543820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=peT+PEiFJL3SuN0Kc8nvFNtZJVxDdFKZkEt4sod1GeE=;
        b=2kBjFOdMdGGjwfiGCiAOHSVeaDsuBRO6BfsdlTlLPkGu/tWBMHlvPMear1MSsSEhjW
         CH9doy5+HET/wMEglVj00X+cExTl4UID7cmoRt1skQi94zY5bUO9OEHk//b+AImSXkwp
         mgRFxnjGA2O4mFjwct1IrBMKFeiI07xTiWHRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939020; x=1789543820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=peT+PEiFJL3SuN0Kc8nvFNtZJVxDdFKZkEt4sod1GeE=;
        b=ZUhLLvQ0NBRHRrSy/7EcUr7Na81wCPxHMngFtMRdXoX5J7tjEx+gYb+t44WRoBh/IQ
         KVmxNZ6yHxnicJyq8S8krRLeixyrGazzkrqTD5XVRp/sc3cwQklzdF5JXOSWpxdOUkp4
         3vLocQyrpt3wWBVuudKjq1NQvDO8c+FS4nl5Gt4ZCsv0IG8it5+sV8YCKJjmaLl3IMvX
         xwnfxuHkP0w9fZfJjF8h9kLPdlp0pUNLRzrlAe6TptZfP+tZb7EH8GAxm+s843sJUfFQ
         ax/0J35WFxnWmYS3lP18o69TWiWCi6mIxruLU8WRyzM4mpYhkG50Hosk6hMJANdm4pzJ
         ATCg==
X-Gm-Message-State: AFuF++n7GFYEhOU3iTsEvjPNk2Gvnp6X0VOXHYDLxK1MCWu9JLG8aVQZ
	8L0hbskPa0au1ndD4NKWNYZOirpJr8EEn/tfGofVQmbN2DVGatOEO4tfljFz14dkTeiNnp85SV9
	oy5wuWBg=
X-Gm-Gg: AYBFou2vav+4aw4XsY0KZEgR3ChmbL6T5iXpdCCbTwt4u0SnHLJzHF1Lb6SjUWVKHnk
	kt55DQFPp63OVHvCcB+Q6O8hb0nXO41cgR7KvRr5vyXvVHSgjQb1YrZbDjyUAa8fCHslB7YnMN6
	7IIyGmFUctvI7EdfGneCq3BY1JaJ+BI39ytomT7dP6Lkfhh+IYhubfTiW0SMuJELyOMLjOe+hRQ
	jJBd63MYd0cVc/Ch8n7UIBTqQUQg1nqjqvIp8Exgov4HUteC3cLhT/FRE+93+0PykbnoSYEnAO6
	DsuHvWuv+R9XizBI5lZxSlrwmg716NHGuHdIaGRXiKMvr5KlUd8z9W9UJv2uUR729boq13oSDVs
	/TMRiroSxzPJWvNy8rjkripVXIHHnpkFxVpG1QPCTDGHPDqkLuzqtiDcpMDAlGyc7hM2z3LAWyB
	61wNDclLI9YPr7MuPTRw3Dy9NPA8izEibayM4OL+nnHJNCCpUj8Bng/ibQ46dvmTlC2+kt4OVsU
	JwNuMMg/uuttTqD/bJX1V9WBt1umNDBefRCJDjfSgxT5+0W1lHSvAyeo7YOEQcOca4haI0fv4xh
X-Received: by 2002:a05:6000:2506:b0:485:9227:6bc8 with SMTP id ffacd0b85a97d-48592276c5dmr26329192f8f.24.1788939018418;
        Wed, 09 Sep 2026 00:30:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/38] gnutls: fix CVE-2026-33845
Date: Wed,  9 Sep 2026 09:29:33 +0200
Message-ID: <5d6ef998e1c61e5bf8a438b8856d0772d841b6a3.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245443

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-33845.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-33845

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e87d0415413

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-33845.patch        | 166 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
new file mode 100644
index 00000000000..004d3082c5a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
@@ -0,0 +1,166 @@
+From 490bfb28002fc0253010243ac387c756014c06e5 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 23 Mar 2026 15:09:43 +0100
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
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/buffers.c    | 50 +++++++++++++++++++++++++-----------------------
+ lib/gnutls_int.h |  4 ++--
+ 2 files changed, 28 insertions(+), 26 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 09779a8f3..02cc222c4 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -919,10 +919,7 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
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
+@@ -936,9 +933,10 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
+ 
+ 	if (hsk->length > 0 &&
+ 	    (frag_size > data_size ||
+-	     (frag_size > 0 && hsk->end_offset >= hsk->length))) {
++	     (frag_size > 0 && hsk->start_offset + frag_size > hsk->length))) {
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+-	} else if (hsk->length == 0 && hsk->end_offset != 0 &&
++	} else if (hsk->length == 0 &&
++		   hsk->start_offset + frag_size != hsk->start_offset &&
+ 		   hsk->start_offset != 0)
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+ 
+@@ -1002,11 +1000,10 @@ static int merge_handshake_packet(gnutls_session_t session,
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
+@@ -1040,20 +1037,27 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		}
+ 
+ 		if (hsk->start_offset < recv_buf[pos].start_offset &&
+-		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
++		    hsk->start_offset + hsk->frag_length >=
++			    recv_buf[pos].start_offset) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 			recv_buf[pos].start_offset = hsk->start_offset;
+-			recv_buf[pos].end_offset =
+-				MIN(hsk->end_offset, recv_buf[pos].end_offset);
+-		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
+-			   hsk->start_offset <= recv_buf[pos].end_offset + 1) {
++			recv_buf[pos].frag_length = MIN(
++				hsk->frag_length, recv_buf[pos].frag_length);
++		} else if (hsk->start_offset + hsk->frag_length >
++				   recv_buf[pos].start_offset +
++					   recv_buf[pos].frag_length &&
++			   hsk->start_offset <=
++				   recv_buf[pos].start_offset +
++					   recv_buf[pos].frag_length) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 
+-			recv_buf[pos].end_offset = hsk->end_offset;
+ 			recv_buf[pos].start_offset = MIN(
+ 				hsk->start_offset, recv_buf[pos].start_offset);
++			recv_buf[pos].frag_length = hsk->start_offset +
++						    hsk->frag_length -
++						    recv_buf[pos].start_offset;
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+@@ -1113,8 +1117,8 @@ static int get_last_packet(gnutls_session_t session,
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
+@@ -1125,8 +1129,9 @@ static int get_last_packet(gnutls_session_t session,
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
+@@ -1313,9 +1318,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_session_t session)
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
+@@ -1331,7 +1334,6 @@ int _gnutls_parse_record_buffered_msgs(gnutls_session_t session)
+ 				ret = merge_handshake_packet(session, &tmp);
+ 				if (ret < 0)
+ 					return gnutls_assert_val(ret);
+-
+ 			} while (_mbuffer_get_udata_size(bufel) > 0);
+ 
+ 			prev = bufel;
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index 54d3c9f67..283f25c07 100644
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 51ef394dfcf..d513752072c 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42011_p1.patch \
            file://CVE-2026-42011_p2.patch \
            file://CVE-2026-42010.patch \
+           file://CVE-2026-33845.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

