Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D29C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 08:32:42 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.9521.1638952361939796297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 00:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NKXCnfHQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id ay21so3280205uab.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Addq6a9nPNdF8esSYMbJwsBm95MkwTlx1drfBaRUtIM=;
        b=NKXCnfHQl8kncs4WtmK27SyNP51vVlwV3R+cZmQhhLAi9jy8+BF88sSlUzBwmJVRdE
         P3jbi94RyE7aOxWPzeMhrTQzNzJkIPwyebVhvh40NkLwR7pFFGXG4OjzZflH//lgunnZ
         bio0VKiGERKsGA/x9V7KUo6oOzadZm+lRVT3nIWrwfZqc1xYIfWcuf3BC4SsJj08aSx7
         0WhFNPsVxW3VC8gKPjYD0tW+2Y2EngBrFwCzTE3d4aaeBoRA4gHmDEcOkHwvjc//kBCF
         cjX0pfp+dUw2DJLkxXON6NzQhtInmx4gEeKTpkoGG2m7cvgv+3LS03zb8ORFwTcs1j9K
         jaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Addq6a9nPNdF8esSYMbJwsBm95MkwTlx1drfBaRUtIM=;
        b=be5lypUqmM1EN9/hrOLrEeFjpHtnWY60cOKlBffY+FHGen11C46q2+gRUWXgVWejK7
         Yn2tFtqQDKaZ0kNtqSxHxGVib84Jb7HNSl57nBEl3TzFrYBDwr6O07r0Ly2EBG3yA6i8
         izniQRLNIfk8J6mh/zq94TnwszwZeS6vAOXO9wJwOJ7oovTAoVK+wjYpqoodxJWWf669
         1ckab94+GNTGfEMAx1zfHr8GPTnUnYrjXGcRX1REai3TeyEmbsKjq7Y//ytj2jdCOmtL
         UJoEruikOWw9m4NbgF1nDWGbXBzUnf823DfLBmdQsP1LW5tZOSaN4PPUx6m1MKIHyo1w
         BTlQ==
X-Gm-Message-State: AOAM530TFvtMO/qHG8ymtH0nbqg5sli+UheCrJjVZTpVw0mL273zOY65
	VQlWldTNz6K34qPpSmFUvN7IgcYcb+WvA56k1EA=
X-Google-Smtp-Source: 
 ABdhPJxLx2jB4V74sm4J/o+n5261ha3UNv3q/n00LlcBV9LeRx7rldb/GPCRFYThw4g4DxfjPvHYYEFm/zIMQLhvwW0=
X-Received: by 2002:a9f:218c:: with SMTP id 12mr6244651uac.71.1638952361069;
 Wed, 08 Dec 2021 00:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
 <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
 <CANNYZj9W613_D++e=OH63rE1=rRAciziOKM439Yw4nxLai7ymA@mail.gmail.com>
 <e7ee85f4-b1de-9d49-bc04-2a213f0e6f36@weidmueller.com>
In-Reply-To: <e7ee85f4-b1de-9d49-bc04-2a213f0e6f36@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Dec 2021 09:32:29 +0100
Message-ID: 
 <CANNYZj_YMQita6Gfya=LhFZvsz1T+97588ExmD8NFK-9pdte8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000004916bf05d29e55f0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 08:32:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159345

--0000000000004916bf05d29e55f0
Content-Type: text/plain; charset="UTF-8"

I haven't looked at this, but probably the test could be adjusted to first
build the needed parts with only the original cache?

Alex

