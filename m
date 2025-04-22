Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CE2C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 16:05:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.44011.1745337911205325064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 09:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CK91+En/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19C801FCEC;
	Tue, 22 Apr 2025 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745337909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2GHcPYGwz2Li0VeJtj1Z4hOE8St4BjXnhFaN4QwnyA=;
	b=CK91+En/kXjvJ0wZR28+oeRw07tqnruBMlFoIHYtU8uGHauxMUn74WVA/OEZWOGl2TE7Wd
	dHF9Et1IClPGhiwPQRRlyr2hk02e8ggivktGTE7m0TwidY4pnHF5quuduyKYr3auYFMlUI
	rXAknuSGxYJ5mS42YSivc9vMd9x+BrZX1M2zq898XWpr6nhR1C1eDgbfZF4TF5c9Q3lZ8d
	jk1EO92CyjPsjiDHW3WXjOhLuPjAgPb6kq3CRThwMMQBUwjD5qEPx3nqCaLEd9y3cC3JdB
	vtQu8Yzb/UVIrVcg/9GfR/dYX733p7Jorh5AIQiWP3UbymCh1IGfxoWrxaMhWA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 18:05:08 +0200
Message-Id: <D9DANIBXMJQM.21HMU2B4AA96R@bootlin.com>
Cc: <koen.kooi@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] autoconf: mangle PV to avoid
 version-goes-backwards
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250422131112.2392350-1-ross.burton@arm.com>
In-Reply-To: <20250422131112.2392350-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeetjefgteffjefguedtieffuedttdetjedtudelhfdtleevudefheeuieevtdevnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohdrihhopdhgnhhurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrt
 ghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehkohgvnhdrkhhoohhisehoshhsrdhquhgrlhgtohhmmhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 16:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215238

On Tue Apr 22, 2025 at 3:11 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> I previously upgrade autoconf 2.72e (the fifth release candidate) to the
> final release 2.72, but unfortunately failed to notice that the version
> appears to go backwards as the package managers sort 2.72e _after_ 2.72.
>
> We could resolve this with an epoch (via PE) but epochs are forever and
> this mistake is temporary, so set a convoluted PV to fix the sorting
> order that can be removed when the next major release is made.
>
> [1] oe-core 11ff8dba0ce ("autoconf: upgrade to final 2.72 release")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

It looks like this will be used in the fetch URL and so the fetch step
fails:

ERROR: autoconf-2.72e+really2.72-r0 do_fetch: Fetcher failure: Fetch comman=
d export PSEUDO_DISABLED=3D1; export PATH=3D"/srv/pokybuild/yocto-worker/a-=
full/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild=
/yocto-worker/a-full/build/scripts:/srv/pokybuild/yocto-worker/a-full/build=
/build/tmp/work/core2-64-poky-linux/autoconf/2.72e+really2.72/recipe-sysroo=
t-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/a-full/build=
/build/tmp/work/core2-64-poky-linux/autoconf/2.72e+really2.72/recipe-sysroo=
t/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/a-full/build/build/tmp/w=
ork/core2-64-poky-linux/autoconf/2.72e+really2.72/recipe-sysroot-native/usr=
/sbin:/srv/pokybuild/yocto-worker/a-full/build/build/tmp/work/core2-64-poky=
-linux/autoconf/2.72e+really2.72/recipe-sysroot-native/usr/bin:/srv/pokybui=
ld/yocto-worker/a-full/build/build/tmp/work/core2-64-poky-linux/autoconf/2.=
72e+really2.72/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/a-ful=
l/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72e+really2.72/recipe=
-sysroot-native/bin:/srv/pokybuild/yocto-worker/a-full/build/bitbake/bin:/s=
rv/pokybuild/yocto-worker/a-full/build/build/tmp/hosttools"; export HOME=3D=
"/srv/pokybuild"; /usr/bin/env wget --tries=3D2 --timeout=3D100 --output-do=
cument=3D/srv/autobuilder/valkyrie.yocto.io/current_sources/autoconf-2.72e+=
really2.72.tar.gz.tmp --continue --directory-prefix=3D/srv/autobuilder/valk=
yrie.yocto.io/current_sources 'https://ftp.gnu.org/gnu/autoconf/autoconf-2.=
72e+really2.72.tar.gz' --progress=3Ddot --verbose failed with exit code 8, =
see logfile for output
ERROR: autoconf-2.72e+really2.72-r0 do_fetch: Bitbake Fetcher Error: FetchE=
rror('Unable to fetch URL from any source.', 'https://ftp.gnu.org/gnu/autoc=
onf/autoconf-2.72e+really2.72.tar.gz')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1435/ste=
ps/13/logs/stdio

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


