Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E29C4167B
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:10:57 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.70623.1670929847969979231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DbdJszuR;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670929849;
  x=1702465849;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3jkcmU731RVXM1/eQk1SpcYxEeBk+Q2x8bnRyepQzXs=;
  b=DbdJszuRZENMgVG9R93pQbW5qjrPSX+fV9iZTSMScnYj23LWri4rRUEX
   c9rukueghN7+DcDIVmEwNXKxwfY9SpyxucLpsaUZ7ZLhMtDX8IRHIm+hP
   2ohBN8d2zYYikgvuQgnnX0dkjWb8Bpb72sXn1IMW2LuLlTSIZgOXxS+bU
   SsMjwrzgDulKsVafYbZ6AIG2HTOUJp59az7NixLJNevxMPgX783xcdW/1
   wqRmLBfPFYtRgz/vbf8mtvUsY1KLBnnU6sCUCfMcTldMzxpjSOTUg3kpT
   R0AflLDUsyOvfotTNphgqNTQh35brzjqAZaaP/nf1SfvocmWMpkpgquBs
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: leimaohui <leimaohui@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations"
 instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for
 armv7, but doesn't work for aarch64. But in fact neon is also enabled for
 aarch64 by default.
Thread-Topic: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations"
 instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for
 armv7, but doesn't work for aarch64. But in fact neon is also enabled for
 aarch64 by default.
Thread-Index: AQHZDpwKLE75x7gnHEyM/EsVcReA/a5rp8vw
Date: Tue, 13 Dec 2022 11:10:44 +0000
Message-ID: <011dd836cde148d28ee96a3cf9c4f6f2@axis.com>
References: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174510

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of leimaohui
> Sent: den 13 december 2022 03:38
> To: openembedded-core@lists.openembedded.org
> Cc: Lei Maohui <leimaohui@fujitsu.com>
> Subject: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations"=
 instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for=
 armv7, but doesn't work for aarch64. But in fact neon is also enabled for =
aarch64 by default.

The above is a way too long subject. I suggest changing it to:

libpng: Use --enable-hardware-optimizations instead of --enable-arm-neon

And then use the rest of the original subject as the first paragraph=20
of the commit message:

Because "--enable-arm-neon" only works for armv7, but doesn't work for
aarch64. But in fact neon is also enabled for aarch64 by default.

>=20
> Reference to libpng-1.6.38/configure,if enable_hardware_optimizations is
> enabled, libpng can judge whether enable enable_arm_neon according
> to $host_cpu.
> ----------------------------------------
> $ cat libpng-1.6.38/configure
> ......
> if test ${enable_hardware_optimizations+y}
> then :
> ......
>          # allow enabling hardware optimization on any system:
>          case "$host_cpu" in
>             arm*|aarch64*)
>               enable_arm_neon=3Dyes
>=20
> printf "%s\n" "#define PNG_ARM_NEON_OPT 2" >>confdefs.h
> ......
> ----------------------------------------
>=20
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-multimedia/libpng/libpng_1.6.38.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.38.bb
> index dc627203ef..7da71d9d3b 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> @@ -22,7 +22,7 @@ BINCONFIG =3D "${bindir}/libpng-config ${bindir}/libpng=
16-config"
>  inherit autotools binconfig-disabled pkgconfig
>=20
>  # Work around missing symbols
> -EXTRA_OECONF:append:class-target =3D " ${@bb.utils.contains("TUNE_FEATUR=
ES", "neon", "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff", d)}"
> +EXTRA_OECONF:append:class-target =3D " --enable-hardware-optimizations=
=3Don "

Remove the space before the trailing quote.

>=20
>  PACKAGES =3D+ "${PN}-tools"
>=20
> --
> 2.25.1

//Peter


