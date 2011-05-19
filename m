Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QN1eC-0005g8-Mk for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:44:08 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QN1bO-0007Q1-Jo; Thu, 19 May 2011 13:41:14 +0200
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1305804109.3424.475.camel@rex>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
	<1305804109.3424.475.camel@rex>
Date: Thu, 19 May 2011 12:41:08 +0100
Message-ID: <1305805268.18415.185.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Thu, 19 May 2011 11:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 12:21 +0100, Richard Purdie wrote:
> On Thu, 2011-05-19 at 11:31 +0100, Phil Blundell wrote:
> Agreed. I'd like to raise one other issue which is the number of
> variables we need to control these things which are effectively binary
> flags. I'm leaning towards having a small number of variables containing
> flags which trigger certain behaviours. In this case the obvious choices
> would be:

That's true, though one particular variable at hand is actually a
trinary.  The behaviour that we have historically had in OE, which seems
to capture most of the significant use-cases, is:

ONLINE_PACKAGE_MANAGEMENT="full" (or not set at all) means to install
opkg or whatever and all its metadata, like oe-core does now

ONLINE_PACKAGE_MANAGEMENT="none" means to not install opkg or its
metadata on the target at all;

ONLINE_PACKAGE_MANAGEMENT="add" means to install just enough package
management infrastructure to allow new packages to be added after the
fact, but not to allow packages that were shipped in the image to be
manipulated.  I think the main use case for this was language packs and
the like.

I'm not entirely sure that O_P_M="add" has ever actually worked properly
(I don't use it myself) but it doesn't seem like an entirely worthless
proposition.

I agree that TARGET_READONLY_ROOTFS or whatever could be done just as
well as some kind of FEATURE.

p.




