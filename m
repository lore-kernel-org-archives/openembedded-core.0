Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC5460017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:10:02 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=PXkATKbfrgdC41CO+lDIeVULg9YZOCrA86CyiGNujWIam1645OPh7TXAcRD+H2enNgs9VMaQwkGG
	WdeW9CTXMxID5fxSDlE/1VnO2cmOlQjubJztt/X6iNi1iPRz4likP3KOLyO9V4MOLIgfImmzLIiy
	TtLkZbnoCS3cr0NZ2I8=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1464008988652868.8910521143758;
	Mon, 23 May 2016 06:09:48 -0700 (PDT)
Date: Mon, 23 May 2016 09:09:48 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "Sergey 'Jin' Bostandzhyan" <jin@mediatomb.cc>
Message-ID: <154ddbc57b2.b6371088169876.410905562428692243@geekcentral.pub>
In-Reply-To: <20160523130028.GB31153@deadlock.dhs.org>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160523130028.GB31153@deadlock.dhs.org>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Wic and "live" images
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
X-List-Received-Date: Mon, 23 May 2016 13:10:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


 ---- On Mon, 23 May 2016 09:00:28 -0400 Sergey &#39;Jin&#39; Bostandzhyan <jin@mediatomb.cc> wrote ---- 
 > Hi, 
 >  
 > I'm risking to land in the "reinvented the wheel" corner, but basically I 
 > had a task to create images with msdos partitions, while at the same time 
 > some things had to be in areas where parted/fdisk were not able to create a 
 > partition yet (i.e. u-boot had to be at a very early offset in the image). 
 >  
 > wic seemed too PC oriented and cumbersome to me, so I came up with 
 > a custom class: 
 >  
 > https://git.digitalstrom.org/dss-oe/dss-oe/blob/master/yocto/dS/meta-digitalstrom-devel/classes/msdos_partition_image.bbclass 
 >  
This is more or less what I have now.  I was trying to move to 'wic' because the 'image-vm.bbclass' cannot handle some of the things I want.  From the manual it sounds like wic is more flexible, but I think it is only flexible in the way you can use plugins to create new partition types.  It also lacks any sort of dependency tracking with bitbake so you cannot use it from there without a lot of manual hand holding.  I think for the limited types it currently handles it is less capable than image-vm.bbclass.

 > I have a multimachine configuration which then looks like this (example with 
 > raw image outside a partition): 
 > https://git.digitalstrom.org/dss-oe/dss-oe/blob/master/yocto/dS/meta-digitalstrom-devel/recipes-core/images/dss20-image.inc 
 >  
 > Or this (example with extended partition): 
 > https://git.digitalstrom.org/dss-oe/dss-oe/blob/master/yocto/dS/meta-digitalstrom-devel/recipes-core/images/dss11e-image.inc 
 >  
 > The DSSIMG_TASK_DEPENDS variable lists all things that will be 
 > written into the final image (i.e. u-boot, rescue fs, root fs). 
 >  
 > If someone considers this interesting for OE in general, I can surely tune 
 > a few things and submit a patch for review. 
 
I do find this very interesting.  From the looks of it there seems to be more extensibility than can be had with image-vm.bbclass or wic.

>  
 > Kind regards, 
 > Jin 
 >  
 >  
 >  
 > On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote: 
 > >  ---- On Mon, 23 May 2016 06:36:23 -0400 Ed Bartosh <ed.bartosh@linux.intel.com> wrote ----  
 > >  > On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote:  
 > >  > > Greetings, I am trying to learn "wic" and have been confused as how to create a "live" style image.  I am following "http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images" but am getting confused on the target to use to create the a file system that has a single squashfs file containing my root file system.    
 > >  > >   
 > >  > > My desired partition layout is as follows:  
 > >  > >       40MiB                 40MiB               300MiB  
 > >  > > +--------------------+-----------------+-----------------------------+  
 > >  > > |      BOOT (esp)    |    DATA (fat)   |          ROOT (live)        |    
 > >  > > +--------------------+-----------------+-----------------------------+  
 > >  > >   
 > >  > > BOOT - efi boot partition with kernel and initramfs  
 > >  > > DATA - generic fat filesystem to hold configuration files  
 > >  > > ROOT - an ext4 filesystem that contains a single os.img, which is a squashfs file.  
 > >  > >   
 > >  > > I have ROOT and DATA figured out but I am at a loss as how to generate the os.img file and copy it into ROOT.  If I generate the os.img file with bitbake and then use the "-r" option to manually supply a directory structure it works, but I would rather have it done from a wks file for automation reasons.  
 > >  > >   
 > >  > > Any hints?  
 > >  > I'd suggest to use wic image type and generate your image by bitbake.  
 > >  > You can find example wic-image-minimal.bb and wic-image-minimal.wks in ../meta-selftest/recipes-test/images/  
 > >  >   
 > > This is where I started.  I was able to make it work but not with my configuration above.  It looks like I can use a type of "fsimage" for my "ROOT" partition, but I have not been able to figure out the syntax there yet.  For "BOOT" I am at a complete loss.  In theory "bootimg-efi" but there doesn't seem to be a way to provide an initramfs. 
 > >  
 > >  > You can probably do the same by using wic plugins, but I'd not suggest  
 > >  > to go this way. Using wic image type is simpler, more consistent, easier to do and provides higher level of automation.  
 > >  
 > > Is using the wic image type and a plugin mutually exclusive? 
 > >  
 > > Thanks! 
 > >  
 > >  
 > >  
 > > --  
 > > _______________________________________________ 
 > > Openembedded-core mailing list 
 > > Openembedded-core@lists.openembedded.org 
 > > http://lists.openembedded.org/mailman/listinfo/openembedded-core 
 > 


