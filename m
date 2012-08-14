Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1ERZ-0006eo-5f
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 12:33:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Aug 2012 03:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,765,1336374000"; d="scan'208";a="208082693"
Received: from unknown (HELO helios.localnet) ([10.252.121.91])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 03:21:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 14 Aug 2012 11:21:51 +0100
Message-ID: <20076596.V7nLmKGeGJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1208110826510.17432@oneiric>
References: <alpine.DEB.2.02.1208110826510.17432@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wanting to clarify ASSUME_PROVIDED and SANITY_REQUIRED_UTILITIES
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
X-List-Received-Date: Tue, 14 Aug 2012 10:33:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 11 August 2012 08:38:58 Robert P. J. Day wrote:
>   recently, i know that the entry "git-native" was added to the
> entries in ASSUME_PROVIDED in bitbake.conf:
> 
> ASSUME_PROVIDED = "\
>     bzip2-native \
>     git-native \
>     grep-native \
>     diffstat-native \
>     patch-native \
>     perl-native-runtime \
>     python-native-runtime \
>     tar-native \
>     virtual/libintl-native \
>     "
> 
> ostensibly because it's now reasonable to assume that any sane distro
> should be able to provide an oe-compatible version of git.  so far, so
> good.  but there's this in sanity.bbclass:
> 
> SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo git
> bzip2 tar gzip gawk chrpath wget cpio"
> 
> how do those two relate to one another?

They don't directly. ASSUME_PROVIDED is just a way of satisfying build-time 
dependencies of native recipes when we know they will always be installed on 
the host; for most of these this is backed up by a check to see if they are 
actually installed using SANITY_REQUIRED_UTILITIES.
 
>   sanity.bbclass appears to list the native tools that *must* exist on
> the dev host, but what if one doesn't?  is it then downloaded and
> built unless it's in "ASSUME_PROVIDED"?

No. If you look at the code in sanity.bbclass you'll see if something in 
SANITY_REQUIRED_UTILITIES is missing you'll get an immediate fatal error.

>   also, is there any convenient way to examine my current dev host to
> see what native utilities are candidates for adding to my local
> ASSUME_PROVIDED?

I think you're on your own there - we recommend you leave ASSUME_PROVIDED as-
is.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


