Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DCAC5ACB3
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 13:48:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8335.1700315328727829756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Nov 2023 05:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AxGryBdC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 747401BF205;
	Sat, 18 Nov 2023 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700315326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U6d+UsjpJ5p89JdblHtUjmgOTKyLG1jWdhPG74YqDvc=;
	b=AxGryBdCpPE35rIE7C78PFRJ63Cewy/o4DaNPmQZIgMzHYkS3D3GgmggGqtoWMON+2m0Zd
	pcLZJ+JgW/TuCUELJYvf3w2a5QmqeSn3N+b8laC7w65v7bQR62I1PqIlyWardzEB1ZTRxF
	AZ/AnuKT8Bm1JoxQZSWWD0h086aebax2hQiNhuNdOZvjcY5bfqHKKTPz3PPG6lpMpLWSqC
	HS/4OrWst0t4ivwApUy5tYRkC63wh/IvwkAbyo5a+4oYfJSVcRdbNk9mf9V+kd0fu0TduQ
	yjYcPbT38TFGGEPfUfhNDlUiLb1rTZ3ruDc1UKmL1eCIfiGcaScsdP3/GUVIPw==
Date: Sat, 18 Nov 2023 14:48:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7] Devtool/Recipetool: adding pypi support
Message-ID: <20231118134846425229b1@mail.local>
References: <20231117111218.3344066-1-jstephan@baylibre.com>
 <1798AFE6117EC794.26894@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1798AFE6117EC794.26894@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Nov 2023 13:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190863

On 18/11/2023 11:10:58+0100, Alexandre Belloni via lists.openembedded.org wrote:
> Hello,
> 
> The tests seem to be failing on the AB:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6065/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6062/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6013/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6078/steps/14/logs/stdio

Actually this seems to have been caused by something else.

> 
> On 17/11/2023 12:12:11+0100, Julien Stephan wrote:
> > Hello all,
> > 
> > This series adds basic support for the pypi class in devtool/recipetool.
> > 
> > The idea is to be able to detect that a package is available on pypi and
> > in that case inherits from pypi class. This helps to produce cleaner
> > recipes for pypi packages.
> > 
> > To do this, I am adding a new optional callback "process_url" that
> > plugin can register to implement some logic on matching url.
> > 
> > By implementing this callback in create_buildsys_python we can match on
> > pypi URLs directly or on release tarballs hosted on "files.pythonhosted.org".
> > 
> > To create a recipe taking advantage of the pypi class we can use one of the
> > following new syntax:
> > 
> > * recipetool create https://pypi.org/project/<package>
> > * recipetool create https://pypi.org/project/<package>/<version>
> > * recipetool create https://pypi.org/project/<package> --version <version>
> > 
> > or the old syntax:
> > 
> > * recipetool create https://files.pythonhosted.org/packages/<...>
> > 
> > If the URL points to a github URL or a release tarball not coming from
> > "files.pythonhosted.org", the created recipe is the same as before.
> > One can also use the newly added "--no-pypi" switch to NOT inherit 
> > from pypi class on matching URL, to keep legacy behaviour.
> > 
> > This series also contains some bug fixes I found during my testing.
> > 
> > Pushed my dev branch here: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/devtool-add-pypi-support 
> > 
> > Cheers
> > Julien
> > 
> > Julien Stephan (7):
> >   bitbake: utils: remove spaces on empty lines
> >   recipetool: create_buildsys_python.py: initialize metadata
> >   recipetool: create: add trailing newlines
> >   recipetool: create: add new optional process_url callback for plugins
> >   recipetool: create_buildsys_python: add pypi support
> >   oeqa/selftest/recipetool: remove spaces on empty lines
> >   oeqa/selftest/recipetool/devtool: add test for pypi class
> > 
> >  bitbake/lib/bb/utils.py                       |  16 +--
> >  meta/lib/oeqa/selftest/cases/devtool.py       |   4 +-
> >  meta/lib/oeqa/selftest/cases/recipetool.py    | 114 +++++++++++++-----
> >  scripts/lib/devtool/standard.py               |   3 +
> >  scripts/lib/recipetool/create.py              |  63 ++++++----
> >  .../lib/recipetool/create_buildsys_python.py  |  73 +++++++++++
> >  6 files changed, 208 insertions(+), 65 deletions(-)
> > 
> > -- 
> > 2.42.0
> > 
> 
> > 
> > 
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190862): https://lists.openembedded.org/g/openembedded-core/message/190862
> Mute This Topic: https://lists.openembedded.org/mt/102645283/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

