Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB47C19F2D
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 00:56:47 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web12.9526.1659833799644667182
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GrhnLs5n;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id z5so8957876yba.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=r/UFxD3qodDqarBvLHcFb8wSOBcO9dQEfCDAFZzDu6w=;
        b=GrhnLs5n36IcNSBgT1QkoncxJ2gMVyssHUydUGlUGHCnVD6uMsYrISsXxJKKAC6Wom
         78FTj3y4/oHRePW9vvdWtMyTt6V27H3k0LmuOLIKTJoib1Tc3988X1tW9bQh3tXljnAM
         fTJlsDjN5sMTGFdeRkAZBOQ0x8NJ3F9hU1IOWwkAGwQzDOBLD/rn4ZUCW4i/WZb1+rdU
         Px95OmD+PnW3//FaE5/wNOX+wse6VPh4OWFHToSHb8Ho3HKmZ58lo+lvu7Gd2c/5Gb1l
         eMu2sY4aBW3B74nk6NER5q+t0sv+xCilCzqbQdXA8w7Z5lyVYo+3c161jC+GAH+z6oLa
         bMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=r/UFxD3qodDqarBvLHcFb8wSOBcO9dQEfCDAFZzDu6w=;
        b=1bukW3unILWyTWUWtAiU2WZfR24uIhDEsosOOEkVHa6N/IjiuX7SK0k+l+oHDiwq38
         spFpER6eWWKqIWtbrCUTbK9EDDnWfxmffs2SOwWlgbye26LatqPaoKRWxWEXhghZU9Od
         uzaSIK+sPn/QK+qsAnyKnsK/+CsdJVjBznxOJLaGfuatRc+XUlnOI84ZZ5uMNUm3J9B7
         SDed7BBzWLw3HyLzaCXxq/pPYYc1VotZbgsEYfJNpmboWyU8jQQoQsHyxmXSsrvC1W9f
         c6eRW6BwJHlqdCSFMotB6LU+S4A82GN3jeLOyza9saUyM2WgKEvRtvZ8C7uVUragQDLd
         DJiA==
X-Gm-Message-State: ACgBeo31CIzRuMAjqhAM1nh12RSHpsI/bvop3amKwSAyUXoFHRvUTJ/q
	HuIHyIMiG9VbSMUEykC8oJtcKKpCoWoae6mBYhqcOxl2
X-Google-Smtp-Source: 
 AA6agR4kGwFMOlkoLXt8xxu5HgFGWjPcgjYEvkcGu4PFnxzwRHbDwBUpBTIpU5AkQE6RiKFFRDr8HSdzXxtBrw05Ydk=
X-Received: by 2002:a25:ef52:0:b0:674:4eb5:cbc6 with SMTP id
 w18-20020a25ef52000000b006744eb5cbc6mr10913460ybm.620.1659833798667; Sat, 06
 Aug 2022 17:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
 <20220805131252.3706794-12-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220805131252.3706794-12-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Aug 2022 17:56:11 -0700
Message-ID: 
 <CAMKF1sptpABUGaYwsKAoW11p1F-CKyVtsntQOLSi29L5CXbW6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/29] rust.inc: Fix cross build llvm-config
 handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 00:56:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168981

On Fri, Aug 5, 2022 at 6:13 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We need llvm-config for the target but the cross compiled target binary is
> no good. We can copy the native one into the target location where it will
> then return the target values though.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/rust/rust.inc | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
> index 30f2b71fe8c..47b76e725de 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -18,7 +18,8 @@ export RUST_TARGET_PATH="${WORKDIR}/targets/"
>  export FORCE_CRATE_HASH="${BB_TASKHASH}"
>
>  RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> -export YOCTO_ALTERNATE_EXE_PATH = "${RUST_ALTERNATE_EXE_PATH}"
> +RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
> +
>  export YOCTO_ALTERNATE_MULTILIB_NAME = "/${BASELIB}"
>
>  # We don't want to use bitbakes vendoring because the rust sources do their
> @@ -82,8 +83,9 @@ python do_configure() {
>      host_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
>      config.add_section(host_section)
>
> -    llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
> -    config.set(host_section, "llvm-config", e(llvm_config))
> +    llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
> +    llvm_config_build = d.expand("${RUST_ALTERNATE_EXE_PATH_NATIVE}")
> +    config.set(host_section, "llvm-config", e(llvm_config_target))
>
>      config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
>      config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> @@ -93,7 +95,7 @@ python do_configure() {
>      build_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
>      config.add_section(build_section)
>
> -    config.set(build_section, "llvm-config", e(llvm_config))
> +    config.set(build_section, "llvm-config", e(llvm_config_build))
>
>      config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
>      config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> @@ -169,6 +171,14 @@ rust_runx () {
>      unset CXXFLAGS
>      unset CPPFLAGS
>
> +    # Copy the natively built llvm-config into the target so we can run it. Horrible,
> +    # but works!
> +    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
> +        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
> +        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> +        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
> +    fi
> +


this is interesting. In meta-clang we have a different solution which
uses wrapper for llvm-config but this seems
interesting at the same time hacky but if it works. I will take a
deeper look from clang's pov too.

>      oe_cargo_fix_env
>
>      python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168946): https://lists.openembedded.org/g/openembedded-core/message/168946
> Mute This Topic: https://lists.openembedded.org/mt/92834390/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

