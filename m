Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CF5C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 18:52:07 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1334.1784141521696641474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 11:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SHonMlWC;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8111c0c7561so79862877b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784141521; cv=none;
        d=google.com; s=arc-20260327;
        b=Q5qUj17mWVgM92LiHxZSxTtM/woVoxCwV3iAxYgvtWuGgfDvDuozMlD/OIJjBWCIsa
         eL67Sn6W8oonK0EYPRzyCRf9hG/xBmXdczZv6Q4CeAeZi55VvxnDt3b7oJYjhSLgiRXu
         a3ZB+b0I8Je5ZLUG5hf/5RLJHyBSunh/OSXyxmSrdFdkZpjr+xqU9RKjlVIW4pukMtYw
         1ZGl4bIjzkyy6yzfIdY7ywKi2sXSnzqY8W//hoj2YnG423hrS/zKVxxbYY8/Sm0QlUh4
         3bT2Twl2SBOSOUiizS2/HAg6bA1HZx45UNM+M6wTfXekKWMglJ/gqPG2TbtiHJTot4uI
         Bisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ae7d7ZuhB3Pj4W7yqvHFqTOIT9m5SiG88Ix11+NGQI8=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=VyhxhujkyuszrqZj+jqeu3OViZicOZo7NJqf3tEc4o3cIDWTsN+RijsqgM/GX3uDeh
         U5u/QiGSLRAfdET4OgfxS7ow1EyS7CZ/92QMctO1/8BcybFU0YMjBG3fRfwqCF+Q+ygd
         EwihFXxNnB8KjlD2e5BHdtT/Eff+p33lwgKmHC7IM7yr4ko7QusUbvpMv++NpUMVswr+
         +5Az0IAR+9TtxvMMWOK/OtpawSJh6kEstfH1uWQKH4A2ANtANwzk818STslrQd2DqhyG
         eDhaHsXrFXxgs8KJXq5cYm+2xVLh/GB5m2k8PuF9QXCjZCXDM1JWZCxRmbXrT1TVQFEw
         Z8oA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784141521; x=1784746321; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae7d7ZuhB3Pj4W7yqvHFqTOIT9m5SiG88Ix11+NGQI8=;
        b=SHonMlWChek419TfjEz7EH1Fj5Arbisfnkq6C6xCwatBuXIwRJpnbsByjunn90v6V1
         RPyx/BhRE//VzmCqkcrpjmiTMEB4zho5Ivtj07hT6OBKe7+DzZIG+yYn5w4PKLQDDk7i
         J58zTReibyBohfryAhH0aFkQvkEoH8BnZYxFzOebkXGQ/X4StN2SBS+vf0cH6SwON9PR
         OOCkt7fcI4sSDPvFwNuRm4+wfZYelGhuq3jSFQeO6HZnwXNFYBkHwonQPWtxwkH5bAQl
         97qzK7dTtz5iKsuOY3M7zCCkFOscw6pWLoduf75CYL3z0O28uyG+tal9p2accocVHxlL
         3nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784141521; x=1784746321;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ae7d7ZuhB3Pj4W7yqvHFqTOIT9m5SiG88Ix11+NGQI8=;
        b=U5hT41DvCYdKs73e2jDpoVqnzWUzH3WRptYztoO1ugaPzKFDRY/g71oEKB4g44qKFX
         1TUthdOcXMAK0345PNRxMgYJJBEGVRyUIB6H4BeRz0YHjhS2GmmkujL0T2EqSL6jOLcC
         5jkmJoTe/yy99LloGvQdhkytV4fNhyJxmXR//zuSxa/9NSeoZvZabbTnfpVwXvq53Brk
         hML1TonQNNqfr6jJ3xz2ufHV9njkUL7EKjNoFvtbSZwU3FvobAVFQcD/UDKosTYPv2/I
         C/P2QSRvXu7erqANwCB6fMG7CKAo4BM4S2QF+5uuOqf+u72HG2ZtVzQJFIxVEDeUS0Nu
         ZPlQ==
