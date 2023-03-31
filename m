Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27CAC761AF
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 16:11:19 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.59367.1680279074993460802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 09:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VjKHbcAZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id h25so29573296lfv.6
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680279073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MACVE4DNFwHsfoWNVrixMvmNLxbSNN5aBcTkpq7UGp8=;
        b=VjKHbcAZxSGULVI83sCkF+6ZzjYW5ALGewp+8sqMm/SwpLiH8h6imf8Sa4MDV1xIZG
         GTuuqbKWkek1Wk5WWFHbpI0kL0Z0IF0yD/gT2Y/0gaUDrVF2Z//MoVCgB553gXjdGPqn
         ppheG69VTKrg/1v2hhtOTPjhtttfja7vt7BCScGiBNyp/9eYdRj8ODagEYwJWAGda/CX
         5bmA/gNjh02Lk8RRxwhCI4ECazCYoKR/W0vrZ7MZvNLSWgUkz8JFr92a/xR+oZVtEkz8
         U1JJPqUB8o/A2+uM3NpKKb6ZYr0zJodSTpfbFUsHR1qR7xsxPxkPHNXVzT6UZaBnEVR8
         p+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680279073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MACVE4DNFwHsfoWNVrixMvmNLxbSNN5aBcTkpq7UGp8=;
        b=IbP72rQxPFKPT9C/PLVahS9Yt4bbi1Ik9gQyr8u42OfLcaVk9J0rFMeqT8avsADBu+
         1nHwjlUyvhbo02QvrQ1hvaylSkeT74eNPL0CN4eOwfo3pfXexaN926d4zUfC6z0q6Gie
         PlcFpXdGOXKdZN9BmfgwS0gZ9Xg0ZCX+fsY9m4TLfz9mV2x/X9yWOBX16xe3eNBIWTD2
         dBK7M4ofqdPv5nUW+FLyI1b0D7BJgxbcxw0j8k1s6y7qI/8Bv2TO3jZtPMDXgB+RpUwh
         7EMTfnJIJkRcgjVk83y7+n2ayAbDlEGel6X0+9MYkqgeJteoXMb51O17+WZ6aB6NgxOJ
         xyoQ==
X-Gm-Message-State: AAQBX9dO5wWuevYii8er/JC2xHJNahOqzi7euf1PcBPY1PQrLteACBhb
	ozE2nt11dWYzpkIh/yo5ZOli+4V0kGbr5qMwRPE=
X-Google-Smtp-Source: AKy350bb3J9M+027FaFfkPXXcHzMl8If5RP5GXgPYKzzvt+FVuh8uoxUKaqmT09ld5+D4bbQbov7EmSAQxz0IPL6lMU=
X-Received: by 2002:a05:6512:ea7:b0:4e8:3ee1:db14 with SMTP id
 bi39-20020a0565120ea700b004e83ee1db14mr4630480lfb.6.1680279073033; Fri, 31
 Mar 2023 09:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
 <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
 <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com>
 <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com> <CANNYZj9jH0XvVT0nDropkBV8_R2KSJ69_YL8En7TwaUQvgG+uA@mail.gmail.com>
In-Reply-To: <CANNYZj9jH0XvVT0nDropkBV8_R2KSJ69_YL8En7TwaUQvgG+uA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 31 Mar 2023 18:11:01 +0200
Message-ID: <CA+cAkeqPO09e1eUR43P4iFTa5==yHOy_epxbj=uGgrbo2r2Fcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for zvariant
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000458fd105f83475b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 16:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179452

--000000000000458fd105f83475b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok thanks.

Le ven. 31 mars 2023, 17:55, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> You need to set up two identical builds in different build directories
> and verify that what gets installed and packaged is identical (in this
> case it's not). The most common problem is build paths leaking into
> the binaries or other installed artifacts, and it can be tricky to
> narrow it down to a specific point where it happens in a build.
>
> The broader rationale for doing this is here
> https://reproducible-builds.org/
>
> Alex
>
> On Fri, 31 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Ok I'll take a look at this next week. But I don't know anything about
> reproductability build so if you have any info that can point me to the
> right direction, I'll be glad to read it.
> >
> > Le ven. 31 mars 2023, 15:50, Alexander Kanavin <alex.kanavin@gmail.com>
> a =C3=A9crit :
> >>
> >> On Fri, 31 Mar 2023 at 15:26, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> > > > We do have other reproducibility issues in rust and had to
> exclude some
> >> > > > packages from the test because of this. We do want to resolve
> those
> >> > > > issues though.
> >> > >
> >> > > But aren't recipes in meta-selftest exempted from reproducibility
> requirement?
> >> >
> >> > I suspect we can put an EXCLUDE_FROM_WORLD =3D "1" in there and then
> this
> >> > will "go away" but shouldn't our output be reproducible and isn't th=
is
> >> > therefore actually a good test?
> >>
> >> That's true. There's also rust itself which continues to be the only
> >> item in core that's in the reproducibility exception list.
> >>
> >> Alex
>

--000000000000458fd105f83475b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok thanks.=C2=A0</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Le ven. 31 mars 2023, 17:55, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">You nee=
d to set up two identical builds in different build directories<br>
and verify that what gets installed and packaged is identical (in this<br>
case it&#39;s not). The most common problem is build paths leaking into<br>
the binaries or other installed artifacts, and it can be tricky to<br>
narrow it down to a specific point where it happens in a build.<br>
<br>
The broader rationale for doing this is here <a href=3D"https://reproducibl=
e-builds.org/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://repr=
oducible-builds.org/</a><br>
<br>
Alex<br>
<br>
On Fri, 31 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Ok I&#39;ll take a look at this next week. But I don&#39;t know anythi=
ng about reproductability build so if you have any info that can point me t=
o the right direction, I&#39;ll be glad to read it.<br>
&gt;<br>
&gt; Le ven. 31 mars 2023, 15:50, Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gm=
ail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 31 Mar 2023 at 15:26, Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br>
&gt;&gt; &gt; &gt; &gt; We do have other reproducibility issues in rust and=
 had to exclude some<br>
&gt;&gt; &gt; &gt; &gt; packages from the test because of this. We do want =
to resolve those<br>
&gt;&gt; &gt; &gt; &gt; issues though.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; But aren&#39;t recipes in meta-selftest exempted from re=
producibility requirement?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I suspect we can put an EXCLUDE_FROM_WORLD =3D &quot;1&quot; =
in there and then this<br>
&gt;&gt; &gt; will &quot;go away&quot; but shouldn&#39;t our output be repr=
oducible and isn&#39;t this<br>
&gt;&gt; &gt; therefore actually a good test?<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s true. There&#39;s also rust itself which continues to b=
e the only<br>
&gt;&gt; item in core that&#39;s in the reproducibility exception list.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
</blockquote></div>

--000000000000458fd105f83475b3--

