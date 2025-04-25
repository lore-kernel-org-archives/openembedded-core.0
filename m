Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D299AC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:30:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.1823.1745566204021451418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 00:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XLfjkZU4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso13009475e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745566202; x=1746171002; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyG2R58QB7MTv02OzL6IHTrOWAz7GcgQyodGA4VrSRw=;
        b=XLfjkZU4/Q9+j+C6HzJayJmPXfGXl95cpOz4LxEfb6QibrpttS5j/Zjnbm1JUJ2uzE
         65NYi0milf76D72rL7HdpoifKV1nxClUD28TnzIOMF3MyHHfxl0WPtrtdce63SvexavA
         kT4loaxuIqxZWV5DKrKizErw5d3oOo/JzOYyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566202; x=1746171002;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyG2R58QB7MTv02OzL6IHTrOWAz7GcgQyodGA4VrSRw=;
        b=QumHKezq/pUd4cehwoSx0PLkKL8JbPcFwyQc2v56u2apzmKwgQHOymIvJB0zNy8J5M
         fXweDb7dD8HGNLEKKUlbFnp/cCObV/nDOyMNDe1qTe2EYSD5m8NRVpXcNYt1fczKQIQc
         z3dx/IuY2OxPi6zf4ZYJBv53+1uoCXny4xAspXaxNXhJ38QQJLEdO2eivN5t7wUi27gn
         2Kaoc6vpGmgNOQUFh/Ns12PcmaoP+QSxFC0bZOM4Lc5Ht4BuEUyELLRmEfNVoopniiWY
         FeMrSkg+v66JlKeuz9bLFhl0nknqV88F0aBx+5tlWS9+EW+qzafORwARVGa8bzcxe5Sz
         XPWg==
X-Forwarded-Encrypted: i=1; AJvYcCWlTGk5l0yAOBa58ETJ7CaUwgKiarWeDE0TFkQAN1SjZ8rkgq6d94gmQmYOcWfTaNOdZEXNQKvQgvBVbdEmf7G39A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDy47qUl5JBrTmCRZBcRWLHAQZPXtEK4MAU7TWIrEa6xDf07MY
	epT/MJC7U6SvX6UY/2s6bmfVfL0L1m9LyoNCRw6mgotdPiGAZZzN3NzW1x5Zri0=
X-Gm-Gg: ASbGncvc+C9TT6wyX3RAwQL1IXNCVVStON6BabbqEzw0tauNaMj/BlUu+yFeZnVUv5x
	T17ADIZjsmL2ny7tjXY1FhW/AvE0WXk3wC2ZQOcTKxd1k2tXKn9job3ooiW9b4fK7yQ2uv04LZm
	9Uoa8+8Vx4+eOMpxA1unYufxfOR6EVRfLKu1nkn2cM86Daox/orhYUkfsJPhAUEw97FdYGVTJkC
	IunEfCybcw1HNhSwfsiqJZ0kbvpb7pjd8KA45YJ/I/uI4FqU/awuE1EV/kp5r6CruUGCc3R1itN
	SMv5HNrQEzD4ZpZ8qLexS7oz3JGhJJnRBMtA9oxUmuUx/+yiFLX904hitO5JG9Wn+CXwgQhultO
	Kl64Jo1KrQ2jOztDtjUfU8b4VYuhm+Q==