X-Gm-Message-State: AOJu0Yz7CLEsjQgRJAhsX8tkFeh8YHC0PIWd3Q056+eFyFAk/Gi+4Jrf
	TSxqekWlsD1bJKwdE+5nBsfYmg+/ldPnxDTYZJ5X9jMEZ/8ZY6bUXZprTkY1GLA4R6RsvjKfdUS
	NTeuqhuzhb+4tPgfWCx5fpuJGus/UkeI=
X-Gm-Gg: AfdE7cm63/S7y4Cne4/9Gu/8mv0NTEw2brlpNWYHRQMcuv9ERHWLosHCT3htpoL+Snw
	DlTbm8XP89sa3DrSGylMqJrRY3zA3BARiTPMvGwyOm9na1Jna1gZ4LB3UeSPN9/j7eKjAe8O5fg
	R/4mtiQncj0ubkwj9ZAxypR/A0HL/N6RUUIQKzEMaUT27xen/zmvlEMr0LRcpepfV5GI7r7/HbM
	NsxJN+4cF/xnu5spAgasSuFfgmoI++zXKEAOlRA0+rnMFAsd1KizpplT16J1uXACiLYFlbd6IxP
	2m6LO2aPicE=
X-Received: by 2002:a05:690c:450b:b0:7dd:3463:6872 with SMTP id
 00721157ae682-81ec0078186mr55964017b3.41.1784141520567; Wed, 15 Jul 2026
 11:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com> <b6095f7ae705b87895634e1d8143e2ca399e0618.camel@pbarker.dev>
 <CAJdd5GaMjP_dUwRUKVQf7FCVgn1HrC6xULmWhpp52kEyPJ2B=w@mail.gmail.com>
In-Reply-To: <CAJdd5GaMjP_dUwRUKVQf7FCVgn1HrC6xULmWhpp52kEyPJ2B=w@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 15 Jul 2026 12:51:49 -0600
X-Gm-Features: AUfX_mxW3S3-BnXs3Od6kIpQPVtRGIvcl9g30KbbZReJbpEDs_LruoLlMQ4TLVw
Message-ID: <CAJdd5GbJtbrNskX2m9azcsDG25fHy0cjG4hHovmadvhjsGM63g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 00/25] Rework LICENSE to be SPDX License Expressions
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000090013c0656aad156"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 18:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241035

--00000000000090013c0656aad156
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 11:56=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com>=
 wrote:

