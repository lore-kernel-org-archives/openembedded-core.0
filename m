Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2147C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 17:00:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.383.1657731651141929924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 10:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PHffFOgN;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id t25so20083730lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 10:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/L37qenCOwekfcFTyMF0Zy6jDfwknrd5+sb1sktBBW0=;
        b=PHffFOgN47u24mYEOSvte/Mz8gfUK0R1ArxNfUFw7B1TY9rWSogi8TL1exqufHENZd
         2NyAUVaesBdCunAnBAAhqZHT1tmxHOPiGercAPgnT/OvNGThb30Qnk5/sknsIhuGVDp+
         ZZjyzd0PgE6OhPT9zEQhDCJ+k7YltqbUjdIx55tcd9BjI+zmUXCfr9YqgjLqjRTuslmI
         I03zDpRXjr0psKxZ3zsm0ZkLcmwV7t0gjKV2sMYImqjhMdAWqav76Lt/l+H50wr6Dren
         4U10mhG5dN3Meeu5VIYFEfvQcObqKzksvp+y3NdVVk7t0+dYg3Bn46u3GgEpNUEFo7nL
         nX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/L37qenCOwekfcFTyMF0Zy6jDfwknrd5+sb1sktBBW0=;
        b=6BzW8OT4Vm2ORuICTVgdZicSBh9dLspdV0WZrNLZo6FUaev5r4XZBrpJn2HiUSStn8
         6cKx2qw1iB+c7ejT9YOnvLoC9fP68gUVC7WCE5UYCZg0Fl1bWhusf+X1zj6mu8djsott
         iIftNDR7rYZfRi82/dAekiswg5gqSpTfDPJcebiMJkXYeP0tE3HM58i6Z7p7yS9gckCv
         Owg8uVOJsGBpeBqoH7VF1fuCTM2ZSi2JzpayBZRtIIz61ejWCa2QtuWQZQr1/akbX/0o
         mCUb+OwbCgXmnjkob9a9o/X9r8y/kTpcJ4gmQOTv1+XiZYigjLMSlG4ZRUMPstAH4HF5
         kOAg==
X-Gm-Message-State: AJIora8V0uirEflpkNJC1tinmJY1EJWESdrVHHs2Vo3cVzBWydgO5W6K
	4urMQ1SbMyziMGpR096ftRMRXgugEL+1y+Ikboc=
X-Google-Smtp-Source: 
 AGRyM1vqwE3sCiqNuK5qKqeRZVjOXwJOvogjGvHsn3ibw6FL3oB8qVHGGLqbFxi0r9r4Wzmd+4nRroVQDVPFrA5oLh4=
X-Received: by 2002:a05:6512:3403:b0:481:60ae:7ebc with SMTP id
 i3-20020a056512340300b0048160ae7ebcmr2665310lfr.358.1657731649138; Wed, 13
 Jul 2022 10:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
 <d4dd373c6d1718f6fd417c8484a057268df6d495.camel@linuxfoundation.org>
 <CAMw=ZnQxrxMS_B-5RYp+krab8s6yR+5ny_q1_ioaL=W-u68XdQ@mail.gmail.com>
 <9f596d5368294084433399218427fb0d14031fd1.camel@linuxfoundation.org>
 <CAMw=ZnQ6htXa4+_dbZK5aL+e8k+SX0L8zddJJ2cOVZAs4oWaDA@mail.gmail.com>
In-Reply-To: 
 <CAMw=ZnQ6htXa4+_dbZK5aL+e8k+SX0L8zddJJ2cOVZAs4oWaDA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Jul 2022 20:00:38 +0300
Message-ID: 
 <CANNYZj-y17+0Xuqztp9F=fqto+CQvikQgdNRLacjmxajACBbUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@microsoft.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000014738905e3b2bae5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 17:00:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167978

--00000000000014738905e3b2bae5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s been in the news that lennart has left red hat and moved to Mi=
crosoft
recently and will continue with systemd there. Which is rather worrying, as
Microsoft by and large is only interested In linux on azure or wsl.

I can help iron out the issues once we have a list.

Alex

On Wed 13. Jul 2022 at 18.52, Luca Bocassi <luca.boccassi@gmail.com> wrote:

