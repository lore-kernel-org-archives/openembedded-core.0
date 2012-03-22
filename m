Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAlUi-0004Rd-4A
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:08:12 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAlM6-0002gH-Bs for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:59:18 -0400
Date: Thu, 22 Mar 2012 12:59:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1srqhR_ETsSGoF4Z9_TQcad5Eb8_dke5RdJxyKoV_dwHMg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1203221252020.12443@oneiric>
References: <CALbNGRSm2KV_RsV+rR4hFNcEg7Oi5Z57N1nGXS73Z17G6gqS1g@mail.gmail.com>
	<CAMKF1srqhR_ETsSGoF4Z9_TQcad5Eb8_dke5RdJxyKoV_dwHMg@mail.gmail.com>
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
Subject: Re: Debugging with gdb
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
X-List-Received-Date: Thu, 22 Mar 2012 17:08:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 22 Mar 2012, Khem Raj wrote:

> in OE-Core world you can add following to local.conf and then you
> can debug it on target.
>
> EXTRA_IMAGE_FEATURES += "dbg-pkgs tools-sdk"
>
> and that should have pretty much what you want. You dont have to
> lower the optlevel since that might let the crash go away. Try to
> debug the same code thats failing.

  heh ... good timing as i was just about to go all pedantic over
this.  the current docs are confusing regarding how a user is supposed
to use that very variable.

  in meta/conf/local/conf.sample, you read:

... snip ...
EXTRA_IMAGE_FEATURES = "debug-tweaks"
... snip ...

so a user would be inspired to do this:

EXTRA_IMAGE_FEATURES = "dbg-pkgs tools-sdk"   (note "=", not "+=")

which might not make any difference except that some image recipes
specifically *already* assign values to that variable (and not even
consistently):

meta/recipes-sato/images/core-image-sato-sdk.bb:EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
meta/recipes-rt/images/core-image-rt-sdk.bb:EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
meta/recipes-extended/images/core-image-lsb-sdk.bb:EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"

  so what happens if you choose to build one of these images and
assign directly to EXTRA_IMAGE_FEATURES in your local.conf?  (i'm
still grappling with the precedence and ordering of assignment so i'm
not sure, but it certainly looks this has the potential to surprise
the user.)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



