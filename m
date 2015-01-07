Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id A971B728C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 12:52:47 +0000 (UTC)
Received: from [70.30.87.145] (port=48340 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y8q6O-00064V-CF for openembedded-core@lists.openembedded.org;
	Wed, 07 Jan 2015 07:52:44 -0500
Date: Wed, 7 Jan 2015 07:52:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501070638580.7524@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: how to create new core image recipes [pt 2]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jan 2015 12:52:55 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  again for purposes of tutorial, to clarify the second way to create
new core image recipes, rather than "require"ing an existing recipe
file (as before), inherit the fundamental class file with:

  inherit core-image

and here's the first question. here's the fundamental definition of
the image contents from core-image.bbclass:

  CORE_IMAGE_BASE_INSTALL = '\
    packagegroup-core-boot \
    packagegroup-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

  CORE_IMAGE_EXTRA_INSTALL ?= ""

  IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

  inherit image

i've whined about this before ... can the above not be written more
clearly as:

  CORE_IMAGE_EXTRA_INSTALL ?= ""         [is this even necessary?]

  IMAGE_INSTALL ?= '\
    packagegroup-core-boot \
    packagegroup-base-extended \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

  inherit image

the current code is confusing since you have to read it twice to see
what's going on ... is the second snippet not equivalent? and if not,
what subtlety is going on there? but wait ... there's more.

  if this can be simplified as i've written, that drops any need for
CORE_IMAGE_BASE_INSTALL, which doesn't look necessary in the first
place. consider some examples of OE's use of this. here's
core-image-minimal.bb, whose definition i have always hated since it
inherits core-image, only to just stomp on IMAGE_INSTALL:

  IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}
  ${CORE_IMAGE_EXTRA_INSTALL}"

  IMAGE_LINGUAS = " "

  LICENSE = "MIT"

  inherit core-image

i've learned to live with that, but let's continue. here's
core-image-sato.bb:

  IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbear hwcodecs"

  LICENSE = "MIT"

  inherit core-image

  IMAGE_INSTALL += "packagegroup-core-x11-sato-games"

while the above is certainly technically correct, would it not make
more sense to have written that last line as:

  CORE_IMAGE_EXTRA_INSTALL = "packagegroup-core-x11-sato-games"

i mean, isn't that the whole point of the variable
CORE_IMAGE_EXTRA_INSTALL ... to give recipe writers a simple and
*clear* way of adding extra content to the core-image class?

now look at core-image-weston.bb, which reads (in part):

  IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"

  inherit core-image ...

  CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"

at this point, how many different way are there to add content to a
core-image that all seem to work? and here's core-image-directfb:

  IMAGE_INSTALL += "\
        ${CORE_IMAGE_BASE_INSTALL} \
        packagegroup-core-full-cmdline \
        packagegroup-core-directfb \
  "

and here's core-image-clutter:

  IMAGE_INSTALL = "\
    ${CORE_IMAGE_BASE_INSTALL} \
    packagegroup-core-clutter-core \
    "

everyone seems to have their own idea for how to extend core-image ...
can this not be standardized so it's easier for people to RTFS? is
there no preferred way to do the above for the sake of visual
consistency?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


