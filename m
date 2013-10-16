Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8F7615A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 16:06:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Oct 2013 09:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,508,1378882800"; d="scan'208";a="412005269"
Received: from unknown (HELO [10.255.15.226]) ([10.255.15.226])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2013 09:05:47 -0700
Message-ID: <1381939546.23041.123.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Oct 2013 09:05:46 -0700
In-Reply-To: <1381936247.23041.119.camel@dvhart-mobl4.amr.corp.intel.com>
References: <7df25a781aad32cb4f7deaa1c4af839e8dc604a2.1381898855.git.tom.zanussi@linux.intel.com>
	<3e3f7120140dc606369f19fbfca3e222db06274d.1381898855.git.tom.zanussi@linux.intel.com>
	<1381925340.29912.461.camel@ted>
	<1381936247.23041.119.camel@dvhart-mobl4.amr.corp.intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] wic: add fakeroot to the populate-extfs step
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
X-List-Received-Date: Wed, 16 Oct 2013 16:06:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-16 at 08:10 -0700, Darren Hart wrote:
> On Wed, 2013-10-16 at 13:09 +0100, Richard Purdie wrote:
> > On Wed, 2013-10-16 at 00:14 -0500, Tom Zanussi wrote:
> > > Without this, files in the generated filesystem pick up the wrong
> > > ownership.
> > > 
> > > Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> > > ---
> > >  scripts/lib/mic/kickstart/custom_commands/partition.py | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > index 302cace..309abee 100644
> > > --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > @@ -216,7 +216,7 @@ class Wic_PartData(Mic_PartData):
> > >          """
> > >          Prepare content for an ext2/3/4 rootfs partition.
> > >          """
> > > -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
> > > +        populate_script = "fakeroot %s/usr/bin/populate-extfs.sh" % native_sysroot
> > >          image_extra_space = 10240
> > >  
> > >          image_rootfs = rootfs_dir
> > 
> > We don't use fakeroot, please use pseudo. If pseudo doesn't work, we
> > need to figure out why and fix it.
> > 
> 
> Ultimately this needs to work independently from bitbake. Is that
> practical if we use pseudo here?

Starting to get a bit out of scope for this discussion, but it does
impact the utility of the tool. I don't see a package for pseudo in
either Ubuntu or Fedora. The lack of a package would definitely increase
the barrier to use (lots of people really dislike having to build their
own sources and muck up their filesystem with non-package files).

Has any work already been kicked off to try and get pseudo packaged in
the major distributions? Who would the right people be to work with on
that?

BTW, I'm not arguing for using fakeroot here, just trying to look at the
big picture of using wic and what additional effort might be required to
make it successful.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



