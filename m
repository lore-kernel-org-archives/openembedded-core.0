Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5665EF4ED8
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:27:56 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53846.1775478474059655165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=boC0knVk;
 spf=pass (domain: mvista.com, ip: 209.85.208.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66e6d960ff5so3000562a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 05:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775478472; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNUNZwRmPZ5B3fJo+SU5z2+FBTlsf2Zo1bRGgIxtSj3/+x7901kpAmI2969W3dsbNx
         n2dlfbjBChtGapLJP7fzMo/k28os73882uLxz/8RePz1+pzRGscZQLfD48xg3v4Xr/ZF
         DT0bkqhL4t7cye5k0vwVCNgmkaV8wdq1toD8acskqMB86gunK3ysJu3RMw7519HzOmPo
         u993CPGB4VFF9jwVU9G2LGPRgaPIwI7NCfx/BIB/1qibitIbp5ShB7N6nvwp56I6igur
         rnSUon9GrpbaS+kK3LXdUb/hPMdIjaQr8lVN25prNeGc689IvGExfHHTTgQAKjSmlb6x
         814w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NLeR4hp55PgL2n7VEgwRpRk+remncD6kEUUXfrgOSiI=;
        fh=n245V+xrUQGGzjReOvjuL+zMikMqWJZ4IJpnuk3+bsk=;
        b=h689CtBzi9M+1KnDorxQ0KMlYtFWRvpeKNJj60H9crF2PVlWhDp/BfK9vpSVw51JkK
         /s+XYD9OYSiFMv1+XIRBy71QgUoYnA2V05JT8rNx28AI+UJTDVZ1ja6+QQq50U16Efo+
         C4VPd1c2EzkvlF5Q6e4LkN4JtJ1w2gIfC70Sg6/HOOnOSI3oLMnBawBF2TwQSD2iBTku
         sm/gB82beAsvoPDbrQy7b8B80XkqwHbHIGR9qjGUe29YC+YJCjHEAyXS0iaZ6N3QGLz7
         BvdUBrpnd61hYSeLstz/Pg9urmamkQVauGff80ZEeDYMABG6ffBEB4s9Gn1HJwtnYnsP
         LQ1g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775478472; x=1776083272; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NLeR4hp55PgL2n7VEgwRpRk+remncD6kEUUXfrgOSiI=;
        b=boC0knVkHyUTA8hADVysgAZmKKqt6ukBXT1YO0Gkn6vIzh3uSPKu6vIu511kQ20F7K
         1clSPLxDP1jas0zmrlY3cS49UuRRupEPbussS8aw6/YjP534fH3yNmQ9D06SOFSHHiou
         ckOaOYZZapauc8EjAIz/YZRzKA4U3q9YgHZ/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478472; x=1776083272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLeR4hp55PgL2n7VEgwRpRk+remncD6kEUUXfrgOSiI=;
        b=qwQIHOgKGB0ZfzJA6GfUViX6kJQ1feZHrzYJ2OSK18BXNU08SLRlUGWMXn93X2GCdW
         sLav6nRqyl4ZmL3Gu7Mq2mAhFWRJO2vZHbgseHaBGd+Ajw5MH4L3myFyMw43qbuAW0mK
         zaHh+HaAvHw3YlIG9kgw29yUi9dZhAvj+DGDV6fyneIY/6UtH3d7xklirqm6WznKd/YB
         wB9qUZT4DnjKlqRfqeWcY9stw/P6P7vYYNoxqF3jLR9clW4CMYUbRO4xw52cQg5KdKLz
         NX6u184Ii/UyFqMAu5gNUUMZd+YMgvzcVW8I/QmR5Ssq+tjf3OyPH2Jyak4uQ0mjl6hs
         Ys1w==
X-Forwarded-Encrypted: i=1; AJvYcCV69szxe0FHF8vqLDNjZOwDAnTO5DYN485TfWHkCUPK7dXVL7CHXcXwqihmyi05qH0lbVCeGAYRxMloDHrZJYS2qw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw00ujNi1NdpAr0jMEbZcIOAhdpGCmilWJjq9ykrtAzOn5qympf
	/qFrUAp9o1ENvUBOWRUGlhv21RD90XZmoAhdg845/p1GNsJ/usb4rHT1/8NSpviGrW10HxloP/w
	UEeGMg3/rGf+uSHJ0GJyz6iuCCqmdpZJiaN5AciPFVw==
X-Gm-Gg: AeBDies2HeU+CnnvAeAXsMF8Lei479rJpJ30PS+bSth5FqEzeTlzIT436L/xKvq5DZH
	sqX+Usd1H0ymfPWAiLnrD7zwOKTGSOkVzJ08qNooyLjYj7a2PhVXDo0xLAh86X5bDF6y+zkwGGn
	RC57SHH0dA1O+6UJAWoG6b/PULkLj8RBzz+pA1TYmQXSCx2L3Ra0ysF8wLzqb0/ECkZVeiVUwyn
	vDCIk1Kcu5oFJ7Ce+/WdT7xUSliLB6JEkIIoc5TC1XGSR980+grIIFS/YUe+ySHDs6Zrp0OHmik
	zlhX2rPzTF7yTMYYdZ6yneUe5hMtHl32t+vo7OPHnA==
X-Received: by 2002:a05:6402:51c9:b0:66d:d2f9:520c with SMTP id
 4fb4d7f45d1cf-66e3f71e921mr5742863a12.19.1775478472286; Mon, 06 Apr 2026
 05:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775435063.git.yoann.congal@smile.fr> <c19d97a63c2b9b145a0370a961cbfef90b450010.1775435063.git.yoann.congal@smile.fr>
 <053f62bc5f48a7ef16d955982e64adecf35714be.camel@pbarker.dev>
 <CANQUz191KfwSFA_n3MP=Xt7KC6ddAvvKkJGKOwCmMBPtUi_5TA@mail.gmail.com> <990e40208f0077bfac5c062421012e5c83b56eca.camel@pbarker.dev>
In-Reply-To: <990e40208f0077bfac5c062421012e5c83b56eca.camel@pbarker.dev>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 6 Apr 2026 17:57:40 +0530
X-Gm-Features: AQROBzCA8-spxFwCi9wRLTXL6FIt-6msOF1tbzFiqjruaeyJP4rX-8Ar6YijxzQ
Message-ID: <CANQUz1_4yocr3exZuXuMncDyn_Lj-9mjz6bE0=z2QyTm2Fvpyw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 08/18] python3: Fix CVE-2025-15282
To: Paul Barker <paul@pbarker.dev>
Cc: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5b390064ec9cb66"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234676

