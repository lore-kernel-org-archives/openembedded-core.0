Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3F0C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 07:40:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.1972.1698392425957329044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 00:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eQv5k+gu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BCF2FF81D;
	Fri, 27 Oct 2023 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698392423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eMvFV5t6zP8+0dKf1utdLXGGFsB+06ooH0+wXW1JJQ=;
	b=eQv5k+guNn+n7k0sUarAoCsFjVAuCYiLkpEwZtTxF6jipaBIlYAQpaFxUxESO8On2v9AiJ
	ABEulWyWASORG0PDnP9nUUSCEjZY9cw5uQ1b+XMyoYuqifqAKosRQqg6/5JKchZxrnKVLa
	df4FJivgFLErBWppZWlnPrdvsqWyMMoLJY33a7qFC6NwR9BrQB6H/rKccEpcxAjg2c7VXk
	OCMEokrewbaIvAFP1LaYgGWfy7GJaCycX9M2JbM9Oqs/hlsO1oKrjEEZ6bHoQ8gxtnnMpZ
	Hy13NBCUUDu+qTcuQ8pKnMaUoBReBF8YBLEzZFTxO4gPTD7ALhi6EYn76bn5Mg==
Date: Fri, 27 Oct 2023 09:40:21 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Marta Rybczynska" <rybczynska@gmail.com>,
 openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>
Subject: Re: [OE-core] [RFC][OE-core 0/7] SPDX3 Proof-of-Concept
Message-ID: <20231027094021.005d2adc@booty>
In-Reply-To: <1791E6C172CE81BE.2594@lists.openembedded.org>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
	<1791E6C172CE81BE.2594@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 07:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189740

On Fri, 27 Oct 2023 09:37:28 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hello Marta,
> 
> On Thu, 26 Oct 2023 12:48:40 +0200
> "Marta Rybczynska" <rybczynska@gmail.com> wrote:
> 
> > This patch-set adds a proof-of-concept implementation of the upcoming
> > SPDX3 standard to the SBOM generation of the Yocto Project/OpenEmbedded.
> > 
> > The current code delivers an equivalent of what is produced for SPDX2.2.
> > The standard has not been released yet, and there is some specification
> > work in progress still. Our questions and open points are available
> > in the README.SPDX3 file.
> > 
> > Also, this first RFC delivery will be followed by another one with
> > SPDX assembly and the Licensing profile.  
> 
> I ran this series on the autobuilders and it's triggering:
> 
> 2023-10-26 22:30:42,532 - oe-selftest - INFO - 2: 27/33 214/548 (53.63s) (0 failed) (spdx.SPDXCheck.test_spdx_base_files)
> 2023-10-26 22:30:42,532 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/spdx.py", line 54, in test_spdx_base_files
>     self.check_recipe_spdx("packages", "base-files.spdx.json", "base-files")
>   File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/spdx.py", line 51, in check_recipe_spdx
>     result = check_spdx_json(full_file_path)
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/spdx.py", line 44, in check_spdx_json
>     self.assertNotEqual(report["SPDXID"], None)
>                         ~~~~~~^^^^^^^^^^
> KeyError: 'SPDXID'
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5969/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5969/steps/14/logs/stdio

And also, noticed after sending the previous e-mail:

ERROR: libtool-native-2.4.7-r0 do_create_spdx: Recipe libtool-native is trying to create package libltdl which was already written by recipe libtool. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: quilt-native-0.67-r0 do_create_spdx: Recipe quilt-native is trying to create package guards which was already written by recipe quilt. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7390/steps/16/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5639/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5527/steps/12/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

