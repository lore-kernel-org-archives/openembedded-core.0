Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E377FC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 05:31:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.829.1698816678149982850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 22:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0KL7d2y;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so47645151fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698816676; x=1699421476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3oEFzkXusTuUfNmJhD+u8t+70V+G+E6cD6xUeAANGrk=;
        b=U0KL7d2yYcB5lzowotiPIIemZJXNk93k+uIDwvWNJC6YU/O83Y4t507Bi7nDIBUocg
         EhF+BAKTIMwmKu5md6cxzAUMn8R06kGRHuoy2ID47cD278iHRLjwCVYKL62MvFJ7LAAw
         LvWmIDLK1sOF9pu8JcrwWnx6n0qqDFwNsjDoEf2i/ObUurnoJRYLrMPWx9z5SLYUl0uf
         +hzeUIijNLEvM6tYU8k/s16XxQ5D/nIVB/7p0+LAC4JZU/UKKEi7NffRuRqqruhwVq4I
         DTKZC8CjQlic36TJ31CZjF+R4BnCmdoEHUx2fAflsBXPFqZeNIMfpGG7R3HxIMkSf56X
         /CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698816676; x=1699421476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oEFzkXusTuUfNmJhD+u8t+70V+G+E6cD6xUeAANGrk=;
        b=mSCHb6c7I4V92CPJoUii4SHQvk6zq574heaZgsyHBPPtzLX/lugRUUORXJSHfRKGIt
         C+MB29LwmHcj3qpa6dToyB7ZZMJPkG2Se4NjRBAY+FPR6yhUFh0jCUbLjVxRwiW3wf1V
         1aCA/eZk0zZHo3fPJsCgMCQweVN0ViMj93QEowVrZJ64Iqkdu+tlcePjWXf0mXhrBu16
         NCjDAuvutF2XOJ0wwJaM0WJrhph3GZa4gpJveDbrxWur9zK/HGy9cDsMESacH1PHnhUB
         g/ROtvrZaOJUxPSac5RxqqUF1+XlqFZi52e/rU9YYVJX5qUidovDTDwa3CIR904OOJY4
         p5OA==
X-Gm-Message-State: AOJu0YybEZT5k9bD4muHpHv2Ml87Mo+ZPnFJzmJtKuo953mXVi5RTtcS
	8wIfSkRMtTHfvqy29IQ8rdhBbcHUKFWS0okSBgg=
X-Google-Smtp-Source: AGHT+IHCdwxq8RalAaBTvB6bT+hw3fxct/mqXp5Bfpl9SGz1JY52J2S8BxG92F3F3KsyXxKVREYYGa43UUP9pc0mgck=
X-Received: by 2002:a2e:97ca:0:b0:2c5:234c:86f2 with SMTP id
 m10-20020a2e97ca000000b002c5234c86f2mr10632480ljj.13.1698816675909; Tue, 31
 Oct 2023 22:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
 <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
 <CANx9H-CCaTwnVc+KW+sAUJjMutNtNw-T0Rybpdw1kM7o+_qMzg@mail.gmail.com> <8c789be17c092ff433b7b4499388f957c32663ef.camel@intel.com>
In-Reply-To: <8c789be17c092ff433b7b4499388f957c32663ef.camel@intel.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 1 Nov 2023 06:31:03 +0100
Message-ID: <CAApg2=SuPopzhjLJgC1oy3e42xEci+1_h2scS-mkT+8EsQCjHg@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
To: Anuj Mittal <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>
Cc: Tim Orling <ticotimo@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000819446060910948e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 05:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189896

--000000000000819446060910948e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Nov 2023, 11:48 Anuj Mittal, <anuj.mittal@intel.com> wrote:

> On Tue, 2023-10-31 at 19:33 -0700, Tim Orling wrote:
> >
> >
> > On Tue, Oct 31, 2023 at 7:26=E2=80=AFPM Anuj Mittal <anuj.mittal@intel.=
com>
> > wrote:
> > > On Tue, 2023-10-31 at 14:20 +0000, Trevor Gamblin wrote:
> > > > Thank you for your submission. Patchtest identified one
> > > > or more issues with the patch. Please see the log below for
> > > > more information:
> > > >
> > > > ---
> > > > Testing patch /home/patchtest/share/mboxes/patchtest-shorten-
> > > > test-
> > > > result-outputs.patch
> > > >
> > > > FAIL: test CVE presence in commit message: A CVE tag should be
> > > > provided in the commit message with format: "CVE: CVE-YYYY-XXXX"
> > > > (test_mbox.TestMbox.test_cve_presence_in_commit_message)
> > >
> > > Is this a requirement to have this in commit message in this
> > > format? I
> > > don't think this was being followed until now. A lot of patches
> > > seem to
> > > be failing this test as a result.
> > >
> >
> >
> > This was required when patchtest was running previously. It has been
> > ignored for a while now, but that does not mean we should not enforce
> > it. It should be documented as required.
> >
> > The tags allow for machines to parse the relevant info. Anything else
> > is purely random and chaos.
>
> The tag is already required to be present in the CVE patch itself which
> is/can be parsed by scripts which actually I think is a better way of
> detecting whether a CVE is patched rather than looking at commit
> messages.
>
> If having it in a specific format in commit message as well helps,
> sure. It shouldn't take time to add it but we seem to be adding too
> many rules ...
>
>
(adding Steve)

