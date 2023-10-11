Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F837CD6119
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:29:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.12053.1697012943573171453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 01:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d8IjKA2O;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5046bf37daeso8570216e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697012942; x=1697617742; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZKSWegBKkmXSaHkJFyDxdJi4gHeShIlxPmrU3LQeb0=;
        b=d8IjKA2OMIyJwked+0xc4irbgZTWUw2591u2xabIp1Ys7v0Xdp5ojGmhSku3IpQUX1
         SbvxvZcrX0qk1eNrOTbTQKeJ2ajgSfGVEi0F0cHlXyNbj/9qQ3K+pf9+U25q2Za89Boa
         J/LH9/Mc9vl9e5tg3yfQu1LMp+M03JXxxGVkGZ3hqV48IGHr0WOrBiZBJ9c0zU90w1xn
         jFVuVmRKxezrX1REAArjTuw+vg2r/0BXhOLpnpBvLqvN/TKlO518mbgwwjcyy7YfBfFd
         xrh5moggEUvHi8AAN1D30lWgx4yDZ4tYwRAfLj146/fhWrdPSKvWvSKVwbDfzUttqwlQ
         fJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012942; x=1697617742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZKSWegBKkmXSaHkJFyDxdJi4gHeShIlxPmrU3LQeb0=;
        b=ev3OD4xXD10TFvqNdCCci/X1YF/s157uTM0W3hmVcJefe7X/2RU5jz5QvL9ZKZoNnt
         HH6SiI2puLEwXeleXl7ZQ1zVHmRyC9J4UPeDWQ7XQ9MehC+l9lXFW5iEMXz4O15yqZDX
         oT/iG5ZWco2wfEwdrveqOxvPmISl+j6RyIGMwSPJ8xBOj3HDHhtZGMq64fzFzPinTGO6
         TUNL17J8V6+Rix5eN+EfJxxxdLrIZJdLVRryYwWoza5O/HydFN3BVECJJCCs2nlPCZAY
         iM+4wu9CU2B0ekhdWJXYpZoGmGc1k/pJpziAAXpw/Wx0jBCHfenVEHJoTqAocKLwSoqu
         MNWw==
X-Gm-Message-State: AOJu0YxDBt0s6sLXPyRTaioceG+Sydwd740b8acXzFm6ta0pwHLfx0la
	7pg1CsfjWu+6dRTKwtXaYujBL7sMqExX9LLPSdQ=
X-Google-Smtp-Source: AGHT+IH5oT0FbXYEaL2os9j/1Mh61H4tqL1iHl+SyYNwhMtrcLtOl0szmovhkUOxOVFnaDbkyvKn7oSo0QJyxB8eIsM=
X-Received: by 2002:a05:6512:39d4:b0:4fb:911b:4e19 with SMTP id
 k20-20020a05651239d400b004fb911b4e19mr21049368lfu.35.1697012941334; Wed, 11
 Oct 2023 01:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Oct 2023 10:28:50 +0200
Message-ID: <CANNYZj8NQLvmQrLfFb4s7M4u7CeN2DGnJnEpWTvfp_eFERcr6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	umesh.kallapa@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188949

Excellent, thanks!

Alex

On Wed, 11 Oct 2023 at 06:06, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
>
> [Yocto#14875]
> The '--remap-path-prefix' option removes all references to build directory structure in the debug information within the compiled output for Cargo dependencies and the project's binary.
> However, some references to build directories remains in the final binary in .rustc section in the form of compressed metadata and this makes the build output dependent on the folder structure of the computer it's compiled on.
> So, for reproducible builds, use the configuration option 'remap-debuginfo = true' along with the '--remap-path-prefix'.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>  meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 84c6c3a05f..9b4a0887dd 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -16,8 +16,6 @@ import os
>  import datetime
>
>  exclude_packages = [
> -       'rust',
> -       'rust-dbg'
>         ]
>
>  def is_excluded(package):
> diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devtools/rust/rust_1.70.0.bb
> index 3b9c05a19f..16d433910f 100644
> --- a/meta/recipes-devtools/rust/rust_1.70.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
> @@ -130,6 +130,7 @@ python do_configure() {
>      # [rust]
>      config.add_section("rust")
>      config.set("rust", "rpath", e(True))
> +    config.set("rust", "remap-debuginfo", e(True))
>      config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
>
>      # Whether or not to optimize the compiler and standard library
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188940): https://lists.openembedded.org/g/openembedded-core/message/188940
> Mute This Topic: https://lists.openembedded.org/mt/101890610/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

