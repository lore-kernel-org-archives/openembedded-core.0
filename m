Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SFpGS-0006fr-UK
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:10:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2012 09:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138084324"
Received: from unknown (HELO envy.home) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2012 09:01:11 -0700
Message-ID: <4F7DC1A0.9040607@linux.intel.com>
Date: Thu, 05 Apr 2012 09:00:32 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4
Cc: tocallaghan@meyn.net
Subject: Building core-image-rt - how to specify the rt kernel
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
X-List-Received-Date: Thu, 05 Apr 2012 16:10:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

When building core-image-rt from the oe-core recipes-rt section, T
OCallaghan noticed he wasn't getting the linux-yocto-rt kernel. The
problem was that he was not setting the
PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt.

When I prepared the recipes-rt section, I wanted to be able to
automatically select the linux-yocto-rt kernel when building the
core-image-rt image. Unfortunately, the image recipe cannot set this
value as I understand it due to parse ordering and some fundamental
concepts about how the system works.

I documented the requirement to explicitly set this in the
recipes-rt/README, but that may not be an obvious place to look.

We have a couple of options here. We can try to improve the error
messages which are verbose and don't provide much direction for someone
new to the process:

ERROR: Multiple .bb files are due to be built which each provide
virtual/kernel
(/test_yocto/poky/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
/test_yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb).
 This usually means one provides something the other doesn't and should.

We could document rt explicitly in the developer guide, although thus
far we haven't done much with these sorts of focused tactical issues in
the docs (I don't think). This also doesn't scale particularly well.

Finally, I could rip recipes-rt out of oe-core and maintain it in a
meta-rt layer whose layer.conf sets:

PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto-rt"

I'd appreciate thoughts on why one approach would be more appropriate
than another.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


