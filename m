Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107C8D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 15:47:41 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24784.1764604054275226909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 07:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZgG21IQA;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78a7af9ff1dso40456847b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 07:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764604053; x=1765208853; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbasHoDyT3aRlFGDgjuqbYrHH/Yz7Q3/9Kd+p9QStSc=;
        b=ZgG21IQA6NYcZI5CZNYjZdZnSYtjWk/zuRBAwHeLvXiZmW67X4LgPHtt88ZQczKXPa
         LDPk/yE1Ck/N8tVUBpSxhTavCUrSmhdLT1yLdLebZ54r2Ymznl3XPNfkjH72zRbWAe3B
         OPIeiQ8GvQT4St15GanDkGEHg0OBL41dCZGlK2siUUrVUmHSwunB6zM8KHxYmHC9KVl5
         NU09jUUvMjsSaEjqJgOBr4HdjONdBoL5sL0M/XaBJ4BgPblt3oKO5+m/31JMItjK+oxt
         4lHYccAqelwg8G1ugg2VM7aVRXwhl5NpfgwTyeW/7aE7gPJAadfkp9O4IvIuRlOi2/SQ
         1glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764604053; x=1765208853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbasHoDyT3aRlFGDgjuqbYrHH/Yz7Q3/9Kd+p9QStSc=;
        b=Y0m2U4TMTFwZWNyag59kbQKIlX3r0GKNFlQrqfE9ANfvEtzW8sI3ZRzP/gcwXBK8YC
         3z/wdBTGgBmg9Pnr63+xm32ltBer/0/2hQYdSHvM+SMKkBH1bstOxuUtCqLuYSd5QhXR
         lNEyTLfGwaRQtsbr5vvRRx48E5iCc4+IJ2KoG+1NzPx+r5xvd3EW8eBbeKCiB/RLFJ5+
         Wc8jDManjovfMoD4BjndEOlFy4O7QSYVMifaQBe2Mg2z8+9ALGYeIfU35vKjgRuf/soC
         yfbEdIXyJn7mxcZDg9RIPkoQlv1f29GDy7B2zAhJF1KRuQI9Q1bWHanYvujaAmaQanG3
         ULyg==
X-Gm-Message-State: AOJu0YwCXF8hFpIsRbAVJ7HV6OwTr4YkJv1dFlGOCqNvnZwN60+vfBe3
	8LFn9plVuxs+K3XmdLb5yJQHLHznlibuHriDFgETr7Zm0y9OSdHzCiUbYjN35+SoAbKVFakGQve
	9FKOGcdKOAbfdwSkczPVXd5XzCHrNC5d46mrrgJVD3g==
X-Gm-Gg: ASbGncttx7mQvZIvS//9vuv46vYkJB96CzOz4IK4xwTfq7PXodWsCOBKGJoV+PRACJ+
	J/R3yh31Qfsacyg+LxkKRbPjg1alzcVjlul7YUj+c7zqAy/G5pU1fDysf2y/JQJ1znChNTVRPm6
	m20HhZS+9q9vPRYMQpL4bBidY187ZqzSCtZwhF4r/OUqbTgIXf/nOFfPiaaZYT0CSYTotUjhmhA
	Y1IAK1LdEwEp1345PmYbSvwhGMuQ9YZq/HewrorzGuVYyNgknVugFr2vgGUM4ysPysuMcQolSW/
	JBnh3tKH3D0s6Y3WOrOZ0e6+vQ==
X-Google-Smtp-Source: AGHT+IFCLwjLOdXNILWEN6RFul1XtR5M2apEXWjiferleSv5/q2kv9lHlScjw8XGTUR5pZxtop0eKS2XA+Ynvt07Qec=
X-Received: by 2002:a53:c049:0:20b0:63f:ad6d:cbd5 with SMTP id
 956f58d0204a3-64302b0833cmr23541437d50.60.1764604053156; Mon, 01 Dec 2025
 07:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20251128065840.4104806-1-yw.byun@lge.com>
