Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5707FC433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 02:21:02 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.3960.1634782860240524080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 19:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BYgraZSf;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634782860;
  x=1666318860;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MJVktAV1isVR06mMfdkAsQsblKju2r2DpEk9RrdUoVQ=;
  b=BYgraZSfPhtOuipM0EVRv8wczTJ93xRq8z52EViwb9VoHJO/VrSIhsqs
   IdfSTx+xCJEIiFdpDPqo2K1zmPpHSoqiurvgX1URyS/2iF64egUgD9a2y
   F5hS/fyqLAWHIuwuEr5vPcIlj6qU9QjuDBZ5ce+JTwe8ndObmtfIfDuaQ
   suudM75gB0UkG9x+Fom9UGbHA8iBymVlB4fLQXwJV6PIpjhwxUoOEswBo
   pS8jZGxUaY+TTnvZPl1FSs2/RScCVRU4/6X7N/MdYTOjoUOCPI4LsxyDF
   e7eULsavUR0f26yeg/1sbqUxcELEMrTOAN+v8G6cqGAR3M2J8ASljCPSk
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] meson.bblcass: Remove empty egg-info
 directories before running meson
Thread-Topic: [OE-core] [PATCH] meson.bblcass: Remove empty egg-info
 directories before running meson
Thread-Index: AQHXxbxbEAcpuWZj5Ey4HYqa4qEPoqvcuMLg
Date: Thu, 21 Oct 2021 02:20:56 +0000
Message-ID: <9c909b50fcfe4f278700882dff84f5ab@axis.com>
References: <16AFC2867DC0EAA4.1370@lists.openembedded.org>
In-Reply-To: <16AFC2867DC0EAA4.1370@lists.openembedded.org>
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
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 02:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157271

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 20 oktober 2021 16:11
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] meson.bblcass: Remove empty egg-info
> directories before running meson

Just noticed a tiny typo above: meson.bblcass -> meson.bbclass

//Peter

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
> RP: This is the solution I came up with regarding our discussion at the
> meeting yesterday. With this in place the upgrade to meson 0.59.1 now
> went without a hitch.
>=20
>  meta/classes/meson.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index e124d18144..d07b34fc5e 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -103,6 +103,14 @@ meson_do_configure() {
>      #
> https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901=
c
> de90fa2b3
>      unset LD
>=20
> +    # sstate.bbclass no longer removes empty directories to avoid a race
> (see
> +    # commit 4f94d929 "sstate/staging: Handle directory creation race
> issue").
> +    # Unfortunately Python apparently treats an empty egg-info directory
> as if
> +    # the version it previously contained still exists and fails if a
> newer
> +    # version is required, which Meson does. To avoid this, make sure
> there are
> +    # no empty egg-info directories from previous versions left behind.
> +    rmdir --ignore-fail-on-non-empty
> ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info
> +
>      # Work around "Meson fails if /tmp is mounted with noexec #2972"
>      mkdir -p "${B}/meson-private/tmp"
>      export TMPDIR=3D"${B}/meson-private/tmp"

