Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C55C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:58:02 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.15356.1709740681769539385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=STE4kMIt;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e4fd6de193so621435a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709740681; x=1710345481; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oCLrEO1BVRbgU2B0xNBKTXS63QZMV20ckMmtjrMG60A=;
        b=STE4kMIt2oVCDru5DZ1WQOhnWdWdIdB54kys6otflXb04WQG/5Rd5ZJrSPyre4h+6D
         OhOo+Z5FT/tNMomBE0/z6GIaIgsvu4fqRlu9VTZZPhF9WvPstn6kvXsuR1JuOnD8hHo0
         Lg6/uICCivsx7wqSsuP3pISnCJ/XIQQ+qTO3ieavr/63Tzt1Wbi7+2aQr6iecIjDgVQI
         Iu4LGU/6/7NMEHYpjs37sgZwuRkuo6J0fZXwN/vyVsRrfH9IVWtzZ/tKgZTs+HFEdNBg
         gVjrriIy86sNKUj749r9FmHf4qdNnCxBY2Fbw4uRpOpcg0oDTIKtFfO6iBthlBQAgdbO
         llfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709740681; x=1710345481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCLrEO1BVRbgU2B0xNBKTXS63QZMV20ckMmtjrMG60A=;
        b=kjutl6+dieEAF44nbSCOZSljkAHVdzy/PS/iEXwYopOSILUzoI7avbzg1vPwdkZuSd
         gSYj8JB7ZYb+uVw82gyl6b0GvqPDvRVu9g1B/UlYic/MxeTVfRanw9WeTCyouwe1+1Jy
         jGAN7OO49dxArhojSP+UFMw6sBUL3DE5jMzmFYlLsXLmTnHvXsTOo2qDfNkY4mSSAnE+
         g1UU1tHMHOrYb4ps/OYBB+rckVm+s8N0tu58KdDN6jNut61Cv+cYz9OCl/PCSZe2HPih
         /5W0MLB0LMyzPPYQ1xZVywzTB/BTh7yb6ovLwfTx4yUmL03ADjHYekIZJo9izwdimHfI
         JLnQ==
X-Gm-Message-State: AOJu0YzLJUeiI/oq5A5mGa1oHdwmozXmqKEfa1WH3AT7sl1FEyUuwVyW
	mYMFgSSLyudUqrzkXq9WQyrhYh3evdVcgX7qgdUQFVEOyLgqRqdvTQZvwUKm1uIW3iWORNBNbeW
	aTRY1+i7AQAU6cIPCvIHsx8q4TWY=
X-Google-Smtp-Source: AGHT+IFJLcKYlOWkVrYDrrhDYoG2UruXs9NCLxZ0HrBkd5bQ+053ix+b6dl7nCPl7XiaNa+crK9gdXbFoE9MqSzq1pk=
X-Received: by 2002:a05:6871:62c6:b0:21f:9f20:2f58 with SMTP id
 rf6-20020a05687162c600b0021f9f202f58mr6135930oab.24.1709740680683; Wed, 06
 Mar 2024 07:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20240229051156.3731622-1-raj.khem@gmail.com> <CANNYZj8tsW7dQEFSFsdkBdVmiENSJAR0pBGCS_rsW9BkXcFtaA@mail.gmail.com>
In-Reply-To: <CANNYZj8tsW7dQEFSFsdkBdVmiENSJAR0pBGCS_rsW9BkXcFtaA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 07:57:49 -0800
Message-ID: <CAMKF1socGmzLDgLxOwgkomEOubcZeKRmbr-5=WJEX1zq35RxKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: Update to 18.1.0 RC4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ee262d061300053a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196732

--000000000000ee262d061300053a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s same SHA as rc4

