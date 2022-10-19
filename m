Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA15C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 16:06:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.9896.1666195562018033900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 09:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O24r2WEW;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so336916wmq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 09:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sUAnQ8Y5nAhP20ZIwEcPpMfFJqS4jckzfKX+L6FcONA=;
        b=O24r2WEWClMqORcAsZrpUAkhW1Jbb4zB8lso1sykShf9AsGumLGGP/0ovhdJafoSds
         DYN8EmhHGicEhygwBm0BSVOytR+hfHTd5nwfxSJRLPbIAj6PB8gGxR1j8JC4/WGhDlrj
         FOeQhoLtj9T1c/33ibA45BUvNi2BgXv+f+ifeEVUMLo38FPTJaI3BmaDhy/0lV/dFjPX
         15wTai6onr5Ih1o2Ad6ONT0ZgnK5bCI2NrhB40JdGdy5S8y5CpAeS8zWNZ7PCQyZbj39
         738ti9eM+PhHdt8IEeO6gNjiGWQBJe6geHOiwLFZl/j/PLDTRTCrSOEbIM2coTqES++9
         /Lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUAnQ8Y5nAhP20ZIwEcPpMfFJqS4jckzfKX+L6FcONA=;
        b=eknxOpUb8lnueVW1wNrDUSX9Qrtk+sEzSnLfKbSvaZ9yFYTOQ7tEF1Jlzemk6/ynIu
         UsIEsQG86jTtmUkpEQsn+hZXHQwFMGYF1Hk9S1cygwMvs2E+Yygzzxy49g5ZhaTWC36T
         rrR1yfmaALZGgEds+ClU/+fjAXhyhLiwOxJQS6x/Z6L7+uvavWAlTS1yflfU3pQT+dkW
         dybkRRaIyl3GwvqqalsPQS7UauAUsFFRXn5yA/DoufuB1gfQBkS17+qD2aE1oYUj0hG4
         ee1+pwIZH0UoLoUTcJ4Vn54ynwpStmNnWqmEiNaoIqCP2T7BaPWYdshCf+90iF3XxA+H
         pr9w==
X-Gm-Message-State: ACrzQf38CtucafEcGG8a4ECwr9MQTZiOVghAWHZcqAHfwWgOOAbWge90
	QjCVZ8m6nSf5upcHwvsnFBjAk7VMPq1F4JygYaA=
X-Google-Smtp-Source: AMsMyM5+Q9pDEoxMwNqAwm2h1Rscx0xkczUxW80v/tALPNBwWi9drGPh2rFIeJiTTWNh1iiRB04HuEUGnYqdZhGSDnQ=
X-Received: by 2002:a05:600c:474a:b0:3c7:6df:4493 with SMTP id
 w10-20020a05600c474a00b003c706df4493mr2521603wmo.44.1666195560178; Wed, 19
 Oct 2022 09:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com> <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
In-Reply-To: <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Oct 2022 18:05:43 +0200
Message-ID: <CA+chaQczkyOjc5HvcByjkn69mFR5MSGefOfTkMmH4kwqso6qNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Ross Burton <ross.burton@arm.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Kai Kang <kai.kang@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007db0bf05eb6562fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 16:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171974

--0000000000007db0bf05eb6562fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 5:29 PM Ross Burton <ross.burton@arm.com> wrote:

> On 19 Oct 2022, at 07:34, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >>
> >> Can you show examples where this is needed? Custom variable does not
> seem a good idea. I also worry that it=E2=80=99ll break automated updates=
 (it=E2=80=99s bad
> enough with mesa-gl, this might make it worse).
> >
> >
> https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mesa/=
mesa_git.bb
>
> That is, well, horrible.
>
> *If* we=E2=80=99re going to expose a mesa.inc that people outside of core=
 can use
> to package up their own random Mesa SHA then mesa.inc should just be the
> packaging logic.
>

Well I've seen many mesa/pulseaudio recipes which were using
mesa.inc/pulseaudio.inc and even when they were a bit terrible, then it was
still better than duplicating all of it. e.g.
https://github.com/webOS-ports/meta-pine64-luneos/commits/8946d3e2350ae83fb=
b001ba640db59b207341481/recipes-graphics/mesa/mesa_%25.bbappend
https://github.com/shr-project/meta-webosose/commits/master/meta-webos/reci=
pes-multimedia/pulseaudio

And better than some other recipes which start with "require
recipes-foo/foos/foo_1.0.bb" and then set PV to 2.0 and do few other
changes.

