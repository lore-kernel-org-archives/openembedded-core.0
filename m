Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E57CCEE355
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 20:46:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7008.1763498779965105861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 12:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXTeZrTX;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so4286426f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763498774; x=1764103574; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+JmAZ7aL8cD6onY+uGYr544nQOuBB3xxjyHo+7OZMo=;
        b=NXTeZrTXqIIVGK5ZjAH1eN7qC8CFUIpDPM2E3NYJnLxzfZtbDmAJbCtuBr6oIJSv7h
         Z0LSpKU1U2OnlwnCcjlMadDvZX2jPBUJw4iiS96woAZaLLU4BoVgYunWHr2cjkOS7awq
         wiSlI+HAlR2+UBdsNfzvsvS/7dVyMt1dhTEDeD/58mqgmEIg++ZJmyOY0W1NT4ECazji
         juFBnrgc0u61GMmoc1wKYai6H5Cd7S0aSMIwQ9GOyA/EZ3mON8MpjME0qdF3EXEdLB3k
         yE4D4zs1Cj9pRhp/VWeyCfsLTQ/mNV2+rdbrcXvB8NuvcBMTXwceTq3MitFT7hSPx00y
         r42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763498774; x=1764103574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+JmAZ7aL8cD6onY+uGYr544nQOuBB3xxjyHo+7OZMo=;
        b=knF9LbXsGj2u+bvSQCERXsG1xS0wADO3M0Yz8F6d3VuMi/TEYmBHLSOU9SxrbJsoen
         mqUvIw4H0nEdco2qqziogaTZ0g/csdIIrM1xAjirlm0Nt63krpLgNsMaFVHZZLxeA4Qi
         ZrHoNjbDNMBUSquhRBSHjunSv7AVrG0cYl5FUETwMkX4JAQlQKeKiIgeit8FY/Q2duZj
         H6p+2L9rxp+FG1utZu75J025i3iZOCFkDrudRRlHgj7ocSkU0HmnSOs4pdd39UpvguzL
         d2yphhSgVT6Qt4aPBzJnvDrkshtw5c/cANwGey/Klgh116A5x2RQsFesFyZ2K/+c8ewZ
         g1ow==
X-Gm-Message-State: AOJu0YyDWKNZoShmhy7TwtCirRf8GBd/SmTRO5cwlR1xjjJJEGzA0yTX
	X58Wo7LpmbE77HJBwwsFU9DUg17EWSZy7ziqwFx93kGFJ8+CxDjPr6/h
X-Gm-Gg: ASbGnctk4HNE/1+xsXWlVNupF/WkGm/VykRU/kXTL0AoKme6AGHO9uceEVOSVtoQ9As
	LH6uJP8A5SvBMtEf13uCq1vOko+Jn7ONbVck6wZ7lBq6V8NEcv58iHEOg2RYLnctWAw3q2umEDP
	vzFOnGWN9ppqY6Ee7LkmwgrSRpFjkRLL9zeKEJbYmspcmtRaWVsP/VWlIdb+CaKeZlV6fh7BmQk
	ztsYWKHSfbzrI7HlIxRvxUqNOcQy8EAM0dVE5c1RUOWFSmIZLhJXuYmCQbeVdUebKvpppbuXrdC
	NCjEPVrpmmXOmsU7xL4fi0Y02XP+Dh7TEdDPTmgRKxILmMkpllhgZ8zV2KMmwtBB7TeH1wwO1+v
	sgf28uc0m4I8h++SKN5JRDOUcJrhzp7197VzVodfzDLHCGeVNknP6isi7pS9NGFBKxvDYBG7DBZ
	VfjTahaSSA6OmxHcEaerdN8+k4LNjwfw==
X-Google-Smtp-Source: AGHT+IERtD46+eqchO6yadBsuuCzpsNgszx8v0EcjK1i1XaBz0ucMkG2gpt7epy/dKxhIF4XXjwDEw==
X-Received: by 2002:a05:6000:2585:b0:42b:2c61:86f1 with SMTP id ffacd0b85a97d-42b59385c0dmr17222498f8f.35.1763498774143;
        Tue, 18 Nov 2025 12:46:14 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a4fsm33944851f8f.11.2025.11.18.12.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 12:46:13 -0800 (PST)