On Wed, Mar 6, 2024 at 4:20=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> The final release is now out, please update to:
> https://github.com/llvm/llvm-project/tags
>
> Alex
>
> On Thu, 29 Feb 2024 at 06:12, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This is last milestone before final release
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/llvm/llvm_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
> b/meta/recipes-devtools/llvm/llvm_git.bb
> > index 40103a94aea..111fb07fac9 100644
> > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > @@ -24,7 +24,7 @@ MAJOR_VERSION =3D "${@oe.utils.trim_version("${PV}", =
1)}"
> >  LLVM_RELEASE =3D "${PV}"
> >
> >  BRANCH =3D "release/${MAJOR_VERSION}.x"
> > -SRCREV =3D "0d656f0f12d447ac0e197618a0d25495d66388d1"
> > +SRCREV =3D "461274b81d8641eab64d494accddc81d7db8a09e"
> >  SRC_URI =3D "git://
> github.com/llvm/llvm-project.git;branch=3D${BRANCH};protocol=3Dhttps
> <http://github.com/llvm/llvm-project.git;branch=3D$%7BBRANCH%7D;protocol=
=3Dhttps>
> \
> >
>  file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=3D2 \
> >
>  file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;s=
triplevel=3D2
> \
> > @@ -148,6 +148,7 @@ FILES:${PN}-bugpointpasses =3D "\
> >
> >  FILES:${PN}-libllvm =3D "\
> >      ${libdir}/libLLVM-${MAJOR_VERSION}.so \
> > +    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
> >  "
> >
> >  FILES:${PN}-liblto +=3D "\
> > --
> > 2.44.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#196412):
> https://lists.openembedded.org/g/openembedded-core/message/196412
> > Mute This Topic: https://lists.openembedded.org/mt/104638745/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000ee262d061300053a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It=E2=80=99s same SHA as rc4=C2=A0</div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 202=
4 at 4:20=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">The final release is now out, please update to:<br>
<a href=3D"https://github.com/llvm/llvm-project/tags" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/llvm/llvm-project/tags</a><br>
<br>
Alex<br>
<br>
On Thu, 29 Feb 2024 at 06:12, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is last milestone before final release<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D=
"noreferrer" target=3D"_blank">llvm_git.bb</a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">llvm_git.bb</a> b/meta/recipes-devtoo=
ls/llvm/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>llvm_git.bb</a><br>
&gt; index 40103a94aea..111fb07fac9 100644<br>
&gt; --- a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D=
"noreferrer" target=3D"_blank">llvm_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D=
"noreferrer" target=3D"_blank">llvm_git.bb</a><br>
&gt; @@ -24,7 +24,7 @@ MAJOR_VERSION =3D &quot;${@oe.utils.trim_version(&qu=
ot;${PV}&quot;, 1)}&quot;<br>
&gt;=C2=A0 LLVM_RELEASE =3D &quot;${PV}&quot;<br>
&gt;<br>
&gt;=C2=A0 BRANCH =3D &quot;release/${MAJOR_VERSION}.x&quot;<br>
&gt; -SRCREV =3D &quot;0d656f0f12d447ac0e197618a0d25495d66388d1&quot;<br>
&gt; +SRCREV =3D &quot;461274b81d8641eab64d494accddc81d7db8a09e&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/llvm/llvm-p=
roject.git;branch=3D$%7BBRANCH%7D;protocol=3Dhttps" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/llvm/llvm-project.git;branch=3D${BRANCH};protocol=
=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-llvm-allow-=
env-override-of-exe-path.patch;striplevel=3D2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-AsmMatcherE=
mitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=3D2 \<br>
&gt; @@ -148,6 +148,7 @@ FILES:${PN}-bugpointpasses =3D &quot;\<br>
&gt;<br>
&gt;=C2=A0 FILES:${PN}-libllvm =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libLLVM-${MAJOR_VERSION}.so \<br>
&gt; +=C2=A0 =C2=A0 ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 FILES:${PN}-liblto +=3D &quot;\<br>
&gt; --<br>
&gt; 2.44.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#196412): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/196412" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/196412</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10463874=
5/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104638745/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000ee262d061300053a--

