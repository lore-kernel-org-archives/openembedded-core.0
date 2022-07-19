Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F6DC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 00:07:35 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.34938.1658189247962188923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 17:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=FcKi9ndE;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.44,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f44.google.com with SMTP id h18so302837qvr.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 17:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=cllFluKDN+fTdLS2cLoGR1JGGbwyV8gd3iVbQs45dZc=;
        b=FcKi9ndEfIUrR5J6JHNr2kawE34mj6w4uiyEy4s5T0CPt+blJJbuEH0H0kw1u7G70d
         DQAJSpceBgnk5JrIUz6PtoOuq30a57yi7AlORBQNo72bjKYhRi6uxNP8e/j4T4FE4OkR
         BeDyXm2GQDzZrqEbqZdZ79rO0xlGbMoo8EUtcGPpwyMM94HfwUFQO4bDnmDX6v/temc0
         jUVZ6TtLA/En6mxZsQlrKYL0LopnMYtMYqZ30lRciavwRDgE1krVSEmqlomjIg273Fon
         sBJS4XGbEnTfPiUmY3u4kPEhG57BP8QcjKbgy6ORpFAiER5vyZKp56GSPHto8WYsPTkj
         F/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=cllFluKDN+fTdLS2cLoGR1JGGbwyV8gd3iVbQs45dZc=;
        b=GibnaxDKBtDbY9GZf4uLErVBU/XuqOWSHfnzvsvASF9+rUsfmO2p8io/ztCYili19v
         YJQbsdK545mY/0a+fUsjO41/ujax42dA4FHK8UBYfJwkodtCu/ogDcBepqqzQtJrTj2T
         4KC0SOTsrMo6a3HJR5Z2v6h8/cxOx+CmwGSsuXbiODUCwR7SDBM9mr0LSE+3rCQ2ZW31
         UjmWUDK1W2E3yx4ew9qyaiKlhArsa/4km++gGnzJi2kvLlGkt4IMrKz6LSlC31OBLHMA
         R+6dgo3zXG65uAvkF4LSvVfUX6CSMn501R7bF0Jq/oC1Eyn4dvBibXLaENoDHOdgU+aq
         KKow==
X-Gm-Message-State: AJIora+ROH0glradwNIpxZgtKbovsVjcJ9PFMeZR8ueIyBrY6map/cM9
	Rbv2mXbngtz7kTdspAMmY8u9845d/Zc5F+gj
X-Google-Smtp-Source: 
 AGRyM1vqVM/eCdK0SsENtgeabKoEUecIO91ST+LyXhQwuCMPfiEwtJLUSzx0KjUgs59YR1/mb751NQ==
