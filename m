Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20668CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 08:54:14 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7600.1778144049468885503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 01:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MDVxylio;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bc1f0f48351so92726666b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 01:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778144048; cv=none;
        d=google.com; s=arc-20240605;
        b=Xa1sZV56TCgF+falHuMvRQSckIbRWxUIFGb9G/BMTRtRGoKTkye7L5cfJpOOehKf17
         jz50hH5GavP1P/t4TBgnTo1RBEezpf87t5BBSUpkwiYos//Y7+XQup42wFe3HobEXeHB
         J18R/4fzDHVUmrcdk1ZwAPt/q3FHPVz/g4eQOfQi/vxh+9JydSAFz2tifdE4b+hL58q2
         ccAfopn6S7Imwv6Ccq878ECEc/hjRZ3mxacdujXo5t+cbJ6kNc0rXVf/nrJXn/hN12yi
         3S6sdRBPsFPqDK0M6L7iFUYr3Q1OwxigLcotH7TPh8Nh+8+6Vp6l1fbnREw5ZM3JVRyC
         rsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7zww0tHR1aNLmblHp7TX2Wc/z2IINyotF9IO5+wbzD0=;
        fh=Zf4Vo0Z5qWl+TYnw7pEdrD0DXWRUooM6UiwrZRJcA5c=;
        b=Hb9DTUpS59ZZ4fhhd/hZdwZsGHpn/Ys4OX9JkZn2BnvHLafBzqiwao6IwdnSA9f8mZ
         PbWOrFHbFZy5HBj1Wv05d6ImwrdIhwEdo5um+6sgXnWk0+x7EvC3sNP6dkrfjbBZXM2h
         ++6cFDYPzROmpvwuun0Hf0uDPhY6WjAOpo8ebD741xlfG1TfvCQV4LfOZf8/8QMDXtel
         DB6qm1C3ZCYDkCFp/ekabiakcM/5SbxsKdwwJ/76SgfgY0ys0bbPyNzErXEsTJvXiaE6
         +EeVsupBi806AEKZO1Oi4C9492RIAy9VRrQIjhhV8qTWmx/nw4nIMcPuYfxtbB50d5dJ
         Dv0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778144048; x=1778748848; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7zww0tHR1aNLmblHp7TX2Wc/z2IINyotF9IO5+wbzD0=;
        b=MDVxylioxzNyYZhe7qtJQfkkvGt4THT8lKdkNodJwTloPJ5fbuMxDwlyaDgCZ/rd5C
         iwJSTKd1w/A2jL4XwwNkTsq+9v4X7p78rl+a+SkE6RfGDaF83j8kL01QReze4WVKZZat
         YtqPmt1XPlgGsPv5ES9QyomESN7BLxcBvrLCk3QYUp2AOgR4bBTiC67rWcf84SwJDQL4
         iTWmzDDon+X7dVVCwk7e3snI8YxRdWSod7AoYHAq91DlqVmAs29sc6QvvpqeD4I5SBt/
         nj06lLvHkUlZVVvA5pkvIJEyREHGujk5W0FDHJxHUu+u2cIUOCpVBUSZDwf1VV5Syp5W
         V2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144048; x=1778748848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zww0tHR1aNLmblHp7TX2Wc/z2IINyotF9IO5+wbzD0=;
        b=qqVnqP5hp2VRbnT+k3XSvxqOSKn+Nd3bHVmIXaBixLaRjUzkBhD07uLggqP6Fnnlcm
         UOahL7+cBPUWOW9aPn9qBu5nBeWw3AerXAbjUEQoqe0UtokSwZYy80BzuD3SDrQY4y0z
         p5yxoAltIpAZQzo/xOF2c2V4HDVqCU4hhmCfpRwVq8MSDhhIZopFoYGV634uds0jTudw
         1oHdqrF6LP3CeRS/KGNTGBLKvak7G2+GqEFyQedQSf8Ygf7EWNVFO4nfhNV/JtXndiuM
         Dbmp4bT9E+u59W003SuBoPJ7e4z4UVfExNSWwgB0jPBRiZXWGuOWzGuO0La8zHSVkdZK
         odGw==
