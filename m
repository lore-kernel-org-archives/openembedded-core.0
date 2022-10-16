Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4EAC4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 13:57:56 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.29849.1665928674600051479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 06:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T5iSyy2S;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id 187so7271623iov.10
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDBGbpR2kjIY7iC5mNmjII3qz87bPMmtCCC34KJudjc=;
        b=T5iSyy2SXPn9I82dhOnIvnPJnYgOEPhSgQ7q8W6ctfqEMaMzqEIt+rqxznoNBMHqRB
         /16RbPpYnkvTTCwfkwdEQSSGVDhJccxkvpJT39qGBMC/Ek8WcP7MDkc5MsSHmwMh94/x
         F4TLSCWUJtHS1OhwJvSFihIiNuaxLZu4UleOFQ2oKqfdHUFI30xM9Y28wZbg/tczUyAf
         FSNC5ZxAB5zFJmH2APb1AT0p0JcuAhW/xDJikoLkgPmH6rXdlTQ0AEtiM6JsQoIWP5Wc
         /NOnHags6EjQ83P4ZQ8DbVEGrDk8gqEkDnTWxp3XKqAXUqWrtDoQJcFGuW1GSIm127EY
         72NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDBGbpR2kjIY7iC5mNmjII3qz87bPMmtCCC34KJudjc=;
        b=8OHarmKIZJt0yq8sAML/rkmZ0qKCkA/vRMwO+gN/Vj6mnVKtc8jYohnPm8P+v9Rsve
         B3TT0CCtHIiNuvD9d3x/aqQrI78iHWumw32dmttu1CtqZfgB2xqiSEVWKWqrDQjd5iHk
         LYwpL6e04QMOcPbF7MtS1u66112O541awugSTj3OjUeJpZMHTg1wCGCLkKIwumq1ASrO
         ljfxHFMarXA0TrH4VVmHWvDbGhRPOmUdH8dUHmC59b0NV62fkjVJOnKuzY6oPntkAsbc
         pUFg+NCUq+9lVGk8bBv/O2+/eO5zh5fBx9Tvj43hHP9n2VWpGqW9FvkOFb8hU2UR6ZEk
         cKPA==
X-Gm-Message-State: ACrzQf1a61+ljhjIk3opbFmHdGce825TFCU7W7tIvH+FB1RYLpCdcUhb
	fQ6OIpnEVb6yJuwuKlVZ1WB6j9HZT5Vq0NDBO4o=
X-Google-Smtp-Source: AMsMyM4loAxzpj53pq7yr6D7cMiI8TSPhqqhXo52FWR2RHCV5WnVld3m9W/EaMNjV0sjZX7vR2gA/O6pIsVutptMDIA=
X-Received: by 2002:a05:6602:150c:b0:6bc:ae87:d6ae with SMTP id
 g12-20020a056602150c00b006bcae87d6aemr2604635iow.99.1665928673828; Sun, 16
 Oct 2022 06:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
 <0171f109-2941-3269-3bd5-adf497e30e59@gmail.com> <CANNYZj9a3Ks+P4LCx-A8cLwgku_Qjaw6ePwht1E8CSFuXtR1HA@mail.gmail.com>
 <38f702d0-1b86-9612-e431-a43fcf960c4f@gmail.com> <CANNYZj-wE01Eei1eEHOoywngiBO6Sgp_gp3fLxDQEFYAzuPE6w@mail.gmail.com>
In-Reply-To: <CANNYZj-wE01Eei1eEHOoywngiBO6Sgp_gp3fLxDQEFYAzuPE6w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 16 Oct 2022 09:57:42 -0400
Message-ID: <CADkTA4OhznJyEmfdiRouNw472nWB8pg7Kxe1vy0ByPFM5+iBOQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d3250805eb273ea2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 13:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171897

--000000000000d3250805eb273ea2
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 16, 2022 at 8:05 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sun, 16 Oct 2022 at 09:56, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> > I do think it is reasonable to ask for not being mail-bombed with
> > machine generated emails.
> >
> > I am asking for either to:
> > * put them on a separate mailing list
> > * merge them into one email
> >
> > If keeping core updated still is "Alex's problem" then the AUH emails
> > are not having the intended effect *anyway*.
>
> They do help, just not to the level I would like. They also provide an
> easy way for someone who is not yet a contributor to become one,
> particularly when AUH did succeed and produced a working patch that
> doesn't need manual fixing. They also make the maintenance problem
> known and visible. Sweeping it all under the carpet as suggested would
> make the situation worse, not better.
>
> If you do not want to mix those emails with those written by humans, I
> trust your email client has a filter system. I still cling to the
> belief that you would want to help the core, and only personal
> circumstances prevent you, and therefore this filter will be set to
> put those mails into a separate folder instead of deleting them
> ouright.
>

I'm with Alex on this.

The email need to be visible and they need to be separate.

People can write filters, or mark them as read the few times they come out.
That level
of effort is not much of an ask, compared to trying to keep things up to
date, and to
keep everyone informed.

Cheers,

Bruce



>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171893):
> https://lists.openembedded.org/g/openembedded-core/message/171893
> Mute This Topic: https://lists.openembedded.org/mt/94354924/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d3250805eb273ea2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Oct 16, 2022 at 8:05 AM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, =
16 Oct 2022 at 09:56, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.c=
om" target=3D"_blank">jacob.kroon@gmail.com</a>&gt; wrote:<br>
&gt; I do think it is reasonable to ask for not being mail-bombed with<br>
&gt; machine generated emails.<br>
&gt;<br>
&gt; I am asking for either to:<br>
&gt; * put them on a separate mailing list<br>
&gt; * merge them into one email<br>
&gt;<br>
&gt; If keeping core updated still is &quot;Alex&#39;s problem&quot; then t=
he AUH emails<br>
&gt; are not having the intended effect *anyway*.<br>
<br>
They do help, just not to the level I would like. They also provide an<br>
easy way for someone who is not yet a contributor to become one,<br>
particularly when AUH did succeed and produced a working patch that<br>
doesn&#39;t need manual fixing. They also make the maintenance problem<br>
known and visible. Sweeping it all under the carpet as suggested would<br>
make the situation worse, not better.<br>
<br>
If you do not want to mix those emails with those written by humans, I<br>
trust your email client has a filter system. I still cling to the<br>
belief that you would want to help the core, and only personal<br>
circumstances prevent you, and therefore this filter will be set to<br>
put those mails into a separate folder instead of deleting them<br>
ouright.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">I&#39;m with Alex on this.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">The email need to be visible and they need to be=
 separate.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">People can wri=
te filters, or mark them as read the few times they come out. That level</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">of effort is not =
much of an ask, compared to trying to keep things up to date, and to</div><=
div class=3D"gmail_default" style=3D"font-size:small">keep everyone informe=
d.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171893): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171893" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171893</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94354924/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94354924/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000d3250805eb273ea2--

