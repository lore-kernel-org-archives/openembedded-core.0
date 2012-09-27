Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGax-0001hk-Fr
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:05:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2012 08:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227331975"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2012 08:52:33 -0700
Message-ID: <50647641.7010309@linux.intel.com>
Date: Thu, 27 Sep 2012 08:52:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: b19537@freescale.com
References: <1348643917-26301-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1348643917-26301-1-git-send-email-b19537@freescale.com>
Cc: msm@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: ysvinit-inittab: fix hang issue of series consoles check
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
X-List-Received-Date: Thu, 27 Sep 2012 16:05:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 12:18 AM, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
>
>      the kernel boot process hangs when /proc/consoles doesn't exists, check
>      the existence of /proc/consoles before executing pkg_postinst script.
>
>      Following is the log when /proc/consoles doesn't exist:
>          Running postinst /etc/rpm-postinsts/102...
>          cat: /proc/consoles: No such file or directory
>          cat: /proc/consoles: No such file or directory
>          cat: /proc/consoles: No such file or directory
>          INIT: Entering runlevel: 5
>          Starting OpenBSD Secure Shell server: sshd
>            generating ssh RSA key...
>            generating ssh ECDSA key...
>            generating ssh DSA key...
>          done.
>          Starting network benchmark server: netserver.
>          Starting system log daemon...0
>          Starting kernel log daemon...0
>          Stopping Bootlog daemon: bootlogd.
>          INIT: no more processes left in this runlevel
>
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 5b79caf..b289853 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>
> -PR = "r8"
> +PR = "r9"
>
>   SRC_URI = "file://inittab"
>
> @@ -54,7 +54,7 @@ EOF
>
>   pkg_postinst_${PN} () {
>   # run this on the target
> -if [ "x$D" = "x" ]; then
> +if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
>   	tmp="${SERIAL_CONSOLES_CHECK}"
>   	for i in $tmp
>   	do
>

Merged into OE-Core

Thanks
	Sau!



