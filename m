Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84E6C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 09:57:28 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web12.10831.1645523848455020125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 01:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ErB07W7e;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id 10so9316503uar.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HyMp5szYGM17fgygFBqKNid/u9Ul+ktZi6Js4MXiOt8=;
        b=ErB07W7exXjQNvWP7PsBgmdUaKfgjTZEIz2bDMRZnkSU3cnLyzuLS8REwBpm7aripJ
         bW8GH/nNN18esUm8eh+SXY6wljBa+hwi91AvS26j16LGmamUhTx6o+vizODrryqn0bxh
         48VmvgBej8KBqRBjsmG4lA6PtyjthR/ADZ+8nNfeb6n1sGLJ2BMbNBF1Ph8uiVuEV+Zj
         9b/tWi7hcBK1xCsYhQUriMoAtG9H5x5dafVhOABqPn8l4401l0QWHbgtuy9y3NfvicgG
         DGJVd3N/SZBeViNllZuwa7U5mxkpjWagVn1Yl+n9mc1gFBtm0aW+aff64EUzgsbRxqRA
         29BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HyMp5szYGM17fgygFBqKNid/u9Ul+ktZi6Js4MXiOt8=;
        b=14O6JB/042M4mYS1iEPZ6tWnXOtXqCY68F22FjtiDFAU28jwMeamAKMORpZXuvddlY
         MI/XCn3Tk17c8dkYhrxGlo6auEedOgQ6W9Ii8a86gNBP/POdTOY17q9NzmLbzoZbukH1
         VPWTyzsQvia/8AolQgmZ8MuYdwCuNyO4JdWbMzEi5AbBdZ82UqpvKsQOE9MyKXibE01G
         F3sq2kO+RCQyM8Blb5PI3szfYaHq8FYXvjimLRWw1RwyPVmU0Xcpa5W90mAwGpXk+wVO
         14505l8llWzyT4KAW1jYh6iI2Drwl6MlFgqhcCb9hi+ev6p9c0Yq9QXi1fcCZiPaaYxO
         xjhQ==
X-Gm-Message-State: AOAM531rqiDceKPUkFBOmhMqxIjrYjxE9Ek98SU53orGi71dI2wXTV50
	Gxc33hUr7RvlqpB6zKD0lw9X7qSdbXtwuWL5fOQ=
X-Google-Smtp-Source: 
 ABdhPJx3+OXW+7ABp+MHC1MkaMCbCN4O9xFiF+qUTc4rtHmsVG5hPyhu3dAlV2qcHB+33Qxdoeotr7Elx7EgwxIXraA=
X-Received: by 2002:ab0:373a:0:b0:342:b28e:f1c0 with SMTP id
 s26-20020ab0373a000000b00342b28ef1c0mr3000053uag.93.1645523847537; Tue, 22
 Feb 2022 01:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-7-andrew@aj.id.au>
In-Reply-To: <20220222035234.463162-7-andrew@aj.id.au>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Feb 2022 10:57:16 +0100
Message-ID: 
 <CANNYZj8uEbibb6POcuhc+fEvViJCXb8_yAC28wMyGSgiAJA35Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 6/8] rust: Mitigate duplicate sections on
 matching architectures
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 09:57:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162127

This needs a better explanation. What is the problem and how is it being fixed?

Alex

On Tue, 22 Feb 2022 at 04:52, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> This seemed to be an issue for Power once the arch mappings were fixed
> (by a patch later in this series).
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta/recipes-devtools/rust/rust.inc | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
> index cc0730e9cd2d..fd934082bddf 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -35,8 +35,11 @@ setup_cargo_environment () {
>      # Later stages are build for the native target (i.e. target.x86_64-linux)
>      cargo_common_do_configure
>
> -    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
> -    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
> +    if [ ${SNAPSHOT_BUILD_SYS} != ${RUST_BUILD_SYS} ]
> +    then
> +        printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
> +        printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
> +    fi
>  }
>
>  include rust-common.inc
> @@ -88,15 +91,16 @@ python do_configure() {
>      config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
>      config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
>
> -    # If we don't do this rust-native will compile it's own llvm for BUILD.
> -    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> -    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
> -    config.add_section(target_section)
> +    if (d.getVar('SNAPSHOT_BUILD_SYS') != d.getVar('RUST_TARGET_SYS')):
> +        # If we don't do this rust-native will compile it's own llvm for BUILD.
> +        # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +        target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
> +        config.add_section(target_section)
>
> -    config.set(target_section, "llvm-config", e(llvm_config))
> +        config.set(target_section, "llvm-config", e(llvm_config))
>
> -    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
> -    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> +        config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
> +        config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
>
>      # [rust]
>      config.add_section("rust")
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162120): https://lists.openembedded.org/g/openembedded-core/message/162120
> Mute This Topic: https://lists.openembedded.org/mt/89310362/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

