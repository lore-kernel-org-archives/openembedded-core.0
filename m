Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Skeqa-0005qC-0p
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 19:19:08 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:56641 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Skeg1-0000GJ-1n for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 13:08:13 -0400
Date: Fri, 29 Jun 2012 13:08:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206291259270.4694@oneiric>
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
Subject: any subtle reason for using "BPN" with ALLOW_EMPTY instead of just "PN"?
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
X-List-Received-Date: Fri, 29 Jun 2012 17:19:08 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  in current poky ref manual, the explanation of ALLOW_EMPTY talks
about using it with a package name, as in:

  ALLOW_EMPTY_${PN} = "1"

which makes perfect sense, except that there is the occasional example
where something other than "PN" is used, sometimes for good reason,
sometimes not clear.

  for instance, there's this:

meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${PN} = "1"
meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"

which makes sense (i guess) since, in this case, PN=qt4-x11-free,
while QT_BASE_NAME=qt4.  so there are obviously going to be special
cases like that.

  but here are a few that seem to use BPN unnecessarily:

meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-binaries = "1"
meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-charmaps = "1"
meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-gconvs = "1"
meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-localedatas = "1"
meta/recipes-graphics/pango/pango.inc:ALLOW_EMPTY_${BPN}-modules = "1"

it seems that, with the above packages, PN = BPN so, yes, either one
would have worked, but is there a best practice?  i would think that
using anything other than PN should be reserved for when it's
necessary, so that it's more aesthetically obvious that something
different is happening.

  thoughts?  yes, i know it makes no functional difference.  again,
i'm just trying to codify best practices.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


