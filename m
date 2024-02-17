Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23241C48BC3
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 08:52:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.6701.1708159973996520497
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 00:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pb9zfJ46;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4125e946c43so598145e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708159972; x=1708764772; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4CgqIwXq8A1u3rVq0rVXuZ8IOSJULxCPNPk0BqgbI0=;
        b=Pb9zfJ46TlCzuMta+thIfneldq/OLKIu3rii3z0M38jdy3kbc/JheECGbLQlztCWHh
         4KeBusQfnKWsZC4WgxJ7hKaV2WZTg3HO169QmzuzWv5IYo0fZR09NNZ7UdsoM2J16Kss
         lp+tKDybY/2LS5AdMOpbeqn33eTuEcFn2egS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708159972; x=1708764772;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4CgqIwXq8A1u3rVq0rVXuZ8IOSJULxCPNPk0BqgbI0=;
        b=Ic2zFzwZmrFqRm/zPcI3y2ewWDWyWqA3gJW4OlkCbSU4q++BRS0ldIfiJrdB/LwInP
         3JpteblSwE4+9cTnkebRYVEdeWHkHVKwOMDDRY9FDMtCmrwCD4Fi5ieoNM0CevZGtxCp
         Y3ZufVPIJL7z/txIYIkT6/jkXhJ9A/2wGkTLxN3V0gAB63ZL9YFcB1wDRvBgq263+kV7
         WNBhrRFYXjK+WRkLwT+lghM5tjYzwpWZjurF0IUCWzyvF5nTOzZM1jFct+jqxYKTsLWV
         FtoIkyoEg4EoWmUBBQF45j9b67flXoOvRiGOhHVs27CX5dZMCB1OMPHETDkpCZfntWnI
         Z8yg==
X-Forwarded-Encrypted: i=1; AJvYcCVvhUKrFXXf7UpbhTevJIFZei3/kNcMtzP7hpubOGyuqKV0JJN0Mb2/IUpRjZMDJPXt3YY/2Pq4qcLhuQ5qerf+V4r2YbDbpI+vLOHnGqIAdirBnZkM7bHu
X-Gm-Message-State: AOJu0YzoGtqU3iu9C575PuGBU/RG1TcNV9tUEq2rOprHJilLWST3S851
	yVIgTvIX/ia8ZZBnuI4x3w5PpUIF9ehj6bfC0Emuj9ueoF/vUXOwCNbGlB2aR+8=
X-Google-Smtp-Source: AGHT+IEVaQCROCqDecq7BQMyUwHuWVds/x6faABFRm7lb5DNi/jwuDPCOt0IOPU0cfTIjc17wax98Q==
X-Received: by 2002:adf:e19e:0:b0:33d:1d7a:fc7a with SMTP id az30-20020adfe19e000000b0033d1d7afc7amr4046205wrb.16.1708159971597;
        Sat, 17 Feb 2024 00:52:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3666:ec64:7355:426b? ([2001:8b0:aba:5f3c:3666:ec64:7355:426b])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d55cd000000b0033b198efbedsm4306309wrw.15.2024.02.17.00.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 00:52:51 -0800 (PST)
Message-ID: <abcece2e903abb308dc1f09880bfc1127b308a50.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/7] lib/oe/patch: Make extractPatches() not
 extract ignored commits
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Feb 2024 08:52:50 +0000
In-Reply-To: <20240216185956.2606978-3-pkj@axis.com>
References: <20240216185956.2606978-1-pkj@axis.com>
	 <20240216185956.2606978-3-pkj@axis.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 08:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195812

On Fri, 2024-02-16 at 19:59 +0100, Peter Kjellerstedt wrote:
> If a commit is marked with "%% ignore" it means it is used by devtool to
> keep track of changes to the source code that are not the result of
> running do_patch(). These changes need to actually be ignored when
> extracting the patches as they typically make no sense as actual patches
> in a recipe.
>=20
> This also adds a new test for oe-selftest that verifies that there are
> no patches generated from ignored commits.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
[...]

> diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0=
.bb b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
> new file mode 100644
> index 0000000000..e114f465a0
> --- /dev/null
> +++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
> @@ -0,0 +1,64 @@
> +SUMMARY =3D "A New System Troubleshooting Tool Built for the Way You Wor=
k"
> +DESCRIPTION =3D "Sysdig is open source, system-level exploration: captur=
e \
> +system state and activity from a running Linux instance, then save, \
> +filter and analyze."
> +HOMEPAGE =3D "http://www.sysdig.org/"
> +LICENSE =3D "Apache-2.0 & (MIT | GPL-2.0-only)"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df8fee3d59797546cffab04f3b88b2=
d44"
> +
> +inherit cmake pkgconfig
> +
> +#OECMAKE_GENERATOR =3D "Unix Makefiles"
> +JIT ?=3D "jit"
> +JIT:mipsarchn32 =3D ""
> +JIT:mipsarchn64 =3D ""
> +JIT:riscv64 =3D ""
> +JIT:riscv32 =3D ""
> +JIT:powerpc =3D ""
> +JIT:powerpc64le =3D ""
> +JIT:powerpc64 =3D ""
> +
> +#DEPENDS +=3D "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurse=
s jsoncpp \
> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tbb =
jq openssl elfutils protobuf protobuf-native jq-native valijson"
> +RDEPENDS:${PN} =3D "bash"
> +
> +SRC_URI =3D "git://github.com/draios/sysdig.git;branch=3Ddev;protocol=3D=
https;name=3Dsysdig \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://githu=
b.com/falcosecurity/libs;protocol=3Dhttps;branch=3Dmaster;name=3Dfalco;subd=
ir=3Dgit/falcosecurity-libs \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0055=
-Add-cstdint-for-uintXX_t-types.patch;patchdir=3D./falcosecurity-libs=C2=A0=
\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0099=
-cmake-Pass-PROBE_NAME-via-CFLAGS.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> +SRCREV_sysdig =3D "4fb6288275f567f63515df0ff0a6518043ecfa9b"
> +SRCREV_falco=3D "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
> +
> +SRCREV_FORMAT =3D "sysdig_falco"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE =3D "\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DBUILD_DRIVER=3DOFF \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DMINIMAL_BUILD=3DON \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DUSE_BUNDLED_DEPS=3DOFF \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DCREATE_TEST_TARGETS=3DOFF \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DDIR_ETC=3D${sysconfdir} \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DLUA_INCLUDE_DIR=3D${STAGING_INCDIR}/luajit-2.1 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DFALCOSECURITY_LIBS_SOURCE_DIR=3D${S}/falcosecurity-lib=
s \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -DVALIJSON_INCLUDE=3D${STAGING_INCDIR}/valijson \
> +"
> +
> +#CMAKE_VERBOSE =3D "VERBOSE=3D1"
> +
> +FILES:${PN} +=3D " \
> +=C2=A0=C2=A0=C2=A0 ${DIR_ETC}/* \
> +=C2=A0=C2=A0=C2=A0 ${datadir}/zsh/* \
> +=C2=A0=C2=A0=C2=A0 ${prefix}/src/*=C2=A0 \
> +"
> +# Use getaddrinfo_a is a GNU extension in libsinsp
> +# It should be fixed in sysdig, until then disable
> +# on musl
> +# Something like this https://code.videolan.org/ePirat/vlc/-/commit/01fd=
9fe4c7f6c5558f7345f38abf0152e17853ab=C2=A0 is needed to fix it
> +COMPATIBLE_HOST:libc-musl =3D "null"
> +COMPATIBLE_HOST:mips =3D "null"
> +COMPATIBLE_HOST:riscv64 =3D "null"
> +COMPATIBLE_HOST:riscv32 =3D "null"
> +COMPATIBLE_HOST:powerpc =3D "null"
> +COMPATIBLE_HOST:powerpc64le =3D "null"


This needs an EXCLUDE_FROM_WORLD =3D "1" else we see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4386/ste=
ps/13/logs/stdio

It took me far too long to realise what was going wrong and where that reci=
pe came from :/

Cheers,

Richard


