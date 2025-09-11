Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EC0CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 13:06:20 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.46255.1757595976927691863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 06:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ry06Xljo;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-323266d6f57so714646a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757595976; x=1758200776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=grw4LHcUHKKB2YNjmS6RSOTjKvRIAw1I20hspI4bX+w=;
        b=Ry06Xljo0QroXurd4pg98NJr89Sm+1qJMoDtU3mf70OUTm8hMO0BRvImOl6lqFTuHL
         6qSMzxbJ1Z8IZuLtmjnFYMjnafTE8hD/ZnImxG70nzEt0xZgNGtsSu3ecrNzpKxwC0xu
         kGcaMRgbpUjesEnL/JHVzmqLH9utDp5JNJJOcbSlQy68wLHzCpUqOznH6uPTlqkL3HAW
         o5GxOFVDk1R9Im18my40hEiJZpXgHXGnDUTVJtfK0vtUv5SwnFgFBvbsp5IwQFn6QhrV
         EUXRhEHcixOWRx612vqrAC1/GzCf02VPV4KMyMkjRuV5ywh6U+ad4Qf1AuRVByod2Mdt
         nuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595976; x=1758200776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grw4LHcUHKKB2YNjmS6RSOTjKvRIAw1I20hspI4bX+w=;
        b=dKm2qbS659Pe6x9Wnv5AoPHKOlGT3LXwuk8faY+q6wMOdj2oH1QjclERW8AmqjdtcN
         1pXL1lrPpLiNELiHXeQEiOEqbvDLHeXe0p84aSZpFOC2kDHgf8zFE9v3N3IDH/2U7XWu
         6cTgTiIHIJEnPqTnral2Yo6QxKp1bkIuqAJ95i5rPCQ+DhKGfYT1B9WKR7GALYhE1uop
         PfYFwaXa49c45KJ2yy8PtzNGRogLWIqZto161oJzub6DE10y+Gzh7BqcJVbOM5ztJ/0F
         X7LQgfAvQfDl1Lda/WrRE/qFqIUz+g9RaLNuXbNUIOA9RllzL2uKZDdEofPM2eB5R3NL
         mT5Q==
X-Gm-Message-State: AOJu0Yw+f2DBuCmFy4+OmjvwOvp0rvZBkSDQ42GxjCnM/XjLk78DWOs1
	2ZYLevt93ytLReYXpQMpGOfKYdgTf7T6zp650yS8KVqHbRSbQN22YCQKtToOCN9jn4JC4Yp7GWR
	m9hFXtY/awcHtKhzlMnUYLC3Ex+uxKWg=
X-Gm-Gg: ASbGncuEmKiCF8+p0N6Vk1tbkwI0QXZGuZV1q2EcKW/qEx4BOJ6bxs/7txNrg/4jt5q
	lDPuIl7wiLsMXuiR5i0httyZ409RJkEHVNi/OwePoQib7b5thumbTHbx5S+V5V8kdGxcFixmC1v
	JGCTIZVY9uRMOYg+QAS+ZY1wCIXVC8YEbxEiCe1gIqS/BhichXkLsut7ciIvPr1p06i719b5EVy
	eMUnopkq+7o1/GbwlCSECJ5DaVKosaILJCTviDs
X-Google-Smtp-Source: AGHT+IGtu9XT6+bh5GqdzFlgH9cHLLqY9GXLL6SuqdtHD4CpFKtij2hHEegn8e77hraxrbnXQK8/wDEb8+dNz5oITpY=
X-Received: by 2002:a17:90b:4f41:b0:32d:d4c8:b64a with SMTP id
 98e67ed59e1d1-32dd4c8bcfcmr2978916a91.6.1757595975515; Thu, 11 Sep 2025
 06:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250910193942.4072450-1-bruce.ashfield@gmail.com> <3c290199cd4437f8dc25d19752c51ebd02cb4ab3.camel@linuxfoundation.org>
