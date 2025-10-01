Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97205CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 15:56:36 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.web10.763.1759334195816356095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 08:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IGJM4NLu;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.45, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6360397e8c7so115102d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759334195; x=1759938995; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgYrbdFCCX5KSqzoH2jzFvdgbamdTKWAHM4AxZP28nA=;
        b=IGJM4NLuUW6sGf4DyzlGvRhWL2MLbv7dBi9oBoP2G76Bke+DBp/Oj0GKAnzrm/wjPr
         dgSFNCOP+YsYfEIUZ8Yayv/DWpxQHekRIR8YRCRf77KuulnaWpflM8waS4mjsEbcwBiN
         yCuOSWfjrAJiHeoSRR+aNhNi3LFgno8tw2unAQ5nUfDXMV4lEgYHqrAz9emeS6SAAg0l
         BdBqOkx7Zvr3t9ftMxd9U1ZwgvULxdtpRCBm6eSa6J2WrLgmdzQ5XpNJ6Etgxk1+SjKA
         m01U4drYvtD7bqbWb7KBMHQkYUiK/F0KrrbJfmE/HzNlZjOF7zzFO51DOeaxN/CuN9zu
         ym+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759334195; x=1759938995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgYrbdFCCX5KSqzoH2jzFvdgbamdTKWAHM4AxZP28nA=;
        b=QM6vf4n/UXkWn1Q1XTEzgz8iumVLexxSrYFNo/mVoZKLG7gObnq8waTA+vwLgM5wBL
         /JQkS8ky+bYiGHAC2fa7M+vbU2F3gY2ZYF7gmX8qOCzwst9lNrElZNUjC3wxGZoKs2p4
         uHgbrWAjg5nyyxYPNAXJUV9YiGNz6CUtGQj8R1W6BzrOCpICT383fW0I45ryPPNP2/xX
         H15iRuDqFYVE9b2Oo5aMNjlqnv3Nej0jqwUVSWxIgRsnCBdL2h898yb44tZnCRIZvlPV
         TqUkWBmjkIQdbrtnhYeE0LwCP8p3cNPfXo9kKecFQOrnYjzT/WsozeQDtXmvD7TneHad
         pa0Q==
X-Gm-Message-State: AOJu0Yw7r7/7+s/rpnKVQpNUbBUkhk3upza0jCDlWsqRYZX+8cgm5hmX
	oNxG2OmJNHBWMRByq/S9VZQ2t1jj4/pwiVK6FDj4tquFeIj7Fc08fWA3TZpWnfUpPFyZiNZlMAu
	Zcqs5YAY+860yDOMwn+qAGW7K0lgEawGYGvh3qsmlBdAWjT3xc/Hf
X-Gm-Gg: ASbGncuaxS/mymDdihrpO02tkc59v0MH8G6SFPWIwdgbvjiZCfvQwDBCI019m9MrDKy
	n4eNLAkWyAy6WPgvrAwPDS7rm7/wdy0XbzK+s3S8DAf5Ii+wfL7qfe4/f25NcANueX5oX6k5ZZs
	7fBD72C6k6UsFMVS62yOqUhZhzZY+N6dA/O2991VhrXftaQH22qIMxjsbeqLw4PcfMeJAR0/eUx
	d6Y3j61mrHIot5tizYhe6ysqs7D38f8rpyB//nWItMib3n74E7SYLq8qChbZlw=
X-Google-Smtp-Source: AGHT+IHdR43TZ50Yxz7tZ/kdTwcgu41b8SGdXuj8bDaGyoOJQRzL747YWqcEJFagp6YXt0vqojCVuJ8HbRnT5k9xT/Q=
X-Received: by 2002:a53:e015:0:b0:636:111b:a4c9 with SMTP id
 956f58d0204a3-63b6ff22769mr4558571d50.21.1759334194814; Wed, 01 Oct 2025
 08:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251001121649.2605064-1-tgaige.opensource@witekio.com>
In-Reply-To: <20251001121649.2605064-1-tgaige.opensource@witekio.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Oct 2025 08:56:24 -0700
X-Gm-Features: AS18NWDaldNC5BLXVfjHqcUQg-StPywFYP3gN4GnmHZj691VNL6rMwDNrubiisA
Message-ID: <CAOSpxdZrBV1zg3Yzh=ESfSPWiuVfwcPE+2r625KFQZJqpzBcKw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libxml2: fix CVE-2025-9714
To: tgaige.opensource@witekio.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 15:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224309

On Wed, Oct 1, 2025 at 5:32=E2=80=AFAM Th=C3=A9o Gaig=C3=A9 via lists.opene=
mbedded.org
<tgaige.opensource=3Dwitekio.com@lists.openembedded.org> wrote:
>
> From: Theo GAIGE <tgaige.opensource@witekio.com>
>
> Upstream-Status: Backport from https://git.launchpad.net/ubuntu/+source/l=
ibxml2/commit/?id=3Dff48b80d7ebd968eb9d4ee2d6cb3174959ad871a
>
> Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
> ---
>  .../libxml/libxml2/CVE-2025-9714.patch        | 117 ++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch b/meta/=
recipes-core/libxml/libxml2/CVE-2025-9714.patch
> new file mode 100644
> index 0000000000..99e0c7dfb3
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch
> @@ -0,0 +1,117 @@
> +From b2c6511bd90063652ca1f8814f98ccae9dd24026 Mon Sep 17 00:00:00 2001
> +From: Octavio Galland <octavio.galland@canonical.com>
> +Date: Fri, 5 Sep 2025 12:36:12 -0300
> +Subject: [PATCH] Make XPath depth check work with recursive invocations
> +
> +EXSLT functions like dyn:map or dyn:evaluate invoke xmlXPathRunEval
> +recursively. Don't set depth to zero but keep and restore the original
> +value to avoid stack overflows when abusing these functions.
> +
> +Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/libx=
ml2/commit/?id=3Dff48b80d7ebd968eb9d4ee2d6cb3174959ad871a]

