Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33CFCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 20:32:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.30.1755721919130214271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 13:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CcJQqR0M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso168190f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755721917; x=1756326717; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVBbRfNI9ANQjzSFjox8501swvC7NvdcmDJEf48ByR4=;
        b=CcJQqR0M3iYx6YrUuWqLc/Rt/d061Rbz6/M7qCVIAIR+J4MuZoYsgdTJZP/an91Jgf
         AWhFuXI2P6VxVPw6ivsxgxNrYU0IqBnQkwXBYhFjNt/xjuA9l1PZPj6RMnXdOlFTlXTO
         O3qXX06MyCY39p5lWBd6/gRmdSUaEY5NvPWBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721917; x=1756326717;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVBbRfNI9ANQjzSFjox8501swvC7NvdcmDJEf48ByR4=;
        b=gZ3bVF573ydPYzmWG79fRIcrn+Gpu+34g1sp6n4BTOw/1sqxw8L2hbhvDKDFatNhb+
         sbBAdLqzAXAW2TIdfJCeDW2dQ3hPTVGpUyqjjltOYy+w6T9qhnRneymB0KK4L8uGXxyO
         OXSoIo5JRLOtOdCg+LNi5nCXcibvP+sYRIUZeAQbl2dxljhxU96LEIsTPIq7zFNttcxt
         l4BjzG0qXqKEJ9xDCL2QesRKJaGjPQ/HOpQp4K8rZ4teUPm3uVkpxXiSCFEvVsEUCI4J
         B5PWnZuvlQzz2oiTo7d7mxP333nKp/ZmMiW7UrZuTD+Vhjm0XEc9sdD/aTiXPfW02pXj
         vZGg==
X-Forwarded-Encrypted: i=1; AJvYcCUzpioZKEhEVhCj/3+D9mafmx/3mYhn2gWjHYBUkHofYwAo5Xiu4dLk2tbIAOgZXtYFTNF4xX7ATenhDeltECJ3YA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywj1d6XQD42QmmSHfmeEuEXJgqJVqrXvAPYmTDiBMPK7+Ed4RIX
	IfGY7Jr90FqQdSkke6XASjpLiQgvyjAHS4TcVvgfD2dM7wG8kaVexWfWgMI90DJGZZA=
X-Gm-Gg: ASbGnctrvWqZ5es0OhzhVe0JrIEBb/y4+sizvy2VN4H4DobsNawjCLkTyavKvmVXW5M
	2lDKgP6yTvfsUtYszxDl17o8DsA5zuQtWFWCJlHNh04FK+UsGCmNg4vhMS2rddKFQ2QXDjpiTQn
	4LYs3xDhBXlnCPaPDQcjYsRZH0gbwNQTUUKX+6acA+FzuPEKlzt7CWlySg4XAsHNVz76Pta/Uq8
	4xoZAn/Y6WCR8OU8P+mKlYUzcmIARHeUqecAH1GIWPoXNnwkF+c5Ahaon+vzEIhbHYp0L6M6n65
	rZtE0296/5N0GpNtEV7+109y5hFZnnnrsz68ao5NVXKCmECJovk4KA0/rUWp04kUHhQELiM5f7s
	U/kT9obkZSRNe+R1PlKcVnHmoF44jaPAoFH2xCwEVhC6SFJOP4Qos52gEM6qJ19ess4ZkbBcyB6
	hJ9dhs4FbZbdmSwS6LqzmnMg==
X-Google-Smtp-Source: AGHT+IHBGxKxMGqoXLIyLQph9G2yRq6orFxtC/cqOUEfm6wTJ2AJQZqBR+144w77XSIqImrfCWpPpw==
X-Received: by 2002:a05:6000:18aa:b0:3b7:99a8:bf6e with SMTP id ffacd0b85a97d-3c49640bed8mr115180f8f.51.1755721917328;
        Wed, 20 Aug 2025 13:31:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2407:63e0:8092:e22c? ([2001:8b0:aba:5f3c:2407:63e0:8092:e22c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07487978bsm8737757f8f.7.2025.08.20.13.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:31:56 -0700 (PDT)
Message-ID: <04b5dbc353cf8c22eedc924d17bfcf0c64e6cae2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] scripts/runqemu: raise an error when bitbake
 was not found
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: r.gruenert@pironex.com, openembedded-core@lists.openembedded.org
Date: Wed, 20 Aug 2025 21:31:55 +0100
In-Reply-To: <20250820061959.22598-1-r.gruenert@pironex.com>
References: <20250820061959.22598-1-r.gruenert@pironex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222196

On Wed, 2025-08-20 at 08:19 +0200, Richard Gr=C3=BCnert via lists.openembed=
ded.org wrote:
> I am new to Yocto/OpenEmbedded and compiled poky by following the Yocto
> "Quick Build" guide. I later tried to call runqemu
> from a terminal different to the one I ran the compilation in
> and runqemu was not found.
> Wondering why it was not found, I ran it directly as `./scripts/runqemu`,
> which was a misconception I had because you are supposed to have
> `oe-init-build-env` sourced. However, there was no error that told me
> this when running runqemu like I did. So I thought it would be
> good to add this error message to notify the user that bitbake
> was not found. At least it would have helped me and saved me
> some minutes of head scratching.
>=20
> Signed-off-by: Richard Gr=C3=BCnert <r.gruenert@pironex.com>
> ---
> =C2=A0scripts/runqemu | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c24528eac8..6a36fdc011 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1715,7 +1715,7 @@ to your build configuration.
> =C2=A0=C2=A0=C2=A0=C2=A0 def run_bitbake_env(self, mach=3DNone, target=3D=
''):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake =3D shutil.which=
('bitbake')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not bitbake:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 RunQemuError("bitbake could not be found in your PATH. Did you forget to s=
ource oe-init-build-env?")
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not mach:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
mach =3D self.get('MACHINE')
>=20

Thanks for the patch!

I think there are cases where bitbake isn't needed and runqemu can be
run without it so this change will break those use cases.=C2=A0Bitbake isn'=
t
needed when the path to the qemuboot file and kernel/rootfs is on the
commandline.

I'm wondering if we can detect that and/or put this error message onto
one of the later error paths to hint to the user the issue?

Cheers,

Richard



