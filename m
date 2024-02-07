Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81D5C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 12:42:31 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.19228.1707309746989327572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 04:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rhv3W/7O;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-296d24631c0so396734a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 04:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707309746; x=1707914546; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDte4y4SpeRM5cVyIiNhk1KzihH4QPBan32hZDZ6UAw=;
        b=Rhv3W/7O1xvwh7b/XBAIByDd7AUFrPzNvtkAsNM1RVhNf86bS9OvdfbI64aZklaCby
         J9ykCz+OpWbUecPbGIGIVmrRfK8eJaNNLfzLt+xARtmEsY4bNVG6WWZA+vM7eRi3f3T7
         BaQJ22aOAR4IuAwe6EH/njXXZZHf6IXpeCUApAXP2jBx41DbdwQXTCVbi9ZUHSjWy/W4
         126o+vOMVkqwmKdBYOqADKhtotkRZteuX8oV9aEEBJ4F6iaUH2MJsrC5RYk/QbdFS/Qi
         b11FM6ZxQqJvZM6c29v1PVHpH8NlOCqSbZ54TGhREXfwLJ4MKK+iYOLqqF0jngCzn7ya
         gD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707309746; x=1707914546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDte4y4SpeRM5cVyIiNhk1KzihH4QPBan32hZDZ6UAw=;
        b=Oa4z15k9U8Qysd8mho1SqBQSbmu8JC/2wFZJg8DhY64w0KPSWaQYXdg8i50rBv1W7A
         YXl2uiUG1/UTyVTEwN3zZx5azWz2bzQQnNHKL6NtQa8En3cGZH6haoD0bx0oFrU5VqFo
         zhMBpcZoDWjF4LbugAwDf+9oq/rIoK94MQaGGUXM94KX88xVw8oxZbr90ehvK4mWoxq4
         CWOWFYWyNicX9NyyevovQbBpELrYvkMgZjotPvTv11NN8W9f8+nVC+QtBkz3ljR1pOwK
         TW1TyGZbT11WF9qPhWxJTS634ps+5NuUN83O9ijURBoQGvFTcMQIQ570c2bfg0dWUfGT
         HHig==
X-Gm-Message-State: AOJu0Yyq90J5xNZoMLT1UTjQ6Q04Km8WjXSbJ+npGbxU6S212JCvXsMi
	GLrvObiGe1LQhlSn/fbpDyg3Em6EBnscPGQoUqSnswORtlRcBlzfjR1c5QoCLx5jDT/X5H3BO7M
	g7lXxym9H9XGdYOp7rUY8cQNliO9GtnonTa3tjw==
X-Google-Smtp-Source: AGHT+IFhWnEZGM8xDyP7uWjMRuexAgtm+By/2Nllz/SoroYSdYlBAxk78q8+ZUC4xPrVlcbFYTaZpupFz2lMMUGy0IY=
X-Received: by 2002:a17:90a:db87:b0:296:890c:cf46 with SMTP id
 h7-20020a17090adb8700b00296890ccf46mr2516825pjv.18.1707309746232; Wed, 07 Feb
 2024 04:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Feb 2024 07:42:14 -0500
Message-ID: <CADkTA4NS3=8tUYUz_SMiwfd+E=takHWEVTYi1AjuX41A0p8YOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: openembedded-core@lists.openembedded.org, oss@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 12:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195058

On Wed, Feb 7, 2024 at 5:26=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> Deploy the kernel configuration with the built images, so it is easy to
> check its contents, or rebuild the same configuration outside of the
> Yocto build system.
>

I'm not convinced we need yet more clutter in the deploy directory, but
at a minimum, this patch also needs an update to the documentation
(apologies if I missed it on the docs list).

One could argue that the config could be pulled out of the other
packages and artifacts, and that it wouldn't be recommended to
use that config for rebuilding outside of yocto, as we aren't providing
the matching sources in the deploy directory.

I would also be nice in the commit log to indicate how cleanup of the
deploydir has been tested to show that we won't end up with config*
files and links in the directory after their associated images have been
removed. (I haven't looked at the deploy classes in quite some time,
so I'm unsure if anything in particular needs to be done).

Bruce



> This can be particularly convenient when running a Yocto build as a CI
> job, and only the deploy dir is made available for download.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  meta/classes-recipe/kernel-artifact-names.bbclass | 3 +++
>  meta/classes-recipe/kernel.bbclass                | 7 +++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/cla=
sses-recipe/kernel-artifact-names.bbclass
> index 1a7611a15e..8e2ef0d627 100644
> --- a/meta/classes-recipe/kernel-artifact-names.bbclass
> +++ b/meta/classes-recipe/kernel-artifact-names.bbclass
> @@ -16,6 +16,9 @@ KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}${IMA=
GE_MACHINE_SUFFIX}${IMAGE_V
>  KERNEL_ARTIFACT_LINK_NAME ?=3D "${MACHINE}"
>  KERNEL_ARTIFACT_BIN_EXT ?=3D ".bin"
>
> +KERNEL_CONFIG_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
> +KERNEL_CONFIG_LINK_NAME ?=3D "${KERNEL_ARTIFACT_LINK_NAME}"
> +
>  KERNEL_IMAGE_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
>  KERNEL_IMAGE_LINK_NAME ?=3D "${KERNEL_ARTIFACT_LINK_NAME}"
>  KERNEL_IMAGE_BIN_EXT ?=3D "${KERNEL_ARTIFACT_BIN_EXT}"
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index a76aaee5ba..8a98899e04 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -812,6 +812,13 @@ kernel_do_deploy() {
>                 mkdir "$deployDir"
>         fi
>
> +       if [ -n "${KERNEL_CONFIG_NAME}" ]; then
> +               install -m 0644 .config $deployDir/config-${KERNEL_CONFIG=
_NAME}
> +               if [ -n "${KERNEL_CONFIG_LINK_NAME}" ]; then
> +                       ln -sf config-${KERNEL_CONFIG_NAME} $deployDir/co=
nfig-${KERNEL_CONFIG_LINK_NAME}
> +               fi
> +       fi
> +
>         for imageType in ${KERNEL_IMAGETYPES} ; do
>                 baseName=3D$imageType-${KERNEL_IMAGE_NAME}
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195047): https://lists.openembedded.org/g/openembedde=
d-core/message/195047
> Mute This Topic: https://lists.openembedded.org/mt/104215836/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

