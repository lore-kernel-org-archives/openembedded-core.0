Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8F8CFA757
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:57:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7633.1763715460148226322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:57:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R/9ecShU;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5942a631c2dso2031579e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763715458; x=1764320258; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrGdTDUs/hxPQZRznwoHWi30drPFwRYTVoBpVXDAKuY=;
        b=R/9ecShUkWr9VWPKyCRrLtAtZWpIkSfy+V3RT8VBvvlKuglJMj1lc026ezdXODMl/E
         bky3ssdrcwneFZEBjOp/sRkVrxfQNOAKPI5tZqiEpSTUy2SKJmAED/e2iiVZGFgEDkTQ
         2aJiQl76LG1CnWUYjcObtTvSI7ALvf/q5RBXyBzijrgQT9j63YNm5gwlxMC60cnzM+w+
         4Rs/PiAJQr4dAkC9MC+XXybOuq7XRt5sgzlZtsvQYkZOe0TsBpUIOBafjqEpnK3Ccc6Q
         K9yuSqBVxX3jBTgSTKEj8e5hdjLSOS0rtUBvf8ltaZ5fCfzMsCBp7d0Ym0aWOXtzAFfA
         cqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715458; x=1764320258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NrGdTDUs/hxPQZRznwoHWi30drPFwRYTVoBpVXDAKuY=;
        b=BmwWFHTUCkQDZq84kTXJd/QWPZRmCwKD4kQHNoxAiH6VZW/topz1bbRt7IyQjTU5/M
         EYA+0gbwqB4kKPOUpEdJZS79DbvHadTkByfIJWbq6piGMEvHiUrMbS1/Hs0MICdvdRS1
         MUNmUXOHcrQT0R7s+Ov682ttYcTgwWAuKXyJY4JC7qlTLF7X3bbaH/TRZcty+z2MgoS/
         6D3ub6D8y6294EsUPQWtgml17MNXIIgigmbWfGnUiWTnxSX5c6/ltVmFdFGJTwL8Bgkd
         kykuoasytyqQAX6I6CVTDzra1Oagu/b6yN9R7yeIyOYKJ7gfMg2tpzj9MHu5oNvKONLN
         Xx5g==
X-Forwarded-Encrypted: i=1; AJvYcCVhDVMSTdKujSWF41bxUHCjNOtJuOiXiikXM5BBorfwLj++crpxNmgtiB4JGJeYls94JQcMPu1I1Ef8idwiHYCFWw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8rXYn5XHHY5xqzfxWBaU2zHGe8SczA7h4GaCHN86Q8+BJw8cz
	52+8okEFZXEJLu0ilXL7x5E6ud7xFVnGf882+ZfWm8k4o4VgT43BdbZ5alYw/LO3YqAe9Q6qoho
	x6iXfRBLg0giIeXBtQ6Madd62khxwic4=
X-Gm-Gg: ASbGnctleft50Z+neBMCVR6+PEoUoAeWyeLgQit8wDwu68N28mLVWNwNW6xsHMniSUt
	79qPWYjgoAD1EUEf7wZOcamImVvUnMsMCY6K5/r4XmIsBPv82bmvQrs6Kgm+5fERWbG3S/nV+LT
	gfopg3in8G2D5LeDZHiadqmh63mY8UXRXYBuVPj1dtuh7JFyWDFZcfSSTzeCqzZaVoc3frLtB4s
	uaNSCn3LqrqES8nSr0x8Kzgg/bfe8rQWanbxf4jWFDh8KxGblkBrzZUb/nmp0D1lQAfMSrq+cgi
	nGuJD/Jw
X-Google-Smtp-Source: AGHT+IGdtoxkSYtqkK64DDWNA5vmmOu0onzPO1MvSGBpQg0oKI9rvazbikFDb6F+g2yZlveUhxZJ2t0YXm9xndYFooI=
X-Received: by 2002:a05:6512:398c:b0:592:f9dd:8f28 with SMTP id
 2adb3069b0e04-596a3ed25cemr535831e87.35.1763715457651; Fri, 21 Nov 2025
 00:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20251120121947.3473848-1-skandigraun@gmail.com>
 <20251120121947.3473848-2-skandigraun@gmail.com> <62b3ba44522521b8f0f54a88e90e9805755f379b.camel@linuxfoundation.org>
 <4fbb33b0-1238-40db-8a16-c9ffc767e417@gmail.com>
In-Reply-To: <4fbb33b0-1238-40db-8a16-c9ffc767e417@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Nov 2025 09:57:24 +0100
X-Gm-Features: AWmQ_bnR8bWI9EmdZKSCeI0WlPzRnsBdUyXLeHv9Ktr2cnqOBBo_fHGbJteXyas
Message-ID: <CA+chaQevcrskcwWynHYKuQPECREo6DNFeMGmgE7yF-T1x1HCtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf, gcc toolchain: add
 -fcanon-prefix-map to map-prefixes
To: skandigraun@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 08:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226655

