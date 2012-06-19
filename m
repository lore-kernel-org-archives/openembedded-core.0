Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sh2Sc-00057u-TU
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 19:43:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jun 2012 10:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158266642"
Received: from unknown (HELO helios.localnet) ([10.252.120.169])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2012 10:32:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 19 Jun 2012 18:32:40 +0100
Message-ID: <2651001.mzcHSCxQpi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1206191218210.929@oneiric>
References: <alpine.DEB.2.02.1206191218210.929@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: some simple questions about assignment and appending
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
X-List-Received-Date: Tue, 19 Jun 2012 17:43:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 June 2012 12:28:22 Robert P. J. Day wrote:
>   i want to make absolutely sure i understand the mechanics of the
> different types of assignment so i'm looking at this snippet from
> core-image.bbclass:
> 
> ... snip ...
> 
> PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
> 
> CORE_IMAGE_BASE_INSTALL = '\
>     task-core-boot \
>     task-base-extended \
>     \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     '
> 
> CORE_IMAGE_EXTRA_INSTALL ?= ""
> 
> IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> 
> ... snip ...
> 
>   first, if you're assigning a fixed string (as in the first line
> shown in the snippet above), i assume there is no functional
> difference in using "=" versus ":=", correct?

Correct. := means immediately expand all variable references and set the 
variable's value to the result; if there aren't any references the value is 
the same.

>   next, is there any value in that null line in the assignment to
> CORE_IMAGE_BASE_INSTALL?

There's no functional meaning at least, I assume it is there purely for 
formatting reasons.

>   next, is it technically necessary to conditionally do this?
> 
> CORE_IMAGE_EXTRA_INSTALL ?= ""
> 
> if that variable wasn't set, does it really need to be set to the
> empty string?

Yes - references to unset variables are left unexpanded so without that line 
if the variable was unset you would end up with a literal 
${CORE_IMAGE_EXTRA_INSTALL} within the expanded value of 
CORE_IMAGE_BASE_INSTALL, which would not be good.

>   finally, what are the evaluation mechanics of the "?=" operator?  

?= is the same as = except that it only sets the value if it is not already 
set at the time the line is parsed.

> in this line,
> 
> IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> 
> is the right-hand side evaluated first?  i ask since i find the
> snippet above a bit confusing in that you need to follow backwards to
> deduce what IMAGE_INSTALL is eventually set to.  i would think this
> would be easier to read:
> 
> CORE_IMAGE_BASE_INSTALL = '\
>     task-core-boot \
>     task-base-extended
> 
> IMAGE_INSTALL = "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"
> 
>   in this rewriting, i can *immediately* see what values are used to
> construct IMAGE_INSTALL.  in the current code, it's nowhere near as
> clear, and you have to backtrack to see how CORE_IMAGE_BASE_INSTALL is
> assigned.

So overall I agree this has unfortunately ended up being rather messy. To me, 
the above change should be OK at face value and would improve readability; 
however given that we potentially broke people's images/configuration not that 
long ago by changing from POKY_* to CORE_IMAGE_* I think we want to be careful 
about making significant changes to this again.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


