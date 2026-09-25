Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027C9C9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 13:09:38 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7794.1790341776399392795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 06:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oR9uvU04;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098db8dcdso180068b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790341776; cv=none;
        d=google.com; s=arc-20260327;
        b=Gr5btblDRPvbU6FqM/28xpYGRhGxJLBI7i+nAc3jmRfICJc6RG1clKplHYnadOhdKi
         pJ+hY4OBEH6jJeo8lxoIhCNhD7dzyu13SOMNBxdq5D3EGdM1+CI2hUPrG9XTnx2lzqgL
         REgtNRFiPkVWASK0QhmL9nAadK/z/4/rsEQSAsq1s74a6Nw/KCqlzoSMk8ax1wG9v6GN
         ay8wyEOaVeVhV0y3sIb3thN/Ab67wW9GGqNGefl/vcYaPSbai7p9ryco8A674WqN0mqf
         OZ14ZN02XBEBZ2fdaE2krosSh0odzJ4Is7rUERCeD1SMRHdetPE6vaKBEeI5+r3RDLiz
         H03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Spt+X8zreJL5WvyLOsIkiUw0qGiJRgvPMtuso7IXzB8=;
        fh=rnzEQbaIJUlpcGjgXuISAjqNb8Bycl4vXAeY2eu9pKI=;
        b=U3u6IV3UAsU5qTwP0LSRTmoIgj/KRLARkbCznMFNDmJl97JF449O6rbUzQjp13p23Z
         4f5DFq8z0Lc7Mz0nOTbP5ZKdTaGhlTWZpdc/shh3j48dd4XW9xayFVEUOgloYSxvecY2
         GHkmInDKkt3Ml+wWNSBzi/bo3qbqU01PwcbeTVAiSpMBcqFFJPQp4IUnPtLAZJ9TLoGs
         +gSfmxbNrccjN2XDQrDhvCgpfNeiBkeWQxHqrud+27ksQdY6Y86kg3COlGW/Ew7XxvoZ
         6qgw49bhJlOBxuG9elijCy0husvz4B3x4VENXNs4RNh+QQWhYB4tdkTeJAuRC8/Op+Ta
         Rmdg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790341776; x=1790946576; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Spt+X8zreJL5WvyLOsIkiUw0qGiJRgvPMtuso7IXzB8=;
        b=oR9uvU04XBxmx7/9Nxk3iKVqwkC1Ck4CE1iTTiUwyB1NQksa3c0z0hc+qUafsuvKmW
         mIg0a6M+NAaDWtr9OBDA8HTIZZUZP60Nb+rPjJqync33gwW2fygamWqG0PEJO/yKOqYD
         k56ndTXKkhm10N4g/IcCsYBNRWAWL7adYOd5g4CRf1UzEysUf1PE/F43nCyN5xSUVHYi
         9F3+UN76il/cvog0egig0iMyN7n0AjHFYvcxSTrl7H2+ia7F5ZVAggLPgd6heEoR8RLP
         W/KaWX2YR4RQcoTfkquGK1tljsmessgHV30neaLbW93AjshRfPP4Q/gmXAi2fEt9sINS
         K+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341776; x=1790946576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Spt+X8zreJL5WvyLOsIkiUw0qGiJRgvPMtuso7IXzB8=;
        b=QrPzTV4bQ8Df3CFpPN3SauOpYikzYxWs2FLuRRu4kGy3bIWCdk7IXRU3d1DInTxv0d
         g3xViEoJGH51eDBwdBRS2ZZAhjkj1fezswZX5bRxZQ6GeqcQa1Rt+ZE4nDPKGitgcBDJ
         SfRAFZCTtJ1ylcvVqRCAsW9ziOXYn0+DZIUO8Hyhg53ikymQxAYeLqJXf0mHb13YwFU8
         YNUVF8qvmie2Ly9PZHP3dkpbrY8BvI8cJMtPZXRovpdOHUk7UqJuK+gjYoTEfIEwrfwP
         vdFw18TQsPxclxmNlA16KrkzQxs+1wcSzejoLSvg6oRPPXhP0jQKxnu85d0xu6HnEtat
         paZQ==
