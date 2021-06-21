Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.48861.1624289187450472939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 08:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o79MwQmi;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: sakoman@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id bm25so16528895qkb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0FVgaWG7cZ+uX6oJgQvJ42zYvwEblMYO78ojgR10fPE=;
        b=o79MwQmiwl6N3IymcUtWWG7I0mrn7ryxHsA97MJKgTMWyyFMvqgCIr/7z6/BvTEZA/
         XN9HlcjTCZ8tIIs1Jb0FJSutJzrTTmbeB7kTYMdrABu5q1LEwhXynTooYc1fHHdysdxv
         eLKxOfvDlIl9PqZnbsk25jmN5hFjFx3p4eib2miROYx7eK2k8XI12ZkcNYRQArvLbDA1
         D61LmStfCLEjt/bHdAzgB01JgvMKWZZevDV9XyIz6lZBQ6/ZHTVy4jLPH5rmwbla/8RR
         hGAgSo9u0mAhnYe4Ai4/3lcRJ44lBWblBDeSXMIfGd4ZvwI7J+br630LRGO5c8X0IU7W
         07vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0FVgaWG7cZ+uX6oJgQvJ42zYvwEblMYO78ojgR10fPE=;
        b=SqQDuWril/zMyO89hqpzjStTBcDPm0Rh2Ev27DT/klexLk4574/NTgk6t0eEz6WJ+S
         fi7ns87sw9p+jDOuQFHe9+V6Eeugu+cghPK3TBikFX9ghc7O91nlLbzanx6M+/Q8kCr7
         PDTSZIylxc4I9Lm5INBfKipGbzYfcbb51iRGzDDuxV3LfeR8sb65/y71x+C24S5uMShZ
         DnhLqEBFmo6byinhkFQVab5k5gvYAXCrY6olwI1Ea8zh9KjKh6bKO/k3cqmgQdtVWdN1
         UeRkrhvFIXYurX7gsUd8pgevgA3z8dUSyBeDNqwPKJcfu9KBCrsid0CsmsWuc8OV5/pn
         LtfA==
X-Gm-Message-State: AOAM531xTh0Lx+x4ESEs1dJX4orYcCobAWHEL3FuZVPqkT0yEFvxkmzS
	X02gR+OxTTiLRe7kvP75RF5YdaHOgboCQh3fSCrht7Tok9E=
X-Google-Smtp-Source: ABdhPJzzvLzmtZZ/ka0r6FFBCL0s0ftmxLgoM0svS4kXif+jur9cMcuOkaNzqVnzv+ev7AAx0BbDQlg+Ai6XOP1snwI=
X-Received: by 2002:a05:6902:4b2:: with SMTP id r18mr31553521ybs.401.1624289186241;
 Mon, 21 Jun 2021 08:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210621141045.256726-1-jasper@fancydomain.eu>
In-Reply-To: <20210621141045.256726-1-jasper@fancydomain.eu>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 21 Jun 2021 05:26:14 -1000
Message-ID: <CAGDS+nn3+01NZ3-GVD0wALQnyBgWmQU6Kz+3WZ_zB1UzEG7vsQ@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH] libxml2: Fix CVE-2021-3518
To: jasper@fancydomain.eu
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sadly this patch won't apply.

Could you rebase it on the current head of dunfell?  It seems you
generated this patch with an older version of dunfell that is missing
"libxml: fix CVE-2021-3517 CVE-2021-3537":

https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/=
dunfell-nut&id=3Df177c0ec321f005dd9ce63aec2d700fd53c993ff

Thanks again for helping with CVEs!

Steve

On Mon, Jun 21, 2021 at 4:11 AM Jasper Orschulko via
lists.openembedded.org <jasper=3Dfancydomain.eu@lists.openembedded.org>
wrote:
>
> There's a flaw in libxml2 in versions before 2.9.11. An attacker who is =
able to submit a crafted file to be processed by an application linked with=
 libxml2 could trigger a use-after-free. The greatest impact from this flaw=
 is to confidentiality, integrity, and availability.
