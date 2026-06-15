Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9AFCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:58:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127785.1781524709749683082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OjXdjxPx;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so25242355e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781524708; x=1782129508; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4ybwOO22syQmEbHKvyOQRKj8su9VPEHbkA/r8SkfPI=;
        b=OjXdjxPxSN451TFGcDfuY+4H2+GPD8mFfI+5hyVcSwSh0W14g23F3zuTX0yKRMdU/E
         zD5Dol88X1JknwjnV6hfJkLrAo0n0hNLwahKQCWQ/D/tB8tz/FnTIBhUXnX5maF6TduW
         SutAbGgVSYWF5zBsSvgJXa58mQfoLO7Xnfh4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524708; x=1782129508;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4ybwOO22syQmEbHKvyOQRKj8su9VPEHbkA/r8SkfPI=;
        b=Ne3Rz+pIddAx6JiWYZLDPqWKOCZIFXHO7fYhb9SPEOheGUuwxDe3O/YgmKyGSqUaQJ
         BP77iQmKfgudqKPXgiSDCtO020IsL5WleL2M1hO74E8OkT/KLmpUc0jjmz0eTNwK15Tk
         yACBaHaoTgKDl4OHEm2em+bnwwhp5YA82os9pY+GbIEIXcK+6KaKw7u1oEKWQ0vpZgWL
         kN1NtrOFlcQkUD0oxDGBC82ZEEGNX8xvxuNPep1oSBmnzQtsMb+B52IiyLFFaTDiDw26
         aZxLGoDHxef0N4dTw6KDTb5tWDI56Zv9mMh5kT0IB4X513b76Dzek3WwATf+Nuc2hKbc
         0XoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jWAVsWYT0ejJE8rUuBiAsMoMqGKu2/llc5TJF/5MY6Pxd4Gpt6AwrT1g/fmUhfM+xypL0VBLzKkWmfi5S1m1n+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6n7VM7HMsFUiwN3ar51lk1HxD9W12hvNwK9YBu/n8ercyX0Vo
	8zqRZ0gqLmk5OSjvGqzSSQjaONODHvEOI0DeiiYT/G74WqQWQucCIxEx+FyuOQs6RBg=
X-Gm-Gg: Acq92OEtGsmM+kDRHi7kBRxMQ7FalDhlo1nwqIbuNJekPELtoi4HqjWnHYNiZ+JSjbf
	cPfT9q4cJF1e5kajbRSaGwlsY9Y3XuBk5XiKX1Mpd/7cHMXogE7Dq8asQMPwOCbVAWYLpUBdEHH
	kegwZS7c+evFPlhTBiWBhU3dXVV1VoO589OIDKzWUUrvUB40i1HVvHaYFTkaNJEwh7bsP/czAGS
	taoK4g+jwJxcj/FGgkFePNDS25NWu+MVau8nZiEcrc+PwQZKSEhcdGjUx/DGcE0Mzo3HdGSsCLe
	QP7/hs8mV7uWSk8ah8x8sPOwoBv+Oe24jpitMOYBTm4QptrL1GcEOOGPPlgb2KPhqof5U2gJozn
	SRlwix7Jv8N3L8xPQyPxEYmVfnx/7Rioyu3FcKlyrAoEaHklMkb/XThu3VbnDhQi/IneQwKybpR
	wqQZTx0ymOoTsjNia319I/CNQ4Y92uS/piX1Rzv/Hz/Zqmh4JT3rjUYq4xgCyiUdIOW5n3slEOM
	9wEE5cLPZGJ7Ps=
X-Received: by 2002:a05:600c:138e:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-490ec507db7mr189445185e9.25.1781524707809;
        Mon, 15 Jun 2026 04:58:27 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d08bcsm247483045e9.13.2026.06.15.04.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:58:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 13:58:26 +0200
Message-Id: <DJ9LSVX9666D.1V4UR5LDDBT8O@smile.fr>
Subject: Re: [OE-core] [master] [PATCH v2] libusb1: fix CVE-2026-23679 and
 CVE-2026-47104
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260612123823.1236106-1-adongare@cisco.com>
 <20260615110825.230591-1-adongare@cisco.com>
In-Reply-To: <20260615110825.230591-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238837

On Mon Jun 15, 2026 at 1:08 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> - Pick the upstream patch [1] as mentioned in [2] and [3].
>   included in v1.0.28.

That patch in included in v1.0.30, not 1.0.28 (OE-core master is
currently at v1.0.29).

Also, this backport will be superseded by the v1.0.30 upgrade in:
https://lore.kernel.org/all/20260614080307.4017177-21-richard.purdie@linuxf=
oundation.org/