X-Forwarded-Encrypted: i=1; AFNElJ/akRvvi1fhFObVAgVnlXD+T5BU//0GoYPgHmQZ2Wo5+GrkRu2b3rf+zgpqMzkyfp53XIzzvS0JaXFgSYCKCKUqCQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7cf0cml1qJjeiW02vVxhuvVkSJ6fkJOkGKrSB40XhOP+B6GCl
	OhtAqy8d5QcWFmNbaR9nunwtnmemkiORkJwOP8xzX36oAJrT/AKQnn4N2nnCdrXmKaen1HMSVii
	4kUjMeeOD00uUbxcpikU7XMcgAYZ3nxw=
X-Gm-Gg: AeBDiesFshziRsCkJRz14czVZerYqDy61LGfBECsV6EDfnqi6elwJBgcMYMf0yGf35r
	bW0q7vQI1eMAXgPbhNSfNYdnE/LlxkiXkkCvxacW+kSZOOAKxbdiVZeZpeBx5S/B08KXlQ91OqY
	FjHZb1cT27PWhNc2DgqYaGsP17BLW2EhpRFPRUE35MNAwnJUW5seusJU4kQ7ujrBUgHfPT6wNWN
	iXX7GiBxI0/6qRUClhVI3+KaGx95fNff0lWl+ec84aENESjqNyZREJDuYx/EYoh9wdhJ3SPbYxK
	dLSsp1aNVS4L0EvC7xxScBWPlMicYBdl+ITmzDXuEBzoVSzmUyKTDIexy4vqKZ2u+HriaDA7G8e
	hZgGP
X-Received: by 2002:a17:907:7242:b0:bc6:a223:85e0 with SMTP id
 a640c23a62f3a-bc6a2238891mr186368866b.10.1778144047418; Thu, 07 May 2026
 01:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260506194507.3786568-1-igor.opaniuk@foundries.io>
 <DIBVZ5KGY6VD.3JQ0DG3RR7SJG@smile.fr> <CAL6CDMH02AETCQ68CozA+DtYCAei4KyTeMm2WGOntcjfPQOVSQ@mail.gmail.com>
In-Reply-To: <CAL6CDMH02AETCQ68CozA+DtYCAei4KyTeMm2WGOntcjfPQOVSQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 7 May 2026 09:53:53 +0100
X-Gm-Features: AVHnY4Iv_PINERQn_L1ffW4qopzWIFt8DpzLP4dUA5gJAp1STAVnw6gxVxuavWU
Message-ID: <CANPvuR==eX=rLYTiAzJ-K0024gc5ojntG-jmqHC+wF9z8-3KsA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] shadow: add libxcrypt-native dependency for
 native and nativesdk variants
To: igor.opaniuk@foundries.io
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin <alex@linutronix.de>, 
	Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000004e52f60651366c1b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 08:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236568

--0000000000004e52f60651366c1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Igor Opaniuk via lists.openembedded.org <igor.opaniuk=3D
foundries.io@lists.openembedded.org> escreveu (quinta, 7/05/2026 =C3=A0(s)
08:13):

