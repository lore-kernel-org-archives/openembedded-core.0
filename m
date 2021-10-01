Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3095BC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 14:17:39 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.8753.1633097858068660064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 07:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jlN8BpVX;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 rj12-20020a17090b3e8c00b0019f88e44d85so345054pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 07:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=onSpGuOs54OV+04jvBq8rVRgM4imoiPGpzCUA3Bq0UE=;
        b=jlN8BpVXqw1fJgD0R1laq2o9JZNwL6pYiNVEyqiIic7FBlp1dbDiGlazZwBL3a5cov
         5Teoul+aADc6uOCdP9+hrbS0qWIVGavlZGtKReh6Sev5WflBU2wy/TKRgBiX4fUigN0l
         5SXe0fBstIbJbH4gX5wdpSNk4GrA2Q82uvb3XtpfN0UgCO5023zC4ZJHUxCl6UrlqeLj
         4axdi5VffYQR52NzNENx/7K9pwGjPEeCAwTOsl3a8JWIHnyH8onh5YGuFd086pvrD4Zs
         dEFxF9CrP6mMggn8ONPiGa6awivT2ocDYdyrptNHV2/mTVjuDeaXyCWOANHvZLn/EoeG
         PLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=onSpGuOs54OV+04jvBq8rVRgM4imoiPGpzCUA3Bq0UE=;
        b=Hc4ApEQ63xJNdkCs/hy5BOTQzqa6WqbIrsmrjEPOSshkOIXIhGIkOHsH+1c/gI/5c8
         S8OvUKNli8BFWHGtaWqwh6z22N1y3Ubb2iGjE6dmvgBcBtMfJZ/cn0CL1E4Q4Tti+kX7
         NBmNOv5o5safVFHPH3OX5zDgrE8+JzMGGNhFfcHzPJ3omMUmWQ7Jah+Ctbe0UU0DxIyM
         YVYQys/zqLYqeK2PAycIhCd7c+q87QJ16VnbsTzKKbunYUTnnDiVBf9am05bUMC8k1Tp
         suui5fUjElpss0X2AYCYzayPH3hHCbXNeoaWT699PbG8hXlyZnVOx3pBmtNONHG0pl8b
         YbRg==
X-Gm-Message-State: AOAM532nVwMs4ZFWwVn8VbhNnfbRWAHwF0qWO7p45K61wsPDbX5XiUSq
	a4Y9t/lvHUSu6E2QrK5nsa+bivCEwJNDh4lkj7Q=
X-Google-Smtp-Source: 
 ABdhPJxxQbBqridtx7v4NQE+D0Sach8GKSqvua2ojE2a/d1UK5dVVTrOMkPBzeEKgfZ8NYsDHcBhKIYVbrAXZoTBbxU=
X-Received: by 2002:a17:90a:c913:: with SMTP id
 v19mr20633370pjt.169.1633097857505;
 Fri, 01 Oct 2021 07:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org>
 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Oct 2021 16:17:26 +0200
Message-ID: 
 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to
 install without explict dependencies
To: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ae1db805cd4b3906"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 14:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156526

--000000000000ae1db805cd4b3906
Content-Type: text/plain; charset="UTF-8"

FWIW: I've fixed some bigger layers where pkgconfig was causing quite a few
build failures,

e.g. meta-webosose needed it in around 30 recipes (included in
https://github.com/shr-project/meta-webosose/commits/dunfell)
meta-ros layers I'm still working on, sofar over 50 recipes (
https://github.com/ros/meta-ros/pull/939)

One interesting case I wanted to mention here was collada-dom in meta-ros:
https://github.com/ros/meta-ros/pull/939/commits/4e790a7de5e740eae3084a925a8a23f575ddf410

including this layer.conf change caused collada-dom not to fail with
reasonable error about missing pkgconfig-native, but triggered textrel QA
issue and it was actually caused by pkgconfig not being available where
do_configure "silently" failed to find system bzip2 and minizip due to
missing pkgconfig and built own version instead which lead to this textrel
QA issue.

There might be many more recipes like this, which build something
differently without pkgconfig available, without triggering any QA check
like in this case. It might be useful to compare at least buildhistory
results with and without the layer.conf change to see what else was changed
unexpectedly.

Cheers,

On Tue, Sep 21, 2021 at 6:21 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Sep 20, 2021 at 6:34 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
> >
> >
> > On 9/20/21 7:48 AM, Richard Purdie wrote:
> >
> > On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via
> lists.openembedded.org
> > wrote:
> >
> > There are several dependencies which recipes have which are not needed
> > at runtime, only at build time. Extend the list of these from bison to
> > include quilt, patch, meson, autoconf, automake and ninja which should
> > reduce the amount of data being included in native sysroots.
> >
> > This speeds up and reduces the sstate needed for image builds for
> example.
> >
> > If this change breaks recipes, it probably means they're missing an
> explicit
> > DEPENDS on something in this list which is a bug in the recipe.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/layer.conf | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index 307ad7e2237..b3cc8a249e9 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -48,6 +48,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> >  "
> >
> >  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> > +  *->patch-native \
> >    *->quilt-native \
> >    *->subversion-native \
> >    *->git-native \
> > @@ -90,7 +91,16 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> >  # (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
> >  # dependency incidentally. This improves determinism and avoids build
> >  # failures when people switch to external toolchains.
> > -SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
> > +SSTATE_EXCLUDEDEPS_SYSROOT += "\
> > +    .*->autoconf-native \
> > +    .*->automake-native \
> > +    .*->bison-native \
> > +    .*->meson-native \
> > +    .*->ninja-native \
> > +    .*->patch-native \
> > +    .*->pkgconfig-native \
> > +    .*->quilt-native \
> > +"
> >
> > I've marked this one as an RFC since it caused a fair bit of pain even
> in OE-
> > core due to recipes having pkgconfig class inherits missing.
> >
> > We do really want to do this and correctly mark up the recipe
> dependencies, the
> > question is whether it is too late for 3.4 or not. We could go for a
> smaller
> > list for now too but I wanted to hear opinions.
> >
> >
> > It looks like a great change! I'd say it's too late for 3.4 and we
> should do it for 3.5 instead.
> >
>
> right see the failed recipes which would need fixing
> https://errors.yoctoproject.org/Errors/Build/130779/
>
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156200):
> https://lists.openembedded.org/g/openembedded-core/message/156200
> Mute This Topic: https://lists.openembedded.org/mt/85739636/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ae1db805cd4b3906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I&#39;ve fixed some bigger layers where pkgconfig wa=
s causing quite a few build failures,=C2=A0<div><div><br></div><div>e.g. me=
ta-webosose needed it in around 30 recipes (included in=C2=A0<a href=3D"htt=
ps://github.com/shr-project/meta-webosose/commits/dunfell">https://github.c=
om/shr-project/meta-webosose/commits/dunfell</a>)</div><div>meta-ros layers=
 I&#39;m still working on, sofar over 50 recipes (<a href=3D"https://github=
