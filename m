Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA847C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 09:14:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.9066.1676884475090792823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 01:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RTLygg9u;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id f18so833365lfa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 01:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eLThRI3D9P8iuM7FM6fnf4gQ8LdRM5UuYYTOxoPnnu8=;
        b=RTLygg9u9XoM2YhePfs+aMYrTwimSd37N/MpDtkH5fnDGeanbZJ8UcIVibWPszakhj
         puKri49z0TUzNbprARJ8ewESwSwhnw0QLwtNNmbFKoTOWKlT2jPVtq6xc0uZdsGt7HwW
         IPFABq7nePuD26r6lwCbvNQvBwSjaznyiShy9OSZbTKNGO14+N+AdThdSStiduIjNuZ6
         m7FZ+mVrJzWsqikHWQ0NKHj+YhuyXfqTxEx1LqVwopHtFCIN0JZKZuQ997Pjjupjb2E5
         NnlmdYhClxK6XDMUkO+eelkzfbCw9TUWpnBiGCDVAykKtsSs2dh49e14HUxg+8FrNj/S
         BB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLThRI3D9P8iuM7FM6fnf4gQ8LdRM5UuYYTOxoPnnu8=;
        b=Qb84CYO39ZqYCd+LPrK5R59vluXunZq0KB3Hs7lP7YSghR62Xxvd0aEjEX+zNRdQ4h
         EYiNCrR6WoV7QqurYibyBU0rzCMbApFL3GDheu8A3csdhPYsSE8z8xVPzpxZosJdrg1X
         BMwmcJ3TT4Y/yczWYdlFtgxHyMivGoh2CrYZoXoTOFIrGbfSMvN3cZ1AOXRX80DAdTrG
         gTt0dM3/Sj882vqn9pxW5tsZimHn6ZXkC1HEETVPDaNRmk5TLte7QkicJBbj4Z/E0ha7
         0dg5/Tudf7248KAqyNfjbc5qeZ+Ewwmkn7s0DKctYacz9Ygg9rSmaK25GlcNPQYixqzy
         8FAw==
X-Gm-Message-State: AO0yUKVLDojYmpPgYfGWVt9jgfm/kTFInop5ZzFfrLDLWDxKLX45duw0
	SclAFNI7++nC+WeCE8fDPLYhPqkrFcsqY5+KXAY=
X-Google-Smtp-Source: AK7set8EXfAt3IDCTz/9ThCdLrmx7Chvi8S8Y9uBOrUmlok6Zx6x0A/2yGtuGLHrkyKmkbeaLG1vDfIkLs+GyP5Chaw=
X-Received: by 2002:a19:f009:0:b0:4db:eeb:3dea with SMTP id
 p9-20020a19f009000000b004db0eeb3deamr401190lfc.11.1676884473101; Mon, 20 Feb
 2023 01:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20230219213807.3415938-1-rich@richelberger.com> <010001866b9cf531-82d2c73e-d459-4055-93f9-a7c83fcce6f9-000000@email.amazonses.com>
In-Reply-To: <010001866b9cf531-82d2c73e-d459-4055-93f9-a7c83fcce6f9-000000@email.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Feb 2023 10:14:21 +0100
Message-ID: <CANNYZj-enrDBn2M7UUnAqaPctsJP00AUuC9rdJ7e_Xx2w4-+rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
To: Richard Elberger <rich@richelberger.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 09:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177397

Please squash the two commits into one.

Alex



