Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1ShLen-0007o8-Os
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 16:13:18 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:39925 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1ShLUP-0002LY-TN for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 10:02:33 -0400
Date: Wed, 20 Jun 2012 10:02:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206200936030.6042@oneiric>
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
Subject: clarifying types of append/prepend, conditional and otherwise
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
X-List-Received-Date: Wed, 20 Jun 2012 14:13:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  first clarification: in order to fight with the docs on oe-core
metadata, i'm using the bitbake manual that's bundled with the yocto
source repository.  is that the proper documentation to be working
against?  i'm assuming there's no more canonical form of the doc than
that, yes?  (i am also assuming that the bitbake user manual is where
one would go to understand the structure of the oe-core metadata.  if
that's not true, that needs to be clarified.  movin' on ...)

  in the bitbake manual (henceforth, BBM), chapter 2 on metadata
covers the variations of assignment, append and prepend: =, :=, ?=,
??=, +=, =+, .=, and =.  do all of these operators have the semantics
of "delayed" evaluation of "="?  that's not made clear, and it doesn't
seem like it's implied.

  immediately after that, the chapter jumps into OVERRIDES and
conditional appending, without ever discussing the basic "_append" and
"_prepend" operators.  that seems like a bit of an oversight.  at that
point, the BBM should cover those operators whose purpose, AIUI, is to
append or prepend at the very end of the "finalization"(?) phase.  is
that the right phrase to use?

  it's pretty clear that those operators (in their basic form) need to
be explained, but best practices should be mentioned as well -- the
regular append/prepend operators should be used unless there's a
compelling reason to use "_append" or "_prepend".  using that
philosophy, if a reader is perusing the code and runs across either
"_append" or "_prepend", that would be a sign that there's a definite
reason why it's being done that way.

  jumping to the next (HTML) page on "Override and append ordering",
this section i think needs help.  consider this snippet:

OVERRIDES = "foo"
A = "X"
A_append_foo = "Y"

  the use of "foo" is simply confusing; the reader will probably be
wondering, "what the heck is 'foo'?  am i supposed to know?  did we
cover 'foo' earlier?"  instead, as much as possible, use *real*
excerpts from the source.

  first, refer to possible OVERRIDES in bitbake.conf to set the stage:

OVERRIDES =
"${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:
${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"

so readers can appreciate the basis for an override.  *then* the
conditional appending will make sense once the reader is shown
examples like this:

$ grep -r "_append_" *
... snip ...
meta/recipes-kernel/sysprof/sysprof_git.bb:SRC_URI_append_arm  = " file://rmb-arm.patch"
meta/recipes-kernel/sysprof/sysprof_git.bb:SRC_URI_append_mips = " file://rmb-mips.patch"
meta/recipes-kernel/linux/linux-yocto_3.2.bb:KERNEL_FEATURES_append_qemux86=" cfg/sound"
meta/recipes-kernel/linux/linux-yocto_3.2.bb:KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb:KERNEL_FEATURES_append_qemux86 = " cfg/sound"
meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb:KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
.. snip ...

  that makes it spectacularly obvious what this feature is all about
-- no reference to some vague "foo" thingy.  but wait, we're not done.

  on that same page in the BBM, just above that *common* example,
there's this alternative:

OVERRIDES = "foo"
A_foo_append = "X"

  is there a single example of that anywhere in oe-core?  i don't
immediately see one, but perhaps i'm not looking the right way.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================





