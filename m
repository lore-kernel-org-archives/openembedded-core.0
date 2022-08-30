Return-Path: <wesley.lindauer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4A6ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 19:27:56 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.16302.1661887674501090610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BJcm7Y71;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: wesley.lindauer@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id jm11so12052505plb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VXpvvKzRP+rwH7Fh4qzVnpPhgO0O1n7PB+cKurO1k7g=;
        b=BJcm7Y71Ssv3ry4X2j0W0/9oKJZEEq3svZ1ck/wV2jes+KobXXduzf9lgampzIy8sf
         bWT3pd4x8FElMG17yNQtLRwk9xiOP2Q2y/dIuQoMa9Kq5FIU/HwaGUNhF+BNwr+iVENv
         BOwNg0dD47qbD052mRcHj89MmyYySPNPMS2oJJgRB8q8Q1FCiM1DpYUFVBKTiidt5lVh
         l5wDPH0gQgh3CYMTZbJ8K9ahnMo2pByK7pQrHJAIU59eEpTZ3/6Wmx4IQ/hCmuWJ2/+c
         MLClqz1Sa4VHW2Z7A7lSO5IR1jpmnFiSRZ7sTo0s17raHy3GDkhvsahfsogTCR0D2YiF
         3xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VXpvvKzRP+rwH7Fh4qzVnpPhgO0O1n7PB+cKurO1k7g=;
        b=PCUQVE098+r/ytQIy8d23FmtJnvmgqoPHFKFmWxs4PAmackmHyNXtfJ7FoVj370OmM
         LA+yixQ9holvndPj55RdvbCGqUSlXxWg4yr2ahOaS180DdWTSVd6Ih1ln4NoQ2/6/j6C
         T+P1iKpbGCjsht2B4IULyP76EVSQ7F9WLjWjuCMr+8prHz8Ba8nUnuVGclPN4WCzqT5c
         87B3UvpYI0HJqRrezUg9jzQd8NMAwPY8MOd3dOuWIyL3/5a4Nhj08MHwGHA3vMgWEW0O
         F2PrZhNm/W+CGybnpsWj7GdvU+4bHdZowF4FrHDcM9oaUo63g0k5XiFx46Kn/F5VSjsk
         36mA==
X-Gm-Message-State: ACgBeo0ueE/kjFniIrfZ1VdqKLcrSLHNmmKGj5UKONoZP7jLFKLhx2vm
	0WS4VMzclPUPyxTn8zcCgI9PHIO2m23FvuTZK6A=
X-Google-Smtp-Source: 
 AA6agR4sqGj2Zmz+TkPkpVms6s+xkYe9UV55f7ik6aGqV9RLiAIc457+qlng7K5JkjcX+ufggm/N/NTOrdwX1Vtwf+E=
X-Received: by 2002:a17:90a:bd05:b0:1fb:c4b6:a83c with SMTP id
 y5-20020a17090abd0500b001fbc4b6a83cmr24296089pjr.142.1661887673877; Tue, 30
 Aug 2022 12:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
 <cf290a54-3b62-9c0d-32cc-08195f682b99@theobroma-systems.com>
 <01dce5b603bc47fc195ba4ea738e7a333ac1992e.camel@linuxfoundation.org>
 <d6dc09aea26447ed99a4ad5cee62c048@axis.com>
In-Reply-To: <d6dc09aea26447ed99a4ad5cee62c048@axis.com>
From: Wes Lindauer <wesley.lindauer@gmail.com>
Date: Tue, 30 Aug 2022 15:27:42 -0400
Message-ID: 
 <CALBQxSuQcXNq5M3PFDXYSYaR=UgFCOEiYNQ-Pm5F6v_MVVSsnQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore
 list
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000754a4605e77a6009"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 19:27:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170087

--000000000000754a4605e77a6009
Content-Type: text/plain; charset="UTF-8"

I think I understand. I am sorry for the FAD. I was experiencing this
sstate mismatch on the dunfell branch that does not contain the
'XZ_THREADS[vardepvalue] = "1"' change. This is probably why I attempted my
change in the hash exclude list and then tried to "port it forward to
master". I appreciate everyone taking the time to explain. I am still a
little confused why calculating every rpm task signature with a value of 1
is acceptable, but ignoring the variable in the signature is not. Are these
not different implementations of the same thing?

Thanks,
Wes L

