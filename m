Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TqjCX-0004jG-CA
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 12:43:13 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:47456 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tqixy-0006nl-Eg; Thu, 03 Jan 2013 06:28:06 -0500
Date: Thu, 3 Jan 2013 06:27:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <50E4829C.9040908@linux.intel.com>
Message-ID: <alpine.DEB.2.02.1301030605190.8567@oneiric>
References: <alpine.DEB.2.02.1301021151240.6551@oneiric>
	<50E4829C.9040908@linux.intel.com>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: value of "PACKAGE_BEFORE_PN" versus "PACKAGES =+"?
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
X-List-Received-Date: Thu, 03 Jan 2013 11:43:13 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 2 Jan 2013, Saul Wold wrote:

> On 01/02/2013 09:04 AM, Robert P. J. Day wrote:
> >
> >    just now noticed the variable PACKAGE_BEFORE_PN, whose entire
> > usage in poky (other than documentation) is:
> >
> > meta/conf/bitbake.conf:PACKAGE_BEFORE_PN ?= ""
> > meta/conf/bitbake.conf:PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev
> > ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> > meta/classes/lib_package.bbclass:PACKAGE_BEFORE_PN = "${PN}-bin"
> >
> >    is there an actual need for that variable that places the new
> > package names *precisely* in that location in the PACKAGES list?
> > and given the specificity of the initial PN-related packages:
> >
> Yes, the need in the case of lib_package it to ensure that the
> ${PN}-bin (bindir and sbindir) files get packages separately from
> the ${PN} files, which are typically the libraries in the case of
> recipes that deliver libraries and binaries.

  predictably, a few minutes after i posted, i realized what was going
on.  i was a bit confused since the variable name, PACKAGE_BEFORE_PN,
was so terrifically generic when its purpose is clearly to deal with
library packages for which (as you say) you'd like to break out the
generated binary artifacts under /usr/bin and /usr/sbin as a separate
output package, which makes sense.

> >    "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale"
> >
> > is there any reason more recipes couldn't use PACKAGE_BEFORE_PN
> > instead of "PACKAGES =+" when defining new packages?  i *realize*
> > those two things don't represent the same thing but, in many cases,
> > would the end result be the same?
> >
> >    is there any reason more code doesn't use "PACKAGE_BEFORE_PN"?
> >
> The =+ prepends it to the list and therefore is correctly greedy for
> the items they are trying to package. Since the PACKAGE_BEFORE_PN
> specifically inserts it, so for the most part there is no real need
> to use the P_B_P variable, and =+ is more consistent.

  the point i was trying to make above (probably badly) was that it
seemed unlikely there was much (effective) difference between, as you
point out, usage of P_B_P and using =+:

PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"

unless those earlier packages in the above would greedily suck up any
of /usr/bin or /usr/sbin.

  so, to recap (to make sure i can explain it properly), OE's
bitbake.conf already defines this:

PACKAGE_BEFORE_PN ?= ""
PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
... snip ...
FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"

which will have no effect unless, in your recipe, you inherit
lib_package, which pulls in:

PACKAGE_BEFORE_PN = "${PN}-bin"

  at which point, you can either accept the default definition of
FILES_${PN}-bin as sucking up *everything* left under /usr/bin and
/usr/sbin or you can set it explicitly to some other value, which
brings me to two final questions.

  is there any value in setting FILES_${PN}-bin without inheriting
lib_package?  see oe-core/meta/recipes-multimedia/pulseaudio, where
pulseaudio.inc contains the line:

FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"

but there is no reference to lib_package anywhere in that recipe
directory.  so what's the point of that line above?

  on the other hand, you can always just set PACKAGE_BEFORE_PN
explicitly and skip all of lib_package.bbclass, like this in
meta-openembedded/meta-networking/recipes-protocols/quagga/quagga.inc:

# Split into a main package and separate per-protocol packages
PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-babeld ${PN}-bgpd
\
                     ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
                     ${PN}-ospfclient ${PN}-watchquagga"

FILES_${PN}-ospfd       = "${sbindir}/ospfd ${libdir}/libospf.so.*"
FILES_${PN}-ospf6d      = "${sbindir}/ospf6d"
FILES_${PN}-babeld      = "${sbindir}/babeld"
FILES_${PN}-bgpd        = "${sbindir}/bgpd"
FILES_${PN}-ripd        = "${sbindir}/ripd"
FILES_${PN}-ripngd      = "${sbindir}/ripngd"
FILES_${PN}-isisd       = "${sbindir}/isisd"
FILES_${PN}-ospfclient  = "${sbindir}/ospfclient
${libdir}/libospfapiclient.so.*"
FILES_${PN}-watchquagga = "${sbindir}/watchquagga ${sysconfdir}/default/watchquagga \
                           ${sysconfdir}/init.d/watchquagga"


  is all of that about right?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


