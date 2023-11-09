Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBD9C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 14:31:25 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.122874.1699540283911027410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 06:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3YhtE1o;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7baea76391dso594916241.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 06:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699540283; x=1700145083; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ykrycbt3Ga6/iKHucbpwrqv5RI4+P0ItwFGgKnN7j2o=;
        b=b3YhtE1o/RUFKtz7hfOnd75Il70C92oux3lLRHAcaP3r4pnQQ+3pm0SlYO46EASQwG
         rAP6LFS2Wa8Pj+lYbX2O0Ocfdj1kbWrZUfGDXCDlJEuSRhRNJSMiNZMmS6siidUV/uRM
         sOad7bR6cpooYaCtqMRmWZZyKGeUn1qAG73rVIjWM47MI0fWLaIZrno79w3ELjIge0Aa
         5/Qi4RtyDdw7uK5Lm7aLETAUdTPZnBgFjSxq+wQ7Me2hIQ5Gu/q+ERvzyk0z1GNweNez
         5evpGM1JubDtSvGwLKIAPfqmP+DVKJ6awf+q6H+ZyfKK2U6xv6igD7sEmsGeJd6ux5BX
         ltWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699540283; x=1700145083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykrycbt3Ga6/iKHucbpwrqv5RI4+P0ItwFGgKnN7j2o=;
        b=Z36vBnEiW3wW17XMfT6uJF7vQwjnFqz2bOIT62ufCnfx3/tc45jNTqg10GLEDyk0Vm
         Pm+Y3sm7JfSNr7zb2g8jMbxAhB/c3JWhGw+WWMfFRN65Rtgs0Ok2KGU1NbotV8xf64of
         YogckwyVxNig3yv6d05z1pcaKJSVxQ1oe/4oU1I5Jtypn1+cO6UUCuzpkhD0XARJKfDA
         SBOHae6XbUSw8NCnfDm9CalZL26EK6C7Km2GN2yek/Z4x7mAQ8E4CJQh2eyyq38kK5fn
         l46q/hfG4yAEge9JDu7jL+EIFVygrl/T7dX3M33vhDXA9qEtK+QRIUqgFeJQ6Izo9Fr4
         EOZw==
X-Gm-Message-State: AOJu0Yz6EEjvb08Hh+B4zn0LOAoZ/G8t93gppNfBJU+Ld1sq2CwZJEaE
	xUJ5FyJr0OecLKq6VU5HnjlNYsfqA9qXG8tR5qM=
X-Google-Smtp-Source: AGHT+IEf+dCHxjK/8ip05Sg7KJ76F/wF9J7WnSqEBYcc6r9x/GGSApVZpX+zbSsRSr4o4obzw7wOo2WbPXOVqcDrtzk=
X-Received: by 2002:a05:6102:440c:b0:457:c953:bc39 with SMTP id
 df12-20020a056102440c00b00457c953bc39mr2731210vsb.1.1699540282872; Thu, 09
 Nov 2023 06:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20231109123611.146694-1-peter.marko@siemens.com> <CADkTA4N6EBjEXN4ttCp_DuBMw8MfYqwCcRNuRgRzZujjQoK1DA@mail.gmail.com>
In-Reply-To: <CADkTA4N6EBjEXN4ttCp_DuBMw8MfYqwCcRNuRgRzZujjQoK1DA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 9 Nov 2023 14:31:11 +0000
Message-ID: <CANPvuR=SPmJtf==5dVGU9QK+dr3YmHQiArfJGGJZ5uq9q49QCg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] goarch: Move Go architecture mapping
 to a library
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Peter Marko <peter.marko@siemens.com>, openembedded-core@lists.openembedded.org, 
	Joshua Watt <JPEWhacker@gmail.com>, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000d797f70609b90e09"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 14:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190387

--000000000000d797f70609b90e09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta, 9/11/2023
=C3=A0(s) 14:18:

> On Thu, Nov 9, 2023 at 7:37=E2=80=AFAM Peter Marko <peter.marko@siemens.c=
om>
> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Other spaces uses the Go architecture definitions as their own (for
> > example, container arches are defined to be Go arches). To make it
> > easier for other places to use this mapping, move the code that does th=
e
> > translation of OpenEmbedded arches to Go arches to a library.
> >
> > (From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)
> >
> > This commit together with meta-virtualization commit
> > 115f6367f37095415f289fb6981cda9608ac72ff
> > broke meta-virtualization master used with
> > meta-lts-mixins kirkstone/go which is our primary
> > usecase for having kirkstone/go mixin layer
> >
>
> I was trying to figure out the best way to address this issue
> just yesterday.
>
> If the patch is accepted for backport, then that's definitely
> another solution.
>

