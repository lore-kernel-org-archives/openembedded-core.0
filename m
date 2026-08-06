Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E5AC561E6
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 08:47:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15356.1786006065263697738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 01:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=beyT7bI/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so21819575e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786006063; x=1786610863; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r3GMchkjRK758thNRJFAEwELGkQEdwr2Y382Ty4rDrA=;
        b=beyT7bI/PJd1LIJsNSJ9LLBTQcjV5Nt2Hq0VootxwNmTZOzeVw8PKDWOxCk2oAZpHa
         OQ/3GtuBXjQROsjp75UPxwbRvF2rtGxR9YlbQxOYLmlQKA7deqykSg1EngyT2S9A4aQX
         Uym4FHKhLCdXnr/R8bYhNqk9+yBhpWGv9Sn4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006063; x=1786610863;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3GMchkjRK758thNRJFAEwELGkQEdwr2Y382Ty4rDrA=;
        b=nef7ICny1qg1m/Gf9ma9GWiPmgpT42cS1jR79J529KBOKgQwfi9W/WfPSX0wqZIvvq
         jaZEG5lC1tnMe1AoWJVvtq/sJN6VhyU2zAj5wRBuHcQTJ5LMfUMNq9N0c/S1rSux/i81
         jEsWhvnQG1oVWCqNduVSBnp1Jck04H145aVyDi3OHeMqRr6IEJuXFjXzpzxOFkUFRQCm
         e21UH91f2NLfCseLIrPXq9pxt/O7LbzDNj8VBHfaH97UMJftVUHBln/JOc3EDSIUtie7
         JYaek/LgDFpxthp44z2BWgtu6AjFO544LXKC/JiViEOWJUoxVDBcvisOUaDjjugBWS3/
         y54w==
X-Forwarded-Encrypted: i=1; AHgh+RqJjGuPBtevap2sUzPlgIupt6LE/wh28h5g2LQGBCb+Ooa1MHem4HwYoYhJ/oHtklgvxiJZr12qwNo5x3NDqTTWkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJrYxAeD1twedzJkzDqm2Yv82M5pHD4Yp6kDtzcjEmiG9wzX3j
	lXEr0m1/+z/dkieaSf2Dhc1DMdFWj+htkYZAy7GzzcmvQjJXB3RHs28prPKCL57PR+o=
X-Gm-Gg: AR+sD12zjfFSfH0acs44mkMb0swJGIuKOlwfIoOG1R7jFy64dqrtY8E1Cal6XYAcCPy
	dTIesoKMn1J91bRMjjwGynjl3G3V4cJu1SebcUy7zlXLOoeJl4F5hQeYEvzvlH4K44sE6ZmFvWM
	ggETZdvT8uLDvaeXm9mrdmHcXGuF11vR89sV9+j33w9O36WkqQMdUy2npYQU2P1tb2jqYk8KFsa
	9x1a0BlDXp9Jff3u/mHjsMV+v6aCJtCINr3MqvFhgSg7O+G+CV5hX1GpFQEHR2p4z7UEDvI/bnh
	YygGpT4mHXKpyZVbTaLqENUTXjlplCDyI2B5qxz5sXA9riINmyDN90FZ6ABeKaePmn/Hu61694Y
	xdrmrhahC+nWoCKSPZmaBb5dddV30TD3IivJ+rcm+SP1X49268XKEnQtQqCjA+YIwhqdXIP28tz
	S4BqevIeW3eDD2uLvfY3Q9PzMxhhdzn+ZAfMMIbLU8m0UpBnR3oe7uh3nkorr4++F4P1imNgB5K
	C6mYwSuyAjSDSZCUxYV3rBJGPlMo2hb/7hd3uUY/TcHOohs4NW3ng==
X-Received: by 2002:a05:600c:a202:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-4994e7d01b1mr131557245e9.15.1786006063439;
        Thu, 06 Aug 2026 01:47:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954206d72sm67994005e9.1.2026.08.06.01.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:47:42 -0700 (PDT)
Message-ID: <8a97f9a75449a32975930615f1e16d2b0491235c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] glibc: remove obsolete parallelism flag
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Thu, 06 Aug 2026 09:47:41 +0100
In-Reply-To: <20260805160320.41908-2-ross.burton@arm.com>
References: <20260805160320.41908-1-ross.burton@arm.com>
	 <20260805160320.41908-2-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 08:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242921

On Wed, 2026-08-05 at 17:03 +0100, Ross Burton via lists.openembedded.org w=
rote:
> Several problems here: the comment refers to PARALLELMFLAGS (which is a
> variable in glibc's Makefile) but the actual assignment is to
> EGLIBCPARALLELISM, which is an eglibc-ism and thus not respected by
> glibc. Thus we were emptying PARALLEL_MAKE and so not actually doing the
> build in parallel.
>=20
> The Makefiles as of glibc 2.44[1] actually build in parallel well using
> the standard way to pass flags, so drop all of this logic.
>=20
> On my machine this has noticable improvements to walltime:
>=20
> =C2=A0 do_compile:=C2=A0 86s -> 44s
> =C2=A0 do_install:=C2=A0 55s -> 40s
>=20
> Note that there is a PARALLELMFLAGS variable in the Makefiles, but using
> it has marginal gains over not and upstream are looking at removing it
> entirely.
>=20
> [1] glibc 7cac99621e ("Makefile: Run the subdirectory recursion in parall=
el")
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-core/glibc/glibc.inc | 7 -------
> =C2=A01 file changed, 7 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
> index 560ebef677c..27a911dd8ff 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -29,13 +29,6 @@ CACHED_CONFIGUREVARS:append:mipsarch =3D " libc_cv_ld_=
gnu_indirect_function=3Dno"
> =C2=A0GLIBC_EXTRA_OECONF ?=3D ""
> =C2=A0GLIBC_EXTRA_OECONF:class-nativesdk =3D ""
> =C2=A0
> -# glibc uses PARALLELMFLAGS variable to pass parallel build info so tran=
sfer
> -# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
> -EGLIBCPARALLELISM :=3D "PARALLELMFLAGS=3D"${PARALLEL_MAKE}""
> -EXTRA_OEMAKE[vardepsexclude] +=3D "EGLIBCPARALLELISM"
> -EXTRA_OEMAKE +=3D "${EGLIBCPARALLELISM}"
> -PARALLEL_MAKE =3D ""
> -
> =C2=A0# glibc make-syscalls.sh has a number of issues with /bin/dash and
> =C2=A0# it's output which make calls via the SHELL also has issues, so
> =C2=A0# ensure make uses /bin/bash
>=20


Unfortunately
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4399
is full of what look like parallel make failures :(

Cheers,

Richard

