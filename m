Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1DBCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:36:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.41283.1760355405099914161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dS4glOwz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so49575935e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 04:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760355403; x=1760960203; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IT7YKm4PF9g4vs3FqfF0Iex4oE892OTydbLkr+qweUU=;
        b=dS4glOwzmn2YCC0V629+kPmUQQhm30NMqPGiniSKGUccBjmvUfd9DgkvEWGQXg8h8Y
         9yM0WfXlQZ2Rc+2AH3ACKeMEHy4O7L2OxZ/Pzps98vtj43B82kdMKcyB7RRp5zvFHRD2
         ZA/yaZEsqgQA4jnlqi/c6YzqLHTsYXdFQeg34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355403; x=1760960203;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IT7YKm4PF9g4vs3FqfF0Iex4oE892OTydbLkr+qweUU=;
        b=iUqTQPveVaRzKasEvsVc2UlUKDRlwbVOD5quervlZIozHgiwgdsieZCnBpkb1p3FRn
         IzP2Q4FDeeKWZbXGZJqaZGpGFZFlzxPj3DOrvtdyJEcoOty3JRS3Hruzn82Rp88stln7
         vQrW/5ge6u7IAAW9zvkg5pXrNItNaXa8qBvkIKkYcpGiVCSq8NeRuywuV7A1T1isIUs5
         sGAx+fZuovAOx7CMfa7dNXqM/xqQfyaHmdp+FGNueN65BHW2fkPTLNAv/tdvNQeOK0YD
         WLh7EExkWSn1fWUU7SRNYkLTE0HaYnXePaEGXI/VX7o67wLVTe37O0I72l6qTpqXAnX9
         LsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUBf36y5xRQ6hsXJsXj8Cxm6XLdJaMNCJImrLzW5mT4LpmH5+qqvqmEzocEeEp8o3WRhOpyPI+yxCmO82wkoeEKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YywF6q57DjemqwoI2zM9WmICwUVFk6tWOlHfmJtb7chcvCCOGT2
	2Qu0MFwlKTvDGvlywyMAA52xqO4Hxzw/9FaFTrkpX4E9SrZY2MIWuEubrVJjcTXmzJqZdSwzY00
	qjAcY
X-Gm-Gg: ASbGncv/wTLr/GgN3B0toaQyt521jsed6DnIDXwsN8pneOtnmZ1KxL1wQQbk68yuBLN
	P6NkP7GmcmuRivY8qXZ8FjvPbMJvWWSXjxFEja4xtKjZX5hKmhdtE4VyxWsAE00GSg3NJi0DAL2
	BV7Xt/LOLxVEa/N14ZolqdStofOmEop501R46slPkf3YiSirDVA0pk4TW9ZWapDfAOqE2ULb0Uc
	cJYKyKlwzVBu+Dk3Xlv4XusaZ3z8XL0S3c9PtZKEMCXRoVLT0ezntV7xCVRrZzmWrCwnBfDv+vP
	sX0E963r2BzlfUne1BIl+nrJijuEnd1wXwC05VtuHnzrjtkVSBUIUs51rk5ARKZfwEwfh4EcENE
	Uwk5VQK5x4T55Pyi+84mnqjuO6EfMwiBp635vk8kCJDxXf3P0jvO+ZayJi3akVlCPxyLsat9pkn
	AeLfIWsFi9aoNSoq1m4Zgx5cnGbSs=
X-Google-Smtp-Source: AGHT+IFb8gMd4zIAwczt58Po2pxA4GH6+pFa+8GoF6sO/rPzcd6iVCpVUodNWIo9w8+4/n7+QAtweg==
X-Received: by 2002:a05:600c:34cc:b0:46e:3550:9390 with SMTP id 5b1f17b1804b1-46fa9af18ffmr130913665e9.20.1760355403314;
        Mon, 13 Oct 2025 04:36:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:10f2:650e:7ea:14f6? ([2001:8b0:aba:5f3c:10f2:650e:7ea:14f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b39sm17711512f8f.15.2025.10.13.04.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:36:42 -0700 (PDT)
Message-ID: <6b91ae5510e34296579a3b562548785f138741bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perf: Fix headers related build race condition
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 13 Oct 2025 12:36:41 +0100
In-Reply-To: <20251008002729.1850430-1-raj.khem@gmail.com>
References: <20251008002729.1850430-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224777

On Tue, 2025-10-07 at 17:27 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> libperf specifies paths to includes in its output
> directory if they exist, however install_headers target
> is run in parallel to source files being built for libperf
> and can race with objects being built for libperf.
>=20
> This patch ensures that all headers are built/installed before
> they are used.
>=20
> Specifying additional include paths via EXTRA_CFLAGS is of
> no consequence anymore after [1] because it now is appended to
> CFLAGS, so if we are trying to do include path oderining via
> EXTRA_CFLAGS it will have no effect if those paths already are
> in compiler commandline
>=20
> [1] https://github.com/torvalds/linux/commit/f5b07010c13c77541e8ade167d05=
bef3b8a63739
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> s
> ---
> =C2=A0meta/recipes-kernel/perf/perf.bb | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 3b9e52fdb84..f071685a4be 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -105,7 +105,7 @@ EXTRA_OEMAKE =3D '\
> =C2=A0=C2=A0=C2=A0=C2=A0 LDSHARED=3D"${CC} -shared" \
> =C2=A0=C2=A0=C2=A0=C2=A0 AR=3D"${AR}" \
> =C2=A0=C2=A0=C2=A0=C2=A0 LD=3D"${LD}" \
> -=C2=A0=C2=A0=C2=A0 EXTRA_CFLAGS=3D"-ldw -I${S} -I${S}/libperf/include -I=
${S}/tools/lib/perf/include" \
> +=C2=A0=C2=A0=C2=A0 EXTRA_CFLAGS=3D"-ldw -I${S}" \
> =C2=A0=C2=A0=C2=A0=C2=A0 YFLAGS=3D'-y --file-prefix-map=3D${WORKDIR}=3D${=
TARGET_DBGSRC_DIR}' \
> =C2=A0=C2=A0=C2=A0=C2=A0 EXTRA_LDFLAGS=3D"${PERF_EXTRA_LDFLAGS}" \
> =C2=A0=C2=A0=C2=A0=C2=A0 perfexecdir=3D${libexecdir} \
> @@ -173,8 +173,8 @@ do_compile() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_V=
ERSION}/plugins|g' ${S}/tools/perf/Makefile.config
> =C2=A0	# There are two copies of internal headers such as:
> =C2=A0	# libperf/include/internal/xyarray.h and tools/lib/perf/include/in=
ternal/xyarray.h
> -	# For reproducibile binaries, we need to find one copy, hence force lib=
perf to be created first
> -	oe_runmake ${B}/libperf/libperf.a V=3D1
> +	# For reproducibile binaries, we need to find one copy, so built the he=
aders target first
> +	oe_runmake -C ${S}/tools/lib/perf DESTDIR=3D${B}/libperf prefix=3D inst=
all_headers V=3D1
> =C2=A0	oe_runmake all V=3D1
> =C2=A0}

This basically does the same thing as the other make command. Looking
at the failure logs, I think the issue is in other libraries so I've
taken this idea but applied it to the other libraries too. I'm hoping
that fixes this.

Cheers,

Richard

