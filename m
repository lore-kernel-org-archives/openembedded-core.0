Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2388D772E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0E7FE31C2A7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 11:46:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id aOk1xH60RqCR
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 11:46:29 +0100 (CET)
Received: from t510.zcs.saftware.de (p57A61904.dip0.t-ipconnect.de
	[87.166.25.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4FA3031C1723
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 11:46:28 +0100 (CET)
Date: Fri, 17 Feb 2017 11:46:28 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170217114628.1fd9f198@t510.zcs.saftware.de>
In-Reply-To: <DM5PR05MB295440589E889B60FAAEACD5BB5A0@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <DM5PR05MB2954FBA66842C0F05C5108C6BB5B0@DM5PR05MB2954.namprd05.prod.outlook.com>
	<9c23fade-7e4c-ec14-f0c1-dd43ae71c5ff@gmail.com>
	<DM5PR05MB295440589E889B60FAAEACD5BB5A0@DM5PR05MB2954.namprd05.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: Suggested RREPLACES/RCONFLICTS for easier kernel-image upgrades
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
X-List-Received-Date: Fri, 17 Feb 2017 10:46:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Feb 2017 13:43:03 +0000
Bryan Evenson <bevenson@melinkcorp.com> wrote:

> Khem,
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Khem Raj
> > Sent: Wednesday, February 15, 2017 5:17 PM
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] Suggested RREPLACES/RCONFLICTS for easier kernel-
> > image upgrades
> > 
> > 
> > 
> > On 2/15/17 1:54 PM, Bryan Evenson wrote:  
> > > For one project I'm using an Atmel AT91SAM9G25 processor, and I started  
> > when support for the chip wasn't fully integrated into the mainline kernel.
> > As a result, I was using Atmel's Linux fork.  Support has been in the mainline
> > kernel for a while now, so in the middle of doing other updates I plan on
> > switching to using one of the mainline LTS releases.  I'm using the kernel
> > recipe in the meta-sunxi layer as an example (located here:
> > https://github.com/linux-sunxi/meta-sunxi/blob/master/recipes-
> > kernel/linux/linux_4.4.40.bb). I also plan on keeping more up to date on
> > releases.  However, due to the package naming for the kernel images, the
> > RREPLACES/RCONFLICTS statements for firmware upgrade for this recipe is
> > getting ridiculous.  I'm currently building for kernel version 4.1.38, and here's
> > what I have so far to handle all previous cases:  
> > >
> > > RREPLACES_kernel-image = "kernel-image (<= 4.1) kernel-image-3.6.9-  
> > yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-
> > at91"  
> > > RCONFLICTS_kernel-image = "kernel-image (<= 4.1) kernel-image-3.6.9-  
> > yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-
> > at91"  
> > >
> > > If it makes a difference, I'm using opkg for a package manager.  Since the  
> > kernel version is in the package name, I'm assuming that if I do keep going
> > forward and relatively up to date with LTS release, I'll have to start adding
> > "kernel-image-4.1.38 kernel-image-4.1.39 kernel-image 4.1.40 ...." to the
> > RREPLACES/RCONFLICTS so opkg will upgrade the kernel.  
> > >
> > > Is there a better way to do this?  I've tried using some wildcards in the  
> > package names without any success.  
> > >  
> > 
> > you can increment PE  
> 
> I tried that and it didn't make a difference; without the specific previous package names listed in RDEPENDS/RCONFLICTS, opkg does not recognize the new kernel-image as an upgrade.  From my understanding PE only affects the version number, not the package name.  In this case, since KERNEL_VERSION is part of the package name, opkg does not immediately recognize kernel-image-4.1.38 as an upgrade for kernel-image-3.10.0-at91.  Even though both packages provide "kernel-image", that's not what opkg is looking at when it checks for upgrades.
> 
> Could someone explain to me why KERNEL_VERSION is even in the package name to begin with?  I'm tempted to remove the following two lines from kernel.bbclass:
> 
> PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
> 
> However, I don't know if this will break something else that would cause an even bigger problem.

That's what I do in my kernel recipes:

# By default, kernel.bbclass modifies package names to allow multiple kernels
# to be installed in parallel. We revert this change and rprovide the versioned
# package names instead, to allow only one kernel to be installed.
PKG_kernel = "kernel"
RPROVIDES_kernel = "kernel-${KERNEL_VERSION_PKG_NAME}"
PKG_kernel-base = "kernel-base"
RPROVIDES_kernel-base = "kernel-base-${KERNEL_VERSION_PKG_NAME}"
RDEPENDS_kernel-base = ""
PACKAGES_remove = "kernel-image"

You may need to add some RCONFLICTS+RREPLACES for your old kernels, but
the problem would be solved for future updates.

Note that a change landed in master recently which also places the kernel
version in the name of every kernel module package. To avoid this, you
need to set the following variables globally:

KERNEL_MODULE_PACKAGE_SUFFIX = ""
KERNEL_MODULE_PROVIDE_VIRTUAL = "0"

Regards,
Andreas


> 
> Thanks,
> Bryan
> 
> >   
> > > Thanks,
> > > Bryan
> > >  
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core  


