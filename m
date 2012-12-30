Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TpP8u-0003Iu-1B
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Dec 2012 21:05:56 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:51360 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TpOuQ-00034r-Av for openembedded-core@lists.openembedded.org;
	Sun, 30 Dec 2012 14:50:58 -0500
Date: Sun, 30 Dec 2012 14:50:49 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212301446300.16626@oneiric>
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
Subject: some inconsistencies with valgrind support in recipe vs packagegroup-core-tools-profile.bb
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
X-List-Received-Date: Sun, 30 Dec 2012 20:05:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  from poking around in packagegroup files, the following observation.
first, there's the valgrind recipe itself, which suggests at least
armv7a support:

COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
COMPATIBLE_HOST_armv7a = 'arm.*-linux'

inherit autotools

EXTRA_OECONF = "--enable-tls"
EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi"
EXTRA_OEMAKE = "-w"
PARALLEL_MAKE = ""

  this appears to disagree with what one reads in
packagegroup-core-tools-profile.bb, which suggests no arm support
whatsoever(?):

# valgrind does not work on mips

VALGRIND = "valgrind"
VALGRIND_libc-uclibc = ""
VALGRIND_mips = ""
VALGRIND_arm = ""   <-- ???
VALGRIND_aarch64 = ""

note also that the comment doesn't even match what follows, which is
quite common in that very file, as in:

# lttng-tools, lttng-modules and babeltrace all depend on liburcu
# which currentl doesn't build on mips

LTTNGTOOLS = "lttng-tools"
LTTNGTOOLS_mips = ""
LTTNGTOOLS_aarch64 = ""

  and, finally, there's valgrind 3.8.0, which now apparently has mips
support:

http://valgrind.org/info/platforms.html

so just some contradictory info scattered around.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


