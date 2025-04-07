Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4083AC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:18:02 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.51640.1744042678222485197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dfc6NVjM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34D4A2057D;
	Mon,  7 Apr 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744042676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYTocDtBEBCQZ7WAAemqNtbcqtqsCD0y5+uBHxn3O2Y=;
	b=dfc6NVjMbGlgTznh5LJQF1sNFGAr7ri8htyZJ1BVJMWC1qK5LcmxznSaBQ5BnonX4N9ab/
	Qze86llrsWuKIBWlN74DOHUO3zijdxUuFtX73B/Dz4jgOsU22mAxS/ckmcKpGCYwoBjUrY
	4M2nJCnGn/da1FKY8h3ju+ziPs/PwbxH11v74SmSBULX3slHL8Wspee4+tQ/f3fZJH/8NP
	tPh+MGPgFx5n6Oz0vMx4eFewXn47JkUiCvhMDZ330R0tbEBK3kgScoFgbcQpJ4xn/dXYJP
	J8jLLxphPTGTnkngnjznfndJBYGf9o5Aboxrwfz8MezjnWdG74gE1LfS2nYjDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Apr 2025 18:17:55 +0200
Message-Id: <D90JJ4KUZHJV.3MDMRO2GBKVE6@bootlin.com>
To: <tom.hochstein@oss.nxp.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 4/5] oeqa/sdk/meson: improve test to
 validate host/build target assignments
Cc: "Ross Burton" <ross.burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
 <20250406164909.270945-4-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250406164909.270945-4-tom.hochstein@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgueeltefhudegffekvdevtdfgveffjeegjeduhfduvefgveeuhfeiteejgffftdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhomhdrhhhotghhshhtvghin
 hesohhsshdrnhigphdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 16:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214460

On Sun Apr 6, 2025 at 6:49 PM CEST, Tom Hochstein via lists.openembedded.or=
g wrote:
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

Hi,

Thanks for your patch.

>  meta/lib/oeqa/sdk/cases/meson.py | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/m=
eson.py
> index 1edf78720a..f70177a033 100644
> --- a/meta/lib/oeqa/sdk/cases/meson.py
> +++ b/meta/lib/oeqa/sdk/cases/meson.py
> @@ -39,10 +39,17 @@ class MesonTest(OESDKTestCase):
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

I have the following error on the autobuilder:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/beaglebone/build/meta/lib/oeqa/sdk/case=
s/meson.py", line 45, in test_epoxy
    data =3D json.loads(self._run("meson introspect --compilers {build}".fo=
rmat(**dirs)))
NameError: name 'json' is not defined

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1348

Can you have a look at this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


