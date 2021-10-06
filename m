Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38B7C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 09:48:10 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web12.9656.1633513689506951829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 02:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B6/mqwyt;
 spf=pass (domain: gmail.com, ip: 209.85.217.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id f2so2251287vsj.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=twa1Tt4fZdXCWELhmAUqZlJJrwdzDc0VT/HvD0vYMcM=;
        b=B6/mqwytjOlzb4SW4J3PMtO5fIbldbTgWxvvPku/V7UkqNs9jERTmEg3q56gTWBSUC
         7DuEdQ//xUA9ZnvGUFQn0AZ5RPlho8BOvgwV8IhnvGLNuA0L3NmWet3SQQptkrpGUrXa
         SGkm6a+oFerJgaURhfg42FKnGWNtD9Xm68QE8AfKqdjfR99YmxhYdX70u4l+jyF3wBfv
         H4IL5+oIBOsyXD3D56uAyRh3v7T1Au5ACNfDOivZfmKjHc2SQ4xeBAIcP7Nkc93Err7v
         sxMZDnKXjBhRcTt9SLbQvN5kgH/YbyV2vsnfHPK4BIELO6bXJM+urDnTykDHGePho86G
         +4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=twa1Tt4fZdXCWELhmAUqZlJJrwdzDc0VT/HvD0vYMcM=;
        b=i3nqs9HXn8s3XFw+4uCptp13EA+TlFwJwdWW8L/KnR7GpFOiNtWyItYuYgca1ASCOh
         zUK+cQN+oqG2PXGWEnE2+/5ZXucA9LcBiJSBMYCQALT5HkoLVw6ZPIu22m+LVOnyTiCF
         ui5vX864KfY3V6YpYKR3axHfOsixlJJpwn3z6XtGZkMBXUN3w8ZVRwT430N+vYTP9W5G
         3XePpok2B0T1Ke3flWZO2pGwt3O+xWmCOl5jE2onhDt3S9oAEHH3gWrLEDRI7yb2UWZw
         NnVze9COJOwCFurmVf2mCQ96K8M350uuNI4w6I/tB15vcZxUqz95JdTIZa9sbrTggci1
         WxSA==
X-Gm-Message-State: AOAM531g0FWqGPSBT28xrNFNDQ/sYd1HVmdavUsC7GZVxqIXHDp7/qJ9
	RNSWb+cNCH9XVlilhKCyi8qsXhgRXL5jDXxHuIc=
X-Google-Smtp-Source: 
 ABdhPJwkRIuAXT9iAl9f8Bj6mRN9d02jAiPUO6ykm22zy1i9a90R8Qo7D+CW+wthN2/2nHwCvLYbmKKPzp3q1FOppr8=
X-Received: by 2002:a67:df18:: with SMTP id s24mr13610957vsk.40.1633513688687;
 Wed, 06 Oct 2021 02:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <71df6b93-bdcc-b09f-48c7-3ec822ef3228@weidmueller.com>
 <AM9PR09MB4642A8B32B686649507B9406A8B09@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642A8B32B686649507B9406A8B09@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Oct 2021 11:47:56 +0200
Message-ID: 
 <CANNYZj9eeW4+uJ=-fB1pDZq4Qa0EbgwRCCXXiEjrzuGL-jcq3w@mail.gmail.com>
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002667a305cdac0b46"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 09:48:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156681

--0000000000002667a305cdac0b46
Content-Type: text/plain; charset="UTF-8"

The OE landscape is littered with unmaintained or barely maintained layers.
By the looks of things, no one wants to maintain this proposed meta-nodejs
layer either, which involves thousands of recipes, (so far) non-existent
tooling to create and update them in scalable ways, and rigorous testing.
Or such a layer would have already happened.

It's for this reason that I think the shrinkwrapped, self-contained recipe
approach is more viable (even if it comes with its own pain points) and
also matches how node.js community operates  - we can fix the CVE stuff as
well to look into dependencies if that's a concern.

Alex

On Wed, 6 Oct 2021 at 11:43, Konrad Weihmann <kweihmann@outlook.com> wrote:

>
>
> On 06.10.21 11:18, Stefan Herbrechtsmeier wrote:
> > Hi Konrad,
> >
> > Am 05.10.2021 um 21:29 schrieb Konrad Weihmann:
> >>
> >>
> >> On 05.10.21 21:17, Alexander Kanavin wrote:
> >>> On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier
> >>> <stefan.herbrechtsmeier-oss@weidmueller.com
> >>> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> >>>
> >>>
> >>>      > A layer with thousands of recipes seems totally intractable.
> >>>
> >>>     What is your concern? The high number of dependencies or to
> >>> handle it
> >>>     via OE?
> >>>
> >>>
> >>> Generating recipes with a tool means the tool will be custom and
> >>> non-standard, and chances of anyone outside of your company
> >>> understanding, using and contributing to it are rather small. There's
> >>> also the problem of needing multiple versions of the same thing for
> >>> different
> >>> consumer items, which oe doesn't easily support. The link Robert
> >>> provided already exposes some of the pain points with that approach.
> >>>
> >>> I tend to think the best way forward (or least painful at least) is
> >>> to gradually improve what there already is, which is the npm class
> >>> and devtool, and send patches to various upstream njs projects when
> >>> they're using outdated dependencies or otherwise need changing.
> >>>
> >>> Alex
> >>
> >> Just to chime in :-), I like to question this approach of having
> >> multiple versions of the same in an image.
> >> As already outlined npm is horrible in many ways, but using the
> >> lockfile approach multiplies that even more.
> >> But I tend to agree that using the currently available oe-core code
> >> would be suited best for a broader audience
> >
> > But this audience loose the some basic features of OE (ex. version and
> > CVE check) and have to manual fix or ignore the licenses.
> >
> >> - in your own layer you simply can do whatever you like.
> >
> > But this make it impossible to share recipes. Why don't we create a
> > meta-nodejs with a different approach to avoid doing the same thing
> > multiple times.
>
> We could, but we have to think about the costs and ways to properly
> maintain it - and that seems to be the main reason.
> You could come up with a repo of your own and see who is interested in
> joining the development (as I for instance did with a repo for ruby
> gems) - still this would be hosted and maintained outside of core I
> think, due to the limited time and resources available.
>
> And **most important** the repo has to provide its own means of testing/CI.
>
> BTW I remember I had a talk with someone last year about it and putting
> a bunch of angular based apps into an image, with all npms as separate
> recipes resulted in ~100k of files.
>
> so CI and testing has to be extra beefy to make it work - which maybe
> requires a good portion of automation, which then brings me back to
> Alex's suggestion to provide some patches to devtool, if there is a need
> for that.
>
> >
> >> While personally I think in the long run, every npm dependency has to
> >> be provided as a recipe of its own (even I know the costs of that
> >> pretty well)... esp when CVE checking and basic packaging hygiene
> >> should be enforced.
> >
> > Why should OE provide a solution with doesn't support this? I think this
> > is a main feature of OE.
>
> It actually does, but having this lockfile based approach, basically
> crams up all into a single recipe, which makes it a bit harder to check
> and whitelist any false positives or n.a. items, as you might have to do
> it for more than one recipe - but yeah, the basic CVE checking is part
> of core and works as expected
>
> >
> >> Nevertheless for oe-core I wouldn't want to change a lot right now, as
> >> there is simply a valid set of consumers missing that could enable us
> >> to do some proper testing. But yeah fixes/improvements for devtool are
> >> very welcome (also the available docu might need a touch)
> >
> > My problem is that the current approach doesn't support the build of an
> > express or angular application. Does it makes sense to add this feature
> > if we know that some basic OE features are missing (CVE and version
> > check) and fixing bugs is a nightmare?
>
> Just my personal opinion would be, to open up a layer on your own and
> let it grow and mature first before getting it in into core - but
> patches to devtool are very welcome
> >
> > Regards
> >    Stefan
>