>
>
> On Wed, Jul 15, 2026 at 11:11=E2=80=AFAM Paul Barker <paul@pbarker.dev> w=
rote:
>
>> On Wed, 2026-07-15 at 10:44 -0600, Joshua Watt via
>> lists.openembedded.org wrote:
>> > Reworks the way that the LICENSE variable is used so that it uses vali=
d
>> > SPDX License Expressions instead of the custom expressions that were
>> > used previously (which are based on Python syntax). This includes
>> > support for the SPDX "WITH" operator which allows a license exception =
to
>> > be attached to a license identifier.
>> >
>> > The old licenses expressions are still allowed, and will still be
>> > correctly parsed, however a warning will be issued that indicates the
>> > new license string that should be used.
>> >
>> > Most layers should be able to use the newly-revised
>> > scripts/contrib/convert-spdx-licenses.py script to do the majority of
>> > the conversion work, although some manual work may still be required i=
f
>> > conditional or complex LICENSE expressions are encountered.
>> >
>> > SPDX License Expressions require that all licenses listed are either a
>> > known identifier (e.g. "GPL-2.0-or-later") or start with the prefix
>> > "LicenseRef-" which indicates a custom license. When converting from o=
ld
>> > expressions to new one this will need to be followed (the suggested ne=
w
>> > license in the warning and the conversion script will automatically ad=
d
>> > this prefix for any unrecognized license identifiers). This will most
>> > commonly be the case for NO_GENERIC_LICENSE files; for a good example =
of
>> > what needs to be done here see the changes to the linux-firmware recip=
e.
>> > When adding new LicenseRef- licenses to a recipe, the actual license
>> > name should be prefixed with the name of the recipe (e.g.
>> > "LicenseRef-myrecipe-mylicense") to prevent conflicts when merging
>> > multiple license documents together (e.g. in an image).
>> >
>> > SPDX also introduces the "WITH" operator to add an exception to a
>> > license instead of using a bespoke identifier to combine the two, as w=
as
>> > done with the legacy license expressions. Because of this, the logic f=
or
>> > dealing with the INCOMPATIBLE_LICENSE family of variables has changed
>> > slightly. The main difference is that INCOMPATIBLE_LICENSE will now
>> > match the LHS of a "WITH" expression (where as previously this was
>> > "ignored" since it was a bespoke license ID). In order to allow a
>> > license that would normally be rejected, but can be allowed with an
>> > exception, specifically allowed exceptions can be added to the
>> > INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS her=
e
>> > means "exceptions to INCOMPATIBLE_LICENSES", not specifically SPDX
>> > License Exceptions). If an SPDX exception is present here, any license
>> > that has that exception will be allowed, even if it would normally mat=
ch
>> > INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for
>> > those with the GCC exception, use:
>> >
>> >     INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0*"
>> >     INCOMPATIBLE_LICENSE_EXCEPTIONS =3D "GCC-exception-3.1" # This new
>> line is required
>> >
>> >
>> > Additionally, "PD" ("Public Domain") is not allowed as a generic licen=
se
>> > identifier. Aside from "PD" not being a valid SPDX License Identifier,
>> > most "Public Domain" licenses do have some sort of text associated wit=
h
>> > them (see the HPND family of SPDX Licenses, or use the (SPDX License
>> > Match Website)[1] ). In addition, the meaning of "Public Domain" can
>> vary
>> > by jurisdiction, so the actual text with a LicenseRef- or a SPDX Licen=
se
>> > Identifier needs to be used instead.
>> >
>> > Finally, "CLOSED" is also no longer allowed as a license expression
>> > (since it is not a valid SPDX License Identifier). Instead use a
>> > LicenseRef- to point to a file that contains the actual license text
>> > (usually something like "Copyright <name>, all rights reserved")
>>
>> Hi Joshua,
>>
>> I've had a skim through but not reviewed in detail, this looks good in
>> general.
>>
>> I'm concerned about removing support for "CLOSED" as a license
>> expression though, that has been used extensively on downstream projects
>> I've worked on over the years. It's helpful to be able to bypass license
>> checking where it may not be needed.
>>
>
> My reason for getting rid of it was along the same lines as trying to get
> rid of "PD" as a license; there is certainly some license text that is
> relevant, and the exact text might vary by jurisdiction so having a singl=
e
> identifier that tries to lump it all together may not be a good idea. For
> example, in the US, I might have something like "Copyright Joshua Watt, a=
ll
> rights reserved". It should be noted that a LicenseRef- licenses can
> reference something in a layer LICENSE_DIR, so I can for example create a
> file named "JoshuaProprietaryLicense" in my layer, then use
> "LicenseRef-JoshuaProprietaryLicense" in my LICENSE expression to refer t=
o
> it as necessary. We _could_ potentially make a "CLOSED" file in oe-core
> with the text "All rights reserved" in it, then recipes could use
> "LicenseRef-CLOSED" in it; but that strays into legal territory and I don=
't
> really want to assume that's the correct "closed" license text in all
> jurisdictions.
>
> CLOSED is not a valid SPDX license identifier, so it can't really be
> propagated around in SPDX license expressions. That said, if we want to
> treat the line 'LICENSE =3D "CLOSED"' to effectively mean "no license" (w=
here
> you simply get no SPDX license expression when you parse it) that should =
be
> doable.
>

FWIW, the code was already really close to doing this. I implemented it
quickly here:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djpew/spd=
x-licenses&id=3D7f9837f6ca5b016610674d3ed72f4572990f087d

so see if that makes sense.


