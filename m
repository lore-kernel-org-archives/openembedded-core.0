Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPxho-0007Ya-PE for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 16:08:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QPxes-00066P-6V; Fri, 27 May 2011 16:04:58 +0200
From: Phil Blundell <pb@pbcl.net>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <4DDE9206.7020007@linux.intel.com>
References: <cover.1306385875.git.dvhart@linux.intel.com>
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
	<1306407015.2525.311.camel@phil-desktop>	<1306420679.27470.186.camel@rex>
	<1306426688.2525.377.camel@phil-desktop>
	<4DDE9206.7020007@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 27 May 2011 15:04:57 +0100
Message-ID: <1306505097.2525.457.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 May 2011 14:08:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 10:46 -0700, Darren Hart wrote:
> Right, it just starts to look rather ugly in the recipe, especially for
> BSPs supporting more than just a couple of machines. I also think that
> having to use machine overrides is an indicator that the mechanism is
> not working for the purpose it was designed for.

Yes, agreed.  But the point I was making in my first mail is that you
don't actually need to use machine overrides at all; just appending to
COMPATIBLE_MACHINE will work fine.

So, to be clear, in the core u-boot.bb you could have:

# These machines are supported by upstream u-boot
COMPATIBLE_MACHINE = "(beagleboard$|at91sam9260ek$)"

and then, in some putative meta-dec overlay, you could have a
u_boot.bbappend which does:

# This patch adds PDP-11 support to u-boot
SRC_URI += "pdp11.patch"
COMPATIBLE_MACHINE .= "|pdp11$"

and everything ought to work out just fine.  The only bit that is
slightly non-obvious is what to do if you don't want the core version of
u-boot to admit any MACHINEs at all but, as I mentioned to Richard, you
can achieve that by setting

COMPATIBLE_MACHINE = "(?!^)"

or something similar.

p.




