Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tqss3-00065l-Cr
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 23:02:47 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2013 13:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,405,1355126400"; d="scan'208";a="187493327"
Received: from unknown (HELO helios.localnet) ([10.252.123.66])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jan 2013 13:47:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 03 Jan 2013 21:47:28 +0000
Message-ID: <1471125.fLHJiJURJn@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1301030605190.8567@oneiric>
References: <alpine.DEB.2.02.1301021151240.6551@oneiric>
	<50E4829C.9040908@linux.intel.com>
	<alpine.DEB.2.02.1301030605190.8567@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: value of "PACKAGE_BEFORE_PN" versus "PACKAGES =+"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2013 22:02:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 03 January 2013 06:27:57 Robert P. J. Day wrote:
>   predictably, a few minutes after i posted, i realized what was going
> on.  i was a bit confused since the variable name, PACKAGE_BEFORE_PN,
> was so terrifically generic when its purpose is clearly to deal with
> library packages for which (as you say) you'd like to break out the
> generated binary artifacts under /usr/bin and /usr/sbin as a separate
> output package, which makes sense.

It does exactly what it says - puts package(s) before PN.

>   the point i was trying to make above (probably badly) was that it
> seemed unlikely there was much (effective) difference between, as you
> point out, usage of P_B_P and using =+:
> 
> PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
> ${PACKAGE_BEFORE_PN} ${PN}"
> 
> unless those earlier packages in the above would greedily suck up any
> of /usr/bin or /usr/sbin.

That's correct. PACKAGE_BEFORE_PN just makes things a little easier.

>   is there any value in setting FILES_${PN}-bin without inheriting
> lib_package?

If ${PN}-bin has otherwise been added to PACKAGES, sure.

> see oe-core/meta/recipes-multimedia/pulseaudio, where
> pulseaudio.inc contains the line:
> 
> FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
> 
> but there is no reference to lib_package anywhere in that recipe
> directory.  so what's the point of that line above?

Looks like this is a mistake (or something left over from an earlier revision 
of the recipe) since ${PN}-bin isn't in PACKAGES for pulseaudio.

Cheers,
Paul
-- 

Paul Eggleton
Intel Open Source Technology Centre