.com/ros/meta-ros/pull/939">https://github.com/ros/meta-ros/pull/939</a>)</=
div><div><br></div><div>One interesting case I wanted to mention here was c=
ollada-dom in meta-ros:</div><div><a href=3D"https://github.com/ros/meta-ro=
s/pull/939/commits/4e790a7de5e740eae3084a925a8a23f575ddf410">https://github=
.com/ros/meta-ros/pull/939/commits/4e790a7de5e740eae3084a925a8a23f575ddf410=
</a><br></div><div><br></div><div>including this layer.conf change caused c=
ollada-dom not to fail with reasonable error about missing pkgconfig-native=
, but triggered textrel QA issue and it was actually caused by pkgconfig no=
t being available where do_configure &quot;silently&quot; failed to find sy=
stem bzip2 and minizip due to missing pkgconfig and built own version inste=
ad which lead to this textrel QA issue.<br><br>There might be many more rec=
ipes like this, which build something differently without pkgconfig availab=
le, without triggering any QA check like in this case. It might be useful t=
o compare at least buildhistory results with and without the layer.conf cha=
nge to see what else was changed unexpectedly.<br></div></div><div><br></di=
v><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Sep 21, 2021 at 6:21 AM Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep 20, 2021 at 6:34 =
AM Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank=
">JPEWhacker@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 9/20/21 7:48 AM, Richard Purdie wrote:<br>
&gt;<br>
&gt; On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a><br>
&gt; wrote:<br>
&gt;<br>
&gt; There are several dependencies which recipes have which are not needed=
<br>
&gt; at runtime, only at build time. Extend the list of these from bison to=
<br>
&gt; include quilt, patch, meson, autoconf, automake and ninja which should=
<br>
&gt; reduce the amount of data being included in native sysroots.<br>
&gt;<br>
&gt; This speeds up and reduces the sstate needed for image builds for exam=
ple.<br>
&gt;<br>
&gt; If this change breaks recipes, it probably means they&#39;re missing a=
n explicit<br>
&gt; DEPENDS on something in this list which is a bug in the recipe.<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/layer.conf | 12 +++++++++++-<br>
&gt;=C2=A0 1 file changed, 11 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
&gt; index 307ad7e2237..b3cc8a249e9 100644<br>
&gt; --- a/meta/conf/layer.conf<br>
&gt; +++ b/meta/conf/layer.conf<br>
&gt; @@ -48,6 +48,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D &quot; \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot; \<br>
&gt; +=C2=A0 *-&gt;patch-native \<br>
&gt;=C2=A0 =C2=A0 *-&gt;quilt-native \<br>
&gt;=C2=A0 =C2=A0 *-&gt;subversion-native \<br>
&gt;=C2=A0 =C2=A0 *-&gt;git-native \<br>
&gt; @@ -90,7 +91,16 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot; \<br>
&gt;=C2=A0 # (e.g. X -&gt; Y -&gt; binutils-cross -&gt; bison-native) no lo=
nger meet the<br>
&gt;=C2=A0 # dependency incidentally. This improves determinism and avoids =
build<br>
&gt;=C2=A0 # failures when people switch to external toolchains.<br>
&gt; -SSTATE_EXCLUDEDEPS_SYSROOT +=3D &quot;.*-&gt;bison-native&quot;<br>
&gt; +SSTATE_EXCLUDEDEPS_SYSROOT +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;autoconf-native \<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;automake-native \<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;bison-native \<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;meson-native \<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;ninja-native \<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;patch-native \<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;pkgconfig-native \<br>
&gt; +=C2=A0 =C2=A0 .*-&gt;quilt-native \<br>
&gt; +&quot;<br>
&gt;<br>
&gt; I&#39;ve marked this one as an RFC since it caused a fair bit of pain =
even in OE-<br>
&gt; core due to recipes having pkgconfig class inherits missing.<br>
&gt;<br>
&gt; We do really want to do this and correctly mark up the recipe dependen=
cies, the<br>
&gt; question is whether it is too late for 3.4 or not. We could go for a s=
maller<br>
&gt; list for now too but I wanted to hear opinions.<br>
&gt;<br>
&gt;<br>
&gt; It looks like a great change! I&#39;d say it&#39;s too late for 3.4 an=
d we should do it for 3.5 instead.<br>
&gt;<br>
<br>
right see the failed recipes which would need fixing<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Build/130779/" rel=3D"nor=
eferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build/130=
779/</a><br>
<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156200): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156200" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156200</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85739636/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85739636/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ae1db805cd4b3906--

