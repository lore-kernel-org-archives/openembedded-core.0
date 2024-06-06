Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAE5C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 08:59:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9716.1717664376661733942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 01:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bVf/lZ5P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so3672755e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 01:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717664375; x=1718269175; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgH6PplUcx5YFLv6g6Rb9souhNcmVij5mbVUyB2JAUo=;
        b=bVf/lZ5POOlrFa01eYyJSEbaNnhrJF7qPe18dNRURfTlvHejUMJmjHlmikF5p16u2E
         CiFeHQcIp12nUwnnhrt7Ei8JAjS8LORnHj9HO+74tHE/dfn5HyvGHJdJrydPFKfsYITB
         btLHqEsjk8uu2qlyuMppnCPhKapgfTWmpv9bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717664375; x=1718269175;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lgH6PplUcx5YFLv6g6Rb9souhNcmVij5mbVUyB2JAUo=;
        b=GrtKxe444graih74RqIPByCm6SfWhJeySmNxuJS5oe69nZ9thky4Fz2Mk5c0mB1tCE
         +HjBo5lTZpV0HbIVZ/Xp0mwXYChry3VPmh1Pd+mlg+AXVEv51+49qc+uUXOM3NMkJJzM
         eFBQLe3p453FUQcJIeQlycJRHLhiRpjKoAk9HDtbo3LqBild+ZHuhZVAGGQBHOG4JL/L
         pNG1zB7nJITPpyqohKvi8zw7nOUbKhBAEAlkHmJDPLTtMprWM7rrGa/uGM/5iea8Hur7
         yIkaKVYUwPHkziMATHXDd0P3u56QGRNtrl1uyAnms78YL0hsg8rJD++0fMF/P5b4X5wQ
         zB+w==
X-Forwarded-Encrypted: i=1; AJvYcCUWJ46DprVyhDo/gHVTFq5e289NYnjbk6v4zredN7SqDlLSEBtzBsE1WrcF1ZArgfYVrjE3fkm9YbidFNc3xR/stoJGsuSXP4pYxjWjhbbeTa5eToJ9YeR6
X-Gm-Message-State: AOJu0Yzh893C7jrgOQP/+KVETDrJz97/8E/5y0TlrS04EKen4MN2pwH/
	dNBNTtzR4GirYrfGnElnEpRfjcXTmaCEOL5R/rTTXRfokzTvHP66O1We6VwkSnY=
X-Google-Smtp-Source: AGHT+IGjZyagU7vf1cqnmuSAeSrVexalEg9Oi5YtUSgkWeD8ChPqObQt95BvAyWi4uc/KVVZ4qwTAQ==
X-Received: by 2002:a05:600c:5254:b0:421:3be5:a6cb with SMTP id 5b1f17b1804b1-4215acd81a5mr17640595e9.6.1717664375007;
        Thu, 06 Jun 2024 01:59:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2418:892f:d822:11fe? ([2001:8b0:aba:5f3c:2418:892f:d822:11fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215810826csm49407825e9.17.2024.06.06.01.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:59:34 -0700 (PDT)
Message-ID: <c2d8da7991938312c834001d5e5f07d73cc675dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Fix wrong order of gcc include paths on
 musl systems
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 06 Jun 2024 09:59:34 +0100
In-Reply-To: <20240606071005.884909-1-raj.khem@gmail.com>
References: <20240606071005.884909-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 08:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200387

On Thu, 2024-06-06 at 00:10 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> musl does not use gcc private system headers, however, the path gets
> prepended since gcc driver passes -iprefix option to cc1 based on its
> installation location. This starts to prefer these headers instead of
> musl provided equivalent system headers which is not as per musl's
> design. This patch switches prepend to append for musl systems.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-14.1.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0...te-include-paths-on-musl-instead-of-.patch | 35 ++++++++++++++++=
+++
> =C2=A02 files changed, 36 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Append-GCC-pr=
ivate-include-paths-on-musl-instead-of-.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-14.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-14.1.inc
> index b057e570f3b..c4bc4c72664 100644
> --- a/meta/recipes-devtools/gcc/gcc-14.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-14.1.inc
> @@ -68,6 +68,7 @@ SRC_URI =3D "${BASEURI} \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0023-Fix-install-path-of-linux64.h.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0025-gcc-testsuite-tweaks-for-mips-OE.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0026=
-Append-GCC-private-include-paths-on-musl-instead-of-.patch=C2=A0\
> =C2=A0"
> =C2=A0
> =C2=A0S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
> diff --git a/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-includ=
e-paths-on-musl-instead-of-.patch b/meta/recipes-devtools/gcc/gcc/0026-Appe=
nd-GCC-private-include-paths-on-musl-instead-of-.patch
> new file mode 100644
> index 00000000000..1bcff39aa7c
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths=
-on-musl-instead-of-.patch
> @@ -0,0 +1,35 @@
> +From 30f1229a8b663ee4dc35d389acf60241a4536fb8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 5 Jun 2024 22:56:12 -0700
> +Subject: [PATCH] Append GCC private include paths on musl instead of
> + prepending
> +
> +Musl does not need gcc private compiler headers, therefore use them
> +after standard system header search paths.
> +
> +This fixes packages like python builds to detect the musl systems
> +correclty, as it looks for musl specific stuff in stdarg.h system
> +header, which is wrongly picked from gcc private headers in OE
> +
> +Upstream-Status: Submitted [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D115368]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + gcc/gcc.cc | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/gcc/gcc.cc b/gcc/gcc.cc
> +index 01968001c44..d0d5c35cf83 100644
> +--- a/gcc/gcc.cc
> ++++ b/gcc/gcc.cc
> +@@ -6589,7 +6589,11 @@ do_spec_1 (const char *spec, int inswitch, const =
char *soft_matched_part)
> +=20
> +=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gcc_exec_prefix)
> +=C2=A0		{
> ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> ++		=C2=A0 do_spec_1 ("-idirafter", 1, NULL);
> ++#else
> +=C2=A0		=C2=A0 do_spec_1 ("-iprefix", 1, NULL);
> ++#endif
> +=C2=A0		=C2=A0 /* Make this a separate argument.=C2=A0 */
> +=C2=A0		=C2=A0 do_spec_1 (" ", 0, NULL);
> +=C2=A0		=C2=A0 do_spec_1 (gcc_exec_prefix, 1, NULL);
>=20

The trouble is we build one cross compiler for both glibc and musl so
this will fix musl and break glibc. It would need to change this
depending upon the target at runtime. I suspect upstream gcc will say
the same thing :/

Cheers,

Richard


