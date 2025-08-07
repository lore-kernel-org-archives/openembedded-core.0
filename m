Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0CAC87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 21:32:33 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.7541.1754602350710696014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 14:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Se3R7qos;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71b76c2f903so14825927b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 14:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754602349; x=1755207149; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bk020GjglbrgxzGy6WZC/08uygDGjg5bdwhCiK9Z7v0=;
        b=Se3R7qoswaeaKEg+VzNpiMBAi1LfiAMe9DUOoi2RY9e9+4IUNDhxcH8TWILgCz4sl2
         /ufsoFPJxVXm3JaX5EUaAXtHJJeBzq4j9r14efgy4TPWbsJiUGOkJ9lQn1FfLANshKia
         JHUUFfJc4FfVWT8l6SYweW6a/FAUJb+uC3laukypnNbGfcSxKmiCTkTRLWFdgzTcLgz8
         kOORXlgjaGRf3KFPEks5o3aCDg9+t8SThcw4oF56FAAZBNtfbiYON2ZpCGt5OZj/7u7A
         QD7Okpafd1n3/i0WZyGnEFPRAILNjVDXzXov8/3SeXZ9n1kw4fAtNL1LJ1dLYgQrPzsV
         AG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754602349; x=1755207149;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bk020GjglbrgxzGy6WZC/08uygDGjg5bdwhCiK9Z7v0=;
        b=QvL/kfWjuiLtLSjFAKpI2ngoygvFJbkb4Ru0L2IPF6aOCkFOG02icaziGj/RJRVtz1
         ZKYORwsXQx3PKxCiu7J7WuJayYu0l1+iCQYaxXL8Uiib84m6+AXqMu4kGv+ETGzRE/SX
         nD5RrGh9tLkYuNsVoMxuQJmSSkaCrvp/YyKHArAkkoU1KP7VaQT1cJML+cZVBdWQGgSD
         d8oDM9FO6zDScBelzW/Hu3elRKRRwuvkoLKPqyoT1fxkCt0WqFh1/GN4944iC748dx74
         mqVdiHKLGREEaAPhSUMk6twV0ERGmOp9jGKR46ORxvO1VL0Lytlynf2sT4rejtATgtuE
         c9fA==
X-Gm-Message-State: AOJu0Ywz/lwhEwFGpo9HJO9RAxomuEwyPO0yQx889rjCTOan0jzHtcKR
	5yCToltXdGx2GyswEBsGySZP9WRHptAqstfWXM9/yWcJP6HN+DpoF6GbCAU/Yr4XjNo7MO1EI3g
	25/gbCndCJx5P6nF+/sQ9mez/Az2VCK6HuNy41PW/Hg==
X-Gm-Gg: ASbGnctYiJxeExrBDYBrAZnmoasF2erntUMwAPQHF2isR0K4bPGNraUnhJOOYfPyod6
	BfopsJRwGAMdUb0n763hrL84/WoDtLcjTbzXZmtXFjZxxWj9180ESOFEYCjkUfo/+Ss3jNT9EwT
	zGtuHMjmCqkhanHIps6/6ry16I60N5/8LTlNrLdbiYBN7+e9uO8JceK2RXzlZ4ZjP2iyuAMbg7M
	FfiFcOuQTcPs3ZeIE2ln6ots7gtFQSW1M3z
X-Google-Smtp-Source: AGHT+IFLRkzDxBY/vOAwFSYTHCHsAORgzFblZcOn5+LgUQzD3Y2eP37xkVMWCBb+i/kwv3Jadn0ljVOSWZoO++P29jY=
X-Received: by 2002:a05:690c:7487:b0:71b:d209:2d1c with SMTP id
 00721157ae682-71bf0cce56cmr7316747b3.5.1754602349404; Thu, 07 Aug 2025
 14:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250807024618.1819516-1-raj.khem@gmail.com>
In-Reply-To: <20250807024618.1819516-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Aug 2025 14:32:03 -0700
X-Gm-Features: Ac12FXxyoBmI6x6CJAwp0jd0WTuAAnp_Oz512OjLezcWjVec4uAVbDzzj4TeO4c
Message-ID: <CAMKF1srWMnzjMtR8efDKMuM8FXRjNBOqj0-wEMa5ue55nyAXRw@mail.gmail.com>
Subject: Re: [PATCH] systemd: Disable linker GCS warning on aarch64 when using compiler-rt
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 21:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221587

I have sent a fix which is a backport from llvm upstream to fix compiler-rt

https://lore.kernel.org/openembedded-core/20250807212937.2927262-1-raj.khem=
@gmail.com/T/#u

Please use that patch, this means that this patch is no longer needed. So p=
lease
drop it from staging branches

On Wed, Aug 6, 2025 at 7:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> when Distros set TC_RUNTIME_CXX =3D 'llvm', it will use LLVM provided
> runtime libraries for unwinding/Compiler-builtins and C++ runtime
> ( compiler-rt/libunwind/libc++ ), systemd -> libc++ -> compiler-rt,
> assembly routines in compiler-rt are not GCS compliant so the link step
> for libc++.so does not emit this into .note.gnu.property section
>
> Displaying notes found in: .note.gnu.property
> Owner                Data size        Description
> GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
> Properties: AArch64 feature: BTI, PAC
>
> it should have been
>
> Properties: AArch64 feature: BTI, PAC, GCS
>
> if it has GCS support.
>
> When libsystemd links the C++ standard library then it also does not
> get the GCS flags and it gets reported when some tests in systemd
> tries to link with libsystemd. The reason for warning-as-error is same
> as [1]
>
> [1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-co=
re/systemd?id=3D295e30eac69e152778246c7271b72f7e8498a40a
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_257.6.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-co=
re/systemd/systemd_257.6.bb
> index adc27f6cff1..b487683f5f8 100644
> --- a/meta/recipes-core/systemd/systemd_257.6.bb
> +++ b/meta/recipes-core/systemd/systemd_257.6.bb
> @@ -240,6 +240,10 @@ RESOLV_CONF ??=3D ""
>  # the eBPFs, so that it can find needed system includes in there.
>  CFLAGS:append =3D " --sysroot=3D${STAGING_DIR_TARGET}"
>  LDFLAGS:append:aarch64 =3D " ${@bb.utils.contains('PACKAGECONFIG', 'open=
ssl', '-Wl,-z,gcs-report-dynamic=3Dnone', '', d)}"
> +# compiler-rt assembly routines do not yet support GCS
> +# see - https://github.com/llvm/llvm-project/issues/152427
> +# check again when this gets implemented in compiler-rt to remove it
> +LDFLAGS:append:aarch64 =3D "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm=
', ' -Wl,-z,gcs-report-dynamic=3Dnone', '', d)}"
>
>  EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dnobody-group=3Dnogroup \

