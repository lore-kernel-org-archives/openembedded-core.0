Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAmuw-0006QP-4G
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 19:39:22 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAmmK-0007vZ-Ac for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 14:30:28 -0400
Date: Thu, 22 Mar 2012 14:30:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203221420250.16901@oneiric>
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
Subject: proper use of IMAGE_INSTALL, and confusion over assignment precedence
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
X-List-Received-Date: Thu, 22 Mar 2012 18:39:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm still a wee bit (ok, maybe a lot) confused over the various
assignment and append and prepend operators and if there's a good
discussion of it somewhere, that would be just ducky, because without
a *solid* understanding of that, anyone is going to get confused.

  as an example, i'm reading the poky ref manual about IMAGE_INSTALL:

file:///home/rpjday/yocto/yocto-docs/documentation/poky-ref-manual/poky-ref-manual.html#var-IMAGE_INSTALL

which explains (in part):

=== start

"Using IMAGE_INSTALL with the += operator from the /conf/local.conf
file or from within an image recipe is not recommended as it can cause
ordering issues. Since core-image.bbclass sets IMAGE_INSTALL to a
default value using the ?= operator, using a += operation against
IMAGE_INSTALL will result in unexpected behavior when used in
/conf/local.conf. Furthermore, the same operation from with an image
recipe may or may not succeed depending on the specific situation. In
both these cases, the behavior is contrary to how most users expect
the += operator to work.

When you use this variable, it is best to use it as follows:

     IMAGE_INSTALL_append = " package-name"

=== end

  so ... my first simple question is, what is the recommended way to
add a single package to a build through my local.conf file?

  and second, the examples i see in oe-core currently certainly don't
follow the guidance given in the ref manual.  behold:

$ grep -rw IMAGE_INSTALL *
... snip ...
meta/recipes-core/images/core-image-minimal-mtdutils.bb:IMAGE_INSTALL += "mtd-utils"
meta/recipes-graphics/images/core-image-gtk-directfb.bb:IMAGE_INSTALL += "\
meta/recipes-graphics/images/core-image-clutter.bb:IMAGE_INSTALL = "\
meta/recipes-qt/images/qt4e-demo-image.bb:IMAGE_INSTALL += "\
meta/recipes-rt/images/core-image-rt.bb:IMAGE_INSTALL += "rt-tests"
meta/recipes-rt/images/core-image-rt-sdk.bb:IMAGE_INSTALL += "rt-tests"
... snip ...

  the reference manual specifically discourages the use of "+=" inside
image recipes, but as you can see, it's definitely being used there.

  part of the fundamental difficulty in getting a handle on the
intricacies of OE is that the source is inconsistent in its use of
operators, and just trying to "RTFS" simply isn't going to help much.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