Looks like this kirstone patch doesn't change anything on the
goarch.bbclass
functionality so everything should work as before.
If it is not possible to integrate we can try to move some of these changes
to
the meta-lts-mixins kirkstone/go.

Jose


> Otherwise, I'll have to carry the meta-virt patch that I did
> in nanbield on master until such a time as any branches
> that will reasonably work with meta-virt master have the
> go_arch library change.
>
> Alternatively, I suppose we could trap the error and use
> a fallback, etc, but I won't get complicated yet :)
>
> Bruce
>
> > Manually crafted since cherry-pick had too many conflicts:
> > * different path to classes
> > * additional architecture loongarch64
> > * different way how to import library
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes/base.bbclass   |  2 +-
> >  meta/classes/goarch.bbclass | 27 +++------------------------
> >  meta/lib/oe/go.py           | 32 ++++++++++++++++++++++++++++++++
> >  3 files changed, 36 insertions(+), 25 deletions(-)
> >  create mode 100644 meta/lib/oe/go.py
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index b15c5839b6..ee26ee5597 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -12,7 +12,7 @@ inherit logging
> >
> >  OE_EXTRA_IMPORTS ?=3D ""
> >
> > -OE_IMPORTS +=3D "os sys time oe.path oe.utils oe.types oe.package
> oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa
> oe.reproducible oe.rust ${OE_EXTRA_IMPORTS}"
> > +OE_IMPORTS +=3D "os sys time oe.path oe.utils oe.types oe.package
> oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa
> oe.reproducible oe.rust oe.go ${OE_EXTRA_IMPORTS}"
> >  OE_IMPORTS[type] =3D "list"
> >
> >  PACKAGECONFIG_CONFARGS ??=3D ""
> > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > index 92fec16b82..394c0c5d84 100644
> > --- a/meta/classes/goarch.bbclass
> > +++ b/meta/classes/goarch.bbclass
> > @@ -61,31 +61,10 @@ SECURITY_NOPIE_CFLAGS ??=3D ""
> >  CCACHE_DISABLE ?=3D "1"
> >
> >  def go_map_arch(a, d):
> > -    import re
> > -    if re.match('i.86', a):
> > -        return '386'
> > -    elif a =3D=3D 'x86_64':
> > -        return 'amd64'
> > -    elif re.match('arm.*', a):
> > -        return 'arm'
> > -    elif re.match('aarch64.*', a):
> > -        return 'arm64'
> > -    elif re.match('mips64el.*', a):
> > -        return 'mips64le'
> > -    elif re.match('mips64.*', a):
> > -        return 'mips64'
> > -    elif a =3D=3D 'mips':
> > -        return 'mips'
> > -    elif a =3D=3D 'mipsel':
> > -        return 'mipsle'
> > -    elif re.match('p(pc|owerpc)(64le)', a):
> > -        return 'ppc64le'
> > -    elif re.match('p(pc|owerpc)(64)', a):
> > -        return 'ppc64'
> > -    elif a =3D=3D 'riscv64':
> > -        return 'riscv64'
> > -    else:
> > +    arch =3D oe.go.map_arch(a)
> > +    if not arch:
> >          raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" %
> a)
> > +    return arch
> >
> >  def go_map_arm(a, d):
> >      if a.startswith("arm"):
> > diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
> > new file mode 100644
> > index 0000000000..9996057f12
> > --- /dev/null
> > +++ b/meta/lib/oe/go.py
> > @@ -0,0 +1,32 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +import re
> > +
> > +def map_arch(a):
> > +    if re.match('i.86', a):
> > +        return '386'
> > +    elif a =3D=3D 'x86_64':
> > +        return 'amd64'
> > +    elif re.match('arm.*', a):
> > +        return 'arm'
> > +    elif re.match('aarch64.*', a):
> > +        return 'arm64'
> > +    elif re.match('mips64el.*', a):
> > +        return 'mips64le'
> > +    elif re.match('mips64.*', a):
> > +        return 'mips64'
> > +    elif a =3D=3D 'mips':
> > +        return 'mips'
> > +    elif a =3D=3D 'mipsel':
> > +        return 'mipsle'
> > +    elif re.match('p(pc|owerpc)(64le)', a):
> > +        return 'ppc64le'
> > +    elif re.match('p(pc|owerpc)(64)', a):
> > +        return 'ppc64'
> > +    elif a =3D=3D 'riscv64':
> > +        return 'riscv64'
> > +    return ''
> > --
> > 2.30.2
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190386):
> https://lists.openembedded.org/g/openembedded-core/message/190386
> Mute This Topic: https://lists.openembedded.org/mt/102484351/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d797f70609b90e09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
quinta, 9/11/2023 =C3=A0(s) 14:18:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Thu, Nov 9, 2023 at 7:37=E2=80=AFAM Peter Marko &lt;<=
a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@sie=
mens.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt;<br>
&gt; Other spaces uses the Go architecture definitions as their own (for<br=
>
&gt; example, container arches are defined to be Go arches). To make it<br>
&gt; easier for other places to use this mapping, move the code that does t=
he<br>
&gt; translation of OpenEmbedded arches to Go arches to a library.<br>
&gt;<br>
&gt; (From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)<br>
&gt;<br>
&gt; This commit together with meta-virtualization commit<br>
&gt; 115f6367f37095415f289fb6981cda9608ac72ff<br>
&gt; broke meta-virtualization master used with<br>
&gt; meta-lts-mixins kirkstone/go which is our primary<br>
&gt; usecase for having kirkstone/go mixin layer<br>
&gt;<br>
<br>
I was trying to figure out the best way to address this issue<br>
just yesterday.<br>
<br>
If the patch is accepted for backport, then that&#39;s definitely<br>
another solution.<br></blockquote><div><br></div>Looks like this kirstone p=
atch doesn&#39;t change anything on the goarch.bbclass <br><div>functionali=
ty so everything=C2=A0should work as before.</div><div>If it is not possibl=
e to integrate we can try to move some of these changes to</div><div>the me=
ta-lts-mixins kirkstone/go.<br><br>Jose<br><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Otherwise, I&#39;ll have to carry the meta-virt patch that I did<br>
in nanbield on master until such a time as any branches<br>
that will reasonably work with meta-virt master have the<br>
go_arch library change.<br>
<br>
Alternatively, I suppose we could trap the error and use<br>
a fallback, etc, but I won&#39;t get complicated yet :)<br>
<br>
Bruce<br>
<br>
&gt; Manually crafted since cherry-pick had too many conflicts:<br>
&gt; * different path to classes<br>
&gt; * additional architecture loongarch64<br>
&gt; * different way how to import library<br>
&gt;<br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; Cc: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"=
_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" ta=
rget=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/base.bbclass=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 meta/classes/goarch.bbclass | 27 +++------------------------<br>
&gt;=C2=A0 meta/lib/oe/go.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 +=
+++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 36 insertions(+), 25 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/lib/oe/go.py<br>
&gt;<br>
&gt; diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
&gt; index b15c5839b6..ee26ee5597 100644<br>
&gt; --- a/meta/classes/base.bbclass<br>
&gt; +++ b/meta/classes/base.bbclass<br>
&gt; @@ -12,7 +12,7 @@ inherit logging<br>
&gt;<br>
&gt;=C2=A0 OE_EXTRA_IMPORTS ?=3D &quot;&quot;<br>
&gt;<br>
&gt; -OE_IMPORTS +=3D &quot;os sys time oe.path oe.utils oe.types oe.packag=
e oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license <a href=3D"h=
ttp://oe.qa" rel=3D"noreferrer" target=3D"_blank">oe.qa</a> oe.reproducible=
 oe.rust ${OE_EXTRA_IMPORTS}&quot;<br>