launchpad.net is not the upstream for libxml2.  Please reference the
commit in the upstream libxml2 git repository.

Thanks,

Steve

> +CVE: CVE-2025-9714
> +
> +Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
> +---
> + xpath.c | 23 +++++++++++++++++------
> + 1 file changed, 17 insertions(+), 6 deletions(-)
> +
> +diff --git a/xpath.c b/xpath.c
> +index c2d845888..028471d53 100644
> +--- a/xpath.c
> ++++ b/xpath.c
> +@@ -13883,12 +13883,11 @@ static int
> + xmlXPathRunEval(xmlXPathParserContextPtr ctxt, int toBool)
> + {
> +     xmlXPathCompExprPtr comp;
> ++    int oldDepth;
> +
> +     if ((ctxt =3D=3D NULL) || (ctxt->comp =3D=3D NULL))
> +       return(-1);
> +
> +-    ctxt->context->depth =3D 0;
> +-
> +     if (ctxt->valueTab =3D=3D NULL) {
> +       /* Allocate the value stack */
> +       ctxt->valueTab =3D (xmlXPathObjectPtr *)
> +@@ -13942,11 +13941,13 @@ xmlXPathRunEval(xmlXPathParserContextPtr ctxt,=
 int toBool)
> +           "xmlXPathRunEval: last is less than zero\n");
> +       return(-1);
> +     }
> ++    oldDepth =3D ctxt->context->depth;
> +     if (toBool)
> +       return(xmlXPathCompOpEvalToBoolean(ctxt,
> +           &comp->steps[comp->last], 0));
> +     else
> +       xmlXPathCompOpEval(ctxt, &comp->steps[comp->last]);
> ++    ctxt->context->depth =3D oldDepth;
> +
> +     return(0);
> + }
> +@@ -14217,6 +14218,7 @@ xmlXPathCompExprPtr
> + xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str) {
> +     xmlXPathParserContextPtr pctxt;
> +     xmlXPathCompExprPtr comp;
> ++    int oldDepth =3D 0;
> +
> + #ifdef XPATH_STREAMING
> +     comp =3D xmlXPathTryStreamCompile(ctxt, str);
> +@@ -14230,8 +14232,10 @@ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, co=
nst xmlChar *str) {
> +     if (pctxt =3D=3D NULL)
> +         return NULL;
> +     if (ctxt !=3D NULL)
> +-        ctxt->depth =3D 0;
> ++        oldDepth =3D ctxt->depth;
> +     xmlXPathCompileExpr(pctxt, 1);
> ++    if (ctxt !=3D NULL)
> ++        ctxt->depth =3D oldDepth;
> +
> +     if( pctxt->error !=3D XPATH_EXPRESSION_OK )
> +     {
> +@@ -14252,8 +14256,10 @@ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, co=
nst xmlChar *str) {
> +       comp =3D pctxt->comp;
> +       if ((comp->nbStep > 1) && (comp->last >=3D 0)) {
> +             if (ctxt !=3D NULL)
> +-                ctxt->depth =3D 0;
> ++                oldDepth =3D ctxt->depth;
> +           xmlXPathOptimizeExpression(pctxt, &comp->steps[comp->last]);
> ++            if (ctxt !=3D NULL)
> ++                ctxt->depth =3D oldDepth;
> +       }
> +       pctxt->comp =3D NULL;
> +     }
> +@@ -14409,6 +14415,7 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt) =
{
> + #ifdef XPATH_STREAMING
> +     xmlXPathCompExprPtr comp;
> + #endif
> ++    int oldDepth =3D 0;
> +
> +     if (ctxt =3D=3D NULL) return;
> +
> +@@ -14422,8 +14429,10 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt)=
 {
> + #endif
> +     {
> +         if (ctxt->context !=3D NULL)
> +-            ctxt->context->depth =3D 0;
> ++            oldDepth =3D ctxt->context->depth;
> +       xmlXPathCompileExpr(ctxt, 1);
> ++        if (ctxt->context !=3D NULL)
> ++            ctxt->context->depth =3D oldDepth;
> +         CHECK_ERROR;
> +
> +         /* Check for trailing characters. */
> +@@ -14432,9 +14441,11 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt)=
 {
> +
> +       if ((ctxt->comp->nbStep > 1) && (ctxt->comp->last >=3D 0)) {
> +             if (ctxt->context !=3D NULL)
> +-                ctxt->context->depth =3D 0;
> ++                oldDepth =3D ctxt->context->depth;
> +           xmlXPathOptimizeExpression(ctxt,
> +               &ctxt->comp->steps[ctxt->comp->last]);
> ++            if (ctxt->context !=3D NULL)
> ++                ctxt->context->depth =3D oldDepth;
> +         }
> +     }
> +
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.14.bb
> index f34b0c25ca..932251da98 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> @@ -42,6 +42,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20080827.=
tar;subdir=3D${BP};name=3Dtestt
>             file://CVE-2025-6021.patch \
>             file://CVE-2025-49794-CVE-2025-49796.patch \
>             file://CVE-2025-6170.patch \
> +           file://CVE-2025-9714.patch \
>             "
>
>  SRC_URI[archive.sha256sum] =3D "60d74a257d1ccec0475e749cba2f21559e48139e=
fba6ff28224357c7c798dfee"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224208): https://lists.openembedded.org/g/openembedde=
d-core/message/224208
> Mute This Topic: https://lists.openembedded.org/mt/115531861/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

