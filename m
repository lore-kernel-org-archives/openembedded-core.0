Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1USXH2-00037E-3K
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 20:40:09 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:34063 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1USX05-0002Yj-7s for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 14:22:33 -0400
Date: Wed, 17 Apr 2013 14:22:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1304171413100.15926@oneiric>
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
Subject: why 'FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"' in u-boot.inc?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 18:40:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  a bit of an oddity as i'm playing with u-boot recipes in other
layers ... in a xilinx layer that sits above oe-core, i have the
u-boot recipe u-boot-zynq_git.bb (note, a full recipe, not a bbappend)
which opens with:

require recipes-bsp/u-boot/u-boot.inc

simplifying things, i removed the current FILESEXTRAPATHS_prepend from
that file (it has no effect on this question), then used bitbake-env
to see the final path for the "u-boot-zynq" recipe:

$ bitbake-env -r u-boot-zynq FILESPATH | tr ":" '\n'
# FILESPATH="${FILE_DIRNAME}/u-boot-git/${MACHINE}
${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
"${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
FILESPATH="/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-git/zedboard
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq-xilinx-zynq/arm
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq-xilinx-zynq/armv7a
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq-xilinx-zynq/zedboard
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq-xilinx-zynq/
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq-xilinx-zynq/
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq/arm
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq/armv7a
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq/zedboard
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq/
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-zynq/
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/files/arm
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/files/armv7a
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/files/zedboard
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/files/
/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/files/"
$

  it's that first entry that's confusing to me:

FILESPATH="/home/rpjday/oe/dist/layers/xilinx/milo-zynq/recipes-bsp/u-boot/u-boot-git/zedboard

there is no such directory "u-boot-git" under that layer, but that
entry is clearly(?) being prepended by the processing of this line
from oe-core's u-boot.inc file:

FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"

  but what is the point of that line in the oe-core layer? is that not
assuming that every conceivable u-boot recipe in every layer will
probably have that subdirectory? it seems kind of backwards for any
recipe or include file in oe-core to make any assumptions about the
structure of recipes or file subdirectories in "higher" layers. in
fact, i don't see a single "u-boot-git" recipe subdirectory anywhere
in any of the layers i have checked out.

  so what is that line doing? am i just confused? i'm aware it doesn't
do any damage, but it still looks weird.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


