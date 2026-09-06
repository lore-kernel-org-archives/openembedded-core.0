Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF37C624DB
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 02:54:29 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6962.1788663265214094954
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 19:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kqgNsbdh;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-86162c086f8so27942667b3.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 19:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788663264; cv=none;
        d=google.com; s=arc-20260327;
        b=qROLVhyArRkDihSV0VzI2qDRHyo49n1oOxbbzAKHMmKZ7EFCSH8TWBFheuT3Ly59Vw
         cVbUWZYUTyZSItrnN5s/AWQdfTHDB/wbEfOUCf7shKwSCN/SUWYETZSQJj0z50y8uRc6
         ADA/RNwCcy3HY9bnxNX0q2zGvydDFvHG7hwKZQOy1s4C5d92nbYFJpnJXJQ4HPwv6iDy
         4rxdxkeI5y+jiigSa0zqjiIMNthJL2G0YdLVqVsyIUpT5cT8+++w74uzep/OaEUEdOne
         0ZR83ejGpxd5LcoGbPCL+vdqkURG+56m/w5hQMK4rR6bSz4364u5KHhp1wYk/KoBhUQl
         o7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=24aNSkuDDLwghv6Ryp8n4ujmRe9Wcw9pzMCnR0BSRY0=;
        fh=aWXYTKTyf4t0YW5Dw+bIdNF//ojSblMb9iZjHUKmzPY=;
        b=QDQBb9vxqM4g4d0umimtfI3mGj82lJnFjRIbo7pdZIiIw5ZvZfkFJKGHxNay77tBoE
         TELdYATed+J6t1/UDCF3oq43bEfYpu9YlgxeNBd52P+2zur4HLrqX/n1CfHxO7FJH6B+
         vIjpYHeH6518zD5wBlg4PdP0po7jHrEeD2IXfFTQa4Q0aBrFCEEz+yYcniIsF1vG9hZo
         XRz/PadHdWz3hUe31Ki3K4/WXzS9HJGcudV+lYXbv0+L5c8arg4w2DZv3zZWBR0oJNv6
         mEM/69NdLpKwsyGG2kxMsdsbg9qcRVWAYVRKJGL/MXcd08yleAqO9PYBzjzbLvM2dnxv
         N4Dg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788663264; x=1789268064; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24aNSkuDDLwghv6Ryp8n4ujmRe9Wcw9pzMCnR0BSRY0=;
        b=kqgNsbdhQu6Ii3izAOtVBFw1jl4Sq/AYTHcP9MjjtJx+oGjoNyYIfBC040Aa05YfyH
         A0P31wd2Ueuc4B6tw2glSXEhhClWBZq7NBZvgGI23mLWA03CV/kG5x6SFAUdib9+dLbt
         Jggp4Qsmjgen3p7pc7zm628apKbjHJI6DonDq5gVZSLNxTdwhABW+6f5DhetN1jZP6dr
         p21svDghwI3Qm0kvr2r1oV5g/IrCDpsgH9DaiNQWKH6zCKgeALkApNnaHqallSgSMN5y
         dyWiRMxQNQX62YVzKXJd+LT+6Ep04aQqy/Po9srfgM3iOeUKLtJNAM6pwtqHJSW+gP74
         aVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788663264; x=1789268064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=24aNSkuDDLwghv6Ryp8n4ujmRe9Wcw9pzMCnR0BSRY0=;
        b=J3QNwdA2255Jghte4Y7tIt231sBhgEY4yKWzcmgKYYuEKOtDHZx3FemIIY1ZV1tFdA
         s61qllTKFPhWzkJxDULTVNNfT6n48BFfJ3R+TMxXu/QNNdEkk3LMXeUwelxrD5vbWD1k
         tyEsdCL4mB8KvqnJQf7Vu21TwqHbAZ1QahsmV02ESc6QapJCyQ97YzoJWPwqH7UEQjDr
         AVwlSr8g1VuDxZRycjiDw6R3sErbf8phfV2Vc+D9dZAYUBCWiKFHl7OtECWWGsLezxhF
         DN41E4eXr4iLoda6WvVOORVS4pvW0Yz7ub8C7roJFRU6ErUlx5tmwzEUnIGw/xJK6Rbq
         DGNQ==
X-Gm-Message-State: AFuF++lNe90cPXuFp3/IijPD9HO7Wcvx41BwkbAfnA5VDexZ1tHVdJf5
	5Pn8g4r2fMqXC0w8bINDmPbpDdv0xcjnwD4yc3RHKgMMoL/MbWAwpE+xI1Ebb8jPIYKnmQWF0mz
	+xEu3VQQPPT6JNfzuBBx9SxS64LtT32o=
