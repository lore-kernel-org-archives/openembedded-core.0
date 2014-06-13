Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 30EE466007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 10:29:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2014 03:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,470,1400050800"; d="scan'208";a="554987081"
Received: from pskulath-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2014 03:29:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stefan Stanacar <sstncr@gmail.com>
Date: Fri, 13 Jun 2014 11:29:24 +0100
Message-ID: <2069447.2Tc4mnJN0Z@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B0A27B15F@IRSMSX103.ger.corp.intel.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
	<CANr+NRuQS6He3qmawsEp2qTWA4ho_0EQDVzrPoBTcb2QqjHM1w@mail.gmail.com>
	<33115ABC4887814E8A92A08FBC93416B0A27B15F@IRSMSX103.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 7/7] scripts/test-remote-image: Add script for running runtime tests on remotely built images
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
X-List-Received-Date: Fri, 13 Jun 2014 10:29:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 June 2014 12:06:44 Stoicescu, CorneliuX wrote:
> On Saturday, June 07, 2014 5:09 PM Stefan Stanacar wrote:
> > - It seems wierd that you instantiate the target controllers classes
> > here... You do that so you can get the extra files, but that has nothing
> > to do with testimage anyway. Let bitbake/testimage do it's part and it's
> > configuration. Similar for image fs types (see my other
> > reply)
> 
> - I believe it's a good idea to use the target controllers to get
> information from them using class methods. This way we use the same source
> to get the information we need both internally and externally.

Right, the intention was to avoid duplicating the code for handling machine-
specific behaviours. We aren't instantiating the target controllers, just using 
them as classes and call class functions on them.

> > - the support for other fs types should be separate from the "test
> > external built image". E.g bbb uses tar.bz2, so even at this point you can
> > still test external images only with tar.gz (adding IMAGE_FSTYPES
> > += "tar.gz"  to the Autobuilder config is a easy task). What I'm
> > trying to say is that this is a user/build config option and this script
> > shouldn't deal with every little thing
> 
> - We wanted to use the current default IMAGE_FSTYPES as much as
> possible(this is why the bug was opened). For this we had to enable the
> master image to decompress tar.bz2 and make the target controllers use
> them. Having IMAGE_FTYPES += "tar.gz" for all test images was not desired.

At the moment Beth is trying to reduce the number of artifacts produced by the 
autobuilder; it just seemed a bit wasteful to add another tarball format when 
we could simply handle whatever format is already produced (assuming it is a 
tarball, of course).

> > - What's with the postconfig stuff? QA_MACHINE = MACHINE? Same for
> > distro.. I really don't get that part...
> 
> Bitbake does not export the MACHINE variable so in order to get this
> information we had to use this trick (the runqemu script also uses it, if I
> remember right). We do QA_MACHINE = MACHINE and then the QA_MACHINE
> variable is exported by bitbake and we can get it from 'bitbake -e'. :D

This is unfortunately part of the pain of how oe-selftest and other external 
scripts like it query variables using bitbake -e. What bitbake -e does is to 
report variables broadly as they would be exported to the environment; if a 
variable is marked "unexport" (as MACHINE is) then you won't see its final 
value in bitbake -e output other than in comments. There are other ways we 
could deal with this, and maybe bitbake -e shouldn't pay attention to 
unexport, however the method this new script uses, whilst a little hacky, is 
the least disruptive.

> > - I'm missing the bigger picture here with all the profiles stuff (plus
> > some classes are unnecessarily abstract ).
> 
> The same way we have a BaseTarget class for the target controllers, we also
> have base target/repo profiles. These classes are abstract and define the
> bits and pieces that the script will actually use. We don't care how they
> are implemented. You can see them as interfaces to the target and images
> repo.
> 
> Also we wanted classes so they can be extended/modified easily by new ones.
> For example we have an AutoTargetProfile class that auto determines the
> images needed, but say a target controller cannot be predicted at all with
> the information we can access. We just create a new target profile
> extending the base target profile and add new functionality and information
> sources but still use the 'interfaces' defined.

We'll have to wait and see how useful this ends up being in practice, but the 
intention is to allow for some flexibility in future.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