>
>
>>
>> After applying this series there is still handling for "CLOSED" in
>> several places such as populate_lic_qa_checksum() in insane.bbclass.
>>
>
> Some of them are kept around for compatibility with "legacy" license
> expressions, and some I probably just missed.
>
>
>>
>> Best regards,
>>
>> --
>> Paul Barker
>>
>>

--00000000000090013c0656aad156
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 15,=
 2026 at 11:56=E2=80=AFAM Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmai=
l.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ju=
l 15, 2026 at 11:11=E2=80=AFAM Paul Barker &lt;<a href=3D"mailto:paul@pbark=
er.dev" target=3D"_blank">paul@pbarker.dev</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Wed, 2026-07-15 at 10:44 -0600=
, Joshua Watt via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Reworks the way that the LICENSE variable is used so that it uses vali=
d<br>
&gt; SPDX License Expressions instead of the custom expressions that were<b=
r>
&gt; used previously (which are based on Python syntax). This includes<br>
&gt; support for the SPDX &quot;WITH&quot; operator which allows a license =
exception to<br>
&gt; be attached to a license identifier.<br>
&gt; <br>
&gt; The old licenses expressions are still allowed, and will still be<br>
&gt; correctly parsed, however a warning will be issued that indicates the<=
br>
&gt; new license string that should be used.<br>
&gt; <br>
&gt; Most layers should be able to use the newly-revised<br>
&gt; scripts/contrib/convert-spdx-licenses.py script to do the majority of<=
br>
&gt; the conversion work, although some manual work may still be required i=
f<br>
&gt; conditional or complex LICENSE expressions are encountered.<br>
&gt; <br>
&gt; SPDX License Expressions require that all licenses listed are either a=
<br>
&gt; known identifier (e.g. &quot;GPL-2.0-or-later&quot;) or start with the=
 prefix<br>
&gt; &quot;LicenseRef-&quot; which indicates a custom license. When convert=
ing from old<br>
&gt; expressions to new one this will need to be followed (the suggested ne=
w<br>
&gt; license in the warning and the conversion script will automatically ad=
d<br>
&gt; this prefix for any unrecognized license identifiers). This will most<=
br>
&gt; commonly be the case for NO_GENERIC_LICENSE files; for a good example =
of<br>
&gt; what needs to be done here see the changes to the linux-firmware recip=
e.<br>
&gt; When adding new LicenseRef- licenses to a recipe, the actual license<b=
r>
&gt; name should be prefixed with the name of the recipe (e.g.<br>
&gt; &quot;LicenseRef-myrecipe-mylicense&quot;) to prevent conflicts when m=
erging<br>
&gt; multiple license documents together (e.g. in an image).<br>
&gt; <br>
&gt; SPDX also introduces the &quot;WITH&quot; operator to add an exception=
 to a<br>
