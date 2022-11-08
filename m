Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5802DC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 10:17:09 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.6392.1667902626422687189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 02:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=I5+OxL+k;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667902627;
  x=1699438627;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lQ8OQS4UW2Z632MJ8kWrYJJccFXPB8YXMljkWwHyuso=;
  b=I5+OxL+k2rE330Pq2sLDgG1skdiQSNdxMfMd0pe3yt67vbGC5hn9PUvx
   8ucPjxGMO58j0ohW16uXz6/fUlA4wBOpTXRCGDejeldFAKO5k+h0Sg2zk
   rSx+4aY/3JLIgyvwff2ICS4IDKPkZT2HxrJ/emoFGB7211IOa94y3Use6
   G8imqnd321Zl6KWq3vEzjv5ez9w/7xQmRFRdlx0u9lTZfoWY2FJ15Kois
   qIyVodWQdPAo0DrmigrXL2C5uSmrSVWDY+/jA/JMoTQ62zCgXc68H/uXE
   DCiOWmtbDM/69t0U5xutQeMlwVXZKRxzlmwYCm+LoeCyRdh7+EET/rzZI
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC PATCH 3/3] pulseaudio: Disable 64 bit time with 32
 bit glibc
Thread-Topic: [OE-core] [RFC PATCH 3/3] pulseaudio: Disable 64 bit time with
 32 bit glibc
Thread-Index: AQHY8wZtvn+ajTq6A0SPyLhl6zHsWq40zYaQ
Date: Tue, 8 Nov 2022 10:17:04 +0000
Message-ID: <4956a44e486d49899881de23defe9c98@axis.com>
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-3-niko.mauno@vaisala.com>
In-Reply-To: <20221108000828.42824-3-niko.mauno@vaisala.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 10:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172956

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Niko Mauno via
> lists.openembedded.org
> Sent: den 8 november 2022 01:08
> To: openembedded-core@lists.openembedded.org
> Cc: Niko Mauno <niko.mauno@vaisala.com>
> Subject: [OE-core] [RFC PATCH 3/3] pulseaudio: Disable 64 bit time with 3=
2 bit glibc
>=20
> For now add exemption in order to avoid following kind of failures
> during do_compile()
>=20
>   | ../pulseaudio-16.1/src/modules/bluetooth/bt-codec-cvsd.c:55:22: warni=
ng: format '%lu' expects argument of type 'long unsigned int', but argument=
 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=3D]
>   |    55 |         pa_log_debug("Got invalid block size: %lu, rounding d=
own", block_size);
>   |       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~  ~~~~~~~~~~
>   |       |                                                              =
      |
>   |       |                                                              =
      size_t {aka unsigned int}
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb b/meta=
/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
> index 64002cd1cc..ee4f8c7ed3 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
> @@ -8,3 +8,6 @@ SRC_URI =3D
> "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
>             "
>  SRC_URI[sha256sum] =3D "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72=
863251751e504ae4"
>  UPSTREAM_CHECK_REGEX =3D "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
> +
> +# Compiling 64 bit time for 32 bit host is broken
> +GLIBC_64BIT_TIME_CPPFLAGS =3D ""

Rather than hiding the problem, you should patch the code to use %zu instea=
d=20
of %lu. And please send the patch upstream.

> --
> 2.36.1

//Peter


