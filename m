Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF93CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:49:34 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web10.6360.1759171763764006561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ci6AiApw;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-636d5cefab2so6714374d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759171763; x=1759776563; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gnBcfoY9nv/nxYhFW7cgtfAXuud6vTuKAnKKeSUakY=;
        b=ci6AiApwaI8CgN4f65XCW3xeZX3whpoEUDkk8zayju4vCxqBofVJAssPiJ7JyTHKYK
         QNFBJtokBUOtnOh68kiBmm8VDxW9wb3adU7yudSrFo5AMINBCkKOGiYh3+EJNbIWzOmB
         n5eQHJ+S4GbJArUdbfQpYmGOoPft34yXQBphVX+FGjKN0tD+RS17Y9Dlh+Ec5Xkw78+5
         9+hBFAZtPgXA8jDhGJGJvS+XvhenSwYuRFjpGYKF7ef20IMGbKHHLslb8MXfilrGwPp/
         ktMvNc5y+8EG3SJth+UDHhx5HmoFRFYqbNUd9ReR+HFHWkAwFCXEcALZByZWh9asR9RS
         +7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759171763; x=1759776563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gnBcfoY9nv/nxYhFW7cgtfAXuud6vTuKAnKKeSUakY=;
        b=Qzr8xr9GXn4jfzh1yvfrLD6axn9ZAFzzMq2wtb2OjEEYttrY2CHxvzAVc1HoVzq4+S
         aZM3jK4ihgZaw+oy02UgGg+21aEKCtjjZ3zkEfDoq5H/0JWbFo912Qkd9Rer9ieLkmGC
         oNI/mpgBcRvtzFHfzx5tOfPHMEpcDoWvM70oqI+keSdF3nCKV++OEOnNsszcIBLMe0Fp
         jZzEnlupgz2SVWRA9Ce5kOe4YqfriyVqhtiqo5iWDGXLMzOqSn0lvZvK3ipm+Satm6et
         FRf91ZVaoFzwkcfdmC+3R91pHo2dY4CPYy8XA1Aqx0ooQ3usr1TauAySNCFaaQolv74t
         Ce4Q==
X-Gm-Message-State: AOJu0YxgIZdTmVu+tsVhzEqnmuCAfw43YnMqCi2XUurBZZLUfeUW+M0k
	o+BkrETqmW6TUJXng/b/wq0/sMEEX9OBMrB+7tQqiLD4cfPJcNSkEvsPUcx0IMziVLLpYayXtd0
	Dm3TKQt0O6uuKXutNOU013aZ3mwlw7t/XiCU0
X-Gm-Gg: ASbGncuEMvAtajnHkCZO1pQPbgfpfsy8Pk+xvoaDcAaIw0+5CItCV+h+AVxX9F/uTub
	xasUKvf4ks1orwueOhk9MJCmgH3k0tz+567YotstFWETP0Q3DwaKMGwCoOAveEDtXchxjCzjIbK
	nJHPgMcyrfQHLGOh8LtMR11Kyrmc1jLaOMuC8L4iko5uS7LcLVJ2sq408Q5oXWMtg/SJ2dGKYyC
	J38PaSyt+TH3gKNGspicOGUvsJLC1x96a6Ihjjo992XASJbzrtA7C8lE60psQhVx1taQylp8cE1
	3+o8HlJ1G5EH6xpyC4UTEmKHBoj7CgEfPX993b7eMURYUj84zDTbRw==
X-Google-Smtp-Source: AGHT+IGBGSFoPd46N/8Rw4sdGNG6Zy/ixE+HC6BzU15fdpGV1rzvWqyIsYpxa3PwMu/iqYOkdxLp/Yiplo1WlkMmgss=
X-Received: by 2002:a05:690e:4299:10b0:636:ca97:d6dc with SMTP id
 956f58d0204a3-636ca97d8dbmr13407423d50.9.1759171762739; Mon, 29 Sep 2025
 11:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250916040927.103722-1-hongxu.jia@windriver.com> <20250916040927.103722-2-hongxu.jia@windriver.com>
In-Reply-To: <20250916040927.103722-2-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 11:48:56 -0700
X-Gm-Features: AS18NWDyz8f7XKpdX8B7bZK_9X-lcha_-c_jIkklU8eEA-7KR_uvo6AY7SSIR5A
Message-ID: <CAMKF1srfMTwtqXnsq0LbKh2hMVgSB_5VJW8Hu7gmv2wGsBaACg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/8] distro/include: Add debug_build.inc when
 DEBUG_BUILD is enabled
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	peter.kjellerstedt@axis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 18:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224165

On Mon, Sep 15, 2025 at 9:09=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Add a new include file debug_build.inc to override SELECTED_OPTIMIZATION
> and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled
>
> Add separate variables FULL_OPTLEVEL, DEBUG_OPTLEVEL and BUILD_OPTLEVEL
> for the optimization level, and override it for specific recipe other
> than original remove and append DEBUG_OPTIMIZATION and BUILD_OPTIMIZATION
>
> Update the documentation for FULL_OPTIMIZATION and DEBUG_OPTIMIZATION
>
> Require the include file when DEBUG_BUILD is enabled
>

