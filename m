Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B677C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 13:13:28 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.37797.1721049203760790416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 06:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RMvyPCEX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52eafec1e84so5741448e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721049202; x=1721654002; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FZDKDeSvvCuIE9KWcyOL4Xa7f0OVNkOryJ1Ui0ZFr5I=;
        b=RMvyPCEXvmT9mprMnLQ89l4BzA4w3uKc2W9wUjWPpGc1V4inHWAEg/tEylNiW/34qn
         9O0GAQLv7ArC6pnebMVflp97PwJOlyCpfj60clpXp2MKFQNZcwWij2b+UA/UD5ThjSJu
         DnieX6yKxbC2vOJEVmpDMlqWmxYaAB3MbbOMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721049202; x=1721654002;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZDKDeSvvCuIE9KWcyOL4Xa7f0OVNkOryJ1Ui0ZFr5I=;
        b=hMAyCOzeBzdnxsIR0DvpJq9onVZ3hE9JwesgoR0z+KfTiD4x8LkH0GUG+GA0tdctGz
         100xh4Ng1XUjTaBjfSmXi7tKpDlsFcpxqobxqxQ8aKu6d6kdLQnuiMI0DtiZK8m0rll/
         nA/Zi7cwYJJSrHf7ckfuKWTAeXq9pd5gKviQiE7e7fDF3d2pYl34IXoZ9ZWt7qCZmVR5
         EJDmlgtc2fSVx4VhY9MmcOEBz4yjHm65MWlH7yFRg4Amt/PubwxgWtsZCLr8TUbd4asV
         ormcajgG27nk6yk/v79MELtWxDXepVsEXFJLUWjRjAi/LA6lBdnAkv9b+6fRuH+dS5nE
         WUPg==
X-Gm-Message-State: AOJu0YyoVLNR+cC+sYI7jvfbfhN/WHoNpsxUsm9WBMJHeeVtvooP1uBT
	DvWcJt2rDRLYAGo3bNyz+goVz+FMI8Ekp04cJaVeOwpuVDqK59/rGwtSl5ePSMs=
X-Google-Smtp-Source: AGHT+IHqQhV9JA7DEUUnL3AbSzgYn7sdgfgt0qfP76Yk0mNtwWV/c14h9eDfwNuddizhIyTxkk5fvg==
X-Received: by 2002:ac2:4e09:0:b0:52e:943c:c61a with SMTP id 2adb3069b0e04-52eb99d4bc5mr14527379e87.57.1721049201722;
        Mon, 15 Jul 2024 06:13:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b820:e15f:2b8d:2478? ([2001:8b0:aba:5f3c:b820:e15f:2b8d:2478])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb530sm86252035e9.29.2024.07.15.06.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:13:21 -0700 (PDT)
Message-ID: <f6af48a9af1107d8555767c64010779ea15d3105.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2024 14:13:20 +0100
In-Reply-To: <ADC09946-15C3-478B-A833-DDC3A595820F@arm.com>
References: <20240712184358.3103083-1-ross.burton@arm.com>
	 <ZpT6c4hgYV6xIJsf@nuoska> <ADC09946-15C3-478B-A833-DDC3A595820F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 13:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201925

On Mon, 2024-07-15 at 11:18 +0000, Ross Burton via
lists.openembedded.org wrote:
> On 15 Jul 2024, at 11:31, Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
> > > +=C2=A0=C2=A0=C2=A0 def test_cryptodev(self):
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with tempfile.TemporaryDi=
rectory(prefix=3D"cryptodev",
> > > dir=3Dself.tc.sdk_dir) as testdir:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
it_url =3D
> > > "https://github.com/cryptodev-linux/cryptodev-linux"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=
 This is a knnown-good commit post-1.13 that builds
> > > with kernel 6.7+
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
it_sha =3D "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ourcedir =3D os.path.join(testdir, "cryptodev-linux")
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ubprocess.check_output(["git", "clone", git_url,
> > > sourcedir], stderr=3Dsubprocess.STDOUT)
> >=20
> > Is there any way to cache this, e.g. yocto build download cache?
> >=20
> > Adding Internet downloads to test steps is a bad design IMO which
> > eventually
> > causes a lot of failures.
>=20
> Yeah, I know.=C2=A0 Calling back into the bitbake fetcher is an option bu=
t
> non-trivial to be honest. I hope that cryptodev will make a new
> release at some point as their last release doesn=E2=80=99t actually work
> with anything you=E2=80=99d consider a recent kernel.
>=20
> Changing the download code in oeqa to just use the fetcher logic
> would make sense, I=E2=80=99ll put it on the list of things to do.

Where we use tarballs in oeqa, there is code that just directly fishes
them out of DL_DIR.=C2=A0

Locking becomes harder with git repos but it shouldn't be hard to use
the bitbake fetch API standalone from the metadata.

Cheers,

Richard



