Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D79AE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 13:57:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.56900.1734357425441471660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 05:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQSVjuoj;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2efa856e4a4so2922392a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734357425; x=1734962225; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KxkZP1vnsAo+QrXIoLf3vMYV7LkkuPidxxwZcQgfPJ0=;
        b=IQSVjuojdz6BkOCfpzkFc9+Eu1TQxwd0E633nP3DXy+0xZ4G3pAaYn211PGc9Xy0kA
         smKNF7HVE6qypYh6T4G9woWOg3AxBnJ/dst1qg/Q4Zmy76QqbLES7F3PHtGhXdvUyred
         x8mp+gNYZkFYLh0HF2HcNh7L97put0Vkox+Uofg7RLOll5ph83aHTECU78HadOSUw/zE
         ggs74uiCv9wcSZiDxfb0SgcZQ3tYj2+JJuL+K5NzIofqxS34+pbjoemPynKSUuuLZa7z
         R/WcRC/QPOl4aMZUb4lxIX+SbViOxm/eaMLbw4LnwZKlVOjIU/guSAIeA3gtg+8l9cdK
         Ohxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734357425; x=1734962225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxkZP1vnsAo+QrXIoLf3vMYV7LkkuPidxxwZcQgfPJ0=;
        b=i+kqH1h23Pi+0yH2yedRVkn3tK/3HLPGeuRotMYiCxi66E4kVg9HoZ7tksL1A4EjKB
         d70GHeK/yQ58qDYsq0UOg/0uglN5IUIfqE8jUgWoFOVqUReP6eQaVoU8qvQ0aGvz5odD
         3Ql9QG3QVYrC/5TR0CSkt1XZYMPwXfIWIjQXoVnWkr6FXz4UIiqGzm9UUuARkiRVuL5u
         Sd90VcvNyiwf+YB3ui38FHL8Lo+2G+2SXyhtUtsAjkQ/FF0DAqhLqsimq8aKHD18wboD
         fTLSGh0OpxPXxczGAMyb8O2hOwu8WSsnGERNa7Ad2c9gxdmZE4wTYUGHnZgtYUfwRgwR
         amVw==
X-Gm-Message-State: AOJu0YwnSFE0p+J/OKP28cJepDOw6GCZiDYBRepporpqrp95b1t8lSL5
	vK8mcRkiIse43zB1YdoSeJpljK4d/sW1u3l7Wp1L1DJc8hp075/Fr6NNkxV1lWeoOyBkg3k9ozT
	3An1CNXl7kQ5fnA1obXxwNNKbM6htWVUU
X-Gm-Gg: ASbGncseecMMUhlCr8JVQ8b0+ewHwfrshQEyVF8WS1W9CqZjDeGlmZOi+KcISHUr+2x
	erofEYG3semHolZXhUdzGMwY8aW12TH0GIMTw2ts=
X-Google-Smtp-Source: AGHT+IF1gvxtlZFboduC9odx24z++fCvCeaT4o/AY9C35RRN+NSOPbgQv34aFfz9wSm30GNaOyjfqkKUXNbR+mLIJac=
X-Received: by 2002:a17:90b:3a83:b0:2ee:c1d2:bc67 with SMTP id
 98e67ed59e1d1-2f28fb72308mr19933033a91.16.1734357424696; Mon, 16 Dec 2024
 05:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20241216-kmeta-audit-vartrue-v1-1-51bbb0b2085a@bootlin.com>
 <CADkTA4N6oZ6JbzK6bYE6bgC3FwY5tu2a+WKhEipzhpArNhyvLA@mail.gmail.com>
 <CADkTA4MQecma7amP9At6=DiJrCMisx43cfwFUB2kA2=wUt96Kg@mail.gmail.com> <D6D69DHP53LV.2LJHX0T8FW1LY@bootlin.com>
In-Reply-To: <D6D69DHP53LV.2LJHX0T8FW1LY@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Dec 2024 08:56:53 -0500
Message-ID: <CADkTA4NLbCiZcqJsPqR8TC_J=hUqkSTbynT6_P9THizw5-vZew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: use oe.types.boolean on KMETA_AUDIT
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000003673c90629638e21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 13:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208765

