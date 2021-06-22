Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.10190.1624372432554882952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 07:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W+xCbffT;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.50, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f50.google.com with SMTP id m18so23950947wrv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qGQUcv5H7dqZgTt64lvLCntv4OcyifeWD7ffq6gjA+w=;
        b=W+xCbffTxXwdfN+9Z64thgCNc56bt9HM/ZKkogDyzcGLg1jSHJKOisVkb4uTi66zBu
         Ef/ghCOW01Ac0eoPGLS+/PZ90jshtyeJokKAdfpsPw1UwIpLWfdJ+aGfwaqJjMO0E2PN
         EkGGVzum99Vwacykz0ZKy1mpbIAXcIXmINpSO9cIVmxeV2yHeANHcdmRXyPptl4PniDc
         WyFG1yhWuMi6df7JXTDHu98DfYv2u3i4alTGdhVJwDe/kWUov0F2SuGtxFL3oqqDaL8c
         0wPcbEeSrcHD9HY3T9Egnhy/WmbPngjRFFAnR4KfnMUIHia7lfg+9P27148Vz2cF7gWj
         +Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qGQUcv5H7dqZgTt64lvLCntv4OcyifeWD7ffq6gjA+w=;
        b=aaw+isFntUhSPp+35920Xh1qc8LUamMi13uiWpbCaManvoH5ZAud4YvTs1RNkcpxrs
         WJcLJQdRHc+snG8fl9VHA2j+0DXvXpok/YNrW4aH9/I/CSbBdvf8OaJbK6vA+f5RxUIK
         +M0DZbDoCJ4+snzMtkmj4iYFHJjOXjvVXPBpsGpqOnatjqNZ+UgCyCSh4puuLHE7m3uB
         sOSZoHXklKBSXmS/IIa7PnLZMgpbqVPRpw+yFEDCQhkM/Xer244hYK5qpHRdWfPhRolc
         g660cX6KtYmmze7Is/VvUkUelvZQOJEuONBnMe6urAKaH6q45kYLsBOI1Jik68AXCYFG
         2SIQ==
X-Gm-Message-State: AOAM532Jjv1tpCG+a5lVkZsQCJLIgLHkW5rMBtWBk+0ocf300ZSn/Rps
	qLBdZVQf05yJORt//wyRNuuz2bYi9pqL61KjnLpQRQ==
X-Google-Smtp-Source: ABdhPJzwNzPiLqbPWlajmvpWG9ue7kJ7u24eQ7H0smVUdyDgBn33AuEOda85mWf1zw2gs4M76Q86L5QtOKqhhoFeA9s=
X-Received: by 2002:a5d:6710:: with SMTP id o16mr5199325wru.205.1624372431000;
 Tue, 22 Jun 2021 07:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210621153322.266965-1-jasper@fancydomain.eu>
In-Reply-To: <20210621153322.266965-1-jasper@fancydomain.eu>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 22 Jun 2021 04:33:38 -1000
Message-ID: <CAOSpxdaCjoZjbAyp+av7X6RzM7ZobxnWker=VKHze_Cn3KCPZg@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH v2] libxml2: Fix CVE-2021-3518
To: jasper@fancydomain.eu
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 5:34 AM Jasper Orschulko via
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

I'm sorry I didn't notice this on the first review, but this patch is
also missing the CVE and Upstream-Status tags.

Thanks,

Steve

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
> index 097613fb28..b5fb3e6315 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -25,6 +25,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${=
PV}.tar.gz;name=3Dlibtar \
>             file://CVE-2020-24977.patch \
>             file://CVE-2021-3517.patch \
>             file://CVE-2021-3537.patch \
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