Message-ID: <78b7eb60-fa19-4b71-908c-087d8cae321d@gmail.com>
Date: Tue, 18 Nov 2025 21:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Jacob Kroon <jacob.kroon@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
References: <20250421172915.1651803-1-raj.khem@gmail.com>
 <20250421172915.1651803-2-raj.khem@gmail.com>
 <84993796-5eab-4fff-9980-3946f4bb6034@gmail.com>
 <CAMKF1so+3b72=0gXypz5SDvvrMSTUNJgKwYbnEQs8nOVVJuDOg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1so+3b72=0gXypz5SDvvrMSTUNJgKwYbnEQs8nOVVJuDOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 20:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226536


On 11/18/25 21:18, Khem Raj wrote:
>
>
> On Tue, Nov 18, 2025 at 10:12 AM Gyorgy Sarvari
> <skandigraun@gmail.com> wrote:
>
>     This patch seems to have caused some regression in packaging the
>     source
>     for some recipes.
>     I don't have a lot of info yet, just finished bisecting.
>
>     The issue I see is with "audiofile" recipe from meta-oe that I
>     wanted to
>     debug with master branch: with this patch the -src package is empty.
>     Without it, it is populated fine. I guess there are other recipes
>     also,
>     but that's what I stumbled upon.
>
>
> It's an old package, I wonder if it has a mind of its own when it
> comes to compiler
> flags. I don't see anything in the recipe metadata that leads towards
> the issue.
> I wonder if this recipe can be dropped going forward.

I'm not sure if it's about the age[1], but it might be about being
overly smart when it comes to compilation... as another example I
noticed that sqlite3 has the same issue (which can be also opinionated
about things): using this patch it generates an empty src package.

I see that the debugsources.list file contains some funky paths (with
added "sources" folder in the middle of the path), which is used to copy
these files.

But most likely I will go offline for the day, and will check back on it
tomorrow, unless someone will be faster.

[1]: unrelated funny thing: audiofile seems to work fine in all branches
(at the least ptests), except for Kirkstone, that's what started this...

