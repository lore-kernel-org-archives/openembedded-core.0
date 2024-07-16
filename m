Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB23C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:29:49 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.6753.1721122184820868273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i3Q+UrvW;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-48fdf2d5309so2050642137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721122184; x=1721726984; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZBTe3uthb1BDFoyXn+52THTnvzNQMpJdXPwcD7W9/w=;
        b=i3Q+UrvWcaS9r/nqFOcXpEaNpy4nEfh+fgK01dFJZlKxOrquzPulNzKcKzpo/KOvrO
         JYRnqeAAGAGeVGZKp66nrQsd+QmaL6F+AiopIyR+Hcr1rb7XP7wXJg1ksAtIYhHKR16V
         B0Q+39P3EBQZWL1AQT4knkc2K9f/kpvY9ns992KM3z3hRbceU2VU24Sk5RVY4Aq9kx1t
         cT8SkP4rQHj2kfTiBQPTjjRI4Yx9n1k27lLpKnywkY6/L5vS1jch8zuLFFV3TaMJiapO
         esnQGbo405cRdDESpkaeOpHhmSFAvJs51lDdNcEg8CxU2kNjT2hQKnCeE69RnDNyb12+
         7OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122184; x=1721726984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZBTe3uthb1BDFoyXn+52THTnvzNQMpJdXPwcD7W9/w=;
        b=gge1HtyFbVfoWpLt4l7TdtTjTb3Ruz8wcVyT1fh79yBVHQIqe60t1uWNFSIfKL3E3H
         Mke1RcAx+e6ymi3XMkqp/D1gBPSEv7H+ausJt0iAFtjIfbj9xtsGy6K0aNQT+pdB2+bo
         GjxhDbwbWLl2ad/KYkdP6QUf1cBQaUDyfxhhqk2UcUfC2gS1winPo/IUF7+YW37vRaFd
         X2HkXyzGFHPZc8c3w1bx9EYK7vFUOFcDqUwhzBPNut7b4xYoR8DaSPq5rViAlRZMXTJb
         sdTNoCFYcGE6JXzbCFriHndJCmWbLYAwkqymUB1sjRxzI+3R7yHdVCHAAOdm7+sE/ZDo
         q6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQL/rluzjQ6itn7LtJ/KivQY0ruA2z8an7HUkYQ4HpHfCTdRjXXMHHRVWGvZoobiDsxYCL0HSgIU9MsAljE5tjaprkF7jYjMq7B8XR3s0A8xzJmIhv49h4
X-Gm-Message-State: AOJu0Yy0alZEe7KFYGY8HrVI2m32ut0m91lVfVFz9Qfk4xHz37wQWLOC
	Ar+a5eNBKaf4oBqKkJeBX1sK3JXdOeMtZHR13kntS8uKNkl1VmPm0DHJdMBxuR4Rd+AVHOy/q1/
	JvihjTy1jD1SAYRUkfZpkRVyInZQ=
X-Google-Smtp-Source: AGHT+IEyoAryncX5B9GVYf9iwdwh95ggeGfl3qgK69QKhvBlLjQPmhO2tuSYeTRhlG/Va2auFM7qM8sJ4uWjBJ/GfAY=
X-Received: by 2002:a05:6102:b08:b0:491:e5b:72d5 with SMTP id
 ada2fe7eead31-4914c4b596cmr1717095137.10.1721122183776; Tue, 16 Jul 2024
 02:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240715180205.2493035-2-jose.quaresma@foundries.io>
 <CANNYZj_UaF5VkQB2DaxB_2nDeO4aEckvd92PZpGQo1AdJj+=-Q@mail.gmail.com> <e8520d5c4575c030098a7171cc5b0afb0d161954.camel@linuxfoundation.org>
In-Reply-To: <e8520d5c4575c030098a7171cc5b0afb0d161954.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 16 Jul 2024 10:29:32 +0100
Message-ID: <CANPvuRn5+fXpQW3Fg7-U55zo-+VBNeTHbLCc9r6WHTGnpVB3eg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] openssh: upgrade 9.7p1 -> 9.8p1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000611259061d59fc78"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202088

--000000000000611259061d59fc78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (ter=C3=A7a,
16/07/2024 =C3=A0(s) 09:53):

