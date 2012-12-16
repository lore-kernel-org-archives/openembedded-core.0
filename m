Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TkCU4-00076j-Bl
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Dec 2012 12:34:38 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:38541 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TkCFv-0001Pj-0Y for openembedded-core@lists.openembedded.org;
	Sun, 16 Dec 2012 06:19:39 -0500
Date: Sun, 16 Dec 2012 06:19:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212160612510.17842@oneiric>
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
Subject: why does "bitbake adt-installer" build an entire toolchain?
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
X-List-Received-Date: Sun, 16 Dec 2012 11:34:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  possibly (well, ok, almost certainly) a silly question, but why does
running a simple:

  $ bitbake adt-installer

feel the need to create an entire cross-compile toolchain for me?

  the adt-installer recipe seems really pretty simple, as most of the
work is done in do_populate_adt() which involves only a lot of cd and
mkdir and cp and sed and so on, no obvious need for a development
environment.  and right below that, a whole bunch of regular steps are
clearly "noexec"ed away:

do_populate_adt[nostamp] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"
do_package[noexec] = "1"
do_package_write[noexec] = "1"
do_package_write_ipk[noexec] = "1"
do_package_write_rpm[noexec] = "1"
do_package_write_deb[noexec] = "1"
do_poplulate_sysroot[noexec] = "1"

  the only thing i noticed is that the opkg content is pulled down via
subversion, so perhaps the toolchain is needed to create
subversion-native.  but if that's the case, would adding

ASSUME_PROVIDED += "subversion-native"

avoid all that toolchain creation?  it just seems that building the
adt-installer (not running it, just building it) is (or should be) a
fairly simple process.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