On Sun, 19 Feb 2023 at 22:38, Richard Elberger <rich@richelberger.com> wrote:
>
> ---
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 74 ++++++++++++-------
>  1 file changed, 49 insertions(+), 25 deletions(-)
>
> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> index 2bec1442af..71aa8c14ec 100644
> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> @@ -1,30 +1,54 @@
>  SUMMARY = "Document type definitions for verification of XML data files"
>  DESCRIPTION = "Document type definitions for verification of XML data \
> -files against the DocBook rule set, it ships with the latest DocBook 4.5 \
> -XML DTD, as well as a selected set of legacy DTDs for use with older \
> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> -HOMEPAGE = "http://www.docbook.org/xml/"
> +files against the DocBook rule set."
> +HOMEPAGE = "https://docbook.org"
>
> -LICENSE = "OASIS"
> -LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
> +inherit allarch
> +BBCLASSEXTEND = "native"
>
> -# Note: the upstream sources are not distributed with a license file.
> -# LICENSE-OASIS is included as a "patch" to workaround this. When
> -# upgrading this recipe, please verify whether this is still needed.
> -SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
> -           file://LICENSE-OASIS \
> -           file://docbook-xml-update-catalog.xml.patch \
> -"
> +# To support apps with xml schema backward compatibility, we must
> +# install a set of schemas. Install the latest based on PV and then
> +# name any specific versions as required. TODO: Figure out a mechanism
> +# to filter exactly which versions are necessary, if that's even
> +# possible.
> +#
> +# DocBook.org lists available packages at https://docbook.org/xml/
> +#
> +# These packages are available as source but it requires the ability
> +# to use the Gradle build system to do so. It might be safer to use
> +# the source tree which would also enable proper SBOM generation
> +# through the bitbake build system. https://github.com/docbook/docbook
> +#
>
> -SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
> -SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
> +S = "${WORKDIR}"
>
> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
> +SRC_URI += "https://docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-xml-4.1.2"
> +SRC_URI[payload412.md5sum] = "900d7609fb7e6d78901b357e4acfbc17"
> +SRC_URI[payload412.sha256sum] = "30f0644064e0ea71751438251940b1431f46acada814a062870f486c772e7772"
>
> -S = "${WORKDIR}/docbook-xml-4.5.c31424"
> +SRC_URI += "https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-xml-4.2"
> +SRC_URI[payload42.md5sum] = "73fe50dfe74ca631c1602f558ed8961f"
> +SRC_URI[payload42.sha256sum] = "acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02cca40eeebe60fa2"
>
> -inherit allarch
> -BBCLASSEXTEND = "native"
> +SRC_URI += "https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-xml-4.3"
> +SRC_URI[payload43.md5sum] = "ab200202b9e136a144db1e0864c45074"
> +SRC_URI[payload43.sha256sum] = "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464"
> +
> +SRC_URI += "https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-xml-4.4"
> +SRC_URI[payload44.md5sum] = "cbb04e9a700955d88c50962ef22c1634"
> +SRC_URI[payload44.sha256sum] = "02f159eb88c4254d95e831c51c144b1863b216d909b5ff45743a1ce6f5273090"
> +
> +SRC_URI += "https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-xml-${PV}"
> +SRC_URI[payloadPV.md5sum] = "03083e288e87a7e829e437358da7ef9e"
> +SRC_URI[payloadPV.sha256sum] = "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"
> +
> +# The upstream sources are not distributed with a license file.
> +# LICENSE-OASIS is included as a "patch" to workaround this. When
> +# upgrading this recipe, please verify whether this is still needed.
> +
> +LICENSE = "OASIS"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
> +SRC_URI += "file://LICENSE-OASIS"
>
>  do_configure (){
>      :
> @@ -34,19 +58,19 @@ do_compile (){
>      :
>  }
>
> +inherit xmlcatalog
> +
>  do_install () {
>      install -d ${D}${sysconfdir}/xml/
>      xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml
>
> -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
> +    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do
>          DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
>          install -d -m 755 ${D}$DEST
> -        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
> -        xmlcatalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
> +        cp -v -R docbook-xml-$DTDVERSION/* ${D}$DEST
> +        xmlcatalog --verbose --noout --add nextCatalog unused \
> +          file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
>      done
>  }
>
> -XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
> -inherit xmlcatalog
> -
>  FILES:${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
> --
> 2.34.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177391): https://lists.openembedded.org/g/openembedded-core/message/177391
> Mute This Topic: https://lists.openembedded.org/mt/97074292/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

