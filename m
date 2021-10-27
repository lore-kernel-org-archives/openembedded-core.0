Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2CCC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:38:29 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.13527.1635349107603447655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=Hm2WSwiY;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635349107;
  x=1666885107;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SKuQiuTr/5tSpwJt5Q6hdvIijokRKYpKmLt1gmfpY30=;
  b=Hm2WSwiYB/LvPTvXThn4IJPPqh7fBmQLoCowiLH0B2avhi3BQQpDgkGG
   qh4LC3YbxdXsWuLgpC5vLrPU3gcnA709fG7NCnL52AeQzvrhofIlJ2q3r
   aICpgKtRhz+pbTTQ2g+UrtHLqphCAhA+m75i7xhl6NgGRQ9gg/P3IRo21
   RL/5XrhO2DdAMltI7eQr1fnokAY6HRbsFGsfMT0G/8fjVur893lJ30+BY
   zQwSzFc/JQ9Xv5Klo1k7MA7L0AxPPQrh4afPj9FpfhaCWyN+4up0NgBbq
   Jes2zgdRRBYZRWr6s/RzmI+/DEPfx//gweZ4uEjlgIXvs6dyetHnvKe29
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv2 1/2] meson.bblcass: Remove empty egg-info
 directories before running meson
Thread-Topic: [OE-core] [PATCHv2 1/2] meson.bblcass: Remove empty egg-info
 directories before running meson
Thread-Index: AQHXyamkqRYL0z2Cd0mBadvBys59Lavm/UEg
Date: Wed, 27 Oct 2021 15:38:24 +0000
Message-ID: <47dc344778544b8e87c5afa446f6591f@axis.com>
References: <16B14B36E28CA53E.25242@lists.openembedded.org>
In-Reply-To: <16B14B36E28CA53E.25242@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:38:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157553

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 25 oktober 2021 16:07
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv2 1/2] meson.bblcass: Remove empty egg-info dir=
ectories before running meson
>=20
> sstate.bbclass no longer removes empty directories to avoid a race (see
> commit 4f94d929 "sstate/staging: Handle directory creation race issue").
> Unfortunately Python apparently treats an empty egg-info directory as if
> the version it previously contained still exists and fails if a newer
> version is required, which Meson does. To avoid this, make sure there
> are no empty egg-info directories from previous versions left behind.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> PATCHv2: Ignore all errors from rmdir since apparently egg-info may be
>          files rather than directories.
>=20
>  meta/classes/meson.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index e124d18144..da58cb4bec 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -103,6 +103,16 @@ meson_do_configure() {
>      # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e5991=
6c18901cde90fa2b3
>      unset LD
>=20
> +    # sstate.bbclass no longer removes empty directories to avoid a race=
 (see
> +    # commit 4f94d929 "sstate/staging: Handle directory creation race is=
sue").
> +    # Unfortunately Python apparently treats an empty egg-info directory=
 as if
> +    # the version it previously contained still exists and fails if a ne=
wer
> +    # version is required, which Meson does. To avoid this, make sure th=
ere are
> +    # no empty egg-info directories from previous versions left behind. =
Ignore
> +    # all errors from rmdir since the egg-info may be a file rather than=
 a
> +    # directory.
> +    rmdir ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-inf=
o 2>/dev/null || :
> +
>      # Work around "Meson fails if /tmp is mounted with noexec #2972"
>      mkdir -p "${B}/meson-private/tmp"
>      export TMPDIR=3D"${B}/meson-private/tmp"

Can this patch and the corresponding qemu.inc patch please be backported=20
to Honister now that they have been accepted for master?

//Peter


