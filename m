Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A324EC54E41
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 17:39:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.569.1709055594487411155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 09:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/2iRBGG;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5dca1efad59so4269279a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709055594; x=1709660394; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ/zssbVPmKj8oAvmqeTPnhCMD7sFCjF/oXDsczQuzk=;
        b=O/2iRBGGozjUid+Tyqd+2yiGAOWbFHN1GmzHf8iFVUcWXfY3GiUhhuhrqAJRV8EvYJ
         Mfl096e9a43e8uajmApsOJtavDy+4YoyoX53J2KXig92ivT59HgHiuzcCAy8ZfMliaOX
         b2C1WOMNse9ASDy/kOYaIZrdyzdZUtgBvcCM+pejVFxdB68vZgSaikhci/1jW5KRMEeE
         kWHt+8NE/IiggQjXuW0x6g/2/RRkBaChzRj4VDrzANHlcr/dKCTNEMuHoQAwfRONXaTz
         Gn0KgBrcA+3OvUWfiZyCUtW+J69aUprF9K5gvuD4nE2pdimJ7KIsWTVZ4pHkah+t5/Hl
         aG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709055594; x=1709660394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ/zssbVPmKj8oAvmqeTPnhCMD7sFCjF/oXDsczQuzk=;
        b=qNEbhORAP1uAMBuhJBpCYvR31mVORAX7n7X4P3S4MrTIT4TR9aReCY5jYMkauYC6iS
         aNxi4lEUXPsPyY6ev3gSzbzMBmbVxzLlO+mETsJlxl51UTN5B/DZZmSRopI7YG/2aFhE
         DH87EYXMDTrG/Zb6rzXbh7zyZbcPEtxPXgUzwwjjGmIiwRa6k8p9khM6ZfoVPDsn+F1g
         J2F0YX0OVtloEOvAuR6xvFM7jRfsK6fi3LZgKEJPhUIzuRzYMaHZFGpfGz00MGaelJEs
         VRYri+N1wtGywQnWdaT/+gWB/yqvDw9h8N07k3WumOCF/gpZTwC4sCq0fOaKJx3ohPrO
         QtDQ==
X-Gm-Message-State: AOJu0YydoityjwJwDiwSx6akbWHIit9zSjnYETjjfWImFVmjurhQZwLj
	8+xYFGGgaUexFtgk+SLcrh6RiQd/73x1ibRvDfOOO9Bx8oJpSjDw7YMEjvksibjJSLOcOFkGlsT
	+cL3tuhXr/leuDIZ8hr6MDlwLdzQ=
X-Google-Smtp-Source: AGHT+IFWHk2tRc5sU5T46n/kWIO44E4JDPhWn5Oyu5NLyjpTtMp5SWNQhuicSgzm3Hk2NXdw8OCOZcmdkBqXVzuVcKQ=
X-Received: by 2002:a17:90a:b103:b0:29a:e2:a75a with SMTP id
 z3-20020a17090ab10300b0029a00e2a75amr7603648pjq.32.1709055593695; Tue, 27 Feb
 2024 09:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20240227170902.3718203-1-ejo@pengutronix.de> <20240227170902.3718203-3-ejo@pengutronix.de>
In-Reply-To: <20240227170902.3718203-3-ejo@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 12:39:42 -0500
Message-ID: <CADkTA4PQy=DoDhtu0xPCpuv_bbcyYT6YaoDwpnufyJTuqqNd1w@mail.gmail.com>
Subject: Re: [PATCH 3/3] kernel.bbclass: use kernel_version_sanity_check where defined
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 17:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196284

On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutronix=
.de> wrote:
>
> The task 'do_kernel_version_sanity_check' was defined in kernel.bbclass
> but used in kernel-yocto.bbclass only.
>
> Since the task does not depend on any kernel-yocto-specific task
> (anymore), move it to the kernel.bbclass so the check can run for all
> kernels.
>
> If it turns out that this causes too many noise for people that are not
> interested in a consistency between ${PV} and the kernel version, an
> option could be to let KERNEL_VERSION_SANITY_SKIP weakly default to "1"
> in kernel.bbclass or alternatively move the entire code to
> kernel-yocto.bbclass.

The check is actually quite annoying / noisy when working on updating a
kernel.

So we may get complaints :)

Again, I don't have a strong opinion, since the functionality is unchanged
for linux-yocto

Bruce

>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 1 -
>  meta/classes-recipe/kernel.bbclass       | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 854e4681d5..b7d74b7ab8 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -729,6 +729,5 @@ python () {
>  }
>
>  # extra tasks
> -addtask kernel_version_sanity_check after do_patch before do_compile
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 837064cef7..3c805fd96f 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -514,6 +514,8 @@ do_kernel_version_sanity_check() {
>         exit 0
>  }
>
> +addtask kernel_version_sanity_check after do_patch before do_compile
> +
>  addtask shared_workdir after do_compile before do_compile_kernelmodules
>  addtask shared_workdir_setscene
>
> --
> 2.39.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

