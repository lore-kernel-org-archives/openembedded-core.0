Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sh1SS-00044A-GS
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:39:12 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:37970 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sh1I3-0006SL-9m for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 12:28:27 -0400
Date: Tue, 19 Jun 2012 12:28:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206191218210.929@oneiric>
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
Subject: some simple questions about assignment and appending
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
X-List-Received-Date: Tue, 19 Jun 2012 16:39:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i want to make absolutely sure i understand the mechanics of the
different types of assignment so i'm looking at this snippet from
core-image.bbclass:

... snip ...

PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

CORE_IMAGE_EXTRA_INSTALL ?= ""

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

... snip ...

  first, if you're assigning a fixed string (as in the first line
shown in the snippet above), i assume there is no functional
difference in using "=" versus ":=", correct?

  next, is there any value in that null line in the assignment to
CORE_IMAGE_BASE_INSTALL?

  next, is it technically necessary to conditionally do this?

CORE_IMAGE_EXTRA_INSTALL ?= ""

if that variable wasn't set, does it really need to be set to the
empty string?

  finally, what are the evaluation mechanics of the "?=" operator?  in
this line,

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

is the right-hand side evaluated first?  i ask since i find the
snippet above a bit confusing in that you need to follow backwards to
deduce what IMAGE_INSTALL is eventually set to.  i would think this
would be easier to read:

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended

IMAGE_INSTALL = "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"

  in this rewriting, i can *immediately* see what values are used to
construct IMAGE_INSTALL.  in the current code, it's nowhere near as
clear, and you have to backtrack to see how CORE_IMAGE_BASE_INSTALL is
assigned.  or would that not be equivalent based on a misunderstanding
of how assignment works?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


