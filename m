Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED9FCE7A94
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:40:41 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.58632.1695642036482944739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mElHjd2c;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c01d22f332so88791581fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695642034; x=1696246834; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PNp4jVkXoKoalaeZlnobQ3WfVJBc9Lh6fdD2X351JXs=;
        b=mElHjd2cCRyl9xMlLILX93aCgtwZMRTs6ChZ/dAT5EApFVC/ws8KcHVOvb3JXskH2M
         FthvLPIx0ZhwjBaF36Ve+vugweoJSCZRzZnPP4NwbDa7dP4sI4hjWTapS3Ps/wsce6ql
         oNBkes4Si+KBLvhMoA9uSQchSPkokFK0AAA9soSbdy+GlicpQUYEPyDiYtMBPbywFK8k
         Zc2F0nuonwGwbBIcZpbSum9aBIkm9uoDXp8Mq2il/DIkqD0QOBha3Ej7eIX/RCRPw6Qr
         5xO+6wEQIzc9l2xtG25PYQLIF5WauC3FybnWrGUtkvGB50mPcTUIuLj10pZI4kwJmQvW
         lXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695642034; x=1696246834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNp4jVkXoKoalaeZlnobQ3WfVJBc9Lh6fdD2X351JXs=;
        b=kgdQECmkqJ4znp1YGu8TraB8Xk7UvmPsTIW5b4JjzifV7WIwzQPJNmUMVE27FfKudx
         +LnVrCf2NQlqRqwiLW0Jvs6BuMr+uh6UnRH8f1hxmD0lLxiUwMmncfgFuVgcrJO4ovhc
         VFutaq1CazfENV+GUJqY/6KVz3CgtB7+rxK0PtP7VGSUl3b7brrFf7El6TwTv8bFhQ3z
         R8tne/RJGJlFO1bXarmYghda03XOqR1Yf25J87RhxK6NXNVb5DZQeL5XRUTaVigxIOtz
         ecVTTpsDqgB+rOmnOTGMMVdUY/kdABFf6OUMsrHVSjUDgXeI7GjRwoOYDSjrjG9rp9rC
         /CxQ==
X-Gm-Message-State: AOJu0Yz8jpWtrsMIxOWFdOH2U1x3RNLnqQJWIXowcBxG3DvXyHR4nA2L
	OcGEZWZri45IiHUWBOy0FPPe/F63fej2hvMfqhg=
X-Google-Smtp-Source: AGHT+IFaj4PrPXSRo9q5iXctwW34g+KzHBmIO9cqPhcEq6ZS6AEvsDKHddwhjWWNvRzXlaZcSZf6zgXaRTMspSuTCUY=
X-Received: by 2002:a05:651c:3c8:b0:2bf:f994:ce84 with SMTP id
 f8-20020a05651c03c800b002bff994ce84mr3568784ljp.7.1695642033677; Mon, 25 Sep
 2023 04:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230925113508.1087898-1-ross.burton@arm.com>
In-Reply-To: <20230925113508.1087898-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Sep 2023 13:40:22 +0200
Message-ID: <CANNYZj9a__Khh18U7ctuAq0Ow2ODW2v9_+drFOdxQ80WeTMNZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: reduce size of -dbg package
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188186

Thanks! What's the next biggest offender?

Alex

On Mon, 25 Sept 2023 at 13:35, Ross Burton <ross.burton@arm.com> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of
> the debug symbols (4.3GB to 700M at time of writing):
>
>   Level 1 produces minimal information, enough for making backtraces in
>   parts of the program that you don't plan to debug. This includes
>   descriptions of functions and external variables, and line number
>   tables, but no information about local variables.
>
> This makes the sstate objects a lot more manageable, and packaging
> faster.  On my machine:
>
>   PKG          TASK                 ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
>   webkitgtk    do_compile           -613.8s   -21.7%    2823.3s -> 2209.5s
>   webkitgtk    do_package           -143.4s   -53.6%     267.7s -> 124.3s
>   webkitgtk    do_install            -93.7s   -60.1%     156.0s -> 62.3s
>   webkitgtk    do_populate_sysroot   -51.6s   -86.4%      59.7s -> 8.1s
>
> Cumulative walltime:
>   -892.9s    -26.5%    56:06.3 (3366.3s) -> 41:13.4 (2473.4s)
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.40.5.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
> index a0c97aa593c..0c54f202ca5 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
> @@ -87,6 +87,10 @@ EXTRA_OECMAKE = " \
>                   -DUSE_GTK4=ON \
>                   "
>
> +# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
> +# debug symbols (4.3GB to 700M at time of writing)
> +DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
> +
>  # Javascript JIT is not supported on ARC
>  EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
>  # By default 25-bit "medium" calls are used on ARC
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188185): https://lists.openembedded.org/g/openembedded-core/message/188185
> Mute This Topic: https://lists.openembedded.org/mt/101571944/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

