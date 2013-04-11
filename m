Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UQDzg-0007kc-7D
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 11:40:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2013 02:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,454,1363158000"; d="scan'208";a="316488260"
Received: from unknown (HELO helios.localnet) ([10.255.13.202])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2013 02:23:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 11 Apr 2013 10:23:10 +0100
Message-ID: <4933851.zWqthAfPy0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <13df7c921cb.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
	<23e03f4a9118bbae6033f9d88925d6f8b542ee5d.1365608262.git.paul.eggleton@linux.intel.com>
	<13df7c921cb.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] initscripts: fix read-only-rootfs-hook.sh to start earlier
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
X-List-Received-Date: Thu, 11 Apr 2013 09:40:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 April 2013 08:29:49 Bernhard Reutner-Fischer wrote:
> On 10 April 2013 17:42:28 Paul Eggleton <paul.eggleton@linux.intel.com> 
wrote:
> > Mount /var/volatile ourselves so that we can set up the writable area
> > first. This fixes the urandom service not starting properly when
> > read-only-rootfs is enabled.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh             |   
> >  1 + meta/recipes-core/initscripts/initscripts_1.0.bb                    
> >  |    2 +- 2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> > b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> > index 4f3e0d9..9cf0921 100644
> > ---
> > a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> > +++
> > b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> > @@ -5,6 +5,7 @@
> > 
> >  [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
> >  
> >  if [ "$1" = "start" ] ; then
> > 
> > +	grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
> 
> Or just use mountpoint(1)?

That would have been a better choice if I had known about it, yes. I'll send a 
patch to change it.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


