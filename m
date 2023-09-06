Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87137EE14C0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 17:31:23 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.5104.1694021477059625584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 10:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=d4BIGXn8;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bdacc5ed66so3043a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694021476; x=1694626276; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fsi/zfGmRNcw9B+eMEkCgnuEyXnrAKiqDvIJxQK+4qM=;
        b=d4BIGXn8X8AQr3I3jwhP20dkYnFkjPbsyGISrfsTsTD4I+5U7sKpLhEJQrwzfREB0f
         iFw9yBf4HpcHFbpt4uFTu7lXVm+SCm5Fn0q74Yo0qxeyNyvgh5v5C5hJGRA9ECOrJYz/
         F68IxTKsDHF1xtymQaKpenz1QtI3ykawBBGvJVNFRGEA94Q24yExPUxlD2x9o/32RJub
         /TWePKAs+zQL7uhMF+UywzExznBJGjjfGyitFdkmEUj/Vyf5W5jRpql/AoS1ly1+IrWz
         a1N7wpQJz5veZlqLBUD2ucdgmv46DJOmczRLwOz3+QX3llDE3uUE/G16IPjFhOAcliJ3
         9dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694021476; x=1694626276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fsi/zfGmRNcw9B+eMEkCgnuEyXnrAKiqDvIJxQK+4qM=;
        b=cg+0m8S+EGQC4rpqCb0Blm762QyJoPjmmuezmY6983L/GyLjWxvtEsfjUSK3TZBuZx
         1cit2pKymz7ntcpU0tVCv5kKunrS2uwiAGvSUoXf0HadJMgtfH2F8pdDvX7dXlKoIUlV
         vjfBsYhlquOXk7izoT1ZfYtxalsLLVBfm1Ae44b4ym/S/SpPBA8jFv0+CVyADdRK9XYg
         vLZ9Qd+HzjWkoaqW3spdrbRYRtWY/+PeH+HgVObFEAfEFlfuMstsIgJT3kg2R+ssDq5L
         2ys+1c/DNnNNMM2WlknEHS/PoyX6Sm4sURoiXODKZ3e4dC5WTXsdCaLAdKKBV9tWmMOu
         qdJg==
X-Gm-Message-State: AOJu0YwhNSupU2LDrPSy19wiHPM8e/tbSb28an4E7c6gQv/o+Myl5oWG
	N7tgAhPmW+pSQyQ8zI3n/a9jE9/UcK7ABMxzb/9nJ0fC4NI=
X-Google-Smtp-Source: AGHT+IHJmjG0lyXYoskzsogiB/ZexnaLlfSo7XGqP4W8t/yy+FodDsV8uQQA47Y0hcdA1FFuXzithGWYxkydR/GmPO8=
X-Received: by 2002:a05:6830:4123:b0:6bd:62c1:65c with SMTP id
 w35-20020a056830412300b006bd62c1065cmr171725ott.18.1694021476200; Wed, 06 Sep
 2023 10:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230906151247.312252-1-ross.burton@arm.com>
In-Reply-To: <20230906151247.312252-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Sep 2023 10:30:50 -0700
Message-ID: <CAMKF1sqCfbe25rBAR97etyoYtMNMowPiB1EK3HzhVT2O15b=Kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: explicitly enable strlcpy()
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 17:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187340

On Wed, Sep 6, 2023 at 8:12=E2=80=AFAM Ross Burton <ross.burton@arm.com> wr=
ote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> We have glibc 2.38 which added strlcpy(), so enable the use of it
> explicitly in the Meson cross file for when the target doesn't support
> qemu-usermode (which will result in the default of not using it).

will this be effective for non-target variants too ? In that case we
may not have
glibc 2.38 on all distros yet.

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-gli=
bc b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
> index c4648f58c78..3049e5116ec 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
> @@ -3,3 +3,4 @@ have_c99_vsnprintf =3D true
>  have_c99_snprintf =3D true
>  have_unix98_printf =3D true
>  va_val_copy =3D true
> +have_strlcpy =3D true
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187319): https://lists.openembedded.org/g/openembedde=
d-core/message/187319
> Mute This Topic: https://lists.openembedded.org/mt/101194848/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

