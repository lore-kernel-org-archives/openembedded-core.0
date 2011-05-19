Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN2Cd-0001Dn-N5 for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 14:19:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JCGmAa007767;
	Thu, 19 May 2011 13:16:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07427-08; Thu, 19 May 2011 13:16:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JCGd19007761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 May 2011 13:16:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1305805268.18415.185.camel@lenovo.internal.reciva.com>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
	<1305804109.3424.475.camel@rex>
	<1305805268.18415.185.camel@lenovo.internal.reciva.com>
Date: Thu, 19 May 2011 13:16:36 +0100
Message-ID: <1305807396.3424.510.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 19 May 2011 12:19:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 12:41 +0100, Phil Blundell wrote:
> On Thu, 2011-05-19 at 12:21 +0100, Richard Purdie wrote:
> > On Thu, 2011-05-19 at 11:31 +0100, Phil Blundell wrote:
> > Agreed. I'd like to raise one other issue which is the number of
> > variables we need to control these things which are effectively binary
> > flags. I'm leaning towards having a small number of variables containing
> > flags which trigger certain behaviours. In this case the obvious choices
> > would be:
> 
> That's true, though one particular variable at hand is actually a
> trinary.  The behaviour that we have historically had in OE, which seems
> to capture most of the significant use-cases, is:
> 
> ONLINE_PACKAGE_MANAGEMENT="full" (or not set at all) means to install
> opkg or whatever and all its metadata, like oe-core does now
> 
> ONLINE_PACKAGE_MANAGEMENT="none" means to not install opkg or its
> metadata on the target at all;
> 
> ONLINE_PACKAGE_MANAGEMENT="add" means to install just enough package
> management infrastructure to allow new packages to be added after the
> fact, but not to allow packages that were shipped in the image to be
> manipulated.  I think the main use case for this was language packs and
> the like.
> 
> I'm not entirely sure that O_P_M="add" has ever actually worked properly
> (I don't use it myself) but it doesn't seem like an entirely worthless
> proposition.

This could be done as:

IMAGE_FEATURES = "packageaddonly"

with errors if two mutually exclusive flags were specified
("nopackagemanager packageaddonly").


Also, for reference in core-image.bbclass there is already this code:

   ${@base_contains("IMAGE_FEATURES", "package-management", "${ROOTFS_PKGMANAGE}", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \

which means OE-Core adds the package manager if requested
(ROOTFS_PKGMANAGE) and otherwise installs ROOTFS_PKGMANAGE_BOOTSTRAP
which corresponds to enough scripting to handle the postinstalls.

So if we:

a) Only add ROOTFS_PKGMANAGE_BOOTSTRAP if postinstalls were present
b) Add the read-only-rootfs option we discussed which errors if 
   postinstalls are present

we end up a lot closer to where you want to be.

Cheers,

Richard



