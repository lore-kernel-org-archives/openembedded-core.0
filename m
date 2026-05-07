Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5125CD343B
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 14:30:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13453.1778164192323820745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 07:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3kJ6iqep;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso9584205e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778164190; x=1778768990; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qr6MFomYIVByQno/xhgd9BVp/rq/efIzTSDmpf+lx2Q=;
        b=3kJ6iqepPNfl7qYaZZgAfT4qMLN/6DfTVbtArSDrLFnNOmtJU6EP9E1uXaBI5HB1RE
         /hwFh0RFXOITkhIxtJcO9Qe3dEeinNofRwK81aESauz1jA21IlE1Nce9I2Lg85r68O9K
         SyeE5TKBbiHHynRtovzYYCrKGNEAMMBY9xXNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164190; x=1778768990;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qr6MFomYIVByQno/xhgd9BVp/rq/efIzTSDmpf+lx2Q=;
        b=CCPNcd4vuU3ZqjYdY9M4v6cYIZFnkD1i63LjaHOOkWH9aZBWlZX+fWbTygMIewCAS3
         bikrfzU79Atr85DDbwKaLIovhXI68Udek2L2PIzjZUMi7LUUWHk3WzGL7+KzRPG6dVnB
         TXblg+yHTZMKcimdVVGCaooq9wcW51MgF5A6MtM3HZjs7oG/AXXfBQrF6TnWy2Zs13td
         kvUnQFGCZscmstRwTK9sYwI9Ac0i/w+q4jjDTkDJacUqmVqALEAtfEMXyJoW87FLuENU
         aDTpdtL73cZfqMTdldg4N2t1Tb2Q1AcyH9/Uzq2WtMAXIGzokbA8Eatl39IgNItTN+H2
         bE6A==
X-Forwarded-Encrypted: i=1; AFNElJ87P1iN2x7um0IxAqea8zP/afpqwbgRi6m2fGlzQVrJJUcQPYYX30BPzM5ivxEzxv00QdwRvExnYfimhjSLtdnfCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyeB2pY2vY/oBl/lQLoZ57tEbX6teHvdrrkSaKpC0fqhXyYgRj
	809urIwA/oqXr+p6pab6DufbMmAkleFeFczLcTy+TPgRecC+I23JLmCU+6c/DWv7Af0=
X-Gm-Gg: AeBDiesQh5S2wW8/KuUoAHcuZdT/HCi68PyDC734YdtTYPCV8iFBzd3hEWf3uajsFjM
	yX/3ymLAaktH8MFsuZd9CbdB+EAnF5ZOO/b0Rp2w+x+IMuWM8gsaAGNE7qd5JgrfSRr8gVBpC/w
	bv58d0JSjxAchtlpOIXO+DIqlOTnMdPJOWVk+41FCt0YtmXTq9SkZsRFHU6rR7/31rdW27BVATh
	xSbESmFgqcmqDciLEmMyvnsTlvfEbSs6IpppO0K3stAl8b96JkVBqbL8WEjNw8FO4rEYv36EnOB
	1Ldk0AWcArKRJbRI0EZFzNXT22q3+MMFvVKIuKp3EIKUVOzQmpdpJzRRwSNxkj1SnmsMnxtNbEy
	IdllqB0344VE/sfcEPmv1q/47cj0yCm3/R9GXJMauY0IgYGv5lWd1npjP24moseley8FeK7GRVI
	4OTC8zbkP9Ga/wwzv4l1K15n9r0FGT68VVXyRkBQRvqdR4MCg1NOc9l69JT44oNuk2yrx+a2UMl
	urhtrWhpPdiZ4aVTWH5VSHkPhQQv/BaO94R
X-Received: by 2002:a05:600c:15d3:b0:488:c80c:c236 with SMTP id 5b1f17b1804b1-48e51e0977fmr77015185e9.5.1778164190398;
        Thu, 07 May 2026 07:29:50 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530c5c89sm40343595e9.13.2026.05.07.07.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:29:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 16:29:49 +0200
Message-Id: <DICILJH9LJB5.GSZ0LVSU42PG@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.tatrai.ext@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] oeqa/sdk: build libhandy instead
 of galculator
X-Mailer: aerc 0.20.0
References: <20260423181141.452976-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260423181141.452976-1-peter.tatrai.ext@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 14:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236596

On Thu Apr 23, 2026 at 8:11 PM CEST, Peter via lists.openembedded.org Tatra=
i wrote:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>
> galculator is unmaintained (last commit ~2014), its download URL is
> gone causing core-image-sato:do_testsdk to fail.
>
> Switch to building libhandy-1.8.3, a GTK+3 library from the GNOME
> stack, using Meson (same as the buildepoxy test). This still exercises
> SDK's GTK+3 cross-compilation support while using a project that is
> actively hosted and builds cleanly.
>
> Meson options disable optional features that require host tools not
> guaranteed to be present in the SDK (glade, gobject-introspection,
> vapi).
>
> The file is renamed from buildgalculator.py to gtk3.py to reflect
> that the test verifies GTK+3 SDK support, not a specific application.
>
> Backport of master commits:
> - ccf7fdc0e5 ('oeqa/sdk: rename test cases')
> - ff6fa71eb0 ('oeqa/sdk/gtk3: build libhandy instead of galculator')
> adapted for the scarthgap branch which does not have MesonTestBase
> infrastructure.
>
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>

Hello,

This kind of change is ouside of normal stable policy but I tested it
anyhow (before I noticed it was out-of-scope):
FYI, it fails on arm: https://autobuilder.yoctoproject.org/valkyrie/?#/buil=
ders/60/builds/3722

Can we just change the download URL? I guess I never saw failure because
the archive is on the yocto mirrors...

Thanks!


