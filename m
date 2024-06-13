Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9E5C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 18:45:09 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.502.1718304303850314675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 11:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbtl47ab;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d229baccc4so700995b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718304303; x=1718909103; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGqbGId/ukHvhVqWs42TGzTsVojXm3NiPEEASCGj+/M=;
        b=nbtl47ab+AZH0GJfLIDz/8jneWpgF5U7ZAW6OVshOvRmydyLc/ZBIAzDJKi00LQG+W
         hKreSVczHnjPVtT7AR6h4JCu5b+DujhiaNU3LEUZxuR6Upsb2FkDtoMHHn+SuPnHC4Ws
         zUtCXleGfPHCMt2jG7Sb5hfkI1Am4aSN0eTwPv6P2N/yF1QQ43NQcTQ6fdrBYRB00ACf
         dfs2D6zIdU7qogyr8tBKd04j3UTqPebs0LJo7N58EabgdIuMxhE+Qqfaxv+/2gTkt480
         Dzb3FNWFvvwyiGLHQXaXrKUwZdUgDEBq3AruJiTFMEbInW+N6aJ5v+wH3Ug8P9HEezv0
         GY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718304303; x=1718909103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGqbGId/ukHvhVqWs42TGzTsVojXm3NiPEEASCGj+/M=;
        b=K6IuSCwVfZNnPZabsh5qt9+iwn6xpjczU638AXcqa1xsfeB8TUev9/L1Eg2xWh4r1i
         GwEzqhv9ilGD8P9g64JUOT7iCrwhydU5QA13eMXjkWLCwXG4PU8NMyyR/fx6a2pfHwtV
         r3x30KXrO94F3X1oNU9wXnkkGHRkzLlKSkfAtoqR6k+BW/oLLa3MEEwdaijZjq0bmEkd
         J40EfcJaoJAYbymzPJJuJ7CdSdGWqlU/uGGiYDyMc0HYuLFg0I7kbG31KvicU2cJ51zC
         HPQbJmcPJ4nh3/GoYbjnBY/JxaJtK1BBFf8W6sv57WA5/TqPBqq8e/jxR8mf99BvbbD+
         i1qg==
X-Forwarded-Encrypted: i=1; AJvYcCUzfTtTNM13gGeZx/yL0s4kepVrcw6yhb0Gq3kIlvjZxt0FwlxBVqcgiK/WJ9QxVewiUGaZQJnrT8E4wUActxFMssIdiZ2tHfCfNYGmzTa2sXcl9ZNYqTZO
X-Gm-Message-State: AOJu0Yy0uZla1eUXirmLwLxrxZiEwPO+uqQf6VfxZ5YkczgewijXnfbv
	uxLvifu7RgO4+YKbUJkrQKqHhUni+m1EYNVl/A5gazwUAsXNGMdenmkaZamBVdN8ObEGnVtd93A
	FS4DV4k/rBxGFw6ebEcy0XYytsAMrFA==
X-Google-Smtp-Source: AGHT+IGiO4llfbjLb88Yy2sJHBlfAeKDHIiiV6yXZJi6l9YAVeWRkPY2gPVMRu2w9voYvKP9DjQjlwFw43Php+4W4IA=
X-Received: by 2002:a05:6870:418c:b0:23c:1f34:730 with SMTP id
 586e51a60fabf-25842b7b6e9mr475769fac.49.1718304302857; Thu, 13 Jun 2024
 11:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240613061859.3777324-1-changqing.li@windriver.com> <df18afb1f26ccd4f7abfa6299b334641b7fa7665.camel@linuxfoundation.org>
In-Reply-To: <df18afb1f26ccd4f7abfa6299b334641b7fa7665.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jun 2024 11:44:51 -0700
Message-ID: <CAMKF1sq-eZSykY=GG=bA==aiBjgez9Muf5ELuoi+zJufEj66yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] expect-native: fix build with gcc-14
To: richard.purdie@linuxfoundation.org
Cc: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096845e061ac9e53b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 18:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200636

