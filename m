Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCcBb-0006jW-74
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 21:36:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2012 12:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146443155"
Received: from unknown (HELO helios.localnet) ([10.252.123.228])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2012 12:27:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 27 Mar 2012 20:27:02 +0100
Message-ID: <1704770.YM0OKmOcSp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203270815010.3125@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Tue, 27 Mar 2012 19:36:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 March 2012 08:20:11 Robert P. J. Day wrote:
>   i'm currently poring over the OE docs (including the ones at the
> yocto site), and i'm trying to figure out how to simply add a package
> to an image through one's local.conf file.
> 
>   the current yocto ref manual has an entire section about customizing
> images:
> 
> http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.htm
> l#usingpoky-extend-customimage
> 
> but it discusses creating custom recipe files and custom tasks, and
> using IMAGE_INSTALL and IMAGE_FEATURES and EXTRA_IMAGE_FEATURES, and
> finally gets into using local.conf, suggesting:
> 
>   DISTRO_EXTRA_RDEPENDS += "strace"
> 
> is that, in fact, the accepted way if one simply wants to add a
> package to an existing image build?  because as soon as the manual
> mentions it, in the very next paragraph, it discourages its use.

Well, this clearly does not make sense if that's the way it is presented. 

The real answer to this question is it depends on why you're adding the 
package.

1) If you just want to add a single package temporarily for testing, use 
CORE_IMAGE_EXTRA_INSTALL += in local.conf (although I really wish we could 
make this mechanism more generic so that it applies to any image, not just the 
ones in OE-Core).

2) If you want to add something permanently for every (non-minimal) image 
produced using your DISTRO, set DISTRO_EXTRA_RDEPENDS in your distro 
configuration. This will come into your image via task-distro-base which is 
pulled in by task-base. I don't think we should be advocating doing anything 
with DISTRO_EXTRA_RDEPENDS via local.conf.

3) If you're adding it permanently for a single image, consider whether adding 
your own custom image recipe would be more appropriate. FWIW, I don't think 
bbappends for recipes are a good idea.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