--0000000000002667a305cdac0b46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The OE landscape is littered with unmaintained or bar=
ely maintained
 layers. By the looks of things, no one wants to maintain this proposed=20
meta-nodejs layer either, which involves thousands of recipes, (so far)=20
non-existent tooling to create and update them in scalable ways, and rigoro=
us testing. Or
 such a layer would have already happened. <br></div><div><br></div><div>It=
&#39;s
 for this reason that I think the shrinkwrapped, self-contained recipe=20
approach is more viable (even if it comes with its own pain points) and als=
o matches how node.js community operates=C2=A0
 - we can fix the CVE stuff as well to look into dependencies if that&#39;s=
 a
 concern.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 6 Oct 2021 at 11:4=
3, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@o=
utlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On 06.10.21 11:18, Stefan Herbrechtsmeier wrote:<br>
&gt; Hi Konrad,<br>
&gt; <br>
&gt; Am 05.10.2021 um 21:29 schrieb Konrad Weihmann:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 05.10.21 21:17, Alexander Kanavin wrote:<br>
&gt;&gt;&gt; On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier <br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.c=
om" target=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a> <br>
&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmu=
eller.com" target=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a>=
&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; A layer with thousands of recipe=
s seems totally intractable.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 What is your concern? The high number of de=
pendencies or to <br>
&gt;&gt;&gt; handle it<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 via OE?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Generating recipes with a tool means the tool will be custom a=
nd <br>
&gt;&gt;&gt; non-standard, and chances of anyone outside of your company<br=
>
&gt;&gt;&gt; understanding, using and contributing to it are rather small. =
There&#39;s <br>
&gt;&gt;&gt; also the problem of needing multiple versions of the same thin=
g for <br>
&gt;&gt;&gt; different<br>
&gt;&gt;&gt; consumer items, which oe doesn&#39;t easily support. The link =
Robert <br>
&gt;&gt;&gt; provided already exposes some of the pain points with that app=
roach.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I tend to think the best way forward (or least painful at leas=
t) is <br>
&gt;&gt;&gt; to gradually improve what there already is, which is the npm c=
lass<br>
&gt;&gt;&gt; and devtool, and send patches to various upstream njs projects=
 when <br>