--00000000000096845e061ac9e53b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 1:40=E2=80=AFAM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Thu, 2024-06-13 at 14:18 +0800, Changqing Li via lists.openembedded.or=
g
> wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > * do_configure failed with gcc-14:
> > error in build/config.log:
> > conftest.c:56:3: error: return type defaults to 'int' [-Wimplicit-int]
> > conftest.c:59:5: error: implicit declaration of function 'exit'
> [-Wimplicit-function-declaration]
> >
> > * this recipe set "BBCLASSEXTEND =3D "native nativesdk", causes "CFLAGS=
 +=3D"
> > setting not take effect, use append instead.
> > snip of bitbake expect-native -e:
> >    set /layers/oe-core/meta/conf/documentation.conf:110
> >      [doc] "Flags passed to the C compiler for the target system. This
> variable evaluates to the same as TARGET_CFLAGS."
> >    append /layers/oe-core/meta/recipes-devtools/expect/
> expect_5.45.4.bb:87
> >      "-Wno-error=3Dincompatible-pointer-types"
> >    set /layers/oe-core/meta/classes-recipe/native.bbclass:44
> >      "${BUILD_CFLAGS}"
> >    override[pn-gtk4]::append[toolchain-clang]
> /layers/meta-clang/conf/nonclangable.conf:336
> >      " -Wno-error=3Dint-conversion"
> >    override[pn-pidgin-sipe]::append[toolchain-clang]
> /layers/meta-clang/conf/nonclangable.conf:340
> >      " -Wno-error=3Dcast-function-type-strict"
> >  pre-expansion value:
> >    "${BUILD_CFLAGS}"
> > export
> CFLAGS=3D"-isystem/build/tmp-glibc/work/x86_64-linux/expect-native/5.45.4=
/recipe-sysroot-native/usr/include
> -O2 -pipe"
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta/recipes-devtools/expect/expect_5.45.4.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb
> b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > index 18904ebc10..5e7b352196 100644
> > --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> > +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > @@ -84,4 +84,7 @@ BBCLASSEXTEND =3D "native nativesdk"
> >
> >  # http://errors.yoctoproject.org/Errors/Details/766950/
> >  # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct
> Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *=
,
> int)' [-Wincompatible-pointer-types]
> > -CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> > +CFLAGS:append =3D " -Wno-error=3Dincompatible-pointer-types"
> > +
> > +# Fix expect-native configure tests are failing with gcc-14
> > +CFLAGS:append:class-native =3D " -Wno-error=3Dimplicit-int
> -Wno-error=3Dimplicit-function-declaration"
> >
>
> You have a valid problem here however I really don't like the "arms
> race" of making everything an append as the base definitions are
> problematic. It would be this recipe today but a quick search shows
> many other recipes which will have similar problems.
>
> I think I'd prefer to see if we can drop the assignments in
> native/nativesdk bbclass and improve things that way even if it is a
> bit more invasive.


I am wondering when we have gcc14 for target as well why there tests are
not failing for target compile


>
> I'm testing a patch on master-next to test this and see how bad the
> fallout is.
>

I have not looked at your patch but I think passing -Wno-error to configure
tests might be something that can help unless some tests are relying on
that behavior which may fail

