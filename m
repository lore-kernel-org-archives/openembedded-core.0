Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4B2C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 10:52:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.40736.1737543156877527564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 02:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XA4/CE48;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4368a293339so77203545e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 02:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737543155; x=1738147955; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9g25D/z/13LVMY95KLCbXyDcpZuqcJelIaIdMoVd+s=;
        b=XA4/CE48UJ+IITKL0D1rbs5QZsIdESVyUbGtDRcRnrzZnMF5RLE09fxRbUbqBU4iQs
         crPx5XV/bK6l04TuGjWJeGLcmGpzSjYbM6VhlAu+q8GHVAjhAv0GH7P6x5MNU9VwwLu+
         jxtYQd09uyYyNSpcKZwRLgIGS/vORRV3tYT9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737543155; x=1738147955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f9g25D/z/13LVMY95KLCbXyDcpZuqcJelIaIdMoVd+s=;
        b=troHezQyiMPFAmtL5/1vNOn+V+ua2q6mF8RvI9NtakLJpgy+300SEg9OtAK+rDnCFb
         jyIqV/1IsfYZZN1ZxaL8gA+mp3SMKSto72fDan3jddm6Bc8EU+Af6ehFyx8z0hqhoLPx
         WDddBxtY+Ujx78rxXVHmb9RWZlEG7kV0/JViMkArqSiGH3K6q7f2gHNM4DXlOQCdca/8
         hHjn/wuLVkzK1d7fkT7gIue9YPwplHfTYCAc8IoFLSm1Bw0MCBxu26CHWYNcCTL+PIIC
         gmAyL0rL2xtHtNm3kBEIhYpieIepIjb3SlxqH/PP/GW9Ib6QHWVdOxBW6vSbsmQgIgyj
         toQg==
X-Forwarded-Encrypted: i=1; AJvYcCXyCzDhPT73EWZ1812Oa2ZzTUT0ZYhCIxHcJ0zGmu9fZbuJjxMxbbdPQ6wFKxgG1HOAPr3WhtDgy7Fj+FTosnPDeg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdufBNVRAfJnn3MAnZnucp0XnSU8ykfcOXd3d6Eec61gzbP7Oj
	UF/VaCkkR5nKTRZHGJ5QiMWUMFOb4R+czPF4Rw4b7kPMEUWt+NTOzSXUYPqUmTg=
X-Gm-Gg: ASbGnct/dJOvjiKFPRwvVVWyUZqErOuZuIHAz4Hl4L0MDH6OQ/odNr84UgRtu1HI0p3
	K9u08VRMXd5NqAnnfyzTdEnS+A2HiUadjO7O8FHROxi5rtKesjebEkx4JSV8scgAnLKLxyJQr4W
	yNIJFsJju9CMObwxRE8Q3Wv0+9WEEJMuATsr5kJFsjd/wzTUMokl/aG18WVu6c5vgNSm1M7CBN8
	wp1jwIHicnut1ANxg5fXM93Ck/YVwrZ5EUrgr8SeVoVGSEFOQ8Bo1HC6WDZsmsY/S6ikJDHsFKd
	A4CNUMWx32ESulTpXInMmec5tqjps7H/vrYDyk3jN9zlg2sNdxMCQg==
X-Google-Smtp-Source: AGHT+IE/Edgkaz19/b9Uxd69g9+g6QPqVifEbyQIh5R8a7SLNaKct3w8iGKGw1a4jFjy2fv3ddVoyg==
X-Received: by 2002:a05:600c:6c06:b0:436:e8b4:36e7 with SMTP id 5b1f17b1804b1-438913cb191mr185369525e9.8.1737543155274;
        Wed, 22 Jan 2025 02:52:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd38:1d:73cc:d341? ([2001:8b0:aba:5f3c:bd38:1d:73cc:d341])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318a8efsm20686595e9.5.2025.01.22.02.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:52:34 -0800 (PST)
Message-ID: <42001d9fd5d7ef3f115e47315cf0c711bf35c6d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gcc: make include poisoning fatal again
 in gcc/g++
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2025 10:52:33 +0000
In-Reply-To: <20250121182309.904188-2-ross.burton@arm.com>
References: <20250121182309.904188-1-ross.burton@arm.com>
	 <20250121182309.904188-2-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 10:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210143

On Tue, 2025-01-21 at 18:23 +0000, Ross Burton via lists.openembedded.org w=
rote:
> We have a patch to allow us to 'poison' system include directories,
> which are warnings by default but we make them fatal in cross builds.
>=20
> However, in the 13.1 upgrade[1] the patch to make the warnings fatal was
> dropped in the compiler invocation, so it only took effect for pure
> preprocessor calls. This was not noticed at the time as the test case
> was flawed, but this has now been fixed.
>=20
> Add back the fatal poisoning, and restructure the patch slightly so it
> is less invasive.
>=20
> [1] oe-core bea46612fd9106cc5b46eb1d81623b6492563c13
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0.../0002-gcc-poison-system-directories.patch=C2=A0 | 35 +++++++++++=
++------
> =C2=A01 file changed, 25 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directori=
es.patch
> index 367c9e3821b..d8b3d4a9984 100644
> --- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
> +++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
> @@ -160,10 +160,21 @@ index f82f7d2817b..1da91813b0e 100644
> =C2=A0 @opindex Wno-float-equal
> =C2=A0 @item -Wfloat-equal
> =C2=A0diff --git a/gcc/gcc.cc b/gcc/gcc.cc
> -index 728332b8153..343e4915097 100644
> +index 728332b8153..a63f128cb95 100644
> =C2=A0--- a/gcc/gcc.cc
> =C2=A0+++ b/gcc/gcc.cc
> -@@ -1159,6 +1159,8 @@ proper position among the other output files.=C2=
=A0 */
> +@@ -902,6 +902,10 @@ proper position among the other output files.=C2=A0=
 */
> + #define ASM_MAP ""
> + #endif
> +=20
> ++#ifdef POISON_BY_DEFAULT
> ++#define POISON_IS_ERROR " -Werror=3Dpoison-system-directories"
> ++#endif
> ++

I think this needs to be:

+#ifdef POISON_BY_DEFAULT
+#define POISON_IS_ERROR " -Werror=3Dpoison-system-directories"
+#else
+#define POISON_IS_ERROR
+#endif

otherwwise POISON_IS_ERROR is undefined and leads to failures building
target gcc and gcc-cross-canadian. Fixup in -next I can squash in if
you agree.

Cheers,

Richard


