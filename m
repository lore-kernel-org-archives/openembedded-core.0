Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190A7C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 23:18:37 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.31029.1749079116672516257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 16:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiXk9q66;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e5d953c0bso4939547b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 16:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749079116; x=1749683916; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zou7v98MfDzPO2q0PQbakrMd3C4fFa3ocTqTahAv+LM=;
        b=TiXk9q66AGkYlirOsqY0/EqGVTUG8wjl2L6KtKyMcW1/1w3/9j6z/r3GMgRQeJ9cN8
         ainULQUAt0e8SeHihRjq7j1SsuT2PJQSra2xX1shcql0YtHkhHPjKvh4dkgMjOvJo0L5
         AA1HtBJ2X5BKjjBVmVZEoKvYHCxv6ePnh4YcIqQcbdiGLDlGJ3KEpt2Vf4G+1uXX8mxX
         ZvWOZvG87VJy+foxRjQmLdGepCx0v/qkBlZ8rYCLLGa3WKEUuBFSOiSjjaOke4PDQ3dq
         e2cpY1NnjMnl2c4m4ukmkc7EEQo6rB0WGO3uw6GGvqtsL/jGXr53CLEaIRcdc2Klbs1U
         BAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749079116; x=1749683916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zou7v98MfDzPO2q0PQbakrMd3C4fFa3ocTqTahAv+LM=;
        b=WkrCMWpjyJQEFXlPPhakzHcETTIbl3fqQvACxDuVSVUrmBVNT9nAZ0J2OXZvyyQ2bv
         tdR/B6ldoND+SRQnwnTcXSpxXIFYKoeN2Ll5yzGlrO9iZRMI2/F0hl1zcN4HtnpCL+hJ
         DsNy1vh/bnmP8Jsau+NeCXpqDxXeRDXs+i6kaMmSeX/1/HW+nO1PIaYJB0hrNB+yB/UH
         A9sFJxhuGE+kR6NGDfz9OWYcC0OLNhefVn7FD6wNsUXUyWTnm5u7jHU8g6W1/LwlhTUn
         Wbx7/B+A0nBYogU0bu0IAPBjWTu4e+084qe0mfGXYDnDDuvBvcuYUc1K0sQFyidjLrF3
         KvUQ==
X-Gm-Message-State: AOJu0YxvlXQJqVyzXra4OpU9djLLT/n0+EF6q7LXIGyh30Z8PD3SQCLy
	1OKmNiPVSF1IOf1Njz+ihSLvH8bJhCN2KBJF0F66eEQIvgIm5Z6wk1C4xZvW6GdTseLd737cB9S
	gkRMMHY4f8c+TFEWQCKsBcYc16gdBDxU=
X-Gm-Gg: ASbGnctmImM4Whj/SPdaawhAKmo8c1EwS+4vOsv03jS7tJ1TqZBd/M4yzrUsKN56B/9
	U9Q/M9N7eNDKg1mpcfl+ku05RjO6OFrZhO8cnZq5YGH8MmsZOnfK78ng/gUGwuJCep4CaFZXWSH
	5d+8lzQexCtFZAsPPQv0Ef6jnmuc722SkQnCWDs59PQvLXI94=
X-Google-Smtp-Source: AGHT+IG3/sFq1dH86BmFGd6WAVFJHQSw/x1VawRBV6JMA5+uPqMIZgaSFitR09u6rkyOVSOhcbPG4HkfZs0beRtblck=
X-Received: by 2002:a05:690c:dc3:b0:70d:fe09:9b09 with SMTP id
 00721157ae682-710d9df19d1mr68129907b3.14.1749079115773; Wed, 04 Jun 2025
 16:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250604222857.689289-1-dmitry.baryshkov@oss.qualcomm.com> <20250604222857.689289-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250604222857.689289-2-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jun 2025 16:18:09 -0700
X-Gm-Features: AX0GCFvHG2VNiMhfcBOkg3GvZAHDfs5ddEJzo__A4t5LZVMnp31auEz9O9b6xio
Message-ID: <CAMKF1sqRzrjDXLhaMqBhve+Ua_r8NE+-uUsS1szO9zPtpO4BNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mesa-demos: drop osmesa PACKAGECONFIG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 23:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217970

Thanks for the follow up.

LGTM

On Wed, Jun 4, 2025 at 3:29=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Support for OSMesa has been removed in the latest Mesa versions, drop
> corresponding PACKAGECONFIG option from mesa-demos. Note, there is no
> need to pass -Dosmesa=3Ddisabled, meson will detect that the library is
> not available.
>
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_9.0.0.bb
> index d92f1ddc5baa..a9e84039d2c9 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> @@ -30,7 +30,6 @@ PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisable=
d,virtual/egl"
>  PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtual/l=
ibgles1"
>  PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtual/l=
ibgles2"
>  PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},,freeglu=
t"
> -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
>  PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-loader glslang-native"
>  PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,vir=
tual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
>  PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
libglu libxkbcommon libxcb"
> --
> 2.39.5
>

