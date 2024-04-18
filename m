Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E26C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 17:17:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.4714.1713460653832074161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 10:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NTmBDM44;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d0c004b1so1467706e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713460652; x=1714065452; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jHzuu6AFE3DnVo9CPY9iwdzoqezVhN347Ufavj1pp3k=;
        b=NTmBDM44PCydeqCU7NpsrxtN7eZS4Y97ewRG5RjhI41B0sNcqk64jNde0XYWeMarnR
         aH0tSrjdOfsX3BkDFFJD6985oLLMDPv9+/1IkjEZgUR8pA7ULyMO+Y+9dIwp0RVE3eF+
         4QVzI1Pi3kxb1aO7oP8iB3sW4uGjiTtRGyuQTW0pOjqT1FRhEk7WOn7cnmGv6e2jt/sE
         3+ULMTJ2Y1+dMHOYLF5aOMc65EZDGEAHVvPxZZu5fDDgAumNczZcDEDqtEuRa/akONEB
         FV+EnlRfQkrghzTT+uxGjtPFyIQIGEV3wqMXOyEkvz4+vhAb40d/X3KyK5NsvWUcsRQ5
         0b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460652; x=1714065452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHzuu6AFE3DnVo9CPY9iwdzoqezVhN347Ufavj1pp3k=;
        b=Z29Ylyq2Y3rpZ5BIS6YF8Ta0nRncbD9kvh9qfN5ir8HDgcNILQNMIo4tstmaTasplr
         oHNy137DjdAOf+RS4w3Es6AhIi12eh95rNpPa11zteO3F7LlzV+cjjCyCWYW8fvpq+OK
         3k0G8P+Spenaz9+F2BbVVLzcuM8Ggmn/3oWlpwIcwgRAg+Fng5iP2rX6HwRYW52qDlnn
         ayMKH9uSXY4YlObw0iWFzhr0GJbdDAq2MSYwXDODFbKv/Kq8gKVEdPTPi/I6eUs4y4RC
         FPjspdL+HIEVVavRNAkA0LyuiSQbUNZEClxhvp0NPqDoP/y0CajVuo1Zvlvw51aXlUdO
         QxaA==
X-Gm-Message-State: AOJu0YwqR9VmdNLWduD6xwEYO+64BlBJS7nYQ/Frgmh2y/nMwPdbYu8x
	FdUD/qdS5NvHs4elpFi8TkOBfb2/sIH14y4T8SElyU+DTTeXCx0ZI91eSAUohtktpbVVh3ZHFpn
	W0bGyiH3PrRT5s+PkrYdxedB3C/Y=
X-Google-Smtp-Source: AGHT+IGsG+qJDglXM80KfGvZAJluyT0ie4YZlOk4YLCyO7fzxQMU808KLDtc52v5GA8vKDK/jcovIrCfAklvW8qvBFc=
X-Received: by 2002:a05:6512:490:b0:516:b07a:5b62 with SMTP id
 v16-20020a056512049000b00516b07a5b62mr2436770lfq.54.1713460651643; Thu, 18
 Apr 2024 10:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240418155558.3399658-1-jdmason@kudzu.us>
In-Reply-To: <20240418155558.3399658-1-jdmason@kudzu.us>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Apr 2024 19:17:19 +0200
Message-ID: <CANNYZj8dwnv61TtHj5F5F1rAthb_ucYgkLMocc101YsTs7QVOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-c: add UPSTREAM_CHECK
To: jdmason@kudzu.us
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 17:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198522

I have a patch for bitbake that solves the general problem of checking
latest crate versions from crate:// URIs (and fixes cargo-c check as a
result):

https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates&id=6afcb9100b8d99fabcad70afb4f37628a2f62cc6

So this patch is unneeded.

Alex


On Thu, 18 Apr 2024 at 17:56, Jon Mason via lists.openembedded.org
<jdmason=kudzu.us@lists.openembedded.org> wrote:
>
> Add logic to check the upstream version of cargo-c from the github
> account the crate is based on.  Unfortunately, this is an inexact match
> of the versioning, as the crate expects the cargo version as part of the
> version.  For example, the current version is "0.9.30+cargo-0.77.0",
> whereas the latest tagged version is "0.9.31".  So, even if the versions
> matched exactly, the `devtool check-upgrade-status cargo-c-native` will
> show a mismatch.  I think this is better than disabling the check or
> having devtool return broken.  So, leaving this idiosyncrasy as-is.
>
> NOTE: https://crates.io/crates/cargo-c/versions would be a better place
> to get the latest version (and would match the expected cargo
> versioning), but creates.io seems to require javascript and any attempt
> to wget that webpage returns 404.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  .../rust/cargo-c-native_0.9.30+cargo-0.77.0.bb                 | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
> index 8e17606b73dd..eaa51a8d2565 100644
> --- a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
> +++ b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
> @@ -9,6 +9,9 @@ SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c"
>  SRC_URI[cargo-c.sha256sum] = "ec77e3635cdb0d211f88f22d0460eef0ba031eb616ded57f2ffb98a90365c445"
>  S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
>
> +UPSTREAM_CHECK_URI = "https://github.com/lu-zero/cargo-c/releases/"
> +UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)"
> +
>  inherit cargo cargo-update-recipe-crates pkgconfig native
>
>  DEPENDS = "openssl curl"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198520): https://lists.openembedded.org/g/openembedded-core/message/198520
> Mute This Topic: https://lists.openembedded.org/mt/105600795/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

