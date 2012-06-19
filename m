Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sh22V-0004oK-6K
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 19:16:27 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:38308 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sh1s8-0008L9-Ad for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 13:05:44 -0400
Date: Tue, 19 Jun 2012 13:05:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206191257390.1069@oneiric>
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
Subject: proper use of CORE_IMAGE_EXTRA_INSTALL?
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
X-List-Received-Date: Tue, 19 Jun 2012 17:16:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  followup to earlier post, it's easy enough to see the point of this
code from core-image.bbclass:

... snip ...

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

CORE_IMAGE_EXTRA_INSTALL ?= ""

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

... snip ...

  but i can see this snippet from
meta/recipes-graphics/images/core-image-gtk-directfb.bb:

... snip ...

inherit core-image

IMAGE_INSTALL += "\
        ${CORE_IMAGE_BASE_INSTALL} \
        task-core-basic \
        task-core-gtk-directfb-base \
"

... snip ...

  now this would seem to be exactly what the variable
CORE_IMAGE_EXTRA_INSTALL was invented for, no?  certainly the above
will work but then what's the point of having
CORE_IMAGE_EXTRA_INSTALL?

  however, if one used that, it's obvious that one would leave the
line "inherit core-image" to near the bottom of the .bb file, but
returning to my earlier question, what is the proper ordering of
setting CORE_IMAGE_EXTRA_INSTALL and inheriting core-image.  it's
clear "inherit core-image" would always work *after*, but what about
before?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


