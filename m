Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUhJi-0000dV-0B
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 19:47:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2013 10:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,536,1363158000"; d="scan'208";a="299832372"
Received: from unknown (HELO helios.localnet) ([10.255.14.13])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2013 10:30:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 23 Apr 2013 18:30:02 +0100
Message-ID: <14093735.aCcmgz3EQM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <FE75BA17-4A83-48A8-A237-54422228FCD7@dominion.thruhere.net>
References: <FE75BA17-4A83-48A8-A237-54422228FCD7@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: DISTRO_FEATURES_BACKFILL_CONSIDERED_append usage
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
X-List-Received-Date: Tue, 23 Apr 2013 17:47:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 23 April 2013 10:07:35 Koen Kooi wrote:
> I've had the following in my DISTRO.conf for a while now:
> 
> 	DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
> 
> And that seems to do the right thing:
> 
> 	[koen@rrMBP v2013.06]$ MACHINE=minnow bitbake systemd -e | grep
> DISTRO_FEATURES | grep BACK # $DISTRO_FEATURES_BACKFILL
> 	DISTRO_FEATURES_BACKFILL="pulseaudio sysvinit"
> 	# $DISTRO_FEATURES_BACKFILL_CONSIDERED [2 operations]
> 	DISTRO_FEATURES_BACKFILL_CONSIDERED="sysvinit"
> 
> Except that it doesn't:
> 
> [koen@rrMBP v2013.06]$ MACHINE=minnow bitbake systemd -e | grep
> DISTRO_FEATURES | grep sysvinit #   "alsa argp bluetooth ext2 ipv4 ipv6
> irda largefile nfs pam pci pcmcia ppp smbfs systemd usbgadget usbhost vfat
> wifi xattr zeroconf tk x11 wayland 3g 	pulseaudio ${DISTRO_GLFEATURES}
> ${DISTRO_FEATURES_LIBC} ${LDISGOLD} sysvinit" DISTRO_FEATURES="alsa argp
> bluetooth ext2 ipv4 ipv6 irda largefile nfs pam pci pcmcia ppp smbfs
> systemd usbgadget usbhost vfat wifi xattr zeroconf tk x11 wayland 3g
> pulseaudio opengl ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd
> libc-cxx-tests libc-catgets libc-charsets libc-crypt                       
>                  libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt
> libc-fmtmsg libc-fstab libc-ftraverse                                      
>  libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big libc-locales
> libc-locale-code                                    libc-memusage libc-nis
> libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc
>                                   libc-utmp libc-utmpx libc-wordexp
> libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc           
>                            libc-posix-wchar-io  sysvinit"
> 
> Remembering the IMAGE_FSTYPES_append vs. += discussion, I tried:
> 
> 	DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> 
> The result:
> 
> 	[koen@rrMBP v2013.06]$ MACHINE=minnow bitbake systemd -e | grep
> DISTRO_FEATURES | grep sysvinit ERROR: Please ensure that your setting of
> VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in
> DISTRO_FEATURES
> 
> Hmmm, let's set VIRTUAL-RUNTIME_init_manager and retry:
> 
> 	[koen@rrMBP v2013.06]$ MACHINE=minnow bitbake systemd -e | grep
> DISTRO_FEATURES | grep sysvinit DISTRO_FEATURES_BACKFILL="pulseaudio
> sysvinit"
> 	DISTRO_FEATURES_BACKFILL_CONSIDERED="sysvinit"
> 
> \o/
> 
> So, is this a bug or intended behaviour for
> DISTRO_FEATURES_BACKFILL_CONSIDERED_append?

The trouble is there has to be some order in processing these variables, and 
the backfilling has to happen early or you can't base later processing on the 
value of DISTRO_FEATURES and have it work properly. (FYI, the backfilling was 
moved slightly earlier in 22429cdf79ed952072707a929643c7386fa7e056, i.e. 
fairly recently.) The _append operation by its nature happens late, which is 
probably why you see the effect above.

You should just be setting DISTRO_FEATURES_BACKFILL_CONSIDERED with = rather 
than appending. This variable is intended since its introduction to be set by 
the distro config and shouldn't really be set elsewhere. If you must compose 
values across multiple configuration files, use += for this variable.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