--000000000000a5b390064ec9cb66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 5:29=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrote=
:

> On Mon, 2026-04-06 at 17:14 +0530, Vijay Anusuri via
> lists.openembedded.org wrote:
> > On Mon, Apr 6, 2026 at 2:39=E2=80=AFPM Paul Barker via lists.openembedd=
ed.org
> <paul=3D
> > pbarker.dev@lists.openembedded.org> wrote:
> >
> > > On Mon, 2026-04-06 at 08:26 +0200, Yoann Congal via
> > > lists.openembedded.org wrote:
> > > > From: Vijay Anusuri <vanusuri@mvista.com>
> > > >
> > > > Pick patch from 3.10 branch
> > > >
> > > > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-15282
> > > > [2] https://security-tracker.debian.org/tracker/CVE-2025-15282
> > > >
> > > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > >
> > > The fix for this issue (referred to as gh-143925 upstream) looks to b=
e
> > > part of Python 3.10.20 [1]. Should we take a final Python stable upda=
te
> > > instead of this patch?
> > >
> > > [1]: https://www.python.org/downloads/release/python-31020/
> > >
> > >
> > --> Along with this CVE, Python 3.10.20 includes multiple security bug
> > fixes. I think it's good to go with Python stable update to 3.10.20 .
>
> Hi Vijay,
>
> Are you able to send a patch to update to Python 3.10.20 on kirkstone?
>
> -- I will send it soon.
>
> Best regards,
>
> --
> Paul Barker
>
>

--000000000000a5b390064ec9cb66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 6, =
2026 at 5:29=E2=80=AFPM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev"=
>paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div>On Mon, 2026-04-06 at 17:14 +0530, Vijay Anusuri via<=
br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Mon, Apr 6, 2026 at 2:39=E2=80=AFPM Paul Barker via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;paul=3D<br>
&gt; <a href=3D"mailto:pbarker.dev@lists.openembedded.org" target=3D"_blank=
">pbarker.dev@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, 2026-04-06 at 08:26 +0200, Yoann Congal via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Pick patch from 3.10 branch<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-152=
82" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/C=
VE-2025-15282</a><br>
&gt; &gt; &gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/C=
VE-2025-15282" rel=3D"noreferrer" target=3D"_blank">https://security-tracke=
r.debian.org/tracker/CVE-2025-15282</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.cong=
al@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; The fix for this issue (referred to as gh-143925 upstream) looks =
to be<br>
&gt; &gt; part of Python 3.10.20 [1]. Should we take a final Python stable =
update<br>
&gt; &gt; instead of this patch?<br>
&gt; &gt; <br>
&gt; &gt; [1]: <a href=3D"https://www.python.org/downloads/release/python-3=
1020/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/download=
s/release/python-31020/</a><br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; --&gt; Along with this CVE, Python 3.10.20 includes multiple security =
bug<br>
&gt; fixes. I think it&#39;s good to go with Python stable update to 3.10.2=
0 .<br>
<br>
Hi Vijay,<br>
<br>
Are you able to send a patch to update to Python 3.10.20 on kirkstone?<br><=
br></div>-- I will send it soon.<div>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</div></blockquote></div></div>

--000000000000a5b390064ec9cb66--

