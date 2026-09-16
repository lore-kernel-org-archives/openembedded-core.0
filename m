Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4BEC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 06:46:29 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8996.1789541187900856789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 23:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ICqv9FHd;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so2498845e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 23:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789541186; x=1790145986; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YXEuxWP5UnSjLRGrbOHfD3a/YilfAW/moqGerch0Jdg=;
        b=ICqv9FHdWhFokp33FqYCaTVdCpDs/AtQxiO+FDrGV9Xq6BFTg/XxzjBsjukxxlht0K
         pKvkujRSLCZLMO5m1N+qCaQ8nYiJNjqlRNtk69xQXHXNvynnTgP6ZtT9WY2VAzZ73X7q
         JxvZjIxyTedSZ0ISenJSNwG4VNR62q9k2Mnm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541186; x=1790145986;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXEuxWP5UnSjLRGrbOHfD3a/YilfAW/moqGerch0Jdg=;
        b=IUWap6/tYpLvxrd6L3/arEX9efcJQwU2bFjQFeC3yVS9nObkTEZ1DHR6n96hBp3v0F
         tmevmFn8jDzX7LcQVH73Waf28iMKXXzcxNNs+/psM0NmaGzFawhFL3bA9ZzKbTN508dP
         fb/J4EX3oY7y6zsddRiwVBhkrJRGORmvR4ko2WlR6bfoyGIWlOqywDDiy9DCHAMR4tn0
         W2nQ19+bf+LLMtBVRqEgR4c3QKdcDZhqxH+ySe6EQrjVbiobAGRx62qO2L8ZjEcAmV10
         R2cSHjyXs+RItH3y8tfx+lov9v93mp+dArJqz/w6KUqJH8RfUWuUba5mScQoMwK82YOq
         YzmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRLjVH+JXfhaBZV/PxXpu29cP0fGt8gVRaymsKMsW4PocEpQPGFMGhKibkQ3k2viSYgeMq75lR4urCa6Wku/qCeA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lp0F/ngJkNyLvSiriIvMcWU+aIqa/Xlc1OvBLShAeblewL9q13
	2cL+V2f2ZqaqloK9ssi+3K+XvyMl3t5vudX9EP1oufAnjJT7LeG2cvcJQ9VjpgHlciE=
X-Gm-Gg: AYBFou1qeVPw8giW8nTECGEwr2oyP0O4Zt+HaLgh57Sl6Nj8qrww02MQdfoJP5rMRVl
	SH95wzHvY1rjyMr9Xkzngg/KcQPexuBRdxAcaEL2ArnFEctUqsG6goT9QmfuVMUnPGgbGouVm6l
	KdKEtKBMLHladvn2Vlrjlq4iChR87TNuvtKo1M0xofPlfkNftvUqC+m4+rAxMZ7FnAEtQlolT+U
	pDWk0XxRGa4U7yPjrIjN/+q39x6s2FEsvGJSu6CsybfD84wHUHVVdxY4PE0ARWiKw7ML8IJKFzG
	7mGqdxz1v0CGCm2DsIQXH9aRgn26ctsY1oFH1VKxAs7iym0vd46HHu3a0/WpT2FJ7jBRB5OLrtk
	/Su0jOQD0TYfanqtV8B+hPYlnCKFNLhZjtbTk9k4TmeL8YkXuw+VRUeFXNLFwQHub1PRtkcqLgU
	gkiRSscqH6WPKNaABTxT9nJ+XL7d8IkXVbMSu5wVBkCrFs2ZWC6zWHPDXD3aWnU+e4uXHBXvD3Z
	xKy+w9BUiNdUzlufFhko60Ro2Ju4mKJZaxyUGym+fkkp9NpKoEjQzbBbuay+yyU
X-Received: by 2002:a05:600c:5394:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49eb7337437mr11023785e9.28.1789541185986;
        Tue, 15 Sep 2026 23:46:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09? ([2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da071asm65993615e9.8.2026.09.15.23.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:46:25 -0700 (PDT)
Message-ID: <518e926c64922a9536e8cefda7ab96c27a05b190.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2026 07:46:23 +0100
In-Reply-To: <20260915142632.589500-1-ross.burton@arm.com>
References: <20260915142632.589500-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245928

On Tue, 2026-09-15 at 15:26 +0100, Ross Burton via lists.openembedded.org w=
rote:
> Lots of upstream changes, see the full release notes at
> https://github.com/cython/cython/blob/master/CHANGES.rst
>=20
> Disable parallel builds because there's a race which causes occasional
> build failures. This has a non-trivial implication to build time (89.1s
> to 243.1s on my machine), but it builds.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0...place-not-predictable-build-path-prefix-with-hardc.patch | 4 ++-=
-
> =C2=A0.../{python3-cython_3.2.9.bb =3D> python3-cython_3.3.0.bb}=C2=A0=C2=
=A0=C2=A0 | 6 +++++-
> =C2=A02 files changed, 7 insertions(+), 3 deletions(-)
> =C2=A0rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb =3D> p=
ython3-cython_3.3.0.bb} (85%)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4993

:(

Cheers,

Richard

