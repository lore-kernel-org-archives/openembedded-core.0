Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDZ8W-0001Du-Sc
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 12:32:53 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDYzl-0007iH-Mk; Fri, 30 Mar 2012 06:23:49 -0400
Date: Fri, 30 Mar 2012 06:23:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <4067879.36leZStCMh@helios>
Message-ID: <alpine.DEB.2.02.1203300617321.30730@oneiric>
References: <alpine.DEB.2.02.1203291505580.4586@oneiric>
	<20120329212924.5d01d792@eb-e6520>
	<alpine.DEB.2.02.1203291533390.5968@oneiric>
	<4067879.36leZStCMh@helios>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: argh ... "_append" versus "+=" and IMAGE_INSTALL confusion
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
X-List-Received-Date: Fri, 30 Mar 2012 10:32:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 29 Mar 2012, Paul Eggleton wrote:

> I think what the manual is attempting to mitigate is a situation
> where you do the following in your image recipe:
>
> -------- snip -------
> IMAGE_INSTALL += "somepackage1 somepackage2"
>
> inherit core-image
> -------- snip -------
>
> In this instance, because IMAGE_INSTALL is set via ?= within core-
> image.bbclass, IMAGE_INSTALL will only be set to "somepackage1
> somepackage2" since the value is already set by the time it gets to
> the ?=. This is clearly not what you would want by using +=.
>
> Doing the following in an image recipe will work properly however:
>
> -------- snip -------
> inherit core-image
>
> IMAGE_INSTALL += "somepackage1 somepackage2"
> -------- snip -------
>
> Personally I think the text you quoted from the manual should be
> adjusted; there's nothing wrong with IMAGE_INSTALL += _in an image
> recipe_ provided that you do it _after_ the inherit of core-image.

  that makes sense, but it seems that a lot of potential confusion
could be avoided if this construct was avoided entirely and replaced
by the appropriate use of CORE_IMAGE_EXTRA_INSTALL, no?

  from my position of naivete, i can see that messing with
IMAGE_INSTALL is dangerous if you don't truly know how it's being
manipulated in the underlyling class files.

  but the solution is right there in core-image.bbclass:

CORE_IMAGE_BASE_INSTALL = '\
    task-core-boot \
    task-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

CORE_IMAGE_EXTRA_INSTALL ?= ""

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

  that is, stop messing with IMAGE_INSTALL and do your customization
with CORE_IMAGE_EXTRA_INSTALL.  isn't that what it was expressly
designed for?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