I agree with Anuj, and I do not remember seeing a rule to put the
CVE number in the commit message. We already have it in the
patch file name (recommended) and inside the patch file itself.
Those two places are enough in my opinion. In fact, it will likely
be there in the commit message (its title), so repeating it does
not make much logical sense.

In fact, I have an update of the manual with more detailed information
on submitting CVE fixes and looking for a resolution of this question
to submit it :)

Steve, does such additional tag in the commit message make it
easier for you?

Kind regards,
Marta

--000000000000819446060910948e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"auto"><div><br><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 =
Nov 2023, 11:48 Anuj Mittal, &lt;<a href=3D"mailto:anuj.mittal@intel.com" t=
arget=3D"_blank">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, 2023-10-31 at 19:33 -0700, Ti=
m Orling wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Oct 31, 2023 at 7:26=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mai=
lto:anuj.mittal@intel.com" rel=3D"noreferrer" target=3D"_blank">anuj.mittal=
@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Tue, 2023-10-31 at 14:20 +0000, Trevor Gamblin wrote:<br>
&gt; &gt; &gt; Thank you for your submission. Patchtest identified one<br>
&gt; &gt; &gt; or more issues with the patch. Please see the log below for<=
br>
&gt; &gt; &gt; more information:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; Testing patch /home/patchtest/share/mboxes/patchtest-shorten=
-<br>
&gt; &gt; &gt; test-<br>
&gt; &gt; &gt; result-outputs.patch<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; FAIL: test CVE presence in commit message: A CVE tag should =
be<br>
&gt; &gt; &gt; provided in the commit message with format: &quot;CVE: CVE-Y=
YYY-XXXX&quot;<br>
&gt; &gt; &gt; (test_mbox.TestMbox.test_cve_presence_in_commit_message)<br>
&gt; &gt; <br>
&gt; &gt; Is this a requirement to have this in commit message in this<br>
&gt; &gt; format? I<br>
&gt; &gt; don&#39;t think this was being followed until now. A lot of patch=
es<br>
&gt; &gt; seem to<br>
&gt; &gt; be failing this test as a result.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; This was required when patchtest was running previously. It has been<b=
r>
&gt; ignored for a while now, but that does not mean we should not enforce<=
br>
&gt; it. It should be documented as required.<br>
&gt; <br>
&gt; The tags allow for machines to parse the relevant info. Anything else<=
br>
&gt; is purely random and chaos.<br>
<br>
The tag is already required to be present in the CVE patch itself which<br>
is/can be parsed by scripts which actually I think is a better way of<br>
detecting whether a CVE is patched rather than looking at commit<br>
messages.<br>
<br>
If having it in a specific format in commit message as well helps,<br>
sure. It shouldn&#39;t take time to add it but we seem to be adding too<br>
many rules ...<br>
<br></blockquote><div><br></div><div>(adding Steve)<br></div><div><br></div=
><div>I agree with Anuj, and I do not remember seeing a rule to put the</di=
v><div>CVE number in the commit message. We already have it in the</div><di=
v>patch file name (recommended) and inside the patch file itself.</div><div=
>Those two places are enough in my opinion. In fact, it will likely</div><d=
iv>be there in the commit message (its title), so repeating it does</div><d=
iv>not make much logical sense.</div><div><br></div><div>In fact, I have an=
 update of the manual with more detailed information</div><div>on submittin=
g CVE fixes and looking for a resolution of this question</div><div>to <spa=
n class=3D"ng" style=3D"background:none!important">submit it</span> :)</div=
><div><br></div><div>Steve, does <span class=3D"ng" style=3D"background:non=
e!important">such additional</span> tag in the commit message make it</div>=
<div>easier for you?<br></div><div><br></div><div>Kind regards,</div><div>M=
arta<br></div><div>=C2=A0</div></div></div></div>
</div>

--000000000000819446060910948e--

