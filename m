Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C964C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:00:39 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.8448.1690880431646858818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K95EQ9N/;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b974031aeaso82240681fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690880430; x=1691485230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xXABX98O2jeU9uMVLwlA2ozVq4+IPrbT5bM5h4SZgkg=;
        b=K95EQ9N/e7I40AmsJTQPZ+o9c4mzwAcSZJy5bDDM5ZDjwdpjEHsuWQCGI5YEja44WC
         RzIKRjcD2YrrFrMquEBWMtZjjmHmTZk0OQdM3qFnwWaH7+QjqtU9uwZ33N0L8HbRPY+m
         MIBbyRtKllLifkWiXOOsNUVqlIoCn7lvhh7AfvPoA4dVcXcReBzeDJBFKPNpY2uq6ArV
         Y4ID76C0kCG68xBmU2zkFuAteW/8Ojj9PFEBQ72h5saQzLDg0fTP7D3I0d7sYrDcNZm1
         Zt6QAlXyl7JiXcNrUHfycYf9MSnjASHWkU/M3QND3134lufoJTRS/85Y2JAlVwLA004s
         +gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880430; x=1691485230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXABX98O2jeU9uMVLwlA2ozVq4+IPrbT5bM5h4SZgkg=;
        b=AJNxc/i8wGp5gbhu6Di8UjHuXUf1K8P20D9sVwDo872jFBZ4Q5FKbcPnIQIAAhER2E
         c+1YAEvpuJGvJJgsFfOqbgcYl0/oO5Iwto01mH2lRacxicp/M/0BeP7U02vbn2HLL4Xp
         MLxDXLgXZY/r1JgFGVcprMpoy3bN1QXFdJohyWumH3r1iHA+7k0PVxjQ7XbFbvOx68vL
         3/ZvtxEkc4yv1uExPrg76V8Tj+4qGzLb3YiVMTmFDJKzef3F8DmND0cTElkV5CtEtsmr
         bf/36gOWBs+01FAcHJu9jGu82oT9r/t1zXoDStWLeSJkrvITat5UML6s8WfXxLkUt6ku
         V37A==
X-Gm-Message-State: ABy/qLayKEu8G8A+v5QErhMgDciXaPeOB06kLYhPGBYl4F/q9qF/55le
	FHEkwGl8V/EgbEL3lh5aFkeeOPFOW1jwZ+Z6+tY=
X-Google-Smtp-Source: APBJJlHz7RRnS912+JpG4UUnchLBJ1bT9MXNp97IGcRmavFy8oDdGGJcp5bhxfdKryb7B3DLceJdoY/8Na1ZC9ehyBI=
X-Received: by 2002:a05:651c:82:b0:2b9:453f:a383 with SMTP id
 2-20020a05651c008200b002b9453fa383mr1809871ljq.53.1690880429474; Tue, 01 Aug
 2023 02:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
In-Reply-To: <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 1 Aug 2023 11:00:18 +0200
Message-ID: <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use --offline
 instead of --frozen
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000005b480e0601d8c7e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185216

--0000000000005b480e0601d8c7e4
Content-Type: text/plain; charset="UTF-8"

Thanks Richard, but I'd prefer to drop this patch if possible.
I think the rust-hello-world is no more useful and that we can replace it
by a more "real" example like zvariant
from meta-selftest.

Let's see what others think about this

On Tue, 1 Aug 2023 at 10:46, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2023-07-31 at 11:44 +0200, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > And use that for rust-hello-world recipe that did not ship
> > a Cargo.lock file.
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  meta/classes-recipe/cargo.bbclass                          | 4 +++-
> >  meta/classes-recipe/cargo_common.bbclass                   | 3 +++
> >  meta/recipes-extended/rust-example/rust-hello-world_git.bb | 2 ++
> >  3 files changed, 8 insertions(+), 1 deletion(-)
>
> Could you send a patch to the manual please adding the new variable
> CARGO_NO_FROZEN?
>
> I'm torn on this one as we could have simpler code which did:
>
> CARGO_FREEZE_OPTION = "--frozen"
>
> and then have the hello-world recipe:
>
> CARGO_FREEZE_OPTION = "--offline"
>
> but I'm torn on whether that is better or not...
>
> Cheers,
>
> Richard
>

--0000000000005b480e0601d8c7e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Richard, but I&#39;d prefer to drop this patch if p=
ossible.<div>I think the rust-hello-world is no more useful=C2=A0and that w=
e can replace it by a more &quot;real&quot; example like zvariant</div><div=
>from meta-selftest.</div><div><br></div><div>Let&#39;s see what others thi=
nk about this</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, 1 Aug 2023 at 10:46, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, 2023-07-31 at 11:44 +0200, Frederic Martinsons wrote:<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; <br>
&gt; And use that for rust-hello-world recipe that did not ship<br>
&gt; a Cargo.lock file.<br>
&gt; <br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/cargo.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
&gt;=C2=A0 meta/classes-recipe/cargo_common.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 meta/recipes-extended/rust-example/<a href=3D"http://rust-hello-=
world_git.bb" rel=3D"noreferrer" target=3D"_blank">rust-hello-world_git.bb<=
/a> | 2 ++<br>
&gt;=C2=A0 3 files changed, 8 insertions(+), 1 deletion(-)<br>
<br>
Could you send a patch to the manual please adding the new variable<br>
CARGO_NO_FROZEN?<br>
<br>
I&#39;m torn on this one as we could have simpler code which did:<br>
<br>
CARGO_FREEZE_OPTION =3D &quot;--frozen&quot;<br>
<br>
and then have the hello-world recipe:<br>
<br>
CARGO_FREEZE_OPTION =3D &quot;--offline&quot;<br>
<br>
but I&#39;m torn on whether that is better or not...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000005b480e0601d8c7e4--

