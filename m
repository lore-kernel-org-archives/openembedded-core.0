Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A924BCD6E57
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 08:57:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7036.1780563447103475529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 01:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ISsoBf8C;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45efb698ef2so207591f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780563445; x=1781168245; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUSrEMH2XMX+ILvi1qxnwpIt2UKebm7cgJT/J634Ti8=;
        b=ISsoBf8C6Q4d9vrxca+mVDRYT36dYUVGMCQga2rBP+p+HNyH/8ggKDy9YYrcMQfXyj
         BWjjv2G4iIBjp1b/QAm+SCwfk4CyPYFm0vK7gPC4oaCLTdwPxhx9K2qDJ5SkhE2HM8TZ
         z3Fkg9cD8ePNI7aX79rC/LzFIxcMpxInd88UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563445; x=1781168245;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUSrEMH2XMX+ILvi1qxnwpIt2UKebm7cgJT/J634Ti8=;
        b=R4V+ktyzmfsifJfu1aqj0cJMz74gbCT0ik3x01HLWhDgv7wu64Ik3KQAICLwU3cLeF
         ktYSQcjePXcywYtETY50g/+2xgrCDhNTjCqOGgu05tVOEx//Tjuh3oguwGLYMFgf7Wvj
         8EOVZTkIBwUY3yUh/pk5oOm4X3EKnqeU2xOrlUugCUxEImtx/zw8rydR/x8sdxVw+LuY
         Trf7dYIA2eOOZUs31iXlv2oEjJPjRrW4OOg014KfGRyrlGmTYowuVO7Bp9jL9Ck9pw96
         BK+GZsMnJsDrr2jncdhfRZ+9KZ5fw4mMOZ8D7moNI9X7am87OOcLVNmdGGRuaaGmCJoH
         nnvg==
X-Forwarded-Encrypted: i=1; AFNElJ9rpr+RQ+AGAPPafBw4FD1oWK2309fS1r2v0ME7ijXTgOpY23dr1rWboOp/8WS72ReGmytEi8BZ1IwP3AU30NiiYQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMeT3WcPyVuwMD8gu7MgPOvJzhSosx1SFYhbEdG/bZOIUiinvu
	HJEH7n0CWGbBUlvElcQ1qXSyoMtcRhLQhtb9eCL/ZeNNAhVyHjQMB8SGwdiloxHlIcA=
X-Gm-Gg: Acq92OERk6ZB36z+uTtfxC9p73IUOoHHnajaFDcnMjO/JrU8Ho+NOu9yYV0OD0/bkgX
	6nB25rgRMb/HdB7TdAPTXgaLOXL/MkNGe541HFj0qiahYY6kqMwpwXSvMluYVPkFmwMBrAwidlQ
	d46IVgQlSGEmFb11Bh61DTuYJsDokxlqXSOrBwWl9N1AQkCns8Eg655r7ma1V8x1K0zqee1G6n4
	Gj9ShncmgFoZ2s0iBEw3bN8YGQFd8r5nBb0ixaVRZbv9ik616t9WeZYB9a59jDN7j7VHmhpvRQv
	PguCDv/IIuOn/ohR2O7inubBy9ArSefn+/OyCXGtOhjIiv4hclhBWhj7YEqECF1qjCP2iUMu2A8
	wkwgeB49QwrRzDEN2SimIcq2EdP/HF6BuBSrz8zd+ODGnfWr4CoA5uZgmg9VIcM7WYx7Nj3lJWE
	I+w+tJty/AhriZ3WLdhURUW8M0kHJCIsZgYM1Wu9VlkyQKx/qLmiBmyXLpavASFA32Hn3snPrYC
	Pjl7M97S3PmEtcLCXSKQjqGUw==
X-Received: by 2002:adf:f58f:0:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-46021873b26mr7491249f8f.38.1780563445078;
        Thu, 04 Jun 2026 01:57:25 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm16196730f8f.20.2026.06.04.01.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:57:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 10:57:23 +0200
Message-Id: <DJ0529SO7U38.2KY8QAKJ8TRSU@smile.fr>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/7] gnutls: Fix CVE-2026-33846
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
X-Mailer: aerc 0.20.0
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238118

On Wed May 20, 2026 at 10:13 AM CEST, Hugo Simeliere via lists.openembedded=
.org wrote:
> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witeki=
o.com>
>
> Pick patch from [1] as mentioned in Debian report in [2].
> Pick pre-patch [3] to minimize conflicts.
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7=
df3d383d1ff78
> [2] https://security-tracker.debian.org/tracker/CVE-2026-33846
> [3] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4=
bb1bf4cbd1fc0
>
> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource=
@witekio.com>
> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> ---
>  .../gnutls/gnutls/CVE-2026-33846-pre.patch    | 97 +++++++++++++++++++
>  .../gnutls/gnutls/CVE-2026-33846.patch        | 67 +++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
>  3 files changed, 166 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre=
.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.pat=
ch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch =
b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
> new file mode 100644
> index 0000000000..71266cb338
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
> @@ -0,0 +1,97 @@
> +From e51ef765b942968949e29797a73727c371397eea Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 17:49:31 +0200
> +Subject: [PATCH 1/2] buffers: shorten merge_handshake_packet using recv_=
buf

As far as I can tell this patch is only cosmetic and I'd rather not
merge it unless you have a compeling reason.

To apply CVE-2026-33846.patch, it looks like you will need to change it
to use "session->internals.handshake_recv_buffer" instead of "recv_buf".

Regards,