I was hoping that adding DEBUG_BUILD would reduce number of global
variables to manage
but it seems to introduce another one in form of DEBUG_OPTLEVEL, this
makes the logic a bit complicated
I think it will be good to explore a bit more and see if we do not
have to do it.

> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/bitbake.conf                   | 13 +++++++------
>  meta/conf/distro/include/debug_build.inc |  7 +++++++
>  meta/conf/documentation.conf             |  8 +++++---
>  3 files changed, 19 insertions(+), 9 deletions(-)
>  create mode 100644 meta/conf/distro/include/debug_build.inc
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8e90c7bbc8..0e614c6b21 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -658,13 +658,12 @@ DEBUG_PREFIX_MAP ?=3D "\
>  "
>  DEBUG_LEVELFLAG ?=3D "-g"
>
> -FULL_OPTIMIZATION =3D "-O2 ${DEBUG_LEVELFLAG}"
> -DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
> -SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', '=
DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> -SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATIO=
N DEBUG_BUILD"
> +FULL_OPTLEVEL ?=3D "-O2"
> +FULL_OPTIMIZATION =3D "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
> +SELECTED_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>  # compiler flags for native/nativesdk
> -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O=
2', d)}"
> -BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
> +BUILD_OPTLEVEL ?=3D "-O2"
> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL}"
>
>  ##################################################################
>  # Reproducibility
> @@ -831,6 +830,8 @@ include conf/licenses.conf
>  require conf/sanity.conf
>  include conf/bblock.conf
>
> +require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_bu=
ild.inc', '', d)}
> +
>  ##################################################################
>  # Weak variables (usually to retain backwards compatibility)
>  ##################################################################
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> new file mode 100644
> index 0000000000..a9222a442a
> --- /dev/null
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -0,0 +1,7 @@
> +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD=
 is enabled.
> +DEBUG_OPTLEVEL ?=3D "-Og"
> +DEBUG_OPTIMIZATION =3D "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
> +SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}"
> +# compiler flags for native/nativesdk
> +BUILD_OPTLEVEL =3D "-Og"
> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL} -g"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 741130a392..b643724e27 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -129,8 +129,9 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] =3D "Defines which l=
ayers to include during cve-c
>  D[doc] =3D "The destination directory."
>  DATE[doc] =3D "The date the build was started using YMD format."
>  DATETIME[doc] =3D "The date and time the build was started."
> -DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging informa=
tion. This influences the value of the SELECTED_OPTIMIZATION variable."
> -DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CF=
LAGS when compiling a system for debugging. This variable defaults to '-Og =
${DEBUG_LEVELFLAG}'."
> +DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging informa=
tion. This influences the value of the SELECTED_OPTIMIZATION variable and i=
ncludes file conf/distro/include/debug_build.inc"
> +DEBUG_OPTLEVEL[doc] =3D "The toolchain optimization level flags for debu=
gging. This variable defaults to '-Og'"
> +DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CF=
LAGS when compiling a system for debugging. This variable defaults to '${DE=
BUG_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
>  DEFAULT_PREFERENCE[doc] =3D "Specifies a weak bias for recipe selection =
priority."
>  DEPENDS[doc] =3D "Lists a recipe's build-time dependencies (i.e. other r=
ecipe files)."
>  DEPLOY_DIR[doc] =3D "Points to the general area that the OpenEmbedded bu=
ild system uses to place images, packages, SDKs and other output files that=
 are ready to be used outside of the build system."
> @@ -178,7 +179,8 @@ FILESPATH[doc] =3D "The default set of directories th=
e OpenEmbedded build system u
>  FILESYSTEM_PERMS_TABLES[doc] =3D "Allows you to define your own file per=
missions settings table as part of your configuration for the packaging pro=
cess."
>  FONT_EXTRA_RDEPENDS[doc] =3D "When a recipe inherits the fontcache class=
, this variable specifies runtime dependencies for font packages. This vari=
able defaults to 'fontconfig-utils'."
>  FONT_PACKAGES[doc] =3D "When a recipe inherits the fontcache class, this=
 variable identifies packages containing font files that need to be cached =
by Fontconfig."
> -FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CFL=
AGS when compiling an optimized system. This variable defaults to '-O2 ${DE=
BUG_LEVELFLAG}'."
> +FULL_OPTLEVEL[doc] =3D "The toolchain optimization level flags. This var=
iable defaults to '-O2'"
> +FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CFL=
AGS when compiling an optimized system. This variable defaults to '${FULL_O=
PTLEVEL} ${DEBUG_LEVELFLAG}'."
>
>  #G
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223516): https://lists.openembedded.org/g/openembedde=
d-core/message/223516
> Mute This Topic: https://lists.openembedded.org/mt/115268057/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