X-Gm-Gg: AYBFou1EouBlBpX5zemMlh+9RIHoj8rrsOYuMDLO18ElH2Eo9+dn5L5BkQ4jxm/6rqP
	wzwOPtvDa9DIh7eYE+npnOJ0icEul0jql1o3gJZknYvkO+SAoMuuCSr01+QxhkJs+z3+NHQnTJF
	bIsm8SqcjhgrhxokmFkbx1CsDQxefDeJb/GIanad/ym+45o4vITfP+0Bs9JIUF/mx9dFMGYUwCq
	xEgpftTG8T6nM3209z+DYyG93zZuX6dPWxg62s+2MDVgYkKMbPUI1XLWMi2RL+a9eGPCOSrFShn
	9qtvLn2xne8vQ4yBE94AMnQzu/zjGslA7lHPiAmFSvfoxHEukHVITDSRQPSb5GgbOZCIC1DWcpb
	yE+AfEzLAjPleDdwkO5rCGFqdpkizK9inR+fmeeKrruUoB1lpnpPXNH684/LrJoTfz1H6lLb1f+
	Kuacc9MWx0pGx0BdqwzZDyGLwOSoLd3jZqTFM2LDBlrR2RGwREaGcUWAe1A74N72SvDy/uyCabR
	l5P9E8AAOpI1g==
X-Received: by 2002:a05:690c:e3e5:b0:873:5c7b:c137 with SMTP id
 00721157ae682-8735c7bc576mr22632667b3.31.1788663264153; Sat, 05 Sep 2026
 19:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260905184328.3263998-1-khem.raj@oss.qualcomm.com> <55ecd56beb4e2daa5fa321c47dbf0459e357851e.camel@linuxfoundation.org>
In-Reply-To: <55ecd56beb4e2daa5fa321c47dbf0459e357851e.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Sep 2026 19:54:11 -0700
X-Gm-Features: AcwNN1XstaPM4_8aQFzdP-5pmEj6FFNT9ZvBX1Gh49_rQvB59TbL2_HtZU3Ut_E
Message-ID: <CAMKF1sr1W5vs7-q=+MR6gjQDZ=bm7nDpB1bhJeWYS=V87TyxGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-typing-extensions: Fix build with
 flit-core 4
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000007b9676065ac79ec7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 02:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245197

--0000000000007b9676065ac79ec7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes it was. But it can be applied without the upgrade as well

