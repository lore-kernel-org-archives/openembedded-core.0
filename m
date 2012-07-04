Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SmRRe-0006WN-F8
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 17:24:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2012 08:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173382202"
Received: from unknown (HELO helios.localnet) ([10.252.120.228])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2012 08:13:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Wed, 04 Jul 2012 16:13:37 +0100
Message-ID: <2712492.S71dH6BlmC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-26-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <4FF44A09.6040603@opendreambox.org>
References: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
	<1772332.Hc46G99qAB@helios> <4FF44A09.6040603@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-collateral: import fixes from OE-Classic
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
X-List-Received-Date: Wed, 04 Jul 2012 15:24:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 July 2012 15:50:01 Andreas Oberritter wrote:
> On 03.07.2012 22:14, Paul Eggleton wrote:
> > Unfortunately, it seems this change has caused bug 2595 - moving the
> > config file to /etc/opkg means that it is always read regardless of
> > whether -f is specified or not (as it is during do_rootfs in order to
> > specify our own generated config file), and this means that after
> > opkg-collateral is installed into the rootfs, this version of the config
> > is used, resulting in opkg ignoring the lists it has already downloaded
> > (since it now sees list_dir as var/lib/opkg instead of
> > var/lib/opkg/lists) and thus it fails to install any of the "attemptonly"
> > packages (including *-dev, *-dbg, etc.).
> 
> Would it be possible to download the lists to var/lib/opkg instead, if
> that's the only difference?

Possible yes, but this has exposed some behaviour that means any distro-
specific settings that get put into files in that directory can break the rootfs 
construction, which is not ideal. I'm also wondering if having the lists their 
own directory might be a good thing anyway (I wonder for example what happens 
if you have a feed called "status"), but that's a separate issue.

> I'm not familiar with the use of opkg-collateral during the creation of the
> rootfs.

opkg-collateral isn't really "used" in creation of the rootfs, but it always 
gets installed as a package along with all other packages (since it is in 
ROOTFS_PKGMANAGE for the ipk backend) in the first stage of package 
installation, and once it is installed, the problem occurs.
 
> > The question is, should opkg be fixed to not load anything from etc/opkg/
> > when -f is specified?
> 
> I think this would work only if other files than opkg.conf in etc/opkg/
> aren't needed, which I guess is not the case.

It is the case for rootfs construction, because then opkg has to be able to 
operate initially with etc/opkg being empty (or nonexistent) before any 
packages have been installed. The only other file that gets installed into that 
directory by default is arch.conf, and the values in that are already provided 
in our generated configuration we specify with -f.

Clearly we can work around this by just moving etc/opkg out of the way 
temporarily, and that might be what I end up doing to fix this for the moment; 
however it does seem to me that the behaviour of -f is wrong, unless -f is 
intended to be able to be used in a different manner than we are using it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