I think we also need weak assignment DEBUG_PREFIX_MAP_EXTRA to empty
in bitbake.conf, because the unexpanded variable with clang instead of
gcc (with v2 from ML as well as the version currently in master-next)
causes:

meta-oe/meta-oe/recipes-extended/ostree/ostree_2024.10.bb: Error
during parse shell code, the last 5 lines are:
                fi
        else
                bbfatal "no configure script found at $cfgscript"
        fi

WARNING: meta-oe/meta-oe/recipes-extended/ostree/ostree_2024.10.bb:
Exception during build_dependencies for oe_runconf
WARNING: meta-oe/meta-oe/recipes-extended/ostree/ostree_2024.10.bb:
Error during finalise of
meta-oe/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
ERROR: Unable to parse meta-oe/meta-oe/recipes-extended/ostree/ostree_2024.=
10.bb
Traceback (most recent call last):
  File "bitbake/lib/bb/cooker.py", line 2312, in parse_next
    raise result
bb.pysh.pyshlex.NeedMore

ERROR: Parsing halted due to errors, see error messages above

On Fri, Nov 21, 2025 at 9:30=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Please try the v2 of the cc-rs patch - I see that v1 got into
> master-next, but it will fail selftests.
>
>
> On 11/20/25 23:48, Richard Purdie wrote:
> > On Thu, 2025-11-20 at 13:19 +0100, Gyorgy Sarvari via lists.openembedde=
d.org wrote:
> >> This patch adds -fcanon-prefix-map to the list of compile file-prefixe=
s
> >> list in case at least gcc 13 is used (it's a gcc-only flag).
> >>
> >> This flag used to be part of this list in the past, but was removed wi=
th [1].
> >>
> >> Since then the source file paths are not canonicalized, which makes
> >> the system to miss some (and sometimes all) source files to include
> >> in the corresponding -src packages. As an example sqlite3 and audiofil=
e
> >> (from meta-oe) produces empty src packages, mostly due to the pathes:
> >> they frequently use relative paths that don't match up with the
> >> absolute path specified in the file-preifx map:
> >> `pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but
> >> the first one won't match the prefix-map, so it is omitted.
> >>
> >> This patch adds this option again with gcc: for class-target it is use=
s
> >> always, and for class-native it is used when the host gcc is at least
> >> version 13.
> >>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >>  meta/classes/toolchain/gcc-native.bbclass | 3 +++
> >>  meta/classes/toolchain/gcc.bbclass        | 2 ++
> >>  meta/conf/bitbake.conf                    | 2 +-
> >>  3 files changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/toolchain/gcc-native.bbclass b/meta/classes/=
toolchain/gcc-native.bbclass
> >> index a708bd0389..8708ad0211 100644
> >> --- a/meta/classes/toolchain/gcc-native.bbclass
> >> +++ b/meta/classes/toolchain/gcc-native.bbclass
> >> @@ -13,3 +13,6 @@ BUILD_OBJDUMP =3D "${BUILD_PREFIX}objdump"
> >>  BUILD_NM =3D "${BUILD_PREFIX}nm"
> >>  BUILD_READELF =3D "${BUILD_PREFIX}readelf"
> >>
> >> +# gcc started to support -fcanon-prefix-map from version 13
> >> +DEBUG_PREFIX_MAP_EXTRA:class-native =3D \
> >> +    "${@'-fcanon-prefix-map' if bb.utils.vercmp_string_op(oe.utils.ge=
t_host_gcc_version(d), '13.0.0', '>=3D') else ''}"
> >> diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolcha=
in/gcc.bbclass
> >> index a5adb5ca37..0ed49ba892 100644
> >> --- a/meta/classes/toolchain/gcc.bbclass
> >> +++ b/meta/classes/toolchain/gcc.bbclass
> >> @@ -30,4 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-=
cross-canadian =3D "gcc-crosss
> >>  PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =
=3D "gcc-crosssdk-${SDK_SYS}"
> >>  PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadia=
n =3D "nativesdk-gcc-runtime"
> >>
> >> +DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
> >> +
> >>  TCOVERRIDE =3D "toolchain-gcc"
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 5406e542db..600d4baffb 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL_=
MAKEINST} "
> >>  ##################################################################
> >>  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> >>  # Beware: applied last to first
> >> -DEBUG_PREFIX_MAP ?=3D "\
> >> +DEBUG_PREFIX_MAP ?=3D "${DEBUG_PREFIX_MAP_EXTRA} \
> >>   -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> >>   -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> >>   -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >>
> > I think we should do something like this patch but just with only the
> > target pieces, not the native ones.
> >
> > The gcc version check is a slow function call since it execs a command
> > and we really don't want a call like that dropped inside a variable.
> >
> > native components don't have -src packages so I'm not sure we need that
> > element of this. The simplest thing would be to drop that piece.
> >
> > This issue was identified as a release blocker so I'll probably hack
> > the patch and put something into master-next for testing overnight.
> >
> > Cheers,
> >
> > Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226652): https://lists.openembedded.org/g/openembedde=
d-core/message/226652
> Mute This Topic: https://lists.openembedded.org/mt/116389619/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

