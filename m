Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SE3mj-00036C-FR
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 21:16:25 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SE3dw-0004im-6B for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 15:07:20 -0400
Date: Sat, 31 Mar 2012 15:07:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203311426460.31735@oneiric>
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
Subject: delayed assignment and "+=" and IMAGE_FEATURES
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
X-List-Received-Date: Sat, 31 Mar 2012 19:16:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  another sort of "best practices" question while trying to dispel
some confusion.  in bitbake.conf, we have:

IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"

fair enough, but since this is in bitbake.conf, it clearly(?)
represents delayed processing since this is being defined before the
target task or recipe has even started being parsed.  so how is that
explained such that users can understand what they're allowed to do
with those two variables in subsequent task or recipe files?

  but wait ... there's more.

the default local.conf immediately extends this with:

EXTRA_IMAGE_FEATURES = "debug-tweaks"

so at this point, before parsing the recipe or task file, the user
really should understand that they can do a number of things:

* append to IMAGE_FEATURES if they want more features
* append to EXTRA_IMAGE_FEATURES if they want more features
* assign to EXTRA_IMAGE_FEATURES if they want to override that
  setting from local.conf (silly since they might as well just
  change local.conf)
* assign to IMAGE_FEATURES if they want to totally override the
  recipe they're about to inherit (kinda weird)

  core-image.bbclass then defines:

X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games apps-x11-pimlico package-management"
SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ssh-server-dropbear"

so if we're going to inherit from core-image, we have all of this
available, so let's see some examples (just the relevant lines):

  here's core-image-base.bb:

IMAGE_FEATURES += "apps-console-core"
inherit core-image

ok, so we're adding that package group to our image.  is there any
difference if we had done done this instead?

EXTRA_IMAGE_FEATURES += "apps-console-core"
inherit core-image

it would seem that the end result for *this* class would be exactly
the same.  but it *might* make a difference if someone defined a new
recipe that included core-image-base.bb based on what happened in that
new recipe, yes?

  here's core-image-core.bb:

IMAGE_FEATURES += "apps-console-core ${X11_IMAGE_FEATURES}"
inherit core-image

same observation here, of course, unless there's something i'm
missing.

  finally, there's recipes-rt/images/core-image-rt-sdk.bb:

require recipes-core/images/core-image-minimal.bb

IMAGE_FEATURES += "dev-pkgs tools-sdk"
EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"

what's the value in breaking those features over the two variables
that are simply combined at the end?

  anyway, just looking for best practices given that some of the
recipe files are a bit confusing.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


