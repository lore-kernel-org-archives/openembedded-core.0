Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC30E6916F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 15:48:07 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.26588.1732288737852964553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 07:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ArAVzNTF;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: karem.ibrahim46@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ebc1af8f10so1102445eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 07:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732288737; x=1732893537; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nhAPOjL/ZJZsLzBcqVwyWQwzPlDGYHEjXm8X/TcqB/U=;
        b=ArAVzNTF9xkUAdLvK6gk5/4jSak45va1tyuqMsXa85vNu+umx1GUaDJBjK/thcIV3I
         qVESTLWlG9I39ssMBhpGokG0YsznnHrVuuDsk9NnG6BmXK+4JX02/hh/2vRZNIrLPD9v
         g7B0AgYPnRzCVRbThvU9ypgYRDF/7qXl+6xQ6bIfQ/dbX4g6K+huEJadWHB4RwTJ5f/u
         aQLstLQLDioX8nYTmZQNk3YcWreHFoImMvMSKvUkw4kt90U8JgKo+cCxUAiMcrtoDNM6
         QhquRzO+Fwj3HsNgmjz4nPAvmq1kRJsQbtYRwUbMnCRHfbb6WkLQhLGadK0gG3BpCKVP
         SkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732288737; x=1732893537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhAPOjL/ZJZsLzBcqVwyWQwzPlDGYHEjXm8X/TcqB/U=;
        b=aJAYhoojTiCRayy8UJnkkV7LqBJrm5XgJ08UUvTE5VxfuLp+nEzphfeYpRvcu48Sob
         kDPrznvZ/VwBbIOGM0X5VsxdKdMkYgvM5fsQxgqUYzsC5w6HiBn+FsoeRiTvuEbwKCFC
         Bxzna1iRCAwpcAj7DB9ySiHf+Ezr3UNiZ8j4gGrk97uMW0FJS2oHotrvqQInNQ5+TvoD
         pneTgj7jUhw/VX1h79rqYLlXsPBH31TAisOAW5rGmIc28dSYBOPSCJuukxmvdGocblNp
         Y7RUWBYU+k40af5ZaDtymLPTZypc8OU5l9UB1iexeXK7kfe7RB9Bejd9vHSzYmlajhqh
         GKyQ==
X-Gm-Message-State: AOJu0Yxi3S2dBezGB9zfH/+P1FNsrqlNe6aObnxbykS900CTyA8ftQOs
	ME6y655fMmw2oi68RCtP8Q+Ljd+O4ywi0suv0nUJfPgroYrtwcIy3F8JrJxlTqoCSQjGA6NATmK
	RaqoeDrCqj/hyLbGEVyyjeaVU+B4=
X-Gm-Gg: ASbGncscHvW8ngrstpGccQGBZc15/kDCLQACnt+OeEt41+Wq53GNH7q8RYlN7LGR4NQ
	K3vGO4dqPQJk84kfKM5RsocGChyq7WRxZoQ==
X-Google-Smtp-Source: AGHT+IFgSBbMPWdhSP0Bx5vZzR/4bNgFC/W5wzon7W+NvG6AyU/4lUsX6ssOq90A6bbNfIaxgJtdxDXg3YR1VV5wEb8=
X-Received: by 2002:a05:6358:d04c:b0:1b5:fd3f:149e with SMTP id
 e5c5f4694b2df-1ca796c85d0mr285571555d.5.1732288737035; Fri, 22 Nov 2024
 07:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20241122133140.1627-1-karem.ibrahim46@gmail.com>
 <20241122133140.1627-2-karem.ibrahim46@gmail.com> <CA+chaQe5wbdQjO=KWzCEOadxexo6ke_RRaoesk1GET-Jy5V4GA@mail.gmail.com>
In-Reply-To: <CA+chaQe5wbdQjO=KWzCEOadxexo6ke_RRaoesk1GET-Jy5V4GA@mail.gmail.com>
From: "Kareem Ibrahim" <karem.ibrahim46@gmail.com>
Date: Fri, 22 Nov 2024 17:18:45 +0200
Message-ID: <CANsOX5xj8+-F9CxChnOZWjWO7+to5dv_jPTyxqAJNpETQL=kUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] Added a new cargo-online bbclass for recipes requiring remote crates
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d1d4b1062781e6c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 15:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207624

--000000000000d1d4b1062781e6c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay, nobody forced you to reply. Your review was terrible. If it is not ok
you could simply say that for a reason, but there were thousands of better
way to say that.

