Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Swveg-0000bv-UD
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 15:41:35 +0200
Received: from rrcs-24-227-210-218.sw.biz.rr.com ([24.227.210.218]:38123
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SwvTQ-0003Q5-Iv for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 09:29:56 -0400
Date: Thu, 2 Aug 2012 08:29:52 -0500 (CDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1208020820070.17563@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: summary of eglibc configure error, qemuarm, using codesourcery
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
X-List-Received-Date: Thu, 02 Aug 2012 13:41:35 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  this is the last chance i'll get to post for a few hours (site
doesn't support sendmail going out, but i can still fetch mail), so
i'll summarize what i'm fighting with and i'm open to suggestions.

  on 64-bit ubuntu 12.04 system, i've built numerous qemuarm images
using the oe-generated toolchain, so that part works fine.  i've
downloaded and installed code sourcery's
arm-2012.03-57-arm-none-linux-gnueabi.bin, and added the following to
my local.conf:

TCMODE = "external-sourcery"
EXTERNAL_TOOLCHAIN = "/home/rpjday/CodeSourcery/Sourcery_CodeBench_Lite_for_ARM_GNU_Linux"
NO32LIBS = "0"

and "bitbake core-image-minimal" produces:

| ERROR: oe_runconf failed
| ERROR: Function failed: do_configure (see
/home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/eglibc-2.16-r4+svnr19383/temp/log.do_configure.5308
for further information)
NOTE: package eglibc-2.16-r4+svnr19383: task do_configure: Failed
NOTE: package pciutils-3.1.9-r0: task do_package: Started
ERROR: Task 31
(/home/rpjday/y/src/oe-core/meta/recipes-core/eglibc/eglibc_2.16.bb,
do_configure) failed with exit code '1'

  i pasted the "config.log" file here: http://pastebin.com/vVXNNR2r.
and it certainly looks like this is relevant:

http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/24208

  finally, this is in the verbose output:

ERROR: Multiple .bb files are due to be built which each provide virtual/libc
(/home/rpjday/y/src/oe-core/meta/recipes-core/eglibc/eglibc_2.16.bb
/home/rpjday/y/src/oe-core/meta/recipes-core/meta/external-sourcery-toolchain.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide
virtual/arm-none-linux-gnueabi-libc-for-gcc
(/home/rpjday/y/src/oe-core/meta/recipes-core/eglibc/eglibc_2.16.bb
/home/rpjday/y/src/oe-core/meta/recipes-core/meta/external-sourcery-toolchain.bb).
 This usually means one provides something the other doesn't and should.

  that's pretty much it, i have to pack up and head out but if anyone
has suggestions, i'll be checking e-mail regularly.  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


