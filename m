Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UW0rY-0007d9-IP
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 10:52:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2013 01:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,562,1363158000"; d="scan'208";a="233469397"
Received: from unknown (HELO helios.localnet) ([10.255.12.79])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2013 01:34:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Sat, 27 Apr 2013 09:34:19 +0100
Message-ID: <6907890.oTRpLvAECS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1366975838.14512.99.camel@phil-desktop.brightsign>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Sat, 27 Apr 2013 08:52:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 April 2013 12:30:38 Phil Blundell wrote:
> There doesn't appear to be any compelling reason for these tasks to be
> nostamp and having them re-run on every build can be irritating (for
> example, when the image is an initramfs which your kernel image depends
> on).
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/image.bbclass |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ffb372a..667d03d 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -168,11 +168,9 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s:
> "locale-base-%s" % s, d.getVar('IM
> 
>  PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
> 
> -do_rootfs[nostamp] = "1"
>  do_rootfs[dirs] = "${TOPDIR} ${WORKDIR}/intercept_scripts"
>  do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
>  do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
> -do_build[nostamp] = "1"
> 
>  # Must call real_do_rootfs() from inside here, rather than as a separate
>  # task, so that we have a single fakeroot context for the whole process.

I have to say I'm not in favour of this. AFAIK these tasks have always been 
nostamp, and I'm not sure making do_build is going to help for the case you 
cite because the dependency on INITRD_IMAGE is on do_rootfs.

If you're concerned about your initramfs image rebuilding when building the 
main image, what happens if you specify do_rootfs[nostamp] = "0" ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