On Mon, Aug 22, 2022 at 9:17 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 22 augusti 2022 13:19
> > To: Quentin Schulz <quentin.schulz@theobroma-systems.com>; Wes Lindauer
> > <wesley.lindauer@gmail.com>; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] bitbake.conf: Add resource vars to hash
> > ignore list
> >
> > On Mon, 2022-08-22 at 11:28 +0200, Quentin Schulz wrote:
> > > Hi Wes,
> > >
> > > On 8/22/22 06:59, Wes Lindauer wrote:
> > > > It should not matter what xz/zstd parallelism and resource usage is
> set to
> > > > when determining hash signatures. This allows sharing more sstate
> across
> > > > host machines with different CPU configurations.
> > > >
> > >
> > > It seems like it does matter in some ways, c.f.:
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=0296dc71c01d1b7953d74ef37d56429e2f4fcfab
> > > and
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=e72c0b94554a9bc293844ec2bddb0c04ea19791d
> >
> > As Quentin mentions, the value does matter. In particular, those
> > compiled with a single thread differ to those with multiple threads. As
> > such the proposed patch can't be accepted.
> >
> > Cheers,
> >
> > Richard
>
> Isn't the problem of varying XZ_THREAD/ZSTD_THREAD vs taskhashes
> already taken care of by having:
>
> XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> XZ_THREADS[vardepvalue] = "1"
> XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
> XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
> ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> ZSTD_THREADS[vardepvalue] = "1"
>
> in bitbake.conf.
>
> //Peter
>
>

--000000000000754a4605e77a6009
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think I understand. I am sorry for the FAD. I was e=
xperiencing this sstate mismatch on the dunfell branch that does not contai=
n the &#39;XZ_THREADS[vardepvalue] =3D &quot;1&quot;&#39; change. This is p=
robably why I attempted my change in the hash exclude list and then tried t=
o &quot;port it forward to master&quot;. I appreciate everyone taking the t=
ime to explain. I am still a little confused why calculating every rpm task=
 signature with a value of 1 is acceptable, but ignoring the variable in th=
e signature is not. Are these not different implementations of the same thi=
ng?</div><div><br></div><div>Thanks,</div><div>Wes L<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2=
2, 2022 at 9:17 AM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">&gt; -----Original Message-----<br=
>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Richard Purdie<br>
&gt; Sent: den 22 augusti 2022 13:19<br>
&gt; To: Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-syst=
ems.com" target=3D"_blank">quentin.schulz@theobroma-systems.com</a>&gt;; We=
s Lindauer<br>
&gt; &lt;<a href=3D"mailto:wesley.lindauer@gmail.com" target=3D"_blank">wes=
ley.lindauer@gmail.com</a>&gt;; <a href=3D"mailto:openembedded-core@lists.o=
penembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org=
</a><br>
&gt; Subject: Re: [OE-core][PATCH] bitbake.conf: Add resource vars to hash<=
br>
&gt; ignore list<br>
&gt; <br>
&gt; On Mon, 2022-08-22 at 11:28 +0200, Quentin Schulz wrote:<br>
&gt; &gt; Hi Wes,<br>
&gt; &gt;<br>
&gt; &gt; On 8/22/22 06:59, Wes Lindauer wrote:<br>
&gt; &gt; &gt; It should not matter what xz/zstd parallelism and resource u=
sage is set to<br>
&gt; &gt; &gt; when determining hash signatures. This allows sharing more s=
state across<br>
&gt; &gt; &gt; host machines with different CPU configurations.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; It seems like it does matter in some ways, c.f.:<br>
&gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?id=3D0296dc71c01d1b7953d74ef37d56429e2f4fcfab" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D029=
6dc71c01d1b7953d74ef37d56429e2f4fcfab</a><br>
&gt; &gt; and<br>
&gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?id=3De72c0b94554a9bc293844ec2bddb0c04ea19791d" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3De72=
c0b94554a9bc293844ec2bddb0c04ea19791d</a><br>
&gt; <br>
&gt; As Quentin mentions, the value does matter. In particular, those<br>
&gt; compiled with a single thread differ to those with multiple threads. A=
s<br>
&gt; such the proposed patch can&#39;t be accepted.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
<br>
Isn&#39;t the problem of varying XZ_THREAD/ZSTD_THREAD vs taskhashes <br>
already taken care of by having:<br>
<br>
XZ_THREADS ?=3D &quot;${@oe.utils.cpu_count(at_least=3D2)}&quot; <br>
XZ_THREADS[vardepvalue] =3D &quot;1&quot;<br>
XZ_DEFAULTS ?=3D &quot;--memlimit=3D${XZ_MEMLIMIT} --threads=3D${XZ_THREADS=
}&quot; <br>
XZ_DEFAULTS[vardepsexclude] +=3D &quot;XZ_MEMLIMIT XZ_THREADS&quot;<br>
ZSTD_THREADS ?=3D &quot;${@oe.utils.cpu_count(at_least=3D2)}&quot; <br>
ZSTD_THREADS[vardepvalue] =3D &quot;1&quot;<br>
<br>
in bitbake.conf.<br>
<br>
//Peter<br>
<br>
</blockquote></div>

--000000000000754a4605e77a6009--

