Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDL5H-0007WX-4U
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 21:32:35 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDKwW-0003wr-IL for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 15:23:32 -0400
Date: Thu, 29 Mar 2012 15:23:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203291505580.4586@oneiric>
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
Subject: argh ... "_append" versus "+=" and IMAGE_INSTALL confusion
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
X-List-Received-Date: Thu, 29 Mar 2012 19:32:35 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  forgive me for free associating for just a few minutes, but here's
something that has the potential to be massively confusing for
beginners.

  starting with core-image.bbclass, this is just a coding philosophy
but i'm not crazy about this:

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '
CORE_IMAGE_EXTRA_INSTALL ?= ""
IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

  at a glance, it looks weird that IMAGE_INSTALL is simply assigned
the value of CORE_IMAGE_BASE_INSTALL, and it's only when you look up
that you notice there's a CORE_IMAGE_EXTRA_INSTALL that you can use
which is buried inside the assignment to CORE_IMAGE_BASE_INSTALL.
doing it that way forces a reader to follow the chain of assignments
to see what's happening.

  it would be much clearer to write (if it's equivalent):

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended \
    '
CORE_IMAGE_EXTRA_INSTALL ?= ""
IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"

  there.  now in the space of that single line, i can see that the
*final* value for IMAGE_INSTALL comes from two other values.  and i
can even see which one appears to be the one *i* should mess with --
the one containing "EXTRA".  that construct is almost self-explanatory
and, for me, much clearer than the first one.  but wait, there's more.

  in the current *released* reference manual, there is a suggestion
for how to create custom images:

"For example, if a developer wants to add strace into the
core-image-sato image, they can use the following recipe:

     require core-image-sato.bb

     IMAGE_INSTALL += "strace"

  ok, but what's the point of having CORE_IMAGE_EXTRA_INSTALL if you
don't tell people to use it?

     require core-image-sato.bb

     CORE_IMAGE_EXTRA_INSTALL = "strace"

  are those two definitions equivalent?  is there any advantage to one
over the other?

  and finally, in the *development* version of the reference manual,
you find the new content:

file:///home/rpjday/yocto/yocto-docs/documentation/poky-ref-manual/poky-ref-manual.html#var-IMAGE_INSTALL

"When you use this variable, it is best to use it as follows:

     IMAGE_INSTALL_append = " package-name"

argh.  so what's wrong with using CORE_IMAGE_EXTRA_INSTALL?  numerous
oe-core .bb files don't take that advice -- see
core-image-minimal-mtdutils.bb:

require core-image-minimal.bb
... snip ...
IMAGE_INSTALL += "mtd-utils"

  so what is best practise here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


