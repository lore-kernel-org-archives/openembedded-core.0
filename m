Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8D4y-000758-Lb
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:59:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 08:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117988267"
Received: from unknown (HELO helios.localnet) ([10.252.123.170])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 08:49:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 15 Mar 2012 15:49:06 +0000
Message-ID: <1563461.vmjMO1vnYW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203090830180.22520@oneiric>
References: <alpine.DEB.2.02.1203090830180.22520@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: IMAGE_FEATURES vs EXTRA_IMAGE_FEATURES?
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
X-List-Received-Date: Thu, 15 Mar 2012 15:59:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 March 2012 08:38:25 Robert P. J. Day wrote:
>   again, reading the poky ref manual over at yocto, and here's the
> explanation of EXTRA_IMAGE_FEATURES:
> 
>   "Allows extra packages to be added to the generated images. You set
> this variable in the local.conf configuration file. Note that some
> image features are also added using the IMAGE_FEATURES variable
> generally configured in image recipes. You can use this variable to
> add more features in addition to those."
> 
>   now that *sounds* like you would just *assign* that in your
> local.conf file to add some features, as in:
> 
> EXTRA_IMAGE_FEATURES = "fubar snafu"
> 
> or something similar.
> 
>   but first, how is that different from:
> 
> IMAGE_FEATURES += "fubar snafu"
> 
> after all, bitbake.conf contains:
> 
> IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"

If the image recipe itself sets IMAGE_FEATURES with = instead of += then this 
will not work; but neither will setting EXTRA_IMAGE_FEATURES unless the recipe 
adds that as well. FWIW all of the recipes in OE-Core that set IMAGE_FEATURES 
add to it with +=.

I suspect it was just seen as a bit safer to have EXTRA_IMAGE_FEATURES as the 
variable you can do whatever you want with in local.conf.

>   also, i notice this in core-image-rt-sdk.bb:
> 
> IMAGE_FEATURES += "dev-pkgs tools-sdk"
> EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps
> debug-tweaks"
> 
> what is the point of those features being broken over those two
> variables?

Yes, that looks silly to me too. We should probably correct it. (Feel free to 
file a bug or submit a patch ;)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


