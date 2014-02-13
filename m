Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AB34D6EA4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:51:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Feb 2014 03:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="480839627"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2014 03:50:38 -0800
Date: Thu, 13 Feb 2014 13:50:37 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140213115036.GK10078@lpalcu-linux>
References: <cover.1392230968.git.laurentiu.palcu@intel.com>
	<cc9a8b3a006120ba793051f1a790c3cb3681c28e.1392230968.git.laurentiu.palcu@intel.com>
	<1392291156.14081.9.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1392291156.14081.9.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lib/oe/rootfs.py: fix RPM multilib issue
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
X-List-Received-Date: Thu, 13 Feb 2014 11:51:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2014 at 11:32:36AM +0000, Richard Purdie wrote:
> On Wed, 2014-02-12 at 20:54 +0200, Laurentiu Palcu wrote:
> > For some odd reason (at least I couldn't find an explanation to this,
> > yet), if a multilib version of a package is installed after the main one
> > (that is: in a different smart session), the main package binaries are
> > not overwritten.
> > 
> > This commit restores the functionality to the original one, before
> > migrating to python: feed all the packages to smart, apart from attempt
> > only ones which are installed separately.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> >  meta/lib/oe/rootfs.py |   16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> > index b6baf77..9162e52 100644
> > --- a/meta/lib/oe/rootfs.py
> > +++ b/meta/lib/oe/rootfs.py
> > @@ -317,10 +317,18 @@ class RpmRootfs(Rootfs):
> >  
> >          self.pm.update()
> >  
> > -        for pkg_type in self.install_order:
> > -            if pkg_type in pkgs_to_install:
> > -                self.pm.install(pkgs_to_install[pkg_type],
> > -                                [False, True][pkg_type == "aop"])
> > +        pkgs = []
> > +        pkgs_attempt = []
> > +        for pkg_type in pkgs_to_install:
> > +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
> > +                pkgs_attempt = pkgs_to_install[pkg_type]
> 
> Should this be a += ?
Indeed, I guess I was thinking that there can be only one attempt only
list. Nevertheless, should be += there. Thanks!

> 
> This might be clearer as an if: else:
Agreed.

Incoming v2...

laurentiu
> 
> > +                continue
> > +
> > +            pkgs += pkgs_to_install[pkg_type]
> > +
> > +        self.pm.install(pkgs)
> > +
> > +        self.pm.install(pkgs_attempt, True)
> >  
> >          self.pm.install_complementary()
> >  
> 
> 

