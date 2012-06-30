Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sl0ob-0008JX-4O
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 18:46:33 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:37157 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sl0e1-0003eg-7C for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 12:35:37 -0400
Date: Sat, 30 Jun 2012 12:35:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206301223060.12575@oneiric>
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
Subject: a few more questions (and apparent doc fixes) for INITSCRIPT_* variables
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
X-List-Received-Date: Sat, 30 Jun 2012 16:46:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just to finish off where i was going with all this INITSCRIPT_*
stuff, it seems like there are a couple inaccuracies in the poky ref
manual regarding those variables as listed in the glossary.

  regarding INITSCRIPT_PACKAGES, yes, it's true that that variable
defaults to the value of ${PN}, but this part of the explanation
appears to be incorrect:

"If multiple packages are specified, you need to append the package
name to the other INITSCRIPT_* as an override."

  as i read it, it's not only if multiple packages are specified, it's
also if a single package that isn't ${PN} is specified as well,
correct?  as in the case of
meta/recipes-connectivity/openssh/openssh_6.0p1.bb:

INITSCRIPT_PACKAGES = "${PN}-sshd"
INITSCRIPT_NAME_${PN}-sshd = "sshd"
INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"

  there's only one package being identified, but the fact that it
isn't ${PN} requires the explicit setting of INITSCRIPT_PACKAGES, does
it not?

  the explanation of INITSCRIPT_NAME appears to be correct -- it's
a required value for each named package, so that's fine.

  there is an apparent error in the explanation for INITSCRIPT_PARAMS,
however:

"The variable is mandatory and is used in recipes when using
update-rc.d.bbclass."

  well, it's mandatory, yes, but it's also set by default in
update-rc.d.bbclass thusly:

  INITSCRIPT_PARAMS ?= "defaults"

so there's no need for the developer to set it if that value is fine,
despite what the glossary explanation suggests, correct?

  finally, given that default, there appear to be some superfluous
lines in a few recipes, but they're not doing anyone any harm:

$ grep -r "^INITSCRIPT_PARAMS = \"defaults\"" *
meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb:INITSCRIPT_PARAMS = "defaults"
meta/recipes-connectivity/bind/bind_9.8.1.bb:INITSCRIPT_PARAMS = "defaults"
meta/recipes-bsp/apmd/apmd_3.2.2-14.bb:INITSCRIPT_PARAMS = "defaults"
meta/recipes-bsp/acpid/acpid.inc:INITSCRIPT_PARAMS = "defaults"
meta/recipes-extended/xinetd/xinetd_2.3.15.bb:INITSCRIPT_PARAMS = "defaults"
$

  does all of that make sense?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================




