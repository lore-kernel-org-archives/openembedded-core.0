Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SBMZg-0007jO-Ab
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 09:43:48 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SBMR2-0007Xi-2Z for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 04:34:52 -0400
Date: Sat, 24 Mar 2012 04:34:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203240420500.19324@oneiric>
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
Subject: confusion between += and =+ and _append and _prepend ...
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
X-List-Received-Date: Sat, 24 Mar 2012 08:43:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  when perusing the source for oe-core, it's going to be easy for a
beginner to get confused about the right time(s) to use += versus =+
versus _append versus _prepend because the source simply bounces
around between them all arbitrarily.

  here's a single example.  the file bitbake.conf defines the default
for PACKAGES:

PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"

now it would seem that, if a recipe wanted to extend that list (as
many do), the obvious approach is to augment the list with more
entries.  and in the occasional situation where that default needs to
be overridden, then a straight assignment can be used.

  but searching the source shows every possible combination of adding
to the PACKAGES variable:

...
meta/recipes-devtools/perl/perl_5.14.2.bb:PACKAGES_append = " perl-modules "
meta/recipes-qt/qt4/qt-4.8.0.inc:PACKAGES_append = " ${QT_BASE_NAME}-tests-dbg ${QT_BASE_NAME}-tests"
...
meta/recipes-connectivity/bind/bind_9.8.1.bb:PACKAGES_prepend = "${PN}-utils "
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc:PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
meta/recipes-extended/newt/libnewt_0.52.14.bb:PACKAGES_prepend = "whiptail "
...

  and there are, of course, many, many uses of "PACKAGES +=" and
"PACKAGES =+".  and, sure, they'll all work but the variety is
definitely going to confuse someone trying to figure out best
practices.

  and occasionally, there is a direct assignment when a simple
appending would work fine, like with rpm:

meta/recipes-devtools/rpm/rpm_5.4.0.bb:PACKAGES = "${PN}-dbg ${PN}
${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common
${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm
perl-module-rpm perl-module-rpm-dev ${PN}-locale"

  i realize this is all annoyingly picky pedantry but there should be
some sort of standard for things like this, just for consistency.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


