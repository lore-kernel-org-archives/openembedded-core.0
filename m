Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF969C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:35:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5483.1785501330880192122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=btvoZKRa;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d02b4c3601so10000835ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785501330; cv=none;
        d=google.com; s=arc-20260327;
        b=H21mk/RrO/ikv/q7lQYNhsv6FZRpUmuRtCUnj3kQSKPsRVWU7twcPPfiFrwNqegbZQ
         QQBsjilsy1XbQswFHJrZ+vtnBrFLnaKM3fX34z0lfqq7yaJcW0liSuCeCHdLkj+v9oHX
         cGXqZUvzC5h3bfiuudCkL/tSUiBjn5NyV13u8QGF6Nbeya+efmJs+mD1WMGv7m4rdpTN
         CSb4mo6yVB3CcXX0wVn9tGwT7+L6X6DoUCc/xvlfrSUtMg15gu1oJRsD4LirqiGCV9dP
         6N4lSHlHaQiEhAxjbs116HUbRPOnAMIZRbp3ImXKVSVMsvroEn8Bc8YFowkAEyU7eTwx
         6/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofahqd26gxq1wW+4jh2yOHKFAy/usfbQvun0NAaNjt0=;
        fh=KDBggjr8BLztnc4QKL9wpIZeKsRhbOowKcZEQS8F7CA=;
        b=AOeL13Fc3bW5i0r9BHgnv5iniEv8+OKXJo2fLbWKqzHWufY5G5eGi+8VB1hkkFNzUt
         gvCAF4F7jaVh2Hf3BupJmzMw1qmC19VJ9Lu8mhxARRLKoXu3Ralmk1buUyV8H/y6sp1g
         /yju17Q43mK2O21c8+KU0+YQbkRZo216KaFPuLuGiDfKrs/m6zhoMn0Nai3ZWp/j9AlT
         xxK7gT4fAwf3560J8loe62hcDm6NPL0IOSzuBpEYKFZ5dTYKn5piNSuu0qsOq9WWGF84
         H+DPkBsrPLPDcwshWEGeKaeRD+N6drjZlKVBy9kj7r54tKEJgIfnOmdocikvi4dNjudS
         o6fQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785501330; x=1786106130; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofahqd26gxq1wW+4jh2yOHKFAy/usfbQvun0NAaNjt0=;
        b=btvoZKRaUAtq1pm4yJ6qQv4nrnshsaXijNUBjcSFxJg2vYhMfh6drKmQF9joCYtMVC
         WexIJ2cPVwpF+aeoi9xwPQPZ5QFrolWyt3cSmTddOT5AKXP1uVS48m7UEjqflO2AiVpN
         V9qmngEQQiuatRMIumTCLP55KkGrRw9mLhLg5gvvcf3tIFOja8gN37StCjF9Uod+ZJQY
         w/BRC8vdlMa7rCF7Tnml56QU6JACiEcI+3cgTm8XNZCC5RdRaxTfD4SPXCy9T8QXdgGx
         YC6T0gOb7nsIj750bsFo4O/A5A7CicZ8vgFmqFesj4HPqg8bGpdWKUvCHu3QDBJ123lc
         AvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501330; x=1786106130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofahqd26gxq1wW+4jh2yOHKFAy/usfbQvun0NAaNjt0=;
        b=o9Vwm7oVGaMpXfrOyPz1sXDF0hRUqxPyCD37OXrWx1b746LgISCcfbphsptgG0z6ul
         1LWuTTzmmHYAm2u2Y6DbwEjbLxzrLgJnJy3fWzfA6mDVhzJOe5i3AhwkNzMQ10Tpt3Yr
         DXC5NYmLROWCio0LFPWmtAbFUmFDASA44grrQ6HJnKRB1FoMBh4O5xaosgq/syZIdL0e
         tCxuvkJSD4RwWIsVOBw6m7GR9HdTlxmBzani9fbSIMrJctnEegrDLFKu8LOgZOWnJVqH
         51/dzePM67ywQJ+8/igsTj/3pqsBDg59Kd3ps9lA7+Cw6456VVBQT0KEr6Tr3jnp202n
         DWLQ==
X-Gm-Message-State: AOJu0YxvpKn39B7DpQd8dsssFqaNhRaVuEtQofjBV4hZOrMh18Y17Yx8
	o/9LeFhh/aAE2F8zKRbosiS3TCmUYUPgDrelUYzy+hZApWPxI8r1PFEFUIKe993vjOtWEaomxdU
	h0yE1A6E9Mc0r2ftmH5FtXfHMiX3QSdk=
