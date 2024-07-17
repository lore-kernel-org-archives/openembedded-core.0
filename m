Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FE2C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 12:07:44 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.13627.1721218054174009973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 05:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B6rgFujm;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: quaresma.jose@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e05d48cf642so2172774276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721218053; x=1721822853; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4FhyMXH6oRqyaBQrV4g9K/6mk4QryrCcrJ4wL6BAAZg=;
        b=B6rgFujm+9jOXzp0FBfCV3B1kvpNhccN9XknFF/H3UJnMtWWVsPMew3Dp2inmgjp+f
         yuknMNBB4YWq+yWMd+EGq74QO5L67h4NjbKkOeHLWm20OJUfHJYqGceMo/4PZKD0rYmj
         SohGFHghuFsi2YLzvSIvjtifnDwbeh3OP2yvzsyTG3+wRdB6PP5V2Wb/2GFCFNV7b1sC
         yXU1J5KWc5BFAdgR4Q7ScQUgKeXmhDZ5PJR7yIFMkKPJ9dKBr0C3P6ELwmn9g1t0xWZU
         7NfRFmbGgCWwneo3eU3XLWaUCjxQSW69VRKEo3R98nprT/rUcgZ6+sVv1zBSkKJf0viT
         oedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721218053; x=1721822853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FhyMXH6oRqyaBQrV4g9K/6mk4QryrCcrJ4wL6BAAZg=;
        b=PYFlrpNwFPePngbAwFip2pBoY7iNiokJuuVvqpTrX5Fqu/X9I0I/8Zd5DIOX9V95oF
         xvPdxqcdPK8Ts+1zfGXCdnPoe+rChs+N66spZ31V2gbLcI6MMWi1zah4XSWY6jBITTpQ
         6eLPMtqZ2nfn+NN0YdpFJ4fFOBPwbf17vsQPkM4fk1M5SVAn8i/+Ev2XresIDrGHtQVP
         aIgFn9Yjy0VqUxx5l8sKocefN9jxr4kRvJuItnZnwcIKOAzkeAyCF9DcyseEguNON6R6
         OMmfLxRzOtCzpwz69XLF2S/OrmXPMGjaq6gB0mm7SwzDn8ojNMfHYZW5I7aNp+CGqW2r
         +iZw==
X-Gm-Message-State: AOJu0YzrWZvtb9p1M1t5KuOKdN0Gpmx6gD6jsjdK2REz2plaOxB9JuY6
	NP770T5V/BjOp2D3ET8a1nCnF9X37ozPoO1EO0W9EAFx0j68DiGRrY8f3/GDZ2ez63AZJZiF5A9
	slT/kAEVBXeweZI90j6ZeNPcE51g=
X-Google-Smtp-Source: AGHT+IGgctN+FC4QPToQHQB92RKm6MFIR/NwcylTvK9V0nXfaHsq5EjjVxxMVfE/m2I/QSJYfEtaJhGLNoiQ1f7KdoQ=
X-Received: by 2002:a05:6902:120a:b0:e03:6020:4708 with SMTP id
 3f1490d57ef6-e05ed538db4mr1624700276.0.1721218053172; Wed, 17 Jul 2024
 05:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240717110050.2515243-1-jose.quaresma@foundries.io> <bba4dbd4a126e4a63bdb4f6c47c318bae4db8c84.camel@linuxfoundation.org>
In-Reply-To: <bba4dbd4a126e4a63bdb4f6c47c318bae4db8c84.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 17 Jul 2024 13:07:21 +0100
Message-ID: <CANPvuR=Ejg=iQC50+1V+6q51WtWaKQu=jtF38Rzhwb_pcq4c2Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] Revert "testimage: retrieve ptests directory
 when ptests fail"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, alexis.lothore@bootlin.com, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000a3f667061d704e07"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 12:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202160

--000000000000a3f667061d704e07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
17/07/2024 =C3=A0(s) 12:25):

> On Wed, 2024-07-17 at 12:00 +0100, Jose Quaresma via
> lists.openembedded.org wrote:
> > This reverts commit d1ac9bb1bd2132cd121f0e80829302298d8a8a64.
> >
> > The variable TESTIMAGE_FAILED_QA_ARTIFACTS is not parsed as expected [1=
]
> > and is making some noise on the testimage output log as can be seen
> bellow [2]:
> >
> > [1]:
> >
> > bitbake-getvar -r core-image-minimal TESTIMAGE_FAILED_QA_ARTIFACTS
> > TESTIMAGE_FAILED_QA_ARTIFACTS=3D"    /var/log     /etc/version
> /etc/os-release \${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> '/usr/lib/\${MCNAME}/ptest', '', d)}"
>
> It is because MCNAME isn't defined outside the ptest images. We should
> move that line into the ptest images that use mcextend, or swap MCNAME
> for a wildcard if that would work.
>

Yup, I tested with your patch on main-next and it works.
Thanks

Jose


>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a3f667061d704e07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quarta, 17/07/2024 =C3=A0(s) 12:25):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, 2024-07-17 at 12:00 +0100, Jose =
Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; This reverts commit d1ac9bb1bd2132cd121f0e80829302298d8a8a64.<br>
&gt; <br>
&gt; The variable TESTIMAGE_FAILED_QA_ARTIFACTS is not parsed as expected [=
1]<br>
&gt; and is making some noise on the testimage output log as can be seen be=
llow [2]:<br>
&gt; <br>
&gt; [1]:<br>
&gt; <br>
&gt; bitbake-getvar -r core-image-minimal TESTIMAGE_FAILED_QA_ARTIFACTS<br>
&gt; TESTIMAGE_FAILED_QA_ARTIFACTS=3D&quot;=C2=A0=C2=A0=C2=A0 /var/log=C2=
=A0=C2=A0=C2=A0=C2=A0 /etc/version=C2=A0=C2=A0=C2=A0=C2=A0 /etc/os-release =
\${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ptest&#39;, &#39;/usr=
/lib/\${MCNAME}/ptest&#39;, &#39;&#39;, d)}&quot;<br>
<br>
It is because MCNAME isn&#39;t defined outside the ptest images. We should<=
br>
move that line into the ptest images that use mcextend, or swap MCNAME<br>
for a wildcard if that would work.<br></blockquote><div><br></div><div>Yup,=
 I tested with your patch on main-next and it works.<br>Thanks</div><div><b=
r></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000a3f667061d704e07--