X-Gm-Message-State: AFuF++lb/3+H//65LQCvE+a7VKYYRq36laIkvlM6FV+fTJIqB1xwptAb
	VLuYuyZfq6zrR9GyXvrbbbSWBuURElAcStP3Lfi/rpkFOcGGgAwdQn7LXjhwIuJaxesGeVwNHnQ
	UBrcZd6vvpMUw3N/2Y1eaMgEl+rFqgMs=
X-Gm-Gg: AYBFou2p6PjcT/+U0ngBXPzng9FLhiR/gOWVFoMvjEfnu+4Ar1eBcU6RsvzsUo3S2Dj
	Xl3/EenKHEn1jmzJVcC55XwbE8YubasiFLduEo6/kF+eHrdCkLaD+6bLPR2/tLl2MxYy5Q7QKKH
	ihHm/a2O2lz/G2anawe9jrZfi2eEWoYuSEvzNUAiYYIDZbS2aSxm1YRCw5PuOj4TU7rgLRaggWU
	eUaH2LzceNKtgphSi6AZYpy47yz4K6Ej6jw/ZGtMTs0EqjzkLav9/i0lZVjmzjMTKZpd9Nk38Mw
	By1WjCDpaDAPx6YPgGHP/3GtsPwd6DTfQHmUQw7B401oRJgFV43U9O22rf5TLvAadKeKubaRt8B
	hZxKwIZcPuMlwa8MhPLnnxvD9cVW4aU7k2CzXSJOoCir9BPlcNhQ8t2EfJlYXO+v1YrDbGwhlZg
	==
X-Received: by 2002:a05:6a00:92a0:b0:879:2178:b312 with SMTP id
 d2e1a72fcca58-87e9b797446mr5067619b3a.21.1790341775219; Fri, 25 Sep 2026
 06:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260925124825.1868909-1-ross.burton@arm.com> <20260925124825.1868909-2-ross.burton@arm.com>
In-Reply-To: <20260925124825.1868909-2-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Sep 2026 09:09:23 -0400
X-Gm-Features: AclHuK9K9yt75tFVNreGNl2mnr9CA8BXFmN0IrtcElzvwR9vPUnwUTHSBaO3WQo
Message-ID: <CADkTA4MMwRknDtUHG2GTX2Xb688cv-uhwHrCaK6fQ97bOEiJYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] python3-dtschema-wrapper: remove obsolete recipe
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000089e14d065c4e6de2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 13:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246619

--00000000000089e14d065c4e6de2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:48=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:

> This recipe was added so that the 5.16-rc4 kernel wouldn't depend on
> python3-dtschema-native to validate the DeviceTree files at build time.
>
> However, that requirement was removed in -rc5, so this recipe is not
> required.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../python3-dtschema-wrapper/dt-doc-validate  | 20 -------------------
>  .../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 -------------------
>  .../dtc/python3-dtschema-wrapper/dt-validate  | 20 -------------------
>  .../dtc/python3-dtschema-wrapper_2021.10.bb   | 19 ------------------
>  5 files changed, 80 deletions(-)
>  delete mode 100644
> meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
>  delete mode 100644
> meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
>  delete mode 100644
> meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
>  delete mode 100644 meta/recipes-kernel/dtc/
> python3-dtschema-wrapper_2021.10.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 53f5e6bf92a..d3dddaaee97 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -645,7 +645,6 @@ RECIPE_MAINTAINER:pn-python3-dbusmock =3D "Trevor
> Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-docutils =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-dtc =3D "Trevor Gamblin <tgamblin@baylibre.=
com
> >"
>  RECIPE_MAINTAINER:pn-python3-dtschema =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> -RECIPE_MAINTAINER:pn-python3-dtschema-wrapper =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>

Clearly the maintainer of this recipe was at the top of his game tracking
its use!

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>