In-Reply-To: <3c290199cd4437f8dc25d19752c51ebd02cb4ab3.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Sep 2025 09:06:03 -0400
X-Gm-Features: Ac12FXyB1mHSx3FeAfvzmmpLM4v4ZzTO2i4wZ-4xDxrAX5UZTU67dQa1zTnsED0
Message-ID: <CADkTA4PzSzBTLWt2VWVL9=Ph1Qx0kdHRBT6FTVG-9jqU5M3m6g@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto/6.16: cfg: fix audit warnings
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Scott Murray <scott.murray@konsulko.com>, 
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Content-Type: multipart/alternative; boundary="000000000000c7843c063e863321"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 13:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223277

--000000000000c7843c063e863321
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 7:43=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2025-09-10 at 15:39 -0400, bruce.ashfield@gmail.com wrote:
> > Apply these on top of all my previous patches.
> >
> > They fix the overly agressive DRM options I enabled and address some
> > of the warnings in other configurations that had slipped through.
> >
> > There may still be some issues lurking, but this will definitely
> > improve things.
>
> Thanks, this definitely looks better.
>
> There are still config warnings for meta-agl-core and meta-arm:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2218
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2254
> (copying people)
>

I scanned the AGL one yesterday and removed one of the obsolete
options from the kernel-cache fragments. But the rest of the warnings
come from other places, so I didn't get to tracking down where they are
in the AGL layers. If no-one can do it in the short term, I can have a
look.

The meta-arm one was CONFIG_SCHED_DEBUG, I removed it from
the kernel-cache fragments, but if it is still showing in your build, there
must be another fragment that is adding it from somewhere in the layers.
My same offer exists for meta-arm, I can track it down if no one else has
time.


>
> There is also a reproducibility issue in perf:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2469
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250910-yq6y7z5=
s/packages/diff-html/
>
> I did a bit of digging on that one and sent out a possible patch.
>
> I've merged the current queue of 6.16 patches in since we'd be doing it
> eventually and I decided it would be easier to get people to
> collaborate on the remaining issues with the patches merged.
>
>
Agreed!

Bruce



> Cheers,
>
> Richard
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c7843c063e863321
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 11, 2025 at 7:43=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, 2025-09-10 at 15:39 -04=
00, <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a> wrote:<br>
&gt; Apply these on top of all my previous patches.<br>
&gt; <br>
&gt; They fix the overly agressive DRM options I enabled and address some<b=
r>
&gt; of the warnings in other configurations that had slipped through.<br>
&gt; <br>
&gt; There may still be some issues lurking, but this will definitely<br>
&gt; improve things.<br>
<br>
Thanks, this definitely looks better.<br>
<br>
There are still config warnings for meta-agl-core and meta-arm:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/buil=
ds/2218" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/55/builds/2218</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/buil=
ds/2254" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/75/builds/2254</a><br>
(copying people)<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">I scanned the AGL one yesterday and remove=
d one of the obsolete</div><div class=3D"gmail_default" style=3D"font-size:=
small">options from the kernel-cache fragments. But the rest of the warning=
s</div><div class=3D"gmail_default" style=3D"font-size:small">come from oth=
er places, so I didn&#39;t get to tracking down where they are</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">in the AGL layers. If no-on=
e can do it in the short term, I can have a</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">look.</div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">The meta-arm one was CONFIG_SCHED_DEBUG,=
 I removed it from</div></div><div class=3D"gmail_default" style=3D"font-si=
ze:small">the kernel-cache fragments, but if it is still showing in your bu=
ild, there</div><div class=3D"gmail_default" style=3D"font-size:small">must=
 be another fragment that is adding it from somewhere in the layers.</div><=
div class=3D"gmail_default" style=3D"font-size:small">My same offer exists =
for meta-arm, I can track it down if no one else has</div><div class=3D"gma=
il_default" style=3D"font-size:small">time.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
There is also a reproducibility issue in perf:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/buil=
ds/2469" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/37/builds/2469</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-2025091=
0-yq6y7z5s/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">https:=
//valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250910-yq6y7z5s/packag=
es/diff-html/</a><br>
<br>
I did a bit of digging on that one and sent out a possible patch.<br>
<br>
I&#39;ve merged the current queue of 6.16 patches in since we&#39;d be doin=
g it<br>
eventually and I decided it would be easier to get people to<br>
collaborate on the remaining issues with the patches merged.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Agreed!</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000c7843c063e863321--

