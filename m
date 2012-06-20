Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1ShPoO-0004tZ-AJ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 20:39:28 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:44137 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1ShPdz-0007WB-KH for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:28:43 -0400
Date: Wed, 20 Jun 2012 14:28:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206201416170.821@oneiric>
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
Subject: CORE_IMAGE_EXTRA_INSTALL has potential to be misleading?
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
X-List-Received-Date: Wed, 20 Jun 2012 18:39:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  was reminded of this as i was perusing some old OE core notes.
remember this from core-image.bbclass?

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

CORE_IMAGE_EXTRA_INSTALL ?= ""

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

  except there are some core image variation recipes
(core-image-minimal-dev.bb, among others) that do things like this:

IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE}"

IMAGE_FEATURES += "dev-pkgs"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

  note how the explicit assignment to IMAGE_INSTALL in that second
example will copletely override the "IMAGE_INSTALL ?=" in the bbclass
file, at which point ${CORE_IMAGE_EXTRA_INSTALL} will obviously never
be evaluated and included.

  i'm guessing that's exactly what the developer had in mind, but it
seems that has the potential to be really misleading, since a newcomer
might want to create an image based on, say,
core-image-minimal-dev.bb, and *think* that, since it's a variation of
a core image recipe, he can use CORE_IMAGE_EXTRA_INSTALL to add extra
packages to the image.  which clearly won't work.

  i'm sure numerous people will point out that the above works
perfectly well as long as you understand what's going on.  i'm just
suggesting that, sooner or later, someone is going to waste a
considerable amount of time trying to figure out why nothing they
specify with CORE_IMAGE_EXTRA_INSTALL is being added to their image.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================