--0000000000003673c90629638e21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:50=E2=80=AFAM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Hi Bruce,
>
> On Mon Dec 16, 2024 at 2:29 PM CET, Bruce Ashfield via
> lists.openembedded.org wrote:
> > On Mon, Dec 16, 2024 at 8:21=E2=80=AFAM Bruce Ashfield <bruce.ashfield@=
gmail.com
> >
> > wrote:
> >
> >>
> >>
> >> On Mon, Dec 16, 2024 at 6:35=E2=80=AFAM Antonin Godard <
> antonin.godard@bootlin.com>
> >> wrote:
> >>
> >>> Following commit a39a1f7cf78ad1ca07438bce634a47e970f25047
> >>> ("kernel-yocto: allow early exit to configuration audit"), we can
> >>> disable auditing of the kernel configuration by setting KMETA_AUDIT
> >>> empty.
> >>>
> >>> Since the default value of this variables is "yes", use
> >>> oe.types.boolean() so that it will also be disabled when setting it t=
o
> >>> "no", and avoid potential confusion.
> >>>
> >>
> >> That isn't the intent of the variable. It is being used as a flag here=
,
> >> but it can also be used to encode other information.
> >>
> >> Quite literally, if it is set to anything, the audit should happen. On=
ly
> >> when it is unset should it not.
> >>
> >
> > I hit send too soon. It's Monday.
> >
> > What I wanted to add was this question: Is that still the behaviour wit=
h
> > the boolean call ? If so, no concerns from me.
>
> It seems that this is the only place where the KMETA_AUDIT variable is
> used so I
> figured its role was to enable/disable the audit and only that. Maybe the
> "audit_flag" name is a bit misleading then?
>

Maybe, but I'd rather not change the name if nothing is broken.

I normally just put a comment above the variable to indicate
that sort of behaviour (i.e. # if this variable is set to anything non-zero
an audit will be performed), but I for some reason didn't do that
here!

There are some audit modes for in-tree configs that I'm working
on that will use that variable to change modes (different from the
allnoconfig/alldefconfig flags that are already used).

Bruce



>
> The behavior of the boolean call is to return False if KMETA_AUDIT =3D=3D
> "no", so
> it _is_ different from "if set to anything, the audit happens".
>
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003673c90629638e21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 8:50=
=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com=
">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Bruce,<br>
<br>
On Mon Dec 16, 2024 at 2:29 PM CET, Bruce Ashfield via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a> wrote:<br>
&gt; On Mon, Dec 16, 2024 at 8:21=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Dec 16, 2024 at 6:35=E2=80=AFAM Antonin Godard &lt;<a href=
=3D"mailto:antonin.godard@bootlin.com" target=3D"_blank">antonin.godard@boo=
tlin.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Following commit a39a1f7cf78ad1ca07438bce634a47e970f25047<br>
&gt;&gt;&gt; (&quot;kernel-yocto: allow early exit to configuration audit&q=
uot;), we can<br>
&gt;&gt;&gt; disable auditing of the kernel configuration by setting KMETA_=
AUDIT<br>
&gt;&gt;&gt; empty.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Since the default value of this variables is &quot;yes&quot;, =
use<br>
&gt;&gt;&gt; oe.types.boolean() so that it will also be disabled when setti=
ng it to<br>
&gt;&gt;&gt; &quot;no&quot;, and avoid potential confusion.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; That isn&#39;t the intent of the variable. It is being used as a f=
lag here,<br>
&gt;&gt; but it can also be used to encode other information.<br>
&gt;&gt;<br>
&gt;&gt; Quite literally, if it is set to anything, the audit should happen=
. Only<br>
&gt;&gt; when it is unset should it not.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I hit send too soon. It&#39;s Monday.<br>
&gt;<br>
&gt; What I wanted to add was this question: Is that still the behaviour wi=
th<br>
&gt; the boolean call ? If so, no concerns from me.<br>
<br>
It seems that this is the only place where the KMETA_AUDIT variable is used=
 so I<br>
figured its role was to enable/disable the audit and only that. Maybe the<b=
r>
&quot;audit_flag&quot; name is a bit misleading then?<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Maybe=
, but I&#39;d rather not change the name if nothing is broken.<br></div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">I normally just put a comment abo=
ve the variable to indicate=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small">that sort of behaviour (i.e. # if this variable is set=
 to anything non-zero</div><div class=3D"gmail_default" style=3D"font-size:=
small">an audit will be performed), but I for some reason didn&#39;t do tha=
t</div><div class=3D"gmail_default" style=3D"font-size:small">here!</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">There are some audit modes for=
 in-tree configs that I&#39;m working</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">on that will use that variable to change modes (diff=
erent from the</div><div class=3D"gmail_default" style=3D"font-size:small">=
allnoconfig/alldefconfig flags that are already used).</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
The behavior of the boolean call is to return False if KMETA_AUDIT =3D=3D &=
quot;no&quot;, so<br>
it _is_ different from &quot;if set to anything, the audit happens&quot;.<b=
r>
<br>
<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000003673c90629638e21--

