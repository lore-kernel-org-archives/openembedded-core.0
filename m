Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243D3C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 14:51:20 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.50464.1745851875233793843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 07:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dThdv5uh;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f94b7bd964so3678987b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745851874; x=1746456674; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1XspJm5KeeNXTIRL+Tor4E6yrZm3NiUbonqlGASGA0=;
        b=dThdv5uh1LLx2Ui1l4Gv1rDC86ALXcpmEUGsk7hqnhPWoL+GjaUqF5WOAp+NyEJG8m
         3b+elhI6d9yh2VmWcM2iTHGLEcuJ9ERbcFe3LIaewQ/bUr4hkIajohjQXANNxzfVgAYV
         WYJhkWy3pDkl/uedO6RKWym06vb/EL8GRICErekUO+g1KxAiHf4i4MvtTLxgqnMKH0lK
         Nz1XCWLOUl1rWbtkPRIN/8OSgFclPbkxsaO4KftEzOAWGbaPtuyPswgbuDJsP2kk7P6L
         HvDzFZJMlcmqSNv+l+zzwZZxggn3Z201vI0NB+U4/pxUXt6uPx3Qm/hfoS50yr50q2Qs
         i8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851874; x=1746456674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1XspJm5KeeNXTIRL+Tor4E6yrZm3NiUbonqlGASGA0=;
        b=nRLQEgzXO1gtIU7y6AK7K++yTQnNv1iKbJqslu0C2XC9GuRXJLbN2tLdtpkYxsSsTh
         GVxtGwbo0OcHAug9n85/43yu4JUlNPS6QBYS+3f0tg+WthYl9VU4/9aeelF3d6CBnXBJ
         +bXkGYZIEhkalg/fpT1wYf5XvyqoeV5cKaXvxFoOZc2oWaXUZ7I/6KHSz91VvP0vqH5A
         tUOlod+Hc3XGAcqiD4ky3SUzMMmziE8il/oqJVFI5S/w6ZEHwpB/nHQYOWvTxitTYb37
         tHsC794DofP/VSH0xOPPXmhRAywh0WNlzoHSuoHwpD9h/hRUkZfCa/32juZ9X4MYJzM9
         9qjQ==
X-Gm-Message-State: AOJu0YzNjtwzfSnqUAsJcSdjTgP0axG5pXoVbCawmjeOM3DQOEiwCslU
	m/J2KBw5SwGMB28T/6O5zdgku7F/HwpGW0Dv8Ae14QeON2/CgCGPjKSFa475JtZ709esOVKZVu5
	RSsvwoOuTRt8QCSPxJhjDfPRKLO4=
X-Gm-Gg: ASbGncu4PQJY/aBh+RKJK2bQrP4CCTbvzEB4V5sjcC+BUTHBsliwTjGT5KMKgXgDo97
	wGdkcdoKo06isS8yQczdtPs+zwd85pEhuNo0CdTo6UtMhVl4yvmaWT+guw0jeCiCCLLSVTMJ1GZ
	YremrzGD1UpM2GYk+YUnFw
X-Google-Smtp-Source: AGHT+IGJDzoJbeo7rFvo2SIbI8YIpMlgh864+h+WHyNuofJZVDaOK/dXC95/sHfScHgoyZJMtVuJHMtyUiKJxzidLUo=
X-Received: by 2002:a05:6808:6b89:b0:3fa:3922:5fbe with SMTP id
 5614622812f47-401f287a113mr7192653b6e.5.1745851874434; Mon, 28 Apr 2025
 07:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-8-42d205904261@gmail.com> <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
In-Reply-To: <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 07:50:47 -0700
X-Gm-Features: ATxdqUEs3rIcHKi8CQ2umQQ6DfgnNj2IOnGc91KurVVRdJtGhHJOr77v9nKrSE0
Message-ID: <CAMKF1sq=x6caiTm_ixio56zVsg_rjLR9189vKHkQKzF7hD6HDQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215614

On Mon, Apr 28, 2025 at 4:03=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Apr 26, 2025 at 08:16:47PM -0700, Khem Raj wrote:
> > This is needed for clang to find the c++ headers when invoked via
> > bindgen
> >
> > Fixes
> > | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/me=
sa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal e=
rror: 'cassert' file not found
> > | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master=
/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroo=
t/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file no=
t found
> > |
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> This way we have two sets of bindgen/clang args: one added by
> meson.bbclass, one specific for mesa which you patch up here. Please
> pick up the attached patch instead, it makes sure that there is only one
> place to specify bindgen args for Clang and documents the reason for SDK
> packages requiring special handling.

This is breaking mesa-native recipe. Why is bindgen invocation special
for meson? we have other recipes in
e.g. meta-openembedded which pass this variable from recipes and have
finer control over
recipe types that way

>
> --
> With best wishes
> Dmitry

