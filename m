Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPdJ9-0001Oa-MP for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 18:21:11 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPdGE-0005b9-1E
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 18:18:10 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306420679.27470.186.camel@rex>
References: <cover.1306385875.git.dvhart@linux.intel.com>
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
	<1306407015.2525.311.camel@phil-desktop>
	<1306420679.27470.186.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 26 May 2011 17:18:08 +0100
Message-ID: <1306426688.2525.377.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [pull-oe-uboot 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Thu, 26 May 2011 16:21:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 15:37 +0100, Richard Purdie wrote:
> u-boot in OE-Core would need something like COMPATIBLE_MACHINE = ""
> which makes this harder.

Yes, true.  I don't think that's a major problem, though, you just need
a regex that won't match anything.  Something like:

COMPATIBLE_MACHINE = "(?!^)"

would probably do what you want, though it does have the admitted
downside of looking rather like line noise.  

If this is going to be a common problem then it might be worth hacking
base.bbclass about a bit to provide a more convenient way to do it.  The
UBOOT_MACHINE thing is fine as a solution for u-boot since that variable
needs to exist anyway, but I wouldn't have been keen on introducing it
just to control the recipe acceptability.

> Its usually seem to work out easier to just do:
> 
> COMPATIBLE_MACHINE_mymachine = "mymachine"
> 
> which avoids several potential issues.

Yeah, that would work fine too: you could even save a bit of typing by
just using "" as the rvalue since an empty C_M will (somewhat
counterintuitively) permit everything.  I got the impression from
Darren's original phraseology of "resorting to machine-specific
overrides" that he didn't like it much, though.

p.




