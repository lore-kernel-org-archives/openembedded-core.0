Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A73CF3942
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 13:42:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.19898.1726753315069027890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hObCZmIi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb2191107so6940985e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 06:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726753313; x=1727358113; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7gQJ6sEhMz1VfvTq6POZpSUcdp7IvqxlHAGHaqFUR/c=;
        b=hObCZmIiThijuxqFJz7L6qpekjSq7brSZNxdmPI3YDod7rBw4RD6zj+z6N9uABe1DK
         QD+l++mTJrL7XlBHqm6itFVRqmI8evft4yeiYxL7L2i3IenEnmQ2NAfF1eOGjFDxD8Q9
         QI0vbvDJQ/Kwsg6ZLYEDOpeP07tEhSFfuj8rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726753313; x=1727358113;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gQJ6sEhMz1VfvTq6POZpSUcdp7IvqxlHAGHaqFUR/c=;
        b=txHhmLGXdy9137FXanuKvLbAIUcfYXRD8nxkz+RmrVWGJeX3u1IOorFkCqYGxe1SXI
         jsbJdPInxR4QdAT7HFyc1f4cCri35+t41dgBLD/tjYfJL+UQPlbygP3ZEo7Vl56W4el0
         J/4sEW2CWpSo+1lMcNDQ+M0rmktvPpgWk+b2d50XIs9MDkUXIU1MYsbVr3BS84AW3S7T
         3kMlitB61jQxekPjePgMSJ49MjN0oNWtso8lGVIGe4kL3p3L9l6grQvfpDY+10GLyHju
         Xi7UIy1XNW4JtOS6JfSxHz71Aozmm3h5sBRmaeD+nOWnWNwtM0LX5zAe0t/D7mASbFqb
         x0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Ht53ZZd9enx4gI+YP545GnHAq9xmVDvbQjb2x3vvEsYXDmnPSUk0y+Ib/gHOyXbTDicGaOLsTRj5G+idwFy4Mw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6JfEmK5ORT+/zmyUX87YswUPwIdGNrbh1v+SKP9Rz+697jAEx
	TUQvk6kKGYIndxUQCKk3WR+f5/bSlkxvg0PHFx/iIktHtOkDrULI0n//yzK9YAs=
X-Google-Smtp-Source: AGHT+IGpGjYgg3VEG4trxIQVw7cWFIh032GYag90T6hKIokcwN5DXKtBckPeCeg2Bk2BkuZjRyJ9Tw==
X-Received: by 2002:a05:600c:45cf:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-42cdb56725bmr209833395e9.25.1726753313184;
        Thu, 19 Sep 2024 06:41:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f722:770d:8a57:e159? ([2001:8b0:aba:5f3c:f722:770d:8a57:e159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7541d4ddsm22220665e9.11.2024.09.19.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 06:41:52 -0700 (PDT)
Message-ID: <09eb61b5cfa0eca6e6f6028aa882af3781dcacb3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/2] binutils: Fix packaging of bfd-plugins
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, Joshua Watt
	 <JPEWhacker@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 19 Sep 2024 14:41:51 +0100
In-Reply-To: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
References: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204690

On Thu, 2024-09-19 at 05:48 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Fixes the follwing error while building nativesdk-binutils with i686-ming=
w32 as SDKMACHINE:
> ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: nativesdk-binut=
ils: Files/directories
> were installed but not shipped in any package:
> =C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-ming=
w32/usr/lib/bfd-plugins
> =C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-ming=
w32/usr/lib/bfd-plugins/libdep.dll
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/rec=
ipes-devtools/binutils/binutils_2.43.1.bb
> index 2cce40f1ef..eb7c16cbc4 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> @@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =3D=C2=A0 " file://0003-=
binutils-nativesdk-Search-for-al
> =C2=A0
> =C2=A0USE_ALTERNATIVES_FOR:class-nativesdk =3D ""
> =C2=A0FILES:${PN}:append:class-nativesdk =3D " ${bindir}"
> +FILES:${PN}:append:class-nativesdk =3D " ${libdir}/bfd-plugins"
> =C2=A0
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"

I ended up digging into this a lot more. I was able to reproduce the
failure locally but that implies the autobuilder isn't testing this
combination. According to the configuration, it should be so I'm a bit
puzzled why the autobuilder doesn't see it.

The autobuilder config for this is here:

https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n136=
2

Resulting in a build such as this:

https://valkyrie.yoctoproject.org/#/builders/7/builds/162

I would like to understand why automated testing isn't catching this.=20

Getting back to the patch, I noticed that bintutils.inc already does:

 FILES:${PN} =3D " \
        ${bindir}/${TARGET_PREFIX}* \
        ${libdir}/lib*.so.* \
        ${libdir}/bfd-plugins/lib*.so \
...

and the issue is that it uses .so and the recipe is generating a .dll
file.

I'd note that bitbake.conf has:

 SOLIBS =3D ".so.*"
 SOLIBS:darwin =3D ".dylib"
=20
 SOLIBSDEV =3D ".so"
 # Due to the ordering of PACKAGES and the naming of the dev symlinks on da=
rwin,
 # we can't make the symlinks end up in the -dev packages easily at this po=
int. This hack
 # at least means builds aren't completely broken and symlinks don't take u=
p much space.
 SOLIBSDEV:darwin =3D ".dylibbroken"

with the intent of being able to abstract out dylib/so/dll references.
I'm wondering if we should add:

SOLIBS:mingw32 =3D ".dll"
SOLIBSDEV:mingw32 =3D ".dll"

which would then let us change the binutils.inc entry to:

${libdir}/bfd-plugins/lib*${SOLIBSDEV}

In testing this I found it breaks zstd and zlib since those always
generate .so files even on mingw. I've hardcoded SOLIBS and SOLIBSDEV
in the bbappends in mingw to counteract that:

https://git.yoctoproject.org/meta-mingw/commit/?id=3Ddb1f53f73e95499a5f0b0e=
dc45dd9cc9718d3c8a

I think these changes should combine to fix the underlying problem and
also make it easier to fix things like this in future.

They probably need wider testing though.

Cheers,

Richard