In-Reply-To: <20251128065840.4104806-1-yw.byun@lge.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 1 Dec 2025 07:47:21 -0800
X-Gm-Features: AWmQ_bmWorZZkMa9DJ_Z7eS1Qd6L4UDka2_erp3Kdj-MdVMmxzaB7EM-47usmUU
Message-ID: <CAOSpxdbRDF1g-u97-9Ndk3XOhahneZZtt+md00xDnUzaQJQ6tg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] Fix create_merged_usr_symlinks in image.bbclass
To: yw.byun@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 15:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227128

Is this also an issue in the master branch?  If so, you will need to
submit this patch for master first before I can take it for the
scarthgap branch.

Thanks!

Steve

On Thu, Nov 27, 2025 at 10:58=E2=80=AFPM Yangwoo Byun via
lists.openembedded.org <yw.byun=3Dlge.com@lists.openembedded.org> wrote:
>
> Modifying FILESYSTEM_PERMS_TABLES does not change the UID and GID of
> /usr/bin
>
> I modified create_merged_usr_symlinks and
> moved its execution order back
>
> Signed-off-by: Yangwoo Byun <yw.byun@lge.com>
> ---
>  meta/classes-recipe/image.bbclass | 50 ++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
> index 00f1d58f237..2f5210d0e0b 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -684,21 +684,51 @@ deltask do_package_write_rpm
>  # Prepare the root links to point to the /usr counterparts.
>  create_merged_usr_symlinks() {
>      root=3D"$1"
> -    install -d $root${base_bindir} $root${base_sbindir} $root${base_libd=
ir}
> -    ln -rs $root${base_bindir} $root/bin
> -    ln -rs $root${base_sbindir} $root/sbin
> -    ln -rs $root${base_libdir} $root/${baselib}
> +
> +    if [ ! -d "$root${base_bindir}" ]; then
> +        install -d "$root${base_bindir}"
> +    fi
> +
> +    if [ ! -d "$root${base_sbindir}" ]; then
> +        install -d "$root${base_sbindir}"
> +    fi
> +
> +    if [ ! -d "$root${base_libdir}" ]; then
> +        install -d "$root${base_libdir}"
> +    fi
> +
> +    if [ ! -e "$root/bin" ]; then
> +        ln -rs "$root${base_bindir}" "$root/bin"
> +    fi
> +
> +    if [ ! -e "$root/sbin" ]; then
> +        ln -rs "$root${base_sbindir}" "$root/sbin"
> +    fi
> +
> +    if [ ! -e "$root/${baselib}" ]; then
> +        ln -rs "$root${base_libdir}" "$root/${baselib}"
> +    fi
>
>      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> -       install -d $root${nonarch_base_libdir}
> -       ln -rs $root${nonarch_base_libdir} $root/lib
> +        if [ ! -d "$root${nonarch_base_libdir}" ]; then
> +            install -d "$root${nonarch_base_libdir}"
> +        fi
> +
> +        if [ ! -e "$root/lib" ]; then
> +            ln -rs "$root${nonarch_base_libdir}" "$root/lib"
> +        fi
>      fi
>
>      # create base links for multilibs
>      multi_libdirs=3D"${@d.getVar('MULTILIB_VARIANTS')}"
>      for d in $multi_libdirs; do
> -        install -d $root${exec_prefix}/$d
> -        ln -rs $root${exec_prefix}/$d $root/$d
> +        if [ ! -d "$root${exec_prefix}/$d" ]; then
> +            install -d "$root${exec_prefix}/$d"
> +        fi
> +
> +        if [ ! -e "$root/$d" ]; then
> +            ln -rs "$root${exec_prefix}/$d" "$root/$d"
> +        fi
>      done
>  }
>
> @@ -710,8 +740,8 @@ create_merged_usr_symlinks_sdk() {
>      create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
>  }
>
> -ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
> -POPULATE_SDK_PRE_TARGET_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
> +ROOTFS_POSTPROCESS_COMMAND:append =3D " ${@bb.utils.contains('DISTRO_FEA=
TURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
> +POPULATE_SDK_POST_TARGET_COMMAND:append =3D " ${@bb.utils.contains('DIST=
RO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
>
>  reproducible_final_image_task () {
>      if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" =3D "" ]; then
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226898): https://lists.openembedded.org/g/openembedde=
d-core/message/226898
> Mute This Topic: https://lists.openembedded.org/mt/116510532/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

