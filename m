Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734C7FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 09:36:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35030.1777973807622510533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 02:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aol/OIJA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488d2079582so53725375e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777973806; x=1778578606; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZVA29xqEIjjWBx8CPt+0Y0/GgLcv3TpE+KXPlPQiYHw=;
        b=aol/OIJAPA5RnWdB8evXVUp+vWWHY2TN5HhcCOvXGKe5X4Bj42CpGi+UXnMviMhyPp
         KiHvvShYP2FLb27RlDm2khofjcYYhsHRBIQ50Mww7J042t9H1MXw4vnKECclg9LBCvMI
         tskTZzZBPfPl/wwzihKg0HyoOWIdfzn57MwR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777973806; x=1778578606;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVA29xqEIjjWBx8CPt+0Y0/GgLcv3TpE+KXPlPQiYHw=;
        b=OlxHnRhS/kSpAtv406xEsp2W7UpKTuMjhu/6mlfG0sZSdYSUk78EkCIZhFaM1PuQgw
         w/Z41UnC8ZfH+mFaiLLNDI4pyDo6uzCJ+SxSXb/ihxvyXJL9uHeb5cMTeOJmNlVz8J8y
         jHDV6blmZbO9aHhSf6h9nYvQ34qm2oawpcKjC48RQh/uK4yXw05swPcZZXQoH+31Fydb
         j93jPGKGgsLej04rSi4OrNoyxJFbzh3RCVikC29xBvnEtAffVYGcw44patEQUiHIljoc
         I/XHNMvJOeQCMpONHvmpPDPUdNpHr1aMQuzj+LFdTRFF5ncveQXBlLoih0w2lN9S8Orn
         gjgA==
X-Forwarded-Encrypted: i=1; AFNElJ9CcrMW+mQE0t3pH+yfbroto81/kQX4ciSeGIla/BsKhoI8QBgXWGMsbqAJHnxSSnLiebFmJX25a/Qh0ZGMklppKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPH44CwzsKgIt3lptIp+beu4PI2KR5BeWMuJgExGtPh9juTIjv
	OwGM3ogySucM5lZFITN0RzoT1ZVTRZcSonIUrDVWCdKfW0LZtaLnoUuexaUUmrYDPTJoxcTChYM
	KTdV0w8w=
X-Gm-Gg: AeBDiesXNLgXzkoWLY20iVpNLdLJDNpIEeJA4VYBLH4HGQPpJWlYMdN0WglOr6yKSi/
	0oWNTH1V1+MvE8AmjnjSKGYntqBgVtm/R1VPXr2Q3bZZIULgKcAj/gOyFgZfWOyHZ9q3p1dPNhI
	NBRZv7X+hEnoHtpfTXPTQrEfI6fOlYpjBXFfDxqTDv7iu0x0hSQ4/kyyJg1OF7J/2QHfkJmQJ9m
	5ltgpMJh/spotfRKkkWlmQahxmp4SLHgbAtX2D9ckiBaU64EYwK6N8qFtyfZWcJ48Je5EiLUz/J
	e3vfC2dEeiDvZt5OvgIglzxpsKX4/r5nhxKAK97bQma5727nf11VG/YZJgv+GC7qoDxZNDs+ntg
	2H1yTR/x3yvzzdLO576Q80rj0e7RiSgjcEPoKYvCHmhVgl/+Lazx8Ky0EJlSsHWBhyMrescdIZ2
	d2plmlsII/nPo/2J6kMJbn1sS9G2xdiaYGQOYBJR5wzfsgoz7HvovwDFMk2fLpEKVI4OVHGE6eU
	gjFhrZwZ/hOz2915coEvENsmGE=
X-Received: by 2002:a05:600c:8b8b:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48a986763admr228433465e9.25.1777973805903;
        Tue, 05 May 2026 02:36:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8349:ba09:9e5a:e125? ([2001:8b0:aba:5f3c:8349:ba09:9e5a:e125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d177029a7sm19354745e9.6.2026.05.05.02.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:36:44 -0700 (PDT)
Message-ID: <fdd844616b3283408f9190ca26ccfe13390358ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5 v5] rust: Fix rust build failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
Date: Tue, 05 May 2026 10:36:43 +0100
In-Reply-To: <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
	 <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236476

On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Target LLVM tools are installed in the sysroot because they are needed
> for llvm-lit to run tests. However, this leads Rust to pick up a target
> llvm-config that cannot run on the host. Overwrite it with the native
> llvm-config so Rust can execute it correctly.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust_1.94.1.bb | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/recipes-dev=
tools/rust/rust_1.94.1.bb
> index 3eb2a36406..e4a9f20e27 100644
> --- a/meta/recipes-devtools/rust/rust_1.94.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.94.1.bb
> @@ -238,9 +238,10 @@ rust_runx () {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Copy the natively built llvm-config into the t=
arget so we can run it. Horrible,
> =C2=A0=C2=A0=C2=A0=C2=A0 # but works!
> -=C2=A0=C2=A0=C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_AL=
TERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
> +=C2=A0=C2=A0=C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_AL=
TERNATE_EXE_PATH} ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p `dirname ${RUST=
_ALTERNATE_EXE_PATH}`
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${RUST_ALTERNATE_EXE_PATH_=
NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${RUST_ALTERNATE_EXE_PA=
TH}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -f ${RUST_ALTERNATE_EXE_PA=
TH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patchelf --remove-rpath =
${RUST_ALTERNATE_EXE_PATH}
> =C2=A0=C2=A0=C2=A0=C2=A0 fi

This appears to be a consequence of the new install in "clang: Enable
cmake flags for llvm, clang, lld tests". Perhaps we should just not
install llvm-config there if it is going to cause problems and need to
be overwritten?

Cheers,

Richard

