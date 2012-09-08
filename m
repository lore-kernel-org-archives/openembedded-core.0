Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TAS1Z-0007ei-SF
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 22:53:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Sep 2012 13:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,392,1344236400"; d="scan'208";a="219821857"
Received: from unknown (HELO helios.localnet) ([10.252.121.183])
	by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2012 13:40:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Sat, 08 Sep 2012 21:40:35 +0100
Message-ID: <1905623.pDvREZZpJY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347134935.4396.235.camel@x121e.pbcl.net>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<4a36b4005fc384ac817023873b2febc854c4415d.1346837268.git.liezhi.yang@windriver.com>
	<1347134935.4396.235.camel@x121e.pbcl.net>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/2] opkg svn: Add the --force-arch option
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
X-List-Received-Date: Sat, 08 Sep 2012 20:53:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 08 September 2012 21:08:55 Phil Blundell wrote:
> a) for people who are not using O_P_M, it's becoming apparent that the
> whole concept of using opkg (or rpm, or any other external package
> manager) for rootfs construction is more of a liability than an asset
> because bitbake has more knowledge about which particular binaries ought
> to be installed.  For those use-cases, it might be better to think in
> terms of abolishing opkg altogether which would solve this problem and a
> variety of others.

On the other hand, using the package manager for rootfs construction for those 
that *are* using online package management allows us to have at least some 
confidence that a rootfs produced directly from the metadata and one produced 
by on-system upgrades will be the same; you can also have package management 
on in one image and off in another (or change it on the fly) and expect to have 
the same contents, apart from the package manager being removed. The potential 
for subtle differences in behaviour is too great to go down the path of 
implementing it ourselves IMO, not to mention the extra code paths to 
maintain.

> b) for people who _are_ using O_P_M, specifying --force-arch during
> rootfs construction is all very well but they might still lose during a
> subsequent "opkg upgrade".  So for these use cases, it seems as though
> something a bit more sticky might be required.

In terms of a proper solution I agree with this - opkg needs to handle the 
package architecture configuration internally rather than us overriding it at 
rootfs construction time. If you're advocating spending effort implementing 
something I think that's where it should be spent.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