X-Gm-Gg: AR+sD135S0QWyimNeX6WhuKAkkkBc1wddSXmZW2EH64JZz81uruw9NCMh3PpwJeZRSN
	VGV1npjpviJX5IC5k1MjVVPurLDIibn28AGwBNXPcDeVFe4FHiH0fORNJP6E0YLKvftVU+xN9Pb
	75LsoJegRWHwLbIKnspSIKhxZZijIqlku711Eu80/B0OxPqhD60d/I+20raRx5UmlVE34wn3A8+
	Km61mqbe84Hglf68COcvv9m90lJVR1192nihiSFeh5fnm1F10vuSB23SMVRX4DhwmV9z/IItu0+
	AjIk0/r/ugFTjyYzD2UDIwo9YH/ucqlEggoTwBNnrT5290267A5/rBhwPvmCclOp2CyaTQ0GI5K
	yVfXMCZMrFFWvj5Ak1U6WzV0FIX9viT56138mYqDK2rcb5E/r8SfsG4hByZJ8OYo=
X-Received: by 2002:a05:6a21:698:b0:3b4:8880:2089 with SMTP id
 adf61e73a8af0-3c91b1f7c36mr1871268637.16.1785501330163; Fri, 31 Jul 2026
 05:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260731043628.1566-1-wangmy@fujitsu.com>
In-Reply-To: <20260731043628.1566-1-wangmy@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Jul 2026 08:35:17 -0400
X-Gm-Features: AUfX_mwtB4MeA_Wi6E5U9l9mZLTwurNjVMZSPIwL0bObd8TXJCiqNBqPSr_btoQ
Message-ID: <CADkTA4MMYVPmRU4K0fxXTofcZAzwseWZK27Mk=bSJN9XZ35A0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: Install sources required for BPF
 host tools
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242443

On Fri, Jul 31, 2026 at 12:36=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> When CONFIG_DEBUG_INFO_BTF is enabled in the kernel, building external
> modules that use BPF requires the 'resolve_btfids' host tool. This tool
> and its dependencies were not included in the kernel-devsrc package.
>
> This can cause a build failure in an SDK environment when 'make scripts'
> is run, for example:
>
>   make[4]: *** No rule to make target '.../tools/bpf/resolve_btfids/main.=
o'
>
> To fix this, unconditionally install the minimal set of source files
> required to build the 'resolve_btfids' tool and its library dependencies.
> This avoids coupling the recipe to specific kernel CONFIG symbols while
> also ensuring only necessary files are included in the package.
>
> The copy operations ignore errors to prevent build failures on older
> kernel versions where these files may not exist.

v2 is the right way to do it! Thanks for the quick turnaround

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> V1: https://lists.openembedded.org/g/openembedded-core/message/242225
> Changes in v2:
>   - Remove conditional copy based on CONFIG_DEBUG_INFO_BTF.
>   - Copy a minimal set of files instead of entire directories.
>   - Make copy operations robust against non-existent files.
>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 237dec6b12..ca1a08cba3 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -176,6 +176,18 @@ do_install() {
>              cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneld=
ir/build/
>          fi
>
> +        # For v5.2+ when BTF is enabled, scripts prepare may rebuild the
> +        # resolve_btfids host tool. Copy the minimal sources it needs in=
stead
> +        # of coupling this recipe to a specific kernel CONFIG_ symbol.
> +        cp -a --parents tools/bpf/resolve_btfids/* $kerneldir/build/ 2>/=
dev/null || :
> +        cp -a --parents tools/lib/bpf/* $kerneldir/build/ 2>/dev/null ||=
 :
> +        cp -a --parents tools/lib/subcmd/* $kerneldir/build/ 2>/dev/null=
 || :
> +        cp -a --parents tools/lib/ctype.c tools/lib/rbtree.c tools/lib/s=
tr_error_r.c \
> +            tools/lib/string.c tools/lib/zalloc.c $kerneldir/build/ 2>/d=
ev/null || :
> +        cp -a --parents tools/build/Build.include tools/build/Build tool=
s/build/fixdep.c \
> +            tools/scripts/Makefile.arch tools/scripts/Makefile.include \
> +            tools/scripts/utilities.mak $kerneldir/build/ 2>/dev/null ||=
 :
> +
>          if [ "${ARCH}" =3D "arm64" ]; then
>              # arch/arm64/include/asm/xen references arch/arm
>              cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242391): https://lists.openembedded.org/g/openembedde=
d-core/message/242391
> Mute This Topic: https://lists.openembedded.org/mt/120530366/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

