Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbYCg-0005yh-Cu for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 15:19:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SDG519024590
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:16:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24463-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:16:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SDFurW024584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:15:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E095480.3070001@windriver.com>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
	<4E095480.3070001@windriver.com>
Date: Tue, 28 Jun 2011 14:15:43 +0100
Message-ID: <1309266943.20015.290.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 13:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-27 at 23:11 -0500, Mark Hatle wrote:
> On 6/27/11 9:09 PM, Cui, Dexuan wrote:
> > Hi all, below is an initial investigation about the task and we'll continue to further look into it.
> > 
> > In poky we have 2 types of postinst scripts:  one (type-1) can be (and has already been) run at rootfs generation time and the other (type-2) has to be delayed to the first-boot of target device. Type-2 makes target device's first-boot slow and it would be great if we can fix it and convert it to type-1.
> > 
> > We can instrument a first-boot with minimal/sato first to see which postinstalls take the most time and then prioritise those ones to fix.
> > 
> > I figurerd out a list of 33 recipes in total(recipes with the same name but with different versions are counted once) we possibly need to fix.
> > For the recipes, we need try to find recipe-specific ways(use appropriately modified native utilities to generate caches, files, etc as necessary on the target filesystem).
> > 
> 
> ...
> 
> > 1 recipe: prelink: we could propablly fix it, but I'm not sure yet.
> > meta/recipes-devtools/prelink/prelink_git.bb
> 
> There is nothing to do for the prelinker.  The "image-prelink.bbclass" handles
> everything needed to prelink during image creation.  The script is only there
> for on-target field upgrades.  So you can remove this from your list.

Mark, are you 100% sure about this?

It looks like if we install prelink into an image it adds a post install
which runs "prelink -a" on the target device at first boot.

This would happen regardless of whether the cross prelinker did or did
not prelink the image :/.

Cheers,

Richard