>  RECIPE_MAINTAINER:pn-python3-editables =3D "Ross Burton <
> ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-extras =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-flit-core =3D "Tim Orling <
> tim.orling@konsulko.com>"
> diff --git
> a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
> b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
> deleted file mode 100644
> index 2aa57851c7e..00000000000
> --- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -# dt-doc-validate wrapper to allow kernel dt-validation to pass
> -#
> -# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
> -# License: MIT (see COPYING.MIT at the root of the repository for terms)
> -
> -for arg; do
> -    case "$arg" in
> -        --version)
> -            echo "v2021.10"
> -            ;;
> -    esac
> -done
> -
> -# TBD: left for future consideration
> -# exec dt-doc-validate.real "$@"
> -
> -# we always succeed
> -exit 0
> -
> diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schem=
a
> b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
> deleted file mode 100644
> index 24b89d86198..00000000000
> --- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -# dt-mk-schema wrapper to allow kernel dt-validation to pass
> -#
> -# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
> -# License: MIT (see COPYING.MIT at the root of the repository for terms)
> -
> -for arg; do
> -    case "$arg" in
> -        --version)
> -            echo "v2021.10"
> -            ;;
> -    esac
> -done
> -
> -# TBD: left for future consideration
> -# exec dt-mk-schema.real "$@"
> -
> -# we always succeed
> -exit 0
> -
> diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
> b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
> deleted file mode 100644
> index 8a4710a7eda..00000000000
> --- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -# dt-validate wrapper to allow kernel dt-validation to pass
> -#
> -# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
> -# License: MIT (see COPYING.MIT at the root of the repository for terms)
> -
> -for arg; do
> -    case "$arg" in
> -        --version)
> -            echo "v2021.10"
> -            ;;
> -    esac
> -done
> -
> -# TBD: left for future consideration
> -# exec dt-validate.real "$@"
> -
> -# we always succeed
> -exit 0
> -
> diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
> b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
> deleted file mode 100644
> index b19f53e20d8..00000000000
> --- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY =3D "Wrapper for tooling for devicetree validation using YAML an=
d
> jsonschema"
> -HOMEPAGE =3D "https://yoctoproject.org"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> -
> -SRC_URI =3D "file://dt-doc-validate \
> -           file://dt-mk-schema \
> -           file://dt-validate"
> -
> -S =3D "${UNPACKDIR}"
> -
> -do_install() {
> -    install -d ${D}${bindir}/
> -    install -m 755 ${UNPACKDIR}/dt-doc-validate ${D}${bindir}/
> -    install -m 755 ${UNPACKDIR}/dt-mk-schema ${D}${bindir}/
> -    install -m 755 ${UNPACKDIR}/dt-validate ${D}${bindir}/
> -}
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000089e14d065c4e6de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 25, 2026 at 8:48=
=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.bur=
ton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This recipe was added so that the 5.16-rc4 kernel wouldn&#39;t d=
epend on<br>
python3-dtschema-native to validate the DeviceTree files at build time.<br>
<br>
However, that requirement was removed in -rc5, so this recipe is not<br>
required.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 -<br>
=C2=A0.../python3-dtschema-wrapper/dt-doc-validate=C2=A0 | 20 -------------=
------<br>
=C2=A0.../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 ------------------=
-<br>
=C2=A0.../dtc/python3-dtschema-wrapper/dt-validate=C2=A0 | 20 -------------=
------<br>
=C2=A0.../dtc/<a href=3D"http://python3-dtschema-wrapper_2021.10.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-dtschema-wrapper_2021.10.bb</a>=C2=
=A0 =C2=A0| 19 ------------------<br>
=C2=A05 files changed, 80 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/d=
t-doc-validate<br>
=C2=A0delete mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/d=
t-mk-schema<br>
=C2=A0delete mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/d=
t-validate<br>
=C2=A0delete mode 100644 meta/recipes-kernel/dtc/<a href=3D"http://python3-=
dtschema-wrapper_2021.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-d=
tschema-wrapper_2021.10.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 53f5e6bf92a..d3dddaaee97 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -645,7 +645,6 @@ RECIPE_MAINTAINER:pn-python3-dbusmock =3D &quot;Trevor =
Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgam=
blin@baylibre.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-docutils =3D &quot;Trevor Gamblin &lt;<a=
 href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.=
com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-dtc =3D &quot;Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-dtschema =3D &quot;Bruce Ashfield &lt;<a=
 href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@=
