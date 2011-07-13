Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgxYU-0002uw-OC for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:24:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBKf0X028663
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:20:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28111-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:20:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBKYda028657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:20:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310497097.git.nitin.a.kamble@intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
Date: Wed, 13 Jul 2011 12:20:33 +0100
Message-ID: <1310556033.20015.1104.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] commits for yocto.git tree for x32 work
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
X-List-Received-Date: Wed, 13 Jul 2011 11:24:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 12:02 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> These are commits for yocto tree. I came up with as part of the x32 work. 
> I think these commits does not belong in the x32 layer and should go
> in the yocto/oecore tree.
> 
> The siteinfo.bbclass commit is a hacky way to get the the right siteinfo for 
> x32 now. In the future a better solution will be implemented for that purpose.
> 
> The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
> 
>   insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/x32
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32
> 
> Nitin A Kamble (5):
>   siteinfo.bbclass: hack for x32
>   udev-172: add a newer version for newer kernel
>   runqemu: support qemux32 machine

These first three need a little more thought. They're fine to as proof
of concept work but we need to find better ways to integrate them.

Specifically:

The siteinfo change is a hack and can't be merged as is. We need to find
a way to change the target_arch or target_os in such a way we can signal
to siteinfo to do something different. I also wonder if using i686-linux
is actually correct for x32 in all cases since x32 does support 64 bit
data types.

The udev update needs various other work as people have commented. We
need to resolve the udev differences between meta-oe and oe-core.

runqemu looks like it can be simplified as it looks like just the kernel
name is different? Is x32 using a different machine config at present?
Can we use the qemux86-64 machine directly and just add some tweaks to
it? That would avoid the need to change the qemu scripting?

Cheers,

Richard






