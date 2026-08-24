Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24155C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:29:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.283.1787585350879343040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M6PY6ekh;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso61505e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787585349; x=1788190149; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXjJVXLv3YEQm5pYufRKkNk0EBOx0Y2F1IbOB0hJolM=;
        b=M6PY6ekhkECPzivUD/n7aVitEnO/s9ZHlKSjRO/Swu0pLy5A/95K95ie6hr7OKhgCK
         YDjAYKBvijpFgqc+S2dAW6H5NrHP4PTXGY+etzJGE99u1/ZIAEwMMxZ/MwM88pdPI3Jk
         35IiV0Z2MGEZnTysVnkH4NQTMEcRwoq9RhlgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585349; x=1788190149;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXjJVXLv3YEQm5pYufRKkNk0EBOx0Y2F1IbOB0hJolM=;
        b=DBp0AKjBBbr6sRyG+JXYxMoMmGGz+5ycF7xxW8YuJGVtIcMCF4gBOYKfLRvXKbvBBC
         mzwPg37hgA5S7cfjHoS38aJxHy7WmlhUibBC9TPZ9ZkM8PLvzQNqC9pUYssXLJs2R1rr
         pJwksxdl5Kc9KPbUnaTi0ajpFaKVWYg1nCv8X8WtLql4A1PaW0BqFXdVi5PmayxQNxez
         U5QIdrDvNaw7VBHJZJuIY2GMklYbgPPBabw7Z+iCuQES2Srk5dqhf6T0r9WkcxnH2H3m
         9w2zKmjjs8S7SpKRZh7K6Begbvfco0AngaXkFv75xxgTF3E0BDD8HVJjquv+TbF6Iy4W
         lRDw==
X-Forwarded-Encrypted: i=1; AHgh+RolRf+n1UPpUe+Jo4UUOirFnkW9hv+rGu1KDARIJNnm1ZptjHPhb2z8cwZpWwnGrXro/8VQ9dZBhfshEkdOllcXpA==@lists.openembedded.org
X-Gm-Message-State: AFuF++m2ftNuH7tgUFfpepqdvNpit9M0jEH+6O9wQfwmAQMRlia4eGiF
	1izn9mq3hWKWNfyBLLGlKccTG6U1+3D6I/PDxFQXeToXM3zJHQ/eXTQT4Cpz7ux6NRo=
X-Gm-Gg: AR+sD12CtCX0qPkRKrObyKJelRYHeLusRVs29CYgePkXrmVVbYAtRlM4HTtH/ORLlLZ
	omACwQNM8g6P1YO+CNKhdcDRWAFysh98a7iYHkv1Vavj2XvmUsR6ivV67aw08RyFWFdzJKKcqCS
	MD55xBBO79C74GTqquKcTXQrB/UyiGyS4ujQkHyx8mFD6GHg5SsVaoqPzmK4QGKGhanbcTmuFY/
	+RDCRDS8qi7d2KUhwWH5Z9D/1oxWbfyNn9+04u4zAMN/HaaPfYeOs/gPfmWuLqXvJ+6vyaXyaeK
	v1wyaK3CbQ5Us7vOsE+o7dDWp5pdJ7C6NvLVLeAK+kuVmG/myvVDjzFyJWa7Q5Uvwdxu6kiQVsO
	VDaQJ97zX8ARe8iXJgtntki0GO4RWifDrZU4lZllYAYpbUtqLsWUYIh8k23/AxqejIsiafhqlOg
	3Dv6ujr6bN/Pdek5poPcxmsQcn1eIUTCzezylW8+2QYFCAtmh2Gfaqd112Y7iuMvNJ7MULTSHf8
	JeUtjg7taDFebl5mIUR6PDx3Yw5NSt2Qdh4G/LrEZlWp/Cg
X-Received: by 2002:a05:600c:3492:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-499d6338030mr91245e9.7.1787585348965;
        Mon, 24 Aug 2026 08:29:08 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90e747esm138100605e9.4.2026.08.24.08.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:29:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 17:29:07 +0200