> Hi Yoann,
>
> On Wed, May 6, 2026 at 10:46=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr>
> wrote:
> >
> > On Wed May 6, 2026 at 9:45 PM CEST, Igor Opaniuk via
> lists.openembedded.org wrote:
> > > Configure fails with "crypt() not found" when building shadow-native =
on
> > > hosts where libcrypt is no longer part of glibc and the libxcrypt
> > > development files are not installed (e.g. fresh Ubuntu 24.04+, where
> > > glibc 2.39 dropped libcrypt and libxcrypt-dev is not pulled in by
> > > default).
> > >
> > > virtual/crypt-native is in ASSUME_PROVIDED (meta/conf/bitbake.conf),
> > > which is why a plain DEPENDS =3D "virtual/crypt" does not pull
> > > libxcrypt-native into the native sysroot - the host is expected to
> > > provide libcrypt. That assumption no longer holds on current
> > > distributions.
> >
> > Note that we added libcrypt-dev as a documented host dependency here:
> >
> https://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d175ea1924bf401a=
203fb678261fefb228dc
>
> Thanks, I missed that. With virtual/crypt-native in ASSUME_PROVIDED
> this is consistent with how OE-core treats other
> host-provided libraries. I'll drop the patch.
>
> One small follow-up if it's worth the time:
>
> the failure mode for users who miss the doc update is a configure
> error deep in shadow-native
> (checking for crypt in -lcrypt... no -> configure: error: crypt() not
> found), which doesn't obviously point at
> "install libcrypt-dev on the host".
>
> Would a sanity-check addition (something along the lines of
> ./meta/classes-global/sanity.bbclass
> testing for crypt.h / -lcrypt on the build host and emitting the same
> hint as the docs) be welcome?
>

I think that would be useful and help in interpreting the error. However,
there's nothing like that in sanity.bbclass.

Jose


