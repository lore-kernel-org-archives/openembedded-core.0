Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C2EC61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 15:59:45 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.37574.1678118384825097174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 07:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=e1APFCPP;
 spf=pass (domain: ossystems.com.br, ip: 209.85.167.174, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oi1-f174.google.com with SMTP id q15so7378663oiw.11
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112; t=1678118383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxZ9akIGiNm7X/c3MqeoZEvMeYeuHUb0CcL+zOi73+8=;
        b=e1APFCPPMs9SI+m2zZT3mXuka6tlW+c7FpMNO4lJXIezh+EMpq7x6SlsZT8KI2FCaj
         xBA2j1xRb7qW9d4VfxyLuAE6oLEMm2zkBUZdehwbgQZmaM3LnB0W/6ufiRW3QXUFju7c
         T77qDZw2E1EjMIeUkVc8r+kcUNobxOu33NSQe9I9JAilatQsXw1IChKeNCS0hZdbnC+0
         43xjCvIsgflbrbMVWiZGLTRuslwD6Q4fYxRO0fxpD55QtjckMenZWkJ4knJt8UJU4U5h
         WDxPQ/Fv3fiPxQL/BpFBlsIVss7gmozHCPYuZ5Ppl62TnUPF+1KYooEmk5zIh6aTnYcW
         9sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dxZ9akIGiNm7X/c3MqeoZEvMeYeuHUb0CcL+zOi73+8=;
        b=TVblG1vRu9D4YU9rVYnxy6AAaUhLN+NdK/IR/DoPqQ3JCxTtbStrprwqx17q6DJDAp
         iA4STUau4LiYvwczzgDxBK+7rROKWw5Hmm6JiQwEe1LTFFm2YeMergYiPHNKxr6KVExA
         csaUlnSO1J3yh0j0f63j+NJPedHWeEEczVFl1YmR36o6Q0musVbdM3+1iq085+sG78Vc
         udiMa5KYDvmsDZEGmM2W7ZvLpnKzrfeAVive9zQ2F+y269rTLn0NR/fUrz6Jy5Sf+FCG
         M3Hi4IUB4scWcZTa3cbxMThLyAwaXClQ8A5tPG1PANx8Z464t2XcYGI7NihKqE7uVCZX
         SRcQ==
X-Gm-Message-State: AO0yUKUzfwVFCo6s/sTRWZdSFMqR00hitopTeaUKqGyklbE/TXxPOoaw
	JxNZeFn/QhQDQ/cgBJnrWghyvkx5neG6r6C3SLl5+A==
X-Google-Smtp-Source: AK7set+uXHUjudVnNrQVTu9xdqSheAL2LdePqAJ5lwuzr9SBahvO7Bo+ndHB0AEfFq8HCYs8JEF5xA==
X-Received: by 2002:a54:4613:0:b0:383:ee1d:f489 with SMTP id p19-20020a544613000000b00383ee1df489mr4490974oip.0.1678118383472;
        Mon, 06 Mar 2023 07:59:43 -0800 (PST)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id r36-20020a056808212400b00383d9700294sm3995742oiw.40.2023.03.06.07.59.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 07:59:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-176b48a9a05so4417185fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:59:43 -0800 (PST)
X-Received: by 2002:a05:6870:d899:b0:176:2299:dce3 with SMTP id
 dv25-20020a056870d89900b001762299dce3mr3823711oab.10.1678118382745; Mon, 06
 Mar 2023 07:59:42 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <20230306091108.3347363-4-zboszor@gmail.com>
In-Reply-To: <20230306091108.3347363-4-zboszor@gmail.com>
Date: Mon, 6 Mar 2023 12:59:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpcJOkVvrT2K9xPgEcsRq70f-NjNBtGtD3y-B5VS83GBQ@mail.gmail.com>
Message-ID: <CAP9ODKpcJOkVvrT2K9xPgEcsRq70f-NjNBtGtD3y-B5VS83GBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 15:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178079

Em seg., 6 de mar. de 2023 =C3=A0s 06:11, Zoltan Boszormenyi
<zboszor@gmail.com> escreveu:
>
> In the anonymous python function that creates packages based
> on PACKAGECONFIG, use a single synthetic "opencl" setting
> that is added when either "clover" or "rusticl" are present.
>
> Without this, creating variables for two "libopencl-mesa" will
> confuse the packaging code, resulting in subsequent packages
> (like mesa-megadriver and others) being renamed incorrectly.
>
> This also makes sense from a packaging standpoint: currently
> both clover and rusticl can be enabled, in which case both CL
> frontends should go into the same libopencl-mesa subpackage.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>

Please name the PACKAGECONFIG as opencl-rusticl

>  inherit meson pkgconfig python3native gettext features_check
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d)}

Here.

>  BBCLASSEXTEND =3D "native nativesdk"
>
> @@ -136,6 +137,9 @@ PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisa=
bled"
>  OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-=
Dopencl-native=3Dtrue', '', d)}"
>  PACKAGECONFIG[clover] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc =
spirv-tools"
>
> +# "rusticl" requires libclc, spirv-llvm-translator and bindgen-cli-nativ=
e from meta-clang and spirv-tools from OE-Core
> +PACKAGECONFIG[rusticl] =3D "-Dgallium-rusticl=3Dtrue -Drust_std=3D2021,-=
Dgallium-rusticl=3Dfalse,bindgen-cli-native libclc spirv-tools spirv-llvm-t=
ranslator,libclc spirv-tools spirv-llvm-translator"

Here.

>  RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'clo=
ver', 'libclc spirv-tools', '', d)}"
> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'rus=
ticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"

Here.

>
>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libosmesa libosmesa-dev \
> @@ -250,6 +255,11 @@ do_install:append () {
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
>  python __anonymous() {
>      pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
> +    # Add the synthetic "opencl" string to pkgconfig because
> +    # both "clover" and "rusticl" would create libopencl-mesa.
> +    # Both CL frontends should go into the same package.
> +    if "clover" in pkgconfig or "rusticl" in pkgconfig:
> +        pkgconfig.append("opencl")

Here.

Also, we need to add RREPLACES, RRECOMMENDS and RCONFLICTS to old
clover package so we support package feed upgrades.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

