Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3025CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 12:01:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73929.1778587269657091494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 05:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PB4xGSZs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44a044cb827so4266484f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 05:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778587268; x=1779192068; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Auc1vBBjDdgmG+23C8nrUn4IWv+doQ2MWxB77k+Rjos=;
        b=PB4xGSZsiSupuRbzJnKhCAv9Eqwi4+FLLXgN8NNUphHOG5KTX5UdB46o5fnNFjXmox
         RDr3J/flMTwyJdXWAy9BOVIuBsvNy++Y0U8bGJHc20bALh/UB2ziTbkW6IshFaRm6z7E
         nBhqKwHKYQhOgFxhpC+0lwXBX9rUK7beOMEQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587268; x=1779192068;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Auc1vBBjDdgmG+23C8nrUn4IWv+doQ2MWxB77k+Rjos=;
        b=mb07pcuPwfTHpJpJLk0PYAstCxlnw3Z+TShdn+Mk0VSG2ixT/uRV1vLWuuEL9jO/vt
         tCRePj25tyhtRKRkHAicBJW7kGpVg9Ol83UfBpPQr5qXIkiPAPgLScE0Vq1opOo60b1b
         PJsU2XVA9IKn6yWnq2FqPXFxtU+uH2KmUhfYpdY1hMY+CHvVZ0h4+svAiWdZrpglojud
         kzaCmRmF2GnQ/6qprSxxIuwcm4Ck8OCiVxD7zf+HOrnrMyrEjrKt+QJtYS4e2/K/142o
         j8VXNGgrkh+EyyfoxGVXMjK8JW5DPJTBjHnShog6ZZF1GmWhCIN1gFgKR3udCAFvLS+y
         kGXg==
X-Forwarded-Encrypted: i=1; AFNElJ9WdwHdnZ5G+7q47HU6AtKwpaVYWtsXqcZTpiO5gsfI0ErbjbbQcl0LEITQBnnhLrLjrDseFaYvZSfASiEo66N5Kg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbeIQnbJT/vjgOMB7fs625uHlCj85RiTpnjqyMhl7BoSsHHork
	yyBaFuzMOizQAL3UncUD1485OOP4IxqGmE9yXWazApoemB6K2TIE/F7uDiRWTRPWpcQ=
X-Gm-Gg: Acq92OHbaRBkZM7pKucOG6t57vbH6NjkZfnQ58xoEcUFrW6evOQAZ9tAVt7Tj3rEFrP
	WyTcpYjldG5KRpuWRgQj5ZZGCLSobrfQ0Y4DWMx1NBAE2V/Gg+aRNHFWb7JZjmQZ4IL+/wCas6l
	MPdViwl+YdPXilIaNz4gBnJWbGHGj2y7ahZCDVMIlnestjrr+Bn6e64rsCFbKhoWEmpFDDs8loJ
	Cjxfyd9bp4hD3xnzfH6a1Aj1xOk/11EQphpenZ7PrfgCpGrZOj0d9Yc0UrMhz+5UrOaPpT7aRYX
	utH1nB93uDDFMPSphWNwC8VHf4QdHYA1XEJ6C8CryoAdn1wKguO58w2HdfN8mNLL1trJ1eHVBmt
	+xS8a+5LxvqRN9W6WyqjwiBz9ReA9rnJgN8DuAIgfDlQ7zt1LuRYb4kmJNok8Tb1E1g7Xc4Gv/C
	yuZYkyOWDKuqO+6dbUV9PMIzlzMxlRx7qn5nwD07wP4pA8XzHuI6gAD8vn40Jmvi5l515/FUBrr
	J72UZVVDFzgHLOD
X-Received: by 2002:a05:6000:1a8f:b0:43b:9c73:2933 with SMTP id ffacd0b85a97d-4515b525503mr44242865f8f.15.1778587267980;
        Tue, 12 May 2026 05:01:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664? ([2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bbebdsm35350825f8f.5.2026.05.12.05.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:01:07 -0700 (PDT)
Message-ID: <1c32959b4e40bce9ee14c93107fc4b02b92d0a4f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] [V2] shadow-native: Change upstream status of
 disable_syslog.patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: frezidok1@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2026 13:01:06 +0100
In-Reply-To: <20260507121434.63608-1-frezidok1@gmail.com>
References: <20260507121434.63608-1-frezidok1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 12:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236880

On Thu, 2026-05-07 at 15:14 +0300, Dmitry Sakhonchik via lists.openembedded=
.org wrote:
> From: Dmitry Sakhonchik <frezidok1@gmail.com>
>=20
> Upstream has accepted configure option and merged it into their master br=
anch.
>=20
> https://github.com/shadow-maint/shadow/pull/1618
>=20
> After they release v4.20 we can remove the patch and rewrite recipe with =
the configure option.
>=20
> Fixes [YOCTO #15785]
>=20
> Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
> ---
> =C2=A0meta/recipes-extended/shadow/files/disable_syslog.patch | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/me=
ta/recipes-extended/shadow/files/disable_syslog.patch
> index 7299a8e61c..9f8ffcd379 100644
> --- a/meta/recipes-extended/shadow/files/disable_syslog.patch
> +++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
> @@ -2,8 +2,9 @@ When building images using shadow-native, we shouldn't be=
 spamming the host's
> =C2=A0log with lots of syslog messages which aren't relavent. Disable sys=
log use
> =C2=A0in the native case.
> =C2=A0
> -Upstream-Status: Inappropriate [Would upstream accept a configure option=
?]
> +Upstream-Status: Inappropriate [upstream has accepted a better patch at =
https://github.com/shadow-maint/shadow/pull/1618]
> =C2=A0Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>

Thanks for doing this, it is really great to see it fixed properly
upstream in a way meaning we can drop patches in due course!

Cheers,

Richard

