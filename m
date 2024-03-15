Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD58C54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 16:06:51 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.26265.1710518804255330742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 09:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aoz80jPD;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5a4789684abso525868eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710518803; x=1711123603; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8k/sSQPjZGJaUGfc0NcvGZt66XnD2PepXyftup6ol9s=;
        b=aoz80jPD8tOh5g9loAlIZQnpdtjweRotLWCBHx2YT1yJ68OGBGSQ8HsR/5AUPsyEwF
         6XsIjm4Tio5Br7dYmF3IaeqxPKbEANY3yJN6IJYNo8ceBClG6K15Nu6QhwocLlNkRpVW
         uCfD9U0ZtyrJKtOxlLVJbD2rNUHdYfE+uhOZXcDdMXKwo/1Xuw9JR/YC8CP4nmz2ot3Q
         qy9IY31NcfQi3g/lSjvMGpD/7uT6cw9Qkeq6pdp9MhyEzhm2g1GC4tJ/buYi58jMKg3U
         mSrAKqBJeLGKcaT9RpagqMzNeYZA4QXZq0fjTLHRqTqtnG79PUWHes5hX7iXG42f7hqD
         DLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710518803; x=1711123603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8k/sSQPjZGJaUGfc0NcvGZt66XnD2PepXyftup6ol9s=;
        b=I18eYnv6WdmDxmg0IEPU4RX37EJf01UpZvZdhbhG++twghItJoGB5HMcuy0QwdgVoo
         vGAZQHuR9si75A8kL0tivAwzW05YDdHDM3hRFqCuVLizErRCnuVO9JDZzhiPVCXtFrRn
         hxtQpOplPpYSmwvZ43A0VJBZrFlNcDdT3qoSsgw2NYaEti3dPmdoPfVj7/JyyrLnaJX0
         X1KDobknns1Eh+jPwDw2NrzwZO/Np2AMJki8x3zhj58dmNBEh8hKGYafaZfsEFK0u9Kc
         mR6DSVfjPsPd/TqbX0jRTPA7ZUTpcxlDiGLKOoLskMfgU5Bp/l5Qv7/9EvUJxUgUmpXS
         2/LQ==
X-Gm-Message-State: AOJu0YxaKgxoqYeYfo5hxOnHHd1absTMaljfx37K/mSXJHANd/T6mLeN
	hfTlGjD2/4GgwcZEfVlREr8yyAeb36WiR5LRXAuSQ+BUozFH5Ig5/12Kh2RRoVT6laFpTRQWb6U
	yAad3Bbbkqex1LEzsHUmRc4l/H8gBAa6Q
X-Google-Smtp-Source: AGHT+IE7CO74eNgjiNcXgmsSFInWc/U9fXY1pWLhcsP3a0ni6Pcks5we9X30Mh2SOJv8iN3kxjOD1FOITEtnV/j7EQ4=
X-Received: by 2002:a05:6870:a11a:b0:21e:d17f:8693 with SMTP id
 m26-20020a056870a11a00b0021ed17f8693mr5537264oae.56.1710518803289; Fri, 15
 Mar 2024 09:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240315142926.3832940-1-richard.purdie@linuxfoundation.org> <20240315142926.3832940-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240315142926.3832940-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Mar 2024 09:06:16 -0700
Message-ID: <CAMKF1soHpQCLr_UXrEUSMqZOdx=TBiZeduFq-+huS4vFf=fshA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] uninative: Add pthread linking workaround
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 16:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197141

On Fri, Mar 15, 2024 at 7:29=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> With newer glibc versions, pthread was merged into the main library so th=
ere is
> no longer any need to link with -lpthread. On newer systems this means th=
at linker
> flag is dropped from places like pkgconfig .pc files. If uninative then u=
ses this
> newer library on an older system, the flag is missing and linker errors a=
bout missing
> symbols occur.
>
> Adding the linkage unconditionally to our uninative linking flags avoids =
that problem
> at a potential cost of slight over linking.
>

There is another unintended consequence of linking pthreads
unconditionally on older versions
where certain functions which are required to be thread-safe are
implemented as weak stubs in
libc so single threaded programs do not incur the cost of ensuring
thread safety, but when pthread
it linked in, it will replace these stubs with thread safe versions
which are correct in muti-threaded env
but incur performance cost. I do not know how much of this is going to
impact the uninative stuff
but I thought I would mention it for reference.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/uninative.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/=
uninative.bbclass
> index 9b8b4565dd4..d05b61c48eb 100644
> --- a/meta/classes-global/uninative.bbclass
> +++ b/meta/classes-global/uninative.bbclass
> @@ -143,8 +143,8 @@ def enable_uninative(d):
>          d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_ve=
rsion(d))
>          d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
>          d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "=
| uninative_changeinterp")
> -        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,-=
-dynamic-linker=3D${UNINATIVE_LOADER}")
> -        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--=
allow-shlib-undefined -Wl,--dynamic-linker=3D${UNINATIVE_LOADER}")
> +        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,-=
-dynamic-linker=3D${UNINATIVE_LOADER} -Wl,-lpthread")
> +        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--=
allow-shlib-undefined -Wl,--dynamic-linker=3D${UNINATIVE_LOADER} -Wl,-lpthr=
ead")
>          d.appendVarFlag("BUILD_LDFLAGS", "vardepsexclude", "UNINATIVE_LO=
ADER")
>          d.prependVar("PATH", "${UNINATIVE_STAGING_DIR}-uninative/${BUILD=
_ARCH}-linux${bindir_native}:")
>
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197132): https://lists.openembedded.org/g/openembedde=
d-core/message/197132
> Mute This Topic: https://lists.openembedded.org/mt/104948451/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

