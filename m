Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48B7E7737B
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 17:05:33 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.44835.1696093525091228341
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 10:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEAsdKA8;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35273f62ca3so849155ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696093524; x=1696698324; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TFHZJ0ztD4bZaSRdyfzuGUd6KySxId6M1jfZ04oR6Zc=;
        b=PEAsdKA8LVFyE+ubb9lIz8Vt8DB6qs/1MJdOEXNQEu6XlPSx/Y9OorJ69rJNvmxt1S
         Ryxphb43mLiXYxcY+sX98d/lq4N/OB818O1ZONeOz8XZF7EQ8d0Lh3Me9ERg6BPHyoGb
         UmZdhEDH8F2NvN7gZbPevtD7KKQWeCIIHnWysr3g+Hy5xSlV7Ohdz3KrqKEMJ1AmKdw1
         DWiOE/F1yt3WeBRI2524F+a/7v4aaGs/yHcdC/TNdT+icr9+VF0CU9TL3/CnwnabuAGq
         Ce7UVpXfATSNyJi2Z5/zaG3Dn0a8MeH99HUKo39C1inSpJD22NU4qp9yYa/5SxeZjZDV
         WZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696093524; x=1696698324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFHZJ0ztD4bZaSRdyfzuGUd6KySxId6M1jfZ04oR6Zc=;
        b=qigtAxKxQ65NpQKNuR++3VbsqZKjI3T3lk0Hb+ZD6MeCm3qeXW99rFvOhCMloL33I4
         IcNmburBtaRWfGhitn70beVJ9J+DP4AzXZH9uQ76Af8facN+C4/FIijxkca3+dhZJwms
         slWf0NdQCUwtrs2Awe2peNS5qFIMDsN/jkYD4xgK6gniF5+46ncQNeEfxgATsdSffumG
         DMiN4+qnzsQZ1BYWlvUtd+JeFQbWEe4fD6ELXjNDDv7O/dPGTOs1dL0QdyhWaKsLb6+o
         oTA83A5cfsExa80lUDk+t01ROm6sVQMhROnliuCIX7xhQJrUPPl5uUlKwLGQsXiaqx/X
         BeQA==
X-Gm-Message-State: AOJu0YzJg6eM6ubRn9RAd7/XaEHwq8uGOuPt6It80ZqOCx8lJysiMX+c
	vWUfLnsTDavWaJxpkIUBEFJp6tbyfwbYWoJCulI=
X-Google-Smtp-Source: AGHT+IGSJN2a2U5/85BFtnLYgAol1Xqzi4/pGu3kOxTq1GSp8RHPByba0Z4sx+6WfKA9t4wcqDVjhret05890aKqw9g=
X-Received: by 2002:a05:6e02:1cac:b0:348:c606:bd1a with SMTP id
 x12-20020a056e021cac00b00348c606bd1amr6679593ill.15.1696093524261; Sat, 30
 Sep 2023 10:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
 <fa84ffaabc1616f617555fbf7cc2d46fb2358e51.camel@linuxfoundation.org>
 <CADkTA4PiKOf4=y4buxMQmzZJ3BJHQtUhFSSh8VjuV2_-ETwDsQ@mail.gmail.com> <01a64a17dbecdd2ea0b4364ee8440405fda215ea.camel@linuxfoundation.org>
In-Reply-To: <01a64a17dbecdd2ea0b4364ee8440405fda215ea.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 30 Sep 2023 13:05:14 -0400
Message-ID: <CADkTA4NKEMDrmN7WTa07e=NuDPC0_4W9-KcHmUQAJAhMkpprMg@mail.gmail.com>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000500490606968c68"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 17:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188463

--0000000000000500490606968c68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 12:58=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2023-09-30 at 12:33 -0400, Bruce Ashfield wrote:
> > On Sat, Sep 30, 2023 at 7:07=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >
> > >
> > > I had some difficulties with this series since it doesn't apply
> > > against
> > > master. The issue was that someone else had updated the kernel CVEs
> > > and
> > > those changes weren't in your tree (nor was the btrfs upgrade).
> > > This
> > > meant all the cve inc changes threw errors. We will likely need to
> > > assume someone will update the CVE includes semi regularly just so
> > > we
> > > can keep the noise on the CVE reports down.
> > >
> >
> >
> > That's odd. I always do a pull --rebase before sending my changes,
> > but yet none of them showed up  (on any of my builders, so I had 3x
> > machines running that queue of patches and none of them had the
> > changes from master).
>
> I don't know what happened but you were definitely not on a recent
> master branch as the changes did not apply.
>
> > For the kernel CVEs. They either need to be part of my kernel
> > releases or not. I've updated my scripts, and they'll always be
> > updated as part of the process. Having something / someone else
> > update that file is just a huge pain, and we shouldn't do that.
>
> The question is whether you're able to just update the CVE revisions
> out of cycle with the kernel point release bumps?
>