X-Google-Smtp-Source: AGHT+IERBw4gfHcm6aW78cKnFYzEiDPHen/LsuCSJoj+diIvkMmz/1AIfL1zutbobyCfdcZC99I7XA==
X-Received: by 2002:a05:600c:34cf:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-440a64c0cebmr9354915e9.1.1745566202219;
        Fri, 25 Apr 2025 00:30:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1? ([2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm63107965e9.1.2025.04.25.00.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:30:01 -0700 (PDT)
Message-ID: <35c84ceda71ce5ab99b4d690541a62c4409bf145.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/2 v2] python3-numpy: fix ptests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2025 08:30:00 +0100
In-Reply-To: <20250424162759.3892597-3-tgamblin@baylibre.com>
References: <20250424162759.3892597-1-tgamblin@baylibre.com>
	 <20250424162759.3892597-3-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215434

On Thu, 2025-04-24 at 12:27 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
> Fix the numpy ptests by doing the following:
>=20
> - Add gcc and meson as ptest RDEPENDS in the recipe, and clean up the RDE=
PENDS
> =C2=A0 lists (sorting alphabetically) in the process;
> - Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT
> =C2=A0 to a directory inside the same path that contains the script, crea=
te
> =C2=A0 that directory, and then invoke the tests in the same manner as be=
fore
> =C2=A0 with 'python3 -c ...', before finally running 'rm -rf' on the dire=
ctory we
> =C2=A0 created (so that the space is freed up);
> - Add a patch to skip the test_big_arrays test, which uses a lot of
> =C2=A0 space;
> - Set 'IMAGE_ROOTFS_EXTRA_SPACE =3D "3048576"' for python3-numpy in
> =C2=A0 core-image-ptest.bb;
> - Also set 'QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"' in
> =C2=A0 core-image-ptest.bb;
> - Move python3-numpy from the PTESTS_PROBLEMS list to the PTESTS_SLOW
> =C2=A0 one.
>=20
> Results on qemux86-64:
>=20
> > =3D=3D=3D=3D 47301 passed, 4171 skipped, 33 xfailed, 5 xpassed in 148.6=
4s (0:02:28) =3D=3D=3D=3D
> > DURATION: 152
> > END: /usr/lib/python3-numpy/ptest
> > 2025-04-24T14:02
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 cleans up the RDEPENDS lists in the recipe (after we added gcc and mes=
on),
> and also tweaks run-ptest to remove the temporary directory after the tes=
ts are
> done to save space.
>=20
> =C2=A0.../distro/include/ptest-packagelists.inc=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0meta/recipes-core/images/core-image-ptest.bb=C2=A0 |=C2=A0 4 +++
> =C2=A0.../python/python3-numpy/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 ++++++---
> =C2=A0.../python/python3-numpy_2.2.5.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 33 +++++++++++--------
> =C2=A04 files changed, 35 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index f3fdededf66..2a27c0c5d41 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -120,6 +120,7 @@ PTESTS_SLOW =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-cffi \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-click \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-cryptography \
> +=C2=A0=C2=A0=C2=A0 python3-numpy \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-xmltodict \
> =C2=A0=C2=A0=C2=A0=C2=A0 strace \
> =C2=A0=C2=A0=C2=A0=C2=A0 tar \
> @@ -155,5 +156,4 @@ PTESTS_PROBLEMS =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 mdadm \
> =C2=A0=C2=A0=C2=A0=C2=A0 numactl \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-license-expression \
> -=C2=A0=C2=A0=C2=A0 python3-numpy \
> =C2=A0"
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-=
core/images/core-image-ptest.bb
> index a0ff8d9528e..73270d10676 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -27,11 +27,15 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-too=
ls =3D "1524288"
> =C2=A0# tar-ptest in particular needs more space
> =C2=A0IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar =3D "1524288"
> =C2=A0
> +# python3-numpy-ptest requires a lot of extra space
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy =3D "3048576"
> +
> =C2=A0# ptests need more memory than standard to avoid the OOM killer
> =C2=A0QB_MEM =3D "-m 1024"
> =C2=A0QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096"
> =C2=A0QB_MEM:virtclass-mcextend-python3 =3D "-m 2048"
> =C2=A0QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 5100"
> +QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
> =C2=A0QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
> =C2=A0
> =C2=A0TEST_SUITES =3D "ping ssh parselogs ptest"
> diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/=
recipes-devtools/python/python3-numpy/run-ptest
> index 9a1c72aeb10..10dfb1246d3 100644
> --- a/meta/recipes-devtools/python/python3-numpy/run-ptest
> +++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
> @@ -1,5 +1,12 @@
> -#!/usr/bin/env python3
> -
> -import numpy
> -numpy.test(label=3D'full', verbose=3D2)
> +#!/bin/sh
> =C2=A0
> +# By default, numpy will use /tmp as the root path for temporary files u=
sed
> +# during tests, but if this is a tmpfs it may fill up quickly and cause =
many of
> +# the tests to report "no space left on device" errors. Create a custom
> +# directory for these and point pytest at it so we can take advantage of=
 the
> +# storage provided in the rootfs.
> +TEMPROOT=3D"/usr/lib/python3-numpy/ptest/tmp"
> +export PYTEST_DEBUG_TEMPROOT=3D"$TEMPROOT"
> +mkdir -p "$TEMPROOT"
> +python3 -c "import numpy; numpy.test(label=3D'full', verbose=3D2)"
> +rm -rf "$TEMPROOT"
> diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/r=
ecipes-devtools/python/python3-numpy_2.2.5.bb
> index c6a37c0a85f..05d2b1a1f2c 100644
> --- a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
> @@ -10,6 +10,7 @@ SRCNAME =3D "numpy"
> =C2=A0SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.ta=
r.gz \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/fix_reproducibility.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-lib-tests-test_io-skip-test_big_arrays.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/run-ptest=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0SRC_URI[sha256sum] =3D "a9c0d994680cd991b1cb772e8b297340085466a6fe9=
64bc9d4e80f5e2f43c291"

The patch file is missing from the patch you've sent!

Cheers,

Richard

