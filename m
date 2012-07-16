Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SqjRg-00021O-3C
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 13:26:32 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:54892 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SqjGl-00028k-6W for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 07:15:15 -0400
Date: Mon, 16 Jul 2012 07:15:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207160700490.1036@oneiric>
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
Subject: why are native kern tools both generated and on the meta branch?
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
X-List-Received-Date: Mon, 16 Jul 2012 11:26:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  side note: for the next little while, for pedagogical reasons, i'm
stepping through each phase of the OE kernel build process and
documenting what happens and what gets generated at each step, as in:

  $ bitbake -c fetch linux-yocto
  $ bitbake -c unpack linux-yocto
  $ bitbake -c kernel_checkout linux-yocto
  $ bitbake -c validate_branches linux-yocto
  $ bitbake -c patch linux-yocto
  ... etc etc ...

so, yes, upcoming questions will almost certainly be as pedantic as
ever.  you've been warned. :-P

  at this point, i've done the validate_branches step and am about to
do the patch, and i notice from linux-yocto.inc:

  do_patch[depends] = "kern-tools-native:do_populate_sysroot"

ok, i can accept that, and performing the patch should first build
and install the native kern-tools in my x86_64 sysroots directory ,
which i'm pretty sure is on my PATH so the new utilities like
createme, updateme, configme and so on will be available for the
subsequent do_patch() step.  so far, so good.

  but in the do_patch() routine itself, we have:

=====

do_patch() {
        cd ${S}

        # if kernel tools are available in-tree, they are preferred
        # and are placed on the path before any external tools. Unless
        # the external tools flag is set, in that case we do nothing.
        if [ -f "${S}/scripts/util/configme" ]; then
                if [ -z "${EXTERNAL_KERNEL_TOOLS}" ]; then
                        PATH=${S}/scripts/util:${PATH}
                fi
        fi

        kbranch=${KBRANCH}

        # if we have a defined/set meta branch we should not be generating
        # any meta data. The passed branch has what we need.
        if [ -n "${KMETA}" ]; then
                createme_flags="--disable-meta-gen"
        fi
        createme ${createme_flags} ${ARCH} ${kbranch}
	... snip ...

=====

in my case, i have a meta branch which just happens to include a
scripts/ directory containing what appears to be all of those
kern-tools.

  is there a reason for that duplication?  as i read it (and i could
be confused), the do_patch() generates and installs the necessary
native kern-tools, even as my meta branch (which is not checked out
yet) already contains all of those tools.  should i care?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


