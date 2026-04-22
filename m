Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6233FF9EDCC
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:25:29 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82537.1776864326085748316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 06:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fM4KwxZ6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba699316b42so598086866b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776864324; x=1777469124; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HG+mkXDGYYYtUaakucYRJyuRw2vuyEuVq5Sgfn0u11A=;
        b=fM4KwxZ6G7Pa9Ki/kRKWoBZJD3CcrPq2rCCeuNy19PzW3RycK+CSh08p0uuH72LYJP
         rn+GmN5vJZqehJ0p+NtIi2/8eP5ze5g9dhIA6wO7PA6VaLtDuIPj39vt1VuNmJjAZRO4
         pAeisxsleRCQUm8Q1cVQj1Ysz6TEFJIasNj/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864324; x=1777469124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HG+mkXDGYYYtUaakucYRJyuRw2vuyEuVq5Sgfn0u11A=;
        b=JutTkBQ6oYN/v7Z9IEcbBQqv9l/jOv0KAMAr5pckMvgUTmI6BIrcZsHUXEYQpFz4Yr
         XkTa6T0q2T1EEtD4UuZcWjPqlZhX2p4LdpVCtzrcIOdNWoIFIYxF+U4TjwJHkPUpcvOK
         rP5RUCYoEgiUKanvQyZf7y6kimZRB0LSTNw5HWKZ3VikBhlE41Y/MQIaCOy9+Qd+4ont
         b5jI75QRUu9NKXMW3ydnWcAJ0TFdN8Z/fOH2v0cspctIZfP7QRLziT80OwzkZQt+n6fz
         ecBqvTpzBc2UVczbw2VlxJP4EwuS+u2fZWlNQISAXLZakhiwGszSTvxQJ0latcpy2EcJ
         K76A==
X-Forwarded-Encrypted: i=1; AFNElJ+DdKIuUnIlH6r4IbDBNgtqb7YfwLvlmQMB3OSL5kTwjQddggHE6oo/is3xDKG5u1OO+XuHqvxCNe77dhdQXX787Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yww6i6B1pCzVDOy5c+CaoMQstlLQ1hEnvzHY1wf7Q8NkRuuGLHm
	hbdaIFwtzgi14OZAVBPLLSO+LealvMwKLaK4BF+ZZgQpMxEJlSGlWTAOFa9J4tG0o7M=
X-Gm-Gg: AeBDietM8HUY+9N0phi7GkF0JHHm+RoVHI2xx/8IGOPXTDZwtOs8sBHb5jcsRn51X9p
	m1+k9axAVlA8yYyK0vRHFj3bPjsWDYkP/HCjHKIJw/wGcp7jX2Bb+juvK9B3gEidujSnt2zNnpK
	lU1e7u8tiu5T7nCXTgnyQyFjJ07LNEWqZqWVdL5wNa4OMnBBKzuP0zDvwgp4nP7AdDL4n3bQYFW
	3L3mpQBrTdk7MfEYct8UgphYrtjkCWw9+wggD48bbEjymTO91VPs2kU9jeVmI26WLGiGSyXrtUY
	/7wv/wIUhJFzFW8UJpPObKuu6Eu6oYyFhD5ZQcNWafuJ2Yxt/zJsv1TIOLCgAp84pQY8t/JCKnv
	1HO+x8KBpLumrnPadO3tuJaDaJ3sU3DxPEyyTb1eXaBdmH9DG6X3ecfCURQuX7ejQFIQRwEq2Xj
	5Zx5K34i9HLyMkWc7vQJePANB3oGXNH4qPGRxFFH/ONm3j+aeZkZg0tjJC/CQZJB0WgngpNnZS6
	53rB+QJaftlUYmwAJJCoclUrqM=
X-Received: by 2002:a17:907:94c5:b0:ba9:c0cb:f951 with SMTP id a640c23a62f3a-ba9c0cc0a0emr384003966b.48.1776864322224;
        Wed, 22 Apr 2026 06:25:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a9c6:3deb:bd01:ef01? ([2001:8b0:aba:5f3c:a9c6:3deb:bd01:ef01])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504441bsm538044366b.45.2026.04.22.06.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:25:21 -0700 (PDT)
Message-ID: <f31e54507859264314e5a258d60e35f04ddf87d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 37/49] python3-shacl2code: upgrade 0.0.24 ->
 1.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, wangmy@fujitsu.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2026 14:25:20 +0100
In-Reply-To: <DHZGGZ09LJY1.3820STLZWCV35@bootlin.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
	 <20260421095559.1856-37-wangmy@fujitsu.com>
	 <DHZGGZ09LJY1.3820STLZWCV35@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235720

On Wed, 2026-04-22 at 08:05 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Tue Apr 21, 2026 at 11:55 AM CEST, wangmy via lists.openembedded.org w=
rote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >=20
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
>=20
> Hi Wang,
>=20
> Thanks for your patch.
>=20
> You will also need to upgrade python3-spdx-python-model:
>=20
> ERROR: python3-spdx-python-model-0.0.4-r0 do_compile: Execution of '/srv/=
pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-=
linux-musl/python3-spdx-python-model/0.0.4/temp/run.do_compile.3385056' fai=
led with exit code 1
> ...
> Log data follows:
> > DEBUG: Executing shell function do_compile
> > * Getting build dependencies for wheel...
> >=20
> > ERROR Missing dependencies:
> > 	shacl2code=3D=3D0.0.24
> > WARNING: exit code 1 from a shell command.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3699
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3661
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3641

FWIW master-next has these pieces in already.

Cheers,

Richard