> ---
>  meta/lib/oeqa/sdk/cases/buildgalculator.py | 50 ---------------------
>  meta/lib/oeqa/sdk/cases/gtk3.py            | 51 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 50 deletions(-)
>  delete mode 100644 meta/lib/oeqa/sdk/cases/buildgalculator.py
>  create mode 100644 meta/lib/oeqa/sdk/cases/gtk3.py
>
> diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/s=
dk/cases/buildgalculator.py
> deleted file mode 100644
> index 28187434a1..0000000000
> --- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -#
> -# Copyright OpenEmbedded Contributors
> -#
> -# SPDX-License-Identifier: MIT
> -#
> -
> -import os
> -import subprocess
> -import tempfile
> -import unittest
> -
> -from oeqa.sdk.case import OESDKTestCase
> -from oeqa.utils.subprocesstweak import errors_have_output
> -errors_have_output()
> -
> -class GalculatorTest(OESDKTestCase):
> -    """
> -    Test that autotools and GTK+ 3 compiles correctly.
> -    """
> -    def setUp(self):
> -        libc =3D self.td.get("TCLIBC")
> -        if libc in [ 'newlib' ]:
> -            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain=
 a supported C library")
> -
> -        if not (self.tc.hasTargetPackage("gtk+3", multilib=3DTrue) or \
> -                self.tc.hasTargetPackage("libgtk-3.0", multilib=3DTrue))=
:
> -            raise unittest.SkipTest("GalculatorTest class: SDK don't sup=
port gtk+3")
> -        if not (self.tc.hasHostPackage("nativesdk-gettext-dev") or
> -                self.tc.hasHostPackage("gettext-native")):
> -            raise unittest.SkipTest("GalculatorTest class: SDK doesn't c=
ontain gettext")
> -
> -    def test_galculator(self):
> -        with tempfile.TemporaryDirectory(prefix=3D"galculator", dir=3Dse=
lf.tc.sdk_dir) as testdir:
> -            tarball =3D self.fetch(testdir, self.td["DL_DIR"], "http://g=
alculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
> -
> -            dirs =3D {}
> -            dirs["source"] =3D os.path.join(testdir, "galculator-2.1.4")
> -            dirs["build"] =3D os.path.join(testdir, "build")
> -            dirs["install"] =3D os.path.join(testdir, "install")
> -
> -            subprocess.check_output(["tar", "xf", tarball, "-C", testdir=
], stderr=3Dsubprocess.STDOUT)
> -            self.assertTrue(os.path.isdir(dirs["source"]))
> -            os.makedirs(dirs["build"])
> -
> -            self._run("cd {source} && sed -i -e '/s_preferences.*prefs;/=
d' src/main.c && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/acloc=
al -I m4".format(**dirs))
> -            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS=
".format(**dirs))
> -            self._run("cd {build} && make -j".format(**dirs))
> -            self._run("cd {build} && make install DESTDIR=3D{install}".f=
ormat(**dirs))
> -
> -            self.check_elf(os.path.join(dirs["install"], "usr", "local",=
 "bin", "galculator"))
> diff --git a/meta/lib/oeqa/sdk/cases/gtk3.py b/meta/lib/oeqa/sdk/cases/gt=
k3.py
> new file mode 100644
> index 0000000000..e32c1035ee
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/cases/gtk3.py
> @@ -0,0 +1,51 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +import subprocess
> +import tempfile
> +import unittest
> +
> +from oeqa.sdk.case import OESDKTestCase
> +from oeqa.utils.subprocesstweak import errors_have_output
> +errors_have_output()
> +
> +class GTK3Test(OESDKTestCase):
> +    """
> +    Test that GTK+ 3 compile correctly by building libhandy.
> +    """
> +    def setUp(self):
> +        libc =3D self.td.get("TCLIBC")
> +        if libc in ['newlib']:
> +            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain=
 a supported C library")
> +
> +        if not (self.tc.hasTargetPackage("gtk+3", multilib=3DTrue) or
> +                self.tc.hasTargetPackage("libgtk-3.0", multilib=3DTrue))=
:
> +            raise unittest.SkipTest("GTK3Test class: SDK doesn't support=
 gtk+3")
> +
> +        if not (self.tc.hasHostPackage("nativesdk-meson") or
> +                self.tc.hasHostPackage("meson-native")):
> +            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain=
 Meson")
> +
> +    def test_libhandy(self):
> +        with tempfile.TemporaryDirectory(prefix=3D"libhandy", dir=3Dself=
.tc.sdk_dir) as testdir:
> +            tarball =3D self.fetch(testdir, self.td["DL_DIR"], "https://=
download.gnome.org/sources/libhandy/1.8/libhandy-1.8.3.tar.xz")
> +
> +            dirs =3D {}
> +            dirs["source"] =3D os.path.join(testdir, "libhandy-1.8.3")
> +            dirs["build"] =3D os.path.join(testdir, "build")
> +            dirs["install"] =3D os.path.join(testdir, "install")
> +
> +            subprocess.check_output(["tar", "xf", tarball, "-C", testdir=
], stderr=3Dsubprocess.STDOUT)
> +            self.assertTrue(os.path.isdir(dirs["source"]))
> +            os.makedirs(dirs["build"])
> +
> +            self._run("meson --warnlevel 1 -Dglade_catalog=3Ddisabled -D=
introspection=3Ddisabled -Dvapi=3Dfalse {build} {source}".format(
> +                **dirs))
> +            self._run("ninja -C {build} -v".format(**dirs))
> +            self._run("DESTDIR=3D{install} ninja -C {build} -v install".=
format(**dirs))
> +
> +            self.check_elf(os.path.join(dirs["install"], "usr", "local",=
 "lib", "libhandy-1.so"))


--=20
Yoann Congal
Smile ECS