On Sat, Sep 5, 2026, 1:40=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2026-09-05 at 11:43 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > Fixes
> >  ERROR Unmet dependencies
> > >       flit_core<4,>=3D3.11
> > >               wanted: <4,>=3D3.11
> > >               found: 4.0.2
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >  ...4d71b18eee56c53dde6a609dea188bb26a96.patch | 21 +++++++++++++++++++
> >  .../python3-typing-extensions_4.16.0.bb       |  2 ++
> >  2 files changed, 23 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56c5=
3dde6a609dea188bb26a96.patch
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56=
c53dde6a609dea188bb26a96.patch
> b/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56=
c53dde6a609dea188bb26a96.patch
> > new file mode 100644
> > index 0000000000..226c65c13c
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b18eee56=
c53dde6a609dea188bb26a96.patch
> > @@ -0,0 +1,21 @@
> > +From 996d4d71b18eee56c53dde6a609dea188bb26a96 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
> > +Date: Mon, 24 Aug 2026 18:40:42 +0200
> > +Subject: [PATCH] Allow building this package with flit-core 4 (#787)
> > +
> > +Upstream-Status: Backport [
> https://github.com/python/typing_extensions/pull/787]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + pyproject.toml | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +--- a/pyproject.toml
> > ++++ b/pyproject.toml
> > +@@ -1,6 +1,6 @@
> > + # Build system requirements.
> > + [build-system]
> > +-requires =3D ["flit_core >=3D3.11,<4"]
> > ++requires =3D ["flit_core >=3D3.11,<5"]
> > + build-backend =3D "flit_core.buildapi"
> > +
> > + # Project metadata
> > diff --git a/meta/recipes-devtools/python/
> python3-typing-extensions_4.16.0.bb b/meta/recipes-devtools/python/
> python3-typing-extensions_4.16.0.bb
> > index cede81e128..484f0164bc 100644
> > --- a/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
> > +++ b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
> > @@ -15,6 +15,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dfcf6b249c2641540219a727f35d8d2c2"
> >  # The name on PyPi is slightly different.
> >  PYPI_PACKAGE =3D "typing_extensions"
> >
> > +SRC_URI +=3D "file://996d4d71b18eee56c53dde6a609dea188bb26a96.patch"
> > +
> >  SRC_URI[sha256sum] =3D
> "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
> >
> >  inherit pypi python_flit_core
> >
>
> Thanks, I'm guessing this was in response to one of the patches in
> master-next?
>
> I ran that flit upgrade through testing just to see where things stood,
> it looks like there are 5 or so recipces which need this kind of tweak
> so I've backed that out again.
>
> Cheers,
>
> Richard
>

--0000000000007b9676065ac79ec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes it was. But it can be applied without the upgrade as =
well</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat, Sep 5, 2026, 1:40=E2=80=AFPM Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Sat, 2026-09-05 at 11:43 -0700, Khem Raj via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">lists.openembedded.org</a> wrote:<br>
&gt; Fixes<br>
&gt; =C2=A0ERROR Unmet dependencies<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flit_core&lt;4,&gt;=3D3.11<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 wanted: &lt;4,&gt;=3D3.11<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 found: 4.0.2<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank" rel=3D"noreferrer">khem.raj@oss.qualcomm.com</a>&gt;<b=
r>
&gt; ---<br>
&gt; =C2=A0...4d71b18eee56c53dde6a609dea188bb26a96.patch | 21 +++++++++++++=
++++++<br>
&gt; =C2=A0.../<a href=3D"http://python3-typing-extensions_4.16.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3-typing-extensions_4.16=
.0.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++<br>
&gt; =C2=A02 files changed, 23 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/python/python3-typing-e=
xtensions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3-typing-extensions/99=
6d4d71b18eee56c53dde6a609dea188bb26a96.patch b/meta/recipes-devtools/python=
/python3-typing-extensions/996d4d71b18eee56c53dde6a609dea188bb26a96.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..226c65c13c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-typing-extensions/996d4d71b=
18eee56c53dde6a609dea188bb26a96.patch<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +From 996d4d71b18eee56c53dde6a609dea188bb26a96 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D &lt;<a href=3D"mailto=
:miro@hroncok.cz" target=3D"_blank" rel=3D"noreferrer">miro@hroncok.cz</a>&=
gt;<br>
&gt; +Date: Mon, 24 Aug 2026 18:40:42 +0200<br>
&gt; +Subject: [PATCH] Allow building this package with flit-core 4 (#787)<=
br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/typin=
g_extensions/pull/787" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/python/typing_extensions/pull/787</a>]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + pyproject.toml | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +--- a/pyproject.toml<br>
&gt; ++++ b/pyproject.toml<br>
&gt; +@@ -1,6 +1,6 @@<br>
&gt; + # Build system requirements.<br>
&gt; + [build-system]<br>
&gt; +-requires =3D [&quot;flit_core &gt;=3D3.11,&lt;4&quot;]<br>
&gt; ++requires =3D [&quot;flit_core &gt;=3D3.11,&lt;5&quot;]<br>
&gt; + build-backend =3D &quot;flit_core.buildapi&quot;<br>
&gt; +<br>
&gt; + # Project metadata<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-ty=
ping-extensions_4.16.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
python3-typing-extensions_4.16.0.bb</a> b/meta/recipes-devtools/python/<a h=
ref=3D"http://python3-typing-extensions_4.16.0.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">python3-typing-extensions_4.16.0.bb</a><br>
&gt; index cede81e128..484f0164bc 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-typing-ex=
tensions_4.16.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3=
-typing-extensions_4.16.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-typing-ex=
tensions_4.16.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3=
-typing-extensions_4.16.0.bb</a><br>
&gt; @@ -15,6 +15,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dfcf6=
b249c2641540219a727f35d8d2c2&quot;<br>
&gt; =C2=A0# The name on PyPi is slightly different.<br>
&gt; =C2=A0PYPI_PACKAGE =3D &quot;typing_extensions&quot;<br>
&gt; =C2=A0<br>
&gt; +SRC_URI +=3D &quot;file://996d4d71b18eee56c53dde6a609dea188bb26a96.pa=
tch&quot;<br>
&gt; +<br>
&gt; =C2=A0SRC_URI[sha256sum] =3D &quot;dc983d19a509c94dba722ee6abd33940f7c=
05a89e243c47e907eb4db6f1a43e5&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0inherit pypi python_flit_core<br>
&gt; <br>
<br>
Thanks, I&#39;m guessing this was in response to one of the patches in mast=
er-next?<br>
<br>
I ran that flit upgrade through testing just to see where things stood,<br>
it looks like there are 5 or so recipces which need this kind of tweak<br>
so I&#39;ve backed that out again.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000007b9676065ac79ec7--

