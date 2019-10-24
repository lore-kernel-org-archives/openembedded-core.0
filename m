Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE767F9AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:37:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46zWbB5gRZz3P;
	Thu, 24 Oct 2019 17:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571931465;
	bh=lZlMbyuICnC3n/EjlxLf2APjLizMa+L/IV6W2qMzEoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sn2bpxvwKx8fHoHL4qpTdEiVvY/dZpFUgz9kcI/NnSKPx0WUM6zlaHR9U+4kNdm3L
	dLu3nUAMWMX5PkBM51CXGWui90ZA01Bv3+LcO35AssQNwkKLQPVqzzCBDC7W9nae7T
	nSjvD737A00p0sApbZINB6ZBEwAbviR1hmvk9I8bl0CfsSGTTMEF6OkAqJ59ZeM6Fb
	vhXHFvi09f9PYGMPsbiHK9MoxzX5NrK1yvSDmoH5i948xHYvw84fhxatA/6r68/vUB
	aFkIH7WY5aE1mFNxTWZh7GbaXPKsTiYdFvTC0CaG77fjsDac4aSg3E7/pYuZPVatKD
	0XQe1SnDDTEtGe3jP515cM4yDT/f6NSgm8bo6yh8BR57eLVTpXgvDtGRWHd44P9u7H
	v4lRC3rozQLdey4dRLOSAF/o6gI1kZle8uLqPxtYTwYj/f2C7BcC7TbcinDhnwG5Do
	poZNK3OfITBXjDQGz721+RIpTpczsz7oZRegk+ytgdC2ZoXWVTbpp4TO4VJ5N9XIVx
	tL/a65g8PZS0u8W/KeDJSTch0wxhnVx7scrY02R9RCNnAQl0v6ILoT9Qhb6N1lsm6m
	ggyZP8VSlRNMrB5MsWaanybo14HVz/Yl8RIuHHzoqDi+NYFhX87ph3Lfpm2dzF4zzU
	BKkN3rdWVKjq3PasgzDknfbA=
Date: Thu, 24 Oct 2019 18:37:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191024153740.GB9707@localhost>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: brendan.le.foll@intel.com,
	"Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 15:37:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Oct 24, 2019 at 02:12:43PM +0200, Alexander Kanavin wrote:
> On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
> stefan@herbrechtsmeier.net> wrote:
> 
> > @Richard: What is your opinion about the per recipe dependency?
> > Typically OE use one recipe per project. The NPM based solution handle a
> > project and all dependencies via one recipe.
> 
> I don't think it's at all realistic to stick to the 'one recipe per
> component' in node.js world. A typical 'npm install' can pull down
> hundreds, or over a thousand dependencies, it's not feasible to have a
> recipe for each.

Debian has for the perl/python/node/go/rust/haskell ecosystems
one recipe per component, with ~ 1k recipes each.

> I very much welcome a solution that uses 'npm install' in a way that
> preserves offline builds, and integrity/reproducibility of downloads.
> License management should be also handled by npm, and if it isn't, then we
> need to work with the upstream to address it.

How will CVE checking and security support work in such a setup?

Last time I looked at Rust I was wondering whether a vendored copy
of the OpenSSL sources was being used.

If git-lfs-native might run during during fetch, it would also be good
if relevant CVEs in the Go libraries it uses get fixed.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


