Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88C6C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:29:37 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.1631.1698766169827248625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VmE8PwG+;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: kergoth@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4460402276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698766169; x=1699370969; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AEjz08e7XD5nkltCUhKi+naHU0a7fwoBiKa3rbla6WI=;
        b=VmE8PwG+YqRlFB3soLjKUnL2+5foUwz9V3k/EiPfSXpveAjHHkkBcTJAULrMHJ5jUK
         zd6E3XLzKN+bYmhp9eJBi2N0NoP5sBqU3ZWDD8hFRxWN3pBXoKgfKrMIdJiG3n5SDvph
         6/1gwYxBtAnCRVCy7bhCcOQCnBtkJINWRq9KZlJM/Cy+Tcgm/OZURLbOqJtO4vWWx+Vv
         VcuXKIE9ukqAffNEsn9CgGNpuMFUC36RxdJshK9C0hdYWJbQMegYNm8C/FNh4r7GX0AV
         PGl2z+YrDUHrMr9gnfZdB+xBrv1vG3yd6JSqmRcSPAMVXYsay0i+lvFVjhBqyu9TcItE
         3MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698766169; x=1699370969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEjz08e7XD5nkltCUhKi+naHU0a7fwoBiKa3rbla6WI=;
        b=OwBTTnz+NjW2U5JuMQPLBN5/e05moYS3k4UrabiEOVqE+uHSWY/XPvNzdDgp5vFqI2
         ZWk8S84D0G/+uNiUYMKruTt36RZfx2Ib0dgN1PDQhXD4GKtxbI04Rg/Hi9xEMUQCQ8ah
         7gVF5rb+IvJnJL3rSq3/5GnKnqPtnBNXFTqly8XmjKMPE8N/ss4btWmyF/iHox/FE+5i
         SXynU2CB1h/KaAnPGN5SnZff31qcZWREQnwq19xHZ/k7VfiBMVYl1g0x795i6fw4lE1h
         EKNWWmGoiMRx6HoJTKmI6KPLzSOsMWw4sLYP+w0StxvMeomepMmJ+N/vcb5lPvLpS1yE
         GxUA==
X-Gm-Message-State: AOJu0YzRqzKRQ95Y+L/NVWI0pQbEJpEx1x1lLK6eB5CL3Er1/OsQDi9e
	Pfrp4zs9bqEXZ/7VQGcU/McxdiXKYGkj829MlXw=
X-Google-Smtp-Source: AGHT+IFPhXBVT6W0pRJ5po41/nYYOkqeRk/evc2qXNPB2J4KKBcJd8Y3yafYFyJGdZQ0PJCyzal75JKOYwClptrEU1Y=
X-Received: by 2002:a25:d30e:0:b0:da0:95c0:d157 with SMTP id
 e14-20020a25d30e000000b00da095c0d157mr9194890ybf.51.1698766168855; Tue, 31
 Oct 2023 08:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231031042735.3842176-1-javier.tia@linaro.org> <ba031885caf9dfeee099cbf4748a06f769c9de95.camel@linuxfoundation.org>
In-Reply-To: <ba031885caf9dfeee099cbf4748a06f769c9de95.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 31 Oct 2023 08:29:17 -0700
Message-ID: <CABcZAN=3MBC_g3PxoowOmPobFmoKTw=YVMSURJREKADGV3Az9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: split strip cmd when ccache is used
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Javier Tia <javier.tia@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000d2070060904d27a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189851

--0000000000000d2070060904d27a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd suggest using shlex.split() all the time when dealing with pieces of a
shell command-line, rather than assuming single-word or using str.split().

On Tue, Oct 31, 2023 at 5:26=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2023-10-30 at 22:27 -0600, Javier Tia wrote:
> > Using ccache stopped to work after 77497dbdca with following error:
> >
> >   FileNotFoundError: [Errno 2] No such file or directory: 'ccache
> aarch64-trs-linux-strip'
> >
> > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> > ---
> >  meta/lib/oe/package.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> > index 1dd20f85eb..2685da0af9 100644
> > --- a/meta/lib/oe/package.py
> > +++ b/meta/lib/oe/package.py
> > @@ -39,7 +39,7 @@ def runstrip(arg):
> >          newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
> >          os.chmod(file, newmode)
> >
> > -    stripcmd =3D [strip]
> > +    stripcmd =3D strip.split() if "ccache" in strip else [strip]
> >      skip_strip =3D False
> >      # kernel module
> >      if elftype & 16:
>
> That looks very like a hack/workaround rather than a real fix. The
> packaging code shouldn't know/care about ccache.
>
> Should we always be splitting strip?
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189838):
> https://lists.openembedded.org/g/openembedded-core/message/189838
> Mute This Topic: https://lists.openembedded.org/mt/102291706/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--0000000000000d2070060904d27a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d suggest using shlex.split() all the time when deal=
ing with pieces of a shell command-line, rather than assuming single-word o=
r using str.split().</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Oct 31, 2023 at 5:26=E2=80=AFAM Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Mon, 2023-10-30 at 22:27 -0600, Javier Tia wrote:<br>
&gt; Using ccache stopped to work after 77497dbdca with following error:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0FileNotFoundError: [Errno 2] No such file or directory: &#=
39;ccache aarch64-trs-linux-strip&#39;<br>
&gt; <br>
&gt; Signed-off-by: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org"=
 target=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oe/package.py | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
&gt; index 1dd20f85eb..2685da0af9 100644<br>
&gt; --- a/meta/lib/oe/package.py<br>
&gt; +++ b/meta/lib/oe/package.py<br>
&gt; @@ -39,7 +39,7 @@ def runstrip(arg):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newmode =3D origmode | stat.S_IWRITE=
 | stat.S_IREAD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(file, newmode)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 stripcmd =3D [strip]<br>
&gt; +=C2=A0 =C2=A0 stripcmd =3D strip.split() if &quot;ccache&quot; in str=
ip else [strip]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 skip_strip =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # kernel module<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if elftype &amp; 16:<br>
<br>
That looks very like a hack/workaround rather than a real fix. The<br>
packaging code shouldn&#39;t know/care about ccache.<br>
<br>
Should we always be splitting strip?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189838): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189838" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189838</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102291706/361=
7123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102291706/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#333333">Christopher Larson<=
br><a>chris_larson@mentor.com</a>,=C2=A0<a>chris.larson@siemens.com</a>,=C2=
=A0<a>kergoth@gmail.com</a><br>Principal Software Engineer,=C2=A0Embedded L=
inux Solutions,=C2=A0Siemens Digital Industries Software</font><br></div></=
div></div>

--0000000000000d2070060904d27a--

