Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C22AC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 14:55:21 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.10715.1654354512190746972
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 07:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dT70rijR;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id i19so7470300qvu.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q018CsMzDc6kPGy2lxbGkHkGkwIh7BfXEOr1gV8hr+w=;
        b=dT70rijRRPHDZlNEzRJdlda9fwJfs8BrCICBREnPvUmy0V2bhLUfu1PDFYT1KS9+AM
         pPEd6AO6RSSEbIBPcR0lWYKBQjyJgXsKKjumjxu5xJkT3Xz1noTjme3v893NANkEcfql
         EBM0IsvxlQu8pjHnAhA/uGAllEYLtAcPT3NCLh+fNpMpo1zQcg52TXGHPEoAvBcsdW9d
         l1Wdkyo4d5uUxqjT74ldSiort+dFz9veoUrDMolUFPHr3qK9gJwNAAba5hLvZc2UU4Y7
         tWrm7kPlsxcl+jX+7n8KYgsxXNo3yZKvuxUNFj7jce9LuL1YGvhXHgdsFhDI6wto/S57
         jXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q018CsMzDc6kPGy2lxbGkHkGkwIh7BfXEOr1gV8hr+w=;
        b=IA4xElLptye1rISw9pJ7pxq10RFw6QsWJ+fHLtJaLMvp+3P1BafK+5EM3+nTk4N+eg
         7Xa2gsLzWoaXBFZ0QfET3jkkSBrCXnfH0ntKtWSP+MbuupdmIokyrR7vBV9dVGrAO/hG
         K/0UDfbDckocPGCl1IoiOZbAd9uGTUpxHJsFUZNbyaMwSNx+FWGNT0qavIdH2Iwn3icd
         6tM/W7Yfm5WTPh8nFPXRJ2AHk0d7f+sJn+MK3gsol7gC/bnAvE+rKGHinZx2S9nFHPRN
         kQv9HVVdKPF+emyxmsHColjjbjq0EYFlIYaDM/UZe/Kfcx6XWCc4iPCOXUw9zZ3uCbLA
         KeXA==
X-Gm-Message-State: AOAM533l5sZM7t6iEqJxoita7EF29FY2U/f0kN7RhERVX3kdOnFw8FB6
	wP+aoplxx8aRRx0qdxXbNk3p+YAZmlMY2JIUFls=
X-Google-Smtp-Source: 
 ABdhPJy6eXYc4R7y+OEiJ9/4Xd3zHNVnD3KTf7QGmhAFzUXEkY5I8NAqog8EC9inZ/r/075iiNefXvvyPnpYNUEeyM0=
X-Received: by 2002:ad4:5bad:0:b0:466:1bb3:c1ce with SMTP id
 13-20020ad45bad000000b004661bb3c1cemr13019428qvq.63.1654354511150; Sat, 04
 Jun 2022 07:55:11 -0700 (PDT)
MIME-Version: 1.0
References: 
 <8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
 <16F56B1475C84995.11448@lists.yoctoproject.org>
 <061c22b495d0d2b5830332c5258c82ee30aa67fa.camel@linuxfoundation.org>
In-Reply-To: 
 <061c22b495d0d2b5830332c5258c82ee30aa67fa.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Jun 2022 07:55:00 -0700
Message-ID: 
 <CAMKF1sr+1oX4KbvHEUMnifKOEdjzbWiJPOThOwnLoeYrK9QS0g@mail.gmail.com>
Subject: Re: [swat] [OE-core] perl makefile race - any make experts who can
 help?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
 swat@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f8443005e0a06cb0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 14:55:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166569

--000000000000f8443005e0a06cb0
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 4, 2022 at 6:23 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2022-06-04 at 13:36 +0100, Richard Purdie via
> lists.yoctoproject.org wrote:
> > On Sat, 2022-06-04 at 13:51 +0200, Alexander Kanavin wrote:
> > > Here's something I didn't think of before. Has this occurred anywhere
> > > else except Ubuntu 18.04?
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14096
> >
> > I'm struggling to get the data out from the old builds, one mentions
> > ubuntu1604, there is an ubuntu1804 on both x86 and arm hosts.
> >
> > It is possible this is an ubuntu specific make issue or a make bug.
>
> Ubuntu 18.04 uses make 4.1 which is old (Oct 2014).
>
> I noticed these patches from 2016:
>
>
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=9bb994e8319c2b153cd3d6d61e2c2882895e7c3a
>
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=4762480ae9cb8df4878286411f178d32db14eff0
>
> I think we may want to mandate a modern make for both this class of
> issues and also perhaps for better loadavg support to keep load under
> control on the autobuilders.
>
> I'm torn, on the one hand we need to test the distros people use, on
> the other we do need to remove sources of intermittent issues. I think
> this bug must be some issue with make itself.
>
> Adding a make-native dependency to perl would "hurt" people on modern
> distros...


Make perhaps does not have many complex dependency needs so it might not be
as bad

Second option is to mandate buildtools on this distro
And add make to tarball

>
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166567):
> https://lists.openembedded.org/g/openembedded-core/message/166567
> Mute This Topic: https://lists.openembedded.org/mt/91540379/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f8443005e0a06cb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jun 4, 2022 at 6:23 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, 2022-=
06-04 at 13:36 +0100, Richard Purdie via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> wrote:<br>
&gt; On Sat, 2022-06-04 at 13:51 +0200, Alexander Kanavin wrote:<br>
&gt; &gt; Here&#39;s something I didn&#39;t think of before. Has this occur=
red anywhere<br>
&gt; &gt; else except Ubuntu 18.04?<br>
&gt; <br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D14096</a><br>
&gt; <br>
&gt; I&#39;m struggling to get the data out from the old builds, one mentio=
ns<br>
&gt; ubuntu1604, there is an ubuntu1804 on both x86 and arm hosts.<br>
&gt; <br>
&gt; It is possible this is an ubuntu specific make issue or a make bug.<br=
>
<br>
Ubuntu 18.04 uses make 4.1 which is old (Oct 2014).<br>
<br>
I noticed these patches from 2016:<br>
<br>
<a href=3D"https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D9bb994e8=
319c2b153cd3d6d61e2c2882895e7c3a" rel=3D"noreferrer" target=3D"_blank">http=
s://git.savannah.gnu.org/cgit/make.git/commit/?id=3D9bb994e8319c2b153cd3d6d=
61e2c2882895e7c3a</a><br>
<a href=3D"https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D4762480a=
e9cb8df4878286411f178d32db14eff0" rel=3D"noreferrer" target=3D"_blank">http=
s://git.savannah.gnu.org/cgit/make.git/commit/?id=3D4762480ae9cb8df48782864=
11f178d32db14eff0</a><br>
<br>
I think we may want to mandate a modern make for both this class of<br>
issues and also perhaps for better loadavg support to keep load under<br>
control on the autobuilders.<br>
<br>
I&#39;m torn, on the one hand we need to test the distros people use, on<br=
>
the other we do need to remove sources of intermittent issues. I think<br>
this bug must be some issue with make itself.<br>
<br>
Adding a make-native dependency to perl would &quot;hurt&quot; people on mo=
dern<br>
distros...</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Make p=
erhaps does not have many complex dependency needs so it might not be as ba=
d=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Second option is=
 to mandate buildtools on this distro=C2=A0</div><div dir=3D"auto">And add =
make to tarball=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166567): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166567" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166567</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91540379/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91540379/1997914</a><br>
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

--000000000000f8443005e0a06cb0--

