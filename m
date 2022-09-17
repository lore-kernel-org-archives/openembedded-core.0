Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9A2C54EE9
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 13:58:10 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.6070.1663423080942563868
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QiTuBZ4t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z6so7779965wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=ens/T9cq6OxMjZXdEvSXZUHKK8nV8V4gzoE9+50zIv4=;
        b=QiTuBZ4tteOv8iXKME8y0Fk09RCUA5tXiP9iaDjL2N0daQbpUUMGGvLIRPYqu9CFPx
         J8NWRD50C/1yt8Cw35xePFtIwfVj0EDxmpP6aCcWxzJkJbZcMrGUNWF2TTzdXPNm7nMo
         vK8cgJBc8eWGRqzeLJdmv6MXE8XAwbDOwytug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=ens/T9cq6OxMjZXdEvSXZUHKK8nV8V4gzoE9+50zIv4=;
        b=Iesq664pM2ix0m4mmgGjzxGu90Xf6/Q5TCMaQLYUU+Mcf7Zs4O61GnEjJDIzeTRJJx
         upIr2d2oxVEQbVnk0kVNJb2k9q5P5USFFY8aqEx0qzOb5cXscu7+nLtmNJc/VkZOQHnO
         s7BT/WVpU2qqcP/kdeXXji3z9MWsBBhFgpuxUH8p/4opJtQpyaCUThoS7hXeh6sKuDg6
         Gj0VjLFdpuukAYsbDw21zGkpDegxb0jcSUm8KkDHDpCHdR6NM/qEq/eq5nGodM9MT1Q2
         IeGri1vY2qn9Ep7QeRx0VKIu9R9pJUjNZGbga1NuHRC7DFm7ZLwUj7MECo6BZZfuNRjm
         W69g==
X-Gm-Message-State: ACrzQf0hYY0Gtzpg623yx0jF84CdDubvPkAXVRV04NNQxYqHmXmOvlwG
	We9Z+RsAsM1PijV7Kn7MLji5QA==
X-Google-Smtp-Source: 
 AMsMyM4QO/nJSUyy9qlcbPOX8c/dM2PjyVdKuiQRObb5EcrsGunHv+aAz+yt+/UusbjHh8weV+F0ow==
X-Received: by 2002:a5d:5289:0:b0:225:4852:4248 with SMTP id
 c9-20020a5d5289000000b0022548524248mr5476278wrv.228.1663423079174;
        Sat, 17 Sep 2022 06:57:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6?
 ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 t66-20020a1c4645000000b003a540fef440sm6092435wma.1.2022.09.17.06.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 06:57:58 -0700 (PDT)
Message-ID: 
 <19ed5421370187b39ce055f742d6134439eab87b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 1/1] mesa: fix building OpenCL programs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrey Konovalov <andrey.konovalov@linaro.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Sep 2022 14:57:56 +0100
In-Reply-To: <20220917115642.766941-2-andrey.konovalov@linaro.org>
References: <20220917115642.766941-1-andrey.konovalov@linaro.org>
	 <20220917115642.766941-2-andrey.konovalov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 13:58:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170834

On Sat, 2022-09-17 at 14:56 +0300, Andrey Konovalov wrote:
> When building an OpenCL program clover needs to locate opencl-c.h
> include file. This include file location is passed via cpp args using
> CLANG_RESOURCE_DIR macro. To set CLANG_RESOURCE_DIR value meson currently
> uses "$(llvm-config --libdir)" which results in path to sysroot included
> into CLANG_RESOURCE_DIR. Then clBuildProgram() fails with
> "fatal error: 'opencl-c.h' file not found".
>=20
> Work this around by using '/usr/lib' instead of the libdir value
> exported by LLVM.
>=20
> Microsoft/Intel CLC should suffer from the same issue, and the similar
> workaround should work in this case too.
>=20
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_RES=
OURCE_DIR-workaround.patch
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_D=
IR-workaround.patch b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RES=
OURCE_DIR-workaround.patch
> new file mode 100644
> index 0000000000..db60fe407f
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-work=
around.patch
> @@ -0,0 +1,42 @@
> +From: Andrey Konovalov <andrey.konovalov@linaro.org>
> +Date: Fri, 16 Sep 2022 16:58:20 +0000
> +Subject: [PATCH] CLANG_RESOURCE_DIR workaround
> +
> +Setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something"
> +results in clBuildProgram() error when an OpenCL program is being
> +built on the target. The reason is that $(llvm-config --libdir) output
> +includes path to the sysroot directory.
> +
> +Work this around by using '/usr/lib' instead of the libdir value
> +exported by LLVM.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> +
> +---
> +
> +--- a/src/gallium/frontends/clover/meson.build	2022-09-16 10:24:55.91057=
7158 +0000
> ++++ b/src/gallium/frontends/clover/meson.build	2022-09-16 10:28:13.11280=
4197 +0000
> +@@ -71,8 +71,7 @@ libclllvm =3D static_library(
> +     clover_opencl_cpp_args,
> +     clover_spirv_cpp_args,
> +     '-DCLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths(
> +-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'li=
bdir'), 'clang',
> +-      dep_llvm.version(), 'include',
> ++      '/usr/lib', 'clang', dep_llvm.version(), 'include',
> +     )),
> +   ],
> +   gnu_symbol_visibility : 'hidden',
> +--- a/src/compiler/clc/meson.build	2022-09-16 16:40:10.641735401 +0000
> ++++ b/src/compiler/clc/meson.build	2022-09-16 16:50:18.095700452 +0000
> +@@ -39,7 +39,9 @@ files_libclc =3D files(
> +   'clc_helpers.cpp',
> + )
> +=20
> +-_libclc_cpp_args =3D ['-DCLANG_RESOURCE_DIR=3D"@0@"'.format(clang_resou=
rce_dir)]
> ++_libclc_cpp_args =3D ['-DCLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths(
> ++                       '/usr/lib', 'clang', dep_llvm.version(), 'includ=
e'
> ++                    ))]
> + if with_microsoft_clc
> +   _libclc_cpp_args +=3D ['-DUSE_STATIC_OPENCL_C_H=3D1']
> + endif

libdir might not be /usr/lib so this isn't always going to be
correct...

Cheers,

Richard