> +
> +I had vague concerns about thread-safety of this,
> +but then this pattern already exists within the file.
> +
> +CVE: CVE-2026-33846
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9de=
ffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0]
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +(cherry picked from commit 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + lib/buffers.c | 52 +++++++++++++++++----------------------------------
> + 1 file changed, 17 insertions(+), 35 deletions(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 672380b05..d54c77022 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t =
session,
> + 	int exists =3D 0, i, pos =3D 0;
> + 	int ret;
> +=20
> ++	handshake_buffer_st *recv_buf =3D
> ++		session->internals.handshake_recv_buffer;
> ++
> + 	for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i++) =
{
> +-		if (session->internals.handshake_recv_buffer[i].htype =3D=3D
> +-		    hsk->htype) {
> ++		if (recv_buf[i].htype =3D=3D hsk->htype) {
> + 			exists =3D 1;
> + 			pos =3D i;
> + 			break;
> +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session=
_t session,
> + 		_gnutls_write_uint24(0, &hsk->header[6]);
> + 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
> +=20
> +-		_gnutls_handshake_buffer_move(
> +-			&session->internals.handshake_recv_buffer[pos], hsk);
> ++		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +=20
> + 	} else {
> +-		if (hsk->start_offset <
> +-			    session->internals.handshake_recv_buffer[pos]
> +-				    .start_offset &&
> +-		    hsk->end_offset + 1 >=3D
> +-			    session->internals.handshake_recv_buffer[pos]
> +-				    .start_offset) {
> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
> +-					.data.data[hsk->start_offset],
> ++		if (hsk->start_offset < recv_buf[pos].start_offset &&
> ++		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> + 			       hsk->data.data, hsk->data.length);
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.start_offset =3D hsk->start_offset;
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset =3D MIN(
> +-				hsk->end_offset,
> +-				session->internals.handshake_recv_buffer[pos]
> +-					.end_offset);
> +-		} else if (hsk->end_offset >
> +-				   session->internals.handshake_recv_buffer[pos]
> +-					   .end_offset &&
> +-			   hsk->start_offset <=3D
> +-				   session->internals.handshake_recv_buffer[pos]
> +-						   .end_offset +
> +-					   1) {
> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
> +-					.data.data[hsk->start_offset],
> ++			recv_buf[pos].start_offset =3D hsk->start_offset;
> ++			recv_buf[pos].end_offset =3D
> ++				MIN(hsk->end_offset, recv_buf[pos].end_offset);
> ++		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
> ++			   hsk->start_offset <=3D recv_buf[pos].end_offset + 1) {
> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> + 			       hsk->data.data, hsk->data.length);
> +=20
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset =3D hsk->end_offset;
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.start_offset =3D MIN(
> +-				hsk->start_offset,
> +-				session->internals.handshake_recv_buffer[pos]
> +-					.start_offset);
> ++			recv_buf[pos].end_offset =3D hsk->end_offset;
> ++			recv_buf[pos].start_offset =3D MIN(
> ++				hsk->start_offset, recv_buf[pos].start_offset);
> + 		}
> + 		_gnutls_handshake_buffer_clear(hsk);
> + 	}
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> new file mode 100644
> index 0000000000..e7d5cc6c2b
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> @@ -0,0 +1,67 @@
> +From 68e0c900c1111206fa4a135cdb43827f3b908284 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 18:21:36 +0200
> +Subject: [PATCH 2/2] buffers: add more checks to DTLS reassembly
> +
> +Previously, gnutls didn't check that DTLS fragments claimed
> +a consistent message_length value.
> +Additionally, a crucial array size check was missing,
> +enabling an attacker to cause a heap overwrite.
> +The updated version rejects fragments with mismatching length
> +and adds a missing boundary check.
> +
> +Reported-by: Haruto Kimura (Stella)
> +Reported-by: Oscar Reparaz
> +Reported-by: Zou Dikai
> +Fixes: #1816
> +Fixes: #1838
> +Fixes: #1839
> +Fixes: CVE-2026-33846
> +Fixes: GNUTLS-SA-2026-04-29-1
> +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> +
> +CVE: CVE-2026-33846
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65a=
b33fa54e34fba69d793735b7df3d383d1ff78]
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +(cherry picked from commit 65ab33fa54e34fba69d793735b7df3d383d1ff78)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + lib/buffers.c | 20 ++++++++++++++++++++
> + 1 file changed, 20 insertions(+)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index d54c77022..5d4d16276 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_=
t session,
> + 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +=20
> + 	} else {
> ++		if (hsk->length !=3D recv_buf[pos].length) {
> ++			/* inconsistent across fragments */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++		/* start_offset + data.length <=3D hsk->length <=3D max_length */
> ++		if (hsk->length < hsk->start_offset + hsk->data.length) {
> ++			/* impossible claims, overflow requested */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++		if (hsk->length > recv_buf[pos].data.max_length) {
> ++			/* we don't have this much allocated, overflow guard */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++
> + 		if (hsk->start_offset < recv_buf[pos].start_offset &&
> + 		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
> + 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.4.bb
> index ccb6a2b4b2..e40a654a8e 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> @@ -43,6 +43,8 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
>             file://CVE-2025-14831-7.patch \
>             file://CVE-2025-14831-8.patch \
>             file://CVE-2025-14831-9.patch \
> +           file://CVE-2026-33846-pre.patch \
> +           file://CVE-2026-33846.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd4=
4cdfa7f36ebc3a9b"


--=20
Yoann Congal
Smile ECS


