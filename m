Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B101AC79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 09:05:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7386.1788944719310699487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 02:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GmWnu5kU;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482ea739de2so3845576f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788944717; x=1789549517; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQbhHbr/gqLuL1B2Jzcts76r9QvdF2e4fCAp3FeYDRM=;
        b=GmWnu5kUt/ju7mgDZzwnkSCB8+DM4CLLyRvqXvU8bKwL1OIG9scXKoVntk8N1xjj9p
         yQ/NoDjePeqkuXRiBT8r5+FZZ15Vw/XAf/1pp+NOh0lhKG5/oVMd9YGQmmAqfw3IYlvM
         sny1XsFJYtIKTn809GfTZd0HSy/MZIikLOcnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944717; x=1789549517;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQbhHbr/gqLuL1B2Jzcts76r9QvdF2e4fCAp3FeYDRM=;
        b=O9E1rKsrn7D2E+vmKfC8TR2TpA+25AECZ7WWXUIl649GCqQBELlwWWr+tL1plZ8hP9
         NOiabI5dyNW3iOIhkK1fuebDYHrjEgtd/dPO6YjzY07L6AwU5JH+dmjsXgBA9bB4jymS
         KhOFv8es6+0UbZ1nDti3vWNtul4/GMS5cQQWWbAmwd2ot1K8LfBLHiL04PHvCVqsrZJv
         wy3MZ0d5h6lo+YC4xPUUzhIENHiNr0QElUQFrrq0/c3N2zp/LgZWQ4RS0CkrwyQ2hBJ5
         TPVOPI8Dlv6NcnfsKfyUUCf+pE5m5q/eMIub/8nR6ZCWngs9W14/f7L4AvPnAEqeMpsm
         yC0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5/C0EG2nWTy8EFNfz8kHJxudAN2DLu7YCpEsfOs1fivkmr2VMSSnUTeoe3+xMWKv+sWro9CKBwwIGCt4Ti8f4lg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lZuGWavSY73xovE0SJBzZzwIBQDGFPPW2TbgSEokRuWzCeqEti
	6ZGK5y2Yh68+eAhaorJQO5EOQo6dYczbtqDzHKL4a2JLMSkY808tlh6Vddo4FnluvLU=
X-Gm-Gg: AYBFou1gWOMMy7iIPxbnyEvSfUuN/b5n19XtMkMIZQ7qBJqmVTgbf1QHD2Qb4msKgwe
	pji90NQQVjk2zewm4t3rChZTzKJBnsEjdNG811kYuC7WStLXMR/RJvIC0rhq66GpJJ4NsDUDW8X
	JMIzGXXFUyf0bbVUijmUZZ2894poKZp3wranGL8lAw3NQm6ReSkVAgxHyf0wDN1+kmBYL31XADP
	NPLQel5V+KAc5wj2+bP7b4qToU2DGs4ot+JQ2wtCMLx8GfYz9suk4/gqv0BBgr7ZKuuoZMehRrX
	9HhTWAitBEj7CTIdJwF/k6ZURiHyCweZ9zyIGqaxdKH5CyN3qhNROcQ2bjPSOIK1/yWT/KvbKej
	W1VPcqF63lfKZTmhY8Eu2vZJFCjSeRohwQ73m+LeplHrIBOHSp9KBIGI45LVQ2bPZHGJxg7I/Tp
	Ywv9so2fYLzBtRY6aphjxQcHQNnY50QAXdbpoK1D4JzDEG7OQrlJFi/1/qcQNhW9A1ClWtcrL+3
	fW1yNE3JSNs2R36COlImOn39UBxi/3Qa+Owo2+ru17Q4jJtglkjg9WMSz2/Bg==
X-Received: by 2002:a5d:5f55:0:b0:485:ac51:9b7a with SMTP id ffacd0b85a97d-485ac519c0bmr3567681f8f.44.1788944716861;
        Wed, 09 Sep 2026 02:05:16 -0700 (PDT)
