Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDm9c-0003yd-JE
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 02:26:52 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDm0q-0005in-PD for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 20:17:48 -0400
Date: Fri, 30 Mar 2012 20:17:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203302010020.17135@oneiric>
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
Subject: why does "bitbake -e" check the license of a *non*-included recipe file?
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
X-List-Received-Date: Sat, 31 Mar 2012 00:26:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  goofing around with "bitbake -e" and, with a clean oe-core checkout,
both of the following work:

$ bitbake -e
$ bitbake -e core-image-core

  now, just for fun, i added a trivial recipe file to that images/
directory to see what kind of error message i would get if i neglected
to include a license, so i added the rday.bb recipe file (one of the
files i was using to test assignment):

RDAY ??= "rday1"
RDAY ??= "rday2"
RDAY ?= "rday3"

then tested:

$ bitbake -e rday
Loading cache: 100% |######################################################################| ETA:  00:00:00
Loaded 1106 entries from dependency cache.
ERROR: This recipe does not have the LICENSE field set (rday)                              | ETA:  --:--:--
ERROR: Unable to parse /home/rpjday/oe/oe-core/meta/recipes-core/images/rday.bb: Exited with "1"
ERROR: Command execution failed: Exited with 1

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
$

so that's pretty much what i expected.  what i *didn't* expect was
that this would still work:

$ bitbake -e

while this would now fail:

$ bitbake -e core-image-core
Loading cache: 100% |######################################################################| ETA:  00:00:00
Loaded 1106 entries from dependency cache.
ERROR: This recipe does not have the LICENSE field set (rday)                              | ETA:  --:--:--
ERROR: Unable to parse /home/rpjday/oe/oe-core/meta/recipes-core/images/rday.bb: Exited with "1"
ERROR: Command execution failed: Exited with 1

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
$

  the recipe file "rday.bb" is not being included in any of the other
images, so why should its lack of a license file cause that kind of
problem?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