&gt;&gt;&gt; they&#39;re using outdated dependencies or otherwise need chan=
ging.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; Just to chime in :-), I like to question this approach of having <=
br>
&gt;&gt; multiple versions of the same in an image.<br>
&gt;&gt; As already outlined npm is horrible in many ways, but using the <b=
r>
&gt;&gt; lockfile approach multiplies that even more.<br>
&gt;&gt; But I tend to agree that using the currently available oe-core cod=
e <br>
&gt;&gt; would be suited best for a broader audience<br>
&gt; <br>
&gt; But this audience loose the some basic features of OE (ex. version and=
 <br>
&gt; CVE check) and have to manual fix or ignore the licenses.<br>
&gt; <br>
&gt;&gt; - in your own layer you simply can do whatever you like.<br>
&gt; <br>
&gt; But this make it impossible to share recipes. Why don&#39;t we create =
a <br>
&gt; meta-nodejs with a different approach to avoid doing the same thing <b=
r>
&gt; multiple times.<br>
<br>
We could, but we have to think about the costs and ways to properly <br>
maintain it - and that seems to be the main reason.<br>
You could come up with a repo of your own and see who is interested in <br>
joining the development (as I for instance did with a repo for ruby <br>
gems) - still this would be hosted and maintained outside of core I <br>
think, due to the limited time and resources available.<br>
<br>
And **most important** the repo has to provide its own means of testing/CI.=
<br>
<br>
BTW I remember I had a talk with someone last year about it and putting <br=
>
a bunch of angular based apps into an image, with all npms as separate <br>
recipes resulted in ~100k of files.<br>
<br>
so CI and testing has to be extra beefy to make it work - which maybe <br>
requires a good portion of automation, which then brings me back to <br>
Alex&#39;s suggestion to provide some patches to devtool, if there is a nee=
d <br>
for that.<br>
<br>
&gt; <br>
&gt;&gt; While personally I think in the long run, every npm dependency has=
 to <br>
&gt;&gt; be provided as a recipe of its own (even I know the costs of that =
<br>
&gt;&gt; pretty well)... esp when CVE checking and basic packaging hygiene =
<br>
&gt;&gt; should be enforced.<br>
&gt; <br>
&gt; Why should OE provide a solution with doesn&#39;t support this? I thin=
k this <br>
&gt; is a main feature of OE.<br>
<br>
It actually does, but having this lockfile based approach, basically <br>
crams up all into a single recipe, which makes it a bit harder to check <br=
>
and whitelist any false positives or n.a. items, as you might have to do <b=
r>
it for more than one recipe - but yeah, the basic CVE checking is part <br>
of core and works as expected<br>
<br>
&gt; <br>
&gt;&gt; Nevertheless for oe-core I wouldn&#39;t want to change a lot right=
 now, as <br>
&gt;&gt; there is simply a valid set of consumers missing that could enable=
 us <br>
&gt;&gt; to do some proper testing. But yeah fixes/improvements for devtool=
 are <br>
&gt;&gt; very welcome (also the available docu might need a touch)<br>
&gt; <br>
&gt; My problem is that the current approach doesn&#39;t support the build =
of an <br>
&gt; express or angular application. Does it makes sense to add this featur=
e <br>
&gt; if we know that some basic OE features are missing (CVE and version <b=
r>
&gt; check) and fixing bugs is a nightmare?<br>
<br>
Just my personal opinion would be, to open up a layer on your own and <br>
let it grow and mature first before getting it in into core - but <br>
patches to devtool are very welcome<br>
&gt; <br>
&gt; Regards<br>
&gt;=C2=A0 =C2=A0 Stefan<br>
</blockquote></div>

--0000000000002667a305cdac0b46--

