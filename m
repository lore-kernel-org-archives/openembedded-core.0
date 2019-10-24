Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 240D67F985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46zMWj54n4z2J;
	Thu, 24 Oct 2019 11:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571909650;
	bh=cUXdWDtrBEwTnscM9HJb68XfHzpaS1809PUsxN4+dqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOy4uiWETsB9WJi/sgzPaB3R08GghUXymyr2xvecaIGniBCjnRhemUPymHz7m5qym
	VQc1VNE5B+hQDWn8S8JUXAJtswSzNJmRhhr3wENp8l93LUfFE/bGbcxIociITCvmxv
	Imem7XXNsuvirFly7vOd9EIjcSLVgDBnj5Fp1ztXIz7kMFx8thXJrr09rcrKjNvKs5
	4e1lHljSZmZSZCvPmnRoQ7reN7Gt5LKtBaGKKsJtjlZ/W8lRdJj53WRSEvHuu7S4wy
	tqL51UOe10+6C312Z0jxfzi2uSPZUqY5Yj7TYTpghRad8Nx7X6wPO29Du5bNUbPsEp
	Of120XBJbkZLDnStm2iMG5l82OGxBgfgKFrhzQGOjf7x8KAfW3MaDKfxYZKxGUv9R9
	Ia1b2JazLQgmdZjYku3VWvUeVfp/eheGilI17Gi8aPG48L2YoxtHErfzKZ4Xsl+h1z
	XXonI+xHS2Wdu1+9VKVtm/7KIDcOCZG/48GKAx2hs7hCQGo4nvMestcjhjDT8UZ2cN
	m2mh2JLCncN7dGES8Xposl6sGcli22XVnd6gyz0QqNMPFhqi70OLkzaquSfrW+haNc
	9p/WTtpVkqsuThnyNVurNjLQk2+hMrN00oBdAf6RIuDMziZf3sFWKNquRBqvR5S0BD
	AetFelh8Wdmp/HfQTmAy5ZWE=
Date: Thu, 24 Oct 2019 12:34:06 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20191024093406.GA27204@localhost>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
	<25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Thu, 24 Oct 2019 09:34:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Oct 24, 2019 at 09:15:01AM +0100, richard.purdie@linuxfoundation.org wrote:
> 
> The cmake change makes python visible from HOSTTOOLS. That isn't wrong
> as such, it is a change in behaviour. If recipes don't set python
> enabled/disabled explicitly, there is some fallout from that. I'd say
> that is a bug in those recipes which aren't giving explicit
> configuration to dependencies though.

The problem is not about enable/disable, it is more about not explicitly 
selecting the python version.

For the affected libiio the python2 -> python3 change of the python 
bindings last week [1] was basically:

-inherit cmake pythonnative systemd
+inherit cmake python3native systemd

This is very fragile, and I would consider it expected that either the 
old or the new case will break in some way when both python2 and python3
are available during the build.

> Cheers,
> 
> RIchard

cu
Adrian

[1] http://git.openembedded.org/meta-openembedded/commit/?id=6af155513506f6a0a3a44b66fb48897f22fb2c2f

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