Received: from localhost (2a02-8440-b50b-856f-e902-fcc5-937d-d3cb.rev.sfr.net. [2a02:8440:b50b:856f:e902:fcc5:937d:d3cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm35798672f8f.17.2026.09.09.02.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:05:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 11:05:15 +0200
Message-Id: <DLANZ4P17648.3II74EWL42T08@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.tatrai.ext@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2] time64: enable 64-bit
 time/file-offset flags for 32-bit nativesdk
X-Mailer: aerc 0.20.0
References: <DL2G4HBXZK8O.2BJXQFIJGNX9C@smile.fr>
 <20260831144026.3048020-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260831144026.3048020-1-peter.tatrai.ext@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 09:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245455

On Mon Aug 31, 2026 at 4:40 PM CEST, Peter via lists.openembedded.org Tatra=
i wrote:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>
> When SDKMACHINE is set to i686 or i586, nativesdk binaries are compiled
> as 32-bit. Without -D_TIME_BITS=3D64 and -D_FILE_OFFSET_BITS=3D64, stat()
> and time-related syscalls use 32-bit types, causing EOVERFLOW on
> filesystems with large inode numbers (e.g. container overlay filesystems)
> and Y2038 issues.
>
> Add SDK_CC_ARCH appends for class-nativesdk:i686 and class-nativesdk:i586
> using GLIBC_64BIT_TIME_FLAGS, mirroring how target architectures are
> handled.
>
> The existing GLIBC_64BIT_TIME_FLAGS:pn-glibc override only matches the
> target recipe, not the class extended nativesdk-glibc, so an additional
> pn-nativesdk-glibc override is needed here. This is required on
> scarthgap but not on master/wrynose, because scarthgap carries glibc
> 2.39, which predates glibc commit a4ed0471d717 ("Always define
> __USE_TIME_BITS64 when 64 bit time_t is used"). In 2.39 the header
> redirect turns sigtimedwait into an alias of __sigtimedwait64, which
> then collides with glibc's own weak_alias() and fails to assemble:
>
>   Error: symbol '__sigtimedwait64' is already defined
>
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit d9f62a45555673842021d5746437e66c40d3f3cc)
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
> v2: Add GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-glibc =3D "" to fix the
>     nativesdk-glibc build failure reported on the autobuilder
>     ("Error: symbol '__sigtimedwait64' is already defined") with
>     SDKMACHINE=3D"i686". Verified with "bitbake nativesdk-glibc" for
>     SDKMACHINE=3D"i686" on scarthgap. Master and wrynose do not need this
>     (glibc 2.43/2.44 are unaffected).
>
>  meta/conf/distro/include/time64.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/inclu=
de/time64.inc
> index dd29105db4..242d5bac8e 100644
> --- a/meta/conf/distro/include/time64.inc
> +++ b/meta/conf/distro/include/time64.inc
> @@ -32,6 +32,20 @@ GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
>  # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
>  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
> =20
> +# Apply the same flags to nativesdk packages when building for a 32-bit =
SDK
> +# host (i686, i586).
> +SDK_CC_ARCH:append:class-nativesdk:i686 =3D "${GLIBC_64BIT_TIME_FLAGS}"
> +SDK_CC_ARCH:append:class-nativesdk:i586 =3D "${GLIBC_64BIT_TIME_FLAGS}"
> +
> +# Recipes which implement or wrap the libc APIs themselves must not be b=
uilt
> +# with these flags, as the redirections glibc performs would collide wit=
h the
> +# symbols the recipes define (e.g. "symbol '__sigtimedwait64' is already
> +# defined" in nativesdk-glibc, or duplicate creat64/fopen64 in
> +# nativesdk-pseudo). The pn- overrides above only match the target recip=
es, so
> +# the class extended variants have to be listed separately.
> +GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-glibc =3D ""
> +GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-pseudo =3D ""
> +
>  # Caused by the flags exceptions above
>  INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
>  INSANE_SKIP:append:pn-glibc =3D " 32bit-time"

Hello,

I think this patch still causes issues:
meta-mingw ubuntu2204-vk-1 scarthgap completed at 2026-09-09 08:53:22+00:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/7/builds/3481/ste=
ps/15/logs/stdio

Can you look into it?

Thanks!
--=20
Yoann Congal
Smile ECS


