Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F98AC83F25
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 05:44:44 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.7366.1753249480553364418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 22:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MsUrW98D;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37493449CF;
	Wed, 23 Jul 2025 05:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753249478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plMcmJeWeonkfq0d8GBGTgyTDh3iSC9rzkChDpV9fB0=;
	b=MsUrW98DQDs14G5ToQs1c9rL2IPOCvdhSy4L7LYNd9qfUEKBp3Pzs3IQCA1wR5fUqMRXKg
	pg0OYoM8iBW7EmEK8eqSAJm9fZEUBYm1J8pmTaIelNmNwSI9frULKn7YD59/nE3nbcgzPn
	AKwbaW7mc29toduD8FuZ6ZYfWNYYVatcEgt/YtJ33LU5PH1i7yV9PLxijoKGJAuMxyEcKM
	FJqpPP4+jXA7OuQO9YAgrslq3+A9uQaxvklJ83N2hPwLRrJ6x4ZiQqAouAHFx87NFIaD1e
	VNAqz3lZ5cVd+DNV2B8M0dfS4+7zJEbFRaEWNYmwpMYEGIH8vXqYVZCEGKwjJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 07:44:36 +0200
Message-Id: <DBJ72I6DNDD2.2K9W47CYQ5ZZ7@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/3] bootimg_pcbios: support grub legacy
 bios boot
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Vincent Davis Jr" <vince@underview.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250721015141.3599063-2-vince@underview.tech>
In-Reply-To: <20250721015141.3599063-2-vince@underview.tech>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejieeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvdelfefhffekuedvtefhgfegtdfhvefggeetfefhhefgfeeflefhteduvdekffenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmeeludekvdemgeeftgehmegrgeehieemkeejkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeeludekvdemgeeftgehmegrgeehieemkeejkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehvihhntggvsehunhguvghrvhhivgifrdhtvggthhdprhgtphhtthhopehophgvnhgvmhgsv
 gguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220787

On Mon Jul 21, 2025 at 3:51 AM CEST, Vincent Davis Jr wrote:
> Due to the bootimg_biosplusefi source_params['loader']
> had to be named source_params['loader-bios'] so not
> to create conflict in the wics plugin.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---

Hi Vincent,

Thanks for your patch.

It looks like this is breaking oe-selftests:

2025-07-22 16:34:57,116 - oe-selftest - INFO - wic.Wic.test_grub_install_pc=
bios (subunit.RemotedTestCase)
2025-07-22 16:34:57,119 - oe-selftest - INFO -  ... FAIL
...
2025-07-22 16:34:57,120 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/wic.py", line 243, in test_grub_install_pcbios
    runCmd(cmd)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'wic create /tmp/tmpfwvxcjfz.wks -e core-image-mini=
mal -o /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-596788=
/wic-tmp' returned non-zero exit status 1:
...

ERROR: _exec_cmd: export PATH=3D/srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe=
-sysroot-native/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/b=
uild-st-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-na=
tive/usr/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st=
-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-native/us=
r/bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-596788/=
tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/bin/x8=
6_64-poky-linux:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-=
st-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-native/=
bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-596788/tm=
p/hosttools:$PATH;grub-mkimage         --prefix=3D/boot/grub         --form=
at=3Di386-pc         --config=3D/srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-596788/tmp/deploy/images/qemux86-64/embed.cfg         --=
directory=3DNone/grub/i386-pc         --output=3D/srv/pokybuild/yocto-worke=
r/oe-selftest-debian/build/build-st-596788/tmp/deploy/images/qemux86-64/gru=
b-bios-core.img boot linux ext2 fat serial part_msdos part_gpt         norm=
al multiboot probe biosdisk msdospart configfile search loadenv test return=
ed '1' instead of 0
output: grub-mkimage: error: cannot open `None/grub/i386-pc/moddep.lst': No=
 such file or directory.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2009
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1941

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


