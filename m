Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE99C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 11:30:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.41143.1737545437650108764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 03:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EO3drWZE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43634b570c1so49417965e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737545436; x=1738150236; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8+o6jj+8ai93l9cRx1GXxDZAAHbqpfhjqJnfMA5g/o=;
        b=EO3drWZEd/RvQ6TGY1T6eQ+mDoT/3VuXKvXSnW1M8eHboXc8p9+I64JvCtupMgB9FQ
         KUwVEHV7C+5DPPkSBF1XK/nqbNQ+2gkickl0S296/qRO7Jy3DDnYVe9XGyXrMqlR3B+e
         /3lIRY+IrjPDYS7Q2uXQRfMBurbbZfYFIoFkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737545436; x=1738150236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8+o6jj+8ai93l9cRx1GXxDZAAHbqpfhjqJnfMA5g/o=;
        b=DJaN5bn2hAP7naItuxzhb1dPUWZ3rWICA3GK1rvfKzpdyKm5GBszCv7aRybz9sNkH9
         bAGhAO0fz+kfVKBcJZB4Tpoe39wbJ2qdGWs/dHzCjoVYPA0Pkp72wweC7EiOshfPFc/U
         ocllnkN9mZPyO6/ddlfrn368JxU5B48rMHyNNseLmxJpOVK5U2MMvodOzFH0bIYezoZT
         3w3iR4vfnSvx31GdETInh0skZ4WuhQ9LFl6BJzl8JsRJ22sI1CXVF+5A11nbJDFukPaW
         KoFmyDhzw8xRzZ3Bspo4SAzhqKdrmNFNXmhEolD6FCXPaT7ejfAU7w+fioSmju5tpPxM
         eJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGQMUnqL+aFI+73ABS8We7IOZ7ISrU4Y0CmMjXCV4Y3TCHMcI6FtIlgY5V0fy3mDhelQc3LoDdj7bEKBKL3sgYSg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/tNyzUn+5lTEEfMQubE1bUOYvbyg08qB6qf/JOFo1WmAigbZh
	zFtKzozK2Z7n7024CM/JI6E2oEGXVaHEdG4wjPpXlFjtaeejWOmzMPINWVkb+JQ=
X-Gm-Gg: ASbGncvz/fXOqVCvGV4lsuvepSqP84LOqC+ILdvu2xABtGXPW3NX1K7tDIhW1fghMVn
	vFdgik0E5JNepzrmfWoJGcYeICMGGWv91pEOXpx+SEf6SroNRFUlUhLZDXvfeIEEZlf0tCAFMRT
	WaUS4oqHZolDpfK8BT8JWkzEOoc4RUQyWSmmSUQjIJOK817by0ANDz7uTPFAoeTbmQx9+Hfpchs
	d4cN9XJrb+xKz4bVKaDp1MlqhsCGVgKQNG7qZE97+wVVZ7GI+0iCjW9sP+vwEVQaHTOlWb9hFfB
	esiywX0BLfxUD0xQcr3JOCklJnvcAN16MNbO6/Q7H9wVPIHaNR9Rig==
X-Google-Smtp-Source: AGHT+IEMMnQBbz9PCn0iuUF/UNGIB9i6GmD0ib3t5z0AofGR3Fw4UlDXxdSzbmg42Y4AIE8VZ8823Q==
X-Received: by 2002:a05:600c:5112:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-438913cfa0emr193484125e9.8.1737545436001;
        Wed, 22 Jan 2025 03:30:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd38:1d:73cc:d341? ([2001:8b0:aba:5f3c:bd38:1d:73cc:d341])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31a38cbsm21551335e9.16.2025.01.22.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:30:35 -0800 (PST)
Message-ID: <df9f1bd1bacf6070ccccb84e6ab1aaaf91ba5dcb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH] gcc-sanitizers.inc: Workaround
 for aarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: throos@amazon.de, openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2025 11:30:34 +0000
In-Reply-To: <20250122111642.155310-1-throos@amazon.de>
References: <20250122111642.155310-1-throos@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 11:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210146

On Wed, 2025-01-22 at 12:16 +0100, Thomas Roos via lists.openembedded.org w=
rote:
> From: Thomas Roos <throos@amazon.de>
>=20
> When using the -fsanitize=3Daddress=C2=A0 CXX_FLAG for a program compiled=
 for
> aarch64 / arm64
>=20
> This is happing:
> MemorySanitizer: CHECK failed: sanitizer_allocator_primary64.h:133 "((kSp=
aceBeg))
> =C2=A0=3D=3D ((address_range.Init(TotalSpaceSize, PrimaryAllocatorName, k=
SpaceBeg)))"
> =C2=A0(0xe00000000000, 0xfffffffffffffff4) (tid=3D51745)
>=20
> With -DSANITIZER_CAN_USE_ALLOCATOR64=3D0 this is not happening and
> potenial bugs are detected.
>=20
> ARM32 does not require this patch.
>=20
> More info about the issue in this thread:
> https://github.com/llvm/llvm-project/issues/65144
>=20
> Signed-off-by: Thomas Roos <throos@amazon.de>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-=
devtools/gcc/gcc-sanitizers.inc
> index 8c98e9cf8a..ae05ae6dfd 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -11,6 +11,8 @@ EXTRA_OECONF_PATHS =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> =C2=A0"
> =C2=A0
> +CXXFLAGS:append:aarch64 =3D " -DSANITIZER_CAN_USE_ALLOCATOR64=3D0"
> +
> =C2=A0do_configure () {
> =C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${B}/${TARGET_SYS}/libsanitizer/
> =C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${B}/${TARGET_SYS}/libsanitizer/
>=20

Can you put that link and a short note in a comment above that append
please? It is handy to have a reference and some idea of when we can
remove it.

Cheers,

Richard