On Fri, 22 Nov 2024, 15:40 Martin Jansa, <martin.jansa@gmail.com> wrote:

> This isn't a fix, it's just very bad work around, see:
>
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/c=
argo-update-recipe-crates.bbclass
> which you can use to avoid needing the network access during do_compile.
>
> On Fri, Nov 22, 2024 at 2:32=E2=80=AFPM Kareem Ibrahim via
> lists.openembedded.org
> <karem.ibrahim46=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > - This change was intended to abstract user from having to set compile
> network flag to get remote crates
> > - as network access was disabled by default in kirkstone version
> > - I faced an do_compile error with bitbaking Qualcomm qcrosvm under
> yocto kirkstone with message "Could not resolve host: github.com"
> > - And after some hours of debugging I noticed that cargo inherited by
> recipe needs remote crates during do_compile of the cargo.bbclass
> > - It was fixed by adding line do_compile[network] =3D "1" to the recipe
> > - So I found it more convenient, since cargo build usually need network
> access, to abstract users from these details of cargo.bbclass do_compile
> >
> > Signed-off-by: Kareem Ibrahim <karem.ibrahim46@gmail.com>
> > ---
> >  meta/classes/cargo-online.bbclass | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >  create mode 100644 meta/classes/cargo-online.bbclass
> >
> > diff --git a/meta/classes/cargo-online.bbclass
> b/meta/classes/cargo-online.bbclass
> > new file mode 100644
> > index 0000000000..175c94e09d
> > --- /dev/null
> > +++ b/meta/classes/cargo-online.bbclass
> > @@ -0,0 +1,7 @@
> > +# This bbclass is added to abstract recipes writers from
> > +# having to set do_compile network flag to 1
> > +# if his cargo package need external remote crates
> > +# as network access was disabled by default since kirkstone version
> > +
> > +inherit cargo
> > +do_compile[network] =3D "1"
> > \ No newline at end of file
> > --
> > 2.25.1
> >
> >
> >=20
> >
>

--000000000000d1d4b1062781e6c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Okay, nobody forced you to reply. Your review was terribl=
e. If it is not ok you could simply say that for a reason, but there were t=
housands of better way to say that.</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, 22 Nov 2024, 15:40 Martin Jansa,=
 &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">This isn&#39;t a fix, it&=
#39;s just very bad work around, see:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/classes=
-recipe/cargo-update-recipe-crates.bbclass" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/openembedded-core/tree/meta/c=
lasses-recipe/cargo-update-recipe-crates.bbclass</a><br>
which you can use to avoid needing the network access during do_compile.<br=
>
<br>
On Fri, Nov 22, 2024 at 2:32=E2=80=AFPM Kareem Ibrahim via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a><br>
&lt;karem.ibrahim46=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt=
; wrote:<br>
&gt;<br>
&gt; - This change was intended to abstract user from having to set compile=
 network flag to get remote crates<br>
&gt; - as network access was disabled by default in kirkstone version<br>
&gt; - I faced an do_compile error with bitbaking Qualcomm qcrosvm under yo=
cto kirkstone with message &quot;Could not resolve host: <a href=3D"http://=
github.com" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com</a>&=
quot;<br>
&gt; - And after some hours of debugging I noticed that cargo inherited by =
recipe needs remote crates during do_compile of the cargo.bbclass<br>
&gt; - It was fixed by adding line do_compile[network] =3D &quot;1&quot; to=
 the recipe<br>
&gt; - So I found it more convenient, since cargo build usually need networ=
k access, to abstract users from these details of cargo.bbclass do_compile<=
br>
&gt;<br>
&gt; Signed-off-by: Kareem Ibrahim &lt;<a href=3D"mailto:karem.ibrahim46@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">karem.ibrahim46@gmail.com</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/cargo-online.bbclass | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/classes/cargo-online.bbclass<br>
&gt;<br>
&gt; diff --git a/meta/classes/cargo-online.bbclass b/meta/classes/cargo-on=
line.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..175c94e09d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes/cargo-online.bbclass<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +# This bbclass is added to abstract recipes writers from<br>
&gt; +# having to set do_compile network flag to 1<br>
&gt; +# if his cargo package need external remote crates<br>
&gt; +# as network access was disabled by default since kirkstone version<b=
r>
&gt; +<br>
&gt; +inherit cargo<br>
&gt; +do_compile[network] =3D &quot;1&quot;<br>
&gt; \ No newline at end of file<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000d1d4b1062781e6c9--