I mean I could, but that's not something I want to take on. I'm not activel=
y
monitoring the kernel CVEs, and take the fixes as they flow through
-stable and are tested in my sanity. So the only point they matter (to me)
is when a -stable bump proves to be sane enough to send to the list
with bumped SRCREVs.

I'm going to drop the part of my script that updates the CVE file when
I do a release, since the conflicts are such a hassle when I'm working
through my -stable queue. I sometimes need to hold it for a week
(or more) depending on what is broken or what part of the cycle
we are in.

It sounds like there's a better solution down the road, so me dropping
the update of the .inc file won't be an issue for long.

Bruce


>
> With the number of CVEs coming through, the files may need updating a
> little more frequently than we add new kernel point releases.
>
> I know the plan is this "goes away" when the kernel cves repo is worked
> into the cve check workflow so hopefully we don't have this for too
> long.
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000500490606968c68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Sep 30, 2023 at 12:58=E2=80=AFPM Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Sat, 2023-09-30 at 12:33 -0400, Bruce Ashfield wro=
te:<br>
&gt; On Sat, Sep 30, 2023 at 7:07=E2=80=AFAM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; I had some difficulties with this series since it doesn&#39;t app=
ly<br>
&gt; &gt; against<br>
&gt; &gt; master. The issue was that someone else had updated the kernel CV=
Es<br>
&gt; &gt; and<br>
&gt; &gt; those changes weren&#39;t in your tree (nor was the btrfs upgrade=
).<br>
&gt; &gt; This<br>
&gt; &gt; meant all the cve inc changes threw errors. We will likely need t=
o<br>
&gt; &gt; assume someone will update the CVE includes semi regularly just s=
o<br>
&gt; &gt; we<br>
&gt; &gt; can keep the noise on the CVE reports down.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; That&#39;s odd. I always do a pull --rebase before sending my changes,=
<br>
&gt; but yet none of them showed up=C2=A0 (on any of my builders, so I had =
3x<br>
&gt; machines running that queue of patches and none of them had the<br>
&gt; changes from master).<br>
<br>
I don&#39;t know what happened but you were definitely not on a recent<br>
master branch as the changes did not apply.<br>
<br>
&gt; For the kernel CVEs. They either need to be part of my kernel<br>
&gt; releases or not. I&#39;ve updated my scripts, and they&#39;ll always b=
e<br>
&gt; updated as part of the process. Having something / someone else<br>
&gt; update that file is just a huge pain, and we shouldn&#39;t do that.<br=
>
<br>
The question is whether you&#39;re able to just update the CVE revisions<br=
>
out of cycle with the kernel point release bumps?<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">I mean I =
could, but that&#39;s not something I want to take on. I&#39;m not actively=
</div><div class=3D"gmail_default" style=3D"font-size:small">monitoring the=
 kernel CVEs, and take the fixes as they flow through</div><div class=3D"gm=
ail_default" style=3D"font-size:small">-stable and are tested in my sanity.=
 So the only point they matter (to me)</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">is when a -stable bump proves to be sane enough to =
send to the list</div><div class=3D"gmail_default" style=3D"font-size:small=
">with bumped SRCREVs.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I&=
#39;m going to drop the part of my script that updates the CVE file when</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I do a release, s=
ince the conflicts are such a hassle when I&#39;m working</div><div class=
=3D"gmail_default" style=3D"font-size:small">through my -stable queue. I so=
metimes need to hold it for a week</div><div class=3D"gmail_default" style=
=3D"font-size:small">(or more) depending on what is broken or what part of =
the cycle</div><div class=3D"gmail_default" style=3D"font-size:small">we ar=
e in.</div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">It sounds like there&#39;s a better solution down the road, so me dro=
pping</div><div class=3D"gmail_default" style=3D"font-size:small">the updat=
e of the .inc file won&#39;t be an issue for long.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Bruce</div></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
With the number of CVEs coming through, the files may need updating a<br>
little more frequently than we add new kernel point releases.<br>
<br>
I know the plan is this &quot;goes away&quot; when the kernel cves repo is =
worked<br>
into the cve check workflow so hopefully we don&#39;t have this for too<br>
long.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000000500490606968c68--

