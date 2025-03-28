Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B74CC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:35:55 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.7366.1743154550764256895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WyEwiC8i;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so16285306d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743154550; x=1743759350; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=enUMB3yQxRfqKnnOD81bOUDZPZbxUNZolqth/hKTzaU=;
        b=WyEwiC8ikTgqI3fAYIDIhBaY2NiYvCOKe7juuRfcm5LDauNR6IAk4nLrIcRofC4OAO
         KBRroUvvN44XT7l3EJQcdKOuqsNkrDjicjklTcrPusPuoSit1+MLqzxlqiqMkjGi1sfZ
         p1kdpaI0F5UDjLe/rncr6NbxWwSV/cNSFj4d5vu265YWmvttETfuKRgkJuRT6pUSbeQM
         QN2PuVmw1T5lLnEO1ljTfId1VVb+YgcN5lPcL6RcUH4KfvMbHPctPEJqwrrz8SK7kdob
         dCb4dyDUrX2x50RZINL5uqqSmE+1+qi5fqbahKRD1KqCSMA6YayMLV5bbSCfz4hXuYes
         1h/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154550; x=1743759350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enUMB3yQxRfqKnnOD81bOUDZPZbxUNZolqth/hKTzaU=;
        b=DEqn995JZ1Ff0UguxftRRTmR2BOFSHF51TyFDwF4p/Vo2+/UzZpGXCM7gtfkNnb4JF
         azaLJ1lAFADjtNBqi++I1GgWhZCmQowdrsC2LxFWSVYYeV7m0ovdEbu7GAs3gBfqpsc8
         51uTz1uo2cug9+MsM8WeSx83ywkQ6VCaUXaCIz5xUi5hsaGIi8URTIO8ZOnhWDAVJwYa
         HlWKjBpmPHyDxgAzfuBXDHm+3ddwVUjHXen9P4/QK7ZMIQ3/LU8OhEUmy8AiibJTO0WF
         AsNvEie3he/OsOhLtGdW5D/Plhi8UWI8Foq5pJ0opRHNmqjGHviNYKyTq0fwj2CW6oDg
         r0og==
X-Gm-Message-State: AOJu0YycJKGLrxqLAh3nNt+beyrbAVfzf3eNi6Mrz2F083OaYwbEAFHG
	6M8XZBUil/ijTkD6XkUAFsC6YdBdyZ98d5yZgu9sjunXnpFz+zeAzdbZLISND6/1bsQIiirDnvm
	zeUbFyHllWUTu/PTdkWO7WABd30I=
X-Gm-Gg: ASbGncsKLFMep6PFsy3D1VMJLt2MBc//7yii8NLmxOqU73otPrKTwfjc3tByv6uPZlB
	5b1smC8XlmQgM+jyHZhZeWAkckzj+X8yzbZLbQpQoFjQf7tnSiEmEt7EVJIj7CPPLQ02jmUip7l
	GBnWnFXsQbtHLByxWj/IcSAPw2E7oIoV/c+lXzgdT9dX9VZuHD2MWXngt+bbxV
X-Google-Smtp-Source: AGHT+IGdOB06nF2cfK3DtpYKrFDZN1EbdlvwJrEdB9grr2eVmE7fnhGUet2v5QMYGLPeCNIG0zx/OpHsk/SfvJZEX/Q=
X-Received: by 2002:a05:6214:5284:b0:6e8:9021:9095 with SMTP id
 6a1803df08f44-6ed2392fd2dmr96904306d6.32.1743154549589; Fri, 28 Mar 2025
 02:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com> <20250327221807.2551544-4-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327221807.2551544-4-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 10:35:37 +0100
X-Gm-Features: AQ5f1JpCijIYr7benN720cCLS-rEVsHZljiHXwD8kUQ6EKkeTfkkMgSe24j4BZs
Message-ID: <CANNYZj-hV3C1L6QYJhk0kq_Bj8PkjsWmjnyi16FbSqW1sRP70g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/7] llvm: support building libclc
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213818

On Thu, 27 Mar 2025 at 23:18, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +Fix variables being passed to cmake when generating NATIVE build dir.
> +
> +Upstream-Status: Inappropriate [OE-Specific build-system fix]

Please write a better, detailed explanation of what the patch does.
Why do we need it in the first place?

> -LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
> +LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"

Why this addition? Needs to be explained in commit message.

> +LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
> +

Same.

> +                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
> +                  -DLLVM_NATIVE_TRIPLE='${BUILD_SYS}' \
> +                  -DLLVM_NATIVE_C_COMPILER=\'${@ d.getVar('BUILD_CC').replace('ccache', '').strip()}\' \
> +                  -DLLVM_NATIVE_CXX_COMPILER=\'${@ d.getVar('BUILD_CXX').replace('ccache', '').strip()}\' \
> +                  -DLLVM_NATIVE_C_FLAGS='${BUILD_CFLAGS}' \
> +                  -DLLVM_NATIVE_CXX_FLAGS='${BUILD_CXXFLAGS}' \
> +                  -DLLVM_NATIVE_LD_FLAGS='${BUILD_LDFLAGS}' \

Same.

>  EXTRA_OECMAKE:append:class-target = "\
> @@ -89,6 +101,8 @@ EXTRA_OECMAKE:append:class-target = "\
>                    -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
>                    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
>                    -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> +                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> +                  -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \

Same.

>  EXTRA_OECMAKE:append:class-nativesdk = "\
> @@ -96,6 +110,8 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
>                    -DLLVM_HOST_TRIPLE=${SDK_SYS} \
>                    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
>                    -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> +                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> +                  -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \

Same.

>  # patch out build host paths for reproducibility
> @@ -124,11 +140,26 @@ do_install() {
>
>          # Remove opt-viewer: https://llvm.org/docs/Remarks.html
>          rm -rf ${D}${datadir}/opt-viewer
> -        rmdir ${D}${datadir}
> +        rmdir ${D}${datadir} || true

Same.

> +    # Remove clang bits from target packages, we are not providing it for the system
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
> +       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
> +        rm -f  ${D}${bindir}/clang*
> +        rm -fr ${D}${libdir}/clang
> +        rm -fr ${D}${datadir}/clang
> +
> +        rm -f  ${D}${bindir}/scan*
> +        rm -fr ${D}${libdir}/libscanbuild
> +        rm -fr ${D}${datadir}/scan-build
> +        rm -fr ${D}${datadir}/scan-view
> +
> +        rm -fr ${D}${libdir}/libear
> +    fi

Why does this need to be done, if we're only adding libclc? Is it
dependent on those bits being built?

> +PROVIDES = "libclc"
> +RPROVIDES:${PN}-clc += "libclc"

Why these additions?

Alex

