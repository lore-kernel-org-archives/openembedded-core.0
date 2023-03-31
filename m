Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764F3C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 15:01:39 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.57239.1680274894579096222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 08:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B0kZIGmQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id y20so29308283lfj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680274893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+/r+cizjRxL8dgbY+WODHzRfdU2GYPU5PJsmpvkroxo=;
        b=B0kZIGmQgKzoMj/Lr4ZcNy0XZHVrOr/t8SaJqKXVu276FXoNa7/3tGKMalyo+ta6Si
         +bIaC2FHl4pkwLBlIDFzi9j9TSOriP29VpvN1NjC4p5pGX6rTq7UAucjUzTv80kF8f1F
         iaaFJAklCmKhHnmLjqL6lFhAybpKdFUsMq9Bo0cqnRlFd0r5K64UtQlyFrNjYBCSwKVM
         +mKHgLyPfQBCtd4SFtH3b4g5TghrHNocBFuaSNTYA0QqZdeAikAdlYOeOe3R+8k1NEe4
         NtzV6VadejGynsIIvHzGu0FlpvYikbFg7DfDvrdOPexlQpa22h+hwSi8NMyhB9LYpC1B
         yzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/r+cizjRxL8dgbY+WODHzRfdU2GYPU5PJsmpvkroxo=;
        b=xgucahig0RVBkPOF15WLLgRV212f/B0Ot+gzfhVXYSf04HJkSvtQAoxaRqKMzNHreq
         cwlnjDWMZ+tdViPL2XwIk8U42QlWbbPOL/cX+LEsWLi+L2vXRHq+JZF3DyF/BH9k5QHu
         +cTqPK5Xw7tsZutQo9n6ne+LZbaxKUz+vF1uzJaRoVkCMa8lNSlTAsoRyZZpRH2Khs0W
         YJxu6lfNzNfpamTFg7M9ja4p3qURyOHcff1WukCZGjP7x6PDQrQZJzsorA5BsMT+wK9a
         iSNTVsdpHlAXBfBntObN20J2blsKb/6NTn6rh9acfIKJdl45CqVcqVoJVpNytvAgUEbU
         dCFA==
X-Gm-Message-State: AAQBX9de1laIK3LHy9lWxSgTVtAfPQ46E0BbjR3QEPw4cpsWiMi2kTGw
	cooQCifYrvvT0XnIQboRvXG5AKdqq+3GfOAr/KQ=
X-Google-Smtp-Source: AKy350Yt3nJhcYqyBrmQYoUGRRPR7VfYGUDTgajxPDKEUZ7IMdi/ZJzDT07CO/BRVdzpGMSHRd6Mz4+yuV9n621ziWc=
X-Received: by 2002:ac2:519c:0:b0:4e0:822f:9500 with SMTP id
 u28-20020ac2519c000000b004e0822f9500mr8329999lfi.12.1680274892453; Fri, 31
 Mar 2023 08:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
 <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org> <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com>
In-Reply-To: <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 31 Mar 2023 17:01:21 +0200
Message-ID: <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for zvariant
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000016f99b05f8337cf6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 15:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179449

--00000000000016f99b05f8337cf6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok I'll take a look at this next week. But I don't know anything about
reproductability build so if you have any info that can point me to the
right direction, I'll be glad to read it.

Le ven. 31 mars 2023, 15:50, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> On Fri, 31 Mar 2023 at 15:26, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > > We do have other reproducibility issues in rust and had to exclude
> some
> > > > packages from the test because of this. We do want to resolve those
> > > > issues though.
> > >
> > > But aren't recipes in meta-selftest exempted from reproducibility
> requirement?
> >
> > I suspect we can put an EXCLUDE_FROM_WORLD =3D "1" in there and then th=
is
> > will "go away" but shouldn't our output be reproducible and isn't this
> > therefore actually a good test?
>
> That's true. There's also rust itself which continues to be the only
> item in core that's in the reproducibility exception list.
>
> Alex
>

--00000000000016f99b05f8337cf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok I&#39;ll take a look at this next week. But I don&#39;=
t know anything about reproductability build so if you have any info that c=
an point me to the right direction, I&#39;ll be glad to read it.=C2=A0</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le ve=
n. 31 mars 2023, 15:50, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Fri, 31 Mar 2023 at 15:26, Richard Purdie<b=
r>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
 rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; We do have other reproducibility issues in rust and had to e=
xclude some<br>
&gt; &gt; &gt; packages from the test because of this. We do want to resolv=
e those<br>
&gt; &gt; &gt; issues though.<br>
&gt; &gt;<br>
&gt; &gt; But aren&#39;t recipes in meta-selftest exempted from reproducibi=
lity requirement?<br>
&gt;<br>
&gt; I suspect we can put an EXCLUDE_FROM_WORLD =3D &quot;1&quot; in there =
and then this<br>
&gt; will &quot;go away&quot; but shouldn&#39;t our output be reproducible =
and isn&#39;t this<br>
&gt; therefore actually a good test?<br>
<br>
That&#39;s true. There&#39;s also rust itself which continues to be the onl=
y<br>
item in core that&#39;s in the reproducibility exception list.<br>
<br>
Alex<br>
</blockquote></div>

--00000000000016f99b05f8337cf6--

