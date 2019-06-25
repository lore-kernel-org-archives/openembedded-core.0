Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 869317D5C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 08:58:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Y0Sg3KJVz2M;
	Tue, 25 Jun 2019 10:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561453123;
	bh=h/boODwJDKKVT8AVMTug0wToA/ZC5s87hPurJ7wMLYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=suSivKNk9TSZfspIl+f8hYOJYAn/NwN3rN0KssvyvAU2Zqdi1sIIXquHdU3yoTaO9
	8N7AG3UtIEiZLvKQQuuscjVPWkejwOOW3YQ6kGWVEht2Y+Uit0clchcjOLUu3lCli4
	50WQ4QjZXrYwdWm1Kp+QESTDiMA5SGcZi32Sc9Y+aRALII4DO/aEzLwDJLp2PrOBjj
	RhkEQy/zjtB0uYegcRUfENvYiuGIqOj24V/GBq1GoSTDZNtesAyP5ttwBv7yoj1l4f
	0lhOiip5x+UvemvlrkJWGuqmMakjZL7dYa23cu/dOyqBiS5Mj8nrFh9Mr4HygU2LSk
	o7KR6bBIHZJ+7u5jDdwhXKHopICobghWga6/Jhdof5wLCyW+MQ7zuWy1sog/TaIzzi
	6FebYF+m93MuDYlsLGgoEsiSCXJrnO06lnJB21zUEpghRxywn2X1uNox3Fg8EFxsVk
	ZVDI2NYEtDVhLNgYS6OFNzYlOdMqnyhV6ELZXQMJQGhUx+iOLWDDII//Y4wgKyc8Pp
	I5bgw+dGX7eMcgb4HYvODKOh+ZMTDeEI99nHyBzobj9/k6gRDDCOcMMV5IKIrAqLBT
	Do5vWuCvP7jk3NOC9OGUB+o0UfESZ9I84xCThCxvD6Wo/illZktGa9l/6BMPGufhUB
	Sh6xofjyjAOTmv8XmPNlMTiY=
Date: Tue, 25 Jun 2019 11:58:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190625085840.GA17196@localhost>
References: <20190625060121.17379-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190625060121.17379-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] efibootmgr: Pass correct flags to compiler from pkg-config
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
X-List-Received-Date: Tue, 25 Jun 2019 08:58:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 24, 2019 at 11:01:21PM -0700, Khem Raj wrote:
> efivar.h is in usr/include/efirvar directory so it should be
> added to include search path via -I to compiler cmdline to fix
> 
> make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
> | make[1]: *** Waiting for unfinished jobs....
> 
> When running clang to generate dependencies -MM -MG -MF it still
> parses the compile unit and complains if certain header is not found
> where as gcc does not do that, hence the compile error is only seen
> when compiling with clang.
> 
> FIx is use a weak default assignment for PKGS var which is used by
> pkg-config to deduce compiler flags, this helps in getting right
> -I flags even for dep step
>...
> +Upstream-Status: Pending
>...

It would be better to backport the upstream fix instead:
https://github.com/rhboot/efibootmgr/commit/97668ae0bce776a36ea2001dea63d376be8274ac

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


