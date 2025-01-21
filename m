Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB06C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 08:55:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11830.1737449710986961984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 00:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d9tjLoM6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso36859125e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737449709; x=1738054509; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg3BzUqPTniQQgKejkxAlm54ei18I1eVxTc8WJG5Tsk=;
        b=d9tjLoM6i7lXwq1xlngdpC0uv+6TuAyHyeasD3iNhmxQRbFRHWfl5hP1bSTPcQmwCw
         vykMGs3jZs+qMb9djxcrPGBLkKU3UzMZtN6FwhgnFp8iTg1Xj72pydZyIe0e/FFcToBH
         MdjWzL5osOsduPza4jbhFvGLulpqYvNQSDx9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737449709; x=1738054509;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eg3BzUqPTniQQgKejkxAlm54ei18I1eVxTc8WJG5Tsk=;
        b=wUwLKr+kv+b0guBjJEhcr6NkSBtN4/OrkdXZV+RkuYIAVAQEAQgryMdcE+A1mCOwNH
         HTI3LFZb4nafqZTb1KQUYV1LSvz+0dz3c//v5hqnN84c9ThidgvF75+MwnMmU60zPCHm
         CUjZURmJlf4sHz1gu9E5HWRsF33jagixMzi77jFPQAF1KyHh/M2kwQRiMN7Hfn/wKBQj
         crv1A936a7xXBhVb3oGHFqKCoTEdT1uw6CyVCG/Giy7rHhEcnbyF02kV8oRhfgOvG9ON
         +0Q7sZwUCv57W90SsnOuOc/Ig60KnZuHwYmohkMbyZCsBLaSKHdeHnBkaytWhszQzFX9
         zQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCXQ99mQoTNIG6Xyy/hJwlrIX/SVZ9uFH6HFj4dld/AvSA5kAXqHgaxejRxBa2EHxmTJz9IqTh3Ebnji0X6ckKGDxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YysJlX+QwshZxnmy57Hv33QCwQQtt4ZNPjJ0/lPVtuNfst0Pb8A
	5Y5LugEiSAzX02StLYJ7y3gmPFYecSzpwu52FJLFzdkifsURqKZy7bb61lnijhI=
X-Gm-Gg: ASbGncs5DpUW057XSmuI/0XyVijD+uOphZPOimOsImyderg6zwD+MrPADYdLJ6/4fVo
	FaFU9Wnp/MoKr86AC30ATHNFcFial6woem6s3kB2tNehkma/d/7q4+LAlHzzk7V/AqcUtk730ge
	YLnDxaPQ74AAXMMZCfaxmcNU/4q8QvcUxvWgaqaiCNfokJSqe/dZeW8dH57y/OlUwnHNtXYiN7v
	X4OL32ccaChhrc/mGIQQOnlubVxy7v179XHpmqq2pqeVvm78d0LflgFo8XWTiK2x+nZL2mQZOGf
	ilXbF5Nsfkl93/c3iBtA4hkZhWwjUbmkuI8b5kVlLbiU/E/BVX3/CfRq9Iw=
X-Google-Smtp-Source: AGHT+IEeuLVwhd2W8OluJamWUo19B+6c3U9nNruY9CuPix4we9m/SHJ6ciAHMvbWsf7j/W3QO+q0tw==
X-Received: by 2002:a05:600c:8717:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-438913ca6acmr171641585e9.11.1737449709335;
        Tue, 21 Jan 2025 00:55:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e272:e8bb:f22e:9203? ([2001:8b0:aba:5f3c:e272:e8bb:f22e:9203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904087cbsm174974565e9.3.2025.01.21.00.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:55:08 -0800 (PST)
Message-ID: <3258af1e3c4f84058976961be7a8d717f4b803f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cargo: remove LD_LIBRARY_PATH wrapper
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jst@mbs-solutions.de, openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2025 08:55:07 +0000
In-Reply-To: <20250121081220.35589-1-jst@mbs-solutions.de>
References: <20250121081220.35589-1-jst@mbs-solutions.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210072

On Tue, 2025-01-21 at 09:12 +0100, Jan Strater-B=C3=BCddefeld via lists.ope=
nembedded.org wrote:
> Fixes [YOCTO #15579]
>=20
> This commit removes the LD_LIBRARY_PATH wrapper around `cargo`.
> Setting the LD_LIBRARY_PATH causes many problems.
> Some build scripts will not run because the build scripts execute
> binaries from the host system that are not compatible with the target
> libraries.
> Even a simple `cargo help build` can fail because it uses `less`
> internally, which should not be linked against the target libraries.
>=20
> There might be cases where the LD_LIBRARY_PATH is needed for some hosts,
> like the case described in 388e7cac9f90e79ce8c3c1683d8ee0f4df1bc907
> but one can always set LD_LIBRARY_PATH manually if needed.
>=20
> A current working workaround without this commit would be always using
> `cargo.real` instead of `cargo`, which can lead to confusion.
>=20
> Signed-off-by: Jan Strater-B=C3=BCddefeld <jst@mbs-solutions.de>
> ---
> =C2=A0meta/recipes-devtools/rust/cargo_1.81.0.bb | 8 --------
> =C2=A01 file changed, 8 deletions(-)

That wrapper was added for a reason. Is that reason still valid and how
do you plan to mitigate against the issues it was originally added for?
The commit message needs to mention this.

Cheers,

Richard

