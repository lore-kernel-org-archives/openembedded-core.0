Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508C8EE49AB
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 07:27:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.6501.1692775662841247999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 00:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p1RjzJdP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFFCD240007;
	Wed, 23 Aug 2023 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692775661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJjm6NyaJgPw9LMyXYd/QedaHrZacwOpaBbErpSEEMo=;
	b=p1RjzJdPc973VCCSBz81ZHHo4jWv4vCeRxx9LBepe3Uyh4tV7hj+tqIIAltbSfIFkVL1H7
	G/BF5KtKGDmX3lFM79rt/t7H3ppxb4Ev3Dmdvl+3rOLjLXSQVg3EWviLc93uC7+h5XYSR7
	nMdKTN+/2ZSCTkQDuY3Fcgj6VFpXY3KorEk3NU1QAoVmL97Q7L1qTukTCFySJwbkJlf0no
	QL+4lgtKYD3RUixUHrUkJUhUIe4/6+e3PYeJ9lupe9rZeRYn+0iLNKcBOpc/ZGntU4hWvL
	NrXi+JG4zonhYypqVQTWkIbUNIM983g8ZsSANpnltnorslNg3+5kmzp9vo2aBA==
Date: Wed, 23 Aug 2023 09:27:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Trevor Gamblin" <tgamblin@baylibre.com>,
 openembedded-core@lists.openembedded.org, tim.orling@konsulko.com,
 raj.khem@gmail.com
Subject: Re: [OE-core][PATCH 0/2] Upgrading Cython to 3.0.0
Message-ID: <20230823092739.56667920@booty>
In-Reply-To: <177DF2562B5153F0.28529@lists.openembedded.org>
References: <20230821173840.1337747-1-tgamblin@baylibre.com>
	<177DF2562B5153F0.28529@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186560

On Wed, 23 Aug 2023 09:24:42 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hello Trevor,
> 
> On Mon, 21 Aug 2023 13:38:38 -0400
> "Trevor Gamblin" <tgamblin@baylibre.com> wrote:
> 
> > The Cython 3.0.0 release contains many changes. Since there are a large
> > number of recipes that depend on it, there will potentially be build
> > issues with recipes in meta-python and elsewhere. I performed a world
> > build on poky alone with the python3-cython upgrade and the only recipe
> > to fail was python3-pyyaml, so that has been tweaked to work (via two
> > new patches for the recipe; thanks to Tim Orling for the heads-up).  
> 
> This series makes python3-cython non-reproducible:
> 
> AssertionError: The following deb packages are different and not in exclusion list:
> /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/python3-cython-src_3.0.0-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/python3-cython-src_3.0.0-r0_core2-64.ipk
> The following rpm packages are different and not in exclusion list:
> /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/python3-cython-src-3.0.0-r0.core2_64.rpm
> 
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3400/steps/12/logs/stdio

And just noticed this is also introducing some warnings:

WARNING: python3-cython-3.0.0-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-cython/3.0.0-r0/Cython/Utils.c in package python3-cython-src contains reference to TMPDIR

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7657/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7657/steps/11/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

