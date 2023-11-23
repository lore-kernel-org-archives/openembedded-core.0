Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3C5C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:25:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.92088.1700749522237653000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OXDYZv38;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso1277271e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700749520; x=1701354320; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ksIaUvvEQ4IaD+3GI/ZGBD3krV+w7Mm9tCYaJ11OjLk=;
        b=OXDYZv38xBqQZvRSk5SrbgIMlATTxf+84jCBb3FSsrL/KaV3bBijuktEVeCzSCTLuw
         QWBmV1miN4XW5s4/V5x4msKRswkiR6gMMkfMrHCFYtkTl4+nl+c2OTPaGhjdy8gCirmI
         mrPz92/lb9Z6LEFdVUnJsz5poIHMTUhtlGHfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700749520; x=1701354320;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksIaUvvEQ4IaD+3GI/ZGBD3krV+w7Mm9tCYaJ11OjLk=;
        b=bfNQO+NNo/wk7HP0MSr9mTjSsT9+A+VtSj3vTloaVkVxQRtx+3USJyBXJuc+2KhNEZ
         q77u0buJcQjX/4JOY8f/Y46HIHfDTWQIgZIwfWadHjIoW/y0OV0AndCpUTFMciiKHHfC
         i4KEEZbIQibQA/tb60srX3zrSdXQYU3IbTVWWO72cA4lrWgMFUw4ZAi7ySnTqtmHHnem
         7MNrpgECJAauhE6Z1QGpErXU+1OkHBDOY4LUph+GqXGdtVgr5wnhg4zvrQ+zMfuz300i
         7FuhqnJ0t4gzauWjRg/C+J3F+yBs79QocPIAgonWEj50BMInQtxJrmvrhFWrz+TCrP+C
         GTfw==
X-Gm-Message-State: AOJu0YzumRHYL07/tJjMybYPSNZDURCWQnDQla5uZFvtOZ1ziCIH16Yb
	/m8iq8mJge3rrpEQGCxc6U+qUA==
X-Google-Smtp-Source: AGHT+IEJsa0RtESb/S/jMfM5gEhizwfsgIvBZ75hF1gOXWhMK+iqdBQT/iFFV/5BfU0uVNwfEhRElg==
X-Received: by 2002:ac2:4562:0:b0:507:a8d1:6e56 with SMTP id k2-20020ac24562000000b00507a8d16e56mr4064814lfm.35.1700749519803;
        Thu, 23 Nov 2023 06:25:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d640c000000b00332cc7c3aaasm1811283wru.21.2023.11.23.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:25:19 -0800 (PST)
Message-ID: <79ad37f8651d36b0d9397a9220bf7cf605ff77ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 23 Nov 2023 14:25:18 +0000
In-Reply-To: <20231120144628.52664-3-adrian.freihofer@siemens.com>
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
	 <20231120144628.52664-3-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191161

On Mon, 2023-11-20 at 15:46 +0100, Adrian Freihofer wrote:
> Provide an easy way to enable cmake-qemu e.g. on distro level for all
> recipes inheriting the cmake.bbclass.
>=20
> Therefore a new variable is introduced: OECMAKE_EXEWRAPPER_QEMU.
>=20
> If set to "1" all recipes built with CMake can use qemu to execute
> cross-compiled binaries on the build machine.
> One use case is the execution of cross-compiled unit tests or ptests,
> e.g. in an SDK context. Therefore, a variable that activates Qemu for
> all CMake recipes is much more useful than just providing the optional
> cmake-qemu.bbclass.
> Further information can be found in the CMake documentation in the
> CMAKE_CROSSCOMPILING_EMULATOR section.
>=20
> There are some use cases for qemu-user, but users should not be
> encouraged to use it as an alternative for clean cross-compilation.
> Since the core does not need it either it is optional.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/cmake.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
> index d978b88944..4d8e2a206f 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -14,6 +14,10 @@ B =3D "${WORKDIR}/build"
>  # The supported options are "Unix Makefiles" or "Ninja".
>  OECMAKE_GENERATOR ?=3D "Ninja"
> =20
> +# qemu-user can be used for special use cases, but not by default
> +OECMAKE_EXEWRAPPER_QEMU ??=3D "0"
> +inherit ${@'cmake-qemu' if d.getVar('OECMAKE_EXEWRAPPER_QEMU') else ''}
> +

I don't really see why this is needed. If a recipe is using things
which need this, wouldn't they just inherit cmake-qemu?

You could make cmake-qemu inherit cmake?

Cheers,

Richard

