Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924F8D1266D
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 08:49:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10517.1764751764206029188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 00:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vLgwKCvm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 411514E419EE
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 08:49:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17CEC60706;
	Wed,  3 Dec 2025 08:49:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BBFD1192023B;
	Wed,  3 Dec 2025 09:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764751761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bvycOEn/MBCM7uJY6gKiOXgN1zmfvoMpmRkTmIHhbC8=;
	b=vLgwKCvmWJQ5cIsSVPu7cm+esW7XOgn7tfVzihDjN6ugIo1vxmhVAi0sjKXBXn+5WLX1Pn
	yO05J/TNLEZ7g0GR0ABZrm/OhgNyr5kQjT0yY4vgH6l+NMgpChD/D5zwr3dPHRFEzh3KRP
	w3eYyykcNdmIXKCn9FIWFyjEEWZFfuZR1ZoVOLInQxeMkyeb0qO502OH4Qj7JeohKVXw2R
	AcMc8f5IkFiBsscsEyiPRSKkPjJcEXnC7ha2FEVew1VBJuMLQsjW5YaVJFakWaEUTkAzrO
	St3rtMZxE8GABYnPyFEZPsrkGfkQgSlA9mpjUgJR9WAqLp96YYEcWfSDzwpCzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 09:49:19 +0100
Message-Id: <DEOGAEFW67EI.2E2AABT6GGWQU@bootlin.com>
Subject: Re: [PATCH v2 1/2] python3-sphinxcontrib-svg2pdfconverter: add new
 recipe
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss+yocto@0leil.net>,
 <openembedded-core@lists.openembedded.org>
References: <20251202-svg2pdf-v2-0-529856a2b6da@cherry.de>
 <20251202-svg2pdf-v2-1-529856a2b6da@cherry.de>
In-Reply-To: <20251202-svg2pdf-v2-1-529856a2b6da@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 08:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227208

Hi,

On Tue Dec 2, 2025 at 7:05 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> This will be a dependency for building the Yocto docs soon, so let's add
> a recipe for it.
>
> This does SVG to PDF (or PNG) conversion for images used in Sphinx
> projects.
>
> It exposes three different Sphinx extensions, each using a different
> tool for the conversion:
> - cairosvg, a Python module with no available recipe,
> - inkscape, only available in seemingly unmaintained 3rd party layer,
> - rsvg-convert,
>
> So we'll only support the last extension for now.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb  | 20 ++++++++++++++=
++++++
>  scripts/lib/recipetool/create_buildsys_python.py     |  8 ++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfco=
nverter_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2p=
dfconverter_2.0.0.bb
> new file mode 100644
> index 0000000000..c686ebff23
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter=
_2.0.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Sphinx SVG to PDF or PNG converter extension"
> +HOMEPAGE =3D "https://github.com/missinglinkelectronics/sphinxcontrib-sv=
g2pdfconverter"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db11cf936853a71258d4b57bb1=
849a3f9"
> +
> +SRC_URI[sha256sum] =3D "ab9c8f1080391e231812d20abf2657a69ee35574563b1014=
414f953964a95fa3"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "sphinxcontrib_svg2pdfconverter"
> +UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> +
> +RDEPENDS:${PN} =3D "python3-sphinx"
> +# Only support sphinxcontrib.rsvgconverter for now.
> +# As cairosvgconverter depends on cairosvg module, no recipe available y=
et
> +# As inkscapeconverter depends on inkscape, recipe in meta-office, 3rd-p=
arty
> +# layer not updated in years
> +RDEPENDS:${PN} +=3D "librsvg"
> +
> +BBCLASSEXTEND =3D "native nativesdk"

Patchtest should have seen this, but you need to add an entry for the recip=
e in
meta/conf/distro/include/maintainers.inc. I can assign myself otherwise as =
I
maintain some of the other docs related recipes.

> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
> index a807dafae5..c6a40f5a7d 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -858,10 +858,14 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipe=
Handler):
>              if metadata:
>                  for field, values in metadata.items():
>                      if field =3D=3D "license":
> -                        # For setuptools.build_meta and flit, licence is=
 a table
> +                        # For flit, licence is a table
> +                        # For setuptools.build_meta, license can be:
> +                        #  - an SPDX license expression as string, since=
 PEP-0639,
> +                        #  - a table, pre-PEP-0639,
>                          # but for poetry licence is a string
>                          # for hatchling, both table (jsonschema) and str=
ing (iniconfig) have been used
> -                        if build_backend =3D=3D "poetry.core.masonry.api=
":
> +                        if build_backend =3D=3D "poetry.core.masonry.api=
" or \
> +                                (build_backend =3D=3D "setuptools.build_=
meta" and type(values) =3D=3D str):

Should this be sent in a separate patch? It looks like it's fixing a bug in
recipetool, there's no explanation about it in your commit message.

Otherwise, I was able to build the tarball and test building the docs with =
it
(and your other docs patch)!

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