(I'll take a look at the backport for stable branches though)

Regards,


> [1] https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a=
97a7f185231
> [2] https://security-tracker.debian.org/tracker/CVE-2026-23679.
> [3] https://security-tracker.debian.org/tracker/CVE-2026-47104.
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../CVE-2026-23679_CVE-2026-47104.patch       | 89 +++++++++++++++++++
>  meta/recipes-support/libusb/libusb1_1.0.29.bb |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CV=
E-2026-47104.patch
>
> diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-=
47104.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-4=
7104.patch
> new file mode 100644
> index 0000000000..f15f089f9f
> --- /dev/null
> +++ b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.p=
atch
> @@ -0,0 +1,89 @@
> +From 04a9508e07582f553e9ea767f9e4a9b93839914b Mon Sep 17 00:00:00 2001
> +From: MarkLee131 <kaixuan.li@ntu.edu.sg>
> +Date: Sat, 25 Apr 2026 18:33:17 +0800
> +Subject: [PATCH] descriptor: Fix two memory-safety bugs in malformed con=
fig
> + descriptor handling
> +
> +Two issues reachable from a malformed config descriptor returned by an
> +attached USB device, both surfaced by the same libFuzzer + ASan run.
> +
> +1) parse_interface() reads bNumEndpoints from the interface descriptor a=
nd
> +   increments usb_interface->num_altsetting before entering the inner lo=
op
> +   that skips class/vendor specific descriptors ahead of the endpoint
> +   array. If that loop's bLength > size short-read branch fires, the
> +   function returns before the endpoint array is allocated, leaving the
> +   caller with bNumEndpoints > 0 and endpoint =3D=3D NULL. libusb.h docu=
ments
> +   endpoint as an array sized by bNumEndpoints, and the testlibusb and
> +   xusb examples both iterate it accordingly, so a NULL deref follows.
> +   Reset bNumEndpoints to 0 before returning so the invariant holds.
> +
> +2) The first-pass loop in parse_iad_array() compares header.bLength
> +   against the original size argument instead of the remaining bytes,
> +   so a single descriptor with bLength =3D=3D size - 1 lets consumed rea=
ch
> +   size - 1 and the next iteration enters with only one byte of buffer
> +   left. The buf[1] read on the second line of the loop body lands one
> +   byte past the malloc allocation that backs the descriptor data. The
> +   sibling parsers parse_configuration() and parse_interface() in the
> +   same file already use the remaining-bytes form. Switch the IAD parser
> +   loop guard and bound check to match.
> +
> +Both code paths are reachable from public APIs (libusb_get_*_config_desc=
riptor
> +and libusb_get_*_interface_association_descriptors), with the malformed
> +input supplied by the attached device. Minimal reproducers are 20 and
> +9 bytes respectively.
> +
> +Fixes #1813
> +
> +CVE: CVE-2026-23679 CVE-2026-47104
> +Upstream-Status: Backport [https://github.com/libusb/libusb/commit/bc088=
6173ea15b8cc9bba2918f58a97a7f185231]
> +
> +Backport Changes:
> +- The upstream version_nano.h bump is omitted because this is a security
> +  backport to libusb 1.0.29, not a version upgrade.
> +
> +Signed-off-by: MarkLee131 <kaixuan.li@ntu.edu.sg>
> +(cherry picked from commit bc0886173ea15b8cc9bba2918f58a97a7f185231)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + libusb/descriptor.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/libusb/descriptor.c b/libusb/descriptor.c
> +index 870883a..7d4f118 100644
> +--- a/libusb/descriptor.c
> ++++ b/libusb/descriptor.c
> +@@ -241,6 +241,10 @@ static int parse_interface(libusb_context *ctx,
> + 				usbi_warn(ctx,
> + 					  "short extra intf desc read %d/%u",
> + 					  size, header->bLength);
> ++				/* Keep the invariant: bNumEndpoints > 0 implies
> ++				 * endpoint !=3D NULL. The endpoint array isn't
> ++				 * allocated yet on this early return. */
> ++				ifp->bNumEndpoints =3D 0;
> + 				return parsed;
> + 			}
> +=20
> +@@ -1365,7 +1369,7 @@ static int parse_iad_array(struct libusb_context *=
ctx,
> +=20
> + 	/* First pass: Iterate through desc list, count number of IADs */
> + 	iad_array->length =3D 0;
> +-	while (consumed < size) {
> ++	while (size - consumed >=3D DESC_HEADER_LENGTH) {
> + 		header.bLength =3D buf[0];
> + 		header.bDescriptorType =3D buf[1];
> + 		if (header.bLength < DESC_HEADER_LENGTH) {
> +@@ -1373,9 +1377,9 @@ static int parse_iad_array(struct libusb_context *=
ctx,
> + 				 header.bLength);
> + 			return LIBUSB_ERROR_IO;
> + 		}
> +-		else if (header.bLength > size) {
> ++		else if (header.bLength > size - consumed) {
> + 			usbi_warn(ctx, "short config descriptor read %d/%u",
> +-					  size, header.bLength);
> ++					  size - consumed, header.bLength);
> + 			return LIBUSB_ERROR_IO;
> + 		}
> + 		if (header.bDescriptorType =3D=3D LIBUSB_DT_INTERFACE_ASSOCIATION)
> +--=20
> +2.51.0
> +
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes=
-support/libusb/libusb1_1.0.29.bb
> index 856e32d1c6..d287ec171f 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
> @@ -14,6 +14,7 @@ BBCLASSEXTEND =3D "native nativesdk"
> =20
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
>             file://run-ptest \
> +           file://CVE-2026-23679_CVE-2026-47104.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/libusb/libusb/releases"


--=20
Yoann Congal
Smile ECS