>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200594):
> https://lists.openembedded.org/g/openembedded-core/message/200594
> Mute This Topic: https://lists.openembedded.org/mt/106647106/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000096845e061ac9e53b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Jun 13, 2024 at 1:40=E2=80=AFAM Richard =
Purdie via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.opene=
mbedded.org">linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Thu, 2024-06-13 at 14:18 +0800, Chan=
gqing Li via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; <br>
&gt; * do_configure failed with gcc-14:<br>
&gt; error in build/config.log:<br>
&gt; conftest.c:56:3: error: return type defaults to &#39;int&#39; [-Wimpli=
cit-int]<br>
&gt; conftest.c:59:5: error: implicit declaration of function &#39;exit&#39=
; [-Wimplicit-function-declaration]<br>
&gt; <br>
&gt; * this recipe set &quot;BBCLASSEXTEND =3D &quot;native nativesdk&quot;=
, causes &quot;CFLAGS +=3D&quot;<br>
&gt; setting not take effect, use append instead.<br>
&gt; snip of bitbake expect-native -e:<br>
&gt; =C2=A0=C2=A0 set /layers/oe-core/meta/conf/documentation.conf:110<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 [doc] &quot;Flags passed to the C compiler fo=
r the target system. This variable evaluates to the same as TARGET_CFLAGS.&=
quot;<br>
&gt; =C2=A0=C2=A0 append /layers/oe-core/meta/recipes-devtools/expect/<a hr=
ef=3D"http://expect_5.45.4.bb:87" rel=3D"noreferrer" target=3D"_blank">expe=
ct_5.45.4.bb:87</a><br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &quot;-Wno-error=3Dincompatible-pointer-types=
&quot;<br>
&gt; =C2=A0=C2=A0 set /layers/oe-core/meta/classes-recipe/native.bbclass:44=
<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &quot;${BUILD_CFLAGS}&quot;<br>
&gt; =C2=A0=C2=A0 override[pn-gtk4]::append[toolchain-clang] /layers/meta-c=
lang/conf/nonclangable.conf:336<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &quot; -Wno-error=3Dint-conversion&quot;<br>
&gt; =C2=A0=C2=A0 override[pn-pidgin-sipe]::append[toolchain-clang] /layers=
/meta-clang/conf/nonclangable.conf:340<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &quot; -Wno-error=3Dcast-function-type-strict=
&quot;<br>
&gt; =C2=A0pre-expansion value:<br>
&gt; =C2=A0=C2=A0 &quot;${BUILD_CFLAGS}&quot;<br>
&gt; export CFLAGS=3D&quot;-isystem/build/tmp-glibc/work/x86_64-linux/expec=
t-native/5.45.4/recipe-sysroot-native/usr/include -O2 -pipe&quot;<br>
&gt; <br>
&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a> | 5 ++++-<br>
&gt; =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/expect/<a href=3D"http://expect_5.4=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a> b/meta/re=
cipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb" rel=3D"noreferrer=
" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; index 18904ebc10..5e7b352196 100644<br>
&gt; --- a/meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; +++ b/meta/recipes-devtools/expect/<a href=3D"http://expect_5.45.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">expect_5.45.4.bb</a><br>
&gt; @@ -84,4 +84,7 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0# <a href=3D"http://errors.yoctoproject.org/Errors/Details/76695=
0/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Err=
ors/Details/766950/</a><br>
&gt; =C2=A0# expect5.45.4/exp_chan.c:62:5: error: initialization of &#39;st=
ruct Tcl_ChannelTypeVersion_ *&#39; from incompatible pointer type &#39;int=
 (*)(void *, int)&#39; [-Wincompatible-pointer-types]<br>
&gt; -CFLAGS +=3D &quot;-Wno-error=3Dincompatible-pointer-types&quot;<br>
&gt; +CFLAGS:append =3D &quot; -Wno-error=3Dincompatible-pointer-types&quot=
;<br>
&gt; +<br>
&gt; +# Fix expect-native configure tests are failing with gcc-14<br>
&gt; +CFLAGS:append:class-native =3D &quot; -Wno-error=3Dimplicit-int -Wno-=
error=3Dimplicit-function-declaration&quot;<br>
&gt; <br>
<br>
You have a valid problem here however I really don&#39;t like the &quot;arm=
s<br>
race&quot; of making everything an append as the base definitions are<br>
problematic. It would be this recipe today but a quick search shows<br>
many other recipes which will have similar problems.<br>
<br>
I think I&#39;d prefer to see if we can drop the assignments in<br>
native/nativesdk bbclass and improve things that way even if it is a<br>
bit more invasive.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">I am wondering when we have gcc14 for target as well why there tests are =
not failing for target compile</div><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex" dir=3D"auto"><br>
<br>
I&#39;m testing a patch on master-next to test this and see how bad the<br>
fallout is.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I have not looke=
d at your patch but I think passing -Wno-error to configure tests might be =
something that can help unless some tests are relying on that behavior whic=
h may fail=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200594): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200594" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200594</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106647106/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106647106/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000096845e061ac9e53b--

