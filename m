Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140BFC61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 20:50:59 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.4553.1700599851914681654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 12:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d8elHsPd;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6d7e8da5e99so368486a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 12:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700599851; x=1701204651; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kC04D/KbQyMa2JVBZCql/KMVLtVkJPegKdN416xqO38=;
        b=d8elHsPd5SmoozcD/I7V1a/z84PsCRsaoUy8/Jc9VnEZjL+h6tHmBCX+x3teXJgu3J
         WP97JiR7+jm8Od7rtdl2ykva173ba1LRS7FsbrfNrw+sPE0k6nyAGf9EWzhDcrieQyOy
         5gc83Jp97Uz7K2+9+C84k3mA5RL9v8j6k6PH9+aQ0BpwXS6NauASsd988PaDjG+JFbAu
         ZrmWCJQlZLnoSTmF++ruWQR9C44gmY3oUdfZ2yre/7qJcU1ooDTl7OgmqTLio9MDFPpE
         MsxQ1h+YY70Nzr3NC68c2fLgv++mu/ru310gfW9Pf+U/z1uXpLsFSdTQhZ9RhhvSVYRw
         rMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599851; x=1701204651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kC04D/KbQyMa2JVBZCql/KMVLtVkJPegKdN416xqO38=;
        b=JEJXdnISGoldyZDg6uv9jAL09spW6Zsyi+lgwYdZylFnE4qK6IFjQ3Roge5d2cc5zb
         dljrbuio0zZrNixVo1R44Yjv3IBBCXX1i/VFbBJNcS+6xPsJwDhKrYP++seoJARdWkFp
         YEiuNFqV+e+h/XGaRtoRQN9Xx3l6UpJK8s6sM1mQ65DR2Vxb31N4ICXWvk2iQKQICrv+
         Av9q+Obe9VCwYIW8BzRtWJYJceRLkbhXZdNHdmJ6GSfP47Z5wuo3nq9QVoumsssAbZOd
         7g/HnsSsOoQMi3DCiSsLBKYo5zuM85ynXd7mEqy/3eLHMvjK/mCnNs3XZeo3OdldBGM5
         v4zw==
X-Gm-Message-State: AOJu0YxIf3E/AfQpkZ6rMnfe9pPbUqoZZxx3fcaYGR1rn46hZPcIUxen
	apjLtrPknuCweSArQ7HxlxkaHdei94c0bTo5wZkHP2scOfE=
X-Google-Smtp-Source: AGHT+IF9z0hnJ5yAO9P76tveFcJ6Asl6xcT+ohAUlolcGkr/1XvY+fI1awYdOirj9hJiq6QKSzLStdAPjan9OtKxalE=
X-Received: by 2002:a05:687c:218d:b0:1e9:b879:a8e0 with SMTP id
 yl13-20020a05687c218d00b001e9b879a8e0mr477134oab.16.1700599851076; Tue, 21
 Nov 2023 12:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20231121140607.2660791-1-ross.burton@arm.com>
In-Reply-To: <20231121140607.2660791-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Nov 2023 12:50:24 -0800
Message-ID: <CAMKF1srcV_3WoHoWZrsFHyVHLFs0uBR5uiMqEO9fjr+_4DbwDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-llvm: remove python3native dependency
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 20:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190990

On Tue, Nov 21, 2023 at 6:06=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> LLVM doesn't actually need a native Python3 as the host Python is
> sufficient, but as it then looks at the host for optional Python
> dependencies explicitly disable their detection so that rust-llvm
> remains deterministic.  As this is a minimal LLVM for Rust, we don't
> need the optviewer tool.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/rust/rust-llvm_1.70.0.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.70.0.bb
> index 09e4c65be38..57bbe79cdf1 100644
> --- a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
> +++ b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
> @@ -16,7 +16,7 @@ S =3D "${RUSTSRC}/src/llvm-project/llvm"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
>
> -inherit cmake python3native
> +inherit cmake
>
>  DEPENDS +=3D "ninja-native rust-llvm-native"
>
> @@ -47,6 +47,15 @@ EXTRA_OECMAKE =3D " \
>      -DLLVM_TARGET_ARCH=3D${TARGET_ARCH} \
>      -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
>  "
> +
> +# Forcibly disable the detection of these packages as otherwise
> +# it will look at the host Python install
> +EXTRA_OECMAKE +=3D "\
> +    -DPY_PYGMENTS_FOUND=3DOFF \
> +    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
> +    -DPY_YAML_FOUND=3DOFF \

is this a full list. or the one that was detected on your build host
installation?

> +"
> +
>  EXTRA_OECMAKE:append:class-target =3D "\
>      -DLLVM_BUILD_TOOLS=3DOFF \
>      -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190982): https://lists.openembedded.org/g/openembedde=
d-core/message/190982
> Mute This Topic: https://lists.openembedded.org/mt/102728697/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

