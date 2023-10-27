Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F44C25B67
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 07:37:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.1939.1698392252471574125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 00:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NdOVOAeE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 204B41C000B;
	Fri, 27 Oct 2023 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698392250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRKfdAsEDNpv2kgxoLdcprlC6bzDTGvHIRy089b293c=;
	b=NdOVOAeE9kLhtfb/lC9wTRa4tWgsbeY0HcDdQaqiq/MZa05yzZag58C7oEswJcZpmNxkDX
	psijnBL0wsdaxph5XRVjNrThg0VHeqk+OkDRDJ84tnjWIp6qg2//Q3G1iczE/LaeBRKjx+
	NLBPJ7ToXu5KyuWw37ZIfnFlBnl1ao6QuIBBDpv+0OAAe15u+620IHR/RKuJuxbOmC/wSv
	h+mKzM1JINnQxRxwne01Nb7zKs+rOuAAF2iEkBXJwuS+HIKH5Rf/tu5rtEWv0vJfzlA7Nz
	dc8OFj+tfu7LGlCElOlkwnp6d7WLvfo+8rsn7kbi5qG+wxFLi5oLPKW9jXPQiw==
Date: Fri, 27 Oct 2023 09:37:28 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Marta Rybczynska" <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>
Subject: Re: [OE-core] [RFC][OE-core 0/7] SPDX3 Proof-of-Concept
Message-ID: <20231027093728.6b488b6e@booty>
In-Reply-To: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 07:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189739

Hello Marta,

On Thu, 26 Oct 2023 12:48:40 +0200
"Marta Rybczynska" <rybczynska@gmail.com> wrote:

> This patch-set adds a proof-of-concept implementation of the upcoming
> SPDX3 standard to the SBOM generation of the Yocto Project/OpenEmbedded.
> 
> The current code delivers an equivalent of what is produced for SPDX2.2.
> The standard has not been released yet, and there is some specification
> work in progress still. Our questions and open points are available
> in the README.SPDX3 file.
> 
> Also, this first RFC delivery will be followed by another one with
> SPDX assembly and the Licensing profile.

I ran this series on the autobuilders and it's triggering:

2023-10-26 22:30:42,532 - oe-selftest - INFO - 2: 27/33 214/548 (53.63s) (0 failed) (spdx.SPDXCheck.test_spdx_base_files)
2023-10-26 22:30:42,532 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/spdx.py", line 54, in test_spdx_base_files
    self.check_recipe_spdx("packages", "base-files.spdx.json", "base-files")
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/spdx.py", line 51, in check_recipe_spdx
    result = check_spdx_json(full_file_path)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/spdx.py", line 44, in check_spdx_json
    self.assertNotEqual(report["SPDXID"], None)
                        ~~~~~~^^^^^^^^^^
KeyError: 'SPDXID'

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5969/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5969/steps/14/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