> On Wed, 13 Jul 2022 at 14:19, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2022-07-13 at 00:30 +0100, Luca Boccassi wrote:
> > > On Tue, 12 Jul 2022 at 22:55, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > The configuration is yocto-autobuilder-helper but the best place to
> > > > start is probably the poky-altcfg distro config.
> > > >
> > > > Once we change that we'll have to run through the testing, see how
> much
> > > > breaks and then find someone to try and fix any issues if/as needed=
.
> > > > There is a lot of work just in pulling things together for testing
> and
> > > > triaging the result and I'm depressed it will probably end up on my
> > > > plate when I personally disagree with the decision.
> > >
> > > We've been running this configuration internally for ~3 years in our
> > > Yocto downstream, never seen any issue, not even at the beginning, it
> > > just worked.
> > > Nowadays most major distros have switched over, Gentoo's the other on=
e
> > > left but it's planned for this year.
> > > Any issues in upstream softwares should have been fixed years ago whe=
n
> > > Fedora started the process.
> > > So hopefully it shouldn't be too bad?
> >
> > My worry is the QA framework and tests likely haven't been used with
> > it. It may be fine or it may not. I do know how much of my time this
> > stuff takes up with other issues.
>
> I have sent v2 with the poky-altcfg configuration change.
>
> > > > I was asked earlier today if we should just make the systemd includ=
e
> > > > files force usrmerge on. The challenge is that OE/YP give users
> choice
> > > > to configure their system how they wish, we don't just force
> > > > configurations upon them. Or only real option is therefore to throw
> > > > errors and have them decide what to do (which basically amounts to
> > > > submitting to the upstream decision).
> > > >
> > > > > Also is a deprecation notification needed? How is it handled
> usually?
> > > >
> > > > Do we have time for such a notification or are we in the situation
> > > > where we just throw errors to the user and let them agree to the
> > > > usrmerge change? The timescale is unclear but if the systems are
> > > > already throwing deprecation warnings at runtime, this isn't a good
> > > > experience for our users.
> > >
> > > It's not urgent. But the build-time warning has been in place for a
> > > couple of years now, you should have already seen it.
> >
> > I haven't :(.
> >
> > > The runtime is a taint flag in 'systemctl status', and was introduced
> > > in the most recent release.
> > > There is no timeline as of now for dropping legacy compat code and
> > > configuration, as the runtime taint was just added.
> > > Certainly won't be this year. I've been doing the rounds ensuring
> > > everyone who hasn't switched already is aware with plenty of time to
> > > spare.
> >
> > Well, it is good to have the warning, thanks.
> >
> > >
> > > > > Aside from process details, I assume there's no problem with doin=
g
> the
> > > > > change in principle?
> > > >
> > > > There is, but it appears a done deal which we just have to accept s=
o
> > > > I'm trying not to start a discussion which I don't think can go
> > > > anywhere productive. If this isn't a done deal, then let me know as
> > > > that would be different.
> > >
> > > It is a done deal as far as we are concerned upstream, matter of
> > > 'when' not 'if'.
> >
> > This is not going to help systemd's reputation. Basically, we have to
> > do what Fedora does and look as we're told to, which does go against
> > our configurability objective. We already have tensions around musl and
> > this will further demonstrate our direction and systemd's are not
> > aligned. I do understand why systemd is doing what it is doing and that
> > it really doesn't care about our use cases. That doesn't stop some
> > users wanting it (but also wanting other things we have like musl).
>
> Well, it's not just Fedora nowadays, it's Fedora, RHEL, CentOS, Alma,
> Rocky, SUSE, Archlinux, Debian, Ubuntu, Mint, PopOS, Endless,
> OpenMandriva, Mariner... and Gentoo is planning it. There's probably
> more, those are the ones I know off the top of my head. Whether to do
> this change or not was discussed at length almost ten years ago. We
> can't keep reopening the same things again and again, it's discussed
> once (or twice...) and then the decision is documented and slowly
> implemented, like any other project does. Every project has breaking
> changes every now and then, Yocto included. We're doing our best to
> document and notify and spread the word, and sending patches too in
> some cases.
>
> Kind regards,
> Luca Boccassi
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167961):
> https://lists.openembedded.org/g/openembedded-core/message/167961
> Mute This Topic: https://lists.openembedded.org/mt/92319509/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000014738905e3b2bae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It=E2=80=99s been in the news that lennart has left red h=
at and moved to Microsoft recently and will continue with systemd there. Wh=
ich is rather worrying, as Microsoft by and large is only interested In lin=
ux on azure or wsl.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I ca=
n help iron out the issues once we have a list.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed 13. Jul 2022 at 18.52, Luca Bocassi=
 &lt;<a href=3D"mailto:luca.boccassi@gmail.com">luca.boccassi@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)" dir=3D"auto">On Wed, 13 Jul 2022 at 1=
4:19, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 2022-07-13 at 00:30 +0100, Luca Boccassi wrote:<br>
&gt; &gt; On Tue, 12 Jul 2022 at 22:55, Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; The configuration is yocto-autobuilder-helper but the best p=
lace to<br>
&gt; &gt; &gt; start is probably the poky-altcfg distro config.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Once we change that we&#39;ll have to run through the testin=
g, see how much<br>
&gt; &gt; &gt; breaks and then find someone to try and fix any issues if/as=
 needed.<br>
&gt; &gt; &gt; There is a lot of work just in pulling things together for t=
esting and<br>
&gt; &gt; &gt; triaging the result and I&#39;m depressed it will probably e=
nd up on my<br>
&gt; &gt; &gt; plate when I personally disagree with the decision.<br>
&gt; &gt;<br>
&gt; &gt; We&#39;ve been running this configuration internally for ~3 years=
 in our<br>
