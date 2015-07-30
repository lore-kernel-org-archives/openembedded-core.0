Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 88528763F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:37:50 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so23119883pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=4h9Uf/5FdcELAsDUSAzqY8WN1X72SqUOv34zhxUEUJI=;
	b=h0QiX3Bnzdl6EieThxIIs5sH6lA80aiJKPdeuYXY+GKUz3RbtlS5Qg2GZKa5laYNJN
	rzs4+/b+0mQORvTaqXo7yfmiQ6lhNlXuL6HjM2RrcL81W8CNtfxz8i6wBo2Gj7qluDT5
	qbblrOOarVQpVZvMDyrU6nY/olD8BiTHT91hZxrZif552MYXjNU+iUGHCIqzhekm82rP
	LCwQ4TlGsP2x+qCEoSgIOgY5o0G47P8m/dFi21Ll87ZeFtJmBjN5sGuWO0y3dYz419qe
	+aZYfnfAGknwhk9BSY1fbG6zQoblrOdb+p3YwdcbZmGTbXwS+aiNgm7az/qlH/36OpAA
	8Vlg==
X-Gm-Message-State: ALoCoQmcS65V0QbOc/h5/vH1ovNAzKD1x0jwyTJAl4c8XCElupZqINLOkPUyHNPmlinLY75Dn/0J
X-Received: by 10.70.118.5 with SMTP id ki5mr106719832pdb.6.1438256270645;
	Thu, 30 Jul 2015 04:37:50 -0700 (PDT)
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com.
	[209.85.192.181])
	by smtp.gmail.com with ESMTPSA id s1sm1755628pda.54.2015.07.30.04.37.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 04:37:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbbh15 with SMTP id bh15so23119468pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:37:48 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.135.104 with SMTP id pr8mr104519299pdb.129.1438256268620; 
	Thu, 30 Jul 2015 04:37:48 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 30 Jul 2015 04:37:48 -0700 (PDT)
In-Reply-To: <55B9C3A7.6050402@windriver.com>
References: <1438048807-23716-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LaXtgUCjzPS_6+5fEL6CDdLK1Cn_3wNvCM_EfWH_wDG2A@mail.gmail.com>
	<55B9C3A7.6050402@windriver.com>
Date: Thu, 30 Jul 2015 08:37:48 -0300
Message-ID: <CAP9ODKoq190kimVAUJ6dPEJWQtwLfLFsYDVFRcnMUrsr1-SVeQ@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: fix a building failure on OpenSus
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2015 11:37:53 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Thu, Jul 30, 2015 at 3:26 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
...
> u-boot-mkimage just be upgraded, and has the similar your suggestive fix:
>
> commit cffcd2861310855130db52c93f7bf4d9b511741d
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Fri Apr 3 12:30:25 2015 +0900
>
>     kbuild: include config.mk when auto.conf is not older than .config
>
>     Since the Kconfig conversion, config.mk has been included only when
>     include/config/auto.conf is newer than the .config file.
>
>     It causes build error if both files have the same time-stamps.
>     It is actually possible because EXT* file systems have a 1s time-stamp
>     resolution.
>
>     The config.mk should be included when include/config/auto.conf is
>     *not older* than the .config file.
>
>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>     Reported-by: Tom Rini <trini@konsulko.com>
>     Reported-by: York Sun <yorksun@freescale.com>
>     Reported-by: Stephen Warren <swarren@nvidia.com>
>     Reported-by: Matthew Gerlach <mgerlach@opensource.altera.com>
>     Tested-by: Stephen Warren <swarren@nvidia.com>

This is part of 2015.07 release so I am wondering what is the issue
here? Is this patch for old release? Fido for instance?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