Message-Id: <DKXA4BZU6EMT.1W6DIXYU6GQ0S@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] gnutls: fix CVE-2026-33845
X-Mailer: aerc 0.20.0
References: <20260727153312.1704911-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260727153312.1704911-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244133

On Mon Jul 27, 2026 at 5:33 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> Backport patch to fix CVE-2026-33845.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-33845
>
> Upstream fix:
>   https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275=
e87d0415413
>
> Tested with ptest:
> Before: PASSED: 371, FAILED: 0, SKIPPED: 15
> After: PASSED: 371, FAILED: 0, SKIPPED: 15
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../gnutls/gnutls/CVE-2026-33845.patch        | 195 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>  2 files changed, 196 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.pat=
ch

Hello,

It looks like this patch does not apply to wrynose anymore:
| ERROR: gnutls-3.8.12-r0 do_patch: Applying patch '.../wrynose/bitbake-bui=
lds/poky-wrynose/layers/openembedded-core/meta/recipes-support/gnutls/gnutl=
s/CVE-2026-33845.patch' on target directory '.../wrynose/bitbake-builds/pok=
y-wrynose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/sources/gnutls-=
3.8.12'
| CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/t=
mp/work/x86-64-v3-poky-linux/gnutls/3.8.12/recipe-sysroot-native/etc/quiltr=
c push', 0, 'stdout: Applying patch CVE-2026-33845.patch
| patching file lib/buffers.c
| Hunk #1 succeeded at 919 (offset -4 lines).
| Hunk #2 succeeded at 933 (offset -4 lines).
| Hunk #3 succeeded at 1000 (offset 11 lines).
| Hunk #4 FAILED at 1009.
| Hunk #5 FAILED at 1018.
| Hunk #6 succeeded at 1110 (offset 11 lines).
| Hunk #7 succeeded at 1122 (offset 11 lines).
| Hunk #8 succeeded at 1311 (offset 11 lines).
| Hunk #9 succeeded at 1327 (offset 11 lines).
| 2 out of 9 hunks FAILED -- rejects in file lib/buffers.c
| patching file lib/gnutls_int.h
| Patch CVE-2026-33845.patch does not apply (enforce with -f)
|=20
| stderr: ')
| ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wryn=
ose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/temp/log.do_patch.240=
673
| ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-=
core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_patch) failed with exi=
t code '1'

Can you rebase and send a v2?

Thanks!

