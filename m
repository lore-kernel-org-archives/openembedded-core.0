Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6D260EB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 15:37:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GFb0Nf005543; Wed, 16 Oct 2013 16:37:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1yB-6bmV7o5d; Wed, 16 Oct 2013 16:37:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GFasOH005525
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 16 Oct 2013 16:36:55 +0100
Message-ID: <1381937810.29912.487.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 16 Oct 2013 16:36:50 +0100
In-Reply-To: <1381936247.23041.119.camel@dvhart-mobl4.amr.corp.intel.com>
References: <7df25a781aad32cb4f7deaa1c4af839e8dc604a2.1381898855.git.tom.zanussi@linux.intel.com>
	<3e3f7120140dc606369f19fbfca3e222db06274d.1381898855.git.tom.zanussi@linux.intel.com>
	<1381925340.29912.461.camel@ted>
	<1381936247.23041.119.camel@dvhart-mobl4.amr.corp.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
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
X-List-Received-Date: Wed, 16 Oct 2013 15:37:14 -0000
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

pseudo is an independent project and you can build and use it outside of
bitbake no problems at all. My worry is we didn't adopt fakeroot for
many good reasons. I don't want "fixing fakeroot" to suddenly appear on
the agenda. We did that and its called pseudo.

Cheers,

Richard