>
> Upstream-Status: Backport [from fedora:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1954243]
>
> Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
> ---
>  .../libxml/libxml2/CVE-2021-3518.patch        | 108 ++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2021-3518.patch
> new file mode 100644
> index 0000000000..c22cccf1b1
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
> @@ -0,0 +1,108 @@
> +From ac82a514e16eb81b4506e2cba1a1ee45b9f025b5 Mon Sep 17 00:00:00 2001
> +From: Nick Wellnhofer <wellnhofer@aevum.de>
> +Date: Wed, 10 Jun 2020 16:34:52 +0200
> +Subject: [PATCH 1/2] Don't recurse into xi:include children in
> + xmlXIncludeDoProcess
> +
> +Otherwise, nested xi:include nodes might result in a use-after-free
> +if XML_PARSE_NOXINCNODE is specified.
> +
> +Found with libFuzzer and ASan.
> +
> +The upstream patch 752e5f71d7cea2ca5a7e7c0b8f72ed04ce654be4 has been mo=
dified,
> +as to avoid unnecessary modifications to fallback files.
> +
> +Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> +---
> + xinclude.c | 24 ++++++++++--------------
> + 1 file changed, 10 insertions(+), 14 deletions(-)
> +
> +diff --git a/xinclude.c b/xinclude.c
> +index ba850fa5..f260c1a7 100644
> +--- a/xinclude.c
> ++++ b/xinclude.c
> +@@ -2392,21 +2392,19 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, x=
mlDocPtr doc, xmlNodePtr tree) {
> +      * First phase: lookup the elements in the document
> +      */
> +     cur =3D tree;
> +-    if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1)
> +-      xmlXIncludePreProcessNode(ctxt, cur);
> +     while ((cur !=3D NULL) && (cur !=3D tree->parent)) {
> +       /* TODO: need to work on entities -> stack */
> +-      if ((cur->children !=3D NULL) &&
> +-          (cur->children->type !=3D XML_ENTITY_DECL) &&
> +-          (cur->children->type !=3D XML_XINCLUDE_START) &&
> +-          (cur->children->type !=3D XML_XINCLUDE_END)) {
> +-          cur =3D cur->children;
> +-          if (xmlXIncludeTestNode(ctxt, cur))
> +-              xmlXIncludePreProcessNode(ctxt, cur);
> +-      } else if (cur->next !=3D NULL) {
> ++        if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
> ++            xmlXIncludePreProcessNode(ctxt, cur);
> ++        } else if ((cur->children !=3D NULL) &&
> ++                   (cur->children->type !=3D XML_ENTITY_DECL) &&
> ++                   (cur->children->type !=3D XML_XINCLUDE_START) &&
> ++                   (cur->children->type !=3D XML_XINCLUDE_END)) {
> ++            cur =3D cur->children;
> ++            continue;
> ++        }
> ++      if (cur->next !=3D NULL) {
> +           cur =3D cur->next;
> +-          if (xmlXIncludeTestNode(ctxt, cur))
> +-              xmlXIncludePreProcessNode(ctxt, cur);
> +       } else {
> +           if (cur =3D=3D tree)
> +               break;
> +@@ -2416,8 +2414,6 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xml=
DocPtr doc, xmlNodePtr tree) {
> +                   break; /* do */
> +               if (cur->next !=3D NULL) {
> +                   cur =3D cur->next;
> +-                  if (xmlXIncludeTestNode(ctxt, cur))
> +-                      xmlXIncludePreProcessNode(ctxt, cur);
> +                   break; /* do */
> +               }
> +           } while (cur !=3D NULL);
> +--
> +2.32.0
> +
> +
> +From 3ad5ac1e39e3cd42f838c1cd27ffd4e9b79e6121 Mon Sep 17 00:00:00 2001
> +From: Nick Wellnhofer <wellnhofer@aevum.de>
> +Date: Thu, 22 Apr 2021 19:26:28 +0200
> +Subject: [PATCH 2/2] Fix user-after-free with `xmllint --xinclude --dro=
pdtd`
> +
> +The --dropdtd option can leave dangling pointers in entity reference
> +nodes. Make sure to skip these nodes when processing XIncludes.
> +
> +This also avoids scanning entity declarations and even modifying
> +them inadvertently during XInclude processing.
> +
> +Move from a block list to an allow list approach to avoid descending
> +into other node types that can't contain elements.
> +
> +Fixes #237.
> +
> +Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> +---
> + xinclude.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/xinclude.c b/xinclude.c
> +index f260c1a7..d7648529 100644
> +--- a/xinclude.c
> ++++ b/xinclude.c
> +@@ -2397,9 +2397,8 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xml=
DocPtr doc, xmlNodePtr tree) {
> +         if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
> +             xmlXIncludePreProcessNode(ctxt, cur);
> +         } else if ((cur->children !=3D NULL) &&
> +-                   (cur->children->type !=3D XML_ENTITY_DECL) &&
> +-                   (cur->children->type !=3D XML_XINCLUDE_START) &&
> +-                   (cur->children->type !=3D XML_XINCLUDE_END)) {
> ++                   ((cur->type =3D=3D XML_DOCUMENT_NODE) ||
> ++                    (cur->type =3D=3D XML_ELEMENT_NODE))) {
> +             cur =3D cur->children;
> +             continue;
> +         }
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-c=
ore/libxml/libxml2_2.9.10.bb
> index 4ebfb9e556..04d32ade69 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${=
PV}.tar.gz;name=3Dlibtar \
>             file://CVE-2020-7595.patch \
>             file://CVE-2019-20388.patch \
>             file://CVE-2020-24977.patch \
> +           file://CVE-2021-3518.patch \
>             "
>
>  SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
> --
> 2.32.0
>
>
>=20
>
