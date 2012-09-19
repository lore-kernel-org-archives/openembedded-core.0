Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEONy-00038h-Au
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:48:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 10:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,450,1344236400"; d="scan'208";a="194943661"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 10:35:47 -0700
Message-ID: <505A0273.3050705@linux.intel.com>
Date: Wed, 19 Sep 2012 10:35:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <1347878998-19019-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1347878998-19019-1-git-send-email-andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Fix bloken swapoff symlink
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
X-List-Received-Date: Wed, 19 Sep 2012 17:48:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2012 03:49 AM, Andrei Gherzan wrote:
> There were 2 issues with this symlink.
> 1. Is was installed in base_bindidir but packaged in bindir. Fixed to
> be packaged in base_bindir
> 2. The symlink swapoff was created to point to swapon. The problem is
> that swapoff is an alternative so it would end up pointing to
> swapoff.util-linux which was an inexistent file. The fix is to create
> a symlink swapoff.util-linux to swapon.util-linux.
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>   meta/recipes-core/util-linux/util-linux.inc       |    4 ++--
>   meta/recipes-core/util-linux/util-linux_2.21.2.bb |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 00e5d7c..79e0608 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -46,7 +46,7 @@ FILES_util-linux-agetty = "${base_sbindir}/agetty"
>   FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
>   FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
>   FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
> -FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${sbindir}/swapoff.${BPN}"
> +FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${base_sbindir}/swapoff.${BPN}"
>   FILES_util-linux-losetup = "${base_sbindir}/losetup.${BPN}"
>   FILES_util-linux-mount = "${base_bindir}/mount.${BPN}"
>   FILES_util-linux-mcookie = "${bindir}/mcookie"
> @@ -121,7 +121,7 @@ do_install () {
>   	install -d ${D}${sysconfdir}/default/
>   	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
>
> -	ln -sf swapon   ${D}${base_sbindir}/swapoff
> +	ln -sf swapon.${BPN}   ${D}${base_sbindir}/swapoff.${BPN}
>   	rm -f ${D}${sbindir}/swapoff
>   }
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> index 0f5fdc6..6ef3163 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.21"
> -PR = "r1"
> +PR = "r2"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
>
Merged into OE-Core

Thanks	
	Sau!



