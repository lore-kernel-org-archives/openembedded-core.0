Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.296.1616173214728661904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HxVcsAkm;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id u20so12789362lja.13
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0u50CVSynFA9QtwyZ6C11nuV3SorFbb4b81heXh75fA=;
        b=HxVcsAkmqce6a9rMjzdef03ltBcHjoyOFhGb2EEYGt3RYXNwQBCKxsWlqPRyQMI4JC
         a2gcIMAbPGRyrLF2s0TH2UbIvzkKj4WS4QFu/GbcAd0Wc2Xm2RNyM3hRuG5Vx73mEHhq
         3zu2jD6K6bsR5z5EJwSTJyFSOJog4WuiYdUtj7FUOTan1QWghnG9H+8Nsvrgsn2Tw70C
         Fxh3sCNB/bOyz1nd2LiIrZrVG07AIILJ10SFwheEiuAMmMbLpl0tFu3YvA8p4SEEYNP0
         i35oPUllGOI6wmTKSh5ZjSnFChSJx8cw39s8FfWzKcxx2N9GoRqIaZ2ZI56XaTKzlHIX
         ITxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0u50CVSynFA9QtwyZ6C11nuV3SorFbb4b81heXh75fA=;
        b=r3+jEma6JWAba7qlQ7vUrkQFT2BFcWr68u7Jtmp9Dzv5qRgT1FxNoQn5fSVeDZv2XO
         ajmWenPt+JHQRttjuE9AJl7443TXowtczjkFjxPUeLCYRlxd2vTHWgbmT2KQodx7eD2m
         27RgdDaEOk7+HQ3KwkyXEYB8z98CMm504LvHkH4rBy3lg37zExa0Au+JcXQXv50GaE5p
         HwurristmfN1z2EPxFtinwmZy6MDM1C/B/nYJwltswdNIBtfsMVFy/i7W0iqtqUAVaFh
         P4oOmW31282e5LjypFCydSVHNsQ4oUjHjlN4c0SGuTw5OC+pS/V7dMBSBFm60KNnnU5M
         naEA==
X-Gm-Message-State: AOAM5329gXhDYmXNd8tXeJ51J8ERJB/3LRv/cjPVfqctIU0DPqERbgr8
	PxNTuIltYN554pLJOuMKObTGNBxVT53pYsTjBybs5uUNTJc=
X-Google-Smtp-Source: ABdhPJxsp+VKX9y1FcsHqoVFCVoTHYhMl+IVGa0mj0p+6WQ+a/oBR87icjxwzC+2WG87pEUTXjdG4yIBEctntemEwmw=
X-Received: by 2002:a2e:9101:: with SMTP id m1mr1512651ljg.378.1616173212677;
 Fri, 19 Mar 2021 10:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <92d67e94-f4d9-e693-b3af-18b69b8d881@crashcourse.ca>
In-Reply-To: <92d67e94-f4d9-e693-b3af-18b69b8d881@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 19 Mar 2021 10:00:00 -0700
Message-ID: <CAJ86T=X8gf=bni_bguQObcgNt_ME3Re2a9xc4OmuhynvG8C9cg@mail.gmail.com>
Subject: Re: [OE-core] diff between "bitbake meta-toolchain" and "bitbake -c populate_sdk <target>?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 7:23 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   colleague just asked me about the difference between building an SDK
> with either of:
>
>   $ bitbake meta-toolchain
>   $ bitbake -c populate_sdk <some target>
>
> i know that the meta-toolchain recipe file contains little more than
> inheriting populate_sdk so, without checking, i speculated wildly as
> follows:
>
>   "bitbake meta-toolchain" takes no target, so it's limited to
> whatever info it can glean from local.conf and bitbake.conf and so on
> and so on, things like MACHINE and DISTRO, and whatever assignments to
> TOOLCHAIN_HOST_TASK, etc, it runs into in its travels; in essence,
> it's a "generic" toolchain.

It's an example of a "pure" toolchain recipe. You are free to modify
it and add additional packages or use it as a reference to create your
own toolchain recipe. Here's another example of a pure toolchain
recipe from my current project:

  SUMMARY = "Installable toolchain for SK"
  LICENSE = "MIT"

  inherit populate_sdk

  TOOLCHAIN_TARGET_TASK_append = " packagegroup-sk-build-deps"

(As a side note, LICENSE still seems to be required in toolchain
recipes even though it's not in image recipes... it's a bug).

>   on the other hand, "bitbake -c populate_sdk <target>" can, in
> addition, consult the target recipe file where it can collect even
> further SDK defining info, like what you find in core-image-sato.bb:

You mean <image-recipe> instead of <target>. I don't think you can
create a toolchain from a normal recipe.

> TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
>
>   at the risk of over-simplification, is that a not wholly inaccurate
> explanation of the difference?

Sounds about right. Note that using the populate_sdk task for an image
recipe means your toolchain will contain some extra junk (e.g.
busybox, etc) which isn't required and won't be there in toolchains
created from a pure toolchain recipe (since in a pure toolchain recipe
you have direct control over TOOLCHAIN_TARGET_TASK).

They both basically do the same but the populate_sdk task for an image
recipe automatically sets TOOLCHAIN_TARGET_TASK and
TOOLCHAIN_HOST_TASK for you based on the contents of the image whereas
with a pure toolchain recipe you are responsible for controlling these
explicitly (or leaving them alone, in which case you'll get a minimal
toolchain, as you do with the meta-toolchain recipe (horrible naming
IMO)).