> Happy to put a patch together if so.
>
> Thanks for the review.
>
>
> >
> > > A previous attempt to fix this by adding libxcrypt-native to DEPENDS
> > > unconditionally (commit 65532fc751 "shadow: add libxcrypt-native
> > > dependency") was reverted in 54eccb76eb because it incorrectly pulled
> > > a -native recipe into the target build. Use class-specific overrides
> > > so the target build is unaffected and only shadow-native (and
> > > nativesdk-shadow) gain the explicit dependency on libxcrypt-native /
> > > nativesdk-libxcrypt.
> > >
> > > Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> >
> >
> > > ---
> > >  meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb
> b/meta/recipes-extended/shadow/shadow_4.19.4.bb
> > > index 94f155641c..cc69864a2a 100644
> > > --- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
> > > +++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
> > > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc9a450b7be84eac23e6353efecb60b5b \
> > >                      "
> > >
> > >  DEPENDS =3D "virtual/crypt"
> > > +DEPENDS:append:class-native =3D " libxcrypt-native"
> > > +DEPENDS:append:class-nativesdk =3D " nativesdk-libxcrypt"
> > >
> > >  GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shadow/releases=
"
> > >  SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
> >
> >
> > --
> > Yoann Congal
> > Smile ECS
> >
>
>
> --
> Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations
>
> Igor Opaniuk
> Senior Software Engineer, Embedded & Security
> E: igor.opaniuk@foundries.io
> W: www.foundries.io
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236565):
> https://lists.openembedded.org/g/openembedded-core/message/236565
> Mute This Topic: https://lists.openembedded.org/mt/119185904/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004e52f60651366c1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Igor Opaniuk vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
igor.opaniuk=3D<a href=3D"mailto:foundries.io@lists.openembedded.org">found=
ries.io@lists.openembedded.org</a>&gt; escreveu (quinta, 7/05/2026 =C3=A0(s=
) 08:13):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoa=
nn,<br>
<br>
On Wed, May 6, 2026 at 10:46=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:=
yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Wed May 6, 2026 at 9:45 PM CEST, Igor Opaniuk via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; &gt; Configure fails with &quot;crypt() not found&quot; when building =
shadow-native on<br>
&gt; &gt; hosts where libcrypt is no longer part of glibc and the libxcrypt=
<br>
&gt; &gt; development files are not installed (e.g. fresh Ubuntu 24.04+, wh=
ere<br>
&gt; &gt; glibc 2.39 dropped libcrypt and libxcrypt-dev is not pulled in by=
<br>
&gt; &gt; default).<br>
&gt; &gt;<br>
&gt; &gt; virtual/crypt-native is in ASSUME_PROVIDED (meta/conf/bitbake.con=
f),<br>
&gt; &gt; which is why a plain DEPENDS =3D &quot;virtual/crypt&quot; does n=
ot pull<br>
&gt; &gt; libxcrypt-native into the native sysroot - the host is expected t=
o<br>
&gt; &gt; provide libcrypt. That assumption no longer holds on current<br>
&gt; &gt; distributions.<br>
&gt;<br>
&gt; Note that we added libcrypt-dev as a documented host dependency here:<=
br>
&gt; <a href=3D"https://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d1=
75ea1924bf401a203fb678261fefb228dc" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d175ea1924bf401a203f=
b678261fefb228dc</a><br>
<br>
Thanks, I missed that. With virtual/crypt-native in ASSUME_PROVIDED<br>
this is consistent with how OE-core treats other<br>
host-provided libraries. I&#39;ll drop the patch.<br>
<br>
One small follow-up if it&#39;s worth the time:<br>
<br>
the failure mode for users who miss the doc update is a configure<br>
error deep in shadow-native<br>
(checking for crypt in -lcrypt... no -&gt; configure: error: crypt() not<br=
>
found), which doesn&#39;t obviously point at<br>
&quot;install libcrypt-dev on the host&quot;.<br>
<br>
Would a sanity-check addition (something along the lines of<br>
./meta/classes-global/sanity.bbclass<br>
testing for crypt.h / -lcrypt on the build host and emitting the same<br>
hint as the docs) be welcome?<br></blockquote><div><br></div><div>I think t=
hat would be useful and help in interpreting the error. However, there&#39;=
s nothing like that in sanity.bbclass.</div><div><br></div><div>Jose</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Happy to put a patch together if so.<br>
<br>
Thanks for the review.<br>
<br>
<br>
&gt;<br>
&gt; &gt; A previous attempt to fix this by adding libxcrypt-native to DEPE=
NDS<br>
&gt; &gt; unconditionally (commit 65532fc751 &quot;shadow: add libxcrypt-na=
tive<br>
&gt; &gt; dependency&quot;) was reverted in 54eccb76eb because it incorrect=
ly pulled<br>
&gt; &gt; a -native recipe into the target build. Use class-specific overri=
des<br>
&gt; &gt; so the target build is unaffected and only shadow-native (and<br>
&gt; &gt; nativesdk-shadow) gain the explicit dependency on libxcrypt-nativ=
e /<br>
&gt; &gt; nativesdk-libxcrypt.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Igor Opaniuk &lt;<a href=3D"mailto:igor.opaniuk@fo=
undries.io" target=3D"_blank">igor.opaniuk@foundries.io</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.=
4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a> | 2 ++<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-extended/shadow/<a href=3D"http://shado=
w_4.19.4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a> b/me=
ta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.4.bb" rel=3D"noref=
errer" target=3D"_blank">shadow_4.19.4.bb</a><br>
&gt; &gt; index 94f155641c..cc69864a2a 100644<br>
&gt; &gt; --- a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.=
4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a><br>
&gt; &gt; +++ b/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.19.=
4.bb" rel=3D"noreferrer" target=3D"_blank">shadow_4.19.4.bb</a><br>
&gt; &gt; @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc=
9a450b7be84eac23e6353efecb60b5b \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS =3D &quot;virtual/crypt&quot;<br>
&gt; &gt; +DEPENDS:append:class-native =3D &quot; libxcrypt-native&quot;<br=
>
&gt; &gt; +DEPENDS:append:class-nativesdk =3D &quot; nativesdk-libxcrypt&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/sha=
dow-maint/shadow/releases" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/shadow-maint/shadow/releases</a>&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/${PV}/${BP}.t=
ar.gz \<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
&gt;<br>
<br>
<br>
-- <br>
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations<br>
<br>
Igor Opaniuk<br>
Senior Software Engineer, Embedded &amp; Security<br>
E: <a href=3D"mailto:igor.opaniuk@foundries.io" target=3D"_blank">igor.opan=
iuk@foundries.io</a><br>
W: <a href=3D"http://www.foundries.io" rel=3D"noreferrer" target=3D"_blank"=
>www.foundries.io</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236565): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236565" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236565</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119185904/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119185904/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000004e52f60651366c1b--