> On Tue, 2024-07-16 at 09:48 +0200, Alexander Kanavin via
> lists.openembedded.org wrote:
> > On Mon, 15 Jul 2024 at 20:02, Jose Quaresma via
> > lists.openembedded.org
> > <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> > > +From: Jose Quaresma <jose.quaresma@foundries.io>
> > > +Date: Mon, 15 Jul 2024 18:43:08 +0100
> > > +Subject: [PATCH] regress/test-exec: use the absolute path in the
> > > SSH env
> > > +
> > > +The SSHAGENT_BIN was changed in [1] to SSH_BIN but
> > > +the last one don't use the absolute path and consequently
> > > +the function increase_datafile_size can loops forever.
> > > +
> > > +[1]
> > >
> https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef73=
7a8284cc2dfabad818
> > > +
> > > +Upstream-Status: Pending
> >
> > No Pending patches without a (good) reason please. Submit upstream
> > before you submit here.
>
> We need to be a little bit careful with this. I don't want to put
> people off submitting upgrades to key components like this and the work
> Jose has done to get this far is really helpful and appreciated.
>

I completely understand Alex's position and even agree with it.
I didn't do it right away because yesterday I finished late, I will send a
new v4.


>
> I agree we need to cut down on the number of pending patches, so asking
> people if they're able to submit is fair enough. Requiring it may be
> something we can't afford to do though.
>

But I also understand your position and I think this may demotivate some
users/devs.
It is important to note that when a patch enters the layer it will stay
here forever
if no one tries to submit it upstream.


>
> I am very worried about the height of the bar for submissions and I'm
> struggling to make changes, let alone others :/.
>

To be realistic, I don't see any major barriers to contributing and perhaps
the biggest ones
aren't even technical and are more corporate.

Jose


>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000611259061d59fc78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (ter=C3=A7a, 16/07/2024 =C3=A0(s) 09:53):<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, 2024-07-16 at 09:48 +0200, A=
lexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Mon, 15 Jul 2024 at 20:02, Jose Quaresma via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; +From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundrie=
s.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt; +Date: Mon, 15 Jul 2024 18:43:08 +0100<br>
&gt; &gt; +Subject: [PATCH] regress/test-exec: use the absolute path in the=
<br>
&gt; &gt; SSH env<br>
&gt; &gt; +<br>
&gt; &gt; +The SSHAGENT_BIN was changed in [1] to SSH_BIN but<br>
&gt; &gt; +the last one don&#39;t use the absolute path and consequently<br=
>
&gt; &gt; +the function increase_datafile_size can loops forever.<br>
&gt; &gt; +<br>
&gt; &gt; +[1]<br>
&gt; &gt; <a href=3D"https://github.com/openssh/openssh-portable/commit/a68=
f80f2511f0e0c5cef737a8284cc2dfabad818" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef737=
a8284cc2dfabad818</a><br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; <br>
&gt; No Pending patches without a (good) reason please. Submit upstream<br>
&gt; before you submit here.<br>
<br>
We need to be a little bit careful with this. I don&#39;t want to put<br>
people off submitting upgrades to key components like this and the work<br>
Jose has done to get this far is really helpful and appreciated.<br></block=
quote><div><br></div><div>I completely understand Alex&#39;s position and e=
ven agree with it.<br></div><div>I didn&#39;t do it right away because yest=
erday I finished late, I will send a new v4.<br>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
I agree we need to cut down on the number of pending patches, so asking<br>
people if they&#39;re able to submit is fair enough. Requiring it may be<br=
>
something we can&#39;t afford to do though.<br></blockquote><div><br></div>=
<div>But I also understand your position and I think this may demotivate so=
me users/devs.</div><div>It is important to note that when a patch enters t=
he layer it will stay here forever</div><div>if no one tries to submit it u=
pstream.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
I am very worried about the height of the bar for submissions and I&#39;m<b=
r>
struggling to make changes, let alone others :/.<br></blockquote><div><br>T=
o be realistic, I don&#39;t see any major barriers to contributing and perh=
aps the biggest ones</div><div>aren&#39;t even technical and are more corpo=
rate.<br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000611259061d59fc78--