I never expected .inc file to be _required_ wide range of possible
versions, people who re-use it to build older or newer version need to deal
with possible incompatibilities in their layer even if it sometimes might
require whole .inc file to be imported into their layer, when the benefit
of reusing it is much smaller than required modifications (e.g. when
pulseaudio in oe-core was upgraded to use meson while our old version was
still built with autotools or even this small change, but in :prepend
https://git.openembedded.org/openembedded-core/commit/?id=3De5399a09bf44700=
f97607b283379172dac0cf9c7
.


>
> However, I don=E2=80=99t understand something about the patch.
>
> Why do we only need to apply it on native builds?  It=E2=80=99s a backpor=
t from
> upstream, so should be the fix.  If it breaks when applied to target
> builds, is there a bug upstream for that?


FWIW: I've reported that it breaks builds with DEBUG_BUILD instead of
fixing them in:
https://lists.openembedded.org/g/openembedded-core/message/169002
but Kai replied that it still works for him until it didn't which probably
lead to this change to apply it only in master.

I've reported the same in upstream MR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439#note_149944=
3
but I didn't create new ticket about it (as it was supposed to work for
others).

Cheers,

--0000000000007db0bf05eb6562fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 19, 2022 at 5:29 PM Ross Burt=
on &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 19 Oct 2022, at 07:34, Khem Raj via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; Can you show examples where this is needed? Custom variable does n=
ot seem a good idea. I also worry that it=E2=80=99ll break automated update=
s (it=E2=80=99s bad enough with mesa-gl, this might make it worse).<br>
&gt; <br>
&gt; <a href=3D"https://github.com/ndechesne/meta-qcom/blob/master/recipes-=
graphics/mesa/mesa_git.bb" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mesa/mesa_git.bb</=
a><br>
<br>
That is, well, horrible.<br>
<br>
*If* we=E2=80=99re going to expose a mesa.inc that people outside of core c=
an use to package up their own random Mesa SHA then mesa.inc should just be=
 the packaging logic.<br></blockquote><div><br></div><div>Well I&#39;ve see=
n many mesa/pulseaudio recipes which were using mesa.inc/pulseaudio.inc and=
 even when they were a bit terrible, then it was still better than duplicat=
ing all of it. e.g.</div><div><a href=3D"https://github.com/webOS-ports/met=
a-pine64-luneos/commits/8946d3e2350ae83fbb001ba640db59b207341481/recipes-gr=
aphics/mesa/mesa_%25.bbappend">https://github.com/webOS-ports/meta-pine64-l=
uneos/commits/8946d3e2350ae83fbb001ba640db59b207341481/recipes-graphics/mes=
a/mesa_%25.bbappend</a><br></div><div><a href=3D"https://github.com/shr-pro=
ject/meta-webosose/commits/master/meta-webos/recipes-multimedia/pulseaudio"=
>https://github.com/shr-project/meta-webosose/commits/master/meta-webos/rec=
ipes-multimedia/pulseaudio</a><br></div><div><br></div><div>And better than=
 some other recipes which start with &quot;require recipes-foo/foos/<a href=
=3D"http://foo_1.0.bb">foo_1.0.bb</a>&quot; and then set PV to 2.0 and do f=
ew other changes.</div><div><br></div><div>I never expected .inc file to be=
 _required_ wide range of possible versions, people who re-use it to build =
older or newer version need to deal with possible incompatibilities in thei=
r layer even if it sometimes might require whole .inc file to be imported i=
nto their layer, when the benefit of reusing it is much smaller than requir=
ed modifications (e.g. when pulseaudio in oe-core was upgraded to use meson=
 while our old version was still built with autotools or even this small ch=
ange, but in :prepend=C2=A0<a href=3D"https://git.openembedded.org/openembe=
dded-core/commit/?id=3De5399a09bf44700f97607b283379172dac0cf9c7">https://gi=
t.openembedded.org/openembedded-core/commit/?id=3De5399a09bf44700f97607b283=
379172dac0cf9c7</a> .</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
However, I don=E2=80=99t understand something about the patch.<br>
<br>
Why do we only need to apply it on native builds?=C2=A0 It=E2=80=99s a back=
port from upstream, so should be the fix.=C2=A0 If it breaks when applied t=
o target builds, is there a bug upstream for that?</blockquote><div><br></d=
iv><div>FWIW: I&#39;ve reported that it breaks builds with DEBUG_BUILD inst=
ead of fixing them in:</div><div><a href=3D"https://lists.openembedded.org/=
g/openembedded-core/message/169002">https://lists.openembedded.org/g/openem=
bedded-core/message/169002</a><br></div><div>but Kai replied that it still =
works for him until it didn&#39;t which probably lead to this change to app=
ly it only in master.</div><div><br></div><div>I&#39;ve reported the same i=
n upstream MR:</div><div><a href=3D"https://gitlab.freedesktop.org/mesa/mes=
a/-/merge_requests/17439#note_1499443">https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/17439#note_1499443</a></div><div>but I didn&#39;t cre=
ate new ticket about it (as it was supposed to work for others).</div><div>=
<br></div><div>Cheers,</div><div>=C2=A0</div></div></div>

--0000000000007db0bf05eb6562fc--