gmail.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-dtschema-wrapper =3D &quot;Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfie=
ld@gmail.com</a>&gt;&quot;<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Clearly the maintainer of this=
 recipe was at the top of his game tracking its use!</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Acked-by: Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0RECIPE_MAINTAINER:pn-python3-editables =3D &quot;Ross Burton &lt;<a h=
ref=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-extras =3D &quot;Trevor Gamblin &lt;<a h=
ref=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.co=
m</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-flit-core =3D &quot;Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;&quot;<br>
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-valida=
te b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate<br>
deleted file mode 100644<br>
index 2aa57851c7e..00000000000<br>
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-#!/bin/sh<br>
-# dt-doc-validate wrapper to allow kernel dt-validation to pass<br>
-#<br>
-# Copyright (C) 2021 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
-# License: MIT (see COPYING.MIT at the root of the repository for terms)<b=
r>
-<br>
-for arg; do<br>
-=C2=A0 =C2=A0 case &quot;$arg&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --version)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;v2021.10&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 esac<br>
-done<br>
-<br>
-# TBD: left for future consideration<br>
-# exec dt-doc-validate.real &quot;$@&quot;<br>
-<br>
-# we always succeed<br>
-exit 0<br>
-<br>
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema =
b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema<br>
deleted file mode 100644<br>
index 24b89d86198..00000000000<br>
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-#!/bin/sh<br>
-# dt-mk-schema wrapper to allow kernel dt-validation to pass<br>
-#<br>
-# Copyright (C) 2021 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
-# License: MIT (see COPYING.MIT at the root of the repository for terms)<b=
r>
-<br>
-for arg; do<br>
-=C2=A0 =C2=A0 case &quot;$arg&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --version)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;v2021.10&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 esac<br>
-done<br>
-<br>
-# TBD: left for future consideration<br>
-# exec dt-mk-schema.real &quot;$@&quot;<br>
-<br>
-# we always succeed<br>
-exit 0<br>
-<br>
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate b=
/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate<br>
deleted file mode 100644<br>
index 8a4710a7eda..00000000000<br>
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-#!/bin/sh<br>
-# dt-validate wrapper to allow kernel dt-validation to pass<br>
-#<br>
-# Copyright (C) 2021 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
-# License: MIT (see COPYING.MIT at the root of the repository for terms)<b=
r>
-<br>
-for arg; do<br>
-=C2=A0 =C2=A0 case &quot;$arg&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --version)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;v2021.10&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 esac<br>
-done<br>
-<br>
-# TBD: left for future consideration<br>
-# exec dt-validate.real &quot;$@&quot;<br>
-<br>
-# we always succeed<br>
-exit 0<br>
-<br>
diff --git a/meta/recipes-kernel/dtc/<a href=3D"http://python3-dtschema-wra=
pper_2021.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-dtschema-wrap=
per_2021.10.bb</a> b/meta/recipes-kernel/dtc/<a href=3D"http://python3-dtsc=
hema-wrapper_2021.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-dtsch=
ema-wrapper_2021.10.bb</a><br>
deleted file mode 100644<br>
index b19f53e20d8..00000000000<br>
--- a/meta/recipes-kernel/dtc/<a href=3D"http://python3-dtschema-wrapper_20=
21.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-dtschema-wrapper_202=
1.10.bb</a><br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-SUMMARY =3D &quot;Wrapper for tooling for devicetree validation using YAML=
 and jsonschema&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://yoctoproject.org" rel=3D"noreferrer"=
 target=3D"_blank">https://yoctoproject.org</a>&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9c=
fbcb788c80a0384361b4de20420&quot;<br>
-<br>
-SRC_URI =3D &quot;file://dt-doc-validate \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dt-mk-schema \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dt-validate&quot;<br>
-<br>
-S =3D &quot;${UNPACKDIR}&quot;<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 install -d ${D}${bindir}/<br>
-=C2=A0 =C2=A0 install -m 755 ${UNPACKDIR}/dt-doc-validate ${D}${bindir}/<b=
r>
-=C2=A0 =C2=A0 install -m 755 ${UNPACKDIR}/dt-mk-schema ${D}${bindir}/<br>
-=C2=A0 =C2=A0 install -m 755 ${UNPACKDIR}/dt-validate ${D}${bindir}/<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000089e14d065c4e6de2--

