Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 45D4A73173
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 11:43:14 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160617114313624_0484
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 11:43:13 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=53856 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bDsCk-0002bR-1I for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2016 07:44:54 -0400
Date: Fri, 17 Jun 2016 07:42:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1606170724080.12337@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: my plan for an OE-based "installer" image
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
X-List-Received-Date: Fri, 17 Jun 2016 11:43:15 -0000
Content-Type: text/plain; charset=US-ASCII


  (i asked about this on the YP list a while back, but since this is
really a basic OE question, i'll re-ask it here with more detail.)

  i want to build an "installer" image for a powerpc system i'm
working with, and i have what i think is a reasonable design, so i'll
describe it and just want to know what others think about it, and if
i'm overlooking anything critically important or fatal, or possibly
something much simpler that already exists.

  first, i already have a functioning build for the powerpc target
board for u-boot and the kernel and a rootfs and so on, so i already
have all the info i need for configuration and cross-compilation.

  next, i am allowed to assume i have a functioning u-boot on the
target board, which is capable of downloading a live image which will
(obviously) run strictly out of RAM and will be responsible for
formatting the attached hard drive, then fetching (tftp) the root
filesystem, untarring it onto the drive, etc.

  i'm assuming the best strategy would be to create a live image using
something like core-image-minimal-initramfs.bb -- seems pretty obvious
that i want a skeletal rootfs that does little more than format the
hard drive, then populate it, set some u-boot env vars, then reboot to
let the system come up. sound reasonable so far?

  finally, as for the program that does all that installation work,
i'm familiar with a number of OE layers that have .bbclass files that
define creating an SD card image for the target board. here's one for
the raspberry pi:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/classes/sdcard_image-rpi.bbclass

obviously, those bbclass files are designed to be used to create image
files for the target board, but i can't do that in my case. however,
i can certainly take the equivalent utility and add it to the live
image so it does all the same work while running out of RAM to do the
same thing to the actual hard drive.

  does this sound like a reasonable plan? am i overlooking something
important? am i choosing the right OE image recipe as a basis? is
there already something that does this? thoughts?

rday

p.s. oh, and if i can do this, i'm going to try to simulate all this
with a qemuppc image. it seems like that's doable, i can just
configure a qemuppc image with some fake hard drive and everything
should work, no?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


