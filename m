Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SlnHD-0003wQ-Ei
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:31:19 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:55605 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sln6W-0004H4-TR for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 16:20:16 -0400
Date: Mon, 2 Jul 2012 16:20:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207021613350.27360@oneiric>
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
Subject: is there a standard for inheriting from core-image?
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
X-List-Received-Date: Mon, 02 Jul 2012 20:31:19 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  followup of a post from a while back, here's a snippet from
core-image.bbclass:

===

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

CORE_IMAGE_EXTRA_INSTALL ?= ""

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

===

  then there's this from core-image-gtk-directfb.bb:

===

inherit core-image

IMAGE_INSTALL += "\
        ${CORE_IMAGE_BASE_INSTALL} \
        task-core-basic \
        task-core-gtk-directfb-base \
"

===

  argh.  as i read it (and i don't trust myself to read any of this
properly anymore), appending ${CORE_IMAGE_BASE_INSTALL} is superfluous
since it's already there from core-image.bbclass.

  and, again, what's best practice for appending to IMAGE_INSTALL?
+=?  _append?  just trying to mentally enforce some order on all of
this.

rday

p.s.  and as i muttered about before, this sort of thing from
core-image-clutter.bb:

===

IMAGE_INSTALL = "\
    ${CORE_IMAGE_BASE_INSTALL} \
    task-core-clutter-core \
    task-core-clutter-tests \
    task-core-clutter-apps"

inherit core-image

===

really just introduces unnecessary confusion, as
CORE_IMAGE_EXTRA_INSTALL would have been the obvious thing to use
here, no?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


