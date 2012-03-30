Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDhvm-0003Z2-4n
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 21:56:18 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDhn0-0000xE-OP for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 15:47:14 -0400
Date: Fri, 30 Mar 2012 15:47:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203301541110.1720@oneiric>
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
Subject: wanting to clarify bitbake parsing of all .conf files
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
X-List-Received-Date: Fri, 30 Mar 2012 19:56:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm reading this out of the current bitbake manual and it *seems*
pretty straightforward but i'm always paranoid.  here's the passage:

"BitBake will first search the current working directory for an
optional "conf/bblayers.conf" configuration file. This file is
expected to contain a BBLAYERS variable which is a space delimited
list of 'layer' directories. For each directory in this list, a
"conf/layer.conf" file will be searched for and parsed with the
LAYERDIR variable being set to the directory where the layer was
found. The idea is these files will setup BBPATH and other variables
correctly for a given build directory automatically for the user.

"BitBake will then expect to find 'conf/bitbake.conf' somewhere in the
user specified BBPATH. That configuration file generally has include
directives to pull in any other metadata (generally files specific to
architecture, machine, local and so on)."

  fair enough.  so if i'm using only oe-core, then i can use

  $ bitbake-layers show-layers

to see that i'm using just that one layer:

  meta                  /home/rpjday/oe/oe-core/meta              5

which means that i will parse the file meta/conf/bitbake.conf, which
eventually parses all of this:

include conf/site.conf
include conf/auto.conf
include conf/local.conf
include conf/build/${BUILD_SYS}.conf
include conf/target/${TARGET_SYS}.conf
include conf/machine/${MACHINE}.conf
include conf/machine-sdk/${SDKMACHINE}.conf
include conf/distro/${DISTRO}.conf
include conf/distro/defaultsetup.conf
include conf/documentation.conf
require conf/sanity.conf
require conf/abi_version.conf

so here's the question(s).

  first, i'm assuming those conf files are processed in exactly that
order, right?  and second, all of that parsing and including is done
and completed before reading the first line of the task or recipe file
that's the bitbake target, right?

  as i said, i'm pretty sure that's correct but i want to make
absolutely sure before i ask followup questions.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