>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
> new file mode 100644
> index 0000000000..d81ffb7ef7
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
> @@ -0,0 +1,195 @@
> +From 9679a9c8ab1694b78c7cb285d29da904e3f3bc45 Mon Sep 17 00:00:00 2001
> +From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +Date: Mon, 27 Jul 2026 08:58:02 +0000
> +Subject: [PATCH] buffers: switch from end_offset over to frag_length
> +
> +Instead of maintaining an inclusive [start_offset, end_offset] range
> +when reassembling DTLS handshake,
> +track start_offset and a relative frag_length instead.
> +
> +You'd think it'd be a no-op, but it fixes:
> +
> +* 0-length fragments triggering completion if message was 1 byte long
> +* a remotely triggerable underflow and an ensuing heap overrun
> +
> +Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
> +Fixes: #1811
> +Fixes: CVE-2026-33845
> +Fixes: GNUTLS-SA-2026-04-29-3
> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +
> +CVE: CVE-2026-33845
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/e5b=
72c53c7d789d19d1d1cd10b275e87d0415413]
> +
> +Backport notes: adapted to the stable branch, no logic changes.
> +- lib/buffers.c: the local fragment-size variable is named frag_size her=
e,
> +  not frag_length as upstream; renamed accordingly.
> +- lib/buffers.c: merge_handshake_packet() has no recv_buf alias in this
> +  branch, so recv_buf[pos] was expanded to
> +  session->internals.handshake_recv_buffer[pos], which changes line wrap=
ping.
> +- lib/gnutls_int.h: applies cleanly.
> +
> +Assisted-by: kiro:claude-sonnet-4.6
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + lib/buffers.c    | 57 ++++++++++++++++++++++++------------------------
> + lib/gnutls_int.h |  4 ++--
> + 2 files changed, 31 insertions(+), 30 deletions(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 672380b05..2d77e7590 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -923,10 +923,7 @@ static int parse_handshake_header(gnutls_session_t =
session, mbuffer_st *bufel,
> + 	}
> + 	data_size =3D _mbuffer_get_udata_size(bufel) - handshake_header_size;
> +=20
> +-	if (frag_size > 0)
> +-		hsk->end_offset =3D hsk->start_offset + frag_size - 1;
> +-	else
> +-		hsk->end_offset =3D 0;
> ++	hsk->frag_length =3D frag_size;
> +=20
> + 	_gnutls_handshake_log(
> + 		"HSK[%p]: %s (%u) was received. Length %d[%d], frag offset %d, frag l=
ength: %d, sequence: %d\n",
> +@@ -940,9 +937,10 @@ static int parse_handshake_header(gnutls_session_t =
session, mbuffer_st *bufel,
> +=20
> + 	if (hsk->length > 0 &&
> + 	    (frag_size > data_size ||
> +-	     (frag_size > 0 && hsk->end_offset >=3D hsk->length))) {
> ++	     (frag_size > 0 && hsk->start_offset + frag_size > hsk->length))) =
{
> + 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> +-	} else if (hsk->length =3D=3D 0 && hsk->end_offset !=3D 0 &&
> ++	} else if (hsk->length =3D=3D 0 &&
> ++		   hsk->start_offset + frag_size !=3D hsk->start_offset &&
> + 		   hsk->start_offset !=3D 0)
> + 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> +=20
> +@@ -991,11 +989,10 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
> + 			hsk->data.length =3D hsk->length;
> + 		}
> +=20
> +-		if (hsk->length > 0 && hsk->end_offset > 0 &&
> +-		    hsk->end_offset - hsk->start_offset + 1 !=3D hsk->length) {
> ++		if (hsk->length > 0 && hsk->frag_length > 0 &&
> ++		    hsk->frag_length !=3D hsk->length) {
> + 			memmove(&hsk->data.data[hsk->start_offset],
> +-				hsk->data.data,
> +-				hsk->end_offset - hsk->start_offset + 1);
> ++				hsk->data.data, hsk->frag_length);
> + 		}
> +=20
> + 		session->internals.handshake_recv_buffer_size++;
> +@@ -1012,7 +1009,7 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
> + 		if (hsk->start_offset <
> + 			    session->internals.handshake_recv_buffer[pos]
> + 				    .start_offset &&
> +-		    hsk->end_offset + 1 >=3D
> ++		    hsk->start_offset + hsk->frag_length >=3D
> + 			    session->internals.handshake_recv_buffer[pos]
> + 				    .start_offset) {
> + 			memcpy(&session->internals.handshake_recv_buffer[pos]
> +@@ -1021,28 +1018,34 @@ static int merge_handshake_packet(gnutls_session=
_t session,
> + 			session->internals.handshake_recv_buffer[pos]
> + 				.start_offset =3D hsk->start_offset;
> + 			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset =3D MIN(
> +-				hsk->end_offset,
> ++				.frag_length =3D MIN(
> ++				hsk->frag_length,
> + 				session->internals.handshake_recv_buffer[pos]
> +-					.end_offset);
> +-		} else if (hsk->end_offset >
> ++					.frag_length);
> ++		} else if (hsk->start_offset + hsk->frag_length >
> ++				   session->internals.handshake_recv_buffer[pos]
> ++					   .start_offset +
> + 				   session->internals.handshake_recv_buffer[pos]
> +-					   .end_offset &&
> ++					   .frag_length &&
> + 			   hsk->start_offset <=3D
> + 				   session->internals.handshake_recv_buffer[pos]
> +-						   .end_offset +
> +-					   1) {
> ++					   .start_offset +
> ++				   session->internals.handshake_recv_buffer[pos]
> ++					   .frag_length) {
> + 			memcpy(&session->internals.handshake_recv_buffer[pos]
> + 					.data.data[hsk->start_offset],
> + 			       hsk->data.data, hsk->data.length);
> +=20
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset =3D hsk->end_offset;
> + 			session->internals.handshake_recv_buffer[pos]
> + 				.start_offset =3D MIN(
> + 				hsk->start_offset,
> + 				session->internals.handshake_recv_buffer[pos]
> + 					.start_offset);
> ++			session->internals.handshake_recv_buffer[pos]
> ++				.frag_length =3D
> ++				hsk->start_offset + hsk->frag_length -
> ++				session->internals.handshake_recv_buffer[pos]
> ++					.start_offset;
> + 		}
> + 		_gnutls_handshake_buffer_clear(hsk);
> + 	}
> +@@ -1102,8 +1105,8 @@ static int get_last_packet(gnutls_session_t sessio=
n,
> + 		}
> +=20
> + 		else if ((recv_buf[LAST_ELEMENT].start_offset =3D=3D 0 &&
> +-			  recv_buf[LAST_ELEMENT].end_offset =3D=3D
> +-				  recv_buf[LAST_ELEMENT].length - 1) ||
> ++			  recv_buf[LAST_ELEMENT].frag_length =3D=3D
> ++				  recv_buf[LAST_ELEMENT].length) ||
> + 			 recv_buf[LAST_ELEMENT].length =3D=3D 0) {
> + 			session->internals.dtls.hsk_read_seq++;
> + 			_gnutls_handshake_buffer_move(hsk,
> +@@ -1114,8 +1117,9 @@ static int get_last_packet(gnutls_session_t sessio=
n,
> + 			/* if we don't have a complete handshake message, but we
> + 			 * have queued data waiting, try again to reconstruct the
> + 			 * handshake packet, using the queued */
> +-			if (recv_buf[LAST_ELEMENT].end_offset !=3D
> +-				    recv_buf[LAST_ELEMENT].length - 1 &&
> ++			if ((recv_buf[LAST_ELEMENT].start_offset +
> ++			     recv_buf[LAST_ELEMENT].frag_length) !=3D
> ++				    recv_buf[LAST_ELEMENT].length &&
> + 			    record_check_unprocessed(session) > 0)
> + 				return gnutls_assert_val(
> + 					GNUTLS_E_INT_CHECK_AGAIN);
> +@@ -1302,9 +1306,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_sess=
ion_t session)
> + 					&session->internals.record_buffer,
> + 					bufel, ret);
> +=20
> +-				data_size =3D MIN(tmp.length,
> +-						tmp.end_offset -
> +-							tmp.start_offset + 1);
> ++				data_size =3D MIN(tmp.length, tmp.frag_length);
> +=20
> + 				ret =3D _gnutls_buffer_append_data(
> + 					&tmp.data,
> +@@ -1320,7 +1322,6 @@ int _gnutls_parse_record_buffered_msgs(gnutls_sess=
ion_t session)
> + 				ret =3D merge_handshake_packet(session, &tmp);
> + 				if (ret < 0)
> + 					return gnutls_assert_val(ret);
> +-
> + 			} while (_mbuffer_get_udata_size(bufel) > 0);
> +=20
> + 			prev =3D bufel;
> +diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
> +index 54d3c9f67..283f25c07 100644
> +--- a/lib/gnutls_int.h
> ++++ b/lib/gnutls_int.h
> +@@ -479,10 +479,10 @@ typedef struct {
> + 	uint16_t sequence;
> +=20
> + 	/* indicate whether that message is complete.
> +-	 * complete means start_offset =3D=3D 0 and end_offset =3D=3D length
> ++	 * complete means start_offset =3D=3D 0 and frag_length =3D=3D length
> + 	 */
> + 	uint32_t start_offset;
> +-	uint32_t end_offset;
> ++	uint32_t frag_length; /* used exclusively in DTLS reassembly */
> +=20
> + 	uint8_t header[MAX_HANDSHAKE_HEADER_SIZE];
> + 	int header_size;
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.12.bb
> index 468b4bdd40..4219a650de 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> @@ -25,6 +25,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
>             file://Add-ptest-support.patch \
>             file://c99.patch \
>             file://CVE-2026-3833.patch \
> +           file://CVE-2026-33845.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2=
bf470bea012b8e51"


--=20
Yoann Congal
Smile ECS


