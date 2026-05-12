Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABC6CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:54:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84749.1778615669293983288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HfqKZINC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3686867f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 12:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778615667; x=1779220467; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2bD0FD9UwUvGkVdQh8b2IRBxiI5RKSYNY1LhXTgYnBk=;
        b=HfqKZINCH1TAOpyxLfJXF42IZdoHo4Us6lTfqu+brKMONBUxNiruJTKHfEDBRo+AsW
         LY/yCRBdoFBFPjRLfcd4VG97pXMXlW4ifrIfcB5b569Pq/nz7b+ivH4ha9ILZDL1zA/9
         uKM4CKzQqu16zm9xM6FTt8B1JO+qToVDCbFfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778615667; x=1779220467;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bD0FD9UwUvGkVdQh8b2IRBxiI5RKSYNY1LhXTgYnBk=;
        b=pWRdOhIAMhKqJW1N5jKRYxebVcyFPQsfo2fKwk6v5cuyCEL16LVN7mKQruRRosdqM1
         bpdpqZjHX8/MuktDX63bU73wdZenewuelHmoK+lNaeXJstd5oquQaQTBNiimfCGMrrfH
         ENIAZSULtEyNafKMG7UDEOgzJHhEP5bNRXb7ycYBCdLD0J5N2aw7+6Y+XLjMOX05Kb0m
         wy0Z9Mt3kcTDofeF20diAGVf/yyOpZR0m6S03gccz4jM8LKGrAyRQ3MA/nqXUk9XlFHx
         78EjyXmi+5jKtRCLLZoHvC/2HvQ63Z+e9ThIs3QN6H1QWfEKtHKmTBnMwmMpQzY35yXz
         ABlg==
X-Forwarded-Encrypted: i=1; AFNElJ9LB4yvxrPTB9CLIdDXyaCgSH7UZY+ckVdwlQyBoI80aJBj34mDA1KV12n9IM6xAS5CVxYDw0wdMkRJA3JLiFelig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YywWQVOsbZqUMnx5CcojwMXZiAc1tihbRT9/d+J4gaOR5QAU0eZ
	E0B62o3xfidwbRf55dMm2I1nuGT512MEL1RfYUEz63UOrNitAXrC7RazoAR02lGVw3k=
X-Gm-Gg: Acq92OHvi3b3QnLrkynxtq/shk9rchtLiIu5AzsbfGVczg9C0b1Xy5/xfQ8BjGtBqmf
	pP3t6hjBK4X9MFAEcXDjufXnTkG07lkmK76zR2jEyQpsrEcQ6iqs4QUYOqQAMyiPXskQW68Yjfb
	zwp8p6V9SoTVhhB4Pm21WAyxhfYIYXoYVwT+aG5a0HMae9Ziff1ujKF66vSQfrBaEDT9O6fiCI9
	GiPn9nMXqxFsHJMh1nn0MDe/VCYV5BMepzJvZGuBzsOPcIFDXCy31Eft4YU+nmInr9ZCYl9DWKO
	dSPGtIaWtoSQCgq1Pxqcbmr3N1O66lM7IKzIfLbMBUV6a2Y2UTW94dlPQuuaGCqf0d3CiJ5COm5
	22pGf+luBPLcF3SFJqPEC1EWjlN6VsbIfQLxbwoUmwnKuJGN5b+Ap/d8nnaRblWZ0SqXYXDdeaE
	SGF7fYh3TyRd/yVn6eZrInSa0nAS3QrAX/CUDZJq/R7YiULfaBOdCNKWjG8s/E883MOJh1PHpCt
	T6wFYgCoUA1eAXD
X-Received: by 2002:a05:6000:2011:b0:44a:fa76:5193 with SMTP id ffacd0b85a97d-45c583b32a1mr263620f8f.12.1778615667513;
        Tue, 12 May 2026 12:54:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:87b6:da5a:2bd9:3c4b? ([2001:8b0:aba:5f3c:87b6:da5a:2bd9:3c4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm36220739f8f.30.2026.05.12.12.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:54:26 -0700 (PDT)
Message-ID: <c4907f3fbd465de7394dbee68de56dfca2555191.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jeremie.dautheribes@bootlin.com, openembedded-core@lists.openembedded.org
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
	benjamin.robin@bootlin.com
Date: Tue, 12 May 2026 20:54:25 +0100
In-Reply-To: <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
	 <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236913

On Tue, 2026-05-12 at 19:01 +0200, J=C3=A9r=C3=A9mie Dautheribes via lists.=
openembedded.org wrote:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 objset.objects.add(objset.doc)
> -=C2=A0=C2=A0=C2=A0 with dest.open("wb") as f:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 serializer.write(objset, f, f=
orce_at_graph=3DTrue)
> +
> +=C2=A0=C2=A0=C2=A0 if dest.name.endswith(".zst"):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_threads =3D int(d.getVar(=
"BB_NUMBER_THREADS"))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with bb.compress.zstd.open(de=
st, "w", num_threads=3Dnum_threads) as f:

This should be derived from PARALLEL_MAKE, not BB_NUMBER_THREADS.

The latter is how many tasks bitbake runs in parallel, the former is
how many threads the task should have.

There is a function somewhere which extracts the number of jobs from
PARALLEL_MAKE...

Cheers,

Richard

