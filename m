Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGPS-0000fb-Gi
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:53:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2012 08:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227327004"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2012 08:40:58 -0700
Message-ID: <5064738A.2040604@linux.intel.com>
Date: Thu, 27 Sep 2012 08:40:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348578243.31293.72.camel@phil-desktop>
In-Reply-To: <1348578243.31293.72.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Don't package chkdupexe
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
X-List-Received-Date: Thu, 27 Sep 2012 15:53:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 06:04 AM, Phil Blundell wrote:
> The chkdupexe utility is fairly worthless and drags perl in as a build dependency
> of the whole util-linux recipe.  If anybody actually wants to use this script
> then we should package it separately, but for the time being let's just delete it.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-core/util-linux/util-linux.inc       |    6 +++---
>   meta/recipes-core/util-linux/util-linux_2.21.2.bb |    6 +-----
>   2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index b2a1552..d62d406 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -31,7 +31,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>                util-linux-mount util-linux-readprofile util-linux-libblkid \
>                util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
>                util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
> -             util-linux-chkdupexe util-linux-mkfs util-linux-mcookie"
> +             util-linux-mkfs util-linux-mcookie"
>
>   EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>                   --disable-makeinstall-chown --enable-elvtune --enable-init \
> @@ -63,7 +63,6 @@ FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid
>   FILES_util-linux-lscpu = "${bindir}/lscpu"
>
>   FILES_util-linux-fsck = "${base_sbindir}/fsck*"
> -FILES_util-linux-chkdupexe = "${bindir}/chkdupexe"
>   FILES_util-linux-mkfs = "${sbindir}/mkfs"
>
>   # Util-linux' blkid replaces the e2fsprogs one
> @@ -72,7 +71,6 @@ RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
>   RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
>
>   RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
> -RDEPENDS_${PN}-chkdupexe = "perl"
>   RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
>
>   RRECOMMENDS_${PN}_virtclass-native = ""
> @@ -125,6 +123,8 @@ do_install () {
>
>   	ln -sf swapon.${BPN}   ${D}${base_sbindir}/swapoff.${BPN}
>   	rm -f ${D}${sbindir}/swapoff
> +
> +	rm -f ${D}${bindir}/chkdupexe
>   }
>
>   inherit update-alternatives
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> index 792730c..39e3609 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.21"
> -PR = "r4"
> +PR = "r5"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
> @@ -40,7 +40,3 @@ addtask remove_lscpu before do_configure after do_patch
>
>   CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>   EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
> -
> -do_install_append () {
> -	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/chkdupexe
> -}
>

Merged into OE-Core

Thanks
	Sau!