>  
>
>
>     Will try to look at it, but if you have any ideas, I'm all ears.
>     But in
>     any case, FYI.
>
>     On 4/21/25 19:29, Khem Raj via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     > -ffile-prefix map is more comprehensive when it comes to
>     reproducible
>     > builds and its superset of all prefix-mapping options in compilers
>     >
>     > This makes is cleaner and workable across gcc and clang, clang
>     does not
>     > support -fcanon-prefix-map and it has to be explicitly omitted
>     when using
>     > clang.
>     >
>     > There are lambdas generated in templates by clang which still
>     get the
>     > absolute paths despite -fdebug-prefix-map, this helps with that
>     as well.
>     >
>     > nasm is an outlier and we have fixed it by adding
>     -fdebug-prefix-map option
>     > luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes
>     which use
>     > nasm either pass -fdebug-prefix-map explicitly to nasm or they
>     rewrite it
>     > to use nasm flags syntax.
>     >
>     > We have discussed this in past [1]
>     >
>     > [1]
>     https://patchwork.yoctoproject.org/project/oe-core/patch/20230428032030.2047920-1-raj.khem@gmail.com/#10281
>     >
>     > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     > Cc: Jacob Kroon <jacob.kroon@gmail.com>
>     > Cc: Martin Jansa <Martin.Jansa@gmail.com>
>     > ---
>     > v2: Drop using --ffile-prefix in go
>     > v3: Fix copydebugsources to use --file-prefix-map instead of
>     -fdebug-prefix-map
>     >     and few more places
>     >
>     >  meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
>     >  meta/conf/bitbake.conf                             | 14
>     +++++---------
>     >  meta/lib/oe/package.py                             |  2 +-
>     >  meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
>     >  .../python/python3-maturin_1.8.3.bb
>     <http://python3-maturin_1.8.3.bb>                |  2 +-
>     >  meta/recipes-devtools/rust/cargo_1.85.1.bb
>     <http://cargo_1.85.1.bb>         |  2 +-
>     >  6 files changed, 11 insertions(+), 17 deletions(-)
>     >
>     > diff --git a/meta/classes-recipe/kernel-arch.bbclass
>     b/meta/classes-recipe/kernel-arch.bbclass
>     > index 968551267f9..7aea9cd3e8e 100644
>     > --- a/meta/classes-recipe/kernel-arch.bbclass
>     > +++ b/meta/classes-recipe/kernel-arch.bbclass
>     > @@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?=
>     "${TARGET_OBJCOPY_KERNEL_ARCH}"
>     > 
>     >  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
>     >   -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
>     > - -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
>     > - -fmacro-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
>     > - -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
>     > - -fmacro-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
>     > + -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
>     > + -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
>     >  "
>     >  KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>     >  KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>     > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>     > index 8f90026f7c2..b4e1964f77d 100644
>     > --- a/meta/conf/bitbake.conf
>     > +++ b/meta/conf/bitbake.conf
>     > @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install =
>     "${PARALLEL_MAKEINST} "
>     >  ##################################################################
>     >  TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
>     >  # Beware: applied last to first
>     > -DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
>     > - -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
>     > - -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
>     > - -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
>     > - -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
>     > - -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>     > - -fmacro-prefix-map=${STAGING_DIR_HOST}= \
>     > - -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>     > - -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
>     > +DEBUG_PREFIX_MAP ?= "\
>     > + -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
>     > + -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
>     > + -ffile-prefix-map=${STAGING_DIR_HOST}= \
>     > + -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
>     >  "
>     >  DEBUG_LEVELFLAG ?= "-g"
>     > 
>     > diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
>     > index 0db14f21642..0bcc04ea54a 100644
>     > --- a/meta/lib/oe/package.py
>     > +++ b/meta/lib/oe/package.py
>     > @@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):
>     > 
>     >          prefixmap = {}
>     >          for flag in cflags.split():
>     > -            if not flag.startswith("-fdebug-prefix-map"):
>     > +            if not flag.startswith("-ffile-prefix-map"):
>     >                  continue
>     >              if "recipe-sysroot" in flag:
>     >                  continue
>     > diff --git a/meta/recipes-devtools/gcc/libgfortran.inc
>     b/meta/recipes-devtools/gcc/libgfortran.inc
>     > index 4560421ed1f..fa6aecaaa30 100644
>     > --- a/meta/recipes-devtools/gcc/libgfortran.inc
>     > +++ b/meta/recipes-devtools/gcc/libgfortran.inc
>     > @@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS = "\
>     >  # An arm hard float target like raspberrypi4 won't build
>     >  # as CFLAGS don't make it to the fortran compiler otherwise
>     >  # (the configure script sets FC to $GFORTRAN unconditionally)
>     > -export GFORTRAN = "${FC} -fcanon-prefix-map
>     -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR}
>     -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
>     > +export GFORTRAN = "${FC}
>     -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR}
>     -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
>     > 
>     >  do_configure () {
>     >       for target in libbacktrace libgfortran
>     > diff --git
>     a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
>     <http://python3-maturin_1.8.3.bb>
>     b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
>     <http://python3-maturin_1.8.3.bb>
>     > index 3ec4d0c103b..08975e177f0 100644
>     > --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
>     <http://python3-maturin_1.8.3.bb>
>     > +++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
>     <http://python3-maturin_1.8.3.bb>
>     > @@ -10,7 +10,7 @@ SRC_URI[sha256sum] =
>     "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc015
>     > 
>     >  S = "${WORKDIR}/maturin-${PV}"
>     > 
>     > -CFLAGS +=
>     "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
>     > +CFLAGS +=
>     "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
>     > 
>     >  DEPENDS += "\
>     >      python3-setuptools-rust-native \
>     > diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb
>     <http://cargo_1.85.1.bb>
>     b/meta/recipes-devtools/rust/cargo_1.85.1.bb <http://cargo_1.85.1.bb>
>     > index db18ecfda9a..150c2d2b801 100644
>     > --- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
>     <http://cargo_1.85.1.bb>
>     > +++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
>     <http://cargo_1.85.1.bb>
>     > @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
>     > 
>     >  inherit cargo pkgconfig
>     > 
>     > -DEBUG_PREFIX_MAP +=
>     "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
>     > +DEBUG_PREFIX_MAP +=
>     "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
>     > 
>     >  do_cargo_setup_snapshot () {
>     >     
>      ${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh
>     --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
>     >
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#215180):
>     https://lists.openembedded.org/g/openembedded-core/message/215180
>     > Mute This Topic: https://lists.openembedded.org/mt/112379635/6084445
>     > Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [skandigraun@gmail.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
>


