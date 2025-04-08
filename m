Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756E3C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 13:37:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.74933.1744119437121444348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 06:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YXcI7D+c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77DAC2057D;
	Tue,  8 Apr 2025 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744119435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArWFfg9ZJWsKR1CpwtPrRgDhylrtKw7bFc01NQzbKoE=;
	b=YXcI7D+cevTow/OWBaS7YPJeD8PIqqF1lPg+ec8ESHiKk+Wi97WnMu4dtiFdLsLF3IxXu2
	HSDKs4Ao0HeI5KXVzhu248eb2pUPXgWHl49hPATmXC0JYmQ3nakGXdcCbGJAScHtt9kkjQ
	posA/u+CrEMF+A85LQjBmK6Tg69kgl5GAJQHfjBsOO4mMHOMbRY1ueloxskjzfUV77tXie
	Ba7fGuisD8QwQR2kme8Vq6E/hUYwPf1/v9gU6lGDezyW0EmOmXnbfHw/HSobMCindv4mgn
	ofZrbYANeaS1ujphxHdgin+XmDdX5PD4tT0fjXnRY6sBIQSuek0Xaiw7V8zd3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 15:37:15 +0200
Message-Id: <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
To: <tom.hochstein@oss.nxp.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to
 validate host/build target assignments
Cc: "Ross Burton" <ross.burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgueeltefhudegffekvdevtdfgveffjeegjeduhfduvefgveeuhfeiteejgffftdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegsvgejudemkeeftdgumehfkegvvgemfeegugdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegsvgejudemkeeftdgumehfkegvvgemfeegugdupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhomhdrhhhotghhshhtvghin
 hesohhsshdrnhigphdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214538

On Mon Apr 7, 2025 at 11:18 PM CEST, Tom Hochstein via lists.openembedded.o=
rg wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> Use 'meson introspect' to dump JSON describing the build configuration
> and validate that the build and host architectures are correctly set in
> the meson.cross file.
>
> Also instead of calling ninja directly, call the relevant meson commands.
>
> Fixes: [YOCTO #15485]
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
>  meta/lib/oeqa/sdk/cases/meson.py | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/m=
eson.py
> index 1edf78720a..407b94d242 100644
> --- a/meta/lib/oeqa/sdk/cases/meson.py
> +++ b/meta/lib/oeqa/sdk/cases/meson.py
> @@ -4,6 +4,7 @@
>  # SPDX-License-Identifier: MIT
>  #
> =20
> +import json
>  import os
>  import subprocess
>  import tempfile
> @@ -39,10 +40,17 @@ class MesonTest(OESDKTestCase):
>              self.assertTrue(os.path.isdir(dirs["source"]))
>              os.makedirs(dirs["build"])
> =20
> -            log =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno=
 -Dx11=3Dfalse {build} {source}".format(**dirs))
> -            # Check that Meson thinks we're doing a cross build and not =
a native
> -            self.assertIn("Build type: cross build", log)
> -            self._run("ninja -C {build} -v".format(**dirs))
> -            self._run("DESTDIR=3D{install} ninja -C {build} -v install".=
format(**dirs))
> +            log =3D self._run("meson setup --warnlevel 1 -Degl=3Dno -Dgl=
x=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))
> +
> +            # Check that the host (gcc) and build (cross-gcc) compilers =
are different
> +            data =3D json.loads(self._run("meson introspect --compilers =
{build}".format(**dirs)))
> +            self.assertNotEqual(data["build"]["c"]["exelist"], data["hos=
t"]["c"]["exelist"])
> +            # Check that the system architectures were set correctly
> +            data =3D json.loads(self._run("meson introspect --machines {=
build}".format(**dirs)))
> +            self.assertEqual(data["build"]["cpu"], self.td["SDK_ARCH"])
> +            self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
> +
> +            self._run("meson compile -C {build} -v".format(**dirs))
> +            self._run("meson install -C {build} --destdir {install}".for=
mat(**dirs))
> =20
>              self.check_elf(os.path.join(dirs["install"], "usr", "local",=
 "lib", "libepoxy.so"))

Hi,

Thanks for the new version, but we have a new error now:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/m=
eson.py", line 47, in test_epoxy
    self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["e=
xelist"])
                        ~~~~~~~~~~~~~^^^^^
KeyError: 'c'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/1330

Can you have a look at this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