&gt; +OE_IMPORTS +=3D &quot;os sys time oe.path oe.utils oe.types oe.packag=
e oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license <a href=3D"h=
ttp://oe.qa" rel=3D"noreferrer" target=3D"_blank">oe.qa</a> oe.reproducible=
 oe.rust oe.go ${OE_EXTRA_IMPORTS}&quot;<br>
&gt;=C2=A0 OE_IMPORTS[type] =3D &quot;list&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG_CONFARGS ??=3D &quot;&quot;<br>
&gt; diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass=
<br>
&gt; index 92fec16b82..394c0c5d84 100644<br>
&gt; --- a/meta/classes/goarch.bbclass<br>
&gt; +++ b/meta/classes/goarch.bbclass<br>
&gt; @@ -61,31 +61,10 @@ SECURITY_NOPIE_CFLAGS ??=3D &quot;&quot;<br>
&gt;=C2=A0 CCACHE_DISABLE ?=3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 def go_map_arch(a, d):<br>
&gt; -=C2=A0 =C2=A0 import re<br>
&gt; -=C2=A0 =C2=A0 if re.match(&#39;i.86&#39;, a):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;386&#39;<br>
&gt; -=C2=A0 =C2=A0 elif a =3D=3D &#39;x86_64&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;amd64&#39;<br>
&gt; -=C2=A0 =C2=A0 elif re.match(&#39;arm.*&#39;, a):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;arm&#39;<br>
&gt; -=C2=A0 =C2=A0 elif re.match(&#39;aarch64.*&#39;, a):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;arm64&#39;<br>
&gt; -=C2=A0 =C2=A0 elif re.match(&#39;mips64el.*&#39;, a):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips64le&#39;<br>
&gt; -=C2=A0 =C2=A0 elif re.match(&#39;mips64.*&#39;, a):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips64&#39;<br>
&gt; -=C2=A0 =C2=A0 elif a =3D=3D &#39;mips&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips&#39;<br>
&gt; -=C2=A0 =C2=A0 elif a =3D=3D &#39;mipsel&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mipsle&#39;<br>
&gt; -=C2=A0 =C2=A0 elif re.match(&#39;p(pc|owerpc)(64le)&#39;, a):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;ppc64le&#39;<br>
&gt; -=C2=A0 =C2=A0 elif re.match(&#39;p(pc|owerpc)(64)&#39;, a):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;ppc64&#39;<br>
&gt; -=C2=A0 =C2=A0 elif a =3D=3D &#39;riscv64&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;riscv64&#39;<br>
&gt; -=C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 arch =3D oe.go.map_arch(a)<br>
&gt; +=C2=A0 =C2=A0 if not arch:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Unsu=
pported CPU architecture: %s&quot; % a)<br>
&gt; +=C2=A0 =C2=A0 return arch<br>
&gt;<br>
&gt;=C2=A0 def go_map_arm(a, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if a.startswith(&quot;arm&quot;):<br>
&gt; diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9996057f12<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/lib/oe/go.py<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +#<br>
&gt; +# Copyright OpenEmbedded Contributors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +import re<br>
&gt; +<br>
&gt; +def map_arch(a):<br>
&gt; +=C2=A0 =C2=A0 if re.match(&#39;i.86&#39;, a):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;386&#39;<br>
&gt; +=C2=A0 =C2=A0 elif a =3D=3D &#39;x86_64&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;amd64&#39;<br>
&gt; +=C2=A0 =C2=A0 elif re.match(&#39;arm.*&#39;, a):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;arm&#39;<br>
&gt; +=C2=A0 =C2=A0 elif re.match(&#39;aarch64.*&#39;, a):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;arm64&#39;<br>
&gt; +=C2=A0 =C2=A0 elif re.match(&#39;mips64el.*&#39;, a):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips64le&#39;<br>
&gt; +=C2=A0 =C2=A0 elif re.match(&#39;mips64.*&#39;, a):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips64&#39;<br>
&gt; +=C2=A0 =C2=A0 elif a =3D=3D &#39;mips&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips&#39;<br>
&gt; +=C2=A0 =C2=A0 elif a =3D=3D &#39;mipsel&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mipsle&#39;<br>
&gt; +=C2=A0 =C2=A0 elif re.match(&#39;p(pc|owerpc)(64le)&#39;, a):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;ppc64le&#39;<br>
&gt; +=C2=A0 =C2=A0 elif re.match(&#39;p(pc|owerpc)(64)&#39;, a):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;ppc64&#39;<br>
&gt; +=C2=A0 =C2=A0 elif a =3D=3D &#39;riscv64&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;riscv64&#39;<br>
&gt; +=C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190386): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190386" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190386</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102484351/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102484351/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000d797f70609b90e09--