On Wed, 8 Dec 2021 at 09:27, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> Am 08.12.2021 um 09:10 schrieb Alexander Kanavin:
> > On Wed, 8 Dec 2021 at 08:45, Stefan Herbrechtsmeier
> > <stefan.herbrechtsmeier-oss@weidmueller.com
> > <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> >
> >     I will update my patch series but need some time to test it locally.
> >     The
> >     devtool test build a lot of recipe on every run because it use a
> >     private
> >     sstate cache. How does the autobuilder overcome this problem?
> >
> >
> > If you don't rebase the branch used for testing, and set the cache to a
> > directory outside of build directory (e.g. /home/stefan/sstate ) it will
> > reuse that cache between selftest invocations.
>
> The devtool test use its own PRIVATE sstate cache:
>
> def setUpClass(cls):
> ...
> cls.original_sstate = bb_vars['SSTATE_DIR']
> cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
> cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
> cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
>                      % cls.original_sstate)
>
> And remove it after the test run:
>
> def tearDownClass(cls):
> ...
> runCmd('rm -rf %s' % cls.devtool_sstate)
>
> Even a keep builddir doesn't help to keep the private sstate cache.
>
> > The autobuilder uses a single writeable cache for all builds and
> > builders, mounted as read-write NFS partition.
>
> This doesn't help in this case. The devtool test clean parts of the
> sstate cache and therefore use its private sstate cache and the original
> sstate cache as mirror. This is a problem if a test triggers a build of
> dependencies.
>
> Regards
>    Stefan
>

--0000000000004916bf05d29e55f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I haven&#39;t looked at this, but probably the test c=
ould be adjusted to first build the needed parts with only the original cac=
he?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 8 Dec 2021 at 09:27, Ste=
fan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmu=
eller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Am 08.12.2021 um 09:10=
 schrieb Alexander Kanavin:<br>
&gt; On Wed, 8 Dec 2021 at 08:45, Stefan Herbrechtsmeier <br>
&gt; &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.com" targ=
et=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.co=
m" target=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt;&gt;=
 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I will update my patch series but need some time to=
 test it locally.<br>
&gt;=C2=A0 =C2=A0 =C2=A0The<br>
&gt;=C2=A0 =C2=A0 =C2=A0devtool test build a lot of recipe on every run bec=
ause it use a<br>
&gt;=C2=A0 =C2=A0 =C2=A0private<br>
&gt;=C2=A0 =C2=A0 =C2=A0sstate cache. How does the autobuilder overcome thi=
s problem?<br>
&gt; <br>
&gt; <br>
&gt; If you don&#39;t rebase the branch used for testing, and set the cache=
 to a <br>
&gt; directory outside of build directory (e.g. /home/stefan/sstate ) it wi=
ll <br>
&gt; reuse that cache between selftest invocations.<br>
<br>
The devtool test use its own PRIVATE sstate cache:<br>
<br>
def setUpClass(cls):<br>
...<br>
cls.original_sstate =3D bb_vars[&#39;SSTATE_DIR&#39;]<br>
cls.devtool_sstate =3D os.path.join(bb_vars[&#39;TOPDIR&#39;], &#39;sstate_=
devtool&#39;)<br>
cls.sstate_conf=C2=A0 =3D &#39;SSTATE_DIR =3D &quot;%s&quot;\n&#39; % cls.d=
evtool_sstate<br>
cls.sstate_conf +=3D (&#39;SSTATE_MIRRORS +=3D &quot;file://.* file:///%s/P=
ATH&quot;\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0% cls.original_sstate)<br>
<br>
And remove it after the test run:<br>
<br>
def tearDownClass(cls):<br>
...<br>
runCmd(&#39;rm -rf %s&#39; % cls.devtool_sstate)<br>
<br>
Even a keep builddir doesn&#39;t help to keep the private sstate cache.<br>
<br>
&gt; The autobuilder uses a single writeable cache for all builds and <br>
&gt; builders, mounted as read-write NFS partition.<br>
<br>
This doesn&#39;t help in this case. The devtool test clean parts of the <br=
>
sstate cache and therefore use its private sstate cache and the original <b=
r>
sstate cache as mirror. This is a problem if a test triggers a build of <br=
>
dependencies.<br>
<br>
Regards<br>
=C2=A0 =C2=A0Stefan<br>
</blockquote></div>

--0000000000004916bf05d29e55f0--