X-Received: by 2002:a05:6214:f25:b0:473:f47d:450 with SMTP id
 iw5-20020a0562140f2500b00473f47d0450mr657183qvb.12.1658189246620;
        Mon, 18 Jul 2022 17:07:26 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com.
 [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id
 bj12-20020a05620a190c00b006b5f68bc106sm2145861qkb.110.2022.07.18.17.07.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 17:07:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f45.google.com with SMTP id mi10so10047420qvb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 17:07:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2a86:b0:473:e193:7de3 with SMTP id
 jr6-20020a0562142a8600b00473e1937de3mr3305121qvb.105.1658189245741; Mon, 18
 Jul 2022 17:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220710164300.953098-1-otavio@ossystems.com.br>
 <20220710164300.953098-2-otavio@ossystems.com.br>
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
 <06a78e1a344f8ee4dbf696b56756781a65463f1f.camel@linuxfoundation.org>
In-Reply-To: 
 <06a78e1a344f8ee4dbf696b56756781a65463f1f.camel@linuxfoundation.org>
Date: Mon, 18 Jul 2022 21:07:14 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKp+WkU-+41q39_R6S8UsraOPn-0KbTuQjaHToqumwn-0g@mail.gmail.com>
Message-ID: 
 <CAP9ODKp+WkU-+41q39_R6S8UsraOPn-0KbTuQjaHToqumwn-0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6842405e41d4488"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 00:07:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168265

--000000000000f6842405e41d4488
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 18 de jul. de 2022 =C3=A0s 19:54, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Mon, 2022-07-18 at 18:41 -0300, Otavio Salvador wrote:
> > Em seg., 18 de jul. de 2022 =C3=A0s 18:18, Richard Purdie
> > <richard.purdie@linuxfoundation.org> escreveu:
> > > > It does, indeed, but it doesn't seem related to this PR.
> > > >
> > > > Do you know if this has worked?
> > > >
> > > > I am asking as I did all development and testing using SDKMACHINE
> > > > ?=3D
> > > > 'x86_64' and even MACHINE ?=3D 'qemuarm64' worked just fine.
> > > > However,
> > > > looking at some of the logs above, it seems it is using an
> > > > SDKMACHINE
> > > > as i686, so this appears as a different issue for me.
> > > >
> > >
> > > rust-cross-canadian hasn't officially worked properly or been
> > > supported. In assessing whether a patch is better or worse, it is
> > > useful to know which cases regress and which improve. I had hoped
> > > this
> > > list of failures would be smaller. I will admit I don't know
> > > whether
> > > this is better or worse than before so I guess that is the next
> > > thing I
> > > need to determine.
> > >
> >
> >
> > I told you. I tried SDKMACHINE as x86_64 on a x86_64 host and this
> > worked.
> >
> > > What we don't know right now is which combinations work and which
> > > don't
> > > so we can't even tell people what is expected to work and what
> > > isn't/doesn't :(
> > >
> >
> >
> > See above.
> >
> > > I mentioned this report in case someone can work out the pattern,
> > > or
> > > even better, understand what a fix looks like...
> > >
> >
> >
> > I am not familiar enough to Rust boostrap to help here but we spent a
> > lot of time to get the SDK working and I think this is a step on the
> > right direction, at least.
>
> Thanks, I do appreciate the patches. I think we've talked cross
> purposes as I did report my aarch64 test case issue previously and I
> thought this series was to attempt to fix things so the recipe did work
> generically.
>

I had it fixed to SDKMACHINE as x86_64 on a x86_64. I didn't realise it was
using a different SDKMACHINE.

If I merge this to fix x86_64, I think people will then just ignore the
> other cases and things will remain broken there which worries me a lot
> and means we can't generically enable rust SDKs for the project and
> gain autobuilder testing to spot future regressions.
>

I understand.


> Obviously you want your use case fixed though. I will try and evaluate
> things a bit more tomorrow. What I don't want to do is merge a fix
> which then makes it harder to get things correctly done in future
> though, particularly when I know there will be an instant backport
> request to an LTS as soon as I accept it for master.
>

In fact I need patch 1/2 as this fixes our use case. We worked on 2/2 (this
patch) for completeness.


> We never should have accepted these rust cross-canadian recipes at all
> as they are just broken :(.
>

Agreed.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000f6842405e41d4488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em seg., 18 de jul. de 2022 =C3=A0s 1=
9:54, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Mon, 2022-07-18 at 18:41 -0300,=
 Otavio Salvador wrote:<br>
&gt; Em seg., 18 de jul. de 2022 =C3=A0s 18:18, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br>
&gt; &gt; &gt; It does, indeed, but it doesn&#39;t seem related to this PR.=
=C2=A0<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Do you know if this has worked?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I am asking as I did all development and testing using=C2=A0=
SDKMACHINE<br>
&gt; &gt; &gt; ?=3D<br>
&gt; &gt; &gt; &#39;x86_64&#39; and even=C2=A0MACHINE ?=3D &#39;qemuarm64&#=
39; worked just fine.<br>
&gt; &gt; &gt; However,<br>
&gt; &gt; &gt; looking at some of the logs above, it seems it is using an<b=
r>
&gt; &gt; &gt; SDKMACHINE<br>
&gt; &gt; &gt; as i686, so this appears as a different issue for me.<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; rust-cross-canadian hasn&#39;t officially worked properly or been=
<br>
&gt; &gt; supported. In assessing whether a patch is better or worse, it is=
<br>
&gt; &gt; useful to know which cases regress and which improve. I had hoped=
<br>
&gt; &gt; this<br>
&gt; &gt; list of failures would be smaller. I will admit I don&#39;t know<=
br>
&gt; &gt; whether<br>
&gt; &gt; this is better or worse than before so I guess that is the next<b=
r>
&gt; &gt; thing I<br>
&gt; &gt; need to determine.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I told you. I tried SDKMACHINE as x86_64 on a x86_64 host and this<br>
&gt; worked.<br>
&gt; <br>
&gt; &gt; What we don&#39;t know right now is which combinations work and w=
hich<br>
&gt; &gt; don&#39;t<br>
&gt; &gt; so we can&#39;t even tell people what is expected to work and wha=
t<br>
&gt; &gt; isn&#39;t/doesn&#39;t :(<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; See above.<br>
&gt; =C2=A0<br>
&gt; &gt; I mentioned this report in case someone can work out the pattern,=
<br>
&gt; &gt; or<br>
&gt; &gt; even better, understand what a fix looks like...<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I am not familiar enough to Rust boostrap=C2=A0to help here but we spe=
nt a<br>
&gt; lot of time to get the SDK working and I think this is a step on the<b=
r>
&gt; right direction, at least.<br>
<br>
Thanks, I do appreciate the patches. I think we&#39;ve talked cross<br>
purposes as I did report my aarch64 test case issue previously and I<br>
thought this series was to attempt to fix things so the recipe did work<br>
generically.<br></blockquote><div><br></div><div>I had it fixed to SDKMACHI=
NE as x86_64 on a x86_64. I didn&#39;t realise it was using a different SDK=
MACHINE.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">If I merge this to fix x86_64, I think people will then just ignore the=
<br>
other cases and things will remain broken there which worries me a lot<br>
and means we can&#39;t generically enable rust SDKs for the project and<br>
gain autobuilder testing to spot future regressions.<br></blockquote><div><=
br></div><div>I understand.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Obviously you want your use case fixed though. I w=
ill try and evaluate<br>
things a bit more tomorrow. What I don&#39;t want to do is merge a fix<br>
which then makes it harder to get things correctly done in future<br>
though, particularly when I know there will be an instant backport<br>
request to an LTS as soon as I accept it for master.<br></blockquote><div><=
br></div><div>In fact I need patch 1/2 as this fixes our use case. We worke=
d on 2/2 (this patch) for completeness.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">We never should have accepted these ru=
st cross-canadian recipes at all<br>
as they are just broken :(.<br></blockquote><div><br></div><div>Agreed.</di=
v><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://ww=
w.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"=
_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000f6842405e41d4488--