&gt; &gt; Yocto downstream, never seen any issue, not even at the beginning=
, it<br>
&gt; &gt; just worked.<br>
&gt; &gt; Nowadays most major distros have switched over, Gentoo&#39;s the =
other one<br>
&gt; &gt; left but it&#39;s planned for this year.<br>
&gt; &gt; Any issues in upstream softwares should have been fixed years ago=
 when<br>
&gt; &gt; Fedora started the process.<br>
&gt; &gt; So hopefully it shouldn&#39;t be too bad?<br>
&gt;<br>
&gt; My worry is the QA framework and tests likely haven&#39;t been used wi=
th<br>
&gt; it. It may be fine or it may not. I do know how much of my time this<b=
r>
&gt; stuff takes up with other issues.<br>
<br>
I have sent v2 with the poky-altcfg configuration change.<br>
<br>
&gt; &gt; &gt; I was asked earlier today if we should just make the systemd=
 include<br>
&gt; &gt; &gt; files force usrmerge on. The challenge is that OE/YP give us=
ers choice<br>
&gt; &gt; &gt; to configure their system how they wish, we don&#39;t just f=
orce<br>
&gt; &gt; &gt; configurations upon them. Or only real option is therefore t=
o throw<br>
&gt; &gt; &gt; errors and have them decide what to do (which basically amou=
nts to<br>
&gt; &gt; &gt; submitting to the upstream decision).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Also is a deprecation notification needed? How is it ha=
ndled usually?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Do we have time for such a notification or are we in the sit=
uation<br>
&gt; &gt; &gt; where we just throw errors to the user and let them agree to=
 the<br>
&gt; &gt; &gt; usrmerge change? The timescale is unclear but if the systems=
 are<br>
&gt; &gt; &gt; already throwing deprecation warnings at runtime, this isn&#=
39;t a good<br>
&gt; &gt; &gt; experience for our users.<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s not urgent. But the build-time warning has been in place=
 for a<br>
&gt; &gt; couple of years now, you should have already seen it.<br>
&gt;<br>
&gt; I haven&#39;t :(.<br>
&gt;<br>
&gt; &gt; The runtime is a taint flag in &#39;systemctl status&#39;, and wa=
s introduced<br>
&gt; &gt; in the most recent release.<br>
&gt; &gt; There is no timeline as of now for dropping legacy compat code an=
d<br>
&gt; &gt; configuration, as the runtime taint was just added.<br>
&gt; &gt; Certainly won&#39;t be this year. I&#39;ve been doing the rounds =
ensuring<br>
&gt; &gt; everyone who hasn&#39;t switched already is aware with plenty of =
time to<br>
&gt; &gt; spare.<br>
&gt;<br>
&gt; Well, it is good to have the warning, thanks.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; Aside from process details, I assume there&#39;s no pro=
blem with doing the<br>
&gt; &gt; &gt; &gt; change in principle?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There is, but it appears a done deal which we just have to a=
ccept so<br>
&gt; &gt; &gt; I&#39;m trying not to start a discussion which I don&#39;t t=
hink can go<br>
&gt; &gt; &gt; anywhere productive. If this isn&#39;t a done deal, then let=
 me know as<br>
&gt; &gt; &gt; that would be different.<br>
&gt; &gt;<br>
&gt; &gt; It is a done deal as far as we are concerned upstream, matter of<=
br>
&gt; &gt; &#39;when&#39; not &#39;if&#39;.<br>
&gt;<br>
&gt; This is not going to help systemd&#39;s reputation. Basically, we have=
 to<br>
&gt; do what Fedora does and look as we&#39;re told to, which does go again=
st<br>
&gt; our configurability objective. We already have tensions around musl an=
d<br>
&gt; this will further demonstrate our direction and systemd&#39;s are not<=
br>
&gt; aligned. I do understand why systemd is doing what it is doing and tha=
t<br>
&gt; it really doesn&#39;t care about our use cases. That doesn&#39;t stop =
some<br>
&gt; users wanting it (but also wanting other things we have like musl).<br=
>
<br>
Well, it&#39;s not just Fedora nowadays, it&#39;s Fedora, RHEL, CentOS, Alm=
a,<br>
Rocky, SUSE, Archlinux, Debian, Ubuntu, Mint, PopOS, Endless,<br>
OpenMandriva, Mariner... and Gentoo is planning it. There&#39;s probably<br=
>
more, those are the ones I know off the top of my head. Whether to do<br>
this change or not was discussed at length almost ten years ago. We<br>
can&#39;t keep reopening the same things again and again, it&#39;s discusse=
d<br>
once (or twice...) and then the decision is documented and slowly<br>
implemented, like any other project does. Every project has breaking<br>
changes every now and then, Yocto included. We&#39;re doing our best to<br>
document and notify and spread the word, and sending patches too in<br>
some cases.<br>
<br>
Kind regards,<br>
Luca Boccassi<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167961): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167961" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167961</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92319509/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92319509/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000014738905e3b2bae5--

