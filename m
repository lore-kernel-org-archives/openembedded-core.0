Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E855C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:24:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.92067.1700749459186342814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cWuDmtOB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b34563987so5415855e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700749457; x=1701354257; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CDJCxl2HuNHrlixin8BhrlaSBs397OBx6jL9FLYLJLI=;
        b=cWuDmtOBRr/xGspyNBsMDtI9Cj5F1FEh77XLz2G/M0AwBh1sgk5ypJ1dQwSJp0IPIa
         T8IutjNzUqp0QPJ1TCJeyR65OKogl0TgaygmSIR6owPQf+CXAw4VsG6zQ+Ls2xSvd4oi
         dgFFEqMA2sbLs7s9tmIHZEMc5MBd1ploNMelE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700749457; x=1701354257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDJCxl2HuNHrlixin8BhrlaSBs397OBx6jL9FLYLJLI=;
        b=Ig7NphO9sxlmaw9oCtiAt628mGpIrkz4aG0SpA3lcMuJ6kipy5dKpZnQ+jDPwd/UXL
         JYEzxf1sR4D9sARpsqvEU9jGp0+l/CFiNvNa1iPgjWAoWcNQJfWaBDeN41rLz68i1cWS
         btaH+rke5Vm5fvVwCLaRFsPR+q+0n43zcvZ8gLd2a2CcpLETpoKgT3e4I6Ya9dpTF7cA
         7rFn7iSBfbEqqs2zvOIyyudXWqg+fmdXTCL41/9eoWaisYZOOtIUl7TJrPdqqvUjyqTa
         AC/GOesrLaXeKfK9qVYy53NOFQQiQHMTDl0BckmAt0na1f78w2WTtJYSdEPhmKKMyXvD
         ARdg==
X-Gm-Message-State: AOJu0YyggyBWqog3QH/6QTc874tgB5eZO2jUJ10IoSqU+98bHxfAH/fh
	TndW5No5rrusPubC/f5kbmP4zQ==
X-Google-Smtp-Source: AGHT+IHL29WG5P54CicJBuq/ILfAh/DfVLRe4qPa3CogDfiE4LEKljQPwFVql33JUdiatcnSWKw91Q==
X-Received: by 2002:a05:600c:4f07:b0:407:4126:f71c with SMTP id l7-20020a05600c4f0700b004074126f71cmr2508913wmq.6.1700749457549;
        Thu, 23 Nov 2023 06:24:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b0040596352951sm2904996wms.5.2023.11.23.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:24:17 -0800 (PST)
Message-ID: <947de75a33ca55a46b0a0de384446d3c7653afd5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] cmake-qemu.bbclass: support qemu for cmake
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 23 Nov 2023 14:24:16 +0000
In-Reply-To: <20231120144628.52664-2-adrian.freihofer@siemens.com>
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
	 <20231120144628.52664-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191160

On Mon, 2023-11-20 at 15:46 +0100, Adrian Freihofer wrote:
> Define the CMAKE_CROSSCOMPILING_EMULATOR variable similar to what the
> meson bbclass does. This allows for example to execute cross compilied
> unit tests on the build machine when using an SDK.
>=20
> CMAKE_CROSSCOMPILING_EMULATOR is a semi colon separated list of
> paramters which could directly handle the -L and the -E parameters.
> Creating a wrapper script is not absolutely mandatory. But anyway lets
> do it similar to what the meson.bbclass does and also disable pseudo.
>=20
> Further information can be found in the camke documentation in the
> CMAKE_CROSSCOMPILING_EMULATOR section.
>=20
> Keep the code optional, as the core does not need this function and does
> not intend to use it in the future.
>=20
> [YOCTO #15214]
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/cmake-qemu.bbclass | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/classes-recipe/cmake-qemu.bbclass
>=20
> diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe=
/cmake-qemu.bbclass
> new file mode 100644
> index 0000000000..76b748f340
> --- /dev/null
> +++ b/meta/classes-recipe/cmake-qemu.bbclass
> @@ -0,0 +1,28 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Not all platforms are supported by Qemu. Using qemu-user therefore
> +# involves a certain risk, which is also the reason why this feature
> +# is not activated by default.

"not part of the main cmake class by default"?

> +
> +inherit qemu
> +
> +CMAKE_EXEWRAPPER_ENABLED:class-native =3D "False"
> +CMAKE_EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
> +CMAKE_EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES', =
'qemu-usermode', 'True', 'False', d)}"
> +DEPENDS:append =3D "${@' qemu-native' if d.getVar('CMAKE_EXEWRAPPER_ENAB=
LED') =3D=3D 'True' else ''}"

I suspect making that a DEPENDS:append:class-target might help bitbake
with parsing things a bit.

I'm also a bit torn on CMAKE_EXEWRAPPER_ENABLED and whether we
need/want the variable or just switch on qemu-usermode. I'm guessing
you worked the code this way so you could conditionally bypass it with
different defaults.

> +
> +cmake_do_generate_toolchain_file:append:class-target() {
> +    if [ "${CMAKE_EXEWRAPPER_ENABLED}" =3D "True" ]; then
> +        # Write out a qemu wrapper that will be used as exe_wrapper so t=
hat camake
> +        # can run target helper binaries through that. This also allows =
to execute ctest.
> +        qemu_binary=3D"${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}',=
 ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
> +        echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
> +        echo "$qemu_binary \"\$@\"" >> "${WORKDIR}/cmake-qemuwrapper"
> +        chmod +x "${WORKDIR}/cmake-qemuwrapper"
> +        echo "set( CMAKE_CROSSCOMPILING_EMULATOR ${WORKDIR}/cmake-qemuwr=
apper)" \
> +          >> ${WORKDIR}/toolchain.cmake
> +    fi

Cheers,

Richard



