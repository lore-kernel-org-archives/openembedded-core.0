Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOsOO-0000LW-KD for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:15:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OECRRp020370;
	Tue, 24 May 2011 15:12:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20127-04; Tue, 24 May 2011 15:12:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OECJJl020364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 May 2011 15:12:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1306245557.2525.192.camel@phil-desktop>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
	<1305804109.3424.475.camel@rex>
	<1305805268.18415.185.camel@lenovo.internal.reciva.com>
	<1305807396.3424.510.camel@rex>
	<1305817446.18415.193.camel@lenovo.internal.reciva.com>
	<1305817704.3424.531.camel@rex>
	<1306245557.2525.192.camel@phil-desktop>
Date: Tue, 24 May 2011 15:12:16 +0100
Message-ID: <1306246336.3424.929.camel@rex>
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
X-List-Received-Date: Tue, 24 May 2011 14:15:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 14:59 +0100, Phil Blundell wrote:
> On Thu, 2011-05-19 at 16:08 +0100, Richard Purdie wrote:
> > On Thu, 2011-05-19 at 16:04 +0100, Phil Blundell wrote:
> > > On Thu, 2011-05-19 at 13:16 +0100, Richard Purdie wrote:
> > > > So if we:
> > > > 
> > > > a) Only add ROOTFS_PKGMANAGE_BOOTSTRAP if postinstalls were present
> > > > b) Add the read-only-rootfs option we discussed which errors if 
> > > >    postinstalls are present
> > > > 
> > > > we end up a lot closer to where you want to be.
> > > 
> > > Yes, sounds reasonable.  And I think we could then eliminate
> > > remove_packaging_data_files() altogether, in favour of having the right
> > > thing happen automatically during rootfs construction, which would
> > > probably be a good thing too.
> > 
> > Agreed, I think we have a plan :)
> 
> One other thing that occurred to me is that ONLINE_PACKAGE_MANAGEMENT
> (in classic oe) is a DISTRO feature rather than an image one.  This is
> significant because, for example, update-rc.d.bbclass doesn't include
> update-rc.d in RDEPENDS if it knows that the package will never be
> installed on a running target.  If we're going to make package
> management into an IMAGE_FEATURE then obviously this isn't going to work
> as it stands.
> 
> I guess we could work around it by letting update-rc.d add its
> dependency as normal, and then adding code to the rootfs constructor to
> stop it taking effect (and/or substitute a dummy update-rc.d package
> with no files in) if an image with no package management is being
> generated.  That doesn't seem terribly elegant but, short of going back
> to a DISTRO-based selection, I can't think of any better way of fixing
> it.

I think allowing selection of this at image generation time is the more
powerful way to handle this. It could be we go through a step of
forcibly removing packages we don't want from the rootfs such as
update-rc.d, or we can tell the package manager to ignore the dependency
which is probably neater.

I have to admit the update-rc.d change was concerning and this does feel
like a better way to handle it.

Cheers,

Richard