&gt; license instead of using a bespoke identifier to combine the two, as w=
as<br>
&gt; done with the legacy license expressions. Because of this, the logic f=
or<br>
&gt; dealing with the INCOMPATIBLE_LICENSE family of variables has changed<=
br>
&gt; slightly. The main difference is that INCOMPATIBLE_LICENSE will now<br=
>
&gt; match the LHS of a &quot;WITH&quot; expression (where as previously th=
is was<br>
&gt; &quot;ignored&quot; since it was a bespoke license ID). In order to al=
low a<br>
&gt; license that would normally be rejected, but can be allowed with an<br=
>
&gt; exception, specifically allowed exceptions can be added to the<br>
&gt; INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS her=
e<br>
&gt; means &quot;exceptions to INCOMPATIBLE_LICENSES&quot;, not specificall=
y SPDX<br>
&gt; License Exceptions). If an SPDX exception is present here, any license=
<br>
&gt; that has that exception will be allowed, even if it would normally mat=
ch<br>
&gt; INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for<br=
>
&gt; those with the GCC exception, use:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0INCOMPATIBLE_LICENSE =3D &quot;GPL-3.0* LGPL-3.0*&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0INCOMPATIBLE_LICENSE_EXCEPTIONS =3D &quot;GCC-excep=
tion-3.1&quot; # This new line is required<br>
&gt; <br>
&gt; <br>
&gt; Additionally, &quot;PD&quot; (&quot;Public Domain&quot;) is not allowe=
d as a generic license<br>
&gt; identifier. Aside from &quot;PD&quot; not being a valid SPDX License I=
dentifier,<br>
&gt; most &quot;Public Domain&quot; licenses do have some sort of text asso=
ciated with<br>
&gt; them (see the HPND family of SPDX Licenses, or use the (SPDX License<b=
r>
&gt; Match Website)[1] ). In addition, the meaning of &quot;Public Domain&q=
uot; can vary<br>
&gt; by jurisdiction, so the actual text with a LicenseRef- or a SPDX Licen=
se<br>
&gt; Identifier needs to be used instead.<br>
&gt; <br>
&gt; Finally, &quot;CLOSED&quot; is also no longer allowed as a license exp=
ression<br>
&gt; (since it is not a valid SPDX License Identifier). Instead use a<br>
&gt; LicenseRef- to point to a file that contains the actual license text<b=
r>
&gt; (usually something like &quot;Copyright &lt;name&gt;, all rights reser=
ved&quot;)<br>
<br>
Hi Joshua,<br>
<br>
I&#39;ve had a skim through but not reviewed in detail, this looks good in<=
br>
general.<br>
<br>
I&#39;m concerned about removing support for &quot;CLOSED&quot; as a licens=
e<br>
expression though, that has been used extensively on downstream projects<br=
>
I&#39;ve worked on over the years. It&#39;s helpful to be able to bypass li=
cense<br>
checking where it may not be needed.<br></blockquote><div><br></div><div>My=
 reason for getting rid of it was along the same lines as trying to get rid=
 of &quot;PD&quot; as a license; there is certainly=C2=A0some license text =
that is relevant, and the exact text might vary by jurisdiction=C2=A0so hav=
ing a single identifier that tries to lump it all together may not be a goo=
d idea. For example, in the US, I might have something like &quot;Copyright=
 Joshua Watt, all rights reserved&quot;. It should be noted that a LicenseR=
ef- licenses can reference something in a layer LICENSE_DIR, so I can for e=
xample create a file named &quot;JoshuaProprietaryLicense&quot; in my=C2=A0=
layer, then use &quot;LicenseRef-JoshuaProprietaryLicense&quot; in my LICEN=
SE expression to refer to it as necessary. We _could_ potentially make a &q=
uot;CLOSED&quot; file in oe-core with the text &quot;All rights reserved&qu=
ot; in it, then recipes could use &quot;LicenseRef-CLOSED&quot; in it; but =
that strays into legal territory and I don&#39;t really want to assume that=
&#39;s the correct &quot;closed&quot; license text in all jurisdictions.</d=
iv><div><br></div><div>CLOSED is not a valid SPDX license identifier, so it=
 can&#39;t really be propagated around in SPDX license expressions. That sa=
id, if we want to treat the line &#39;LICENSE =3D &quot;CLOSED&quot;&#39; t=
o effectively mean &quot;no license&quot; (where you simply get no SPDX lic=
ense expression when you parse it) that should be doable.</div></div></div>=
</blockquote><div><br></div><div>FWIW, the code was already really close to=
 doing this. I implemented it quickly here:=C2=A0</div><div><a href=3D"http=
s://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djpew/spdx-li=
censes&amp;id=3D7f9837f6ca5b016610674d3ed72f4572990f087d">https://git.opene=
mbedded.org/openembedded-core-contrib/commit/?h=3Djpew/spdx-licenses&amp;id=
=3D7f9837f6ca5b016610674d3ed72f4572990f087d</a>=C2=A0</div><div>so see if t=
hat makes sense.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
After applying this series there is still handling for &quot;CLOSED&quot; i=
n<br>
several places such as populate_lic_qa_checksum() in insane.bbclass.<br></b=
lockquote><div><br></div><div>Some of them are kept around for compatibilit=
y with &quot;legacy&quot; license expressions, and some I probably just mis=
sed.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000090013c0656aad156--

